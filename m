Received: by 10.25.0.6 with SMTP id 6csp23858lfa;
        Thu, 11 May 2017 18:56:12 -0700 (PDT)
X-Received: by 10.55.92.3 with SMTP id q3mr1497378qkb.164.1494554172165;
        Thu, 11 May 2017 18:56:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494554172; cv=none;
        d=google.com; s=arc-20160816;
        b=UGL9ldT8O9jEPn0WuM0R4h4j13isDSKcyv5xtMx1ioB3boRWC/3DMdtO5b0PXeOsXw
         c9bEw1FDyY1Ewok96tBUYfZPFO4UAzcgMoGMBPLv/jdRg1ApM+waK06wjt8D7dTH8Lld
         pOs3xKgoR+hQIlTpZZR/KM17zVjvedLWvHxN5+b0ig9smH8mN8tfztYsXt7cmo3+uJ6c
         9airRVWLKLjjF78YH4uZtfOo7MSyGQmId7/zD/JGgf2cILCqepxWF6g/0CQCc9TLfugQ
         yQhZSaz6lGr2MYei6/C35/FycwhXk27y26LMvCSViEQz1pl2NP3aNtM9BTackncsA6RR
         UC1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=8FJiJBygto3FZIuLDeq6UIG/mvpccufsbhXcCbTHTy8=;
        b=Dh1qNpgwAI+tpwD5Dfv30GsOXGsq4StvsBTq/QLwtHkTRBIhwWSVT8tSmPVefHk/E9
         edvLUOMaffqs41wCcYGJPePdL4p2exP2PNbwC6DQ+aT5Zfdl5/OF4TWWVunJ8KMIRtIZ
         dFBMINsZ8KhvhrkW7A8H+QN23JBh+DbfGlJiWCy8Z16EJzzrfPeLO15AhSnRYDOXwkTZ
         s56bxCMyvkErgO9pCQoIm7KxwdIq9srVwqfBkwEYaiw5NFiwVw+P8EfKrXXS2VrdVpzg
         VOWwz9bnEV3i4+av3xJyJaZXN5uenKVjgUD2X+82wcioZkTG77Yk3NMBT4EQUYyGvECd
         8OLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s31si1856889qts.234.2017.05.11.18.56.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 May 2017 18:56:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50957 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d8zoR-0001Qr-Jw
	for alex.bennee@linaro.org; Thu, 11 May 2017 21:56:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58294)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d8zn1-0000Tp-Cj
	for qemu-devel@nongnu.org; Thu, 11 May 2017 21:54:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d8zn0-0000eS-I4
	for qemu-devel@nongnu.org; Thu, 11 May 2017 21:54:43 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:34992)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d8zmw-0000aV-2w; Thu, 11 May 2017 21:54:38 -0400
Received: by mail-qt0-x242.google.com with SMTP id r58so5167728qtb.2;
	Thu, 11 May 2017 18:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=8FJiJBygto3FZIuLDeq6UIG/mvpccufsbhXcCbTHTy8=;
	b=pf6xuagI0SoUzRwnil2PGycsLppm62s0PdrANkkTYwWufaZTaDtd9Y5LBSP1MnlM5b
	MdC717tChhWHpG59xN4HRGhJm5t5ljF+2ljRHvA0RPWFdyaUG92/hk2h1luzL1ejzA6O
	szT1DVwaQ6hqKAQkVc+p4asvqUPQ7g79o9uEULPthxpSgw2ERk5t+ikWoxpYDgFu0Wlo
	Bm8fPNF9Yu3j01ht9ArqfH02oRHkJ/di55hhZIS+qtfIvTNIYStIqpRhr8ck64ceDJ26
	2l7UeUjJ10M+A4ylOV++toc8mLKUpwoI1zoTD/0WlSANTKxfqqbV2jBAte3/rAuTut7X
	Y6Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=8FJiJBygto3FZIuLDeq6UIG/mvpccufsbhXcCbTHTy8=;
	b=ihynNvIZmseqMb9vz/VD8QBDve6E00vnxH9TXV1/z6GheetMq1U86NKKAUmNP54EwH
	q8kGnDxkd4frjtGbTQfHYT/X588RBp+Tn5H3bLR5TPsDrAc4xRUJc9sTWI0Y+lFvPaDe
	DWjcIhld9iCcX6rZDrBafDweVYuDHphYYDMJA4iyIAQdaWiRlMj9ij0GzmQUoIjUjfkl
	HeNj6kR+B2aEUfPDBWStbc09BE1gPECZkdSjEykTPO0iGz90HwjoWcsPqdmmgH/5fPpG
	j0swf48qnOwaY5L0VQT6Qlp2Kf/3/HB+94CPOJrGr1lrd95oZUUtAWSeWH0BiZ/crTdI
	6SMg==
X-Gm-Message-State: AODbwcCumMWdlgffX6kQc/FZSme3JSxxidenNSgKRg0gZ5ZFlhSI511v
	+4Bxap8wluTk9g==
X-Received: by 10.237.57.134 with SMTP id m6mr1470316qte.107.1494554077405;
	Thu, 11 May 2017 18:54:37 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	l17sm1342326qke.15.2017.05.11.18.54.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 May 2017 18:54:36 -0700 (PDT)
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Richard Henderson <rth@twiddle.net>, qemu-arm@nongnu.org
References: <20170510200535.13268-1-f4bug@amsat.org>
	<20170510200535.13268-4-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6dc24833-25ed-cc28-d6e5-d49e62bc5941@amsat.org>
Date: Thu, 11 May 2017 22:54:33 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170510200535.13268-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-devel] [PATCH 3/8] target/arm: optimize rev16() using
 extract op
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IgkOEFS7GYzp

Hi,

I'll resend as v3, just to confirm this patch is OK:

$ docker run -it -v `pwd`:`pwd` -w `pwd` petersenna/coccinelle --sp-file 
scripts/coccinelle/tcg_gen_extract.cocci --macro-file 
scripts/cocci-macro-file.h target/arm/translate-a64.c
init_defs_builtins: /usr/lib64/coccinelle/standard.h
init_defs: scripts/cocci-macro-file.h
HANDLING: target/arm/translate-a64.c
candidate at target/arm/translate-a64.c:4041
   op_size: i64/i64 (same)
   low_bits: 16 (value: 0xffff)
   len: 0xffff
   len_bits == low_bits
   candidate IS optimizable

candidate at target/arm/translate-a64.c:4047
   op_size: i64/i64 (same)
   low_bits: 16 (value: 0xffff)
   len: 0xffff
   len_bits == low_bits
   candidate IS optimizable

On 05/10/2017 05:05 PM, Philippe Mathieu-Daudé wrote:
> Applied using Coccinelle script.
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/arm/translate-a64.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 24de30d92c..7ea130107e 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -4038,14 +4038,12 @@ static void handle_rev16(DisasContext *s, unsigned int sf,
>      tcg_gen_andi_i64(tcg_tmp, tcg_rn, 0xffff);
>      tcg_gen_bswap16_i64(tcg_rd, tcg_tmp);
>
> -    tcg_gen_shri_i64(tcg_tmp, tcg_rn, 16);
> -    tcg_gen_andi_i64(tcg_tmp, tcg_tmp, 0xffff);
> +    tcg_gen_extract_i64(tcg_tmp, tcg_rn, 16, 0xffff);
>      tcg_gen_bswap16_i64(tcg_tmp, tcg_tmp);
>      tcg_gen_deposit_i64(tcg_rd, tcg_rd, tcg_tmp, 16, 16);
>
>      if (sf) {
> -        tcg_gen_shri_i64(tcg_tmp, tcg_rn, 32);
> -        tcg_gen_andi_i64(tcg_tmp, tcg_tmp, 0xffff);
> +        tcg_gen_extract_i64(tcg_tmp, tcg_rn, 32, 0xffff);
>          tcg_gen_bswap16_i64(tcg_tmp, tcg_tmp);
>          tcg_gen_deposit_i64(tcg_rd, tcg_rd, tcg_tmp, 32, 16);
>
>
