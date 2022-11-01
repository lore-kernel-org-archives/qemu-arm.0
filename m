Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp1606370ejc;
        Mon, 31 Oct 2022 23:46:46 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM65RB9ROUBjZgzyEtDxzjU+Rr7ack2/qfUBHA6Ye0XGmhNyCT5ToOgEo3FltJz+jdbETW0+
X-Received: by 2002:a05:6214:20c1:b0:4b9:f285:de7e with SMTP id 1-20020a05621420c100b004b9f285de7emr14366553qve.14.1667285206555;
        Mon, 31 Oct 2022 23:46:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667285206; cv=none;
        d=google.com; s=arc-20160816;
        b=ArZgNGL40aGGIfahSNT9SigeayLqIFRhN1nRFj/AWu/c2y9yshX798uKRlySIL3gaj
         wb/zJehPTP5sDLA9Q1VntpIh+L8VxWuFGTuZM6DMiZ+/sGxq7L/xhRi8Ryjp7IbLApcx
         7V2WnwYCHBhnGIh0xNpdfgtNpw3xs65iXExhDmhv0+zZLDbSXlBmWvo5+/rQqOEtXOdI
         Djsx05rMUnSUlhazj6fh/mVKg7SQ5Avklm8knrJDlAapk5ki3GhZbVd8Ix97DJS8HKxZ
         NIyFftFNRYlDRVjaCachkaPUuiR+/FkodsmZsINaP8aFSQ6oP3pE8BN3UdhpaYg7B8uV
         rvYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=yTr2buqxaYr8UkugLXntG6akq32XV/ilPeT9xCMuxpw=;
        b=yzntXqMeL7S8M1HwyXLTiS0MJ688qE983hEra7a1X/EuTFoBpDIyOEsUmKCVl87F1T
         9PQfgdO1670GB9EBcp+4IJW2G7Vc3htz87VBTsuLLDGc4bI8Nyb6I0ZlWyrXIXouJrHY
         bY0YBTLRHrXJjeBywmSYFqQxvzxLnW0RKmdCK1UsQpotjfTP8i9fjm7hZ5M8VFho/OOb
         m7z286cn949E7B/yZ9Dg1j6KummmmOiyGHx73zeun+gP2qCnQlzqLyS3NAGHJW/NYQfW
         hjlR6cHblopsghpvfBNyUTce+byeRMsEfrazR7l6fakzTbjy0SbisUZ4RQSDJ+oW3745
         w6bg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@igel-co-jp.20210112.gappssmtp.com header.s=20210112 header.b=ou7TABLP;
       spf=pass (google.com: domain of qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k11-20020ac8478b000000b0035cb9e0cf78si5151522qtq.768.2022.10.31.23.46.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Oct 2022 23:46:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@igel-co-jp.20210112.gappssmtp.com header.s=20210112 header.b=ou7TABLP;
       spf=pass (google.com: domain of qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1opl2c-00021o-5E; Tue, 01 Nov 2022 02:46:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ake@igel.co.jp>) id 1opl2M-000211-GQ
 for qemu-arm@nongnu.org; Tue, 01 Nov 2022 02:46:14 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ake@igel.co.jp>) id 1opl2K-0001GZ-2C
 for qemu-arm@nongnu.org; Tue, 01 Nov 2022 02:46:14 -0400
Received: by mail-pg1-x531.google.com with SMTP id e129so12646444pgc.9
 for <qemu-arm@nongnu.org>; Mon, 31 Oct 2022 23:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yTr2buqxaYr8UkugLXntG6akq32XV/ilPeT9xCMuxpw=;
 b=ou7TABLPFWRKyvkYtQBzU2IDR2zykLaiXgLU6X2VH6iSvaSkm66748P3BWAE4fiL8I
 /sd3EfxLCSRjii+EYbDFPNwkArw7oJ6LaIVQwD8Lwnj8ik7m02bpniCIzGB0vqQi543q
 S10BXKlGTSwIAYgfkMS/7OrlpMTJeYo0QsZ3BQYkvtIDMc94b5CS1LHYidxaXC/UONh/
 v+7QpntrTzdAJJSEi8aJcxLGkdM4HIv5sqtzmnmjOvE4jnsZN7JIM/Vfdl3QGdHPVPyd
 nGbLZEFY6gmId2/+XRFRe0U+1SKFeTlWJBHgsqLL9CL3HX5FgN8tw+zsSqAG5macdXVi
 Sqjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yTr2buqxaYr8UkugLXntG6akq32XV/ilPeT9xCMuxpw=;
 b=4cMrrTsoG3FFyY9jRyzkL3lgiGcQEjvEUa/fCIAfgk+Qv3U4FAWzNoT7Q/p7tJzKCM
 xOmkw8ZmtFRr0ajvmYce7CqtYl2gbct25Zx6peDX3tFCQTtJNpf8n3rj4TQKsL++AN87
 VWWs/G3h6X14A6GZqGZzMoPcJdWF9jg2QPvCCFxW102/nd+FaKgT1wIYMmQKH8htxNrC
 T10YcCK0fotMva+/kgqtv3QNNKwm9iI6HtLYorqSVuINSqTpOG9yc/BguGwCzMTkPTns
 oC0CzLvudF9b4PZBOhYESeGqg4Xs+T6nLK0RHIK/urT+vA346s4AcQHtWeAEs51LN9Ay
 1CKw==
X-Gm-Message-State: ACrzQf1AXWnFw9s2iTNsF4p1d3XoWyFUm8nfNFqJMXQ3MBIgTsLdflxs
 0FDs/+2m519O7T8sjgk13eqi1Q==
X-Received: by 2002:a05:6a02:186:b0:439:49a3:479b with SMTP id
 bj6-20020a056a02018600b0043949a3479bmr16067493pgb.171.1667285169477; 
 Mon, 31 Oct 2022 23:46:09 -0700 (PDT)
Received: from ake-x260.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a170902654c00b00176acd80f69sm5500949pln.102.2022.10.31.23.46.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 23:46:08 -0700 (PDT)
From: Ake Koomsin <ake@igel.co.jp>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Ake Koomsin <ake@igel.co.jp>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH v3] target/arm: honor HCR_E2H and HCR_TGE in ats_write64()
Date: Tue,  1 Nov 2022 15:42:53 +0900
Message-Id: <20221101064250.12444-1-ake@igel.co.jp>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=ake@igel.co.jp; helo=mail-pg1-x531.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org
X-TUID: +pj7daSzOeUC

We need to check HCR_E2H and HCR_TGE to select the right MMU index for
the correct translation regime.

To check for EL2&0 translation regime:
- For S1E0*, S1E1* and S12E* ops, check both HCR_E2H and HCR_TGE
- For S1E2* ops, check only HCR_E2H

Signed-off-by: Ake Koomsin <ake@igel.co.jp>
---

v3:
- Avoid recomputing arm_hcr_el2_eff() as recommended by Richard H.
- Use ':?' for more compact code as recommended by Richard H.

v2:
- Rebase with the latest upstream
- It turns out that we need to check both HCR_E2H and HCR_TGE for
  S1E0*, S1E1* and S12E* address translation as well according to the
  Architecture Manual.
- https://lists.gnu.org/archive/html/qemu-devel/2022-10/msg06084.html

v1:
https://lists.gnu.org/archive/html/qemu-devel/2022-10/msg02627.html

 target/arm/helper.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b070a20f1a..c17962372d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3501,19 +3501,22 @@ static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
     MMUAccessType access_type = ri->opc2 & 1 ? MMU_DATA_STORE : MMU_DATA_LOAD;
     ARMMMUIdx mmu_idx;
     int secure = arm_is_secure_below_el3(env);
+    uint64_t hcr_el2 = arm_hcr_el2_eff(env);
+    bool regime_e20 = (hcr_el2 & (HCR_E2H | HCR_TGE)) == (HCR_E2H | HCR_TGE);
 
     switch (ri->opc2 & 6) {
     case 0:
         switch (ri->opc1) {
         case 0: /* AT S1E1R, AT S1E1W, AT S1E1RP, AT S1E1WP */
             if (ri->crm == 9 && (env->pstate & PSTATE_PAN)) {
-                mmu_idx = ARMMMUIdx_Stage1_E1_PAN;
+                mmu_idx = regime_e20 ?
+                          ARMMMUIdx_E20_2_PAN : ARMMMUIdx_Stage1_E1_PAN;
             } else {
-                mmu_idx = ARMMMUIdx_Stage1_E1;
+                mmu_idx = regime_e20 ? ARMMMUIdx_E20_2 : ARMMMUIdx_Stage1_E1;
             }
             break;
         case 4: /* AT S1E2R, AT S1E2W */
-            mmu_idx = ARMMMUIdx_E2;
+            mmu_idx = hcr_el2 & HCR_E2H ? ARMMMUIdx_E20_2 : ARMMMUIdx_E2;
             break;
         case 6: /* AT S1E3R, AT S1E3W */
             mmu_idx = ARMMMUIdx_E3;
@@ -3524,13 +3527,13 @@ static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
         }
         break;
     case 2: /* AT S1E0R, AT S1E0W */
-        mmu_idx = ARMMMUIdx_Stage1_E0;
+        mmu_idx = regime_e20 ? ARMMMUIdx_E20_0 : ARMMMUIdx_Stage1_E0;
         break;
     case 4: /* AT S12E1R, AT S12E1W */
-        mmu_idx = ARMMMUIdx_E10_1;
+        mmu_idx = regime_e20 ? ARMMMUIdx_E20_2 : ARMMMUIdx_E10_1;
         break;
     case 6: /* AT S12E0R, AT S12E0W */
-        mmu_idx = ARMMMUIdx_E10_0;
+        mmu_idx = regime_e20 ? ARMMMUIdx_E20_0 : ARMMMUIdx_E10_0;
         break;
     default:
         g_assert_not_reached();
-- 
2.25.1

