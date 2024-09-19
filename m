Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp1161227njg;
        Wed, 18 Sep 2024 21:46:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXZL6PUkIQjSyNAwpwF3oHO/14326KGWXKaBggqALRbW1sw9AJtHUuJzMABlU8w08thcoSwK82ZlA+vHg==@linaro.org
X-Received: by 2002:a05:6a00:894:b0:718:ebdc:6c81 with SMTP id d2e1a72fcca58-719261fec93mr34368107b3a.26.1726721209441;
        Wed, 18 Sep 2024 21:46:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726721209; cv=none;
        d=google.com; s=arc-20160816;
        b=fO27lS9g1U9/GaxXEF98q3QrVUkJy2XKkw4zJfYbPCgYoDEX/c2PjWuH7hSR/f3jFT
         sTOmOLnLPNd+sKwW1gH8CDSzK++YNQxUS86zShc9dc1z6FNZgLZgxGmslGrItr5zkUye
         Acr+qGFMS6juc3azNevRDBYzM6uTzT1rPfmEKMdcrOHeIV9Pv1ex1gjDz+343m6q/Ner
         008nldk2BwR3njxdp5f6cJ2rNPy5i/vZQoh0w/MYZbQi33IJkED3o7qM8ZLfSKuqyvRp
         ckEccN7CuXhRYue2LkYqT/ZY6EAZTUGb2IZBw7G2UxC4z33X4iXp/qJxu6l12tp0t6vH
         XOUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=bKE/FaSnwekzuSHN/DiZj4HlusD3QhW4e3YSU1WvaKE=;
        fh=JeUdcrztPhI/bRftWY6tfwUxbbzJES9WsHhHCFbKGuY=;
        b=b0mhEfEybDfOrcDsDaflgkngsFndB7oQWkGON9xBYVuk6YvZjiOmgzSqrWmaezGSxd
         LNRLaMzaFfAl31S+8y/NBK5ZlWWGgmOY2jgVXas/RwVu4IYrQKR8v/91WkWmGCePKvW/
         1vgxfj2ZsE/GFL3fpgnmOisXOLgeD8XDRpx1H97ZZTia71PBi+e3eDZtGCOoM2qhFao6
         /9MEChSyy+46HJIDzzOFkocT92Rz5rEuyWW+xJ11g4Yv1N6hJKRylBJFA41ZwbhZm/jB
         Uk8UxJ4Bsew8fwnzgIGI5p+isCCJkHUinZUnz6K/WRt5oHSGZptlbr8hEyUbkhsD5TeA
         D0NQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DmLiCckd;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-71944ac9b27sor6709602b3a.4.2024.09.18.21.46.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 18 Sep 2024 21:46:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DmLiCckd;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726721209; x=1727326009; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bKE/FaSnwekzuSHN/DiZj4HlusD3QhW4e3YSU1WvaKE=;
        b=DmLiCckdUQaQa1vU47uX/zu6Rf5HPjl4tizD6uAd+tp/0wa+huedYb5cGHcSwvb475
         vak4ZjAXAQu20lgFM5kbGH64h1yjZ4FH08meAb6X17o2PxwxughiWp2iS1ltAXBzz6VW
         DH0fv882ck01MbzOTSj5FeSqGQs47fNJPN6utPCyvt4/J4LwIHdfYD794YjdSwgk3usq
         sc7OeNY3u0E3hDW7bRu0ki2/nW7v5zo305+to78qGIgNmL9R5DHhcw5z0WxfZfsiJoWz
         fERj9wv6IwQ8hnkGPobKyDwXvjdZ4AXqTTMRwcFN5fljXDssi4buYiuonVqZa/vEtnAZ
         Hu0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726721209; x=1727326009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bKE/FaSnwekzuSHN/DiZj4HlusD3QhW4e3YSU1WvaKE=;
        b=ffsYsM7/J1sbcG8yPiytdmepbyTX6R2etlVCNYKIt0AgrOdCsw9+gpAbArTzmHW2p+
         0IvEFbmOcc13Ds6qiLF9nM//DmoVx331LsPatKw4mzZ2MLvLvfyy5gIgRNOgX2oHeCsB
         IPZYvkuG77inDQNnyV7le0IGrZ3qeZVyfaQgWmhV0tb+8HDaAAjA/IW9pljiSSwC3YUY
         Y725ZR4tZgxKrO05pDGSmChwNoYc7nCepYMUyiSd1dyqxJqmlnW94E6fu2aKt1ZrJKeN
         Ns7ooWLTRT3npHvsqMERY7+Ms3q2F0UU/EVsgAxgw44NFoy+8iodiOfxuUUkulG7SVvY
         t7eQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNCLNyvBq3a+MSDXOTljEzasDNeZTvsvInu/MKnGS5pMlwnTZzpGxGeyn0jTWGdcX949uTQDwEZMD50w==@linaro.org
X-Gm-Message-State: AOJu0YwTB6LuDSBUypgaMC8YK7GBOX/I2eSraDTaSkBAcqSpgL6j58Br
	b5nY1h9qxINg3ea3jktvmqYjT+kAeLgrwaPHzOXdlNhKKi2iq6ATRUDHeCF5H8dZVw==
X-Google-Smtp-Source: AGHT+IFSLpGq1tdAK7kcH0oPXH2ipnr8o9jAFjv4J5HFm8vaiwaqPv2XJ4VGf5F1OUzUb1F//zn0vg==
X-Received: by 2002:a05:6a00:2389:b0:70e:8e3a:10ee with SMTP id d2e1a72fcca58-719261d9b0dmr36234028b3a.21.1726721208838;
        Wed, 18 Sep 2024 21:46:48 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944bc279csm7478601b3a.188.2024.09.18.21.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 21:46:48 -0700 (PDT)
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
Subject: [PATCH v3 01/34] hw/acpi: replace assert(0) with g_assert_not_reached()
Date: Wed, 18 Sep 2024 21:46:08 -0700
Message-Id: <20240919044641.386068-2-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
References: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: quTkHO5jiMwE

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/acpi/aml-build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 6d4517cfbe3..006c506a375 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -534,7 +534,7 @@ void aml_append(Aml *parent_ctx, Aml *child)
     case AML_NO_OPCODE:
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
         break;
     }
     build_append_array(parent_ctx->buf, buf);
-- 
2.39.5
