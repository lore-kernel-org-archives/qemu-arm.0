Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2487541lfy;
        Thu, 30 Jul 2020 04:57:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXI7ux8V7chwO2UImH9QZu3YjTGbHGIosQDguEdUuN1p8/2SHXLPjUyEAi0q+87UIye7U+
X-Received: by 2002:a25:44d4:: with SMTP id r203mr3957117yba.500.1596110275020;
        Thu, 30 Jul 2020 04:57:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596110275; cv=none;
        d=google.com; s=arc-20160816;
        b=jAxir1Mt1MzLlk4+2i47dc2cKtWB6L80RQmn5P10VBtVEw90hWgExKVk2kBxC8NKuU
         znEVBDs5TkvXpgyohoCNOF3eZgaMei2/Hdj6iWrBsM/1NOfmjBVfYNaMReQsJjSsGCNb
         Ymh9XG63c7M0uuTeS49tUA01/F5Aj8+m35SQN814DsAWlDnVydZoau1jDWfMJ4rEu8v8
         LJo1BrL4PFezBcuWEHNNCNQlWn37ldkupP9lR/SyVuo2GDM0FIQlA5tMeXYZa2ZM5SB8
         4wFo7CTGi6Rz0njNZQXwL0T4O84hq6trC2t6XUafdkEsYdAmOY/1XE4RhlSyPVqIHE/G
         MHVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=STungQJmlA8IyqaVGEATw6JgOCe5S4uMAb07lVPwK9Q=;
        b=jFWFdohmD0uBPQL6LPAiKJb1Fj1MUAWs6yks9Uc0cF0Uukj+eLvgDCvOeJn750XwcL
         3wwfcEkQBic2/1O/AOYqauYV8QGdfs4Nbs5zmeb64yz+4IbNnLYkUdGeBp5iwIpnpGJl
         k4SXttQT5+AAOBliQwCfp9mf0LdJrD8rXHzbYbhYhzAh6so/rbfSjwemNWbd/c0ysC/N
         ERigDIHGq2XJbX0e20WZ4ypxgE2NxW3HV/I5Gq5Mlb47U2xsJJBMnYYjMvRa7o9hkKUo
         5kBOf0QwtDz6w15wqHtdj0lqNsMivg7cY8U+A42ewE6aV9NBaI7ggBqAs2azcUITfvIa
         PMpg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i75si4882307yba.287.2020.07.30.04.57.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jul 2020 04:57:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k17C6-0004Pf-DQ
	for alex.bennee@linaro.org; Thu, 30 Jul 2020 07:57:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <likaige@loongson.cn>)
 id 1k17Bt-0004OE-PP; Thu, 30 Jul 2020 07:57:41 -0400
Received: from mail.loongson.cn ([114.242.206.163]:45578 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <likaige@loongson.cn>)
 id 1k17Br-0001Xo-8H; Thu, 30 Jul 2020 07:57:41 -0400
Received: from bogon.localdomain (unknown [113.200.148.30])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxv96ptSJfp4YCAA--.157S2;
 Thu, 30 Jul 2020 19:57:29 +0800 (CST)
From: Kaige Li <likaige@loongson.cn>
To: "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 1/2] virtio-mem: Change PRIx32 to PRIXPTR to fix compile
 error.
Date: Thu, 30 Jul 2020 19:57:27 +0800
Message-Id: <1596110248-7366-1-git-send-email-likaige@loongson.cn>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxv96ptSJfp4YCAA--.157S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw4ktr4Dtw4rWF4UJw1fZwb_yoW8GFyDpa
 n7Jrn5uw4UZr17Aan5XFyru34UCwn3GrnrtF4Iq34kWFs8u3sFgr4qkrnYgFW7Zr98Zw43
 uryfWrWYq3Z8Zw7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkm14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26F4j6r4UJwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8
 KwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r
 1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij
 64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr
 0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6Fyj6rWUJwCI42IY6I8E87Iv67AKxVW8JVWxJwCI
 42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUYT5dDUUUU
X-CM-SenderInfo: 5olntxtjh6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=likaige@loongson.cn;
 helo=loongson.cn
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/30 07:18:51
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Kaige Li <likaige@loongson.cn>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gfPVz8dtAgdD

When I compile qemu with such as:

git clone https://git.qemu.org/git/qemu.git
cd qemu
git submodule init
git submodule update --recursive
./configure
make

There is error log:

/home/LiKaige/qemu/hw/virtio/virtio-mem.c: In function ‘virtio_mem_set_block_size’:
/home/LiKaige/qemu/hw/virtio/virtio-mem.c:756:9: error: format ‘%x’ expects argument of type ‘unsigned int’, but argument 7 has type ‘uintptr_t’ [-Werror=format=]
         error_setg(errp, "'%s' property has to be at least 0x%" PRIx32, name,
         ^
cc1: all warnings being treated as errors
/home/LiKaige/qemu/rules.mak:69: recipe for target 'hw/virtio/virtio-mem.o' failed

So, change PRIx32 to PRIXPTR to fix this.

Signed-off-by: Kaige Li <likaige@loongson.cn>
---
 hw/virtio/virtio-mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index c12e9f7..3dcaf9a 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -753,7 +753,7 @@ static void virtio_mem_set_block_size(Object *obj, Visitor *v, const char *name,
     }
 
     if (value < VIRTIO_MEM_MIN_BLOCK_SIZE) {
-        error_setg(errp, "'%s' property has to be at least 0x%" PRIx32, name,
+        error_setg(errp, "'%s' property has to be at least 0x%" PRIXPTR "\n", name,
                    VIRTIO_MEM_MIN_BLOCK_SIZE);
         return;
     } else if (!is_power_of_2(value)) {
-- 
2.1.0

