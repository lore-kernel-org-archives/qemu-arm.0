Received: by 2002:a05:7022:4097:b0:84:d798:3551 with SMTP id x23csp2201708dlx;
        Thu, 25 Jul 2024 07:52:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX8U0KONP57v12JZvO/vcL5c3M2BUY06mkNPtrSP3mT6tK71TYtQ9IwqRV3YpTXpg7Mf4MRyF9RGhH4dYrA4V4y1dkXlUr7
X-Google-Smtp-Source: AGHT+IHJ5oEMhbdMSgaxj/p8P8SiHYtHEzQTyoa3kD1bXm7iPM4+qYlHHoEfd2H0MZy9tBDdzIcb
X-Received: by 2002:a17:902:f54b:b0:1fc:57b7:995c with SMTP id d9443c01a7336-1fed923e7eemr27920975ad.7.1721919149379;
        Thu, 25 Jul 2024 07:52:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721919149; cv=none;
        d=google.com; s=arc-20160816;
        b=MuXhlPpD0PpQFrhosI+s7lxQcNmNEWgF9wA6VsfPr0QpZxXqMAzdsH+tyijIr9CCTo
         7CSjjmq0N6DkjrWmRX5h0D/ACMIXgTvLXVZ9KFzNv9NhTBhPicj3am1aVf0IbiRqU393
         DxorBQyiyedOM0BYXgsxMhErzH43EGNxSBcfuGZmbpzV8agHnw16dOlXAPZjc4y3UtcH
         WlwyUMYwAlu+jQLe5zc8P1Th82fyuvRdnuTwGI8sAhJaSk82MDtI9N/tDV+ZaysBiqAI
         JcBSnCKE1X169cJJ97+bi3+Jg/XYmLWfCC+SLC8Il5T6eTXIjH8AsH3/jhLUkJd++vg1
         Y5oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=n0lq2PQnVu6hd2yg5YNkC+b4RpN/9srujdZBiuaYdrE=;
        fh=HmcvjJFCe32Wwm7wEHHd5MwR/A6WXB0C0oTTNoc7amg=;
        b=QNQjRlm3L7kGaOKRaKgHmzv0LCEmySPj9UEsSQpRjK23dR1MJ1fn4w/4u84+0kY2S1
         E9VducGgv24OuSC6ppAMVFEuaDARy7phVbI/rQTXXQeWhjlKSu4PUuPapShJl2VkX3UI
         DKcHNCpVbtVBofZpMsb/COEWGfecucZsl4Zo/lezqWQs8L7xZ0ziaLLFaE5zvm0QCDBU
         p0V7gkcTxJ2raBnmxXR3T/qYArwQW8X7wLqLGtsDrbtDzz4FmePBXLyvpXbdz+2JnyG9
         Odt7dXG9YZTCXVv315bRK5S+8YfhyV7W+2bdyGUV8a0jL+XIdh1hcdIP4Y3jHWvRF45C
         pw2Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id d9443c01a7336-1fed7ca76eesi17648945ad.122.2024.07.25.07.52.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Jul 2024 07:52:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WVDMj2sYXz6HJXW;
	Thu, 25 Jul 2024 22:50:41 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id B865B140594;
	Thu, 25 Jul 2024 22:52:22 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.126.169.54) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 25 Jul 2024 15:52:05 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <mst@redhat.com>,
	<peter.maydell@linaro.org>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<richard.henderson@linaro.org>, <imammedo@redhat.com>,
	<andrew.jones@linux.dev>, <david@redhat.com>, <philmd@linaro.org>,
	<eric.auger@redhat.com>, <oliver.upton@linux.dev>, <pbonzini@redhat.com>,
	<will@kernel.org>, <gshan@redhat.com>, <rafael@kernel.org>,
	<alex.bennee@linaro.org>, <linux@armlinux.org.uk>,
	<darren@os.amperecomputing.com>, <ilkka@os.amperecomputing.com>,
	<vishnu@os.amperecomputing.com>, <karl.heubaum@oracle.com>,
	<miguel.luis@oracle.com>, <salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
	<npiggin@gmail.com>, <harshpb@linux.ibm.com>, <linuxarm@huawei.com>
Subject: [PATCH] accel/kvm/kvm-all: Fixes the missing break in vCPU unpark logic
Date: Thu, 25 Jul 2024 15:51:32 +0100
Message-ID: <20240725145132.99355-1-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.169.54]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: ZlrgogaxCf7B

Loop should exit prematurely on successfully finding out the parked vCPU (struct
KVMParkedVcpu) in the 'struct KVMState' maintained 'kvm_parked_vcpus' list of
parked vCPUs.

Fixes: Coverity CID 1558552
Fixes: 08c3286822 ("accel/kvm: Extract common KVM vCPU {creation,parking} code")
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <CAFEAcA-3_d1c7XSXWkFubD-LsW5c5i95e6xxV09r2C9yGtzcdA@mail.gmail.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 accel/kvm/kvm-all.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 0aa4b4624a..c181297f00 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -362,6 +362,7 @@ int kvm_unpark_vcpu(KVMState *s, unsigned long vcpu_id)
             QLIST_REMOVE(cpu, node);
             kvm_fd = cpu->kvm_fd;
             g_free(cpu);
+            break;
         }
     }
 
-- 
2.34.1
