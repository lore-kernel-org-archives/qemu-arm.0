Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp1161305njg;
        Wed, 18 Sep 2024 21:47:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUwz0kAUdvGlAVekIVlNLNuT903CtupX0lLqV9ycYiXP7Rxuipso4T6jIptDRV2ISRGYaCBoPKEbRDNVw==@linaro.org
X-Received: by 2002:a05:6e02:1a04:b0:3a0:a224:eb3a with SMTP id e9e14a558f8ab-3a0a224ee24mr113939235ab.6.1726721222947;
        Wed, 18 Sep 2024 21:47:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726721222; cv=none;
        d=google.com; s=arc-20160816;
        b=Wd8KnmI95BnBT6wROvKFmeeBMdVWQ0piOXXBK4RmLWZHe1CBDb/Eahgx77p4hEMXrM
         JDUqnezeZ8I8BCJ9qyO/3XOV3Z1NOnWiRBplQxx4E1ghJlKSo+hBLuLfYzjJ+7h/Lgd9
         LIfZ8iuOOVD1lOvfnZijAGRuDZz9e0edRJ3Oo7Jzy4bwxO6inU1eAetPyWQO3KxCmM7a
         Yzx/U7PrUusXr9mSHOOKMT+JDdz2ywH0mPSljcYtVAGW4/7t7aEauAaaBfF/A1VKnQgF
         DQiDRPzDQZXBlbuDioVWL0feAlQovipj5TnSIVQitLGnrsJUIAchkttBJIfn+gXJDjW1
         ZMnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=De4sKLPybVhT2+Pc9xtI+CTmpF8ivUBlmtwhnsMRIOQ=;
        fh=1uo62EKuYloK0nUClSvtbE3Aip40fap1KWfpHq+irlQ=;
        b=m1E07gsKXOLW7Vj0cEVPYQjlLr7hXVs+4ByhKkXrPpGO0X5MmGN2r5QgvNPm/LVCCY
         oF1B+E7jzKrlIwhtx7PFC3ey+zu07++Kc45jnjzctut7WMfxZpU/MLQR8YHOT2fIIQXQ
         2z3JGEkhjIQwXxWCUq4uGpTEVI7Cfsak6K4R1L1E8wI8RJ2p9dJ+Va0kX+Y5rWs9PGuJ
         tIdGIK/pkRGTeQLXd1tDNIP4uku23Ng9KApJkecUrG9D5VAtFJR93t9rdKaAJ5ZxjpaH
         tOHos5Airap9PxvGHQNQpJHI/+bFw01YtbuLO5IoDNWcxnMk0sogxbkgmcCJMGBgl/d6
         rB2Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="bF/B3bZp";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-7db49949410sor4255609a12.2.2024.09.18.21.47.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 18 Sep 2024 21:47:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="bF/B3bZp";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726721222; x=1727326022; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=De4sKLPybVhT2+Pc9xtI+CTmpF8ivUBlmtwhnsMRIOQ=;
        b=bF/B3bZpaHN9/8WCGgnEsxn+QT4nAQnEEuGfQWXyITNHAr0H1pXoVp44EYNgN2cTcb
         oRoiXLjuxr0ECZv3CPo9rYCRnjgMJSGW5ygq5AkLVx4To7iJEN2XEnUWobMgPa5tiks/
         XiXtblS91TQPpqVG9bYn4BAgNoLT/wznth5DeDmqXr3fN31QEHAnM40H9Json3BaAkDf
         Pq/epfkMoXe3mezLa9nrwrQ16UtCjKeG4n/CI8GewT/gJeQPmgzQA32Tmiqf8qbbhyzm
         DvS4qi2/59arEO0fo387Mr9Dyk6PQvhf2zEvyT2JlbsD7k3mlGvqXNwmngakc2kcw+G8
         jU0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726721222; x=1727326022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=De4sKLPybVhT2+Pc9xtI+CTmpF8ivUBlmtwhnsMRIOQ=;
        b=Vef+mcR9oImRzI7TW30Ro9IbXzhcSwb6sN+UTRUlgG8jDYdXtMxUx3f1m5Bg4ZErUY
         8YQSeLXvDQ30IcRnj0kRKFjww1g6GlR2aDB9PjXahGkC//ubZOBzAYIvMcIVNEaLclXu
         KXc/6OepWMPBLIDyhA+EJDnqHBURNFhx/dQi7L56hBk4Pb7x+0A4naNc/Sj14f77fPZQ
         S8f6WZfKLYYNxz392oTMRtSuJg/jOJvmscO3yyC2ufc7STTquwvzSIyq3mIupbP2IeZW
         gvK0F1Tx35vt6ir7G8JazoGW7dT+GVmQOwZilC7nf9GptgCZfx2dkq5rZtHIlr+d96yz
         EMqA==
X-Forwarded-Encrypted: i=1; AJvYcCW9ccmhFw9zc4T0R85VfKK1JOzebnrQqz3qdH9f3EkuzVmWk0FylxUCz6ZQM1FTOKgcjVGJ5U6RaKoQAw==@linaro.org
X-Gm-Message-State: AOJu0YzNPDyN9BeOmbTjMiCay2YalV1AV8byDjonmEofa81ORVH55hyg
	aqEQ9REkYGPSExIvcc2ySZE2urCgMT/0Pcb5mAuBv+xdbeFlg3L5u/dpRhx9fXfYaw==
X-Google-Smtp-Source: AGHT+IE2Y81B/LKedghyO/XIB5KqiZokca4F2Biq0KEcZsGPJCLDi0vE6MjHgWLkzwtVTNzR2l7/8A==
X-Received: by 2002:a05:6a21:3a87:b0:1cf:4326:5602 with SMTP id adf61e73a8af0-1d112e8bf15mr31788153637.36.1726721222472;
        Wed, 18 Sep 2024 21:47:02 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944bc279csm7478601b3a.188.2024.09.18.21.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 21:47:01 -0700 (PDT)
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
Subject: [PATCH v3 08/34] hw/hyperv: replace assert(false) with g_assert_not_reached()
Date: Wed, 18 Sep 2024 21:46:15 -0700
Message-Id: <20240919044641.386068-9-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
References: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: oLsie9Cs5SWv

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/hyperv/hyperv_testdev.c |  6 +++---
 hw/hyperv/vmbus.c          | 12 ++++++------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/hyperv/hyperv_testdev.c b/hw/hyperv/hyperv_testdev.c
index 9a56ddf83fe..ef50e490c4e 100644
--- a/hw/hyperv/hyperv_testdev.c
+++ b/hw/hyperv/hyperv_testdev.c
@@ -88,7 +88,7 @@ static TestSintRoute *sint_route_find(HypervTestDev *dev,
             return sint_route;
         }
     }
-    assert(false);
+    g_assert_not_reached();
     return NULL;
 }
 
@@ -187,7 +187,7 @@ static void msg_conn_destroy(HypervTestDev *dev, uint8_t conn_id)
             return;
         }
     }
-    assert(false);
+    g_assert_not_reached();
 }
 
 static void evt_conn_handler(EventNotifier *notifier)
@@ -237,7 +237,7 @@ static void evt_conn_destroy(HypervTestDev *dev, uint8_t conn_id)
             return;
         }
     }
-    assert(false);
+    g_assert_not_reached();
 }
 
 static uint64_t hv_test_dev_read(void *opaque, hwaddr addr, unsigned size)
diff --git a/hw/hyperv/vmbus.c b/hw/hyperv/vmbus.c
index 15e0d600c7f..03f415bf226 100644
--- a/hw/hyperv/vmbus.c
+++ b/hw/hyperv/vmbus.c
@@ -1874,7 +1874,7 @@ static void send_create_gpadl(VMBus *vmbus)
         }
     }
 
-    assert(false);
+    g_assert_not_reached();
 }
 
 static bool complete_create_gpadl(VMBus *vmbus)
@@ -1889,7 +1889,7 @@ static bool complete_create_gpadl(VMBus *vmbus)
         }
     }
 
-    assert(false);
+    g_assert_not_reached();
     return false;
 }
 
@@ -1931,7 +1931,7 @@ static void send_teardown_gpadl(VMBus *vmbus)
         }
     }
 
-    assert(false);
+    g_assert_not_reached();
 }
 
 static bool complete_teardown_gpadl(VMBus *vmbus)
@@ -1946,7 +1946,7 @@ static bool complete_teardown_gpadl(VMBus *vmbus)
         }
     }
 
-    assert(false);
+    g_assert_not_reached();
     return false;
 }
 
@@ -1996,7 +1996,7 @@ static void send_open_channel(VMBus *vmbus)
         }
     }
 
-    assert(false);
+    g_assert_not_reached();
 }
 
 static bool complete_open_channel(VMBus *vmbus)
@@ -2020,7 +2020,7 @@ static bool complete_open_channel(VMBus *vmbus)
         }
     }
 
-    assert(false);
+    g_assert_not_reached();
     return false;
 }
 
-- 
2.39.5
