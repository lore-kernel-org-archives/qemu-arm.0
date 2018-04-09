Received: by 10.28.71.155 with SMTP id m27csp2717602wmi;
        Mon, 9 Apr 2018 08:57:38 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/ECX3N+R1Bc2lydoiPkmKD3A3Dn1ys9dlg82hcQy0W4dtxp+gvrL+qwjLWjYhtR0Ax1blh
X-Received: by 10.237.43.130 with SMTP id e2mr1811897qtd.272.1523289458744;
        Mon, 09 Apr 2018 08:57:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523289458; cv=none;
        d=google.com; s=arc-20160816;
        b=RDSWcSKm8hloNi9pANeoHM0gODBEpHXLkD+doDZ692WJWzxmgo75jOL+g9PZo4rL8H
         ED9JC/EuNLZsSsuroQeOpPC8AF6fCz8vimETK/OHgJ9cby6dmEosMjmuoDaf1n51sFRb
         uosgLFWVrG8+AjW7rCqm0ku+ypnPqs4uYS2QJeEjWee17Fi8kkDxOfxUBUVNk+G+qFPV
         MZo6KRGii3RPVk1lht+Dsuo2NOzmVwouNX2/FR9jc8cNlba1ST+h7rbkzmgJhvSH/aah
         GExR9+/yzTCtEPVa7/aobdK8nz/44Rd+AWsyJH1aBz8Ab+eFCbCSM/Pje55ml/zBEKJd
         vIMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=UbflTHuerlWgb2GE5j9fsJkh/f1yFu3eKZGUQiscqNQ=;
        b=tI/6gb1WFMvHHOWETvizl4wOTcfyHZssDGC8o5pvhdZ7BApdEvlCJp5ge9BAj7+ccC
         jwALqPG/qBh1UzRLOOLsPc0729vTh2Osdq8pkyfV+xTAd/CGzalsiX2AI0c3qmakbSDu
         yNbrMlEZlL882pca2obgmQcPk1UsejZei4kWgeq+Aa20BUYSz32jBEqNogQ0WV3A4Z2l
         SEuPxTSuWKyiNxTHGaWmX+0wlaluJwJdUb4esads9Rs75RZQGlWvR5t4z3U9v+jI1JiT
         D0nbPm60DYrD2tclWupJBN++H6XP+oxPWylZJ25LbF/lkpUCPajhhH5I2LIhnIrd1MCB
         XADw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LWCB/zO/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 11si763975qtt.76.2018.04.09.08.57.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Apr 2018 08:57:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LWCB/zO/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48350 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f5ZAo-00072g-0g
	for alex.bennee@linaro.org; Mon, 09 Apr 2018 11:57:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43880)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f5Z9P-00060N-Sh
	for qemu-arm@nongnu.org; Mon, 09 Apr 2018 11:56:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f5Z9O-0001HL-Vf
	for qemu-arm@nongnu.org; Mon, 09 Apr 2018 11:56:11 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:41389)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f5Z9O-0001Gz-Pj
	for qemu-arm@nongnu.org; Mon, 09 Apr 2018 11:56:10 -0400
Received: by mail-oi0-x243.google.com with SMTP id 188-v6so8099753oih.8
	for <qemu-arm@nongnu.org>; Mon, 09 Apr 2018 08:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UbflTHuerlWgb2GE5j9fsJkh/f1yFu3eKZGUQiscqNQ=;
	b=LWCB/zO/UzuROICbeLVFboJViz/sOXxlkdJt4W7m36tu72mhXlT/lVjfMBEhSvY7IP
	RB0uPamK101Kad36Wqdi9rdYfMeZWp8Y5OGJDYf+nWKZOEUtD7eN9rd/7ohJ3YBTo6lt
	NpWmR5QQlFukXdnG8YDCz6E39h+1Uk7fNMqeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UbflTHuerlWgb2GE5j9fsJkh/f1yFu3eKZGUQiscqNQ=;
	b=qp0PR+MPYTG8LUYuyoLWHaatJzP6hq8Pg8HmF4/sv7S4PITpkdzaTdnMfi8oqsq4Dr
	m2oaRl15onQsjImils8vLPfQezuB7sFQ09yBgwqK7819AaE8JeAwP/LM89LbpMdeKlXt
	cAu/KzUZeVZ+Q3cG6TFI82JXcoiMj2WsEK2sJgNIZjFlUOUQTgQZwqQRnOmXV7Cdufqk
	tSnZDaSD71wWOd5hWnMGAFA4Ji7W3nE5DPD1pqlne+sUoka14ctPRsX9vun+6dEIi/Hr
	cuPtdXV7FBvPTFSpRIXQI2g6eB7At3aFMLXNEDb/lc7unowqnqmk6vv8KEyis0iehXlj
	AjeQ==
X-Gm-Message-State: ALQs6tC0vNPcsjbsjKDunWCmtCZVTXKmvGMsZqBo29xFZub+E5Jz3JUv
	Hni3LoXXLkTiNsFJ6oPIrHXBtJU4DCHRSqiByDWUDg==
X-Received: by 2002:aca:e043:: with SMTP id
	x64-v6mr21241527oig.164.1523289369982; 
	Mon, 09 Apr 2018 08:56:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP;
	Mon, 9 Apr 2018 08:55:49 -0700 (PDT)
In-Reply-To: <20180409154921.29906-1-wei@redhat.com>
References: <20180409154921.29906-1-wei@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Apr 2018 16:55:49 +0100
Message-ID: <CAFEAcA9Law6n+2bGwd4-VkAJ1HT10c0ZqHASmtLdHcTFV9YBHw@mail.gmail.com>
To: Wei Huang <wei@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [PATCH 1/1] mach-virt: Change default cpu and
 gic-version setting to "max"
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Andrea Bolognani <abologna@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KBR0ntUG/EvW

On 9 April 2018 at 16:49, Wei Huang <wei@redhat.com> wrote:
> Running mach-virt machine types (i.e. "-M virt") on different systems can
> result in various misleading warnings if -cpu and/or gic-version not specified.
> For KVM, this can be solved mostly by using "host" type. But the "host" type
> doesn't work for TCG. Compared with "host", the "max" type not only supports
> auto detection under KVM mode, but also works with TCG.
> So this patch set "max" as the default types for both -cpu and gic-version.

Using "max" will make the VM not migratable by default, and also
means that the behaviour might differ between host machines and
between different QEMU versions. I'm not sure we want that for the
default ?

> Signed-off-by: Wei Huang <wei@redhat.com>
> ---
>  hw/arm/virt.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 94dcb125d3..1a9d68b8d5 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1555,7 +1555,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>      mc->minimum_page_bits = 12;
>      mc->possible_cpu_arch_ids = virt_possible_cpu_arch_ids;
>      mc->cpu_index_to_instance_props = virt_cpu_index_to_props;
> -    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
> +    mc->default_cpu_type = ARM_CPU_TYPE_NAME("max");
>      mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
>  }
>
> @@ -1609,13 +1609,13 @@ static void virt_2_12_instance_init(Object *obj)
>                                      "Set on/off to enable/disable using "
>                                      "physical address space above 32 bits",
>                                      NULL);
> -    /* Default GIC type is v2 */
> -    vms->gic_version = 2;
> +    /* Default GIC type is max */
> +    vms->gic_version = -1;
>      object_property_add_str(obj, "gic-version", virt_get_gic_version,
>                          virt_set_gic_version, NULL);
>      object_property_set_description(obj, "gic-version",
> -                                    "Set GIC version. "
> -                                    "Valid values are 2, 3 and host", NULL);
> +                                    "Set GIC version. Valid values are 2, 3, "
> +                                    "host, and max", NULL);

This change in the help string is a bug fix not related to the
rest of the patch. You should send that as a separate patch,
because we want that regardless of what we do about the default
value.

thanks
-- PMM
