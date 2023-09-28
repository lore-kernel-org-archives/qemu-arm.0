Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp2281711ejc;
        Wed, 27 Sep 2023 20:45:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGObxpu+T+u5G1AiIQ+JJl/8kRWPMeNWAEvac4tsxTpiwGBv6Q5mKSQq6aNoco2JZg+J+Ma
X-Received: by 2002:a0c:cb88:0:b0:65b:1468:8210 with SMTP id p8-20020a0ccb88000000b0065b14688210mr85667qvk.23.1695872738283;
        Wed, 27 Sep 2023 20:45:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695872738; cv=none;
        d=google.com; s=arc-20160816;
        b=dCacsXwDgEkw44aRIkgvvcyGseXH62ZUYhCfFr6X8RYMjdYTlnNYasczRSXaSuLdBJ
         C7zaF0c1UeCjKpyR2yjFpJUxOrQ85IzTs0R6tjwbmt1lVHRbJoIkRGR/bKJZkIKigyaA
         psFhx9sY0aMa+ow/BrcBZHCrTOzEKvoA9x1QGxPL+luINYqoEvV+AnLgf+L5Bpz6GBEZ
         aSuj/0OT8YUq4BqW2gxCTJKFWP/A+ZvQ8X0Qk1z7D00VCVGMaF0p0LzdeIWUedhWFk4F
         jlQ7pRRNl/7VwWuEGryrWSJ8EyQom4Ukaww667e0dwPBQkkNBY5jp/0i59EEGjqxwug6
         9TNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=u5EjZO0FSTo0z0F5HeuyqBSfkOQvotXueCY1QPBCd9A=;
        fh=tBgwZEDnZy9+WvcDFLyj+KFRVTmArTrKTZo6hZlbXFs=;
        b=e0Fb83HKi2gN9IaG67fc7DOlNIa5uraPrUw+yOvvM7x2cCIkOdgTc7cReRbzlagerE
         ek9gu6PtOoAPTjENKQtURR6VMSSgp13P3RcoVR+wQAVnHc1ZzG47Meo7m74GAVawtHGj
         eAk13ciwZ3pwNKISKR0+ralq97cLCkxTtDePQPXpn/XRn2LoRk+O+a7hibGjVJtvJZn9
         XodI8zBK/6WmSLxG1P3twzHB0rrDRzLlUNYK5zna49SLkCKa84o1X3dWYKUFiGKSlFrx
         VvZJ9q7a1m0qS//a++4ubSKZghazEhcK1BE4F7JOS0URhudiUlJUnSpyjvZ+hxLpSDXp
         arGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Ekz6yWK9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s2-20020ad44382000000b00656262151b7si8629451qvr.256.2023.09.27.20.45.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Sep 2023 20:45:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Ekz6yWK9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qlhxu-0007iI-Pn; Wed, 27 Sep 2023 23:45:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3yfYUZQYKCDoYnWqanckkcha.Ykimaiq-Wnijkjcjq.knc@flex--crauer.bounces.google.com>)
 id 1qlhxs-0007he-IR
 for qemu-arm@nongnu.org; Wed, 27 Sep 2023 23:45:24 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3yfYUZQYKCDoYnWqanckkcha.Ykimaiq-Wnijkjcjq.knc@flex--crauer.bounces.google.com>)
 id 1qlhxp-0001Gz-TU
 for qemu-arm@nongnu.org; Wed, 27 Sep 2023 23:45:24 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 3f1490d57ef6-d84acda47aeso21220653276.3
 for <qemu-arm@nongnu.org>; Wed, 27 Sep 2023 20:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1695872713; x=1696477513; darn=nongnu.org;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=u5EjZO0FSTo0z0F5HeuyqBSfkOQvotXueCY1QPBCd9A=;
 b=Ekz6yWK9rAmW5aluUGKaIAITYsG8bgP18wQs8PbYPTUsbDJ0qB21f5PUF37egFZ4K4
 k+A7vkUoPFLHW9iTdZoJ0hvQzfWfiHLOCY99zIVPJlP0FaySbSdRBXjzISBzWkx6xSyK
 BGUy6YBQOc25RbTzSmrR/zdAbbngDcP+ekafnzskF135qQxh+UMwJ3AnrqCyzOBUk/md
 kO0KNyxSvcksEcypyYHHbtkoZnY7/n+6+rIMfou5mdJ4LK8hMHv2U91g8MzqoZggvWDV
 bRidFWOAZLytr58mnVh/KESZr48SqRA87eVU2xBe0jcBzysbyR2WLAqqX0LJ+M9XtUSy
 iC9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695872713; x=1696477513;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=u5EjZO0FSTo0z0F5HeuyqBSfkOQvotXueCY1QPBCd9A=;
 b=wnoec5ihZkOLL+P7fxTX4YN1p7ZmNfvX1a705GMA/aw0s0CtKorepYInqz38gf9zAn
 pBsk21PvPrbWfLPXrc9eXs8vxpEVnY9gg573Q/GK2Ss4yv4WnY/Q+Lz7kDiDhXcjsgF4
 LCVYL3qNUUURbyC+/FrrBRTDUI1BhB1jf98Jf/zkmDBQ9B6xLH4uuWA0utiCdkPITDwE
 KnV2UMjlsRq3DCozVpaV9Y4HTIiXyxQIw0Uyc3VQgSYMNY7zN8zpiNRCjfRUkvuH23lO
 L2nf1xaw1b3Zb4lOtai7NFmgceKiE0Wf8FwjmDKjvzuAi9xUVkJ1v4YF+VBTxz1Z/Qb0
 tgUA==
X-Gm-Message-State: AOJu0YyT3vUDgHykLXUo5z42sJgGkmoqXQ2/xMSSdSp7VpgBpdtwiJcs
 bxfd4c+gOX3pz9jiGHmBlORllql7lAo=
X-Received: from crauer-cloudtop.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:100f])
 (user=crauer job=sendgmr) by 2002:a25:cb03:0:b0:d77:f7c3:37db with SMTP id
 b3-20020a25cb03000000b00d77f7c337dbmr613ybg.8.1695872713127; Wed, 27 Sep 2023
 20:45:13 -0700 (PDT)
Date: Thu, 28 Sep 2023 03:45:05 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
Message-ID: <20230928034505.255480-1-crauer@google.com>
Subject: [PATCH] tests/qtest: Fix npcm7xx_timer-test.c flaky test
From: Chris Rauer <crauer@google.com>
To: kfting@nuvoton.com, wuhaotsh@google.com, thuth@redhat.com, 
 lvivier@redhat.com, pbonzini@redhat.com, stefanha@redhat.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Chris Rauer <crauer@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3yfYUZQYKCDoYnWqanckkcha.Ykimaiq-Wnijkjcjq.knc@flex--crauer.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: E20H1r6NV0kI

Fixes: https://gitlab.com/qemu-project/qemu/-/issues/1897
Signed-off-by: Chris Rauer <crauer@google.com>
---
 tests/qtest/npcm7xx_timer-test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/npcm7xx_timer-test.c b/tests/qtest/npcm7xx_timer-test.c
index 43711049ca..58f58c2f71 100644
--- a/tests/qtest/npcm7xx_timer-test.c
+++ b/tests/qtest/npcm7xx_timer-test.c
@@ -465,6 +465,7 @@ static void test_periodic_interrupt(gconstpointer test_data)
     int i;
 
     tim_reset(td);
+    clock_step_next();
 
     tim_write_ticr(td, count);
     tim_write_tcsr(td, CEN | IE | MODE_PERIODIC | PRESCALE(ps));
-- 
2.42.0.515.g380fc7ccd1-goog

