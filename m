Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp6131957wrt;
        Wed, 3 Oct 2018 03:32:52 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63tZ45MDILVPyZYkAE8hWStfRamGbsLiwo20ExHCsTmRz59aYtPHM4r47c93AzQIbaLrYlp
X-Received: by 2002:a37:a0c2:: with SMTP id j185-v6mr575131qke.74.1538562772446;
        Wed, 03 Oct 2018 03:32:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538562772; cv=none;
        d=google.com; s=arc-20160816;
        b=LdljnFNdlN7D8PbQiEr6VGovbSozZK5haPwKWltiA/OU2Xi4OyDS4wcE5pJEsBg0mk
         ICw17XcSgIIzwTZvjG31grrN24XGxAMDpx5j982/Op55YeF0lO38c4gNnNHW5DT1X6vD
         2m9f5klMeXy67oR3IXv2rDE/908aeUNzUVWlckfiEkOnYI/XehFgvJsFx7K2+FuLzaRs
         4h9iibbv1kLES7LLNSupCG6F9mWWkTJe7LXradIIo7vxvaZ9APdsM4YFRE4cOg8m8sU1
         g6FoLmAhKmBK97/b5MooFewmKzlErAxOLiNY/ABrPVyjZm+e7zgxP6muOoRnOvLie1Pu
         I2Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=5A5sF3XVfRUsUHPL+ChPUXlrZzq/INTT0FI+o+6pO24=;
        b=OTwOdCmjjUwlwb1yBns2mWtmsEWhUxw2qhsCAqvtFxSgWfwxwitPl6br6CKKr09+bT
         H3K/LL6fZLzrbEdUdt7SgeMup3/FvC22lk7+JHhO4hYyGZoH7TnPJoqu32u1QZemxpWx
         pdEhWdMilreMpk7wcehWHI6nNrUQUKRmWjVQPAhx0fBXeJ99smi9dPL8gQQKlfJqvW2n
         4Zihh+w++PYknl85QKpb7fzjPWOENrizbZjdY3PwoDl9xA18SgdFpC99Jb2dhlAB3kew
         GuVF2hwErizQwNRMLyWBaxRUcni1HmA8weFvU47fzcQownqOYTPmhlljlt6pRmzmzzBi
         KMaw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f6-v6si579851qtj.82.2018.10.03.03.32.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Oct 2018 03:32:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47909 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7eSZ-0000sD-V8
	for alex.bennee@linaro.org; Wed, 03 Oct 2018 06:32:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36996)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g7eSK-0000mx-00
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 06:32:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g7eSG-00040d-D7
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 06:32:35 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35490)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1g7eSG-0003yg-79
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 06:32:32 -0400
Received: by mail-wr1-f65.google.com with SMTP id w5-v6so5532981wrt.2
	for <qemu-arm@nongnu.org>; Wed, 03 Oct 2018 03:32:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=5A5sF3XVfRUsUHPL+ChPUXlrZzq/INTT0FI+o+6pO24=;
	b=aiVnYU0ypyQL2BNCFuOWFhn4e2SncMrYBGrWvaH8g5Kxq4IJWLN9609zGB9DcbAAlo
	+CzfjdQrc2EZn/Kc0Ps3WYys96QZiYbH1sos3JYAXHzQl5phc7A5Yqf32N7K4kE4Xcf3
	M13yrJBoZgX2GycCv0CsqiPGNt5O2NCT6oN3tSn5tdwyyLIqDPlziPyD62Q6qz34Ov01
	OFxxOZ7V6kgZlvH2y90fpZArtvgRBRGC0vYY/gIPb74wrqlH5vhvDILTsccBNwrusQaW
	v2tXsDFSNY7wF+zMkWbdYuFiulTH82aSVPWHkmDPkz4pIDXLe0sAxMah9tWDUa97AnG7
	uEow==
X-Gm-Message-State: ABuFfoi60dBVpHc6HuoBC9hLjhb2oR0s/5tBRojDDbIKeIxKxTtQ6Jky
	BmB3pExK/vmnAvUwNVQh+bvYQQ==
X-Received: by 2002:adf:fccc:: with SMTP id
	f12-v6mr867835wrs.166.1538562749121; 
	Wed, 03 Oct 2018 03:32:29 -0700 (PDT)
Received: from [192.168.2.33] (26.red-83-32-208.dynamicip.rima-tde.net.
	[83.32.208.26]) by smtp.gmail.com with ESMTPSA id
	e64-v6sm1381952wmg.0.2018.10.03.03.32.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Oct 2018 03:32:28 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181002163556.10279-1-peter.maydell@linaro.org>
	<20181002163556.10279-6-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e9753178-49e9-884d-7ce9-faec4e43fee2@redhat.com>
Date: Wed, 3 Oct 2018 12:32:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181002163556.10279-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 05/13] target/arm: Add some
 comments in Thumb decode
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0xKfRX8JvUKL

On 02/10/2018 18:35, Peter Maydell wrote:
> Add some comments to the Thumb decoder indicating what bits
> of the instruction have been decoded at various points in
> the code.
> 
> This is not an exhaustive set of comments; we're gradually
> adding comments as we work with particular bits of the code.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Specifically, I figured these out as I was going through looking
> for the insns which write SP. These comments turn out not to
> be relevant to those instructions, but I don't want to throw
> them away.
> ---
>  target/arm/translate.c | 20 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 25a8fe672f5..fcb33b8a503 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -10623,6 +10623,10 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
>              tmp2 = load_reg(s, rm);
>              if ((insn & 0x70) != 0)
>                  goto illegal_op;
> +            /*
> +             * 0b1111_1010_0xxx_xxxx_1111_xxxx_0000_xxxx:
> +             *  - MOV, MOVS (register-shifted register), flagsetting

T2, OK

> +             */
>              op = (insn >> 21) & 3;
>              logic_cc = (insn & (1 << 20)) != 0;
>              gen_arm_shift_reg(tmp, op, tmp2, logic_cc);
> @@ -11674,7 +11678,11 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
>          rd = insn & 7;
>          op = (insn >> 11) & 3;
>          if (op == 3) {
> -            /* add/subtract */
> +            /*
> +             * 0b0001_1xxx_xxxx_xxxx
> +             *  - Add, subtract (three low registers)
> +             *  - Add, subtract (two low registers and immediate)

T1, OK

> +             */
>              rn = (insn >> 3) & 7;
>              tmp = load_reg(s, rn);
>              if (insn & (1 << 10)) {
> @@ -11711,7 +11719,10 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
>          }
>          break;
>      case 2: case 3:
> -        /* arithmetic large immediate */
> +        /*
> +         * 0b001x_xxxx_xxxx_xxxx
> +         *  - Add, subtract, compare, move (one low register and immediate)

T2, OK

> +         */
>          op = (insn >> 11) & 3;
>          rd = (insn >> 8) & 0x7;
>          if (op == 0) { /* mov */
> @@ -11848,7 +11859,10 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
>              break;
>          }
>  
> -        /* data processing register */
> +        /*
> +         * 0b0100_00xx_xxxx_xxxx
> +         *  - Data-processing (two low registers)

T1, OK

> +         */
>          rd = insn & 7;
>          rm = (insn >> 3) & 7;
>          op = (insn >> 6) & 0xf;
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
