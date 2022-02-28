Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp1810503lfq;
        Mon, 28 Feb 2022 06:07:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJya/UnQPGmLHUvAva8OFJJm26oR9lBG14jz/zPIyAt2CqWHIdAQ6dyxKSD/hFmDioAqPeN1
X-Received: by 2002:a05:6122:8ca:b0:332:64b4:8109 with SMTP id 10-20020a05612208ca00b0033264b48109mr8001881vkg.7.1646057276456;
        Mon, 28 Feb 2022 06:07:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646057276; cv=none;
        d=google.com; s=arc-20160816;
        b=HzabY62ODuKxOqube5JyFhHlb39GWQTfFvNhU2lDbPriSgilx1FD61DTI5FbRuCC60
         l5+lG7toLsB2IMqGAr6a6jcg3DeIwbGMqWbJuL5yl3iYsdrZh/+SwETvlYeMnH7egOOh
         dzZtZS3xeM5vmt/uzxU+sc5WTSlzEE7391pxJlPa+kEvuSFkFdYOFSjBVh8h5q0pSFWp
         0rF4GhPbGWDt1f/lsYuJCOgo+8vVUGbx7zvm4yhmxjmCgiGngd1S1To0kb1TOc63/ReK
         YgguTlhxstBFS0QVG2a1lLdnOz1aXvsjuBCyfO5xKevb010CEQsQm8LYjS8FJQQySwFM
         peLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:to:message-id:mime-version:subject:date
         :from;
        bh=cdSV8LLu7QorOfan8RB3mFDUNqcQu/uue8rClgcdgjc=;
        b=sPwmYMBpWN2MnxCwOA5woi1pNHUjErLgeYP4q132LWCIoDMYP40dpW+I3+iVM3DlyH
         rTATDbJTPKbIfjIcZcuBqlY7wOtX3EejKHWLDE/2IZ7/CgrF5JQ535YKyHEt2WRazeBs
         UitQt1vVVvjJTTuIUVS9KVOeCzvMBvifbY6/RyVFfGXlb8nbHuwXwcB5GyTZUokhJ0Cn
         SnncJIJrCCNTFKh6OCO4aSDELB8dz6npas6Br8DRSBbWCWKDkoL/jku8K1JO3ZQiIaJO
         LLW+t68614tVX7hjwtDW7ALC1/cGaxrFZvmZVbMniwmEk9LoSSfG7iW5BjtxTOkgf42O
         cUSA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g18-20020a67dc92000000b0031bfd262cecsi633637vsk.276.2022.02.28.06.07.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Feb 2022 06:07:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1]:52618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nOggt-0007bj-RM
	for alex.bennee@linaro.org; Mon, 28 Feb 2022 09:07:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nOZn6-0001Yc-2z; Mon, 28 Feb 2022 01:45:52 -0500
Received: from mail-b.sr.ht ([173.195.146.151]:58192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nOZn2-0003IL-Iv; Mon, 28 Feb 2022 01:45:51 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id A8B8311EEDB;
 Mon, 28 Feb 2022 06:45:45 +0000 (UTC)
From: ~ubzeme <ubzeme@git.sr.ht>
Date: Mon, 28 Feb 2022 06:45:45 +0000
Subject: [PATCH qemu 0/7] Many improvements to HVF memory-related codes
MIME-Version: 1.0
Message-ID: <164603074537.20094.1732342403585879912-0@git.sr.ht>
X-Mailer: git.sr.ht
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_REPLYTO=2.095,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 28 Feb 2022 09:07:21 -0500
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: ~ubzeme <ubzeme@gmail.com>
Cc: Yan-Jie Wang <ubzeme@gmail.com>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BH7NKG10lr3N

I recently bought a Mac with M1 Pro chip, and use QEMU to setup a Linux
virtual machine.  QEMU crashed when I started a VM with HVF accelerator
enabled and with the device, bochs-display, added.

After digging into the source code, I found that dirty-tracking in HVF
did not work properly, which made QEMU crashed. Therefore I made this
series of patches to fix the problem.

Followings are the summary of the changes that these patches make:
 1. Move HVF memory-related functions and codes into a new file
    hvf-mem.c
 2. Simplify the logics of adding and removing memory regions in HVF
    memory listener
 3. Fix HVF dirty-tracking logics for both Intel and Apple Silicon Macs
 4. Use GTree and dynamically-allocated structures to store HVF memory
    slots instead of fixed-size arrays. This makes memory slots more
    scalable. It is inspired by the recent changes in Linux kernel
    (v5.17) that use red-black trees instead of arrays to store
    in-kernel KVM memory slots.
 5. Add a lock to protect the data structures of HVF memory slots

Patches have been tested on Apple Silicon Macs and Intel Macs.

Yan-Jie Wang (7):
  hvf: move memory related functions from hvf-accel-ops.c to hvf-mem.c
  hvf: simplify data structures and codes of memory related functions
  hvf: use correct data types for addresses in memory related functions
  hvf: rename struct hvf_slot to HVFSlot
  hvf: fix memory dirty-tracking
  hvf: add a lock for memory related functions
  hvf: use GTree to store memory slots instead of fixed-size array

 accel/hvf/hvf-accel-ops.c | 221 +-------------------------
 accel/hvf/hvf-mem.c       | 318 ++++++++++++++++++++++++++++++++++++++
 accel/hvf/meson.build     |   1 +
 include/sysemu/hvf_int.h  |  18 +--
 target/arm/hvf/hvf.c      |   5 +
 target/i386/hvf/hvf.c     |  25 +--
 6 files changed, 334 insertions(+), 254 deletions(-)
 create mode 100644 accel/hvf/hvf-mem.c

-- 
2.34.1
