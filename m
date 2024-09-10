Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1444546njb;
        Tue, 10 Sep 2024 15:16:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVMjv1TvhhHA0pX177AW68TNksdE26x8O1kmrqbXQUHhUAXpBPvIc1O7IeMiDYOO6JyDDPzubg9fXRZcA==@linaro.org
X-Received: by 2002:a05:6a00:6f4d:b0:718:eeab:97ca with SMTP id d2e1a72fcca58-71907d98483mr7997573b3a.2.1726006611955;
        Tue, 10 Sep 2024 15:16:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726006611; cv=none;
        d=google.com; s=arc-20160816;
        b=AuCFFsWK87LykbUCAlAZWRI5Z6qfvCU60dSn+QXm6eADrKRfeGLXQZ61MhNiC04kCP
         3tDdjX6qyvy/MteuvY5KN0n2zcBcCBWyjwF97pY6zF4Rbx6lH3KFShDgFl4LS2rMnpul
         kb0+BE74wuL/VgS6JupyTJx5PP1+S3MygPVunCU0O1omFX6LFzR+Jz06JmLQgDfbQk4l
         LfY39nX8897fqwfuK01yfAeCL9NVIrjLtFNDoyE67vaAmvvUWBEwyGKiGy9vXKuvPLNS
         uSV1u6P/u8kEI98QJqqe+1L6XbCtz6w7h3apf82mz5OdDdLmEfdSvT+wMS0I7ZCU7+18
         6T3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=agjxPNPZhkjhF3pYgx+4YrvSC0QezaRTWh5rzAMbA6c=;
        fh=SdlVHvaQIfGQv/aJ8GKks0zlO3eIXSNzbvpiMmfVjeo=;
        b=N0B7SxTqx7b6jD5UFKJf+mNwQEFhHhR77W4h0kAY53jcMgXubZNTSafCIKVFPWWXiS
         QXhRsoTpKH1MC/b0Y1pkqhUk+lbecLFU6Bt0WIw/+bIgYephbSjO49jgGSWJFOmUZYMc
         ZjmesK8ACOaMtL9gWOE7vXtD7MDCiTK8CAZrxHztre/KEO2ygAnVF8SHd4W99cvgyF7i
         H84EalBhYNClIXyka47GMDsmLHPSxM6XvgfgWjWEs7GzVofc1Mp1mySFCObHr9za7cN4
         gPj+5E3Ane3oioEW3uiLwGBjAmAc60h+8+4VupLrY9mvpHtOyk127tMYr3rrqFI5Bd80
         F3Tw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WS7b2CaR;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-718e5829c07sor3618407b3a.6.2024.09.10.15.16.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 15:16:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WS7b2CaR;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726006611; x=1726611411; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=agjxPNPZhkjhF3pYgx+4YrvSC0QezaRTWh5rzAMbA6c=;
        b=WS7b2CaRc4kKC47ceQ3Dv6O7KzGYwxCyQA4STuBLr457hXYKHzts9i1ckgP/Zqcl7j
         R1GmvJ16Xd9tgvU4eXRWWlU1B9n3OMi9tmfqLNXgmbL6lgUELGf3os0xUHPmZ6psVE2m
         Arre4D+DZK4OoEqGJoQmoJxzHhT0xrS2eJjHV6QZOKvRN+ORiMkqr6+AtnPu/IO9bT/j
         6+6ew4FfH7tdE1PyAxG4oBRIfQVpAGItMNUrRRCnQZSPzwDyHOL4sEZaBtE8ko10qirt
         XDV+3HPKKFCHSPU0iRulGUXLnedEzCBXQf83BzEDVFI26EcAx7AWpQ4T3x4wD7bnwEtg
         zJrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726006611; x=1726611411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=agjxPNPZhkjhF3pYgx+4YrvSC0QezaRTWh5rzAMbA6c=;
        b=WPUawKHBWcJsoDghAeCjzGeQelAMpxJJYpIyYW+SNyZDOSZdZeAIoUdpznEdbjPJJ5
         IcD7T/JC5cW2ycem6pqFlmMObKrbAjTEbDvd2RFcy7aBCkj2iDMdpY0gl9Oiezvd+PyF
         67G4CLkD9wG6f9rlVGqdWpROYb3qs3Z0ZW2i7/XzXqUl5DVIp1MUbQWsOouZTp2e5wmh
         Owvopm6+yPbTrg0kkQuUFAI0mcG3p9vXstgc70ntcFPeddWLEgRzSwAvpohP/DCeppzG
         mn0ltjPoJ3gKMPcUAhMBHuiatU2nwDXkBOFt+KvePTYcTvn/KuqOPcWAcsi1/l+WrDeQ
         0ZSw==
X-Forwarded-Encrypted: i=1; AJvYcCVmiTbC3hyw4Ac0QhBR6ZcQ1DqFCMWmDLFXFSR7XCxabH4IkaqnlqC/f73QP3l7ucXDtHveMs07WCf8WA==@linaro.org
X-Gm-Message-State: AOJu0YxpIWfpwotsngDcMzMUhObrfrXHDAI4ZjExoiQOvg91W/zux/k+
	9b2UTHOz93l800zVy+k/3eKr2WCQRQ4nP7omyvebiwTBoB3bJq7Wjb9y7RnO1BRsDA==
X-Google-Smtp-Source: AGHT+IE1NeVPxPuTLt1hWZFnlbeldnxIM0Z4VwcI8eWqQlrC+NfwnNfuoOxOt9dZvUfA9IM8krjmMw==
X-Received: by 2002:a05:6a00:6f4d:b0:718:eeab:97ca with SMTP id d2e1a72fcca58-71907d98483mr7997533b3a.2.1726006611406;
        Tue, 10 Sep 2024 15:16:51 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71909003d0esm1884055b3a.93.2024.09.10.15.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 15:16:50 -0700 (PDT)
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
Subject: [PATCH 17/39] hw/net: replace assert(false) with g_assert_not_reached()
Date: Tue, 10 Sep 2024 15:15:44 -0700
Message-Id: <20240910221606.1817478-18-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 4Rjn475iQDRK

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
2.39.2
