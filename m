Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp422947nji;
        Thu, 12 Sep 2024 00:41:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVZEWgnIz/qE4BPW9pmiBYB/ywUJgk6Mih1aWyJJCDcZqTn4Pkv4Ng0B9ULpebEUJ7noaDVpcf3f0qRVg==@linaro.org
X-Received: by 2002:a05:6e02:12e2:b0:39b:20d8:601e with SMTP id e9e14a558f8ab-3a0848afb8dmr18701715ab.3.1726126877967;
        Thu, 12 Sep 2024 00:41:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726126877; cv=none;
        d=google.com; s=arc-20160816;
        b=MDQ/JjBdu6ueJoqEQTsbv+X+dcy6FsdA5OEUG40oSPvDPR3tQ4ndQ25E2L0WjI6Ycy
         S/UdPn4BrJT5x+qU3N3ymp4E2ajLZFvTT376G1/fSmsBAyV0IqK1zdojMef+dUYNH2vV
         LJvOV2QiFakga8BGIjmAzWPFFp3v64euUIy814dGJxJsanCenJjxHsmL5iBtO/e1QyY0
         3/oVo96FxS+Q1id3wob0JzTIhbVeJJGW60gmPO0WI0/wvexvZwQJHw/UBMPLRriHlG0C
         I9eWQsrWc6fhpRyMcus4C4v3WzO+M6aUflTBw9iipEr0P84PJz8+DTB7s/YPEbB4rBxO
         abvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=pMUYyvkrsw4WRnt3KKvMbrVUL0nLRii9ZhUC+JLdWEA=;
        fh=PJXxrn3udlEiYhr+o7U3x8ALluNGm5SKEeQ0hrzfm00=;
        b=gj3/4aaTf+3sXNKwFuXiwspgtDGO/3GYb7OcWwq7dFqf1lC5nAeytOCm4vgTT9C4W5
         xqONyuT5Vhj5xPWMATzgXotKf2IQ+0gWqMzRaEYfjIOGtPkGHLcUxlXdSOE4mhKs/Ibm
         /VftaxjO7jziSQkQqnGKLRT0n41GlonrFKHCQV5pFLH7Ejz3rCwSGNoOZ46/v0ZipPrC
         ROC/Z0/5CESG2NaRFlN1kDu8U4RPDHddsMSX6zXX3div4Nq3HcP3WSb/wnjOspgsAnB+
         drSkH9CrlhLKwz68fS5+oAUhApAs/GBqarEC2UHiA1bnHXeip/y0LH4++G4Rk8vInguV
         116Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sIdlzZbb;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e9e14a558f8ab-3a05900ffddsor22564215ab.17.2024.09.12.00.41.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Sep 2024 00:41:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sIdlzZbb;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726126877; x=1726731677; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pMUYyvkrsw4WRnt3KKvMbrVUL0nLRii9ZhUC+JLdWEA=;
        b=sIdlzZbbTqdmalYh40f0+6bMW7WSoKKFOiD8m57j4TtQzVBjXH+xgv8J3CcZwkxKZ1
         KvHMVq3vztI0T0ampooJnykXuMfRhS5vlY32E9UpiQkyPictiYQ55QU5BvN4OjxJp1ye
         i+LPvcfJYaIKeHILFLSP8VwI/PeXCEN0eLNcSy2lhdVfphxV3hYI9AsPWbxZEf5LS07A
         lhYujXgaohs5JdYf/LWJ9wVJdkl0vOERFvFNgYGY0WwkdllnqLYjVLiG0V8H9AX9LFhO
         MbnQ5/jGcVHgK5yPMssl3cCSfcb8i0pbp2QJVoGacaVC+aBq5wbw1JUI4JCBSZtOe9/k
         /Naw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726126877; x=1726731677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pMUYyvkrsw4WRnt3KKvMbrVUL0nLRii9ZhUC+JLdWEA=;
        b=ne7X0sz3yN669Vt4di3zS/x7lxqwh058k8ZnGUlBzMhNtyg95hNIiRLvhEiNeZ5ed4
         MQ12ejG5l754W0QA3mGiBM1MvVIoTVA6QhWbZuAMQECnqG/KQQGno6V0aXU22A9m0+lO
         DBX5H6JSQKyk76HWRKOYk6dXIN/9EBKVlDCZxmXBdmMijbp8bpjIyvHK1NKmnA5y0Jas
         zcG+8E7Gr929hONVSzHX5lfl/+xX3CCS6w8kH7BhYn8wmfd5Uw6IOeLswIH9K9fBNe0j
         Rqy+NBBfYUYNKRjw0/1CP6EWM2KNRtixYvxC1pxxU1hr9CIpKHlqNAtxbT28J3YaTL2c
         KjsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXn4LyG8UjNNrq/XcjuYX1dY1vKRlvE0vxQTTlog087TtV2fEtgtqSSFA4MHaqii0NNi0CpMxidowC2JQ==@linaro.org
X-Gm-Message-State: AOJu0YyGQhbgKQtmIeBtziCBVmrwUQXyiY3jeeuZE6E2eeP89HqEzJz3
	DHaWcqRnqLt8Ww9ouwxSg6C+1a4jm8aJReEb1L+wnu8eeCss7Pns1Xf4Kysa3mcksg==
X-Google-Smtp-Source: AGHT+IHzePrHc9NvGdqaAhT6SIBTHUep9YZZsqe6VCOInwH/5gPcwLaBPPH2x/wVY/X1vhjYzcDUGg==
X-Received: by 2002:a05:6e02:12e2:b0:39b:20d8:601e with SMTP id e9e14a558f8ab-3a0848afb8dmr18701325ab.3.1726126877432;
        Thu, 12 Sep 2024 00:41:17 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fb9ad87sm983458a12.6.2024.09.12.00.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 00:41:17 -0700 (PDT)
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
Subject: [PATCH v2 42/48] hw/pci: remove return after g_assert_not_reached()
Date: Thu, 12 Sep 2024 00:39:15 -0700
Message-Id: <20240912073921.453203-43-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
References: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ElL6+jNLpJoK

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/pci/pci-stub.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/pci/pci-stub.c b/hw/pci/pci-stub.c
index c6950e21bd4..3397d0c82ea 100644
--- a/hw/pci/pci-stub.c
+++ b/hw/pci/pci-stub.c
@@ -47,13 +47,11 @@ void hmp_pcie_aer_inject_error(Monitor *mon, const QDict *qdict)
 MSIMessage pci_get_msi_message(PCIDevice *dev, int vector)
 {
     g_assert_not_reached();
-    return (MSIMessage){};
 }
 
 uint16_t pci_requester_id(PCIDevice *dev)
 {
     g_assert_not_reached();
-    return 0;
 }
 
 /* Required by ahci.c */
-- 
2.39.2
