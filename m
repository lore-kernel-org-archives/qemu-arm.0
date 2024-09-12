Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp422709nji;
        Thu, 12 Sep 2024 00:40:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUREGsUTIUbZosLyWPmQSE1Jsbw+jn9Gj5zn4jC0Fpwwus5c7qW/CgpUClaGTZY38JT9h6WWx0q0MFQiA==@linaro.org
X-Received: by 2002:a05:6e02:2168:b0:39d:4ef6:b36d with SMTP id e9e14a558f8ab-3a0848c9f58mr16716575ab.7.1726126830096;
        Thu, 12 Sep 2024 00:40:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726126830; cv=none;
        d=google.com; s=arc-20160816;
        b=GcdNc2HpKajylVbjwtf+Twcq9qCa/Zo6Om4oUAJ0zP2yqRu0ZYOmDVQtrXprAUt+cJ
         3idgYzIsoGmSfUQ8TKrpFRYTyb+njZTnGfmC+ei37ypf9XnO635YST6zqzQuQINT/tzQ
         XM4NbwUeHjtsMXkd7IBXQQ+RCHqeHajVHvVahaCTcxSoB2ePJRI/iQuuyMFfvqu69urR
         Pw4GWi/tLjBwXOnKRQ6gX65ZYjadOrOcYC8g7JGrFQZkraxSlpvVWhDI/qVMwoLmy7fm
         Acsofa0N0J2qBH0KkrKPXsq9fAFiTAhUyawgY3fVN6l4JpiCRkuzgeYwGjTMf0AvmLLF
         ajug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=sAFROPRNfnjqKGInm+avpv2FlUZT8Lrw7bfqM3cunwQ=;
        fh=ecMzJSa7co0LxzbFaU4yYGAaYm/A4ARC1SA4Ti+XUZY=;
        b=Q0osRmCOJ7k9lzQF6BDQUzkfRin/rkMfXvNjSAK4nVjCVfYxM6/urPTEPcNZfRdtcL
         4c6onKDTzx4/a1kbFLtOPXSQnZxDMOcuWGGYljxBbdBxmRw+XgrLwJuuXw/2ocNduOmK
         ofuZ1Rmh2/aDBwokPsD5vTQuNY4tRwRzdaYhQkfYrUWW9vKnYJzkmn09s6fIw6BL+g5I
         B3fB+vEmFyd9TjMX5YuKLZZgdlZ8Nyiaq4VCZoKI1m4avcxTNxI3D1d6WcVnmjUYfFyy
         UUIYnNHRApZ+AWhine55FeuFhfRoKy9xAMg57QT5T6J2+QV5hQ4dfu8pBhJa8GXCR7Wh
         cB4w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ccCKrhGw;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e9e14a558f8ab-3a084977d4asor3069255ab.3.2024.09.12.00.40.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Sep 2024 00:40:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ccCKrhGw;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726126830; x=1726731630; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sAFROPRNfnjqKGInm+avpv2FlUZT8Lrw7bfqM3cunwQ=;
        b=ccCKrhGw0niycc5Wxr1wS+yJJvTx/pLGVcE3NfiAu/wf9HQjt+YWYS2RHaNiXJnSjd
         d+S4WmfigyLGzp4SYbpSdngCSiOcNfz9dJCfr2JNJ9CmwiLB5PLwyRH3szHFS4Vi+ddD
         A6sA2oP7fHaX5nApVpii3M11yFWUzPEdiANN6PQTHFPLAk87b9pRLV/j9WEpun597Abt
         vDsFrIEa8VXA8Ki2sxX535qVoIkAVRD4bIB9q5cj6+3WqvqqiYzQlWouSe/OGxkfBCAq
         BJNyrKpuJw7W6II4ycExtS/tNGX+8Jw5rTjZYcOIfND+czqNLxkPPXCdKV/Z6oNcsUdu
         WBrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726126830; x=1726731630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sAFROPRNfnjqKGInm+avpv2FlUZT8Lrw7bfqM3cunwQ=;
        b=d03zF8RJo/6XMa/est8thwsPseyVDMVCO/pxu+jkX+8u2onSpyMMlDuDhnUOjWkyR3
         tEzabRZdzudv90iJ+zQgsBM+a52ALdZfSmVjTYfwVt5FAdH1kK0QM2+Trcy9os72614P
         sbI9RCtYo3B6nxx4BcCo873uIYGMte7fguKDb9oTgetXL7embtHpX5Utf+8cVy/eiIlW
         +yxVRl2Fv3vsDI962NipiGUeGCH5poTpc2dy3XCXBJnJgPYLikZKhDePze8DZylZceZy
         TWaBUrWPTFvJD5QOeZCKe2tHliy4ZAkJGIjymzQKUe8ugg3tr+u2IjrtQH89WAPr0XWa
         IItg==
X-Forwarded-Encrypted: i=1; AJvYcCUrCtu3bo1MsNrGWwX5sYrhCKqgoBGsUGYThvcvIPl6dtV0LJZWmr+PFhJPDSFMOpd5CT5ObNDh9c5XJQ==@linaro.org
X-Gm-Message-State: AOJu0Yx+fA697pFVl0AQnLHo5Pinq/hdSq3k94CzWo7ypep1EFIO37o3
	6lM89LC+aBzYePC5EKoOLFIj+PLUeKJekQURmvLfWutiFcbfuFUCvYDv19ji+ze9xg==
X-Google-Smtp-Source: AGHT+IEH81pDNJI3FqeUIYeBUH1XaZ7gixSvfp0/bKQHU2ae/DBaz8G+MQhE29wWc5KRqiqKpbOJOw==
X-Received: by 2002:a05:6e02:152e:b0:3a0:7687:8c2d with SMTP id e9e14a558f8ab-3a08495a790mr13830495ab.26.1726126829641;
        Thu, 12 Sep 2024 00:40:29 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fb9ad87sm983458a12.6.2024.09.12.00.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 00:40:29 -0700 (PDT)
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
Subject: [PATCH v2 24/48] accel/tcg: remove break after g_assert_not_reached()
Date: Thu, 12 Sep 2024 00:38:57 -0700
Message-Id: <20240912073921.453203-25-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
References: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: HDJOrLueA4ib

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 accel/tcg/plugin-gen.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index ec89a085b43..2ee4c22befd 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -251,7 +251,6 @@ static void inject_mem_cb(struct qemu_plugin_dyn_cb *cb,
         break;
     default:
         g_assert_not_reached();
-        break;
     }
 }
 
-- 
2.39.2
