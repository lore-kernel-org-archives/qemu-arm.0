Received: by 2002:a17:906:80c9:b0:9a1:ac8c:26bb with SMTP id a9csp691111ejx;
        Tue, 22 Aug 2023 05:42:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGG/rjD6cxdIhfIFVi7fFItLWN1jK+/UDI+CZvNwg4l387lv7ic78MgzHeBNdBky0Mwr9zZ
X-Received: by 2002:a05:6358:3389:b0:139:c390:f1f1 with SMTP id i9-20020a056358338900b00139c390f1f1mr7172071rwd.23.1692708127754;
        Tue, 22 Aug 2023 05:42:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692708127; cv=none;
        d=google.com; s=arc-20160816;
        b=piHk5RjKeXss9zvPRreZ+lMrASagu/slK1lHz8le9X1ZtQNpqSqUhAoWjv6Qh+T9Uz
         WHuYstSO0SRBpsOa1yQOMo3XV6ekDjcnyA+lNSmh7R8Y/96G85ShCTvQUUnNZGoO5XeV
         vMs4WbDCPgd75Cl9I2eCqetUy98J2ba5ARHMaPYgOY5zrlUnzRHU3oTE/Etv86aNvgsu
         O4uFGqO7jIYYW/zKioOBzhvOsu8I0H1Lv7HZBl2nYfj+8SaL0Fch1nD682wS/spLBO85
         8QUOQekjMy8xGj+VtMU82G5kOw4MgRW0cY4lIyaWdFldH8TEkWo9jDxlCkovsgIdUHn8
         tNvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=FMJ1pPQagpK0TSh9v/NKR2oLVoAprcpSVFmmxK4Cqak=;
        fh=wXqw6aajGBSP4OKAgbWKHj3BSg7Yrdz+j0I8chPJZNc=;
        b=iTxGrtdfbtu/BQBGG163cZ9/ikQLyAX+oOf6NQXYrZDIVXakSARhveWyD98tzJsy/I
         xog4uBqVfWlSQ3HCe8IMrLurQwNxaqZ9UZgtmrPUYS8nooELNFmOWuJwT8JxxULJQOQq
         6HKyOwjt4SOjKUwerwEZDB6smlF08EeoGo4nUuZIMrNnk9uvr5HI+c1bibajeM6/GHoL
         +eaQC8kIwM3ERstJ0S+KR1Keej4ap+vklysaGOnpy+QcCpyfLdm6c5AknDoMRtukscMa
         wO3XZzXM7p6NiOJtMFe8ew5rpMTGEieXp8M2K+Ne4isjQpDQ0ZU1mnpin9jkbdzOX8BF
         hnPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rymdns0D;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v5-20020a05622a014500b0040dfc5b0801si6381567qtw.455.2023.08.22.05.42.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Aug 2023 05:42:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rymdns0D;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qYQh1-0006IX-5d; Tue, 22 Aug 2023 08:41:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qYQgy-0006HS-LS
 for qemu-devel@nongnu.org; Tue, 22 Aug 2023 08:41:04 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qYQgt-0005VK-Fz
 for qemu-devel@nongnu.org; Tue, 22 Aug 2023 08:41:04 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3fee7b7689dso26913315e9.0
 for <qemu-devel@nongnu.org>; Tue, 22 Aug 2023 05:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692708056; x=1693312856;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FMJ1pPQagpK0TSh9v/NKR2oLVoAprcpSVFmmxK4Cqak=;
 b=Rymdns0DyULq3a5x+1rnkoVEIO4KYyWViPo3DyxG2w8P3R+vgb62qkAuzmFVfqn5lI
 +zP1pWohkqrMNQNtfzRF+LcfzLtUuSzC0GezfLHpEoKJHjGRVwvxbOVotPndB7eH/Sds
 IhqJTmBJYfI46QLJQoVtYMv6libNJjgjgrpVi+0Ohvf4hbzJuVsEs31BtMEtY0qDfYFj
 waHGCEnarHZ9X2ff0VWfc9UGqbP+I6pTFQs8yZI7B8odcyX9ABto9Af8d4tZhCkaDzLQ
 UVON3hmRueU2WBRibRP0g2IzS9stF4HF0sd5DC0mJ6QBwcZ9kk6UVedzPzHgjKHenv7d
 PklQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692708056; x=1693312856;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FMJ1pPQagpK0TSh9v/NKR2oLVoAprcpSVFmmxK4Cqak=;
 b=cRaoBvJbERzifVOXefquQfz+gD2PGTNp6/giDQu7nCJ0d11hxl9RyCWVyDv1+MUb0B
 ONsCjPgenVucAunpN8AeUlk1sNX/2afwpqZ1FTbEyTbbYVLvKBBA76ky4YEci4E2u01U
 pYfJmi96xz/3uZNukGClZuMBkwap0Kluhubmvz/IWSDOQb6WZ0fIK9FnEktv8b8vPyaU
 csLCgki7I27X1MrHDq3ZtzkdhNaFkXn4Z1vZYAv3oyL8ZZ12c0wDSOxHkgMGAHQEWuYm
 r67biSQVXvE2+WxXxV9qDKfWCpS+yKvWLd2qdw7GgDEDyhXcOFVMMGaNFRVKi0OTdep/
 tr8g==
X-Gm-Message-State: AOJu0YwKiVpIhnHAVD1IPBhCCUwvWYCJ+HJTW97mzruH+PduLvBKiQ5f
 Z+ogg4/de711Ghv5fGYnycUUhI3fxix7rFRHzPlIjA==
X-Received: by 2002:a05:600c:255:b0:3fe:d57e:d933 with SMTP id
 21-20020a05600c025500b003fed57ed933mr7346330wmj.15.1692708055863; 
 Tue, 22 Aug 2023 05:40:55 -0700 (PDT)
Received: from localhost.localdomain ([37.19.214.4])
 by smtp.gmail.com with ESMTPSA id
 u1-20020a7bcb01000000b003fefcbe7fa8sm936392wmj.28.2023.08.22.05.40.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 22 Aug 2023 05:40:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Song Gao <gaosong@loongson.cn>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Greg Kurz <groug@kaod.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Nicholas Piggin <npiggin@gmail.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-arm@nongnu.org
Subject: [PATCH 01/12] tcg/tcg-op: Factor tcg_gen_hrev32_i32() out
Date: Tue, 22 Aug 2023 14:40:31 +0200
Message-ID: <20230822124042.54739-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822124042.54739-1-philmd@linaro.org>
References: <20230822124042.54739-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: CRG9y5Hbxzx/

Byteswapping each halfword is a common operation, so
extract to a new tcg_gen_hrev32_i32() generic helper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 docs/devel/tcg-ops.rst      |  4 ++++
 include/tcg/tcg-op-common.h |  1 +
 tcg/tcg-op.c                | 29 +++++++++++++++++++++++------
 3 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/docs/devel/tcg-ops.rst b/docs/devel/tcg-ops.rst
index 7ea6aba502..17965faa03 100644
--- a/docs/devel/tcg-ops.rst
+++ b/docs/devel/tcg-ops.rst
@@ -490,6 +490,10 @@ Misc
          into 32-bit output *t0*.  Depending on the host, this may be a simple shift,
          or may require additional canonicalization.
 
+   * - hrev32_i32 *t0*, *t1*
+
+     - | Byteswap each halfword within a 32-bit value.
+
    * - hswap_i32/i64 *t0*, *t1*
 
      - | Swap 16-bit halfwords within a 32/64-bit value.
diff --git a/include/tcg/tcg-op-common.h b/include/tcg/tcg-op-common.h
index be382bbf77..bb515dfd51 100644
--- a/include/tcg/tcg-op-common.h
+++ b/include/tcg/tcg-op-common.h
@@ -360,6 +360,7 @@ void tcg_gen_ext16u_i32(TCGv_i32 ret, TCGv_i32 arg);
 void tcg_gen_bswap16_i32(TCGv_i32 ret, TCGv_i32 arg, int flags);
 void tcg_gen_bswap32_i32(TCGv_i32 ret, TCGv_i32 arg);
 void tcg_gen_hswap_i32(TCGv_i32 ret, TCGv_i32 arg);
+void tcg_gen_hrev32_i32(TCGv_i32 ret, TCGv_i32 arg);
 void tcg_gen_smin_i32(TCGv_i32, TCGv_i32 arg1, TCGv_i32 arg2);
 void tcg_gen_smax_i32(TCGv_i32, TCGv_i32 arg1, TCGv_i32 arg2);
 void tcg_gen_umin_i32(TCGv_i32, TCGv_i32 arg1, TCGv_i32 arg2);
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index c436c5e263..b1b5d9b45b 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -1073,14 +1073,9 @@ void tcg_gen_bswap32_i32(TCGv_i32 ret, TCGv_i32 arg)
     } else {
         TCGv_i32 t0 = tcg_temp_ebb_new_i32();
         TCGv_i32 t1 = tcg_temp_ebb_new_i32();
-        TCGv_i32 t2 = tcg_constant_i32(0x00ff00ff);
 
                                         /* arg = abcd */
-        tcg_gen_shri_i32(t0, arg, 8);   /*  t0 = .abc */
-        tcg_gen_and_i32(t1, arg, t2);   /*  t1 = .b.d */
-        tcg_gen_and_i32(t0, t0, t2);    /*  t0 = .a.c */
-        tcg_gen_shli_i32(t1, t1, 8);    /*  t1 = b.d. */
-        tcg_gen_or_i32(ret, t0, t1);    /* ret = badc */
+        tcg_gen_hrev32_i32(ret, arg);   /* ret = badc */
 
         tcg_gen_shri_i32(t0, ret, 16);  /*  t0 = ..ba */
         tcg_gen_shli_i32(t1, ret, 16);  /*  t1 = dc.. */
@@ -1102,6 +1097,28 @@ void tcg_gen_hswap_i32(TCGv_i32 ret, TCGv_i32 arg)
     tcg_gen_rotli_i32(ret, arg, 16);
 }
 
+/*
+ * hswap_i32: Byteswap each halfword within a 32-bit value.
+ *
+ * Byte pattern:  hswap_i32(abcd) -> badc
+ */
+void tcg_gen_hrev32_i32(TCGv_i32 ret, TCGv_i32 arg)
+{
+    TCGv_i32 mask = tcg_constant_i32(0x00ff00ff);
+    TCGv_i32 t0 = tcg_temp_ebb_new_i32();
+    TCGv_i32 t1 = tcg_temp_ebb_new_i32();
+
+                                        /* arg = abcd */
+    tcg_gen_shri_i32(t0, arg, 8);       /*  t0 = .abc */
+    tcg_gen_and_i32(t1, arg, mask);     /*  t1 = .b.d */
+    tcg_gen_and_i32(t0, t0, mask);      /*  t0 = .a.c */
+    tcg_gen_shli_i32(t1, t1, 8);        /*  t1 = b.d. */
+    tcg_gen_or_i32(ret, t0, t1);        /* ret = badc */
+
+    tcg_temp_free_i32(t0);
+    tcg_temp_free_i32(t1);
+}
+
 void tcg_gen_smin_i32(TCGv_i32 ret, TCGv_i32 a, TCGv_i32 b)
 {
     tcg_gen_movcond_i32(TCG_COND_LT, ret, a, b, a, b);
-- 
2.41.0

