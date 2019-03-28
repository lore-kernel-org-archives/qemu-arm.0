Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp775022wrx;
        Thu, 28 Mar 2019 08:40:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxxOHWfVLKcsbw1D4aOGf4iuO+g1S2RMcp71sDSN3rXhMceM7eP+9qTH8Yk/9djzec+Tja4
X-Received: by 2002:a24:164d:: with SMTP id a74mr555453ita.84.1553787601629;
        Thu, 28 Mar 2019 08:40:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553787601; cv=none;
        d=google.com; s=arc-20160816;
        b=g5JsVEEnA7GmSxe+sNw6st89oow2T9DDy14+AuInBcelF0Zhn+kPtcrGUPb77Irt6f
         xDrNwWc4912qAAQeeIZtEc3r3eZhQXXx3dQrr+9ltcdVQ3lr7z98AS4FghRIqybv/ahO
         7UaU7drp/D6knSE6h0ctpJGnog310ylekpnFPc/eMBVEEShMTVa5s4aMw5cw8b7B85gt
         y/ZNyxbbDgNyIKr63J5qeqjwz9hN/h4xLr7ixQItz9XZHzZ2INLYk/0HPuFAP4+mK+gA
         Qnwx2Y9RWWaepPLrX7zkrzNi68fPLxklPF662m0PTShf+a1IozALYC4RQoVkTlcCxFhL
         jdYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=kInSicJR/vVsW6djbl9cgFCEDPfeMwx48sh0HIt9rxs=;
        b=CRQMsK/BlY64sePvuQPLZlJErU+1ztYLOcWaw1HqAAPzuWJZqgjAJQCS/NoUwMCwC1
         s14WhvA/vxs3iTiw9l30AEaQwN5OVrxUxARtGFkiM9F+kZaRmYoxpVuLM4sUWie1oPHc
         eycdHAD7mcptlqGrobkio2xaklI0wYnEVB7/Ee8CE6yNzYeFUsqCjJUcFZPbLD4BGOYr
         b8S5AKKPu5e9ThQ+ZN8bMfvRniQGraWpJqCzUpVcBaf35pokHvSZxxnicyWWu7dVphW1
         epalZO8ginmR26XRUVviv1v/7Mb9jHaubAsqvyJSmU8M5ObUFWR2IzYcFQzSzg/kOskV
         sGiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ghUmdtUi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e15si7530277ioh.67.2019.03.28.08.40.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Mar 2019 08:40:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ghUmdtUi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:38101 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h9X8K-0001Wl-TN
	for alex.bennee@linaro.org; Thu, 28 Mar 2019 11:40:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39403)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h9X5O-0007n6-1u
	for qemu-devel@nongnu.org; Thu, 28 Mar 2019 11:36:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h9WvP-0004SR-M0
	for qemu-devel@nongnu.org; Thu, 28 Mar 2019 11:26:43 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:33516)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1h9WvP-0004SD-CS
	for qemu-devel@nongnu.org; Thu, 28 Mar 2019 11:26:39 -0400
Received: by mail-wr1-x441.google.com with SMTP id q1so23452041wrp.0
	for <qemu-devel@nongnu.org>; Thu, 28 Mar 2019 08:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=kInSicJR/vVsW6djbl9cgFCEDPfeMwx48sh0HIt9rxs=;
	b=ghUmdtUirOGunlH3dunjD3ccu8kBQllYjYmTZnctI2KiCAb2NyUhKsH4ZBlff9BnyD
	AOgDroC1pZpEjBgBA8HOcOlhdTY321WZEZm4Sxj2Ms+PU8K3GrsDHY1Jw+d5SpSaHjIM
	wGORG6ZKzdfzaAtUVwrDl7Lz7+0Gu4aO4l4k7Ofx8n2FRyn0gRTd9J9F0aMRERFzVuKU
	+D0nVy/6792etTylZXb/A5JIXI1B/dKmKo5aGoQ4M4uA3fawojyNXMCtQMBUaAPyvUcC
	5WRxfcfn5Op3me7FDS9csusHCDd45gTFTv7VbjijGUG8WJwdgfcezQGNXuBsyb3hcl0j
	u5/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=kInSicJR/vVsW6djbl9cgFCEDPfeMwx48sh0HIt9rxs=;
	b=Yb6IB4Xdzum1s08u8ueYm/myiOp24bqN9twJZ1jKntWlZ1pMODlumx60Si8h48wOB1
	sXzqvjMNUsOdI0qRDRJ0utpSNX2nKRlSaBHa80hlfNV4fPo8HdQi1PGWcMEAxc3v7QBV
	4KWNbTrWXu56lNMM/WdySYrdyy3forFNV/baq5gEWFi+pguUd0qf/EdsWZ3xQcBaezvR
	5o/FxUB4lY5MDvwzWK81bXpIgpGbOBSBSuMr8Vy1L3Y4Pe2zlml1296qn7nvi8sWrGWF
	DoMt48XaZkQwU/BpN37K2NTQ97c6V8rYdzRLZxAjJo6YvEFvPYP5iAo7fw8xygew++nA
	CDJg==
X-Gm-Message-State: APjAAAVPFOdkcCPoi/gLw+VZfvmB/rNogo6Zo/swk54uq487oTTbP17Z
	5fFUGR4k+wnNuzKLgBNxfKOkfA==
X-Received: by 2002:adf:ebc8:: with SMTP id v8mr27659065wrn.172.1553786798152; 
	Thu, 28 Mar 2019 08:26:38 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	g8sm53236816wro.77.2019.03.28.08.26.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Mar 2019 08:26:37 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 28 Mar 2019 15:26:35 +0000
Message-Id: <20190328152635.2794-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: [Qemu-devel] [PATCH for-4.1] hw/ssi/xilinx_spips: Avoid variable
 length array
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k1KfXs/4sPYc

In the stripe8() function we use a variable length array; however
we know that the maximum length required is MAX_NUM_BUSSES. Use
a fixed-length array and an assert instead.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/ssi/xilinx_spips.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
index 16f88f74029..c615058cc1b 100644
--- a/hw/ssi/xilinx_spips.c
+++ b/hw/ssi/xilinx_spips.c
@@ -429,12 +429,14 @@ static void xlnx_zynqmp_qspips_reset(DeviceState *d)
 
 static inline void stripe8(uint8_t *x, int num, bool dir)
 {
-    uint8_t r[num];
-    memset(r, 0, sizeof(uint8_t) * num);
+    uint8_t r[MAX_NUM_BUSSES];
     int idx[2] = {0, 0};
     int bit[2] = {0, 7};
     int d = dir;
 
+    assert(num <= MAX_NUM_BUSSES);
+    memset(r, 0, sizeof(uint8_t) * num);
+
     for (idx[0] = 0; idx[0] < num; ++idx[0]) {
         for (bit[0] = 7; bit[0] >= 0; bit[0]--) {
             r[idx[!d]] |= x[idx[d]] & 1 << bit[d] ? 1 << bit[!d] : 0;
-- 
2.20.1

