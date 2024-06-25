Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp699688njc;
        Tue, 25 Jun 2024 08:11:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWQ9sLSsU9VhCz1Omc/YpKh2zHrpf2LtPNTsGbhPSM5HWjIwzTN7TeVNGAeNUj64Q1/QrGdFpIM8TXw9Nbof6SPqc3Si1z4
X-Google-Smtp-Source: AGHT+IHC1qgFBKUovafhe+2ksEvWOr0RXS3lEDFCOOZglnAQUA8MpSLMkBgzcYBxlCVIRopyMD0g
X-Received: by 2002:a0c:e441:0:b0:6af:2344:5811 with SMTP id 6a1803df08f44-6b540afb170mr84055556d6.55.1719328290219;
        Tue, 25 Jun 2024 08:11:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719328290; cv=none;
        d=google.com; s=arc-20160816;
        b=r23/v1QpFkfJDtP8KgubMmj8xKr7Qbz0GAPFff4xaqL3wQ8j+oLYjgXLtTUQ1X/I3n
         YMHbM461D8E+ibnWYxI+kXxpe2b68FoK4dP/eE6zOLcmaW15+bqBZAYL5MVICcj93O1N
         vfQ0f0uV2hL0Ybeks85dhAV6hPdUslXhTlYoTXrkT5iTq69N69Nc11rNVBLG1TZkR62l
         Le6aAIYyXRfWfSziWrkaoSWUIYNsRJ5tsx4Eua9blj1p/ROjreOifQ6hVhg0Kbi6TG3G
         oeArjMoCp2yZp/qc7+48U0Efqu4RrsecmVYD0UcSfMDj4QpOqbQLMDfBYAjLGc958Pm2
         JKag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=zjJ8FiIwLlRUxUj7SFESB41Mk+cqdsNDBhRKpyJyimk=;
        fh=Q8KWZXFttfmlCde9XVpVfeo79ixusPj+v6ufa/rmkmI=;
        b=qCsv+ZT6vCTKFDtWXVp8UZul/jnbmG7YD8kgP3Z3nzfM92DlIHyB2OWRpP76AUHhOh
         qRGqeWOSiwg9Dp6QJIf+a697pqsoreW3bWe6QJv1uymWraInwwSPn56d7wLwh8HguJaI
         321xJYkqNkA4q0c/qCBcAGqI/xyNv0rEwaYr+LRdthomq+9/onWQcy/0uVGifT5CrqDK
         YwLBzWMfsKvDlw0TBCGAvzfq3Fc4n/i+nJquGIUTn9X+MPt6eTuS+EDAFPRCR9u48hBT
         0nfWU+d8rc1zXhC3c55Y6qCXkYGYHpauIKuwHIJLKZsLlBhIbLzlbYMls5gOq6Xi7pyM
         7N6g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=nC8LZfcH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b51eceb5bcsi106373516d6.120.2024.06.25.08.11.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2024 08:11:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=nC8LZfcH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sM7nz-00026C-KC; Tue, 25 Jun 2024 11:09:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sM7nx-000236-Be
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 11:09:57 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sM7nv-0006ab-Ok
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 11:09:57 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-70673c32118so2044467b3a.3
 for <qemu-arm@nongnu.org>; Tue, 25 Jun 2024 08:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1719328194; x=1719932994; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zjJ8FiIwLlRUxUj7SFESB41Mk+cqdsNDBhRKpyJyimk=;
 b=nC8LZfcHUog09sql+DU27aaJ4VtA3Jz5krMvJBXaBShr1Gt6X5a935NKgc5/LnJ/Ii
 bKEUpo6gFQRwymUL93jzNeLbuhAfsSBZxLUar7/mLOElTNB1zlmE3qbyetFZiu6h1Pdd
 nrdKslrs6pqv+YUr6bXGCgiw2OFgAsbmQchpTrBlT73UkQwFa0jqOuF6DrVEK2H7T6SN
 FzTRDQsOrIohPNpwiWvRts2u+BhBTmn4zL8vd5nATxcGnz+pbAGeDxNpEVAVDtG0SXqu
 /uJkBGck5uyRmNFdIa7Es5xenLuHZ8vbZ8sh85OXeeidHHhrpLSM2jDHIujyYAx0aO23
 iihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719328194; x=1719932994;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zjJ8FiIwLlRUxUj7SFESB41Mk+cqdsNDBhRKpyJyimk=;
 b=Y2cwtZc6xJm5rEQeOxacgzMhW06sMgPsorIolKtWoFUB/8n5raNqEh0evrZOkklyFT
 76Jc3Y/XCQjZu3YXfBDKQlLfZMnC1y9pNP3mCFz3CtnGIk/TZGNszq96vv5CQDmOWjOF
 ox81dlLrQwH5hqQ1IQ2t9aqItsgzui+LgqwIsTOUjKKm1Ihg4ju9Rgh/s0TTm076U6Mw
 bjkLJ1FvUGm3EdUV4DQeC5NvB0V0Lm84x522DOuyXF7GbOO+k2/mXbSE0LRYDkdBoyEy
 /WuTKC5tuthM9uS8hZA8IES2vSIk19Er5CceSTjFExzxrdLB5FduvuRQZHlWTFYKV9NZ
 jqUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5WZjMmwfstfTjiitiRlOtX938j+zq9Xb+504nbQk5etdEn43TO7bZ5ZKrdu7MYG1h8fZ0whnLMDWtacVqVCSlilWJ
X-Gm-Message-State: AOJu0Yx+G7tSDtMtqdD5sixJ3iVMsR4QLL4OHEo9l4s87C+OI09+GAoY
 0kbAYqO0VBYxqyGMB2pu8wU1UoyBN74R0D8HuB/cAYSXQGXfOAdpfxEjPStlWJg=
X-Received: by 2002:a05:6a21:328c:b0:1af:939b:d477 with SMTP id
 adf61e73a8af0-1bcf7ef1a40mr8239489637.36.1719328194390; 
 Tue, 25 Jun 2024 08:09:54 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.187.237])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70681722219sm4142636b3a.73.2024.06.25.08.09.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 08:09:53 -0700 (PDT)
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
Subject: [PATCH v4 11/16] meson.build: Add RISC-V to the edk2-target list
Date: Tue, 25 Jun 2024 20:38:34 +0530
Message-Id: <20240625150839.1358279-12-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240625150839.1358279-1-sunilvl@ventanamicro.com>
References: <20240625150839.1358279-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x42d.google.com
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
X-TUID: 9SM13HCCDZ9z

so that ACPI table test can be supported.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 97e00d6f59..b54b0463a4 100644
--- a/meson.build
+++ b/meson.build
@@ -93,7 +93,7 @@ else
   iasl = find_program(get_option('iasl'), required: true)
 endif
 
-edk2_targets = [ 'arm-softmmu', 'aarch64-softmmu', 'i386-softmmu', 'x86_64-softmmu' ]
+edk2_targets = [ 'arm-softmmu', 'aarch64-softmmu', 'i386-softmmu', 'x86_64-softmmu', 'riscv64-softmmu' ]
 unpack_edk2_blobs = false
 foreach target : edk2_targets
   if target in target_dirs
-- 
2.40.1

