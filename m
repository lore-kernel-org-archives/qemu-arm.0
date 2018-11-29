Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2551625wrt;
        Thu, 29 Nov 2018 08:38:08 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XuxPminmAOOdvgzF+I/M+BWeStAkRXwsjPqmGTf5fhKhghoMBtcLRfjJlLb76GaRYYTslI
X-Received: by 2002:a81:49cc:: with SMTP id w195mr2004334ywa.86.1543509488726;
        Thu, 29 Nov 2018 08:38:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543509488; cv=none;
        d=google.com; s=arc-20160816;
        b=vNekFjfFrSod4UkTUQA5WlSyuwygl+56CXS+G0sTRcm9jGbirz8BsrNKuPUgSXCUnX
         hfl7zW6981BQlgC2gdcqYPqP7rg8FmUIFTSy+ky55K3JayXdw7dgRcKJfBKp6KdlW3/P
         Up7B5J0ECrY4lFxTXhCSA+pGEaSze0KpARp0WY9zebwZZ5qDD7nyVmO5nGc++uVO0Sf7
         iU6sqjQF2vf+HTsbt0cI6V06iGstHjV2rwe3vL1fbZRSSYWzOCEuIO5PbUT6L65scq9t
         XVF1z/K8GgwScTrZYu1kgTLPPVmjC/5aDC4TcuU33xXDeeytJ2fOIj0XSPUjLuUscUnU
         lvPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=t6KRhI6CRUiX6rByVIxTuBflTt5STUj4GMogPxTTi8U=;
        b=xS3icwAN7QwUz8YD2RJ1Tuu42fyA7RSErSkzQ778wcjRVcz1i+fPloqJhbR87Vt6Ak
         f9uXdEdwSyYdQUZcuRqswcSRonwC0vUkK0+5J4nWHr0GD1p0shSGgGgzj7BjOAzD3Wha
         cgrEWURYQsxptjGFmz8qqL5UAVCXIquoMTisowC1fjDX2v0hP/gri8s1t9TjDdNUyidb
         zbNEJJYj8iNxDUBpHsiyEHh69a78NnkPa269cImGGgASA+QxlTn0WWGnpUcE8poe6QYX
         MPhVZANYNNeNwvqARu8GmQ52PWxwJ4TWTNb8HRQhZ31d/51tFVy2xYZM8g9BqBNpGZwL
         qeLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nvpa7gjo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x194-v6si1497068ybe.202.2018.11.29.08.38.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 29 Nov 2018 08:38:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nvpa7gjo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55163 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSPKK-0006rs-5m
	for alex.bennee@linaro.org; Thu, 29 Nov 2018 11:38:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37050)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gSPJI-0006px-Ps
	for qemu-devel@nongnu.org; Thu, 29 Nov 2018 11:37:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gSPJF-0007Fk-CQ
	for qemu-devel@nongnu.org; Thu, 29 Nov 2018 11:37:04 -0500
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:33270)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1gSPJF-0007FJ-4G; Thu, 29 Nov 2018 11:37:01 -0500
Received: by mail-lf1-x142.google.com with SMTP id i26so1944190lfc.0;
	Thu, 29 Nov 2018 08:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=t6KRhI6CRUiX6rByVIxTuBflTt5STUj4GMogPxTTi8U=;
	b=nvpa7gjoeegdDgSfjBDqTVlo6HMKS7F+Gyg+cLroYPBw9cbf8swKIskmYd+QNC9CV6
	URq9G74BlRlprCZHo+eR/eG7xgOV7dJDJsGajnh+5Iqld8iQvsxKbqWz6SLQy2C22Ni4
	ZJiILBx931EjezK5xXgwZeNf5YsmBo9lpHGhryonEJX/sMbfQpHjlSSTYi/kBlZs5vSk
	HBzu5TUXaquY5gr2p+6/179EI+FopVulqtJypOfpoGTVz/5MhHg7Q9nss74hu27qt+u+
	vcrtEvbvX6FcZgOeEqSkmPpHLoeUzefMAgTaF8G5wZynCCORX2RhQ2Rj0GseWMnVT33i
	p6fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=t6KRhI6CRUiX6rByVIxTuBflTt5STUj4GMogPxTTi8U=;
	b=SdMLlT4oGbxZlPdPhT1Vthyq7L1HmZaJe8AsJvNRMVUsLNSr0/wjw2UkARC+js8TcR
	drHwN+zJFXDyiYuvYSfNWQUUci8bH4QpysUfLDskVwqhu7dPYoG/icUtfWNnYUTfveYQ
	8V6FkJHS0FNA+LySI54QyRCsbguRFH52JrzHM3v+HnzYL7oM4kEGiS7XezikLpM0O1eI
	W1Hcv1q69P0CYqNZfNvTIxK6RMYdoF3KLz+yBkMd2UZSliO/X0wT1KV6ZuIGS1WsOZNy
	kjBTCJEhVd/avfc/WoknG3VkgLSvB44nZ+OoagzpQRNSng2EpwCl/wuZ4XoXsvEsfaw6
	3RXg==
X-Gm-Message-State: AA+aEWbcQL8zvbcTMDh1DCbCIn5ylY9AaJcG77BAK7BEOQonqld4Z/4I
	OpT9I4QHsg/mUX2xpXFcTMbTMJ51
X-Received: by 2002:a19:641d:: with SMTP id y29mr677130lfb.14.1543509419443;
	Thu, 29 Nov 2018 08:36:59 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
	by smtp.gmail.com with ESMTPSA id
	j18-v6sm363987ljc.52.2018.11.29.08.36.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 29 Nov 2018 08:36:58 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Thu, 29 Nov 2018 17:36:52 +0100
Message-Id: <20181129163655.20370-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181129163655.20370-1-edgar.iglesias@gmail.com>
References: <20181129163655.20370-1-edgar.iglesias@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::142
Subject: [Qemu-devel] [PATCH v1 1/4] hw/arm: versal: Remove bogus
 virtio-mmio creation
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
	edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
	frasse.iglesias@gmail.com, alistair@alistair23.me,
	frederic.konrad@adacore.com, muhammad_bilal@mentor.com,
	philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /BBE3r5nhBrf

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Remove bogus virtio-mmio creation. This was an accidental
left-over an experiment.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/arm/xlnx-versal-virt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index 1e31a3f442..41b8d801c8 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -364,7 +364,6 @@ static void create_virtio_regions(VersalVirt *s)
         sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic_irq);
         mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
         memory_region_add_subregion(&s->soc.mr_ps, base, mr);
-        sysbus_create_simple("virtio-mmio", base, pic_irq);
     }
 
     for (i = 0; i < NUM_VIRTIO_TRANSPORT; i++) {
-- 
2.17.1

