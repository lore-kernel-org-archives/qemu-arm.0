Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp1161367njg;
        Wed, 18 Sep 2024 21:47:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUECHtUCQPFDh68ZLW8u8ocGKQ2dRGYEb4FrrcchRC0rW/7/goII8RFFV6ZnvU//netucUf3hXFfTp9iw==@linaro.org
X-Received: by 2002:a05:6a00:138f:b0:70e:9907:ef75 with SMTP id d2e1a72fcca58-719260655e3mr46377530b3a.4.1726721236472;
        Wed, 18 Sep 2024 21:47:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726721236; cv=none;
        d=google.com; s=arc-20160816;
        b=0smx6xmGD74SsKEiMIuR7WJABWt1qbmv/j/gc6PEKkmSZmq2ber/bYvcyNZ5CfMsF3
         6upBtlwoe9kTG8QR9lVpx+1KznV7zLM+mM8Xn97UoPnBGRQm+TYGIZbgQVY2QU5a5nWI
         JCE2CXssQ4Rt3E4Q7FGRf4GG0xPBHdQTYNLbs/S6Ixv7q0SaTbDx86UvSLEK/W5rofOV
         nY21qQEz1LCFGlgBh3wtvlkMTGaWhdwHsj4sJmc4xQb8uSqDmZNi3Eg27ujt95xvc/22
         6gqgSteFrvY5JGkAB72yJzXFIfisLNOAX/P+apD3Y8zqjtsaD7ORTYM5bMEgOz8gxGnJ
         QBNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=volzZG+VvX1cjCtnHdp2ianv+4MCm6slEtRN/0TB/Mc=;
        fh=PknqqwcHhE8D7tIadDMqPWwnGwNQBnQA3ndj/FQepnc=;
        b=IGYU2KoJEpbTUwNsyyYrQR/pRWn+9332zfTuZMrgSuXST1Zf+RljymD4SD9Xx1cTfw
         DRZh5+rd0XOv7mD0GtKramH4fKByCX7Pp39jsSj2z9MXH9GLVlRCyKLznryflQypSxmo
         jQNBKxvmsbMzXtuBd0wovYj+OCxthqudK2k9IU5HVSl1FY+bWAPzKerc5U84MAHBh6+q
         aCNGIQ66guly90jNI0F/0H+Gg2LQpMyOdRPiFjzk1SLc2BrNcllhRJQ7BOk3TT4UTjCS
         DtABoh6Tc9h8OhnU1srCCbFBvYo9H8jW9RA1IE+H4dEulIN+syD/MPJ0qycq0MtgHaf3
         tw2g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TduPJ0gi;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-71944acfe7csor8507520b3a.6.2024.09.18.21.47.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 18 Sep 2024 21:47:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TduPJ0gi;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726721236; x=1727326036; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=volzZG+VvX1cjCtnHdp2ianv+4MCm6slEtRN/0TB/Mc=;
        b=TduPJ0giF6gk7jVyG3zPxWbw1I86qVjMSBe+V30dRkXb7VXQQViRtliaUkGA7GPu0+
         u01Vi8vOTVH+YdAbP5wcck2YIwEKjC+Fk2+2hIpnTOWCeu5WeiRGJmBcg+hm7ZXK4gnf
         NTH4ohCOWz+KLFUqIIFlFrMegwyJG+krVkl8O4oBQvE7P8vtpdDopCVS9/tjwZA5b79a
         hgNHH6/wa0suWg0aokwHxQ8PFEFHUKREZYum9sz494JGSazzQRQHIM+aN41gZO6dCCVy
         F2bK8ao7Je9ryFbkaRVXqglR+3AdGyV51ynAZ+gi+fq2KikR1M+HaSHSNIrav8IouoZ2
         vGmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726721236; x=1727326036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=volzZG+VvX1cjCtnHdp2ianv+4MCm6slEtRN/0TB/Mc=;
        b=shgioX42tmyuzyewRNRu6NR9dpqTJNHcXBnQlN1STJumnPhUoFAbsBqAz683oL307a
         NkrIb+0v4MGYXCBUrBFFc4RIX8+XLYe4RALtltLIBGqXI+OblEQXJ9uXKX2D1J2rcHNL
         XfIl4sbbx+tDPKVYERNJnbO7D2MJhVznDCx3kT2L/u/D60wJfwPgnjhfAtui5bXyeKJN
         W+IksVOj/RLWFUVyxbM253m8nWhrAuEhEJnwFoyzTePkj5yUmwDtgfXIeqqvONvTQLmR
         GlhiWL9ybYoxZXV4bmWJamwVp7KzaC7/JiBu3ZkA5RmQXSUVrVgGCvSfh0PCu4ycbhc7
         5h4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWY9OunjN6up1m7CutIHYRkkB1WTAmH0ts0ua9W6O7+bU9q7fbVY65zmeuM7GPEyC8GGUm55yMBvsBrEw==@linaro.org
X-Gm-Message-State: AOJu0YxtTba5rLec3UTTrBA3Wu4NjhRYEv7e8DKAdd6u2oHIvWZ/aSIj
	PcDZvj/Uj7chfKv6l2AOQte4cDsvgreEUsf5/YPuLgPQcvwvx6vCSqfw91ggVxl7Cw==
X-Google-Smtp-Source: AGHT+IFkwdx7PRwXSy60OR+EcQ83hvrfwCo2zu+BZr4pCRc3QVrXN1huxPQ5BQ1Ng2g+CQtBhwCssQ==
X-Received: by 2002:a05:6a00:2352:b0:70d:2e24:af75 with SMTP id d2e1a72fcca58-71926210c2cmr41850428b3a.24.1726721235916;
        Wed, 18 Sep 2024 21:47:15 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944bc279csm7478601b3a.188.2024.09.18.21.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 21:47:15 -0700 (PDT)
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
Subject: [PATCH v3 15/34] accel/tcg: remove break after g_assert_not_reached()
Date: Wed, 18 Sep 2024 21:46:22 -0700
Message-Id: <20240919044641.386068-16-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
References: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: WHAmr59+xxER

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 accel/tcg/plugin-gen.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index ec89a085b43..2ee4c22befd 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -251,7 +251,6 @@ static void inject_mem_cb(struct qemu_plugin_dyn_cb *cb,
         break;
     default:
         g_assert_not_reached();
-        break;
     }
 }
 
-- 
2.39.5
