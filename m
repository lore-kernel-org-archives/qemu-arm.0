Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp10326224njk;
        Fri, 3 Jan 2025 09:22:58 -0800 (PST)
X-Received: by 2002:a05:600c:1c09:b0:434:9e46:5bc with SMTP id 5b1f17b1804b1-43668643750mr537556385e9.10.1735924978421;
        Fri, 03 Jan 2025 09:22:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735924978; cv=none;
        d=google.com; s=arc-20240605;
        b=bIIWrR6r+tDKC2lFbokK+ghk1v/KoujgFe7oAw0cO75MIqqM3mWJV+zZD/GxNhAmU8
         w6bcK14U61WsXA7untYGV/JKrXSooITRaSqMFLs0ZAxJq3DXECr2HxiYud5+Or/qH7uE
         sfCDAh6HUnPwA4mv/qIEY5xWznQWFgRqq8NYMsLxG0M+hhcmG8/kRIiwTmBAyG8zNQQD
         OQ8PwZL8SFZdUn+FDJNU11qmAKzkByzG0RgDr5qcbALjQkQGMbDoARgmQ9GpUc5Xiyxn
         z+K2+DJyg1ITE4u/Z6xe10CVdR+D9WYMIPtDVSK8iWyaND+GLAPqVpC7f2UPVnI//rsj
         GXNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=XAvTPdAmDaVspmiDEBxv7slQUtV72xw5x5dlXyX0c1M=;
        fh=sOXhaDUqTNtWZrrLHpwVOLbAyi3Of/7BDc3BkRLfsYs=;
        b=Df7uVO77rkpzvvbWcIKtyJOzRt5HwdczsB9UxIx9ammDM4hvxKFu8I+37XXHpBcF55
         8hSIyDpBzcTfuDAAtH5BwDYF0qHtbT9vbHAJ9uplLwsxihBMjd/I2FHajX6HYzrLLn1k
         HVhjGD3sMWGIp8jx+YVSjT+m5hQGdVpEkCCxV0Z9Gh/9cTaFoCMQJWOQR7CwZmnrqQN7
         mubIyxruZq/8A7eZrAvm6oRY/LLUPpvxShINEJ1YCG1LTGS0tMMt5s514uO0SAp9qyMN
         8iJjAwqxvgmuUjznIbS/PBWKUBSYq9jWqsktueP8Li3r0gdGEyTpzGLYCPg8SFol4L6w
         LDvg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aEcMfvib;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4366127c8b8sor81503695e9.10.2025.01.03.09.22.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 03 Jan 2025 09:22:58 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aEcMfvib;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735924978; x=1736529778; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XAvTPdAmDaVspmiDEBxv7slQUtV72xw5x5dlXyX0c1M=;
        b=aEcMfvibUmD5HTtdEqsIviQ8FkpZKbiPLE/SF8qKRtQ8P3mH2xaQBtAc5hQCJ3BZ9F
         AD/1XAFY2M3e9MF+RDNV3ABLbsiE493uBcBUtMKfQu4qbVQYAxES+/hWHLgkCjCDEW69
         uUJCVw3PqUhDi6l/qoVR6HxinEAs4aqvRE73/T3cuwnrLATRbzTLUIVOxI2D4htrl3wd
         RU4z59byfgRSSQES56QNawxN9Xxaqgbc2G0tUW2FNuYSqNKtzr14j8yDxVE0Mp0oRK8T
         D2S2gokGoti0PUt1Uy0Q+ElhcFySCxV3AX+/7SLhA1hhWZfMbLxhr4LT4YHSmAx9R/rg
         H84Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735924978; x=1736529778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XAvTPdAmDaVspmiDEBxv7slQUtV72xw5x5dlXyX0c1M=;
        b=MmZguut9OxeaPTlVQcp4rUvLRSkC42NK7g2j67JKlgpv9gd6YpMO4pUebtviD9oSI4
         O3ECussq0KTa+ZJBUMN3kXlvz2nP4jg7yPdy1eyquJfVzmH0lo69b1Q6prH+vd0tiT/l
         arajPVUJuKdPZ6Tepbd0JRN1MYI+TEgyjr+c/G9iFFM+bqJ1zw0fpapQlYtgarLILOtf
         YBtAC1PTVTOHxx//eugvFnOFT7nuBErFKEExRr6OArAO9J8X6I7vlJ9v+1oC93Laj9MV
         Ixfe/VsVEGHDxzwbGCAUGHjRXuw0LxA/WknlqCV5zXzGT7On34fVGSfp4mYoT0mLnkNs
         SdZQ==
X-Gm-Message-State: AOJu0YzFpZdd16tb9ZwuLP+2C24qUFUiyCZC+lt7u7gy8vsS0QAFi27V
	83Oycr/75mCP1EFiTmlK8dkd6hQnICexf4XS5O+F1NKI8a3RCsWe/TQQiyPBHh3cKA==
X-Gm-Gg: ASbGncuVgwytBGlLlkid40wTPllpb2oq8g/TQwJO4Sbzc+smKTk2KIm1LY3rtBis1BN
	sG7ZA2P5hrqhrx8VgK5cjxTHr9u9xbfy+VM8PbfZeWAl3bOpbIVP1aTiUZc3RR5yqXhozBvYEcj
	aObR5GwbF4qZPU3I5UGOBqQwZqLRKMrarleMJvXy0Hci8VMYrK/qqQwyf78+87Nr5v8LVIV/WBb
	ptYB+6yG78PrOY2c6Vz0Y9BArXuEZCyxUvuAaTzoF0fmR6hyPSe0XQKDwkvxBlSmMrrgCUFxiVz
	St2iygCYVcUD0xvkX1271mvfldi1+is=
X-Google-Smtp-Source: AGHT+IFTxnQJTNsUPy6I4zoFQVp3E/3c9NUQH1U+uPIkRSuUxWUgj8/hY7P/TVC42HeUE/58fMgwyw==
X-Received: by 2002:a05:600c:35cb:b0:436:1af4:5e07 with SMTP id 5b1f17b1804b1-43668548867mr335075545e9.1.1735924977888;
        Fri, 03 Jan 2025 09:22:57 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8acb85sm40812573f8f.103.2025.01.03.09.22.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 03 Jan 2025 09:22:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Fabiano Rosas <farosas@suse.de>,
	Laurent Vivier <lvivier@redhat.com>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v7 3/4] tests/qtest/boot-serial-test: Reorder pair of instructions in PL011 test
Date: Fri,  3 Jan 2025 18:22:38 +0100
Message-ID: <20250103172239.18562-4-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250103172239.18562-1-philmd@linaro.org>
References: <20250103172239.18562-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: AQU88difngE9

In the next commit we are going to use a different value
for the $w1 register, maintaining the same $x2 value. In
order to keep the next commit trivial to review, set $x2
before $w1.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Fabiano Rosas <farosas@suse.de>
---
 tests/qtest/boot-serial-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
index 553575ca75c..bcfa504826c 100644
--- a/tests/qtest/boot-serial-test.c
+++ b/tests/qtest/boot-serial-test.c
@@ -78,8 +78,8 @@ static const uint8_t bios_raspi2[] = {
 };
 
 static const uint8_t kernel_aarch64[] = {
-    0x81, 0x0a, 0x80, 0x52,                 /*        mov    w1, #'T' */
     0x02, 0x20, 0xa1, 0xd2,                 /*        mov    x2, #0x9000000  Load UART0 */
+    0x81, 0x0a, 0x80, 0x52,                 /*        mov    w1, #'T' */
     0x41, 0x00, 0x00, 0x39,                 /* loop:  strb   w1, [x2]        *TXDAT = 'T' */
     0xff, 0xff, 0xff, 0x17,                 /*        b      -4              (loop) */
 };
-- 
2.47.1
