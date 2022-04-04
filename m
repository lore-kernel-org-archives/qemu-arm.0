Received: by 2002:a19:6a18:0:0:0:0:0 with SMTP id u24csp303340lfu;
        Mon, 4 Apr 2022 09:07:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjbbtS17+zE4gmmUWaF/YhhSkec9uyH4Kwr3Wl9H7UiBOyrzBnaapqlNsSbFW+S7UseLe5
X-Received: by 2002:a25:adc8:0:b0:633:b79d:92ee with SMTP id d8-20020a25adc8000000b00633b79d92eemr450184ybe.457.1649088466070;
        Mon, 04 Apr 2022 09:07:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649088466; cv=none;
        d=google.com; s=arc-20160816;
        b=gas+/jN5w6KT0Ay0fS95M5YANk4sA90GH72kMPXQydPKA00qJjCApJVABjBIRfxlqZ
         skoZ2wKaa8omt1KVxJLOGcGV6WlHNTibl6KVwn7cfWFIL1ZexSQHw18OyaLjxtxAe5dF
         k6ik7gmBsSvlnK/iK5FfetQXX5VmaGHLwilA9f3nw44DTMpk1RoIm7guFQojMSb1iadX
         V1CUHG4EEF+sbLE9UV67CtqBIfRMCbRCavYpAWra0eJSl9THEdUPuLynAr7m5+QFC6kK
         PtDvoMMxpknxYqwrOQI1x6r3w9kImxrtvK0tgoIRYqS//s566mkk2SfKAjt1f+MuIWkr
         tqjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=FuDOYhuH9z3OYdG3JyUjI/cHbnZxsTHuxtWNAPPhFY4=;
        b=fu0azBf9IdXQuffvzQR7to5lGDhitgoXLIVjIcjV9oupUYDIpzHAUWAQmsWMugrlkY
         x2Z8NgUKOlqihiFsemy1emgwJnLuwzYO7/xDg8IRuzenjIJAh07B0otvcmO4MDP2p7rS
         UhykQE98C7G57yXuL9vJ/Q0Jz5J52KAcSESRrf4e8D/sZOSM6+4tCmElbO56v64O2Piy
         MHAGN3meZcLGPzGo3Hr8k9IpsMbSq4kDH1y1gZmA1cet+WqiFw54SOmAEhBaIgDB0HAk
         u9SLXA4BhQcaP6UhJhm9errRmeq8ERiMDaYQ4ZwgESFsYi3VIxrY2+7YniZ8sf4gd791
         ARcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KGzW5rXY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w7-20020a816207000000b002ea56eabe9fsi8481903ywb.463.2022.04.04.09.07.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Apr 2022 09:07:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KGzW5rXY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nbPF3-0006EV-FX
	for alex.bennee@linaro.org; Mon, 04 Apr 2022 12:07:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbP10-00065d-8l
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 11:53:14 -0400
Received: from [2a00:1450:4864:20::42b] (port=35800
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbP0y-0001NG-Gx
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 11:53:13 -0400
Received: by mail-wr1-x42b.google.com with SMTP id w21so15208415wra.2
 for <qemu-devel@nongnu.org>; Mon, 04 Apr 2022 08:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FuDOYhuH9z3OYdG3JyUjI/cHbnZxsTHuxtWNAPPhFY4=;
 b=KGzW5rXYjfqTTD+D9dbFPFCQjjj2KZOcbjOdyAp4ebkak8qtFThz7q1RgtF8mqnajL
 qQ3ZSNWpIRaA6nRbE0+9iavW1LuMibV7q6L7pylKB71OOxuEJppUEEN8fIsmz4ib7rzW
 OFzf5qaidzxngdc/g3dz1zi/Ygv/V+b0BGbOEa8Eyhhl5JV2GRD2sz7hYeueJTRy8zGd
 U5f9p1XRd1smTj8b7ERdSV7y/0e416gCMmF4B+z+3jwDzGJZLblZ8LdiGfcUR/idhvZ/
 5gIGn+y2xnSwq43vFX7bm+uk4a2E4C/bE/+kTTNM9O2ZzLAJ1bRPKteRAGy4ZgG1D+lQ
 5hZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FuDOYhuH9z3OYdG3JyUjI/cHbnZxsTHuxtWNAPPhFY4=;
 b=L++RmiAS9IlFz7/Ygy2LWirJHRBdA3ILuutjl6EjjCj4OkvZUc+UeAzMgp4GKbRKhl
 WspDlo/iOcfjAQXU4E3t3hhvrhpI9NXavsEn8Kqatr+N2y7MyoyA+SA2rxY/mI7sgoKM
 w/TG5MvjMeVkjMbt6BIJTghoJ7roZGXtCrS5vH2+et5+C+lIFDNrgBNltsl55sfiS11/
 F3E4tgS9o0Na/u/w6AowCLn3jFD0ZDaFhEMUhMoxBjmj7oXrwd5lmTIcVGJPWBSMuRsN
 0oYd/yanpoDuTRpBaTiBzVRe63GKVoyAPJjSuPJc2rSmyTN4w5x/+EAwuRHRMXzxW9wd
 eJoA==
X-Gm-Message-State: AOAM530VfrZ6G6hrkkXbqx1WxBvOxMkRq7GW65Ym6IECrYAEkWc0FTbX
 JdP9upfOBiy7luHutbTKOvfZK6Au6YL8NQ==
X-Received: by 2002:a5d:58d7:0:b0:206:f0f:18d5 with SMTP id
 o23-20020a5d58d7000000b002060f0f18d5mr282727wrf.271.1649087583285; 
 Mon, 04 Apr 2022 08:53:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 k11-20020a5d6d4b000000b0020599079f68sm9733858wri.106.2022.04.04.08.53.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 08:53:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-7.1] hw/arm/virt: Check for attempt to use TrustZone with
 KVM or HVF
Date: Mon,  4 Apr 2022 16:53:01 +0100
Message-Id: <20220404155301.566542-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: qxNOYIW6KoNO

It's not possible to provide the guest with the Security extensions
(TrustZone) when using KVM or HVF, because the hardware
virtualization extensions don't permit running EL3 guest code.
However, we weren't checking for this combination, with the result
that QEMU would assert if you tried it:

$ qemu-system-aarch64 -enable-kvm -machine virt,secure=on -cpu host -display none
Unexpected error in object_property_find_err() at ../../qom/object.c:1304:
qemu-system-aarch64: Property 'host-arm-cpu.secure-memory' not found
Aborted

Check for this combination of options and report an error, in the
same way we already do for attempts to give a KVM or HVF guest the
Virtualization or MTE extensions. Now we will report:

qemu-system-aarch64: mach-virt: KVM does not support providing Security extensions (TrustZone) to the guest CPU

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Not a regression, so not worth fixing in 7.0.
---
 hw/arm/virt.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index d2e5ecd234a..8f94e2fde62 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2048,6 +2048,13 @@ static void machvirt_init(MachineState *machine)
         exit(1);
     }
 
+    if (vms->secure && (kvm_enabled() || hvf_enabled())) {
+        error_report("mach-virt: %s does not support providing "
+                     "Security extensions (TrustZone) to the guest CPU",
+                     kvm_enabled() ? "KVM" : "HVF");
+        exit(1);
+    }
+
     if (vms->virt && (kvm_enabled() || hvf_enabled())) {
         error_report("mach-virt: %s does not support providing "
                      "Virtualization extensions to the guest CPU",
-- 
2.25.1

