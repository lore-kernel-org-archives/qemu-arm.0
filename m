Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp9470156njk;
        Thu, 2 Jan 2025 02:58:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX2h2aPCElN6VVgERBarYFL7ULe1kmbEwY0HRAR5HV3mxl9ER3jqf102vBWAcKsGLzHLq/BpELEShR7LQ==@linaro.org
X-Received: by 2002:a05:600c:1d25:b0:434:fdf3:2c26 with SMTP id 5b1f17b1804b1-43668646362mr377501775e9.19.1735815524104;
        Thu, 02 Jan 2025 02:58:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735815524; cv=none;
        d=google.com; s=arc-20240605;
        b=LZnbQeMr4Qf7BsocUSc9Bu/yu3FZ624uIBrm4ElLL2KHJpvZnq17IidT/8IdsNr4eT
         x1rN527bhgzVcbkpfHcbEHXMdOizawXPa80lzFch0it3rKbYFhSs1uOgvZgzHD2Vptmo
         cG73mcfx9bE8mttVqBclK4YLOgaxeP7LIw49ol/+d++FmoYnk9Q64PtNpc28EbLrqIPp
         kI7+RV4TBGjqtxpdzyk+nDYpVf94TPrZyTHiPDLcERFTYIbEeKVZTnhrxKEqWZsOvUiq
         vhwmNbemo3b9YOXB3hyc71AevLY5TmjSzm2lFHUUYJ51/aIkDBJbCFEtbhC8KyRgG1Qc
         t0KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=tcekA88L/Z07G4gBsT6y7wvrNxItM6wYEmpLelolWes=;
        fh=p5SZ+dCgwID0cqwQdMNHyFdplyTM0+2gc5g5XEuo6RE=;
        b=eEQP8mQZzIP+Fxvof33W11diUYJ7LHru2rwWZJ6R2CRaIQh/ITLFbbmU7oTyLBjT2X
         Zlgnbo+gac+4/m1ZXZFgabQZr6OQgIF7Epwu01ZcCZIX62pFpKKNXNrQZeCxv8sSoSKT
         XNpIGQEnb/eWe0Uq8ALVx1dW1BIUkQFnk2tYJ1dGVey6mkj2tfwcZ+JEO4xuS6jhLGlw
         tlAb5SR/eltKx6xcc+ovygDjOFGoSVdUw/yS8VlUqmgHyTM1TkhiXmvs5oXL4u3/0tPl
         3CPpr/j3NbOQrQI540LiedFNK+jomVYyqsUP5AvG2LnKV778IUSy52bwA4nsgQuZaFYM
         RgOQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GoFS3tXj;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43661260b6esor69451935e9.8.2025.01.02.02.58.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 02 Jan 2025 02:58:44 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GoFS3tXj;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735815523; x=1736420323; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tcekA88L/Z07G4gBsT6y7wvrNxItM6wYEmpLelolWes=;
        b=GoFS3tXjj7sK0ynBaBAAejBjRzCOE1RrfT92ZgSm5Phjff/CmhJAfIkZQav0mSElt3
         dy3Ae49f8Ql3IkqTAlj7RtU1GH3nlMaoUdj6fWHlE5Hx/dNrkyXnqUvzYqKfOBK0tPXi
         BjvS6EeDKGGBjtuAAWYbPiqrClDQcdxdtlWd1z+O79uq8nP/xN1ypiXkEe5PQurr9Srx
         22cHnW8FYu3AEjtJ2RhbWPCeHrzH4oulxyAK4MsyTkl4RbClKY8wXJv12PDU6eJZGD0Y
         qJTCr+EO9ARrd4H5Hy85hCpqzpnUO+XcgLk7Oy+hfZC8JKYfpJt3IGZg9JwaYtJd00di
         TnYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735815523; x=1736420323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tcekA88L/Z07G4gBsT6y7wvrNxItM6wYEmpLelolWes=;
        b=EGWUi1a+wPw9VXpIYIt84ePuJB3YUVIj4zQ5x+frkLbN3t0CrV6i9FvU4jnfYoIoAR
         IX9Hi+68eHAhslAEuyY+hNkWMWljMtRP+f20dVS8Mi791YZAN6Xl+K7mRA2Xc7l2fmC8
         btbvaH/K8XJhMAZxaO7Z0IaCtadOIj6R48zGGxYCm8YEXzup9dI7HM1UVijBCYM1Xsru
         6Lc2pF9YK3K+oTKdF3BHJ+qHNXZkPgkPDQuylZlrzHjZsjwbXtCaK1yoUNuBlDMbjcCf
         ox7z9GJigWLmAYvfqsa5xmcrMcl8gifQw25249fKzuFhFMWtK+F7T6uZHPZ/7iOPUpzB
         yomA==
X-Forwarded-Encrypted: i=1; AJvYcCVdoBCJ7iGcuYYfuR/XgJ8l1fjrbq4fsXVW1EhJhAGt4yFPMYKdXZqHkOeWBzajce30WyGTt8QQ9Emizg==@linaro.org
X-Gm-Message-State: AOJu0YyYPwp/CW9bpl2VeN2cpP1nNofOiHqg+nnOBnWms4Fbs8rAyt0c
	4rBBrFFd6FDSZxoF9GwMgwTXOPWxTPXmtaIfnMV4GI0zap8nSfBTRDW/Sh2UoJBXmQ==
X-Gm-Gg: ASbGncsDspEMrY/ZlCGh/+UsABWUs1FPhXmDbtA/E+WIhwtUxGW7rL+V8Bfz4sd65GQ
	bbBrXwjLt/uFhmecplYD6hpgmntTGRY+TCL/HjJdQ6PDB+oUBjENV7CQq7T/4+xrDtqWyatIQvO
	1CdPOKC2k/Qy5YQi4JYrfTI3wjWUZWgmZfbXzP7uIoaHL4y64UYOPjM6CPBBllyrlyY9wQQBVNB
	2G3XdI+hDNvEoAe//qp4tKylGl2LTD8SyRggf+QtDRAgSsEcwTlPopOuy1mdGlU7sAwfOsQA9cI
	TntXNx9HaLzFkw65JnUhtoPIRj3md2iBSnfhcU6uYPL7Dw==
X-Google-Smtp-Source: AGHT+IHuKZiTDqfvdgRrkNIzVHKJDvTLXwGdy3KrAjQmf1boaZkc7xDtRhRd53OuYnJUXXBsdIhdSA==
X-Received: by 2002:a05:600c:350b:b0:434:f8e5:1bb with SMTP id 5b1f17b1804b1-436686430a2mr404478675e9.12.1735815523632;
        Thu, 02 Jan 2025 02:58:43 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (161.red-88-29-191.dynamicip.rima-tde.net. [88.29.191.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea487sm446530485e9.8.2025.01.02.02.58.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 02 Jan 2025 02:58:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@suse.de>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v6 3/4] tests/qtest/boot-serial-test: Reorder pair of instructions in PL011 test
Date: Thu,  2 Jan 2025 11:58:21 +0100
Message-ID: <20250102105822.43532-4-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250102105822.43532-1-philmd@linaro.org>
References: <20250102105822.43532-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: hzEySoZmAGh6

In the next commit we are going to use a different value
for the $w1 register, maintaining the same $x2 value. In
order to keep the next commit trivial to review, set $x2
before $w1.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
