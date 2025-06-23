Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2510098dyb;
        Mon, 23 Jun 2025 05:20:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWfLm9VdvM+/swYy3+LWVfJ4FkZk3NKUDADHH9oNCptTrAsqOddw0pJOgVJRxaJB8jU9Vo+Aa40wRlsKg==@linaro.org
X-Received: by 2002:a05:6000:2010:b0:3a3:598f:5a97 with SMTP id ffacd0b85a97d-3a6d2799df4mr9043122f8f.9.1750681225473;
        Mon, 23 Jun 2025 05:20:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750681225; cv=none;
        d=google.com; s=arc-20240605;
        b=RN9j7TqDYtqStzsjo8ZSt7xCeUhpUqIFT4i8q21uVQQuNr489VaJaHskBQo6IBJD2N
         JeWmifOHz9RfpsQJLOrQl4Snsfb0j/FsQSke+bnQhyhP8/l0uPZ6VePqcdXu/k8uOCrL
         ziIHHHS/XUBlCt/29681RJLhszZKYfscJUloEDPUADW0B//erSt3dKf2J12lru9gS0p/
         2Nbluzhgu3trNPP3nU9v2VX281AhNfGusm6R9C3o+LH7+7sDzJjXJiepcEez5NCCY2pr
         csYVHrdKOG0ONF/K4ZKa4IySP0jE/qpeIiM+KDh5Y30BChgSSOKJzgEHz17RbqsbGtxA
         CGag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=jKb7+45W8wr+DNWypSxWBKVEj0bAIAzVgg/1Er2vy8s=;
        fh=VP7ShvOmR5K4KXq9krxSwNsXM5IREKriIyqioZtZt84=;
        b=ICLDoFNBQkJ3p/B4ZOW0v2xVBS1YNGVxM4sx6nxyZGPkq9tgDAMIb4nvONrzpt4AlG
         176IRf8ClbIHCE2nBsFuNXm+RyZGuDxCJox5sqp1x8ZSB8t5sTrl9cklj3ZkR8RO81Ck
         G5Va/3yo8qJAN0+czOMz7ejjnHA5sNsMbGSJU1Uvt+kwH4BX5EFNvGSg2Zep5nd+xFpW
         1dTL6u3j/01Hui7Y2SmDUnss8YlzoOaJnpCxMH4wG9bQZJQKFsyAqCHHvj5DmuWS9djW
         JfH2IBTU6mhNnWrI4u5wcGBpetuL2GivL9z8d7ZhyNyKI9w0rQvpvGlxVH5Suk0YDvCw
         zQFw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qUd2gSom;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-453646dd7d2sor21112955e9.1.2025.06.23.05.20.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 23 Jun 2025 05:20:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qUd2gSom;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750681225; x=1751286025; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jKb7+45W8wr+DNWypSxWBKVEj0bAIAzVgg/1Er2vy8s=;
        b=qUd2gSom6hv77Z6v81wF4FyYoeYuKIVplcZFORfqlzvQWGD+KJeSbNSdyvO9abNYTy
         aHJglQRvHe6K7vYLjrmyhJ5HS7OhY/JMCW5eY8IGq3YGL+vVkFbA6vte9/YEl527rWtD
         Pn5DNWVCkiYBLRs9Tz3XKMZgFp5jR/w2e/XkjnHBlbfd75hk2/2qR2iN/NpyPBL3HH/8
         VVzPGXnGNfPYE5RsEONPV3n2YG9412ItfNS7K/hjzwMAYLLsxT0pt0fPVU08/H67MUyg
         cz2jka4Vtfm8HEugETzVhznsHc+IqKY8nPr1nu2M+fIpTzYbrEzKmeXbprQ3bLc0MOWU
         QoLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750681225; x=1751286025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jKb7+45W8wr+DNWypSxWBKVEj0bAIAzVgg/1Er2vy8s=;
        b=ZPd2z3tBaAUuuYTuLwPmT/+GR2D9ruR9koFXJ7b2sJunjEJ+WYbSlD95fBBFE6bhnq
         w5f8EzEZE0FS/gou8qnnnx6l8NN0CQ7sJY2O7dRKPAS7AAZh7XiWt0DiBSN0vWtN19WZ
         FTua4yQ2wR+AHAxqex9ygBvhufk2q2NRrRIZimq73KjYwhcfXRn1dmvLAx0sW1pp3R3v
         ULhLDvh7rPWdqGBt4czm5D7bbzOYVBxFqSPNn4+X8e4sOHYNClvep+gexdnYi1g1dFx6
         H5hBPxMd8PVNqo4nOt5IYcLZxbWKwIEIjNBjNZADGE0J0D0TYyNuLKISLQNI+ULqQIRK
         /YaA==
X-Forwarded-Encrypted: i=1; AJvYcCWDqqEWPdgxOzhzQZkVkSjQ3fjVXeZ4hxAPLPIPZvF+1NM3poXG0m53OePM4WOq4Wqnl6/a57gIZsPeMg==@linaro.org
X-Gm-Message-State: AOJu0Yynlw+OrYKGy3zWd+NwqH33s5kQ41Emuh+VPm9mIa9ExanLBoXG
	iB4Nd6Ivq/DvKXEkUsssWLGdsuQK7O6Du9s74XhMerasqh1Vi67c+uAGngXrWynYTK9cug==
X-Gm-Gg: ASbGncvAjXXKLLpFvHbDSx9/Iz++GOYksF87er813EeevWp/dsKTzi4H9DzpuqUdm9n
	qaPzs4xmi4T+n8OwhhbCXkNqfzHVNZogAzdmf+yYzpV2catRjL4SO83eRlaWvvl1Xxj/Znbdys3
	0UGkQwbMlrAlAwr2LhbK5Lk0t3hq6YAL8ggU75qs7TAdRsl/eEvG+H8BZBCEk1PX+tVGpuiw1O5
	B1Jy/uCADZz1y+O7PLZHUedftDed2Cg2ARG8exsdiuth9WuBdkEFBG3Su1A7pEHKfxcAkm5qtRg
	vEnB638bIfnG74kvziatkmrIU3NiM7ubowRVIGnHWdwIARcxaIb/wWK6kk3prT2Kynq9ATWktef
	rl6ywgWGYTimslKP2J8/31EVIlSuCApOQo0mvzVn/cGgpLmA=
X-Google-Smtp-Source: AGHT+IFKeCPKvJTY1oRMd774pzSdTPhl9ZbHhi8QfaLesPsg0MuI5svGt7VJgysSnyjP9cXdhnmSyw==
X-Received: by 2002:a05:600c:848e:b0:450:d79d:3b16 with SMTP id 5b1f17b1804b1-4537a7e5111mr3528625e9.14.1750681224860;
        Mon, 23 Jun 2025 05:20:24 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f189cdsm9446171f8f.35.2025.06.23.05.20.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Jun 2025 05:20:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexander Graf <agraf@csgraf.de>,
	Bernhard Beschow <shentey@gmail.com>,
	John Snow <jsnow@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	kvm@vger.kernel.org,
	Eric Auger <eric.auger@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Cameron Esfahani <dirty@apple.com>,
	Cleber Rosa <crosa@redhat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 19/26] hw/arm/virt: Only require TCG || QTest to use virtualization extension
Date: Mon, 23 Jun 2025 14:18:38 +0200
Message-ID: <20250623121845.7214-20-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623121845.7214-1-philmd@linaro.org>
References: <20250623121845.7214-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 6xxWVYqq0Fj7

We can not start in EL2 / EL3 with anything but TCG (or QTest);
whether KVM or HVF are used is not relevant.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/arm/virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index b49d8579161..a9099570faa 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2210,7 +2210,7 @@ static void machvirt_init(MachineState *machine)
         exit(1);
     }
 
-    if (vms->virt && (kvm_enabled() || hvf_enabled())) {
+    if (vms->virt && !tcg_enabled() && !qtest_enabled()) {
         error_report("mach-virt: %s does not support providing "
                      "Virtualization extensions to the guest CPU",
                      current_accel_name());
-- 
2.49.0
