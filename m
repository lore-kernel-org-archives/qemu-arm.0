Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E849CCFA1A
	for <qemu-arm@archiver.kernel.org>; Wed, 12 Nov 2025 00:52:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vIz52-0004OA-8q; Tue, 11 Nov 2025 19:51:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1vIz50-0004JU-11
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 19:51:22 -0500
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1vIz4y-0005o3-62
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 19:51:21 -0500
Received: by mail-qv1-xf29.google.com with SMTP id
 6a1803df08f44-8823cde292eso3295546d6.2
 for <qemu-arm@nongnu.org>; Tue, 11 Nov 2025 16:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762908679; x=1763513479; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=X7xBSB+pMgbppGGcunAU3mgJo+IlSAXE/W29CJIZftg=;
 b=Qg6v7nbuS47pswlzsi+sHQKbI70f5f9f2vxPSh2n6RDe8fD7DOTVqVo0WONPledWcC
 4D9lg/cINScAeegBhd22S1AHjGzdsUysaSCAMQ+pbt6S//pbpamFdhelrcoSgV9ljvTG
 hXpZ08T99p0HBVnMBm+Mcq5Ld2x4nRhYIQGtCK6zMlllk5OPFPkrfgRj1jfYfZp7w1Pi
 dO1mMQULDHC5Ncmj8PXNZ09NdLkDVKz2cJrHlmByH3xEECxHMxVegMZ124UwO6XTwVXg
 I390226h0mQ2UDchGuhwxkN/dKMtYbWrJPv5+if32ImKCmIHNIguWWc3jlAY9lA8R1LS
 bAVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762908679; x=1763513479;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=X7xBSB+pMgbppGGcunAU3mgJo+IlSAXE/W29CJIZftg=;
 b=cTchbbwkwacay/fXvTA3aQf5426fFPij9KypQtjl0NzRHpN+s39/zv92Du87wLbozn
 I4bK1GTTniEjEXKRVdOkIlBSqVAHZgCNmSU7Q7kUdBm8D1gh8ur4Lv2HE0IiZO4ELrDn
 yChHuKYsoAdM6MMM+HwMyExSKnDiq+xtksMW/lOcYtQ26yBfd9nel6mdTHdMf6J1zM7P
 IKqT4XSKOo9nNW8+FKE5E+oOZNj87tONcHKyPW/sYZ/1ZiouemhJx9xOUnJ8djpqMt9Z
 MJGYGR2S7Rd8wes5z3/YLOWThfbZ8C8XETzHS7oOUQMU2t7NOI0Peuigap54M4yyc/UP
 p6fg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxryEyotxxpcf3i1bdKYLfSB8y/THkOzQYqaioUrWkqAmWavsp1eu1Cwq2xJBfewf4+2W/n3kNXA==@nongnu.org
X-Gm-Message-State: AOJu0Yx/yiW1JM49EjLK4WYf3e3swD2pJAnHwYGFBCm0hOZnMZ8HT/uQ
 O+VuS2EfbcfFvmM21hegIIA0Pjvq5HgfI7Nr5KFvNAc2yWkV4pOsx6bUrt/xCs8u
X-Gm-Gg: ASbGnctQ6htnkjXvmWYXUnwi4mvwwlc3Giiet/N1ScBajQPXbZsMJw+PkDNcbueUa5d
 fd7k/4Ys9gE8T1kLg5Wo/xjKDQTifJrhwgJmKGGpuuXr5VeLhcD05DZ2oaOZYMSjndwf21XoNTa
 0Ta4cj7auYkQsJB6u+1ddhtr14bFdD3XNd6Xw4txGgomdwglRxtyT9e00BYc0OGLfeNhzd38KiQ
 V2uRP0sgTXAvqx6jIvJXNRuo81hDHRQ9vv6ffLdpshjPp3V4K2b87pZ2LD9vBRkjx/Lec/IQCR0
 XgtQVitktMFNddgojVEn5W0wWLSJMqUfVqDWtc8Q63+DnUGM5BWpTyOO7n3oJY5XheR5uPm46bB
 LRazaU4vzuIed/c6GKoZOUbJ99rh9WqxeL0cJdf5XPnsDz3o2Z98SWDFEqlg6dekX0nk5xSLFKD
 wFEoLWhnHY
X-Google-Smtp-Source: AGHT+IGyBmMScafPAT1oRAldKXh5lhhxZRTw/ZrIFENb7Bz2nho9FEF7+KJg0W8zOwkwf1aRI7f4iA==
X-Received: by 2002:a05:6214:202c:b0:882:6d42:53a7 with SMTP id
 6a1803df08f44-88271a221c7mr23581826d6.40.1762908678866; 
 Tue, 11 Nov 2025 16:51:18 -0800 (PST)
Received: from [10.0.0.22] ([185.213.193.149])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8823892a79fsm81445096d6.4.2025.11.11.16.51.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Nov 2025 16:51:18 -0800 (PST)
From: Gabriel Brookman <brookmangabriel@gmail.com>
Date: Tue, 11 Nov 2025 19:50:50 -0500
Subject: [PATCH RFC 1/5] target/arm: explicitly disable MTE4 for max
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251111-feat-mte4-v1-1-72ef5cf276f9@gmail.com>
References: <20251111-feat-mte4-v1-0-72ef5cf276f9@gmail.com>
In-Reply-To: <20251111-feat-mte4-v1-0-72ef5cf276f9@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org, 
 Gabriel Brookman <brookmangabriel@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762908676; l=1511;
 i=brookmangabriel@gmail.com; s=20251009; h=from:subject:message-id;
 bh=XGiHb/C0NusSmxgmrJIRVRwNagLzEUYEbrI5ObCYhAo=;
 b=vNVg3HOCbIitlYuqqVZb4QBG8VF9TmVXKXkJ+40F+VXQFquSYRafgBUQIg54MHCJX/jagCgqw
 w4PTpltCi64CGKLLCXTl7Kt1L6n+ds3B3fT5pIb6snpJACiN0z4ODJL
X-Developer-Key: i=brookmangabriel@gmail.com; a=ed25519;
 pk=m9TtPDal6WzoHNnQiHHKf8dTrv3DUCPUUTujuo8vNrw=
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=brookmangabriel@gmail.com; helo=mail-qv1-xf29.google.com
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

Previously, the bits used to advertise the various MTE4 features were
not explicitly set for -cpu max. This commit calls out these bits and
explicitly unsets them. At the end of the patch series, a second commit
will explicitly set all of them.

Signed-off-by: Gabriel Brookman <brookmangabriel@gmail.com>
---
 target/arm/tcg/cpu64.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 6871956382..6688b78bb8 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1281,8 +1281,16 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64PFR1, CSV2_FRAC, 0); /* FEAT_CSV2_3 */
     t = FIELD_DP64(t, ID_AA64PFR1, NMI, 1);       /* FEAT_NMI */
     t = FIELD_DP64(t, ID_AA64PFR1, GCS, 1);       /* FEAT_GCS */
+    t = FIELD_DP64(t, ID_AA64PFR1,
+            MTEX, 0);      /* FEAT_MTE_NO_ADDRESS_TAGS + FEAT_MTE_CANONICAL_TAGS */
     SET_IDREG(isar, ID_AA64PFR1, t);
 
+    t = GET_IDREG(isar, ID_AA64PFR2);
+    t = FIELD_DP64(t, ID_AA64PFR2, MTEFAR, 0);    /* FEAT_MTE_TAGGED_FAR */
+    t = FIELD_DP64(t, ID_AA64PFR2, MTESTOREONLY, 0);    /* FEAT_MTE_STORE_ONLY */
+    t = FIELD_DP64(t, ID_AA64PFR2, MTEPERM, 0);    /* FEAT_MTE_PERM */
+    SET_IDREG(isar, ID_AA64PFR2, t);
+
     t = GET_IDREG(isar, ID_AA64MMFR0);
     t = FIELD_DP64(t, ID_AA64MMFR0, PARANGE, 6); /* FEAT_LPA: 52 bits */
     t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN16, 1);   /* 16k pages supported */

-- 
2.51.2


