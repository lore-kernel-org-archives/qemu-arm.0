Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp1161393njg;
        Wed, 18 Sep 2024 21:47:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUpMdoJ50njhgWFdurRRqDoQ/DfoFumweg69pC9JUMl0bRgJ2vj+5D1XJLg8pq03u6CbrBH10QpJHv5MQ==@linaro.org
X-Received: by 2002:a05:6a00:4fc4:b0:714:1a74:9953 with SMTP id d2e1a72fcca58-71936a6267cmr31163388b3a.16.1726721242605;
        Wed, 18 Sep 2024 21:47:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726721242; cv=none;
        d=google.com; s=arc-20160816;
        b=DChzxrtYu41qiLbYQfabIhVbZQtwKO/WxXa5BR3AsglcJOWisuwzCBrZClVblpXULh
         4AaB2fFZDd7y7q7FZIV1EaZl3BkIeUb9ieOIicSF8tGKtPLXg/VTS4CEw+mBwDaX+ME8
         IO6Yt0pAhkFxy5Sd8MsNscyz4b1bWKl7P4Bv/Kx/pMxKmGwidLjEGgblSUEuN0bFSnjp
         Ws4fpVlHB3g9+fqiQ+7qHTSA8bY94cAYUsaqNfG8UbeTvnrIvBWkhUfaKc2UKo4nOdYL
         1EZ80e4RZbrDSDVCDpKDewasvXwJCv+UHr8h+LBAEGN2ARNCmj6cCixezAaiKzO5PM5I
         0iVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=XTfod+luVyICpEfgZ8Uh3DA36M6kM7v+mrR6MBDF7uk=;
        fh=L+TXr5nwOOlufPCbByWgqbhLo2Kva22z73GNgXaQOrs=;
        b=HqHtZf/HAZ8o1h2LEpu2npKZyld6aUrTcd4NGCwOtsR4pFIRRlp6l2hiPa05E6DNom
         54liVEdAU/blzRcghXgBFMD7Y/Bo0VkDRMoiFDHTcG155FIIUwD5nO/nOSqIkdZ3S8zN
         Kfxraxwo12YgPkMyUS1lauGrZxSGJpK4yv925QRO9ERaKkzutyXH5KLP/nLx8mik98Cl
         gGX91LNtLAn9UDM27xSbAEZf8TTm83CuT/lHHFaHBFx1S/01DVWXxyMbZLf3z0LnJbBs
         34/BBxysBXrTqsm5s0I1Z4jyhOZqfDTQCkZc4+iSM6NWAMSDnAjGUqJfoospKRy33BgD
         oImQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z2GBVsPN;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-71944a9cdb4sor6956177b3a.1.2024.09.18.21.47.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 18 Sep 2024 21:47:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z2GBVsPN;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726721242; x=1727326042; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XTfod+luVyICpEfgZ8Uh3DA36M6kM7v+mrR6MBDF7uk=;
        b=Z2GBVsPNm/DPifXPTA4f4nL8IAB5yYKs9FRtqjcjZnlRuhbXDsyvQ4jwE6m2nSENih
         oXkFfQOBD4+kScgWMH+CEGmPk6jauNTeEi+iu4bbbTwRsOj4eQ+U1zKA4oBka7lJ+a6D
         ipyg1rq9nCdxh8OWpikhbtrO3BNGsv35Ugx9b+rn3jyu9mjAdSZx/a78ndiCIdMzQzsm
         /RFYHzWs6klfFVoItEu99etcRilYmUAby4eOe5DBt0PorlhKr7M7MYf/Pi7D1STUgOYM
         7dsop1YtSYqDt28U2mO4WR53oO76KlPJ2VO+Xpko+eRKkYSnNSr7IMqFCvRZNJ2CJc2L
         fKrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726721242; x=1727326042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XTfod+luVyICpEfgZ8Uh3DA36M6kM7v+mrR6MBDF7uk=;
        b=uQg3AQCp01omA/JexlPzxSZDrgs7b/6d5OXfd0Q+uFklFhrJ8CgX5qknhQJB6T9h5m
         t0kCEiC8JuWMt9PEDosePHDgHQSdV2f91+PEXZaH+No65pvI3tZ5W9AXXIiwenN9mBGL
         gr4Tub7clziVzv6BbS5bRNF2ye5znjL8TtHjO1w2D1mqkW1+w16EaKP9AH6CNpMdilGe
         6iHVcE3YEPmJcC4AFZ2k377u/3eCZX0XBvXSmk62NAit/9QciA2iIBEIPZrU3yqIS+Yp
         wH4pNkaC25EDJJqgZyV/liALMYIEhC7k28rbWWvxdkxMvXYMwks9/krDBxkdRyP4Ufhi
         C2Jg==
X-Forwarded-Encrypted: i=1; AJvYcCU06opk0FklcxsT8aS4bkTHYMZxTXPOWIl2aDDrG7YAL7gvRm8YWzQUU2sHa54gVzLbL76QGbpg/irLeQ==@linaro.org
X-Gm-Message-State: AOJu0Yy1UkaMnbo5H7jhK5ENwMd8CLC1dh1FdaxR5AJnq2Ely3WwjThr
	QfpZOg7Guf6AZPKYApvrfJSfR2Shd4H5vENUJEphacn1b3a9mkV9Ud54Op8qp7Yr8w==
X-Google-Smtp-Source: AGHT+IENpGOMxkAxVpBEbVxwqYg+XoCNj0Y+tup5K+eTLr6T9UQRMpy2wwxVgVE7FTWLiR+Ma6cVKg==
X-Received: by 2002:a05:6a00:2d10:b0:717:9462:8bda with SMTP id d2e1a72fcca58-71936a5fb10mr30684467b3a.12.1726721242032;
        Wed, 18 Sep 2024 21:47:22 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944bc279csm7478601b3a.188.2024.09.18.21.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 21:47:21 -0700 (PDT)
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
Subject: [PATCH v3 18/34] hw/net: remove break after g_assert_not_reached()
Date: Wed, 18 Sep 2024 21:46:25 -0700
Message-Id: <20240919044641.386068-19-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
References: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: QfGRi7gW2CBY

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/net/net_rx_pkt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/net/net_rx_pkt.c b/hw/net/net_rx_pkt.c
index 6b9c4c9559d..0ea87344745 100644
--- a/hw/net/net_rx_pkt.c
+++ b/hw/net/net_rx_pkt.c
@@ -376,7 +376,6 @@ net_rx_pkt_calc_rss_hash(struct NetRxPkt *pkt,
         break;
     default:
         g_assert_not_reached();
-        break;
     }
 
     net_toeplitz_key_init(&key_data, key);
-- 
2.39.5
