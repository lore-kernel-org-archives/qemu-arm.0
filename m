Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4EE8CD37AC
	for <qemu-arm@archiver.kernel.org>; Mon, 11 May 2026 14:03:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wMRDL-0004LO-6O; Mon, 11 May 2026 10:02:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1wMRCN-0003xm-TT
 for qemu-arm@nongnu.org; Mon, 11 May 2026 10:01:35 -0400
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1wMRCM-00067I-0U
 for qemu-arm@nongnu.org; Mon, 11 May 2026 10:01:31 -0400
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-679f6ee3fb0so1739421eaf.2
 for <qemu-arm@nongnu.org>; Mon, 11 May 2026 07:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778508089; x=1779112889; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/WgX7SoeZhIHg97bvyLdMZe+eYz+Kg1zGjHAsHbNvCs=;
 b=UBY1MUIACPLf3pvuVtFUk4UGEOP9ba0QK030NXUuRh+WPkuFvvGpvstlnyng7TM6C8
 sAnHML0MFTgYEF6JEhRwYh5wSUZhUMoj8+naEdCv7Kw1bsTmBB0u44N2NmJxPXdU2jOq
 uWkNPzoe+4cKi88y+E3cNe0LR3MBrVCds1ZK/EYmUp4cMDDAi/8qn2X0luwp24Fi2qAl
 Wpk+mHt+cYXxoiUradYXYMrYaceOxTbec159+ONpCcr+BI48JuEXo+pJqOikY/hh/KP/
 s0CUaUeFL/xA4i2GlrMyOxVYbi91Dmu9G7AwKYYwaMUdWYN9hW9gvd9Kp3gS4y0pGIoM
 Ycxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778508089; x=1779112889;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/WgX7SoeZhIHg97bvyLdMZe+eYz+Kg1zGjHAsHbNvCs=;
 b=qSo2z0HhM1CPKiqfSN3m4papn/KYB2DB/Fxwer77SxThVThFWb+0Cbbr9qSsqN616p
 enZ2g4Ervu8Enl23Zl70CTFxOWLzVAGodYqj/1rDqA96MXkRVREUiCWUrwcJAwurqspP
 zrmPlJnWsD4p+FNQKFgzhbSNMiZauAEp7ne98goKxXbGeXVgxXwBOUBzNvuHLFuh3N7w
 aW6BAPtnI52xZMjuiK0tCHTnZ+LuYYiXO526c6uJ65b5nQhxw0H0wfLrR9nKVIHJ0nug
 IP2U5w3zFI03Q/Uuwl9zUMoTDs8Fu/NwzAUZLhxlHOdsL7XW+8BtdXC67Wn8G3MGIBEf
 qPcg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+5QyzwHxN1rrx173WSorAnHwzt7zmMWEgQcezKl+SGt/WbVroX/UfwLqbHEnc0fgkr/rzbyq51+A==@nongnu.org
X-Gm-Message-State: AOJu0Yyp0woXBzRLKQ64VbVxyjQ0B7tSE3KR0TffCEsFklQuM4ctfMgq
 bVfMvOec/wtD23V1Su54t8KjeT3bXPvvmymja7Emeox6lTmLZKjFPmI6g88h9MPf
X-Gm-Gg: Acq92OGd7n/OBILxGsr1W6B/hqxR1D+wDOdaCIhwEwrO3s4swGTf2DwuMlRpSXSyj/q
 vBU93dIZ4nQCbwcnEGUQdmqgrZhdLjYzsinhiX3kpKCj1pdTE5LtW9W6+JB1n2FFvJR6dW1/4Jy
 D4xNNuuhRLvSiVd+Y9Z3vBqA4Tg9PcfT5Cvv/8JdkUjwTYhHEskQQ/DolHgC81trnhz5Yh5na6m
 RlvkQJrANNg0mAX3xKjvFdc0g33lnCKTxHrEijC7vfhWptRWHt9SYheCgttvkU+vodWbg15uJ1b
 aSdstBd1BXvTuQXvHR581HiqLkGTOh9Mwz3NQybJ52t5fyA8zXg0d9Xb7bWB02Zb6YyDtG8UeWU
 46qFvUSt3BNqs2nQelgzlsLJmjdPfrpBpOoCiz98P2cwY9rvBFO0LkOQL5gTDu72WAlU6JHmjDf
 RZhM3a7Mgayj36DguksqIsxCIfuzwVCYuS3pqk2WbN1TxQ9RxFwsA=
X-Received: by 2002:a05:6820:1993:b0:696:22dc:b4c1 with SMTP id
 006d021491bc7-69998d1814cmr11770432eaf.29.1778508088525; 
 Mon, 11 May 2026 07:01:28 -0700 (PDT)
Received: from [192.168.1.160] ([2600:4041:54f3:a400:c013:3550:ed5f:a59a])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8bf39c7dd09sm94773756d6.31.2026.05.11.07.01.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2026 07:01:27 -0700 (PDT)
From: Gabriel Brookman <brookmangabriel@gmail.com>
Date: Mon, 11 May 2026 10:01:11 -0400
Subject: [PATCH v6 13/15] docs: add MTE4 features to docs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-feat-mte4-v6-13-8557cc1313b9@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778508062; l=2273;
 i=brookmangabriel@gmail.com; s=20251009; h=from:subject:message-id;
 bh=ztIDgqfeOPD6qpIxmbbcUcgA0mWZp1FYw4KgD7jsfWo=;
 b=HzwKC+JzmmLiKYq7qv5jMsXvxhnE9DFGxM9tEQ4DCgS+bU07tUIolSoqg9GVLPhrVzP8bDBcC
 4X7K1N24yeEDkfH01nOnDAwqrzQ4UTvHQV9eZmZnXddprxGoF9NOVA5
X-Developer-Key: i=brookmangabriel@gmail.com; a=ed25519;
 pk=m9TtPDal6WzoHNnQiHHKf8dTrv3DUCPUUTujuo8vNrw=
Received-SPF: pass client-ip=2607:f8b0:4864:20::c35;
 envelope-from=brookmangabriel@gmail.com; helo=mail-oo1-xc35.google.com
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

The implemented MTE4 features are now present in
docs/system/arm/emulation.rst

Signed-off-by: Gabriel Brookman <brookmangabriel@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/system/arm/emulation.rst | 5 +++++
 target/arm/tcg/cpu64.c        | 8 ++++++++
 2 files changed, 13 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 8cd7fe7b00..c660074ec4 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -111,6 +111,11 @@ the following architecture extensions:
 - FEAT_MTE3 (MTE Asymmetric Fault Handling)
 - FEAT_MTE_ASYM_FAULT (Memory tagging asymmetric faults)
 - FEAT_MTE_ASYNC (Asynchronous reporting of Tag Check Fault)
+- FEAT_MTE_PERM (NoTagAccess memory attribute)
+- FEAT_MTE_TAGGED_FAR (Full address reporting of Tag Check Fault)
+- FEAT_MTE_STORE_ONLY (Store-only tag checking)
+- FEAT_MTE_CANONICAL_TAGS (Canonical tag checking)
+- FEAT_MTE_NO_ADDRESS_TAGS (Address tagging disabled)
 - FEAT_NMI (Non-maskable Interrupt)
 - FEAT_NV (Nested Virtualization)
 - FEAT_NV2 (Enhanced nested virtualization support)
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 649d854a65..77b8c2a0a9 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1291,8 +1291,16 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64PFR1, CSV2_FRAC, 0); /* FEAT_CSV2_3 */
     t = FIELD_DP64(t, ID_AA64PFR1, NMI, 1);       /* FEAT_NMI */
     t = FIELD_DP64(t, ID_AA64PFR1, GCS, 1);       /* FEAT_GCS */
+    t = FIELD_DP64(t, ID_AA64PFR1,
+            MTEX, 1);   /* FEAT_MTE_NO_ADDRESS_TAGS + FEAT_MTE_CANONICAL_TAGS */
     SET_IDREG(isar, ID_AA64PFR1, t);
 
+    t = GET_IDREG(isar, ID_AA64PFR2);
+    t = FIELD_DP64(t, ID_AA64PFR2, MTEFAR, 1);    /* FEAT_MTE_TAGGED_FAR */
+    t = FIELD_DP64(t, ID_AA64PFR2, MTESTOREONLY, 1);   /* FEAT_MTE_STORE_ONLY */
+    t = FIELD_DP64(t, ID_AA64PFR2, MTEPERM, 1);    /* FEAT_MTE_PERM */
+    SET_IDREG(isar, ID_AA64PFR2, t);
+
     t = GET_IDREG(isar, ID_AA64MMFR0);
     t = FIELD_DP64(t, ID_AA64MMFR0, PARANGE, 6); /* FEAT_LPA: 52 bits */
     t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN16, 1);   /* 16k pages supported */

-- 
2.54.0


