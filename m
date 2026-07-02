Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD81C43458
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Jul 2026 18:42:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wfMLK-0007J0-4O; Thu, 02 Jul 2026 14:40:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wfMLE-0007A8-0n
 for qemu-arm@nongnu.org; Thu, 02 Jul 2026 14:40:53 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wfML2-0005Md-5S
 for qemu-arm@nongnu.org; Thu, 02 Jul 2026 14:40:51 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-474303f3c72so1378655f8f.0
 for <qemu-arm@nongnu.org>; Thu, 02 Jul 2026 11:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783017627; x=1783622427; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=VHz+W6Jym9EZZ+z5UeD6OFsDZZv3Lhe2N5eaNgbUd3k=;
 b=nltDAmufrDrioGL1V35F8uuSyfHMUn/ieDOqHtfzA+dbslEgr/71GMDN7OJ+5IniWB
 iWLqzTh9+4DwYBfqp2UeG7vqTLPhlCQt3fbYbStchm2P5/DmDfTCdPXHiSFbOtYwoBju
 EgoWSpsa6d8yevRkEhobrICKQchJ8YjDRKR3yF/Fj2EAwLHWfs9CAsRfNAtIt2oLdWJ3
 p/9Q2xZIgdF4cZNdQqyLmYMOW5wd7l0sGyjAASEBqGxry/0z2KuUJxQd2Ar0IDgXww+I
 wbBTmejxfcmP97vq2X3DkI47Qwa1Nd2NbptiRJ+AisGOsq6yua4M/WkBKpsZZGspdg9/
 4lIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783017627; x=1783622427;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=VHz+W6Jym9EZZ+z5UeD6OFsDZZv3Lhe2N5eaNgbUd3k=;
 b=BaVFTVejsXiHkOFTpRPlzyK6daCZ8uocH0h1gy0vOaKE9AajfMmKWV13qjEKUah8GH
 OlmLFcIvN+Gx9Ywul2+tct0wV50kjT73Ao5hYLuFFuwAk9ZFwwBUTgFyxFfEloQGbCEn
 emdoRCVyYeP7wPTYTznCyh3ue20S7IDp62A3j26nQRl+7jofkJLUa+i+fF+0rzVfcJR4
 nnW/UnV2BbLrPMd/5n9eoFy2qhdBVOLCIQL90Jc28L4DNBiS/8eUMzzd1STXRJkVkyXu
 +qekhnRrsdn6BOn4edAYgb5ESm3mUKhtlEFNIy333WrVqY08wM5b1uTYDyFS1qKoU2Vw
 Rhcg==
X-Gm-Message-State: AOJu0YyczRy+WJWL2EGZX2oXqlZlmDtDD8iJTrTRjHiBZPkMshvNYNFM
 rT9mcyBVZ//+/MC6pLewaq2Gm93bfkLW9fPsWAIucvV0XdpAui7Dkvm9Ey1LyG+8+EJ1xUEPJnE
 ye9/Qk1zVEA==
X-Gm-Gg: AfdE7clMEu8Uyoll4oBa1s32kx9ah1MmYCh/kSQnilUrhFZhVOSm1ApgwbwV50YYfxa
 GCA7hReozvk6e/8m7tOnE0Bc1QXQZobY8/TpRc6fwcMA259QJn6xo8/jM7gb+eSMDjpIO3zpRZy
 Rm6xAfhxKi09IJH/9fNA69U+62TS0vqtVqNFbYR9aFYsNPOhEkcZyudwi/ut/woYmbxSXS2dert
 wQf2iKRVMWv0CuqttoxhHRKM8tbmWYHzi7VTXuVPrPSoonno4O3RwQxbbqQjdZlN56uSXciM2Dj
 Pa3FDTrL0DrHMpW9+hLlZudBqOy8D1mr2szfTuZVRfMDLSTAx6oK5IzsNlwJ3CW/7GImSFSEBlW
 nkn63Dxsn/iXgLsIDwDuA0E10yB6tjebNSFfpIB7LMTO1jBzJxexBdhvbbCpTkjPf/Gnt3cRt+7
 hymZ9sy3cAqO+UbqB7crm5/uv4NLzvGUvdGKkqZ+/0hlS4XqWrh9XcLIM35WaPMusiTLVt2cFpR
 2Kxr/F8CnQWQ61coxfh6g==
X-Received: by 2002:a05:6000:4816:b0:473:f495:4a44 with SMTP id
 ffacd0b85a97d-47759754b7fmr11303388f8f.41.1783017627140; 
 Thu, 02 Jul 2026 11:40:27 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477db8a4a09sm11628213f8f.13.2026.07.02.11.40.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2026 11:40:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 07/11] target/arm: Update confusing comment in cpacr_write()
Date: Thu,  2 Jul 2026 19:40:15 +0100
Message-ID: <20260702184019.3431139-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260702184019.3431139-1-peter.maydell@linaro.org>
References: <20260702184019.3431139-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

In cpacr_write() a comment says "In ARMv8 most bits of CPACR_EL1 are
RES0", and the mask value is left at 0, implying that we enforce
those RES0 bits.  In fact we only enforce RES0 when ARM_FEATURE_V8 is
not implemented, and for v8 and up we allow the guest to write any
bits.  The addition of architectural features in v8 and v9 has also
resulted in the addition of new bits to CPACR_EL1, so "most bits are
RES0" isn't really true any more.

Update the comment to be a bit clearer.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index f645860e4f..342d05e4d8 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -551,7 +551,17 @@ static void cpacr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 {
     uint32_t mask = 0;
 
-    /* In ARMv8 most bits of CPACR_EL1 are RES0. */
+    /*
+     * The AArch64 view of CPACR_EL1 has a different layout to the old
+     * AArch32 one. We also need to permit the old AArch32 bits to be
+     * read and written so that an AArch64 EL2 hypervisor can set up
+     * the register for an AArch32 EL1 guest.  So we choose not to
+     * enforce any RAZ/WI or RAO/WI bits for v8 based on feature
+     * presence/absence.
+     *
+     * For v7 the situation is a bit simpler and there we do choose to
+     * enforce RAZ/WI and RAO/WI.
+     */
     if (!arm_feature(env, ARM_FEATURE_V8)) {
         /*
          * ARMv7 defines bits for unimplemented coprocessors as RAZ/WI.
-- 
2.43.0


