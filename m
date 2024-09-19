Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp1161275njg;
        Wed, 18 Sep 2024 21:46:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUZVBnmWq/Zbbu8r4ex9w9llm1J4frzUkL40dlY8xsMYnr+2rVvEhH7BBXzkHHARMDipgZjBaXSVX3mRQ==@linaro.org
X-Received: by 2002:a05:6a21:385:b0:1d2:bb7a:79d3 with SMTP id adf61e73a8af0-1d2bb7a7b6emr23424932637.13.1726721217243;
        Wed, 18 Sep 2024 21:46:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726721217; cv=none;
        d=google.com; s=arc-20160816;
        b=ahtrXXjSue1nexVlxQKgsEFSuL4a+bqjwIEh6mJH2wbji1bJItVqxVlaOjqRsT8SGo
         20GDBauTbYEp4jzJKtS6KiQEZKR37U7lcsWpEvTaP2FctIZ4V1WopflLZCZ7W2lDqGKh
         ArO+yi/r1P2RlzsM0iymaRUAZ++TGpRle0t7iw3UpZ6dvRQDKqYxR1vEVkemKTv9A5WQ
         Pc76dncrW6/UCHLfKeZt8ieJ8fUHzgcx7YezgBtFdm4kBpCHHtgnUhPq52n6H61G1Mbz
         iIwGVsIVmePnJNa9svY2eAuQtwJa2wyNxTrgI94JcbkbGPJrHVx5wVlOfuY7xQ7eyu6F
         Xy7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=KJkmiG3PhPpYsgMJ7XkEBDNaPQyoDU9Xw+XJyRk65WE=;
        fh=zLug90n+9623woe1qs4+WGYPnpbbBgswHQ6YEA0zkno=;
        b=bN3mZUvCgPU6ScfCyD4eiQBS9F3mhvru+vnE0sktgWfNF0RZAjCi1PZ1KWw6L7W5jz
         +UZ50rKlyCwdDpfsPz6EQsGeFleCzjhsF4gg8wn+sl3BLxeRXuKNakSHZXJmcijBA1NY
         hHoSCH18uQ7eOtcHLlS2AMIF+aFq2xALH+F9wtitES99MYCbJRNGHP/NPAg/VliPRHuA
         ElDkVCtuvRHuTqAi0qUg7B3r3hy9OtcY7WAf0gpEK09Bw8c3GHn7OIhOYNevCHy3qTWY
         KNmAwZxyPICkgoOfEB8oqNb551lHr0xHTuyph4AeAF1iuEQqK0sA3n39XrBEvpfW+GoH
         HWmg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FDjq7GPu;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-71944bb8736sor6359098b3a.11.2024.09.18.21.46.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 18 Sep 2024 21:46:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FDjq7GPu;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726721217; x=1727326017; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJkmiG3PhPpYsgMJ7XkEBDNaPQyoDU9Xw+XJyRk65WE=;
        b=FDjq7GPuDQZc0Bd5y7/jKIwyJGDWSVgXkcujTHaJpYrzFyA/q9zxJdLOeB7y1IHfx5
         uSrkerzeQK1pmiMecBeDIv0/TGNBfyCw6IqKFxB/L/8kJbHtfZcUeh+R8NoP8OTv+Lvv
         W2Av4/pgvCvy086yrAnF0oljBXXQzxtCprB6X+Yfn9SozQfhL4AI1U+BdFrZq5E+oEwI
         pRg6qSXa9tNq7UHKCfUYa9h4u+YqayCJ99+/3Ou0R9oa+43j7E0AaKeiF0+V2FcRZXHL
         9dIlne40tFx9KCxUNZiq/RbKdm6SvL1rTbIudniEWRnwZtSxuXjkIwyPfmTcAm6otBMv
         XuQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726721217; x=1727326017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KJkmiG3PhPpYsgMJ7XkEBDNaPQyoDU9Xw+XJyRk65WE=;
        b=oL02DPLKS80z+DIXqPYC5WLeMiJOnTvuaiECl3oATyMsMU1pTTR/fQVlzecyEvyquj
         DdDcxnnbKpZlBVd4XCRFxNRXCEHGfmFnp54AtNI9rdbeKfI3Qnmw60IGqogVsS9fVWyJ
         Ewak8bT7CPpGF/B197RFWZPwbaNntvmxDRIjymIXFu7J2/7hmHTDARb8XIUBzIEuByK8
         w7A+O0pTJGEdcb8AK8LlJ2zZUh2wGqkbDod4vLn0Up++2p6CB2uD+bTARFoJOyo6LdlG
         E5emsKe5qDcOIZG5gPMO/65NqbTDOlMP1f6fTC/SYF4dgYQdYLrrMfkEvYwapDC+G/wG
         gmJg==
X-Forwarded-Encrypted: i=1; AJvYcCU5rlLBB4QRb5Llo563aV4vUB+i2DD0W7oB0wDokcAQ6cQ0qqX+XZ9HhDeBYzdab4o+n6cgydv/5fVUsQ==@linaro.org
X-Gm-Message-State: AOJu0YzBQbjUfqr6pacg22TN7AdE3sf/zLjQEIZO846GJ7y8daxkqLiC
	EnimvGOnTYKrWwn7oXFQfHUvTHJ/FwoX6ACNFknSLCaOeZXwSqaWxH0reNxZsHVNqA==
X-Google-Smtp-Source: AGHT+IFI8OaToJZDzbcw+Y/dxaLu3fYE/OJ9AAnzLLztALk/zezzILuHxXxJLn5xpki0Ylem6dbZgA==
X-Received: by 2002:a05:6a00:2401:b0:718:dd53:70db with SMTP id d2e1a72fcca58-7192606c438mr38378490b3a.11.1726721216563;
        Wed, 18 Sep 2024 21:46:56 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944bc279csm7478601b3a.188.2024.09.18.21.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 21:46:56 -0700 (PDT)
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
Subject: [PATCH v3 05/34] qobject: replace assert(0) with g_assert_not_reached()
Date: Wed, 18 Sep 2024 21:46:12 -0700
Message-Id: <20240919044641.386068-6-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
References: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: hCwwpC4LKVqj

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 qobject/qlit.c | 2 +-
 qobject/qnum.c | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/qobject/qlit.c b/qobject/qlit.c
index be8332136c2..a62865b6423 100644
--- a/qobject/qlit.c
+++ b/qobject/qlit.c
@@ -118,7 +118,7 @@ QObject *qobject_from_qlit(const QLitObject *qlit)
     case QTYPE_QBOOL:
         return QOBJECT(qbool_from_bool(qlit->value.qbool));
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     return NULL;
diff --git a/qobject/qnum.c b/qobject/qnum.c
index 2bbeaedc7b4..2138b563a9f 100644
--- a/qobject/qnum.c
+++ b/qobject/qnum.c
@@ -85,7 +85,7 @@ bool qnum_get_try_int(const QNum *qn, int64_t *val)
         return false;
     }
 
-    assert(0);
+    g_assert_not_reached();
     return false;
 }
 
@@ -123,7 +123,7 @@ bool qnum_get_try_uint(const QNum *qn, uint64_t *val)
         return false;
     }
 
-    assert(0);
+    g_assert_not_reached();
     return false;
 }
 
@@ -156,7 +156,7 @@ double qnum_get_double(QNum *qn)
         return qn->u.dbl;
     }
 
-    assert(0);
+    g_assert_not_reached();
     return 0.0;
 }
 
@@ -172,7 +172,7 @@ char *qnum_to_string(QNum *qn)
         return g_strdup_printf("%.17g", qn->u.dbl);
     }
 
-    assert(0);
+    g_assert_not_reached();
     return NULL;
 }
 
-- 
2.39.5
