Received: by 2002:a17:505:6015:b0:1be9:327d:8ee3 with SMTP id us21csp488297njc;
        Thu, 5 Jun 2025 12:37:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXgevVAgKiNsoGRgbUWOC9Uuu60TFOpj74At1xsHgjv0C1ZKI9IAZAFZvh+NRWA+TCu3wPcnbedYQRTHw==@linaro.org
X-Google-Smtp-Source: AGHT+IHw0+ske7aD7n8UOPvlTy6XBEkzjJWKc34144kw/4OrxPF5eMSAeMWrvwcuTl/JdQoag656
X-Received: by 2002:ad4:5ded:0:b0:6fa:fc96:d10a with SMTP id 6a1803df08f44-6fb08ff86f4mr11721966d6.27.1749152226565;
        Thu, 05 Jun 2025 12:37:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749152226; cv=none;
        d=google.com; s=arc-20240605;
        b=VD9O5JQb6ZdnIqxHAM+9W0GMQS3vpmkQXETF34zVd8dJTilqXVpMBOJMxaJQUIFLm5
         7Tsrz7zZQc3psE4CnLvosvatAIs+2YWKS54JyhFeWUTtIIDu9CLKTMd/LfqFpPZPI4Jr
         FGUwp87WVQRHRoq9bk0yIfwAKk2hA+47lUOk+zX6iosWK242GeapyERzq/79jdqCPmjF
         MZMydcQMkULyiN2YbmZ/l+XhupM8ZjafY+bh+JlXepxhY0nYR8NCOXxHHDG/EFeu8tYb
         trwL2t7rvkF5zvWY66J8h54yfrMQ/OKa91ePZerTZPqUmVFzCov76MbDGBNzDfhkjgYf
         4xwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=83yRFqQDqtEfhfQYce2Osef2dywXWD24VcAWbnFp9Kk=;
        fh=8RnW7rUctp8JVYuWL+6twZThdIlYodnMaYA7GYKM/oI=;
        b=HQYIWE/+Vh8GafLiN74h++uWApBhldF3kKc+r994aQ7G3v+8YGFpA1l90sdL1fBSW2
         QNKkB+SEfkgHA6rJls/+A8XFh4w045GqhJHU7y+7vz12KIZD41fTyB3hd+2bTlVroenW
         mP2vwJ4bkXrcTF9jJMRRPae9FMoBp5XWlP/yLk828CjbsV4yoU1G2OYMbRRzTfJOHSHQ
         QTByg6RzTQsGmX8hQfo9wzOv5hRIHeB2he6W9W6CB1u4ipqtGN1A9fQjoqTlfkIteDYn
         9l2jCgJiJiu65tJGGAuAPYQYLUX7n1HQRzKuHNzl78c1sYHC47zkwuxUy/FP5YX97qTy
         CKiw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Oqcb+mrQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fac6ee4b26si178252836d6.503.2025.06.05.12.37.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jun 2025 12:37:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Oqcb+mrQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uNGNe-0006jL-5j; Thu, 05 Jun 2025 15:36:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uNGNa-0006iH-6Y
 for qemu-arm@nongnu.org; Thu, 05 Jun 2025 15:35:59 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uNGNX-00016m-CY
 for qemu-arm@nongnu.org; Thu, 05 Jun 2025 15:35:57 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-451e2f0d9c2so11589855e9.1
 for <qemu-arm@nongnu.org>; Thu, 05 Jun 2025 12:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749152153; x=1749756953; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=83yRFqQDqtEfhfQYce2Osef2dywXWD24VcAWbnFp9Kk=;
 b=Oqcb+mrQWvq4iZ1eAEj0YztXidNZ9xREngt3tFL5TMElowPNHfSg54rx8V9GgVwGCP
 9Y9FZGTzPkUIYyX0bWPgF9YCMyrbhpc+SyB2RVgIqjio+ZdKzFLfJXMFhajZtazfGRyt
 eKTIJCv6kDI0Q4ex4fzA7qtYMggbn5XFEFnFOmV6BfZQHqtjC4JyowI1oCg0eP3RiWxP
 4Bd6nAGcoEIv70jSsK/+syRWJ+Fe+94qjD3pNDCpB5MCiWhMAuVBsmfA3QkVHQI6C1kL
 9vr/SD72ukDLhUKoP78365XuuKOZkjUSuXKwCabYFYxyuGOWoUe8yk6km/dvILoV0GXA
 sChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749152153; x=1749756953;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=83yRFqQDqtEfhfQYce2Osef2dywXWD24VcAWbnFp9Kk=;
 b=ISdv9sE9QFCeafV+Cq0PTC5sowWCM0vLsC1SHB4Ax4pQlFvdstUvHJS6+jI8NaEMUz
 1OK8VxJAE/2V7QrNE9CKggRdWCCKgDYLaEy0cgh6RzcoEBkElykw6FAhTi4WDe4G+HkV
 XN1Xsm561H3HG4QXHnliOEWz/KvEt6bT5xhuU9TO5K9ARXyD8L0zdJr53bdCmPBcnxMD
 pFmchivjwZaH1MbydxgCE3y0x5YYFuQzwo/M7kM0D0zAXrQKBvlasgTEXxWN7NmNDxrT
 VuYUEay1Ha/HY0TCgpt0A+edovbUENncL4LZ3QJLQC3vMGbWdEl41o1zwWt0zKORzOIe
 89tQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWU+Rdh4nSTM7spxT8ie/L9mP70jrcwhhj2KrR8hOq9Ovr524wxyNW/CzQOct5NRmDD2WkKF/Q//g==@nongnu.org
X-Gm-Message-State: AOJu0YxQ6lF9u/J1KHQB7dVruP4G3gR7zKjiJt87ONOSk1xbC+qbeYBt
 rbDwacXBbCAJlr1y+5gp+NbYd9dhb1sVfRjGXjm1GiUGrNAV0xWreyuEWDcstV6V9s4=
X-Gm-Gg: ASbGnct7mRU0hCmsum+LZmj5bjo210PfG/CYie2Xrrwq+DqA5DXgODmmVw4DxK33M4I
 KEeHkA6f+FvUxdpPJkPO/P9E4yzFAqSE/Cjb1p8ZSgllKrHg9Ga0QSsYMSYyWrf9VoJXcLirmA0
 NvUYDVxA8RogBci56q7MkaVsRDqnbD9g31VCfM3M0PvzTRRkanCrCDSgCuRiBBhZM2cjN6r1JKN
 AF1Ipkpw8IpIqluQ6Jmcat4z4d5Ed6JGq6k96gur8aJKcghTKeHJWr8Gf7tvMQpWM/3UxE+GT5H
 2XY8P3cC/5M/GxM4+YWniVblZrmSYxwqjzy9nJlpNaYNkeWSfFU2M4oGOGM5F+CFaS/c796rTtD
 d+VZh+0EIuYZZpBCwUi49vc+A4Z0tidR5k+Zo
X-Received: by 2002:a05:600c:458a:b0:450:d3a1:95e2 with SMTP id
 5b1f17b1804b1-451f8855f11mr44862745e9.9.1749152153306; 
 Thu, 05 Jun 2025 12:35:53 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45209ce1f34sm2477585e9.14.2025.06.05.12.35.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 05 Jun 2025 12:35:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Glenn Miles <milesg@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 2/4] backends/tpmL Avoid using g_alloca()
Date: Thu,  5 Jun 2025 21:35:38 +0200
Message-ID: <20250605193540.59874-3-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605193540.59874-1-philmd@linaro.org>
References: <20250605193540.59874-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: fqyFbCul/MWS

tpm_emulator_ctrlcmd() is not in hot path.
Use the heap instead of the stack, removing
the g_alloca() call.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 backends/tpm/tpm_emulator.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/backends/tpm/tpm_emulator.c b/backends/tpm/tpm_emulator.c
index 43d350e895d..4a234ab2c0b 100644
--- a/backends/tpm/tpm_emulator.c
+++ b/backends/tpm/tpm_emulator.c
@@ -129,11 +129,11 @@ static int tpm_emulator_ctrlcmd(TPMEmulator *tpm, unsigned long cmd, void *msg,
     CharBackend *dev = &tpm->ctrl_chr;
     uint32_t cmd_no = cpu_to_be32(cmd);
     ssize_t n = sizeof(uint32_t) + msg_len_in;
-    uint8_t *buf = NULL;
     ptm_res res;
 
     WITH_QEMU_LOCK_GUARD(&tpm->mutex) {
-        buf = g_alloca(n);
+        g_autofree uint8_t *buf = g_malloc(n);
+
         memcpy(buf, &cmd_no, sizeof(cmd_no));
         memcpy(buf + sizeof(cmd_no), msg, msg_len_in);
 
-- 
2.49.0

