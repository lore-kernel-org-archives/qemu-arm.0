Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3989650wrs;
        Mon, 26 Aug 2019 07:42:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzbAYNLAuTa6ljKdzzu8/lTe4W89EUMarxGF35GKcVclYcYtYeNKnPJFMK9fsSQds8k3to8
X-Received: by 2002:a0c:f945:: with SMTP id i5mr15182468qvo.221.1566830550956;
        Mon, 26 Aug 2019 07:42:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566830550; cv=none;
        d=google.com; s=arc-20160816;
        b=XsUoXwb7ZwMOGzbsncnGtFANzJNPgz5nHHg7tQPFxdNcpGhBVkeRDboRxlU9/H6i6W
         ZLsZZuxu4TdTI1gmgMwk3187qrPuTLFobnXxMME7qA6DmiinWfkHonjq+kMU02UFhvT9
         9Alhh0okKsRJUmSeN60uOr4fftdPH1FiFt/TehCBz4yvlHpdsamnRlLEhPDiInBT0jNh
         fgexmZez4IismnW64rD2x79i82rO7JfDza0c52BcPLBFBJetiPOb22tdt6XMPpGEgEAZ
         b77hirw9hkaLhnlaWWOtw0zz9ttr+xaIXPZE7ooQUGm4f1Dwm+jhKtc6wkF25gQnc8b+
         E0vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=cfQJeIOIBOgSAkMg0KG1Um3QEVRdipF/3hs04jF+2Qg=;
        b=FlHqH/N2a5Cnk4EZwoyNNDOPFrAiEEet+pFHk61D5Bsxkn27GkYwkUk+GHWOAWJBJH
         yJh6rulCKD2iEILA+KiN6SXgS2MLfL27nGggu8/QDSM0Ge7v/hP1nNY4MHVqs2HkUEzK
         LHucE4tt5d4R3Qay93DAPbbBsj77G0ncnlqHxTjtlRcSFL/GxrbvN9i32a9UUxi/ZQlo
         vkcSC9I0dl7JEmAwSRQQA1Pc7TTZv3xKwspasdPxXYkdLUruHJgu3U3ru5XDkGwXt+Cd
         YWVM1zAX9+uGW9s+CI0Mb5tCon9CwQdpXMQbh4DgO43cGiMEcN+ddwtDGdCRpk0ZaTQ6
         yHAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k54si7763567qtb.314.2019.08.26.07.42.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Aug 2019 07:42:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:53896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i2GCT-0006up-HK
	for alex.bennee@linaro.org; Mon, 26 Aug 2019 10:42:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46408)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tony.nguyen@bt.com>) id 1i2G3R-0008Hm-Ki
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 10:33:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1i2G3P-0001Vh-AV
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 10:33:09 -0400
Received: from nsstlmta09p.bpe.bigpond.com ([203.38.21.9]:53381)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1i2G3N-0001PS-Gj; Mon, 26 Aug 2019 10:33:07 -0400
Received: from smtp.telstra.com ([10.10.24.4])
 by nsstlfep21p-svc.bpe.nexus.telstra.com.au with ESMTP id
 <20190826141907.VWVI15045.nsstlfep21p-svc.bpe.nexus.telstra.com.au@smtp.telstra.com>;
 Tue, 27 Aug 2019 00:19:07 +1000
X-RG-Spam: Unknown
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgeduvddrudehgedgjeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuuffpveftpgfvgffnuffvtfetpdfqfgfvnecuuegrihhlohhuthemucegtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepvfhonhihucfpghhuhigvnhcuoehtohhnhidrnhhguhihvghnsegsthdrtghomheqnecukfhppeehkedrudejfedrleekrdeikeenucfrrghrrghmpehhvghlohepuggsiidrthgvlhhsthhrrgdrtghomhdrrghupdhinhgvthepheekrddujeefrdelkedrieekpdhmrghilhhfrhhomhepoehtohhnhidrnhhguhihvghnsegsthdrtghomheqpdhrtghpthhtohepoegsrdhgrghlvhgrnhhisehgmhgrihhlrdgtohhmqedprhgtphhtthhopeeojhgrshhofigrnhhgsehrvgguhhgrthdrtghomheqpdhrtghpthhtohepoehpvghtvghrrdgthhhusggssehnihgtthgrrdgtohhmrdgruheqpdhrtghpthhtohepoehpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrgheqpdhrtghpthhtohepoehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgqedprhgtphhtthhopeeoqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgheqpdhrtghpthhtohepoehtohhnhidrnhhguhihvghnsegsthdrtghomheqnecuvehluhhsthgvrhfuihiivgepvd
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
X-RG-VS-CLASS: clean
X-Authentication-Info: Submitted using ID tony.nguyen.git@bigpond.com
Received: from dbz.telstra.com.au (58.173.98.68) by smtp.telstra.com (5.8.335)
 (authenticated as tony.nguyen.git@bigpond.com)
 id 5D3581440DDB12BF; Tue, 27 Aug 2019 00:19:06 +1000
From: Tony Nguyen <tony.nguyen@bt.com>
To: qemu-devel@nongnu.org
Date: Tue, 27 Aug 2019 00:21:40 +1000
Message-Id: <452af9f741f5fdb467ad5da2c97d1e010a6d3987.1566829168.git.tony.nguyen@bt.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1566829168.git.tony.nguyen@bt.com>
References: <cover.1566829168.git.tony.nguyen@bt.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 203.38.21.9
Subject: [Qemu-devel] [PATCH 14/19] hw/net: Declare device little or big
 endian
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Tony Nguyen <tony.nguyen@bt.com>, Peter Maydell <peter.maydell@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Beniamino Galvani <b.galvani@gmail.com>,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zlEoQtMb7KFR

For each device declared with DEVICE_NATIVE_ENDIAN, find the set of
targets from the set of target/hw/*/device.o.

If the set of targets are all little or all big endian, re-declare
as DEVICE_LITTLE_ENDIAN or DEVICE_BIG_ENDIAN respectively.

Then, on inspection:
- if not used, re-declare as DEVICE_HOST_ENDIAN.
- if max/min size=1, re-declare as DEVICE_HOST_ENDIAN.
- if just a bit bucket, re-declare as DEVICE_HOST_ENDIAN
- if PCI, re-declare as DEVICE_LITTLE_ENDIAN.
- if for {ARM|unicore32} only, re-declare as DEVICE_LITTLE_ENDIAN.
- if for SPARC only, re-declare as DEVICE_BIG_ENDIAN.

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 hw/net/allwinner_emac.c | 2 +-
 hw/net/imx_fec.c        | 2 +-
 hw/net/lan9118.c        | 4 ++--
 hw/net/lance.c          | 2 +-
 hw/net/smc91c111.c      | 2 +-
 hw/net/stellaris_enet.c | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/net/allwinner_emac.c b/hw/net/allwinner_emac.c
index e055a661c4..84b48b1774 100644
--- a/hw/net/allwinner_emac.c
+++ b/hw/net/allwinner_emac.c
@@ -421,7 +421,7 @@ static void aw_emac_set_link(NetClientState *nc)
 static const MemoryRegionOps aw_emac_mem_ops = {
     .read = aw_emac_read,
     .write = aw_emac_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
     .valid = {
         .min_access_size = 4,
         .max_access_size = 4,
diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index bd99236864..0f3dd7e8e4 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -1285,7 +1285,7 @@ static const MemoryRegionOps imx_eth_ops = {
     .write                 = imx_eth_write,
     .valid.min_access_size = 4,
     .valid.max_access_size = 4,
-    .endianness            = DEVICE_NATIVE_ENDIAN,
+    .endianness            = DEVICE_LITTLE_ENDIAN,
 };
 
 static void imx_eth_cleanup(NetClientState *nc)
diff --git a/hw/net/lan9118.c b/hw/net/lan9118.c
index 8bba2a8056..498a6acfe9 100644
--- a/hw/net/lan9118.c
+++ b/hw/net/lan9118.c
@@ -1308,13 +1308,13 @@ static uint64_t lan9118_16bit_mode_read(void *opaque, hwaddr offset,
 static const MemoryRegionOps lan9118_mem_ops = {
     .read = lan9118_readl,
     .write = lan9118_writel,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static const MemoryRegionOps lan9118_16bit_mem_ops = {
     .read = lan9118_16bit_mode_read,
     .write = lan9118_16bit_mode_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static NetClientInfo net_lan9118_info = {
diff --git a/hw/net/lance.c b/hw/net/lance.c
index 6631e2a4e0..27dfa3a688 100644
--- a/hw/net/lance.c
+++ b/hw/net/lance.c
@@ -76,7 +76,7 @@ static uint64_t lance_mem_read(void *opaque, hwaddr addr,
 static const MemoryRegionOps lance_mem_ops = {
     .read = lance_mem_read,
     .write = lance_mem_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_BIG_ENDIAN,
     .valid = {
         .min_access_size = 2,
         .max_access_size = 2,
diff --git a/hw/net/smc91c111.c b/hw/net/smc91c111.c
index e574635969..50cd6fc140 100644
--- a/hw/net/smc91c111.c
+++ b/hw/net/smc91c111.c
@@ -760,7 +760,7 @@ static const MemoryRegionOps smc91c111_mem_ops = {
     .write = smc91c111_writefn,
     .valid.min_access_size = 1,
     .valid.max_access_size = 4,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static NetClientInfo net_smc91c111_info = {
diff --git a/hw/net/stellaris_enet.c b/hw/net/stellaris_enet.c
index 3aca2a09f3..5dfd43b3f2 100644
--- a/hw/net/stellaris_enet.c
+++ b/hw/net/stellaris_enet.c
@@ -459,7 +459,7 @@ static void stellaris_enet_write(void *opaque, hwaddr offset,
 static const MemoryRegionOps stellaris_enet_ops = {
     .read = stellaris_enet_read,
     .write = stellaris_enet_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static void stellaris_enet_reset(DeviceState *dev)
-- 
2.23.0

