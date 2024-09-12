Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp422816nji;
        Thu, 12 Sep 2024 00:40:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVYYd53VlijcCo9tI4CFFpeQEl7w9u9euC3WBjUaahySR8MJTGdZyJa4Op00+9MKf9MSkQm+guS3xNsYQ==@linaro.org
X-Received: by 2002:a05:6a20:4894:b0:1cf:6625:ef0 with SMTP id adf61e73a8af0-1cf764c41a2mr2188304637.47.1726126848757;
        Thu, 12 Sep 2024 00:40:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726126848; cv=none;
        d=google.com; s=arc-20160816;
        b=SmgZX+wKrjNh/Zm8P3slwSyGccGxzm4opZWQ3SS3YpFd4Vp0LkAg02ZRYWzUJqHO5E
         v2L89+uhrKD/bHwk7KBmcrRNI4koZMAnud+/MRa9L336AbzY8JsYXjNn+B8sX9vURBdy
         drUgvmnXV06hys5N7+gL9Edme29lvlUhWU0nOL8SmMfX2M9n/Z1awaPUIt+pbi5Or0iJ
         HhnW8y1PNUCpz53v6DcF//4A7d4a6LfpXky+xjHviqfVQ8fySucZhoE2eJPYHpGX8oEt
         MrUXUgXd+0PhhA1Yed+6hXC9yIEylVqUjYgbvm1FEeIL3kDWg9f1ilVtQqLoQUezCDPl
         rbJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=PpoFW3JjD5zeg9AjFjAz2aaQ3UrReIS3eTyx8szr/r0=;
        fh=dZ40dOz3HLQ1gbMCc9rsPcd70r08kJyjwUjDb5vNZd0=;
        b=xlssc6dEigyuHur95EG7l+eB1PNMKy1/QBcpJrsY+RiQeL+TKlhCpMOFLfgC+Ij0oI
         PZ63CrzabKzdjQVVKqSp6lbs9dacsElyeXZsmrwMDYH4l0aeU94NYaJk8eMRqdwrZame
         opQgczNthDLMdbG/f+SSgIyiSMeGBZqvObhe3YX4JfoEpxOCIyGDwiRK72ZvuEPonYDe
         1ecPtGLfovAcmg1gLATyGLjbytnBqsVfghDocz5wSx/XI99T5k3Wy97/fdcosCoFaGad
         mTCGAAadedGY+A1ot8kpRr6yHfK+6M1254Zn+F9R7io4fZHmM2wqDdCl3aHI2fbLw1/E
         EC8g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X6C2SzgC;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-718e58acd7asor6893459b3a.3.2024.09.12.00.40.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Sep 2024 00:40:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X6C2SzgC;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726126848; x=1726731648; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PpoFW3JjD5zeg9AjFjAz2aaQ3UrReIS3eTyx8szr/r0=;
        b=X6C2SzgC62T97IIVoZ1XaBO8tle3syIxttSTm98tLQdvV16Ex3wmIbK5YcSm/hMTVc
         fB9M129tW2Udg3HwC2dHN64zhXi3eZi95L4NHYOzadDJSFHIce56rXuZqQhIsor+J48m
         7d16ov7fZTtUMPivW+gUIoXgIoUEAB/MqUURGPmp9s7f2NROBBp2HhXp2YqX+zK8Vre5
         qy4t/3LztgoAPFfxQu0P2Ym5lYcds41RITh2KdrVcARK1c2IE8pHnVnanhyoQ6INP1yS
         GnYZ0R/n1pAQFNXnkkfTle1dtGb+vCyEbGdMJdhDLxSQt18IkCTwUzMdtEERKv87txzG
         GUPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726126848; x=1726731648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PpoFW3JjD5zeg9AjFjAz2aaQ3UrReIS3eTyx8szr/r0=;
        b=NH/j4R/Lr0ywOJGyLbYhKypVRb+Lv1BS10VzomGDaYzPL4YTDcvGpMxLJZ8CL9QqQT
         RNiVQEUX5b5NIBJN/J/5bkrpPaCFOpVIfHnFXfZBQiOz/dlAyASNhGZF32VhRiilpoAi
         NE8nkhMIfOVUzMUI2abyBlrnAIKokQXgnF4tOmC936HXN6DXWKACot2M/72cjkMWzPMQ
         I9lOU9B0Mubdu7ikTpNsUmItzcqqwB74ZiblHliaoHpde8bzYiSIyySDlgIXWnO5TfT3
         yIQAiZ/WewDJafjdUZo9515xwbiqc04hjJGXJ/ACR7AE6fUF74wQgUQxSxJKqwaSyAOv
         OXRA==
X-Forwarded-Encrypted: i=1; AJvYcCWZLOOC3AZ59w4m+H9VyRe2hMiCQkkjP4j06s63JFUscuRsheVetW+bD+AcfSAgT8NmRElnEk+UobIguA==@linaro.org
X-Gm-Message-State: AOJu0Yx6XksvzCf73URUBPjZ3RndnBJJCXFu07sUfCaILsrqXEKZBckO
	t27kb9Eh6sC7BCXyBt5RtzkQKag0X2ZQ5p1aYvuDzNzIVz2lqwSSHI+ktkcJi7bF0g==
X-Google-Smtp-Source: AGHT+IHrNzFr8rAxfNqGUQ/W4jAVrPS/G+v+L27QxJD+DkA0TVwS9jjC8lWOw+J53BlKzThCp6mjqQ==
X-Received: by 2002:a05:6a00:8d0:b0:706:5dab:83c4 with SMTP id d2e1a72fcca58-71926087f29mr3097493b3a.14.1726126848124;
        Thu, 12 Sep 2024 00:40:48 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fb9ad87sm983458a12.6.2024.09.12.00.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 00:40:47 -0700 (PDT)
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
Subject: [PATCH v2 31/48] hw/scsi: remove break after g_assert_not_reached()
Date: Thu, 12 Sep 2024 00:39:04 -0700
Message-Id: <20240912073921.453203-32-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
References: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: RLdzx0NVfPIv

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/scsi/virtio-scsi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index 9f02ceea099..6637cfeaf51 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -357,7 +357,6 @@ static void virtio_scsi_do_one_tmf_bh(VirtIOSCSIReq *req)
 
     default:
         g_assert_not_reached();
-        break;
     }
 
 out:
-- 
2.39.2
