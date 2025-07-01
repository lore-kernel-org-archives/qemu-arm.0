Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3056842dye;
        Tue, 1 Jul 2025 03:34:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW9R0PIR5YEjzZ0SFkuGulH4/AjhJG3Qf3jg/KtdYL6dtUgIvExwQ7HkVRNeLfX4vuS+ZESB467PjTBDQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGbKx+2zmkDZBGkmmRW/FR14jad4uEiIF3OQ/aT2vfExbSamkJjNzORhOnUY2pkH1ifPV4L
X-Received: by 2002:ad4:4ee2:0:b0:6fd:37c0:2c74 with SMTP id 6a1803df08f44-70001d66c35mr232541636d6.11.1751366080698;
        Tue, 01 Jul 2025 03:34:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751366080; cv=none;
        d=google.com; s=arc-20240605;
        b=A3y+qRKl8clnzSBx6wL46NDF2k9A9y/XknWo9r5iCaI1wHzlJ72g7JWLOXAaif+VaZ
         EhBZVzOt7JP4RXQBn4Dr5DhVtBKfwm+c3rLaf6zpfKY7X4F+E0gMClt6GnAq9GmV8E86
         iyHGc3+TBEwHynJo8GjbHxW31NqeGpdqpp9b9RUznJ90nY+leEZPqLFzhvsf8V3alB50
         7PRazAYYoA10OD067QsFOHO/HWsABYG5Kx8b7dMpE7Avmtc00AwHxGlhEmg0L3aCtNRi
         sNhWW3JuPFyYEu44ghxbdd5mX7Yy6Sz3GyEQxyaFykGA6GivBRKCCYPXpiUg0JjQRK4i
         W8Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=nn7pEBa0qW7/HK5JWwan6hjx8tL/xhtvqcSy45ddR/M=;
        fh=YY9nUc5w24cMHuHgTFjcuo3GC73LQtyUYEufVd64Hvs=;
        b=akmaFlFKrDpAVlEJFslywcmNdhjtQM29XOtkpoOYn4N3VkQqnQ0u76hy9N3inXAURq
         7fNnIea0n1HnYut1lD+WWJEAjJLOlCL9HoE9UF1Ndz/V97HevfrzpOg68L0CRyRXv7B+
         oIqEMW0e2dOiG1zbJL6NqnEH71Gshizqs6tDpo9SmL4FXCymZ9CCBz+dBlC0Vt5o3G/x
         WxM5MPb/stdO/zloSkNKuaRyXHm3AGIBCSDRGAO5BmNd/2wyG/ZvcWD4bPeG3DwQlCf9
         j6e37wDCJ4hJIGEs6d7LTlYYEDj9+SFgrczrfrL2Qfz3AAHEpoI9GyDvJ7rSVPgsL9hs
         YntQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=YEQ96SlX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd773aea4dsi122451206d6.468.2025.07.01.03.34.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Jul 2025 03:34:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=YEQ96SlX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uWYIS-0004oY-7S; Tue, 01 Jul 2025 06:33:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kosasihwilliam4@gmail.com>)
 id 1uWYIQ-0004oB-JR; Tue, 01 Jul 2025 06:33:02 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kosasihwilliam4@gmail.com>)
 id 1uWYIO-0002Ik-DG; Tue, 01 Jul 2025 06:33:02 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2353a2bc210so26827145ad.2; 
 Tue, 01 Jul 2025 03:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751365977; x=1751970777; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nn7pEBa0qW7/HK5JWwan6hjx8tL/xhtvqcSy45ddR/M=;
 b=YEQ96SlXBJ7ODkbOHcvhZnTNA4DTtaK1NjFmzA/19zkVfzZg6dNrruhOLD6T+D1nk9
 C7WKLfrPuPL2MXAAZv0ep05ojG0FFIiKZkL63WSoQoex3gg+JWwGImnn8nwc8mr8z4Wl
 ybL6OK3LTx9Nth+rQULDofheWnUR5Jz11sS1V2+YvToIMoLFa2PXLBjqoTJ+JtqWkh2E
 7t2H3kaDEg81DllE/LFS11Y/IZp4u2YoQPqOg2USG5jEEJNstgC2RV/ByS0gM4fqQaBD
 Ww5BMl3ck5ahPiPAW8aDcDA8zpBevrJ9C2KUe5+MUNKxTW/sAkGF8Vq0nzHGPDImpDAp
 IC6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751365977; x=1751970777;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nn7pEBa0qW7/HK5JWwan6hjx8tL/xhtvqcSy45ddR/M=;
 b=BbMOqQvBEE5wjqDnTNTjdN1EOzKRgOj1QZRv3rftZnfCZF7DX4b/2Hg1vJfPD3Awmp
 olEzUt0hZAc06ty3RGTa7QG5u5ob7oBo0iCNTdS2vxJvWqlWLqhWRt1Jcg9g17dNYxMp
 ImGrYHVRfWwQDT3Nch/ZG5j06gUCIDOYtbyoWewLRuaajTfNhJ8qr3MnY4dgsq0QOYM8
 5qbA3NxjFafre0JHiAe5h7MMxmusrOUFD7InUg1A4035NUzPH4kPpxwN4IFDlw9Adfgg
 wwaIHbO9EOs4A+9lVco6qDf1VmP7sjvamDyB++k67mcv2f5NqIRvffvJCH5y1NU3d9Gw
 OPEQ==
X-Gm-Message-State: AOJu0Yxy+yNLBFVzYqE9fqBuXczHfGMcytBtmZ/q/1P17EtUtiXROh//
 28A/ZV+/LqJesKppHacQ4DWzanIejrOYpZP5/i8e1uulXC6m0X9RCpMBjtFxP3rBBHo=
X-Gm-Gg: ASbGncv8KALBhR8JvEweWU7mcerk8nJOvh5ksnM+/dTc5ZX+BgyQY1XS6BAYhIpt7QK
 u+dvGr1z4aKcQDsCq5MI0SXAyBD+MQfytYP8ptz2mTcK8n/MVPjGglhDZvF0cAtRCEg9N6yVMgz
 my6eJkerx7SjpYCDIivTzz7wlOAwocP2IHbP1MgJkO6VlL1vgX7FecQuxbpEQJcFWzd4M4VSJU0
 oZkPprfANIi0TYAQF89Tm1L3hOyo5gAGgAjwyIaXAXqRPPJqgD8Zv3bqQRyeS7zlp5KmFrTYpEz
 0CKFDXEedt/1ifbS+Y+5+xY/DQ/XJsy5zy8POWZPSwhYCb1bnaTDe4XJU+wLi5y6sf4XmXOGZOu
 4cxkheiL8xVxjaMXKFg/5g3NYqiTITI2o6rC+Jv/a2k4=
X-Received: by 2002:a17:902:ce87:b0:235:7c6:ebbf with SMTP id
 d9443c01a7336-23ac46342d3mr287965775ad.35.1751365976659; 
 Tue, 01 Jul 2025 03:32:56 -0700 (PDT)
Received: from localhost (pa49-178-74-199.pa.nsw.optusnet.com.au.
 [49.178.74.199]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-23b0b3bc0f1sm59135935ad.171.2025.07.01.03.32.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jul 2025 03:32:56 -0700 (PDT)
From: William Kosasih <kosasihwilliam4@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 William Kosasih <kosasihwilliam4@gmail.com>
Subject: [PATCH v2 05/12] target/arm: Fix VSTR helper store alignment checks
Date: Tue,  1 Jul 2025 20:01:52 +0930
Message-ID: <20250701103159.62661-6-kosasihwilliam4@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250701103159.62661-1-kosasihwilliam4@gmail.com>
References: <20250701103159.62661-1-kosasihwilliam4@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=kosasihwilliam4@gmail.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: gL+ULHy51+te

This patch adds alignment checks in the store operations in the VSTR
instruction.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1154
Signed-off-by: William Kosasih <kosasihwilliam4@gmail.com>
---
 target/arm/tcg/mve_helper.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/target/arm/tcg/mve_helper.c b/target/arm/tcg/mve_helper.c
index 922cd2371a..a49b8842e3 100644
--- a/target/arm/tcg/mve_helper.c
+++ b/target/arm/tcg/mve_helper.c
@@ -197,9 +197,11 @@ static void mve_advance_vpt(CPUARMState *env)
         TYPE *d = vd;                                                   \
         uint16_t mask = mve_element_mask(env);                          \
         unsigned b, e;                                                  \
+        int mmu_idx = arm_to_core_mmu_idx(arm_mmu_idx(env));            \
+        MemOpIdx oi = make_memop_idx(MFLAG(STTYPE) | MO_ALIGN, mmu_idx);\
         for (b = 0, e = 0; b < 16; b += ESIZE, e++) {                   \
             if (mask & (1 << b)) {                                      \
-                cpu_##STTYPE##_data_ra(env, addr, d[H##ESIZE(e)], GETPC()); \
+                cpu_st##STTYPE##_mmu(env, addr, d[H##ESIZE(e)], oi, GETPC());\
             }                                                           \
             addr += MSIZE;                                              \
         }                                                               \
@@ -210,9 +212,9 @@ DO_VLDR(vldrb, 1, b, 1, uint8_t)
 DO_VLDR(vldrh, 2, w, 2, uint16_t)
 DO_VLDR(vldrw, 4, l, 4, uint32_t)
 
-DO_VSTR(vstrb, 1, stb, 1, uint8_t)
-DO_VSTR(vstrh, 2, stw, 2, uint16_t)
-DO_VSTR(vstrw, 4, stl, 4, uint32_t)
+DO_VSTR(vstrb, 1, b, 1, uint8_t)
+DO_VSTR(vstrh, 2, w, 2, uint16_t)
+DO_VSTR(vstrw, 4, l, 4, uint32_t)
 
 DO_VLDR(vldrb_sh, 1, b, 2, int16_t)
 DO_VLDR(vldrb_sw, 1, b, 4, int32_t)
@@ -221,9 +223,9 @@ DO_VLDR(vldrb_uw, 1, b, 4, uint32_t)
 DO_VLDR(vldrh_sw, 2, w, 4, int32_t)
 DO_VLDR(vldrh_uw, 2, w, 4, uint32_t)
 
-DO_VSTR(vstrb_h, 1, stb, 2, int16_t)
-DO_VSTR(vstrb_w, 1, stb, 4, int32_t)
-DO_VSTR(vstrh_w, 2, stw, 4, int32_t)
+DO_VSTR(vstrb_h, 1, b, 2, int16_t)
+DO_VSTR(vstrb_w, 1, b, 4, int32_t)
+DO_VSTR(vstrh_w, 2, w, 4, int32_t)
 
 #undef DO_VLDR
 #undef DO_VSTR
-- 
2.48.1

