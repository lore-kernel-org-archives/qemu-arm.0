Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94EC01088E65
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Mar 2026 02:27:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w335y-0003nu-Pl; Wed, 18 Mar 2026 22:26:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1w335y-0003mh-10
 for qemu-arm@nongnu.org; Wed, 18 Mar 2026 22:26:46 -0400
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1w335w-0002uJ-Jq
 for qemu-arm@nongnu.org; Wed, 18 Mar 2026 22:26:45 -0400
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-64e9f9226a7so216350d50.2
 for <qemu-arm@nongnu.org>; Wed, 18 Mar 2026 19:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773887203; x=1774492003; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ztIVCrrmqBuhnm6JGGEUa3bN+o69ButyUhpjXpcaOJo=;
 b=TUFzhQBxivaTfWcSRBZE+79d3X7HeZ0rnMBGBvapAMlTvoKOfjKNAaGkRSd8CVY67i
 zsF6t1MnIoUbjR3fvZFFOfk1g/9jcvn7IeF4V7NSIinZOi5weeFLXpl/dGTx2HSRJJcO
 qXseks3Mcd+63Sifh3PXqUpdpecB2gaC3yeT1v6yunwuUvfgW9v99ZEIBOr+6iJLAs2h
 P4iQKPXSJHpSSCb9peVCOMTdY9tYjlqSW5oAGffIHdOq5AN3uqHQ+IWnMZm6g9rgMKR/
 DBUEnYEqS3zAlNSR++MRDEULh70UH8YYe7vOiwMg3SeJbc+wnfsE9wdr1o+Q5SReiRmW
 HTyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773887203; x=1774492003;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ztIVCrrmqBuhnm6JGGEUa3bN+o69ButyUhpjXpcaOJo=;
 b=fnRgtgY2G0CMYOrnCsNy9iN05khYZHazEa1Im97pEY+s1ZDpyaC7RQriG2b4ZxuIPh
 jONRqHApUlkRYgxyhW3r5f+gc3EnquWgXxsx3rvG6eWtD/WKgOhf8zMpmbIn04XOecTW
 LTsQ/KsZl7mnZJQ7YnXllKyeqb2A0LOzDEQhXGXlwK1rEqUVDT2v3AIx8wUXDBbDnKNs
 QAD+ZBC6+WmQtlP4I64hfQ3d1uSJw2IYIjx5zh6IvkPbU71V5UG6vyiRTB/YTaGwFYal
 KkBsuBmrNNB3UUYxYgWeixN8sndLuSwwZZiRFkGqT6uxzx4aABDMl5UI8D0P/JCh9ynH
 s5lA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWK35vnmbg25AL/4haHwH02SAMMmuqLILAkW3l2wXQzWiumeUuUrshO91ABB7eLf991dTHw+NRtzA==@nongnu.org
X-Gm-Message-State: AOJu0Ywv5i+EiDqK1ji1TPRcOVNOqVHzX+Ow0h6dw4AIPYXe14WJUBAu
 Hylp3z6PS4RtbRrhCyIRcJ8YZk75iSdkzrVEzyrpkEjrQzs9SqOPh6+iauh1OROEPIE=
X-Gm-Gg: ATEYQzwTzTGuqhbxL8YSpZX2s0vlqJEMp9Kb/nGOaqNVdweKNL2DZqNV8vEkwMr8hiU
 tJEHzdobHZj/K1046NH82yd38H0VyLvDHeWgmM4UIHgXPAgpLZv2HY0hVI8wyeC6cHsxqltujOR
 Bkl9lTPcK+A9cmJzq5nIbD09uH7JnMPKmAgtSsrb30reWGhPjJbKhET0qbzxxm1tqzRtygx7yIa
 PJYylsmoXHqYnJBRsXnXO7U03dUoa9dIUSUtFmEpwcazyJKX/8WoEbQMqCurCiZnwQEO0LJ7zo6
 0DxcClzrrwME6kxHdEdc+H1lVkDqfbMr5ATqGefRkmMCMqHVgzKCxMRcakhVZRABR1GxN42A/Ry
 EvSYTQVhquK539aq4xl5qxdLzRFa/F26UHefYsXXKHL436CGB0/RS+nIF2mbrienQmRS7DAV4gw
 ReFjyU62nsSPbzU8dm7Zqq2YmZYooGxA==
X-Received: by 2002:a05:690c:e3ce:b0:799:a3b:37d5 with SMTP id
 00721157ae682-79a71c701d9mr57545017b3.46.1773887203566; 
 Wed, 18 Mar 2026 19:26:43 -0700 (PDT)
Received: from gromero0.. ([177.146.137.168]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-79a7141eb65sm28159417b3.21.2026.03.18.19.26.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2026 19:26:43 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org, richard.henderson@linaro.org
Cc: alex.bennee@linaro.org, peter.maydell@linaro.org, gustavo.romero@linaro.org
Subject: [RFC PATCH 7/7] target/arm/ptw: Print MECID if not zero [TO BE
 DISCARDED]
Date: Wed, 18 Mar 2026 23:23:35 -0300
Message-Id: <20260319022335.22523-8-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260319022335.22523-1-gustavo.romero@linaro.org>
References: <20260319022335.22523-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12a;
 envelope-from=gustavo.romero@linaro.org; helo=mail-yx1-xb12a.google.com
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

It's easy to get the sw stack wrongly configured and end up having no
MECIDs being setup different from zero. If this happens FEAT_MEC isn't
stressed because a MECID 0 won't cause mismatches. This commit is just
a printf to allow double checking that MECIDs being provided by TF-RMM
are not zero.

This commit is just for debugging purposes and will be discarded.

Please uncomment the line to make it effective.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 target/arm/ptw.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index aacc32ba33..bf58ac656f 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -3939,6 +3939,9 @@ static bool mecid_check(CPUARMState *env, S1Translate *ptw, hwaddr va,
      */
     if (access_type == MMU_DATA_STORE) {
        /* Store MECID for physical address 'pa'. */
+       if (mecid != 0) {
+           // printf("MECID (in register) stored for va = %lx pa= %lx is %d | s1_mmu_idx = %d and ptw->in_mmu_idx = %d\n", va, pa, mecid, s1_mmu_idx, ptw_mmu_idx);
+       }
        set_mecid(env, pa, mecid);
        return true;
     } else {
-- 
2.34.1


