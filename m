Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2183707lfy;
        Wed, 29 Jul 2020 20:53:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeMv407r7MBmIKrW+uT2fWS0WCraFsqFaX3GQUaBBDLC7np69hS3VC8wzQyfSe5Bjf3dIP
X-Received: by 2002:a25:ae8c:: with SMTP id b12mr1844705ybj.113.1596081229031;
        Wed, 29 Jul 2020 20:53:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596081229; cv=none;
        d=google.com; s=arc-20160816;
        b=NL8oPOV/MZwe3sq3oDyWll55MZ5dtOi3deoagwg+1D926Gxfb7oQMsEHtZ6NCKTYhN
         VEwXfGTBI53vr77eycqWGXlqqu/w7lrLRlO2gdqB/n+RGPgbeA/AgeJd7tr3szJCzAQ/
         kuseFrjIcFqQtZbN4g86BFGrcEd+tI4dnKvpOUVrvmRkbScsajtXuYQlGkKxuCH9BXQM
         gza6MVojvB0S/4nkDnFBGMADpi+fRQERmSyGL3mxO22dluR+pzwzrSKCwVTJPa0zNOOW
         7r2dYw+gGV9Yr96fe6Vt7QGv66YxJoKLapmgRhXdfYu+qvsGPhVPugZmCKp5hjeOXVff
         /Okg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=STungQJmlA8IyqaVGEATw6JgOCe5S4uMAb07lVPwK9Q=;
        b=iSb9b1tIMWCxeIF2Qmgkg/5jHFn9WMIribMZu2eCIc5YrrE+TslKGFPH8On0CLEAzQ
         cgV80La4T+BVSRGQiu4yglBAIrca2Tle4dtqf+vUyAmvDsKF0vTI3e+Z9iLQMkD139/c
         6q31l0zlH3UpjO6Rni4akbdGyqBzNaRmCpoI5Bl+w7V6GBAQamMlQ4sTqOUBHQHYWcZa
         /OdpWM418ybEzkkQ/9TqJHcxCtWrJ+hcdntgY0qdUEnN+9JKDQba/WMo52ZpSNd+mlzU
         UebH/lr0EmNTT3yOccOuW/OsBSM+f5asfmJsOA6kXAkCexRwbypfOk5Aa3MHbsbWMt9O
         UguQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j188si3748833ybj.477.2020.07.29.20.53.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jul 2020 20:53:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k0zdc-0001T7-Co
	for alex.bennee@linaro.org; Wed, 29 Jul 2020 23:53:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <likaige@loongson.cn>)
 id 1k0xoG-0004fG-Rw; Wed, 29 Jul 2020 21:56:40 -0400
Received: from mail.loongson.cn ([114.242.206.163]:38550 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <likaige@loongson.cn>)
 id 1k0xoE-0005kz-Hp; Wed, 29 Jul 2020 21:56:40 -0400
Received: from bogon.localdomain (unknown [113.200.148.30])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxmMTHKCJffFACAA--.233S2;
 Thu, 30 Jul 2020 09:56:24 +0800 (CST)
From: Kaige Li <likaige@loongson.cn>
To: David Hildenbrand <david@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 1/2] virtio-mem: Change PRIx32 to PRIXPTR to fix compile error.
Date: Thu, 30 Jul 2020 09:56:21 +0800
Message-Id: <1596074182-4920-1-git-send-email-likaige@loongson.cn>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxmMTHKCJffFACAA--.233S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw4ktr4Dtw4rWF4UJw1fZwb_yoW8GFyDpa
 n7Jrn5uw4UZr17Aan5XFyru34UCwn3GrnrtF4Iq34kWFs8u3sFgr4qkrnYgFW7Zr98Zw43
 uryfWrWYq3Z8Zw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyE14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
 4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
 Yx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
 WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij
 64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x
 8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE
 2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42
 xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIE
 c7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUbrMaUUUUUU==
X-CM-SenderInfo: 5olntxtjh6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=likaige@loongson.cn;
 helo=loongson.cn
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/29 21:56:29
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 29 Jul 2020 23:53:37 -0400
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
X-TUID: vnFvIO5ju0H+

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

