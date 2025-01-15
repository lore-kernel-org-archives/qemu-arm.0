Received: by 2002:a05:7022:510:b0:92:a90b:6588 with SMTP id 16csp3170297dlj;
        Wed, 15 Jan 2025 09:10:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWmM7rCwPHOLa/VtlmAN+P56+Zgqk3GCFkJzxJwULVZZauGXikuIseMfyvhaO5FtXKvXvf9GM7d/EurBw==@linaro.org
X-Google-Smtp-Source: AGHT+IFjH3BXsLxR99rcmZC526pyzW81cTYjDNNF8A2CI3lVZwpd6er+uZ/1nhrSQjF4lVvVVUP8
X-Received: by 2002:a05:6102:41a8:b0:4af:d4f8:caee with SMTP id ada2fe7eead31-4b669ed1c8dmr3191465137.1.1736961042137;
        Wed, 15 Jan 2025 09:10:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736961042; cv=none;
        d=google.com; s=arc-20240605;
        b=dfN5SglpYieIjiw8quS8uOlB8z6DkSSvWQt5ROI6D9R9KFPAR9FZON7bBeTH1qdpth
         gYTyJPnjiiZw5Ov7CNKpjLS17/e2iHjwe6RJZngTLFy9TsV6tfNw8CUTeZFv6DEIlfLd
         qsX7Fp0s1LjjJTcYrYtJp0SQS3nmqbqtEp46qO5mX1cF/7U5yHZdM+aQ9hPdeogAhsh3
         Dp3f38g8tBTav//of3YR7JAxbuUFVDtdFko2PJsWgDAzyRF3tvTl8f4EhjqTuTtCizxI
         IthmcNthYY1+rNH1iuB2MT9fFEM5siNXf11Nc/zFXPA5qSXm05ENJ3YxgszTlOFyC0BF
         X4bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=pJ6BBYQDvZ7gZ5xmu7ZLpmPZjx7/EtZQE26i+5oao3w=;
        fh=mq1KjA5nRwb6cUZmPWBM3HaP7AWnljGDWKkO8W+dIro=;
        b=jPcRMZVibhaDJFPxNmwOtPwXV8dcFNiN1o4q5qXmyqVh+2F33AA2xpHymDLRbwfW4J
         2ausTKgGNoDxNv8bgueR3hw11UcxJGP0RFnmNK9Gw4VEIqeHb5U1JjzMZ+62pCyX3szL
         QKQ64iHAQHNCDWjZtXiU4s0NT7CI4tzji5vPwHbzjOdkiaS9HILgnBgQyILeoMkoxE05
         h1+gxDHgf/t7ti3Dhtofhgl5O8zjqtJ7AtCFgDkWngcXNaNtwe3rxbIxj+YGCiJ8/RRJ
         /Tn/27aX46XiaJBFRWboZQSXl7iKoP8wdSAyVPYsUxLxxjPqsDMEdtp4G4cia0S+vdK2
         6Qug==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="NFZ+9t/l";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b60929c3fdsi4246558137.278.2025.01.15.09.10.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2025 09:10:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="NFZ+9t/l";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tY6uX-0007LG-5o; Wed, 15 Jan 2025 12:10:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tY6uO-0007Em-Vo
 for qemu-arm@nongnu.org; Wed, 15 Jan 2025 12:10:29 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tY6uN-0006Wm-Dl
 for qemu-arm@nongnu.org; Wed, 15 Jan 2025 12:10:24 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43623f0c574so50095635e9.2
 for <qemu-arm@nongnu.org>; Wed, 15 Jan 2025 09:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736961021; x=1737565821; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pJ6BBYQDvZ7gZ5xmu7ZLpmPZjx7/EtZQE26i+5oao3w=;
 b=NFZ+9t/lvyR5wHBtZc/Vgx8NmuChbuOH5YgHmTPErawSpCJpE932V5944AMzYSH+RH
 5fUCiM8Jyy2lHVdggxvpwLHzOILNkgm1FvkG5Dlxh+YcpEd5qrJ+BLyaDvZyEH4YdmA9
 avhOTY5Czypta714qoPW6ut4tfNmnuEFKXOtMdXL00zzDCQjknDOgE2m9cGpvqCv4PTU
 Fj6k9PosUBIvfeYsj3xiCoOajprmtk4Tm9xef7Ih/WxHQaqeY5Qf44pLBlnS1ch1dyi+
 jHg0mq13n9FtTdBHX/CPwXhg6O9c+QsqTovgay7Mytdvxh9NJL4uR5CDD6n2vPjWI2hj
 W0aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736961021; x=1737565821;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pJ6BBYQDvZ7gZ5xmu7ZLpmPZjx7/EtZQE26i+5oao3w=;
 b=SKerzZwjrpBMrXMrJkHibiCdtITn1auRYLh3YnO0hJ1T6vo0mU6eIj/sl/Us90DTMY
 mT3cKKuZeXSfFr9PsbIDi9wvU/HbcpjzaYKMi50zaqqsfqzxs7txQuuJrKz6DKNnGvin
 sdM35sv2rdwD/moUlhyCQJ69T2kwTMEswo0zQ4OkzBZ68ZdYs0Y3ERu6g4VvMTrX3DgE
 LeoKy+Xl5fwNehCHuVb+Q+X0ehf6PEJGaNft3WHj+LLRMYnblRNiC2eABw6aYwp/hZ2L
 3JPLvozxKczmdH8hrhkdT2ASzM630xC9nolwaki7nb3p6ZyeAtrYJwg+RP5zBcjN2mlQ
 D8rQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlTHwILje4aMXKoyHxFjdL5iuaxGMleElG9ssBgUSwILGVT/wtmx33bkYcDC1UjqtPKgq3sTwOuw==@nongnu.org
X-Gm-Message-State: AOJu0YwP2AYdBrohn7oMMtsToKPVl47u1rBBKK6CXVJo7ecjMYgroomK
 Z2jtJ5HkujrZsOAVDW62ScAlG1tDcf4fo2gezxeu7jebZnAsWwu1o2CAGZpPgqk=
X-Gm-Gg: ASbGncvQydyac1/sdMQmTz0RaVFuitk2Z4KRhytpcIdQrP6ebl8lQGGxZAsPtHWKSyr
 92PDvZrlUhArImQ1GG4eosdZz+hF34W/UR5AjqIUE7uv6avIKOEr/6v8T6d5Vhzhz65Uv0PrlY3
 nyOp7tf5vi+XCMiJLbhAJQ3tcQKPmMQfED9NuUlbE0YySW1uEx06NwpsYKAwZ0BjHufmxpgLXeg
 sS6h72IPARNELBFI+okTzkEZNWxbT2uoq+IVIrp1hLPeocleVWhru/koFkeXz4etMkjiH7KVoWi
 PVCl7gOZ12dGO3FfeFm/nscfk8sqhGgv7ws4
X-Received: by 2002:a05:600c:3b8a:b0:434:f270:a4f0 with SMTP id
 5b1f17b1804b1-436e26dda80mr229248135e9.21.1736961020558; 
 Wed, 15 Jan 2025 09:10:20 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c75290a2sm30508755e9.29.2025.01.15.09.10.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Jan 2025 09:10:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ani Sinha <anisinha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jones <ajones@ventanamicro.com>, qemu-arm@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 02/13] hw/arm/virt: Remove VirtMachineClass::no_pmu field
Date: Wed, 15 Jan 2025 18:09:58 +0100
Message-ID: <20250115171009.19302-3-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250115171009.19302-1-philmd@linaro.org>
References: <20250115171009.19302-1-philmd@linaro.org>
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
X-TUID: J9PfyGYhZpnZ

The VirtMachineClass::no_pmu field was only used by
virt-2.6 machine, which got removed. Remove it and
simplify machvirt_init().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/virt.h | 1 -
 hw/arm/virt.c         | 4 ----
 2 files changed, 5 deletions(-)

diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index c8e94e6aedc..27c5bb585cb 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -120,7 +120,6 @@ struct VirtMachineClass {
     bool disallow_affinity_adjustment;
     bool no_its;
     bool no_tcg_its;
-    bool no_pmu;
     bool claim_edge_triggered_timers;
     bool smbios_old_sys_ver;
     bool no_highmem_compact;
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 3bb8a9c7bd6..0080577e1a9 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2262,10 +2262,6 @@ static void machvirt_init(MachineState *machine)
             object_property_set_bool(cpuobj, "kvm-steal-time", false, NULL);
         }
 
-        if (vmc->no_pmu && object_property_find(cpuobj, "pmu")) {
-            object_property_set_bool(cpuobj, "pmu", false, NULL);
-        }
-
         if (vmc->no_tcg_lpa2 && object_property_find(cpuobj, "lpa2")) {
             object_property_set_bool(cpuobj, "lpa2", false, NULL);
         }
-- 
2.47.1

