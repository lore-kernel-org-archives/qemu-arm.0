Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBFA8CA100F
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 18:57:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0lgB-0005VB-Fe; Mon, 22 Sep 2025 14:54:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lfT-0003uy-Ni
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:53:46 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lfC-0004xc-Hx
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:53:42 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-25669596921so50316025ad.1
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 11:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758567200; x=1759172000; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UArNSBfDRY0R4yQf7I4KwaZGkKosB9HEkNsmXAhE3vY=;
 b=kkmdIEEExRzQG7UXnm5a3+o7OE/UzSw5ksMDoavDLJV4v/ac9bw5dPLhVFF9riXFLL
 YSx7zVVeANoPxDoT7h2PXncZiR5n3HdDndPMr5VLApbDBWdM6ooa+qyOUrNU+MTHUjSA
 pZatrW682wFw40e43Ycfp4RJ7+qoaYJrJvhHSjwKq4CkpAS26Kr8OePCipVBi0/Jmwgv
 Mh3+o5CBWJES9BOHd+BZgB9vqY8hGLL3QcN4hJW2vNQEQQNLET+E+xgy+I82F1oUt5zK
 sNs8PnBjfwdagJnWhy2wk8E1TzWKovxjj7JGrlUcyotytVMZuh4qDMokt1cY1wg4SSeN
 WTRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758567200; x=1759172000;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UArNSBfDRY0R4yQf7I4KwaZGkKosB9HEkNsmXAhE3vY=;
 b=VtH4ykYistKDIubliTW/iZe+l29E88BsLcE255G3OpAM1VK/kfR0aG795stNKK48rH
 Evunnz9rVkfzN0B7VRS3wVgNBnh4PZ3O+HTjxoUo4avMHmscy7xycakeH2xSdY6kiajV
 Vrql6bWDc1IBuZsnUGpgNfeOx0HKKev93n8bEnk3cLgENOLiRZ1QjegTK7BTJLD8Q292
 xYJw/trrHhl6Z8e+v/hnhnjwHq1T1MN56Fc4AfYawgRnuYa45yzpAzbE4oQMOVmry8Mo
 z69IWGZcPTBeWBQ/ipeDCmZZ6QehKowbVrviENJwGfgeG+qfypdXDDb3KR5oNT799Psb
 UmvA==
X-Gm-Message-State: AOJu0YyBX8YgoO3Q7f6PaPhotnXHgr42v7kmYLV+MzFvtHOiypLeh2C/
 RjCfSOGtQQdEfeCuvu3pXWzPrzvncqECBlpRr3DgggLAh+z7BqzWOK8rwTuWgiXYrrNMe9I/PLb
 hkeM5
X-Gm-Gg: ASbGnctUxC9dGQXeE5hKeejgC7+9m/Vdzxu6e/5qgHLl0VFre28oXoRiqd/pCcoxNPf
 ziVvT3rUMHCxGWTYmM8bph5IL+bIUerlB8BtZACCZiTQTraKZFi9Trlj5KQOtSc0Mr9IBB9hz/L
 +IP4hNqQ6DjTNQvYkXiYXWO5PDObaYO6ISoZ9kvOeFvh5//jhej/ABC494o3sK8z9S2pQhB6Uzs
 m1VfC2PM1M1nKZBtVxMf3kwGwfWq/4UwatTnYoYeHSW3LzptjKAuMAD1OUpHjS4/xj9UCWbQpbj
 WVP/+MxC7scmUuhzE+cFWtfrV69COkVgOBMGi8kIpteBgX8PFsFPY4JguGNY5BzZ4NXWiiJCkLs
 i21xDS0QuoKhWrgl/3s5yGqgBQiyk
X-Google-Smtp-Source: AGHT+IGMG41LBzRR5kJxvDnmCzZVc91o4fst+YtFHmwnkOSzHvM43kiQybuoBwLFOdAkcBNyT16BCw==
X-Received: by 2002:a17:902:e84c:b0:25c:b6fb:778 with SMTP id
 d9443c01a7336-269ba43115amr202392815ad.14.1758567199984; 
 Mon, 22 Sep 2025 11:53:19 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2698018a472sm138554795ad.58.2025.09.22.11.53.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 11:53:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 48/76] target/arm: Emit v7m LTPSIZE exception out of line
Date: Mon, 22 Sep 2025 11:48:56 -0700
Message-ID: <20250922184924.2754205-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922184924.2754205-1-richard.henderson@linaro.org>
References: <20250922184924.2754205-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 57bc8ea4c5..3df0bbcb7f 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -5598,11 +5598,10 @@ static bool trans_LE(DisasContext *s, arg_LE *a)
 
     if (!a->tp && dc_isar_feature(aa32_mve, s) && fpu_active) {
         /* Need to do a runtime check for LTPSIZE != 4 */
-        DisasLabel skipexc = gen_disas_label(s);
+        TCGLabel *fail = delay_exception(s, EXCP_INVSTATE, syn_uncategorized());
+
         tmp = load_cpu_field(v7m.ltpsize);
-        tcg_gen_brcondi_i32(TCG_COND_EQ, tmp, 4, skipexc.label);
-        gen_exception_insn(s, 0, EXCP_INVSTATE, syn_uncategorized());
-        set_disas_label(s, skipexc);
+        tcg_gen_brcondi_i32(TCG_COND_NE, tmp, 4, fail);
     }
 
     if (a->f) {
-- 
2.43.0


