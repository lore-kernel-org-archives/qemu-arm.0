Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1444850njb;
        Tue, 10 Sep 2024 15:17:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWZuVKe3HNkKIWLtYPi1c5I468IrmCdTaf4naO+tzz/+wWTXcgaA9r3xLs7MEux46HcqZ7XhUQapylihQ==@linaro.org
X-Received: by 2002:a05:6a21:4a4b:b0:1cf:339e:a8d1 with SMTP id adf61e73a8af0-1cf5e0304admr3450146637.10.1726006677084;
        Tue, 10 Sep 2024 15:17:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726006677; cv=none;
        d=google.com; s=arc-20160816;
        b=vyq1upmBJJNugLLZzsSw4nP/a6z81Q3ng+CRf9ARAuXcjrL8iUxtvzKCP88848CUnn
         +eOISK0fz+iQbns4sKKBee09IesMRGxxjb4hwIgfwgNaUuSQgt2HT7PVR8W/A77GyoFQ
         T1Lf6xaplmf5v9tddGBm6SXhdpe35UO1yKn262D08BZ+il2dh/PqyRDBxXJtFxPcLvec
         KSXKGC/UYCbTCYvwvUowBrw1H+GKkaJUiUK7ibTV/bbLaU1/BMX8MuvHvPzdgqijmB4G
         VsUkr09KnBv/1vWipHO6u5npXn30YqzrAghmu6mpmGbt8lrPPZH/G0Z6DMZ20Pf9GILG
         0g5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=qnKY2nRodBoXlCJxTEKFwGzTN7ry8AAwSqqRpoqXdQI=;
        fh=iQeV9AW65hug/iaxpX5QBJe1yxDyYCRRPUUl6bsozUM=;
        b=0ECp7FvEtjC5grG8ir+LKB1DG+Ysww4kGeYyMqBdDgbH9gsOrDYdsjaXyqNohjorXT
         3e2bXo/Lnqo2k7sIGd9Fz3+W5iBD37qVeP6z8eNR9ZtGrwXHb/O16hoELjHKhfbPuaBW
         IesuVlJil7S9exee3apktPjPi3HoG0jzXGuUvgRwsp6aH8kXV0zE/X4+0zXVSq+4+SCq
         N2OE76grf4NSuOP4hRBOZT2nIOBWSmWIvWzEAX5rItOZAYWHKJJUkUBOgpLH1OiJM6LR
         I8lZvPqJW0yWjYxluHDEWnOyGixVqNnjtxY2zIBkDlxsRiUvlg6hcyrbI7w0LfZ0VHb5
         BUeQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J2566jGx;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-718e589bb4bsor4401645b3a.3.2024.09.10.15.17.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 15:17:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J2566jGx;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726006676; x=1726611476; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qnKY2nRodBoXlCJxTEKFwGzTN7ry8AAwSqqRpoqXdQI=;
        b=J2566jGx2T8jEzTBvxXY6PhmWmyjLlaoG1uuLLMYgVqrY9qAuoDMpZfZvD35DImp+S
         gHq/uVicU7tB8nd9oLsXksR2vPhxviDx2uBebX6CAgsdekXtS2dYu/MxK6aLuOuohyNZ
         wLpMWcVMC15KGLHUHPFyxh3kiUPQCj1PQKWHq+hOc98vOeQJf7qSzqzvqoQCxMKq3dA7
         zGD7/ciUYFAexjBDs08EbIV+jMvKkpPGwnAWT0IcGN+ij6Rjo39oDtqHpIlm2WCii/hB
         YSH9Hru0HlOnMARyrFGkEZAOgYORuC+6UxXYtxcT0G7i9LefrUwCztDn1uxsREfwP85k
         iH8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726006676; x=1726611476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qnKY2nRodBoXlCJxTEKFwGzTN7ry8AAwSqqRpoqXdQI=;
        b=GTZpODfNLrjkdLP3HY6Eq6pz3gKrzmLRn+fYK9ZSGvv2u9k62D05VnVZaCvQV279ok
         lBviRX6oL2YBaGw5QybjgCEnPVUUWa74dhSwKShrhn5ZU4HsnO1s6kIh2Qs2CwF4x6Mn
         DJuau/oTz7Wq0gmwcJGw77jFkQavL0gR+kMkja33xoFp11KbAlHp3vYXq6Zpx7iNsf8P
         yfy/EIEj4qzC6RmIiWzmjb4xA3nWtU9EMTQn5ckKEj0QpeTFMFN6IUW+J6cprjkDqjTs
         YV5OozbNUUvzy822KV3t2TU7Rwe6a888oQAtj52oagOgQ1cM/OwI7TBLRMfzTmyma+Nt
         Aq4A==
X-Forwarded-Encrypted: i=1; AJvYcCXjIpt9oGVnDnJAB2b00dEnIFAZrLC9JDzk8oMNETSYB8+xnKHQjUoyAJRhSMgsuBNY9B8NzYmc1SABTQ==@linaro.org
X-Gm-Message-State: AOJu0YwqeZt0wE72xhnGsMRXONVVn9N5H17bHNSBOMblFs+NtMlOZiOX
	dOSpVf0h1CQKqLlie7ZEHs8hmdL5rtSVEAxbXP2k/Hd8WxgA/HtsCuERR4K6i9fA7w==
X-Google-Smtp-Source: AGHT+IG4cFG5WUgQCn+PBNKJBzHgRuN4SjwOR6zpKqMGbFV0/QZbeUwbVdFfJerNt+rSe5+kt4gssw==
X-Received: by 2002:a05:6a00:b8f:b0:70c:f1fa:d7bf with SMTP id d2e1a72fcca58-718d5ded8e1mr25670829b3a.4.1726006676561;
        Tue, 10 Sep 2024 15:17:56 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71909003d0esm1884055b3a.93.2024.09.10.15.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 15:17:56 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Zhao Liu <zhao1.liu@intel.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Joel Stanley <joel@jms.id.au>,
	Kevin Wolf <kwolf@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Corey Minyard <minyard@acm.org>,
	Eric Farman <farman@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Keith Busch <kbusch@kernel.org>,
	WANG Xuerui <git@xen0n.name>,
	Hyman Huang <yong.huang@smartx.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	qemu-riscv@nongnu.org,
	Ani Sinha <anisinha@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Jesper Devantier <foss@defmacro.it>,
	Laurent Vivier <laurent@vivier.eu>,
	Peter Maydell <peter.maydell@linaro.org>,
	Igor Mammedov <imammedo@redhat.com>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Fam Zheng <fam@euphon.net>,
	qemu-s390x@nongnu.org,
	Hanna Reitz <hreitz@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Laurent Vivier <lvivier@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	qemu-block@nongnu.org,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	qemu-ppc@nongnu.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	Helge Deller <deller@gmx.de>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Peter Xu <peterx@redhat.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Klaus Jensen <its@irrelevant.dk>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Jason Wang <jasowang@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 32/39] hw/tpm: remove break after g_assert_not_reached()
Date: Tue, 10 Sep 2024 15:15:59 -0700
Message-Id: <20240910221606.1817478-33-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: gpiY4pfdtnKu

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
