Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp422805nji;
        Thu, 12 Sep 2024 00:40:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX9iYSHFfTcKmfm4wdpWDdupeSPKFYITa3fAbBquEIudashbFOr5Eb0b63++BhEW7r2/cUB/qbZH4/AyQ==@linaro.org
X-Received: by 2002:a05:6808:238e:b0:3e0:40bb:f45e with SMTP id 5614622812f47-3e071a83892mr1210569b6e.6.1726126845935;
        Thu, 12 Sep 2024 00:40:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726126845; cv=none;
        d=google.com; s=arc-20160816;
        b=kH6D5qDMa+/Ms3/PG+kTrFDvv1F6cdArBhLW7glErtj7wLOzRaMWiIoGaSqpt5HT9j
         NkFEsD//8+eTWecnv/LthQ2skBsZVcgIVuy/HmqEMg0ky+jzT/2y/ofHc/w1FQBZEAU5
         Qkwost6gzsgK/fq1FLiiIoI5EkhOJ3JKpNN50G0yUc6DvV4bUQPeDMRXmRWNIXvGvNV3
         lECkE8viqphBzKW+kAzdhZqWE6J50bnYiDrnlc9nkJRvVizfgtYNFzQhLTeHnEvGJBvf
         lWsLH2ZjLG9Dg8eXOsMXDZ3DiXkgwgXUNXmNCE2pSutiJ41WGYg5UM9pybjoQ4ozh50j
         EvLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=G15/cfLWuhy58D3S6VTY2yyYFPoVOBpPVm7OgoLv/9Y=;
        fh=SnuqEIy48CEkEtwe9zyj17tHWPcVQkfrdIP3ygrOCKI=;
        b=TB38eZlWMxik0+uwXmBycrSjDdY+JdX1iG6ixa7l4Gcfn7+UusujJrOir71uRk7BLW
         LTUVDJz8xIYdmilc2JZBpSyjjjqXTE3qbW4NN/fWKXa1TLC88rW9A6KpcrfVLcg0oRej
         bj7M4WWa2MnRvaJxDthCbhdAX7fgsL8fvSS+WNAGHupFTZv3hxxed1PFPnW6AepAN8/K
         kkdLcxPXyFyGDVjaZWPJcUievIoh1WjTZVysTod7MPs1cEsg6v8/ICYxz0J5Ang54uyF
         7U5cNMO8fMHV2IjBeAs2MyEGd6zjRPpo6GKyZSptQmA4UqB8hoOTb8aGLe85Aui8uZly
         Et4A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AIVj4jas;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5614622812f47-3e039932b59sor3673114b6e.1.2024.09.12.00.40.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Sep 2024 00:40:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AIVj4jas;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726126845; x=1726731645; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G15/cfLWuhy58D3S6VTY2yyYFPoVOBpPVm7OgoLv/9Y=;
        b=AIVj4jasmTK7LPa7FOtA6/UGMNheKBrW9BtyrUQhNGrFX60ewiyDaALtpc12Qk+rTM
         rC7OambMuXxPVv1Fug/jF3UaOoKxWxPPTA9b+N2ra0D4v0QagW18jJNNcAyr0Zq2uVq1
         rFAmO6nAU6HIfpIIEmlrYFzQKQzlblgYFPR0EuVrTTBxqxd8ir706IOd4F9aYYZ3MOdC
         ZmYeOYGcVIHx+QytOZa6D1BPQsgodu8tVE8yfDmXOMtjdybwE5HgYzwXwbO7BZZKaRCw
         HNqN2hJAYngupJI0ks3GddK5PRsmllNC9jFIjdUbVpOBVjKODligH6ju5oS0FnIeLt21
         Nvfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726126845; x=1726731645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G15/cfLWuhy58D3S6VTY2yyYFPoVOBpPVm7OgoLv/9Y=;
        b=PweL4APgKI6L+T2J3mJfU1GGLH9KxDYHjDw++SNLG/pvwNv7kNv/ry+4gHqj2L18nz
         g+LgDZgrrAmYd+OIYq4tTEW1wNXIJ/bW6KL8MJdaS1xI0eRp5Bkm7+JaAtfF+8WpUZTR
         1yhwU0RilF/0anr9RPrtvFOcj8dYPVGUbIZhjFrPZDyhcTwTBNFnm/IniiKnqCwgHOrA
         sfNfJoUdvFV1CGltv99YmQe+0SdlIa2h96e3Mpt86LfyGcfS2X7T0hWNK0MtIERuyIKC
         CJBLyr5fJZPdXykWaeQzw3qkIpjpd6/I4yVcV7azc+VpPriASrj3RYokQLKt2wqmkMnH
         ju4A==
X-Forwarded-Encrypted: i=1; AJvYcCUdzE4cC5JWVUeVHAGOMM68yam6E6nwHz46yp5j9feZQ6vkFYFF0S81IQp+P/OCi6AxmGQy+nxSn3RlrQ==@linaro.org
X-Gm-Message-State: AOJu0Yy9fTJjw7q80EFv2Li93zln1VJ3OAIbyWiK4jGJos5k0U4kxYJE
	KPOBSY+Hil42u5JVOyMrLDGm+7uqumAC67DgHWJxhyEdo4CxZHlSVQFctMq5rpwo3w==
X-Google-Smtp-Source: AGHT+IETN6rcEOkN5n0lmGk313YArCk9WXbSbiIwWQ/b2J6sYsWxK5jf+hG5cA2W/PAz8ROKcimuCw==
X-Received: by 2002:a05:6808:448a:b0:3d6:3450:7fe0 with SMTP id 5614622812f47-3e071a835ffmr1063495b6e.9.1726126845522;
        Thu, 12 Sep 2024 00:40:45 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fb9ad87sm983458a12.6.2024.09.12.00.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 00:40:44 -0700 (PDT)
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
Subject: [PATCH v2 30/48] hw/pci-host: remove break after g_assert_not_reached()
Date: Thu, 12 Sep 2024 00:39:03 -0700
Message-Id: <20240912073921.453203-31-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
References: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: kNsq9aLLFMCI

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/pci-host/gt64120.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/pci-host/gt64120.c b/hw/pci-host/gt64120.c
index 33607dfbec4..58557416629 100644
--- a/hw/pci-host/gt64120.c
+++ b/hw/pci-host/gt64120.c
@@ -689,7 +689,6 @@ static void gt64120_writel(void *opaque, hwaddr addr,
     case GT_PCI0_CFGDATA:
         /* Mapped via in gt64120_pci_mapping() */
         g_assert_not_reached();
-        break;
 
     /* Interrupts */
     case GT_INTRCAUSE:
@@ -933,7 +932,6 @@ static uint64_t gt64120_readl(void *opaque,
     case GT_PCI0_CFGDATA:
         /* Mapped via in gt64120_pci_mapping() */
         g_assert_not_reached();
-        break;
 
     case GT_PCI0_CMD:
     case GT_PCI0_TOR:
-- 
2.39.2
