Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp442648njb;
        Fri, 13 Dec 2024 05:35:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWKX3L3gGDgV2fePFdkg0wEA9010/7tAEz6pCG9k8DiWkdOtLyzpBFy/Gd1Rb5yvnlBPHZLhqusCm0ypQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFPEvCDTza3PAD8K1nWpfJTpeRoZGR7XHtqAOT8svPAHxLjj54SPiZoZio3h0ZwUStLgq0f
X-Received: by 2002:ac8:5d07:0:b0:461:161b:c178 with SMTP id d75a77b69052e-467a577dd2fmr47618871cf.13.1734096904977;
        Fri, 13 Dec 2024 05:35:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734096904; cv=none;
        d=google.com; s=arc-20240605;
        b=GokBzdWDSs3OWBrDFMgQEoTJx6vDMtsOgy7XFM38CKlTL75lwnAvqFm6p5Q0Wb5t+Z
         PJZXDQtG7NAGmyLgeY4L6Cip9QUEMy0iPZFZwGXUpP7z583RPQWSo5b9NE/rAuOLfyR8
         1Pe9FVnMtGAFkCG+uu/xDbA9/To0/bqYTwhI0cxPlDpaOZ4EuwOjnSqeLyAwKoX4+j11
         uRCu/c8Qm2DAWOFZ8o9+BSEeOjLnOg8Sj5AidJwe2r9nMMidBKxSJsWFyJ7eMVK8n4z3
         /iDbq+4E2tiIaIO5UqKSWm0HbTrorlHFVSDQvlCCQa7fQ0bhjTs6zexMn0dGABPJPtDl
         VFgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=3yF4gTyIXghUKxGkr5yLxPBvl2lN3UWs2PgcMEYcsVo=;
        fh=5/bEEfneXpYiCSLu1RRtIdWOVpk1SgQYYFlk2zFRZHo=;
        b=HBePjjVZQxJ8CsDvNFn2PVmjRewoakqdb/bBPBBX4TyFo7SrrRZ+D7adUPGcegBFKK
         miXGJ9R73WLFMXchEcQxpe+37vEH1Crn0OxtmP7Qfl/Tt1wmkW7ekDdmstPuZKDzotzD
         oNznR1tOKysce9Ngr0cliO65+E6IsGScSnZb95HP7CY6013soegOQ+b0uM2FT/GHRrJD
         j9oe/L3bMJ34Y903vFNtVwaTKZddlUE/v/T6a2wyN1Zde3mAaGBNNCZfoQU5me9iWRvQ
         RmFX2aboO8QS7LZGK0mu1EqRzaURLOIpTJq2GInKszolEArTiOBS5qhjn80dCiD1AOBe
         WrzA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qz6cua3o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4676aed3eedsi114825111cf.706.2024.12.13.05.35.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Dec 2024 05:35:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qz6cua3o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tM5oT-0005KX-Ka; Fri, 13 Dec 2024 08:34:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tM5o0-0005AS-8m
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 08:34:13 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tM5ny-00015L-ED
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 08:34:07 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43626213fffso9970785e9.1
 for <qemu-arm@nongnu.org>; Fri, 13 Dec 2024 05:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734096844; x=1734701644; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3yF4gTyIXghUKxGkr5yLxPBvl2lN3UWs2PgcMEYcsVo=;
 b=Qz6cua3o3GmLITMHIWaoM+dqq8LkublH2Ui8KZHaNkZOFBVG/oiJ3BVoBVeexanO0g
 o9mwRgf4s+rRjFufr+1g+xq8dVk2yci8waQm/POFqLfW8tXRFuhMtzbT31nAHLmRHvfd
 pAzY7xFwuSHqBe8VgPQC1XdpnbF6p9/6bIMkWAzC4xpM8QhMRbE/0TP53pnsLSxofAXU
 Gcxb/cEWQ3hU3q+BnU2zbaaHpWdbmxa5p0xLaxfyFO2sx9/Y7r9k4cuEX41FYKfaEyEd
 ogiksFdAwCr+WgiOge+jlEJrZjGvIXmOGQs+hv80jBQHCZ83Nczo7vPnNSLDLESfFi8b
 acww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734096844; x=1734701644;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3yF4gTyIXghUKxGkr5yLxPBvl2lN3UWs2PgcMEYcsVo=;
 b=vETQhf/rGeycdizkgwy2ukGXksGF6X77Hcx/5Hu3b4r911YmS7uQTXbOyGGirssdVI
 Y6ZBPebqQ2WrcK8Kb8ecf5Vmj5F4yXgTjjfSCMYMk2Eqd85Xb6CTL7Y1kJUImqQBGoMG
 6agig9JXta0O9b9DLF1acDURruXN7gOlQFTk/UgmQQMT76nBlX6ykpZDhYZjX9nQAhGG
 lTicLU69QIS/tNFduS5yftfDbQd6A0J6zwBedNAr9154ND2GzXQeXUYztGft9oNtnEvy
 vFQkGUraMbzjU32dAM4U7EeS8z8iWCVtS67m9VkzwjM7CNPBdFUy9QplCPGDmFulQnPZ
 Vfug==
X-Gm-Message-State: AOJu0Yxy49bynbZ1kojTR+mmKY4QLw905DNC49ewMu7TJ/pQ9A+Dw98k
 Ll0Pb/T8J+XpCEt6k4+X6KgBQlOzteVQ/BoQYoU52XvYdynJBr1bgXX/vOqdKok=
X-Gm-Gg: ASbGncv+q7ngbANO8oQmQV/9+obxCdPRHl9bu1tVmxpXfkatjB1E4rChx9hkmRX3Kio
 fkeQt3O9SA1oMYF6bf5v7iv2JtJJSbCBgOKGyi8qBV+eu19P3XnF3hh1t5E9VZoJm341t26P0by
 +BnXUQxt6RiENZ3O50DLOQ4fFupDr/gKfb9ChyRxJQ8xZgUicLMOvZurkdMDlzfBYAUxQCYIVYK
 7nBQzbQi8BX5qjIGBHYpbrsA65BdyA56Ck9axu0cjcjnw70Iug0cnB9yVXWUAdQ9mLR50QiqtrZ
 Cr1Hk/apfpAdrLV52dfmL79wMSY1eOxCkmK+
X-Received: by 2002:a05:6000:491b:b0:386:3d27:b4f0 with SMTP id
 ffacd0b85a97d-38788805406mr6166037f8f.14.1734096844432; 
 Fri, 13 Dec 2024 05:34:04 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38782521dfesm6969358f8f.107.2024.12.13.05.34.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Dec 2024 05:34:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 2/7] hw/nvram/fw_cfg: Pass QOM parent to
 fw_cfg_add_file_from_generator()
Date: Fri, 13 Dec 2024 14:33:47 +0100
Message-ID: <20241213133352.10915-3-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241213133352.10915-1-philmd@linaro.org>
References: <20241213133352.10915-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ZWaqOmvH28L3

Currently fw_cfg_add_file_from_generator() is restricted
to command line created objects which reside in the
'/objects' QOM container. In order to extend to other
types of containers, pass the QOM parent by argument.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 include/hw/nvram/fw_cfg.h | 10 ++++++----
 hw/nvram/fw_cfg.c         | 11 ++++++-----
 system/vl.c               |  3 ++-
 3 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
index 14e68966c59..fcb06f18cc3 100644
--- a/include/hw/nvram/fw_cfg.h
+++ b/include/hw/nvram/fw_cfg.h
@@ -294,11 +294,12 @@ void *fw_cfg_modify_file(FWCfgState *s, const char *filename, void *data,
  * fw_cfg_add_file_from_generator:
  * @s: fw_cfg device being modified
  * @filename: name of new fw_cfg file item
- * @gen_id: name of object implementing FW_CFG_DATA_GENERATOR interface
+ * @part: name of object implementing FW_CFG_DATA_GENERATOR interface
+ * @parent: the object in which to resolve the @part
  * @errp: pointer to a NULL initialized error object
  *
  * Add a new NAMED fw_cfg item with the content generated from the
- * @gen_id object. The data generated by the @gen_id object is copied
+ * @part object. The data generated by the @part object is copied
  * into the data structure of the fw_cfg device.
  * The next available (unused) selector key starting at FW_CFG_FILE_FIRST
  * will be used; also, a new entry will be added to the file directory
@@ -307,8 +308,9 @@ void *fw_cfg_modify_file(FWCfgState *s, const char *filename, void *data,
  *
  * Returns: %true on success, %false on error.
  */
-bool fw_cfg_add_file_from_generator(FWCfgState *s, const char *filename,
-                                    const char *gen_id, Error **errp);
+bool fw_cfg_add_file_from_generator(FWCfgState *s,
+                                    Object *parent, const char *part,
+                                    const char *filename, Error **errp);
 
 /**
  * fw_cfg_add_extra_pci_roots:
diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index fe3b86135a7..b94cd27bd85 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -1027,22 +1027,23 @@ void *fw_cfg_modify_file(FWCfgState *s, const char *filename,
     return NULL;
 }
 
-bool fw_cfg_add_file_from_generator(FWCfgState *s, const char *filename,
-                                    const char *gen_id, Error **errp)
+bool fw_cfg_add_file_from_generator(FWCfgState *s,
+                                    Object *parent, const char *part,
+                                    const char *filename, Error **errp)
 {
     FWCfgDataGeneratorClass *klass;
     GByteArray *array;
     Object *obj;
     gsize size;
 
-    obj = object_resolve_path_component(object_get_objects_root(), gen_id);
+    obj = object_resolve_path_component(parent, part);
     if (!obj) {
-        error_setg(errp, "Cannot find object ID '%s'", gen_id);
+        error_setg(errp, "Cannot find object ID '%s'", part);
         return false;
     }
     if (!object_dynamic_cast(obj, TYPE_FW_CFG_DATA_GENERATOR_INTERFACE)) {
         error_setg(errp, "Object ID '%s' is not a '%s' subclass",
-                   gen_id, TYPE_FW_CFG_DATA_GENERATOR_INTERFACE);
+                   part, TYPE_FW_CFG_DATA_GENERATOR_INTERFACE);
         return false;
     }
     klass = FW_CFG_DATA_GENERATOR_GET_CLASS(obj);
diff --git a/system/vl.c b/system/vl.c
index f103532a9a1..4a370da624a 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -1184,7 +1184,8 @@ static int parse_fw_cfg(void *opaque, QemuOpts *opts, Error **errp)
         size = strlen(str); /* NUL terminator NOT included in fw_cfg blob */
         buf = g_memdup(str, size);
     } else if (nonempty_str(gen_id)) {
-        if (!fw_cfg_add_file_from_generator(fw_cfg, name, gen_id, errp)) {
+        if (!fw_cfg_add_file_from_generator(fw_cfg, object_get_objects_root(),
+                                            gen_id, name, errp)) {
             return -1;
         }
         return 0;
-- 
2.45.2

