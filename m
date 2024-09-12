Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp422725nji;
        Thu, 12 Sep 2024 00:40:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWmxAL24HO34rHREUWfaLpUf6KyCb+HHsy/W5E8KoEQpenhaV17gBjf38t4Ne/PGNOXahoZI1cu7/qqeg==@linaro.org
X-Received: by 2002:a17:902:f791:b0:205:4721:1a7 with SMTP id d9443c01a7336-2076e37aec6mr27035305ad.31.1726126832669;
        Thu, 12 Sep 2024 00:40:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726126832; cv=none;
        d=google.com; s=arc-20160816;
        b=TDQnjsuZvpQ3Q3OpRmpVSu0hBpxtjV+L/uERwyH/x9LCmbqsizWX1Bm5Shl7DhQCFp
         tq34dw8aRGdzNnPq1tWpWXHv893pR4cCMFdv5n/Ui+qwW7xlgmP+t0UBi64Trrk9+Tsb
         Tksgk6ynpnClfCGY/0SmuvQbX5VcP2C6o4ODaszrCt/qGxzYyvATnBWrP9mjGfmKywVc
         MK5z7o5LfWs52Gff8zVyLcnlDt0XV++6QuV/UM5AFNaUjxr3IjDbwzK2uoAlMN8QdMn5
         dqFYrIxZbgfbYPIv5Oz2/x0GyuS0voKmxIcjglSDzDkx7Lh3VIQhtd7JdUdsjwqZDV1L
         tQ9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=IfzxXhYdexHV2ki07pmnRNhBL9e3UdCDUhFFW4Nxwh4=;
        fh=6+vzHvTLzMMQQcevA/vhgtdKQEafqaFO6bM7pRAMa0s=;
        b=qzBZZb3WYfkClQqMBOhAn/fuWmF8T2ynyJ2k+T3KP5UDwKlRTU5QpgYoAoMpFfHVpG
         S1ajzxPD40F/CPsOwayxg368IwUHjwQ5WWl9tXfK6+Km4Yr3YQJ/LJxabcrvE/AyeGQO
         DFoNqNotXDDTDPhNxusoKW6YIgHwiiTwUb30Ln4svN/lrIZ5B87JLF3h3uelGsIl9FVQ
         Op8bJbmeb9lLy/0Buwj729xXjS+uLLYtBjGNWGek77NEHSV+HshhApip85Vpduj4RdN3
         S3+InbPYHVyMUr0V7kizpnvNxm/5usyw0ekoM0Rns7QPSbpQZi8e6l7/xc+KAzAtaLih
         esIw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xpVi6GFX;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20710f4c33fsor70265885ad.16.2024.09.12.00.40.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Sep 2024 00:40:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xpVi6GFX;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726126832; x=1726731632; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IfzxXhYdexHV2ki07pmnRNhBL9e3UdCDUhFFW4Nxwh4=;
        b=xpVi6GFXRGL/1yacz0YsmLlFT+N5rpHzIdnr0PEkRVsuxZ9jleakmTW7bT1iOPHDyA
         NVDTfte1hWtgI5Z2oM66aCfF67hs7hoPpZKtEeWG3BPy4276+TI+1NsnNkyeRwyUDQpz
         lykxrK2Q1pwTk9uC4B2eR5IOFb2bRBkl1iVbBZ51Qt+dMtstNL8NKww/z9VI+1tHe3g8
         pxD1wLZhMfg5qa3+eo3S9UVXxhI/ver+ETgTP2VpjyH42/G4J7WllnZ6VXLrjLoqbZPO
         dDWxlLOPIO5gvHr1CyBj6ZVzrnK7oEoGzsKtBBOIU5jiyjOo5NEyDaJklLNH8XexUOcc
         kQ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726126832; x=1726731632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IfzxXhYdexHV2ki07pmnRNhBL9e3UdCDUhFFW4Nxwh4=;
        b=EjmxHyKIFv8QrgUUT1cbN/uwJHYR81fEPqif9ARXbpfWHt5r1vlRpm1YPpKEKqM/Vp
         OoHVZrTe7Gd8YKm8lvshSDmX4HeEQBjwxolKIBzvkczos+Kt0t9o5BwsyQTyhxu4osMV
         rLmymG7nzMx/bvfey0/gqrzmJ4V7huqkw1gc4gAUcqRda3nYRZjHv9IFONyy8xBDq4pc
         b+vO6m1OCEW9JNUjciO7oN7WeL0bkVLr86/GbB7i4Uw6Qi2Dgl9UG6KnKh3ysLtIBoEQ
         XW+nPN7T5lbvwvq2GNH5XljRgy84fzF8vJyt98MjvCHCnn8V1JDsOtsEYyPu16S+fu5A
         Nb6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXDVlOaURbyQKqPEsCTS3ymyOAt/Y8nqRLxdXCNrGQ/EdasNPOFGbQCDDT56uJKLEW9MKcbBW8ww6KoKg==@linaro.org
X-Gm-Message-State: AOJu0YwmhWsEmvRzymOzEciZLcPAjo6ceJwDL6a6GQgk6xVDgW8XMFXj
	nMWE/MmL1y+XEvtA/qEszSs+Ct3C0o0hCQ+JMvYm8fxAGPpg2fzEm2oVLNmFIz+5Bg==
X-Google-Smtp-Source: AGHT+IG+6sarLCJnrBKoRA745sjlTCC47Zh2hr0Oj5OjLFhFesKWWQAzOCLBOFG+diDbRtfIiv9TYQ==
X-Received: by 2002:a05:6a20:cd0e:b0:1cf:6c65:b736 with SMTP id adf61e73a8af0-1cf76358fa6mr2638356637.40.1726126832155;
        Thu, 12 Sep 2024 00:40:32 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fb9ad87sm983458a12.6.2024.09.12.00.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 00:40:31 -0700 (PDT)
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
Subject: [PATCH v2 25/48] block: remove break after g_assert_not_reached()
Date: Thu, 12 Sep 2024 00:38:58 -0700
Message-Id: <20240912073921.453203-26-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
References: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: NSPfzDsbvUkZ

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard W.M. Jones <rjones@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 block/ssh.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/block/ssh.c b/block/ssh.c
index 27d582e0e3d..871e1d47534 100644
--- a/block/ssh.c
+++ b/block/ssh.c
@@ -474,7 +474,6 @@ static int check_host_key(BDRVSSHState *s, SshHostKeyCheck *hkc, Error **errp)
                                        errp);
         }
         g_assert_not_reached();
-        break;
     case SSH_HOST_KEY_CHECK_MODE_KNOWN_HOSTS:
         return check_host_key_knownhosts(s, errp);
     default:
-- 
2.39.2
