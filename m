Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1444530njb;
        Tue, 10 Sep 2024 15:16:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWlcy2UP69Dhsgosj/EOzcqRMRbgYN0OiGE1QxH0WujtUySradiZX925ZjTPumeWPLGE6NfADvA1jz/Mg==@linaro.org
X-Received: by 2002:a05:6a21:1707:b0:1ce:cbcf:aaa9 with SMTP id adf61e73a8af0-1cf5e1b62f3mr2805640637.36.1726006609524;
        Tue, 10 Sep 2024 15:16:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726006609; cv=none;
        d=google.com; s=arc-20160816;
        b=CpGMmlWQbc41xg1HcyEqircLPZwMpLfszB4XnkgtTRWtnd50ckgnX9pIzB0TfSwo7T
         46C7ONWsOVQljOwJdT7KDBOeJYdFFTNwPgRGC6ap6bKkiuscgxC9NIJz57vDyWewlX83
         cCzg0gyRtJBnMg1FN0HUbPZAWHpwmjRQ3hUHZFS8PGMKjANTAWsXm/9tzV9DEyTJDya3
         86YxBQkrrS3nwF93EIwuIW22meMGxm+E5WXzkMK8QHSo2VLJp2BjzGNugvlbAk72nCBb
         X2jQvFYMwXTwvXJ4TzxUULp2TBJmV0MEkrTiSI2xNILrvZCv4Wfp3GY6ukB0yeqa7ew7
         0F6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=wo4Kwhe0+9wossg0r5F+dnO1+KIF5dbmiqLxu6TdKHE=;
        fh=YlfwfKsEI/AM5HJRwIEzGLzlcOiwDoUZ5w8gIhGifHM=;
        b=Y16Ao24k7BPCVzn7lC55cUmH2hL852VmfyErhJ/rGalXsBfeAqhq8ZzseuHCaYjYFr
         7pU1YBrH0VJ5qkgH7GmuglaJ2zYQjZalVE/+KDe5aAZuZQfZMqcB3Fj4mYZSzO997Tuz
         DZZFy+qZ6xtfo6588Hi6cTmNUJBdKrSvGVfw5tcm0/OGs1twHz4gIuh6t49j9kHMgMLa
         XqC3iYSuEJlsUjbpnKi9Y+1z8na6Z25rvTTS2gbwn+CnjfxrV77r/Fz1W1AcQAVkHIk3
         6fFkr8VjVM34xDfkswZ/247JJ/CO3F6LW8/gLxRIASOFv1IxpghDHwQWgmulMoraC7Wp
         AWTg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="GjUED+9/";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-7d823458d2esor3278556a12.2.2024.09.10.15.16.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 15:16:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="GjUED+9/";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726006609; x=1726611409; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wo4Kwhe0+9wossg0r5F+dnO1+KIF5dbmiqLxu6TdKHE=;
        b=GjUED+9/mSV/2zdg3aVsQ8iIsG7Z72uHo1C6JUk4+ynJsULOnzma2ESeBa7nuKm7yy
         DynZVfsU9tzE6Aaae9+eKw5OQTZvIjQUAQYvvF8lL4hOqsv1o4YwKtn2494id1mqKXMi
         LXu0s/FzwbROjalDXtWmnlLFocUu9zDmYM4+lR0/gEJnqMEZx8xv8wg4JJYM1cYouohd
         XgrG0t7JU3/HAWepNZh6QwzAJKVSpr35ZffbcQq9mDS6PHthutcx81FlyekncA6DMwvG
         ZtJ5p4/RAq5FnJMm2rFARJPChAUVqgL2el+yvUP8zWoQptPoqJGiTsPMPFHt+3D+2xIV
         j1VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726006609; x=1726611409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wo4Kwhe0+9wossg0r5F+dnO1+KIF5dbmiqLxu6TdKHE=;
        b=RHcY26kQ/LPU5H1QOYFORv8+0NOcMowvDzXziNqDc3EqGyF/q5IvCRhZ/JvPkQhVXP
         j5IEm+fOELuNVY2omSvetmO1SkqQbPeRY9jibRPgZQxPuyjB/Hz9CitYLxTiXjlnrVu9
         kcAF1dCa/MTt/aeiPysAsWOhiRznguxtalPcVxDU01YExw4u+IF5sGaFpLJfHd3ToJse
         13+8SH4F83fOOwO+YblDZ31rLuDmEq3Wui6qvOu0BoVI/5GiJ+RowLGy7suTnJalKPRJ
         O7gOCRSnzm2mQc34JvIqvIfEdrFRsFqWlX0Yvt+3M3mZD+twGPkcXJY2SR0Sy0aHcqyc
         I7iQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdRxcgqFljakgU+1/PMWXabGl2u8EFFibalZAmR01N1iVzUqg8MwrkF8IdzHjHi8hCqxbW9qyDNpQbNw==@linaro.org
X-Gm-Message-State: AOJu0YxkPeXQ8L+7Nezq7cl0tFBFKkZRC1XSrenQqYvwXNG3vbSCK06h
	Xs/0nKqutLFIKrEKlBVWD+fQwM/PM+1jEEVtN29g+fMeUeu22sNYxPcOsakPZXjamQ==
X-Google-Smtp-Source: AGHT+IFtMirXMv4Fe5jm8EjT5naiSbZE3xCYCvlUGLPtdk4/tytoT9EI8pJfvAZvF8ck1TGbfKyzfw==
X-Received: by 2002:a05:6a20:ac43:b0:1cf:374f:40c9 with SMTP id adf61e73a8af0-1cf5e1b7fe7mr3167936637.38.1726006609032;
        Tue, 10 Sep 2024 15:16:49 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71909003d0esm1884055b3a.93.2024.09.10.15.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 15:16:48 -0700 (PDT)
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
Subject: [PATCH 16/39] hw/hyperv: replace assert(false) with g_assert_not_reached()
Date: Tue, 10 Sep 2024 15:15:43 -0700
Message-Id: <20240910221606.1817478-17-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: iaOr4qQcMCEQ

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
index 490d805d298..df47aae72b8 100644
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
2.39.2
