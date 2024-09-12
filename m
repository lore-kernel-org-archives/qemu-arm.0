Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp422825nji;
        Thu, 12 Sep 2024 00:40:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXwq7XBYf0UaDH3c1OuwyclFtPqW2V7Rf0rRkwoE6YmZUyZPu5gs4gzCY7HXx2MOJOIoCQNnHua0kgTAQ==@linaro.org
X-Received: by 2002:a05:6a00:1a86:b0:717:839c:6838 with SMTP id d2e1a72fcca58-71926095e9bmr2096778b3a.14.1726126851066;
        Thu, 12 Sep 2024 00:40:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726126851; cv=none;
        d=google.com; s=arc-20160816;
        b=axJeGBqKzokLgqlBqznQ0/py6Y0Lemt1f2nHXdAxGX7EWTXxLxWyPpgbq93O8W86iW
         U98bD1qQFWHH50bK6XietokLO+EYgXt5PKjU//7s7V6Iq4+wdw+iOMzUuJzbtDYWqodN
         rxzI8bpJpt14lnLMlqsWUSsHyG8QyLwDG9f6YlLmte3KkzWIeUR0O5bO+AsywPtYNwVJ
         FE0t4474wsxsAv7x6hwRz0t9ptdvA2zgbWj3Np74KBOegUBc7lYAQOUrQm7n3f6b8uTg
         SRkGk6wP3BjlULT5HnVltgdcKvXonlViv9Y7Rsy4w7Hfwz/algHHdJ51hwXX479YEjlk
         vqYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Rh7of/t1MbINnko2jvt6jPS7AWm2aGYUlEka7psebCY=;
        fh=iYo9zlH0/RVkbASOT7H8Bzzx3ou7eHV59nFsH4UZw0M=;
        b=HNeqvJrBPuNe+b7qb3Dz9aidkv1rTvOAbdnOI1S8ZtvswUD38NSK08pPtM3H/x9T3X
         l6be51jSr2zi18+m12KRN3TELdJQLFuUGVjzBaBgm2Wfw82ONZFv/TQEk/lsC+KfSLrl
         RpcPdHzV2/O0W5DqdKhp3K/LSqD7JeWa9cG9/tt0x/PKpEX1BGvVIDitaJTejKyaCzQm
         kOb8eRZnyx0D+CYBzgZPFmsBtG7TlGsQjP3sJlE9/JodY2Fcjoy+yEc9MXWycVBbq2Vz
         lffVAaV7BuYocYCkHJLDZe9HbTzpX1YkupAuyWNo6JXQMFkacsiYhJaxpwXV1AyS8OYl
         lf/A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QoIScB7C;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-718e58d1f38sor6734786b3a.4.2024.09.12.00.40.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Sep 2024 00:40:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QoIScB7C;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726126850; x=1726731650; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rh7of/t1MbINnko2jvt6jPS7AWm2aGYUlEka7psebCY=;
        b=QoIScB7C4LNhEfVgnZS/gqOnTbxm6Fc/SSFgNAKtgyjensgvNAbcC62V6USDG2er1o
         oPomFS5ftuOYfYYuZtCUgMW5oeQxoCIWQORhuSDVoRMO5bNg5QJboLX339PUrhzxmYZO
         Ia8hRL6jqv7WTHf0xTFHkG91tJuk92goQHdu1avVF6wXCOICiJsExcjED4jw1z68h+1B
         FNNGBGGXlVVoubxZt9iOgBVQZMFaJ4Bu05KVNXDW7sRfHbu1x2gQxWue7GIOLE9Az4pQ
         zXqL2PXZY3x5inO06zrwPDHfpPLjPwZi2AvvSOXrX/py6ZZvwuTCsY4zfsmLDztv0Lv5
         M9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726126850; x=1726731650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rh7of/t1MbINnko2jvt6jPS7AWm2aGYUlEka7psebCY=;
        b=VmySacE6ffmYujF6kdSmC2acHmtfz5HAD1r60hMHpSHkhKTEDWAQtnh92SsW+EGD1h
         yXvZQVtM+oznAh+Ww+q2TTdKCIqdsg0VX13zLum/wwSU2Qlf9tle/laUBoSrOFrGfRii
         1jSrnx2uEAivSyBjxyxZzq7LcLqk3LLHDUmYV9E2hLzpOsmJh8zJv4jYf3OgOq4pcM7B
         cTOjfs/cvwoH8vnGKuLj+HsHGjmbV60typoYXtU18BZysH+toIo1B5FMDpbNJvJFjzZW
         wVunSUFGhJ8wbPxt0M3LE//Z4dYvf47081OFPjfUot5ww3lL/Pywc/WeHV/bvyqK5z7K
         pPRA==
X-Forwarded-Encrypted: i=1; AJvYcCUuvEbhpyZ/tBjufkhXqCxCjhHkRvI1k6MDfiU0yyvYqaTGzV0E40Gn6FCfnnDUPn1E9i8vdmegiSGx3Q==@linaro.org
X-Gm-Message-State: AOJu0Yy8gcq2SNYpgX3lsYByhaynFMZtbzv7HT7Qr20lZZiPEmWSqmM8
	biYuY1bXte75SnC1evoFTXgCBkOFbVQCXtpnL1q3YS5+6tnRFPdMRpOg0gV1RAhj2A==
X-Google-Smtp-Source: AGHT+IE/Mzhsmhy28ucIa8utEKYRtipx+MoivQXHJ4uIjGCaMxhEkc7uFeHW+uTK+aUE2aAYgUkm3Q==
X-Received: by 2002:a05:6a20:2d0a:b0:1cf:2513:8a01 with SMTP id adf61e73a8af0-1cf75f0f0cfmr2364705637.26.1726126850599;
        Thu, 12 Sep 2024 00:40:50 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fb9ad87sm983458a12.6.2024.09.12.00.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 00:40:50 -0700 (PDT)
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
Subject: [PATCH v2 32/48] hw/tpm: remove break after g_assert_not_reached()
Date: Thu, 12 Sep 2024 00:39:05 -0700
Message-Id: <20240912073921.453203-33-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
References: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: XadeNUXfLuxe

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/tpm/tpm_spapr.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/tpm/tpm_spapr.c b/hw/tpm/tpm_spapr.c
index e084e987e6e..5f7a0dfc617 100644
--- a/hw/tpm/tpm_spapr.c
+++ b/hw/tpm/tpm_spapr.c
@@ -206,7 +206,6 @@ static int tpm_spapr_do_crq(struct SpaprVioDevice *dev, uint8_t *crq_data)
                 break;
             default:
                 g_assert_not_reached();
-                break;
             }
             trace_tpm_spapr_do_crq_get_version(be32_to_cpu(local_crq.data));
             spapr_tpm_send_crq(dev, &local_crq);
-- 
2.39.2
