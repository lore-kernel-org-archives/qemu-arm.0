Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp2284235njb;
        Mon, 17 Mar 2025 07:29:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXKGOW5leVDOG0BQzyKSmD0V8aXaU2qQCqAjQVpdCC0HIIZhoLMOtIIPaeib4xdxqaMoWjnSz0ibh8cKA==@linaro.org
X-Google-Smtp-Source: AGHT+IGLE68j3I7gk9BPHpEqFBzrY/6GoWlQIUHd3iwUSfcbkUm2bTDibdfuXJuGGJcBqyvljrJg
X-Received: by 2002:a05:6102:3f4a:b0:4ba:eb24:fb28 with SMTP id ada2fe7eead31-4c383116b91mr8964957137.3.1742221741041;
        Mon, 17 Mar 2025 07:29:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742221741; cv=none;
        d=google.com; s=arc-20240605;
        b=XqutrvqLodVkbCfxID7vp4KcBzi4VwSB1Y66rbCodKm26ePuXoBwtYknPVaK+GeFs8
         Wbh+yv0of/3d8zwW9QFYu4w5DTDAexaPRBIRTi3rqwI9gze/Oby+qawPz0++pP5Fc+e9
         YFeIc6OB89a7iq8nvD0mFhmT1VlqFv1zrlJpY3I0gKpSxcdHk4uS36hwidujloFGUuJ6
         aFOjsEmejjRKQ413FTNBqZAfwfrzjIi4BgYgZcQS9wRDV9Dy+VFVdGkyJ7vsuBbRKWKg
         4XyEsQJjMds/2htP9KSnm+Feo9+ds7Z4mkWkyrRgfX7slKpwxOrpdOgi+h27GKsLwzpN
         2nMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=NaCPyDdxmRmZpYCr7DKDsJe3bk+lLzZjopyFV4R3vdM=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=LxMKLNke9b/jejb4L4pn2s2StqjqUB2eYOjVAtplkWFnWEiqhOTwwV0hm7OANpHHqi
         20VxSA9+0yV+qFaFvjS+88drEzitY0O+8d390FT7de/MZpXJapqq13mK3PMdQf3bNoAk
         +4FgVQPB9AvxB5kp/ToTWfV4zWEpBnmJxYUWeoRHl3D0C20XUx/D44N69Ji4+zuxAlha
         ttYwAZTFqiSew1qKC67hUDUv2ExwNF5NS1mqWAJfH8z0a90uMw7zG1x3/fAqc03Z8pNC
         Gr9FFq07IakCdD2ARLMlVWkC++ZN9x/Kmd9s02oiFQU5ZNMqNIph65AoBChuoK6XzzHS
         hIZA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vk+WsdMn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-86d90d6f93esi2423473241.38.2025.03.17.07.29.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Mar 2025 07:29:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vk+WsdMn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tuBSF-0000eS-MP; Mon, 17 Mar 2025 10:28:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tuBS8-0000ZM-FW
 for qemu-arm@nongnu.org; Mon, 17 Mar 2025 10:28:28 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tuBS5-000195-V6
 for qemu-arm@nongnu.org; Mon, 17 Mar 2025 10:28:28 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43cfdc2c8c9so12407935e9.2
 for <qemu-arm@nongnu.org>; Mon, 17 Mar 2025 07:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742221704; x=1742826504; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=NaCPyDdxmRmZpYCr7DKDsJe3bk+lLzZjopyFV4R3vdM=;
 b=Vk+WsdMnu4yb7RZcok/WPH5AOa9COQOol5i1a/EwttGcA3LsnOOyl4af/3J89Ai4sv
 B7rt9i34RtD9mkpl0J2T0M60jhhuysLM5r2vOWrLT6LQ+d/Ee8t4Rv7DIC/TMbk3+j65
 sRCf3jOO9L5mrqRmMSy4laEzlpOinjE7xpZ3lsAeSq+9m5I/5Us1mKPTYz09lU/iQSTx
 /6hSWWBX7zN5+2Eepv1pTKOw5tpCYQsbWqSGeyu+6m1yZJ5NIwcSP9uIGhsS61NAhjW7
 3My6FMcb/j9ZAmrM7vRxpcvY8oAKTRZFGbCuwA/E89EeBlcFMWRPiooCRIOrhz8X5KYC
 FfUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742221704; x=1742826504;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NaCPyDdxmRmZpYCr7DKDsJe3bk+lLzZjopyFV4R3vdM=;
 b=pd3Y67uaDcsbAzY5FmfpPKgcyK/fdO9n9NgsVi1IVWUHroneDngwL6kmjwYYKj5kYr
 0WzZ2hJ7EB0ktInVnoM7kAmF4bY68MPnfdGzjzw8FtW7zFZ/lFuXimuyL+erDIhJuKq/
 CJEU4ekZuEnto8268o6KCk7+3J77r4whS0EXZVru/81gYHD5GeSoBbhyDArFSkVduT/l
 zxJV3Yvt+rbYre2buagPqF+SlMbV/wUiHTqkKn4sTYZmaD5EEAaDxIX70nerPpTOgTiz
 gp46fjyibgsXUO6JtltLNDgph6axsS0wZ3uY82cCehp0r3GW7TIw33p6o0+fKP3PWBs4
 3uxw==
X-Gm-Message-State: AOJu0Ywsj8H4oorbl13I81ueuwaMxKZsZFFGrxM+U1gL5nsBTGOy2pVz
 M8i3BLMKw1xKCu5bQfAIsIA0Kv/p7pUp9wfRalVHTgfGjXSxnbrqx1Cv8dfDFhM6ByBg4kl2X0A
 1
X-Gm-Gg: ASbGncvrZKWPwjpTQbxm/GD5gCHk4KDrJ0COjPvKFB9dONliYC+85GNh9ctqOIGF9XB
 shlrJ8dvECDLGo1s3UuppJkGuneem3kWLO4+UUcOAA7G1gS3wrDHLdemiAdPBW8h/QcsWjBhcko
 cqR9TNTwIfTukcgzzDCkiFoqfHBpTq19DjDeyu0qYya3edQ2HwN0EnFnQh6C0fnO8Qa0K0j20RC
 9zix5I9lXyTLYGhmOLfQ6PQs4hIZwPE0DEudmqi/szgJfByD2giIcplwb8xeuSo2CrpNmZSN4ug
 uMh/wvZbI2ScujtZ9Bkp9meaA2HgbgB89OGddeo5pcs3Kz4FRHI=
X-Received: by 2002:a05:600c:46ca:b0:43c:ee62:33f5 with SMTP id
 5b1f17b1804b1-43d389ae727mr261045e9.27.1742221704183; 
 Mon, 17 Mar 2025 07:28:24 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1fe60ad4sm107914985e9.29.2025.03.17.07.28.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 07:28:23 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-10.1 3/9] target/arm: Handle AArch64 in TYPE_ARM_CPU
 gdb_arch_name
Date: Mon, 17 Mar 2025 14:28:13 +0000
Message-ID: <20250317142819.900029-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250317142819.900029-1-peter.maydell@linaro.org>
References: <20250317142819.900029-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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
X-TUID: /7UxMWx8VpiC

Instead of having the TYPE_AARCH64_CPU subclass set
CPUClass::gdb_arch_name to a different function, make the
TYPE_ARM_CPU implementation of the method handle AArch64.

For the moment we make the "is this AArch64?" function test "is the
CPU of TYPE_AARCH64_CPU?", so that this produces no behavioural
change.  When we've moved all the gdbstub related methods across to
the base class, we will be able to change this to be "does the CPU
have the ARM_FEATURE_AARCH64 feature?".

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h | 6 ++++++
 target/arm/cpu.c       | 3 +++
 target/arm/cpu64.c     | 6 ------
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index bb962389192..a14c269fa5a 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1691,6 +1691,12 @@ void aarch64_add_sve_properties(Object *obj);
 void aarch64_add_sme_properties(Object *obj);
 #endif
 
+/* Return true if the gdbstub is presenting an AArch64 CPU */
+static inline bool arm_gdbstub_is_aarch64(ARMCPU *cpu)
+{
+    return object_dynamic_cast(OBJECT(cpu), TYPE_AARCH64_CPU);
+}
+
 /* Read the CONTROL register as the MRS instruction would. */
 uint32_t arm_v7m_mrs_control(CPUARMState *env, uint32_t secure);
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 01786ac7879..d69403fda90 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2647,6 +2647,9 @@ static const gchar *arm_gdb_arch_name(CPUState *cs)
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
 
+    if (arm_gdbstub_is_aarch64(cpu)) {
+        return "aarch64";
+    }
     if (arm_feature(env, ARM_FEATURE_IWMMXT)) {
         return "iwmmxt";
     }
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 8188ede5cc8..020b32f21e9 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -813,11 +813,6 @@ static void aarch64_cpu_finalizefn(Object *obj)
 {
 }
 
-static const gchar *aarch64_gdb_arch_name(CPUState *cs)
-{
-    return "aarch64";
-}
-
 static void aarch64_cpu_class_init(ObjectClass *oc, void *data)
 {
     CPUClass *cc = CPU_CLASS(oc);
@@ -825,7 +820,6 @@ static void aarch64_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_read_register = aarch64_cpu_gdb_read_register;
     cc->gdb_write_register = aarch64_cpu_gdb_write_register;
     cc->gdb_core_xml_file = "aarch64-core.xml";
-    cc->gdb_arch_name = aarch64_gdb_arch_name;
 
     object_class_property_add_bool(oc, "aarch64", aarch64_cpu_get_aarch64,
                                    aarch64_cpu_set_aarch64);
-- 
2.43.0

