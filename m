Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp582278nji;
        Thu, 12 Sep 2024 09:12:13 -0700 (PDT)
X-Received: by 2002:a17:903:990:b0:1fb:93d6:9fef with SMTP id d9443c01a7336-2076e422ed3mr43215955ad.38.1726157532805;
        Thu, 12 Sep 2024 09:12:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726157532; cv=none;
        d=google.com; s=arc-20160816;
        b=1J95Zh2uae9xz8wiT/XmtIg39SMddX1mR8HZhOpj08cvZwCduA2JC2q57o4N9A4VpM
         Umjvkv/FfCwl8W9ZGsNFKau5h1KtTyTQzc2Hz/1tlloc01PE0TrRS3p/b0M+Z5ZEecN0
         lAXt0+W91fIhrWyLLm7aoqLn6jnLX5547slkBHSq5ujwJonnPITvH65Qot4WgN5F5ebX
         EcSwEgkgwF3ue25xsnlVy9XTJ0voEnnXCCe/4AbxtMjWv0AKklfXWzSdXuL/KPSjGezN
         3b5nN6B67ZXoxJHi6s3/71cprFe65QunyGYeJYFetipPVrqr/olnK2eWDt+WVqesBuxy
         GVMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=I2RDX2fjFJQRiytlapcKfuKzsswRML3AeBvlkH5UKQw=;
        fh=ujiE8HSy6YTG7a3Z7CGLGec891YtQfFM1W/0TkY2zUo=;
        b=oS6dcN2DWWdXoY/aqAYEMyoYE62W5fAtSX+6pCbNX63NOhCZWOExWKx43BtqYx2qbH
         UJxFI9uP9vvoJp3dg/KXSqNhnwtg6nIrrl6yvK5nCBOfwXtTXc1kKU6IKJf3JQ8JbOqi
         WxVUxssJNTO4toqJxU/Gf2C84hPNKeJKziAisv8mhHKvhVqNHJp5P3PpGvZnFq/HI79v
         MFR8uc2IUjkZTZ79g+NJSpBSwnrNiDB/2Jtz8skfj+Sns+zuK/i1sG5cUiYME3t5aKcb
         oXqWpSpCcrk0e4xiMenHu74l4wvgb4WLdpeW2uSy6DgGBQlEHMP2XZSpCzxES3e+TS43
         3iog==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ugfiz3j/";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20710f252f4sor77435235ad.15.2024.09.12.09.12.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Sep 2024 09:12:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ugfiz3j/";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726157532; x=1726762332; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I2RDX2fjFJQRiytlapcKfuKzsswRML3AeBvlkH5UKQw=;
        b=ugfiz3j/hkaNrNRdeVz3FzRM2SzlP1uFkUkfKMGuMoc4jBWkmGA0SQmn2F7Eke2z9q
         rwY1PFS2SAcvYEqDYjGMuxCh6IKxTgNiWFftXXQVGEd0MlCV1kE/EOrfMtIhOufnrbTM
         8rWSrPWmqCJn/ua34vh8M2mxoIIbKcm+E0TYk98JJlIe/+2fXerW18haLAziKYuPldT/
         LZwz0zIfvSFeEW7N3E0sVrHyFiz5AyMotN1uWCTAfN/A+/K25/dOeSyj5yH7a54MO9PZ
         b/edq/F7HGY2++no+YYSRL6LwFlMRDPUWVvqM2heusFkdutYYm9OyMtjREExTGO5lfdI
         Nhmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726157532; x=1726762332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I2RDX2fjFJQRiytlapcKfuKzsswRML3AeBvlkH5UKQw=;
        b=N20cG+lf3Wq0eWT5kZsMvLWaLJjVRttrZQP/vsNEzS00ZC5jNG7LX0Pc3kh1ll3Pdd
         perWvHXnGqceB7OJnOHrN0oxz83+LH3jVyk6xKF3JPJoxmd99C8KAMq15eOWN6vNXpAd
         ugOFWbG+lhlSkhIW0sZw9bkVjlNcXzull29SWadH8kElVi+rceioBag7AN1wOJcas0qk
         8LqUT7Q+3LnfM9bdtSfQz2z3a5StQM+Q/DFHksNl2E6V/FML+FC4CZSXjxCPWPLZI91q
         OYuVr9lBxwF9xS0GYbEfMJMMwRv/lUQv0PVdPq01BEWuwXWmMlnKQl/7t1sofR2DzvIB
         EO3A==
X-Gm-Message-State: AOJu0YxJJrya8koNLqdqtnsmXsRb/QXAmbCt8VL21IqSlwOaoyELWFOv
	TZGcBhSI3jpt/jHM1QT+knhKjNSFEkGhxhXAL/gdD5RibeWvJwnL6fAtHfZl4QV74Q==
X-Google-Smtp-Source: AGHT+IGK4aCZmCNuEDtLotPImMG0hqQX92keeNScArTDh0uI/me/xdlfLavv9yxHnNep1l1nzhsFEw==
X-Received: by 2002:a17:903:2285:b0:205:2a59:a28c with SMTP id d9443c01a7336-2076e3155demr54911595ad.1.1726157532316;
        Thu, 12 Sep 2024 09:12:12 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2db0419aab4sm10868139a91.15.2024.09.12.09.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 09:12:11 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Weiwei Li <liwei1518@gmail.com>,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	qemu-s390x@nongnu.org,
	Michael Rolnik <mrolnik@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	kvm@vger.kernel.org,
	Joel Stanley <joel@jms.id.au>,
	qemu-riscv@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>,
	Fabiano Rosas <farosas@suse.de>,
	Eduardo Habkost <eduardo@habkost.net>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Peter Xu <peterx@redhat.com>,
	Hyman Huang <yong.huang@smartx.com>,
	Rob Herring <robh@kernel.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Kevin Wolf <kwolf@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Eric Farman <farman@linux.ibm.com>,
	Helge Deller <deller@gmx.de>,
	Jesper Devantier <foss@defmacro.it>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Fam Zheng <fam@euphon.net>,
	Klaus Jensen <its@irrelevant.dk>,
	Keith Busch <kbusch@kernel.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	qemu-ppc@nongnu.org,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	WANG Xuerui <git@xen0n.name>,
	Laurent Vivier <lvivier@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	Ani Sinha <anisinha@redhat.com>,
	qemu-block@nongnu.org,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Corey Minyard <minyard@acm.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 47/48] tests/qtest: remove return after g_assert_not_reached()
Date: Thu, 12 Sep 2024 09:11:49 -0700
Message-Id: <20240912161150.483515-4-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240912161150.483515-1-pierrick.bouvier@linaro.org>
References: <20240912161150.483515-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: al5E44s1fda2

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

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
2.39.2
