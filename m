Received: by 10.25.227.6 with SMTP id a6csp484343lfh;
        Sat, 1 Jul 2017 18:18:51 -0700 (PDT)
X-Received: by 10.55.184.5 with SMTP id i5mr34113769qkf.141.1498958331277;
        Sat, 01 Jul 2017 18:18:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498958331; cv=none;
        d=google.com; s=arc-20160816;
        b=FHjpzsps6+V63F3iTs6rX7QpnGywipFpqmBPcLudFFA2zHHtAM3yXqZkgNpL6AqGDM
         Lkaa6WJbniONGbsCrWJ6TBngGijAlKW1EaT9cGGx5cU7E0twCCcrW7DPzti73U5Ry06D
         M1Km8dYdvvU6G7iycP7WnIttEJktMyT6YFj9/q16ikl+eYJoGysFrJCe09sHtrzXEB6Z
         qU708JF46v3blbNl9uznOE66f+DUre9wh0NAkCjCxLe0S9AacXzzJr8BznYnhmjYjzhh
         231sgaMGg6M10ijDT4bzlhpxAPU7vW7O60QT4GxJ5xnnMGYqomE5QY64Lmt1/DOJ9tEC
         Gbuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=Q02kupgay9JcfLYDvQ91b1aiXsDRBHcGb50GQvSKXZk=;
        b=eCIllt30YtfZHxUk7YNIEKJ5tQKESh0oviibbynolDHRELXeaiikBJMC8o/Wd7Hr8v
         uKJPfS7xnKrHxEwoqyt3vdSboIJMuXIzz3jxsM2er0kmhY4BBmmPRHlnoJjxmZlPowhk
         Js/d6ZjpphvXthY6knfoyNtYpd84QzXKTs/AVTXNJlIXKZrUDsa5G2ISygUKEIYe7jHV
         ZcGzuUiruPfJwQ5/GAxin0BRtA0oRd8gz+xfB9VSXKKdCkvCRaHk9BnCnOa5AEsyUKbn
         iRELDVYynlc/uh/QwtKcvcItoThK9TLmLu/QVTL+a/SN86ygTTHwdiU7tw/PzO0b6OJx
         3Duw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=SEl7iU3+;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::241 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-qt0-x241.google.com (mail-qt0-x241.google.com. [2607:f8b0:400d:c0d::241])
        by mx.google.com with ESMTPS id f103si11663667qkh.9.2017.07.01.18.18.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 Jul 2017 18:18:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::241 as permitted sender) client-ip=2607:f8b0:400d:c0d::241;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=SEl7iU3+;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::241 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qt0-x241.google.com with SMTP id v31so19675323qtb.3;
        Sat, 01 Jul 2017 18:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Q02kupgay9JcfLYDvQ91b1aiXsDRBHcGb50GQvSKXZk=;
        b=SEl7iU3+0mxqFmjqGzXJMPeF11ZkCe78EuB8Q6z+QvVdzTkbG4uXXg6Uf1B00c6UfD
         NK7oKG4ASrG4TZ6XBNg/M/PBO4wPWguh4ilgNrdFKUanTINsLfGXYWRGlisKV4SNFz9T
         NyolL+HmW1eElJt5rhi7/fqKsButpogZ/3D5Vl4NHZ4QANGHLxG1IewaZbQNrXw7Gv6d
         /ES/lviU8vPxQJ1IBKETa6Rd49f1nSRyCVsaA8RtEsV2oVhMpemKFU1EtOVk5ndW6T/G
         /tlsaPdGSlmRi3zgyJlNA+CXk3L+xE15XH4Cpx/CGZT07j3r4wYpkVx7YhMkY6bKPE52
         uP3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Q02kupgay9JcfLYDvQ91b1aiXsDRBHcGb50GQvSKXZk=;
        b=uLvmLW2ZLcxPNGf1CFzgmKvlVyZIXIvipbG4M1wgi2E/fUZyqiGPSaUsMeQmG+YSAb
         OLxI1ySmQqhbc4n6iTiJ5Ax/DtPZyEdXZ1y6x+e5yzzdp6VcnLCLH6olHecjCAWlYbQ9
         RnH+Wwm+f8elQouSTWxwRzcJpLBLNECTD4NTw3f8zBig87aC2oKl6xUmxt0K9q6XMwLj
         emPLpt6vwjofensrdxEzk9/z5tYAMbGm8zcfcD60f1Ero6IBrEB9PBkDv4LtRmTA3j7A
         vJnyKUqxgESuecMeqhmaGqypLV0Nsh6EDefdHTQokVeTZ3CrJ1Zt22/4JSFQF6ie6E8i
         FcFA==
X-Gm-Message-State: AKS2vOzuRleOC2tCw4Z8wJog15/rNCIWsf2IgEu5O4mxHkdMFMpMvn0R
	Sxn+V64GuRFgXJxIJ+8=
X-Received: by 10.200.61.82 with SMTP id u18mr26344408qtf.196.1498958330759;
        Sat, 01 Jul 2017 18:18:50 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (97-113-165-157.tukw.qwest.net. [97.113.165.157])
        by smtp.googlemail.com with ESMTPSA id u30sm9447785qtc.68.2017.07.01.18.18.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 Jul 2017 18:18:50 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [Qemu-devel] [PATCH v11 19/29] target/arm: [tcg] Port to
 insn_start
To: =?UTF-8?Q?Llu=c3=ads_Vilanova?= <vilanova@ac.upc.edu>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 "Emilio G. Cota" <cota@braap.org>, "open list:ARM" <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
 <149865680190.17063.16072451312204148936.stgit@frigg.lan>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <6003c3fa-2dd2-baf8-0591-f6e52a3b62f9@twiddle.net>
Date: Sat, 1 Jul 2017 18:18:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <149865680190.17063.16072451312204148936.stgit@frigg.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: F2/Oee8KCkSL

On 06/28/2017 06:33 AM, Lluís Vilanova wrote:
> Incrementally paves the way towards using the generic instruction translation
> loop.
> 
> Signed-off-by: Lluís Vilanova<vilanova@ac.upc.edu>
> ---
>   target/arm/translate.c |   34 ++++++++++++++++++++++------------
>   1 file changed, 22 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~
