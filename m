Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp422624nji;
        Thu, 12 Sep 2024 00:40:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXa+htgxos7oU+eMBe3hzjm+c6vHnWPclxqvkSalfhQh9Hl1l4JjqWbXxiXofNKweeQuZmmBuZ5HcBJiA==@linaro.org
X-Received: by 2002:a05:6a21:6d96:b0:1cf:4418:4517 with SMTP id adf61e73a8af0-1cf75f3b7e5mr3033298637.29.1726126809133;
        Thu, 12 Sep 2024 00:40:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726126809; cv=none;
        d=google.com; s=arc-20160816;
        b=OsE44yKGFtPT4/cElc4wwOzp1rlg80l1xRyvJ8sFzZS9mTH8aMNR7ezNrno2aA8UaG
         3Aw1vv/uiKCxbJ8c1THYpxJWrthoey4scMGeCI6QZfhEn5cdj/7wzQ/OCe45ImLJLNhW
         NYWiuk5fB+KRReqonT8J4Sdh6oN64MkvJQ53vSvgUHQGGr9giOS3K0i1jdtlKG5COgSn
         EIAgPX2UdHwDw474C1YY1vL6np8h/6ljG/ipJmrjmrNEorv6VmKnC00FtPzYqwwXa8/f
         YYpoJsaQlQBX5kzS+f2ZH3gxNNqIP0sZfEtEEl+B9ghEWLKhlXgUuXamk9GIwUaQj+r2
         PbKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=P59BoCfpfnoUAXReWsDYStuySlGSOxKrMipSHR5f/PE=;
        fh=ODVOjflWXzu1uZJy5806aOa1o/rxYhA9w++98ImbtWk=;
        b=wEfvL1VvKN3qMcBd3aw4uu07acGCJv2Orxv8pJbw+LVhQDKISoh9PrZpk5288WQdgS
         yP4Uh4VQMB2aByBnV0Pb17Ko/TW0oQ7Co04z0KsCGg4p/VHTQuQUOSlQCm7RLG8Tfr5W
         wwb0vmR00+Ri9dRuYaiiyNLzDeVBYVFjOLjxggxktb5DBeZR7aGfTPD1ToXSrHjk6/u8
         +sWd4Febc9t9yy1P8G/XhjliJomeJL4shSM+8xLYufzDTG+VcaJ1l/szIEAUc1JRxQXt
         PQTS0DfTWAFHl7/IrcGwu4Dcp3RAA2Agcqo8YiArdzzUzfJbs8BkPfQBSMFEIpfIEtR4
         BpAA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tMtbIIbT;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-7d82635685fsor3664265a12.10.2024.09.12.00.40.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Sep 2024 00:40:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tMtbIIbT;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726126808; x=1726731608; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P59BoCfpfnoUAXReWsDYStuySlGSOxKrMipSHR5f/PE=;
        b=tMtbIIbTfVwcUCoo2WrFxRjgit6NRez+/VoFRWvHIWWfVApalHGtWB5KEKHUEP7+HL
         0Q22Unz5HIBjY93LKTpTJbYcP8zgAmBtBygworLyWcey7aK7cyEw6YwRDvN6aibN8cne
         htJuXR9+H8MwQHwWVCGAgQpPOfptPu0Z5QFRfllgT6mCfzkxBdAJh/k0PKX5nomhbwky
         bzwyEoNiGj+aXdxPx4Qxl5uIfU4H0dlW9a2/4YM7I1T4aWeKZ/JZ8mu3KrwCmh214vGO
         AEuxd1/a5bP85a6NS5F0WGfYiIqVZKl6WQDWhIFIrrmVii+b4+kMbpP3Q7HwRN5+fu2A
         LRsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726126808; x=1726731608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P59BoCfpfnoUAXReWsDYStuySlGSOxKrMipSHR5f/PE=;
        b=Vjy6FFRGGIA8rWQToc5YL4u3ibcWMAHYoySA7aJm452PyhS8PebnZ7yxtsi/uUpZ6z
         39eBbHigeZQ/SkzuaQDC2TIIKSja9Quv2QlNwdh2lv4XGEwIn78Wq4OgcAA3llVlHH/z
         7augsh4qo/tISbzZHygzIujlBTVViuCcTR8f589eFKo/eNhUnX3nJTqKzjCvjXvQq014
         WjcgK3OSSbpjKYJY+Ui5UKIEf2nVxzv8vGy8EGnoxTZZUXCQcNqGAtwxXb43hbvQnuCu
         UqEAntEaP8JCxbIPr1lLfJPnE63/MuBArzHixZTvPF9UoZgYOa0YvUDlJ06q76VzVSOT
         AoFw==
X-Forwarded-Encrypted: i=1; AJvYcCUKh8sLBb5uMtWVI58MdK0tFEdP3Nm2g9RdUzUf4Ti0Y/FmbktNqTi3ZFvZ/a1UnC01Rt/5bwWjem5YJw==@linaro.org
X-Gm-Message-State: AOJu0YwfxDb9pvu9bWG2G7+3X1qVSihE1buO7SRS8E8B8x0VYSPoGP5c
	+SmfhkmFi8Y7j2gmZmN12uIY83qj1ebpaRDAK5tlP/y/FmcyNH6Yc2dOHc8JmY+/Qw==
X-Google-Smtp-Source: AGHT+IHWrcePIqQHDHOWlFI4nJcx4ZMXRIsFR9KI7njLnd//xW7SZTBR6BsOUNPJAp3rZN3BYPs/RQ==
X-Received: by 2002:a05:6a21:114d:b0:1c6:ae03:6607 with SMTP id adf61e73a8af0-1cf75ea27bcmr3064643637.6.1726126807996;
        Thu, 12 Sep 2024 00:40:07 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fb9ad87sm983458a12.6.2024.09.12.00.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 00:40:07 -0700 (PDT)
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
Subject: [PATCH v2 16/48] hw/hyperv: replace assert(false) with g_assert_not_reached()
Date: Thu, 12 Sep 2024 00:38:49 -0700
Message-Id: <20240912073921.453203-17-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
References: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Ih0FHbxb62Xn

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
