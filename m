Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp422863nji;
        Thu, 12 Sep 2024 00:40:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVXDc3LJNNSnsWvSDa5Feb/by9Wm+gfQJHPy9TN50Y+gzCo5HaOfPMD5QG0lT8I3L7GwxiSpcpen+eP1A==@linaro.org
X-Received: by 2002:a05:6830:258f:b0:710:ec5f:45b9 with SMTP id 46e09a7af769-7110951b687mr1709126a34.13.1726126859108;
        Thu, 12 Sep 2024 00:40:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726126859; cv=none;
        d=google.com; s=arc-20160816;
        b=IlJ0NF7It8pRcTqzz08EwkWh+AEMc/o7eLq7vtKq8hxoMlNPCJ34ck+0Qht1n4ur2M
         gG26POOR5GgGuajcBRzW4r3P7enuHwEXysNTmFlbLizEZ5YZQRrwRhPftuIyVZ30YCnp
         8G3vy8AOj+JgoryYylrA4ajxcyFFoGlqfYe6DLRa+WI0P0To6KQsVtq/+nGB280yod42
         GZfugYWgjq4s7EleagaG06H+iYAJPjuxntSJqehfYg/CfOQU0v+w7eeXvcpEE//z7Ok0
         zmCzzcnAfoTwJ5Pbpn+u02WmkYzdLI9wz3fWWdzgXgoF6B9oGOly3D1SmIltTqcuKsxH
         DKDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=UU43OuMIYQY5gzBd9N0OsX2nGrNJ5ON22GSd3bl0bUA=;
        fh=i8vfV5WXK2O+yQIB5sf8yf/kxjnc/PVIxV5B75tnsRk=;
        b=ZI1A7gGgJjLFepetGV4p33U/52pnCua6RnNntTnHsZv4Ynyt5cte9RWX0bG6W7xvQ+
         GDlq4ieuKZsTz7neofDOxhwDuFAk/zJ3FlU8FI9fAMggIE1s0QS+139YwbLDz4LF88Tq
         EVOZI/v/EE2EXvEeep/xi4eBp+DLsywLZR5IY4NnTWP/NSyZklssCEpQAfgnRshV7wJR
         NKJJ4uy275ddJNkoa60OQsw1cE9OWPkZvR2ViQInj8q3r8OhvO5OR9dwXW+KnQMwkcAP
         +t0BUXEjR29UwwpcuB9SiHjc0O8YvOi+yyX1k3u4Ij9aDTEDODSIA7cr6voxREpEqNiN
         VK1g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YGeJCse1;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 46e09a7af769-710fb44c8b0sor1492934a34.12.2024.09.12.00.40.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Sep 2024 00:40:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YGeJCse1;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726126859; x=1726731659; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UU43OuMIYQY5gzBd9N0OsX2nGrNJ5ON22GSd3bl0bUA=;
        b=YGeJCse1IpQolZnbHShCzjHd2s13Dno8TSKmQduuVHhkuvOGCKHeQ61u1NNUPXJXbC
         ikietI7zHHwXo+zhvUeZIpY52kF8TTc3+Hv8O1iH7alcNVHqK9MkFLxAy/Ri2Eu1YV+w
         OSbyN+JY6ppWHG+FfWCWdNodOoci2P9USuNSIYqaweeJ8vSsQVYdxO5jHY8sqrzCdgOz
         2FjbXBDHCh552pYKRXGoQ9ZgD9jbQTHTHcR8pSa44CqssxHfGKrxShEYAgIBolf9+DOK
         0Bv6cPoOF8Ohg/IiiCUbgu7tMAq01EVLYtWD6+15BLYXNZQ4PhaBI+/zWeZkukpMkEi/
         t5hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726126859; x=1726731659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UU43OuMIYQY5gzBd9N0OsX2nGrNJ5ON22GSd3bl0bUA=;
        b=sO99t8wXRmXq/L/HCXFarieWYt1k1cwMdMd4uvH9bTxr/HG54twMzE0TB6W1c0apBU
         E3cD4ZO5cnAAZ8Bp0IAdYMoNVD3ACa5LvG2UowXn5hNsjAgPTEkmSfChi2u0MHolqtbu
         Ltn070bC8Lo/wg5Yn/gHGhQhpvyUOIpbWJhyXKaGxCyyQBWif9Lz43m/uAjghIJLWWoI
         CoYReZ09AhoFB9BMbYkwjTdS2OuWL6vThkDM4QcyycFkUXCPICYWI6Su6/GRQxM2rLH2
         63TXqeuFeq6AJVU9GitrKpRX5IW36/uLCUBVyYRQT5wQKIntFAHWX1Sek3AVBaOC9tdm
         Xsaw==
X-Forwarded-Encrypted: i=1; AJvYcCVztbm65TBi697szagAT/6EcUIc/VXY8Gw43DOrqG7/vv+55Rfdgh/fSDHz03naXlgiL/uFbekaYkTRMw==@linaro.org
X-Gm-Message-State: AOJu0Yzv0LtsSfKDwj8IrGTFxY2uPvULzKyiJ3MEmXibHx5CeBEnHyKj
	K0NvIIG3BXuyfh7Nx0Sd1ITsOtDWEGxgGBomGam6Xe6z5orVG9N5LhzvJMMHcFVAdw==
X-Google-Smtp-Source: AGHT+IF2wNn0ur0oT/D0x/ryrXGcpmcSlu4jLOalBhzoC7Sb43ZM6r5tgiThqhwY6bCeeW8Z+2hNyg==
X-Received: by 2002:a05:6830:3107:b0:70f:36ff:ed09 with SMTP id 46e09a7af769-71109571674mr1236876a34.28.1726126858602;
        Thu, 12 Sep 2024 00:40:58 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fb9ad87sm983458a12.6.2024.09.12.00.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 00:40:58 -0700 (PDT)
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
Subject: [PATCH v2 35/48] tests/qtest: remove break after g_assert_not_reached()
Date: Thu, 12 Sep 2024 00:39:08 -0700
Message-Id: <20240912073921.453203-36-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
References: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: go6GOys2Fs/G

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 tests/qtest/migration-helpers.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/qtest/migration-helpers.c b/tests/qtest/migration-helpers.c
index a43d180c807..00259338833 100644
--- a/tests/qtest/migration-helpers.c
+++ b/tests/qtest/migration-helpers.c
@@ -76,7 +76,6 @@ static QDict *SocketAddress_to_qdict(SocketAddress *addr)
         break;
     default:
         g_assert_not_reached();
-        break;
     }
 
     return dict;
-- 
2.39.2
