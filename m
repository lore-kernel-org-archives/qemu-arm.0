Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp3877712wrq;
        Mon, 25 Jun 2018 07:29:39 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdtyIF48AtAT7/n3hmQdIf7o9lk0MH9xs3WMzZiJRMTexugx4u5tDui65gDfjKB9Gs5PXbS
X-Received: by 2002:a0c:bc03:: with SMTP id j3-v6mr2198746qvg.201.1529936979084;
        Mon, 25 Jun 2018 07:29:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529936979; cv=none;
        d=google.com; s=arc-20160816;
        b=qfCtYgK97BI1JOBz4o7T7obXP/1l/UXSvgzUxYMJ5gtX7CBj65OwbMtnMs5z/sp8KO
         JSUBM7a0J8gbeL8Ewd93EETEw4QlFSw3KZioKETfiSlVFxVrr52vQMbf1JKlmwHIco6/
         Nxd1R51mKfEAjXimWMClWgH16nBeu5d2BFt9nXJO1sIhsVmdLfpeUtA4hpc3cBvf0sz9
         bN1WBlNxNB6roEjj2T1zQe7C0zFQogxQ6EdaxvOYh9CJOPGS7G1nxV1CAeABfPciJgBf
         pyVPW17uQWnJWr5UptW/Hx1Se/BeIwzt1T3QieG0oYLN6R0LJThtHBdPNqI/sRKR5PQE
         z9wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=yUVrlLWzIKFaki7Wu7JvE5LWLETA1G+Q3Aa4/Gap1zs=;
        b=PMgPt+40xlZkoYsP3VaYMsiyqSmUQLH85tteWFEseZhtH12uclh91apvHVpevQfOEr
         LUah/P7xufs04FgkDdRVVM3DEuBdsKFW/ZtEpPlhvGy048m5JkucQF68tIFWGW0e5a9t
         gjL0GHQxG8ApClp7iwnoV6b8EiWcyYQ0onEcqsrlQ8w+Zgo2n9oWz8mU1pBt5FqYiW1m
         QD1Zz0NA5wUTCZdRPdWXkl5udcEryHYhIx94mkVIQ6yL7ZmiHcwYm89NDOZV2R5Cowyv
         4YSnyxKeHNdjOy0TlGMQIJ8E/O+1NiLpozdQxH+YJsaRlDUuxsdNm23a6nnQImOuGDhd
         09Sg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QOiQzBYK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o90-v6si597189qva.172.2018.06.25.07.29.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Jun 2018 07:29:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QOiQzBYK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47475 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fXSUs-0002ws-C2
	for alex.bennee@linaro.org; Mon, 25 Jun 2018 10:29:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55834)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fXSUh-0002vb-5t
	for qemu-arm@nongnu.org; Mon, 25 Jun 2018 10:29:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fXSUg-0002jn-D4
	for qemu-arm@nongnu.org; Mon, 25 Jun 2018 10:29:27 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:40191)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fXSUf-0002jF-UZ
	for qemu-arm@nongnu.org; Mon, 25 Jun 2018 10:29:26 -0400
Received: by mail-oi0-x242.google.com with SMTP id f79-v6so12672492oib.7
	for <qemu-arm@nongnu.org>; Mon, 25 Jun 2018 07:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yUVrlLWzIKFaki7Wu7JvE5LWLETA1G+Q3Aa4/Gap1zs=;
	b=QOiQzBYKIGWB74Vtm2DZzTr9uibiyXcWSowtszLKKoCXw55PcXH+uAkGFYGrgHeYny
	pw6GR1mTrTSLUaBReodQtrWZ5PwFynAPvI0slzAB10B2/ZmDbAsY91AYPE4a/vJwX0i7
	OXcdn6N0rU3H3zlgaLrxN68CGl+ab1uRWDsH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yUVrlLWzIKFaki7Wu7JvE5LWLETA1G+Q3Aa4/Gap1zs=;
	b=Dko9a0+QbEnnrnK12wanRCf/mmD/6bNypqIw8oVRsCZGlV9RiRrlJb+wVdwDH173uB
	6bSfSqJr43oBL6xe4tWd+6c23ajBG/fVYQpZPYjm19FqNR/oiUy3iSIoWzrSbMuN73NG
	3QGMINC19xshmUjzhzo03MS1hhgdcrdO+1VmMJZuQgLPk4V6rMWubC7CY1gN4r0FFKX7
	kEVVsWiys6NRIDu+M1xzCpoyF71KQ9O/NtR60miSOrWkcwN8GxarwnkIxAYb2XMQkq0X
	x3kBIKPSqCJaFHfFGG//1KAIr7DLb/0/DdyS0LdJ4DgWlNGMuq57IIZYpp512ogAPa1+
	eaXw==
X-Gm-Message-State: APt69E2JjtKpcqUTnXKlYS28KWqbzsrr5DR45bPdrWqQshbSMillG6Xf
	q2TNkikvUrGwZPDH6Xeni/u6CopSEafchUADRxIIEw==
X-Received: by 2002:aca:f10b:: with SMTP id
	p11-v6mr7454884oih.80.1529936965148; 
	Mon, 25 Jun 2018 07:29:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Mon, 25 Jun 2018 07:29:04
	-0700 (PDT)
In-Reply-To: <20180619093124.24011-8-luc.michel@greensocs.com>
References: <20180619093124.24011-1-luc.michel@greensocs.com>
	<20180619093124.24011-8-luc.michel@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Jun 2018 15:29:04 +0100
Message-ID: <CAFEAcA-3_6axe2Bvx5zehGvVYs_egiUZyh_e56P7Lkh927OzaQ@mail.gmail.com>
To: Luc Michel <luc.michel@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [PATCH v2 7/7] xlnx-zynqmp: Improve GIC wiring and
 MMIO mapping
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
X-TUID: qwnVlsaXDwIk

On 19 June 2018 at 10:31,  <luc.michel@greensocs.com> wrote:
> From: Luc MICHEL <luc.michel@greensocs.com>
>
> This commit improve the way the GIC is realized and connected in the
> ZynqMP SoC. The security extensions are enabled only if requested in the
> machine state. The same goes for the virtualization extensions.
>
> All the GIC to APU CPU(s) IRQ lines are now connected, including FIQ,
> vIRQ and vFIQ. The missing CPU to GIC timers IRQ connections are also
> added (HYP and SEC timers).
>
> The GIC maintenance IRQs are back-wired to the correct GIC PPIs.
>
> Finally, the MMIO mappings are reworked to take into account the ZynqMP
> specificities. the GIC (v)CPU interface is aliased 16 times:
>   * for the firsts 0x1000 bytes from 0xf9010000 to 0xf901f000
>   * for the seconds 0x1000 bytes from 0xf9020000 to 0xf902f000
> Mappings of the virtual interface and virtual CPU interface are mapped
> only when virtualization extensions are requested. The
> XlnxZynqMPGICRegion struct has been enhanced to be able to catch all
> this information.
>
> Signed-off-by: Luc MICHEL <luc.michel@greensocs.com>
> ---
>  hw/arm/xlnx-zynqmp.c         | 92 ++++++++++++++++++++++++++++++++----
>  include/hw/arm/xlnx-zynqmp.h |  4 +-
>  2 files changed, 86 insertions(+), 10 deletions(-)

Nothing obviously wrong-looking in here; a review from one of
the Xilinx folk would be good.

thanks
-- PMM
