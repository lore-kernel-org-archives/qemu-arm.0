Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp422548nji;
        Thu, 12 Sep 2024 00:39:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXlpx2pkT7iuAr+bZvZ2/PKMCTh45doTsLjFG/Maz74UWFhgBFy7E9wu/8EEJoCLyaT/KuLy8kMHh5UeA==@linaro.org
X-Received: by 2002:a05:6a00:1953:b0:70d:1b17:3c5e with SMTP id d2e1a72fcca58-71926067e78mr2894321b3a.6.1726126790353;
        Thu, 12 Sep 2024 00:39:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726126790; cv=none;
        d=google.com; s=arc-20160816;
        b=FytkNJOC8rMMkFSBt5eNdD0LdX5HN6HfiMyWVBHFwjREXWWExePcVryM4Vqvv7KbAY
         kgZkTOs4cnJp7YTjV4TWx4a02EdNoyBjhwmIYMTiI0khi2Q7LhXxIisMM3l7WfHjEF9q
         BYm+OnUCVyxX5RUOXTXppxbw70wfjtNROU/Z1rpH/RGCrdxnxDW2fuM1R/BTgU2F5mc9
         /Mti1yqUUDBF7THSob+LvJ9RqNbjbX0oAGvQ/FmPo3Ei8L6NjkQekpiGIe/B9C/2VPRW
         +nTrovsf6WbjgJEPfXuQ6EXstvDr5mg463Muh0r14Ge9ZDZPsJdSJZeD3HYjpCN0O/k5
         jUgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=CoLCWKN35Kx1zze7qPnMX6nUM44hrew4lUqaYQU21Hw=;
        fh=Llre6yRDQzkYArO6RIMjcomqvrHc2vslD2rnXqvCK+w=;
        b=QPc6H4AvvFcem9pVwXAUAUemS8E6Y3xkBQUbrHaLGFICnKxMwe/OeXovcs9x32yZS/
         GuClX0eVdpAjWhVD11Gnb+eyKSVGmcA4ue44pmwPmY8TCGpSTkJiND6TgxEk7aLsBVB+
         ilupxTV/2voeRU3KKsrt+KGOwvq9qmJ/oD8NyB+2kQrZvf2NvoSB3WHiX2+9BVt/Msgt
         28IljuKejYPmDHSh6Av/n8llFhA0SH5hVYab0sFVNl5Xj9iJ44pSdELE87AR20PpDEqb
         VN/10/WTi/+E5QXmaOlzWJb4kivuthS33z2zlSLTFx2ZCvxH+sP7MI12ci39LkiFkaWG
         0d/A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="LsVjPDh/";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-718e58d744dsor6016101b3a.6.2024.09.12.00.39.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Sep 2024 00:39:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="LsVjPDh/";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726126790; x=1726731590; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CoLCWKN35Kx1zze7qPnMX6nUM44hrew4lUqaYQU21Hw=;
        b=LsVjPDh/qZRmW32AWQ+6j6N7fCgOcwqgT3bKRHD9rEER03JLXR7hEg+SIM4gc08pjf
         zhzaI5u4j4zT9MecYS2ShdOfZlsO837gZnFq2LH8R+l2TsNykom72dlzYREaNXKfGcB+
         WUeC8LB07zu2orwfZ/eizLvz+VJJSBRPryNoANiARdMzMD0X1vQHG0asdJodsUjs6DUK
         Y/bauKqMG3hR2YhbkMG1x1ta54TRRBaINNr76Oq9wdlkJXqR3X3GUeZffp46OEEw2Mf7
         4EKy1cflRpP3B0m+q17v+t0zQ9EWOhMXVbbays8eyIx77Ied29BXHROcblrMkJ4IW/yh
         gOLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726126790; x=1726731590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CoLCWKN35Kx1zze7qPnMX6nUM44hrew4lUqaYQU21Hw=;
        b=cLYyj2izONa29Lj/aHF1icHe4Z8b/QkdFV7MaG8CeniyRXY5GZKY8ghnI2Jy+BIRBK
         NcYgn4qJ/lTQWdKGkNhU71x+26qJu3tyiFcL8ytXN1qYYFTzhNOBoDAasGA+EC7mcsTs
         G7iVDRpvnqPHHcyrILG+kDAm/BQ38WYo37C9YN3Ms1Yh/6ZxhWbtrVmnpV+j5zMK/9dQ
         Vu/a1pvGW2x4EKdomXaehIIdQhwA1fyXZpUXl1jogkp7nJL0Xth9AOA0esoc41rj/sb1
         KDzsbUSyxtZ9Ly/QiM2jPSyDefWYTUXelTdlz8i7GV+N9W0QN6AxXtDT69CKfcnEAINy
         07cg==
X-Forwarded-Encrypted: i=1; AJvYcCUqhKk7c1bjRM56Vio8W1DThXCDImyjVKQIzh2kZAQUZ4bdK9HhC0QLOlN65G8M3rAC5QxUHwXmRNHa/Q==@linaro.org
X-Gm-Message-State: AOJu0YxKRxG6uzMlG19Uthy9BX+D49O9iMl3K/qtXIPZYLMfhX4HlaMh
	Kmcfc3NcMlhk6/jtbslpIsx7nz7Rmr+LHL2BZasgjC+dHEkMUVpUL/tGc3CI4PxOjg==
X-Google-Smtp-Source: AGHT+IE0w+LZngOafibQdFlnRgSn7EWh+CAdX4bvMvefU5tar1r2kJCPjwqFlGTA67eF851XZaN0PA==
X-Received: by 2002:aa7:8895:0:b0:718:da06:a4bf with SMTP id d2e1a72fcca58-71926067e21mr2772666b3a.2.1726126789771;
        Thu, 12 Sep 2024 00:39:49 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fb9ad87sm983458a12.6.2024.09.12.00.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 00:39:49 -0700 (PDT)
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
Subject: [PATCH v2 09/48] qobject: replace assert(0) with g_assert_not_reached()
Date: Thu, 12 Sep 2024 00:38:42 -0700
Message-Id: <20240912073921.453203-10-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
References: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: WLySgYIpW2hF

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
2.39.2
