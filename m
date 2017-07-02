Received: by 10.25.227.6 with SMTP id a6csp508052lfh;
        Sat, 1 Jul 2017 18:49:57 -0700 (PDT)
X-Received: by 10.55.166.194 with SMTP id p185mr32854034qke.132.1498960197459;
        Sat, 01 Jul 2017 18:49:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498960197; cv=none;
        d=google.com; s=arc-20160816;
        b=Gacj0gkK66J6HypSkMLhujWiV5GF4g8dQlPGwZKVECKB/X/8Ql3ts9d30RKEn0bhTg
         /TREUkXEy/u29FyncwaChZaXZCRvDFySrTxNzKTLOwJOJ+eZ3ls53rziD5CXOYZ3CBHB
         UnJHLL997AVg14faPKBn7bzJgDkH1nm/BJc2BACnuS36xFOIiTYq+MJnOgN1ahanfBpL
         Rr7pB9nGmFgfmLEXvwmTcJ2E36G7SpQdD9XdX37wHK+8D2fW805U8YwVR2DL7pNsFIAx
         +d0kTtD9pcQGniAiCQ6L0U6GI5819PlUzR1vHfe6vfE+xgMf1OWUd3m+dQsyXR8F1igE
         XMBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=42YSBkwRQhBWUNnsjtl9NIpBLH52LAPeRSrdg5Gz/24=;
        b=rvtm3Pj4dB5c8081UeqYMpiA9Ybie3QjLHWCLNmmQQIZiHjvXoeyOaXuHhez+GAcfk
         HeccjfHWhykJpRJmeEK747EaGIccDn7zqijipy9CxyGqpq9xKkniN9v9JqibsZQbiDvz
         Zq6QYGg52E72CVEyf9XkGmHWJsMunGpz4xZFse824GuDN5uB2lqsCm29EwcKJq8quUZQ
         r6lMQADNSdVxxTjw0uvXCusAsxDzFWmgkmoFyaMQaYa5a0CeMrP8kJ79FL5B7WdlmPO1
         93vRNaB3Skca8ZT/DrWypmUU1h+97EJBXB5cRZ2SLYm4Q0zl45kqZ778Osa1GZX22nKb
         L/bw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=owsUTunz;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::244 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-qt0-x244.google.com (mail-qt0-x244.google.com. [2607:f8b0:400d:c0d::244])
        by mx.google.com with ESMTPS id i188si11408309qkf.93.2017.07.01.18.49.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 Jul 2017 18:49:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::244 as permitted sender) client-ip=2607:f8b0:400d:c0d::244;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=owsUTunz;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::244 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qt0-x244.google.com with SMTP id w12so19685923qta.2;
        Sat, 01 Jul 2017 18:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=42YSBkwRQhBWUNnsjtl9NIpBLH52LAPeRSrdg5Gz/24=;
        b=owsUTunzc0EqprYCEayOBlBA1mykqhOQZJD9xOB6Nz6E8owIDRpMyf2pJ8icLQWon/
         vDjtiBFPszPzkVUF0j+9LjX2q0wm4CqlQw3W0dDuYM2YwRMiOxeN/9YzZYPYEV9zdlqU
         4BTvFgF2Qpo+lfxRD+mgmDBXwi11PDTo3dwIcNQ3FFvk280MkZnub/F5jEJvE5a+4FHc
         IKw9FAtF9gW1Q+SAwAlVyybC37aTHbBlD7UBJFhBDUYaI2fvj/ick9fZoN0x/VucoW58
         T/hoXiy5xd0C1NdrxLpTmDam9IHJMzRJ8AqoQ7WIk1mh8LtvHQxEwfiUyf9qybIrd00N
         NrxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=42YSBkwRQhBWUNnsjtl9NIpBLH52LAPeRSrdg5Gz/24=;
        b=ZZm1nB6LiZ1tLQTfGTLUo6Y9zJYe1gtygEpDv+q2AQTO+M3S7PGpYNsqp6fbsrr9PA
         nXDZYrVqJiYYk+1vBVPUDjyaqcjgLOtFeGs2OAH55b7+mWui+e8DjBFO4Z0Gj9huxady
         2scy8lt+FINcm5bi090ovNQpyOk/dsvunOTBMp1k/HB8X4J4R50LJk9x0Y9R1JtmzZlP
         1AdaA1CingkiCR/+4lD/1hriqBeYaaUiLNHS/wgFWHf67bm+xu3bDZtV+I79BaHzrlFy
         bHGyKPxUIpIrNakmxEwhaI2iZNFydnZd6vAgi267chVh8ce6MdiFouni9idOptiGe3KJ
         vsxw==
X-Gm-Message-State: AIVw1127MZZtAy0VZLl+4rQoyTrmBZv+CcJtm6PhDJ2jiaB1x01FU3Ul
	vtXyTE60osgOmP1u3/A=
X-Received: by 10.237.52.227 with SMTP id x90mr4008194qtd.121.1498960196916;
        Sat, 01 Jul 2017 18:49:56 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (97-113-165-157.tukw.qwest.net. [97.113.165.157])
        by smtp.googlemail.com with ESMTPSA id y6sm6051335qka.55.2017.07.01.18.49.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 Jul 2017 18:49:56 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [Qemu-devel] [PATCH v11 27/29] target/arm: [tcg] Port to
 disas_log
To: =?UTF-8?Q?Llu=c3=ads_Vilanova?= <vilanova@ac.upc.edu>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 "Emilio G. Cota" <cota@braap.org>, "open list:ARM" <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
 <149865873757.17063.9995919085229011280.stgit@frigg.lan>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <f8ea2e9f-ed59-1370-84a4-58c17802c2fa@twiddle.net>
Date: Sat, 1 Jul 2017 18:49:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <149865873757.17063.9995919085229011280.stgit@frigg.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: krbzkGRIIQIF

On 06/28/2017 07:05 AM, Lluís Vilanova wrote:
> Incrementally paves the way towards using the generic instruction translation
> loop.
> 
> Signed-off-by: Lluís Vilanova<vilanova@ac.upc.edu>
> ---
>   target/arm/translate.c |   13 ++++++++++---
>   1 file changed, 10 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~
