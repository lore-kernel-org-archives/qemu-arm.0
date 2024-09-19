Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp1161461njg;
        Wed, 18 Sep 2024 21:47:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWegSoapbiPPnKn5akrwND2z2HKZ1SuWlOO5m/3z27b3+Ga+Z16qobRHpbUOsWJ9bnZyF2sv/96bYa6oQ==@linaro.org
X-Received: by 2002:a17:902:d58c:b0:207:2093:99bb with SMTP id d9443c01a7336-20782529c52mr250848005ad.31.1726721256232;
        Wed, 18 Sep 2024 21:47:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726721256; cv=none;
        d=google.com; s=arc-20160816;
        b=Nm9wecUcePAL3V+4fkRyMiLpL15keAduwMBPVdLbzYCt2wOGJVGUA6xC0I0RhrEmP0
         XQ6SQGTrEC1XOjKm6C0U/TMCgiuE7BivIPhquZsNhKeKl9GIxD8x+ElnKiE9+boMJYGv
         NfFN/p3xBHLriJh3qOd/HBRMASoAiWKsqkQUU+a1VB3PSHf4MSqCeArKIYlQ1ci7vutJ
         DdvcKLFxG3WqvQnFKspXbRASukAIU+EPBOKqErq0cEV11QjVw3AwMICdjFJ1JcMdEIoQ
         M2NbpGtW2RNo7PPmPHEw1OVQYFWkkcHx5zfx5lUEXWB+vxeZC9Z4oZyklWjPHgqbP5qs
         1gBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=eNWqkzSNCBE+28dt8xOll3Id+6eEjKMEGJfuDzGU1co=;
        fh=pHF7orzy/H5eKXYooFb0OmkvRG+VyY6OzuDJK6XR3K0=;
        b=dB0dAAReW67QxDS7+q/e/hmYwFWBJQD6Trf090yIDIStYOCDHo3p0ambH3QIInl+/D
         5eeAk/E3k4kiOTrTAhqjiQuMpbvn5FB+w6DdZdP+OqRvfBi+ARV6SNVW4i+K8PTKFC2u
         9kx58FgRrFzu0iJD/Znt3zn+N7S+Q7ZoQtJoylH3Yh1KTYwpNtzvmXqmv1xtHxIn8O+I
         kYrwN6eqA/wFQbmOQdmE3Exo4z/7FWgObV/EoBpuM1f7JY8AUFpmqFToy6FrAgTxNBKL
         0vx8IeasH/9kqWYHN3J2lBJ4HXwSe4f8mmYB6JrdTm4D7pS0sPwoQjL/nqDEceZDWbb8
         yLjw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MvxdLSYq;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-2079463397esor15093435ad.9.2024.09.18.21.47.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 18 Sep 2024 21:47:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MvxdLSYq;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726721256; x=1727326056; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eNWqkzSNCBE+28dt8xOll3Id+6eEjKMEGJfuDzGU1co=;
        b=MvxdLSYqcl8gLp+dFyDdmk3o/iQgQe0GYC6y9Rf4FX6uS8fD0wJyetpHjPVS1MZeyp
         0pxRBkekTMeKy4NQEBIu+rvL+O7eBVpk5DDzevzaByg4RZuPl91Gqv8TWlh1wRwer3Lf
         NHqzGHVxISUf1/j/LYU5ANBDp0OeNr1XviZ5haCIwYyPrEJ27AMbmdXiurdD228qpdtW
         V4KKShB8K18NFGZ+BsEqrG4/Uhcbs/2+X/G/JEZZIny3vp87ZxsyhkP/Zs+y71ChwvoX
         LzWClY4LpDzkUJOGN3hK+/pjZdmEAjmGOL3mdEtG2OH+AjHh5jcML9ALl07ONnv/6t0r
         EXYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726721256; x=1727326056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eNWqkzSNCBE+28dt8xOll3Id+6eEjKMEGJfuDzGU1co=;
        b=B6fsCwx7Ne7hMBQQt6hn8fPtrCOMnMZbmR73IGa0EHg+3Yqso5/ZvKE3sEtVXtLHDk
         RettaA23MTmMc5/DXkFSluBiY3w6wgfLJY2DhiDkG2BCMmY109CXNsV4KPKcpd7Iyze0
         LGl2uYwk6xupHufLJSgjQ0XrExh+Ih0cxaYbJh3jOB6e8dgfHUBccfzwfOUtg60JOg7S
         bjWvLS5Gy67bNd06US89NdxQoebvE/8F4mZA1TTywtjW4sGYHFujJbrZn/D0Ok7Ct59T
         0bFEVTzs2mpJ8+ThVlvft+gRpWy50VHnJS4pe9q3gvCCHEsqtMbzDvi0rIwsnpLXDeJZ
         Uvnw==
X-Forwarded-Encrypted: i=1; AJvYcCX4vKyiAMeFVxUbuKok5OKOgGQvBzYWzJPdXecTIxcQRBaHRxMfa1vNpoUTwg58vCaA4fGeD+oGOWdrWA==@linaro.org
X-Gm-Message-State: AOJu0Ywc2V3zn7nPoDA0bFy7FrcXSX78bibBk6rWN7foXMJasO/Mjv1/
	HtjkpmGJ3cvBMxFyWFbo/lHJyfSNBan+y6a+fUqg8ceJhK+RMQYFYIhpBPgE+V+4OA==
X-Google-Smtp-Source: AGHT+IG0RTXo4zmQGQBlENczTzliTQANG1tf/+V1ayQphhYWAEQO8ZekAqNGAnEsgrQycROh/RQPBw==
X-Received: by 2002:a05:6a21:1690:b0:1cf:4348:d5c8 with SMTP id adf61e73a8af0-1d112e8bfaemr31803053637.39.1726721255788;
        Wed, 18 Sep 2024 21:47:35 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944bc279csm7478601b3a.188.2024.09.18.21.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 21:47:35 -0700 (PDT)
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
Subject: [PATCH v3 25/34] include/qemu: remove return after g_assert_not_reached()
Date: Wed, 18 Sep 2024 21:46:32 -0700
Message-Id: <20240919044641.386068-26-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
References: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: iAfgcjwe/+0u

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/qemu/pmem.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/qemu/pmem.h b/include/qemu/pmem.h
index d2d7ad085cc..e12a67ba2c0 100644
--- a/include/qemu/pmem.h
+++ b/include/qemu/pmem.h
@@ -22,7 +22,6 @@ pmem_memcpy_persist(void *pmemdest, const void *src, size_t len)
     /* If 'pmem' option is 'on', we should always have libpmem support,
        or qemu will report a error and exit, never come here. */
     g_assert_not_reached();
-    return NULL;
 }
 
 static inline void
-- 
2.39.5
