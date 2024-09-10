Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1444604njb;
        Tue, 10 Sep 2024 15:17:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW+2ZWrgSdJqGMz5AKNvzfz4pJeRJb+zo31SKiMGzk45sHXKE97ItaUd7ey2p7KQenbP8S6nUyv2S+UGA==@linaro.org
X-Received: by 2002:a05:6a00:3c93:b0:718:db99:28db with SMTP id d2e1a72fcca58-718db992998mr22919780b3a.22.1726006625510;
        Tue, 10 Sep 2024 15:17:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726006625; cv=none;
        d=google.com; s=arc-20160816;
        b=UdTS/HP44uM5GTyvZOsA6THzNtc6md/czWrXerUpug4NplLPczDd/Tj0hNQhC5T0JO
         geRPnZaJRcSQZFe++/S3yZE3Q7if+JSdjw8v9pMuO45JkANJzCuNunVJC384106tuJQP
         HZVgN37xX1CzZiLmjvo5hA2GYgzl0WdHRYdQGML5K8c05lVogp8xi3nkXAeA2EGAStl/
         pMkOGZR5jk+uG04qh5Fh3CnQwKoAAeQD1EwcBr3/PgR4N9PK7vsCArkyvtB54D4e4+tH
         1Mcs7aGL1nJ/kjJC/9t61nGM7mY6/BkYLpE8RfVJdqsPSx6XAxfBvxsZulcnlnsCiwZh
         NYxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=KD2LlUR5NpZlDvwnn9zLAQK2DmzjwDVkQP9qh6fOE8I=;
        fh=M+vaOZUmS3mescscJ6ZBCymWOHD8ecj5eVNCkUbOS38=;
        b=JswdbApLT0NEG0ss6eJkAxu3Zg6+0cL6Z5alGLuQQLUCv9/y4ofD6fcsI8U+6RPNvu
         VyHiWsB192kXLIm1u/J1UlX6LtsBXkisLQ/zhPBJeACN0vDRdJslvZXvSYLEpblcEW6Z
         qcpkc+ijgHxiiQPcNEIxz0RXaVRmt2mreKPUkncRUu1OE6+zWbxsQ8rHMXTX9f72BhcE
         CuRVipFfmMaveDNIf8bkz7l9Uup6UGaWx2/IQvFTVYlzktWKCjSS+WiT8i1nWURKUReC
         Ng2Kmpc6lHgRSchrqsN2Yth71fUFr0CDrT+6rjDckTeb+D8Cu4FBGXQ+qI4Bh6tetk1g
         PjUQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="y/8AfIYL";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-718e57da3c2sor4608985b3a.0.2024.09.10.15.17.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 15:17:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="y/8AfIYL";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726006625; x=1726611425; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KD2LlUR5NpZlDvwnn9zLAQK2DmzjwDVkQP9qh6fOE8I=;
        b=y/8AfIYL2zARX+zrvVXNOTsDRGHggT4ShV/AOwY7L9Bt2fTxOaYY/ogc5qMpgOLm8d
         bJJSe+GEuFrVUE7YYTNdf53W7LUn94FNgzmCeyVWnqw4enZ52VzLl7GpfWCeRdNXvTr3
         TROgQWcxx1TzQ6mQjJmDmupntdyI4U8upPKgsHbYcycVRKf6RLYET9vFzYPjzDMvvVdg
         DWCAEireHD1XpgtKyl5zOyYgUc9AEXRXkhitRBoDqzwQSwYpW1M7jNs99cD1Q+wjzsuZ
         LyVe8aa080/wN7mromOBpPHB7cjdvZrE+8ExOPt3FopGRTSRiRh3FDhd7EKvOAi3K7/T
         0ZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726006625; x=1726611425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KD2LlUR5NpZlDvwnn9zLAQK2DmzjwDVkQP9qh6fOE8I=;
        b=f+/VkfMloE+VFrwekC2Dem+H9+3k4xDik3SxQHngvnyqDGbuHMQ5y9dNuBRVUnbFNY
         MtU4e8LUlRrwaos7JJNmE/ePPg7pojydzroIw7LOpP7O9ovnvJdoyxgcNY06VODNoE+s
         9IEhbckP0HQ17xDTwAryVeykQvgDRt40X360fTPU7k+kZZM+DN0+OSDSQUiWLc9UvP/b
         2dw3kIpgGkOT1pBpNN1SbddzIsXNTr4XbjG+xgzSpKYm2tnUwcCaiJ1FgSi8fL+xi5U/
         7mruRkQ0fCx3BaF31VOJEB9wZif/yUGaX3LBnOLZCjoRjjTWmdoPypl9pmYWYy8vdmAO
         NS+w==
X-Forwarded-Encrypted: i=1; AJvYcCXwrVC6FF+wza25Aqo+BTJIPS2VKZs3WYRY2TZlH3cMjThZxECtXPBCWRQcWh+lpIksAffNxQqTiKYNWA==@linaro.org
X-Gm-Message-State: AOJu0Yy7xAtGcNUYb4tHwwKV3hajWqBHvMRRLJplouV7ZVu0ie0pueDN
	XYxdVPgDChpq0ClHLG3RdCqnjl/Tix0d+AVTSi1CUNVLRzMcV0RoIJupX8KO57UxeQ==
X-Google-Smtp-Source: AGHT+IH6UNKS9chWYn2YPKe9g9weGMxCR6dyTwjj+WvGPNZcuS65Wi2QHFhu7k4/MBMW5kKyVoj53g==
X-Received: by 2002:a05:6a00:3e1a:b0:717:87a1:786 with SMTP id d2e1a72fcca58-718d5e17ba9mr20187214b3a.9.1726006624765;
        Tue, 10 Sep 2024 15:17:04 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71909003d0esm1884055b3a.93.2024.09.10.15.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 15:17:04 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Zhao Liu <zhao1.liu@intel.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Joel Stanley <joel@jms.id.au>,
	Kevin Wolf <kwolf@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Corey Minyard <minyard@acm.org>,
	Eric Farman <farman@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Keith Busch <kbusch@kernel.org>,
	WANG Xuerui <git@xen0n.name>,
	Hyman Huang <yong.huang@smartx.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	qemu-riscv@nongnu.org,
	Ani Sinha <anisinha@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Jesper Devantier <foss@defmacro.it>,
	Laurent Vivier <laurent@vivier.eu>,
	Peter Maydell <peter.maydell@linaro.org>,
	Igor Mammedov <imammedo@redhat.com>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Fam Zheng <fam@euphon.net>,
	qemu-s390x@nongnu.org,
	Hanna Reitz <hreitz@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Laurent Vivier <lvivier@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	qemu-block@nongnu.org,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	qemu-ppc@nongnu.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	Helge Deller <deller@gmx.de>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Peter Xu <peterx@redhat.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Klaus Jensen <its@irrelevant.dk>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Jason Wang <jasowang@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 23/39] tests/qtest: replace assert(false) with g_assert_not_reached()
Date: Tue, 10 Sep 2024 15:15:50 -0700
Message-Id: <20240910221606.1817478-24-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: vVBFZaATi0pG

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 tests/qtest/numa-test.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/qtest/numa-test.c b/tests/qtest/numa-test.c
index ede418963cb..6d92baee860 100644
--- a/tests/qtest/numa-test.c
+++ b/tests/qtest/numa-test.c
@@ -162,7 +162,7 @@ static void pc_numa_cpu(const void *data)
         } else if (socket == 1 && core == 1 && thread == 1) {
             g_assert_cmpint(node, ==, 1);
         } else {
-            g_assert(false);
+            g_assert_not_reached();
         }
         qobject_unref(e);
     }
@@ -207,7 +207,7 @@ static void spapr_numa_cpu(const void *data)
         } else if (core == 3) {
             g_assert_cmpint(node, ==, 1);
         } else {
-            g_assert(false);
+            g_assert_not_reached();
         }
         qobject_unref(e);
     }
@@ -257,7 +257,7 @@ static void aarch64_numa_cpu(const void *data)
         } else if (socket == 1 && cluster == 0 && core == 0 && thread == 0) {
             g_assert_cmpint(node, ==, 0);
         } else {
-            g_assert(false);
+            g_assert_not_reached();
         }
         qobject_unref(e);
     }
@@ -305,7 +305,7 @@ static void loongarch64_numa_cpu(const void *data)
         } else if (socket == 1 && core == 0 && thread == 0) {
             g_assert_cmpint(node, ==, 0);
         } else {
-            g_assert(false);
+            g_assert_not_reached();
         }
         qobject_unref(e);
     }
@@ -367,7 +367,7 @@ static void pc_dynamic_cpu_cfg(const void *data)
         } else if (socket == 1) {
             g_assert_cmpint(node, ==, 0);
         } else {
-            g_assert(false);
+            g_assert_not_reached();
         }
         qobject_unref(e);
     }
-- 
2.39.2
