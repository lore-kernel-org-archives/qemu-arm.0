Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp1161455njg;
        Wed, 18 Sep 2024 21:47:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUZdz7K2bYYBCAROGdSDpz/+EQekdzV5mV6RPk1rrk64jfB0H7S7g8pQAY72owGBqr257FQLXeLHSMd6w==@linaro.org
X-Received: by 2002:a05:6a20:cf8f:b0:1d2:bbd9:4646 with SMTP id adf61e73a8af0-1d2bbd946c4mr25569849637.38.1726721254479;
        Wed, 18 Sep 2024 21:47:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726721254; cv=none;
        d=google.com; s=arc-20160816;
        b=IzuvoXuMcbIuYJ6UMfukZz24nZMr0yPv511ScLGtlDZBnQV6sDE8QZPWLvhV5knnnx
         RRORHssxnxk+h5yoOtKBdbxtF1uBuQ61QxnG6lfs/OvUAYCyCh2Dztwv8L1L4wdqK1Vt
         uT1o0j9i5ta1uQb3wmFk3CDAjCy0nahcFbgooocDeg0/hdIJMco2VthKxOO/LcYnZ0ho
         5z6IP4M+y23U235wpB7Tn6MWsPd/XkNpMhZVh4pqBzaV8kxErOoLC2in29VAAsdijroJ
         Vsx/2L7BvT8b5DQWcys0EtrQQ6ogezV2EGvntGOGYw5CxQg2jCMKeZMvvjE0bz983BmW
         tNew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=aSSHMg0OaePxq3iPPMHVPRVV3RpF6c4DjTvgexruOiU=;
        fh=1mliEhJ4gVaXCcK8UILCO8s6iABaSUZxUPESR/c7gNs=;
        b=T9jX0cRYN9URRT/E9lWwR4ELHuV47x5uNzANC0Czdfg0obLDA9bdW4NCUqilFzJWMA
         SD7HqQ8t+KQ8KSnm+OyaO80zhADchftTLD9h8Kt/nQNQ95TPNiY/tH0RSzMgQput0Cxl
         YHx+KDiIkiGIHQxTsEs6XCW2hGzFBMju5Cf0qz36bblgVe/0vLlT/hkTZjDv9Ft/WNBL
         mitUv/7nQHvs7ENDHioRGswd2ayYDItuD9VxQ4NYtsexmqzud8AkvkFg0/PbZ7svyiyP
         cnM9jItvpNmMNDcxd6e/2UBDrssB05LH4yNp18SHIL6XQ/V6T1ar+mRocX/+bfUApc+J
         Xaww==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DLioG1tH;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-71944ab97c2sor6686611b3a.4.2024.09.18.21.47.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 18 Sep 2024 21:47:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DLioG1tH;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726721254; x=1727326054; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aSSHMg0OaePxq3iPPMHVPRVV3RpF6c4DjTvgexruOiU=;
        b=DLioG1tHMAuTbQPzkIfovY4bsE5Zxi7K9KaXKBhiDdTKsZmWjt95Enzu8RHiDVrw/1
         ggI2Qc36417Yt6AqDrl4RnjJ7BPKSsYk6dKDJASdUtQGS4s5mgyVGG+H3bUcQDGNpSuq
         heeaV+a6ocDXtCvqQLWsiaj2MQE3tf9pk5nwL8vXFe2/iowXBLxghlnqlOwEb0hdfxp5
         LzZZAGxZHEbX7YVaL/T19B8/criKDL3mdNwWQlXvaIz8fUn7aS75odDSGBgahumpd9Ss
         PohQG6LAo0ixhZlKd2IQAkuUk5q+KInSld1wCNlWgGTcR5BBGwENuBKzmpBP69Sk+chf
         mfNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726721254; x=1727326054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aSSHMg0OaePxq3iPPMHVPRVV3RpF6c4DjTvgexruOiU=;
        b=RC22lmBKtxmUWs3w/UZg34T25tusbCfxWjufxat7oyV5vh/iH2ObuX7gAjBmVLSMxp
         3PXBj6TlV/WKm990Py9lAzzpbRN8/dJcKWHoauKErPOXO1uT4mBxJG4ZQMllrfDFv7/s
         KptGq5DKVtG1u9Fpq4DUdnnSWvl9xgLe/kcBksV7wPbO1kOGJUiiBtAxeTIJdqLYcBb0
         CeNb+rG8FLb+MXDkUKtrkwmoXqU7TLTWjil4ipcRSav/IcH60UzyPCdljtaGAzbWi4Pl
         uLRXj0pPV1IFN/vSkX0u+lYHFWX5mSQeJ00eZkQY+zP4KZhMjGGJXQV/SnWXSECRqf3p
         O0UQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmn5IRDIOJ/rMnM9sB7MuKy7LDX+zJ8JwP8EsRRxVb9ZArkEu/K9q3sr36fNzZSw/X+3ZPU8NCc+Kl8g==@linaro.org
X-Gm-Message-State: AOJu0YwNh2Nm1wHh6+yHYnoIbLhK7CxrOLRlU7zbDAeKh6EnH5XM63tl
	z1jmJJVI9OKR6UbD4zgQ1BkmknwqgDRgnTJHhXFi3VNbN4hLIYr0ZgBIOZvnnoqipw==
X-Google-Smtp-Source: AGHT+IE3j8c7TJIEEHqr1Tk9wQkhE0pmUtXEeEmFijt9ElqSlK/SONVHUSLzvsaukMbj++mLsF2x3g==
X-Received: by 2002:a05:6a00:1a86:b0:70d:265a:eec6 with SMTP id d2e1a72fcca58-7192609113emr31183331b3a.13.1726721253864;
        Wed, 18 Sep 2024 21:47:33 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944bc279csm7478601b3a.188.2024.09.18.21.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 21:47:33 -0700 (PDT)
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
Subject: [PATCH v3 24/34] tcg/loongarch64: remove break after g_assert_not_reached()
Date: Wed, 18 Sep 2024 21:46:31 -0700
Message-Id: <20240919044641.386068-25-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
References: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 4Yl5dvpRTZ2T

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 5b7ed5c176b..973601aec36 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -650,7 +650,6 @@ static int tcg_out_setcond_int(TCGContext *s, TCGCond cond, TCGReg ret,
 
     default:
         g_assert_not_reached();
-        break;
     }
 
     return ret | flags;
-- 
2.39.5
