Received: by 2002:a17:906:c0c2:b0:a52:4db9:938b with SMTP id bn2csp1281082ejb;
        Thu, 25 Apr 2024 04:06:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVVtf+g0tAHkpuh+iSW7SoNea+y0QOOXR5Un0zHKF7efYMS241D5HuBD+mAQjZ30Bq5igBef0WGdEQbXYnIGnBt3Rfl1b8Q
X-Google-Smtp-Source: AGHT+IHcSUOPjZQ2bbG+oLlPCFajUoDYqhfPuoh/iH435GvWX2B5go4DrYcrPaMLFqm5nQyTZQrX
X-Received: by 2002:a05:6102:1947:b0:47c:134d:45dd with SMTP id jl7-20020a056102194700b0047c134d45ddmr3763636vsb.34.1714043197163;
        Thu, 25 Apr 2024 04:06:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714043197; cv=none;
        d=google.com; s=arc-20160816;
        b=tbf0KMY3zq0C4eNXOVJTZ+PvK71Mn+7//c5lYrgh/OcWtbK/y5We5RCwrNwGYSmMsG
         ezrkSR02Kd1AMLlGyw0GqxTJ6ZzyW/nVNkyb0rMOvbpW2tGKYE/PAFMJwJyKOffA/Lwk
         /s1LwtRkLtz7ywyP6HIiWT/VNqyVBGUr1kLlu7cXlZftRIppFp6nQu4HE2TsbZ9LU5U/
         qrYazA2KyDmN/h2mzjrYlPSVa9BW9KFSxOdixLQwlNOykHrLAcWvODy68F8/i3qxoIuF
         O/EOAcuyBNSXzpsVAXQ3AwOSbCOsc2mBFsmk0/jHIJ4G6tkPEtuCu2VtZwx+YbQCBiSq
         Qmrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=vykN0pIt49J3GEMpH2YakbfFLS9d+NOdnblTzedh0DY=;
        fh=tf4aDhoxJ418CKcYhxtOJSlJyZ4nhPUH4lqzt6qxF40=;
        b=gYqMzW7t4nmCKfzH/W0mbvufZLtt7e1bOnHOGwyXmV5MrvVcTxljEtYrNNKMZIPP4N
         eO5QCXcbvVBDB66y5sRaYv4IzRwQLQ37X4sdAtLxaL3LHdLJaD3gSkxNzhFMlBR6+1nP
         Y63nFEErbIG9+j2p6Eqr9RcGIeLrJ5CNGjI+PMaq1nKEHxiR2XmcMgQIk7OvJnmJD3XN
         UVIKjV/GBdLq7a/7Obn+/WrZJWotZmOZ1+NHs+xXMIDScuglRMeEUEfPiM6NoAn8sZ+T
         20UTPgS1iS93EIYnpe5SRBY4AzqHB//m/OMJ0nHi/p+A0yocAVBmx8ojo5kI/iJB1oXP
         cOdw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ge/5W1Z5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o34-20020a0561023fa200b00479cd3ae0a3si3700509vsv.482.2024.04.25.04.06.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Apr 2024 04:06:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ge/5W1Z5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rzwvg-0005Eg-8p; Thu, 25 Apr 2024 07:06:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rzwtd-0000LJ-U6
 for qemu-arm@nongnu.org; Thu, 25 Apr 2024 07:04:11 -0400
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rzwtZ-0000Mr-AR
 for qemu-arm@nongnu.org; Thu, 25 Apr 2024 07:04:09 -0400
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2dac77cdf43so9600351fa.2
 for <qemu-arm@nongnu.org>; Thu, 25 Apr 2024 04:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714043039; x=1714647839; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vykN0pIt49J3GEMpH2YakbfFLS9d+NOdnblTzedh0DY=;
 b=ge/5W1Z5UVX3PPgyKn4UHFd9nbESU5wtOTP5095Bm6afywSeBiHPR5htX1M130Qno2
 XaV2Y+Sal3luYptmwrG+oNOxp/JMTvsZL9PjQhgsiqozUKtxQ3qymfYVfIsL1hnp+w7U
 3WP+c3tsTB9UmQ7oAh1nI1HXpLX52wAkmUmoB4mMKULchs7HLoE/PJRl9ZhUBrgEJVcb
 kRxsZ/RV/ShdXmv4b+vXS42eZFWq8RBOhH54OrSuD+FCQsDlv8IoJ9ryvWzD1rvYp4Tt
 dRt6r0yr5VmCD+4kCgfU08vUV06QEsJcJ7vFG+xj0q+Yk/9nNNtLsa/pMHUbNssLhWd/
 7hyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714043039; x=1714647839;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vykN0pIt49J3GEMpH2YakbfFLS9d+NOdnblTzedh0DY=;
 b=ZSG2q3W2a3pyww8m7JCjF6PYCUtx7t5U2HUefR+aAawJ2ZjqLteH/iVJWduq1JJjGm
 f0lbTwWCIPaSmDDFV0lZLv46CSHtj1jEemDaEbwPefPRpY17Y9jMEzSHCvWJ9JvTMYIW
 ktS0Aux0SDjldm91i4m0R7c+R1Khy68jpN7tAtcmPxDavrbWFNtoA6s6uUAQY6e8+oex
 iykSh8biUAIjT/Z8Gxrb8jShd7el3Rkn76oLO4+gGjv3Y9ZsPr2Mql83FQ8JLD5U9GkP
 5q3nvkRCU1QmGrfKRwx+X+fMXemSLq2Tc+kzqu5NlP/hlLFiXX29BHS5bEcH6c1xKqDZ
 A59A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUizce+OMjYKgQWvr/lT+RI/LsZJ1dGCvKsgOP/NGkQvLW6Ys1xnZY1v1CH2WBhbEK3pKxwJtQ4qxJEbqbtWpr4UQgG
X-Gm-Message-State: AOJu0YyfDkmYzHoSZqkTSJPWMNrIXkx33LSRTM5f9fY8s8UVO+8gZehc
 g86vHEuoKOVIueU06c3dZBgG3WYXH+/FkB6Uf353KMek0j8KsIQ2RcC2aJykeaM=
X-Received: by 2002:a2e:bb83:0:b0:2d8:901f:7f45 with SMTP id
 y3-20020a2ebb83000000b002d8901f7f45mr3356811lje.13.1714043039569; 
 Thu, 25 Apr 2024 04:03:59 -0700 (PDT)
Received: from localhost.localdomain ([92.88.170.77])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a05600c4e4400b0041b0f10fc7asm5000576wmq.31.2024.04.25.04.03.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 25 Apr 2024 04:03:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Xiaoyao Li <xiaoyao.li@intel.com>, Yongwei Ma <yongwei.ma@intel.com>,
 Babu Moger <babu.moger@amd.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Eric Blake <eblake@redhat.com>
Subject: [PULL 21/22] hw/core: Introduce module-id as the topology subindex
Date: Thu, 25 Apr 2024 13:01:54 +0200
Message-ID: <20240425110157.20328-22-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240425110157.20328-1-philmd@linaro.org>
References: <20240425110157.20328-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x230.google.com
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
X-TUID: nI6Pt0J5+kyI

From: Zhao Liu <zhao1.liu@intel.com>

Add module-id in CpuInstanceProperties, to locate the CPU with module
level.

Suggested-by: Xiaoyao Li <xiaoyao.li@intel.com>
Tested-by: Yongwei Ma <yongwei.ma@intel.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Tested-by: Babu Moger <babu.moger@amd.com>
Acked-by: Markus Armbruster <armbru@redhat.com>
Message-ID: <20240424154929.1487382-4-zhao1.liu@intel.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 qapi/machine.json          | 4 ++++
 hw/core/machine-hmp-cmds.c | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/qapi/machine.json b/qapi/machine.json
index 48f98e7d9f..bce6e1bbc4 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -988,6 +988,9 @@
 # @cluster-id: cluster number within the parent container the CPU
 #     belongs to (since 7.1)
 #
+# @module-id: module number within the parent container the CPU belongs
+#     to (since 9.1)
+#
 # @core-id: core number within the parent container the CPU belongs to
 #
 # @thread-id: thread number within the core the CPU  belongs to
@@ -1005,6 +1008,7 @@
             '*socket-id': 'int',
             '*die-id': 'int',
             '*cluster-id': 'int',
+            '*module-id': 'int',
             '*core-id': 'int',
             '*thread-id': 'int'
   }
diff --git a/hw/core/machine-hmp-cmds.c b/hw/core/machine-hmp-cmds.c
index a6ff6a4875..8701f00cc7 100644
--- a/hw/core/machine-hmp-cmds.c
+++ b/hw/core/machine-hmp-cmds.c
@@ -87,6 +87,10 @@ void hmp_hotpluggable_cpus(Monitor *mon, const QDict *qdict)
             monitor_printf(mon, "    cluster-id: \"%" PRIu64 "\"\n",
                            c->cluster_id);
         }
+        if (c->has_module_id) {
+            monitor_printf(mon, "    module-id: \"%" PRIu64 "\"\n",
+                           c->module_id);
+        }
         if (c->has_core_id) {
             monitor_printf(mon, "    core-id: \"%" PRIu64 "\"\n", c->core_id);
         }
-- 
2.41.0

