Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp3010904ejb;
        Mon, 18 Sep 2023 09:03:46 -0700 (PDT)
X-Received: by 2002:a17:906:300b:b0:9a5:ed5b:241e with SMTP id 11-20020a170906300b00b009a5ed5b241emr7095160ejz.25.1695053026546;
        Mon, 18 Sep 2023 09:03:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695053026; cv=none;
        d=google.com; s=arc-20160816;
        b=SyS0Jp4qJ2zasE7V0q3Y2Dv59YdEq5lk8BNazmeQHe6tFzc57Uq4CjT6TdHYu7s/vz
         K6PzxvRDPIWmHZthfCPuBeLrRAZmzFKQQ2w3T7JR1nvJZVLKTZxhcb5Ffdt9ZFLRwCb7
         yeECnBv4S84OsHsT/qO4Vr1+7ie4NzbE80MLRWIfQ1O+669T3oZcwZsff3d/vqqM/ZYQ
         r7UjuitrMFErtUFycEUxYspD1Y/RdactvEE0XdQrM61vkpT3jb/+dx7XquPSlnzNLTdS
         KTe2csdQSzZRxhMcHiVGROh1K1RJwTTgm/6e11udXfqNM8Z5FYcoCIzgTmVlO3Ox4b8D
         rm/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=hSVRQGIJEmce1VSEx8yaDe0o7AipRr5BDfgLzGOyz48=;
        fh=AIYNAcrfQPdTp+tiOBYg2bCy2NfWRbXD73JV9SLWbpM=;
        b=XjNuM/CZldLAQn6xw4Kv/PV3SC9UdOBQALCk0Vv5h+ZNwMVL2iVvCv1QkSrlUvsFv9
         tXUmi+3/nGlYgVH/aoJtzmxhlx5wU4y1Ol3i8pfxUlrjnU33WuIHad5WEUhIpdkQK7zf
         nIjzY2xIOOOdkyHoXKyOYI1slok61DonJlS8abJROn/ip42IEFVuUmQsD+xTygvkcJuG
         t6A07kO1HRwbCXq/6lOxtPPYf40ydDGmL2650uqy7sLc3JZevD5MGCi0h58vT1ZFfDc4
         hpzEZYi45ZdzhAXJZ8XXYkXGa2j3FaFXMvxFhQawuasG/68Nx1Edel5R4/dOHD2x2Ga6
         WgLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="zvzYTjw/";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id hx17-20020a170906847100b009adae266299sor2888351ejc.20.2023.09.18.09.03.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 18 Sep 2023 09:03:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="zvzYTjw/";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695053026; x=1695657826; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hSVRQGIJEmce1VSEx8yaDe0o7AipRr5BDfgLzGOyz48=;
        b=zvzYTjw/Jp93l4aMJdrmyuJ2W3ZgjesnWBp5tGUZsem35fC3jfSBAPoGtDHX9PTVVM
         Iwc0cWh8Tqcofb3iuMKUJSwS8dFJZ71O5fcVlnpwU0ahzTSwxp7fTYw3IYu1kO7hKdmn
         kz27j36c2Eh81XSpe5MgER2Dn+w41UFlKZuz01tWdnOHmBqu16SaqnEgXNVPSz2nENo3
         IENw6TWSY1H5RnhWIeoXTTQC6/Ix/ifS00kS/YnxOUELxdPqhQxyX6CtE5rSgNgG1jiv
         NAsmWl3Fi44ntk3eOfqPvOPhzK9u2jdRxxFhhwh3JtwNncMLx1mBOA7JExdgXq4DiLIe
         JX1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695053026; x=1695657826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hSVRQGIJEmce1VSEx8yaDe0o7AipRr5BDfgLzGOyz48=;
        b=goXxnPA0S4FJSA5qEA5HbfGTtw/Wx33Mi3axpH/Nb9g6vF1ADuTgTD2d7UuefhrQHM
         CE0q2yzFF0JifOn0xMJJu4TprTL9uS6ofGzg6bhwIVp2e4w7y+sLLOXbmIAYupKej3Gu
         +UbZKKgZxTrK6YQf5y/lUQIgT2n5/N7sLXMP3jar01J2je1GQWs+IZ0MQtMHkCBxaE+n
         d9irqRuJI/tHykL0xkizIcC8fQGnkIuMkuZvMOY+uF0wbU7TgJvXPafMF4i+fvSoKxwk
         sJuFe3AMcwKpwsqeIMOR9jyZppuGyZuYsZo04BijQjmgwH6704uyr4azXqn9cZz8uepK
         A6fQ==
X-Gm-Message-State: AOJu0YykcHVNmdAC8l8LGjnErBd2c/RsKLQAkiZxPo080ZH6eDGvGFus
	3h5S06FRDvsHPgf2R/5Vnv00iWm4
X-Google-Smtp-Source: AGHT+IG4piDQtxZVYFiU0HjN8n/Q699dig17N/FQPVs1xyeDcBS2KjVyyREmZ08RNzkeawSSuXGK6A==
X-Received: by 2002:a17:906:74d5:b0:9a1:8ee9:cc0b with SMTP id z21-20020a17090674d500b009a18ee9cc0bmr8829825ejl.21.1695053026100;
        Mon, 18 Sep 2023 09:03:46 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id g5-20020a170906394500b0099bc038eb2bsm6614676eje.58.2023.09.18.09.03.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 18 Sep 2023 09:03:45 -0700 (PDT)
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
Subject: [PATCH 09/22] target/arm: Create timers *after* accelerator vCPU is realized
Date: Mon, 18 Sep 2023 18:02:42 +0200
Message-ID: <20230918160257.30127-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918160257.30127-1-philmd@linaro.org>
References: <20230918160257.30127-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: N6paAS1A8Vve

Architecture specific hardware doesn't have a particular dependency
on the accelerator vCPU (created with cpu_exec_realizefn), and can
be initialized *after* the vCPU is realized. Doing so allows further
generic API simplification (in few commits).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpu.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index fc3772025c..46d3f70d63 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1748,7 +1748,15 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
             return;
         }
     }
+#endif
 
+    cpu_exec_realizefn(cs, &local_err);
+    if (local_err != NULL) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+#ifndef CONFIG_USER_ONLY
     {
         uint64_t scale;
 
@@ -1776,12 +1784,6 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     }
 #endif
 
-    cpu_exec_realizefn(cs, &local_err);
-    if (local_err != NULL) {
-        error_propagate(errp, local_err);
-        return;
-    }
-
     arm_cpu_finalize_features(cpu, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
-- 
2.41.0
