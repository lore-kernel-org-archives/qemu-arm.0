Received: by 10.25.227.6 with SMTP id a6csp508368lfh;
        Sat, 1 Jul 2017 18:50:17 -0700 (PDT)
X-Received: by 10.237.46.38 with SMTP id j35mr30201142qtd.178.1498960217816;
        Sat, 01 Jul 2017 18:50:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498960217; cv=none;
        d=google.com; s=arc-20160816;
        b=B7pI54ePeav6qc5MM8bqrcsR30cC7aCLnK7G+JWydG+ypp4ctdrVy+a4u92Wgvt/iM
         30HwQ3cltuFuGEu23sX+y/xKKdCxcGAg/MY9xn6uWDykbrdLedALrmuaFZICO8yv2/3y
         AayZ4o7ZuB7egvAGiKVs0odonjB0jnvmc3FjPEsEcA5PKZcJDia4PXNJ1EZHqktftehw
         GucDObznRCI8/UI/f1xXzuQfTTLick94HTVR5ryMtgaZLbVIEBg16ISJVLvIeWmWb7Ae
         NcPl6+fiJURkqODyk+9JmWI+FPYFzhUyJe83Ez2bg3wG6QDigaOCsX0cZeF5l93XmN39
         Qpug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=Xw5FUuCV6ckNe12StuorKTQrCPag8BuD1XucOxeEeJQ=;
        b=Um1M8p8XMcrQ2+wsr7/MucqzFC614sqM07olev7FHsZvyX9dX7a8d9zTZMFuoDL+Uo
         yY12pMbPebUWAP5c2bLCFf+QzonduN291fLotvj1slmQnrFFy07PI9qsN0lTdHlAkGO8
         0G7EA1qos0Szb+qG+hBEAhF8H3SKX7y08Pa/qTilYvCnqJ2s0/yCHzrzW0Oh6sYo/4Xd
         MNs10IimvWgLe1gXSxGepZ4tcQzpEMUY39R/ylhZ5D6qDbzH5ZytXazQX0vlZO9JgOQF
         EgtzRhBCpJIxQzqzUaIV8Q9Zerja4A3fRTXbOLtnqI4YEF+fiAohuwq87rWozICu3/Jb
         u7Lg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=ieEXWTbY;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::243 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com. [2607:f8b0:400d:c09::243])
        by mx.google.com with ESMTPS id j1si11124691qkd.269.2017.07.01.18.50.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 Jul 2017 18:50:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::243 as permitted sender) client-ip=2607:f8b0:400d:c09::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=ieEXWTbY;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::243 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qk0-x243.google.com with SMTP id 91so20120838qkq.1;
        Sat, 01 Jul 2017 18:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Xw5FUuCV6ckNe12StuorKTQrCPag8BuD1XucOxeEeJQ=;
        b=ieEXWTbYuWrATEdQBiFR2hpa8hbZjoDhxZWC1iFCwwGeoyTThA+ddD+89Vppt3Gc+8
         BpFgpx1l3n9TiwmPTTarGKj2ccrRKHSSqAk4Sf3VVeV0dlWCjVLb9le+7Km5iLOGOB2V
         aGukd1Nf6EUADg/sTvtzgDh7lXJplux1VZfk7+r3ZdqHpd+EJinL9zGlHxG9Zp4RCbdu
         tNMwc7j8k0vHyDnlRgV6Wver9jqrD7AQltahKMublgO9qc1RaxP+IkOy8Q+FFNaRrOax
         /azdQImA3S1CKba056fjAANP1Yh3qvEUBI0SnRT12sDzMTq0wqjvcrfgf0g6ZwoGNLWa
         Wu7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Xw5FUuCV6ckNe12StuorKTQrCPag8BuD1XucOxeEeJQ=;
        b=cjmbupKTFyxM8IWb6U+cNEJyhz2GVmulKTOAd78ixXu6D8F0c8ukGhI1QORQZ980a2
         eC3LDtKCA/bfGs9kqAH+WFY9IcTs1VB5xCouQLFlGWqiQD/0a8MjUEnmyutN3moySqqH
         nPe4dk3vYQVAavVdoAKTb4CXq7N8adNHBLyg3i8xf5G7UUulEkWoGv9i2fxiBilMH+o6
         AEX3td08JrJEdoqK1YuhoZ395xkkRemg6OTtgDSTBk5P9uVhVqTiaXHAK1gn/r+jM3ie
         4qmqQa7WWo+vGeIYpN2EQM2ClBAqWFyhZkk4v67AX2F1heZqfIvgx/Hljttmgmuode7z
         pRwA==
X-Gm-Message-State: AKS2vOw8FU1Yv9R4dxAEHtON+f606oQZY48zFP3W4xN3AKUfafSVsXtS
	e1ejl7dJ4lAMFbv4qMs=
X-Received: by 10.55.141.198 with SMTP id p189mr36860058qkd.97.1498960217273;
        Sat, 01 Jul 2017 18:50:17 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (97-113-165-157.tukw.qwest.net. [97.113.165.157])
        by smtp.googlemail.com with ESMTPSA id h68sm8922399qkb.47.2017.07.01.18.50.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 Jul 2017 18:50:16 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [Qemu-devel] [PATCH v11 28/29] target/arm: [tcg, a64] Port to
 disas_log
To: =?UTF-8?Q?Llu=c3=ads_Vilanova?= <vilanova@ac.upc.edu>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 "Emilio G. Cota" <cota@braap.org>, "open list:ARM" <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
 <149865897948.17063.7243731047242702451.stgit@frigg.lan>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <1bc38ff0-1903-0ba3-02d0-cde205f3b75a@twiddle.net>
Date: Sat, 1 Jul 2017 18:50:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <149865897948.17063.7243731047242702451.stgit@frigg.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: zJf2B+/Z538W

On 06/28/2017 07:09 AM, Lluís Vilanova wrote:
> Incrementally paves the way towards using the generic instruction translation
> loop.
> 
> Signed-off-by: Lluís Vilanova<vilanova@ac.upc.edu>
> ---
>   target/arm/translate-a64.c |   14 +++++++++++---
>   1 file changed, 11 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~
