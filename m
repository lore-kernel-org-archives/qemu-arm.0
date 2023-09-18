Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp3011785ejb;
        Mon, 18 Sep 2023 09:04:45 -0700 (PDT)
X-Received: by 2002:a17:906:cc4d:b0:9a1:bcf9:4f99 with SMTP id mm13-20020a170906cc4d00b009a1bcf94f99mr7963281ejb.36.1695053085686;
        Mon, 18 Sep 2023 09:04:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695053085; cv=none;
        d=google.com; s=arc-20160816;
        b=BnJaEbJWKsGpWKSOMVMc+7TEacjxRbaSdOIbGh1Xh8lob1SJ1MwgKNGv+ik5/YFnhT
         5x/CCc5ABmjEhEnA1t6lMR6w1MS7YRIvnN0tvEYMD2rVf5BGux7bYe8AR1TKVTHIVQPH
         +9Ir0eLlAaVQFxq1Tmbc/KNITLJAt+qHZVID1F7eQwQXafH3t624m7em+Gaz4CCgttqq
         c1+N68h4PZ5HeoEFPtOR11Aw0+TamPEIsryqRFUDqJwR3HcWZc8XTq06GgrUNDJ1z6K7
         ptgk0N+iTo7TnCK/QDDz0rTk8CDEG96o/iWXg/zWejh2+qLQLoaMGyWu1zlxO/zkmgXg
         A3/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=y7slh/pNTWelLfh1FzXsOutH1+zxCT/FLHdOf8nTB6I=;
        fh=AIYNAcrfQPdTp+tiOBYg2bCy2NfWRbXD73JV9SLWbpM=;
        b=c1fnTVespxnPs3edg8bbz7d9JJhAxd2kiKiEKfXJw+F6rnVLPwcYff5p0ZS2Iks+SZ
         Z6nUK7ldyMgbeMwlxWujvLL5WkBlh4uA3eQXm/Adi+kTqv+eIR6/t/vY4oPY+bqtiGhn
         vqU9nP0FGl0V8dxPKrxA81D//uG8Chu8LXmF+/Bs5A6cGKKK1H95ARHmci4kM0v0cKxV
         3G5RneU+eicdIXssOtG/UtR4yT06hKBbwvSCwfHPkiVpJpOP3VM7a75HTRx44vzzOf5b
         9YkIsliqbSlKwvrDOk5a72ryWOl+jGywV6jRbZr/Kf5i7ToZ0TEJNlNwEHhAdOMqcbP7
         QrNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LG+hP83X;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id my16-20020a1709065a5000b009ad7f8b0605sor2717628ejc.2.2023.09.18.09.04.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 18 Sep 2023 09:04:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LG+hP83X;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695053085; x=1695657885; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y7slh/pNTWelLfh1FzXsOutH1+zxCT/FLHdOf8nTB6I=;
        b=LG+hP83XTm81HswSUgFRozHfwUW1Wq5SX4WvfggdxdMg5pJ5NJ7yMqL2Isn/dpXSgX
         vo76POjPAc/7hNNtU8xb25EscsHtWgby3ESvQ/x28DUI5jTvVHr5eSLG+w+SImYGBAY+
         UwgOpo8hLCEtMD7iar0Ah4MdgNWwTI7w1eQgN3qx7BUDqO5Qgk2j0ZEqimhdFeg+RRVk
         YBresNNUVJani2XHAVPJYTc1fhZsJgubfsHBkOJ8Ap7kBY6nlnueXZVlWJr38kJ2Sx8J
         Pug63haDUsgOhhXAcar9UOYsw63MyuWxc7OeHt9ZaJguzEqkjponGWGPCqU+yhpNqK7B
         KTvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695053085; x=1695657885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y7slh/pNTWelLfh1FzXsOutH1+zxCT/FLHdOf8nTB6I=;
        b=b/xXh8TKdng6L6S/GJ7Jn95vclYUx2AIbeTcaqJ+i5ABEdY+43xIJq5FE3qlsKQVUY
         hP2bzjHyk6iFY9VSUm6zHtbVDXLsCG/+F4e0SdHrOmCcz5Vl48ToW0rdStkPbxtLAXSG
         AdOgrFVke8bvnqM2McpAuHXYBnOJ7+WhAxK8kEMdeUAgD7UXXe1zgHK2YECvEkd40LDI
         nRUSjEBZA9+hmuAts/5SFEBXbgBs1snhoRuKOK/jfqHC7FKC5XEGU7VqWzYQSv0/WdMs
         +BFyGkfUOOcPBuUlvBunQpv9Bpl1w5oo3bYM28VavqSDC+ybP6VIhfBCdviHnoipSlkX
         6zCA==
X-Gm-Message-State: AOJu0Yya/vfF1qIXGIfTQwJjA4kKblTyKT3ns3y5/OFYBf90FJs2OCZ4
	r6ataT/LQn0Td8HTOBFcrI2nYJLf
X-Google-Smtp-Source: AGHT+IF1uzqoMGcGEAlyaETsh01GEqG5TP+8vhZBqOT31xYKgtT4aKTdO73/67eFYWfUVkYSZ8Rjqw==
X-Received: by 2002:a17:907:75f1:b0:9a5:cc73:a2a5 with SMTP id jz17-20020a17090775f100b009a5cc73a2a5mr6784701ejc.1.1695053085243;
        Mon, 18 Sep 2023 09:04:45 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id lt10-20020a170906fa8a00b009737b8d47b6sm6568567ejb.203.2023.09.18.09.04.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 18 Sep 2023 09:04:44 -0700 (PDT)
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
Subject: [PATCH 20/22] target/s390x: Use s390_realize_cpu_model() as verify_accel_features()
Date: Mon, 18 Sep 2023 18:02:53 +0200
Message-ID: <20230918160257.30127-21-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918160257.30127-1-philmd@linaro.org>
References: <20230918160257.30127-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: G4cNMHWoSfDf

s390_realize_cpu_model() checks if CPU model and definitions
are compatible with the KVM / TCG accelerators, before realizing
the vCPU. Use it directly as CPUClass::verify_accel_features()
handler (called from cpu_exec_realizefn()).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/s390x/cpu.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 1a44a6d2b2..983dbfe563 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -231,11 +231,6 @@ static void s390_cpu_realizefn(DeviceState *dev, Error **errp)
     S390CPUClass *scc = S390_CPU_GET_CLASS(dev);
     Error *err = NULL;
 
-    /* the model has to be realized before qemu_init_vcpu() due to kvm */
-    if (!s390_realize_cpu_model(cs, &err)) {
-        goto out;
-    }
-
     cpu_exec_realizefn(cs, &err);
     if (err != NULL) {
         goto out;
@@ -329,6 +324,7 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
 
     scc->reset = s390_cpu_reset;
     cc->class_by_name = s390_cpu_class_by_name,
+    cc->verify_accel_features = s390_realize_cpu_model;
     cc->has_work = s390_cpu_has_work;
     cc->dump_state = s390_cpu_dump_state;
     cc->query_cpu_fast = s390_query_cpu_fast;
-- 
2.41.0
