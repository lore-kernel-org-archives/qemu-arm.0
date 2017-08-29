Received: by 10.223.188.70 with SMTP id a6csp6164942wrh;
        Tue, 29 Aug 2017 09:04:11 -0700 (PDT)
X-Received: by 10.200.1.207 with SMTP id b15mr6772933qtg.30.1504022651501;
        Tue, 29 Aug 2017 09:04:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504022651; cv=none;
        d=google.com; s=arc-20160816;
        b=NnUYfWt3Hm9+gOn1t7E4pbOY7LGM9HWKnlUkuipvQEdq6qScnBhg+hJQ3S67Gne4dZ
         cc0FdTYUdKPwQDQPipdkLKuugFKZIy+70QYYghAblRyOrtrMDw0rVOCvUoohFU26kTQd
         nQ+Fpgn3WL2PZzH0Hd/YBKf1U8R8DBfXyK1c8eozdSEPCWnUY+hWUBQRvVbu1UZlFdO5
         8emkfmR3jxYSqU5OiJhNHdPnBSlTRU8P9gUI3UkfC47ux5LH6Znwsw3IKISMycGWLVx1
         xcOMqwdL+p0PeDKkcMrIPEXSEeL6w0JtC6wG8hVpxXYYIgKMpo4JVQFQ71xzQMh8kXWE
         88AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=K7+1rq8/s+I2NsIQD4gjg5EPOvjiD2MdJrw85QxbauI=;
        b=FJ5sznKLQZT62rw7aLAuAocIhINGjhtXlLcZeOPlf1c5fpO2Lq19T4pouDaVA9UcbF
         ISAvDYkpSqV3g2iL4SI1YvA4pDEob9uWGbNMGxFmLbHop9S5QB1ZoT1ljhuY2t8Qd0j3
         Rj+pXvuStXTPsAZGUsp17zyqx1kfpqdWH4zNrIetlXCEEdG6JQ+FRcePQGFO1aKFbqbi
         jgCAn5O/Al0nb1sPZOenyUpzDXUNBhVDhEWRIW+6sF31LAK6sWACXxVAoiCbbmQS/L9Y
         C1KVXW5/CrIpCRgerWLNFmlCEDWwIVZunbjsG8zhC/+MPzhKnfZPnIRY29LSYoF/giS2
         UA3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GsNiOt7g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s8si3031263qte.489.2017.08.29.09.04.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Aug 2017 09:04:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GsNiOt7g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45791 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dmizo-0006tn-Um
	for alex.bennee@linaro.org; Tue, 29 Aug 2017 12:04:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57353)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dmiwA-0003sG-B9
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 12:00:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dmiw4-0007Rf-OU
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 12:00:22 -0400
Received: from mail-pf0-x22e.google.com ([2607:f8b0:400e:c00::22e]:35944)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dmiw4-0007QM-Ja
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 12:00:16 -0400
Received: by mail-pf0-x22e.google.com with SMTP id z87so11403707pfi.3
	for <qemu-arm@nongnu.org>; Tue, 29 Aug 2017 09:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=K7+1rq8/s+I2NsIQD4gjg5EPOvjiD2MdJrw85QxbauI=;
	b=GsNiOt7gazJd5tyoO12YpufqEw9Y0mwZgrIerbvk+Qe7DJ9N8+rBKj8O1O7Ui0MIH9
	EYdOIg9nUjpcaEkzQtAsjew3Xid8C8Yr8xua4jgfipp5lLotb1O0HOCV8FaodCPaEw11
	KCiQQddmJun/pYG3rsLlGqFmXNY9OjjfFa29U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=K7+1rq8/s+I2NsIQD4gjg5EPOvjiD2MdJrw85QxbauI=;
	b=EOsIOaC+QfMHtl2Qe1qE5w49HkRzGvRb4UVgIJ8FQ01KxIj4jCKwE2/o+5eyvETqib
	wTaIpk0VsqEXYsgLZDKeimDLtKiJflHsH5jC/ZARz7/SiXHJMBIwLwKxAUy6MXMLpRf2
	7s8BBQSb7n9xFaWZW2PdAIDdl7qG0ndBQ5Oq1Ql0j/ZhLX/qeCbCyICKNrEK7MXsgnGd
	0HoW45CBQuLmgzrO42htSoZJ27HXrqGAnsux+U2OGO2QeZI1EYFBBiWxWr2RUzRRF8ys
	YrwZkT6m73zAlMBNNcPZaR4G2w78QMM3tT02WeI0iqahp9s3L/p+S2OgVoAzBBkClIKR
	aLNA==
X-Gm-Message-State: AHYfb5iqTaN0YcEJskW3aVCFkYJy5rRQaK1vwPF4BXOjFgIZINIoFB6h
	pJI7o/E6xBTnl43d
X-Received: by 10.98.214.203 with SMTP id a72mr803097pfl.123.1504022415272;
	Tue, 29 Aug 2017 09:00:15 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net.
	[97.126.108.236]) by smtp.gmail.com with ESMTPSA id
	y124sm5448240pfy.116.2017.08.29.09.00.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Aug 2017 09:00:13 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
	<1503414539-28762-11-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b59d3474-15e4-7f01-d4d7-8ca0fcfef6b5@linaro.org>
Date: Tue, 29 Aug 2017 09:00:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1503414539-28762-11-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::22e
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 10/20] nvic: Add NS alias SCS
 region
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
X-TUID: 5e0IOtfC2L3o

On 08/22/2017 08:08 AM, Peter Maydell wrote:
> +    regionlen = arm_feature(&s->cpu->env, ARM_FEATURE_V8) ? 0x21000 : 0x1000;
> +    memory_region_init(&s->container, OBJECT(s), "nvic", regionlen);
>      /* The system register region goes at the bottom of the priority
>       * stack as it covers the whole page.
>       */
> @@ -1185,6 +1242,13 @@ static void armv7m_nvic_realize(DeviceState *dev, Error **errp)
>                                          sysbus_mmio_get_region(systick_sbd, 0),
>                                          1);
>  
> +    if (arm_feature(&s->cpu->env, ARM_FEATURE_V8)) {
> +        memory_region_init_io(&s->sysreg_ns_mem, OBJECT(s),
> +                              &nvic_sysreg_ns_ops, s,
> +                              "nvic_sysregs_ns", 0x1000);
> +        memory_region_add_subregion(&s->container, 0x20000, &s->sysreg_ns_mem);

There's a whole in between the two regions, which you are leaving mapped.  Why
create a sub-region instead of two separate top-level regions for which you can
leave the whole unmapped?


r~
