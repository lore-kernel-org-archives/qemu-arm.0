Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2953457wrt;
        Mon, 14 Jan 2019 03:57:43 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6+PZM2vxfOnHXoVbILbgcdTnNWborg7PezAAIJwyCQUTZWEUjd+WWmXgCzxJABcGwWFgQ6
X-Received: by 2002:a1c:27c6:: with SMTP id n189mr11359357wmn.108.1547467062936;
        Mon, 14 Jan 2019 03:57:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547467062; cv=none;
        d=google.com; s=arc-20160816;
        b=SXvgrGs914cX2Vw6+85PVg6YbdHovZvC8xDwuatWOH2bY3RuJ9pUqc+QVhS4KJ2gCu
         4oQzZkrADxVVP9RJ6O/Ni88G/Nxbv/olFOTT3gGaKSMJNvIEyHVo3A9KmF24AjC7CyVY
         DgFCzEtqE/TEVFINgq1HqbDB/NHVg2d/rC5gnmsTY3Xt/Qc6rWDBrMrFR5ZpykaAh6qp
         cELtsCJFHJBRU6BRBc9oWgQQ/p7i6lJqE842FhZjK0KcIUbDmN+1KdhczvSXF/k8AnCB
         S6NZUERJYHi9qz1EMDoITMNMhHqyrdnGXxkhWtbzj3aB+goBTSzPwZcBua2kQ3I4YspQ
         8sAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=I8BvMLz1v72BoXMnzdr5sWeD9HZE5rwvOIP96mH0G5U=;
        b=AF/b34V4QGHtNuAcYTBPH6ALZFShDo3L4eQqU6vk9AgmctcLniqhTkubz7u6IVTqBB
         8ivB01sl2uARyAVKt8zy8pElxd9qJNfGTsEoTeQPlSpYbKRtiwGz63pWfiZReJjTf/8J
         arUzfANxFqtF1fhgVZzbSJ5RSwnDqYvIGzwUBHEq4yeCSmales3PWFKDDtyk1h+TrKyy
         haIMUaFVgwOQ2DoqTD3KU3O16qb2VU+LXlbR3M/6zY6V4c15m7ck3R+1ayniEaJ7Rlay
         WGvgLlchMC6mEa1VmzcVE+51cJSO7nUsX5y1Ekf9FbQSCSNvEdIPkghESdJRIA1HmfNb
         J0jg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=feHMsEEa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c192si18272860wme.168.2019.01.14.03.57.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 14 Jan 2019 03:57:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=feHMsEEa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:57582 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gj0s9-0006YJ-T7
	for alex.bennee@linaro.org; Mon, 14 Jan 2019 06:57:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47159)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gj0rG-0006WK-Q2
	for qemu-devel@nongnu.org; Mon, 14 Jan 2019 06:56:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gj0rE-0005qd-QM
	for qemu-devel@nongnu.org; Mon, 14 Jan 2019 06:56:46 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:35987)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gj0rE-0005pF-FO
	for qemu-devel@nongnu.org; Mon, 14 Jan 2019 06:56:44 -0500
Received: by mail-wr1-x442.google.com with SMTP id u4so22526712wrp.3
	for <qemu-devel@nongnu.org>; Mon, 14 Jan 2019 03:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=I8BvMLz1v72BoXMnzdr5sWeD9HZE5rwvOIP96mH0G5U=;
	b=feHMsEEaPULmfBkM9G8mYah7kiWDdXIsZCGGXpuuz0i4TKBIJeL+z1/x880CnUzH3u
	ro+y30hYdrh9TRoVEFKlVrC8Dpn8NjZzgzskY8f1pHDEtK99LinH/Yodxa/1Zcwmmw5x
	BgSc8J6GOR55DGrUJfD2djkoxC49CZiY/bqNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=I8BvMLz1v72BoXMnzdr5sWeD9HZE5rwvOIP96mH0G5U=;
	b=bmezBhBmknDkg1DgIj52Yuiiwpm3hRN5O+GFxx8+DQ1Fyao/rLzkfIbFIdeKpKpq1c
	H2YWgbHMvYKk33lmTqVwfXkpBpUMLpRRDwk7UI82lcgUK+uK+9COwcZ6lsXmsA2wJTpF
	eD1bqXmwSDWSty+mn3cVVeYw6JeYeKOwSkUTNV9vNet5qaVFXCrU3Z/zGp7uz7xhZmU3
	7oIO6mSt50/f4JMj+jeiaQAzx3BlZ4mpRmj12zyhsfJVCpPzT1usgLMFO/ORLlcns5OE
	dkS2dna2crCf7s10FTLXiQLpkyoltiuaiEWDqYk1yA4n+LWY1QcDOJ5405p1N0UA7QWa
	f09w==
X-Gm-Message-State: AJcUukdDD0qgSjZ0aWkSXeK4BTXkkC95K8M1n0YgMFP0ZvhqjRfy7BKi
	Atb4jnATULdTokkhJJD4GZrkLQ==
X-Received: by 2002:adf:a743:: with SMTP id e3mr23024597wrd.56.1547467002004; 
	Mon, 14 Jan 2019 03:56:42 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	125sm47835842wmm.26.2019.01.14.03.56.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Jan 2019 03:56:41 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 14 Jan 2019 11:56:34 +0000
Message-Id: <20190114115637.6335-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190114115637.6335-1-peter.maydell@linaro.org>
References: <20190114115637.6335-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-devel] [PATCH v2 1/4] hw/arm/xlx-zynqmp: Realize cluster
 after putting RPUs in it
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Emilio G . Cota" <cota@braap.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RMMEY0t2HWla

Currently the cluster implementation doesn't have any constraints
on the ordering of realizing the TYPE_CPU_CLUSTER and populating it
with child objects. We want to impose a constraint that realize
must happen only after all the child objects are added, so move
the realize of rpu_cluster. (The apu_cluster is already
realized after child population.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/arm/xlnx-zynqmp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index c67ac2e64ac..370b0e44a38 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -183,8 +183,6 @@ static void xlnx_zynqmp_create_rpu(XlnxZynqMPState *s, const char *boot_cpu,
                             &error_abort, NULL);
     qdev_prop_set_uint32(DEVICE(&s->rpu_cluster), "cluster-id", 1);
 
-    qdev_init_nofail(DEVICE(&s->rpu_cluster));
-
     for (i = 0; i < num_rpus; i++) {
         char *name;
 
@@ -212,6 +210,8 @@ static void xlnx_zynqmp_create_rpu(XlnxZynqMPState *s, const char *boot_cpu,
             return;
         }
     }
+
+    qdev_init_nofail(DEVICE(&s->rpu_cluster));
 }
 
 static void xlnx_zynqmp_init(Object *obj)
-- 
2.20.1

