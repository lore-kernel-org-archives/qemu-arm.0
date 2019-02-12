Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp1198471wrp;
        Tue, 12 Feb 2019 13:47:57 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbPzmHmQn1IASiY8I82yGIb1ejr5oGehgSugFZ6B7H4XmZjgR+MYftOzPis0Wx0xlpfOnBB
X-Received: by 2002:a81:2ed1:: with SMTP id u200mr1965117ywu.465.1550008077530;
        Tue, 12 Feb 2019 13:47:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550008077; cv=none;
        d=google.com; s=arc-20160816;
        b=gsuLuKeo8qHb9tUj3Qa7GzaigXEVspJHA1HAvqzXnJ6X1K54OuDyvuh4GrMHm7KAKg
         gPI6i/IllUPyc0PmmGdUrowvVWXKxNHCnwtaSAsMtmlZNaWUn/qgIs2+UZeYT+/7Rml2
         1iZYuhUegvGDknkoA+43mP/J3jruFLbM/jaETAuPcfQIjA+k+Vp6tBOor8OSOTf456/9
         Wt8iGaTam/XzHDIQNuo62h1PQ9tSA93KCFImA5k7znH6sQMEoIzIV50PYgSzMbo3PoFY
         m0GCu+tJM6W3a20T266gSo67iejai2tJfoM1nn0oD1IbAlPCabi/N/KhuwsuJJmorb7b
         6kAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=ZjaZ1MwWyAo+oxIOGP9mXLvkSbxno/qUglkI3HQRDu8=;
        b=FxWKwVjgCn6idD5mMqqmBot43e+uiB3LDDhDZIION8GT3gtkoYS+Etf3mhpfq9WQAU
         f+gbuSYXSqktsBbL+jDEH3RBwrG9Uvg7m4rMFqwswljRqlwEaLyuNSu1qJPon2iv6wY3
         BTLVpj6k91opvKwkSJuh9gkDJMM38DbqdcLmdX+/U+9ABRdQpl2P3BG0rV3uacZgr6UJ
         1oXxs3L+QSjj/EcKI8bgCQHH2jScOwXJy3Fn0ixXVs9h8lyxJ/F+AKNLeMhhFT4h+Zxc
         ySVwJEHPEX8uXt6vXlEF85eT7BDsnGv+e4/DdR2DngV4lcwxBpoEhPDIDyJjWigc6yVt
         34CQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Dwxc/Nop";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k68si8898351ywf.288.2019.02.12.13.47.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Feb 2019 13:47:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Dwxc/Nop";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:46539 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtfuH-00051G-1Y
	for alex.bennee@linaro.org; Tue, 12 Feb 2019 16:47:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40096)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtfrO-0003SD-Iu
	for qemu-devel@nongnu.org; Tue, 12 Feb 2019 16:44:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtfrN-0001U7-Q5
	for qemu-devel@nongnu.org; Tue, 12 Feb 2019 16:44:58 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:42548)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gtfrN-0001Sb-Hu
	for qemu-devel@nongnu.org; Tue, 12 Feb 2019 16:44:57 -0500
Received: by mail-pl1-x644.google.com with SMTP id s1so86204plp.9
	for <qemu-devel@nongnu.org>; Tue, 12 Feb 2019 13:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ZjaZ1MwWyAo+oxIOGP9mXLvkSbxno/qUglkI3HQRDu8=;
	b=Dwxc/NopwDMB6gRqbqehDXvyDlYM0rBV4DIRH7CYnTiEQmTRjzjAKBWsteVXEIHP4x
	bcl/hLyMZotwvpT4X7Tr+Kgy+9HiGdvz7COsW9Juis5agS4lzwpWln6u/BIK3bCAe54i
	OBBcQ1Y5ocLmKg6K7D3q5siVJajkTjIsHLnGuYgQ9iDo6suh6uT9upV+flU10fGK/J48
	zQrpVBc8MxTWHflq6t0ybjQ0UjDKC62KMIk1FanbNUwfixnp9Ft+SyNUcuf/uMg+nXUm
	q4djdnxSgJwW3L8avyfD1QKLrH+1JtP3IjOgGH4cs0+24oN+P/NcB2ZaAkSrWDOCBGXc
	8bEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ZjaZ1MwWyAo+oxIOGP9mXLvkSbxno/qUglkI3HQRDu8=;
	b=ew5CA/zP02uHXU7+gnbchDXwjcInfXmJBsJG7J8DHkcrqE5Kkqu/LZE6CZtZfOSN8G
	Womw1sp7wC4A4eZq4kNNRFiGmOMpti0tlux4fb0YI3gMizrUnWcZMxWhegBIB7lbTTA4
	7fHOLrlMDsBiTH35aEj7bZ2ePq8RyjDCaqW2yal/tlgzidmJvnp0mmr0NDw3HEtNyy28
	DRHRmYGT7NyyE9sXXHSIUk9e7a/ftsrK3x0wVMpmieNspPVoN8GBNsTHhDuT5USMOfu2
	vQLf8YaCebx49zWpbXIzqWyUCN4+p/jl5Swyooi3Au5UyblcuSFHSf5vTzEitF7C1Ntk
	9wmg==
X-Gm-Message-State: AHQUAuYBVRYqyC+o4pmPVwEO56IpuImLRsYhi7Or/ERg5siAyN2XmqyS
	bzGm357iqKKNk02Y+tt50Oyq4A==
X-Received: by 2002:a17:902:c05:: with SMTP id 5mr6162998pls.155.1550007896164;
	Tue, 12 Feb 2019 13:44:56 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	s14sm9471056pfe.171.2019.02.12.13.44.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Feb 2019 13:44:55 -0800 (PST)
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20190212074840.13542-1-richard.henderson@linaro.org>
	<20190212074840.13542-2-richard.henderson@linaro.org>
	<dc08d748-eb29-ccb1-ae1b-62b7ad0d6ffd@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <0629643f-66bf-8373-14d8-32ede95938ce@linaro.org>
Date: Tue, 12 Feb 2019 13:44:53 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <dc08d748-eb29-ccb1-ae1b-62b7ad0d6ffd@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: Re: [Qemu-devel] [PATCH v2 1/2] linux-user: Add ELF_PLATFORM for arm
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4FEvg8KLy85E

On 2/12/19 12:31 AM, Laurent Vivier wrote:
> I know nothing about ARM, but in kernel we have also a "v5t"
> (cpu_elf_name) and in QEMU we have a ARM_FEATURE_V4T which is set with
> ARM_FEATURE_V5. Is it related?

>>From the ARM ARM (DDI 0406C, page A1-30):

The valid variants of ARMv4, ARMv5, and ARMv6 are as follows:
ARMv4, ARMv4T, ARMv5T, ARMv5TE, ARMv5TEJ, ARMv6, ARMv6K, ARMv6T2

So all v5 are "t".  The use of "v5t" within the kernel seems to be an outlier
and perhaps a bug to be squashed:

$ grep -r cpu_elf_name . | grep v5
./mm/proc-xsc3.S:	string	cpu_elf_name, "v5"
./mm/proc-arm1020.S:	string	cpu_elf_name, "v5"
./mm/proc-arm946.S:	string	cpu_elf_name, "v5t"
./mm/proc-arm1020e.S:	string	cpu_elf_name, "v5"
./mm/proc-arm1022.S:	string	cpu_elf_name, "v5"
./mm/proc-feroceon.S:	string	cpu_elf_name, "v5"
./mm/proc-xscale.S:	string	cpu_elf_name, "v5"
./mm/proc-mohawk.S:	string	cpu_elf_name, "v5"
./mm/proc-arm926.S:	string	cpu_elf_name, "v5"
./mm/proc-arm1026.S:	string	cpu_elf_name, "v5"


r~
