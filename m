Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E35CD4F54
	for <qemu-arm@archiver.kernel.org>; Fri, 29 May 2026 19:54:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wT3Gk-0005Sr-Ox; Fri, 29 May 2026 15:53:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1wT3GW-00050H-OO
 for qemu-arm@nongnu.org; Fri, 29 May 2026 15:53:11 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1wT3GU-0005Z5-MS
 for qemu-arm@nongnu.org; Fri, 29 May 2026 15:53:08 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-7dcdaf06498so9242302a34.2
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 12:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780084385; x=1780689185; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=OtXXBqtV0wD8jsrwvKz8f2moqJX8dr6sPSmah2qwSio=;
 b=fjlFOSnWI4fzVT74nQIHJFm/wVtOrcxv9BHflpLKgRvqlPOR5xUbsjM75f+tJhNaOk
 8lN0rwCzL7PmCrtEprp2/RFS+YpB2PvKB15WrCddcDbOKzlPBDTVYuG2WxXCgOQuHRc2
 yOkHrT3KHqcBgKeEEsYIAyqXIVKam0USvy2P1sQHqCV6pL/ZE7SFJvJCTrHn3g7t4Wqy
 /H4FXBjRt277lCxdowvKq28/aherlhfML/7JpBO8skBEnUP39YO0dQsT3zct0VSTsz2v
 gWhgmVC+OzILN7ZJyue4N6TvqU/P7R/oE7TnUKNhMBvh3VI5tTy5Rx8cXvwJN1kixkTA
 2bDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780084385; x=1780689185;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=OtXXBqtV0wD8jsrwvKz8f2moqJX8dr6sPSmah2qwSio=;
 b=hfWp05KdkhHhh1lGRMeLqwOTv54amSnd+uW6dfLv+tqsB+wFkK113tSItgjp8o/RUc
 SlfUQxddFgkiMkj7NQ4LnFlPjlQFugM4rS44Vvaek3zTKkPTaXul7ekZH0JFHblfe/rG
 Y5X3LffNAwB893F92Kaw13CHN9hJ7FsSTrk2PIsu2rYaQRHV/m3bb8Zg2A5f5Gm0lhpU
 OzZRGf3ovy3Zr6I7lYbtwCi7bP8tSgtMwcyM5XimFWOLVlh0pL90IOhbmO6Y33nBkXpG
 KMBQ/q6ay9wGPZvLm8FuoCbFz1Cdw1t9HUo55Wsv4Gii6w9lh41UCnjf9v5jRzalLGYZ
 x7Rg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/P0G9xaM0DWT8UtnVEqy1kEJqHhFLFsfh+mtRWn2h1vyqhxaPYewzmSYa2qR89j0UAn3rXAk1P3w==@nongnu.org
X-Gm-Message-State: AOJu0YwI9om7F+tDbtEydGbU5ONvtV5HGztolPp+BrewFnTNn1Z5Svb6
 mlVjtLYjoxTKn+WbDRt7jDGFAxfupoIvrI23NC/85vGeVRHapkj/oU6H
X-Gm-Gg: Acq92OFMOr6W3DjfUYwwXefsI/VpFnrUA1z1U7DCRE02nNLqxkPuWLZd1aTJRoDVgTD
 p88bGqBp1mSbCepYCjaGqrrUQdt9e88q1mWsTy5aLpF7n28Ve09fieABrvUniyRKnxgVXtDvIQt
 jDiq4pnpn8wBp/zq2hLFqPuLSQtk7RaqhY4efObfMG+eKX95obtExpto60Ng5DgXCfR66t99CHY
 JR7rq45aLqK+wzlytlF9kpRM+CiIdvJy9OArIz0lrLhrrOkBuCuL6MEBibEGBfKtEbVy6Q4Qwa2
 qEPgj5AyWMUcAK0hTz//2Hhi8kkT9i8PwvNTpNiJ8+ObTSNQLek9dSGm479J+iUXzbhkiJOuZoX
 BfJKP3Ik/ftJlBdeVT+QmmFx5VYD3DJmyv2azygFir34DugLb4oe1zSSvm3w3wL4qSAPD+bzun3
 lbpXDlEyHVoIGOWNf1e0P7EZ4RPeierAWsYDiGj2Mr/dc=
X-Received: by 2002:a05:6820:4c15:b0:696:8e8b:20be with SMTP id
 006d021491bc7-69e104765b1mr374420eaf.10.1780084385346; 
 Fri, 29 May 2026 12:53:05 -0700 (PDT)
Received: from [10.21.163.79] ([146.74.94.63])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-69e06587eecsm1626692eaf.0.2026.05.29.12.53.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 12:53:04 -0700 (PDT)
From: Gabriel Brookman <brookmangabriel@gmail.com>
Date: Fri, 29 May 2026 12:52:47 -0700
Subject: [PATCH v7 07/15] target/arm: add canonical tag check helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-feat-mte4-v7-7-ccbd3c14eb3c@gmail.com>
References: <20260529-feat-mte4-v7-0-ccbd3c14eb3c@gmail.com>
In-Reply-To: <20260529-feat-mte4-v7-0-ccbd3c14eb3c@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>, 
 Gabriel Brookman <brookmangabriel@gmail.com>, Helge Deller <deller@gmx.de>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780084373; l=1412;
 i=brookmangabriel@gmail.com; s=20251009; h=from:subject:message-id;
 bh=KZ5rd07qFUR2EFmgoE/ETK1HSHcIEDQXk34Kau6YNWs=;
 b=f139zGDKOrYh1AzD72WKsirz4Jmj3aOidiN/JeFQkieiGXDKo/F+L26XdNzYdoBGOJ4VG69+i
 GxL61DdUx0pD8zB5lHmK3tMszRDDj9Z1I/NjLJlC5dbTqFqfreZFIdk
X-Developer-Key: i=brookmangabriel@gmail.com; a=ed25519;
 pk=m9TtPDal6WzoHNnQiHHKf8dTrv3DUCPUUTujuo8vNrw=
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=brookmangabriel@gmail.com; helo=mail-ot1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Add a helper that checks whether mtx is active from MTEDESC. Refactored
an existing function to use it.

Signed-off-by: Gabriel Brookman <brookmangabriel@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 2abef67e03..92941a3ac6 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1655,6 +1655,12 @@ static inline bool tbi_or_mtx_check(uint32_t desc, int bit55)
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
@@ -1662,7 +1668,7 @@ static inline bool tcma_check(uint32_t desc, int bit55, int ptr_tag)
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


