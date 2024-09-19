Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp1161350njg;
        Wed, 18 Sep 2024 21:47:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWK8PSjwL7OdCN4zCYlDqpdIManpIAGyaA0dkaMHEqqqrWahab1KH+aju7gUJlXsP/TsgPKe+zaTSghZQ==@linaro.org
X-Received: by 2002:a05:6a21:38f:b0:1d2:bbf2:d8a5 with SMTP id adf61e73a8af0-1d2bbf2dc0emr21724224637.31.1726721232344;
        Wed, 18 Sep 2024 21:47:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726721232; cv=none;
        d=google.com; s=arc-20160816;
        b=pfezth/gUTzCb6abEiKHA4BeqVF3Uz0lEZVyXQy5kuKLpmhvVA0niLBOBrlAavyXcr
         kNZqUhvu2Yi2yY5mzYE2qfnpcyd4SFiQlyff1vwJGzwFI9VXSFbnxFbls0zdJVHt16Ok
         DoK6JSF1ysMXhDaVU6SppRFPwPn0qqNohgOsF6VftRWMCvvVF+fslLVUtwiQv1ctxqwb
         ysSs0s0kAnF7YApFeTE7vbkb5rUbaPmj7KFX2ZfBQY1QpX/JQtzRsOz8Ga+82+d2CvdE
         rOYnQ739jXf9agdxfMErALG78o9Ti/1K38SZbjd/UZ1xZhqxaBxwi9wXUXmERsEX0tKd
         fidw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=BFDTm87nVz3V5/Slt3dbvL2tTaVEGEVOzfLYJ3PuoMQ=;
        fh=YgEwNrxT60wOocBf7AoaruV8qZr090BzK3P5ElylLcA=;
        b=M0ZnNDD9AfYo963nfS6ZVOwQvbfiowp/kA2vg2M9ErzUBjG5dyeS6OplzdsWyVhiqY
         3XcDGCvHSI3nFLwO8RKsDeqCYd3MTPLe1yzl4rg6McXMSwoynOKnJ6BMfE7h//EAWKVf
         LRgZNqS4Q6/9rmgioW8txgu3N0e/wAQu5+2nnW/PScwD2XE7v9jXrmZGkCv+rA3ynlgr
         XcKbkPnvP1ikG1ZqNWBONprJRVaQ0jMcdWhgtDYxRR0KsnvO6mlaby5QJGKBy68PSYW3
         CyEQbQZUsOOKKaHdDcLrZ7Ldzn6wg6C3z5L1dbnQkpwvLUIDT9DwlToZvd+RR32jF3Fh
         WJrA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RuCjvp+k;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-719449b36a5sor7179610b3a.0.2024.09.18.21.47.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 18 Sep 2024 21:47:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RuCjvp+k;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726721232; x=1727326032; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BFDTm87nVz3V5/Slt3dbvL2tTaVEGEVOzfLYJ3PuoMQ=;
        b=RuCjvp+knPeo4D6aD+UfhT/ppnHDZSonZ0/DZi7Xgw4GJphzxpe6Mr8V9s5BZdSWe0
         wntK6BHgFdOLKhI/FKG+xmA90zvrDJPeiNY4yMLGsdUoqlbnyFUZWp8d7rzfh4XQpgZy
         syey1QDPlpusC+ZMyOHNKcjW0hW4EX6vHdof6crECllt8ryeP4L3AaQmUoyQH/Aakhrj
         nAyhDIKhFnG1Ry+Fsh25M1BGnRZRFPqa0GisLVF6CVRaEaf4XdVULH+wgyBkbVK7rcJJ
         XNrLlCZzhtC9ZYQhIL8vWRaQFwMvK5bgMprdQ0cFmuI4zB34LDlmj2b0pqGG0BNGkHAj
         oyvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726721232; x=1727326032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BFDTm87nVz3V5/Slt3dbvL2tTaVEGEVOzfLYJ3PuoMQ=;
        b=OAZEgIWd3NCBGCKi9LmXskp5IsqyvJZ8ithYUpT4u7ni+MoasSs/X8slK8TLMtIZz8
         5nvZnsY89XqvNhiusBiYMWOf/623Ow8OScNnKgORzqTcXdkfP3hbUlkx3tvae3/cw9qp
         AblvnzeBfTmPZwSKDWgEIvt1j0pvbdRPqVmyTYmIGK67bKaKHBWc8ZWgoUd6uf5Iidqq
         EV80Sqpnpcu0mhFoiu2uUoSTL3T0Bz/DACY+AOvS+o6dXmgwucOIKpi/+0vVJVMgfbB5
         OUk5Oi0hhMHDRoBm6a/XlblsuUlncMgM4+hKx6+++6fXagxTxBEOef/uoY5y51O2hAj+
         WUow==
X-Forwarded-Encrypted: i=1; AJvYcCVDXM3pDlswuzhViEBbp1H2ag9S7gu+hrY4t8onno+U3zD5G2GIbWNfgjaqCrrWprGGsw4G58ETsaW/lg==@linaro.org
X-Gm-Message-State: AOJu0YzjQJdLOkXnkzORE7J6khM/4J7BtEzbGvcgdYHQXBPS6qozYfLL
	N71R1b2IvJX4UvtRt0Xqyt4P91y8chM7Bn+TsRqu8RumeVuqazs/sEfk8jq1PLI0AA==
X-Google-Smtp-Source: AGHT+IEyMy6V2A0OtvCxf4O48p53ASfDnJYGmnLQMeZ/04wkCNDXNGA3OfpgkgUg92nhjq5jeesYvA==
X-Received: by 2002:a05:6a20:e30b:b0:1cf:3402:6e9d with SMTP id adf61e73a8af0-1cf75d76b46mr35535691637.2.1726721231866;
        Wed, 18 Sep 2024 21:47:11 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944bc279csm7478601b3a.188.2024.09.18.21.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 21:47:11 -0700 (PDT)
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
Subject: [PATCH v3 13/34] migration: replace assert(false) with g_assert_not_reached()
Date: Wed, 18 Sep 2024 21:46:20 -0700
Message-Id: <20240919044641.386068-14-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
References: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: oBKnhHTg6ueM

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 migration/dirtyrate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index 1d9db812990..c03b13b624f 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -228,7 +228,7 @@ static int time_unit_to_power(TimeUnit time_unit)
     case TIME_UNIT_MILLISECOND:
         return -3;
     default:
-        assert(false); /* unreachable */
+        g_assert_not_reached();
         return 0;
     }
 }
-- 
2.39.5
