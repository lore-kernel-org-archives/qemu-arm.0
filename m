Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20EFDCD37AC
	for <qemu-arm@archiver.kernel.org>; Mon, 11 May 2026 14:05:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wMRE6-0005f1-6n; Mon, 11 May 2026 10:03:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1wMRDs-0005J2-4n
 for qemu-arm@nongnu.org; Mon, 11 May 2026 10:03:04 -0400
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1wMRDp-0006WS-0m
 for qemu-arm@nongnu.org; Mon, 11 May 2026 10:03:02 -0400
Received: by mail-oo1-xc2b.google.com with SMTP id
 006d021491bc7-6967080e6beso1322798eaf.2
 for <qemu-arm@nongnu.org>; Mon, 11 May 2026 07:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778508179; x=1779112979; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QSmDQRrB6e1D8na4i2hbR1VmlezIVrTYO+OHtxE4XeY=;
 b=TPPygsf5EzsQjBHBXjNKVCqJziHkjg1jhNikpkz+Ee1F8PPxmf6PgbCdp1DDjq3u+M
 dmD2sBu3BcTH5f8avmdCm1jmwrmbyJdZEXyJQv+EG/nc4u8TYohvhXRunTScquGIOjp0
 7hmB77oS7Haz6MW6+0wlvrxzpJD+Ze/+IKGHjdgb7Sv+yM90471uNpS9S0gaDB6JVV2j
 4PbokPtOy09/ShslvhR5hmZWm6y35qQ1yhM/HqNDTeKqxlCuu7Pa4xBuhnFe72wICgV2
 /Chli/CHbqEb0I80M7H6q2M+JTY9194WWp48YLqFNkVaHbrS4z4GZQtPnSeT32nB+Z/u
 kATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778508179; x=1779112979;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=QSmDQRrB6e1D8na4i2hbR1VmlezIVrTYO+OHtxE4XeY=;
 b=RyZQzle1bnhbzMTgDO6JOMGnZ8cRaKzsUqJJ4H1PNSqRJdS7IQFWTlxBkTgklOpeTT
 3hlE2prS8ZrzRJ4udBhihsiQULn03CIdqoCuJ/Ih83K0BLnp/IGXDoIWdRrn8BIl8a6c
 h53PUZYIYhCRPYvschJRYqY6tnUypreK9ko1u0oTTguHqeUXoYI4bz4aKZwPxu5UmRTh
 XArOfNYt3181CtETFSvKPaYN3U92U31rFjQ2Ktte8331XQZdoTbQxg92jGD4mxfxyIzl
 6zQW+iY3QELBh8WqoFXUB9Gg4QCsUuxBj52KrIiCL3yH9RanN5p+yS0jGun+qpXK8V3F
 UOjg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/9tWvFqNSuUf2qZ9NfZJopF3HL+mYV+XXEDnD6pbAktB8vDDUo5ZqFr931MXO+QBmpPn8fqvx3kA==@nongnu.org
X-Gm-Message-State: AOJu0Yw7SRbyer3bT4nXs6jOk47wV3D4Ol1rR7hfh0+RmY16GZQrsLXf
 K4uqbUosu7lSXjicmuBkcNJiBoxDsGfwL/hqRYzIQyRldR7C+Npj2g8rlUJOGG+T
X-Gm-Gg: Acq92OH/yNvUUoCUNxv9zQYUV0h+zHN91H6M3ONucCz5MY4YInli0QFca4JtyHtnu8f
 5jAZf7SpTJxQ/07aYrsnxL2f83GxoQx79o7hUbbjvvYFggVQwVd74+LphlPAte7cXVf/hAzNJ+w
 xpdFJ0bMWcSALJD1YurWksNVZbRKpYS7uC/qr1kmFO48+pEg7jmL+1hZC2295x4ltPRSs07FxLA
 R6EDFikCeLMAoWl19M5h7FkCpGzUwBNpIjX4k+7tg82amP7Fdpn0UeTTbktu7MtLrt/wF73FWgS
 zbCXvoZhGV7+v8vTL4Gv8KuEKV/t4v4cNjQHLUqy6rj2Z65hp8Q+mrF86vRFn0Rc6RuDUhMh7qI
 P73yFe2lpzI9SH9u0yHbz7FRe63jZy8K85WPMNDQfWhydPqikVWpCR60MTD8AR44kQHbMz3Jnaz
 cNzRNN9DhS2S25kgNMNF1GV8cv5qRJsLmL87ZERGTwbGFLpszL3qc=
X-Received: by 2002:a05:6214:1c4c:b0:8bd:de6d:c349 with SMTP id
 6a1803df08f44-8c1a461dd4dmr154548546d6.30.1778508076311; 
 Mon, 11 May 2026 07:01:16 -0700 (PDT)
Received: from [192.168.1.160] ([2600:4041:54f3:a400:c013:3550:ed5f:a59a])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8bf39c7dd09sm94773756d6.31.2026.05.11.07.01.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2026 07:01:15 -0700 (PDT)
From: Gabriel Brookman <brookmangabriel@gmail.com>
Date: Mon, 11 May 2026 10:01:05 -0400
Subject: [PATCH v6 07/15] target/arm: add canonical tag check helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-feat-mte4-v6-7-8557cc1313b9@gmail.com>
References: <20260511-feat-mte4-v6-0-8557cc1313b9@gmail.com>
In-Reply-To: <20260511-feat-mte4-v6-0-8557cc1313b9@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>, 
 Gabriel Brookman <brookmangabriel@gmail.com>, Helge Deller <deller@gmx.de>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778508062; l=1412;
 i=brookmangabriel@gmail.com; s=20251009; h=from:subject:message-id;
 bh=kFLv9CCcyzQ9X4nylsyRnwd9Y7Ab46WH0h0K69LE1Qg=;
 b=p298eyZYu8co5o2bs9nJ5yeIrlqOm4daIqSYwX7p56E6h96q7q+ikYqDei2aprQGnZLQEiilh
 vQNBpSqJC8vD0mw9si2x58vTkCieWEwqLVOsA+zXfz+wjRbZV7s2/2z
X-Developer-Key: i=brookmangabriel@gmail.com; a=ed25519;
 pk=m9TtPDal6WzoHNnQiHHKf8dTrv3DUCPUUTujuo8vNrw=
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2b;
 envelope-from=brookmangabriel@gmail.com; helo=mail-oo1-xc2b.google.com
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

Add a helper that checks whether mtx is active from MTEDESC. Refactored
an existing function to use it.

Signed-off-by: Gabriel Brookman <brookmangabriel@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 6df2c547c5..192e6a2d47 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1636,6 +1636,12 @@ static inline bool tbi_or_mtx_check(uint32_t desc, int bit55)
     return desc & (mask << bit55);
 }
 
+/* Return whether or not the second nibble of a VA matches bit 55.  */
+static inline bool tag_is_canonical(int ptr_tag, int bit55)
+{
+    return ((ptr_tag + bit55) & 0xf) == 0;
+}
+
 /* Return true if tcma bits mean that the access is unchecked.  */
 static inline bool tcma_check(uint32_t desc, int bit55, int ptr_tag)
 {
@@ -1643,7 +1649,7 @@ static inline bool tcma_check(uint32_t desc, int bit55, int ptr_tag)
      * We had extracted bit55 and ptr_tag for other reasons, so fold
      * (ptr<59:55> == 00000 || ptr<59:55> == 11111) into a single test.
      */
-    bool match = ((ptr_tag + bit55) & 0xf) == 0;
+    bool match = tag_is_canonical(ptr_tag, bit55);
     bool tcma = (desc >> (R_MTEDESC_TCMA_SHIFT + bit55)) & 1;
     return tcma && match;
 }

-- 
2.54.0


