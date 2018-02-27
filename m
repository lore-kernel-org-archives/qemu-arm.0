Received: by 10.28.71.27 with SMTP id u27csp5269971wma;
        Tue, 27 Feb 2018 13:12:15 -0800 (PST)
X-Google-Smtp-Source: AH8x224khwW+usdjUze0foEkBrXB/misgqDvz/TefvZE3HRDTc/IDeW8mHVXtwKekuvWZjSO9g5h
X-Received: by 10.129.73.133 with SMTP id w127mr10401770ywa.320.1519765935347;
        Tue, 27 Feb 2018 13:12:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519765935; cv=none;
        d=google.com; s=arc-20160816;
        b=04UTmHVK0sbsukdPeuJ4hNJZyZeOPrU8clTkwuA5xAbWtpStgEK2uRuRTQSVbWupcr
         s5gklSyIHW/+7dVx3mhSzl93Ov+VSdN4tolmgtu/vz76JavSoqYCy0goxqaIYxMXqJJh
         Gb39p68E7cIBKKKuYB5vjuc6uoVULKkYIXBvnXCXzO8jSNUGdQEtkv0sbvWZPKY3z//Q
         iVrwjg5f9p4U3HYqqHlDyg0sxMQN8zikxoxGdUsAs8btrGr8B9SKdlv3Ca6uCAk99PZW
         xZdPP8XC8t/dOdQAspeErzYoAjAk2jv9xjrykJixTasEuEz2ZuiUEtvRWGhjTL1SvbtX
         wtdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=RDGxQA2ioBWtJIx9yMAtf4VNpic5xyz71cmpLBwbZ/s=;
        b=Y+EoT12HiuT0C2wzDO7G67jhfF5MRM5euld7oo7tVsMwyrKfTaIGTRRo+b+UvVIWCx
         QFdJY4vQOxgX5sFMGDn1PdJEW2TNbGmwh8j2MPnmWVEewy1be/2O1VTvrGzBHRb3mo7/
         Nr1KqJs0orsLwRzVazC8aaBmFF1D60/Eg3n3zvQWJ+qtMpcQyEP/JLtHTQ/82KhU8gkp
         IpL2IXTILhOjnufd/PSuhyCZtlAZPlWSSIbIsPf8FGyrYJweyr+eHSHzh0uQD6C9W4qC
         tUgVbcra/rIQdzrO3WVUnKpq41Q6p/DXu4j6gcvZd1mpcUVwbuiSjT7+fLfZg9HDL9om
         A25Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eEg8CQKU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l12si11902ywi.509.2018.02.27.13.12.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 13:12:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eEg8CQKU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40132 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqmXm-0001wo-Oj
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 16:12:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58797)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eqmXa-0001wN-Pa
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 16:12:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eqmXW-0001sS-SR
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 16:12:02 -0500
Received: from mail-pl0-x22e.google.com ([2607:f8b0:400e:c01::22e]:39346)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eqmXW-0001sH-LO
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 16:11:58 -0500
Received: by mail-pl0-x22e.google.com with SMTP id s13-v6so145422plq.6
	for <qemu-arm@nongnu.org>; Tue, 27 Feb 2018 13:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=RDGxQA2ioBWtJIx9yMAtf4VNpic5xyz71cmpLBwbZ/s=;
	b=eEg8CQKUHDZiSptf/su13RgjMlqS7tvsN97fGpY4bu1LJv5FKnV90mCGA8Q4EPksUk
	EaD94f2t/Lt4KxxfPR/ANIhp+Ss10v+K0whK3AH4uUcEtqsbBH7SKzIUeDt/ZIjAzS1X
	Hbu23qb4dONdf0uLTRv1pd/+y2mjlZPP3C4l0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=RDGxQA2ioBWtJIx9yMAtf4VNpic5xyz71cmpLBwbZ/s=;
	b=XqoiHkYOMJZnJtVzHq5CaacvQeSlLL9tVlYL4ezZsbSu6czrsolQM0jPArnD/g0f63
	Ij/z6fdZe/2xAtVMW64s6oAZCo98I1rFQ0FFeyMb3cLbuksFqK1IaJl6aWFP0KdF1LlW
	lbYs51Fmn8y/Q2oiTWvurzOwE6r2DOWx/KxjZGJdsayfhrV7owBMGyGpariKgiyzJSgr
	0hz9zgSs8Yh5gB0g9Ahsfo+YwTp6sQuw9jNazdYhh55fulEor8ZvR7OMfbywossFUehk
	M0jJKzUp6T42EYyrUYUyd5UdOy1stAr+z0ONAN3OawxQIb5W473fCnjk3QRw/zzUPJyb
	Znaw==
X-Gm-Message-State: APf1xPDuLCOpES7oYrr4weygUoCnMoRl6DQzb4VksaGcrKVad/9ZItOP
	zV0C0Nnd/DBvhLJpNZSov8J66g==
X-Received: by 2002:a17:902:8605:: with SMTP id
	f5-v6mr15255401plo.120.1519765917518; 
	Tue, 27 Feb 2018 13:11:57 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net.
	[97.113.169.147])
	by smtp.gmail.com with ESMTPSA id t11sm52974pgn.49.2018.02.27.13.11.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Feb 2018 13:11:56 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180220180325.29818-1-peter.maydell@linaro.org>
	<20180220180325.29818-14-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a15143ec-080a-a9d5-c7cf-547d7d98e5fa@linaro.org>
Date: Tue, 27 Feb 2018 13:11:54 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180220180325.29818-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::22e
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 13/19] hw/misc/mps2-fpgaio: FPGA
 control block for MPS2 AN505
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
X-TUID: kQ9Ape+d3B4j

On 02/20/2018 10:03 AM, Peter Maydell wrote:
> The MPS2 AN505 FPGA image includes a "FPGA control block"
> which is a small set of registers handling LEDs, buttons
> and some counters.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/misc/Makefile.objs           |   1 +
>  include/hw/misc/mps2-fpgaio.h   |  43 ++++++++++
>  hw/misc/mps2-fpgaio.c           | 176 ++++++++++++++++++++++++++++++++++++++++
>  default-configs/arm-softmmu.mak |   1 +
>  hw/misc/trace-events            |   6 ++
>  5 files changed, 227 insertions(+)
>  create mode 100644 include/hw/misc/mps2-fpgaio.h
>  create mode 100644 hw/misc/mps2-fpgaio.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

