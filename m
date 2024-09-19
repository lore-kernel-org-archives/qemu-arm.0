Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp1161333njg;
        Wed, 18 Sep 2024 21:47:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVUOx3VrolxMPC0ZMn8tGoUTYk0rwT6YMSTjO4K0JX07zZjHSoHHFqDi/0bWB+8qYlfKuN/nCmZT74U7w==@linaro.org
X-Received: by 2002:a05:6a00:2389:b0:70e:8e3a:10ee with SMTP id d2e1a72fcca58-719261d9b0dmr36234937b3a.21.1726721228748;
        Wed, 18 Sep 2024 21:47:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726721228; cv=none;
        d=google.com; s=arc-20160816;
        b=Nc6D5LTvz9MsRwiJHjfGLkuOItNK2YQ/1ZijLbVLsLeftNingSMo9OI0yuZC/B1OHu
         q/gvdTyfd7RQS2UmnkwgciGGkpn51EgCMPy4Iqzk0ZdjjdSE253R05GgMApRsw8ifH/Z
         lhjXI0cBq6cv4wy17LMN0q29qNZV09zvMu2W07+59GfpyRw1BNdSj5NLgIeC6+jLXF5I
         SA36IJcCRgG2cGVfEgjPqTJIfh6tmFJ0Ujw8c83QQ7g4rpnsOQQ7ezM9gKJg4t/PDKD3
         NU+fZuvFmY7ZIii8BNrm2/X57FgmRjXrnaDFIeaz9fS5KNMmEiRYwnwBc+UviVjVnzUc
         9dyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=la0dMEWQk3jt41a1BnPVKduxSUDoWih+Jb1d+U0bfqA=;
        fh=B17MhWkBnAynLGaCErmu3i+ctow2PrLyH7rU3ciCR3Q=;
        b=Y+7DMTtDQLeHXJBc4xSo+vry9VTzvnI12ma+1dCFEtae3jR2PoxakPZH0JqfslCNTS
         d/mKL/v08feMxGo3oEr9gEZXka1Bd0AyocqYzhokbzS+MWoChCUAC9UYoiJirKcwo2OX
         XmKp1+/jbxUhaSH8u/UTXm6xA1KO1gUG3ifTtzJ9jylf8twAHSeeIcalAEcgp7VdxCGK
         5s5qRT+X/a1YPpj4C9eAJ70ZhREzH5JNAc4nzfy5mGVpAWxJgXYkpoW/7WyPuTOc5Bl1
         Wc1XskPJ3wTChZAzUldMwqKOcItLqU3geMkV1SHgjNz5lit8oRtQw6816OgXaxN1pGZs
         jeXQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZwsdwlVk;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-71944bd84dcsor6666118b3a.12.2024.09.18.21.47.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 18 Sep 2024 21:47:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZwsdwlVk;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726721228; x=1727326028; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=la0dMEWQk3jt41a1BnPVKduxSUDoWih+Jb1d+U0bfqA=;
        b=ZwsdwlVksZaqX/InB7bhm+rvysSTy6yRCYz2kCBV3CxLzXXQD5TN/jsq7T0eQL4aYw
         4YXGhL7EQPzV26edCCG/xuE8oOCcZ38WYtp2bZRn4INovANhE5UR3pTPoYB8LgALe+oV
         BDD0vYryHK1PdRdAyu8bWHpSA4kUyue1oYTSyNBJ2GtNwfoCQPf1py3njwV7E9DDs2RC
         a5FGn+l0VdtVKvfjla6ql7tYXHwoBNlFrBA2AE95ns0tFwDat6ZhVFGQZ6PpEM9RRmQZ
         C3l+thUrxYdpcLMFpCrcMl47n8IsdozT3U4Y6FFeD5twPqkp63nrrimY0w4HhZUj15FW
         VqMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726721228; x=1727326028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=la0dMEWQk3jt41a1BnPVKduxSUDoWih+Jb1d+U0bfqA=;
        b=AavLXe5CbzsKuq9YuuGZK54+FS0wgP7vD6DAN0UvD4ibQwCT1fKcFpsqUefbai6flC
         pk19Wzn7Ykh6R7eB7EkC3FjjNWouqCVV9AGamfef/7xVvWqwBHBWOzxtCuIDgHaHrmNR
         KD1Ox8MC81/tSNFYrbxCexB/tDZ8JJc/6P6gY09Z/lLVCweb02J+s54OTFbqWwH1g+Us
         bGO6REv1qzEFWN0r5vsnl7hRxWTFBFNaXTEkuKjSY1dzklQHdBfB5QwQLUf2TBjW9Fe9
         WHujZlyZFqXq2j/oSEDtZ9kaMmnDvdF7I++aDBqfXHWDwahul9FsuTpC1M3XG7a1R8uo
         1Axg==
X-Forwarded-Encrypted: i=1; AJvYcCWQR/u8bK09CgpdKGDLdH0OFigppPZZHp6jqQEM0mkSjMZNOL3+luHX9zrH2sTKUoN2iTxu2RjwbDNpKQ==@linaro.org
X-Gm-Message-State: AOJu0YzBqPt86zwpAiIvqjqT6iTipbLTMUrM/GJ4csBIYj660yRBdwS1
	Kb6umoIUGMiGxZbFlWOH/TKNH3sWIxCNM6sD1rTManeHvIiw+c6JQXmDD2/Jvt82tw==
X-Google-Smtp-Source: AGHT+IFO8bGqNik5TI7HaUtD4Bw4p0cKBe+nMmhw2c5B2Y+i3tMDnnj5/Vu2AHTpiIf90gDt5Orsag==
X-Received: by 2002:a05:6a00:2316:b0:714:1fc3:79fb with SMTP id d2e1a72fcca58-71925f9b26fmr39873231b3a.0.1726721228183;
        Wed, 18 Sep 2024 21:47:08 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944bc279csm7478601b3a.188.2024.09.18.21.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 21:47:07 -0700 (PDT)
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
Subject: [PATCH v3 11/34] hw/pci: replace assert(false) with g_assert_not_reached()
Date: Wed, 18 Sep 2024 21:46:18 -0700
Message-Id: <20240919044641.386068-12-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
References: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: xlDMvweT2wHY

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/pci/pci-stub.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/pci/pci-stub.c b/hw/pci/pci-stub.c
index f0508682d2b..c6950e21bd4 100644
--- a/hw/pci/pci-stub.c
+++ b/hw/pci/pci-stub.c
@@ -46,13 +46,13 @@ void hmp_pcie_aer_inject_error(Monitor *mon, const QDict *qdict)
 /* kvm-all wants this */
 MSIMessage pci_get_msi_message(PCIDevice *dev, int vector)
 {
-    g_assert(false);
+    g_assert_not_reached();
     return (MSIMessage){};
 }
 
 uint16_t pci_requester_id(PCIDevice *dev)
 {
-    g_assert(false);
+    g_assert_not_reached();
     return 0;
 }
 
-- 
2.39.5
