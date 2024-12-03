Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3543162njk;
        Tue, 3 Dec 2024 01:22:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVYrYMMjw+3YipehFngblW+nH2JzidpCcmJX1yDP3ZmF3k/s1zBrwnzUF4D5Y92Ab2CM/lOXUYrQ/xLXQ==@linaro.org
X-Google-Smtp-Source: AGHT+IH3iNFtFCiMyiF9Au/WL6K77tn9WTfBAiAMHZrqCGWz6CBauNwAchJktmVRLMCsjRAFtWF8
X-Received: by 2002:a05:690c:4c08:b0:6ef:7640:e18a with SMTP id 00721157ae682-6efad2e7e6cmr28301537b3.31.1733217730754;
        Tue, 03 Dec 2024 01:22:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733217730; cv=none;
        d=google.com; s=arc-20240605;
        b=H9D/eBKCSIT1xwVmqGzrxh/z/LFYDkxlFu3m+R7fvuzcKvG9F4sLY5LVkRDjuJbPfN
         KcSqE+wE48LCzxyLZnx6OsOz2J523KOl5bGCSbB5kjY4yoRRVXb2fyKMQPGKLoeAHtUF
         irlSafhQn6Q3j0dpwsgLigSmmqE0PHFdiEUCNQ/JSnY2dAQj4hXkt4bVxD8kD/dwddOL
         eYotKL8EXJ5BKS71g+25qKng2NW8t+o6WnDtYbQdJR5v7nsCMox/PstYusI87/EfiyLj
         riNR97n5HhxsmlO0yi53rocTR6ewSnA5EvrWfo20dG3sYGWY11PuqieJ2brs4/KRwZ9v
         G7VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=XItCJo5+ANEXJJ4rNbIonoA3BAW/mx+bgexv+wsAke8=;
        fh=oARmRv50TNirerAudbBm/kJfe/zSHsiEKF/JaUKmbRE=;
        b=Jyo5ZAawIWifxTSEQhYwdzdLoaXwM4VKhwgTCODVXpHdVv7YkA7gAzqQwSitc+DOtZ
         rer1OHSzPRHINpM6HahNNSz7oPaflT1cId+O6g58kAE6BTIE2OdO7fQMCs4h6C9gatK2
         2VLuwJoEgBDgX2IbttqPBsd8LSW195OBkeiznpwGLYl0Z/9fW6oqHhNgE06E+r0EzNSJ
         FHL7qChSsGTSZM43OpcyZzArRglUgp1/PwJPTg5AtO8/em7dVg9yQol1QO6In5TrKzhY
         24+FfxOJQZndhkKJC8eANi+KkSqdjjad7lVPz68PafscMMxcX7CNTzSH1SIT0IlPqrQM
         rHOA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=N2xN9whe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=fail header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8755909casi156892236d6.497.2024.12.03.01.22.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2024 01:22:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=N2xN9whe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=fail header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tIP6c-0005X3-Dx; Tue, 03 Dec 2024 04:22:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIP6a-0005WR-Qv
 for qemu-arm@nongnu.org; Tue, 03 Dec 2024 04:22:04 -0500
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIP6Z-0002eC-CK
 for qemu-arm@nongnu.org; Tue, 03 Dec 2024 04:22:04 -0500
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-53de579f775so7337191e87.2
 for <qemu-arm@nongnu.org>; Tue, 03 Dec 2024 01:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733217721; x=1733822521; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XItCJo5+ANEXJJ4rNbIonoA3BAW/mx+bgexv+wsAke8=;
 b=N2xN9whegwIDXlZKttTtXksIKYzczI+I0Jmbv7nVZBIyuGBVcN7Tmi2O6VJLLfQDPh
 zEwYO/9i7jtMznAmW945cLWGk/eYXQUool/0nd3Ym7fkNyUTcaDWU21ZAPitgPzbBhoU
 O5anoe34/euS1/kX6P3978Yzr5GSNSnwqzBYEgeUc1qhTg0+jDu3e2I5UmLY0lWORPb8
 tjSJvn6jThaGJrrGVmjleLfJfO3uzsHCmI6rIndJOTPbUA7NGq0xg5gZ91j/e084ntoF
 1LraiKSjsNzYfDh5EMwmrntHuYz8no3BRRBJ7b/juhHcUlEOWjK0/k3BXXg0Pgj3grHv
 sOmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733217722; x=1733822522;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XItCJo5+ANEXJJ4rNbIonoA3BAW/mx+bgexv+wsAke8=;
 b=g4qPxBwtl0dJ9X7Y90OSjD7SGGwFWG65SBpHRpU67jn0TUAeyt31Cas196xx0YUEqv
 ExLLMq07cQ1mk4mUmZ5GSSUSi3u8XVqAwVA3m9SEC0HZ/Y4IvhsaOT+d2hzIN5nEIBhb
 ZTVSxNE1UCdCGD0jxkileXn9nKPP3dk/gu+K47xTlHD9YKVlRZImCynO4MG8oDfQ33kr
 mNJ87yYxmtI+n5fu6m3Ga5/Jn+pUiGTCAGSrZHvD46U1bU+G7fhq6SPijYMD/k8k8uXr
 Ny9ZpE5JcGvlgZ8Y/9WlVwWn5zIfKw2i8O4cjc02Oy2PLBkYKEyZudHzqT+Qb2BU+1XT
 bc/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXW2iyPKXF0Z567Xrte4BYExrVEjkI0A9J6rEiMDcCbE/ivXAOScroD7Rwegbiuuh4roOK3MMCqpQ==@nongnu.org
X-Gm-Message-State: AOJu0YysG6rjsqBxaO/jKf7NHmSd0BXmsbs6T6V8g7UXLZaUwhLw3ym8
 CVcQVVvOGOjVWuYGWZBhJGi3AOfvUlnDS2Fwvg9L7x4fi9o882cwdAIpP6Cj47w=
X-Gm-Gg: ASbGncskO7deFGRSmo/9IcV7V/2MSoaf6RomB6oQzA/N1Vyd0ihGcwLpVW3tSbJahGk
 yewcLZeEyIaAtXds0ff41nj80bMjF9LJiTq3Elo85Cywra7G1OTiCHpZmZfI0XZ3xojQWHHzc3X
 qwlSIYGvKWcbkuYdXMrHQzdjMPjCOFR2+5ZpffsQNbNrXlIVSfxSs4P4/o+ISkeVwKh1uN8hOFk
 eooPD0SsJzSDShBgIpo7YS4zc4t63iCGA5nD1DRTVIoiVYOciO52qXRw3+6zNbDtgrv6ZR3
X-Received: by 2002:ac2:5967:0:b0:53e:12f2:5e02 with SMTP id
 2adb3069b0e04-53e12f25e19mr1049931e87.42.1733217721439; 
 Tue, 03 Dec 2024 01:22:01 -0800 (PST)
Received: from localhost.localdomain ([176.187.209.146])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa599908be5sm591969266b.140.2024.12.03.01.22.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 03 Dec 2024 01:22:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 xen-devel@lists.xenproject.org, qemu-ppc@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/7] tests/functional/test_ppc64_hv: Remove legacy '-machine
 foo, accel=bar'
Date: Tue,  3 Dec 2024 10:21:47 +0100
Message-ID: <20241203092153.60590-2-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241203092153.60590-1-philmd@linaro.org>
References: <20241203092153.60590-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12a.google.com
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
X-TUID: 7ETRvNOEP4c/

Since commit 6f6e1698a68 ("vl: configure accelerators from -accel
options") we prefer the '-accel bar' command line option.

Replace '-machine foo,accel=bar' -> '-machine foo -accel bar' in
functional tests.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/functional/test_ppc64_hv.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/functional/test_ppc64_hv.py b/tests/functional/test_ppc64_hv.py
index 312248bbfe4..536a433b993 100755
--- a/tests/functional/test_ppc64_hv.py
+++ b/tests/functional/test_ppc64_hv.py
@@ -138,7 +138,8 @@ def do_test_kvm(self, hpt=False):
         else:
             append = ''
         exec_command(self, 'qemu-system-ppc64 -nographic -smp 2 -m 1g '
-                           '-machine pseries,x-vof=on,accel=kvm '
+                           '-accel kvm '
+                           '-machine pseries,x-vof=on '
                            '-machine cap-cfpc=broken,cap-sbbc=broken,'
                                     'cap-ibs=broken,cap-ccf-assist=off '
                            '-drive file=/dev/nvme0n1,format=raw,readonly=on '
-- 
2.45.2

