Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp422646nji;
        Thu, 12 Sep 2024 00:40:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVOFKbqwPKDksLibNR1VEWFX5EHz0clvm8C7uFyZfJB0VtoaMXImtnPiRvX+6aWZblHSq+B4NDXvoxawQ==@linaro.org
X-Received: by 2002:a05:6a00:2316:b0:714:1fc3:79fb with SMTP id d2e1a72fcca58-71925f9b26fmr3188620b3a.0.1726126815218;
        Thu, 12 Sep 2024 00:40:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726126815; cv=none;
        d=google.com; s=arc-20160816;
        b=v1ROhY3+JGoMRU2gFP5uGQV1lXU2GbtWIYLlNNMR0lyR6eHZ7KSG3O/7de6TAooKSe
         Z/d2vfq+G+JWfqQ2eAwbqZfqCYE6PvZeLWAJi9XZRitvNn2sa+RT3SJf+jVLizcpfq/4
         q0xBmuCheD2EhSzs3d9SxkYE6DWtgOwC3oCPs5gQoHxXoVWI6fkrFiuOwScr0R27OkJg
         BMagXOuByleeioEAaQ5qBOkT+WyG/leuWbp0cgsbZ0EA7O/nC6rd5iuEHUubEOorfnFT
         G7pDhX51Et9XyLk6gvjontOe6fzcfuNy7y+9l4+jUkUNFNxLBlGU/AKRlfOap2AI/J+u
         JKcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=TcrlVQ2BBzTTTXSH1b4iRRRxuNhgYzpbZvccV8dHuB8=;
        fh=ikcN7WUjyD3OTrCNs5tQvg8wLDXTsXU+WJ78IAPFYCw=;
        b=ilvijYzcCo7ChTSWyeMBaGlm8QOovDIZYofpW7IZiPySFqjya3E9KiZYPR730/WGw5
         xv/3gDuJkvXnwCr7JfjnB6VB2sWfu8snYtke+BwCFCzuq+ARoNMwojLOGFacTDg2E6f+
         931N0ErWOD1CzB1RICn0bgGkYhCcsbjVnNoIA8UQdEZY0bynkW6f6I0YIELH4W0V4fSB
         695l4/7m1o8tlx+a2I7wHv3x57c2Fo5uU/9potIzsKCSTl6mmZIialsazPgeANciu/o+
         9BrajlvdkP2lK8eHAmTMK/9tWLiLMs0nRaCQqfIccPNbwi6GKLkRkC/eygXAGn7Tqg1P
         no8A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D+WQpi8f;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-718e5975634sor5791045b3a.9.2024.09.12.00.40.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Sep 2024 00:40:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D+WQpi8f;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726126815; x=1726731615; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TcrlVQ2BBzTTTXSH1b4iRRRxuNhgYzpbZvccV8dHuB8=;
        b=D+WQpi8feZ0x4tfv71bxycqZgaEn0bIrrSA0fAvNtORxzeNLJ1152bfbZsP+Wns9o+
         3bDB/bvs7gERmGv1bfOWxyl10CH788hOexkc+5SnEc8fKHbiSz/UpJZcHRtzKu2jrcrc
         anBjsRGivZyNfbWO3oHCX6yKcHqbfji2G6ytifAtJpBkOBD3Zs3cZafRGCOH5ZCTd5YW
         dCiz0W8N9LRzBnoYB6P98eZ4SOY0epiQi2wwis6jyXZHwSHaZnw7zrYGRbTs9ZxOD0MH
         QH3u70mV+1qvRmWYVo3RTa/KiE6F5ULV2HaJzm0x9AnJOQyciAkZc5PVKWv0H9Eef8Eu
         qEOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726126815; x=1726731615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TcrlVQ2BBzTTTXSH1b4iRRRxuNhgYzpbZvccV8dHuB8=;
        b=oo9ViMZDCkJoSl2/3tjZ75ga+SU/9xDs/bG4LWeh9SodNS0F9/xNzOT72rnN3iUYKK
         BzvUxUxSHC9fYxFIcs0Odd7T98dNiBojhwqTPQzNnurIVir2dOIpW2SsEYiZzwtM5BDk
         4wrU3WQSZK/pS5YR6ihKHoC8KQFeZ70hzLnk91xYJNL3OQFK1WGePi2nnacBHo5Vq0sc
         QPO/w+Wk02bQ75iqNGiMrDI8UfmUCQSP8G7qCSjtrGuhfezmRGcCKcFIC2QJSAe0A9bU
         /xhpbDXlUQEbozZZ3782E9Qa7yDSarmJkjyeej+p49fCSc579jnoJyIcXksqBWbH/SQe
         qxbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhueRTcV+HQmA3aJ/O9cH5M7guwgRougRs3UKX0qBVQCZXw6SvGw32gUUMMUdzq2thKHcrObIoev5M9Q==@linaro.org
X-Gm-Message-State: AOJu0YwG0vPkFcbSYQ74ZNKY1SUF3FEl+nxRzhgmnsCnyYGCiZIy5s90
	NjpQSzrJepcF6mfcP9ATL+o0YptTpFd8vaSAEQjnggfdmFGP0XWrxgug4H1OuQ4j4Q==
X-Google-Smtp-Source: AGHT+IFAZ1Pk4eCCVsZPvVoIoG/IsRq4YVcZJLHNGvieq8Ne31Y/ZKtRMM5/ZNOtWgduAu3UbqRH6w==
X-Received: by 2002:a05:6a00:4f90:b0:714:1849:2503 with SMTP id d2e1a72fcca58-71926055cfamr3299082b3a.6.1726126814532;
        Thu, 12 Sep 2024 00:40:14 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fb9ad87sm983458a12.6.2024.09.12.00.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 00:40:14 -0700 (PDT)
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
Subject: [PATCH v2 18/48] hw/nvme: replace assert(false) with g_assert_not_reached()
Date: Thu, 12 Sep 2024 00:38:51 -0700
Message-Id: <20240912073921.453203-19-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
References: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 9/4ByEea6Aso

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
