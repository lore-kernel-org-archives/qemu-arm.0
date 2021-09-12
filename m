Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3186055lfb;
        Sun, 12 Sep 2021 16:16:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9K/mW9PcPMuPZuAQzQgmdU9D3pgtFiWufB5RvS6iYt5Dz844ps7xhKEMJ+WTu8oOzlrrW
X-Received: by 2002:a92:c211:: with SMTP id j17mr877377ilo.57.1631488618285;
        Sun, 12 Sep 2021 16:16:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631488618; cv=none;
        d=google.com; s=arc-20160816;
        b=QiO/J/kx2JoiafljNoYko91biMiZ+PFl4Irn4s3Xe/4dCcb5AObn7whByCzUwCAyyH
         4TEiy8bygRSTGw3d8RWjzp1d92ueDAc4qsg1QaLPhGxXXHj58WSGx1E71//eva9ByNMe
         i1FjodRfnd7NYxT2rqeLPk3mdn4nnAO0tQ9JpTEdUDwor/aLXt6iNHqm0HEYKDMRWfkO
         Lq93L4WZjsN/P0WrMaQu4bnxo/bKTMtuoEcPngrFwKlNNgiknlGs1bPS41RBayxrlYjB
         eqOZXSi/Lq4mAdAAE9roBwByUBMYKeJbBC6IH+wP6evu1LZUIFisEoOW72s1kqX1BPgG
         LcDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=LQvEN8QxaRQ3CTJMYNGs9pm2df7dRmHee4jHxat3i1g=;
        b=n+d9fWS/ulgS6sQq47GCmn/nxgDfc3zrCEh7NXCn31Q3XhgdBJBBP/UqSNLr6wiUdw
         MsRFguaioXWXbiWnT9UM/ZjL9bz07WVKJjEbyr6q8SdBP4XhbTpdRHqUsOWK2lHaaK+N
         KBiQadjLQgLm7PpxMWNVYT2pOJzTBSdKqHmSKJJuRvnzFzu+5LMi5PexOXXc3ZPh7V0j
         p8MqCYtIRBRQWdDJrx4NO25Bg6pyt6TBDgEoRuGVcT+2Qvd7rb88ezYObGc3BF+qTlKr
         Q7kvBmSLcNqXCEc72HYZ3tnteyzSJaGFOOQOnVyuK0BWn8rBhW2ijbSrFeOEXlGTfpTX
         y9oA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n20si5208444iod.5.2021.09.12.16.16.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Sep 2021 16:16:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mPYiX-0003uQ-N1
	for alex.bennee@linaro.org; Sun, 12 Sep 2021 19:16:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1mPYaL-0003VC-Ls; Sun, 12 Sep 2021 19:08:29 -0400
Received: from mail.csgraf.de ([85.25.223.15]:43610 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1mPYaJ-0003JG-DM; Sun, 12 Sep 2021 19:08:29 -0400
Received: from localhost.localdomain
 (dynamic-095-117-028-179.95.117.pool.telefonica.de [95.117.28.179])
 by csgraf.de (Postfix) with ESMTPSA id 1EFEC60809D4;
 Mon, 13 Sep 2021 01:08:05 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [PATCH v9 11/11] hvf: arm: Adhere to SMCCC 1.3 section 5.2
Date: Mon, 13 Sep 2021 01:07:57 +0200
Message-Id: <20210912230757.41096-12-agraf@csgraf.de>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210912230757.41096-1-agraf@csgraf.de>
References: <20210912230757.41096-1-agraf@csgraf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Peter Collingbourne <pcc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm <qemu-arm@nongnu.org>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NJLm49BTLXJM

The SMCCC 1.3 spec section 5.2 says

  The Unknown SMC Function Identifier is a sign-extended value of (-1)
  that is returned in the R0, W0 or X0 registers. An implementation must
  return this error code when it receives:

    * An SMC or HVC call with an unknown Function Identifier
    * An SMC or HVC call for a removed Function Identifier
    * An SMC64/HVC64 call from AArch32 state

To comply with these statements, let's always return -1 when we encounter
an unknown HVC or SMC call.

Signed-off-by: Alexander Graf <agraf@csgraf.de>

---

v7 -> v8:

  - fix checkpatch

v8 -> v9:

  - Remove Windows specifics and just comply with SMCCC spec
---
 target/arm/hvf/hvf.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index b62cfa3976..6a7ccfa91e 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1177,7 +1177,8 @@ int hvf_vcpu_exec(CPUState *cpu)
         cpu_synchronize_state(cpu);
         if (hvf_handle_psci_call(cpu)) {
             trace_hvf_unknown_hvf(env->xregs[0]);
-            hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized());
+            /* SMCCC 1.3 section 5.2 says every unknown HVC call returns -1 */
+            env->xregs[0] = -1;
         }
         break;
     case EC_AA64_SMC:
@@ -1186,7 +1187,9 @@ int hvf_vcpu_exec(CPUState *cpu)
             advance_pc = true;
         } else {
             trace_hvf_unknown_smc(env->xregs[0]);
-            hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized());
+            /* SMCCC 1.3 section 5.2 says every unknown SMC call returns -1 */
+            env->xregs[0] = -1;
+            advance_pc = true;
         }
         break;
     default:
-- 
2.30.1 (Apple Git-130)

