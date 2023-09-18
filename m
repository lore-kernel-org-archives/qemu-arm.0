Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp3010843ejb;
        Mon, 18 Sep 2023 09:03:42 -0700 (PDT)
X-Received: by 2002:a17:907:7897:b0:9a2:143e:a070 with SMTP id ku23-20020a170907789700b009a2143ea070mr140627ejc.20.1695053022007;
        Mon, 18 Sep 2023 09:03:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695053021; cv=none;
        d=google.com; s=arc-20160816;
        b=J/3yE/xV1aRHaD2VuYCay9tr7ThNMDHBry6Hqb9sH8sNNhkzkKLPy1EB5CcKGbtR+q
         IdQNn/xSCWlhAVJgOkRjqnNSuUzylDXgDzpnz11mGTHjyzWXtIS7eK3LieFTuIyIpgno
         7XjSNwIO2LTN2R+S+rhbYEd1lOee0ffmOWYz6AncOmtyUY78brkH0dhxI1XEe81ZXllO
         wpDDtylXNOU56ZBqM4FucmKNaYzGTziQizJdemxd3Oa3KgSv7HTs1XevErpkBPBnnpo2
         eyOspkajp90eFptx+YS+Oqm9DloA2Q5vmQvGOamuFvif0pqUutHMt+y8VN0VayNSqEET
         HL/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=fSCS2zUfZAE6ogrinmDPrOXdED/BfB+BaLaX0u0zcLg=;
        fh=AIYNAcrfQPdTp+tiOBYg2bCy2NfWRbXD73JV9SLWbpM=;
        b=F0l18MTDgjxg9ZhvxsL1S1unpM+4EAA1qRW+LeHrBnZWPsbohsLJYvgDqMXmBs70tl
         gFO3Nqguhc/Txy5hDED4grhitWjhOUEnYT9SQqd2lXqsohtXhs8STrNSKdqFPlNqQKLU
         4yOMTRLDrDec1b4617+Yf1JJmgDICOky1Z0EH5X7fyU43XkZQE7KOtgRIIPqGPga+jPR
         bcDGiTeF1TOk5AzEVc+qQjtrDPxoo27vru7uIOwHIxPOUAF+u69+Rk+t5UXF8HI296wn
         fS1DAz5ge5bFit53owt4KtGYnB8rnzKckKQfpVYcsj1McJ3pLsHBj2dD2k8g4QV5rTss
         E9Lg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PCnV+dfj;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id du11-20020a17090772cb00b009adc46b00e7sor4507706ejc.4.2023.09.18.09.03.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 18 Sep 2023 09:03:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PCnV+dfj;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695053021; x=1695657821; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fSCS2zUfZAE6ogrinmDPrOXdED/BfB+BaLaX0u0zcLg=;
        b=PCnV+dfjaRoAkpVJ4qe455tZiawaX5Civ606/6sjWd37ULPR/twJF2cpshaTOmAqEH
         aXbzQKLOZyczfQemI2Pk49jbNv+wvxRAHAYSnDuYjYSNQihELRmQIIUBkTAO7l9Beww3
         iDgBMRsDxBHnfRuYln1cqqeZQl0YiNXfoxVHHys9iK0w53pd8TeyY3Xj11W2wg4Dfe9t
         IPg5QUGHZdYQVzhsvlm3cOSFOxb8TbfPD9y/ZZidE0lh8PvzQSn3dWITk8aBcKcxv9N+
         TRx4TlO9JIRfLjCf5EDsL0VRc65e6X7s178p+V8kKzqubC0yNLCRo3eDY6YY8XLm3x0l
         csEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695053021; x=1695657821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fSCS2zUfZAE6ogrinmDPrOXdED/BfB+BaLaX0u0zcLg=;
        b=AfTpvrMNsChiRUPJAcy63lNzyxk2gQocxgsNOer0nOVKLVpqt3kQkB/sHEqznkRBCH
         kldtb1NbgAI/kBOHknHz+mDtvrAP4EdcqpdEgQNbWi7zNTMHqimxfBd7C112Ipc+kDdG
         YpOp9xdFYDCkFySLnfkQf3V69Y8+MlzLcFgKiC4Damml57i7X0ddGvaHnsJ1cu09dfv8
         gkFzsYYglsujOYnzgNzA72tgIzg5zT6uIVAApIq5uqODMygVc4oCzC6XMCI4b7zTRmaV
         VOzG+BGTLP3kLh4xupZvXNvPHvIdbAPC7zB5c8R6LT2Zv2jTliNM//4GLGx5PELGnPfF
         /7bA==
X-Gm-Message-State: AOJu0YyR1Y9HMroZha/OONY+gLu/xwBtRnzRhkYHxg7xs1gaGfv67YYu
	/ZvFiu3A1SKXai5Eb9B4xNIvasKo
X-Google-Smtp-Source: AGHT+IFbTianQZOGFuSjVlX566F74BXdJs5acopl7EmpAQkaG51ohmS+uPCdYH5B96NaIiVcrKe7YA==
X-Received: by 2002:a17:907:62a6:b0:9ad:cbc0:9f47 with SMTP id nd38-20020a17090762a600b009adcbc09f47mr116109ejc.12.1695053021006;
        Mon, 18 Sep 2023 09:03:41 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id ck9-20020a0564021c0900b005231e3d89efsm2684962edb.31.2023.09.18.09.03.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 18 Sep 2023 09:03:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Anton Johansson <anjo@rev.ng>,
	Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org,
	Marek Vasut <marex@denx.de>,
	David Gibson <david@gibson.dropbear.id.au>,
	Brian Cain <bcain@quicinc.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Claudio Fontana <cfontana@suse.de>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	qemu-ppc@nongnu.org,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Alessandro Di Federico <ale@rev.ng>,
	Song Gao <gaosong@loongson.cn>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Chris Wulff <crwulff@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Fabiano Rosas <farosas@suse.de>,
	qemu-s390x@nongnu.org,
	Yanan Wang <wangyanan55@huawei.com>,
	Luc Michel <luc@lmichel.fr>,
	Weiwei Li <liweiwei@iscas.ac.cn>,
	Bin Meng <bin.meng@windriver.com>,
	Stafford Horne <shorne@gmail.com>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Bernhard Beschow <shentey@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-riscv@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Greg Kurz <groug@kaod.org>,
	Michael Rolnik <mrolnik@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Markus Armbruster <armbru@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 08/22] exec/cpu: RFC Destroy vCPU address spaces in cpu_common_unrealize()
Date: Mon, 18 Sep 2023 18:02:41 +0200
Message-ID: <20230918160257.30127-9-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918160257.30127-1-philmd@linaro.org>
References: <20230918160257.30127-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: zkbLxkGHr2Mp

We create at least one vCPU address space by default in
qemu_init_vcpu(), itself called in cpu_common_realizefn().
Since we don't have qemu_deinit_vcpu() helper (we probably
don't need any), simply destroy all the address spaces in
cpu_common_unrealizefn(), *after* the thread is destroyed.

Note: all targets were leaking the vCPU address spaces upon
vCPU unrealize (like hot-unplugged actions).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/cpu-common.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index e5841c59df..35c0cc4dad 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -224,6 +224,11 @@ static void cpu_common_unrealizefn(DeviceState *dev)
 
     /* Destroy vCPU thread */
     cpu_remove_sync(cpu);
+
+    /* Destroy CPU address space */
+    for (unsigned idx = 0; idx < cpu->num_ases; idx++) {
+        cpu_address_space_destroy(cpu, idx);
+    }
 }
 
 static void cpu_common_initfn(Object *obj)
-- 
2.41.0
