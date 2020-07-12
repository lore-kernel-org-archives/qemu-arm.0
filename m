Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2630222lfm;
        Sun, 12 Jul 2020 11:37:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8uXS/Q5NkzyTxTvAcFa85k/ux5MriW/y8Ows9UDoYdEd/aj2rP0VR5Knrkck/h5FLIWTG
X-Received: by 2002:a25:8b05:: with SMTP id i5mr124971417ybl.301.1594579055190;
        Sun, 12 Jul 2020 11:37:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594579055; cv=none;
        d=google.com; s=arc-20160816;
        b=upXh43JReji5VAWAxv5o7zN7ZeaL19tDs+Sn0HmTZNB6c7c3eofQK2RKUipBApeXUx
         GYPZ6FmsPcwexvJPZgzM9VBo4GAzMZRC4vNSg2LyqDWBKAWa95+tgjQSWVC4ST1nEVP3
         +Fb5cOavmDfKf4cCuK3146zstS8wPBrgWL71jgLdZfEntc/WA/rUXMQVt8pkH019B+xb
         sI22Gpg1772gqvQHpYpK2tnCXSKdzocyLltLoHDI7vUEt7dvCaaggs1MElV0I+zz2IJo
         0Vunl9JkbWXvqhx2+EMyRik6BAqNpaMYNhDD9gHm/bx4jQgoVOBs8XHeR5Q3/RiRYX+g
         30JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=uYh31q18n0yhSjGPF3WvIufvZ+mvdDfDZdJIQvzgChk=;
        b=hnBrNkbIGs/SQ6kEVazyTl+qcRmxpWl4GL4EaP0OrNMKDUIjC9RyLNUTBJcxiqhNtV
         I99pTx3ZBVAxVnQ9/oy6kfOl4Y/vuffUWNtqLndPYrUXYpllZW/TtokE7rlRCNWqhTxc
         g5qW4xFrjsYrGG2Wiy8oRp+gQF1NfFImkofntj59RzQ8UXkcq6W25DeX/6x/ZPUjmWtM
         xl+6cvO0i2u1A9YiRrsiYvCtII72TspJMj5w7b2bT9cBP3lnrJ2VvDn0fSwz8JdYnA02
         DeoduVISEsl2t/uooKAFOC2J1m19wk5bWtmcu2xCOFJby6PvabfKOhJ5VMOm1B3gMIUH
         rZGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=A59dvRbO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o189si12154776ybc.59.2020.07.12.11.37.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Jul 2020 11:37:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=A59dvRbO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jugr0-0007Fu-Kk
	for alex.bennee@linaro.org; Sun, 12 Jul 2020 14:37:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1jugqm-0007BE-0W; Sun, 12 Jul 2020 14:37:20 -0400
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:45150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1jugqk-0007gU-9T; Sun, 12 Jul 2020 14:37:19 -0400
Received: by mail-ej1-x644.google.com with SMTP id a1so12358371ejg.12;
 Sun, 12 Jul 2020 11:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uYh31q18n0yhSjGPF3WvIufvZ+mvdDfDZdJIQvzgChk=;
 b=A59dvRbOpFxQCuMLxQ5ZrdarROSgpMonGWew5d6DwaFK6wBURVPAMmNlD/eCmj6aT0
 DFU0tgiXkxzXv/ZmJ7BCkGX5DDiSvj79ancyWqK9mLig+TJvA12s1VOty6u9RLQNcMUY
 YrmYKIJgslmvR43W9zX09bR4vlZr9bcHf/uwJbUJRSq4mNMXSRnN2NFRDFh6gt+HaUYp
 UlW+szaB9F0T6rZtw/vauXDN8++TzKF1dqh/cg8gjuAdHmoTTPdSTKYoSteFW053LgFY
 vThJEiK4u3WJrpzO5YT+mVmAuVlO58GyCQGlC1EpAzd5iHoxz0ANsYwtYAVkktIVH/fS
 RWgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uYh31q18n0yhSjGPF3WvIufvZ+mvdDfDZdJIQvzgChk=;
 b=KyLS8ESxDbxLg5u051FcSSdhgTUc2vMcYinDMq2DLSs5d+9th/YmBRHtkVGpfm/xrR
 yosnMMT7I7s3yQcAg7aZFxZhkFlXz0jP6SlSyMgzD9vk8A9d4tNofMbs/+zDQsLViS4P
 3OeGsRrQmEHJ3DoemqQYbU3Gh2N3tg0Z+KoX6goiPxNq6mig9Kn1A2CnCW3tfwC2Z1UK
 8/7HYuiSzDJjKkHsKcf1tEIIucLsyMeWAysYJitgg+9FT4oc0dp+HLy660rQdmo2WuyZ
 /ESd108sNYLbqvS8zfAQfgN0Ckq9HyBRHhpZApieOpX9JjbDLloXruOOx3207OBwv1pe
 fh5A==
X-Gm-Message-State: AOAM531zSBdmMUaqc4WMNiJp28yp14n4TMDX8+xguTA8Kp32jnHWEqnP
 nehOy3kUrEQeGDnbtD67lgl5z8j2c8g=
X-Received: by 2002:a17:906:d78f:: with SMTP id
 pj15mr74497612ejb.283.1594579035521; 
 Sun, 12 Jul 2020 11:37:15 -0700 (PDT)
Received: from tuf.home ([2a02:a456:6be8:1:8915:e711:6eb4:bfca])
 by smtp.gmail.com with ESMTPSA id be2sm9549347edb.92.2020.07.12.11.37.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jul 2020 11:37:14 -0700 (PDT)
From: Niek Linnenbank <nieklinnenbank@gmail.com>
To: qemu-devel@nongnu.org,
	philmd@redhat.com,
	f4bug@amsat.org
Subject: [PATCH] docs/system/arm/orangepi: add instructions for resizing SD
 image to power of two
Date: Sun, 12 Jul 2020 20:37:08 +0200
Message-Id: <20200712183708.15450-1-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-ej1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, Niek Linnenbank <nieklinnenbank@gmail.com>,
 qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xIKczeLBavJA

SD cards need to have a size of a power of two. This commit updates
the Orange Pi machine documentation to include instructions for
resizing downloaded images using the qemu-img command.

Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
---
 docs/system/arm/orangepi.rst | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/docs/system/arm/orangepi.rst b/docs/system/arm/orangepi.rst
index c41adad488..6f23907fb6 100644
--- a/docs/system/arm/orangepi.rst
+++ b/docs/system/arm/orangepi.rst
@@ -127,6 +127,16 @@ can be downloaded from:
 Alternatively, you can also choose to build you own image with buildroot
 using the orangepi_pc_defconfig. Also see https://buildroot.org for more information.
 
+When using an image as an SD card, it must be resized to a power of two. This can be
+done with the qemu-img command. It is recommended to only increase the image size
+instead of shrinking it to a power of two, to avoid loss of data. For example,
+to prepare a downloaded Armbian image, first extract it and then increase
+its size to one gigabyte as follows:
+
+.. code-block:: bash
+
+  $ qemu-img resize Armbian_19.11.3_Orangepipc_bionic_current_5.3.9.img 1G
+
 You can choose to attach the selected image either as an SD card or as USB mass storage.
 For example, to boot using the Orange Pi PC Debian image on SD card, simply add the -sd
 argument and provide the proper root= kernel parameter:
@@ -213,12 +223,12 @@ Next, unzip the NetBSD image and write the U-Boot binary including SPL using:
   $ dd if=/path/to/u-boot-sunxi-with-spl.bin of=armv7.img bs=1024 seek=8 conv=notrunc
 
 Finally, before starting the machine the SD image must be extended such
-that the NetBSD kernel will not conclude the NetBSD partition is larger than
-the emulated SD card:
+that the size of the SD image is a power of two and that the NetBSD kernel
+will not conclude the NetBSD partition is larger than the emulated SD card:
 
 .. code-block:: bash
 
-  $ dd if=/dev/zero bs=1M count=64 >> armv7.img
+  $ qemu-img resize armv7.img 2G
 
 Start the machine using the following command:
 
-- 
2.25.1

