Received: by 2002:a05:7022:458e:b0:46:22f1:8c13 with SMTP id cf14csp2140126dlb;
        Tue, 18 Oct 2022 14:08:30 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6wd1LW/KMmFOJVBfXqiTnhB1AfwDiMtOvPv9KQZ0WHrH40+oCg934UfhzAqGSA95LpS82Y
X-Received: by 2002:a05:620a:1335:b0:6ee:883a:dcba with SMTP id p21-20020a05620a133500b006ee883adcbamr3230029qkj.449.1666127310040;
        Tue, 18 Oct 2022 14:08:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666127310; cv=none;
        d=google.com; s=arc-20160816;
        b=VLullhDxJpRtbQPiafigTHrYPDicthR+URUlOop26Mk47A2oMLCh1wm9jKlgfBLQ7e
         UenQg4obpI7wlFbufHtONkdc55/HcF4lvaBiVdhGl9MHFd6I64th9wClJKLT7RCKwa+D
         JYNEvwnRxDW86Phhdzj1Chlro16Tc8/BmmVwwx+ZCWgaI2kJYte21CmswdY36URpzHi7
         +6CQSMKC0amh48HiJe7rqThJDIqIpEUT6j7Zy2sPlH2AbwEF+ROY4FMwb7W9iKYA7rWJ
         DoJiAkawQVE+nqYxXVrvfbGNf0w4qPy5pQNNqSqRfXzIjsy+A9MT3Vus8znwuqVwz+4R
         9WOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=WtEIJKc0Za2w7LkNpc+XYB5b7FTyMz3UDgQ3c6Pamy8=;
        b=i8Wa/dAlgPi+m2HgSu/vLrp1hkMNiwnu9ge5qg/u59h8MNjMbsKCNeCkbNGjf6GAW/
         auqmoYaLdhP0qNHeDij+fmQZSgB2BLvO8PeVFC7efO0mowhOpb9ErU2zr2HQqL3xbF4s
         zy4uS/LLlyveu/qwct8YO6YN82Qv+pLAaH76xpIe+hqpPEPK5GfqVRW8aw1vH37lqBIT
         F+aSbpHlMERxdZBiK6uOWbL+8VawpZjKe2L4Ph861a8+F8Ay5uy7fCblnHdnd2xiZh/k
         v64E5nkEbaW4betmey86ZdlQaQo5fNAZUXJbQ+TX11dczGddBYhk0a8drQ0Zoq1ULwSR
         Dctw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=NhYy8mp2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ci10-20020a05622a260a00b00397bb72949csi7903960qtb.85.2022.10.18.14.08.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Oct 2022 14:08:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=NhYy8mp2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oktp6-0002Db-Dp
	for alex.bennee@linaro.org; Tue, 18 Oct 2022 17:08:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oktjX-00022I-SJ; Tue, 18 Oct 2022 17:02:51 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:40839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oktjV-0003vK-UQ; Tue, 18 Oct 2022 17:02:43 -0400
Received: by mail-ej1-x631.google.com with SMTP id r17so35332185eja.7;
 Tue, 18 Oct 2022 14:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WtEIJKc0Za2w7LkNpc+XYB5b7FTyMz3UDgQ3c6Pamy8=;
 b=NhYy8mp2tT3eW2ZRlAWLGCq+XlIrp7c3KKe+HlPmW0aomOaBlQQ4CRliUvhpCuuyq+
 x/Q9tJZ1a+1zdPBUYUSUo5sVm0eN0LEmASqSORB4AeOWIN2EUAKhhPwWsjoaqOGPAqu1
 4x/vW52K953lnKP9zCI4bn1DrPkNijK0um31XON9t+rFqlcqfnxsKRNFy4xeochRK+Op
 zUwWxeeacaoWsXqbx03b5WzTyQw/HfcTL1RpROMJLHiS05EgbmWHTsDrgXb8u4L4bDaZ
 w8EMns2ppMYS7GXQBpFDW30la+M/ro6TG66pe3d6woBGY5Q62Z8Btn7ParVIA2r9BA2R
 3zlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WtEIJKc0Za2w7LkNpc+XYB5b7FTyMz3UDgQ3c6Pamy8=;
 b=nZT9VRRdDDtbtk7jpWUWTL7JsmcGuNpjhSpJr6i9fi7sgM8oNshOCfF61tGyja9+eF
 FHNKO39NiUerwcDQb1kX+cs0iUEkLmBhga+p1l5IhpRg0hvMPvalpFGrHkc4n37AcX4P
 490XVEpuL7GacikCHQTZrpZl9oEp81cL1tNcm7TDwZxUpg0/Gtbig/ZZPSDd4aRHriR9
 Zk1Btpp2bAjwctes+VcbEgXuBDAhsQkxJZA5luwPUgOrSbP0CT/+GB0F3WLbyUGBZLKH
 ttIg3d3i8W088cJ/UsTQIPvGgNhu5QCSfkSseSJoVAX2IN73N9z8qT2QMJPJmIgCkpFl
 c9ww==
X-Gm-Message-State: ACrzQf125DFv2CDzYr7O3rFUuLftZgG4VwYAaky+pIOqqws+esUiSOCe
 awAoQ81a0+DStOXGtoquS1QSjl2RvKc=
X-Received: by 2002:a17:907:270f:b0:78d:728b:ff4 with SMTP id
 w15-20020a170907270f00b0078d728b0ff4mr4060683ejk.501.1666126958159; 
 Tue, 18 Oct 2022 14:02:38 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-078-054-012-048.78.54.pool.telefonica.de. [78.54.12.48])
 by smtp.gmail.com with ESMTPSA id
 fe7-20020a056402390700b004587c2b5048sm9407951edb.52.2022.10.18.14.02.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 14:02:37 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-ppc@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Alistair Francis <alistair@alistair23.me>,
 Bin Meng <bin.meng@windriver.com>, Kevin Wolf <kwolf@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-arm@nongnu.org,
 Magnus Damm <magnus.damm@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-block@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v4 3/7] hw/sd/sdhci-internal: Unexport ESDHC defines
Date: Tue, 18 Oct 2022 23:01:42 +0200
Message-Id: <20221018210146.193159-4-shentey@gmail.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221018210146.193159-1-shentey@gmail.com>
References: <20221018210146.193159-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
X-TUID: yHPgJYlePQip

These defines aren't used outside of sdhci.c, so can be defined there.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sdhci-internal.h | 20 --------------------
 hw/sd/sdhci.c          | 19 +++++++++++++++++++
 2 files changed, 19 insertions(+), 20 deletions(-)

diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci-internal.h
index e8c753d6d1..964570f8e8 100644
--- a/hw/sd/sdhci-internal.h
+++ b/hw/sd/sdhci-internal.h
@@ -288,26 +288,6 @@ enum {
 
 extern const VMStateDescription sdhci_vmstate;
 
-
-#define ESDHC_MIX_CTRL                  0x48
-
-#define ESDHC_VENDOR_SPEC               0xc0
-#define ESDHC_IMX_FRC_SDCLK_ON          (1 << 8)
-
-#define ESDHC_DLL_CTRL                  0x60
-
-#define ESDHC_TUNING_CTRL               0xcc
-#define ESDHC_TUNE_CTRL_STATUS          0x68
-#define ESDHC_WTMK_LVL                  0x44
-
-/* Undocumented register used by guests working around erratum ERR004536 */
-#define ESDHC_UNDOCUMENTED_REG27        0x6c
-
-#define ESDHC_CTRL_4BITBUS              (0x1 << 1)
-#define ESDHC_CTRL_8BITBUS              (0x2 << 1)
-
-#define ESDHC_PRNSTS_SDSTB              (1 << 3)
-
 /*
  * Default SD/MMC host controller features information, which will be
  * presented in CAPABILITIES register of generic SD host controller at reset.
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 0e5e988927..6da5e2c781 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1577,6 +1577,25 @@ static const TypeInfo sdhci_bus_info = {
 
 /* --- qdev i.MX eSDHC --- */
 
+#define ESDHC_MIX_CTRL                  0x48
+
+#define ESDHC_VENDOR_SPEC               0xc0
+#define ESDHC_IMX_FRC_SDCLK_ON          (1 << 8)
+
+#define ESDHC_DLL_CTRL                  0x60
+
+#define ESDHC_TUNING_CTRL               0xcc
+#define ESDHC_TUNE_CTRL_STATUS          0x68
+#define ESDHC_WTMK_LVL                  0x44
+
+/* Undocumented register used by guests working around erratum ERR004536 */
+#define ESDHC_UNDOCUMENTED_REG27        0x6c
+
+#define ESDHC_CTRL_4BITBUS              (0x1 << 1)
+#define ESDHC_CTRL_8BITBUS              (0x2 << 1)
+
+#define ESDHC_PRNSTS_SDSTB              (1 << 3)
+
 static uint64_t usdhc_read(void *opaque, hwaddr offset, unsigned size)
 {
     SDHCIState *s = SYSBUS_SDHCI(opaque);
-- 
2.38.0

