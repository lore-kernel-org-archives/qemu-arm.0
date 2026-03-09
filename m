Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E67FCA198
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Mar 2026 22:02:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vzier-00038P-Nx; Mon, 09 Mar 2026 18:01:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1vziek-000333-1r
 for qemu-arm@nongnu.org; Mon, 09 Mar 2026 18:00:55 -0400
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1vzieh-0004Xu-5S
 for qemu-arm@nongnu.org; Mon, 09 Mar 2026 18:00:52 -0400
Received: by mail-yx1-xb135.google.com with SMTP id
 956f58d0204a3-64c9fcc24b3so9390846d50.1
 for <qemu-arm@nongnu.org>; Mon, 09 Mar 2026 15:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773093650; x=1773698450; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=GQQEc0WUkn1kST8uqeyTH9y+WEy6NEvoOvEkjAHa9Bo=;
 b=gk5TW6RFG0HWj+5yDzH7BH5hSQyOusWqPAwL58JUIGEF3gqOstQW66MuJvqKcOqNvj
 PQFY2V0EiqIlyuO7nFVH9Zn1LNnhsRPvdxGJJv/J/v73XlY4Ft9awqcyQeuWZ5B9IDmJ
 6zTW7eIBG3UvNjmrbyug6fzEFpfV9r7lHPmtuT2gsTPSTTkykamvNZdyGok5Fp13Vmzr
 KffinaX7gNStBqYRuZWMR5tLY/PLmqFlflGIj3K5uwLeAq3dmuQxPyb6Tiuh2QDCGsJ2
 AuU1IRmz/LtZPW4VtFdowjTIw7BD52K3P/hAxH1cKWDKJlVW5+1VhuD/HZslfdgnINM0
 qzsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773093650; x=1773698450;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=GQQEc0WUkn1kST8uqeyTH9y+WEy6NEvoOvEkjAHa9Bo=;
 b=aZUPBJDh+Kh05y5Ul9a9RhQ5BvLI8h2rLIXGqvC66walsyO3UklQHkHnB4eXnIzcsz
 Zfb9523vwpvH73sKLkGL/3Z6pBREk9lgy8LkRjeBVcwSP+wqBPqKUNSP7uZxxX7kXyfK
 lINb+GepErtQcquPwc9tY+CUip3wL9nlX4IGDGBeHuGnJMuevBddY2f0QLZbgf++V3QS
 XBnCp/abhwUW1NpUJp2XykK1KZxiEeH6gxXytC5mNLhJxMaN6S7i3p/eYVoF8NbRkc6T
 UhZPomh1W2vO/F0zhR0FWH9ZYltbr0LPML0riWlYRmZz52xVrNyFs2WPDlxbt8iNbLrk
 1Mdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXU3qFd9+WKX8E/8lmGgBNpYdNm4qt/6bmm/G7lcUN3SFagyBCO3RGlJhiDVdpOkwcd/qDGILJhLA==@nongnu.org
X-Gm-Message-State: AOJu0Yzv7VNq3DY0RvneqPTBn9c4hH05vbGQ8AKi5KCgkZwIE4/lUVIZ
 p9MzDh+Yyftv+a/QbDvKlEggEnjgWOHL3pjFm5g14fGTSef7N3X/enwh
X-Gm-Gg: ATEYQzyFxNVKp3a09WrnDwMrfDjCmEKKxZEnieJgSOwDA2AEMThYe5mOFEI5KhiPRyh
 dM6t2nlqfTijjBu055K4F+OIkWAiQCjG6deHJ19VnIKB/RNWNgeK717kiMQ6H0+6f228VFGtx2g
 tV+GgibOT+qpbWVGDMxHgzpM6HB8OWbBFhGtU1NK8nqm9UpVyzCMHr3MS4yuEV3wfWksaZLAE/y
 mx33KTAUDI76RznKAT1MsU0gFH69APwaZGqLkTsZBxOiMt0GMjvloMsxcI+PdsbsZqvnoChQ/o1
 6ClyGJlos2wetRQ6caWBigOhswDXh5e+M5fOA5yw+vnc2bHy5lFDH6aNDi8OrjYuBl0rpMGBHdu
 Pq4+WmIym0XDvWgTQEXNQ+D4QBWpAEcUDB5jwNj5DgxfpFvgPbg8LQ+yv8evd+fuP0cnGMrA+Ob
 43Z+8AVJewreuAGhHC1YAvDNqtR6fcxNqjQhc=
X-Received: by 2002:a53:b44f:0:b0:64c:f871:6524 with SMTP id
 956f58d0204a3-64d14350b6cmr9031651d50.81.1773093649959; 
 Mon, 09 Mar 2026 15:00:49 -0700 (PDT)
Received: from [172.26.74.149] ([185.213.193.97])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-7990a54ba7csm5218437b3.19.2026.03.09.15.00.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2026 15:00:49 -0700 (PDT)
From: Gabriel Brookman <brookmangabriel@gmail.com>
Date: Mon, 09 Mar 2026 17:59:39 -0400
Subject: [PATCH v4 07/13] target/arm: ldg on canonical tag loads the tag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-feat-mte4-v4-7-daaf0375620d@gmail.com>
References: <20260309-feat-mte4-v4-0-daaf0375620d@gmail.com>
In-Reply-To: <20260309-feat-mte4-v4-0-daaf0375620d@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
 Gabriel Brookman <brookmangabriel@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773093641; l=2624;
 i=brookmangabriel@gmail.com; s=20251009; h=from:subject:message-id;
 bh=LIQLbnOi9t8oJGXDiTdEoadrMQhotgUGSWP3ejz82kI=;
 b=gkb8ojaplKj6LJ0PS7Fm3XshQONlr2JmX3LD2TRbny7CkKRHXA9oRapoN4qFs3sp/AromSCJ1
 OMUnpfz5i0MBiTK72zIbq+9J971/D1mAZImILhlpMCSosjYW03zbHDb
X-Developer-Key: i=brookmangabriel@gmail.com; a=ed25519;
 pk=m9TtPDal6WzoHNnQiHHKf8dTrv3DUCPUUTujuo8vNrw=
Received-SPF: pass client-ip=2607:f8b0:4864:20::b135;
 envelope-from=brookmangabriel@gmail.com; helo=mail-yx1-xb135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

According to ARM ARM, section "Memory Tagging Region Types", loading
tags from canonically tagged regions should use the canonical tags, not
allocation tags.

Signed-off-by: Gabriel Brookman <brookmangabriel@gmail.com>
---
 target/arm/tcg/mte_helper.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/target/arm/tcg/mte_helper.c b/target/arm/tcg/mte_helper.c
index b54fbd11c0..07797aecf9 100644
--- a/target/arm/tcg/mte_helper.c
+++ b/target/arm/tcg/mte_helper.c
@@ -313,6 +313,11 @@ uint64_t HELPER(ldg)(CPUARMState *env, uint64_t ptr, uint64_t xt)
     /* Load if page supports tags. */
     if (mem) {
         rtag = load_tag1(ptr, mem);
+    } else {
+        uint64_t bit55 = extract64(ptr, 55, 1);
+        if (canonical_tagging_enabled(env, bit55)) {
+            rtag = 0xF * bit55;
+        }
     }
 
     return address_with_allocation_tag(xt, rtag);
@@ -463,8 +468,10 @@ uint64_t HELPER(ldgm)(CPUARMState *env, uint64_t ptr)
     void *tag_mem;
     uint64_t ret;
     int shift;
+    bool bit55;
 
     ptr = QEMU_ALIGN_DOWN(ptr, gm_bs_bytes);
+    bit55 = extract64(ptr, 55, 1);
 
     /* Trap if accessing an invalid page.  */
     tag_mem = allocation_tag_mem(env, mmu_idx, ptr, MMU_DATA_LOAD,
@@ -472,6 +479,34 @@ uint64_t HELPER(ldgm)(CPUARMState *env, uint64_t ptr)
 
     /* The tag is squashed to zero if the page does not support tags.  */
     if (!tag_mem) {
+        /* Load canonical value if mtx is set (untagged memory region) */
+        if (canonical_tagging_enabled(env, bit55)) {
+            switch (gm_bs) {
+            case 3:
+                /* 32 bytes -> 2 tags -> 8 result bits */
+                ret = -(uint8_t)bit55;
+                break;
+            case 4:
+                /* 64 bytes -> 4 tags -> 16 result bits */
+                ret = -(uint16_t)bit55;
+                break;
+            case 5:
+                /* 128 bytes -> 8 tags -> 32 result bits */
+                ret = -(uint32_t)bit55;
+                break;
+            case 6:
+                /* 256 bytes -> 16 tags -> 64 result bits */
+                return -(uint64_t)bit55;
+            default:
+                /*
+                 * CPU configured with unsupported/invalid gm blocksize.
+                 * This is detected early in arm_cpu_realizefn.
+                 */
+                g_assert_not_reached();
+            }
+            shift = extract64(ptr, LOG2_TAG_GRANULE, 4) * 4;
+            return ret << shift;
+        }
         return 0;
     }
 

-- 
2.52.0


