Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp699217njc;
        Tue, 25 Jun 2024 08:10:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUK3j+Z/7zbkjBMEi1lwLH+Yl7To3IaU580TUV+oJG7KOeaNGiNXLCuETW+j3ciBFhc+MX5ys3DGVxwp6ZPOqXOKhzYAmYm
X-Google-Smtp-Source: AGHT+IEBrs0AYqH9zMXBLKUfuA2t2cEyD60C3QOFBupHHRWbCPrP0WGsL8vwcFC1J88txXi0Om91
X-Received: by 2002:ad4:5d4e:0:b0:6b5:40c:dfcc with SMTP id 6a1803df08f44-6b53bfdc130mr106194236d6.51.1719328209494;
        Tue, 25 Jun 2024 08:10:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719328209; cv=none;
        d=google.com; s=arc-20160816;
        b=eDyijpTRfSviI2bKvHknnOtV/6Tk2egxVmeo20ZfOy4XNhaPuZQ6qXIwxawwOGhoCX
         mFvCvNDl1A71hGnC9Yu6CrfdioY8bFRvg91WmW/yTsHd+0CA1Q/8j9XwYXxBbI7RbHk1
         EpFbnbT38hGRT3KOVFq/9Y+TH4ITlprL0ZuVJQ4/xi9pe8rZUVpmi+vj8J9wk0EqXUgf
         xFwZzzk/5nQ59oMu88udQA4GEfdK8BTASAK7TJhyY8JP+6vE/ZlIh3AGQhokttQkcbVB
         jP/NQroky6NNyd+90SHkoC6uS039/i+JoOgqq1RYAtp4RdjB0LVnImCViGfal/xK5hqa
         QYkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=y1OPYRH+1jqNvqk3IUxnhH2KTsAwqrwXkGI6cFJybeA=;
        fh=LYNMxr7Nz3T622FqKOE3zQM1mD6iN+vY99RwtOYtRy0=;
        b=Adr92q6O68GIKBwoif3esl114K0ayoEgpyLDWVdtmzPpdiH4EvgxMIEN/qtU+bVT6S
         1xP/jx/Mpyyr4HHLBjfIzY94nA+NGR47j6jjLogHk9lskeO4HiURz27eX4M44CtZo6fY
         N5HwxmHSB/gjQJoF3td7h3kqA6D/gCP4bAa3KYEuhSc1hdxpdJrmGc6wbHebUg5vdHly
         xXWufO5jOhPrkmWuZi8l7V7ZB0o24c5Sn1LPT8NEjmgJAlou7feT0kRFtWX856C3stqw
         V1imK90Lal29M4xqmQTWl168VtrqZspyGvdCkInsqSwY+yOkMguQ3EX7KUiUnnv9hK5D
         tCPg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=EZJcknYv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b51eceb8d3si104455056d6.19.2024.06.25.08.10.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2024 08:10:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=EZJcknYv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sM7nU-0001UM-Gn; Tue, 25 Jun 2024 11:09:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sM7nT-0001Tm-2L
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 11:09:27 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sM7nR-0006WI-Hd
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 11:09:26 -0400
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-6bce380eb9bso3409390a12.0
 for <qemu-arm@nongnu.org>; Tue, 25 Jun 2024 08:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1719328164; x=1719932964; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y1OPYRH+1jqNvqk3IUxnhH2KTsAwqrwXkGI6cFJybeA=;
 b=EZJcknYvHj4noK6B+gj6iG9ChCmUO4FIgibvBUQFQ1jsKJ61/23Z+MNzvdffp1wil5
 32TAllwKyZxCwRsgN5LZNgJq9d4CokdkaTdgijhE6LVt92cSfwV9IknFIi1JGYvnU54b
 JtYv0zlO1Pc5hgHBzcZBD89ajtllgGuQLc4onqd3kI4n0039EHez8eQpcRekIN8aXnJ7
 sG4o95gn4RmTyG5HEVLuuXRjD3DnDxZ9XcftwV9x5hjT+0Kd/ev5immM0IQEmDU4zlAI
 e9eIGDncfCutlkh4u3nh6OBs2k2cTw5EZcz4KgJs1FZSsXqlpS5FLbeWd5zoFXzZ1bGH
 ehKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719328164; x=1719932964;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y1OPYRH+1jqNvqk3IUxnhH2KTsAwqrwXkGI6cFJybeA=;
 b=jHqAGVDYKyDE3NwQcStT/l9C6bY00I1/ARpGKznjkuOwKelxNSefzzNQyLd1+YlpZ9
 70ub1kE20zBstamQKzjs2cqw9KfKS5pebQ2IQJdXaODfVJ7dhpTjrgYhZGq36DuoJoie
 HPWapm4zKcAs7XXnaeonjMELMUYwy/eftByE8XFUa0RCdytCoNMD4Jq7FXXiGAcPpNHG
 Zpn/nbj6YbC5Xb2KGgRaJ2NrHuvy98tocGqTj75MnrGlbOombA78n7ZtjwoT22D4/++O
 XC++zkprihuYtS0o4jt3agsLCykGMAJXA+/sfd6quU7KYw8Wlrx28XYP6KFNrhO5OhtT
 t+hA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3LxN55lpYhBNpH2DOhvn4dHViOy2EKIv2FvJT0qZjlfJu6EdlgF9LBVPvIYVkJ/TZHTxYIFNdU9nIIHMNB6gOt2Wc
X-Gm-Message-State: AOJu0YyM9Kygfy1eDbLMXfFObeYHUXYlxU7vqSktKtOd8t4GOJlXTsMZ
 HdUd2pxW5EcRPGP/8inc+6ib9qklaqUTpTRFFX29ARhwu5KjTIUeUWTClrywv/w=
X-Received: by 2002:a05:6a20:8914:b0:1bc:fff0:322a with SMTP id
 adf61e73a8af0-1bcfff03370mr6211022637.4.1719328163837; 
 Tue, 25 Jun 2024 08:09:23 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.187.237])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70681722219sm4142636b3a.73.2024.06.25.08.09.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 08:09:23 -0700 (PDT)
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
Subject: [PATCH v4 06/16] tests/qtest/bios-tables-test.c: Add support for arch
 in path
Date: Tue, 25 Jun 2024 20:38:29 +0530
Message-Id: <20240625150839.1358279-7-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240625150839.1358279-1-sunilvl@ventanamicro.com>
References: <20240625150839.1358279-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pg1-x52d.google.com
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
X-TUID: 7tmQwYNuWFbI

Since machine name can be common for multiple architectures (ex: virt),
add "arch" in the path to search for expected AML files. Since the AML
files are still under old path, add support for searching with and
without arch in the path.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index c4a4d1c7bf..29c52952f4 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -78,6 +78,7 @@
 typedef struct {
     bool tcg_only;
     const char *machine;
+    const char *arch;
     const char *machine_param;
     const char *variant;
     const char *uefi_fl1;
@@ -262,8 +263,19 @@ static void dump_aml_files(test_data *data, bool rebuild)
         g_assert(exp_sdt->aml);
 
         if (rebuild) {
-            aml_file = g_strdup_printf("%s/%s/%.4s%s", data_dir, data->machine,
+            aml_file = g_strdup_printf("%s/%s/%s/%.4s%s", data_dir,
+                                       data->arch, data->machine,
                                        sdt->aml, ext);
+
+            /*
+             * To keep test cases not failing before the DATA files are moved to
+             * ${arch}/${machine} folder, add this check as well.
+             */
+            if (!g_file_test(aml_file, G_FILE_TEST_EXISTS)) {
+                aml_file = g_strdup_printf("%s/%s/%.4s%s", data_dir,
+                                           data->machine, sdt->aml, ext);
+            }
+
             if (!g_file_test(aml_file, G_FILE_TEST_EXISTS) &&
                 sdt->aml_len == exp_sdt->aml_len &&
                 !memcmp(sdt->aml, exp_sdt->aml, sdt->aml_len)) {
@@ -398,8 +410,13 @@ static GArray *load_expected_aml(test_data *data)
         memset(&exp_sdt, 0, sizeof(exp_sdt));
 
 try_again:
-        aml_file = g_strdup_printf("%s/%s/%.4s%s", data_dir, data->machine,
-                                   sdt->aml, ext);
+        aml_file = g_strdup_printf("%s/%s/%s/%.4s%s", data_dir, data->arch,
+                                   data->machine, sdt->aml, ext);
+        if (!g_file_test(aml_file, G_FILE_TEST_EXISTS)) {
+            aml_file = g_strdup_printf("%s/%s/%.4s%s", data_dir, data->machine,
+                                       sdt->aml, ext);
+        }
+
         if (verbosity_level >= 2) {
             fprintf(stderr, "Looking for expected file '%s'\n", aml_file);
         }
-- 
2.40.1

