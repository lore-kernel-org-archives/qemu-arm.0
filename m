Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65322D1F9A0
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Dec 2025 09:38:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vR5kZ-0001XQ-C0; Thu, 04 Dec 2025 04:35:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1vR5k7-0001BS-2d
 for qemu-arm@nongnu.org; Thu, 04 Dec 2025 04:35:19 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1vR5k2-0003Pd-US
 for qemu-arm@nongnu.org; Thu, 04 Dec 2025 04:35:18 -0500
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-644f90587e5so1016785a12.0
 for <qemu-arm@nongnu.org>; Thu, 04 Dec 2025 01:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764840911; x=1765445711; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pfg+3r5e3fkTMweJDY05x2D0nfBscf4bb3i1khlEcLs=;
 b=IiIPr18pO97Co4agTe3ETohSwv4ifgFVfLPGhmwp7tPSaCmCm10k6OlNbmF3vf8c9F
 wPmQ47qbkgYXzUkqoR5I9vu8l2kAU8wBMo1Y2KJ7eEstisoRyZr2sfDjIvXFP3UvcCFj
 KXS3byBbWgqp0x3NjgBCDczcphvgjeiSRKS0lljXc4IpYB5Uv9lAQu4eqqfhr5APqTVv
 hROqK/GjnFZQdoRGqlfdE7ElBnMnzIHC2yIB/6IvOQwcoZ06MUOx/lvSuDAPY1Hgiyty
 rM5y5z8YVzCkPLI8HWef2YFuOD9fiCwxX1BG00T/XiAzooUT7iGVZdk3xiK795UyzH4D
 yvNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764840911; x=1765445711;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Pfg+3r5e3fkTMweJDY05x2D0nfBscf4bb3i1khlEcLs=;
 b=BcPoHNwmUKYVezJKrDDx+9zlo1tU6lk9DxDYJi+EqzfQLKpEeSbiyZZaviabD81y1G
 nFRBrfp2xGsp45wua27iajlUFWIyXn8eR19qmQ7Vxn0VqJEiEiVEYKGjbvKoH660R3nq
 VT1ad0j9ljEjFSqhSWgO23SQ/rzMhQvnx0auznswXzcW3l+4BO6N0XMZcKYeIvgFUmTC
 YJzlNstzsLuFIKUoB/UmrEiecRpJEOmzQxy2yHLUfMPo2LjPParHduPVKNQuVgrAx8kt
 hKk9AOHf0sg27FRtOFLWNmmwGAGLiLv3olSMccepjYlvy4pniirnI/W+y1xwQLOEmO4w
 T3qw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAI+ufjXlJ/8jFXZdCZlvK0RcRj4A+bAwX0by9ynM/9s0WCiOQAo5CuIn5RhfZH92GuvOR64ehkg==@nongnu.org
X-Gm-Message-State: AOJu0YxGaxLdDDM/LktRL7KTTxyl9ys2ghteMkaHCAEhKpQzPCj0Or/T
 j1mYqmEVAgHMqkGWLJJvcGLzj5I2JY0oJbw6Lh41hhwIk/U2KNsva4J1
X-Gm-Gg: ASbGncuHw6GlZ+GGnlE7v0v8Zwy/Lj1xsKngcbmJwzFxZJwncgP1iKu6zOxc5Rkvkjf
 ipdfQMsa6bZyHktYWm3C+41PzJ5fGmUXQOCQEQlvEUFtEpKZQfXYq4puR1JXp86sofrqGbuy847
 fNdxgwRYx3fPV5cupiOLsP7xRr1bHHZBinaXxGZ3hVvQC9O5GQdtf7izlqP8U/kSNytxJ4bEZqS
 sGeM4dFwWKMAYgLH0zImLbYHiI2/nPueg48XQCJypDcoN0TuF1w4e3yEuwAWjA9fTJEPxO1FDJA
 KYRYUlD6KWq29twjQpF7RDSwL6/tqtJzYGnQWnJTKpnG+ilLs66rtr28NZnhKwHE62JWMSNumGm
 b1TvhJSouyDo3sAZzY8BzjpFvf4xPChCueAOz3j/12EhV/vsCGQgqmSEaxaVXdyQi/Whk2ITF7q
 HHRjNhDjFxxfSxfzTmpw2kMlVlhi0NINk=
X-Google-Smtp-Source: AGHT+IFRf3LHkGMTeKzqM0EWxnZp7Zf/lsrWcTpTYLwWOhltIN/yp45v4fnUPpsbHleX7Oc15Kf4CQ==
X-Received: by 2002:a05:6402:26cc:b0:641:1f22:fc68 with SMTP id
 4fb4d7f45d1cf-647abddcb97mr1856056a12.24.1764840911099; 
 Thu, 04 Dec 2025 01:35:11 -0800 (PST)
Received: from PC-DA2D10.beckhoff.com ([195.226.174.194])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-647b2edf72asm856573a12.11.2025.12.04.01.35.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Dec 2025 01:35:10 -0800 (PST)
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
Subject: [PATCH v5 07/15] hw/dma/zynq-devcfg: Indicate power-up status of PL
Date: Thu,  4 Dec 2025 10:34:54 +0100
Message-ID: <20251204093502.50582-8-corvin.koehne@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251204093502.50582-1-corvin.koehne@gmail.com>
References: <20251204093502.50582-1-corvin.koehne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=corvin.koehne@gmail.com; helo=mail-ed1-x531.google.com
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

It is assumed, that the programmable logic (PL) is always powered
during emulation. Therefor the PCFG_POR_B bit in the MCTRL register
is set.

Signed-off-by: YannickV <Y.Vossen@beckhoff.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/dma/xlnx-zynq-devcfg.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/dma/xlnx-zynq-devcfg.c b/hw/dma/xlnx-zynq-devcfg.c
index 722d68a568..bd8057caa9 100644
--- a/hw/dma/xlnx-zynq-devcfg.c
+++ b/hw/dma/xlnx-zynq-devcfg.c
@@ -333,7 +333,8 @@ static const RegisterAccessInfo xlnx_zynq_devcfg_regs_info[] = {
        /* Silicon 3.0 for version field, the mysterious reserved bit 23
         * and QEMU platform identifier.
         */
-       .reset = 0x2 << R_MCTRL_PS_VERSION_SHIFT | 1 << 23 | R_MCTRL_QEMU_MASK,
+       .reset = 0x2 << R_MCTRL_PS_VERSION_SHIFT | 1 << 23 |
+                R_MCTRL_PCFG_POR_B_MASK | R_MCTRL_QEMU_MASK,
        .ro = ~R_MCTRL_INT_PCAP_LPBK_MASK,
        .rsvd = 0x00f00303,
     },
-- 
2.47.3


