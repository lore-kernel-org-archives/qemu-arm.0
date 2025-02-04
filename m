Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp183681njb;
        Tue, 4 Feb 2025 04:50:15 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUca269R8PFiq1fgG4E49y5+xnpBnrJyOQWO6c/2wt0r9cRQQSpJ92tCwEKccDgXyLW2OpvuF4MJgCvPA==@linaro.org
X-Received: by 2002:a05:6000:381:b0:38d:b113:e9b with SMTP id ffacd0b85a97d-38db1130fe1mr373591f8f.17.1738673415509;
        Tue, 04 Feb 2025 04:50:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738673415; cv=none;
        d=google.com; s=arc-20240605;
        b=JjDMQul1RD8Im3qSHSSpb5oIOJW/iDmVWuvhYAu0XzQ/NUaGSwf4WhAZ9Ll7z/AZYh
         YwwTsSp2nhLPU4s9kO4AU0Nsd9oyW+LFvuFg5mf8d0LT0JABmkIFnvFubh6EgatE4OjF
         PCYIlJ/ZmXSLMhkmxmR10awjuG3qPeg8bEE8Cq53YG8Nzwp9cR76L+qtmP3ShwcUf5Jr
         1V+niMkE3RSs9jIhzWxsAUF1ExKtsvaGOm9ffspFmy9uVE3cX1qiRBnaS34D0xlNz5xu
         RjS191q/DG5GQu/BcuOa7bFUVN0VOpQ9W3/dpO0VhXua8+MwVpELuJTAKpEv5tE33irp
         Ha1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=R869ff5rZccFCzTyQxhPv2mn876SBy48z5OTtaNMV/s=;
        fh=V+i6YWt5IsA4fpl6+WNmmu80Nb68vmp6LuIBNycVGS0=;
        b=RLjKgjpSgTXEZ8YswrdAPowkhyMo7tSqxxXWBSUJCIoXNo0JFyrY0wDVI7omPSrSi8
         2tZWH8np56xaDX0NTvlZXDzhD+2+LoR+wsJlv2nMQZYhKtxIElV1kMDa7hh/xs7DCOON
         OHernuKeDmnzwnl22eqiSPAfcq63clloQMgtYvj8+bgKBVcJVk/jaXyy5nfNLXxqtqi5
         kIXsRN/M3Xj0HnmE/FPDjxBfoV552cJffw90nnwhVYavO1oGVTLfo8rbXalrhTdGyit9
         MsgoZcLADuzZQh8fI6Lc/CwKjNqLkVOHVW4UkV1hzAjL8Wd26aXShrivV8PFVJ7Pgm9G
         M/2A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TKrBUEkr;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38c5c1018cbsor4199061f8f.3.2025.02.04.04.50.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 04 Feb 2025 04:50:15 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TKrBUEkr;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738673415; x=1739278215; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R869ff5rZccFCzTyQxhPv2mn876SBy48z5OTtaNMV/s=;
        b=TKrBUEkrdamvYxxgnaLF4wXWe2TXtcHbXzsJUEYxGyzPTM2jdGd4Y5z2KkwxugoeXa
         f1VZZf+DUVRWOqn7jCuxxwXq3HOtestgIx2iH6Gu2EbpET2uoIlk7h7lNLwTCPq7cqzS
         14I66E8M4pcsQM36v2zvkWfwOApp/6APv/bxNG02zMeClYaeHHLZWcBA4idcwHtcBHC8
         CZ1CcvapLhYvjXmt6JpUBuurNNxbotE116Lukb+NQmyWnv9Gxu1nTswLcA40WzHGUigq
         Do36Dl7zCGDU2AikiYohjQcccN1ZGTcKIqMYJQaNswtHpaMY/Skgjpm5rzk5wM4AjSne
         ZQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738673415; x=1739278215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R869ff5rZccFCzTyQxhPv2mn876SBy48z5OTtaNMV/s=;
        b=JeTxegahjnkybecFjj46KO1ifNrq2z/tczqtEfguwMHqueK5n40xcFk7KmartCscPB
         Bc3DneTkiKk7/wTlsmn3xor7DOHuk/OmrRAhEZJel62Y9/q5zSB6V7nFf0/LTU5DCoOh
         tfJLQvhKedY6pZ6q5RqhZY3ZBceKg1A9PPhByoNt6CIrfJwJqASLqnjjGYGNgvhmXeTW
         knlemOhRHSe9eE4hlRwljRqU5e4IwpiPeGGv4dKnjHJzqUI8JzlDhj7LiXWVrPbvPnbB
         ncaHYPN8aOj4uIoVTDTudqwtQ7eX31hMNd+OKD0PwDZ+MMWshcwBKv1Qj288ltVTHNqP
         cxUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvbSfsDHhV+COjM9RHn5UxQ9PLL6PRs1535/eGfPBkYmVvhSXrYJzBfiXOe4EAEgdot8prScsRi5xcJw==@linaro.org
X-Gm-Message-State: AOJu0Yw6Nzm4Cd8vvMbh6ikpao0xOZaCIUQ8uL3evjWRMMrw1T04djj9
	+wgDU8lPhl2u76qnF5QHVwlNsqJDj6gm25HWP2z/u708GZs5kv5xmRl1tR8n160hXPDGO6L9D0A
	7QIE=
X-Gm-Gg: ASbGncvuZM1DgpcJlyWgNLQLCxJeDVfJUMU/24JbveuyppvqOul7nVkhWnXP3NT93bp
	IA50V7b+Ytx+894gVdkSwkr2SvC7ddG9TzhMAkuNee4Io9iXEC628HDNQhAvvKmqV6g1Io+O3xV
	Fom08jcEAFPYAgx6PHaX3EVKAqD1efjnMbrNl8l1VePnMPNd8gDor/fdTHjzalHbx5wwZeED8/Y
	tVVwGVrj6OoKUgcRx19LJtnzzKg16Wz83itWAUepEzAUE7ikehf0YJNjc6GB2eA9PU/oRJ4qNOP
	8QYNww2Z/71ETSU/qTf9gQ==
X-Google-Smtp-Source: AGHT+IFy5V1sEUSCOvK8E5G5DGfVIJFSa43LRtsvOI53ZRMtIr6WvrFHSE5BDrg72O3QKV298X1ncA==
X-Received: by 2002:a5d:47c8:0:b0:385:e1a8:e28e with SMTP id ffacd0b85a97d-38c51931ef0mr19713816f8f.10.1738673414994;
        Tue, 04 Feb 2025 04:50:14 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c122465sm15757919f8f.47.2025.02.04.04.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 04:50:14 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 3/9] target/arm: Make CNTPS_* UNDEF from Secure EL1 when Secure EL2 is enabled
Date: Tue,  4 Feb 2025 12:50:03 +0000
Message-Id: <20250204125009.2281315-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250204125009.2281315-1-peter.maydell@linaro.org>
References: <20250204125009.2281315-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ze9tLJMNLF45

When we added Secure EL2 support, we missed that this needs an update
to the access code for the EL3 physical timer registers.  These are
supposed to UNDEF from Secure EL1 when Secure EL2 is enabled.

Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index ac8cb428925..7ec1e6cfaab 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2387,6 +2387,9 @@ static CPAccessResult gt_stimer_access(CPUARMState *env,
         if (!arm_is_secure(env)) {
             return CP_ACCESS_UNDEFINED;
         }
+        if (arm_is_el2_enabled(env)) {
+            return CP_ACCESS_UNDEFINED;
+        }
         if (!(env->cp15.scr_el3 & SCR_ST)) {
             return CP_ACCESS_TRAP_EL3;
         }
-- 
2.34.1
