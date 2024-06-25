Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp699312njc;
        Tue, 25 Jun 2024 08:10:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXqnbJDHcyTY0IryMPaFm0Jf5uAdn0vTcSXd19EWFy26Ym+sSehZMrG4rMwqe30GIzGlQ4rnL1SXVHI8vfIwUFOzOFlD0fu
X-Google-Smtp-Source: AGHT+IGKhagoh4a4hsHsmrBow4/8f2yUu3L2pgLKTfyn35pCjJfPnKkD/RCi5hHkikqTt6N5SA/y
X-Received: by 2002:a05:6808:130d:b0:3d2:1bf6:c561 with SMTP id 5614622812f47-3d541c50f7emr9084523b6e.11.1719328226520;
        Tue, 25 Jun 2024 08:10:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719328226; cv=none;
        d=google.com; s=arc-20160816;
        b=JklM0iZdEoVis0EpUak3YoeeSLSIo/CSzjV+7KhcRshbxjqp29atSDtIfBoiIYBVgb
         nnvvd9pam2hg313jLPxezUjmVm17sqSRBbK7SC8ymblCsaaE16/krQoFY8IKDT0lAbOD
         aZuSQIc5lQWikE/7UBilsVjBjVO0+l/N1tqkpn2J04zwExNpkGJHCpPEjWbCKG8DtJpU
         WnUHv2Uo+kfhbWS6O6/G28eYW8GALiB26mF5LKF0hKsEAdgQ1OrM2EaEpW8WQDvYaV6R
         1iWFpSS2zVao23diO9yIkm4daDocD7eq9COT8RdSxlFuok0Z79gEiee67A40qyddvJ2o
         xybQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=SPyOu1IwMNogunIuIjBkDIc9zx4X6xTuQJ4OgT7GMUM=;
        fh=RkLyr+iP4eja62PkawawEvoqu00gFvMj8a37M9rgKnY=;
        b=mGygMJvXEA5VyjDopQv3DcRKRabXQhs8fTcP85VWIAKgkf8b/5z3hzzSDZtXmD4WRR
         AwOKv7qdyC+AqvGZw/ZbwMHrEQdFlyC24b7M0ZlFHIeBR9Zs8cMPDqNt13tTD7E2eE/A
         abJrCwfxDEOd7HedHd83PHewskOloeE52CwLmCdgf/oGigXbSS/epi3bwE6D9+ey/zto
         P7bn/EXYhAnMftgFVgFwcIXZTs73SCEwQColLq/T31B/SLNagor9DA1IMPd4r7VlTDWA
         fGgAnH3Y7pc/U0bEKKC1NNkdWSaJEwyZITXJBxT1vMCfxxG0lV1a0DytZPRIktgqkjFQ
         ZyHQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=gdcinpQj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-48f37e431e0si1505720137.194.2024.06.25.08.10.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2024 08:10:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=gdcinpQj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sM7o6-0002Ha-GL; Tue, 25 Jun 2024 11:10:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sM7o4-0002Dq-Fm
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 11:10:04 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sM7o2-0006bW-NF
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 11:10:04 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-70670188420so2318220b3a.2
 for <qemu-arm@nongnu.org>; Tue, 25 Jun 2024 08:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1719328200; x=1719933000; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SPyOu1IwMNogunIuIjBkDIc9zx4X6xTuQJ4OgT7GMUM=;
 b=gdcinpQj4ZvT3LyNE4xelFmA3twwUgYNl1XQ76IvVqil82T3qX0igbP5JblLH/MHhL
 F8SI81RL8OhVpaAZcJ+4r35RlRXvo+uT4aWDMkz9CQbIfZPSbpwU20xuZovYmKQnUU+4
 La5t61ryCKulmh8v07ZqttvD7sjLPUs5NnGuw8bCn+8cgXVhAwxkQi+EcTEQZBFbURyW
 MlaqWGmmMGqujGUUnKlodzyQmY74EUQ++kSFbavH5dt+6j9vPlfgL3/Z9hBAij/zFAuM
 UkityWCuT8vJmcylA86Hks15pzGGEkYNN48joi0HWYELDMIE9vIa3CrXOGGgKbmRrtX7
 IjJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719328200; x=1719933000;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SPyOu1IwMNogunIuIjBkDIc9zx4X6xTuQJ4OgT7GMUM=;
 b=bM/In38MV73nm55m3Z0/oRMS3u2KNPWG/tSJ1TjsFW7grcB7TBkR21Ka7tvNMve0dz
 IbSoqkMZ/ejoEoQLRLS+CpN/hlBc+0h2bXbVs6y5llLaUay1EKB7xc9ztFLJbrnGRKIW
 DcVLa4TciWN3UVhOfBeFYma4o9OeaIIvENGK6D/8m3dCn3hfilAG4ElB0q/oDvClCWlJ
 99TEP9AAiSh7XyiPJhpi9yIdRxM53UbN2mUoKaKR4UBZxn4n2CewPgKuI4c/o0uMLrC8
 zExcQ7QfDcVB9zbdH1033WOvQjAhUSk1m+3MZwucLtSY9RQINjjHWIvzf17vhnlhjmYI
 fIvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVI2hmVtA3m0vR3h3xdqFLZsZCf1F3Mm+yUYtqCyupthHhuxGRR4kwHlXoR/bqedqD+HHQMi/ISTJA7zWpMt7F4bOR6
X-Gm-Message-State: AOJu0YxOXAwPtd0oGDIS7Y6v96/qcFCbRTjkiWpdZKE3g+KPCbcKTMUA
 OD6eod3PlR9RlYBuq5atJ6vC/k20OJLV2EpfpkqpzSlt7lvVty+JwmM0SOJXcWg=
X-Received: by 2002:a05:6a00:139f:b0:706:3204:fa4e with SMTP id
 d2e1a72fcca58-7066cbd0820mr11148032b3a.0.1719328200343; 
 Tue, 25 Jun 2024 08:10:00 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.187.237])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70681722219sm4142636b3a.73.2024.06.25.08.09.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 08:09:59 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Sia Jee Heng <jeeheng.sia@starfivetech.com>,
 Alistair Francis <alistair23@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v4 12/16] pc-bios/meson.build: Add support for RISC-V in
 unpack_edk2_blobs
Date: Tue, 25 Jun 2024 20:38:35 +0530
Message-Id: <20240625150839.1358279-13-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240625150839.1358279-1-sunilvl@ventanamicro.com>
References: <20240625150839.1358279-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x42f.google.com
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
X-TUID: uVFi2dqtxBWE

Update list of images supported in unpack_edk2_blobs to enable RISC-V
ACPI table testing.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 pc-bios/meson.build     | 2 ++
 tests/qtest/meson.build | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/pc-bios/meson.build b/pc-bios/meson.build
index 0760612bea..8602b45b9b 100644
--- a/pc-bios/meson.build
+++ b/pc-bios/meson.build
@@ -4,6 +4,8 @@ if unpack_edk2_blobs
     'edk2-aarch64-code.fd',
     'edk2-arm-code.fd',
     'edk2-arm-vars.fd',
+    'edk2-riscv-code.fd',
+    'edk2-riscv-vars.fd',
     'edk2-i386-code.fd',
     'edk2-i386-secure-code.fd',
     'edk2-i386-vars.fd',
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 12792948ff..6508bfb1a2 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -259,6 +259,9 @@ qtests_s390x = \
 qtests_riscv32 = \
   (config_all_devices.has_key('CONFIG_SIFIVE_E_AON') ? ['sifive-e-aon-watchdog-test'] : [])
 
+qtests_riscv64 = \
+  (unpack_edk2_blobs ? ['bios-tables-test'] : [])
+
 qos_test_ss = ss.source_set()
 qos_test_ss.add(
   'ac97-test.c',
-- 
2.40.1

