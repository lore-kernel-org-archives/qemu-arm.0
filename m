Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp1161477njg;
        Wed, 18 Sep 2024 21:47:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVnce0WBkuEC8p2pV2eM/LttNiVt4pe6Gy7qWSu4QqbOYZDQIe0mDpAJrTeOOssJnQU2nJ925j7x1Z9bQ==@linaro.org
X-Received: by 2002:a05:6a20:cf8e:b0:1cf:1250:80a7 with SMTP id adf61e73a8af0-1d2fca78303mr2735850637.12.1726721258362;
        Wed, 18 Sep 2024 21:47:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726721258; cv=none;
        d=google.com; s=arc-20240605;
        b=XNDy+XWeh5Cg91jhw7FPPM3rnFZaJnzYq+VQq2O6Gr5xHIH4ndf7RULMEpABXtPRsc
         7SS4uiiq+41IgwLDqiBGwTJfH4EVxZdDgfSkm1bISw6ynfqluz2njL1PRWo0BUEcRL9I
         FyIgRL9BvWXhzu6V/VJ8veengWf5+Ppj66ajIjRqyeujUCT2Av5EISic+kTJi+LrMtYj
         N217Esu7KBEOmvym/5QAyhLQAVw+GDBX2/teA6IZS4PIeSj81L55YXvmVh1O0uTb3OBg
         aXcp5zWwvS0iNmBKSri4kx3vyOv85DlTLVXx57VHAgVFq1M5XUE4tghUwi7UiHwxb+0o
         /UjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=eJDiyfguep+d+77wBjyKgjr0G7lr/7MmmWqca8wnD0Q=;
        fh=kEjY2BZyDapRrlpmcBZe8QdU+DgEII2gj+hMDNeMyi0=;
        b=hVU6xSjQ31M4gfw7NXWFBU19PHz73MpHyx6b2Pz0ZC6tWwBcYtXmDo/RkobsqqY+3k
         IRtAgt2LMO+V3yk3ssA2mPNam04VMnPJjv7mApgytYPAwZE1H9A5FPS5IqUFsbwkngDM
         06hk4PpIKZadL6TrUSMlC5mr32f68b2naRXrUL3b6OLCgS6I6ECBrmdcTZGvsZCXnDP9
         g+6NsSl0MPsFs/xSkIZx6j2B0c+NVrRJPHj5RRt35e/NIv5VcDUGaGvU7NFTEc61qNCq
         QFUfuYrtpYCk3vF7rjaAhtsLoaO1t6QTqCcqbuffJNPZJilqQh7oCEG3oWCA7r4uzLNm
         LvqQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eNw3flY7;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7198e174d35sor838816b3a.6.2024.09.18.21.47.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 18 Sep 2024 21:47:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eNw3flY7;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726721258; x=1727326058; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJDiyfguep+d+77wBjyKgjr0G7lr/7MmmWqca8wnD0Q=;
        b=eNw3flY7mZ+vCNcO6yt/1RSTNROraVFli444lbfmAOBtK9tfiQroQHRySTOLNLuIUK
         94M7aO8Hnp17y+DSoLR9f3xyD8FHH+QjKAUCDNCZsrOSy+e+avMkPjM4k3gTvESL3DpJ
         ylwUeEX6Rpfs4aGrsu7b+Pw5c21UmU6FWoGe94vFGQYj0vZcjV4wA3BCEUxjMszMMYHa
         T+FisoQ01TW2FRnJlL5Wfu6UQxJg4Lrm6+CnEhFlWiL0/3eeaTGAKilWGfWvVLVsO4g7
         xjVjcQxtF78WTvBCJ2M3bMBmYx9DFUnccMGm2lMOC5wj7XwhAVFHGJTgHbbSclwMTIfQ
         eZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726721258; x=1727326058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eJDiyfguep+d+77wBjyKgjr0G7lr/7MmmWqca8wnD0Q=;
        b=NJuhuDaW42Z0tlSAZr1ob2PGxT3otctXLWXihAyP23em++kzSQY4RaLeg9zSUlx1dw
         Gp0NDl7GjIIyomP1VPE498ef72lBmsE4znhFeKnailxIaz6Se8BOq7wMSebtkaNWY+LL
         v4uerOtqVau+vt1+0KUF6jNv/bKXP0xQGG0SIygDGPMU/6rzsvuWVUy5NZ0N+bCmZTVW
         ZKZD1PPkjDDzei6eBIuPPQjpvFIfE74TgXDcuEeBHL/wlgljzORAPaL2NjZ2b+HeRkMT
         5gC/hk6QYpT5etQ/vtcRkD7F34YPv+EQ0NGod8HsqaMUjpVELR9eq1pJ0vwN97a6NeMT
         b0cA==
X-Forwarded-Encrypted: i=1; AJvYcCWTCXtXz645LFmDmA3C8FJOxtci+9MzG9Dzsd+pB4ZEJdGvb4VEoc5ph2UEoZqW58IGeckZVQMDpwhKMw==@linaro.org
X-Gm-Message-State: AOJu0Ywm0jzIpCxCd66ps03v8uYR00MPEylyxi+e8L4FYW5IwI7epzYG
	Jljb2S5OeJzPaWoAZ4j9nU7456L/Zqr3eqZ99/adptZmRq53UL1t8nRHWEifxIRu2Q==
X-Google-Smtp-Source: AGHT+IHnfsGB0bg29RNFw85uJlnmT1vGFn1h2prLiEcUTMhAcq9d1LGEwFC0+nQGjVzZjK+KJFVYQA==
X-Received: by 2002:a05:6a00:4fc9:b0:717:8b4e:a17f with SMTP id d2e1a72fcca58-7198e2862cfmr2976167b3a.4.1726721257757;
        Wed, 18 Sep 2024 21:47:37 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944bc279csm7478601b3a.188.2024.09.18.21.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 21:47:37 -0700 (PDT)
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
Subject: [PATCH v3 26/34] hw/hyperv: remove return after g_assert_not_reached()
Date: Wed, 18 Sep 2024 21:46:33 -0700
Message-Id: <20240919044641.386068-27-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
References: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: N5FtohQ9hsJv

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/hyperv/hyperv_testdev.c | 1 -
 hw/hyperv/vmbus.c          | 3 ---
 2 files changed, 4 deletions(-)

diff --git a/hw/hyperv/hyperv_testdev.c b/hw/hyperv/hyperv_testdev.c
index ef50e490c4e..a630ca70476 100644
--- a/hw/hyperv/hyperv_testdev.c
+++ b/hw/hyperv/hyperv_testdev.c
@@ -89,7 +89,6 @@ static TestSintRoute *sint_route_find(HypervTestDev *dev,
         }
     }
     g_assert_not_reached();
-    return NULL;
 }
 
 static void sint_route_destroy(HypervTestDev *dev,
diff --git a/hw/hyperv/vmbus.c b/hw/hyperv/vmbus.c
index 03f415bf226..b36bd3d67d5 100644
--- a/hw/hyperv/vmbus.c
+++ b/hw/hyperv/vmbus.c
@@ -1890,7 +1890,6 @@ static bool complete_create_gpadl(VMBus *vmbus)
     }
 
     g_assert_not_reached();
-    return false;
 }
 
 static void handle_gpadl_teardown(VMBus *vmbus,
@@ -1947,7 +1946,6 @@ static bool complete_teardown_gpadl(VMBus *vmbus)
     }
 
     g_assert_not_reached();
-    return false;
 }
 
 static void handle_open_channel(VMBus *vmbus, vmbus_message_open_channel *msg,
@@ -2021,7 +2019,6 @@ static bool complete_open_channel(VMBus *vmbus)
     }
 
     g_assert_not_reached();
-    return false;
 }
 
 static void vdev_reset_on_close(VMBusDevice *vdev)
-- 
2.39.5
