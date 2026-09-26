Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C260C98328
	for <qemu-arm@archiver.kernel.org>; Sat, 26 Sep 2026 07:03:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xAMQz-0003gi-RU; Sat, 26 Sep 2026 03:02:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAMQO-0002u0-CF
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 03:02:22 -0400
Received: from mail-dy2-x0f.google.com ([2607:f8b0:4864:36::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAMQM-0000W8-3S
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 03:02:19 -0400
Received: by mail-dy2-x0f.google.com with SMTP id
 5a478bee46e88-33bfb26865fso1387627eec.2
 for <qemu-arm@nongnu.org>; Sat, 26 Sep 2026 00:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790406136; x=1791010936; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0gM6IoquW3yjdS4WUjO1V8C4p7BWFFY+pJ3+gr7qZBo=;
 b=HG4Z15uh/Ia0V/nw6BfPym3kXOYetEoOGc91OoMxzYk+Uz1TMycm1r5bhONfpD5B9y
 hkNOFzKlwENFosfkyr3n24QpptG7BxDHOMWXdotjSqd3l7EI61w42ss+g374HUq35KOG
 ZnfsZdTnUW+GCpAxXiorfixCBc/8Zv6O2WiQhw6ds8MdouWTbsS12Atd5x7SWexPEcQ8
 J8yl58VciDNpSo1j4Y2cz8joLWSxBaGWYi/brzbQl4tm4i+sL6d6770hYZYqFIwDY3EN
 ypu5QRfJu1pEmYzYRtRuckgT0hHRwGLh6htfIuMx5C4lcKTHtTUNHjj1JhJRw4agk3t8
 3OnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790406136; x=1791010936;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=0gM6IoquW3yjdS4WUjO1V8C4p7BWFFY+pJ3+gr7qZBo=;
 b=Qb4gq2Pb3BNFAQcjkEJG7hYBEpk05Gj4xwt5cbeQBVAIrM8Y5GGh24ZT2YCNoqMUUP
 HrNCnHNzuPeTqpS59tMfWbJY9+JpKrAZ7nYNhxVaIZ8jRK2fwCLLh2zbpRrSs6z/46P3
 3i2vFb5Fd6ytakSSzpWFl52dhMMveqzrKO57J7H9oi/a5/TnfiDLnH0GhLygDX+0K2uh
 igJNKNHl0V3NWAQVqZrqqpHf0wT3DBKUidQemLsfA3y9n9WY1C1/viC4HKZLO6HxZLCe
 OWWniRddgFTkcAhfMwvNEXWAhafDYVcAqVm6WjZg8T25RC9trF4FaK76u4LG2tXRQzy6
 9+rQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwcN0UGIOhwh+pVASqR7lt7ApEnt4ltL7EwJjg1PAE34rMWXDdorABnqBxGRRyiEr2xhlnCy4qA2A==@nongnu.org
X-Gm-Message-State: AFuF++m2BI34EFZaRaC3eB5+/ITpJLwN9rb5muYRragf8wSBfXLBRQE+
 crhvRu+UpM8LqRzQlWiUt2kcyfj4yXvfntBDJPQk7vlB0nb9rSvte8ve
X-Gm-Gg: AYBFou1OfkJ2rUqOUzW4AAXNkDHYS0Sl9Oyw8LxI2IfUo+cHtp3ap9Vf7gtlidHyp7U
 CDSfAyLYgbKiOhI1zwtuLaqJBLkGQ9yuMYqqmZb+hdRj/eukdvuRw9oKTpbP2WmgSyCui9UsmgG
 BH8PUNHi5HhUbLNO4enMOqJY4CAu8EE8KcHJF/i2hexf8wfjK/wRVmMZEenEm5xLG3V1tMGdXlh
 xRdcMFz0E41G/JkAPhV5mpJPqPDbzF78vqHHfrAIliCfujFCHN9ooSQGAYvkIPODPIigNlD1+qT
 p+y3jGii0/ddHTZxZmqx7tuid7+w5g1llxNeD1lGsUMJ1q97AbvjzFi55m8P7mfYvqmUqecmhPr
 AG12vgAkmutq4MmBE063MS6gXKeKqiXNMzH6osrG9gR7fqxEVuauddvSc2OWDyzWHSWaogu25Ah
 XlRjP66XkwEocROLfuFAzxeXLM/0/zJsERIgyVdWlOPXi7tCWiPJZEViBRU1u3iTMWfTs/cRZmv
 JwgwZ0uDzACYPT78ZO3je3AIoc+174=
X-Received: by 2002:a05:7301:a2d:b0:33c:e82:70c7 with SMTP id
 5a478bee46e88-34272b598d8mr2099056eec.30.1790406135670; 
 Sat, 26 Sep 2026 00:02:15 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-34145c166cfsm10615141eec.28.2026.09.26.00.02.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2026 00:02:14 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, kvm@vger.kernel.org
Subject: [PATCH v4 18/55] target/arm: use vaddr for the A64 insn_start pc
Date: Sat, 26 Sep 2026 15:00:17 +0800
Message-ID: <20260926070057.1234-19-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260926070057.1234-1-luoyonggang@gmail.com>
References: <20260926070057.1234-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::f;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy2-x0f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

aarch64_tr_insn_start records the guest pc as vaddr. Common compiles
have no per-target target_ulong for that value.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/arm/tcg/translate-a64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index a9b29583f43..50c2b491ce2 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -11115,7 +11115,7 @@ static void aarch64_tr_tb_start(DisasContextBase *db, CPUState *cpu)
 static void aarch64_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
-    target_ulong pc_arg = dc->base.pc_next;
+    vaddr pc_arg = dc->base.pc_next;
 
     if (tb_cflags(dcbase->tb) & CF_PCREL) {
         pc_arg &= ~TARGET_PAGE_MASK;
-- 
2.52.0.windows.1


