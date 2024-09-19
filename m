Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp1161404njg;
        Wed, 18 Sep 2024 21:47:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWd55JqAwXpM/Ht8WiFcKAfMGhHF0JH/Ydq07wDc2SDxWULftki71HgIZucULoNFemU4YK6Zb8AdvSI/w==@linaro.org
X-Received: by 2002:a05:6a20:b112:b0:1cf:3ced:bba3 with SMTP id adf61e73a8af0-1d112e8bf54mr22448399637.36.1726721244491;
        Wed, 18 Sep 2024 21:47:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726721244; cv=none;
        d=google.com; s=arc-20160816;
        b=JsRwy2M53A99oKaVWJ+5gU7NW+i3uZUY9FVnOlX/dHKx0NBS48LQwYC7XPFaagHTld
         DUZGVJcYBhqBMKCSOjDmXmoFVOJm3C0Mxa7WMc9QBy31KJbtAlNTxLw0/GIE5I7qHarj
         oxoTsdjfDYfbwKknpj4/JRClcyPn59e/hA9+J9AXniVpP2eC21vn1A2o3CbjxpaYhZxJ
         baV5/OhwXgqoHLZxu4Y5okYNqdr+hS4GjmrDT8T80FL0UBMpF4wZheggq3kAAf8q9Tvj
         jfEcWfOQwS8pHHom4Li6GxV+LAO50lZMhKsAKaxg93g90hhR2aYhEOJ7+VXYurhdRgts
         4kng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=XHltE5X3jHFpn43VYV0IEXfKWmPwceAvVFkYvY3AXAY=;
        fh=8/7vfFQbsrvKkCifgpM4Qo1GwEOva3M8R+XpGUB20/s=;
        b=nx0VgCzaelYxgBSxCCwvdvZetZdTXiTRd36Z36rOWd0GNR7wz/IaunWlrH9HP/pZzg
         aSrg4/DqhzIHyh3wKm4/GnWT2/FIc+uNnUUnfPn+NUBMtslqIZWeAUK9TenGoN50JVSJ
         63WWMc02MR//XJCEUDwRX7LWhWdio76ycz5YKVCVmwe/2x+0iycyWV0++hIT5I5qz/09
         FogxsF6/DLq7fygf4NwQqUnF1LO61q0GB3ULfsKJG6usCugmDCOIpSzxvtGGqo/pY88C
         HKCqTlO5R2upRufvrCe8kgLhXCdC40qXqcSLXzxLeTvtsEDxO/UWgOgwc0qSMkD9jhAr
         mUGw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GBdcB8sN;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-7db775fb478sor1442789a12.0.2024.09.18.21.47.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 18 Sep 2024 21:47:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GBdcB8sN;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726721244; x=1727326044; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XHltE5X3jHFpn43VYV0IEXfKWmPwceAvVFkYvY3AXAY=;
        b=GBdcB8sNkMmtd1MvhLWYvR2Vk/9VfiMj1dn3EstLyVCUgL1WyULSlr08WqXgWYceuH
         IMwiuogG6nbaHp51vRoJ9nUVx8s9XSbU15+S2Jr4WRhLscWdUAK40vLPrsDLNGRKZsJc
         dmlhWJ0CQe0leOZstYGhlSqd6AosIInSxvBuKKrr84GH/eaxrNKy4Sp1HdeKh+IbI0BX
         c0U1PvSxsC4A93udivFivP5jnXPz4bVlo2NfjUsS4LeeSBJBHxkXZvznatxAovieia4S
         mfwOg/FuHo1CSGzHPebtGZZcKlKj5skrH5+zrtgTOznE4QNscMBAxaiGjQIFY1GgpSS8
         sXKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726721244; x=1727326044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XHltE5X3jHFpn43VYV0IEXfKWmPwceAvVFkYvY3AXAY=;
        b=EDwPnYcIiXx2yhn8CO8DYV6KZVEa2PlM5Jgs5QjJmGDBHIAbxgZbDG6KyqOccrYBop
         SBBeqCuo0P6op1ReXu8uOXFgAq4oaQegJ0l0UxPKZzSnC7z9KlVUwzMK6B6sduRoD6w4
         u9xX0IX1XoXMdaBON8BSnyT3rwLD7q9DcL2L+MCwduFnmS5xPn0uANey5jm6GRvW5hvQ
         zFB5Mp3wHO5bydbEIQ0fDygItboznnaAcECzdMxJ+0OAAncP0gk18S/YxPG+eASAZQz/
         I+7wb6krU3jOo25AYGVfch/Dn1cgg/mZJgGqVLanfP0vjI9UmEoafHgpFSKfKTDo5knz
         zJMA==
X-Forwarded-Encrypted: i=1; AJvYcCVoS9F4XqTGEcvp5UkW8EeFulHZ4fJpcTIU9Wcmm0ui6d2cC7StYa4XVSwMfGWzoTMNa8trXAwJlEpY3w==@linaro.org
X-Gm-Message-State: AOJu0YznbEjl9EU49ePA008vdkLKKFE2J1GPRiPHiAkcl+/sNFlepAHS
	3UAO90hMv9d/lt+Rvwg66SIGQJ7w9qEFV0lwPXpNZgGHN8BR00jvhZ3+Bt7fIECwog==
X-Google-Smtp-Source: AGHT+IEr6T2O+sP6OWidgpOc/m8gapGLSSLw0H5w0hv1V3XRgPMEmphvXT69kJGdrAWtPBAoW9bd/w==
X-Received: by 2002:a05:6a20:1918:b0:1cf:37bd:b548 with SMTP id adf61e73a8af0-1d112e8bf2cmr21148987637.37.1726721244023;
        Wed, 18 Sep 2024 21:47:24 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944bc279csm7478601b3a.188.2024.09.18.21.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 21:47:23 -0700 (PDT)
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
Subject: [PATCH v3 19/34] hw/scsi: remove break after g_assert_not_reached()
Date: Wed, 18 Sep 2024 21:46:26 -0700
Message-Id: <20240919044641.386068-20-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
References: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: dGV1rr92usjN

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/scsi/virtio-scsi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index 9f02ceea099..6637cfeaf51 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -357,7 +357,6 @@ static void virtio_scsi_do_one_tmf_bh(VirtIOSCSIReq *req)
 
     default:
         g_assert_not_reached();
-        break;
     }
 
 out:
-- 
2.39.5
