Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp1161342njg;
        Wed, 18 Sep 2024 21:47:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVZyk5RObtNNTLuAJOFSzirU7Q5FnJQi7nFDJUd18DtHao46f/8RGgbQuAfzm8iLEJ4bhL5U15mXQncxw==@linaro.org
X-Received: by 2002:a05:6a00:4d01:b0:717:9191:8bfb with SMTP id d2e1a72fcca58-719261e77b8mr29077871b3a.17.1726721230527;
        Wed, 18 Sep 2024 21:47:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726721230; cv=none;
        d=google.com; s=arc-20160816;
        b=MojjN04dbRyQBwgdkQ1qSFr2y48OtgoLQh4xiF1DqIKwz9uH+bFvX0ls4WP57T4AgU
         LbxkQFVwGOOp6oBF3/NuOhyGb0Eclt6veXB+J08gYQ9NqoWzO1vI/HnUqi1JQImXDOTG
         9hD4J/aJabpmaA9C4LdNrXrEeHo0it8Sn0VM7SiBv5mPYXTFkGQEs6W+dJIAIkIw0FO9
         tcIpKiTRXdLgiOkjO+TzTWsgErw2VBs7/5BZUtvwMA3DZub1QJTHPSejEUkLXpE0pJ/I
         cx6c2OJQ5y6QODQSkRd/UUmIYrJxLpqAtGztEIiNpFxsEoz6s7tS0Z/fyRAmkQuILLH7
         ZjwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=CjdIkjZ1sAe4H4BC4R89ohVomEGFONKXxXhMv5Uru1o=;
        fh=5oqbMu0vWzYx+VkVPmX4n3ugtWVPcAdlm4IM6ZUwRow=;
        b=JxrJFKY08Q9Mry1mm6Mpqz/1HFaxyPoszHdRN0LbwcmgY98xOjDfYOgdSygqfkIskv
         LwBSYAWoUf8Es7u8XbhmjXxUaozS9J8XGWgwJIjEaz5nSvhlzxpemeg9q6yc4W9Xm+nk
         rvzEbFNqrujq6Q+ell1d8pQfhu+P6P3WwQsPM/Bgel/5AY7Rv4haPgGem/pVHpDiwzGE
         /fSb0yK+g0DCC0O9imKM5dg3SRry3rhDZtLa8yY/1+T8Kf04mTsffoCvnLHZ8rhXC/bR
         tp5aZX64l/EkYuggZp0nyOvUYpquCxoCGAe0xWPJih3UELRpOVtYhZcEKFMnJyijV+ko
         rODg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MBanvNjK;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-71944a95b32sor9253249b3a.2.2024.09.18.21.47.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 18 Sep 2024 21:47:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MBanvNjK;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726721230; x=1727326030; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CjdIkjZ1sAe4H4BC4R89ohVomEGFONKXxXhMv5Uru1o=;
        b=MBanvNjK7BsWBxospxOCYUjKq1pXKFZpij3TzuAmbwFNSJ1el6pyaUcUh1tgSH0RBa
         ZoSFA7PH208V5bI/GoBtjiPmv7eXnz6qMVR3AP6XAODzQJQep0RCVyYSnClSL90iuqUa
         OUOOKrkqIDeMcgRRpIL+STZwBgEy8v5KCMvGo+zQWLLe77dzAGKUW+SG9seRm9o4hHry
         BTEEMZPTl5mYGAqsouyY3N22QLIvHCKC+oDpPO9wzDipB34/T4P5iA2e72clfSDCw7Qf
         XmSEajai6A+tf03AZkn1KGN79n/TkF9Ygeea5Z+WHNMfB/YRcYd+ruXNhN5rlc3sOt7G
         /FuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726721230; x=1727326030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CjdIkjZ1sAe4H4BC4R89ohVomEGFONKXxXhMv5Uru1o=;
        b=NGh5QzcZylX9jsgNhdOfMQIqQi9Rie6CWdYU95vVeDqU3Bjlg2PtKA2qh8l5YLT36t
         EN1Hv0y9Zx+m1XbNE63n0+Ic+B6Cn66fi6Z/wloCjGkc6iAb9EIm8qgVvsBDNbnTkqV1
         16sw+imXHTOVFqQ+mizciHGjzFHfI/2XRDdkRJd35JRM7bHbmPiArl+gce8ovpMS4Vqi
         88SwB8vpMTfgYd1qJlaJWBCDfSi1sOr1rhdolrM9jXbshOE7tFlE/rzBJw/JHhF33Wqr
         cKu4F6qmXvLB7jSJoQhyNLa2YuXZLZMwKqjQbKTI5a/zVKM10jMHRQ5QY2opHxtOLakU
         QPuA==
X-Forwarded-Encrypted: i=1; AJvYcCVx9sp3iJyaRxRKs44LWOnHj7/NIKMEEvSh6nwmP2f6+7RsRksvXyJQV2stEapZs+6XRjboKP16TGgA+A==@linaro.org
X-Gm-Message-State: AOJu0YyEkhjo67eOwCfdurqaZABMV3sTBR9SvxFbuop1UnK0FMtMd/qe
	nCb3MR+xInX1qVOIV3lEh/JCuLC4zVVs3HI3fNTqV+d65jBd7oa2hxt9UhNBXHi/bQ==
X-Google-Smtp-Source: AGHT+IERhGsxI+Cf/AQ9eoxDwuPeIw/CBq8x28oXvdQRfLJHCxXd6tJwjKv16QtJVSkDvTe4ScWRrw==
X-Received: by 2002:a05:6a20:b58b:b0:1d2:ea37:95f5 with SMTP id adf61e73a8af0-1d2ea380ceemr10245819637.11.1726721230050;
        Wed, 18 Sep 2024 21:47:10 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944bc279csm7478601b3a.188.2024.09.18.21.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 21:47:09 -0700 (PDT)
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
Subject: [PATCH v3 12/34] hw/ppc: replace assert(false) with g_assert_not_reached()
Date: Wed, 18 Sep 2024 21:46:19 -0700
Message-Id: <20240919044641.386068-13-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
References: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: dI6TU1O2ZLF5

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/ppc/spapr_events.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
index cb0eeee5874..38ac1cb7866 100644
--- a/hw/ppc/spapr_events.c
+++ b/hw/ppc/spapr_events.c
@@ -645,7 +645,7 @@ static void spapr_hotplug_req_event(uint8_t hp_id, uint8_t hp_action,
         /* we shouldn't be signaling hotplug events for resources
          * that don't support them
          */
-        g_assert(false);
+        g_assert_not_reached();
         return;
     }
 
-- 
2.39.5
