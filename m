Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp791884ejo;
        Fri, 5 Jan 2024 07:44:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmYg8X6QsHIFn8oK3OuhJaCqm2rT3R/VLj/gm9fD5S+6u6DQVU1IcmCVkpZiRJ9PI0eg/3
X-Received: by 2002:a05:620a:22e8:b0:781:ed01:f5e3 with SMTP id p8-20020a05620a22e800b00781ed01f5e3mr2522541qki.46.1704469466849;
        Fri, 05 Jan 2024 07:44:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704469466; cv=none;
        d=google.com; s=arc-20160816;
        b=e6BevEyrOOfSysL+cJc29IYSUFZiqJmYDlGuDmp4Nb5X6XYr/TYSvZzcQE2zsIQaQp
         4Kd8ZZMdIzL/HAE2Lq077GZjQphgH2p5t8N1aonlgko3lABWfyK9cRIN6dutIiMVwP4k
         FgDYzF6KtbhIs6AyQz3Ago6ol1RpDd8r+pCHCiPMseO1FqA8RtX7DXLSsRlyBvLVnYUM
         aCyEYNBLVPbmpBRRgf6sjn6paaOYE3adevteFL1yyK0/klHsA5PI9R6+x2RxGq4DEuv9
         7X38r33j3uhnmlo0AiuKGYq+gIBdd9IpXdm5CmwK0bTBHG6rVb2wR6+2jN0AKNxFhZW4
         LMYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ryursiHqH68ZqMgSdIiqgs1dXkhwVe0KhUL0m3rAt/Q=;
        fh=0elr7oOoKfORub8uK/pZAVpdgL0ap5d0Iqya8Kfg/4M=;
        b=0bZYJIANDsX/LK5pxMR/LXcjv5yTGOGyliQiR5EaD1xaVAD4pdkXRtpKgHdoY6ofxq
         2N5Qo2WRCUCF6IJcyZqUdt1Wzzv27nKg/dnsPk8CmgDcucXR8XTDqTpb+JQzc+MFeaSf
         lTi9whJteu4W1F0U9Uiq8YVRcBDNQaVXTY8WjeO5cVifHy2U4uMqPJFKAVQZ64Pve5eQ
         z6WSpHHyDuUoWQ3wgpVgR9pDA8NpcUfDO8d3sv12BWPKxQgGcRDnnc1WXrShxVwdY/0G
         C+elzGdYfwrnXGgSRhOGrv78EYTihH0qaLIkRSH2eVnDylIZ1XHBmode2hGOvpS0wTsS
         9Ibg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cmpwsCxD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id oq3-20020a05620a610300b00781e2961370si1847934qkn.332.2024.01.05.07.44.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 07:44:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cmpwsCxD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLmMK-0004ZB-KE; Fri, 05 Jan 2024 10:43:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmMI-0004Xi-7L
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:43:42 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmMG-00033z-HN
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:43:41 -0500
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-336746a545fso406956f8f.0
 for <qemu-arm@nongnu.org>; Fri, 05 Jan 2024 07:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469418; x=1705074218; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ryursiHqH68ZqMgSdIiqgs1dXkhwVe0KhUL0m3rAt/Q=;
 b=cmpwsCxDhwSGwMBLgEsmuqTLxYgA0itMEmKdxRtSKEMzV35Vd9hsHv3KejuodOfaPD
 axmk7Kc/Od9PYmTswgwB0argHEFOwMdquTwYLUYqlnud+zvFplJ5ChFQX91y9oangfMj
 NmdX4SfsN7V4TRs4jvo0BXjnSZbsbyqYU0BP847WnCnJGZxt9IXvqUbznJ8AyOtHNlYg
 4Z4jD+WeuOG8xFOLeEMbNw7xe5oOuPjkY6F0PJ1ZTQ7MXZ8T0gCdxU2avzNLGbQ4xtKy
 VC+XY0MC9VG9qot/a8hV5HENUCzSOmTljqfZjDOlrOGCBTqCFKq8fkJ9aQDCiVCujQd+
 75qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469418; x=1705074218;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ryursiHqH68ZqMgSdIiqgs1dXkhwVe0KhUL0m3rAt/Q=;
 b=BTm9A6adTnNZb+KDrcuKQybf9zurNjYDCIteywaQqSOuZdlofpbqClxazQM1zOyEpr
 oHYs0kh9YVwfsdVqzTni1bwOVBaQL3eDKubOUI7+z5YPkn8pwRqWk4BDgf+SXPy3hddZ
 OXY4k7O3q/UM63pTMC6fsiIkoOJZmdSawPHSym8SZAiaKjf7tlKJBO68tynKDiJHwffF
 Xf94EcPfkPmmrida06GwAs/SQPbvHtCWOEEytbLhTV2G6QzrrL/BGLjmVt5SvBYIGwcD
 okVfDLWi2t0rgqPfMJhR2jaBoUYOHuKkzy5ITAxjTXxPn24pfG51Ly6aY7HGNo2krq/1
 2PjQ==
X-Gm-Message-State: AOJu0YwZkJ3+FlInLqb5x7gDjqOCoTesJDACHZdE6YxH1hp8lfre0tWG
 OR06zgWNP70kW33yDFkKrb5rf2ffHcGm7A==
X-Received: by 2002:a5d:6104:0:b0:336:68c1:36fa with SMTP id
 v4-20020a5d6104000000b0033668c136famr1330955wrt.5.1704469418064; 
 Fri, 05 Jan 2024 07:43:38 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 q9-20020a05600000c900b003367eae8e18sm1613962wrx.57.2024.01.05.07.43.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:43:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Gavin Shan <gshan@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PULL 05/71] cpu: Add helper cpu_model_from_type()
Date: Fri,  5 Jan 2024 16:41:58 +0100
Message-ID: <20240105154307.21385-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: YjBaek+qimsy

From: Gavin Shan <gshan@redhat.com>

Add helper cpu_model_from_type() to extract the CPU model name from
the CPU type name in two circumstances: (1) The CPU type name is the
combination of the CPU model name and suffix. (2) The CPU type name
is same to the CPU model name.

The helper will be used in the subsequent commits to conver the
CPU type name to the CPU model name.

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20231114235628.534334-6-gshan@redhat.com>
[PMD: Mention returned string must be released with g_free()]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/core/cpu.h | 13 +++++++++++++
 cpu-target.c          | 15 +++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index c0c8320413..76ef59de0a 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -779,6 +779,19 @@ void cpu_reset(CPUState *cpu);
  */
 ObjectClass *cpu_class_by_name(const char *typename, const char *cpu_model);
 
+/**
+ * cpu_model_from_type:
+ * @typename: The CPU type name
+ *
+ * Extract the CPU model name from the CPU type name. The
+ * CPU type name is either the combination of the CPU model
+ * name and suffix, or same to the CPU model name.
+ *
+ * Returns: CPU model name or NULL if the CPU class doesn't exist
+ *          The user should g_free() the string once no longer needed.
+ */
+char *cpu_model_from_type(const char *typename);
+
 /**
  * cpu_create:
  * @typename: The CPU type.
diff --git a/cpu-target.c b/cpu-target.c
index 430dc53566..6f4afc1dbc 100644
--- a/cpu-target.c
+++ b/cpu-target.c
@@ -241,6 +241,21 @@ void cpu_exec_initfn(CPUState *cpu)
 #endif
 }
 
+char *cpu_model_from_type(const char *typename)
+{
+    const char *suffix = "-" CPU_RESOLVING_TYPE;
+
+    if (!object_class_by_name(typename)) {
+        return NULL;
+    }
+
+    if (g_str_has_suffix(typename, suffix)) {
+        return g_strndup(typename, strlen(typename) - strlen(suffix));
+    }
+
+    return g_strdup(typename);
+}
+
 const char *parse_cpu_option(const char *cpu_option)
 {
     ObjectClass *oc;
-- 
2.41.0

