Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp1062280njb;
        Fri, 14 Mar 2025 23:38:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWiormIhVqARW1BZNqWDkTX0iQG7v+OcRwSXveNvMm27es1mnCCZoUPA9OyDtJ7NoN4RK3fuQxlKDCBlw==@linaro.org
X-Google-Smtp-Source: AGHT+IEAJ0ywHNMXxxooVNhxl3afBxTvqqSSzsHr6FTkEC4mJJMwyZqa1ABBTMHzFrAClUU0ubHb
X-Received: by 2002:a05:622a:19a9:b0:476:79d2:af5e with SMTP id d75a77b69052e-476c8130c49mr74501311cf.3.1742020723901;
        Fri, 14 Mar 2025 23:38:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742020723; cv=none;
        d=google.com; s=arc-20240605;
        b=SC4K6RVi1tps6mEboxM4jSVh7OJJ53472cwmaOqhBAiWziFzpnJvErJp4bLb7a9DK4
         RNXKgBV6wk1enz1m/PgyjgYEgaR6rFWGkTHb57Rw2GTXxSMuXkkw/0hI1pxFp/9ccrit
         R52Cxo2OUwuzVZZyvzoBL86d/LQiTU7e5rcaNNS/ODMwOL3HMeb/eqGmWwNfGKiF1Bln
         +WbF3ja4PAulwIK1Sq7ECJn5NQ6xTjvKCf0gYplDZgnboYZoQntzXE+gdDB7XjQGX2iy
         3OUhCevD9ux85YQvH+YBib0K3HvVqlAGuTIWiMfWmTlcb/VEapWsOCgEYtzMnlGQ/XQc
         YRcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=HevAM/q01A1CrqwNLDZlG+V7E04sS7ZJBUX/Nw4ShKo=;
        fh=DBwo5oYV+Zl89FPcGyBzo6mnqwnGCoM6YpiQGc4/RNc=;
        b=eq0s2Rz6d0fjOSiQwTkI8eM3ttArnG1VRKhHG+p7zstw34d9VK4uPqOtpuBA5miXIX
         tnF5Me5R588CTKll/tceyZLJ5icWMKvO6N98Ja+knKlhUFl/gMrKFvxqMbxmzjWsyRnF
         a2NmYH2aMMBVauDbBcLtIXC8ucxgyGx+OgZMDDWhk9R7fQu4dnh33TzpXmJLntplzKn5
         OHzWZJtfHHkOtVS2C81HGC+Sp5SdhkWCV4QhUxj/a+jEvq4ycGP/gIppxYZIfZvu0US2
         VTXFxp9DZp/M4V44qgJo8/QcyO2n5CYuwwyvzGmVcsYz+wae4lH57MtOPzgpKbeoIbEY
         YXlw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=D+3stk+6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-476bb617b8esi52831421cf.49.2025.03.14.23.38.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Mar 2025 23:38:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=D+3stk+6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ttLAH-0004vU-Km; Sat, 15 Mar 2025 02:38:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <psswdrcvrygml@gmail.com>)
 id 1ttFhm-0000Zf-5u
 for qemu-arm@nongnu.org; Fri, 14 Mar 2025 20:48:46 -0400
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <psswdrcvrygml@gmail.com>)
 id 1ttFhk-0000ys-Eu
 for qemu-arm@nongnu.org; Fri, 14 Mar 2025 20:48:45 -0400
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-54298ec925bso4164307e87.3
 for <qemu-arm@nongnu.org>; Fri, 14 Mar 2025 17:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741999719; x=1742604519; darn=nongnu.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=HevAM/q01A1CrqwNLDZlG+V7E04sS7ZJBUX/Nw4ShKo=;
 b=D+3stk+6dywqg58s+1wHEwVjmgnWHCMu5n9NWS7UXLDERPv9I3iXgCPYtdCz6mmLjI
 qITFMyG44OgaT5/S/5d/oh0f+9lF2e+Y4UgzaEk8uZmQkcaoH9Sex7i4X/MlckQXA5bo
 4OTpob3Ba9lptee9ShGjN2d6KaOv4Mec4oZfhWcut8QG+m58M3tSeG6898XPBIrsqklv
 jzyY/CLcIuhLAeRGXu2VlpMagZaRoS9To7lWAgsrQa2Wd/s2KtId2AOMnhgJB7ihZA2V
 FfCVUuBXv6WDnKj+8NpruBQj6In3hy2HR1CTXK3ef8L7/hSjD5+upL9bQHMJdMzb5CDz
 sszw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741999719; x=1742604519;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HevAM/q01A1CrqwNLDZlG+V7E04sS7ZJBUX/Nw4ShKo=;
 b=WgvBA0zZl/oLTJ/oUQsJCvWztQFV5OsvGyTUlQ2hL2cp22jFDbi6SHFM1MIUIX1kSY
 XLl5061XPZOrjRV0QO1d24ZM9ijv1DkbP1L/Z23hdzvDKd63gBLrXQ66X68TByYCOE5e
 BfRk0wj6pSmjzGBzu13aQPh4tMHI/Xo0jVpnEBGtv8cwbh9pkp/LP/nySqdhCvIvd4ze
 7Wx83QihOjTWFTZocNua9KcnoYyc9eH4qc94JnoxZGLZHqRd2fqVCLG0u684GPMAe8QB
 kNyjGKj3oMOYslC5bDlHbNcSSu5nT8o3hvfoyqSKN8KOqbyH1Drvz51eKDk68w1ssXrJ
 m4qA==
X-Gm-Message-State: AOJu0YzDO9MSxPK2gkc6YklTMk8/CakD2MWBsJYlSawMxSXVaTcqYmaC
 X/pXmqstFwl6G9X70JU/EcvVMAeQgtMzB6wMtziCg1lrFHb/dbdJR76+zNZ0JTZvxzaCZ8/0C7L
 8D56C3TPunNTdxcvEWqqtqANNlGi6ZJPD
X-Gm-Gg: ASbGncsZlnsgn5ZwGuhSVQIqgaMareDCD19fdHr8zh4g33mC8Lpd4sp8tCnHWpNS8cc
 BX5Zkz7eMdj8hunvuhyyP6r50HgNXTmTcrqjuv1fbHTJgUD6tmFEx0nK20G5nuzWdfWmeM3LKSK
 r87gHGtGNrXIKWwkv8+cP9l6zPQQFG
X-Received: by 2002:a05:6512:3e24:b0:549:74a7:12de with SMTP id
 2adb3069b0e04-549c39894b0mr1563448e87.48.1741999719221; Fri, 14 Mar 2025
 17:48:39 -0700 (PDT)
MIME-Version: 1.0
From: Peanut Password <psswdrcvrygml@gmail.com>
Date: Fri, 14 Mar 2025 17:48:28 -0700
X-Gm-Features: AQ5f1JqBybMbHaBqWTsHNDErsZAVIVmCFoSyCsSEa_7S-nluiRCiA3T6tIAQY3c
Message-ID: <CAJP3cEFQSyTsK2tOwZGLtfNHPmvK=P-z17nfCa0P-S02BQc0cw@mail.gmail.com>
Subject: Native arm64 Linux kernel build on QEMU
To: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=psswdrcvrygml@gmail.com; helo=mail-lf1-x12c.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 15 Mar 2025 02:38:31 -0400
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
X-TUID: /kV0EgiwbLkK

Hello, apologies if this isn't the right venue; this is a beginner's
question (just for play/learning).

On native x86 machines, I can build the Linux kernel, take the
`bzImage` output file, and plug it straight into QEMU with
`qemu-system-x86_64 -kernel path/to/bzImage`. The readout will be a
kernel panic complaining about no initrd.

I would like to get to the same stage on a native arm64 machine. I
believe I want to use `-M virt`, and I'm not sure of any further
settings that need to be passed in. As far as I can tell, the Linux
kernel detects the arm64 environment and builds successfully. My naive
guess is that the output file `Image.gz` is analogous to x86's
`bzImage`. However, running `qemu-system-aarch64 -M virt -kernel
path/to/Image.gz` just opens the QEMU monitor (the same result as
running `qemu-system-aarch64 -M virt` alone) with no further output
(e.g., no kernel panic). Unpacking the gz file to `Image` doesn't work
either.

What am I missing?
