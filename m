Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp557622njb;
        Fri, 4 Oct 2024 09:23:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUdDciVVoh+RwDTrDov3B7R2yEBbsDv+fwTlTQofk3rbUjoRUFtq7Yy4v2YESTvV4eER3RRsH+qo2ywsA==@linaro.org
X-Google-Smtp-Source: AGHT+IH4owRi/D8WOHxbE+J7tLCGx13JF/JKxUubN65oRzG1M55Ta2G0/OoCkbPJZ0GEdnxO0Jh7
X-Received: by 2002:a05:620a:25cd:b0:7ac:bb36:5667 with SMTP id af79cd13be357-7ae6f49db17mr549000185a.59.1728058986436;
        Fri, 04 Oct 2024 09:23:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728058986; cv=none;
        d=google.com; s=arc-20240605;
        b=KdQKIWJB8Y1wO2MJwXqIx09i3gVqNwQ5K8a1Q2hZmsxvxmAQpfmdQ+n//gLkrxfc5y
         BUdQ00Lq3aMUl68tJi8IgChoVIF0pNzkYDQ1RMZo+AgWUb2d6JOaUT/W1pEoEGcWCIUR
         GYGxTPLjNvIKqNOYM9pYwgVLHmYdjTz6ptzD3oCy+bfF1EH6iXlIpwjskbkn+uOO38oS
         uJGGAR5vNeWmUzXYDNutyDkRRhOntFxNSXF/5eeQDD/ZGO+r8NqkZEF0p33UwN9axOzh
         S2S8ru7dQOdH4D6MBLH6ALwrYChtQt/eIol5ec64prtVIubkn6T9qp7SlAdvsYNpRegO
         a5Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=mLznYmz+P7vBJ8H0SWJD6m73dHSWXSUG/rbFskhTHcE=;
        fh=EGqLJCICgVNaRycRxBs7LI5EgGw9vhjBDbqGbtqljLo=;
        b=O1Dnpxe62+IiM5bR102t69g41Nt3lyaSDYiDItwY8d3Oernxm/Ox/3iqJ4JKlJ0Sab
         4VBGE6FNczIRYJc7xE38u2nq4QSEh3eoS1ksR7Q6UxlnTAs4z2GBGNBHKe/Kv37ORvma
         6+Bu09JUEE4ZHiz9Rn8VwEVoX+IX47q7iPlv6atRZZoHRkBwmY8P4zKGwYBbfVG/j/dv
         6ZKOpT71nzgWwGrulhcpHfKGqDhmkvKRw1iNswxVtO3yo7fo37wbGY6Lp3yS31ErahIi
         WMR8CTHDVwx4BCpvukqjfgjtfMoZLLWnWhV9kYmK/F7MwUAVC3amOXPLs3S+9HHdjzF0
         AcTw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="aioN/uev";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7ae6ba08a69si365370385a.518.2024.10.04.09.23.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Oct 2024 09:23:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="aioN/uev";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1swl52-0006BG-O0; Fri, 04 Oct 2024 12:23:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1swl4n-0005cK-KH
 for qemu-arm@nongnu.org; Fri, 04 Oct 2024 12:22:47 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1swl4l-0004O7-9m
 for qemu-arm@nongnu.org; Fri, 04 Oct 2024 12:22:44 -0400
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-53993564cb1so2705902e87.2
 for <qemu-arm@nongnu.org>; Fri, 04 Oct 2024 09:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728058961; x=1728663761; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mLznYmz+P7vBJ8H0SWJD6m73dHSWXSUG/rbFskhTHcE=;
 b=aioN/uevlUgE3ioqzYydQ7BAzxp5k+EVy504y2/wi6XeF7jxiAIs1nImK/gD0g/GL0
 MV3ZxhK/V+P+91NcWyphMW3u/G4zlBAZn1R/6/JmkWdW6A+wtv06tus0vNSL6pZrjPOE
 WCuVMJ5htETLtfziJ7/m21quSjpJOXsSPjb732v0bkYth2HOUfDuQD0Jw5UDWjW+vKqT
 4bhtdDIUaBZmMS/LRksHJUqY+txsscTeGoUk5cEhb+TwOd7z4cbv3y2hoiEjcrO+TLii
 fiwDGKINSaHKDc5ua7ttqaT+6Mc29uvf4iX7qx6ITsYXZuBo3CaKK/jXnCAdlsba3x3p
 Xk+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728058961; x=1728663761;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mLznYmz+P7vBJ8H0SWJD6m73dHSWXSUG/rbFskhTHcE=;
 b=DPs0lT0QBN0a6pVZ5/XhrWxdhJ2DcryiS1Zmwj8MYnF99gMQdShnfdePDrz1FGWatl
 OVCWa0oCp5x2oKqFAXu7ETwgEkEX7v2VEw/Xk3u/CyJa0up7Q2HX2DD/3+0iorPxfFPC
 dAmLzbVo8XMoVIywh9fEUP8ICMy7qaVuxqnPpbprufDsLjFT0hDJDdi8ElWKZtoKV9oA
 OSmu7eac+u2E1UpzDuSmAEJLYZ8Dg9ds17rHFKlqX12JI9ov7Ryw6zDY4iAR8ddNVKRu
 H3z1mdoLm6nPMHvSW4AyKrwODdUiOFMCA/qCN64MO0Ybyba8r8OMGC7lS4NgOw2NK5+B
 zOcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOqCV4iYbICwusTQ4f/d/MWVhA9uvwHr4YCVuutjG147y75bmS1rEsC2bvoGzaqC+7XObFFTspng==@nongnu.org
X-Gm-Message-State: AOJu0YxT+EMDG5uj6LGjVngJ3VZjixYeIcqAG4TpvTrNu9GW9A2rGiV7
 VNOkPoX9DYryR7QwzJuqnnobsuJndxgqQDv7OwrrQpqtGo+kiTDq+5jQpcNNXFQ=
X-Received: by 2002:a05:6512:3d10:b0:533:4522:7409 with SMTP id
 2adb3069b0e04-539ab8c2165mr2174945e87.53.1728058961531; 
 Fri, 04 Oct 2024 09:22:41 -0700 (PDT)
Received: from localhost.localdomain ([91.223.100.208])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539a82973f7sm464073e87.120.2024.10.04.09.22.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 04 Oct 2024 09:22:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-arm@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 4/8] target/microblaze: Implement CPUClass::is_big_endian
Date: Fri,  4 Oct 2024 13:21:14 -0300
Message-ID: <20241004162118.84570-5-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241004162118.84570-1-philmd@linaro.org>
References: <20241004162118.84570-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12d.google.com
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
X-TUID: qMAs7GZVtjur

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/microblaze/cpu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 135947ee800..93c0c6d36c8 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -119,6 +119,13 @@ static bool mb_cpu_has_work(CPUState *cs)
     return cs->interrupt_request & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_NMI);
 }
 
+static bool mb_cpu_is_big_endian(CPUState *cs)
+{
+    MicroBlazeCPU *cpu = MICROBLAZE_CPU(cs);
+
+    return !cpu->cfg.endi;
+}
+
 static int mb_cpu_mmu_index(CPUState *cs, bool ifetch)
 {
     CPUMBState *env = cpu_env(cs);
@@ -433,6 +440,7 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
                                        &mcc->parent_phases);
 
     cc->class_by_name = mb_cpu_class_by_name;
+    cc->is_big_endian = mb_cpu_is_big_endian;
     cc->has_work = mb_cpu_has_work;
     cc->mmu_index = mb_cpu_mmu_index;
     cc->dump_state = mb_cpu_dump_state;
-- 
2.45.2

