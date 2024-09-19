Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp1161508njg;
        Wed, 18 Sep 2024 21:47:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXO808g1cIX0jYrjpQ2fe6sOH+Cf3uNnxiYWTbObw9rWdutAzHwVlxe1i9n5itZVnyeciCde9XFaY8yQA==@linaro.org
X-Received: by 2002:a05:6a20:c70e:b0:1cf:359b:1a31 with SMTP id adf61e73a8af0-1d2fcab58e1mr3219317637.19.1726721264729;
        Wed, 18 Sep 2024 21:47:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726721264; cv=none;
        d=google.com; s=arc-20160816;
        b=SoNkM6jR12sAVfbEsiHpOSM7/qwA/dqgElE0dqu8macUW12VzGqRZ0nnTettYhdjy/
         9p26QXcB9X320jMNlVEnAqR3S0pnyojWl1d0abb1KLE/0w591Ega9XoeWpED2JtLNz8Z
         540FllsqRXYsznGoz2cZPFVL445E0OjY1SLpbFTGrLRZO05sY1Y0KQPUlVxvZYN+7mbb
         J7IxOYSYS1h8pQP01LzxLkk0Ar4tlZYd9gGNzAmW1YOh7NMSu5BlcvlFhyHN1mF9UePh
         lL18aknnfcdVUbvgcm4ob+KPsuN0Z3osF6Xtw60mWwieqtplPRLfMqr10RfHGMYSzFcs
         2tNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ZHfEx5g5BzL1PX1RgAlJ8l3kVoVW/oh/s4YLt1Je16g=;
        fh=m4RemnvwelwN0D5jmvkuuak0FdzaM1SQBiuFC2Y7Guw=;
        b=WwSPxsc5Jx+frSw5fgxmNSWtWsvgV5O/w9i+4mjpQH+USD8moB/xrFAzYLD4eDQmSP
         n1VpAZWTRGLVXd7MUZ10DIsXZiFjCx5P3VUiZQJfIWtKuuwBinWILYKsDyY13o4YazCC
         UburdQSICbbWuoXLDlrIa6a/K37uSK6BqnoXrYSlw3WIp8ZtAmK+D5TGUp192amfKHfE
         HfDK1yHmooejg+P4a1F3ZsKe3eRVvDy7nJjrcfgfkBfjKfre/E53VCsoGFn3N8mSBVQ8
         mdcFKfBWiGgYU02peQKic9xtsw8PFUzeaMjw5bAUbxdRRGabfx1tG/8FayrXVpza14mf
         fj7g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="HeZHup/P";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-71985c8d171sor1822597b3a.6.2024.09.18.21.47.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 18 Sep 2024 21:47:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="HeZHup/P";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726721264; x=1727326064; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZHfEx5g5BzL1PX1RgAlJ8l3kVoVW/oh/s4YLt1Je16g=;
        b=HeZHup/PAW0GE4KeKvEk4Ji1GTNgywWhB3FYTMiz50OhF7qgcjBUDW5jjOOXr2J7Ax
         Xy3xoKy3bIXZgEsG9anDHom82IjnTEdGg3Y0iY7ENpidkhOsaREWv8H7FZ2gUmkgobGe
         +8bZE+r8lwMml2CpRKL6/9sOlgO0Q/kX1UojOIDZ0W9QE1SwYEqs3UggfJvTZbeOHXuw
         VjATm9hE1nTpGAraPJFic1duxXMOP5xIqHfeLk6FJBjpN29vNx15ZBzvHI1MOP1cJlKK
         fxkRRs/IJNYlsZg1hb7Y5Eb6Cn6BfIVx9Qt1wLihEYHOBQtGA7tExXP7e+WUvu7M76vn
         x5BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726721264; x=1727326064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZHfEx5g5BzL1PX1RgAlJ8l3kVoVW/oh/s4YLt1Je16g=;
        b=DzKxJzazMLT+Ymzf7qR2NKPngfA2FeFYXtsofPFbQPlu1IZ25U0yTkQa+0GSBWN6Wt
         BS/LYWts/WCrS4Yom3QzCSwPjGFMNn+7e8ngxnf3cM8amI9Lau7JOv1Gha8BbD0NNphh
         S/pm8is+uUIKLdE1zY3APSqoZXjtm/MyDROHiUhHW/qE4cFlnTWAoPX0ivoNnjMUgSSK
         upZ3XIaplLGsmIHzdighDR6CqMgQxL2x1LjGI5AU1dRsCeWA4p2AluBwGV5eX5VMotxo
         w11kMmIU2YpRUbr+qNEEvUxSh26Y6YoUGksmgpXwR6M7PXx5vaMF+AWCcmMkiiHgZw6h
         9kTA==
X-Forwarded-Encrypted: i=1; AJvYcCW9WCK7LoQKwZ5fMg88k1QJNlnUEM7RtKVyxY05X/5sC9MnQp5g07ush/+q4Z/O+Cma/qGOXnJZTYmRBg==@linaro.org
X-Gm-Message-State: AOJu0Yx6ovr4m+Fj3HIbwrRvs/ep/rg/3Be8VQ8yJ1vP/5qHyPoSzbzQ
	pHENuuUGLGBizM8RQbXmbGP6fQo/CeZHyeNJUMHYDH/SvMMqmo8BOAPMHneAuCRmTg==
X-Google-Smtp-Source: AGHT+IGn0zKE4NWTBii40hBHgJl3lvYHO2m3pyUcQ8D1+09Ub75s0ooGndgxJcjdbl40KxBP6dN9PQ==
X-Received: by 2002:a05:6a00:1746:b0:70d:2a1b:422c with SMTP id d2e1a72fcca58-7198e2a8f1dmr3107578b3a.7.1726721264030;
        Wed, 18 Sep 2024 21:47:44 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944bc279csm7478601b3a.188.2024.09.18.21.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 21:47:43 -0700 (PDT)
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
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v3 29/34] hw/ppc: remove return after g_assert_not_reached()
Date: Wed, 18 Sep 2024 21:46:36 -0700
Message-Id: <20240919044641.386068-30-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
References: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: owJHLmAlUkxD

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Cédric Le Goater <clg@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/ppc/ppc.c          | 1 -
 hw/ppc/spapr_events.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index e6fa5580c01..fde46194122 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -267,7 +267,6 @@ static void power9_set_irq(void *opaque, int pin, int level)
         break;
     default:
         g_assert_not_reached();
-        return;
     }
 }
 
diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
index 38ac1cb7866..4dbf8e2e2ef 100644
--- a/hw/ppc/spapr_events.c
+++ b/hw/ppc/spapr_events.c
@@ -646,7 +646,6 @@ static void spapr_hotplug_req_event(uint8_t hp_id, uint8_t hp_action,
          * that don't support them
          */
         g_assert_not_reached();
-        return;
     }
 
     if (hp_id == RTAS_LOG_V6_HP_ID_DRC_COUNT) {
-- 
2.39.5
