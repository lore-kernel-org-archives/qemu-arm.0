Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1444791njb;
        Tue, 10 Sep 2024 15:17:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUhGYOOj4z+j9KBnefg0ktapTDYRmkPQC1JpRkYq+Jx+zS8Go7/ngjc00/RxE8WufJc4zaJe/n20QCO1g==@linaro.org
X-Received: by 2002:a05:6a00:139d:b0:710:50c8:ddcb with SMTP id d2e1a72fcca58-718d5dede6fmr23446590b3a.5.1726006665839;
        Tue, 10 Sep 2024 15:17:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726006665; cv=none;
        d=google.com; s=arc-20160816;
        b=I/VENlW72fU6YXAxD9HYlovPIDhlrk6kSvH4LgOlwyc6uSiOPv6t0x8DKSe8RrpRcM
         VMeW1rwRw01fP5c03tO0ehuhDiCCZspIGLkkhKre/zqd0XA4UqEK23GdxxESO08Y5lxc
         7uz7E4OK99w7MJ+7q0WuyXBYaYIIdoc6bpmcemyKn7VxjUPuXdh87r0lTwWeUVUQGRcp
         xlcMDSp91It4LTg8hwEp0woVdcJtIzkDFhJTNXOKhns5P18iXnoaj8gcqOwDBm1KhEGN
         bbCGY7kpabv+PaydDsDgFmOenoLBXpSqoE8d8wCFfDluVaVvVeoeHDelONgl0ua1hTbq
         IP3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=qUh9IHgCF2MhxdXEfEudgW9+CnpXzCptLVYaeGylPlo=;
        fh=pUK9Rzz61Dl8e5Pgc1V1L+SwrnrdfGnk7JcB05udHSs=;
        b=Fah4lOcWGSAHJxm+u25QXgxvyMc3jqEbRCDCo4ax7NZwHNl+3tg3lUelSN4ep8MQlF
         ymSmri1oHh1tTzAJueRo6118fJra+xhyp/NGVMa3FrJaa5APQ5kkLdzMBNfQiIcGER2b
         FaaNL9DRFZEnW68QCLcT/4QXCH48LcbsNziZVNxQY1LzQsGCqzjc9/czfm+j6QSg/vLE
         GF6qYvTQI5cCJuLp4pqkHnEC6SdZE2/lreXzS4yvwkL9pDYCGX8eDrLsrEih8iba+3bw
         M1SHLxVhuaimNTZ6CXiJaZNJyRJGkl7SUd8Oabpiul9sbQlMUc3VC9bs88e7CFl0TQDq
         tzsQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n8aWqbdt;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-718e596ef64sor4058788b3a.9.2024.09.10.15.17.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 15:17:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n8aWqbdt;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726006665; x=1726611465; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qUh9IHgCF2MhxdXEfEudgW9+CnpXzCptLVYaeGylPlo=;
        b=n8aWqbdtWeyJlBIATLKR6iHCFEF6wE/V3say3hKBY1RfIHRzm9MBL8SC/EFyo7HRdP
         rsbrS1GpekdE360Y5yFDTFxxf4KWG4kup0bsRZFPLZ39CcemletVCKQ668KtXu1cYbHV
         Ro1QmqUaNpeRwKPdmcEhYqHxqJ3YzaEOiaj/3y+dZae6RWJq+/MSUBxYiGdsoHiD4bnC
         U9Ujvvj5iLIrXhiJ7AN9lUxuD74I6Fcnusn2gR8T5710WU+ix7kfCa+VLfCHOpe2SypN
         TMjixtOoU7wCUOh2f2hdBPv9wnvHJZDqzOFOt5DclxDNNOTa70VFoi2wLXFwu3mbmVFT
         V05Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726006665; x=1726611465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qUh9IHgCF2MhxdXEfEudgW9+CnpXzCptLVYaeGylPlo=;
        b=YN88rrjcCfoz48UAxaM3E1hg5S19Q+GKNfny0fyyuGMANi2N0gp5AUVlIIqmC467kr
         XNO5P22j7+Rriem276AgUqrzwP9PYMAJLH0iTe1/TXdA9s4+hxtZhm/CAZxQpIDGl366
         4Ceinw7a0Ben6FzrPSk2F1j5wco9LSOUgiXTHS4D9iGguYOaNfZ9ynsssSOJvThBLuO+
         EFkv9YZmNfPDZtB0dZ0opATx5niic+v55IA6jwkqI859skCFhvf60k2Nm6W93I9vHagL
         NYKOxyiOQShobxkP76SE9Ygl/7I/gB8FHB9nJ87DhHaG5GxPbbnWnrsxZTWoZM2ETznZ
         Ux8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXuCOFnrJTDNbqg6Ljvp/TmgB8Wu8+2Z99C9A4DjCvLdaiUANn6eT5jDqTzvhifen5UdUXdpm3AcE8rBg==@linaro.org
X-Gm-Message-State: AOJu0YypfXUiUwfp4te87u42jYk3oGZ2+wgmXtJ+4Ax5c9EBEwriFGV8
	UUp6Um27n4w8Lto0bUAjc15Mz1Ao9juf2+gZMcsyj9TGT5BH4iotEuh5TJBu39CWBg==
X-Google-Smtp-Source: AGHT+IHslc3BcEPx9Pl9BNLcC3dBYXVlOSUQA7s5AOxlWq5X7KhrvJDzlRgFX2++lb84PnsqfiJvyA==
X-Received: by 2002:a05:6a00:17a9:b0:70d:2e7e:1853 with SMTP id d2e1a72fcca58-718d5ef956cmr27062604b3a.19.1726006665231;
        Tue, 10 Sep 2024 15:17:45 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71909003d0esm1884055b3a.93.2024.09.10.15.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 15:17:44 -0700 (PDT)
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
Subject: [PATCH 28/39] hw/misc: remove break after g_assert_not_reached()
Date: Tue, 10 Sep 2024 15:15:55 -0700
Message-Id: <20240910221606.1817478-29-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: zLJZNfLV8qsj

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/misc/imx6_ccm.c | 1 -
 hw/misc/mac_via.c  | 2 --
 2 files changed, 3 deletions(-)

diff --git a/hw/misc/imx6_ccm.c b/hw/misc/imx6_ccm.c
index b1def7f05b9..fd5d7ce4828 100644
--- a/hw/misc/imx6_ccm.c
+++ b/hw/misc/imx6_ccm.c
@@ -301,7 +301,6 @@ static uint64_t imx6_analog_get_periph_clk(IMX6CCMState *dev)
     default:
         /* We should never get there */
         g_assert_not_reached();
-        break;
     }
 
     trace_imx6_analog_get_periph_clk(freq);
diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
index 652395b84fc..af2b2b1af3d 100644
--- a/hw/misc/mac_via.c
+++ b/hw/misc/mac_via.c
@@ -495,7 +495,6 @@ static void via1_rtc_update(MOS6522Q800VIA1State *v1s)
                 break;
             default:
                 g_assert_not_reached();
-                break;
             }
             return;
         }
@@ -556,7 +555,6 @@ static void via1_rtc_update(MOS6522Q800VIA1State *v1s)
             break;
         default:
             g_assert_not_reached();
-            break;
         }
         return;
     }
-- 
2.39.2
