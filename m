Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp422896nji;
        Thu, 12 Sep 2024 00:41:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVoNnrK9kdYx/O7kbsOlkqUCAwxh9KvGfGy07E6vzjN0qssGJwfaYSd0HhQbeBclT/hwYbbsS/C8KtD3Q==@linaro.org
X-Received: by 2002:a05:6a20:4304:b0:1cf:651c:52f1 with SMTP id adf61e73a8af0-1cf651c559fmr8587568637.0.1726126864332;
        Thu, 12 Sep 2024 00:41:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726126864; cv=none;
        d=google.com; s=arc-20160816;
        b=ufSNZVdEn8SFZG9wNDI53rYaxbkQbwUYLqZQzcKdmbbl1VpeX4pr/05mKfdI/Km9dA
         vwmHTxuxwGIewZq+2Ht62b21pwcAoachFkhe+GXSH6Dq02kKQKVDoJHhVLN8dQaagVeD
         Sed5eCD//obRsIoSbe1NogFyKFuTjw46tHofPMXbzvTaPFWM+JcarFBn9pjGZu0eFePH
         dnF8Tn18QoQvc8D6sfoFxeDrvgd1eXHE+PfDcCqyPIqDMydFCne7a81QgbwTDeI5fUQJ
         KnV+AawyK+fCa+sDDZbcUuGE7Jw+dAtfiNB+qo7GybNPSbPEJrTkP3uArMQkPYSSMtQk
         FuBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=i5xGRLzZJ2Qth0Y8TPzSfuk2uwuhTRJtRDglckHUSQI=;
        fh=iED18M5+96FlSnV2STGZ3X/tSKBwU5DGsU/7v2V0HJ0=;
        b=X3oJnlb9yJWVbF+8wtgWmrdKJa4GZJhJU8B9YS31cjbWfuxqQDXXBwidtu6AdrS/0j
         kRCk47qlK0tGK3JNUw9TPkBblsspl4dFTZVFdIDQwpEn/+raE2AWP6Db04f2pGfM0+yD
         jTXA3ZXbBUVDT9z2ZZTM99lOmmCQaHbOjUJF+G1EEOGhQ3EW0L0i4T8Fs4H+rU9w/iMO
         dgO0V9a5J9glnvkDQOCrDF21NUrOQfKrvKM2Pzc9o5L6/1Rgey0TMEMJA3QPuCF7geO7
         +GITX9f05ZRji3SwAoQY3F5fVARjE7cDOZE95uHgRQqPVo76YDKflna3V0V2aPo4BzCk
         0pEA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Bt/KGKAu";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-7d7a0d0a271sor6144691a12.0.2024.09.12.00.41.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Sep 2024 00:41:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Bt/KGKAu";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726126864; x=1726731664; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i5xGRLzZJ2Qth0Y8TPzSfuk2uwuhTRJtRDglckHUSQI=;
        b=Bt/KGKAuB7I3zR/D7124QguiLnqeGbh3P6dEfKtUzlRwx6AD5zdt2BERXjoNONfjoa
         SwV2w425Y599PYP9Dhj9+UleTFptt5Z//4Wfs7qpGksRywgdUHWhzcAYviPDUN3EYqwH
         UsKUBg360uCoFTPLC5x3Ku+vCOK7N7R217zPD+WyDLlbbJNiVWSrIp/Y1rO2ospq3UkM
         qdDEtf1NvrUxST4NINOX7Wnyt23LBkumYfJRYMn9vcOzuGPwwfkdANe27omoQpyTCBl3
         N0A7fS09xjQeI2ZFnmoCvddjqgfj0mTSNr1DZCv10uGY1DQDC4fZbkRG/7iAxTUIQHuy
         JZug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726126864; x=1726731664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i5xGRLzZJ2Qth0Y8TPzSfuk2uwuhTRJtRDglckHUSQI=;
        b=s2aFBgGPrsDMjYB4H4B1buaNDSNYjDSKsIlUSFJP5SR5MN75ocs8msI4OQUJkqU3K/
         F3luHuK//Mp1vIu+QmR+J5mYwFPD6raVt5iq3S+23WDJcKv7ozGfgbS1cb+zb93s+ZHv
         k8GosHBq5uRVyWHuyyCpSUs3SSQaqtooFCml2AKy9Z8uBWDCfTUpk+bcHYS9zipGWRNU
         JnzZupTMCX0eu5aYiE2BXpTcRVn5Iq0CH6c9g8kSlzV1w/XsCjASmpnZqM9JIAh8McsZ
         sG94Lw64+BUfd01HDJbYLVnxlVdbuW8HzDCy+uBmvRK1VoXaquT69oAnzjKGS0hwxBz3
         8qNw==
X-Forwarded-Encrypted: i=1; AJvYcCUP6x0bRPNCupVwloQWbhdVgRyge4WqCanepVI+vspLgIe+85fx/dNIaNxsbsGiHhNFGacZZCjNNf80MA==@linaro.org
X-Gm-Message-State: AOJu0Yys8ISKH8ObAxebtiLSVmAdalQhRkRzTiGAa2Q1HvxvFdHshxKR
	KdvsQJTYzRlADcC0NWih3zcAEPV98fsNvTdQeledtSldFKTaIHELjwS4bLHOd9zKLg==
X-Google-Smtp-Source: AGHT+IFnNdPU1Iayk5BlkwPU/oau5e8ev/a0NTufCxY914fq4JD3TSW88aC8vWC0gINkb8p9bG5UDg==
X-Received: by 2002:a05:6a20:8714:b0:1d0:3a28:7d2c with SMTP id adf61e73a8af0-1d03a2882b8mr604506637.11.1726126863874;
        Thu, 12 Sep 2024 00:41:03 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fb9ad87sm983458a12.6.2024.09.12.00.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 00:41:03 -0700 (PDT)
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
Subject: [PATCH v2 37/48] fpu: remove break after g_assert_not_reached()
Date: Thu, 12 Sep 2024 00:39:10 -0700
Message-Id: <20240912073921.453203-38-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
References: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: vHcNfZSpzS/f

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
