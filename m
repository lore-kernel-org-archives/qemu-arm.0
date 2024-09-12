Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp422611nji;
        Thu, 12 Sep 2024 00:40:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV6ED4tTOcXRvEmZG4i9wdZt3swwbQ8BHOOviQD1Sw+9UEvjsUStpz5p+oIpE/2Cidb1YqYmTobz7mclA==@linaro.org
X-Received: by 2002:a05:6a00:14d0:b0:717:9768:a4ed with SMTP id d2e1a72fcca58-7192609318dmr3454751b3a.16.1726126805953;
        Thu, 12 Sep 2024 00:40:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726126805; cv=none;
        d=google.com; s=arc-20160816;
        b=bYl/u6oXumKoR1nt5n14QQ7oNWbfcRGCnrGGBZXhUPCrtDRS/vQuwiAls0HTZCDTXc
         v6dZCoZ5GtmbH5CMGUFMBm0HvLZJ2c7nuqkrmwCmhnqAoUyDVOZD0Nb0qmSl9YwIm0WU
         yMiIUZJgsz5zSfLfc57v0wAJBRJ380gbN/jkkE/3U79ID+1F5tESsyYtFWWMaJnzof87
         1+WWi48KjnMD7oIFyphcyjxFXwCpajBPC4aDiH0JzLazBj7TP4ru/uDnEOphrsJ4bhnD
         5h5x8vE52i9687iWET72OoDBFNuoqtNzgP+o9sSLSPgQ7cycUmahSy1Q06cxN0VjXJMf
         FeeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=5zF+jA5qLmLbmnQj5+SFXwtuz0TNrysgMomjB+iiCqE=;
        fh=BAccsi83A0dXKnCkc5puD1NdNfCbTb7jbtEaay5T9WQ=;
        b=fT1t7gkAJIGt8/KjVaDRXaJV1VbXeMLAZSWGvTQhiygaaA8w7Tubeh7T4cJ7cVTQQh
         AlaEyHB3pg9abQ07pRbzaIO8z2DZlMuAbX3YfinHdBRDarixv4QqRI1M1CxPqrNWFFQv
         g38jqeIcjT9hpV5jVxHtXuSOgQTU9nnQ8ADxpxKb4+GBpdXcuDkEWQ+IbUY1UfnCB4CZ
         Yw3D+MUHlMzRi++59J72/8Bjx/LisLatIQNFo7/Dcwlv4l1oRP0vreP4VSAOhr+l6Z9k
         PuS8cyKoXfC4Ee7w00btVFy/w6XGClpsACDEwGpJpoAQDHKkTDNb+AORdLnvGH6Gql6u
         Ci4Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fQDDxn+h;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-7d826071deasor5359206a12.9.2024.09.12.00.40.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Sep 2024 00:40:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fQDDxn+h;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726126805; x=1726731605; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5zF+jA5qLmLbmnQj5+SFXwtuz0TNrysgMomjB+iiCqE=;
        b=fQDDxn+h+f2NiXeR1hsfNgMe1aEC8SG/Jp0fEcNETSluLQTxzDTspfirjuyL/ob3T6
         +Tz4pL1i1TNIMnSSxfvTV5ixwz2tdn/54IUs81YwVexMScC4qSyogtjB5Tnw9enGea+j
         e6+137Yh/AhW5shMWisX+mWttpPMo7Ebghu4mf3Bs7Y0tpUvRnlD9xZY7ZZJow5Kb6v/
         YWoy2dXv5yB8uWTU5CfUfOHZZZvAGFiAReZOKN8GHEbbnAgTr9Dynv+DVbPyNx8nJgLO
         Cs+Q0kzLZ2WgNNULcB6FrHX/2ODGVYt8awyDbqzxg+3RKG7DPRk5knosfLW/0aEbAFU2
         z5ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726126805; x=1726731605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5zF+jA5qLmLbmnQj5+SFXwtuz0TNrysgMomjB+iiCqE=;
        b=pYjEMObYkjnAHEPE2b+oWJw/eYrj9VIC4MPKkrGRmzg3BCFznlM0fFts982laDypoV
         tvUim9eAEU+UBWXcKYtqDHxVHmaIoF96/X1jh8K+vC1IhJUqxzJeiJm0wkuHH9QJNehi
         y1m2Y6CWn010BtZYQ9RzkNMYFb1hfKShzP8mi/MlVlbhxzWNF5VSOjnBBci9/cZDhzhP
         vA11Z4CifdncW6Yt+AokGDnmhWCEKjj8WnfLaO2GVZZW3fmH1vNPkE+Uk9Sm0hwJ9VEi
         MAWzp4LRlixBqNp13w5epRb/RmWe2s/f79fanSU513pajhruV6+MpG+dXyNwOrYFgW2M
         pJzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBHzFz82ggrnThDSE+roUfdX8U7t/of5W+Xw7GseZ1nhZai+rd/juin08ZTzN7txsVZGMmPnup/HwQlQ==@linaro.org
X-Gm-Message-State: AOJu0YxTQtlLccAfCFLPlFsLUrT4ctRXF+p2DFy481bcLO32aZ+Jy1tR
	oEA3ndMaimRFxIGxfNpunojCAEgqGAgV6RhWxccccPIgHvmDduClPWpNcBmNJPRWJg==
X-Google-Smtp-Source: AGHT+IHDXrX+NbUP9NtxGqG8dJEo0gfcy7xOv/m7ynMdOyBHgNq9WtYD8rjvMD0vL3Bh2gbeHd5Gyw==
X-Received: by 2002:a05:6a20:1056:b0:1cf:9a86:73e4 with SMTP id adf61e73a8af0-1cf9a86a035mr1164601637.14.1726126805353;
        Thu, 12 Sep 2024 00:40:05 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fb9ad87sm983458a12.6.2024.09.12.00.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 00:40:04 -0700 (PDT)
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
Subject: [PATCH v2 15/48] block: replace assert(false) with g_assert_not_reached()
Date: Thu, 12 Sep 2024 00:38:48 -0700
Message-Id: <20240912073921.453203-16-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
References: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: B6VaUKBr0zvy

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 block/qcow2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index dd359d241b7..803ca73a2ff 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -5299,7 +5299,7 @@ qcow2_get_specific_info(BlockDriverState *bs, Error **errp)
     } else {
         /* if this assertion fails, this probably means a new version was
          * added without having it covered here */
-        assert(false);
+        g_assert_not_reached();
     }
 
     if (encrypt_info) {
-- 
2.39.2
