Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp2339411njb;
        Tue, 15 Oct 2024 03:06:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXHCZKRJ0mGN93Zsq65Up1Xg5hulSMEO/CsosNonclnLyeDOJbRgWkYMeOw5Uar4DXBJs8fLrGEys4YwQ==@linaro.org
X-Google-Smtp-Source: AGHT+IH3x+zuwrex9xdVPbwCEU3uwS4VsGj0pZkT0EpAFfIW6MxWAfp0uQyYuSqWUWRCgejA0hAs
X-Received: by 2002:a05:6512:3b97:b0:539:fb49:c47a with SMTP id 2adb3069b0e04-539fb49c66dmr2927747e87.4.1728986785625;
        Tue, 15 Oct 2024 03:06:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728986785; cv=none;
        d=google.com; s=arc-20240605;
        b=OMV9tY3crwKwWj9elfdg58FiR36WQm6HtQyx2piNt1mbDvgbPq8Kl0etsWoWP97Q0J
         a7zwlP8NgU45/EQvCMmN4nf7zLCKt/W3+QCKmdioLTYeEhdPC4LOYib1gHlABHAMkMB0
         IJ2MesgAdsT7/gAMl+JxPVS4/7AzPUZurqcd5Aq+2ovc82Ogh1rg80ucG/l08FT/xJTA
         64oZi3pqYGOi1CP5CyLErDA18sj8PzCBkkN4R2XNrrF7Al/fSgjiuwg/yNxYHLxZxasD
         qIbtN0knH18uWBy1oanm0YQ95lUgy156N8EkzyK5uPatGqrOjmuOXb50BDqZiGF7i2WB
         9dMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=K7YoyyeYUfKRTrROgt0aMhAsqrXlzPVrRlGaDuDi0Tc=;
        fh=f7aqOn0Aylihzqer4hTA2kHSEaA8DU6KE1VFtniI5w4=;
        b=WIA8vBX20Fia8710bIEznU+22n+fb8Hr2eTkrlZPVKQYBsumMi16dhrLYDHArOLkxv
         EdZqHpcfX+5qY0W/JvFLMLLwVXc3zoo5MHtrftHrUcxFfC/TAFu3YYI33aFnAq98Gum3
         YFxVvV6gJchsS0ZRbdwkKq8v9g3XPmpruIQsxK9M76Be7WthXxkC7qq/2i5BOkMrGqZE
         vhmamDHS8B3i4pfBJTtHJx2sk/Hsya/X3NMYjar7E3rzrgh8xOdCZNZwXCXWRdE2k603
         8bYQ5ZaeAqKDi5saW5sNf77TNQwBiOtHMvgnKvGL2KN5s6LWcAEEbxGQvUkn1elhYAAl
         SmMg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-4313f6c5a08si5488275e9.156.2024.10.15.03.06.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2024 03:06:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XSV9B3Nnqz6K977;
	Tue, 15 Oct 2024 18:05:50 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id 994881404F5;
	Tue, 15 Oct 2024 18:06:24 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.48.146.149) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 15 Oct 2024 12:06:04 +0200
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <mst@redhat.com>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <peterx@redhat.com>, <eric.auger@redhat.com>,
	<will@kernel.org>, <ardb@kernel.org>, <oliver.upton@linux.dev>,
	<pbonzini@redhat.com>, <gshan@redhat.com>, <rafael@kernel.org>,
	<borntraeger@linux.ibm.com>, <alex.bennee@linaro.org>, <npiggin@gmail.com>,
	<harshpb@linux.ibm.com>, <linux@armlinux.org.uk>,
	<darren@os.amperecomputing.com>, <ilkka@os.amperecomputing.com>,
	<vishnu@os.amperecomputing.com>, <karl.heubaum@oracle.com>,
	<miguel.luis@oracle.com>, <salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
	<shahuang@redhat.com>, <zhao1.liu@intel.com>, <linuxarm@huawei.com>,
	<gustavo.romero@linaro.org>
Subject: [PATCH RFC V5 16/30] target/arm: Force ARM vCPU *present* status ACPI *persistent*
Date: Tue, 15 Oct 2024 10:59:58 +0100
Message-ID: <20241015100012.254223-17-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241015100012.254223-1-salil.mehta@huawei.com>
References: <20241015100012.254223-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.146.149]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: GSP7K4deyTg6

The ARM CPU architecture does not permit changes to CPU presence after the
kernel has booted. This is an immutable requirement from ARM and represents a
strict architectural constraint [1][2].

The ACPI update [3] reinforces this by specifying that the `_STA.Present` bit
in the ACPI specification cannot be modified once the system has booted.
Consequently, the firmware, ACPI, and QEMU must provide the guest kernel with a
persistent view of the vCPUs, even when they are not present in the QOM
(i.e., when they are unplugged or have yet to be plugged into the QOM after the
kernel has booted).

References:
[1] KVMForum 2023 Presentation: Challenges Revisited in Supporting Virt CPU Hotplug on
    architectures that don’t Support CPU Hotplug (like ARM64)
    a. Kernel Link: https://kvm-forum.qemu.org/2023/KVM-forum-cpu-hotplug_7OJ1YyJ.pdf
    b. Qemu Link:  https://kvm-forum.qemu.org/2023/Challenges_Revisited_in_Supporting_Virt_CPU_Hotplug_-__ii0iNb3.pdf
[2] KVMForum 2020 Presentation: Challenges in Supporting Virtual CPU Hotplug on
    SoC Based Systems (like ARM64)
    Link: https://kvmforum2020.sched.com/event/eE4m
[3] Check comment 5 in the bugzilla entry
    Link: https://bugzilla.tianocore.org/show_bug.cgi?id=4481#c5

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 target/arm/cpu64.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index d2f4624d61..c2af6a28f5 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -797,6 +797,13 @@ static void aarch64_cpu_initfn(Object *obj)
 
     /* TODO: re-check if this is necessary still */
     cs->thread_id = 0;
+    /*
+     * To provide the guest with a persistent view of vCPU presence, ACPI may
+     * need to simulate the presence of vCPUs even when they are not present in
+     * the QOM or are in a disabled state. This flag is utilized during the
+     * initialization of ACPI hotplug state and during vCPU hot-unplug events.
+     */
+    cs->acpi_persistent = true;
 }
 
 static void aarch64_cpu_finalizefn(Object *obj)
-- 
2.34.1
