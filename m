Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1444551njb;
        Tue, 10 Sep 2024 15:16:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXXcDyqItA36/pKr+jlkRlRGvebhhQ7fO8+H6qi3LwnjZynMU9qax/TdWZoUlmiNoOnrvnoejP7EKr5XQ==@linaro.org
X-Received: by 2002:a05:6a21:6e41:b0:1c8:fe09:f8cd with SMTP id adf61e73a8af0-1cf62cdcbaamr1458155637.24.1726006614274;
        Tue, 10 Sep 2024 15:16:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726006614; cv=none;
        d=google.com; s=arc-20160816;
        b=NKP/Mr1gpbNak1uI1nVTGV3iEIn1iEpZGoowK6ZcDce0sXEo43JTs4S1iD5sS37mlD
         Pwpxjhz1vqAIg4DYzBXjFixb4bmLqOAcL+LOqL4lwC0wcPJYnO6U1x8KKHTQmjr0hmGJ
         L1vZnRAHGaAzem7GHVmJ1X+g8VFo9YOqSGRg9bkfYrWM9xRpJd7exetEvLmux8Z4oG6M
         tc0qO8Rbv35Oy4zD/ND4vFGdZvmxSLx+f+3YhtCAHx3Q8+iwobntj/HNhygfBVzb2wDS
         7u1PuvaYsnTHM4yblqKL529TG4/DMRm33OpnYTBjG6GAEdSwJUQS99Faw1z9selRRBab
         YpOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=g94oM2AdOrkhIM0zmQXs6BZslT0T+3A9bvoVuc5szJw=;
        fh=DnaQsO/cgTx3l5jzhFF26mIE43SE6V87bx0J/iTIDas=;
        b=PLu68dUsTqwu3uKypSTkTSl8AjF1aJ38MeHEdPMTUHqTSjMiNayqibYC2NhOSEvAZd
         Vs3xFzFh8cwpcn/abMdlapAMuB4q3jCXVAprS2QY6SzhHhXKR472+YB+cIZObIFHfxvJ
         ZM4bf5nd7X8Dewvel6VtXcvZpafwy/fiFdiVunumavQiu3RCeW7jVIsT3o6ut9zgj592
         47uMylUKecYuLKXlXYu7sfXe7QOBxKsxj5tUpxLkI8OL4g0pHvf/0Kw7K2O1EEe7kqdI
         x/POZ+1prfdhS6hbORHTC3QJpZre6e2Jm2ZwwUnS9B7AL84HHHjvjuolzgMnwdqSAFkx
         QniA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E4ehYAY3;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-718e58db505sor4209726b3a.4.2024.09.10.15.16.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 15:16:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E4ehYAY3;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726006614; x=1726611414; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g94oM2AdOrkhIM0zmQXs6BZslT0T+3A9bvoVuc5szJw=;
        b=E4ehYAY3ncn5B1KvenXvr4Sp2JZFFL+yF51FTNJFR1hPt6t/QnCSNdgCTBO9nsrpqh
         5lkpFIy539tBmAA+lHNXh5d16VSoqEArUkklUqIE8UOBuhZ0pWqFB+aiJutHwRJFDVJy
         GB+LbvDHkh59YPs+lxtPwNXhxUNfdfN432x5xiGQYtvHMaTdvmYG4UL4/Kg7NwcrPCSv
         uGLbA//U3ENInS3zlINN9umetT+Sn9jsJbyOrxzdepqC6mBoOYbxnFU1nA1JodQEqoBZ
         nK7LnTyuB0DSJTMmPSRA0ZVM1BiUoNRRJmzmXwNBaUSyJ/OvD4MW0z7ZOyYWIGb/w+Sw
         brWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726006614; x=1726611414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g94oM2AdOrkhIM0zmQXs6BZslT0T+3A9bvoVuc5szJw=;
        b=j7dRAX2DFt9XJcR+cjlc/hFahL8wjM2I0Q4z4AeTtl0HwoucAfeIfq+ll+3CvfoI5g
         RJ+vFIVOz+1IIaiEETmiVSFpjBfgegtqOacSmrBoy+q4iAJMZqvwIJHFSmstyV0B49k/
         aWJfbc5SVO2PxExcTa5vp9T5HUbWXLR5no2dAqSDbE6QgyvDydo84UhPnif5SNlidRhQ
         A+GRwu1woSnX9IgHaSz0R/jSrl0crgNdXTpSXAqoPT3F13SSAquwNkEuGyzGKm6hM6Qi
         riG1+Ht2S1BxfjlSigb7l05ldmydmgEGyvE1+4scDdntqIdGFK/K3OOSLxbGIQnb6GVU
         pWEw==
X-Forwarded-Encrypted: i=1; AJvYcCVlORXFqgMQt+ykoKaX/SUpZtR14SaAxNeS/wveIZ3Pc13bDO9vRNLIp6lDi4pm7KQfW/WneiSu3/3OHA==@linaro.org
X-Gm-Message-State: AOJu0YxbDJOxSDinu0UqnnSaWjmgTgjjWgWaywS1W1JNXWSILxx5EHPW
	352FJX1grtUQpaggtVsFJ3CfgD1oFZpgoiDR542Q9sFQE9Y+jDVInUoHZv+4CR2IpQ==
X-Google-Smtp-Source: AGHT+IHL2ZH6nUBIcX/D81YvSHijd2PVp9cRI7IyORN5V83dLkzGAu93AwGsK5Tkm+BoWZtfm/pR4A==
X-Received: by 2002:a05:6a00:1803:b0:714:2cea:1473 with SMTP id d2e1a72fcca58-7191723a295mr1055728b3a.23.1726006613650;
        Tue, 10 Sep 2024 15:16:53 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71909003d0esm1884055b3a.93.2024.09.10.15.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 15:16:53 -0700 (PDT)
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
Subject: [PATCH 18/39] hw/nvme: replace assert(false) with g_assert_not_reached()
Date: Tue, 10 Sep 2024 15:15:45 -0700
Message-Id: <20240910221606.1817478-19-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: FyxgvzDRc2UP

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/nvme/ctrl.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 9f277b81d83..fc3b27c031e 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1816,7 +1816,7 @@ static uint16_t nvme_check_zone_state_for_write(NvmeZone *zone)
         trace_pci_nvme_err_zone_is_read_only(zslba);
         return NVME_ZONE_READ_ONLY;
     default:
-        assert(false);
+        g_assert_not_reached();
     }
 
     return NVME_INTERNAL_DEV_ERROR;
@@ -1870,7 +1870,7 @@ static uint16_t nvme_check_zone_state_for_read(NvmeZone *zone)
         trace_pci_nvme_err_zone_is_offline(zone->d.zslba);
         return NVME_ZONE_OFFLINE;
     default:
-        assert(false);
+        g_assert_not_reached();
     }
 
     return NVME_INTERNAL_DEV_ERROR;
@@ -4654,7 +4654,7 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
     case NVME_CMD_IO_MGMT_SEND:
         return nvme_io_mgmt_send(n, req);
     default:
-        assert(false);
+        g_assert_not_reached();
     }
 
     return NVME_INVALID_OPCODE | NVME_DNR;
@@ -7205,7 +7205,7 @@ static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
     case NVME_ADM_CMD_DIRECTIVE_RECV:
         return nvme_directive_receive(n, req);
     default:
-        assert(false);
+        g_assert_not_reached();
     }
 
     return NVME_INVALID_OPCODE | NVME_DNR;
-- 
2.39.2
