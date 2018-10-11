Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1809118wrt;
        Wed, 10 Oct 2018 19:20:03 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61EKBiWdTmaekxg/hDccdoANEShZsoQDul3kqjQ+U2/TwjFHy0aw0hFHQe6nIANhK6+v/V4
X-Received: by 2002:a37:7006:: with SMTP id l6-v6mr3165315qkc.243.1539224403074;
        Wed, 10 Oct 2018 19:20:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539224403; cv=none;
        d=google.com; s=arc-20160816;
        b=H1pLwltofZZQ2bUs4Uz+D4wHpLZT3J4ulqV6FGIEgNHm9Q2puezqraUGuqKPMtoG4V
         5cXh6obHfjJgr7UEsLO2fbvyYJZ86B/DCckxgiyqT+M7Pf2q7PZEMxTwMbbXtd7X9g/u
         Fka67rAzl+MVp+YubOvPS4VGHMYZP2pcgSbIeOlW9srfwklwTds1ZIO1MMXhDA6bXnC3
         LIt7MqvCDY/9h2+lFPkByiBSyuA5+cFqs/G0JF1t5+RK/O9p7BNYH82mP2rH1qB7B4Au
         DDMD3f6pafS35XMhRR+l3mOIVzpqh2laD9SZ8Mk8O4wyaNa0cFYg2xADrOi3/+AJ73Gz
         IWQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=NIUDOauFNjwQsj/e9Z66pP+3PuRkffZU/rcuUHKwH9I=;
        b=SUXbtgbafsHUinndZgoUMy0fePaItXFYJTRBRikbNMdiZLiH76zZ8I3zZEz/N1kewU
         ocXuwc/beRijatrrdaem5ffu/oinlut26h/qy0dqvQsP+gJUEqUpNFSNQLf5DQglz2Ya
         56ZK1xsqpn72EZqGplVRdVTAsbV4/mg1oiv0RvCs9ijr61UN2RawKW4xDlPHMLq6kI6e
         bseVvZdVhE8x10Yo0fwaxmCm+q5lJ3AMa6HQ58ivvcDg1rE0HFGK+ZvMiBFJjt7Jux+G
         mFIMwFzZQh/14c0ZLBMduNg9ZU/yvmf5aTuxM1pMlqW9vn1t8olebaFXwn8Rv2izY+gr
         C7gA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mGp7+qNi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x65-v6si7603147qke.54.2018.10.10.19.20.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 Oct 2018 19:20:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mGp7+qNi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59952 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gAQa2-0002Cp-G7
	for alex.bennee@linaro.org; Wed, 10 Oct 2018 22:20:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48632)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gAQZj-0002AW-KR
	for qemu-arm@nongnu.org; Wed, 10 Oct 2018 22:19:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gAQZi-0004NV-S3
	for qemu-arm@nongnu.org; Wed, 10 Oct 2018 22:19:43 -0400
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:37357)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1gAQZg-0004L8-PN; Wed, 10 Oct 2018 22:19:40 -0400
Received: by mail-lj1-x242.google.com with SMTP id 63-v6so6744056ljs.4;
	Wed, 10 Oct 2018 19:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=NIUDOauFNjwQsj/e9Z66pP+3PuRkffZU/rcuUHKwH9I=;
	b=mGp7+qNikRX9H4aNNjE1RIfE3s0cESTXnRKqLvEcL7kqd6HtjfKMrN+Bc32GjgbVr8
	DmvuGbI+hhm0ho6b5VyXbcW1SplhdF9KayZOjCJocMncXz13ryz5cbUJgaQ0vuwtpqGg
	3v9nStESGBoLFoT3uxkmIak7JYIyVRvv989FVSObT3drok7PYIohti0unmmHrI8VVUii
	sJz/b7OJ+RoGeDqsU+FIRnfdQjDfBzQDFpKE6tQwfA8L7LWWhw1MWimD67kTAe9lPdw0
	z2A2l7COb13UQFj+d/JbgF0oHSzQJL3MG6lEL/nENDH6OrIdIi9g6Cxn02V9oz6BPY0D
	MElg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=NIUDOauFNjwQsj/e9Z66pP+3PuRkffZU/rcuUHKwH9I=;
	b=IH3dIOmuv0/jUUac6BTzhJxgy5lsFlcacQ2tv437G6m/BjISDVdMng/Lk1qS/Myt7r
	00UPUswjvIQ7FhwUXF4Rkb4+qajKXt493/yXqU/g6plH0AIj361lo9zlgii2SVnwvnWm
	SlioQTsHelCnIX3nVEQVUwX89QyvUmSUebG8C13ug3qeviDJGwgqSREt7UcLLTclbg7f
	vVZGFEDRx9I/rfzNJyYQEQf7sxctgw9ODjW9pCzPbnFy/l3R0siHkEgYb+F1gWfn3sF3
	jUIzvzcKhboMLZJLpFD7WxAaFGQYfzSV3JvoqPqHrPmUbMIYiUyc5BCNdT49uZEecjMI
	h3bQ==
X-Gm-Message-State: ABuFfohzXzyAqEuF0OuYlkPR52PU8OBoxLhMpALoaSbelQafebzn1hqu
	SsWA7vHYJG1ij23PQw4sTwXqasB1TSM=
X-Received: by 2002:a2e:2c15:: with SMTP id
	s21-v6mr21828738ljs.162.1539224379285; 
	Wed, 10 Oct 2018 19:19:39 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
	by smtp.gmail.com with ESMTPSA id
	g81-v6sm3869599ljf.34.2018.10.10.19.19.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 10 Oct 2018 19:19:38 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Thu, 11 Oct 2018 04:19:23 +0200
Message-Id: <20181011021931.4249-5-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181011021931.4249-1-edgar.iglesias@gmail.com>
References: <20181011021931.4249-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::242
Subject: [Qemu-arm] [PATCH v2 04/12] net: cadence_gem: Add macro with max
 number of descriptor words
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
	edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
	frasse.iglesias@gmail.com, alistair@alistair23.me,
	richard.henderson@linaro.org, frederic.konrad@adacore.com,
	philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X8tO02/RFRly

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Add macro with max number of DMA descriptor words.
No functional change.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/net/cadence_gem.c         | 4 ++--
 include/hw/net/cadence_gem.h | 5 ++++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 31f3fe0e81..4d769b0244 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -1042,7 +1042,7 @@ static void gem_transmit_updatestats(CadenceGEMState *s, const uint8_t *packet,
  */
 static void gem_transmit(CadenceGEMState *s)
 {
-    uint32_t desc[2];
+    uint32_t desc[DESC_MAX_NUM_WORDS];
     hwaddr packet_desc_addr;
     uint8_t     tx_packet[2048];
     uint8_t     *p;
@@ -1108,7 +1108,7 @@ static void gem_transmit(CadenceGEMState *s)
 
             /* Last descriptor for this packet; hand the whole thing off */
             if (tx_desc_get_last(desc)) {
-                uint32_t desc_first[2];
+                uint32_t desc_first[DESC_MAX_NUM_WORDS];
 
                 /* Modify the 1st descriptor of this packet to be owned by
                  * the processor.
diff --git a/include/hw/net/cadence_gem.h b/include/hw/net/cadence_gem.h
index 633d564dc3..b33ef6513b 100644
--- a/include/hw/net/cadence_gem.h
+++ b/include/hw/net/cadence_gem.h
@@ -32,6 +32,9 @@
 
 #define CADENCE_GEM_MAXREG        (0x00000800 / 4) /* Last valid GEM address */
 
+/* Max number of words in a DMA descriptor.  */
+#define DESC_MAX_NUM_WORDS              2
+
 #define MAX_PRIORITY_QUEUES             8
 #define MAX_TYPE1_SCREENERS             16
 #define MAX_TYPE2_SCREENERS             16
@@ -74,7 +77,7 @@ typedef struct CadenceGEMState {
 
     uint8_t can_rx_state; /* Debug only */
 
-    uint32_t rx_desc[MAX_PRIORITY_QUEUES][2];
+    uint32_t rx_desc[MAX_PRIORITY_QUEUES][DESC_MAX_NUM_WORDS];
 
     bool sar_active[4];
 } CadenceGEMState;
-- 
2.17.1

