Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4582204wrg;
        Tue, 14 May 2019 17:28:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyDww3CzITdYQgMsCnruPBkQ8dC3x7ZxOt65yVQ/cGF8yPlyAQUF5WpgwQWr+gOCN2tx6U+
X-Received: by 2002:a50:9405:: with SMTP id p5mr39741371eda.111.1557880137692;
        Tue, 14 May 2019 17:28:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557880137; cv=none;
        d=google.com; s=arc-20160816;
        b=fCHXKDExQDGXdRUp6Q2shfh+OuGmULRL6HI43Hh0c/L1hFoCVSyMp/U0228BC9y8v9
         TtmLH5NiOmeaAB+s2GWYkdmDDeZmAQ/ybpkcPvwbRLbKBnZvlQgETzoRU+t/qLw31rTb
         A7ooVSNGKeei4h0awKGnG4yrUoZG+p8/YwGnjvVPrzaAJb5Acw1lBpGljiNe5MVui9ii
         pjfTJyDF/VVR9JcB2iCWJNVSHcf0+QFrg8aywHuRFStY7a2u0iOl9nhEJoUwB/bnQYmL
         AEd3V2+UenOkAfrg4SxswNY52UX1j19x59PzKDcL0BvGGVFvTP8supOt9ooVCRm1IOVf
         MGcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=HkNkmk1PYcKfZ7q6Q5Zk+iOC8uHM0JdXdY0ktCOKu0Q=;
        b=ls+gMu8tdbN5Jm7Gf7Xbnm0khJtKR64mh1As/ORN366plKLtSGrhUaVZLRqaNsY5M4
         e4tg52m5COrA9IRcEinfAYeOyTL3i0HSy3l+WUnsXsBun+uUCc1sewYX/bGREdoi6wzS
         f/3u08ai8j14ZTOi7EdFN1JmmR/zEvBBv1S3zTm8LaybnCobss2D48bU4xuC2n6kXbtL
         MnM0XniXK1lA2slNRUCFXRcbGcZ8gLwpvTrprO7sXpbt2aG864+z0ccbxhEJeoFo3s0c
         0TD4tWe2E5fTsMZWp+XeB5xViJ4j7VCqQX7/tkRW/QlgcA6joxKZGG+MeYrDwKORUtM1
         60mg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hy1Twv3i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j17si200951eds.281.2019.05.14.17.28.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 May 2019 17:28:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hy1Twv3i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:56876 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hQhmy-0004Wt-Qv
	for alex.bennee@linaro.org; Tue, 14 May 2019 20:28:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48493)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hQhml-0004WO-Uh
	for qemu-arm@nongnu.org; Tue, 14 May 2019 20:28:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hQhmj-0001Ej-IQ
	for qemu-arm@nongnu.org; Tue, 14 May 2019 20:28:42 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:37319)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hQhmj-0001Dm-Aq
	for qemu-arm@nongnu.org; Tue, 14 May 2019 20:28:41 -0400
Received: by mail-pg1-x544.google.com with SMTP id e6so395142pgc.4
	for <qemu-arm@nongnu.org>; Tue, 14 May 2019 17:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=HkNkmk1PYcKfZ7q6Q5Zk+iOC8uHM0JdXdY0ktCOKu0Q=;
	b=hy1Twv3iV54o93iBxgHpz2rYIE6SJPULvJae9oRD0DQiQl84LwZrNjHHV71jvcwb0N
	m8rgEEvnhEd1f38NozhP/j9LWozIu5f0NNLOLAiLFkw4r4gKEEZuLRX81bqLG/LGbGJB
	eF/s5UtxfIoIiOc9mkmjTyA6RM5762J2ebROxFDqToSlXfFKzVoMqdXxxuDQ1XqvMW5O
	0xrH7HJsRdcl/k/vjZp4uv4XlhXI0/r4GmYuRTYDAeLFLC2+i8krpo21dswVybU1xXkQ
	N9muCUyKv6OGUHacx6MelQg5J5rLUVE/0FHCyj7Xl//yL+XWj6s3XIWmgDzQnOeDsRKw
	hoyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=HkNkmk1PYcKfZ7q6Q5Zk+iOC8uHM0JdXdY0ktCOKu0Q=;
	b=GVlrtb9ZU9LRSLEl2fjlHnVCJMv+PvZ9981+hwBY837KI0R8LkQ2M88VW1WNXOWEve
	OzZzOWwuEdTPRZGxOjhjRaxiSpKK7ml2OkWVlKSApEf/XiCfmpyyfJyEFc6WzF2fAaGl
	QGqbTfgXq75O01WbJS/FuzuOTPer4KKTnoxmHFYt/Cd8werlspANS45xZRzeYFAsfDCa
	OrcfcQ3UgR21y+xSvNOhmjlEfmpdt98hM4eG5ZNfMltKt62odCH5RwWSBh5Pr6xgzg2m
	FV7CQZtABIzVZfoMWpFEWZhctWbYhMA4ZizbSGPjUIJId5+zukRysDDSVS5qpYULXl4c
	UEgg==
X-Gm-Message-State: APjAAAUm+0ECP4ypiMEpfxXUMv/5kdCwwosjO/tboIUKopincXM05tP6
	U7djbwbuHZKPGoyPbpCY+gvNxA==
X-Received: by 2002:a65:62d2:: with SMTP id m18mr40864043pgv.122.1557880119552;
	Tue, 14 May 2019 17:28:39 -0700 (PDT)
Received: from [192.168.1.11] (97-113-13-231.tukw.qwest.net. [97.113.13.231])
	by smtp.gmail.com with ESMTPSA id
	w125sm354825pfw.69.2019.05.14.17.28.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 May 2019 17:28:38 -0700 (PDT)
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
References: <78cf484c4d991e899d0065b2dab3a2e204ce8723.1557879499.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <1ac3d11b-a011-015a-b506-e34b41d04d66@linaro.org>
Date: Tue, 14 May 2019 17:28:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <78cf484c4d991e899d0065b2dab3a2e204ce8723.1557879499.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: Re: [Qemu-arm] [PATCH v2 1/1] target/arm: Fix vector operation
 segfault
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"alistair23@gmail.com" <alistair23@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IlCVN9yHWCbc

On 5/14/19 5:21 PM, Alistair Francis wrote:
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index dd053c80d6..298c262825 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -6598,13 +6598,13 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
>              tcg_gen_gvec_4(rd_ofs, offsetof(CPUARMState, vfp.qc),
>                             rn_ofs, rm_ofs, vec_size, vec_size,
>                             (u ? uqadd_op : sqadd_op) + size);
> -            break;
> +            return 0;
>  
>          case NEON_3R_VQSUB:
>              tcg_gen_gvec_4(rd_ofs, offsetof(CPUARMState, vfp.qc),
>                             rn_ofs, rm_ofs, vec_size, vec_size,
>                             (u ? uqsub_op : sqsub_op) + size);
> -            break;
> +            return 0;
>  
>          case NEON_3R_VMUL: /* VMUL */
>              if (u) {

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
