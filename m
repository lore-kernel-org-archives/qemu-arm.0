Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E77CFD317
	for <qemu-arm@archiver.kernel.org>; Mon, 24 Nov 2025 12:38:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vNVpS-0001TS-OH; Mon, 24 Nov 2025 07:38:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daan.j.demeyer@gmail.com>)
 id 1vNVnT-0004Zl-3c
 for qemu-arm@nongnu.org; Mon, 24 Nov 2025 07:36:00 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <daan.j.demeyer@gmail.com>)
 id 1vNVnO-0007JL-VQ
 for qemu-arm@nongnu.org; Mon, 24 Nov 2025 07:35:58 -0500
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-42b38693c4dso1892881f8f.3
 for <qemu-arm@nongnu.org>; Mon, 24 Nov 2025 04:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763987739; x=1764592539; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3+qEsQEA/CfckaiigN0jZROnstk9a/IX7Pb4PVkmi6U=;
 b=NwqYaveuiTxDdJVVeTmW4qn43q9BnXmTlrMEnETnXyk4G95nS1af2TSsHZb8RJJO6i
 +7ymlExH8GiV8RcaIdmrSufjxViOLp3poalt3Cfx1ggJPf4AQL9LnSHxfRHQ0Fv4HS/f
 topFdA/Pc81vn2Ajk87wGxnOYAAaLmrrzrn03jcEoB0LejfR8WTkygP5f/o74mIbnMlQ
 VeDZ97gT5Gpl7SHi64tQLahT3TpeC6pxs2+pv/9nBHlTZYsH61Vge6PlzJfEU1GOijqX
 GKptkVtfD8juaq/uYhwXYEaW6cFmiA/P9U96s3iDGnXcCcZL++aFu/PqYbSVWqEFW28n
 z6Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763987739; x=1764592539;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3+qEsQEA/CfckaiigN0jZROnstk9a/IX7Pb4PVkmi6U=;
 b=E8/bUXvgB86IJ3KuAL7sM0Yn5On55CGbYgv4FAur+qkBf478jDnwh464gXag3QLxjW
 U5mU99KmQRW2gn5Rl+T1V21fo4dpognsRNiIQgNQNYX5QU93HEcuPw7aLJvrRkbKjvZF
 5LCwHdk1c1yHjATSseV/GLfPb6iUDDZMo9P7cj3Y4Cul9cfMH9JVIjelXUkAcGE0Hq5I
 feWobkvMFbLceDNxSouM3u2SPji6IKb2fB9ZtPzyudwtQy3uTT3jB0qh6nK67ZZu2Jpb
 Kn/WyuBa6/z00590/QP6PPeFgg4ybLyQbdnk3FtSV0WkJkChLOjZ9kQMqNxl//FbFV0E
 W3WA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDwH9flYFKa1rYU619qU26UrEzgZHlH5K8EDG/h7ECxu2aZyPibzJ+ecHGPdVPHBSH9kzE/PyXRQ==@nongnu.org
X-Gm-Message-State: AOJu0YyT474lMKG2N6GG7kHEUDLWg53h+kGpJIGGb/Yyyzm+0yzCI66l
 DkfVJulLdjg2KwPrwZ+9L6jb04WIgmNA4We3nG7OvyFMlzzgQTyzrEgE
X-Gm-Gg: ASbGnctVGa/DopPv827etfURMy+I+cszGTIyIZNGS58+z/eej3TaY0jsO7OVBoelFUd
 iKVVUEpScbWrQe+DLD6c4PV7aYf7bLNv6q8traMstHpnAQCxdrN4azIOQfEcMNIJjZJltYEM9+M
 XsMrwMlPMn0FS+AV9pIIi6OTOkYmBTZYN99K+suJLwIIssAQWB8crikVqnZr9OO0XR59q7pO9H5
 K04xJYdW1IOdkfaALmkqDDiavM8cvLvF8RSk5IKEpltBPw+Y1j4TpHkv5Hqde4yFcrk/3Zzb2y8
 pipNr9ZZwVq9YJPj5/jvaJuiibyf8lh0rv0SbFaVn02piBifZyZXjUbhWtxj3Eu13QygN+dbZfl
 Tycpujj/peyRmMG5N5F+4TbUTPn4X6a/Y+mBeBzHH3obaMjSJdYP1E9zFqLqVjP0ifQyhU7KbDd
 o88/8NhtFiQNYBmm8oV/BauGAZaS7CVS2Nh85mFTn5pSr8L9jdHu0SeLLzWDOd2Jl29A==
X-Google-Smtp-Source: AGHT+IHZiwZyu+s6uxta//QkEHCbQyEDPEiNPl/7vZStApz9Y6NpEqWa/4eA6g5aQSpWe9AMVj9frg==
X-Received: by 2002:a5d:5c84:0:b0:42b:3ab7:b8a4 with SMTP id
 ffacd0b85a97d-42cc1d0e42cmr12599618f8f.33.1763987738993; 
 Mon, 24 Nov 2025 04:35:38 -0800 (PST)
Received: from daandemeyer-fedora-PC1EV17T (d54C349CA.access.telenet.be.
 [84.195.73.202]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fd8c47sm29398449f8f.38.2025.11.24.04.35.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Nov 2025 04:35:38 -0800 (PST)
From: Daan De Meyer <daan.j.demeyer@gmail.com>
To: qemu-devel@nongnu.org
Cc: Aleksandar Rikalo <arikalo@gmail.com>, Paul Burton <paulburton@kernel.org>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Daan De Meyer <daan.j.demeyer@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v4 3/4] Use g_autofree in unpack_efi_zboot_image()
Date: Mon, 24 Nov 2025 13:35:20 +0100
Message-ID: <20251124123521.1058183-4-daan.j.demeyer@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251124123521.1058183-1-daan.j.demeyer@gmail.com>
References: <20251124123521.1058183-1-daan.j.demeyer@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=daan.j.demeyer@gmail.com; helo=mail-wr1-x42e.google.com
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

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Daan De Meyer <daan.j.demeyer@gmail.com>
---
 hw/core/loader.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/core/loader.c b/hw/core/loader.c
index 090af59df2..d74e33ceb6 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -882,7 +882,7 @@ struct linux_efi_zboot_header {
 ssize_t unpack_efi_zboot_image(uint8_t **buffer, ssize_t *size)
 {
     const struct linux_efi_zboot_header *header;
-    uint8_t *data = NULL;
+    g_autofree uint8_t *data = NULL;
     ssize_t ploff, plsize;
     ssize_t bytes;
     size_t max_bytes = LOAD_IMAGE_MAX_DECOMPRESSED_BYTES;
@@ -921,12 +921,11 @@ ssize_t unpack_efi_zboot_image(uint8_t **buffer, ssize_t *size)
     bytes = gunzip(data, max_bytes, *buffer + ploff, plsize);
     if (bytes < 0) {
         fprintf(stderr, "failed to decompress EFI zboot image\n");
-        g_free(data);
         return -1;
     }
 
     g_free(*buffer);
-    *buffer = g_realloc(data, bytes);
+    *buffer = g_realloc(g_steal_pointer(&data), bytes);
     *size = bytes;
     return bytes;
 }
-- 
2.51.1


