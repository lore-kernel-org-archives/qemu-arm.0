Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp225909lfg;
        Wed, 17 Mar 2021 02:29:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDUU5utBQUrkiyB4L9eHhfG9renIXCM5x2QXOK30/ho7nacmDQMWwvu8bJHoNHObzX083Q
X-Received: by 2002:a25:a447:: with SMTP id f65mr3516286ybi.82.1615973344323;
        Wed, 17 Mar 2021 02:29:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1615973344; cv=none;
        d=google.com; s=arc-20160816;
        b=QL6jYvNbj0qS0yJy4bPYPqblR8QTbYO1BoBOGatoedO0p+yIsCAGfgxcpPztxeHnnb
         fscwvNfXH8A9vrL9brjHHKB6jANmPX38IE256cYjuUI6PTBetS3jYK7Uhq74kbHNjHLp
         5BWYhPACcQ1U0l2lABBMerCr3mAyFsLr058STdvEkVvZLwlAfjMQ9Psbta6JeJWe8eDh
         AruOPbw4dwAIM6HxstAE6hRI/0XD4cFg2jf+BU0XiLaR1fzrU/aD7S3F2sbIWmH00mgE
         7ofJ+pGaLVPR12uR1nGG8y4eczQMbVZqcSQ81Dq98fE42SluytYdM85i8I2fDfFm7/Ut
         8/fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=4IJgA9xHiUTgoFzKaPr1USI3SuBFKxXuOZ+JQdWjg28=;
        b=ZYcfXF/Xo88TDLm/7tF7PdlkE5XG1inxkKk7br6SIYMBIxNvUc7mIUv4MVurbnDJo3
         jyWnU4z/nSyV909ik+N619bSg+5UGeoMC1zQxJAtDARFXE7qlDFZ4ASgMmNxrbu6Ri3u
         VLrMWikpAXoZmaIQIAQRERmq3KQyUm0xNLhzxtY5PTiFNO3J7VJvd+BvnpJtfw99IXrL
         GymeqawmAJKn8WdtgjuyoWR1T+NIsk4AQz5LI4Sz/0h/qrLiBu7w7YEZrIdNB/L+xWy5
         mgRhM0//g5rQ/ydrO1KnYsqO27uTFg3E3Hbdz/4Wcti1lh+fDokWbaqimzttR9VOIpM/
         ckOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="XdWF/ndw";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h22si19640654ybg.240.2021.03.17.02.29.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Mar 2021 02:29:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="XdWF/ndw";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lMSUB-0001of-KJ
	for alex.bennee@linaro.org; Wed, 17 Mar 2021 05:29:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lMSTt-0001kz-LW
 for qemu-arm@nongnu.org; Wed, 17 Mar 2021 05:28:46 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:38599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lMSTp-00011c-Aq
 for qemu-arm@nongnu.org; Wed, 17 Mar 2021 05:28:45 -0400
Received: by mail-pg1-x536.google.com with SMTP id q5so11772116pgk.5
 for <qemu-arm@nongnu.org>; Wed, 17 Mar 2021 02:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4IJgA9xHiUTgoFzKaPr1USI3SuBFKxXuOZ+JQdWjg28=;
 b=XdWF/ndwCYQcUCkf338CKMIXBzDZ8UrGV7y0cHSb03IZdDl8I3IJ40bsJxnD6sPnhG
 znWTodAwenhOGo33qhI/Sj1FyXJq2SlVLCOBT28R1UNjgT1cbk8vzQoffWnOpwzvCZzA
 3TI03jzQ80WGIqqGfozQ8sG+b84tcQ1UPUJJwEI5MChfBRk13ZhWFALsWq0jMIrW3h6d
 m+QRMPc8HZCDRDQrim5upzYQbzy77Tmkb+O/7eQP3V3FjCT9wCwMJ/HAEKwYPYPp7DK/
 ZaZlhKckP33rRpJHo4whGpTgmp3YzBtM4N+FN5n5aft8CjLK9IRaL+Ip4myMmi80cEyr
 Cx2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4IJgA9xHiUTgoFzKaPr1USI3SuBFKxXuOZ+JQdWjg28=;
 b=Qbltgz5SB8KpwjVNC7oEbRPn7HwRNuERcEVlJuBxiLHAn9jqwjrR4M7M26J1d7wLtp
 JkGLenv3qoiIkLGwvC7d5oDLvuJNDal+LGWP3YCCTUEPEWN6SK/U9RlOjl1ikD+BSeA3
 qvoAsymKF/40LCvG/AgYO8wEt0Cy43nXWjEZN9osoITdE7YnmIW3hKhji2NIE5K5Ut6J
 Gt5XryqJvoo97ImdsMG1Er+Z1zAlD37tgHYPVmVF4B+teYMFOHfoUIwedsgpehLweBrT
 txlAKQ4FiJQ7F0pg2hyf+nPiGcaRG3vPaRsaOvdOdFzQBlcaSUTH1kpD+MMW1ujrkSQm
 OPFw==
X-Gm-Message-State: AOAM530c1ucuSFVaoYjbtlafKW5GgNJhi2HycmWzOSwk+iJLH0tDGaG8
 mO9VQhinI2bm31eKjprRYkSh
X-Received: by 2002:a63:9219:: with SMTP id o25mr1848911pgd.112.1615973319250; 
 Wed, 17 Mar 2021 02:28:39 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id r30sm18630163pgu.86.2021.03.17.02.28.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 02:28:38 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: dgilbert@redhat.com, quintela@redhat.com, drjones@redhat.com,
 richard.henderson@linaro.org
Subject: [RFC PATCH v2 0/5] target/arm: Add MTE support to KVM guest
Date: Wed, 17 Mar 2021 09:28:19 +0000
Message-Id: <cover.1615972140.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=haibo.xu@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
 qemu-devel@nongnu.org, Haibo Xu <haibo.xu@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YKSPtbZM1idj

This version is rebased against kernel patches v10, and only header
files are updated since v1[1].

This series add support for MTE(Memory Tagging Extension)[2]
in KVM guest. It's based on Steven Price's kernel KVM patches
v10[3], and has been tested to ensure that test case[4] can be
passed in a KVM guest. Basic pre-copy migration test also passed
between two MTE enabled kvm guest. 

This is a RFC patch series becuase:
(1) Need to add some arm MTE specific codes to the ram migration
    loop. There may be better way to do that in a more abstract way.
(2) Only pre-copy migration is supported and tested currently,
    post-copy as well as compress/zero page migration are still WIP.
    
All kinds of feedbacks are very welcomed, especially for the migration
support. 

Note:
(1) To support MTE migration, tags for one page are appended to  
    the page data during ram save iteration which make it easier
    to sync the page data and tags.

[1] https://lore.kernel.org/qemu-devel/cover.1612747873.git.haibo.xu@linaro.org/
[2] https://community.arm.com/developer/ip-products/processors/b/
    processors-ip-blog/posts/enhancing-memory-safety
[3] https://patchew.org/QEMU/20210312151902.17853-1-steven.price@arm.com/
[4] https://elixir.bootlin.com/linux/latest/source/Documentation/
    arm64/memory-tagging-extension.rst

Haibo Xu (5):
  Update Linux headers with new MTE support
  Add basic MTE support to KVM guest
  Add APIs to get/set MTE tags
  Add migration support for KVM guest with MTE
  Enable the MTE support for KVM guest

 hw/arm/virt.c             | 44 +++++++++++++-------
 include/hw/arm/virt.h     |  2 +
 include/migration/misc.h  |  1 +
 linux-headers/linux/kvm.h | 16 ++++++++
 migration/ram.c           | 86 ++++++++++++++++++++++++++++++++++++++-
 target/arm/cpu.c          |  2 +-
 target/arm/kvm.c          |  9 ++++
 target/arm/kvm64.c        | 31 ++++++++++++++
 target/arm/kvm_arm.h      |  2 +
 9 files changed, 177 insertions(+), 16 deletions(-)

-- 
2.17.1

