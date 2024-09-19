Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp1161484njg;
        Wed, 18 Sep 2024 21:47:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW1sYqQNf+5HfYXd/o1H/5cucIH3L9893AC6BQ5ngBZl4H04ry//XPF2xZBdfN6xTq+yweG4NBw1voZJw==@linaro.org
X-Received: by 2002:a05:6a20:e30b:b0:1cf:6d67:c078 with SMTP id adf61e73a8af0-1cf76237989mr34389334637.42.1726721260338;
        Wed, 18 Sep 2024 21:47:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726721260; cv=none;
        d=google.com; s=arc-20160816;
        b=hwBKqN+cTHtc/ZekFhLky07Kzx7iqwkWTi3YnAqMxZLQu11LuTVRK0bJxaBlmhMK9t
         xImQmLT8I4oF6xTdbHlA6EplZvRXyREMCcVuRnTK6MrnJGw/TKPr8zZhRMp60nLVG1Ob
         U8shDG+Ayci71INO3w0o1blj55kUiqMY4+t6+qYu0Flpmjm6IFq1uIYY6yfRNgeiD5JG
         /iRP6YIEv8oaSEHodDzPiSYX6MpwnhVrX1qA0lJHird/VjN4sURcExtw74ffITit1TbS
         OBWEOvvtTxQ3wDGVDxq7+NBVZ+Lcym0Y7CjixhxTBYkdgabJFvXmbc9TIkRTQQDKO+ua
         4RGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=aVLlQ1azCZTPpBP5TtwQ0P5RnlTFYhwK6Tm+S/9eUGE=;
        fh=bmeTntWXFOt373q62Q+BdPqePhlrPP7ltR45MUPbY6o=;
        b=KQ9BmLxV1d58VRWuunRgrhbFO21nb32qfrv08iQyeNEE5MH9YksneAnF4TXE14HAW/
         7glIPGZzw8BdWAqEWTDl0E/OtklmA62g8hki8rkBZGcmqQIJcNqWAutl/Nj17Z6i5nSI
         E3CBzBipExuy91ozR0Upv+UYOdBQN7xwKpmTPAY40sDWgD4bdIAguNkDO6XRiMkphn3j
         tei3nzmR0H/UgtbDbjDcQrDaP/E5PXbMW/5FIlYulLXmh2TSiXmNQ5dzV20RMc19Mmqq
         eIU0I4rdpMLno7bxRa1z4SA5kvzdxx0J0L4pP1lHiz4lt+l6P5bRzVLtk809Pr9wjrHl
         H2eA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YxT67t8p;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-7db499d4596sor4368344a12.5.2024.09.18.21.47.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 18 Sep 2024 21:47:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YxT67t8p;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726721260; x=1727326060; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aVLlQ1azCZTPpBP5TtwQ0P5RnlTFYhwK6Tm+S/9eUGE=;
        b=YxT67t8pFprOqzF/84Sjk2j/1k/eiusrd3Z2YDrRZSaUwKEFLoitfuW5a2egwlmI7F
         LhG4Zh0tbhQY2bQ6pJOmAGTjGSu6rAsLT+RvO1rddvpcAGPeki8BmrD5iY5HccGIFIOt
         an81eBeMQQcTgeEMqB55ryZGVZXWLFhLZkn30XMq0r3+VXgh8ez+GRsBRGCOn2Y+u6fr
         4k/xwatfPrqrJ/dViexPza0aPUo9gN8iZraajSpV30UjFdUJUcYzRA8SY4BO9IhxDgRC
         4NacwHMtkUwCC7EP1cUdQEJir0bCYmBRuuXJh6QnF/uUW+4RNwDI7OI9y+0Tu5pJO233
         xGwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726721260; x=1727326060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aVLlQ1azCZTPpBP5TtwQ0P5RnlTFYhwK6Tm+S/9eUGE=;
        b=tcdCW00YDeFruONgl4tY/xkICDnk05Dygb1i6Vja/7cmWcpm12Ns5exb00w2B7d67u
         B3FwCMbuwK8sPz2A+WE4BkmRSnhUbmSDLdxvKfJ1kcIaKfpGDUwgLy0PLokE8FTrn73M
         ZClSHbVMzRO6msAUUxpyQdOGxt0R1/NpGgqFVks9kTvMR3Z6K65Jy/Dx9gHHJdEyEJOd
         Ylj9IfUsgVzOZ2BZsyvhkY9EOHR/VlytI8QhazXebcRZh8xxWqxh35EWx+812lAXzrAk
         Q+bzTqMRGJDYT9lBlGUXc4nNaNSesmgJuGEO4jqpBWTT0TNvEqiz5raYh5QktQyID9du
         eSMQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8BRDVGrqvE9NjqnqmJpYhT6UOKay1/Lq/S0wQAqNwnbDLBMSP61j1YQIY/AoGl+DsuONTnJEwyJFPdg==@linaro.org
X-Gm-Message-State: AOJu0Yxmg6yBVcLyoYslardXL56c18xs65kqIXoc95eFyelYhoAzFuqJ
	pRtUE+xPNIYHj+rKSXxEcZPV3l4algCDSNMr/TsscgnAxT9uW4spybwP35fLp5tweg==
X-Google-Smtp-Source: AGHT+IGrzvQ2fWBlgZ0/fu1uxdvH2ybmzImXSv0pyHCUPeGuO+jD1r3RwXqEDbd4priHhUIUEE1u1A==
X-Received: by 2002:a05:6a20:cd0e:b0:1cf:476f:2d10 with SMTP id adf61e73a8af0-1cf76239c98mr35848879637.49.1726721259880;
        Wed, 18 Sep 2024 21:47:39 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944bc279csm7478601b3a.188.2024.09.18.21.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 21:47:39 -0700 (PDT)
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
Subject: [PATCH v3 27/34] hw/net: remove return after g_assert_not_reached()
Date: Wed, 18 Sep 2024 21:46:34 -0700
Message-Id: <20240919044641.386068-28-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
References: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ZL+BKhZT4Jc4

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
index bb8583c7aba..8aa8c462283 100644
--- a/hw/net/vmxnet3.c
+++ b/hw/net/vmxnet3.c
@@ -456,7 +456,6 @@ vmxnet3_setup_tx_offloads(VMXNET3State *s)
 
     default:
         g_assert_not_reached();
-        return false;
     }
 
     return true;
-- 
2.39.5
