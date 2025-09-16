Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B8AACAC59B
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Sep 2025 14:26:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uyWaf-000637-8F; Tue, 16 Sep 2025 10:23:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uyWaB-0005l6-R5
 for qemu-arm@nongnu.org; Tue, 16 Sep 2025 10:23:05 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uyWa3-0008JQ-UG
 for qemu-arm@nongnu.org; Tue, 16 Sep 2025 10:22:56 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-24cde6c65d1so48194365ad.3
 for <qemu-arm@nongnu.org>; Tue, 16 Sep 2025 07:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758032568; x=1758637368; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/1Z+zGdBvcvJv/ItuHePFPF4VkGGlPqEflFLb1drkmY=;
 b=tL49jcOD4qJpcO1BffdGEugL/KZOIBtZTmfqY0HwvXJ7jG4xDEmku3zdRW6gsSrFrV
 KwMhHGclQpL0EX/45wkt1G1VZDy0G9tE2zzPVlRydrY3u5OVImf9J0MIWoWNbPmPi+xf
 Y0+XdqUQeTJutCQ0XyKFGtDsgFHb7lPbqC0b4Ag29fFMaMuB6Cayj4P/Esj4eRL4NGm8
 lTCYcnj53tZac9/jIPaSRRAqu01UQzD5yXMouv2yZsuQTByVNQ7v2YnS8P4fPvY86tkn
 fOvx9fSkGrMvif3uu3hio9HRq5Y/LR3iU5RXuzC84rj6C34DeDA8zQ1cgU+tgFP5qLNL
 lYpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758032568; x=1758637368;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/1Z+zGdBvcvJv/ItuHePFPF4VkGGlPqEflFLb1drkmY=;
 b=YDR5V+ZalYU2wQhvItchlSFOSsSsXEizE/zauD4F9LshLolGTA3OGEte3Ze6SYQpal
 VzbOz/vhGCjsv2Rdd05LNvBWLSDc8ne1jvVoqk/5RBJ/HpEHq/15dehv9YRjfl+461yn
 6j0jb666UgeiZzyeWBN2tMvM0aIyW78hWbcG81SDVF0f9aVWK6CA7uhumK3liuPGfoHG
 rUSlqU7nRFEFoCCgNWqx3+0LcsNajbl6u8M8hc1eOR2lIZ7caG1Lo/OY2a5PBJHVtcjT
 uY0mlRp6t5OTZKHcbJun8fYiY1tFKwMtahz8DHbPVHBsWN6Sps6OajSprlrxFQvlQYqJ
 aEyw==
X-Gm-Message-State: AOJu0Yxj6NBXMR0jLrm/Csfi4EHl+5P3a674eDntvIxgJVwMA4w086T8
 CWuNNEqEQcox5rDG1MtbOOZd+WgkquhOCDQmABAiqSkVhQuFx9V4immshhjmMvetPp0=
X-Gm-Gg: ASbGncu4RPC8zyK91FFzmnaMchyZ3mOvLvccuV2d/0SdQfkvdulyYPoH6elwbIWrBhg
 XWaa5Kp9kI1ui/Ok9xWceKu3ODt6E0vo0BtfsFjRKaOikJsTXdUXTnxrEa+SWgorNgLTItrOCqr
 8w2bBB7gkq+DfomYY/v46fII4nyXAJuFAlE0QSTEZBsvoVsGlK8/WENsmE/Ibrp2/WKq09CMeWk
 k+lE+HbfMZroRszLbZ6CqZOoG/BPVqgMKHeeES9GCLnrPgU4obbabTWBYndRBfzECwBLbdVrwRZ
 561mrnO1vJol9S4/0PyBQHVNZvN+puqIkefxfu3dURoJpRqOoGL+yQ7TQeM6LpCSlLDi7YTQdOn
 0O8k/sSNOBqcIlyw3TacZ9HfNwZC4
X-Google-Smtp-Source: AGHT+IF/2DdPkCN70tDr5478PzxXyOUoTp89QLBFx5j4RTOjD2SNk1fiE9y30CdMJvrSmyvAbMVl0Q==
X-Received: by 2002:a17:902:e783:b0:25b:dcbf:43a2 with SMTP id
 d9443c01a7336-25d2762332amr187793705ad.52.1758032568042; 
 Tue, 16 Sep 2025 07:22:48 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2651d2df15esm73459905ad.45.2025.09.16.07.22.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 07:22:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: [PATCH v2 10/36] target/arm: Use raw_write in cp_reg_reset
Date: Tue, 16 Sep 2025 07:22:11 -0700
Message-ID: <20250916142238.664316-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250916142238.664316-1-richard.henderson@linaro.org>
References: <20250916142238.664316-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

Reduce the places that know about field types by 1.

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index d0f6fcdfce..48d0f03098 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -192,14 +192,8 @@ static void cp_reg_reset(gpointer key, gpointer value, gpointer opaque)
      * This is basically only used for fields in non-core coprocessors
      * (like the pxa2xx ones).
      */
-    if (!ri->fieldoffset) {
-        return;
-    }
-
-    if (cpreg_field_is_64bit(ri)) {
-        CPREG_FIELD64(&cpu->env, ri) = ri->resetvalue;
-    } else {
-        CPREG_FIELD32(&cpu->env, ri) = ri->resetvalue;
+    if (ri->fieldoffset) {
+        raw_write(&cpu->env, ri, ri->resetvalue);
     }
 }
 
-- 
2.43.0


