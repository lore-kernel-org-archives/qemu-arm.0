Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp493882lff;
        Thu, 17 Jun 2021 05:32:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwVjqo7O9i+x7MQN/zt/JPWuwN4SGwL9UqbNBxpbTINj7htwquQytuqMBEqPdg/jzVDyw/
X-Received: by 2002:a05:6402:2791:: with SMTP id b17mr6182545ede.113.1623933137587;
        Thu, 17 Jun 2021 05:32:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623933137; cv=none;
        d=google.com; s=arc-20160816;
        b=0wmQOfYt6o9fcKrh3Kp3rXbMae18X4fneBlAyTPzCLSisTLXu6PtYyYm7jtnU8pF7Q
         2DzD8AhX7P4HWbWZ/9J2SbQkVRcFkHKlvI7lYZTEzL8Y+OoawqX2LjN29DdXTluGbA+4
         Da3LMDNh9qOVpX0M9qKciRDzw13YGewK/9uRWjR8/4QeLR9UKKMZTHz8OO3k8oA+D5vy
         kmwl84K6mY4l+cz3aUNrwvOju4tY6AN2rekD7ryx2abiIrrRLXtYnnrJNO77dR700BRA
         Zd4RYFVwY8hIA7hBWp5U71VlU2fuBnpmV0IT4mwEI32EoAIXhjaHMPwMZt9hJ91j75X9
         GV1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=wPEe/mxyIf9ZhRHcAraWOUduFhYjBABA0TkClu26TTk=;
        b=umnfOgj5kozHC3CtlXvGabcwhJspm+4u5WcMUnuThskdl2yDnPoyoP3jx59HEbxrfg
         iXxy09sWxer5KLmexXRt3oYNu/z0+yO5bvkYTty7g3TbNsZrrvnVFOyOTv+ZomPgsGE1
         J1IYqdivMjrfmoaSVutuZC5I/F1byVX6w3kr0aUHTUhOvJEf1bkZcURr8HOHc+6lRTxr
         KbAZ11RNiV1+nJCeG6LYg2iqDJqPijPTx85zZuxPp5wLI8W/52B0jvT7KEn5VvVuVILp
         HtC3riAvt3yNKV59ls/Fa3f3WtBm+luwJ5pB3EF0TJHhYBM/OMJMuKoCW4EqFwqacAiN
         xaNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fPdo5AgT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f10si5283019edw.252.2021.06.17.05.32.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Jun 2021 05:32:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fPdo5AgT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltrBw-0004CE-GJ
	for alex.bennee@linaro.org; Thu, 17 Jun 2021 08:32:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqx3-0001dF-Oz
 for qemu-arm@nongnu.org; Thu, 17 Jun 2021 08:16:54 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:42746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqwv-00071J-22
 for qemu-arm@nongnu.org; Thu, 17 Jun 2021 08:16:53 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 l7-20020a05600c1d07b02901b0e2ebd6deso3572149wms.1
 for <qemu-arm@nongnu.org>; Thu, 17 Jun 2021 05:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wPEe/mxyIf9ZhRHcAraWOUduFhYjBABA0TkClu26TTk=;
 b=fPdo5AgTilalzRlONhfVPNh+RPuO1UL8hSocSl9v86NrR2aQ6Bm5759CK10jHOxkE6
 hqjPKQxsokfygIWS075euZ4SV7h1CEK/HVHDUFd9H1mVsDucocGKlqbyOqPY16AWp7+9
 PWC18lggUFsCC5dOqJoAADpWAripuXjs8i75+IFd5xW2SllVSRYnpKQQNmkdBOjR5tOR
 i6feYPHSCSRn7/uB03PGj0qVu+XF4MCnW5wG/w8GDv9MrneBBZryyNW0u5zFh6WbyTSh
 Do5kCFibFf2MNmOOcZeBhxMP0Rxwx9xsX0nLpBP6qte6VtIek1AI3N8VEBN858JMOI8T
 PozA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wPEe/mxyIf9ZhRHcAraWOUduFhYjBABA0TkClu26TTk=;
 b=trjPaXuqhf7FgEBISidccY1Jry5OkitvYfuIBOZdCS6Khx8Av8LQO4/tgeMldkYna+
 J1Dp3X0kkH6FZ1rw6P7f+FFEKchr0INGoH1OmZWiDm+dSyHrv/sLxA/YvSIO+BvfddaU
 qGcMcFJ0TrZZTLBAcQVl6kDWUft1sS4csS3W+0oAd32wvvC5PttrFIWpATQc9Wm4Yp3L
 8g0jjUQCBX8lLcm/gpwO8Rm29NB//hbRhI2HIjQyuyHsmDDzYgR6XBm2Nzfe8E4WIrZU
 EXunegN1jqlvYYFrA/hrZbw81SODldVoqUIJ4rhYXa6+WJmwZiSuG9llGkOL2+D6r2Ss
 yFig==
X-Gm-Message-State: AOAM531RNuYCaTBvQBAD8PsC0/qksJsmo+I1eKzVpPYw2KtOq62UoE9m
 Dub8QKYvX2Eue0b1qdbbPhrQNFeoBC8HQA==
X-Received: by 2002:a05:600c:4ecc:: with SMTP id
 g12mr4809442wmq.40.1623932203668; 
 Thu, 17 Jun 2021 05:16:43 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a1sm6961970wra.63.2021.06.17.05.16.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 05:16:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 17/44] target/arm: Implement MVE VHADD, VHSUB
Date: Thu, 17 Jun 2021 13:16:01 +0100
Message-Id: <20210617121628.20116-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617121628.20116-1-peter.maydell@linaro.org>
References: <20210617121628.20116-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dRa620uVL4ZI

Implement MVE VHADD and VHSUB insns, which perform an addition
or subtraction and then halve the result.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    | 14 ++++++++++++++
 target/arm/mve.decode      |  5 +++++
 target/arm/mve_helper.c    | 25 +++++++++++++++++++++++++
 target/arm/translate-mve.c |  4 ++++
 4 files changed, 48 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 5cd4e7d736d..02bef53ed41 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -116,3 +116,17 @@ DEF_HELPER_FLAGS_4(mve_vabdsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vabdub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vabduh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vabduw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vhaddsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vhaddsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vhaddsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vhaddub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vhadduh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vhadduw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vhsubsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vhsubsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vhsubsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vhsubub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vhsubuh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vhsubuw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 087d3db2a31..241d1c44c19 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -96,6 +96,11 @@ VMIN_U           111 1 1111 0 . .. ... 0 ... 0 0110 . 1 . 1 ... 0 @2op
 VABD_S           111 0 1111 0 . .. ... 0 ... 0 0111 . 1 . 0 ... 0 @2op
 VABD_U           111 1 1111 0 . .. ... 0 ... 0 0111 . 1 . 0 ... 0 @2op
 
+VHADD_S          111 0 1111 0 . .. ... 0 ... 0 0000 . 1 . 0 ... 0 @2op
+VHADD_U          111 1 1111 0 . .. ... 0 ... 0 0000 . 1 . 0 ... 0 @2op
+VHSUB_S          111 0 1111 0 . .. ... 0 ... 0 0010 . 1 . 0 ... 0 @2op
+VHSUB_U          111 1 1111 0 . .. ... 0 ... 0 0010 . 1 . 0 ... 0 @2op
+
 # Vector miscellaneous
 
 VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 65141221b63..a89f6e3b01b 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -444,3 +444,28 @@ DO_2OP_U(vminu, DO_MIN)
 
 DO_2OP_S(vabds, DO_ABD)
 DO_2OP_U(vabdu, DO_ABD)
+
+static inline uint32_t do_vhadd_u(uint32_t n, uint32_t m)
+{
+    return ((uint64_t)n + m) >> 1;
+}
+
+static inline int32_t do_vhadd_s(int32_t n, int32_t m)
+{
+    return ((int64_t)n + m) >> 1;
+}
+
+static inline uint32_t do_vhsub_u(uint32_t n, uint32_t m)
+{
+    return ((uint64_t)n - m) >> 1;
+}
+
+static inline int32_t do_vhsub_s(int32_t n, int32_t m)
+{
+    return ((int64_t)n - m) >> 1;
+}
+
+DO_2OP_S(vhadds, do_vhadd_s)
+DO_2OP_U(vhaddu, do_vhadd_u)
+DO_2OP_S(vhsubs, do_vhsub_s)
+DO_2OP_U(vhsubu, do_vhsub_u)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 041fd1ef14f..f593d3693b9 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -357,3 +357,7 @@ DO_2OP(VMIN_S, vmins)
 DO_2OP(VMIN_U, vminu)
 DO_2OP(VABD_S, vabds)
 DO_2OP(VABD_U, vabdu)
+DO_2OP(VHADD_S, vhadds)
+DO_2OP(VHADD_U, vhaddu)
+DO_2OP(VHSUB_S, vhsubs)
+DO_2OP(VHSUB_U, vhsubu)
-- 
2.20.1

