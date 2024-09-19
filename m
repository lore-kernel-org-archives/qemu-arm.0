Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp1161314njg;
        Wed, 18 Sep 2024 21:47:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW4GqnbsfvRdwR0yIVsrSiAvM8q4F+Bc3kkEOiwSlPhCxA9rgOKs6B+PZZ4GmfCV8Q77d0E51iM5GvylQ==@linaro.org
X-Received: by 2002:a05:6a20:ac43:b0:1cf:6625:f08 with SMTP id adf61e73a8af0-1cf764c25afmr34895115637.45.1726721224844;
        Wed, 18 Sep 2024 21:47:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726721224; cv=none;
        d=google.com; s=arc-20160816;
        b=JpERxCttloatnzNUmtKXWm2i9kI3/sFdfVORQop2cHdv5PCgZFtjVqWjO8Kx3rlbjX
         s62tZxuvsDVfaGpJI9s7okt120XXI9kf/f5lSyPKug50d+3ckbdYV9tH66LK9tkWqBFZ
         poaqh9dvwGUzmr3O2zLSfjf9zlRVMPyHVPJttJLmpIuJ94FxEJJvJEiUbpHhg2l14EKx
         IqnYRv7vtRyuP48SF8lgQseBGAK9X0CrW52ENsjWI8DA8Enoi8HuN3fRY+aB1xrbrZfT
         VSQRtDoBnD84i69WhnFxuBv7qYYK2vtDs5w2nuK2Fms2MBbzsqNI7WblYz4cXaKuTjp+
         mZ0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=HfkyjDHktRIdC53aV7jz+MEYNAmpLLxTbQ4xm76fWo0=;
        fh=ZKcvryNTpTJGz4Iln0WPAhbrwAinTy3ZxOH9RtkXXqo=;
        b=k8Vtxq3JxQnEyA5Q+szau9OJlZpHbRoUsFxEONWJ//HUI5dcxFl8hvSOjAKB2T8xSg
         0RDGEyhXVkUf5F2OpuahALTjfx2/TH8jzB8e7n9Aky6f6tT+ft/HI52YCJ4xQMe0rmCc
         4GH8bjQbtf2MO6ZkhPbIKmyuybeupLh1GIBgPoc29r8WZ92qLIuqWR6HRKYzGoiQae7l
         QihQKHuz3b0l/lVfiG+bpuKloxBznmlRSxeON0krRmugM66G8SgoYNw4yJ3+98xR1aFM
         ggSi3TbVYsPghl+kz0I2p/6iuo8p1s+BQlXxlgvQpOqDYfca9vqiqrdpRBqLNV83spb6
         GoFQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qrYPUl6C;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-71944ab6c18sor9146082b3a.5.2024.09.18.21.47.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 18 Sep 2024 21:47:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qrYPUl6C;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726721224; x=1727326024; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HfkyjDHktRIdC53aV7jz+MEYNAmpLLxTbQ4xm76fWo0=;
        b=qrYPUl6CCAaj+Lwyz4LKgrW6PGQsk4G5dgLb0XZKVdkDgrL2p3rVhn5/l3RVfWkIb3
         U/U0SK03pssHcdP/ScimuIk6UySK/mWpVCSIAFvItwb+ER9AFCOuRGjoV+Iz5jia3J+q
         LHYGe1wAL0FpDqzVuzan7Vhz9Atk56kYZcfm+/OL+qHHQprhtJM+QKeNJg+9aXGyAXAW
         HTWmT9difjpK/jGnQng0ieEA6ydZiPF9fNB1kUU0mjfeuydAfK1nb+iGBwLXqQLyI5QZ
         rykOsV6Bw57ORdbdHA5fSe0gAMcit81cb4zlvjE3MLr7Yt+qXVuYYpZF7vUBBZ7T2PBc
         TkQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726721224; x=1727326024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HfkyjDHktRIdC53aV7jz+MEYNAmpLLxTbQ4xm76fWo0=;
        b=LFO2F6DSsQ0SVPkoiaQON0JFvI+rTNQ20krXSA6qG0l7ty5kMkkfyx9wriIRUZes47
         4XCzE4z4LajCjsgYSh2B/+dhlue8C7q7xPs/TQaGwUehnNV5Z1AGkAfNKU5DCkemg2/c
         uICSAkyc37wGpFyDT9vDaB7xtgMfJm2c5JQqXcY/DwS2UK2QtPPfI5/ObC5mIr+CByeR
         1UFQik0Ll9WGYu7cCFABmH8EpDsHYv8mef9gzPsTB8TuvfD7Y9l9oUPNFDoYXSB/LtOc
         UT4Hg5yhPoUOFta3sUsC1eeqKRRvSir8dTIt0M56a9t0dWwDlrb3qS+WZ8OT5xMx/zec
         jX0w==
X-Forwarded-Encrypted: i=1; AJvYcCX5B9L1qEiEhZ7JzRzRojTITxLKn3jgczLinY2Ce6dtPJfk7WD73W9bCEu7GPOMGSizHVBa9SXk4fI2FQ==@linaro.org
X-Gm-Message-State: AOJu0YwFae8F5vbJwXcxSUz4yWMKksoZ/06XKmOubPG0e/lR4FHJijCV
	c1yG/EgYRjQ4VdU+j5AdRAnlDpPN7eEACruscejIvkIR+wK9MCFLjkpNQX5hYLzuFQ==
X-Google-Smtp-Source: AGHT+IFbn4h/5fpDdM1su4Z9mSEZxrAAcU1BwZZyKC3gnrGjV7NEGzkE2iqfTaMdogn2HPgRWiWmww==
X-Received: by 2002:a05:6a21:3a44:b0:1cf:2ab6:a348 with SMTP id adf61e73a8af0-1cf75ea1dc8mr38949451637.1.1726721224333;
        Wed, 18 Sep 2024 21:47:04 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944bc279csm7478601b3a.188.2024.09.18.21.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 21:47:03 -0700 (PDT)
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
Subject: [PATCH v3 09/34] hw/net: replace assert(false) with g_assert_not_reached()
Date: Wed, 18 Sep 2024 21:46:16 -0700
Message-Id: <20240919044641.386068-10-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
References: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: NNsCTw60QV4N

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/net/e1000e_core.c | 2 +-
 hw/net/igb_core.c    | 2 +-
 hw/net/net_rx_pkt.c  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index 3ae2a184d5d..248381f9766 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -561,7 +561,7 @@ e1000e_rss_calc_hash(E1000ECore *core,
         type = NetPktRssIpV6Ex;
         break;
     default:
-        assert(false);
+        g_assert_not_reached();
         return 0;
     }
 
diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index bcd5f6cd9cd..6be61407715 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -397,7 +397,7 @@ igb_rss_calc_hash(IGBCore *core, struct NetRxPkt *pkt, E1000E_RSSInfo *info)
         type = NetPktRssIpV6Udp;
         break;
     default:
-        assert(false);
+        g_assert_not_reached();
         return 0;
     }
 
diff --git a/hw/net/net_rx_pkt.c b/hw/net/net_rx_pkt.c
index 32e5f3f9cf7..6b9c4c9559d 100644
--- a/hw/net/net_rx_pkt.c
+++ b/hw/net/net_rx_pkt.c
@@ -375,7 +375,7 @@ net_rx_pkt_calc_rss_hash(struct NetRxPkt *pkt,
         _net_rx_rss_prepare_udp(&rss_input[0], pkt, &rss_length);
         break;
     default:
-        assert(false);
+        g_assert_not_reached();
         break;
     }
 
-- 
2.39.5
