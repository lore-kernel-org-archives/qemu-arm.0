Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp2161174njb;
        Mon, 17 Mar 2025 04:17:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVnfbkXOK0sHcx0vzcTcWpS9dpNJQzlW8viZ29Y0pVQrC3g7zTUJL4tHsmVGNvQkwEONxmlToJIUvPe8Q==@linaro.org
X-Google-Smtp-Source: AGHT+IHDuuzeMJDF/cAcWIcDeQCpDReH9DaDNNV2g5vIZ+01zDasYSbC/Yh0IF9m7Muc2HWWM2LJ
X-Received: by 2002:a05:620a:4726:b0:7c3:c695:156 with SMTP id af79cd13be357-7c57c7d29a3mr1366854485a.16.1742210274513;
        Mon, 17 Mar 2025 04:17:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742210274; cv=none;
        d=google.com; s=arc-20240605;
        b=LDCsPkxfVpMPIt5VEk+IX2KOo/OiwsDTN93S6zBiC7wg9AWVSktNQlRkCiUkGhGxF8
         EaFXG+yTbQvY01OIu4SjUr+PXSaWEAZfRqbKYQRHzFxrgCnLa91+ZWGUJXGgewCDOpHK
         sBDYwSnPLkHsHSS3hFUJjetU2kkKhEF0WgJSG9/xN0xq7Xp5RYjcnaQu8epcNJOgjZw5
         lVdwD87aPnGc5925ESNOZz01pDe/WTAjmiaUEzCHJeYHdqhzNiBxcDcvX0REGYlabcBS
         PVJScQfMuak2FoD7Bg65wFJ/npJubA/FLbJbfvdtK9Omw3K0lqZy0Vn2QjgwuG1gYq9x
         6sPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:in-reply-to:references
         :message-id:content-transfer-encoding:mime-version:subject:date:from
         :dkim-signature;
        bh=6CHlSa6FesbaE//XoscZHu5Gz170/KWdbmIiQDcVlS8=;
        fh=Y6491rFhbW+ThdGAYvBdUzBHN3wlmEpy4KQSmFkoKH8=;
        b=PisOIqtIU1YyN1r43uMf1Z1fdgEdqATK6UxjTetr664a5OiRuvhJzcgU9dPDS1tvGi
         JbJazEi6SVZj8MwdRzbVwUoqUdffld+6vOG7MOgo9jft+X0mf4KmfByNRkO5kAqqJ0YH
         AWTLn13oaY1Y9HVhbDh7HX+KwK15MCstgCIcv8bMWz6/0XNIrHtpjMywDpwYWMqz4z2A
         7gz5YellMUy/+bkvFn7johXdkILFYfWuHeC9sf5aV1nmCyPS3ww5y0UH/wlWqnu9IpY3
         /PgMuHeBJp8ACqW/Iv/FSdtCJ7YbM3DG0V8W9mNYrUrXmVjVYBQ9oIojlIc0I1jP74fR
         Yoow==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=tPuzlP2X;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c573d149ccsi943305985a.496.2025.03.17.04.17.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Mar 2025 04:17:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=tPuzlP2X;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tu8Sm-0003IJ-5y; Mon, 17 Mar 2025 07:16:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tu8Sf-0003Fu-Sx
 for qemu-devel@nongnu.org; Mon, 17 Mar 2025 07:16:49 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tu8Sd-0003me-K8
 for qemu-devel@nongnu.org; Mon, 17 Mar 2025 07:16:49 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-225e3002dffso36793855ad.1
 for <qemu-devel@nongnu.org>; Mon, 17 Mar 2025 04:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1742210204; x=1742815004;
 darn=nongnu.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6CHlSa6FesbaE//XoscZHu5Gz170/KWdbmIiQDcVlS8=;
 b=tPuzlP2XHWLjIcg+F2raYgEejs0fSOWQF2FLYdymcQA0TskIq73A4JNo6SxEIR0R3k
 UiX4jUyQOdd3bOkBHlK5b5QkGqT2vpt3fU3LnBtCQRfKnZVXPpOZ3wo0lha3eHA8Gm9s
 1cFMdky/DQ0S0dghkuc2WypSLLABr9XbYjFd4Ab1Eju4YON7rv2QF4AXC4yQNt3I4BHq
 bE4lzu8qshl2vM/Qnrhfs06tU7S9hYNcgJBpDCkThDPwgdFOuJhc5LplTbhu0SNLsf+u
 pselVTz56BWvsnqcP6/UlegEEy2D1E9pg91xN5p+r6NF+SQmT6qDOgBSAtmpuW+FlYXx
 gqFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742210204; x=1742815004;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6CHlSa6FesbaE//XoscZHu5Gz170/KWdbmIiQDcVlS8=;
 b=I8RBMEjcAwcNUGLdASFkPk5cEeyCnHg6X5bcYRNWMjX7kcjx0XJJds2rfhjvd/Yei2
 W6R9Ih9kst7sLkC9rG9SJTdgkHsR6QZ8A9RxJ1ZCOVSI044asXK044Y1pUsMURvTuwU8
 pY4GzfIR2T2YmvI44JVrn9DQEgM40BVW8QzTWnETlOEBmGggQ2RC/F882TOVE3A3sb5e
 Cq/S5u4WLQrjS3okeLkD9lzIrnJzlNjVEhDZwdbUE2dm8x1Fncllxv1mAKjkEg5C4qTw
 +E3tk8cxXwyS4gBP231k12VMIcVpq4woLzQ8x6ZvewczR4OWQzWiF1QG8Km5CY24qUJa
 0RwA==
X-Gm-Message-State: AOJu0Yyd9AUMccCWKGRHnM5Ltnh88FwePrhwPaMFwUUK3WwWfRryWrn+
 J79seANefi898XIzCzJtZwLFyZquyQn0danGW8nIrhn7pf6geiDchbhQds0x00k=
X-Gm-Gg: ASbGncsOWATaDrzcCADhDzHjBb9GVxEvWwi6O/EGnKgqyL+1CS3/7f4r/lrG13SZzCJ
 ntjrALBkvKpiV31FrdQc4jYbZ1XMbh4dK7sFtlEQghnybVHt2E2ecp2ZfKhrsC2MDseC2vXMixc
 JrhjJHZc2XiKAPR+nibpIAPdGtaWWAw0TyBzZZxJw4IgxH1Ic5sfk23Ys+PiZzxr1cIDfKNX5f2
 gNWg+hgltpU+GW+iK33uLhiJtzkNo0WzpHAcsYEsRMiNYg+X7RhkdNQ0C8zv2S45w3ixp2JPZwh
 jS4n2LDAfjDU7bPeoiVxKbUTSNJWkcIcbDnZFwGnka+yUD58NlKaiGJ3+TQ=
X-Received: by 2002:a17:902:ce8f:b0:224:1074:63a7 with SMTP id
 d9443c01a7336-225e0b0998emr139821925ad.47.1742210204486; 
 Mon, 17 Mar 2025 04:16:44 -0700 (PDT)
Received: from localhost ([157.82.207.107])
 by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-225c6bd4d6csm72288065ad.238.2025.03.17.04.16.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 04:16:44 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Mon, 17 Mar 2025 20:16:25 +0900
Subject: [PATCH 4/4] target/arm: Flag PMCNTENCLR with ARM_CP_NO_RAW
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-raw-v1-4-09e2dfff0e90@daynix.com>
References: <20250317-raw-v1-0-09e2dfff0e90@daynix.com>
In-Reply-To: <20250317-raw-v1-0-09e2dfff0e90@daynix.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 devel@daynix.com, Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.15-dev-edae6
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Q4A2Dj/Y89cm

A normal write to PMCNTENCLR clears written bits so it is not
appropriate for writing a raw value. This kind of situation is usually
handled by setting a raw write function, but flag the register with
ARM_CP_NO_RAW instead to workaround a problem with KVM.

KVM also has the same problem with PMINTENSET so add a comment to
note that. This register is already flagged with ARM_CP_NO_RAW.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 target/arm/helper.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2dd8f4d56a1e..ee15132aadea 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1901,12 +1901,21 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
       .accessfn = pmreg_access,
       .fgt = FGT_PMCNTEN,
       .writefn = pmcntenclr_write,
-      .type = ARM_CP_ALIAS | ARM_CP_IO },
+      /*
+       * Flag PMCNTENCLR with ARM_CP_NO_RAW instead of implementing raw
+       * access to workaround a problem with KVM; KVM applies bit operations
+       * that prevents writing back raw values since Linux 6.7:
+       * https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a45f41d754e0b37de4b7dc1fb3c6b7a1285882fc
+       *
+       * It is fine to lack raw access with PMCNTENCLR because KVM still
+       * exposes PMCNTENSET, which shares the underlying state.
+       */
+      .type = ARM_CP_ALIAS | ARM_CP_IO | ARM_CP_NO_RAW },
     { .name = "PMCNTENCLR_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 12, .opc2 = 2,
       .access = PL0_RW, .accessfn = pmreg_access,
       .fgt = FGT_PMCNTEN,
-      .type = ARM_CP_ALIAS | ARM_CP_IO,
+      .type = ARM_CP_ALIAS | ARM_CP_IO | ARM_CP_NO_RAW,
       .fieldoffset = offsetof(CPUARMState, cp15.c9_pmcnten),
       .writefn = pmcntenclr_write },
     { .name = "PMOVSR", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 3,
@@ -2025,6 +2034,7 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
     { .name = "PMINTENCLR", .cp = 15, .crn = 9, .crm = 14, .opc1 = 0, .opc2 = 2,
       .access = PL1_RW, .accessfn = access_tpm,
       .fgt = FGT_PMINTEN,
+      /* Flag PMINTENCLR with ARM_CP_NO_RAW, as with PMCNTENCLR. */
       .type = ARM_CP_ALIAS | ARM_CP_IO | ARM_CP_NO_RAW,
       .fieldoffset = offsetof(CPUARMState, cp15.c9_pminten),
       .writefn = pmintenclr_write, },

-- 
2.48.1

