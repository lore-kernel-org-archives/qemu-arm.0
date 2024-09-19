Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp1161560njg;
        Wed, 18 Sep 2024 21:47:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUEI0De353nL4ferTPsnAYNhUBWQ57Ia4loPsGcZVfejAfBaFDwjLmFt4eW2b2GuJH0tvr9mqY0+KkcoA==@linaro.org
X-Received: by 2002:a05:6a20:b40a:b0:1c0:ef24:4125 with SMTP id adf61e73a8af0-1cf75f006f3mr32505177637.26.1726721274320;
        Wed, 18 Sep 2024 21:47:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726721274; cv=none;
        d=google.com; s=arc-20160816;
        b=Y1+Ow9V4hLazTpS7Dlio2rFgJCn6GSz9na6V/pf2QX4wrnN0tc/NzLTkJfwjoUEN4Y
         dcuXumNUryjMbuhrKftjotjTH+zlRE1ljH+IqLtL5/Ib7UM989oTPVrxuv06VjDK8cpr
         ybYOcP8i4sWABt+iUWysIczUxBk+4fz8pPUJlprwlPhMfDdgNSls8wvJ0Talii23ftOz
         oeSsVVz9AeeACrFjaBrnlxKNwxjYGCA/d8nQWB8H0TlxHOx+UtfqiWJpzHYb2pq6wbzF
         4h0hoco2PKzhrLbc27Yvv7XRRIRGV46ajKTz775pvULhvieSlynRAmh/l/KM9AevBSor
         07Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=tx1S3zr1/95ZbSlSEpzuV5Mw8JtyoYuXcwzt94aV9gc=;
        fh=xTwy9h/9AuJU2fvELynKihlwTmbulSUhXeGcNqgXfaQ=;
        b=S07gtkIY06GqiWp/ph44QdMY1D3K0h02QonKztY/JUP1x4s5rhjbRpDG+ABitFr6zv
         1ONfQ6AEVQka8tqSPbZxBQWVwo7CYnPX9+5V83EOpQfMr3+549d0pP75tCmV1YpmbBLq
         PNLA4WDxxFq2Nwba3FtQzlMluIUalo8qfF4CTtUfdgc4CrRz6STgf1LTg41dolN2iTsN
         AMvzIqGLGboadIn38p8op9bG6wRxAZri/O6Q3tKikUKiWeWmuNGAdzZqs8oROrymUE6x
         GCLDgG/hazSgjDHn/5fOR+1NdCZ7s7HsGpawjz0wd6Pgpm99LE6U4OL9XPZNMUgyisBM
         Ukzg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=osVsBFlQ;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-71944aca9c1sor5923863b3a.6.2024.09.18.21.47.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 18 Sep 2024 21:47:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=osVsBFlQ;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726721274; x=1727326074; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tx1S3zr1/95ZbSlSEpzuV5Mw8JtyoYuXcwzt94aV9gc=;
        b=osVsBFlQOoCLoyNapVOCpAvTABPON2db2/FxOzhuRRYpzVhyg6tHzc4yxc/PsqOd5s
         RsZIKSvRtcAH8GM18N0uiWn9qrqjupm2Wm2v+DNoN80cFa27Av6Rym32S9tdDE1Nzlnu
         0zvlKWMKKVuBxCiaXDGIVWFzf945bosCzMhaTXQlYVq5E1iUzQQHHXANxXf3PmzSzQ9z
         K8FHQ2ie6AMrQ07pr3EGxTKwEKWdD44lad/3QPpZYTnmtTkqYjRew9Gk6uWnhkLLYujF
         TlgdSIj9JSxAB3vL/lYa+cEhAGDOXghQPUW2FUmOy5VfHF4KmenaSOuz2p2eng3buly7
         rAbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726721274; x=1727326074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tx1S3zr1/95ZbSlSEpzuV5Mw8JtyoYuXcwzt94aV9gc=;
        b=L/Uan0YQ2x8VsU0ndctE0//Aa9TVkgIgWFuSOhVuARMwhr+wEkRLfAKb3a6xrkR2i0
         Zd83GYlmG4CG+GGLkMSTNBf1IXgP9PmsNq8CtEkLJnJdID7/8QPtFefAHdgcmOj4nJmS
         N6SJkiEup+tZgREhBH9VDfKz2Wf6fm8KQBgx1w0Xo9EiZmEFuH8vNCnX1Drgs6YSWt5X
         rU1ba1UMW4l+U3W+I6jDr6ca57q+FalR+Z0VSy3J7n9dkH/FNpCJF949XgXAr6uSraxy
         v7t4tqHR/NwddV/rLOGJy5DAamJe9pRf7m1gQEjosf8iggIKwqQMVrNEdZZl+Kl+dFGC
         53gw==
X-Forwarded-Encrypted: i=1; AJvYcCV3SHZLoLyYVtLmXwMBpnwmp74b40HJTCRUK82sKYfHVWS5coTzudHRnEzbXckzABt0hfVCQ+PkU97UsQ==@linaro.org
X-Gm-Message-State: AOJu0YyZjCVcwtuqx3imlabIFwvcJ45dOA+pZKkzzKc4Lb/n5FThJ2IY
	vnu2ke+dEp94+0hKwYRITf6RvVDLxTWvMwt7eO6ayBXm/wv71j8aGf2C3ajlr4mzog==
X-Google-Smtp-Source: AGHT+IGxUDLX/EdmxHd8lBwEQSgvpOMo5EV+rxbHrbQJ6oH4Ek//dhdYk+b8MbHM5eBQ51CMojJGfw==
X-Received: by 2002:a05:6a00:190d:b0:714:1e36:3bcb with SMTP id d2e1a72fcca58-7192606bcb9mr34659991b3a.9.1726721273726;
        Wed, 18 Sep 2024 21:47:53 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944bc279csm7478601b3a.188.2024.09.18.21.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 21:47:53 -0700 (PDT)
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
Subject: [PATCH v3 34/34] scripts/checkpatch.pl: emit error when using assert(false)
Date: Wed, 18 Sep 2024 21:46:41 -0700
Message-Id: <20240919044641.386068-35-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
References: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: WPFtLrH+lM4k

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 scripts/checkpatch.pl | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 65b6f46f905..fa9c12230eb 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3102,6 +3102,9 @@ sub process {
 		if ($line =~ /\b(g_)?assert\(0\)/) {
 			ERROR("use g_assert_not_reached() instead of assert(0)\n" . $herecurr);
 		}
+		if ($line =~ /\b(g_)?assert\(false\)/) {
+			ERROR("use g_assert_not_reached() instead of assert(false)\n" . $herecurr);
+		}
 		if ($line =~ /\bstrerrorname_np\(/) {
 			ERROR("use strerror() instead of strerrorname_np()\n" . $herecurr);
 		}
-- 
2.39.5
