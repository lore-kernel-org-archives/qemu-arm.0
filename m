Received: by 2002:a17:505:2e08:b0:1bd8:8c49:4f6d with SMTP id ya8csp150542njc;
        Fri, 21 Jun 2024 05:01:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW957cznyVH50X/xc8a0HMxLvLY4MrqKqGJdJCzs0au8nWo6vvHaYwIW5TSsl8kNTTeGTgkuFNSPgs/2mzp4NhjOiKsv3rk
X-Google-Smtp-Source: AGHT+IHwf6H+PIw6v757pWXIrzvDDiqe4dHE+kUvvurSvUs4fG86aUOHsqt0BQA9nD3d/KIMJHCt
X-Received: by 2002:ad4:4f86:0:b0:6ae:91:d621 with SMTP id 6a1803df08f44-6b501eac623mr75918666d6.56.1718971260326;
        Fri, 21 Jun 2024 05:01:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718971260; cv=none;
        d=google.com; s=arc-20160816;
        b=GcjWyazJ31YOdr7ipQkUXYXA2ZDGZu4BOZv/obafIEb9wdXOYHcCOZXnP47XdLj0Wa
         sb7KoifVajmxVQNX6j9ymIl5Q8J4GNuwj8XUTg4Vomwyu3yjbTNifBKQ9c0PpiXwr/wy
         33vXjgXgqwatwwNkqfhaKEFjWvC5nqBajchA0TRDPBQck7GxYhK8Hnd6pVN86vCqBG/N
         COKmZzFsRBT+B1ltYfiYxqj3qVJqokkGSxPrsa5DkhchZUxNAxrxGghjpEjvpEJt3EVn
         3fxTWNQhJZ8luX64811IWSEiq5RZp4ZYi2u9f9HgSzSx1Ib9yCON3Xle+lGCyrbudSUl
         Xy0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=HZycHu1GawJwjwX4WxIIeJpZLZFE0AM425lGZ17tEhU=;
        fh=qKd2r7ae3ex8RofMdMw3yR4VY0Xye+e2bFXt1B8DIUU=;
        b=qb9nsg/9147ACinltvDQ8qN+DbwZ752icaP/s5lmXzSwaSIj+W4YDETYAuKbwnnFUq
         triq5ixP7vvFScTyRlK3QBgdgiZWTn5g7BOxtq5kXwqPLAbkATCx+RweUvX2zWP7WbeS
         AXjicVMtbMhYjocAFoZJE+L5P0JiHvD1YnSYAbGT+AXEiZMIfu0IZUyIrHQq5QGRElGc
         6xrqTWk6kcL5nnAi/CI3jLpBAl9dWhFwelNdcz48jtP+c2HY7vlLC38lEv2a9ltzKCgY
         H5fsH7kSR8bR7QFHkEcwi28dirP6ajnRILm3fBlaJvCMab3Kl5ewy0aFTrUPKBlQGNTT
         O7dQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=IbUTkjIu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b51edd24efsi14044996d6.328.2024.06.21.05.01.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Jun 2024 05:01:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=IbUTkjIu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sKcvj-0004DB-Lg; Fri, 21 Jun 2024 07:59:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sKcvi-0004CH-6O
 for qemu-arm@nongnu.org; Fri, 21 Jun 2024 07:59:46 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sKcvg-0003Af-Jx
 for qemu-arm@nongnu.org; Fri, 21 Jun 2024 07:59:45 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1f480624d10so15595325ad.1
 for <qemu-arm@nongnu.org>; Fri, 21 Jun 2024 04:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1718971183; x=1719575983; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HZycHu1GawJwjwX4WxIIeJpZLZFE0AM425lGZ17tEhU=;
 b=IbUTkjIuHArbPDA+htOYVhJ+xW6dnjeYFUQwnk8tC0xIZo9Pe2HYR76OUlpVXwyxOk
 lYh+ZjhSVWdb8i3vimvsHe1bbbb933szig7IpKpRLez9ii1LnSO/m1p2PgPYJ93GN3gy
 XFkIT087Z9YRlgMpyWSKzTa3ZAl29TDJcg0G8AOZivWVGxEMiEAEb5rd5ZcohNyvorF5
 nWKK5DCAuioJQEEbHSVI7M9ZPjGbRd83ICPhe1aoUUYj82RfOFheQxIjHkAjEJ441H3D
 BFE5WhaQppDlgyjl+f6tMith4aXJwMcyF+arrs/HeFD4jDkG0HekZHAaA19Snsrd3l6e
 M4ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718971183; x=1719575983;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HZycHu1GawJwjwX4WxIIeJpZLZFE0AM425lGZ17tEhU=;
 b=k0ZnbewuQPvJ9LR/xZP4hNxhaAkuMQSj6YXsFf4VW2IVIlmKamkA88pVJmDVV2IKrC
 /el+iQZcWXws8/K7fu1nu2W/CvEKtZJCr6axCYSScLD1Gx9slJmh4OY5c++I9+buIUcw
 8fKrbU8h0zc4K1iWXua4uZXMQgXMGUPaKhZa0xdovB61nOYT4b2Z/PazLYSTWBKxnKqj
 7EX7tX+zOfkAuAYyIrL1ciK37nk1AeK2NH9VrT0pWp/A1QdVhpDkcgK6UXQ3m8nElSUz
 XqDs9bE7OCd4ppCs866HdY1vXOkO81cIn6kN8toP3mUotDpLqBpvNnonD3RDXUR6AWUy
 FoOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaFn1EVOAyENOKNHPSwP75MTVidH0WECEGnr6p6Gd9QDbxfTs4bH4yAlySVKtpwNoH3LwGefsScMpi3Ex7Sj+6S/c0
X-Gm-Message-State: AOJu0YyxhVk3pd1DeO4krythYHAMR7lBLpgQMi34lYxju8Qp5GPDcsBb
 K/gs6CsB9a+N7Ar4cIODTDDE2BNKl3TPAmqwC135PkeJOnz6y/8UBYNY5W4sW7c=
X-Received: by 2002:a17:902:d491:b0:1f9:a386:2bbd with SMTP id
 d9443c01a7336-1f9aa3d0af5mr99598565ad.22.1718971183111; 
 Fri, 21 Jun 2024 04:59:43 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.187.237])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9ebbb606dsm12422995ad.270.2024.06.21.04.59.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 04:59:42 -0700 (PDT)
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
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH v3 05/15] tests/qtest/bios-tables-test.c: Add support for arch
 in path
Date: Fri, 21 Jun 2024 17:28:56 +0530
Message-Id: <20240621115906.1049832-6-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240621115906.1049832-1-sunilvl@ventanamicro.com>
References: <20240621115906.1049832-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x62d.google.com
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
X-TUID: J8dn4hdAS7l+

Since machine name can be common for multiple architectures (ex: virt),
add "arch" in the path to search for expected AML files. Since the AML
files are still under old path, add support for searching with and
without arch in the path.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
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

