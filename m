Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2726437wru;
        Tue, 17 Jul 2018 07:20:42 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfUapyLD0LvuMf+jz5WF6MZe2oEBhcnxAdRgx2HZ9lfEgKAFJ93BqckPBDrV3Fl+Eh89svo
X-Received: by 2002:a37:b446:: with SMTP id d67-v6mr1621058qkf.104.1531837242450;
        Tue, 17 Jul 2018 07:20:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531837242; cv=none;
        d=google.com; s=arc-20160816;
        b=hRkuQqV0cGQLKC7EN492XT2f8kIRuPapN/fC2JGnzyfJdJOwUJuIugq4vAlVcPLRvF
         l2SHHpZzU/TXUQMHkaiNxTZH4Uc2c0iTULn1dcmv7iUWCjdY43B/+tQYOzMStiTgM+IO
         uF55iIbCUpuNte3TIFghG2zYhONWR1nFkLUnZbQT2iEgNItqIO8fZTZu6mgFWN25hauH
         wtept3O1Rge2cvQK15VTaMs75Y9auP3Hr/YzekqT476gCi2lFK3To6LB/LLhh5j2R0Y4
         DgQ2cEVBK5DFVN5vV5H66SbQO+HpwH9fKoPrGtc7C9nTkkeeNZkmrKZGAwL/A7Ym9CVA
         VWzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=qzzP5k34gRestpVjVEPxLmCqpdjk0/+iS0L0koQWT9M=;
        b=Kb2LWyAlAQcadlZ9kXGtgYSLDNHouhX6j/UhOcLTNJ7GzIaS5UkLTP5xqgFdPEsVop
         uktdCewlJRLBHdbS+HQ2P89QdzmaqrDuG1o9R2OhJdoFVBzZBPeuDwSw8Qvg5diT7QKe
         uK2IeHxC9fPEtTyxOoHFbZSflWL2PvwOHvm+RGx9XbaCo1K6c52ZIZaakxp4BBKDI+e/
         z+d4QqovWxWQUY3U2+AgWd2qT7Q+6RmRCSqxdlB6/AyH00Kqag/qjzmjOLGwMEY8P1RJ
         mCa0WVWkW/Zhq5Aj7bQapQ1uXYRagPWDAj2C87CpRi75M/qOSASmr93G1N9fOLaNFlBq
         9HKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=K0Ul3qzJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c27-v6si983002qta.193.2018.07.17.07.20.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Jul 2018 07:20:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=K0Ul3qzJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59638 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ffQqF-0000UQ-1n
	for alex.bennee@linaro.org; Tue, 17 Jul 2018 10:20:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33645)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ffQq4-0000U9-Pp
	for qemu-arm@nongnu.org; Tue, 17 Jul 2018 10:20:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ffQq3-0005yR-Ma
	for qemu-arm@nongnu.org; Tue, 17 Jul 2018 10:20:28 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:44082)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ffQq3-0005xe-Iw
	for qemu-arm@nongnu.org; Tue, 17 Jul 2018 10:20:27 -0400
Received: by mail-oi0-x243.google.com with SMTP id s198-v6so2306820oih.11
	for <qemu-arm@nongnu.org>; Tue, 17 Jul 2018 07:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qzzP5k34gRestpVjVEPxLmCqpdjk0/+iS0L0koQWT9M=;
	b=K0Ul3qzJPTw/VhLXMLMN0anCKdrjknziDdvD9+pdaXtpLGHEjqQytTObS5p9WYNfvF
	TBlb2jQvn6BgkmBJoTsa88q/rdSU1JRyLfpl3gPjRA+FOkwm/nmoq1mKYMSQR65IKfH1
	eJECDLRuy5Rfa29gjBWboGIAXGPfALO8FwiwQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qzzP5k34gRestpVjVEPxLmCqpdjk0/+iS0L0koQWT9M=;
	b=QHYhQba3baW7A/4GIT6zEYyD7kUmeItr9xGeyLP/ZcPIFVgnVxm418DC0gG+vpjbvD
	o2UKqagHQXDI5Z80QkMSsznvoXPh3Q8/hEmKz594CwV4JVstOIIuvlo4p3OMN0+GKHZz
	tN1bXKSHIhHjChzmBZLWqrg8ssjiAltrq4ZgHkm2EI0ox9cIJRDHHrA6g/BaK9hdIgoG
	2Mh15Ky5Tonae/ML/RVnSS8olc0s7pRqrx+QTHUoP3XdT8/wg8h6Zq3FrZgFwLwMj1c6
	gkCWZUKgObZMeu9CsSKWs37Q/aa5sVZvVc1UVRQV0h9Fy2SKm/ZERhgdt8+ttzutbVij
	ZLjg==
X-Gm-Message-State: AOUpUlEgeZphDQg0cFEqxodUvjKzWfCtpvfs8xnayCb1AyOeboTlmI2W
	fj75/Tf0qOMvUioodvQwORTvf4Z6kErTQ+blBLFDnA==
X-Received: by 2002:aca:f5d1:: with SMTP id
	t200-v6mr1942589oih.12.1531837226935; 
	Tue, 17 Jul 2018 07:20:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Tue, 17 Jul 2018 07:20:06
	-0700 (PDT)
In-Reply-To: <20180714171601.5734-10-luc.michel@greensocs.com>
References: <20180714171601.5734-1-luc.michel@greensocs.com>
	<20180714171601.5734-10-luc.michel@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Jul 2018 15:20:06 +0100
Message-ID: <CAFEAcA_sg9XpTXT5HJQ4yf9GTbcMY_ShZYQUXK_1qYgzEdUtWQ@mail.gmail.com>
To: Luc Michel <luc.michel@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [PATCH v4 09/20] intc/arm_gic: Add virtualization
 enabled IRQ helper functions
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
Cc: Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NCLnxPfWGA37

On 14 July 2018 at 18:15, Luc Michel <luc.michel@greensocs.com> wrote:
> Add some helper functions to gic_internal.h to get or change the state
> of an IRQ. When the current CPU is not a vCPU, the call is forwarded to
> the GIC distributor. Otherwise, it acts on the list register matching
> the IRQ in the current CPU virtual interface.
>
> gic_clear_active can have a side effect on the distributor, even in the
> vCPU case, when the correponding LR has the HW field set.
>
> Use those functions in the CPU interface code path to prepare for the
> vCPU interface implementation.
>
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
