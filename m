Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp288501lfo;
        Tue, 1 Mar 2022 16:23:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwhjpVW2BGfY2ysxtXwyCB88Hgvq0PAn0PaVOKwokqjg6OUAU7059qF9bx9JONshlGD8NqR
X-Received: by 2002:a05:6902:1109:b0:628:233e:31f8 with SMTP id o9-20020a056902110900b00628233e31f8mr14199649ybu.170.1646180636798;
        Tue, 01 Mar 2022 16:23:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646180636; cv=none;
        d=google.com; s=arc-20160816;
        b=zAbVHP4zkTWJ0+DBNXhoD1Zs2NTik1IJHu4O3Oxeh5tDu8GTFNHHHnOlhdS/6wRmyF
         Y6nfNKJNzk3M/ZcFwhjxUVDTrYYLqpvRFB5REAJaBhMZpzZsq85qDYkdntSW1RdGXvEA
         U1Y2Yl5ugPLGgXzNUzIOJ1M6G5stqha4Za8fmoBHrFGLWvwhwG7rjv0CaOdXF8VLZp6b
         2OkkHjKbnb0wHKTTC6xuAiuACu92hfMLavH4JQgm900zR1emZEMwzEuJmlwOxOmGQL4g
         uT/imTO1ewCdxt+heA9ol7jwIpqcN5d3MEq4VKM+3ZrxOeHsxtKfNhB5hzXD3YNIXZ5M
         kJQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=psSMCNKv2yqoyBWLtLGO59oWBEWLqDJSO6USW3rcrSM=;
        b=xpwOtjwpuDuXOA/F2PYBK2khbars4gfdcxWkcXvU0mWZxUTZupoKa8gBF2k0c2vJxO
         QV7ZhWP48AaUVdfAi0ZwU08rNBkHp53aHjl9A7JZMflluPjc7PNNCkj09uDQ04wRNGBq
         q72uBWjhw1FLJVqiINh7OdGch5ZqIt/nGTlORpDDDpqheKoFpLfr18V9sbHvcdoQu+Il
         lI9sQEyPva9ffXPuNldcHN6geqkk0gJYTz5vj9dQqZX7K9hEUs630XQJ5h7aktA/YAXS
         LPrIhjQ5avP6AFgUjvI+TbKLNMlvI63ftnTPLRbtuIfwJ9xdE+FuNlBlJjnSI5Aik9tJ
         E+gQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=NrYikGjO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z67-20020a813346000000b002dbdc797937si3130474ywz.250.2022.03.01.16.23.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Mar 2022 16:23:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=NrYikGjO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:41712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nPCma-0008JI-78
	for alex.bennee@linaro.org; Tue, 01 Mar 2022 19:23:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3-7geYgYKCv4zoz0yxmuumrk.iuswks0-jk1krtutmt0.uxm@flex--titusr.bounces.google.com>)
 id 1nPCmB-0008GS-DZ
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 19:23:31 -0500
Received: from [2607:f8b0:4864:20::b49] (port=45844
 helo=mail-yb1-xb49.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3-7geYgYKCv4zoz0yxmuumrk.iuswks0-jk1krtutmt0.uxm@flex--titusr.bounces.google.com>)
 id 1nPCm9-0002s4-2v
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 19:23:30 -0500
Received: by mail-yb1-xb49.google.com with SMTP id
 n66-20020a254045000000b0062883b59ddbso7174yba.12
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 16:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=psSMCNKv2yqoyBWLtLGO59oWBEWLqDJSO6USW3rcrSM=;
 b=NrYikGjOJl8t65tlIniPGLOU191nooF40+SCiQeHRIlQNsIHB/wmc5VxsvfsGyB7fL
 kmHL3VorhDzwnefbDhHZAXTSokO7bD2gAv5qyMuuhPuloD1pLF5PXgtedip0aZ24Nah7
 dCBbagpmnd+cyjPbqS3LTvxR7MpD+ZhvgA9UivD6JsljIrnvtVJaCdw8S65gpOvHWgJr
 R0NEzKbolAOSSWxaQs30ZrzHH2RoKjgpsjRxpPvGJ/AMe0ZVNTB03kOi3oCdAlGQJOXc
 L0XsiWG/B4LXuDWbxJfYLUbuNL6uI7xpfZK4qCUo7ZcJ+gmQa+0+vUNMXGZZnTbw0pzX
 GLYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=psSMCNKv2yqoyBWLtLGO59oWBEWLqDJSO6USW3rcrSM=;
 b=T60W3fqY26EOg35YocT/03epO+5T2a6ztk6CHmsJR9mA2QKXwI8qBaB0Ad9cjddgK6
 QxLTxx/AkiDYovgxhIjP4setTU+fEBCKSHnBP/QwI9BG96UlPMobQ9+OlJMyBKjQu7v3
 7n3btYcSggSGqKzA9Ls1CBKJydnC15pLoHEgzrBVRmAReeU1wbQrMM85WLxV0YthfS+p
 nCy72+DYR8mNHrjM7M9eMablTr5mYT3fPm3cyAPYM2AXwdaRl3xePaWOAseEh+FTSylJ
 B9uCuqGArQhMc0INherU6cJSeY1iw2GnLtsf1dVbx3t/Q94sNcmP+yCStDestLWaPeEg
 YuCg==
X-Gm-Message-State: AOAM530BWxzMjsEDjG9IZMkIBQ6otowz0PbeRg1+u7tNaAx/spat3xgo
 5yaCoNtrdYgXGUHqlvLi1Vv2GYEbPUc=
X-Received: from titusr.svl.corp.google.com
 ([2620:15c:2a3:201:3a0a:5449:c096:dc84])
 (user=titusr job=sendgmr) by 2002:a25:20c5:0:b0:611:a36c:41d with SMTP id
 g188-20020a2520c5000000b00611a36c041dmr26196026ybg.71.1646180603724; Tue, 01
 Mar 2022 16:23:23 -0800 (PST)
Date: Tue,  1 Mar 2022 16:22:59 -0800
In-Reply-To: <20220302002307.1895616-1-titusr@google.com>
Message-Id: <20220302002307.1895616-2-titusr@google.com>
Mime-Version: 1.0
References: <20220302002307.1895616-1-titusr@google.com>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
Subject: [PATCH v2 1/9] hw/i2c: pmbus: add registers
From: Titus Rwantare <titusr@google.com>
To: Corey Minyard <minyard@acm.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, f4bug@amsat.org, 
 wuhaotsh@google.com, venture@google.com, Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b49
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3-7geYgYKCv4zoz0yxmuumrk.iuswks0-jk1krtutmt0.uxm@flex--titusr.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -81
X-Spam_score: -8.2
X-Spam_bar: --------
X-Spam_report: (-8.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ANarESsB8aMm

   - add the VOUT_MIN and STATUS_MFR registers

Signed-off-by: Titus Rwantare <titusr@google.com>
---
 hw/i2c/pmbus_device.c         | 24 ++++++++++++++++++++++++
 include/hw/i2c/pmbus_device.h |  3 +++
 2 files changed, 27 insertions(+)

diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
index 24f8f522d9..07a45c99f9 100644
--- a/hw/i2c/pmbus_device.c
+++ b/hw/i2c/pmbus_device.c
@@ -368,6 +368,14 @@ static uint8_t pmbus_receive_byte(SMBusDevice *smd)
         }
         break;
 
+    case PMBUS_VOUT_MIN:        /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VOUT_RATING) {
+            pmbus_send16(pmdev, pmdev->pages[index].vout_min);
+        } else {
+            goto passthough;
+        }
+        break;
+
     /* TODO: implement coefficients support */
 
     case PMBUS_POUT_MAX:                  /* R/W word */
@@ -708,6 +716,10 @@ static uint8_t pmbus_receive_byte(SMBusDevice *smd)
         pmbus_send8(pmdev, pmdev->pages[index].status_other);
         break;
 
+    case PMBUS_STATUS_MFR_SPECIFIC:       /* R/W byte */
+        pmbus_send8(pmdev, pmdev->pages[index].status_mfr_specific);
+        break;
+
     case PMBUS_READ_EIN:                  /* Read-Only block 5 bytes */
         if (pmdev->pages[index].page_flags & PB_HAS_EIN) {
             pmbus_send(pmdev, pmdev->pages[index].read_ein, 5);
@@ -1149,6 +1161,14 @@ static int pmbus_write_data(SMBusDevice *smd, uint8_t *buf, uint8_t len)
         }
         break;
 
+    case PMBUS_VOUT_MIN:                  /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VOUT_RATING) {
+            pmdev->pages[index].vout_min = pmbus_receive16(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
     case PMBUS_POUT_MAX:                  /* R/W word */
         if (pmdev->pages[index].page_flags & PB_HAS_VOUT) {
             pmdev->pages[index].pout_max = pmbus_receive16(pmdev);
@@ -1482,6 +1502,10 @@ static int pmbus_write_data(SMBusDevice *smd, uint8_t *buf, uint8_t len)
         pmdev->pages[index].status_other = pmbus_receive8(pmdev);
         break;
 
+    case PMBUS_STATUS_MFR_SPECIFIC:        /* R/W byte */
+        pmdev->pages[index].status_mfr_specific = pmbus_receive8(pmdev);
+        break;
+
     case PMBUS_PAGE_PLUS_READ:            /* Block Read-only */
     case PMBUS_CAPABILITY:                /* Read-Only byte */
     case PMBUS_COEFFICIENTS:              /* Read-only block 5 bytes */
diff --git a/include/hw/i2c/pmbus_device.h b/include/hw/i2c/pmbus_device.h
index 62bd38c83f..72c0483149 100644
--- a/include/hw/i2c/pmbus_device.h
+++ b/include/hw/i2c/pmbus_device.h
@@ -43,6 +43,7 @@ enum pmbus_registers {
     PMBUS_VOUT_DROOP                = 0x28, /* R/W word */
     PMBUS_VOUT_SCALE_LOOP           = 0x29, /* R/W word */
     PMBUS_VOUT_SCALE_MONITOR        = 0x2A, /* R/W word */
+    PMBUS_VOUT_MIN                  = 0x2B, /* R/W word */
     PMBUS_COEFFICIENTS              = 0x30, /* Read-only block 5 bytes */
     PMBUS_POUT_MAX                  = 0x31, /* R/W word */
     PMBUS_MAX_DUTY                  = 0x32, /* R/W word */
@@ -255,6 +256,7 @@ OBJECT_DECLARE_TYPE(PMBusDevice, PMBusDeviceClass,
 #define PB_HAS_TEMP3               BIT_ULL(42)
 #define PB_HAS_TEMP_RATING         BIT_ULL(43)
 #define PB_HAS_MFR_INFO            BIT_ULL(50)
+#define PB_HAS_STATUS_MFR_SPECIFIC BIT_ULL(51)
 
 struct PMBusDeviceClass {
     SMBusDeviceClass parent_class;
@@ -295,6 +297,7 @@ typedef struct PMBusPage {
     uint16_t vout_droop;               /* R/W word */
     uint16_t vout_scale_loop;          /* R/W word */
     uint16_t vout_scale_monitor;       /* R/W word */
+    uint16_t vout_min;                 /* R/W word */
     uint8_t coefficients[5];           /* Read-only block 5 bytes */
     uint16_t pout_max;                 /* R/W word */
     uint16_t max_duty;                 /* R/W word */
-- 
2.35.1.616.g0bdcbb4464-goog

