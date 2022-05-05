Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1307252lfj;
        Thu, 5 May 2022 12:29:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7WHKFBcbvdpyKhoSFsYwvcAEQ/05Pv5c10gq5naPKIPks3GlJWFn4sa98OD/q6iwEtoJm
X-Received: by 2002:a05:6214:21af:b0:443:e253:61fa with SMTP id t15-20020a05621421af00b00443e25361famr23349318qvc.31.1651778979934;
        Thu, 05 May 2022 12:29:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651778979; cv=none;
        d=google.com; s=arc-20160816;
        b=kT6DtnIK3iOLvvOzmk2qVdFkFLDWG99VlLpBEK3Ho+QWJsceYn3gGFG4sL8rcyFajU
         GLqhdw4yii2/sIhkXi3K51dEz5CjFg0RnnHQCx4WkaI+hn8O1adX1UrffQs+5hEZATNZ
         a9W2LCt+qq+pDbj3IxXjEPVYKHHvaor6qBknuR9ZjazBxzXcgztspXDgS8Aacm3i9u97
         FsI8A8JBw3XP6YwZgI+3L5fXzVVw8XMgAL2RVnKalkljYutuLoicqyuQjG2hiVzQS1A2
         l8l1tgQywiVPe5Fhud26Hb9ZmR/ZHEadYnlXhgFdT1buEMIEw+8uyFIFgGdGChcLVNm1
         4+wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GY2odDA192T0ClkUF75+bPEfdCFgpsNoLihYttz/3zY=;
        b=lKjJfwZ5CCJUZgF40lahSwqjh4UQgFy3MFWwqNC8ACTtmQ06TQODRpIG3CHpilg2e0
         9WCfMfP8k7PK36o2J9GFVJvJawMyHWmHD3W7udFmW7QyaBadKmnIHqsR68OmRdSDaQ9z
         SvXsL9RKEfUSbntBAXJ56KI/cxjkdXbqB0ZvOscFX3Dqyk9gwpZ+/0G/OuL/uStBefVj
         AIl7S10HyrIZAzl9cBy1lws2wGScWLRCnMKQWMIuxQewv9dttfLfWe+LtMtXBIacy4Jp
         aR39itXUhIs9lKwI2sDK403DpTWvgZ7J3BXZQDlhxs7QCPfbIXBVoQROfaqAFtRLsLBK
         M5nQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RuupAJxi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u30-20020a05622a199e00b002f3873b83desi1406159qtc.605.2022.05.05.12.29.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 May 2022 12:29:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RuupAJxi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nmhAR-0002Rr-EK
	for alex.bennee@linaro.org; Thu, 05 May 2022 15:29:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmgYf-00035S-PN
 for qemu-arm@nongnu.org; Thu, 05 May 2022 14:50:38 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:38655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmgYd-0004NS-S2
 for qemu-arm@nongnu.org; Thu, 05 May 2022 14:50:37 -0400
Received: by mail-oi1-x232.google.com with SMTP id r185so435561oih.5
 for <qemu-arm@nongnu.org>; Thu, 05 May 2022 11:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GY2odDA192T0ClkUF75+bPEfdCFgpsNoLihYttz/3zY=;
 b=RuupAJxij1iUWDYoPju8S2pJjrLZ6lUUNzfm0xNTEUHt1bxfRU3/MTVwCxt4Jcf01X
 arIa8pwsnC3k9TlGbo7PwCSTUvqLTpC4yjj2X2f4E6erW5HWO9ez5qogDrRFa7jxeRwr
 4gDWP2/kQ1kzDwq52Lu+/n6ocJrZbKB/gT9idufYJyChbEwDfbNVV+HgzD9MCHtfLD8j
 sbPGw5mBZxqCJqWwn16KQ9od3DvMX/9vOwYvwENT3XxvXKpQYp+VZCBh9kFU7oDmgEc1
 Qw/qQ1dAhSaOn7dNKOPIOujt4KHXxsDJpnwKa8McaNdTiNdCBhKI26vAMDRj1U5gCj2s
 acjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GY2odDA192T0ClkUF75+bPEfdCFgpsNoLihYttz/3zY=;
 b=52q/JhkF2PcnRzseHEkFx5LI12Glba81Lq6zTffXigbVmVLbngCz19e6SioH2qu8T7
 E03PVfVYCEKQw/rJ+OmHDj6R1TUgc9SHREb8ubYzvDX2IW7FAir11a5R17hJrEpdKeGB
 c+6GVEXtXinhn2fO7iP3lNALFJC9U20s5z+HDO6OJ3HG3UBRPf/n0xZTJzaThYyrgrCq
 t2ANyU+BW2D8OlC0l0N0k8Uy9NU2PgCkUr7tPEFIpWImdp+G6LeCxw/8cfd/BxJiUSpk
 JOay+eIi5v9/uTKkQF9OaUjzVKhyxoZADsqIs9PHrmO/oHe0R3pxpd3jT/WJts6poEV+
 2pbw==
X-Gm-Message-State: AOAM5329HsLIi2/weR8B1NMQM4QtLoMs1f+clZqsXN7uKIgmLaIgi6pl
 SIauvhYuI8xxMAPWNfSVefgglQ==
X-Received: by 2002:aca:a945:0:b0:325:9428:ac02 with SMTP id
 s66-20020acaa945000000b003259428ac02mr3130507oie.268.1651776634933; 
 Thu, 05 May 2022 11:50:34 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe8:83ea:bbf4:c9ef:4f3:11c6])
 by smtp.gmail.com with ESMTPSA id
 s36-20020a0568302aa400b0060603221259sm857273otu.41.2022.05.05.11.50.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:50:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 18/24] target/arm: Enable FEAT_IESB for -cpu max
Date: Thu,  5 May 2022 13:50:00 -0500
Message-Id: <20220505185006.200555-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220505185006.200555-1-richard.henderson@linaro.org>
References: <20220505185006.200555-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x232.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8PiipsTLFFZh

This feature is AArch64 only, and applies to physical SErrors,
which QEMU does not implement, thus the feature is a nop.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Update emulation.rst
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 1 +
 2 files changed, 2 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 8110408000..b200012d89 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -25,6 +25,7 @@ the following architecture extensions:
 - FEAT_FlagM2 (Enhancements to flag manipulation instructions)
 - FEAT_HPDS (Hierarchical permission disables)
 - FEAT_I8MM (AArch64 Int8 matrix multiplication instructions)
+- FEAT_IESB (Implicit error synchronization event)
 - FEAT_JSCVT (JavaScript conversion instructions)
 - FEAT_LOR (Limited ordering regions)
 - FEAT_LPA (Large Physical Address space)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 35881c74b2..10410619f9 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -781,6 +781,7 @@ static void aarch64_max_initfn(Object *obj)
     t = cpu->isar.id_aa64mmfr2;
     t = FIELD_DP64(t, ID_AA64MMFR2, CNP, 1);      /* FEAT_TTCNP */
     t = FIELD_DP64(t, ID_AA64MMFR2, UAO, 1);      /* FEAT_UAO */
+    t = FIELD_DP64(t, ID_AA64MMFR2, IESB, 1);     /* FEAT_IESB */
     t = FIELD_DP64(t, ID_AA64MMFR2, VARANGE, 1);  /* FEAT_LVA */
     t = FIELD_DP64(t, ID_AA64MMFR2, ST, 1);       /* FEAT_TTST */
     t = FIELD_DP64(t, ID_AA64MMFR2, TTL, 1);      /* FEAT_TTL */
-- 
2.34.1

