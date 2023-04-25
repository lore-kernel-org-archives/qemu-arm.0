Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp3720395ejm;
        Tue, 25 Apr 2023 12:42:25 -0700 (PDT)
X-Google-Smtp-Source: AKy350bfIrgRpuCX2UD/bSlOqidJWMlcIEZ8hijYfhgR5tYGV6Ii/sDXyb/3VPIQMI+pPx4UhUpT
X-Received: by 2002:a05:622a:101:b0:3e4:e8be:c3a4 with SMTP id u1-20020a05622a010100b003e4e8bec3a4mr30197567qtw.56.1682451745331;
        Tue, 25 Apr 2023 12:42:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682451745; cv=none;
        d=google.com; s=arc-20160816;
        b=rcFIojzdQy7OEDBvf8xpWccwdj64busVwzU2FW8aRJm0A8gGArIkMSPxYrsqgFZ5D8
         RDO5gKy4YwJeupzSYRp/N53p7GCmKIFXPrlZgNAv7sR6+CaZOLyEJS5FLZRul0Iu8V46
         VTxlhPpL0Z69k4vErz4+HK39eaMS6HAGFCN43cIDJIulx/cSSVc6GlcclgnhflwH+sJ7
         GlQi8h2jwn2jQaQzhhms94gw2sk1sxYleqeXar/WzmOKxzuB2XKYa8R3SC38Nc2mO+DJ
         y4huCnzwb91tpamnBrkmqFNLgwxUIsA/oqocIqmvQqIBHs+fqvXdBgFdmTTPIh2ZpsuR
         WwfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=SlwZz/TkkaqpzfKRH/vz8Q4X3wFSx4Ts4VLXAbAY/Hk=;
        b=p928E6KmIeUM5OoURBEor9S2u8WZd+mT4Gp3RtTKcOJiZZE8C0wcI6Bpw6/oy0I4hU
         DqlcUc7IXapBdSjcpUehvNTIjob1zr1LtO7rE9Pur9UgPr9VIYIj58BOeNLOooynhc3/
         Fm6NuMIsr+6Bhid4qr8SVf7TKpLNVUD9sHvAoGHNStdsDhnIudNtBEuXj/yRi3jAfk8o
         VOJXIbLy+qvKY62qzfy/IgooPMt+jJFtB8WT73+yTnt3uw9fA9m8YCfzRhRzMqiGLt/r
         k8oRiNnmmGpZXpA5EzHc40aVEKf6I4yhlQHmDSHBt3ThWXbanJBxLdjsS5JaRSaO8Rfr
         fNQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zCmv0Dgm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 10-20020ac8570a000000b003e9a78b58f7si9304016qtw.702.2023.04.25.12.42.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Apr 2023 12:42:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zCmv0Dgm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1prOQo-0003l8-CN; Tue, 25 Apr 2023 15:34:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOQh-0003Wf-A6
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 15:34:23 -0400
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOQT-0004k5-Lh
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 15:34:22 -0400
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2a8ad872ea5so61241691fa.2
 for <qemu-arm@nongnu.org>; Tue, 25 Apr 2023 12:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451248; x=1685043248;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SlwZz/TkkaqpzfKRH/vz8Q4X3wFSx4Ts4VLXAbAY/Hk=;
 b=zCmv0DgmQ159PkPi+U7jG+n13JygEiACYEQO07VPMFbEk6vVeGtOflXZY3BQcblIbc
 syu/IhmiJmFLCQKOICVOLWYZwlMIDKPNs1Vyc/Hzse1wN1ZxEaFKlbo97JudtGsHYQ0B
 gaxsIIWgpfN0Ga6QMNm35vkK0gy8O1tTZZsFCNEJXtA6FKrN1q37pQIGxKpoykoggt+d
 6OBof6cuUGX6qdjW9neizLAAb1MWy9RnNzg7HqMTAVRifFFRguTCe0/X8osCfMcSallY
 qShFpeVxItnfQTv8kIjHD95w4kBqW+TghLJ0Lgizx1Iiw+V6DtM/EPqlWgV2D4L4bPyK
 vFFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451248; x=1685043248;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SlwZz/TkkaqpzfKRH/vz8Q4X3wFSx4Ts4VLXAbAY/Hk=;
 b=KaOHPD2puKZlH4u6r+AHtN6wM0eBvpOtqR4WMdwupP1uMN/1NlMShZotnTyDS9ZXWM
 rQp70cE8gOOBhBwuZ1HSXsNaXvkJUfWISvUkHEhoxWVFhsPH83Lk/KbZMvrM1ZemmFe9
 TMOqIgUht8+kbcxOJ5j94mUkCIS2sPVjsKh0WbakjeowOkqT/8Xb6Vdh7fEPa4MduYLh
 m9jQAuro08rkXfp8mku+hphX4+NuJplLxPvaNYBt11pfmPI2X1j36xVGk1dG4iT4Eu38
 x49jdwydZkTrY6vv/vK7xazB/P3T0O7+6+pU0vLqdRKm+sOliFHR6jQzl+y/R6hHEsCl
 BMNA==
X-Gm-Message-State: AAQBX9do4zIcU4UoCI655IL8nWiRugVt4TeVWhArp/CjW1Tks47voeHf
 k9tUufBny9X+ItvneR14vAdAeg==
X-Received: by 2002:a2e:98d8:0:b0:2a8:ee05:ca1e with SMTP id
 s24-20020a2e98d8000000b002a8ee05ca1emr3877303ljj.13.1682451247776; 
 Tue, 25 Apr 2023 12:34:07 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 z23-20020a2e8857000000b002a8c271de33sm2160484ljj.67.2023.04.25.12.34.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:34:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 18/57] tcg/aarch64: Detect have_lse, have_lse2 for darwin
Date: Tue, 25 Apr 2023 20:31:07 +0100
Message-Id: <20230425193146.2106111-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x22b.google.com
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
X-TUID: SN1tZQ/52avi

These features are present for Apple M1.

Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index fc551a3d10..3adc5fd3a3 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -16,6 +16,9 @@
 #ifdef __linux__
 #include <asm/hwcap.h>
 #endif
+#ifdef CONFIG_DARWIN
+#include <sys/sysctl.h>
+#endif
 
 /* We're going to re-use TCGType in setting of the SF bit, which controls
    the size of the operation performed.  If we know the values match, it
@@ -2903,6 +2906,27 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     }
 }
 
+#ifdef CONFIG_DARWIN
+static bool sysctl_for_bool(const char *name)
+{
+    int val = 0;
+    size_t len = sizeof(val);
+
+    if (sysctlbyname(name, &val, &len, NULL, 0) == 0) {
+        return val != 0;
+    }
+
+    /*
+     * We might in ask for properties not present in older kernels,
+     * but we're only asking about static properties, all of which
+     * should be 'int'.  So we shouln't see ENOMEM (val too small),
+     * or any of the other more exotic errors.
+     */
+    assert(errno == ENOENT);
+    return false;
+}
+#endif
+
 static void tcg_target_init(TCGContext *s)
 {
 #ifdef __linux__
@@ -2910,6 +2934,10 @@ static void tcg_target_init(TCGContext *s)
     have_lse = hwcap & HWCAP_ATOMICS;
     have_lse2 = hwcap & HWCAP_USCAT;
 #endif
+#ifdef CONFIG_DARWIN
+    have_lse = sysctl_for_bool("hw.optional.arm.FEAT_LSE");
+    have_lse2 = sysctl_for_bool("hw.optional.arm.FEAT_LSE2");
+#endif
 
     tcg_target_available_regs[TCG_TYPE_I32] = 0xffffffffu;
     tcg_target_available_regs[TCG_TYPE_I64] = 0xffffffffu;
-- 
2.34.1

