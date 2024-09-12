Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp422468nji;
        Thu, 12 Sep 2024 00:39:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV0mNQuQ5dyDLXMSApYw52AC0AhWmPV7ByF70W8ONPkDnbUrs/Zjx6dohCmZYrva3vovNm1pyLrbU+fKA==@linaro.org
X-Received: by 2002:a05:6a00:2d2a:b0:706:61d5:2792 with SMTP id d2e1a72fcca58-71926081bf9mr2550395b3a.8.1726126774541;
        Thu, 12 Sep 2024 00:39:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726126774; cv=none;
        d=google.com; s=arc-20160816;
        b=Teu73MGVV69Y56xu/lq+NY+WFs6X8bixNawpgO5+73H1jVaGIg8wvZPZ3u9ZYaF2SD
         QXbzRYNrWKdsfTO2ms0R7+bIDWBLo0GX7L3PP2E2cOwyJXHnQ4dTSGsZGi6LhrLgEtx5
         9w+xO7DbVW/LSIpGB4CcUHkoBmuFNxjj6u1JvZh5GxeZkqBiPOvNTDCVTi5ZixJxJS5W
         wfh09bzPcJBQctwg3sHhJPc2ylxe6jxLamMq/LTgTTUiLGEgFjMZ2Z8xPZGYMXt8nXB8
         nk9znOQtWyc0H/ogWu6meoAqS00loI1vdxIHjK4DFy6AzHrUNOQf57mobbF68NBb2gye
         a10Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=7ty7Rs9QHnECV8EUUJMzVINdjzR9zKkzYj9QmIBEPQw=;
        fh=N5FdJ96W3Z5zRQO/KXwx4e3eb3cucfQL7FAQdQ2BgSI=;
        b=jPjvvRcVecHfbUe4guELiUv+b1vUyhGCQYG8wfFacNlFJW04h4qDjSiUwLHZdya6O4
         805C1KSBgIhIQAXOGgKad84RT9rtulTzVxjdsCRwn2p/5DKhRJYN//U0W6QGjzPvladg
         fgk2pI/VfM2wcNxCr+H89A1Nu7MnQnS1khNbGpPh7S2fOemjR8nsVohqAoKmNOPFAEKR
         XSHNyglQlQg6RDWa5tZUn92BUs5y5F6asA52+Y4KsySMS7PsyjY35Mclisi7GXk728Yg
         O3CaZM7NzNo+t1/2BoXpODE1xm3HpVtnYGDLDhO4TrWcjyTZUnasrXK05/pTEbMotGAo
         H/gQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xy7x26Vq;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-718e58a38b1sor7978191b3a.2.2024.09.12.00.39.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Sep 2024 00:39:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xy7x26Vq;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726126774; x=1726731574; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ty7Rs9QHnECV8EUUJMzVINdjzR9zKkzYj9QmIBEPQw=;
        b=Xy7x26Vqy3Wf1rL5zpghshOE3D9Qp2ajmQTbLnrtk/i8F2Fiu69p+2PDG4QBqIMcfN
         dh0N+daFdJOssPijm+Srag6eJUgoqHXKVQbtXKjg5Z7jSh2rWOqRI0I0iMZtpCANV6fh
         M5ItjdEWJUcSW56Pw7623D3b5TvH1g4ixLCmkj4XZC/c38LRVWnMW8BnmAsK11BOeRN/
         4OBL/fBl5EXkQM0vvpUJ/MkClTSNp4rrTlVtgvskdycWvRsMzF8JxdXQUXyOpchCNfMR
         jS0fbsLSPOUpnqc1Mi2+d0FzwdhJtfBg9tHfeoQ09S+QI0pvFeRw80hoa7rcw84ZZDlN
         NU7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726126774; x=1726731574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ty7Rs9QHnECV8EUUJMzVINdjzR9zKkzYj9QmIBEPQw=;
        b=OghmKM6kP6Le5OnpTW+qQcdVIlxMBbhvWMrCGVlKo2s3uhr6DoUB/Z126wm4lxDPTK
         5Vn6VLKCCnIQju7Z2uBton5Hm6lhhp2VB1CIU6IDVW7a7ugF2/ME92rsC6+sPMwPF/nN
         BfxXQzksESxzTgybiS2dzkwbFBE/jnLROSGL4UN8f9hu5wuFj/Dlj6T6F+tm8k81Q/ra
         lJmV4d/opTETzqlT3Yz2wjyIlCn1cUr1Bj94LYjXEL3uDQJ90S5i6hs2QJWtygcoyjNo
         PCgnFnRpf2YFYUmSla01fLkVxxndo21OAV9+8AadWI7rteWm6RbiBZdowgHPVkltkes/
         PnWA==
X-Forwarded-Encrypted: i=1; AJvYcCWJ23x4DU7MndjRTb2ZbMh2PlAGah43JrerCwDaeE/pn02Pd+KhkJTC2lSbwakeIHmr005Q7fOGPowyWA==@linaro.org
X-Gm-Message-State: AOJu0YwBfs9N047r0nZWs61mpgzvxILZNsKKeM8OfS/I1nEwtwYTBkVJ
	cJW6vTqxGdNo9GJVP1pNHJoGpEfARxpH6/1lpETieBccHMwqV7nUyF8APnt8CFjAfA==
X-Google-Smtp-Source: AGHT+IGdy27o3NWIMJUV1QTbS6arySwH8o8Z7I8EmJsXVX+I+rG8YMWPvIhqlvjs8uvVetmJE6ek9A==
X-Received: by 2002:a05:6a00:1a86:b0:717:839c:6838 with SMTP id d2e1a72fcca58-71926095e9bmr2094282b3a.14.1726126773886;
        Thu, 12 Sep 2024 00:39:33 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fb9ad87sm983458a12.6.2024.09.12.00.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 00:39:33 -0700 (PDT)
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
Subject: [PATCH v2 03/48] hw/arm: replace assert(0) with g_assert_not_reached()
Date: Thu, 12 Sep 2024 00:38:36 -0700
Message-Id: <20240912073921.453203-4-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
References: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: vEehA05PLdv7

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/arm/highbank.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index c71b1a8db32..72c4cbff39d 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -199,7 +199,7 @@ static void calxeda_init(MachineState *machine, enum cxmachines machine_id)
         machine->cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     for (n = 0; n < smp_cpus; n++) {
-- 
2.39.2
