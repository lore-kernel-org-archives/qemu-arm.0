Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1444926njb;
        Tue, 10 Sep 2024 15:18:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXfG7q2XVKPY/UxfVH7tTxw5g4EWKnw2+UWoB2/yKivK5AEQOxM0hOQgRyVVjcSELp/GuVjyRzwSd6Enw==@linaro.org
X-Received: by 2002:a05:6a20:d503:b0:1cf:305c:675c with SMTP id adf61e73a8af0-1cf5e033153mr3055667637.8.1726006689372;
        Tue, 10 Sep 2024 15:18:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726006689; cv=none;
        d=google.com; s=arc-20160816;
        b=uGS4mcohm0cDzt/aAKQ0x1sUmKZZ8xIzzrSAob3qZpF2QjWCr2Dwsvx1wI96JE9oHP
         QWgla4DA7Lx/bvCz1DD8FY/aE8jS3vDxiFohKAUgB6eQ0oOU7BBC9FTSEt0DJsN4aFZ0
         sNhzY5du5wVm9utwgIZQj4zkJWN0ZNmr2ogsbkslK3sHqvWLOBNPq+sKL5ILLCUWECm6
         6KvIlD9HMQMfNL3SWDIV0JBkTHOnICnJqj6ulZYJdmIjJxA/sT+eA1K+Cf7mZlyPS/wr
         5lN7XoAL1QahJy75BpfY16GtVopr1D6jCkMue8zWLD6cHexZipTTJeWKQvRDpaxxCGi9
         7asQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=w3yhi+ZDTWCfsZmUwBuf/pfnGgC91a9e/gCoVrv3y5U=;
        fh=gk6B6OcaFr1ybMoPuv63t4jc//4Adx3NbFkDGYAT1D4=;
        b=ZSQgofsfNeB3dkilx2Nh3JHN23oowob6XBqynB+sCFruFgKXRSeHkZk4DsWY7ksHhr
         tsAMY/cB4LJKL8UG587WLoQuYFfBhIH/X7IsXu0TZEJViIrqP33Yt+OpXmGM2bnc5/1g
         SI5/Mmn37UTo7dHrKO68rYRyIZpH3jQx51iquiGNjObnHvgv2kGSDx6RvXrPo18V+xJb
         UWN7S2JX+hm7wkeNeHlbLYoIX0cwtzMwbcbEH15pUpkR9z2KMn1ChX5IRoUrZyDKf6BS
         /P/iC05NzFkUnV/hhaRMeEuwa26OMKGuoCDX24yiq08kOkDhK51v5lB3qRvMuilGMMVx
         j09Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PJyE6oAY;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-718e5978aa6sor4636287b3a.7.2024.09.10.15.18.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 15:18:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PJyE6oAY;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726006689; x=1726611489; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w3yhi+ZDTWCfsZmUwBuf/pfnGgC91a9e/gCoVrv3y5U=;
        b=PJyE6oAY2OLkmBw/31UK2sECnAfOJmOCRs3OolnpgiVOYIrZyg1brRASzxLNmxL1in
         hBVf4y0AjliomIYCfDU+ioWylVfLROS3vUKFh+jNl4c5fqNTaNFir2/7ph7Ub8qGbiVQ
         61LgtFFUl/SiKNX4heHeRk7zYoMVlsCJjZfmHMmbjmFXoBI5KULY8jGCLNCBi3bo6ZV5
         9MDXGWzvIsjUGskX8L80XHEjEsbZuZyGe7BXbLB89U5zPJYu/ikFFLP1zotECQQI/56p
         RoKTwCxfnErnDzi2+yw2ro+CwoBaOVXonfYjHUJcbGLclOCR5MreQMH2lczjxzY6VWU4
         vaAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726006689; x=1726611489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w3yhi+ZDTWCfsZmUwBuf/pfnGgC91a9e/gCoVrv3y5U=;
        b=toR+P7FZ2P54NlSFBYeFRkTsp5krcnRocbPYFqCpmcTcyLDZqa8fkBW6deN2xRILKw
         GNDKYvRQZYr9p5DB8YmAGy2Vn4QGgFI8xJY0kdy7dx6uBnE+say30mC/ZNQEQawqEKZO
         ekZGhoe6CZoINKai8mr+NNM0P1D4ChuGvS47hVdyGHfp2Dm3x8UJYTIUHHzJ9YlmBGs2
         g23B6UoeTTB/XrU8U0uEgnRvvPxIFpRyCuH0oUTRyFU9OAi8Kiw9Mt/vs7jXp1/qGDNY
         LppshixhezlfeNAb23zNATiI1qBU2Wm6UxjK6u/8e2wB14qdYcpBTla0wDDdane7gK3L
         5Zuw==
X-Forwarded-Encrypted: i=1; AJvYcCULln4G5vVy0oJAx4K0Ev45fYBXH37TvkUYjqcvHuuhajLcFTy+W4NYa11rOgmqQCGzmhVSkcGqDapRGg==@linaro.org
X-Gm-Message-State: AOJu0YzeD8udwnhe//t3K6TiITarvmGU9Ax84Y59iV1VDr/SV3BEAltp
	KsLH6NBD5RkPsi5HnsCOh5+UhFXdU/qVNBw+4LfP+xqLtJtkl5MCL8zbrK+i6kVOyQ==
X-Google-Smtp-Source: AGHT+IFWVQXCFJBuiwg4sJ6d5t1Y5jRczP6OzJP2N7AUafUaS1UpRZkOWeoH/e+NIJwWwR2fc3KdxA==
X-Received: by 2002:a05:6a00:218e:b0:717:9768:a4e7 with SMTP id d2e1a72fcca58-718d5ded0acmr15828847b3a.2.1726006688573;
        Tue, 10 Sep 2024 15:18:08 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71909003d0esm1884055b3a.93.2024.09.10.15.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 15:18:08 -0700 (PDT)
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
Subject: [PATCH 37/39] fpu: remove break after g_assert_not_reached()
Date: Tue, 10 Sep 2024 15:16:04 -0700
Message-Id: <20240910221606.1817478-38-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: kPxlJV7utYyG

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 fpu/softfloat-parts.c.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index a44649f4f4a..cc6e06b9761 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -1373,7 +1373,6 @@ static FloatPartsN *partsN(minmax)(FloatPartsN *a, FloatPartsN *b,
             break;
         default:
             g_assert_not_reached();
-            break;
         }
         switch (b->cls) {
         case float_class_normal:
@@ -1386,7 +1385,6 @@ static FloatPartsN *partsN(minmax)(FloatPartsN *a, FloatPartsN *b,
             break;
         default:
             g_assert_not_reached();
-            break;
         }
     }
 
-- 
2.39.2
