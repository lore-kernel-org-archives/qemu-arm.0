Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp1161323njg;
        Wed, 18 Sep 2024 21:47:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXy9ivD2Fo8DttvgjlxXJ9s6b3yBqWMMBxsJpStjGOJAiLJJU8YqZbsVtDbVW5m7Z3/hXORx2iAdW/65A==@linaro.org
X-Received: by 2002:a05:6a20:b40a:b0:1cf:3838:1ec5 with SMTP id adf61e73a8af0-1cf75c7ea5cmr35257632637.5.1726721226748;
        Wed, 18 Sep 2024 21:47:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726721226; cv=none;
        d=google.com; s=arc-20160816;
        b=ERcLcYmLMXjQxLqyT7weOvg8TjezxtFHVRfgxDuIwMC3ad0+z9bBaqxqnQM2gliA7P
         sr/q8Fg/Eme6CdmYEkKsW3SzJczNbgCZWaam3WgX0wh7fzPVHbhbVbU5aofADkFkw91n
         FduDbcDcD/QluJ/2pyGK+TSr4KFvUqQlOV1zK7q2WvN4dSQAs4Jmi30+/pQq2YsSACkj
         Z2wICGajQ+BwaA3azx6+E9fCS80LKxqfQDOuN1htazRebTxNmL60eovBLNkQf9JKpvc1
         QngmWuFGLxXDO2ZqVK2rJhYgD9TSXOEmEkxqH0JIkTkcFeo2UDnUiil14nmuFnZyEVCl
         qkXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=J91xisxxghHlg97TfgBUUF7cBAztIX0LnTXW2HtCgj8=;
        fh=mG0Hh357vrkr+w0gp7UCyOMm/xGaECGBQwsR6bVCkJc=;
        b=mjCmoBfMDBX3/BuMaGhfeI6t69yHLhwi3T0J23819ilMSN4bjPFL70pEfOkLWt3tuM
         zi9gS3ARWpMKKkdfyrdcJkfbZoSoI98/DkQ+QklPh2/fZN613+44/I8uy89u71JFXnBQ
         74SN4Jdm5DwCzjXHE35Nal/ykk/f9WhXb4JycJIYn1p37t9SDOTvZtCEuQfPiGd4Ep5d
         Zb+/S1Pi0ldnR2q3BpgWAqhxf/jB8zaqITk7p3fttNV/UatuDpulazTwRycmQUAWJto4
         ohoAS6+QPrPpdVLoIrUacOqT7MRhOZQ2mVAFvIelYiAP5kgvUP0sbRzgugy58tATAZZ3
         INnQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Miq13Gbe;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-71944abaaaesor6637641b3a.6.2024.09.18.21.47.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 18 Sep 2024 21:47:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Miq13Gbe;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726721226; x=1727326026; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J91xisxxghHlg97TfgBUUF7cBAztIX0LnTXW2HtCgj8=;
        b=Miq13GbewrzPWpvvA3wagdahIej10SROfyuwP0Sq7Dj0cqa0waBv8N9+/kYCsjL4if
         58swJlEs5nvbjuEs79NyPV/ORHdtXcslLPdO7QX+uLWWnfJICddXEPk76ZYatFLe1l9+
         DREuIgzbHmS8UiXiGZ4R/R3Uazfyjc79Rwza+nm2bRMqJ9XZrN9XXDQFp3DPgn1HwS4J
         PqVl7CSRIUVvqRXuyj6QLPG1Svmj4zVa54/htXUjdlP3B/Sdv2cV3KbCu6V5LdQLrGh0
         T9qrubEZZ28qbQKV1PWymRLakZEO5ED5Q8DyKHCK9XRczir1Dr5C0ORUj+DJVPfG6Ubs
         5S7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726721226; x=1727326026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J91xisxxghHlg97TfgBUUF7cBAztIX0LnTXW2HtCgj8=;
        b=FqWHPWepq1dVDjwONyzRc0qbjEgbheVtaw6lAFZwH7IuBPtyjtr7SAkcEwZMUlOpu/
         bvjLFSHuHSA0OKmUO861+eoImDFKElmgX0sqib4y3bPsvyAC/Ik8fV9fWTmQogturqGa
         c/Jfvk3YuWdAs2Mb0DExZyiNuHyPK4gZox0efzx6v1kRrzYzPJXFWUAnbs0Ls2gz+Q9z
         oolACQ6tiG5hievmDQF6RodYvSD3uazq3drXckASMt8rcZ1ejMe+78mzL/WwBLLZvDSp
         c/WaD9Bs+b4tUhaJ8tbSge9QX5y7wJNqABz+oMZ/guIINtKV9x3stZA1L2j7Y5G+iHax
         7HeQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1nulsa33ykvnMLt0YK0PCzGicqokvw5tn+wVUK+HrPaGrSS77/cQHlKkEjm88OZG8um1Z7Ah/YyvNAg==@linaro.org
X-Gm-Message-State: AOJu0YzgKyYaCiqf1/iKmRMXZtI7jtAtAOvpGJk02yAq25nufUXb7E1H
	iObZc/4cVHkPJ0lgLUcluhc1GXpV3ouDjpzL1ANjFvha+8QGyXaTadYTUtp45rwfCg==
X-Google-Smtp-Source: AGHT+IGCW5jSj35sH5O5IBgPKf4Npc1WOdLbOOxXHUFlvIY40aSfwB5Uf2VB8797RC2mgCqAOWZcNQ==
X-Received: by 2002:a05:6a21:3947:b0:1cf:27bf:8e03 with SMTP id adf61e73a8af0-1cf75efd46amr36339625637.26.1726721226274;
        Wed, 18 Sep 2024 21:47:06 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944bc279csm7478601b3a.188.2024.09.18.21.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 21:47:05 -0700 (PDT)
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
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH v3 10/34] hw/nvme: replace assert(false) with g_assert_not_reached()
Date: Wed, 18 Sep 2024 21:46:17 -0700
Message-Id: <20240919044641.386068-11-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
References: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: A2xaAKZHNJlj

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/nvme/ctrl.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 9e94a240540..2589e1968ea 100644
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
2.39.5
