Received: by 10.25.227.6 with SMTP id a6csp473208lfh;
        Sat, 1 Jul 2017 18:04:25 -0700 (PDT)
X-Received: by 10.55.79.198 with SMTP id d189mr31971348qkb.37.1498957464898;
        Sat, 01 Jul 2017 18:04:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498957464; cv=none;
        d=google.com; s=arc-20160816;
        b=qfw6citAwK0b5qrWBzpSs2KGJSIWS9WveB3VxI4UYPJdHegvqRQJGzzwEfb6d3casR
         mE1TNYl/sDjv90f6Fdf/Fh5J8lYaUc8LkMwLhTO3inJMaC8mShvT6tlWIusiAo+bkbDA
         NEaKtI5Jdl1nJpa+X3oHsDMTfRkxr3RIhrlqazfjZqdC9/E00mLn+0bGrGLq9I/4omk2
         T7hosIZU9/671whC5VDGk4Z4eAKPZyuwRFVL74w6D9UrmZ2elLhLPO7QGQRQTostckzC
         IQgv75Hv0z/CmIJduHRD9d1AY9EheU82pmIx+WNs3T7Ee1B7W45cS5DmF+dgwlaYbgAI
         Hp3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=iytVpDtYZS74D3rsoSp0oMWvRN5snIgYFEoXWyc7XK0=;
        b=CKPJYHOwnHfEmWgklk9X2XxroQxYXfLYrN0Q5dSq1cBskNNZzmrhM3b4jFHbPXF2eZ
         /YSNd2DZbR4gTmRpq9jzXpnTVDt5mPb4k3TLg6Sqgc28lV9zkPoy+hsQePID35U5G5+P
         /GWG9lmbQU0SGCbbhE2mn98pVqN1zzuj1FqhHU/Dpay+f2SGeoNQDIPxO51BNiGGP6bV
         CZCVImEwKkYhrm9pUblOt25qZFsgBuQd+eYiVwuWRyRSzWJx9QNZDZXbghBKrtGbmFZG
         NUb1abB9MonIeLanpid0lxkJGa1dxIi13r371y+BsUil0a400H+gBD0MbtHLkimvG/0U
         /fvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=eN2gxZSM;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::241 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-qt0-x241.google.com (mail-qt0-x241.google.com. [2607:f8b0:400d:c0d::241])
        by mx.google.com with ESMTPS id f92si11428864qtd.228.2017.07.01.18.04.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 Jul 2017 18:04:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::241 as permitted sender) client-ip=2607:f8b0:400d:c0d::241;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=eN2gxZSM;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::241 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qt0-x241.google.com with SMTP id w12so19625016qta.2;
        Sat, 01 Jul 2017 18:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=iytVpDtYZS74D3rsoSp0oMWvRN5snIgYFEoXWyc7XK0=;
        b=eN2gxZSM/NPojwHMktJzXBSNj08+PuG1B/0o+ThuGVNh0Jj+s6Bbaa3lLmsZfVvt7r
         YdfUietQykWaoOH+UDFI+KGwtKFouaSobQIXiZtB7v+1bSSElDhvefD//Vu+chLfZm+J
         EVnwOfY+Vqgy0g+1zS3M8Tf8eOASG1D7qbYM2NzuyLt8ABg1+rHk90r06YTLEDrNy/b8
         6/yKo+XYXZ/ybs99+rlqqS/XuUu5VVD6aE3QNeJidb0/VrUlymycZRIaGBjNeilcER55
         KJTHKyrGd74PlAgvH0pixqRXvJ4/7UK+5OWmeWDcuRUwq+Ed2B+cVh9LyaahsmZ8Oimm
         UEng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iytVpDtYZS74D3rsoSp0oMWvRN5snIgYFEoXWyc7XK0=;
        b=lRIumqgY1yymn3rZIedzUmpJkVrFWHODVU5im1ceMAFVNdadcR6PyglVGM8XeJwMRi
         OFKjJ3DviRJxiBN75IrHDEfFS4ZSjfObSEn1b5cHm9lJ2GrlOTcwLpCz0WNAI8cFAH47
         3b86rTmzuhWMFdJGJpbbVcwOjQgU6Cch2No9oUEHnffMgOeWfeYnC8w8Am74FzWylTU2
         EAIfwaSNAQy5nNo+IUF72n/oUS0IK3e1eHqzvYkDe97jyBbjBLZ4gYoXSkP6+kbZKF/M
         YPyxcjHlTqRY0qB8Ek9YpxHTnSppaeJ3cUjSrArRDufQIJrZyFcMMqy+AKU+Tz32a+CB
         jsEw==
X-Gm-Message-State: AKS2vOxRup0DzMvoAX+ZFjlne3gYoZxBqtJCd/54gb8yjtg1tiim6Txl
	4sppjkylvkcRKdazXDc=
X-Received: by 10.200.0.213 with SMTP id d21mr34557652qtg.28.1498957464349;
        Sat, 01 Jul 2017 18:04:24 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (97-113-165-157.tukw.qwest.net. [97.113.165.157])
        by smtp.googlemail.com with ESMTPSA id l50sm10460828qtf.35.2017.07.01.18.04.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 Jul 2017 18:04:23 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [Qemu-devel] [PATCH v11 15/29] target/arm: [tcg] Port to
 init_disas_context
To: =?UTF-8?Q?Llu=c3=ads_Vilanova?= <vilanova@ac.upc.edu>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 "Emilio G. Cota" <cota@braap.org>, "open list:ARM" <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
 <149865583044.17063.6916936084139965036.stgit@frigg.lan>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <f12a2201-cc2b-1cd3-3bf9-94aea69a163a@twiddle.net>
Date: Sat, 1 Jul 2017 18:04:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <149865583044.17063.6916936084139965036.stgit@frigg.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: /m8/KMw9M6gQ

On 06/28/2017 06:17 AM, Lluís Vilanova wrote:
> Incrementally paves the way towards using the generic instruction translation
> loop.
> 
> Signed-off-by: Lluís Vilanova<vilanova@ac.upc.edu>
> ---
>   target/arm/translate.c |   85 +++++++++++++++++++++++++++---------------------
>   1 file changed, 47 insertions(+), 38 deletions(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~
