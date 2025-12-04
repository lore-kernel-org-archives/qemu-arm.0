Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26476D1F9A0
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Dec 2025 09:37:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vR5kY-0001Wc-IL; Thu, 04 Dec 2025 04:35:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1vR5k7-0001BQ-2g
 for qemu-arm@nongnu.org; Thu, 04 Dec 2025 04:35:19 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1vR5k2-0003OK-U0
 for qemu-arm@nongnu.org; Thu, 04 Dec 2025 04:35:17 -0500
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-640c1fda178so1154326a12.1
 for <qemu-arm@nongnu.org>; Thu, 04 Dec 2025 01:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764840909; x=1765445709; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GYKOAMZxGQEu+IKZWOj4QK/Xu0CKwD6MX43mJOeXe6Q=;
 b=h+b5+rxxZAK4N/oAANxPfbezh9Bjcv+EwWJYryW+GCWSWDxcjctEpGPTfSH/b44LKP
 vOJQI0n4NEOIymBa7QDMXTmmsLo1xq/6PwSDBtMj6znjrrgSLP1MdAPAQK4bwE6cVdB/
 TR7ThkGlwCHEk1SKIz3AJ5zwQ1PVBwr/jYBEpNoT+49Sk5+P1oh1Z3DoT2XNaUnY2a/F
 vwX8/PWyMvG4f0gLG2XjtzdDmJ0NvXHvY6zwgRm4oadbhRO4hMa6yp8B5sjbzl6hrn4v
 bk6DA1ftNg6xg6/2i6RpwItypfq6U6vTFLtMMHFtaMjDke9x6eMgHTOC9/d4XinEh27I
 6h6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764840909; x=1765445709;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GYKOAMZxGQEu+IKZWOj4QK/Xu0CKwD6MX43mJOeXe6Q=;
 b=Sm1edPRpNIGl1b8lXvwxszsGI2g41tFjp1NAUHgHRAJ6yuBGWX6DdP6c6tmcHacpsW
 ew8w/C+Fy7rsJwAd9Zsd1MCjHIO8WCZuB1AaRNPrOO0PxNWffcUZoqXEkAHEm56Jb4l0
 03zoCquf4LkIsFpoBucXmFIQzEzZVfjDG75I1FiodFzk0P8DXGQjp82i0SGTy+1UpGSU
 XsALzkr0zKswrJhHteKS3Fp++C7qc0QKUnuScwQ7XOsn7O1+9kbEG2V5VRm0Kh1mTZ+i
 zxcX+GpLN9dT3Mp18x5hPl5siSKuLfjwueunAf7VEPx7BwTBOmZi6edAU4tfS2sh/M5N
 yN5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYcbm3WEJRDj9Ig+RI1nwEE//A5s5AgHJtEpAZStpm5fcj1rkROuIsEtSI6mvo+eDZxK7Qj8WIQA==@nongnu.org
X-Gm-Message-State: AOJu0YzZqqsDo64dSAy5rycXi09oJd52T7DCLxtUK0uTMZW77DUQOonu
 9yCtOO9FnCF10x2ThLr0XERSjW0TyN+c+khEopOSI9R2nUkaA4xnZHeu
X-Gm-Gg: ASbGnct1Mzvph6cTw9iDsDCErXolr/awErwfiZ4KlLtIh59hrrAfdz2+xvXxz36E9W/
 BZ7FdOymOfRXG7Q1V1eswstZaM6gCu+FKaBS0vIQYtc5RzN79WiJ4r1kFluwE2ljUl1xnBZKnOj
 FcI745djywAe8vYE+PMRuA4hhdnFDiZwBZQ85scteDFgqf1y1imfCTtYlWrvUvxR5Rp+MCo8MCJ
 kX20gff/FyXH9fUzgRdv8pU2wj4jfUul3VvIcF1aRaQ9itZS6fhqjvWEfY7YmysR6vSE6sDzjlA
 Rtv7Bw6C1GAWokTWmrGkzWAsv7L00rHs/41XoPaYWOcTsb1oLydXKD+H8oWAebr9UFV7ZSHLya9
 knlTRFlPSAW5WvQxFHZGUvT4jVuR6lsUdU6uBdA6sNSPBRwJWeo3xqIQI7+ZL9/8U6JHThftUTM
 5PhAx+JcbrLEBjBlH1D4M8UItBG6Zzdts=
X-Google-Smtp-Source: AGHT+IHRWE58FcvoPJ8ZSmwaHY03rwwe2vOUSoLt2uGh886mo3Qht6opR13pKJXbn8T91+cGXeqOsw==
X-Received: by 2002:a05:6402:51c9:b0:641:8644:f87f with SMTP id
 4fb4d7f45d1cf-6479c4f7003mr4697998a12.17.1764840909049; 
 Thu, 04 Dec 2025 01:35:09 -0800 (PST)
Received: from PC-DA2D10.beckhoff.com ([195.226.174.194])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-647b2edf72asm856573a12.11.2025.12.04.01.35.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Dec 2025 01:35:08 -0800 (PST)
From: =?UTF-8?q?Corvin=20K=C3=B6hne?= <corvin.koehne@gmail.com>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Corvin=20K=C3=B6hne?= <c.koehne@beckhoff.com>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Yannick=20Vo=C3=9Fen?= <y.vossen@beckhoff.com>,
 YannickV <Y.Vossen@beckhoff.com>,
 "Edgar E. Iglesias" <edgar.iglesias@amd.com>
Subject: [PATCH v5 05/15] hw/dma/zynq: Ensure PCFG_DONE bit remains set to
 indicate PL is in user mode
Date: Thu,  4 Dec 2025 10:34:52 +0100
Message-ID: <20251204093502.50582-6-corvin.koehne@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251204093502.50582-1-corvin.koehne@gmail.com>
References: <20251204093502.50582-1-corvin.koehne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=corvin.koehne@gmail.com; helo=mail-ed1-x535.google.com
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

From: YannickV <Y.Vossen@beckhoff.com>

All register bits are clear on write by writing 1s to those bits, however
the register bits will only be cleared if the condition that sets the
interrupt flag is no longer true. Since we can assume that programming
is always done, the `PCFG_DONE` flag is always set to 1, so it will not
never be cleared.

Signed-off-by: YannickV <Y.Vossen@beckhoff.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/dma/xlnx-zynq-devcfg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/dma/xlnx-zynq-devcfg.c b/hw/dma/xlnx-zynq-devcfg.c
index 0c06daa6b9..72f7b1f170 100644
--- a/hw/dma/xlnx-zynq-devcfg.c
+++ b/hw/dma/xlnx-zynq-devcfg.c
@@ -188,6 +188,8 @@ static void r_ixr_post_write(RegisterInfo *reg, uint64_t val)
 {
     XlnxZynqDevcfg *s = XLNX_ZYNQ_DEVCFG(reg->opaque);
 
+    s->regs[R_INT_STS] |= R_INT_STS_PCFG_DONE_MASK;
+
     xlnx_zynq_devcfg_update_ixr(s);
 }
 
-- 
2.47.3


