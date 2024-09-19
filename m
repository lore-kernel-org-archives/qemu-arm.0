Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp1161531njg;
        Wed, 18 Sep 2024 21:47:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWQ9iUzaU3u4hTrmSnLAQ+7Oj8rMCox1tP2rUTOekNoUQIVpBrfL2eWm2ZrlvFPxYmmcpm3AaYnekrTDw==@linaro.org
X-Received: by 2002:a05:6a21:398a:b0:1d2:ea38:38c8 with SMTP id adf61e73a8af0-1d2ea383934mr9430484637.5.1726721268396;
        Wed, 18 Sep 2024 21:47:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726721268; cv=none;
        d=google.com; s=arc-20160816;
        b=m02zkRx2OsvkV8b7w+gtkGzV172fOLFFFXKg6y/GD/NVFxqzzAcH2gikbe2ji1yF9h
         rJWrRCbmVgBB4nAaNI/S/Q5y9YMqMKpyitRVcNy6W0yQocWJ5i5RRUmPxXxoRk7C5klQ
         pfAB0zon+PkSvILrJYp+gqX5wPi+ZGAAcU8CxNDyfvhv5+G7hIpbGvYRFIb29XEOpqK2
         jjlDz6Vdi5oDhPSN6ZNgsa/zBQDxJh9X12UxsARebH2p9RCadd7WuZc3Jp9q3NRy9Dqv
         oLXxnVc1OY2MfWwQrVudU0zkFVqWqrbHVLWHNJkWfdDICavl9fQI+af3W31F4pMX250T
         JHSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=lJWuRI2a+xcGlqE9ilLL21KPqsM5FE8vZBWYVBf4fqk=;
        fh=tqC2ZH54q8LPNjriw7cGXLvqzRrX++arDDh36oh3MXY=;
        b=OgLhcy5+1dFCDWenemc34WCpI0b5Bx2wZaQ4s41JegEoQH4OPQrT0QY/TzQs93j5FC
         /9F9ZMCDoMbC7d3zZ4wkZMW3volas6yF+rdLdZZsg4Jfrt2yrv8ZvNttoTvle/gcAkfO
         JUt05Nkofobxq6oHxSijQprhoHVcQUUpmlYXzx+fkU5WDWcckkP2fB3zpEK8yJ3qFzwM
         0XstrSYbtIV9SitMrn086zs47Dir5SqQve45E/Trq29cOw9l95Zelv8v2ecNSQ7Tw28f
         G/vdY9eoHAuWHWriXejiG5S5UszA0Fv3QSWCjUkRifEkqLJWAQBqII4yoo3HiQqJdRMW
         BA7Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gJfyXzyG;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-7db5426ec10sor3572732a12.8.2024.09.18.21.47.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 18 Sep 2024 21:47:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gJfyXzyG;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726721268; x=1727326068; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJWuRI2a+xcGlqE9ilLL21KPqsM5FE8vZBWYVBf4fqk=;
        b=gJfyXzyGvvUHCKgW35JiDkYdTMnhHk3H0K29c5+zAVeMWOKzyg7RZuGiYMq/F3iVfn
         YbF5aTjexOkOrAcrKqB3o/VjB4G4DGqhOA7Y+EyBsX0MUrXt3S9D8Zl4mQKwoTwCfowv
         5OCs+c43A/ykM5U5hEvBtZZbZZLB6xPDT7RQlhPheKMotMLkcvgYzP8qVniFDbIeQ27z
         wyX497/6FxZzOC1vjyI+H9JnASJ/6AvPxHD5XSok+TPxOqQ/LpZEEp6xisjvtFAME54T
         j6e7RCAGF/b6t7rZZsj0q7uwaFVGMK2l9l81L9DD9jxKmWe5QAMeozswufUTo2QKpcNJ
         7REg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726721268; x=1727326068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lJWuRI2a+xcGlqE9ilLL21KPqsM5FE8vZBWYVBf4fqk=;
        b=Cu2OKRBUSvQKJ7O1rKhiPkhZhsFQuPnweHcc0Czvpk8a3RUz/epm7MI7rqwboR6YvG
         k3CFMn3i++S6K3jf5qUgrzooXXM1eYxJd21l2Z434P8+7tb8XRUH62CUStHADCl2r/1M
         bgzeQtDQJdPe22bAL4JeuMKfffchd8VFmWi8kIOVzuwowvL84InZXxGATZ43f6E62dbk
         UnPUP9m7JdNzu5DPLt4aCtqppQ5D0WavGntsebd1I/UBj7TemgZNWRHJF1bWjblDdcpS
         kA0e3gmFZjTRhFnNN4KIHZBrBJqWiLhDCBY91pF+q31g1Wk5G383EMILWnR6HlCJxDU1
         Fc7Q==
X-Forwarded-Encrypted: i=1; AJvYcCX5bBKhE9ZT1rw9lsPmgO21YmLLawi0pD8HIWLcCa0qVJa2LyNCxrb29MOvqZm3FzgJL5rrOmdce1KOqg==@linaro.org
X-Gm-Message-State: AOJu0YzsOTqM/NF5wIC3d5wbM7TWIVpuRoaFvvQWaHxnsuzKqxBEl5Zx
	zf16pOJXQqKJVdimDHYNmBszvmEGNBRSQPryXv3zhytPFqmKJuwWWHufEdyCbHzoGA==
X-Google-Smtp-Source: AGHT+IEWVDdbKcjFcT6g/UvYMSE83MFSMfB5S4IXaD3yJyhmupuCthkvU2aYKDc9W7+wO1/hWbEPng==
X-Received: by 2002:a05:6a21:3a81:b0:1d2:e8a5:689b with SMTP id adf61e73a8af0-1d2e8a569famr9583177637.14.1726721267939;
        Wed, 18 Sep 2024 21:47:47 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944bc279csm7478601b3a.188.2024.09.18.21.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 21:47:47 -0700 (PDT)
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
Subject: [PATCH v3 31/34] qobject: remove return after g_assert_not_reached()
Date: Wed, 18 Sep 2024 21:46:38 -0700
Message-Id: <20240919044641.386068-32-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
References: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: a7X3UqMTCiSD

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 qobject/qnum.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/qobject/qnum.c b/qobject/qnum.c
index 2138b563a9f..dd8ea495655 100644
--- a/qobject/qnum.c
+++ b/qobject/qnum.c
@@ -86,7 +86,6 @@ bool qnum_get_try_int(const QNum *qn, int64_t *val)
     }
 
     g_assert_not_reached();
-    return false;
 }
 
 /**
@@ -124,7 +123,6 @@ bool qnum_get_try_uint(const QNum *qn, uint64_t *val)
     }
 
     g_assert_not_reached();
-    return false;
 }
 
 /**
@@ -157,7 +155,6 @@ double qnum_get_double(QNum *qn)
     }
 
     g_assert_not_reached();
-    return 0.0;
 }
 
 char *qnum_to_string(QNum *qn)
@@ -173,7 +170,6 @@ char *qnum_to_string(QNum *qn)
     }
 
     g_assert_not_reached();
-    return NULL;
 }
 
 /**
-- 
2.39.5
