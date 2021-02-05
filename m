Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2221530lfo;
        Fri, 5 Feb 2021 09:56:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwwkYhmzDd1YW3MtdepndRMToL/hUZZ6/Xq0Ql2rRtDjMB9MkOnOfbHbeRCkyAMeT5vZWz9
X-Received: by 2002:a25:3d81:: with SMTP id k123mr7351775yba.430.1612547788304;
        Fri, 05 Feb 2021 09:56:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612547788; cv=none;
        d=google.com; s=arc-20160816;
        b=cIKgYD2E1L/sVpY2FJxSmSt1z8o5T2+bxXle8k5nHTbQuHrOKaqmgq4wRReMeAaynE
         s8/d+31l74y89VIVM8iScrNGQOiYtRgj2Vt1dV8POjUsPAd6qFWo5dYUg5HOJKw0uTbh
         6KscFdcL+670qnenAMudhCTf3koZcgSjbiNfndsnrPPRoHHTfH42xm6RwwpHDk4Vmvzo
         VOsc7Phy7Sz2u8ifI9J8asqRJTw57n9X6zQiNh3QelVbg+SR+TPpfpha1/gkHzYuKfTq
         V3pIAi7owJDcUciDfzbGvXOnewfuy9lWQc+Px4Bqzut9pelhCh3GBe0wPTd5P2Cd/MRR
         4p3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=6e/ocFlNpbvzWzShp69RWnr5b+cScjq0s1B9GZ0rX5w=;
        b=g4rhVdWXunVCPytzuU4va+yYY8FnQbVSEEXug/QERLD4zYYQ3OcISJ1+CsaRw0Z9Yw
         F6JwytLI1mCjfvxMNIvZFR9tD/RbQt7KWirNDL4L7DuXGwODhm7ToOI7ZEnb46yFKnJl
         shbLJSAziu1v8d8S/dBdhs1LsvKgcxD3tb2AfsbpQvuUwXilLmWb5Ug2uBQuS/tlIlEQ
         6tjEefrdcALJRIx+XQa6ye2Jk9omPcPgtrBkcbKk9dKR6oVYu/ozAjsXJhM0DHGboKkH
         N9rjRpR0G32T1WJmV8AXkMGnktpVfXP4zYlE8BsqIV2+P/dOioFRpnrNUo9kUbxQmKHW
         iIWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VU1fOfjB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h7si8875726ybh.288.2021.02.05.09.56.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Feb 2021 09:56:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VU1fOfjB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l85LH-0002UG-LG
	for alex.bennee@linaro.org; Fri, 05 Feb 2021 12:56:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84TM-0006dT-Rc
 for qemu-arm@nongnu.org; Fri, 05 Feb 2021 12:00:46 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:54639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84T3-0003zz-DI
 for qemu-arm@nongnu.org; Fri, 05 Feb 2021 12:00:44 -0500
Received: by mail-wm1-x331.google.com with SMTP id w4so6563578wmi.4
 for <qemu-arm@nongnu.org>; Fri, 05 Feb 2021 09:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=6e/ocFlNpbvzWzShp69RWnr5b+cScjq0s1B9GZ0rX5w=;
 b=VU1fOfjB2vqX/Qnx5iw3D6D2LKQ5cXEMGUOcCXoeSDIPHiT8skK9dQ+bcMEdO7KO5o
 mC9qvqGOsXgevNc5lM4IM8r3Ef7vlEABp1I55DxtpSQCkI/t9A5gzCuBvUDkRJ2GuxsJ
 6akzD/X3yWBAUf3FzNvPc5WuJpGhy7SaFS6gSfa/7bBN2as44MgjiZKx0RjVEXWEp4tQ
 1nfZ8cdhpTg1ZZXLJ/q99IZ+ir3NpZ1/x4VkVkH04nsJk1RjSdLmpCH2MpkkWgxJqQvp
 /TLb5A+U15K9ZgKhVfdtxs7GT914ofbI32qNOUKdQ6Xu3agB4xt1DL1Z+m9OexoN6wra
 Twvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6e/ocFlNpbvzWzShp69RWnr5b+cScjq0s1B9GZ0rX5w=;
 b=m5rklJexLJ9ITtlrG3Y4WK9gNSH8lmvzu/8bEoHV4+Ua2c4nYZabYW9VoHIw/Qy3Nl
 sx4NN9JWZsloEx5aFKzwY/mcIYGIsWMwqAYrE78riKCz5zTj2zTugGsCYdW9MDbL57Yr
 tXdPOUfcjkZwXj/+S4cXgmJAJYuVSfmoYTh4+/XJp47dI0/LmHzCT13pjFJH2znZilkL
 a3TWLLP9RtdcVm8v/6xRfby+XQuQBfYR+xxk5ZMKIVpoDWVnJzR9UeaBhRZqRNpdB9mO
 csGGDOj91NJ5EQtlB9De4Lu5vFUF59Le0e8Wj/oRfFvaXfmLDuqJjueRI87iFuXQyHta
 DSHA==
X-Gm-Message-State: AOAM533cnQqVJ3sxWPJ+ns9imq6DtXHPk+wOk+J7UfNWA5V4saqmLLc/
 hrSQJypAoSYkRr5eoM8mIb1yBtKiTvV9BA==
X-Received: by 2002:a05:600c:4e8e:: with SMTP id
 f14mr4348607wmq.139.1612544423375; 
 Fri, 05 Feb 2021 09:00:23 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l11sm12200010wrt.23.2021.02.05.09.00.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 09:00:22 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 02/24] hw/misc/mps2-scc: Support configurable number of OSCCLK
 values
Date: Fri,  5 Feb 2021 16:59:57 +0000
Message-Id: <20210205170019.25319-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210205170019.25319-1-peter.maydell@linaro.org>
References: <20210205170019.25319-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1LmUqepCPbeq

Currently the MPS2 SCC device implements a fixed number of OSCCLK
values (3).  The variant of this device in the MPS3 AN524 board has 6
OSCCLK values.  Switch to using a PROP_ARRAY, which allows board code
to specify how large the OSCCLK array should be as well as its
values.

With a variable-length property array, the SCC no longer specifies
default values for the OSCCLKs, so we must set them explicitly in the
board code.  This defaults are actually incorrect for the an521 and
an505; we will correct this bug in a following patch.

This is a migration compatibility break for all the mps boards.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
It would be possible to avoid the compat break, but we've already
broken compat for the mps boards this release cycle (eg in commit
eeae0b2bf4e69de2) when we added Clock support to the armsse code, so
there's no point in trying to keep compat for this change.
---
 include/hw/misc/mps2-scc.h |  7 +++----
 hw/arm/mps2-tz.c           |  5 +++++
 hw/arm/mps2.c              |  5 +++++
 hw/misc/mps2-scc.c         | 24 +++++++++++++-----------
 4 files changed, 26 insertions(+), 15 deletions(-)

diff --git a/include/hw/misc/mps2-scc.h b/include/hw/misc/mps2-scc.h
index f65d8732031..514da49f69e 100644
--- a/include/hw/misc/mps2-scc.h
+++ b/include/hw/misc/mps2-scc.h
@@ -19,8 +19,6 @@
 #define TYPE_MPS2_SCC "mps2-scc"
 OBJECT_DECLARE_SIMPLE_TYPE(MPS2SCC, MPS2_SCC)
 
-#define NUM_OSCCLK 3
-
 struct MPS2SCC {
     /*< private >*/
     SysBusDevice parent_obj;
@@ -39,8 +37,9 @@ struct MPS2SCC {
     uint32_t dll;
     uint32_t aid;
     uint32_t id;
-    uint32_t oscclk[NUM_OSCCLK];
-    uint32_t oscclk_reset[NUM_OSCCLK];
+    uint32_t num_oscclk;
+    uint32_t *oscclk;
+    uint32_t *oscclk_reset;
 };
 
 #endif
diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 82ce6262817..7c066c11ed4 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -219,6 +219,11 @@ static MemoryRegion *make_scc(MPS2TZMachineState *mms, void *opaque,
     qdev_prop_set_uint32(sccdev, "scc-cfg4", 0x2);
     qdev_prop_set_uint32(sccdev, "scc-aid", 0x00200008);
     qdev_prop_set_uint32(sccdev, "scc-id", mmc->scc_id);
+    /* This will need to be per-FPGA image eventually */
+    qdev_prop_set_uint32(sccdev, "len-oscclk", 3);
+    qdev_prop_set_uint32(sccdev, "oscclk[0]", 50000000);
+    qdev_prop_set_uint32(sccdev, "oscclk[1]", 24576000);
+    qdev_prop_set_uint32(sccdev, "oscclk[2]", 25000000);
     sysbus_realize(SYS_BUS_DEVICE(scc), &error_fatal);
     return sysbus_mmio_get_region(SYS_BUS_DEVICE(sccdev), 0);
 }
diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index 39add416db5..81413b7133e 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -373,6 +373,11 @@ static void mps2_common_init(MachineState *machine)
     qdev_prop_set_uint32(sccdev, "scc-cfg4", 0x2);
     qdev_prop_set_uint32(sccdev, "scc-aid", 0x00200008);
     qdev_prop_set_uint32(sccdev, "scc-id", mmc->scc_id);
+    /* All these FPGA images have the same OSCCLK configuration */
+    qdev_prop_set_uint32(sccdev, "len-oscclk", 3);
+    qdev_prop_set_uint32(sccdev, "oscclk[0]", 50000000);
+    qdev_prop_set_uint32(sccdev, "oscclk[1]", 24576000);
+    qdev_prop_set_uint32(sccdev, "oscclk[2]", 25000000);
     sysbus_realize(SYS_BUS_DEVICE(&mms->scc), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(sccdev), 0, 0x4002f000);
     object_initialize_child(OBJECT(mms), "fpgaio",
diff --git a/hw/misc/mps2-scc.c b/hw/misc/mps2-scc.c
index ce1dfe93562..52a4e183b71 100644
--- a/hw/misc/mps2-scc.c
+++ b/hw/misc/mps2-scc.c
@@ -57,7 +57,7 @@ static bool scc_cfg_write(MPS2SCC *s, unsigned function,
 {
     trace_mps2_scc_cfg_write(function, device, value);
 
-    if (function != 1 || device >= NUM_OSCCLK) {
+    if (function != 1 || device >= s->num_oscclk) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "MPS2 SCC config write: bad function %d device %d\n",
                       function, device);
@@ -75,7 +75,7 @@ static bool scc_cfg_write(MPS2SCC *s, unsigned function,
 static bool scc_cfg_read(MPS2SCC *s, unsigned function,
                          unsigned device, uint32_t *value)
 {
-    if (function != 1 || device >= NUM_OSCCLK) {
+    if (function != 1 || device >= s->num_oscclk) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "MPS2 SCC config read: bad function %d device %d\n",
                       function, device);
@@ -227,7 +227,7 @@ static void mps2_scc_reset(DeviceState *dev)
     s->cfgctrl = 0x100000;
     s->cfgstat = 0;
     s->dll = 0xffff0001;
-    for (i = 0; i < NUM_OSCCLK; i++) {
+    for (i = 0; i < s->num_oscclk; i++) {
         s->oscclk[i] = s->oscclk_reset[i];
     }
     for (i = 0; i < ARRAY_SIZE(s->led); i++) {
@@ -254,12 +254,14 @@ static void mps2_scc_realize(DeviceState *dev, Error **errp)
                                       LED_COLOR_GREEN, name);
         g_free(name);
     }
+
+    s->oscclk = g_new0(uint32_t, s->num_oscclk);
 }
 
 static const VMStateDescription mps2_scc_vmstate = {
     .name = "mps2-scc",
-    .version_id = 1,
-    .minimum_version_id = 1,
+    .version_id = 2,
+    .minimum_version_id = 2,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(cfg0, MPS2SCC),
         VMSTATE_UINT32(cfg1, MPS2SCC),
@@ -268,7 +270,8 @@ static const VMStateDescription mps2_scc_vmstate = {
         VMSTATE_UINT32(cfgctrl, MPS2SCC),
         VMSTATE_UINT32(cfgstat, MPS2SCC),
         VMSTATE_UINT32(dll, MPS2SCC),
-        VMSTATE_UINT32_ARRAY(oscclk, MPS2SCC, NUM_OSCCLK),
+        VMSTATE_VARRAY_UINT32(oscclk, MPS2SCC, num_oscclk,
+                              0, vmstate_info_uint32, uint32_t),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -280,14 +283,13 @@ static Property mps2_scc_properties[] = {
     DEFINE_PROP_UINT32("scc-cfg4", MPS2SCC, cfg4, 0),
     DEFINE_PROP_UINT32("scc-aid", MPS2SCC, aid, 0),
     DEFINE_PROP_UINT32("scc-id", MPS2SCC, id, 0),
-    /* These are the initial settings for the source clocks on the board.
+    /*
+     * These are the initial settings for the source clocks on the board.
      * In hardware they can be configured via a config file read by the
      * motherboard configuration controller to suit the FPGA image.
-     * These default values are used by most of the standard FPGA images.
      */
-    DEFINE_PROP_UINT32("oscclk0", MPS2SCC, oscclk_reset[0], 50000000),
-    DEFINE_PROP_UINT32("oscclk1", MPS2SCC, oscclk_reset[1], 24576000),
-    DEFINE_PROP_UINT32("oscclk2", MPS2SCC, oscclk_reset[2], 25000000),
+    DEFINE_PROP_ARRAY("oscclk", MPS2SCC, num_oscclk, oscclk_reset,
+                      qdev_prop_uint32, uint32_t),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.20.1

