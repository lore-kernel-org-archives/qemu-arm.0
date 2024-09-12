Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp422632nji;
        Thu, 12 Sep 2024 00:40:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWH1Gfx4Oq/zUPGenJOxDUdV5vlyZpVgd1hiHwLZ93y/p/+g6o6TF6IeHApd855GY/OCANi9FyLUh9NYA==@linaro.org
X-Received: by 2002:a05:6a20:12c8:b0:1cf:4be7:5fcf with SMTP id adf61e73a8af0-1cf5e059bfdmr10861016637.1.1726126811072;
        Thu, 12 Sep 2024 00:40:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726126811; cv=none;
        d=google.com; s=arc-20160816;
        b=FWVUeQ0HUvZ3+at8b6ClhBMsB8AksVnWS8ddjrPeRXi+UlXwQJTnlAs/OqrQPYne1y
         Ez/XXyMowyeXyxbvs62/JAz9ZAEAe6Ox6h1/XYE4xyL/nsd0h68VEZG2wHOk2yVcPZWd
         sva8XRO2mONmZneDU5lrlMUNb0Xtd7dEzYp2eToRg57xE40gPf9XJBNzf0KYEJDTGq26
         lshytVIO55NA+BP4c8HehGrjDOj4vW0AUZeEStxm0hDw3gqJHvX8TAab83Z0f2CqSUde
         h2pvIao/7WcPIb+JDqHB9jxavlvHCz2HGHS3FDUg8nm9lkGNwjk8rS8mQDXW7mnLROKr
         0qPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=LUkTeAVAzR9AYc2U0wxTWgfR6a0KVPFNlmWMjsS+ujQ=;
        fh=5B0pftUtYk/HUUqrIKpqCxtLWj4HcJxeW+ty6OMx5lc=;
        b=v1sinMzg+rUkmDWc3x3u+BWNr9xfbK9oSYL9bB2QjgxqS8svmUnxIAZU04dmr6dVuF
         IPemjv3RSTixOJChfezJfr1vlO6e44U2dBaBF2JYzCBg71OXXMePYftXmharkJaK3v9V
         yL6ihOmnEkKXzmZCMIK/YVGjWqjyZDt8wVw3R5vW/YrPd16v71Ik6t4cHfobyBF/FKP5
         vMM8oSQSszAMMX7PX2Ue7eCx+HJJhS3WFU2SjWusjqw+z0YU3GWGgX+1aKQqhexcNgrw
         GJfjF3FWR8Tq2XEcOlxp5cPsgItc43sZOgMNcWoQigp51Jz1y2pHbUGmqFFwjYsUDh4w
         rv5g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ElFAq5QM;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-7db124a7639sor1484658a12.4.2024.09.12.00.40.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Sep 2024 00:40:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ElFAq5QM;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726126810; x=1726731610; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LUkTeAVAzR9AYc2U0wxTWgfR6a0KVPFNlmWMjsS+ujQ=;
        b=ElFAq5QMdEuV9RDK28mbQdAjB06Wr0257RdRx7V7T2cPlxkYVPvqj0CG2YkV0CT0Cu
         GoQAh2+ALSWJliNFiFgyeLpCmqoeb9CwfRijOKA2sMSv9245+3N+VvrS45XMq16JHhTM
         KLdZOd8RYQrwzAQZU/oLPtTDQOwWk1PtYaHoM2zWcyonIH6/H65fwJja6OfEF6Bgqqdh
         nIG8AQ9yzu6D6pWWlAIwUT09p1p2cZh+skzzGy/kdFH5MF4xWx018FYPikr9tGoaFGRH
         WdPuvpRGLTDGJyKf0vzNqp+ArrucjOkfI41n36+iQBOY/gAdWNUNCkZ7kff8kwJ5p02a
         cSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726126810; x=1726731610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LUkTeAVAzR9AYc2U0wxTWgfR6a0KVPFNlmWMjsS+ujQ=;
        b=FQKYRnrXDtcDWdm8VZ2ccFvC+5TNsnnVCi2+FHG9hBLb+ExNN5hn9nZCi5SxQp/E3y
         +WqMXXFabS7JHRvR04D7LkPufhuEVwa9R04p/2P8e5lIfCS/p29/4FbxgTxmJx3QIhIg
         uJhnb8jVqoUoTzVBu8v2+3pbXfkMFSkGYjZjymEY4TkVam9Te2QmWgnV3pvCjrJpfo8Q
         g7PA+aVDY1KRxH5nfMfvHm/R9M2AIj1EDCJPpewCDW2jmJAtymUy4gp6h8mUX8SexG4Z
         cG6jwfBVuWJEq7adDq1+u44cKgZCL1bE6bQFyZq3y2vhoM0o5JPBs00mEfNseU5UfJmQ
         6tqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCqbG8ITmQsLEXX+hf1yVGYuFBZCzNoMWcQa+sY99txjRJQh2cZbF1wwkxooVqrZPNVeGrIS3lBQlEKg==@linaro.org
X-Gm-Message-State: AOJu0Yx/6DtPv5cBEvBhjh5W0dZCfY/WS0hNk+83TsGtH3WY9GT9uoX8
	iVowcOYcx6EKWTyE2K6PN8RqgJ+41yttM+Y29UDb81s/tTbGsunlXDHuvnjZn/qtsg==
X-Google-Smtp-Source: AGHT+IEm1qfoJyiyuz3pPbRbsIvSjDeyET4AF6g6lnz2NNR0EVNyE3b7nhPetB5baWbyDfCovyWvGg==
X-Received: by 2002:a05:6a21:1798:b0:1c8:de01:e7e5 with SMTP id adf61e73a8af0-1cf75616bffmr2800213637.15.1726126810532;
        Thu, 12 Sep 2024 00:40:10 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fb9ad87sm983458a12.6.2024.09.12.00.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 00:40:10 -0700 (PDT)
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
Subject: [PATCH v2 17/48] hw/net: replace assert(false) with g_assert_not_reached()
Date: Thu, 12 Sep 2024 00:38:50 -0700
Message-Id: <20240912073921.453203-18-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
References: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: krgA75+jJ102

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
2.39.2
