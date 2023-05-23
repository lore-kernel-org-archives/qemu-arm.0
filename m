Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2058087ejb;
        Tue, 23 May 2023 11:05:54 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7cp7eE75+4JxMwBsSr1mnjC5rXnUVrVKKk0XKKyaIGthWJ44wydX9pzxiuy4s+/hlrpEOQ
X-Received: by 2002:a05:6214:19ed:b0:625:7c0b:4640 with SMTP id q13-20020a05621419ed00b006257c0b4640mr12801767qvc.22.1684865153963;
        Tue, 23 May 2023 11:05:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684865153; cv=none;
        d=google.com; s=arc-20160816;
        b=KpKktfu9CHCUfswJ9rea2Mi2Zob2lf/KYRclrafXont59y2J++sExYyYjJT69kQD9p
         ZNrQSP/aixe4gPiBmhh6rD+dul9YibkNoHH8Evwt2a7JUWZ/ve39VZEYQ0N+w+TnLliz
         M+UbNvTu2RYui/7E3jjrgBTvstytO8CZBRrjWA0x6FLML7+fsRsBerpfXsoX4qkEnhvA
         WNTaFpV5JIDAv/4IdOny3uHICoTgnfB7PRG2OjVeEgBUlWap1QgrPOH9a4o3Y5TvwVn+
         3HinbnLimR+5jEWw9S4hHUEk/yobjBFl3ef5Z1cVARyWesWsF+D7K5LPTep8K3oAL9Gw
         k3nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=nDi6GfNnvT/vqWO0PSF691Pglgusruaf9OMbvw+d7nE=;
        b=wfR8y2xiySLTXBSZkjpL68V0efBQM3HqL+nzzgxJm2ejT4qvlPyFVzjpskR2lg/Qac
         ouIYYUV+T06kpUFE9hqwbEmFo3D8puO56A6oQVrYuUTnt4HbdxES/53CeYUJa/0naWdt
         6lBpMKHlNIW7NWsL3oRu27tMVP8VutYo01LB7nchFTHdHycP28tk8bHPQ4J5FbUL48v8
         hn7F2PHKYb8tVIMMunq7wv1w2e94uzt0akPtUkmRUWTUWF/JX0rzKd4cUU55hMYLeSPb
         Y+jiTDGRkrZKL15rhGT2Bg+xEhbtNbSTjwr4gkIbYaVelDOjzHXo3IsikLkftYGylJcI
         TeaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=aq7i5w+3;
       dkim=neutral (no key) header.i=@nongnu.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jv14-20020a05621429ee00b006211ad6e707si5372200qvb.532.2023.05.23.11.05.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 May 2023 11:05:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=aq7i5w+3;
       dkim=neutral (no key) header.i=@nongnu.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1WOD-0006rq-GE; Tue, 23 May 2023 14:05:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1q1WOA-0006rH-Op; Tue, 23 May 2023 14:05:38 -0400
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1q1WO8-0007V6-AM; Tue, 23 May 2023 14:05:38 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 79706228C4;
 Tue, 23 May 2023 18:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1684865134; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nDi6GfNnvT/vqWO0PSF691Pglgusruaf9OMbvw+d7nE=;
 b=aq7i5w+3Di9hkqbmZ6AYszHZ1kHr6R/yTFw53yQbL7goqtvdK0c1ViR74Kb1KtVxezMwuB
 H68UYwnP+22SmT9cFrt0K6BIcsL6ggsXPrYnmmGb4dj6RLfcfmZ9XRwcnrfxc6tr3sF+Th
 k28WH3UKxE3yTdjOFpItlp+nvJcRMzw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1684865134;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nDi6GfNnvT/vqWO0PSF691Pglgusruaf9OMbvw+d7nE=;
 b=ZtymjNViLUsSR6ngZDCtJOOuBgKLkP4NJDHth/0kLlXvDp1Pxw5CseuNmPy2+peuURAQRb
 Oq6JPSi/52CHvBCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A9F8613A10;
 Tue, 23 May 2023 18:05:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cKE7HGwAbWQMQwAAMHmgww
 (envelope-from <farosas@suse.de>); Tue, 23 May 2023 18:05:32 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH 2/3] arm/Kconfig: Keep Kconfig default entries in default.mak
 as documentation
Date: Tue, 23 May 2023 15:05:24 -0300
Message-Id: <20230523180525.29994-3-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230523180525.29994-1-farosas@suse.de>
References: <20230523180525.29994-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: pbR7hrgHcYZf

When we moved the arm default CONFIGs into Kconfig and removed them
from default.mak, we made it harder to identify which CONFIGs are
selected by default in case users want to disable them.

Bring back the default entries into default.mak, but keep them
commented out. This way users can keep their workflows of editing
default.mak to remove build options without needing to search through
Kconfig.

Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 configs/devices/aarch64-softmmu/default.mak |  6 ++++
 configs/devices/arm-softmmu/default.mak     | 40 +++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/configs/devices/aarch64-softmmu/default.mak b/configs/devices/aarch64-softmmu/default.mak
index 70e05a197d..f82a04c27d 100644
--- a/configs/devices/aarch64-softmmu/default.mak
+++ b/configs/devices/aarch64-softmmu/default.mak
@@ -2,3 +2,9 @@
 
 # We support all the 32 bit boards so need all their config
 include ../arm-softmmu/default.mak
+
+# These are selected by default when TCG is enabled, uncomment them to
+# keep out of the build.
+# CONFIG_XLNX_ZYNQMP_ARM=n
+# CONFIG_XLNX_VERSAL=n
+# CONFIG_SBSA_REF=n
diff --git a/configs/devices/arm-softmmu/default.mak b/configs/devices/arm-softmmu/default.mak
index 647fbce88d..980c48a7d9 100644
--- a/configs/devices/arm-softmmu/default.mak
+++ b/configs/devices/arm-softmmu/default.mak
@@ -4,3 +4,43 @@
 # CONFIG_TEST_DEVICES=n
 
 CONFIG_ARM_VIRT=y
+
+# These are selected by default when TCG is enabled, uncomment them to
+# keep out of the build.
+# CONFIG_CUBIEBOARD=n
+# CONFIG_EXYNOS4=n
+# CONFIG_HIGHBANK=n
+# CONFIG_INTEGRATOR=n
+# CONFIG_FSL_IMX31=n
+# CONFIG_MUSICPAL=n
+# CONFIG_MUSCA=n
+# CONFIG_CHEETAH=n
+# CONFIG_SX1=n
+# CONFIG_NSERIES=n
+# CONFIG_STELLARIS=n
+# CONFIG_STM32VLDISCOVERY=n
+# CONFIG_REALVIEW=n
+# CONFIG_VERSATILE=n
+# CONFIG_VEXPRESS=n
+# CONFIG_ZYNQ=n
+# CONFIG_MAINSTONE=n
+# CONFIG_GUMSTIX=n
+# CONFIG_SPITZ=n
+# CONFIG_TOSA=n
+# CONFIG_Z2=n
+# CONFIG_NPCM7XX=n
+# CONFIG_COLLIE=n
+# CONFIG_ASPEED_SOC=n
+# CONFIG_NETDUINO2=n
+# CONFIG_NETDUINOPLUS2=n
+# CONFIG_OLIMEX_STM32_H405=n
+# CONFIG_MPS2=n
+# CONFIG_RASPI=n
+# CONFIG_DIGIC=n
+# CONFIG_SABRELITE=n
+# CONFIG_EMCRAFT_SF2=n
+# CONFIG_MICROBIT=n
+# CONFIG_FSL_IMX25=n
+# CONFIG_FSL_IMX7=n
+# CONFIG_FSL_IMX6UL=n
+# CONFIG_ALLWINNER_H3=n
-- 
2.35.3

