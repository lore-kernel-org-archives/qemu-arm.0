Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp422652nji;
        Thu, 12 Sep 2024 00:40:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUR5RhjoRysQoWNFzx2PJk6x+mdxIYcOmMZpmXglGNtWlwFgLfbe6qsiX8SaFhAsY5ycNdSa3RHet5G9A==@linaro.org
X-Received: by 2002:a05:6808:11c9:b0:3e0:6a75:63ae with SMTP id 5614622812f47-3e071a8387amr1183288b6e.10.1726126817484;
        Thu, 12 Sep 2024 00:40:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726126817; cv=none;
        d=google.com; s=arc-20160816;
        b=N1W4MexqMblKxrKJGScDKxOpxOK7QW/IDRpLDtvua7Go9eq7T+E8zCN2CkIB3t3vPa
         JOFHFIEpdLEDkHMPk3OpXrP14emIP5SD7aK/SQtH+zsACeog4o+LD8w1GHKpxfyjSKb2
         +GNk2I23IJU8jlv4N0pj5PI2zabLJZx84pvI+gwtNr3gGp5LXW7iwoZy/Cd4b0hAcbzO
         050tUILiqduyf0XBYz80AGzsD5MBbqzNH0A9oml35suV+9hRkk7Vs+vEZcRrPspT85Ys
         vRs4DJWtmdVGG3pZAeg51hJZDQ3oJDyJ2LxrheKQkNHd82KNOfAPDEayAGzBhov+EkIu
         Al+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=THAU92UrM0dCOcON0qgAWJPM/1rIMc3WLepZV6d4U4w=;
        fh=7+mJF6BYVZ5qjo3yQB5Y23H6dwhXJWOWeBvVntZfQmQ=;
        b=Obs5p6gMva1CdsmmTe60e8C1cjOmsWgtX+yQwyzNjEWu4PnsqNajouxjLb2TNqdafu
         OOmfwWjtF0x5LqWe1auRGNhOt/GWAPSLcCgmQ+rQghyUt3PhBHgj4Z5zP0hbtgMPe7OZ
         K6fwHPojQZubN71yhW7a/xZrD6Z2y2pyomJO1IuKl3mDpnZDeBnmniB0l06T7NEUFe+1
         aTc2uzjVHy0j5hmna8WfzxI5WaAomy32z+CTZyTcYUQMI3PftJdA7WzH1iKTZ/F+R48W
         4fIYfZ+9W0qZ07LpIMXeekrcM2kcE+ni9YjGvUgUFv4opVgpxKbyztuIPYxcsIp0rvWC
         hM0Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x9DBeQlQ;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5614622812f47-3e039b7a76asor4843171b6e.13.2024.09.12.00.40.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Sep 2024 00:40:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x9DBeQlQ;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726126817; x=1726731617; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=THAU92UrM0dCOcON0qgAWJPM/1rIMc3WLepZV6d4U4w=;
        b=x9DBeQlQMIE9J8mRxqOxk8+S3dBOacpzAKvERPiGgrrHTZGTI1GEtcVZ6udQeTp969
         wEcFis7ACFgb99//qndMdhoMpRwlQrPjKqwFV5p2ztg/0dyq21sxWcdAtpenR5az0d1L
         ppEFASDmls0VlpITHBP6o0Wb1bQqzyj5gBo1vZnLAHlFiwMRS9fgi6JZQUV3XcyY8/CO
         ylnXUJ9IzUwRXMUeXiI2ibeYNIbwvDYJB/ieYeIXSJQfDfVH2yLMuvsSuI/8LEjpkoky
         m8bns4XLWigk+CW2+5BhpRbh3XkNuh2EaeB8svqTYU9CC+aX8nFp3MVfersY8ZERO89+
         DDBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726126817; x=1726731617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=THAU92UrM0dCOcON0qgAWJPM/1rIMc3WLepZV6d4U4w=;
        b=JZ/hBCB2mDEz5pm5qZ0v79VtDUbmLsrmCINFSdh6s4sR81pCXtllLWcrC8CUw5jckt
         KK4FP6zOrU8swEZAgwTni6RZ+TZTKBFPWJpzyN17gsPeapjTTQCnq3Oqb4z5E5XzCr8v
         ESrJzkL1sxAENOpyuvhwfmFZf25Id1E3cBmO9RMeEuWUr0aIFi4RsVzQRvO9+g10szcn
         G+C51WQniz28kCWiv8US99awdomd7glgE6zD1I/kT78IHBwEGzc8tvCElfdkhONDtojh
         rx3R2zJbwyYpwH28IWN/7fdMXzqF748O2BaMDxyMJUn39tBLLHt8VVZRTGN+rgb9Iq/U
         qC9g==
X-Forwarded-Encrypted: i=1; AJvYcCVwmWNpFGuedL8vNqGVLd6TEgAvQqEFo7II4x6dJ8JxkIfFZnk1yxI7Ua4WsUkq6nZkvJjyQjvOYWHLmQ==@linaro.org
X-Gm-Message-State: AOJu0Yyy+DJS15uyT5z52uJOcPAZYxhwAsCKq8Dea5Wqw2sW5+JJ0uEu
	bdOxYDFB7fixRMp5uW+R35WJjmI6cvPhSMDVYdCrYE0WlWfgyqO954WYW3kb9ChGaYdzy9AnHjs
	Wp/evTZRpO4o=
X-Google-Smtp-Source: AGHT+IE18OQNSYCTciWDcZ2tARjoD9KTkXd4QIX1a/2fI71lIh2I9Gute7KgIxVtwws+/7Dh8z96lg==
X-Received: by 2002:a05:6808:23d5:b0:3e0:45ea:7fbe with SMTP id 5614622812f47-3e071a97f6emr1220176b6e.13.1726126817031;
        Thu, 12 Sep 2024 00:40:17 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fb9ad87sm983458a12.6.2024.09.12.00.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 00:40:16 -0700 (PDT)
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
Subject: [PATCH v2 19/48] hw/pci: replace assert(false) with g_assert_not_reached()
Date: Thu, 12 Sep 2024 00:38:52 -0700
Message-Id: <20240912073921.453203-20-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
References: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: FOKwvoOzhWBc

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
2.39.2
