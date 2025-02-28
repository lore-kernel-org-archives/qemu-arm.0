Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp1104354njb;
        Fri, 28 Feb 2025 09:49:02 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVp1nMqPZP4OVy4Q0o369g8l8qGQeTnbPn0Iygh/RtT8oqaWAv7eFoPuESKj4qnY2AZTlx07owu4FvFVA==@linaro.org
X-Google-Smtp-Source: AGHT+IFiaJuRYlXWq4nJMxLvHxpmFOKfxgWdEAL8x8VVpHJpFQLlHIfM5rEN489YOCGRHBOFX+Fe
X-Received: by 2002:a05:622a:15d3:b0:471:f23f:91c1 with SMTP id d75a77b69052e-474bc0518c6mr62631501cf.5.1740764941946;
        Fri, 28 Feb 2025 09:49:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740764941; cv=none;
        d=google.com; s=arc-20240605;
        b=QSz1D8GA5T8A07GUkC8sBZUJZZgTnaPN1gOt+5zM1W5wz9/2uOtvmpo7A1Up0HxPza
         F65jRpojlMaLYL+JAKkr3zePRZi8kX9c515qH+SDSg8jLCrTvvZrDbtNx0UKDQkPNH4c
         bAN5S9ovhNlyUpvpSZsCLxPk3v+GwXpfXNmTBN4XSwu3cnRefaIPX9osqcwsLAd+d+Qd
         673roLPZxnlTa8kNgBdD1U6+rBHmBMJ9uTwl/vKn616uc3s0j+/9x600h8/JnC+krWxR
         tQWW3vI80M55Lap4GSSjlY4uyOCq5Sbri3xWhKWvMxz9B4vC5r6pfBR78rdRQB4I16qW
         TK8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=I40sF1i9jFqYAyQf3qwE84BFM4SpyXkD56Y42KHQEPA=;
        fh=MLHM+gxpjdRCX46UmlsHJq+wyb7s5ougP82NtFt1JKc=;
        b=SNAL8N0lYsF8qLquKUTQT0k8yCnx+r7byJQFqCY5DCs+jCw/eXas/2Rz4x7crZyQg6
         iPRJ5HWh6NTFvyFMU/DWNTcVTVuZJOIDm9hy18H7Aq2W2OlzTmFJPSdECehLMjm1ayvU
         curBTnzRuluPio1rU7TcvA4/AxGUbqCOgfz3HNAJT86bvn2ggKQfFyKFcGOyvADPXaIC
         fXAt7NDkxWn6t28oHccSxeZg1jhS2TF+2rkmj35AJijp1LQHJizk4nAPJ8kgoD+HFM7d
         va+ST2yhj3awC3V2aaC3WzJoWpb+8//AMbXxXxL4CjBghbfRa32CbrY1XMI4Dq6BjiTQ
         rYGw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Sksizvwq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-474724501ffsi35344331cf.618.2025.02.28.09.49.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Feb 2025 09:49:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Sksizvwq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1to4TB-0007VP-9o; Fri, 28 Feb 2025 12:48:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1to4T3-0007JJ-1s
 for qemu-arm@nongnu.org; Fri, 28 Feb 2025 12:48:13 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1to4T0-0005MB-NX
 for qemu-arm@nongnu.org; Fri, 28 Feb 2025 12:48:08 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4394345e4d5so17346355e9.0
 for <qemu-arm@nongnu.org>; Fri, 28 Feb 2025 09:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740764885; x=1741369685; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=I40sF1i9jFqYAyQf3qwE84BFM4SpyXkD56Y42KHQEPA=;
 b=SksizvwqlRoRwCX8PRqUlKl/Jr52kAaUnd4MGP/w7BGs4m8lQmHKuGK5uSOIxKiBDt
 Km3u3BB5YeRhg9moub0Heiluehg0zMpJ+ct9nvV9WAfEhIGfB7qImF/VxJ/MOXI4NKdH
 NqLIvExsJl2DPNxjbnBsCDsPZMLPLA9jZRVKR8BcNphxGQll+EGy6SyViplkOT39SCRx
 lProSni4Ann0R46dgFijyVmegtEnS8Woy8LHsrJnedFNO15GEmImvdSHhhlWJsYw6Ft7
 nD65hvCgwROd6UkNipzkN4Me/eijuQVrYcYPdhlXBxTOoDi5r4+Eff/MVUm3v4ojSmB9
 JdHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740764885; x=1741369685;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I40sF1i9jFqYAyQf3qwE84BFM4SpyXkD56Y42KHQEPA=;
 b=ebeeRrn7mQuOKVDyWEsvnWm6beyTJFeE8qVsVsnqkS9wa3GJhM7UthGCXn1rxHpME1
 /ELudze0SLhSZ9eGtdbpTpG1pnsynMpOR+FaM0Jqi/8y1dPyoRiVTvntMLzU17YYDGiB
 UmmS91VSyTeSP3xMP+UbWvUUhRTLkpETKgU6RlxXqAu4KT0+3eNeN4ndzhJcdcjAvCY2
 rWVVIXpST4N2oKvH6D8v6nia17Q3j40XGJxJA2WyBYfGOAS03m0cE+QCLREMJLpnBtcz
 5vkLgN9qi349hTUiIOfadb7mFuOIHvUifHb6BXe54k7NVsg8euZLnARgazaJIg84J1ZP
 MfPQ==
X-Gm-Message-State: AOJu0YzUv2gjtdRS2Is4QwG2y6AmdTkQPXuTYXhz5ou29JCAPS86FRe7
 q2MZ244IhsYM7rZzRRuZfX+PbD+MpGopW5H7ddKEqpuBQq1m4sCX+rRXzEp66Eytp/hoPqhoO4Y
 F
X-Gm-Gg: ASbGncuYNAZS4vqIm6QYngc/AwpWMdcUVEoi3R2/KcFeR5JLLuRMfRZR7mJD3NjJ5ty
 UYRHChK6TEy7WczDftDPvDpBxi5xVoqIkal78ckzjVN2OOBvtFTpVFD2tGiqzs+chU0FnyNzBhH
 uCfQMaij+t+RljZuTOjngHIXzaC9Dt4aciE4VsFdlT5aRKnyR6gFBYGz0yu/06L7VuyjMthMdJf
 sfb7NmkD7xFQoGlRtCnrhq12+x2auR06BsAsGUDYZ1w8ot8+hv6kiuxtOJ8jJoHUevYUVTe3Cej
 HYhABm/5YWZMh8XLR7V30y89IgiOislt
X-Received: by 2002:a05:6000:1447:b0:390:e904:63de with SMTP id
 ffacd0b85a97d-390ec7cda50mr3633989f8f.20.1740764884491; 
 Fri, 28 Feb 2025 09:48:04 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e4795da5sm5979556f8f.15.2025.02.28.09.48.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2025 09:48:03 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org,
	Jason Wang <jasowang@redhat.com>
Subject: [PATCH 0/3] hw/net/smc91c111: Fix potential array overflows
Date: Fri, 28 Feb 2025 17:47:58 +0000
Message-ID: <20250228174802.1945417-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: xRdna+VzF2cG

This patchset fixes some potential array overflows in the
smc91c111 ethernet device model, including the one found in
https://gitlab.com/qemu-project/qemu/-/issues/2742

There are two classes of bugs:
 * we accept packet numbers from the guest, but we were not
   validating that they were in range before using them as an
   index into the data[][] array
 * we didn't sanitize the length field read from the data
   frame on tx before using it as an index to find the
   control byte at the end of the frame, so we could read off
   the end of the buffer

This patchset fixes both of these. The datasheet is sadly
silent on the h/w behaviour for these errors, so I opted to
LOG_GUEST_ERROR and silently ignore the invalid operations.

Patch 3 tidies up the existing code to use a constant defined
in patch 2; I put it last so we can cc the first two patches
to stable without having to also backport that patch.

thanks
-- PMM

Peter Maydell (3):
  hw/net/smc91c111: Sanitize packet numbers
  hw/net/smc91c111: Sanitize packet length on tx
  hw/net/smc91c111: Use MAX_PACKET_SIZE instead of magic numbers

 hw/net/smc91c111.c | 87 +++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 79 insertions(+), 8 deletions(-)

-- 
2.43.0

