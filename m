Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1444843njb;
        Tue, 10 Sep 2024 15:17:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVVHVeNwntOnGEtIf7JPbpFd+G5siQQB25NxRQnfrGtRY+yfESa2CZIfQxxd0cWXFnWq5NRSPTl7BqAMg==@linaro.org
X-Received: by 2002:a05:6a00:2d28:b0:704:151d:dcce with SMTP id d2e1a72fcca58-71907eb69b2mr7005767b3a.5.1726006674736;
        Tue, 10 Sep 2024 15:17:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726006674; cv=none;
        d=google.com; s=arc-20160816;
        b=iZJwh1RkRW5MVEdIIPiM9mFKtGmId2h8ZXaWgVB89JNvk9fxhlD+xFXhG20hl0uXZT
         ftyYlpk/YeW/IxFf3WV+W371VFmsGlUJjVJa2Z1YOKWdgMpNi9RSUCbFYgx9cAWbHS0D
         E63rikYpffy+YTO9ydcYlYZU4GrSOcs1R1DHVm4CcEzf5eMFn43FhEqLM2N43EOqhllT
         JK+kQSrlSd446el4nJyJ3Doy7Fe5M/8x1iG0MSRE21sUYquMSYHft1fZJhk8y/6m5AbN
         7ruD3qc22r0D8qxOc7cPIhyZHlxN6QVfiejuOUI11cnZou99puMlg4cdWrX+8h3OBJCd
         EngQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Y03z6l8DG3u8GECV91NkbxRNu0WgfcfSpqwz7VG8iPg=;
        fh=/LPhkSuWoBHHoToCSGStFlAoSqRxWTtNqTVDg614EJM=;
        b=HgOdLgaKjAne4C3lzzffW3xSIckCBQ1Fp6cBuITBQGlzbuQwBYOzJwIqyNbZPODv45
         sJvNPXflC5zQHQz494DxW8L0qenUINE/U070pjFYGdZnn22GdiPWHxnNZl44x7uHSjfb
         /2k7jeWtOpuzJkbF63RhCXjMlCw5hsy0nociO4G1wyoF1zPHuvhRivEHLh+hyqcMM74n
         uE5czfINyeD2H8oTHNQfJHsxnQMhk+NPK8Cnwu6YX/iouMy2uOX8QYhKL+hKqbJdn9z8
         sUperGegU26evX61jl6kzRSms0tVivpNq1N4jQg4J4QAsvcAQiKxzEcXWsQ4LfJ/jfuS
         flYg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=go1kWntU;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-718e55dfc9asor3734915b3a.0.2024.09.10.15.17.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 15:17:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=go1kWntU;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726006674; x=1726611474; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y03z6l8DG3u8GECV91NkbxRNu0WgfcfSpqwz7VG8iPg=;
        b=go1kWntUIhyaTbSA3Nuv36N4nqz8CCLktNmIWqbG7EWSFimL4s297aLmNItPo/OJOV
         WtsTogVEjcC1TDVSABO+aTB5JxNsRn8tjsBraaeYOHkNz3tSoAFVYeDKHCEj1Ei/3vFJ
         bmcdL6gcvIhHtnCaOy5MI/DvJwW9cClN3UN8GTlar1xi3ZyRN/ACrKLX/i9HtjLJgJId
         EGDSJk7SxwT8XKD99Q5LWf4NaJa+C4/QFs+r887vNJbnOuf7Anc1MsmwUndOhmpMiXtS
         GF4TgiJaEg4Lv9gVkovr65wNJQiYCZmZK68q7+K89jumZbOavaHFutdRPJRQv9JIozK9
         9p4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726006674; x=1726611474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y03z6l8DG3u8GECV91NkbxRNu0WgfcfSpqwz7VG8iPg=;
        b=fTvNjyRD4vIsfef9dboD6UEXeG09GanEHIDkZ3dPNGOg7gj0Y06Iw2ysv8MOprupMN
         aJ51CbCgm+kFE0QBe4NJvaj7/mrsysOe1LAMxA06RS7/NMPKvManEVpW9BYD6Q0wlDSf
         nr6YCGGaoRlg5Li8HUIGtHkktSgZXzmGqkXTkcnqrYMX2HWPpULzM4M/ySPBmmClabsk
         sXGNMnwANRHPijm3tF96AnBNn1erW3EYadF5A7T+b6fgXwmhvRLd5yC3aYcBW3dkvqXl
         MY9v1p1mFGet136HRzV3Ko90jZAgWHSb/AawQLwVFcQzKu8Z0Rqjcs+1VG4fiQg56eSV
         OOEg==
X-Forwarded-Encrypted: i=1; AJvYcCUKHL/H1OAQcyPOXIv6LtFG0QIBJdPHShF+soydZMkoaJz1RT6IjTFP0toQf2iJPAlEvP6pN7AAA3LsAA==@linaro.org
X-Gm-Message-State: AOJu0Yw84NsvPeyTB2sAchaO4x5bH5255ne/Qr32gyc4Grd4n3T66r9z
	VREbqhLfqCSbakcshmNtfp/8qBQBErOWD7JYR0WH3xfdotOruzcGXh8bSZpqCmXHMw==
X-Google-Smtp-Source: AGHT+IEF2VwVmQZRrfJAA7uZ+UwAfLlPUUkIQKs4NFR64dug9ZAQdsOWBGZU7vtbJ2ZkWpCk8KGdug==
X-Received: by 2002:a05:6a00:6f0c:b0:70d:26cd:9741 with SMTP id d2e1a72fcca58-71907f29d40mr6083429b3a.12.1726006674179;
        Tue, 10 Sep 2024 15:17:54 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71909003d0esm1884055b3a.93.2024.09.10.15.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 15:17:52 -0700 (PDT)
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
Subject: [PATCH 31/39] hw/scsi: remove break after g_assert_not_reached()
Date: Tue, 10 Sep 2024 15:15:58 -0700
Message-Id: <20240910221606.1817478-32-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: /xySVvaP5MFY

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
2.39.2
