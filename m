Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1815047wrt;
        Wed, 10 Oct 2018 19:23:58 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60RDkglEyRMDzuRFmIGn2A+WLSwrCHhONYNMUreBsArnFA63/lj3C/jq7clxir6V/hqaeqX
X-Received: by 2002:ac8:145:: with SMTP id f5-v6mr28511911qtg.221.1539224638012;
        Wed, 10 Oct 2018 19:23:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539224638; cv=none;
        d=google.com; s=arc-20160816;
        b=YHegmLZ6ndoWmAozvPl5xBEWmNzg/Se6BhIqSHDmthCPgt9FQSX8aSfmYoSRDKPWIm
         lFbljnseWHpV/eHOpufatkE75w3xqa0z1evkLPAlFiZlwxiQRbwjcBmkE/7UgaADnQEY
         VVzmsSoZf/RXyGVtltU9E22QpgD2yM2UonZgiI6Zez/t5u23j3MSgtP7em62L2bA52jM
         DiXi93530Mnr+eOXyvfkr+9RAxjEDHC8LcFwkz8ChJojoD6ym61ywGwVFOcUq1WaJPZs
         pIK77C00ulcbA6qifZjeMm/xKjJfTqrvAG5Gihzj05F7zQjo79x7Oh8dAU/rk0v9aaDe
         kDRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=P8bE42secDzNCihtZNXaoNcRaMh9z1Mn+JR1meIGCf4=;
        b=JCzxw8/mvfIwGcbV8GenHFx286yy8+StiWugJhh4bEBgnG+JQCMIYxKSCBSw72ixzi
         A5OhGjdLwiNhVN8pU38bYLqkmufbn6IpPVJLWJPKKYcoUaWfD/QIo1VCP+hbU15PHQX1
         gupd131wJmHFz4NHuMo+WcFiwOmBePzNyAy3bd6IFz/KcmMv35L/bluRgO4LBHUlvqn7
         17XCddYSA4AAf6/Y59aPm8o3flvyIZitcQXo7WBSvcYcTcVSN/y3f9P6spGJ06GMy6dX
         ZDcdnn1pWOll/siUboEvUCBYxUnO/Y0Lymh3b6AOdNejG6Va9ozjuakuJKihN28M2MWS
         4NRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UgjLqKnS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a10-v6si12390607qkb.196.2018.10.10.19.23.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 Oct 2018 19:23:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UgjLqKnS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59971 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gAQdp-0004jF-Dj
	for alex.bennee@linaro.org; Wed, 10 Oct 2018 22:23:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48690)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gAQZs-0002EI-3T
	for qemu-devel@nongnu.org; Wed, 10 Oct 2018 22:19:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gAQZn-0004Pw-Sk
	for qemu-devel@nongnu.org; Wed, 10 Oct 2018 22:19:50 -0400
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:42663)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1gAQZn-0004PM-Jr; Wed, 10 Oct 2018 22:19:47 -0400
Received: by mail-lj1-x242.google.com with SMTP id y71-v6so6732192lje.9;
	Wed, 10 Oct 2018 19:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=P8bE42secDzNCihtZNXaoNcRaMh9z1Mn+JR1meIGCf4=;
	b=UgjLqKnSmqWrWKb6Z0ekUK4KzllyG3/jA4Hb/FrT336weT1AV2kiGHXXHj183+i/Oy
	1TKD+rqjjSSBUXlCxggj07qdTDf89RSp6xyvDokbArtGkDLRYYDt1cFTiccE1mgCQIa7
	I7QLNj2icIqsVuqVQR5thg+UiTPNqEj8xRcoRhUP5ZVUsjLW7Gz3lY3Py/h3zbsm1Iq9
	gqaBvH7deS8QaPZ8Ueyyhcc5trDLzk/+LxMH+R7iztv0ZlAASKlh2WDTXkiVw1ymMnyl
	y8ke6Rm4mlWuG1wPXnOyzf5gWClujLBSpmIf+A4HLxI5u39WHPUsjCuAHEbD7rHWwwtD
	rpbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=P8bE42secDzNCihtZNXaoNcRaMh9z1Mn+JR1meIGCf4=;
	b=tc2uP57CfpNgELAgCeTmuFa+Pwbop7uGfCl5QTCtX3hM3lFq7XS7gj4TTGXajc5H8S
	ABRkn+RSCRultN402WC90VeldPVfH7KjCRaE9psEq+0ib8dQMkGd+nNwggP+HG8REdH+
	4K3q7xRhsX2E0oug5Vl15d3XHzgrnOiyzPqrFzM0pfotAJXrb93CZbYlnwoDsMNBSdpC
	fvXUHbazuYn3WpVEN52Gtf+2lgtfnhs7WUX4ov5XJezFVAZzj3n5mu4L8GsLxffMrSok
	G1j30ji0i4XiFtFN7SjArj+Wk1oV2njC4piLuKHkCrwRua2GU1cK4EbjJLZuTQkrUopl
	Ghmw==
X-Gm-Message-State: ABuFfojRDEawYjEUre+SmUr+oQ4GFbuKiBm9mHbAwWkTz+AHg5YaRY90
	041tQk8KHZx2pGkmc49MxwiwLp9GltI=
X-Received: by 2002:a2e:9883:: with SMTP id
	b3-v6mr19513645ljj.171.1539224386085; 
	Wed, 10 Oct 2018 19:19:46 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
	by smtp.gmail.com with ESMTPSA id
	p24-v6sm5806467ljg.57.2018.10.10.19.19.44
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 10 Oct 2018 19:19:44 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Thu, 11 Oct 2018 04:19:27 +0200
Message-Id: <20181011021931.4249-9-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181011021931.4249-1-edgar.iglesias@gmail.com>
References: <20181011021931.4249-1-edgar.iglesias@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::242
Subject: [Qemu-devel] [PATCH v2 08/12] net: cadence_gem: Announce 64bit
 addressing support
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
	richard.henderson@linaro.org, frederic.konrad@adacore.com,
	philmd@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QuG5GldFWd/7

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Announce 64bit addressing support.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/net/cadence_gem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 550225c15b..7f96de4aff 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -142,6 +142,7 @@
 #define GEM_DESCONF4      (0x0000028C/4)
 #define GEM_DESCONF5      (0x00000290/4)
 #define GEM_DESCONF6      (0x00000294/4)
+#define GEM_DESCONF6_64B_MASK (1U << 23)
 #define GEM_DESCONF7      (0x00000298/4)
 
 #define GEM_INT_Q1_STATUS               (0x00000400 / 4)
@@ -1300,7 +1301,7 @@ static void gem_reset(DeviceState *d)
     s->regs[GEM_DESCONF] = 0x02500111;
     s->regs[GEM_DESCONF2] = 0x2ab13fff;
     s->regs[GEM_DESCONF5] = 0x002f2045;
-    s->regs[GEM_DESCONF6] = 0x0;
+    s->regs[GEM_DESCONF6] = GEM_DESCONF6_64B_MASK;
 
     queues_mask = MAKE_64BIT_MASK(1, s->num_priority_queues - 1);
     s->regs[GEM_DESCONF6] |= queues_mask;
-- 
2.17.1

