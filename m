Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp810119wrh;
        Fri, 3 May 2019 10:15:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyaJ95PBmZiBNZn2JDzzdP4hP8JEuAmmOL2iYruSpD3UKDAfQdTW93w/IT4nNs4qyy3zo9y
X-Received: by 2002:a5d:434c:: with SMTP id u12mr1772076wrr.92.1556903701828;
        Fri, 03 May 2019 10:15:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556903701; cv=none;
        d=google.com; s=arc-20160816;
        b=fCaJUj+UY5NekhKFW9ImHYaAs7+8hMUSCjX5c0NRpuK0aRNQ7f2/Hjoj9t8E/HOWbY
         9FlmgMjBBGoyOsXChNMllE3uIjY0tfe1+UrSdOirVI4xi+he7xC/JPsRhUy1MmnCX4Gf
         MO9vjniQIqBHN1bZx/yogiD1GTcbgNQ4aE421ZC2t7okSFWmkTqfdgr8Z84k//JAYrKY
         qEDyBz5yg1E9WKdqHtDmLNFcF2sEQLRLRjPPjwaLgruRjlf3glg5N27N8jwgqPKzJtG5
         dyYfx3u/Rna+k/ZZDYekwuLT6JoWmsTAkSLmt4+DpkfUfI0q/JPxbfANxkwdInaigwpZ
         XJOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=CbKBa4cG438327f413qupTHJRviSCiHEjt9FaRlZ34A=;
        b=N7ghEHSWa4QmiAkHe7/3sjW+c66/UY3rcXsbMqyFWp18f9ZwEwsxQuAJzA/XEo6En6
         3IC/uzXDEdB1/Jht5AfcNv6CvyYte2lLJaisIJagfHaNT/1E8YoTC/XEYnqOIFF2+X/W
         xStI440TpRO/vDulE53cL27zyMb3Vy6N59ZF6xWHqEpl6yN9UdfT5pbr6U8sj3wClGnZ
         DOqmRjUN+OhGy6+Ht84y0pfzaxSexZ2UJTXrYA5zxP3wYRekAbYMoKRRiW5bmXpr3NlH
         JUKjL4p5SNo0rMs26qYqiE3IUZ+Ag2Ke+wQNm632IuF9kcoJOc5EdXok0J0nu5TL5vCb
         henA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="adGp/arE";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j10si1606463wmh.183.2019.05.03.10.15.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 May 2019 10:15:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="adGp/arE";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:44895 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hMbm0-0007gZ-Pg
	for alex.bennee@linaro.org; Fri, 03 May 2019 13:15:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34145)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hMbkx-0006cV-0Y
	for qemu-arm@nongnu.org; Fri, 03 May 2019 13:13:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hMbkv-00015J-Sm
	for qemu-arm@nongnu.org; Fri, 03 May 2019 13:13:55 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:55273)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hMbkv-00014d-Lb
	for qemu-arm@nongnu.org; Fri, 03 May 2019 13:13:53 -0400
Received: by mail-wm1-x343.google.com with SMTP id b10so7974157wmj.4
	for <qemu-arm@nongnu.org>; Fri, 03 May 2019 10:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=CbKBa4cG438327f413qupTHJRviSCiHEjt9FaRlZ34A=;
	b=adGp/arElBmgP9cdgnynjQi4RUkwLIUOgOWhpZ0nbdDlbtyp6xC8A7NR9qB8uA+kvY
	yC8bDtRL/AEXmgwqmRuPr2s+kHU7KYeQr/DEZO6qtNQBWylXoht2frUHTDJDBZxWpupB
	ZBRa1wCWtjVUdkq2r13Xd9pVVIrZp6IG0182c25A03CYekEcBvY61Lpx9MznyxQhTdOD
	4yEbGFcDiOleAR2ajXctQAlOJk69fqdcjwvkm9GbEJqwuSvzTIgcTpDQcVL5a0ewAnd4
	VQmeit6XBXAwDn2FkqSVIt/PBX/T2U7WJVj5hCV6iKNjtfP1dC7qjGaiDZCgeWq5E8cH
	duWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=CbKBa4cG438327f413qupTHJRviSCiHEjt9FaRlZ34A=;
	b=R7xDXrIW9BoT2UnH/iRwdVsc1WGUy/BMDWRMg5g/06jM5RI2V8kXfuUXyCnjgPfvLv
	q0boW1QQASuLL3d1cgpwPt5GLIP93I1BhwfcchfFStNFA/HZUmTbMeI/rkTuobaqTMCC
	yG8uUmNJVHeWhStUrAROK4hIGHiLsAM+PaxQoH11h50w705ksOsp5hr8S9UoTExHW2mK
	3MjnO39uyxPQQWg/Clvu5Zx9cN2USSA8sVHm7rTI21ljx7uos6JyH9UrdWkz22KAlhRv
	SRQSRR0cp2AUSOoKTg50QKKpYGGO2pw2Uue1L5pBdXNEUDJySN1TS2fBXKKVGDPBy36o
	QOeg==
X-Gm-Message-State: APjAAAXb9rIw/3JEJ2bL6S21ZgFVX3ucUvJMzRtOa9Sc2n2g/pl1Y9+w
	3Dtg1vDj1RUJxHk/gR+zGn9N6k8gUw0=
X-Received: by 2002:a7b:c353:: with SMTP id l19mr6743602wmj.12.1556903632582; 
	Fri, 03 May 2019 10:13:52 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id e5sm1717671wrh.79.2019.05.03.10.13.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 May 2019 10:13:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  3 May 2019 18:13:47 +0100
Message-Id: <20190503171347.13747-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190503171347.13747-1-peter.maydell@linaro.org>
References: <20190503171347.13747-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: [Qemu-arm] [PATCH 2/2] hw/arm/boot: Honour image size field in
 AArch64 Image format kernels
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 770uRdRU0XE8

Since Linux v3.17, the kernel's Image header includes a field image_size,
which gives the total size of the kernel including unpopulated data
sections such as the BSS). If this is present, then return it from
load_aarch64_image() as the true size of the kernel rather than
just using the size of the Image file itself. This allows the code
which calculates where to put the initrd to avoid putting it in
the kernel's BSS area.

This means that we should be able to reliably load kernel images
which are larger than 128MB without accidentally putting the
initrd or dtb in locations that clash with the kernel itself.

Fixes: https://bugs.launchpad.net/qemu/+bug/1823998
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/boot.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 7c978fedde4..34bdd151df8 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -910,6 +910,7 @@ static uint64_t load_aarch64_image(const char *filename, hwaddr mem_base,
                                    hwaddr *entry, AddressSpace *as)
 {
     hwaddr kernel_load_offset = KERNEL64_LOAD_ADDR;
+    uint64_t kernel_size = 0;
     uint8_t *buffer;
     int size;
 
@@ -937,7 +938,10 @@ static uint64_t load_aarch64_image(const char *filename, hwaddr mem_base,
          * is only valid if the image_size is non-zero.
          */
         memcpy(&hdrvals, buffer + ARM64_TEXT_OFFSET_OFFSET, sizeof(hdrvals));
-        if (hdrvals[1] != 0) {
+
+        kernel_size = le64_to_cpu(hdrvals[1]);
+
+        if (kernel_size != 0) {
             kernel_load_offset = le64_to_cpu(hdrvals[0]);
 
             /*
@@ -955,12 +959,21 @@ static uint64_t load_aarch64_image(const char *filename, hwaddr mem_base,
         }
     }
 
+    /*
+     * Kernels before v3.17 don't populate the image_size field, and
+     * raw images have no header. For those our best guess at the size
+     * is the size of the Image file itself.
+     */
+    if (kernel_size == 0) {
+        kernel_size = size;
+    }
+
     *entry = mem_base + kernel_load_offset;
     rom_add_blob_fixed_as(filename, buffer, size, *entry, as);
 
     g_free(buffer);
 
-    return size;
+    return kernel_size;
 }
 
 static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
-- 
2.20.1

