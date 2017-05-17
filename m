Received: by 10.25.0.6 with SMTP id 6csp7478lfa;
        Tue, 16 May 2017 17:56:22 -0700 (PDT)
X-Received: by 10.55.181.194 with SMTP id e185mr622832qkf.195.1494982582484;
        Tue, 16 May 2017 17:56:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494982582; cv=none;
        d=google.com; s=arc-20160816;
        b=vuY/P/M1chLVDFuzu+BUT1peU8FBPuC3cQ83G7c+be11eyGBTRB5MtYUXH7CAQwT+f
         Y391XMeFeddWnk7zofh25Wk2jwWfLmIqtlABoKh9TEnfdkbrCnDuut3T5mNTup3Vog0w
         WgjHr5f+b9913bZT/OwbMGaHffvuvsVrzaaUHH0Ra2BJFWAvwhzXhhV0tA31LKV4dyxP
         odwmg5j/Ca1z0/loSFE7jdD5c6g9GK41ixDUZ1XCRLr2+W8eAEbC6swrOrbdy6e1lafo
         /XL7Wt21ahuFqSsHymTrNsEQSe6QkygbOelBretKqOJsg4JipHE3lwDJ/mChLFohRGom
         TEcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=iczegOoD/VtGFJPUALQqUjDWO1bYDU8CQNZ4Tpsin4Q=;
        b=JU+qvPY+OG7B05Xqhe1eyoyAiDx3eK0K+6zw+foD8eVt4+yWzEHTdwVqlSlfxFl1ma
         OlyRmw0hssP6ZUCrhvl8kJWuckJNtwa6/mzoz8+ubGRWrZqhrTXjMfm1RifajmEFlQr+
         ArCEJfKaXr8iS86DjWhGYcj8xDPipwuyGUBTAQTfgdUu3duolzJqB42/7vHPGbpzwI4o
         r7b3GHWCuon4mb1igwFs/w/ZqGLaia23tVggKUieoLXrdHn0kTIUoUiiqqLaCfrHvNsa
         Q1Atma+cbqgRC7C0IdtG5Wdsekem06RgaA5kL/Wt6vaDzCbCeRXUBkkqz/E3PqQJ7Xya
         Zxhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q23si486049qkq.30.2017.05.16.17.56.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 May 2017 17:56:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44843 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dAnGH-0000RI-Sj
	for alex.bennee@linaro.org; Tue, 16 May 2017 20:56:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52298)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dAnGB-0000Pr-JB
	for qemu-arm@nongnu.org; Tue, 16 May 2017 20:56:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dAnG7-0004zG-Bf
	for qemu-arm@nongnu.org; Tue, 16 May 2017 20:56:15 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:34050)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dAnG7-0004z8-7m; Tue, 16 May 2017 20:56:11 -0400
Received: by mail-qk0-x243.google.com with SMTP id u75so25152425qka.1;
	Tue, 16 May 2017 17:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=iczegOoD/VtGFJPUALQqUjDWO1bYDU8CQNZ4Tpsin4Q=;
	b=dFxd7oCmJutrgX4oWDuKHEAadzHIjnZaxyudt/taufDvwbeGIFa9csvegwn9CIL0CI
	Kx0piZLN/JCswt/9KbsBpacshj55cNaMWgEw14QVMjQh5XrDMnH+OqixMdghV+YYeFyH
	RSTOFHtPpoZ00YbWK8IUd8Hn6T/pyelAoOL2dLQ0nLL8juG3TKziJm/gv7dsAsWKNb5H
	NiZ9ON/8S6p4BbS8mMml/MG221o0YY9ISNZeTBJFhyi1RmFa8zfNm1VnNdKE7UC7HwKN
	bAn72jZsyqZpzTMLkSX1+MdfR3xuVDIGLNL7f0GwB8v4qv5rFhBC+q7AFW0mmcSG1fvX
	zPlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=iczegOoD/VtGFJPUALQqUjDWO1bYDU8CQNZ4Tpsin4Q=;
	b=WwFRyfezMhOPcWsgjGuBLns1c50ZT4sPLHQWKUAZJ28YxNFubKUtR1CUkE4c8PQ4oE
	KPZtpVx6AnXMfhRjPd1uH7+BDarJXL8C4Bufq8aiCLBT4jD0mVVIvpsMBLknP7/o2h1l
	Ris6sNe1LEZzlHov8u7lRK/ba626CXA1yB6PNcy/BxWk2mMahyCBo/ZmvVkKElKaVQhQ
	0baqWjn+fk1ZTpbhAtBT26HzGuZg/LEHA1rBCj4x1ADzQRWWEaACRAM3PgoSzFzJLLiu
	jSzAisjilKbsyoeugEW7Zn8n0vFe+yFLXYbUoXPoaGDdS4SqRYCCdM8ntycP1TBJuFXr
	mQPQ==
X-Gm-Message-State: AODbwcA61YlaqDxiK5t5+xquE6XCmom7loIgNRjxO3RHhzQEolltIbF5
	zLVv9lxOmgoXmQ==
X-Received: by 10.55.7.138 with SMTP id 132mr640044qkh.274.1494982570472;
	Tue, 16 May 2017 17:56:10 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id d5sm355216qkf.4.2017.05.16.17.56.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 May 2017 17:56:09 -0700 (PDT)
To: Aurelien Jarno <aurelien@aurel32.net>, qemu-devel@nongnu.org
References: <20170516230159.4195-1-aurelien@aurel32.net>
	<20170516230159.4195-2-aurelien@aurel32.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f476c3cd-3c61-4c9c-dc69-f9fa9ac502f8@amsat.org>
Date: Tue, 16 May 2017 21:56:06 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170516230159.4195-2-aurelien@aurel32.net>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-arm] [PATCH 1/4] target/arm: optimize aarch32 rev16
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"open list:ARM" <qemu-arm@nongnu.org>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wvURc9aAH+cG

Hi Aurelien,

On 05/16/2017 08:01 PM, Aurelien Jarno wrote:
> Use the same mask to avoid having to load two different constants, as

> suggested by Richard Henderson.

What about
Suggested-by: Richard Henderson <rth@twiddle.net> ?

> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  target/arm/translate.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 0b5a0bca06..5becb2bb89 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -339,11 +339,13 @@ static void gen_smul_dual(TCGv_i32 a, TCGv_i32 b)
>  static void gen_rev16(TCGv_i32 var)
>  {
>      TCGv_i32 tmp = tcg_temp_new_i32();
> +    TCGv_i32 mask = tcg_const_i32(0x00ff00ff);
>      tcg_gen_shri_i32(tmp, var, 8);
> -    tcg_gen_andi_i32(tmp, tmp, 0x00ff00ff);
> +    tcg_gen_and_i32(tmp, tmp, mask);
> +    tcg_gen_and_i32(var, var, mask);
>      tcg_gen_shli_i32(var, var, 8);
> -    tcg_gen_andi_i32(var, var, 0xff00ff00);
>      tcg_gen_or_i32(var, var, tmp);
> +    tcg_temp_free_i32(mask);
>      tcg_temp_free_i32(tmp);
>  }
>
>
