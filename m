Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3543643njk;
        Tue, 3 Dec 2024 01:23:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWx0XZ7a7LEalE1a0Pwf1Yms5BKa6XwtGq1zEvESw0csXCN5JHQBEOTFM63+wGwtux2nHBAuuumZki9FA==@linaro.org
X-Google-Smtp-Source: AGHT+IGbNo4qgBOYyWOE8uqI45KvG5SuAECFBnmd0RR+U8buHl2Jgy43kDcbPvVKLrg+zQ3AmYRe
X-Received: by 2002:a05:620a:2416:b0:7b1:f1d:d0c2 with SMTP id af79cd13be357-7b6a5d66510mr213078985a.19.1733217791039;
        Tue, 03 Dec 2024 01:23:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733217791; cv=none;
        d=google.com; s=arc-20240605;
        b=WO0p/ZyQyH6WJrna6v7adGUqsMlZTuQqD9gc4JueNQYeppSX7TZtTaBEpaHGQWxntS
         CMoIn8WmOImJvrZ6RLjqQ9WjfWuegtnpq6ej3iXGx6boY54F9sbOOboGvzIxbJGhU/pl
         ZT3F91UTyjAIl7sj63C8Cp/YJDfk9tXqWR7IA5Ddni8TJk8cu8pJ2MrwRHWnA7+7fgo9
         HWG9G+kD91z4XuuGkNfxQJ3EpisjGRi/NnoCZE9KV9puEriFnW+jIk0HkPhB/hYyMtsf
         WR79EUq78eIpcaVb5teEDQw8U5wGmgMdX3NFwRA9EaXpon4GApEDTtkJ5wG3W69nVKzq
         VItg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=uLnillY0LwsA1bGIi96aGqNPMbJhHjhH+14EVXV96qM=;
        fh=0+jk1ymhYegohRQFAALGZxFLj82Tdef8RDWRTNppavA=;
        b=ePi7Tndc2lbVc5xHvKLS/PzHK4I992beuVkV7TsbuWvEtDR+Fdg8MgfcWmL5UvV5uY
         oXH648AMxfzrN79KUi7lrzrrfMYb6tikG/z7J7KPlJYgvBEHUFZjTkTI/zXo1489MB4b
         z/2br8zycyF/4V/XBwphD4s9+AKPUVuV0X7BhrYTEBAiRZwZGKBnPgrFeBPB1d/YFrt8
         xE4I+FdlZorfah2UECUcClhJjLlqUn4PusrMGzJK2dIuUZV4PcxNmO548+Ou3oxHP2Xa
         aAkqMNqW4KH3MkWIjiQmNbPoi4A4+DaZ+SdPCIe4qK8ou575O+93F5ZMQfdj5ZbH6Syq
         CaJw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BUFd7peR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=fail header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6849b2824si1388050485a.305.2024.12.03.01.23.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2024 01:23:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BUFd7peR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=fail header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tIP79-0005oh-4N; Tue, 03 Dec 2024 04:22:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIP78-0005oR-F5
 for qemu-arm@nongnu.org; Tue, 03 Dec 2024 04:22:38 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIP76-0002iV-QX
 for qemu-arm@nongnu.org; Tue, 03 Dec 2024 04:22:38 -0500
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5d0bd12374cso2494963a12.3
 for <qemu-arm@nongnu.org>; Tue, 03 Dec 2024 01:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733217755; x=1733822555; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uLnillY0LwsA1bGIi96aGqNPMbJhHjhH+14EVXV96qM=;
 b=BUFd7peRHkHPYt2kSwzpNFdFK0XR/pcaoCQJDxZLDQZEG0rikY7aWkKwGjZY5TuMsj
 jniqcUlGzNaw/mnG79PiC1kaenfa5Oc6GxfxSAWox+7zrqDQ4NKbdgwKz5oINwgyt9bo
 Vn1cNz5ie7sf+uLQheZMjnaQvCPcTbKYnx9lY84/DEzpXBHRc3pOkEkzEmtUSpclaSrP
 9OtZJ9XKmQ0ZghPhXFI2HdXAC76/o4CBfkvi6Aolvu6H+6hVXqnphroXkjzALJGbLRJB
 CkkqKbdL+eGhCmYigaZT7VvvwR/0y9ihBPPPPvtQzFWV1m2dFJZ5Ex0EK1ZQensWTLJN
 oPYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733217755; x=1733822555;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uLnillY0LwsA1bGIi96aGqNPMbJhHjhH+14EVXV96qM=;
 b=vEjUYOtCGffIMdLMDh5bdujV8KYKtYOlDtQxF/clKtKetp76PLSqxLwsMGgoJB+qVt
 Q+4jEyOOWZavg4UDx4fSsTSWXkZb5MrKoAvJ4ZIxDEIfQbVO9kQATQITsXapnjhTU4ar
 t1aprwiTegbMN97b5OuhLI/GKyM+27xJ6/b1KVksAFzC4Qc583+v4b7fkD7mj+oXXV/L
 KPRRXzGhjpNkIh3DhTIsc1RQ2wWL+vIDEeyEanCczu1x0KiWCmYulDF9UXQD38DRyQII
 UjG8EUKCgizdVRDBOJSmi3ekWzwHJUqpjAWnVGRiKMDVItwx2heQr6GavUgIgmyypnVh
 rFzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVxbYPjXz5MTi4r5LqlpezcyB+w7ob3/IU58rPeCGinYzHkGum0+ZVync+ZshRcXw5tcgVZTr2ZA==@nongnu.org
X-Gm-Message-State: AOJu0YxAmT8L0dwZ0Uxs9lUUq9nyveMokh+uvJvXR4gB7HMZ7wn5+aBO
 pDH3cgIWCTS0OXm1Ze5XB5a+kDFbR6Nf38Ti2duLPADUOxHmWUZom3K2ezvbqv+C/g9h333PAV4
 L8hA=
X-Gm-Gg: ASbGncsuiK0XeAWG4c+tE8bF8t2My1zRW6uJTlsxahVWiNZxnZIQHwwcYSFiqvAgs4c
 AERBwv3TJrySL//q/kqmVYbuwLJKLf7BDTg8eLU3Tbhm2srXrosCU9Wp9stYc5khwGAP9bmfwu3
 QpKOsfU9iNqJ1ahXqvmiXiFDywETnjMv4ADteJ0ey97slA6wuW7l6IECil0Nhy1TN0XOUJ21s0D
 mY0NiWv9bMHZJzj2kIOM620bHDolENLH+HhXqKw4vr/VNb4kFtEVavNe61fAWkaI2nmXEDZ
X-Received: by 2002:a05:6402:34d5:b0:5d0:e9b7:170c with SMTP id
 4fb4d7f45d1cf-5d10cb5c39fmr1604224a12.18.1733217755400; 
 Tue, 03 Dec 2024 01:22:35 -0800 (PST)
Received: from localhost.localdomain ([176.187.209.146])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d0bfa327dcsm4180475a12.83.2024.12.03.01.22.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 03 Dec 2024 01:22:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 xen-devel@lists.xenproject.org, qemu-ppc@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 7/7] qemu-options: Remove mentions of legacy '-machine foo,
 accel=bar'
Date: Tue,  3 Dec 2024 10:21:53 +0100
Message-ID: <20241203092153.60590-8-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241203092153.60590-1-philmd@linaro.org>
References: <20241203092153.60590-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52d.google.com
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
X-TUID: SX+GsndYqeA1

Since commit 6f6e1698a68 ("vl: configure accelerators from -accel
options") we prefer the '-accel bar' command line option.

The new form started to be documented in commit 8d4e9146b35 ("tcg:
add options for enabling MTTCG"); it is safe to remove the mentions
of the legacy option.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 qemu-options.hx | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index dacc9790a4b..11f0aab1470 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -27,8 +27,6 @@ ERST
 DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
     "-machine [type=]name[,prop[=value][,...]]\n"
     "                selects emulated machine ('-machine help' for list)\n"
-    "                property accel=accel1[:accel2[:...]] selects accelerator\n"
-    "                supported accelerators are kvm, xen, hvf, nvmm, whpx or tcg (default: tcg)\n"
     "                vmport=on|off|auto controls emulation of vmport (default: auto)\n"
     "                dump-guest-core=on|off include guest memory in a core dump (default=on)\n"
     "                mem-merge=on|off controls memory merge support (default: on)\n"
@@ -59,13 +57,6 @@ SRST
 
     Supported machine properties are:
 
-    ``accel=accels1[:accels2[:...]]``
-        This is used to enable an accelerator. Depending on the target
-        architecture, kvm, xen, hvf, nvmm, whpx or tcg can be available.
-        By default, tcg is used. If there is more than one accelerator
-        specified, the next one is used if the previous one fails to
-        initialize.
-
     ``vmport=on|off|auto``
         Enables emulation of VMWare IO port, for vmmouse etc. auto says
         to select the value based on accel and i8042. For accel=xen or
-- 
2.45.2

