Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55904CA9EBE
	for <qemu-arm@archiver.kernel.org>; Sat, 10 Oct 2026 07:10:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xFRDc-0001mD-NG; Sat, 10 Oct 2026 03:10:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xFRDV-0001cL-6a
 for qemu-arm@nongnu.org; Sat, 10 Oct 2026 03:10:02 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xFRDT-0001Bj-MX
 for qemu-arm@nongnu.org; Sat, 10 Oct 2026 03:10:00 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-48b0946c2c2so206804f8f.3
 for <qemu-arm@nongnu.org>; Sat, 10 Oct 2026 00:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791616198; x=1792220998; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=NwIsN9jm4Pp0I9NysNqzSQvse4ptZc1j97sn0b4Mv3Q=;
 b=XkC//Qo+UsFhdhIyyfa1LWbE3m7ehXePZ6LrgYSJWRmJoWtyFi2gJvLz+F1B2pd7Sd
 LMVWyo84m7cMq6IPhzf3NBzLDKwE4CfS354GkFvC7W1nIVF6+agjyngCGEdoXo18Zjpd
 Fxegwv/sxNbwmUgkt3h+7FdqefkO3YginIzR7uVYDpEKJ6DJuC8UobRH4vm3e63U5su0
 mdUMMP9nZFEyrc3yF1qiSHgBUMv82WYP/pk0NZJOG97WGDMLt95zT80ax0hmPgajVCt6
 2QSVZrosbL94I6wZEjebhwaLxVOoQOh19fydqa6Hu/HcEntZ/eFRBd/ed/rwxE8AoRnz
 kzrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791616198; x=1792220998;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=NwIsN9jm4Pp0I9NysNqzSQvse4ptZc1j97sn0b4Mv3Q=;
 b=EmhRAs8XbdbaZcgoXuIgg4C+CoScZ6nYrKF3FIGwJQX1PGz77AWFcuye2r8JMvWVtd
 6i3BPVBl3XyRUd1rdbDe/mOYjX245F0ORYHkClYDFcyYeiGecgxTcYAF5CY4hz5u3/hK
 J4DTV7iaChSkIqUhmlLH23Z5cwduo9TehAN7ZyE/LDWbWvjn/jQGaFvn1kVjRWXyjclP
 5NN79VPGPHdmunmIgoy6ZLBCUSe/I1bVmi6LFycU9RafQJoigVWnMpTlAZQvRofgHNTA
 IcrMAL+gvqjwzx1Chvo1UYwC0pkMoCHoqbbarWjoTvRRKVqbathTyhqPA3H+gImgWHb8
 ZoRg==
X-Gm-Message-State: AFq9FYJl3l5yKQ61zyuvwJKsBPs9j7LUTKSc+bqc7U0BSK7vrIM9HTbe
 2aycWPWT5kIwFXh5tlx6ZVU1nwpgCoygplAKZSpwsiDmoXSTvC0dzvQVGaOfaZOQ6bQ=
X-Gm-Gg: AYBFou28qCuxjFcMEPS7F8dhooWb8IRXbmOx4MiV1Cm+BALr5nV5AvmjsiFRFh5LbRF
 I79vBohnhO9llt+eTmeenJJnJdSFJjHkAwYMZ/aTi1r5ShhaNQ0ex9J5X7ZlkpWKrXAI5/HiETv
 hn2ZF4ZHv9wgqxjeSbcFbP2gUS37K6kRkkjPmC9dHMz6+lpUBlDXS7VvFiVwJn+FsKFlurogOdh
 f9aaWKANfAl9LLcm4dgthLTJwv9cCghZx6z9rUyccgXcfUc7tr13bEHv34cyJ03a+OaU2nW+c4L
 VaSUV0CS3Pjx26m6gbNqyUUzNPs+qo/3mqIzib2ohfP69Om3FE4w/F8Ffp51rvmSIOWjZi+yI+1
 bgVpYed0KCc4uzFt6EerKWKn7uiEwclQR7wPFwl6MZKnNqd+nJW6MDfJR49mVgRajTqu7yJ1HlF
 JUNaQUyPGXoYHbsSjiEUaIm2rbj4m1b3MFXdo4m+ccmUODQHUALGWJEzYjunhedij1GvYAqmMDe
 47KTP1j2OE=
X-Received: by 2002:a05:600c:4e0e:b0:49e:7c8c:361d with SMTP id
 5b1f17b1804b1-4a18e4c3f32mr86691165e9.22.1791616198131; 
 Sat, 10 Oct 2026 00:09:58 -0700 (PDT)
Received: from stoup.local ([2a00:1e:e082:2901:a2d3:66fa:95e6:7d81])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9abda3csm7662252f8f.36.2026.10.10.00.09.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 00:09:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 3/6] target/arm: Squash accessfn in
 modify_arm_cp_regs_with_len
Date: Sat, 10 Oct 2026 09:09:49 +0200
Message-ID: <20261010070952.323466-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261010070952.323466-1-richard.henderson@linaro.org>
References: <20261010070952.323466-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42c.google.com
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

When reducing permission of ID registers for userspace
access for an emulated kernel, drop the access check as well.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 187d0e9213d..a49dbc5acf2 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8398,11 +8398,13 @@ void modify_arm_cp_regs_with_len(ARMCPRegInfo *regs, size_t regs_len,
             if (pat && g_pattern_match_string(pat, r->name)) {
                 r->type = ARM_CP_CONST;
                 r->access = PL0U_R;
+                r->accessfn = NULL;
                 r->resetvalue = 0;
                 /* continue */
             } else if (strcmp(r->name, m->name) == 0) {
                 r->type = ARM_CP_CONST;
                 r->access = PL0U_R;
+                r->accessfn = NULL;
                 r->resetvalue &= m->exported_bits;
                 r->resetvalue |= m->fixed_bits;
                 break;
-- 
2.53.0


