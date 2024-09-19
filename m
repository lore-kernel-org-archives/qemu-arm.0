Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp1161548njg;
        Wed, 18 Sep 2024 21:47:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWJb+dSBGM3pJ0ppKR0BFfdfQLeldCtgi1mfJn1dA8FR/xdsw057oPiMUvAqj/dOQ9NGU0ajRlSNbMWTg==@linaro.org
X-Received: by 2002:a05:6a00:22c1:b0:717:83bc:6df3 with SMTP id d2e1a72fcca58-7198e322adbmr3517419b3a.11.1726721272366;
        Wed, 18 Sep 2024 21:47:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726721272; cv=none;
        d=google.com; s=arc-20160816;
        b=ZIdHj4Q3oCbnhoA7R19EDqxPoG7J3216hUTgUQEnqjFWrqaRsLHjmMhN3CNSY2FXyw
         V1rsItLT0a5473lEmmLtMRD+AeUa//S6heMRu3AXGLamiupP4Icgo1KhqnqtCYXZaBJd
         xN8YSjUrhFe2HZCP9aGYBXIoVJYF3aJvpgoNV78pSCov9Yh1GHEQgn9Hx9xBxgR37sfZ
         CQFknsFw3eTvEy+9umlnXlces0d4ca/tLs7QL49v3emin6IXqR3+jIWbMcUMc+XElzZ8
         phdrGRwlX+lHV3ednAU9TMF4mQPhe+ZbwQzWl4Z/RP6GFXN4w9IeQY63EXCr5wpfS7xJ
         5Q/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=/nGORvbHJ+qdXbStyLX4ZDxj18G9D+mDlGJ72uSFPz4=;
        fh=XdEh9HU9E8pZZpceICcrVYGrGSkXGuhYgb7nZh7DLZE=;
        b=mK2kCyHqNU+VCGC7phh5C899VPtIz0Fbfn6Gu0Y410Q2/GhXsYzDglB98W7CicRt6v
         XVHi8mmKbTDxB0dlZ0yYIeLh5fdjmts3wxkJ42+Kldz0xR4avjBbYF1djk4qQqTHj7Sf
         1QhmlvQuuKjNwpWC0F9ntPrgFYC5g88kTLTY2MfNKfwepmUeY7DmlwK+dcwsxzAE4sG/
         zeBrKUGXRY74pCaj22mGq/XBV4Xn/17wrSzgxub9PbRFXtlAPlTChC6fNAvlP6vZnqL7
         2vl9+0UEBaxdBJlTId8feIFhDNBifm+m/D+Bh06nIbpTBaXDlxPnEd4LJBDZz0X3TK6E
         2WmQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hp0aDrUu;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-71985c7b41asor1750143b3a.5.2024.09.18.21.47.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 18 Sep 2024 21:47:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hp0aDrUu;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726721272; x=1727326072; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/nGORvbHJ+qdXbStyLX4ZDxj18G9D+mDlGJ72uSFPz4=;
        b=Hp0aDrUucMw+/WeT7FxVZNH8IehJBf0rxUBPee+5BTyT30P88c80RHnwPjWuyZebUZ
         YC/O/bMHu2o5ps1dczwZdQ7iy5/FbsuI1CEdZ4fb67T8rAVFTAqvkHFfoKQ8s7/UggkH
         iSa9Q3KXqxgNUmuL6pdSsLNlYyHaWba5t4AFgPcf+S9cdv3zbEjitdlDdrRXVaQ8X2bA
         I7v5v+GirMX9n7B87DK1kUQp+3yFpg39KfGpU/JUaECIwgGGfQE9G7edTytoiyddHXVb
         Ruoq5HZDv+8gvb7RsCsVU2ME3B599/KmxjTSiMSeTCYlANxw/0saKJoXajFaJQswaKKv
         UbEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726721272; x=1727326072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/nGORvbHJ+qdXbStyLX4ZDxj18G9D+mDlGJ72uSFPz4=;
        b=C1b3XB+KrvBdxfGQ/GYpwxIPK1ClzAzwKyCLJ/NLgHq3ST5QpsIo1Y6YrNBeyO4Jyn
         VjTLVj9JOuEi0KEGcYQVI06AjqL9jHIeLsumkHe4jrHeYC1o+2ym57I7bNMc8pM9bL9p
         iF9muL7e4vm76gMz9ovTbUgPHxhrVp/xoiSRW2x4VRQV/aTGlpIJYDzZLvyVaDZ8iu8D
         DVjvViGRT4Dbcmpa9PJXind1JIrx+7KqxuocB6J64YKhQBQaz0phg2xr6daH8Ilk05N9
         q8AG7ffuiC/lFFhUxrvzF6zGSslXXawf5eMOAEHzITn3vf3VrXgnZMME6ck7mSctEi9J
         HsHg==
X-Forwarded-Encrypted: i=1; AJvYcCUikPoWtvyULl1JRcWPYJ2UITI3Sxl0SrI9Zuqos+wUM1FznU+T81EiPfiiFfjT0HO/DonnufCSQZDuvA==@linaro.org
X-Gm-Message-State: AOJu0Yzwm+XZJNilcVYYWHD35+7NWysCTXmCRmZIg0hgkCFQ3/J0ez+Z
	KJRi99iF0cZa64q6EHTwNOlETsAGasaWcWyNVSq+IqQU58pb0fOSJJJHWjt4LMNTjQ==
X-Google-Smtp-Source: AGHT+IEDg2pn0QyAuvoiOwCdHYylFwrCXGUqq3XEUUTIp+6S2LNPDo0LRqpJhUmVkaR/AJ8UyQGZ3g==
X-Received: by 2002:a05:6a00:1885:b0:708:41c4:8849 with SMTP id d2e1a72fcca58-7198e2c832dmr2743657b3a.9.1726721271832;
        Wed, 18 Sep 2024 21:47:51 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944bc279csm7478601b3a.188.2024.09.18.21.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 21:47:51 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Hyman Huang <yong.huang@smartx.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	kvm@vger.kernel.org,
	Bin Meng <bmeng.cn@gmail.com>,
	Peter Xu <peterx@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	qemu-s390x@nongnu.org,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Klaus Jensen <its@irrelevant.dk>,
	Corey Minyard <minyard@acm.org>,
	Laurent Vivier <laurent@vivier.eu>,
	WANG Xuerui <git@xen0n.name>,
	Thomas Huth <thuth@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	Ani Sinha <anisinha@redhat.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Fam Zheng <fam@euphon.net>,
	Laurent Vivier <lvivier@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Keith Busch <kbusch@kernel.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	qemu-riscv@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	Jason Wang <jasowang@redhat.com>,
	Eric Farman <farman@linux.ibm.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fabiano Rosas <farosas@suse.de>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	qemu-arm@nongnu.org,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	qemu-ppc@nongnu.org,
	Zhao Liu <zhao1.liu@intel.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	qemu-block@nongnu.org,
	Joel Stanley <joel@jms.id.au>,
	Weiwei Li <liwei1518@gmail.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Helge Deller <deller@gmx.de>,
	Yanan Wang <wangyanan55@huawei.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Jesper Devantier <foss@defmacro.it>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 33/34] tests/qtest: remove return after g_assert_not_reached()
Date: Wed, 18 Sep 2024 21:46:40 -0700
Message-Id: <20240919044641.386068-34-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
References: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: baRjJL6khjZd

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 tests/qtest/acpi-utils.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/qtest/acpi-utils.c b/tests/qtest/acpi-utils.c
index 673fc975862..9dc24fbe5a0 100644
--- a/tests/qtest/acpi-utils.c
+++ b/tests/qtest/acpi-utils.c
@@ -156,5 +156,4 @@ uint64_t acpi_find_rsdp_address_uefi(QTestState *qts, uint64_t start,
         g_usleep(TEST_DELAY);
     }
     g_assert_not_reached();
-    return 0;
 }
-- 
2.39.5
