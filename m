Received: by 10.28.173.206 with SMTP id w197csp1025606wme;
        Thu, 11 Jan 2018 13:15:59 -0800 (PST)
X-Google-Smtp-Source: ACJfBotMe1OwlXD46RDBsVbQLtTe6qX93kZo4+SaVkyj/RLAO1Ui9/uh0ByxAPqutebOfnQaWSgj
X-Received: by 10.37.29.215 with SMTP id d206mr21755422ybd.2.1515705359216;
        Thu, 11 Jan 2018 13:15:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515705359; cv=none;
        d=google.com; s=arc-20160816;
        b=Z9wcUG3i0neBiYKfszmz+6cAPSqu5+bpXDCH2Twba/DKV685W887mHZ/BC/h+GKqdP
         zzPa4GUoYAF0rgSCkveLOSjCFIyCq99+lny+gbX2GJzOd4xIaVvaQC2jaPHwqdmgs0AW
         A2GojZ3cz4tgQa0yt/OXvTiIypzwxdftSrCyWiCaTBhCUa7v/BaVHyucIguQfy+/2XgF
         tY1dknDQPZiBmrqvXo7+0M19sYC8gBuAwfJUqw+Er7xgeYZxmrR82IfIEWW9sDpZNhiM
         AK9scmMolpZrePrqR3T4WTxFOULsso8Vo0kFO85rZeOkI7BZuyZEKW/KisBL9GnPot7s
         RKWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=urAzLBGFBZVaC5qZQhJvvjPDQVrq8bb/g/G1RIyCpOo=;
        b=m0polpY0i1HAkqnY8TICvHZ02VosnEROWJbHbnJqoFXy1lCR5dSTdnjZhCnxzb4309
         wvVnedCMaC9QnSWdSOxbxJSd6niLvKFw/Sek8fkDk7pAWA7OF6lHskbuOufdVfl4v7jN
         vVyG11jT+fpQDtLmV8DAlzucA/EEZJbBgoM/gfUPIpOxPOlKhzqrHAEE5CxJDIzTzGWm
         zglEd3bLBsdSlsIO5CL71tbH3RuDArMdhZYOHPvfF/vNA2c55ZjRl71oDz+mTf0nskeb
         RvDgE6I11QvHYoFV0zjizW2JWDVUWf1G5E47+c0xeXKv5Ois7BI9xvbIs+8BRDD8fwg+
         88fQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Ilvk1Cgw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x3si4208851ybf.287.2018.01.11.13.15.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Jan 2018 13:15:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Ilvk1Cgw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42684 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eZkCc-0005qJ-Fh
	for alex.bennee@linaro.org; Thu, 11 Jan 2018 16:15:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59903)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eZjvr-0007RR-AI
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 15:58:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eZjvq-0003hQ-3A
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 15:58:39 -0500
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:37843)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eZjvj-0003bP-FM; Thu, 11 Jan 2018 15:58:31 -0500
Received: by mail-qk0-x244.google.com with SMTP id c14so3534213qkh.4;
	Thu, 11 Jan 2018 12:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=urAzLBGFBZVaC5qZQhJvvjPDQVrq8bb/g/G1RIyCpOo=;
	b=Ilvk1CgwOtxybMoHCJgDj0SUf985JfeuF7d9PX2R5mLM6nID1uKD01bGcaxI2x8IsQ
	AYrnnZAa+M8OgzGPm9j5q3zUkaU6rggx2iVGV0PAYKVrf6ftsFe7ZVgmKHTNGj7F+arv
	o0BihZFOOUcweKr2aO15SnaMAKDcIdtJWVFbPxCV+/Vj/3HgUniyxbFsxRSaXNA6k3+e
	2tEFbDmFwQar3/i7ufYmvcF54NPVidMwxCR2qMtOFesrQ9VEMw1mscBxjTypqaASop6/
	aIkTjsx9tUKWvA69bfz9dQumfvQeDbPd94m8SIReWli2T81dpsO6tpoYKOQWsTVyEfNL
	huDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=urAzLBGFBZVaC5qZQhJvvjPDQVrq8bb/g/G1RIyCpOo=;
	b=Tkgy8UTuPFYAEnGDeU+Hdn5BFuUN7+b+CApxRJNmV1yeGvouuQUTZRVBjM4tlRDOWB
	+7EDbhgIOOCTHtq34Z6vlOTO7un4T4EMGYjleccgqg7t0NUcLWneOrn6SiF89CNoAOsk
	m6ltgSSir7swwMX5amTl4M5/D3jk6IzaAbKGTPRG2WpXh5ojqCCmT67Aj7H+7ZHo/HYR
	zVPOXbJ8ZLtaYWUdc4BmotCDVwSgjgmEboYVLiR5Z5o055nwtn9RgnRLQyCSznPL+Lzl
	av4tQV3FIYVgNQbX+GH26RsCoY2iYKhDuhMGHHS3Colktb6y2xuqS/8pnA5hkIqAwmRt
	EUwQ==
X-Gm-Message-State: AKwxytfE8KY247s1gb3wG7CUyJLMlydEussKJrOSxmPdhup9Y8VrQHuC
	GgDutT6gZNGF0KQnG4Lnp5w=
X-Received: by 10.55.25.146 with SMTP id 18mr31927310qkz.214.1515704310786;
	Thu, 11 Jan 2018 12:58:30 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	c1sm12818399qta.52.2018.01.11.12.58.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Jan 2018 12:58:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Date: Thu, 11 Jan 2018 17:56:26 -0300
Message-Id: <20180111205626.23291-22-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180111205626.23291-1-f4bug@amsat.org>
References: <20180111205626.23291-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-arm] [PATCH v6 21/21] sdhci: implement CMD/DAT[] fields in
 the Present State register
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
	Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: i1L9gBv1k8VW

[based on a patch from Alistair Francis <alistair.francis@xilinx.com>
 from qemu/xilinx tag xilinx-v2015.2]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sdhci-internal.h |  2 ++
 include/hw/sd/sd.h     |  4 ++++
 hw/sd/core.c           | 34 ++++++++++++++++++++++++++++++++++
 hw/sd/sd.c             | 16 ++++++++++++++++
 hw/sd/sdhci.c          |  4 ++++
 hw/sd/trace-events     |  2 ++
 6 files changed, 62 insertions(+)

diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci-internal.h
index b82e847636..8bcca39310 100644
--- a/hw/sd/sdhci-internal.h
+++ b/hw/sd/sdhci-internal.h
@@ -82,6 +82,8 @@
 #define SDHC_CARD_PRESENT              0x00010000
 #define SDHC_CARD_DETECT               0x00040000
 #define SDHC_WRITE_PROTECT             0x00080000
+FIELD(SDHC_PRNSTS, DAT_LVL,            20, 4);
+FIELD(SDHC_PRNSTS, CMD_LVL,            24, 1);
 #define TRANSFERRING_DATA(x)           \
     ((x) & (SDHC_DOING_READ | SDHC_DOING_WRITE))
 
diff --git a/include/hw/sd/sd.h b/include/hw/sd/sd.h
index f086679493..bf1eb0713c 100644
--- a/include/hw/sd/sd.h
+++ b/include/hw/sd/sd.h
@@ -103,6 +103,8 @@ typedef struct {
     uint8_t (*read_data)(SDState *sd);
     bool (*data_ready)(SDState *sd);
     void (*set_voltage)(SDState *sd, uint16_t millivolts);
+    uint8_t (*get_dat_lines)(SDState *sd);
+    bool (*get_cmd_line)(SDState *sd);
     void (*enable)(SDState *sd, bool enable);
     bool (*get_inserted)(SDState *sd);
     bool (*get_readonly)(SDState *sd);
@@ -150,6 +152,8 @@ void sd_enable(SDState *sd, bool enable);
  * an SDBus rather than directly with SDState)
  */
 void sdbus_set_voltage(SDBus *sdbus, uint16_t millivolts);
+uint8_t sdbus_get_dat_lines(SDBus *sdbus);
+bool sdbus_get_cmd_line(SDBus *sdbus);
 int sdbus_do_command(SDBus *sd, SDRequest *req, uint8_t *response);
 void sdbus_write_data(SDBus *sd, uint8_t value);
 uint8_t sdbus_read_data(SDBus *sd);
diff --git a/hw/sd/core.c b/hw/sd/core.c
index 6d198ea775..3c6eae6c88 100644
--- a/hw/sd/core.c
+++ b/hw/sd/core.c
@@ -41,6 +41,40 @@ static SDState *get_card(SDBus *sdbus)
     return SD_CARD(kid->child);
 }
 
+uint8_t sdbus_get_dat_lines(SDBus *sdbus)
+{
+    SDState *slave = get_card(sdbus);
+    uint8_t dat_lines = 0b1111; /* 4 bit bus width */
+
+    if (slave) {
+        SDCardClass *sc = SD_CARD_GET_CLASS(slave);
+
+        if (sc->get_dat_lines) {
+            dat_lines = sc->get_dat_lines(slave);
+        }
+    }
+    trace_sdbus_get_dat_lines(sdbus_name(sdbus), dat_lines);
+
+    return dat_lines;
+}
+
+bool sdbus_get_cmd_line(SDBus *sdbus)
+{
+    SDState *slave = get_card(sdbus);
+    bool cmd_line = true;
+
+    if (slave) {
+        SDCardClass *sc = SD_CARD_GET_CLASS(slave);
+
+        if (sc->get_cmd_line) {
+            cmd_line = sc->get_cmd_line(slave);
+        }
+    }
+    trace_sdbus_get_cmd_line(sdbus_name(sdbus), cmd_line);
+
+    return cmd_line;
+}
+
 void sdbus_set_voltage(SDBus *sdbus, uint16_t millivolts)
 {
     SDState *card = get_card(sdbus);
diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 609b2da14f..ab9be561d2 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -126,8 +126,20 @@ struct SDState {
     BlockBackend *blk;
 
     bool enable;
+    uint8_t dat_lines;
+    bool cmd_line;
 };
 
+static uint8_t sd_get_dat_lines(SDState *sd)
+{
+    return sd->enable ? sd->dat_lines : 0;
+}
+
+static bool sd_get_cmd_line(SDState *sd)
+{
+    return sd->enable ? sd->cmd_line : false;
+}
+
 static void sd_set_voltage(SDState *sd, uint16_t millivolts)
 {
     switch (millivolts) {
@@ -457,6 +469,8 @@ static void sd_reset(DeviceState *dev)
     sd->blk_len = 0x200;
     sd->pwd_len = 0;
     sd->expecting_acmd = false;
+    sd->dat_lines = 0xf;
+    sd->cmd_line = true;
     sd->multi_blk_cnt = 0;
 }
 
@@ -1938,6 +1952,8 @@ static void sd_class_init(ObjectClass *klass, void *data)
     dc->bus_type = TYPE_SD_BUS;
 
     sc->set_voltage = sd_set_voltage;
+    sc->get_dat_lines = sd_get_dat_lines;
+    sc->get_cmd_line = sd_get_cmd_line;
     sc->do_command = sd_do_command;
     sc->write_data = sd_write_data;
     sc->read_data = sd_read_data;
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index a4727b4577..1f834e8a3d 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -907,6 +907,10 @@ static uint64_t sdhci_read(void *opaque, hwaddr offset, unsigned size)
         break;
     case SDHC_PRNSTS:
         ret = s->prnsts;
+        ret = FIELD_DP32(ret, SDHC_PRNSTS, DAT_LVL,
+                         sdbus_get_dat_lines(&s->sdbus));
+        ret = FIELD_DP32(ret, SDHC_PRNSTS, CMD_LVL,
+                         sdbus_get_cmd_line(&s->sdbus));
         break;
     case SDHC_HOSTCTL:
         ret = s->hostctl1 | (s->pwrcon << 8) | (s->blkgap << 16) |
diff --git a/hw/sd/trace-events b/hw/sd/trace-events
index f874489980..82efd79bea 100644
--- a/hw/sd/trace-events
+++ b/hw/sd/trace-events
@@ -5,6 +5,8 @@ sdbus_command(const char *bus_name, uint8_t cmd, uint32_t arg, uint8_t crc) "@%s
 sdbus_read(const char *bus_name, uint8_t value) "@%s value 0x%02x"
 sdbus_write(const char *bus_name, uint8_t value) "@%s value 0x%02x"
 sdbus_set_voltage(const char *bus_name, uint16_t millivolts) "@%s %u (mV)"
+sdbus_get_dat_lines(const char *bus_name, uint8_t dat_lines) "@%s dat_lines: %u"
+sdbus_get_cmd_line(const char *bus_name, bool cmd_line) "@%s cmd_line: %u"
 
 # hw/sd/sdhci.c
 sdhci_set_inserted(const char *level) "card state changed: %s"
-- 
2.15.1

