Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp422882nji;
        Thu, 12 Sep 2024 00:41:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV5H6a9zOS2vlMsEDCoyZmWmAkxuQp14cuiKWatG+SoecJb4JBvlH9u99hF5e7Zc8jTmJCIjLqzeZsVSw==@linaro.org
X-Received: by 2002:a05:6a00:138f:b0:70e:9907:ef75 with SMTP id d2e1a72fcca58-719260655e3mr3600658b3a.4.1726126861828;
        Thu, 12 Sep 2024 00:41:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726126861; cv=none;
        d=google.com; s=arc-20160816;
        b=dIEUwT4HaAD1mvNgUUFUDkyD2l2oxEOXs6g0tKmAtr58Cdn8YK2RmaAF7CgV9CxxF2
         V3nJO8ps6BVxyMBi1JUQ4kugMqJlRn/zP4dz30TtwZY6hHQgxHhwd5lUKozbKWhhZERk
         Zrjl5DXpKauX1yn0vzvRQSOCze+jjQxRJ3GILBPWx4uv9Ih2I3W5SNZYwPT/ijyiKZHh
         OojtgsrFRszYp4BvjO1Y7RQQsfpVbTdO1M/Ia6mtgH8W0mgE9bOL6vP7TmE8ay0aSwyW
         LvJbRukYbuxiiokt0e38Tzdk3i2EzlRteBoweWoCsza1OR2sW4lAMc9QUi7lDdeIq4tu
         KKVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=aRhqi3ndGuxNd7tYiOTJthgyMGQ64hBDEtZC2U8BXx8=;
        fh=J1ywy+IZz7mt2P7VgPIH8yeVnE4i7Fp/vSbUJApAdmQ=;
        b=xIolLC+62SLmHQTDNGpnquy5unESxgZm0xkodDuISHTd416qiWimmwTVopHEDx26KN
         QlPVw9bdi/PCV2J++7gZYrzAlro1w3WnTAd6Q85kWi0IHw1q0/wOB5bk/IRDZfgGsSIu
         lYmsrQR0WGguJJwD78m0fM+8cws7sTQGi0q3sd5gIT5Wu/zy2dANLj2wdRxbI7M7845C
         AXDK0SQGDpo7wPyxcDf8I7RUGmJCA7C3E3ZXt9Y0sIcgNmnoYKwCgufX6M52IjDAA1H3
         ++sDzPtwgJ3csY7ywALJoxwUBquOYfo0MaK0aL6amov72DIZvgFtryBl6fgj7vHHverd
         IHpg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LIThIwxY;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-718e596f0ecsor8955851b3a.7.2024.09.12.00.41.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Sep 2024 00:41:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LIThIwxY;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726126861; x=1726731661; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aRhqi3ndGuxNd7tYiOTJthgyMGQ64hBDEtZC2U8BXx8=;
        b=LIThIwxY/U5uqzXpEnzpm64aJldtkqGl3G7CrHoPoNwWTgp8Uq1nW8UPc/qEr5oA2H
         pYFvGRJMlp2hOqxst9hiG+0cs89YYkMHtzJLmwgi3pENHJW7RrlKaoBPrvtM4BO3Wktx
         pvH1d8wsfMZ3fxA4LOXpdeH7dbNKgSvQXTDJ+gAzzJcoEKgxM7l0ITjQ0RiLJX4FxONR
         DqU7R0oBNDiW8zhyVjlG0i0Lw+dvQE3WcL92+0PHdUyoYQBYhllB4kECNJvC7vt88TO9
         VOK2Xbn+eG2K0/05noSS5Av2ksXg6iWRCrgXU6YPwhXClulXTf65qARz0mTF22BghOQ3
         FLLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726126861; x=1726731661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aRhqi3ndGuxNd7tYiOTJthgyMGQ64hBDEtZC2U8BXx8=;
        b=KGklTNLci7WgE59zIzpRjdiyx+h0Zh78PG8pa6qMPtovePleGadqbNFvSdKcFxjWCa
         3Z7h2jnqiNRrh95tCKpRtDQ4082n2e0Es6BjA7YjVUtOupyp7L3x+eqPxBJTP/V21Du0
         bx3zRPpfG7fNMxgs8qxgjdZ1qnucJA0cd3XMq1sqPUy7X23kPHfcvWrPFgSfjhH6nS/D
         QSOz3PzTJAhXUqgBAP2KhjbrT7+ce1ya8ZKonONFLHeVgxD9Is9lCdKItE/EU8G87ItM
         H/CLyKCXWzBgzsAHTssD64BbzwMc9fpTxjUHGOz5pve6nu19Jw9DxYrjpPftOWrxk855
         OJnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtsvyI69ASn66wvoc0lzNc4abXUKmlMsrhczQnMwndR2SwmDthJ60QvkQcI1REUx8Ogf5C8pYiVSCTag==@linaro.org
X-Gm-Message-State: AOJu0Ywh+BNb76xyHD4f6NowQ5XTW20k6H85tpuAl/c0TD2ElDlqHRD5
	Ggc4bt2Vn//swU8g+C8/saHEgwFWPzWoKwfmVnS5do3F/hnnGCHL90oVXSYXh3shbg==
X-Google-Smtp-Source: AGHT+IGvK/n67vexDNSV79VALisw5Y++i7pBybF1QnzpQzK+oXQjb+Ja4u4bg2whNjS5JPChzGsWuA==
X-Received: by 2002:a05:6a00:218f:b0:70d:2892:402b with SMTP id d2e1a72fcca58-7192608123fmr2966919b3a.7.1726126861203;
        Thu, 12 Sep 2024 00:41:01 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fb9ad87sm983458a12.6.2024.09.12.00.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 00:41:00 -0700 (PDT)
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
Subject: [PATCH v2 36/48] ui: remove break after g_assert_not_reached()
Date: Thu, 12 Sep 2024 00:39:09 -0700
Message-Id: <20240912073921.453203-37-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
References: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: eeEyxPyK0jyR

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 ui/qemu-pixman.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/ui/qemu-pixman.c b/ui/qemu-pixman.c
index 5ca55dd1998..6cada8b45e1 100644
--- a/ui/qemu-pixman.c
+++ b/ui/qemu-pixman.c
@@ -49,7 +49,6 @@ PixelFormat qemu_pixelformat_from_pixman(pixman_format_code_t format)
         break;
     default:
         g_assert_not_reached();
-        break;
     }
 
     pf.amax = (1 << pf.abits) - 1;
-- 
2.39.2
