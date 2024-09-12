Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp422700nji;
        Thu, 12 Sep 2024 00:40:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUYRtQwkc3o9vaJiEUWEX+BVKvuYTi6+rBf2rjwFHLadWZiTkciJeVGoQaT/BjbD5zwNyU4w8+O7sIi5Q==@linaro.org
X-Received: by 2002:a05:6e02:1a2a:b0:375:8b0e:4434 with SMTP id e9e14a558f8ab-3a084958de7mr16575355ab.16.1726126827713;
        Thu, 12 Sep 2024 00:40:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726126827; cv=none;
        d=google.com; s=arc-20160816;
        b=xGfP+UQT8VZJJWmjRBGCSg0nDRILULeLyG5QB+HTEjFWyscPA1nj0JCet5ove/z27p
         t2i+qgl4p1/apxp4z0l81tvk3ujh96t5Eo/IGRa0eZ4Vxx2qg2pHuTeIEA0hJCLISAI7
         yIFQZekadP0qsGU8r2NnDJ2AhGUzU9o+7eVowz+9nNzofIZ73iZqwLZwYWEGeFx0K9dx
         6yyvoMJOm6eXel76mIkdodNLMeOPCwF8c9KS91M9l+UWn5KPR5x2/ahW0xhz+uPwjfVs
         dysomnaZ4IbBPzy11uEvexWi7RblnSubIyOH9TFFJw+oyMs3a1Gr6XP9z9ht5pWurkN2
         uJwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=lAgxsGkzSX6UIjZ+akO+9hnbz8NplQ6SsHLnjF/2omU=;
        fh=8V/csCojbzJiYTkZjuTkEvmLNLlaSvIGeBC4wKf8BCc=;
        b=coyLmVZ+25wOxwi0qA+4Os8icXLlSFuUY6MIYKFoJ18SMKfxkq2XLcHBZ/aBqZ9GzZ
         dv42Ic9G3//kplhY0NZIXd1wMT3uJFtINxvtZ4J7ydmv/OQJc/yxD08eIE9Az9tgyCmg
         5PWVb42ghTFPI+rbY2qiQK8hecVvT6/FeTHzda6Bc2zpCc1vanxMXwm/VwxiT8M1fnZT
         Oaq474W5yRwxZoFhTMja7Mp+xOdoY6BncmrdRJXPAplXjnYm6JcJ4X7q6DoYWnV5izWu
         7HYeiq/CpE/MyoshJJZczPHTB8FPSQi/Fb9ESyQJ3BBRlyINCt6O3fQiAk8IW/xfuFis
         Xdfw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rLTvg1aJ;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e9e14a558f8ab-3a059014d19sor29265345ab.16.2024.09.12.00.40.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Sep 2024 00:40:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rLTvg1aJ;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726126827; x=1726731627; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lAgxsGkzSX6UIjZ+akO+9hnbz8NplQ6SsHLnjF/2omU=;
        b=rLTvg1aJSV6d/yGJ64Jw0DN6ssMlZQufJUoWRTfKQNoIfWt46LdbQxm6cbv6qetcwy
         mUzDwcCIA2eMTkGkAhtCD0sCf4gzRBYbt2cMrmrsVZPEstYSOx7/BlbfBtnlZvsdL5KI
         cIszbIJq5/s8N7Hs83SFh7MppwcXv8jm27E3yxE4M3tKRw9E96N/Mp6h6jWKpFxBVnxJ
         DjeaNTNK3fguQVQa1z/oMbjsHX12T5H4lzXm6LRYwpCWfrwVbADVOob4muy/+eEQo89+
         iF0VbTar3qH7nIpx8jw+csaJe8rp4T18bd0zgyQ67hVtR7Z41ApnKCYf1FnrRXW8isUM
         pzYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726126827; x=1726731627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lAgxsGkzSX6UIjZ+akO+9hnbz8NplQ6SsHLnjF/2omU=;
        b=I4EjqDFDao04ItGVlZNf74cb8Y4B+U73qsnrDzOlL3Z/L74dL1qqmGpBXBgLfdVQaz
         LxJLYAASJlLXxPXRfKuTNOZM8aqaUNAb0lMjLe8ebfmpevSkXumhKAazIbtsRi8nKLlj
         rqViEWDZu4fGuaZn5uTgA6WoDbhR4ELA1dr1ki8oguhp9cFptb3yODR7HhtqiLk9BpCE
         /bC5FymFQHbGq+FyBfW1t8IVRV/uQdWDm5AjEd+jFEbRjGGonVbV02ZlJN03lqSXP5zH
         KZJcGJYoBvM4pVkAPz8mN/AoDipeXp+UuReGZcr7nR5H9HMwPomVsq7CUTA0paqG0RjY
         PT5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWhHk46rEOtN+7mYxyiq8KN6RlIWS5x3m+02O1v3PhPBLv9C+zfavFQxCJ7zqT9OH9A7g/z3AIKCyxn7Q==@linaro.org
X-Gm-Message-State: AOJu0YyKATKJnI5rJpJpINydHZ1edIwMF8hIMRgicNOs2r9sQk5af02X
	4JHsOOQ/ucjDxto1XzSwI2k8rL6RB9M8fTnWANZkLFg8DlnFCz6XJvqip+t6Fhpj4g==
X-Google-Smtp-Source: AGHT+IEyvhxwwfs3O4zBogJKiJanB1/6FwZWrxSk8P1iezRQ+YaRZrKbsv+G1dKwphxUzMpD10O4JQ==
X-Received: by 2002:a05:6e02:180c:b0:39f:709d:72b5 with SMTP id e9e14a558f8ab-3a0848fc3ddmr16439855ab.10.1726126827207;
        Thu, 12 Sep 2024 00:40:27 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fb9ad87sm983458a12.6.2024.09.12.00.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 00:40:26 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Klaus Jensen <its@irrelevant.dk>,
	WANG Xuerui <git@xen0n.name>,
	Halil Pasic <pasic@linux.ibm.com>,
	Rob Herring <robh@kernel.org>,
	Michael Rolnik <mrolnik@gmail.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Fabiano Rosas <farosas@suse.de>,
	Corey Minyard <minyard@acm.org>,
	Keith Busch <kbusch@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jesper Devantier <foss@defmacro.it>,
	Hyman Huang <yong.huang@smartx.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	qemu-s390x@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	qemu-riscv@nongnu.org,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	kvm@vger.kernel.org,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Helge Deller <deller@gmx.de>,
	Peter Xu <peterx@redhat.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Eric Farman <farman@linux.ibm.com>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	qemu-block@nongnu.org,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	Eduardo Habkost <eduardo@habkost.net>,
	David Gibson <david@gibson.dropbear.id.au>,
	Fam Zheng <fam@euphon.net>,
	Weiwei Li <liwei1518@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 23/48] tests/qtest: replace assert(false) with g_assert_not_reached()
Date: Thu, 12 Sep 2024 00:38:56 -0700
Message-Id: <20240912073921.453203-24-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
References: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: aqyYNWZp+O4L

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
