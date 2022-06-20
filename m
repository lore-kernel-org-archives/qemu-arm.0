Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp614994lft;
        Mon, 20 Jun 2022 11:26:51 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s20SW7SqMcg6ROLrkL+e/yH8PfIhLP5B2Y5TghNbPF9tQezMVD/oh8uJ5ed0WCVpzydRuJ
X-Received: by 2002:a05:622a:113:b0:304:e741:e462 with SMTP id u19-20020a05622a011300b00304e741e462mr20846441qtw.179.1655749611296;
        Mon, 20 Jun 2022 11:26:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655749611; cv=none;
        d=google.com; s=arc-20160816;
        b=QSYc4bOiV7QsQiwm1rRcF9GKXsCQz5Rfmr0hznSvmBDu0R+wI3t4SQDRDEBba7+mP4
         XKCtzkQWo8E6x5oHSOkwCzJXX37V+qwr1vWp4B7Vj25pLT+83zbnx70zloLt/2cvq0lH
         EOAy5dktMGIJPC7n7VzCw3P8kxhodxqiWsq3A3SM0zNiKQIV2ZgB3f+rJ8jQvEhR08Ar
         X3qoriOo7JTDvcUCKa9IygL2gE6Hv5roiO8s84WIsD6H7igMA0CBU6wWwrOoWitd6x6p
         2V8cF9z6aoTvJMIlYDgmly1d4xn/sSw1EWXrlLQUQo5AGo5FrW8XYy25WgkiQQHcUDLP
         xBFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=peylD0MqTkY6Ni4gfiTgUpLQJeWJHjooqBzEUJMAaO0=;
        b=vrb+84p596No23BXhSIKOIZfQPCyANSh08ccenheHJvFJf3gXgE6WJMA0Y0AzMsg/v
         sDFlzcjStu+h2XBVCG3G9at8cKl1nYLILq3WMCSBmD1bLN0AYr43HzBDvA1YxHSyDEdT
         QThom0prvj7sPla6AcT+jITOxHJX4bFI7MhmWV4WyOFpNgNrWs1yRZAiX2kzhdj350sP
         q0vrvHl1XaU2vrm9paLh4y4EFvHvs5bc8DoXb9neCYKI6YkzIh13d8iAxLy3sgoVtsHJ
         M7lqObD+8n9QVUOYqgjiqJ4bYUGd7jkCfjn5mtVkcQZWcFvERNQAGE4/cDGiZSx4+sLt
         sYGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hbnTfeyP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w3-20020a05622a190300b00304f6971cafsi7718400qtc.406.2022.06.20.11.26.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jun 2022 11:26:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hbnTfeyP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3M6s-0008JA-PI
	for alex.bennee@linaro.org; Mon, 20 Jun 2022 14:26:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LdO-0002u5-Jb
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 13:56:23 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:39517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LdL-00023m-08
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 13:56:20 -0400
Received: by mail-pf1-x436.google.com with SMTP id p14so5200363pfh.6
 for <qemu-arm@nongnu.org>; Mon, 20 Jun 2022 10:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=peylD0MqTkY6Ni4gfiTgUpLQJeWJHjooqBzEUJMAaO0=;
 b=hbnTfeyPQbAnU+k6BHK38HhvJAVmjDVWyiuFrN/kn56WAWUM2BjX1ZnF/cFHGzvBLV
 UA/o8fsW3gYq0sA+NKtQsbNyYAnWTt0NKVxn+XEMPP4ZKNCTLWbDyk0+2/0Wyb8Gj3Ar
 DyzTnVsltd74BvIoEE+aAnOTlOujC+qcwNRs8LXbve6xGzKr+bgz5BlUlIw5YcnpaBhq
 Bj9yW7gRJ6nmddgWE8+b7Hm5tjZeaIdIcIGtq32kxo5ArEzh2r9SvJu2bczeTxpVLuFo
 ur6cTMimJvtvsFpGvYF8fyW8svsrxa15qqp6jJahApBTOLVQyi2HLuUFFnGMuqnoBk1A
 Izpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=peylD0MqTkY6Ni4gfiTgUpLQJeWJHjooqBzEUJMAaO0=;
 b=uuvFZS5Ox3M+eLkkuMU0Oui0AXTaZ1ZXIfqGGUWSre0WTLun6Bh1GOx2iUVuJNp3LA
 uJIH33vJ9xi+VPeSNB60QNJA9GccvG+et2osqZ16ONpqs4/Ud2DXetCMTOGeKfQw/A/W
 YXYNNh/yL9FFn2N3hKat/nGt9+ICTjvL9CsmhSn3qaKvp6UdGBoHCbdpMPpWkNs67Bfp
 b4EX3vjZSdWovqD0d6jQv7ajQlSRpbF1qIkk+XKiUOyNvpU883/DVEK6nY7p3Jl8WR/k
 G4RZQ71XPvPHK2FBnx1+tM/ybi5Y+ySdmcH/LkO4DeHMy8YLNGcOsKPad3Ia6V0Ba7Id
 Ow7w==
X-Gm-Message-State: AJIora9OWNNlDrsU5f3jttNF5YTp9NKTWxd/swedXsI7QZIK//Ksbd85
 v91ZyiMIWC/PSgFecQOWmHg/9A==
X-Received: by 2002:aa7:9f9b:0:b0:525:1e0a:a6b4 with SMTP id
 z27-20020aa79f9b000000b005251e0aa6b4mr8471032pfr.5.1655747777763; 
 Mon, 20 Jun 2022 10:56:17 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 z14-20020aa7990e000000b00525184bad54sm3850474pff.126.2022.06.20.10.56.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:56:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 47/51] linux-user: Rename sve prctls
Date: Mon, 20 Jun 2022 10:52:31 -0700
Message-Id: <20220620175235.60881-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
X-TUID: HshB1qNMMe7x

Add "sve" to the sve prctl functions, to distinguish
them from the coming "sme" prctls with similar names.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/target_prctl.h |  8 ++++----
 linux-user/syscall.c              | 12 ++++++------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/linux-user/aarch64/target_prctl.h b/linux-user/aarch64/target_prctl.h
index 1d440ffbea..40481e6663 100644
--- a/linux-user/aarch64/target_prctl.h
+++ b/linux-user/aarch64/target_prctl.h
@@ -6,7 +6,7 @@
 #ifndef AARCH64_TARGET_PRCTL_H
 #define AARCH64_TARGET_PRCTL_H
 
-static abi_long do_prctl_get_vl(CPUArchState *env)
+static abi_long do_prctl_sve_get_vl(CPUArchState *env)
 {
     ARMCPU *cpu = env_archcpu(env);
     if (cpu_isar_feature(aa64_sve, cpu)) {
@@ -14,9 +14,9 @@ static abi_long do_prctl_get_vl(CPUArchState *env)
     }
     return -TARGET_EINVAL;
 }
-#define do_prctl_get_vl do_prctl_get_vl
+#define do_prctl_sve_get_vl do_prctl_sve_get_vl
 
-static abi_long do_prctl_set_vl(CPUArchState *env, abi_long arg2)
+static abi_long do_prctl_sve_set_vl(CPUArchState *env, abi_long arg2)
 {
     /*
      * We cannot support either PR_SVE_SET_VL_ONEXEC or PR_SVE_VL_INHERIT.
@@ -47,7 +47,7 @@ static abi_long do_prctl_set_vl(CPUArchState *env, abi_long arg2)
     }
     return -TARGET_EINVAL;
 }
-#define do_prctl_set_vl do_prctl_set_vl
+#define do_prctl_sve_set_vl do_prctl_sve_set_vl
 
 static abi_long do_prctl_reset_keys(CPUArchState *env, abi_long arg2)
 {
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index f55cdebee5..a7f41ef0ac 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6365,11 +6365,11 @@ static abi_long do_prctl_inval1(CPUArchState *env, abi_long arg2)
 #ifndef do_prctl_set_fp_mode
 #define do_prctl_set_fp_mode do_prctl_inval1
 #endif
-#ifndef do_prctl_get_vl
-#define do_prctl_get_vl do_prctl_inval0
+#ifndef do_prctl_sve_get_vl
+#define do_prctl_sve_get_vl do_prctl_inval0
 #endif
-#ifndef do_prctl_set_vl
-#define do_prctl_set_vl do_prctl_inval1
+#ifndef do_prctl_sve_set_vl
+#define do_prctl_sve_set_vl do_prctl_inval1
 #endif
 #ifndef do_prctl_reset_keys
 #define do_prctl_reset_keys do_prctl_inval1
@@ -6434,9 +6434,9 @@ static abi_long do_prctl(CPUArchState *env, abi_long option, abi_long arg2,
     case PR_SET_FP_MODE:
         return do_prctl_set_fp_mode(env, arg2);
     case PR_SVE_GET_VL:
-        return do_prctl_get_vl(env);
+        return do_prctl_sve_get_vl(env);
     case PR_SVE_SET_VL:
-        return do_prctl_set_vl(env, arg2);
+        return do_prctl_sve_set_vl(env, arg2);
     case PR_PAC_RESET_KEYS:
         if (arg3 || arg4 || arg5) {
             return -TARGET_EINVAL;
-- 
2.34.1

