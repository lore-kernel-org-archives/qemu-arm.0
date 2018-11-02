Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp1871034wro;
        Fri, 2 Nov 2018 02:21:04 -0700 (PDT)
X-Google-Smtp-Source: AJdET5eCH/Rm4SriR1vDPV7v5fVAO7mMlbjjxsa+qlNIUnX9a0opCcNWwj7cv+xO+e3oNM83ln3h
X-Received: by 2002:ac8:4607:: with SMTP id p7-v6mr9844197qtn.135.1541150464425;
        Fri, 02 Nov 2018 02:21:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541150464; cv=none;
        d=google.com; s=arc-20160816;
        b=HSmoA5b1eElerKy0RsijWCpZLt12H4ExA161p1qr9aHjPdd2BA0inkX3PigQpfG2rw
         uSW3V9bj3Wu8AjmOYcVM6C/i/iKMI0tg9fOXBvG8LY9mRVw3kcHQnczTv5KZ3JoIN1iv
         kaP9zdZqz/v0v+JAkuKOVAosrJ2Znb2eQFfB3jPs0HNnR1uElBmZ5PNDfy5kJm2dtQpG
         HmYLLCFeM3PbJKw9QpzgdIovijqwPdUDTQZCCQ0Qcan5vf0JvX1PYnI+y3CfC6pg9IUI
         vT0C88tCvkcwuRSdyf9BgJLfBq9TpzMJGdgGyR3pgPwxIE2nwcwhoNqzdT8vF/UNfJUG
         WSgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature;
        bh=1f9cngYAtV38R2zHqkvb5KhAIiILPeL8HlrFiiRgXS0=;
        b=zmWZIAV3SiIPxqVS0e8PhB/EgxOQSR7pXaYUjSSMBMv1yu1Kk9NtPuDzjK85UsFhZu
         RWBGMA8UU97YbJeHpx9Gt0ZV5oBXKayri9yBBDWRunl/o5ObIqOgRC/TnpQpIyN24xVV
         EztbmgQSc5SZYYKtTGW+rBE2tBvRgVQ+n5sC1NJTwNyZAkx9EMFP7ZhWuh3q5/eYH3WK
         +idK83HWb01lSCbqiKHxkftJcOepvqvLjO0gQeraVDulI+0oRfZgHvhY/h7tPXomQ6aC
         DmAcHwKOCjNNJIqGYOfg9J1l9jafH7rfFlpm8DSVKPb/pmICX+gxk/Y+Yc1Ec/L9C4g/
         Q3sA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UhQsYurN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j2-v6si8229938qti.141.2018.11.02.02.21.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Nov 2018 02:21:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UhQsYurN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50381 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIVdX-00032Q-UV
	for alex.bennee@linaro.org; Fri, 02 Nov 2018 05:21:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54625)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhaosl@gmail.com>) id 1gIVdM-00032J-CL
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 05:20:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhaosl@gmail.com>) id 1gIVdI-0006rb-M2
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 05:20:52 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:37528)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <shannon.zhaosl@gmail.com>)
	id 1gIVdG-0006jN-9o; Fri, 02 Nov 2018 05:20:47 -0400
Received: by mail-ot1-x341.google.com with SMTP id 40so899297oth.4;
	Fri, 02 Nov 2018 02:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=1f9cngYAtV38R2zHqkvb5KhAIiILPeL8HlrFiiRgXS0=;
	b=UhQsYurNB/LvMtecgF4F16u4/CtbphtzAhqZLLT8WUoQHS0PM4Q+CPjAZuxoMYIwzY
	r1C6v5G3quIYbbF7HbqAQRBrWUi5b7wUC91jSqHbB9SOHyL4D1UnWZyk5GtphodBPCQU
	Zk4BM7cMRg34G5X4c6dvA8YONmamgEZA73J1C3q0eYQYaS5j/5aZwnXs4XMU4hDgBAxZ
	9Uk3p8Idr8UCJed0Bys4u1NlI01c+jEqToLm/TctNcoT8qPvhfkWK8F7yKSFRHhtb0Q3
	YqaeIxK2FjZqKpZP7R47pUYY8fEViF1Pz0pQqOcu3tud5TnRAEGc77bAGIlyrvJtjBty
	gC8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=1f9cngYAtV38R2zHqkvb5KhAIiILPeL8HlrFiiRgXS0=;
	b=U5ioE+ZpcDBNbOd4j3J22noWnZuZNXMofYQuxL61KdAblkN44bQsGFpsSZiqD2ZzoB
	xH9qVwyCOhm0CHB2eDZaogsPJ4DQza5rceE8CAlBqnqrurGHY/lh6DIvTDdBfxP9k7XW
	BrHSL2apaPSEct+HzQRByfSB443zmq2nltR8EHr7cI4uNrqb3tgwCIY3lueesISLbXBL
	SrCo7UH2bafi1iUhhYB8Ga3xEpgG1gxfbCDog3amWWJQ5RtlzAG0poUKbta9IySLp9Nq
	6KLgSkZgay2SeemoCBNTN64wtVyraktuLusPHCI1nJbFCaA9F4waAjNksfwyaYEYOJpe
	bWSA==
X-Gm-Message-State: AGRZ1gI2uBg+SzoY/zHuv24WdBnHq8R2FiiMT2A1KlxgKLFFdtp53VEE
	6BtSb/rAQ3uPmZj7yYS1QyI=
X-Received: by 2002:a9d:2525:: with SMTP id k34mr1445110otb.156.1541150443492; 
	Fri, 02 Nov 2018 02:20:43 -0700 (PDT)
Received: from [30.43.112.38] ([47.89.83.58]) by smtp.gmail.com with ESMTPSA id
	s5sm12254498otc.40.2018.11.02.02.20.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Nov 2018 02:20:42 -0700 (PDT)
To: Samuel Ortiz <sameo@linux.intel.com>, qemu-devel@nongnu.org
References: <20181101102303.16439-1-sameo@linux.intel.com>
	<20181101102303.16439-4-sameo@linux.intel.com>
From: Shannon Zhao <shannon.zhaosl@gmail.com>
Message-ID: <a7c05368-908e-0249-5702-63a844f9dc71@gmail.com>
Date: Fri, 2 Nov 2018 17:20:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181101102303.16439-4-sameo@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 03/23] hw: acpi: Export the
 RSDP build API
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
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	"open list:ARM ACPI Subsystem" <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VOcZDvmwBjaj

Hi,

On 2018/11/1 18:22, Samuel Ortiz wrote:
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index f28a2faa53..0ed132b79b 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -367,7 +367,7 @@ static void acpi_dsdt_add_power_button(Aml *scope)
>   }
>   
>   /* RSDP */
> -static GArray *
> +static void
>   build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned xsdt_tbl_offset)
>   {
>       AcpiRsdpDescriptor *rsdp = acpi_data_push(rsdp_table, sizeof *rsdp);

Why change this? It's not related to your patch purpose.

Thanks,
Shannon
