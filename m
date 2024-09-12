Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp422940nji;
        Thu, 12 Sep 2024 00:41:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVC1om4gGeKSMNc9gLg22jWx9xWvxa2wAkL5aFUVCWZoTbvYFYRSarxZhgvXx3hOePlztbxkteU/rm00g==@linaro.org
X-Received: by 2002:a17:902:db03:b0:205:8b9e:964b with SMTP id d9443c01a7336-2076e416f03mr29832395ad.39.1726126874922;
        Thu, 12 Sep 2024 00:41:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726126874; cv=none;
        d=google.com; s=arc-20160816;
        b=gU5hkbtSUKYtGVfbdPkA0Tt2wmJd+PXSfsIGX/UTJiZTWjGBJQlAvq3kynZxuEr+BK
         6p0ZcYVLAGbBO/DM/XU1eI7wKGDdLe6A1uw8TzTYCkz81JFaueeWjKCu7B9HdujJJInY
         0YQMoM7m4TcpVfN2QdtmWGQwuzNHCc7FBZBw7zN+FVEcA8vYSRI9L9UIgS+GEW0kZTaz
         Zs0wdfzBAAHffxm1gadn+s/DCXV8dcItvvGqLRmNNCqnHsUzv+5S9Kf2GYhaTcX0LtW+
         3BxwAlQ7LdbZAfQKWedEPTh9vGd0CCeoq9agUcbJjigxZPueWqcPukhiYeggRGOF3KuL
         Mj1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=4vXYJ3kbU9hsr2ebFSyiWuonl8XOv822rbyHItwqNMM=;
        fh=WTqdqC8hgce8Fb6hTV/OwF1OZWsBCcI6BUYeuV3fbLk=;
        b=isgUKBthhRPeh2L5ffif5pJW/KtybBskFUnv75eR9Xiz/HKcfd0cGu+nBQ65XCle33
         iw7D1b5307SppbjB2o69L35aQZxDY+BBhTmZUiXWfBH9TmnBUr+md+ZX2Y7+UDbqL8mJ
         gdOD8MvK8/Y50u07bhhi/fudLWT3l5nNcfxWRllTUux6iw3/qQJPJ52QptyXmjR48nKn
         amWpmqUwmTwTBLi04J0sTbXDAlIP9n+dOys3D22Imsw9/2DsEojhOjzILhC8puiZ/bxt
         VKUvcQH0cqiLtn4MNsyJRO2q9M7cvHd4P+Z/5lGojHCWUlPzPD8cHfCFO5UFZNQXaRw2
         k0/g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="GC1/QCKJ";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20710e44881sor67355575ad.5.2024.09.12.00.41.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Sep 2024 00:41:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="GC1/QCKJ";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726126874; x=1726731674; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4vXYJ3kbU9hsr2ebFSyiWuonl8XOv822rbyHItwqNMM=;
        b=GC1/QCKJ6NsR37JvDCp/gVwWg/X37gW+4xG5ZRPKKxmDJAUXMBDiyhofgLI/BQIQ4h
         npagvo6yvPQC0TbcvlDjDGWJ6xP+AjchsjX+nxBLuraFYxRdCOBscQl9J3lA/HZXrdna
         8jQbTPnP+HCoDccFEVgxVtQ9+8WUNWbJhLiNs7KPmMEV5VKJcasfWMclCio1ozMPn46S
         FWxmDFu60EwAn2wMdVBK5W7sn7AGgAkoMgDnKIOHuM54jHp07N1k+Ifo1s9d2DOUoKYc
         oGIqboiPG6ruT+2FYDeW4Tr3VfU0hBY64CgR41CjkxMD1oQRifnbp2paB5NOvmuE8DiV
         abvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726126874; x=1726731674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4vXYJ3kbU9hsr2ebFSyiWuonl8XOv822rbyHItwqNMM=;
        b=c15LomSEUudfQom6pz8ImazXs/zQu/mK2qM9uDVYWpVBK/4KKEYL0a2yjvF2qp95gA
         Y7BUxQCR9lF3blfLKQUekEH9UZL1m1cuIFYEv+XDGdlwuMEWUOG0B9c/faKDcI9AGVdT
         hf6PX5lXHnXTn76EvDWB7SCCdWDSWhyGV9OrkarHzA97KeO1nVs4pSaWQluV+ccuHOPH
         wTO4uuMaBeQdN3ZGaKi1vRS093eSETsd+Yx+jcQRvYmwwJksOl5xMSMlLhqo6TGq5Mxe
         dgNM6sMB+HLfDDMmZSkHLVO1L1P9874lV+gJsYl5DLm48BZ48+SIBdDu6Plsib3LWsOZ
         OM2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUO0Jkqjn8hBDmFZOdDdvfUglXAjqAQAMfCdby9W1TAvvZqPq3fi643tX76CKbaK797rTp0c2Wpq4WYcw==@linaro.org
X-Gm-Message-State: AOJu0Yz5k0b3EixKYzY/crf9Bu28o3QF7ds8mXfmZgndEwkgpU72N2UF
	qFcChW4UzGWNHJ9KpUWu30RnlH7y0PUOYcq2+bXaPUfc+Xo19Qtn43XNUC3SuR820A==
X-Google-Smtp-Source: AGHT+IGfovdnAqYWOwtqmXfs1YlWNLytry27KoN7DkkE+JMDdDN0epVDte/LII/bTeQGg3HedxA6ow==
X-Received: by 2002:a05:6a20:e30b:b0:1cf:6d67:c078 with SMTP id adf61e73a8af0-1cf76237989mr2787587637.42.1726126874107;
        Thu, 12 Sep 2024 00:41:14 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fb9ad87sm983458a12.6.2024.09.12.00.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 00:41:13 -0700 (PDT)
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
Subject: [PATCH v2 41/48] hw/net: remove return after g_assert_not_reached()
Date: Thu, 12 Sep 2024 00:39:14 -0700
Message-Id: <20240912073921.453203-42-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
References: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: YXegyVP/IqqR

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/net/e1000e_core.c | 2 --
 hw/net/igb_core.c    | 2 --
 hw/net/vmxnet3.c     | 1 -
 3 files changed, 5 deletions(-)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index 248381f9766..2e4c50ddbaf 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -562,7 +562,6 @@ e1000e_rss_calc_hash(E1000ECore *core,
         break;
     default:
         g_assert_not_reached();
-        return 0;
     }
 
     return net_rx_pkt_calc_rss_hash(pkt, type, (uint8_t *) &core->mac[RSSRK]);
@@ -841,7 +840,6 @@ e1000e_ring_free_descr_num(E1000ECore *core, const E1000ERingInfo *r)
     }
 
     g_assert_not_reached();
-    return 0;
 }
 
 static inline bool
diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 6be61407715..5dffa12c64b 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -398,7 +398,6 @@ igb_rss_calc_hash(IGBCore *core, struct NetRxPkt *pkt, E1000E_RSSInfo *info)
         break;
     default:
         g_assert_not_reached();
-        return 0;
     }
 
     return net_rx_pkt_calc_rss_hash(pkt, type, (uint8_t *) &core->mac[RSSRK]);
@@ -747,7 +746,6 @@ igb_ring_free_descr_num(IGBCore *core, const E1000ERingInfo *r)
     }
 
     g_assert_not_reached();
-    return 0;
 }
 
 static inline bool
diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
index 63a91877730..6b5185c707b 100644
--- a/hw/net/vmxnet3.c
+++ b/hw/net/vmxnet3.c
@@ -456,7 +456,6 @@ vmxnet3_setup_tx_offloads(VMXNET3State *s)
 
     default:
         g_assert_not_reached();
-        return false;
     }
 
     return true;
-- 
2.39.2
