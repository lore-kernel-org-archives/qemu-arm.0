Received: by 2002:a17:504:c7cb:b0:1be7:c013:c773 with SMTP id cj11csp248467njb;
        Thu, 27 Jun 2024 06:58:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUEwdVt06TKvA6huVU+X8QwwN68D/sKcfVfjs1QIK2+SOMSuKUZ9/cD2PvfzdB6o6V3N0ptGTp5xpjwSC9sPpBDEi5xqlMt
X-Received: by 2002:a05:6a21:99a2:b0:1be:caf6:66d7 with SMTP id adf61e73a8af0-1becaf66cb1mr3262846637.13.1719496707812;
        Thu, 27 Jun 2024 06:58:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719496707; cv=none;
        d=google.com; s=arc-20160816;
        b=Za8qDyPUcRredo/xRFGyZHHIdHf2RZB0uO3thCCW2sVvJbj6GrzhjSnmTbiCUKy100
         rpUpEeZYE6TaPJybxOS1B5jq301y+OhDQZNX2eWOJURrIKnW9psCKeQFdBqU0E9gctbb
         BWDiI5n3CiAjksrZcgPAnzFjpEuMYjJKT6I5vJkcZq8YuzSQ9C9LMTvewOMw2Esy7N+H
         GVnIUAlaUuCBMZLYhAy18eQdTl3NL8BUqovXDinZVrSsMpI3W1qqo935DAuJCG18Ak/S
         kaeKXieBeCbI0UOlsFXYiMBDcBrmuAT8v60Ez5ulhEb3/F2DiZXPRany/ARysfDrq/ly
         hACw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:dkim-signature;
        bh=heud5oPL9PguF+0Dl89or/td6O7yLCDZcvUAaJnUzns=;
        fh=080ygu0qjGx2JbwcuKY2iHfwhOzZoY/cSvTF8VT+P5U=;
        b=zsJP63XoAohSI51Q6NDcvpKIR+m49QnI3ckjA/B6JBaCVdJlnHxtxnxHv6Cloo2lDJ
         0U1/XYegaJJpfV4IMozVSUpqzKK5h3On0Phaa3IC9viyhrJgBHL562LOHH6XKG/8Qg8p
         ewoVpifZvHWvT6METL5rg2JgW9t8O1fsY8ZgZ/qhF6onvVmP8DoZ//haEFiCJb39uZva
         /0YX5SxpkjKU759sYHkWcEpH9sZsphooEKWL8pSir5Tx1XpRxjPP78IjRJq+KR8JH5fq
         OFCgbbv24duBGT+qKLdAi9Bdla4HIX1gRkHcfUnxMNYSCJTuIJ0iZTXuoj/wrfqi/dBH
         T4Xg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=Ay5B2SOn;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-1faac902394sor6721095ad.9.2024.06.27.06.58.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 27 Jun 2024 06:58:27 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=Ay5B2SOn;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1719496707; x=1720101507; darn=linaro.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=heud5oPL9PguF+0Dl89or/td6O7yLCDZcvUAaJnUzns=;
        b=Ay5B2SOn93nkcsRImDkwqI9l2+c2zhkrRkMoXdt1X1XC+UBiVAeE2aiKapfazYdreB
         0nYcMxS6cOEpdvkUdVbybcgbopDFKo470A0u9Op9WL/C0YzFczyS200bWOPbcPPudIOr
         b+SaYgQjkrGrqx+wneAryqcU/h0UhWykvGX+Kd1rsrPXMwFwUy+1mXQNNPn4o7QgATap
         4obFh1t2yD4HkxsdSNEQa5Rmiyuir9DLJBG34BJHhhH1h6LlVO2cfDJrbaO5AJXlM0ve
         pW9jnhij/db1ZfkOjuyV8F6kKMm8SZP5yvZMhk8sCAi4KIeBykWNPt0PDJSGgRIc3H6G
         YXCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719496707; x=1720101507;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=heud5oPL9PguF+0Dl89or/td6O7yLCDZcvUAaJnUzns=;
        b=GB3v9M4OwPcj50ry4fHoXmNOz2Qgj6S7V374PLRpMf5rKrdedng+kv6hhJkxxy8S9x
         S+E0uJasbkOB1SJsu/kQvetd2zffEqxg6DpK+6pW1xCAhISrN3utjAzdpNtjiSaTSccJ
         Wl4BRw7Tuev4e91/9zGYZFHYWbMho1CRbPKw5jVlrhaO0J8cxM+4gLUsnlaVpy8f0TqK
         37Gq/atX1m9HAgqpRgRlekUBnqrD3pUjL+gmfGBmEHPSzautKe7tXwaejKf10w+lIRYI
         nFej7jkcdBJeFIPizzV/As5JbJ9+K1IEnLmq4pSYOISoWgkxaD9SEFztRUYIWa6C/SGW
         KBrA==
X-Forwarded-Encrypted: i=1; AJvYcCV4pLePRP+wDYMtSKtTs2rKnhVTzFo5ILUmVbu/eppOyoLL0+rkYxcJys8je4QHb4FE443UQkp9BpO3cxtXCBkbhflpuiWO
X-Gm-Message-State: AOJu0YwgnZM5pHX3SGOqqcgSRqDUUZrS7z72u04MdLsswzs+7pv78T4f
	KpaQ7KZaBMr4h7ep3jtHyfLb7hEWfrmUZJp2lVK4kMwprCCj1JtAE7FlxNjpPIA=
X-Google-Smtp-Source: AGHT+IGon+Kh3oEuD1ex29QX/ojEPrLpLRJrh9wy0wfsAUnKEz9YFU2FzV3on1LO4wXqU1vRQAiMJQ==
X-Received: by 2002:a17:902:d505:b0:1fa:ac73:ca2d with SMTP id d9443c01a7336-1faac73cb78mr15108605ad.11.1719496707334;
        Thu, 27 Jun 2024 06:58:27 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from localhost ([2400:4050:a840:1e00:9ac7:6d57:2b16:6932])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-1faac8f25a1sm13532155ad.73.2024.06.27.06.58.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 06:58:27 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Thu, 27 Jun 2024 22:58:05 +0900
Subject: [PATCH v2 4/6] tests/tcg/aarch64: Fix irg operand type
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240627-tcg-v2-4-1690a813348e@daynix.com>
References: <20240627-tcg-v2-0-1690a813348e@daynix.com>
In-Reply-To: <20240627-tcg-v2-0-1690a813348e@daynix.com>
To: Peter Maydell <peter.maydell@linaro.org>, 
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.14-dev-fd6e3
X-TUID: Aw8IVgJ9rGC2

irg expects 64-bit integers. Passing a 32-bit integer results in
compilation failure with clang version 18.1.6.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 tests/tcg/aarch64/mte-1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/tcg/aarch64/mte-1.c b/tests/tcg/aarch64/mte-1.c
index 88dcd617addc..146cad4a0499 100644
--- a/tests/tcg/aarch64/mte-1.c
+++ b/tests/tcg/aarch64/mte-1.c
@@ -15,7 +15,7 @@ int main(int ac, char **av)
     enable_mte(PR_MTE_TCF_NONE);
     p0 = alloc_mte_mem(sizeof(*p0));
 
-    asm("irg %0,%1,%2" : "=r"(p1) : "r"(p0), "r"(1));
+    asm("irg %0,%1,%2" : "=r"(p1) : "r"(p0), "r"(1l));
     assert(p1 != p0);
     asm("subp %0,%1,%2" : "=r"(c) : "r"(p0), "r"(p1));
     assert(c == 0);

-- 
2.45.2
