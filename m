Received: by 10.28.4.212 with SMTP id 203csp1328157wme;
        Thu, 10 May 2018 11:10:09 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZo1knn+61apRjv36+jvgEEXt5rxzcOcXdKND0vLnItAWNbZNhIuwKneaXjRRxENSSV+I79y
X-Received: by 2002:ac8:1766:: with SMTP id u35-v6mr2401778qtk.209.1525975809852;
        Thu, 10 May 2018 11:10:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525975809; cv=none;
        d=google.com; s=arc-20160816;
        b=uTX2yLQ9j0UqalCF/zkr8w6+5WtRPAcKH3GxaGcxQ8peAlHMZXuB1nDwj3CZVnbB6E
         AU37AhjIrOUQ7+OhzAGMr0B2usa+zJ2kw2WOAhAar7LTVu8lsif4MDyTLy4jmp69M7PA
         axTMLUMhbX12uJyjkBUSZSne033gEwQG8lT2LNfEaZpIHTrgCsrp4ldSNRL49CKgTUgD
         ZzkJ707nA6dmyEXc+QLpqg/jaq0uBUOOpSEqTzDY8iQS4695vuXRkty40DfXRdr0iugR
         zVqrLg4HBgjietVyRzYfGTUxeXkXoJhjz6BfT9JwnKzplZopijLCCCUfQ/J9jHCM7XcO
         F4/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=7I7kjHAQKhd4Q8hyIv5bpPQ1kJafzdP5nP/u/EAzf5Q=;
        b=zcCRhDzJp43rmQDw7vvtZQoa5q2LsckXg/7JRM6gbOCvKtuj1hUExw63xn5QvfJDvl
         EZo6HOSGgOdV3oxRfeDKHCFcrXm6EEdOGwCwm6NYjLHz471r0TZXKNShqcoQWCllVasm
         oOskRCJna1Zdd5UygEe7xeubYS4/MX0Woyzili6P7o904yHteai0kuWPHxDC0wZ7Q5z4
         ChzimWEop+XCn/WOfrV2a/RBFVUau2ACpRLDQD+t4vK10UEXbHmfmEz4Wu8+zLsRhrTs
         CP2NxDM2+85L9FaRZgfSa64JqAPNTJMCa7CK3J8biORHCFIpVryYDtOJzPVFY6vzoswb
         59Kg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FweHhDp5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d10-v6si1206450qtl.391.2018.05.10.11.10.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 10 May 2018 11:10:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FweHhDp5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35155 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fGq13-0005Qy-5q
	for alex.bennee@linaro.org; Thu, 10 May 2018 14:10:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56320)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fGq0r-0005PL-9S
	for qemu-arm@nongnu.org; Thu, 10 May 2018 14:09:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fGq0o-0007cy-4l
	for qemu-arm@nongnu.org; Thu, 10 May 2018 14:09:57 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:34574)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fGq0o-0007cq-1P; Thu, 10 May 2018 14:09:54 -0400
Received: by mail-qt0-x243.google.com with SMTP id m5-v6so3757855qti.1;
	Thu, 10 May 2018 11:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=7I7kjHAQKhd4Q8hyIv5bpPQ1kJafzdP5nP/u/EAzf5Q=;
	b=FweHhDp5xHw0DVeYtXudxNjywlcb+KNFawttY3zxv6AoivS4pVM4CYPBR4j+t/1xQz
	bY822lUulBnzE80/5yp4gvWk7vuoFAyBkGSKRg824IX8qBFzWZpm8l6Wu3byyyw23RjO
	oAiV545MongXnb0G40oAF4DL0J3Q88PoJ6JYBX1EUo33xMttiaIdW4lYAyc4xyj4o4vg
	5mPIHPrcb+otqxYL1ziMN7aCdjZizp5etFRz50y9M6NRi1NRggRFsXJOIcKWKGMkSfNz
	jhE4NgfqiMgvpITD65uchvgOpLvUNREh7EMDNPLc6H0HPXNCzpdkTsPd7fd2/ULKo8aw
	6hGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=7I7kjHAQKhd4Q8hyIv5bpPQ1kJafzdP5nP/u/EAzf5Q=;
	b=EoGpiTbM3hc4mOxiPfv7gN/tFaBXtbyM8p0p40+LtKBgfsairGXgp9s/neKRsCSRlH
	Pdbtn23lqTiWi2tNtT/DtkZvYBd3PmzgllozutaIYdP5hA51r1DZtcEi4IOIsSlQe8Uj
	Zrze3sV6YxHt8wgaJrHcI2HSdXW3DaEkZ/38lGP5bw2F0INRJ13gmXctB3/SFG4GPTVM
	Sdk4gTZLDVUHs02eGKbE9vLrd4nbQE3st06koyyDtHNDzi2cfwOTeWURHXAkZcsn/Fub
	nHOboAiGg0sM1R7S7C0O6ytT2zuC2oYSp4ow13B37pKbF0QXBmYVE4ZbuYlvjL4sR1R4
	8i2Q==
X-Gm-Message-State: ALKqPwcxPOkQFttuomgUHN4k9Zb8I19MfM21nqnldPuNHo/UaIPIqZ37
	cQ9U6SlUS1ni+qGz70p7aSDhCFhR
X-Received: by 2002:ac8:d1:: with SMTP id d17-v6mr2482583qtg.356.1525975793387;
	Thu, 10 May 2018 11:09:53 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	l17-v6sm972607qkj.47.2018.05.10.11.09.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 May 2018 11:09:52 -0700 (PDT)
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, peter.maydell@linaro.org
References: <20180503115620.10596-1-edgar.iglesias@gmail.com>
	<20180503115620.10596-3-edgar.iglesias@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <c7409bf9-b336-8df2-bc2a-ace45077bcce@amsat.org>
Date: Thu, 10 May 2018 15:09:46 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180503115620.10596-3-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-arm] [PATCH v1 2/2] xlnx-zynqmp: Swap Cortex-R5 for
 Cortex-R5F
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
Cc: edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
	frasse.iglesias@gmail.com, alistair@alistair23.me,
	qemu-devel@nongnu.org, frederic.konrad@adacore.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3Dogi771/Eq9

Hi Edgar,

On 05/03/2018 08:56 AM, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> The ZynqMP has Cortex-R5Fs with the optional FPU enabled.

What about updating the xlnx-zcu102 machine description too?

  mc->desc = "Xilinx ZynqMP ZCU102 board with 4xA53s and 2xR5Fs ..."

> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

I just noticed we can not get information for the R profile cores via
the monitor:

(qemu) info cpus
* CPU #0: thread_id=19283
  CPU #1: thread_id=19284
  CPU #2: thread_id=19285
  CPU #3: thread_id=19286

same with "info registers -a"

> ---
>  hw/arm/xlnx-zynqmp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 505253e0d2..efeb53c732 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -116,7 +116,7 @@ static void xlnx_zynqmp_create_rpu(XlnxZynqMPState *s, const char *boot_cpu,
>          char *name;
>  
>          object_initialize(&s->rpu_cpu[i], sizeof(s->rpu_cpu[i]),
> -                          "cortex-r5-" TYPE_ARM_CPU);
> +                          "cortex-r5f-" TYPE_ARM_CPU);
>          object_property_add_child(OBJECT(s), "rpu-cpu[*]",
>                                    OBJECT(&s->rpu_cpu[i]), &error_abort);
>  
> 
