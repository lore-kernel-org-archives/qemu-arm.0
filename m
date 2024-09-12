Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp422912nji;
        Thu, 12 Sep 2024 00:41:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVqAY4YcHlbRSXxUl9ud80Rr6CjNWSQPMMo5A/arGO/8Weg7MW1SD+BuG7VFUJHtxXvTmyqaVI2KVDwFQ==@linaro.org
X-Received: by 2002:a17:90b:3b90:b0:2d8:dd5c:f954 with SMTP id 98e67ed59e1d1-2db6720f2bamr14673841a91.16.1726126869680;
        Thu, 12 Sep 2024 00:41:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726126869; cv=none;
        d=google.com; s=arc-20160816;
        b=ZVjfkhdLskul6Rn0VYamLXIXcWqbFre6FnQaOlDxz0gB8rBUkCno7cwnKI6CWidDTW
         07eCbO6JYT0J0vunU3JM1xOs/HYXlKP4vUBGrDHCGPrQKsAROOi9F6NvuCTbZz50LalQ
         SPozowfIgIjZsEW37/uHrzct3PPoo71LuH/BZfRAPvGRVqq3M3VIokENGZS7oL+fsOmx
         ytdfTVzvWYkXIZCjG7IhUPlIqOhjNdIhZhc4E/FwXOKjGqXckSMY01L8mKi83qiVSRq/
         QUrP806Sahuy2U6yC14uRbHFF4h3QZi40gV4pxh4tRWU9fmUMYZKBsxMJa/Spq3VXdw9
         WSaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=QSalypF+pMQKKa4uNxhVuqSrJY5QTLcHY0WTppEbuVc=;
        fh=Rz3SwQuchmNfXjZmwxnE9t2k12LXiyevCdKwDDGId/Y=;
        b=zn8llFyPAqZkMX23Np0g6UK/lKKTyBilvbHVAisqSAkOmqbNH9DPIuKMoRAn4CDeyH
         kNuMIriAqK6gDBVI+E9yWmFsive+wcO40g8gDrjK95yAGCTsVW5olwFTuNZimECdHunM
         UFuyJEWfW3hRjREV9vgNymZDUNbpooPbU6nCiMxsA+vBKbskhqcyOfqClyuEKswo/GKI
         UQDOItX8G2UbXtWWePvX0mXuTosMeguJ8xpuFLOY6pjjqnF8LaDWuqaiN17qgknYOBiL
         uv0sRYIlql67GpbfHMsMdeo4zTfzTGZlA8qKfGpPIfc7VzjJiMtsvfAhlwmHH/IpoZmL
         31NA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TVgGesOh;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-2db04aa56casor5416157a91.3.2024.09.12.00.41.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Sep 2024 00:41:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TVgGesOh;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726126869; x=1726731669; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QSalypF+pMQKKa4uNxhVuqSrJY5QTLcHY0WTppEbuVc=;
        b=TVgGesOh1DnM5BJEbaOB/CtysAbX31WPD+OrumfQ3N8WMhXUjPde+PqeMtP94qyi4E
         iVAkjDlBzsxFWiOsgQ6fvXXl6VnmJ7IrbDKhrfGHzyFyPBQUDe2+BZi+foWzh/PH+KeF
         UC3pMh3kxZc0IC9zrYagqXvPyw4PWLut9cjRgAfKHu2ADPTO78RNEENckFVi2XQcrjMO
         dTu8kek9QtGIahzb3vGT6wDyj8FP3qP4vil/ACKgd+S0Uto74seQ9bfdNqJ16uW8CJ7b
         qoyW3iDC38Xr1Zx3ThOJhcxyf10ma8DlrN2/Xz9/1lhfblq4OrhcleW8trLkA3LKohU8
         mn1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726126869; x=1726731669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QSalypF+pMQKKa4uNxhVuqSrJY5QTLcHY0WTppEbuVc=;
        b=KRTit04KZQYVJtpIAVxDaa8XNYspUF3RKvvY3+ne37Gd+DyQUUufLMhVeRYJZsnXNB
         w8H2hJd5X3rzwhdmIrVF4aKP1nmOcYgvgZDAMs0T1qMfQbtAE96ScjqxOYlqyO0Mv10L
         wTIvKqvFsncGISHWYswsUDpbUCQS8+KP6apIXgJZko5gxAKl7wMIA0W3p5ZPZOmt6iHQ
         Uq3fAsVJcsPRqcqoy0lepbQXe5vxSGYCgoRHCYfbGS/v0I1mwwA8zV6NXwH6k8INHU12
         pJ4Y3BN+koOZybIBsNPhlVUavwHDMchIpqvE6pjPKUDPz4EM820Abh9aYkzXxdG5ITOY
         bA4A==
X-Forwarded-Encrypted: i=1; AJvYcCUMDcuO3knAWDRdszBG+TfjESKEFhGbqN0U/ovBQI938PfhMZ7JlsDUfiWHoWfXBJSUZYACcfeBCjTqTA==@linaro.org
X-Gm-Message-State: AOJu0YzYb4hewmuhq6uKB9wgUiWU0W0S6uoOrPAtwH+IgSyLvP0/IgWx
	ec659rCY6vQ2H2FoPO8OmmXQKKAIRUpaP3f8IHAHEHBI6IQYkCC1XXeNeIN7lAy4mg==
X-Google-Smtp-Source: AGHT+IF1YUkgbI8Z5QYhP8g1gpLzhK5aYcn1/M3ZoEOkopdJCnHdCRszwAZ6uD2z8SDokzvFEDBk7g==
X-Received: by 2002:a17:90a:8a14:b0:2d8:a943:87d1 with SMTP id 98e67ed59e1d1-2db67211d37mr14855931a91.13.1726126869060;
        Thu, 12 Sep 2024 00:41:09 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fb9ad87sm983458a12.6.2024.09.12.00.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 00:41:08 -0700 (PDT)
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
Subject: [PATCH v2 39/48] include/qemu: remove return after g_assert_not_reached()
Date: Thu, 12 Sep 2024 00:39:12 -0700
Message-Id: <20240912073921.453203-40-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
References: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: NRygsXjpzVgF

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

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
2.39.2
