Received: by 2002:a05:7022:1005:b0:83:cb6b:1575 with SMTP id em5csp1560235dlb;
        Tue, 9 Jul 2024 08:28:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVNISUznazsMawPREjjdO6Fgc8d4XpyfDW/gDTRur3ruBaWmo+KucpRvQCHjLMnF60+ZL0p+rjJX8uss9uruyBChs5Fe4w6
X-Google-Smtp-Source: AGHT+IG398CbO3crwmi+lRrIs2rSb3D5vDZ1rnNdfKJqbXJzgK9e0B1CpUcrDLAa15sy9C8f33Qc
X-Received: by 2002:ac8:7f92:0:b0:447:e21e:e24b with SMTP id d75a77b69052e-447faaa5955mr24763671cf.65.1720538890139;
        Tue, 09 Jul 2024 08:28:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720538890; cv=none;
        d=google.com; s=arc-20160816;
        b=rhggovdoq5o9bQwjocT32n4Sc6WC2NyT1kSi/DfpvGJr4nSP12gHV/WOnDdKfKY8yB
         sW91vINgDqwmL39wRAI2yOKPhbKJ9VuckC4oG3cWqiovWbDIyxYTjdh6Mc2z2dS4ArPj
         aaAZYMfzotEajijlT6DC3EP1yD2d3dGYaUaqr9U5xHf88PcXsYBeqrHGfnIxxkPY+1pD
         qQct9oRTAMxQQ9JQOvYfB3P3ONIdr8ZAWtOkRGdC/iFiBVB6I9rlkPB/ACrbFdD0onKy
         8LI+nkXsb4gWfcakqrJrS3QCbg3aTw2TkLrN/Iba9pVp6Aq0CAQ5W+KU6MA1Cy1MrWeW
         xiBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=PiXvczI/K3L/YAxv9emlFnk584vxqItosgTLQuNQXtQ=;
        fh=Txzf7K5YV+qryaChbcvqA4D4sw+KVK3yVi4ERabJCxo=;
        b=bwcg8b4NADHz/a2YauWwaYlEe7RBKCidChHdHAa8bF5PVWd7taVtwDUbfaiPM3RifA
         cnE+W7TL4kkOwF59Wfv5bI6NSpfreosi2A2bqbJcaJmA3B4I2HHjEYlYiWjq2ByGXueM
         zkYENWhdzhTqgShJtrjgfrA5k+X1XMBmkK5nuoZRDWUp8ImuGC/TXwiEwcZOT6QFvE/6
         oS8lGrYXGopzwLG+RShflFplrPxt/z6TIk5wR7/+hhsbodN7AXhZvNiUngpnHhNuXQws
         GO2rloqbitjkKGlpEwhd2nDHwwLITs8sCrM9y92vHBwHjytGfi6HbKJIpqnDBVCZWm0+
         pD8g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pH3AEk9+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-447f9c0b65csi23154111cf.719.2024.07.09.08.28.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2024 08:28:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pH3AEk9+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRCkY-00009w-Sx; Tue, 09 Jul 2024 11:27:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sRCkX-0008Lz-Nt
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 11:27:25 -0400
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sRCkU-0006Oz-81
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 11:27:25 -0400
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-52ea33671ffso4877405e87.3
 for <qemu-arm@nongnu.org>; Tue, 09 Jul 2024 08:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720538840; x=1721143640; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PiXvczI/K3L/YAxv9emlFnk584vxqItosgTLQuNQXtQ=;
 b=pH3AEk9+8CnSYWfSBZbiBgmEJcvi5aWFN8nrFWu6D86kbWrDIxBHb9lUGqp88x/aYn
 4ZlnIO2v8ZgXil08ppfuXWHcUy56j9rcznUs8JPU22BhQ0iOXZWOcwWqh48uYX3KxxmJ
 iXU95s9/UXsdIp091jewSPF/tiETWTxS52WC74Sp4xzwzqgPDJgBVjKRLsOX6TmF6Xvx
 DSW84vErpXK+DA0RfCcwz1WqnW0C4LjXOOW6JLT3Vo9Ck08mWNn8LlKSf59icCQA8Rg2
 Y0pvYt0UnEUE4LFRcAVVTtPH1rtM/41vx1RV4ei+GUA2BTWIh6ppbbwWMyfieePDncAr
 pCwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720538840; x=1721143640;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PiXvczI/K3L/YAxv9emlFnk584vxqItosgTLQuNQXtQ=;
 b=bdkgeGtAfd8to5vRSeb+5lPyPN+ej4ZqX5tdg0UCd9AR4HjV5p6CLTouMswFK9+Qhl
 Kh1rjSN3Wwa3riUMRxT84tLQqlzunBTXx9qcKmnEI0LpHMxhiHGY1H5nZU2KaAAnHO7B
 3borDaO4xisRO1orf0j0KSYCjw98XlVMfOWeM6SP15VbIHwSDj2Yjp+fd+gsjW9FGUdI
 SF+JAtPs49YzmFfzpfWoRVazhYXTThTPeIGq8qbezFBHESiEk8BrWHxeDXHToUPR4WHr
 HkANk6uM+6qHoRnr/ro8SMwhshIUX5TGmD7+/82Cp1CwQZqTKMrBMejDxbqRWBOJq6+v
 csGQ==
X-Gm-Message-State: AOJu0YyeeEJB67ykprNCIyQcLxkXmmzJcTxAk4YtF06TkXzEoDKbUNUm
 tcenU9iPI7t+XUEDBf4inT1l7neq3vED0U4fwJ6XpGq+UgkGmAie94JC5bKAgnvtFzEcnZuDk9a
 Q
X-Received: by 2002:a19:f80d:0:b0:52e:97dc:f5c4 with SMTP id
 2adb3069b0e04-52eb999b36cmr1551519e87.25.1720538840211; 
 Tue, 09 Jul 2024 08:27:20 -0700 (PDT)
Received: from m1x-phil.lan (vau06-h02-176-184-43-20.dsl.sta.abo.bbox.fr.
 [176.184.43.20]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427270238a6sm12811475e9.20.2024.07.09.08.27.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 09 Jul 2024 08:27:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, qemu-block@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Bin Meng <bmeng.cn@gmail.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>
Subject: [PATCH v47 13/19] hw/sd/sdcard: Migrate ExtCSD 'modes' register
Date: Tue,  9 Jul 2024 17:25:50 +0200
Message-ID: <20240709152556.52896-14-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240709152556.52896-1-philmd@linaro.org>
References: <20240709152556.52896-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: KpZzAUeQskPk

Spec v4.3, chapter 8.4 "Extended CSD register":

  The Extended CSD register defines the card properties
  and selected modes. It is 512 bytes long. The most
  significant 320 bytes are the Properties segment, which
  defines the card capabilities and cannot be modified by
  the host. The lower 192 bytes are the Modes segment,
  which defines the configuration the card is working in.

Only migrate the Modes segment (192 lower bytes).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/sd/sd.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 2a687977d1..a391f12b2a 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -124,7 +124,13 @@ struct SDState {
     uint16_t rca;
     uint32_t card_status;
     uint8_t sd_status[64];
-    uint8_t ext_csd[512];
+    union {
+        uint8_t ext_csd[512];
+        struct {
+            uint8_t ext_csd_rw[192]; /* Modes segment */
+            uint8_t ext_csd_ro[320]; /* Properties segment */
+        };
+    };
 
     /* Static properties */
 
@@ -881,6 +887,24 @@ static const VMStateDescription sd_ocr_vmstate = {
     },
 };
 
+static bool vmstate_needed_for_emmc(void *opaque)
+{
+    SDState *sd = opaque;
+
+    return sd_is_emmc(sd);
+}
+
+static const VMStateDescription emmc_extcsd_vmstate = {
+    .name = "sd-card/ext_csd_modes-state",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = vmstate_needed_for_emmc,
+    .fields = (const VMStateField[]) {
+        VMSTATE_UINT8_ARRAY(ext_csd_rw, SDState, 192),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
 static int sd_vmstate_pre_load(void *opaque)
 {
     SDState *sd = opaque;
@@ -928,6 +952,7 @@ static const VMStateDescription sd_vmstate = {
     },
     .subsections = (const VMStateDescription * const []) {
         &sd_ocr_vmstate,
+        &emmc_extcsd_vmstate,
         NULL
     },
 };
-- 
2.41.0

