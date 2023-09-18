Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp3010445ejb;
        Mon, 18 Sep 2023 09:03:15 -0700 (PDT)
X-Received: by 2002:a05:6512:3da0:b0:503:1be5:24eb with SMTP id k32-20020a0565123da000b005031be524ebmr2688885lfv.50.1695052995403;
        Mon, 18 Sep 2023 09:03:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695052995; cv=none;
        d=google.com; s=arc-20160816;
        b=Xf+SXqepCRTtZdYUl7mF9auu8Y3mLTPhiIpQGXkLDG8SJH4nvELqBl/YB/SifoEzkm
         5IfqIIbuc0tiXzi2vN+tZ1QL87IPTjMovYSMUmPMnq0HJKDSqRavb1EptvApLp1Q9RsQ
         SFan/W1Ak91F2lCWFHSzMpE9oCJ+2JrLc2Ix5AasMRRPVTpJsQn7BuIuaOxwcU8TjVBQ
         bAKm7cDDgXSweQZ6z6I8lSZCA+dTlWfoyHbyJkJJ/GPILUXNoGx1nGhduErpW0yljs1L
         u4AYowoGJ5pWvpmBTflRJLXXZ+75c6I0am4hhesi6ylJGnVb6KBADp9/uE0b2pS6st3z
         0Y7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=MazgQXWzZA8uxNgPyG3XxGvrbp91MALAwpKlSsIULzk=;
        fh=AIYNAcrfQPdTp+tiOBYg2bCy2NfWRbXD73JV9SLWbpM=;
        b=bTcCKWJfJKyB4QaWBq7x/8ECv+FIjSoJF1OpNTh/kD5JM7gPz71AMBRSssYc2FcIMH
         LcIIirq7/rB3DjRAIbIM+wxY/+UrcEd8pUfGvFfLH2lAQQFZsqd11NYDW2jZQtHJxxX9
         ZChk7Rj3O0nY/eeX/A/+UvLZchJf1Gxh4+lrqcEThsyN2flaNnlZ1b72aPO/g1bCAxNB
         AyMa7uuC51pkBGp8pVi2yVyA8+yfjyt27IWLUs6QbvX7mQ3GfJpaT8NGbp9hGlaJFDfG
         hSxJm2yj/fDnuJYDp7EHq+ENPxVlXpRjgWv24jxSvYLJZegOU+tt/w0surkqwqOQW/jk
         JWkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qkjpcwp3;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b14-20020a19644e000000b00500b8ccb1b0sor2957752lfj.2.2023.09.18.09.03.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 18 Sep 2023 09:03:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qkjpcwp3;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695052995; x=1695657795; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MazgQXWzZA8uxNgPyG3XxGvrbp91MALAwpKlSsIULzk=;
        b=Qkjpcwp3yOSRc46VM7SZJ+D+vxUJpe3ksoFgo94zTqNGtgd9d84vrBI6CgQxW+oAGJ
         FQgruxFmexofbcDvwDWYTBByS3yTz04KN/h0zn2QSqwftUjGYYz1hvIxQFfy9kVoAvUU
         s8Uko/HRGJBRMdztzm6w9Dn0l1M4G1+g0FHwU0un4tSK0W8y+hkDRgNmOtaBj759AQNq
         tU2tUbmDipLA4LIhyc85L/cQ6HkHZzTZ9rmLJweHhfO8KiwEYYFC9EdRnWlHXlaWjynL
         aWLWKbvkrvezD51x9DZ1ejNDLgty0yvy5lfz1vM5FfRU7IyHYpbMelQ7VX9cB83pt7CG
         l4sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695052995; x=1695657795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MazgQXWzZA8uxNgPyG3XxGvrbp91MALAwpKlSsIULzk=;
        b=G4LG/SEdR5B7VsGWFF1+8l/HloEUAXbDwrpS+PaUhwTg/TleEKh9VFpTJpaYwBT3R9
         pqwHZD63vhVowH7tbNZskDc1NxCj3jcLzXmybjjX5iw8v286WpeLVoFvz2lr4pyLRgD0
         YRvneavyMQ9VVYRiLVzaLMsv6pGoeCTJjXqxnMfjDZt2Ads111sKm1X0dBLYOgwQZnm1
         APTTTFH1yyolpGp+7esgIX6dBHuHPteL+kz61n8HDRdXnfAmqkaZhQFR6cv9BaV8dZhW
         BOnw2mzrIemNkNNY+z16IEo4jQOkK9x34x3YrxcBXjqctvwXvym4qR38IvvY+8VkYAso
         t11g==
X-Gm-Message-State: AOJu0YzvK1qe9rNlc73h3/yxzcZkzbR3d5uvcFbsgg5GDx47cRGZ4M82
	dwTXruHTW/isfI1J7ZkPibIfGTAs
X-Google-Smtp-Source: AGHT+IG8278V/bx3bmgpaUhHZZUcMrkwCw5Xh6lMORAxCV90jlud9/Vt30zNUM+Rqe+3rVD6prsUKA==
X-Received: by 2002:a2e:8ed0:0:b0:2c0:d06:9e65 with SMTP id e16-20020a2e8ed0000000b002c00d069e65mr2857839ljl.8.1695052995061;
        Mon, 18 Sep 2023 09:03:15 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id r11-20020a170906350b00b009934b1eb577sm6608438eja.77.2023.09.18.09.03.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 18 Sep 2023 09:03:14 -0700 (PDT)
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
Subject: [PATCH 03/22] target/i386/kvm: Correct comment in kvm_cpu_realize()
Date: Mon, 18 Sep 2023 18:02:36 +0200
Message-ID: <20230918160257.30127-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918160257.30127-1-philmd@linaro.org>
References: <20230918160257.30127-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 0j/C727oUJPh

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/kvm/kvm-cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/i386/kvm/kvm-cpu.c b/target/i386/kvm/kvm-cpu.c
index 7237378a7d..1fe62ce176 100644
--- a/target/i386/kvm/kvm-cpu.c
+++ b/target/i386/kvm/kvm-cpu.c
@@ -37,6 +37,7 @@ static bool kvm_cpu_realizefn(CPUState *cs, Error **errp)
      *  -> cpu_exec_realizefn():
      *            -> accel_cpu_realizefn()
      *               kvm_cpu_realizefn() -> host_cpu_realizefn()
+     *  -> cpu_common_realizefn()
      *  -> check/update ucode_rev, phys_bits, mwait
      */
     if (cpu->max_features) {
-- 
2.41.0
