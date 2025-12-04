Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61EF6D1D89E
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Dec 2025 09:37:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vR5kR-0001O2-5e; Thu, 04 Dec 2025 04:35:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1vR5k3-0001A2-Ey
 for qemu-arm@nongnu.org; Thu, 04 Dec 2025 04:35:16 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1vR5k1-0003Nw-2H
 for qemu-arm@nongnu.org; Thu, 04 Dec 2025 04:35:15 -0500
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-64320b9bb4bso1447851a12.0
 for <qemu-arm@nongnu.org>; Thu, 04 Dec 2025 01:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764840908; x=1765445708; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7b25Fv33Xq/PZxsyLv+FhSwrtyaBUSUZvYVfFNhl+n0=;
 b=hP41a3BCOtLWdNUUIAksi8xnHw3KR4KvKCBsxwqHxbrdFl1PQUK2YE8qtkQi0Toieo
 B/UpivEQoXwDSYhQVfOGEZK6gdwRCxwkxe6XiRdjYtIpv8iGijqzhANe2VSgVKu94Zg2
 +nUsIkYmBjrTC65Aw5P6ynnp8yu39IC2uHJCWO3z+z37QAgmAiEmCFCgMDHrmt+kkT7T
 68JnjMTOgJtbcS9TwHP6jl/F7KoQ50TeYr6pI0DKom9gXy52aKfC9yqoZlKmeGxmApHO
 JWUpOjL/zIeSmy+ekWiFipWJ3Z6GREjEhIG+EOorVZtu1x+lgDTAu3gvmdtagNU1Nz6Z
 +5vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764840908; x=1765445708;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7b25Fv33Xq/PZxsyLv+FhSwrtyaBUSUZvYVfFNhl+n0=;
 b=aUPFRACDJr/49hjaOiN0edUTfmcHdmCUVixNd+ZfWbrQ8FTVgdijZUvXfGZdRapu9d
 PdENOqUk9OrIPRxONVz4Jpn5DqK60SdyvFJOVCdQMGsPWh2sUEEKrIVQe1x1l4Wl/S1w
 G7CrJuKi7AyESuPMrejkkEW3NeV02ipIytvPMH5l4YxZmQE07VlxnjysUFAXFn4qrcLz
 VgTgbrDS5rSvhihH8rKbTb4sWSVXBtvKcQn+OAXHCLkMWKGNK6bKzQBWV6/RvNYdDQjQ
 Q0jcKrEDvFWY2jJXebsBe9uyIueQRWfUusEB6wPASQejmOAtl+Z7ba5Jh7+ygY0rEYqI
 nZgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUn7lhp/Ymm4sfVrqElQ4jDjm92vBEVtMuwoPi9JS9LPc1vfTJr6yvh2zgGhIl4oTxKbFdi201EIg==@nongnu.org
X-Gm-Message-State: AOJu0Yz6KmsDOPfo/jya2i/7UQ7jpLetXeVJHStxPT+z89MvHAvtF60X
 P+onF4ORuQJS+SOz+SiP/pR0yspJumjQQSd+9RyiA0QD7REeuLFO56pI
X-Gm-Gg: ASbGncu+AIm0p6dzckTc7vhY4tuY7P298TpP/oOee2uny+9lLXRt3WOM2Cig+5sFxen
 8AjTPb20FajJWNq/CtOa7VxzydFhZ9yBnv7Mrd9usKebGK14zUCSEL/eLEhzChCCtd7s49KkwAN
 Kb8s2+mhYEXSjVM09kWdjDo8X3AWX4SPA2gK7Xwo0A4NUVPPGqCVyltrNuYLNn4wPOpyxAUhZvA
 xNeJZy9PXoZg+1gpO810dR+1qxXD16nB1r5Svpaqd7+eUBHiYleHfnYW9ctaq/B5M3GcmCx8lLH
 DzFbIdkUkMFC/lu/jSootx0j8Mfs2bUujcpz69DMuWME+rJA4GZW20fW7ZsX6FBErgXNmN8q1Lw
 9EZ/YPIglqF1Ltx2mXi1OS9f08yk0Pyr6I3OcteXUlBsUi9pQHdh3FQQehWrv1idk6y6oOpUBhM
 PMiIzyg+JVrsd5CwQh2V7nj8T0sQvpkHQPwPwrIjZj3g==
X-Google-Smtp-Source: AGHT+IGD3i0LrPdz5e0vL2bVXHvaVwO3UwaQb643ryzJqh4NN+/Ny4XDYuq6HOVcEOUUcRWhewotkw==
X-Received: by 2002:a05:6402:35c2:b0:641:1cbe:a5bf with SMTP id
 4fb4d7f45d1cf-647a6a418a3mr2209665a12.9.1764840908018; 
 Thu, 04 Dec 2025 01:35:08 -0800 (PST)
Received: from PC-DA2D10.beckhoff.com ([195.226.174.194])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-647b2edf72asm856573a12.11.2025.12.04.01.35.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Dec 2025 01:35:07 -0800 (PST)
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
Subject: [PATCH v5 04/15] hw/arm/zynq-devcfg: Prevent unintended unlock during
 initialization
Date: Thu,  4 Dec 2025 10:34:51 +0100
Message-ID: <20251204093502.50582-5-corvin.koehne@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251204093502.50582-1-corvin.koehne@gmail.com>
References: <20251204093502.50582-1-corvin.koehne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=corvin.koehne@gmail.com; helo=mail-ed1-x534.google.com
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

During the emulation startup, all registers are reset, which triggers the
`r_unlock_post_write` function with a value of 0. This led to an
unintended memory access disable, making the devcfg unusable.

During startup, the memory space no longer gets locked.

Signed-off-by: YannickV <Y.Vossen@beckhoff.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/dma/xlnx-zynq-devcfg.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/dma/xlnx-zynq-devcfg.c b/hw/dma/xlnx-zynq-devcfg.c
index 2430d70bf7..0c06daa6b9 100644
--- a/hw/dma/xlnx-zynq-devcfg.c
+++ b/hw/dma/xlnx-zynq-devcfg.c
@@ -221,7 +221,9 @@ static void r_unlock_post_write(RegisterInfo *reg, uint64_t val)
 {
     XlnxZynqDevcfg *s = XLNX_ZYNQ_DEVCFG(reg->opaque);
     const char *device_prefix = object_get_typename(OBJECT(s));
-
+    if (device_is_in_reset(DEVICE(s))) {
+        return;
+    }
     if (val == R_UNLOCK_MAGIC) {
         DB_PRINT("successful unlock\n");
         s->regs[R_CTRL] |= R_CTRL_PCAP_PR_MASK;
-- 
2.47.3


