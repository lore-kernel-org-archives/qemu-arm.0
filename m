Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1444382njb;
        Tue, 10 Sep 2024 15:16:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX7eOsVYeqTYUaJGyXGlr5whVqRnf63Gtpdw7engOTD7UJvqmngDQJiuc7BkXZet+kBPaEbAx3DHSQwDg==@linaro.org
X-Received: by 2002:a05:6a21:70cb:b0:1cc:e3a1:b9e3 with SMTP id adf61e73a8af0-1cf62ce2c49mr1709721637.25.1726006587659;
        Tue, 10 Sep 2024 15:16:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726006587; cv=none;
        d=google.com; s=arc-20160816;
        b=Dt1sSr0HAxFCySYagru9LH+QTY22+wj17QsPJCy8y1earEBHqyzYxJy8sEWuKlV6je
         Z7rCKAyX/zyTm2QP2odamHoz8DYjFrhtUAoV039wOi4jugdgIqaxDDX5q2WqqbK7KHL0
         NJjrKrWItJt6WrgY6W2n7ivrXQuu5gY/bx0ShdtKOpaLADzv9iCGNgaO9rN8DKmGF9C2
         4IlaUyHiCS/jafc8QLndex6JLQZe2zyPeCaz9fn5/URacS7Hs4D0vs80wugQ4WBYmFi6
         a654ruOxzfaK3n/bYVgNjNPlQzqoHsPDY9/ckmpATNTJNBqmEqJ7GNCChkzsMae0553B
         mcpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=evr5nxnDoGKUr/y5uq9IdG4R5sIImXVpCjqkjM7zT2c=;
        fh=PhNo+H8+FOY9GnFveVkWHmQn4JFkxR+0bJSwKsaQ86M=;
        b=PvJMeXmrEZHgsyOycm6loTLcD+fyFGlLG9ME2T3ZD89lJ1Rig7wwe/AMWm9Xn4DVLf
         TUEQbHrzS5IA0q7t5jwVTerf7zn96/eAE14EA5/JyyhvCY3erg7kp5eViVD4KjqccShD
         Ym7X1FxKkz98dNV/nS5FcXeDcFNW33LOaRbqo2JJvR51frYFYbW53GALzuryX9MxchXb
         0RBMD3L3NHT7+MOOPNH3eeZs8fuxILD2D9iSDkKSkr9RVFaF7bOQDUD1GhI6vFievy4H
         Xm7XdTpBBSMBcXdr+XwfjpEBbqJE8kkP5/TD2l37u6UruYAcz+aiQv3azHuQ7n7kWGN+
         QbMg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bIVzUEIO;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-718e58a9288sor6604944b3a.1.2024.09.10.15.16.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 15:16:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bIVzUEIO;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726006587; x=1726611387; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=evr5nxnDoGKUr/y5uq9IdG4R5sIImXVpCjqkjM7zT2c=;
        b=bIVzUEIOxG21wKj2LGfQJ/48P6PjUXK3ojQldVEceLvwH9hy3x8q3FX/gG62bGkdpJ
         JuNk15dir2grKYMX8wfoyGhMEY9VG0aRykzcwTzf6Xv+vugz1d+qvQ5y6LU7GLgfVys7
         rBeiZFmFcwmPgVoZ78uR0WRXuViu8/E32jhRSeOl1W1idbaCHXKVTY/lr5cOASTx0kfu
         lb0FjV3aELxRqCdAlpi+0/6D0xixosOPjungGtxh3/NLJshc/dTevNuF7XCYzPT8/g8d
         1A7bF4/67Dcj+k8TsMUIgSRTO9iwUVoOainiMlxRt4KG0+QloSdH+65LSKh4yLOv40aL
         T23g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726006587; x=1726611387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=evr5nxnDoGKUr/y5uq9IdG4R5sIImXVpCjqkjM7zT2c=;
        b=fri87t2DQwA8kqVwQPyn0aOqMprec2HEqCwTxbJLWcHmJ8rqLJG+Gnx1yjZBU60ywc
         uqSkFKxyD+UEAIbzR6xVePQiRjenh49wapUNlx/w2aJmnUbKujVbNEKsAg/QlDQz0l+y
         zM49xnSkeb3KGn6ET9XeY7G5R64AqxMmyYQXsaaIpuvTdkVtfk/ExiI1zvTYVgx6GA4g
         VCzvnt6l4nIP/WtKyIzaqWx2+m5szMeYSRsVjmQcr0xiEZOo2S4r3wii5LfSb3OiLhjY
         1zH/zIvsox6Kk96AZkuQzTERXPcLKmp6Wy4AT/CvtAC/hEMcBlxQW8nPbU6I05IYY/yK
         AUMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWzkRGkznutGvqAIcm24JKvYPbCKbJ/mu49RLQXV2WeCJxE6dFQ1Pq8//DD5E8Wei7cg3HRiLz13fYaQ==@linaro.org
X-Gm-Message-State: AOJu0Yw5FCb7UlrcX7gzwW6BerCenSmtYAnHcihQzn+eD5UkSgoDYws7
	NxypBeViO0zIU3mZZUX3sTF7FmDluo+vE+sDD2s0Jf6T9DSvIfFrKFNDBst+RbcrbQ==
X-Google-Smtp-Source: AGHT+IGXKqllEsnkUm0CvfCkcCDSr1DZ+m3eTy1QQa0XwW6UoPGELkeBde/1LfDNQnnnco07gvAb6A==
X-Received: by 2002:a05:6a20:214a:b0:1cf:6625:f08 with SMTP id adf61e73a8af0-1cf662514d3mr560108637.45.1726006587131;
        Tue, 10 Sep 2024 15:16:27 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71909003d0esm1884055b3a.93.2024.09.10.15.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 15:16:26 -0700 (PDT)
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
Subject: [PATCH 07/39] hw/watchdog: replace assert(0) with g_assert_not_reached()
Date: Tue, 10 Sep 2024 15:15:34 -0700
Message-Id: <20240910221606.1817478-8-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: /Q+RyXpIviAt

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/watchdog/watchdog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/watchdog/watchdog.c b/hw/watchdog/watchdog.c
index 955046161bf..d0ce3c4ac55 100644
--- a/hw/watchdog/watchdog.c
+++ b/hw/watchdog/watchdog.c
@@ -85,7 +85,7 @@ void watchdog_perform_action(void)
         break;
 
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 }
 
-- 
2.39.2
