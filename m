Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp919239lfb;
        Wed, 30 Mar 2022 05:56:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7LfeRGyfn7VQwikpb9x2e5O772kLzcVejf8kvS6JqzoZECScBbhaETJUjUrrsDQjoJ72p
X-Received: by 2002:a05:6000:1a8f:b0:205:82c0:58ac with SMTP id f15-20020a0560001a8f00b0020582c058acmr36093537wry.30.1648645019233;
        Wed, 30 Mar 2022 05:56:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648645019; cv=none;
        d=google.com; s=arc-20160816;
        b=0EnpoUcSpKXOxbsTt/HDA9ucWQPTJ5W8TnXACEx5tx0N41PSeqa/zuC9Nj3FL7I7cF
         +TKLS+83F4kxMrZ8e/J2xCjNLUsZzV2Z681t3YMUB6G9kdNXCiPD1LF8JgTEgDhW/bjs
         knDyyHcrDv2mxKdYJ/XLvZshLKRtuky0XVa/SRxvx7fXw3h7rRMZmf2M69JS/bzJ4w4e
         UDpGACECHHX7XJ6rvLMkqgOaQAnwXmhR0dvLbpK/s4WsasY/41dsHeK63Gln6w8ighBF
         0g5qaPPp2Dtg4r24I7q1Yb6w/goN8/Sdhxf4/zPAMzbTC1vyJ33Zqvx95eE9/IQ+Z2gv
         nFPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=u+Y7rtW6/1Pkub0r0JH7VK+q+wQIolpCjWK7HUGbZ+w=;
        b=ibngxSeSw+OxXLh/PDorBG+SdjR2HJY3tGhQ8aSZA+49yYV6v/JqFi/8E8platonbS
         GTrag/ti2dazloHgirLh+hWGN+6dx4Fvu5EwZimWgYhpPlpzNHB5qrXuNIrIHN6k97bV
         CRbPMRVyUJkqy4zYCMktXIVJrIAefbsUGv5BGXqEcGKOgYZGq/HYpyGw9Z6c58+Yl2WJ
         aUj8THj96inkZlZuGvaTqQXsqelEYDUKXGjxfYVw5B+SDQP89m/6sHExVloY5cmSkNLJ
         siHU9qOYh2ZnIa+irxwQqkpD/9UMcKBBPSd2FQktK2RKxhOoOQZ/GPXpVwZCwiR9ZH4p
         kp1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@greensocs.com header.s=mail header.b=pFCroeDH;
       spf=pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) smtp.mailfrom=damien.hedde@greensocs.com
Return-Path: <damien.hedde@greensocs.com>
Received: from beetle.greensocs.com (beetle.greensocs.com. [5.135.226.135])
        by mx.google.com with ESMTPS id e2-20020a05600c218200b0038c77be9af5si1502467wme.16.2022.03.30.05.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 05:56:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) client-ip=5.135.226.135;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@greensocs.com header.s=mail header.b=pFCroeDH;
       spf=pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) smtp.mailfrom=damien.hedde@greensocs.com
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
	by beetle.greensocs.com (Postfix) with ESMTPS id EBF1A21EDF;
	Wed, 30 Mar 2022 12:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
	s=mail; t=1648645018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u+Y7rtW6/1Pkub0r0JH7VK+q+wQIolpCjWK7HUGbZ+w=;
	b=pFCroeDHUSYDBbIfKQd9B4Za1DwEM7EOc0yuGFcBzbGzcicMs9MXPYKohN20vZMBGdLBJc
	EFbRuUsBE2jNJiqmkVEtc850XBbjogCaO1GDjsFIJamkzqZd6GamNyf3eEf9l7oVh5/ZYj
	BAl12nUaTEn7XzVcVeUNJdYl+KQXszg=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Cc: mark.burton@greensocs.com,
	Damien Hedde <damien.hedde@greensocs.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Bin Meng <bin.meng@windriver.com>,
	Vijai Kumar K <vijai@behindbytes.com>,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC PATCH 18/18] add myself as reviewer of the newly added _cpus_
Date: Wed, 30 Mar 2022 14:56:39 +0200
Message-Id: <20220330125639.201937-19-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330125639.201937-1-damien.hedde@greensocs.com>
References: <20220330125639.201937-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 0+Ki38+omhrQ

Add cpus into the "machine core" subset along with cpu
cluster and add myself as reviewer.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---

Should we put all cpu groups in the same subset ?
hw/cpu/cluster
hw/cpu/cpus
hw/arm/arm_cpus
hw/riscv/riscv_array
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cc364afef7..80b9331d02 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1678,6 +1678,7 @@ M: Eduardo Habkost <eduardo@habkost.net>
 M: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
 R: Philippe Mathieu-Daudé <f4bug@amsat.org>
 R: Yanan Wang <wangyanan55@huawei.com>
+R: Damien Hedde <damien.hedde@greensocs.com>
 S: Supported
 F: cpu.c
 F: hw/core/cpu.c
@@ -1687,11 +1688,13 @@ F: hw/core/machine-smp.c
 F: hw/core/null-machine.c
 F: hw/core/numa.c
 F: hw/cpu/cluster.c
+F: hw/cpu/cpus.c
 F: qapi/machine.json
 F: qapi/machine-target.json
 F: include/hw/boards.h
 F: include/hw/core/cpu.h
 F: include/hw/cpu/cluster.h
+F: include/hw/cpu/cpus.h
 F: include/sysemu/numa.h
 F: tests/unit/test-smp-parse.c
 T: git https://gitlab.com/ehabkost/qemu.git machine-next
-- 
2.35.1
