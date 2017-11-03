Received: by 10.223.150.237 with SMTP id u100csp165307wrb;
        Fri, 3 Nov 2017 11:56:25 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+Qc6/ehe39DrpaHVw8iNRGUz6rRJjsMwELA1sJHrL/Q0YETIaU9vT0eTgz0dyf9BZwR3DV2
X-Received: by 10.129.34.196 with SMTP id i187mr5330768ywi.487.1509735385214;
        Fri, 03 Nov 2017 11:56:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509735385; cv=none;
        d=google.com; s=arc-20160816;
        b=IuUpiTegdrEzkmwBFwf1A7A4ML/mkJLrs2enKyPEt+H91ntNBTfE8OGMNRtuaqIfH8
         xMEwfZ39oQQFfVZD05tV7HeM1+HlijjhPMDJDAUSTmym/mi/RanSo9kgCqkYg8JIb3RM
         0xR52+9tcFaDV0Y9p6t8q2fOVlBRQJkJa6SWq855xZxq93fyFRRpowf1qtAOuQLUizeP
         rjmmr3cJnw8uDlvG+oSU/E9ntFJV9PNKWxev/uuU1+xBs+wDl8FzbU+3OJfztu8gkIE6
         nAzwvjehLjH+FW3PNWPC/MZkUnyTE3CUG9r/3am9oVx0Ig3sISBr9tD79W8ELi+DKyme
         EyQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:dkim-signature:arc-authentication-results;
        bh=Ti16a4mXjd5BYWl5Dtllj1w4u+V1/hpw7YWsIjkyEwo=;
        b=kO0dWrgk7C4ehl/l2qZQDWrmOR6kuXe1w3q3bLgcWAIFbsGZCectdsHOAif03Mi729
         2Neswg/ZhgjV7CuzsDHPmqEZB32emvMl+tapsjuLsJD91Mp7IFoKgssSJ7EYSLbyhQFi
         M6kTjnMIG4bp2zJEx7qAaEU4EM9RBcMhlSwsw9vM+owVtVlG2qKoO20W78HR3Gp52GL+
         LnDGutJkDGNG3+qSFKzTzoCmOhrUSBBj3quAbaTr+Z/6ik9r5wzRRoD0RYp1h3/SDGXD
         t8V0DSt9OgVwn6VO2/aqxccqY2jhxgGN2UHvRekuUIXV2ZvMt9Cd7FLL98Ej27C9BV5s
         t7oA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=mUkV63D3;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=XXDlc7m2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 8si1570390yba.109.2017.11.03.11.56.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Nov 2017 11:56:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=mUkV63D3;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=XXDlc7m2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38073 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eAh8i-0003s8-Mi
	for alex.bennee@linaro.org; Fri, 03 Nov 2017 14:56:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59842)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1eAh8a-0003qh-IL
	for qemu-arm@nongnu.org; Fri, 03 Nov 2017 14:56:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1eAh8V-0005X1-OA
	for qemu-arm@nongnu.org; Fri, 03 Nov 2017 14:56:16 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:56567)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cota@braap.org>)
	id 1eAh8V-0005WS-I7; Fri, 03 Nov 2017 14:56:11 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id EF2F220AC5;
	Fri,  3 Nov 2017 14:56:10 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute4.internal (MEProxy); Fri, 03 Nov 2017 14:56:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
	mesmtp; bh=Ti16a4mXjd5BYWl5Dtllj1w4u+V1/hpw7YWsIjkyEwo=; b=mUkV6
	3D3YTLD/LWdL4DMntPUZ4KcUiCzhqHhD7Le0bzxn4KgHU/hHM4L5ujPKSkTWibIo
	gJxJj3cuxCqaOae6NhG4z15qgYv+zorXFSJOQyU/QaB71rp00qXf95Fh4sHU+BuO
	vO78PT/dhOevOhGV7g6VfrTtox13KdD2jwWW+4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; bh=Ti16a4mXjd5BYWl5Dtllj1w4u+V1/
	hpw7YWsIjkyEwo=; b=XXDlc7m2riBmviX7Q9nqyRIDkXnNdXzlNoLnz48Z3BZZP
	pi33ppC33WaBWaNRABr8MJ2bkPyUwyrh3I0ps60riNdsHq//gYieJ6GchKIdaZq8
	uU3UnO7xHFbEI9feRFo456Yk3O5zbL9GqGTZE63lhriIEh1mCPARRMsJqSv1ytzJ
	uC86Zj8OgDFUdN26MgP9LtiloCxOfeeUwl/+mtEOcuExwEu8MyvEKPXwWFMO3ymE
	FFe1AzG9tAXrgFte3Bo8h2dnpPr2AaDWSB4TYDmKgqLe/sblc5IYrMd0Og4jfrwz
	EsCllG8J20Ijx2TOHaJ6diTnIY5R07Un8+JkNylrg==
X-ME-Sender: <xms:yrv8Wa0sG0vrTXyRntjV2XxcaHEk4-rXlAyd1sKuSarJfE3mcy3O-w>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id BE7902489B;
	Fri,  3 Nov 2017 14:56:10 -0400 (EDT)
Date: Fri, 3 Nov 2017 14:56:10 -0400
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-devel@nongnu.org
Message-ID: <20171103185610.GA3907@flamenco>
References: <1509734853-3014-1-git-send-email-cota@braap.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1509734853-3014-1-git-send-email-cota@braap.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.28
Subject: Re: [Qemu-arm] [PATCH] hw: add .min_cpus and .default_cpus fields
 to machine_class
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org, Marcel Apfelbaum <marcel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Yofz2ToKEhdj

On Fri, Nov 03, 2017 at 14:47:33 -0400, Emilio G. Cota wrote:
> diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
> index e2d15a1..395d1b5 100644
> --- a/hw/arm/xlnx-zcu102.c
> +++ b/hw/arm/xlnx-zcu102.c
> @@ -185,6 +185,9 @@ static void xlnx_ep108_machine_class_init(ObjectClass *oc, void *data)
>      mc->block_default_type = IF_IDE;
>      mc->units_per_default_bus = 1;
>      mc->ignore_memory_transaction_failures = true;
> +    mc->max_cpus = XLNX_ZYNQMP_NUM_APU_CPUS + XLNX_ZYNQMP_NUM_RPU_CPUS;
> +    mc->min_cpus = XLNX_ZYNQMP_NUM_APU_CPUS;
> +    mc->default_cpus = XLNX_ZYNQMP_NUM_APU_CPUS;
>  }
>  
>  static const TypeInfo xlnx_ep108_machine_init_typeinfo = {
> @@ -241,6 +244,8 @@ static void xlnx_zcu102_machine_class_init(ObjectClass *oc, void *data)
>      mc->units_per_default_bus = 1;
>      mc->ignore_memory_transaction_failures = true;
>      mc->max_cpus = XLNX_ZYNQMP_NUM_APU_CPUS + XLNX_ZYNQMP_NUM_RPU_CPUS;
> +    mc->min_cpus = XLNX_ZYNQMP_NUM_APU_CPUS;
> +    mc->default_cpus = XLNX_ZYNQMP_NUM_APU_CPUS;
>  }

Should we update max_cpus to just NUM_APU_CPUS as well for these boards?
-smp 5 or 6 (NUM_APU + NUM_RPU) still gets us 4 vCPUs.

I see there's code for RPU cpus but it seems disabled at compile-time
at xlnx-zynqmp.c:431:
   DEFINE_PROP_BOOL("has_rpu", XlnxZynqMPState, has_rpu, false)
Or is there a run-time way to override this?

Thanks,

		Emilio
