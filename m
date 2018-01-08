Received: by 10.28.173.206 with SMTP id w197csp2610635wme;
        Mon, 8 Jan 2018 07:43:46 -0800 (PST)
X-Google-Smtp-Source: ACJfBouae7ASoWUNtFdI7OEWK139ETmIbVcpCZaCPkmEQ2opTn2FwJXqIOExnL7qy2OoNEfbaF9D
X-Received: by 10.129.96.215 with SMTP id u206mr10960101ywb.478.1515426226533;
        Mon, 08 Jan 2018 07:43:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515426226; cv=none;
        d=google.com; s=arc-20160816;
        b=E25BlC0vyIfn8/41CYhqZS+ar0UxAjf5ZgcEmwdM/ERLANT6UKEytEy85YrrVdvlZX
         LJuu1P4Q4X92jecAiCr4W/l5k9YOA1RpC95G1Okz18PIVVd/unkjg9ys3xeFgAFBI12B
         4YZPhWTzvsWlcH2NRgHq1VKBCO6Gc/lh2/UN9QazMHW0mQl/HhqwTHBYtF3Rk+W11L5v
         bIWvBFxD/6yd+hqYmhBcDPfX3XhuZvKJM15wSI8E+KhyfWGmnOxC6WiqhI3XDjKGidtt
         ZjJs/jJGuu0qppMMu67g6VtsqUUdw2R7UbDNC9be1GZCIXFcAEj52yZtU1Bk+hQ3JlNI
         lOdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=MdVBqsl3IJRQFM11VnTEGb3gyIxLYjLO7UeKKsLPpE0=;
        b=apyQ/T8pxDb0g8hoWUAQYiT0MAmLCb10HsYxohY+RGA9Z61r8OSxgsnPLzFcpbV4A4
         fb4HVV8wwgAmykvDRLQPkoip7MUd1XE4MJzmqURuC+dxkrUkJCZM0Yqyy4Hpo449bETQ
         d02cpgKth1BMRgz9ScAvDaqHDD3vyMVgxHLHJe21A7iufzPEAAMTjbYdLExy1nFUdJSQ
         OIsT0TCjSeqGEPT68BJB5YKAqoJof7XB3Xt6jzr5VC9Iq54DN4VODggE/Iki3GGJ1brW
         mWlx7Zy0jhnT9JUjSeLKRlqdmES5MYwygceI5i/JzAjZGvXZaZVbhniJt7jlIA6nT06A
         khsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Q1J/79kK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b67si1616181ybc.215.2018.01.08.07.43.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 07:43:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Q1J/79kK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41212 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYZaT-00017p-Rg
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 10:43:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41562)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZaE-00015R-BU
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 10:43:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZaD-0006xR-E8
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 10:43:30 -0500
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:37082)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZaB-0006rv-31; Mon, 08 Jan 2018 10:43:27 -0500
Received: by mail-qt0-x243.google.com with SMTP id f2so14075056qtj.4;
	Mon, 08 Jan 2018 07:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=MdVBqsl3IJRQFM11VnTEGb3gyIxLYjLO7UeKKsLPpE0=;
	b=Q1J/79kKMsqtsNWI+9b9NUB61DbjRCcFYcV4QtHhaLXACK3UiQFQpWnV0reVCwkR8r
	VhSK576JumPFsO1C53ks+v8Q9sxkLhP216iTSdlDbqCAPp9lF7wygYaUTVkV0n6eELJk
	lCfZA48rzrsnbOAG25LBWzImsTPu4mk7QO5IyBSbdorZCF3mdBxQvF1iAHsgYMI/Ji8H
	sXjY645VcgoYBX9Y+X1ao/sGFoFP/zSBeF4t50wDNeIS+dzexJq9VUbHF/4R0cRdIctV
	VVNqaO12Bh77H1H83gvHhkA7+NVWZrKjmhOcfOaHrBPcFUZAPHAJxO49K8aWGb8nTA8S
	ajsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=MdVBqsl3IJRQFM11VnTEGb3gyIxLYjLO7UeKKsLPpE0=;
	b=O4Ja2M5ey/ULBuo56FVPEw6JO55tN2IqHasWxRUfnwEQtF0u5Rm/vMJg4xjLHx5R+R
	PicCvnDQftLuwmNCjfglsxgsDt5TfkX9xwsH1bExovZHMiohIUdHF5UYsgO9K914VHCB
	Kg+Gv3jcTjHJtluBMUfDWacN4FD3x/wT9n8S/xRLBYJfjWGT1+INEiXSW86t5y2AE0vc
	bC+fkdeYWyYh088gGmJI5vkIf/EoGrKZtQcKfmOz/u6Gy7gf9iQdZit5LFD4hxMuYi4R
	p//ygfrhklUVrBr30n5SmXlrX4VJLYigAJpnKdzjyQkLrSl102p9GrNND8YYjdWiACjO
	5ldw==
X-Gm-Message-State: AKwxytc/Tp5kPIbKSHRTsT+gNDV+gQHCnX9ce/C1BsFAdiUgaMyz+k29
	8FrLx0DK10PNgo6Bo/dRkaE=
X-Received: by 10.237.51.162 with SMTP id v31mr15699163qtd.116.1515426206473; 
	Mon, 08 Jan 2018 07:43:26 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	u36sm7832382qtc.58.2018.01.08.07.43.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 07:43:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Date: Mon,  8 Jan 2018 12:42:33 -0300
Message-Id: <20180108154303.6522-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180108154303.6522-1-f4bug@amsat.org>
References: <20180108154303.6522-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-arm] [PATCH v5 01/31] sdhci: add a spec_version property
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	=?UTF-8?q?Gr=C3=A9gory=20Estrade?= <gregory.estrade@gmail.com>,
	qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm@nongnu.org,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9heCeuXkrHsc

default to Spec v2.00

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sdhci-internal.h |  4 ++--
 include/hw/sd/sdhci.h  |  3 +++
 hw/sd/sdhci.c          | 19 +++++++++++++++++--
 3 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci-internal.h
index b7475a1b7b..cf4a055159 100644
--- a/hw/sd/sdhci-internal.h
+++ b/hw/sd/sdhci-internal.h
@@ -212,9 +212,9 @@ FIELD(SDHC_PRNSTS, WRITE_PROTECT,      19, 1);
 /* Slot interrupt status */
 #define SDHC_SLOT_INT_STATUS            0xFC
 
-/* HWInit Host Controller Version Register 0x0401 */
+/* HWInit Host Controller Version Register */
 #define SDHC_HCVER                      0xFE
-#define SD_HOST_SPECv2_VERS             0x2401
+#define SDHC_HCVER_VENDOR               0x24
 
 #define SDHC_REGISTERS_MAP_SIZE         0x100
 #define SDHC_INSERTION_DELAY            (NANOSECONDS_PER_SECOND)
diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
index 2aea20f1d8..ddd5040410 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -91,6 +91,8 @@ typedef struct SDHCIState {
     uint64_t capareg;      /* Capabilities Register */
     /* 0x48 */
     uint64_t maxcurr;      /* Maximum Current Capabilities Register */
+    /* 0xfe */
+    uint16_t version;      /* Host Controller Version Register */
 
     uint8_t  *fifo_buffer; /* SD host i/o FIFO buffer */
     uint32_t buf_maxsz;
@@ -99,6 +101,7 @@ typedef struct SDHCIState {
     bool     pending_insert_state;
     /* Configurable properties */
     bool pending_insert_quirk; /* Quirk for Raspberry Pi card insert int */
+    uint8_t spec_version;
 } SDHCIState;
 
 #define TYPE_PCI_SDHCI "sdhci-pci"
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index b080950f80..cd4a8efdd7 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -169,7 +169,8 @@ static void sdhci_reset(SDHCIState *s)
 
     timer_del(s->insert_timer);
     timer_del(s->transfer_timer);
-    /* Set all registers to 0. Capabilities registers are not cleared
+
+    /* Set all registers to 0. Capabilities/Version registers are not cleared
      * and assumed to always preserve their value, given to them during
      * initialization */
     memset(&s->sdmasysad, 0, (uintptr_t)&s->capareg - (uintptr_t)&s->sdmasysad);
@@ -923,7 +924,7 @@ static uint64_t sdhci_read(void *opaque, hwaddr offset, unsigned size)
         ret = (uint32_t)(s->admasysaddr >> 32);
         break;
     case SDHC_SLOT_INT_STATUS:
-        ret = (SD_HOST_SPECv2_VERS << 16) | sdhci_slotint(s);
+        ret = (s->version << 16) | sdhci_slotint(s);
         break;
     default:
         qemu_log_mask(LOG_UNIMP, "SDHC rd_%ub @0x%02" HWADDR_PRIx " "
@@ -1178,6 +1179,15 @@ static inline unsigned int sdhci_get_fifolen(SDHCIState *s)
     }
 }
 
+static void sdhci_init_readonly_registers(SDHCIState *s, Error **errp)
+{
+    if (s->spec_version != 2) {
+        error_setg(errp, "Only Spec v2 is supported");
+        return;
+    }
+    s->version = (SDHC_HCVER_VENDOR << 8) | (s->spec_version - 1);
+}
+
 static void sdhci_initfn(SDHCIState *s)
 {
     qbus_create_inplace(&s->sdbus, sizeof(s->sdbus),
@@ -1190,6 +1200,10 @@ static void sdhci_initfn(SDHCIState *s)
 
 static void sdhci_common_realize(SDHCIState *s, Error **errp)
 {
+    sdhci_init_readonly_registers(s, errp);
+    if (errp && *errp) {
+        return;
+    }
     s->buf_maxsz = sdhci_get_fifolen(s);
     s->fifo_buffer = g_malloc0(s->buf_maxsz);
 
@@ -1290,6 +1304,7 @@ const VMStateDescription sdhci_vmstate = {
 /* Capabilities registers provide information on supported features of this
  * specific host controller implementation */
 static Property sdhci_properties[] = {
+    DEFINE_PROP_UINT8("sd-spec-version", SDHCIState, spec_version, 2),
     DEFINE_PROP_UINT64("capareg", SDHCIState, capareg,
             SDHC_CAPAB_REG_DEFAULT),
     DEFINE_PROP_UINT64("maxcurr", SDHCIState, maxcurr, 0),
-- 
2.15.1

