Received: by 10.223.172.38 with SMTP id v35csp991736wrc;
        Thu, 14 Sep 2017 08:13:53 -0700 (PDT)
X-Received: by 10.237.36.146 with SMTP id t18mr4590644qtc.17.1505402033696;
        Thu, 14 Sep 2017 08:13:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505402033; cv=none;
        d=google.com; s=arc-20160816;
        b=XgcbtptJ5Mg4GBsV/e8w7RscYllMxFHo6AGVeR2Ire3YfXbfswAtnOA+vvvVKphMhm
         WO6CbdDjGKV8FaIGjg07DrQDr/RfNiQz4W5btmJ2nb96aexkUwc/DSedzXhYU+l64FDi
         r3KptHq0/ygQPLwh/SpeVDGTw1H71wuFSJn/RHlV5i8yHPjCEzccRLH4vEH9PIiXQ6Zo
         2dla8AA2R3NwTW8Ch/+947mE8ynQD7/2sbP0gBUJRh9CFdcknRKGvFBiNGV6qdOHa24D
         p5xbEnpwIf1pYvke37CndHJ9oXqDT735sed5xM//P17PvXwlXFjcEo6/BJddh6P0Z9mg
         27kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=MnBgq3dbvrhTaM3o+0EaLymk7Cx1qq06EqJiwTo02Lg=;
        b=lr4E6hAj/oIcFjlgCU/N9zoF7JDxo/r7iQeeaIEEvu41B+KpB4ohbgcUklwzZ3ngA3
         cnb8tVkAbNl7BGSlVN71wLcG+i4+erPIe4YA5A140N8qOXxCCUKVsLnqd1pCSoxudVj0
         SkPCPOivfqe2RxWY45w+hHo2RyEbAt8cAlfLeLdFY0pj2yIziqtd6NRJPrbJnbnwaijZ
         z1DHAa+GZa0TbMS82xGF00wo/DgeVtaV5JY5oZqBChYT6HZRXmztAIswT8m5Unklncj4
         NZbOPxxS14a3Ml30/iYVkxYVbKhB5ZzuTIeW4PodpidbZ3VLBClqIIjCxpWprrKAWHj5
         FDAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Rn7sKuhL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o42si18195845qta.496.2017.09.14.08.13.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Sep 2017 08:13:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Rn7sKuhL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48351 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dsVpv-0006sN-E8
	for alex.bennee@linaro.org; Thu, 14 Sep 2017 11:13:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32777)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dsVir-0007wB-Nb
	for qemu-arm@nongnu.org; Thu, 14 Sep 2017 11:06:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dsViq-0003Zl-Lr
	for qemu-arm@nongnu.org; Thu, 14 Sep 2017 11:06:33 -0400
Received: from mail-wr0-x22a.google.com ([2a00:1450:400c:c0c::22a]:56223)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dsViq-0003Ym-Fi
	for qemu-arm@nongnu.org; Thu, 14 Sep 2017 11:06:32 -0400
Received: by mail-wr0-x22a.google.com with SMTP id l39so586005wrl.12
	for <qemu-arm@nongnu.org>; Thu, 14 Sep 2017 08:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MnBgq3dbvrhTaM3o+0EaLymk7Cx1qq06EqJiwTo02Lg=;
	b=Rn7sKuhLBsTTjIlN4V+uOQW9cf3LuFA1jtnVnqWhOBDAVeQTWQC5Pgk8s/4Vu1zpgb
	XGNUEnuupVkNOT1gZCGy50g1+zH/u04QqLiiQ9KefMvkl+A8bAKzA036BYApwa+scwoZ
	rg/ssHjLMi+QG4Wbcv8q6peBffFAg+XUExByc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MnBgq3dbvrhTaM3o+0EaLymk7Cx1qq06EqJiwTo02Lg=;
	b=sBBXdeXRlUXO1wMKPlyXwTpAihGEWLItFXq8hVI7mljbuLQLeehLp1liYguWtA/ODs
	WUui5HlTq1lELTSd5Bhilir3VBy5f6q1CmRSrK2UUH4wDZlDQX6ItpoMOCoY7s1EClbT
	P3SWZf7zi6aROiX3/PawtS+3y+8yy7TcfF8GQ7P6DMaW4d+RmpT+BWm6WQg87WOubE2V
	BD+t4of6DnbjXZ88tZ6bSnoc3y/+GnhI8TZ26owc9TmbvbDQU4NoxDrGw3t2E3Vp76Mx
	8XQ3A7HWvLN5GsRlYZhoBGVqW2J64WB20Rs2mIHQ+1VRlV1yPcRRxxqGHsvhlTaKZail
	YOkQ==
X-Gm-Message-State: AHPjjUhfQvpSK8dOVCIxoeOqgbWUAWlA3hfHIIncHy4Zxs3/iFFVXotG
	sB4eRe6oq6JDanLteoFviMpHE/YPgXXDo07TsRNM2g==
X-Google-Smtp-Source: ADKCNb4Bo2+vR3tI/SjuM23abup5yB/yZ/wxvLWwtzj+eszFYNNzjHvF+d8cd0oJmtxrNzU1R/dqrRmtBJIToLJ7jic=
X-Received: by 10.223.142.82 with SMTP id n76mr21008889wrb.272.1505401591343; 
	Thu, 14 Sep 2017 08:06:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.215 with HTTP; Thu, 14 Sep 2017 08:06:10 -0700 (PDT)
In-Reply-To: <1505296004-6798-1-git-send-email-eric.auger@redhat.com>
References: <1505296004-6798-1-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Sep 2017 16:06:10 +0100
Message-ID: <CAFEAcA-=VeQ=B0h0e9Qd2rnGLoeZ2jaXuARcPXMBppX8WHhnUQ@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22a
Subject: Re: [Qemu-arm] [PATCH v4 0/3] Generic PCIe host bridge INTx
 determination for INTx routing
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
Cc: Andrew Jones <drjones@redhat.com>, Alexander Graf <agraf@suse.de>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Pranavkumar Sawargaonkar <pranavkumar@linaro.org>,
	Christoffer Dall <christoffer.dall@linaro.org>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WrOsdFfRj2jO

On 13 September 2017 at 10:46, Eric Auger <eric.auger@redhat.com> wrote:
> This series implements INTx to gsi routing for ARM VIRT/Gpex. This is
> a respin of [1] which was lost in limbo.
>
> ARM virt uses GPEX PCIe bridge. This latter does not implement INTx
> to GSI routing. PCIe/INTx assignment works but the consequence is
> irqfd is not used along with INTx interrupts and VFIO INTx handlers
> are executed on userspace leading to an important performance degradation.
>
> This issue is witnessed by the following messages;
>
> qemu-system-aarch64: -device vfio-pci,host=0006:90:00.0: PCI: Bug -
> unimplemented PCI INTx routing (gpex-pcihost)
> qemu-system-aarch64: PCI: Bug - unimplemented PCI INTx routing (gpex-pcihost)
> qemu-system-aarch64: PCI: Bug - unimplemented PCI INTx routing (gpex-pcihost)
>
> So with this series, irqfd is set up for PCIe/INTx passthrough and we get
> the optimal performance. Also we get rid of the above messages.
>
> This series can be found at:
> https://github.com/eauger/qemu/tree/v2.10.0-gpex-v4
>
> References:
> [1] Generic PCIe host bridge INTx determination for INTx routing
>    https://lists.gnu.org/archive/html/qemu-devel/2015-09/msg04975.html

Applied to target-arm.next, thanks.

-- PMM
