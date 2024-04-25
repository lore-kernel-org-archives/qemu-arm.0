Received: by 2002:a17:906:c0c2:b0:a52:4db9:938b with SMTP id bn2csp1280822ejb;
        Thu, 25 Apr 2024 04:06:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWmKsIdHTSpYE9YN2Kcq6IPZQNEVdfdzEm4WypMCdSferWtXKMd0j2fhBuqC64rlm23y3oW6BubkhFRhCsrPU9BK4QDSxnM
X-Google-Smtp-Source: AGHT+IHSHyVAOp4HReWlHuFwnDGUxw3i2GCdJ+e3fgS7JQ/J8oMogfjY9E+vLWxAtRrhsx0WBBne
X-Received: by 2002:a05:622a:38a:b0:439:de63:29ed with SMTP id j10-20020a05622a038a00b00439de6329edmr5999497qtx.64.1714043173683;
        Thu, 25 Apr 2024 04:06:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714043173; cv=none;
        d=google.com; s=arc-20160816;
        b=SLT0Jqc6YbMOwLqCWFOOqE+PUWh+NPEqRmA+7VBwAtLlOeVWl1MJxl7EOKsP+uNN/X
         r8/PRB3EfMZ/KX3MIFVq3AdBxVsWIyEL3gPJdGDBgU/VrgJLX7wIWohLZpjjtJ6/ft6V
         4CKKVV7RCad1FUt1WN657agG44YphfUBn0LYVBKwKCInNKi/vlDUMpXHxP49BRfPcetD
         4171DMVN4tuEahgIAuahiD1+cpfzVY0gAOFXDgUISuyxPoXDvDhsWedvGxUziCRvLHhT
         ne0oYYjCiXJ0QgqPEFyTJT9MzTbBDf2UWzUVvXjwoEaSuYTQs20XKW1TTkoXDt5D6ybe
         fXaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=DtMNR1ZQjJCcNYkkejZVBvEmwe3F+2PjUE+kGb5DBZI=;
        fh=tkKThSulWdjRnPL+gIDIoY/qB22NxnVF11icncigxBY=;
        b=C9FYnZKE8uQoDGg0ZXnKdABj/0CukJz6VJU9dJV9qXdoEPfRgqUFWw73u1PZtS5+6x
         fDyFeP8hUPPwJuqaGjA1hsk57WesbxQsOums4Sr8SvPD0C/81r74F1ExLFEvbTskZnno
         tzOSTLXINEQYUrSxSS/aw4KEsmneBQbO7emgwADeagzkRtQM0qThHBi+EAl7fY/mBkUk
         BEde5uMCS9Z3najfu9qYJyIqJ9sC1J4KWDQ2d1DeReqRaIvbliySOQaxs+50IawPneiQ
         eFwuNH3tx2LzBgxbOozE/t2mrrFduhmcekl5hHmrSKLT5pdfJvwil+M13Thva/ePhyaC
         AKGA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qQ8XGqfK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s31-20020a05622a1a9f00b004378f7ce0b8si16729537qtc.637.2024.04.25.04.06.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Apr 2024 04:06:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qQ8XGqfK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rzwuO-00037Q-O1; Thu, 25 Apr 2024 07:04:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rzwte-0000LN-Na
 for qemu-arm@nongnu.org; Thu, 25 Apr 2024 07:04:11 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rzwtb-0000OC-5W
 for qemu-arm@nongnu.org; Thu, 25 Apr 2024 07:04:09 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-347e635b1fcso639959f8f.1
 for <qemu-arm@nongnu.org>; Thu, 25 Apr 2024 04:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714043045; x=1714647845; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DtMNR1ZQjJCcNYkkejZVBvEmwe3F+2PjUE+kGb5DBZI=;
 b=qQ8XGqfKyttfqQ17Re/ThAnwmjlzoPq9rO1qUq/w6yY5A71wbKOdIN8SCHl2A22jjN
 O3Ae6fIwtJcAmvtIPr+PWUTPutzI9jMKQUlnFwIn07K3Opu7hDSqeutdoL3IuvTezjfe
 w7Zaj9ygGl+95fhQp5yK5FccE0OIqDUzyDquhlVEjXl4LUWEisOqxkUHAYZ2UzZQFKOI
 wGUhgGJ4iXsdmXhGQI7OBpqaja9wS8FtgYvrQEX2ozOdl0CEIuy6GWLT4SMAciIytFX8
 4zDk06SRM5R7w9+5w7PtcIkke8e5Opl7BonYK3n+J2J0WfUuIQp5tmX5sPaNoS5kF4CX
 WzLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714043045; x=1714647845;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DtMNR1ZQjJCcNYkkejZVBvEmwe3F+2PjUE+kGb5DBZI=;
 b=ZwNE8t7CW+Vb3W7ONbj/Z6yAHuJrNAuyEyRU4DiLONH5XcAV07sgJ1e/bqUQXg6wv9
 VzmBjxbhsRigJ4WBoyD2iqswLBRfGoAGoupYpFe+puuyCXrE9mLRVDQE8Jnu4YNy+mg6
 M6EJEAIdY/+BO7xExpuaOfN+oP83PzHmaNANT37CGyvCD+E2OquX5p/Pzcjh5ZG7TFFW
 iksdJWuHzExBPZLrCDiz7RaQQdcwGsG+MmPAWeq3e2y/FhTa0NyZW6OMU/KklBk2BnZP
 M4wKyp8OVdu8umXSy6zINXBJD44GnhUq3D0vV2VBkAOL/zKNfU+bsN3WFGe40xLKQtzq
 4Jvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiGKlWUCvhZKyjE9jOlptPkwygWzaPKKl8Bw8g67O+tLOqT8BXqLLNxIf4cAiasVLPLR/m/GYiOIvg2LSRtyu/SvPc
X-Gm-Message-State: AOJu0YxSN9fjItPcupxtsjfnQzq/5dLyGZ56/JTlG9x7mpRwvcODH+c5
 o5Dvo3hDE5LBOeeZZ3ZvIkH7jBhKJIrkWAOHytrwejDrpDLntF+mxwcW0BtorcE=
X-Received: by 2002:a5d:6e5d:0:b0:34b:1f34:9c06 with SMTP id
 j29-20020a5d6e5d000000b0034b1f349c06mr3712985wrz.24.1714043045068; 
 Thu, 25 Apr 2024 04:04:05 -0700 (PDT)
Received: from localhost.localdomain ([92.88.170.77])
 by smtp.gmail.com with ESMTPSA id
 u17-20020adfeb51000000b00347321735a6sm19543079wrn.66.2024.04.25.04.04.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 25 Apr 2024 04:04:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Yongwei Ma <yongwei.ma@intel.com>, Babu Moger <babu.moger@amd.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PULL 22/22] hw/core: Support module-id in numa configuration
Date: Thu, 25 Apr 2024 13:01:55 +0200
Message-ID: <20240425110157.20328-23-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240425110157.20328-1-philmd@linaro.org>
References: <20240425110157.20328-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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
X-TUID: 9rToqFinYc0M

From: Zhao Liu <zhao1.liu@intel.com>

Module is a level above the core, thereby supporting numa
configuration on the module level can bring user more numa flexibility.

This is the natural further support for module level.

Add module level support in numa configuration.

Tested-by: Yongwei Ma <yongwei.ma@intel.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Tested-by: Babu Moger <babu.moger@amd.com>
Message-ID: <20240424154929.1487382-5-zhao1.liu@intel.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/machine.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 494b712a76..0dec48e802 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -800,6 +800,11 @@ void machine_set_cpu_numa_node(MachineState *machine,
             return;
         }
 
+        if (props->has_module_id && !slot->props.has_module_id) {
+            error_setg(errp, "module-id is not supported");
+            return;
+        }
+
         if (props->has_cluster_id && !slot->props.has_cluster_id) {
             error_setg(errp, "cluster-id is not supported");
             return;
@@ -824,6 +829,11 @@ void machine_set_cpu_numa_node(MachineState *machine,
                 continue;
         }
 
+        if (props->has_module_id &&
+            props->module_id != slot->props.module_id) {
+                continue;
+        }
+
         if (props->has_cluster_id &&
             props->cluster_id != slot->props.cluster_id) {
                 continue;
@@ -1226,6 +1236,12 @@ static char *cpu_slot_to_string(const CPUArchId *cpu)
         }
         g_string_append_printf(s, "cluster-id: %"PRId64, cpu->props.cluster_id);
     }
+    if (cpu->props.has_module_id) {
+        if (s->len) {
+            g_string_append_printf(s, ", ");
+        }
+        g_string_append_printf(s, "module-id: %"PRId64, cpu->props.module_id);
+    }
     if (cpu->props.has_core_id) {
         if (s->len) {
             g_string_append_printf(s, ", ");
-- 
2.41.0

