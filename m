Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp838545lfc;
        Sun, 7 Feb 2021 19:51:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzwdAnpcNb74YXqpA83PEazVsn7BYi74zpMOEoVMWzLPVF4fXIhIjDqfz2kwF3oPzCESfS5
X-Received: by 2002:a25:60c5:: with SMTP id u188mr22455522ybb.80.1612756297359;
        Sun, 07 Feb 2021 19:51:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612756297; cv=none;
        d=google.com; s=arc-20160816;
        b=S+nfut5cd3PyYqHvCnE5P+8mBBqyuGNsqQLVsahJw87aGbGmeu55jdld3rZ0HQBiUp
         wY2N7E+GVMOWNvrl/IovSS6orVIuGjq9wz57+qe3+a8Llc7zVH1usHOq6nIUjwd9pNFh
         a5g2fx24vRGu008fDRoX9iDeErn0JBQtlaUX9gmdfeItYkHrf58EnmMqxtlAzX2MygBM
         sT0cr+m+Y3tMw2c7+W43CzdffpejUgQofPWJ856mHHOLj7gf/pY+Ng5npe8V6Z8JQxlG
         853/XqlqjBZPRDXy+0ibFnOAMWOiY6V+OfZ/2vZEigWJHnTZeCkytRFomipW16GHfjrQ
         upbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=fvfAQQXnsiwqJK5LFbqAh21CyVvT8aHohHzKppo64d4=;
        b=IZL7rGk0pFG2xoOP/7ASIk1pm1cWfFQxtUFEf5epEls9qkG74rBRr9Pp+eecJCxjce
         Doj5hDyQWvJQF8G7/8YC/RlBDrctZ0jzyPLsxRh615PciIH6IFmaVxpKK64aqSLuF04Z
         6bYUAGt611gxA4o22K242P5ZqYQa04ha/RHWUOwbeEjcqgXaKrdxOuhzouHRldqbF+KA
         k+5JqSaVpi8ONC8kfE8Og0lhORKsyrzL4Ke88AIIAKBhcxyrCEpwuHHh+YlH0/3SIR/y
         MPolY251lHOdZ/FvBCCy7jMKMvaNZDTjef8BQTwCB57NwZvhunvUFpdYNeRnFQhCEIHA
         76EQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ddbnMrAr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e130si16541106ybf.196.2021.02.07.19.51.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 07 Feb 2021 19:51:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ddbnMrAr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l8xaK-0005z1-N8
	for alex.bennee@linaro.org; Sun, 07 Feb 2021 22:51:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1l8x6E-0007dW-Gv
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 22:20:30 -0500
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135]:35407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1l8x6C-0001iQ-Gn
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 22:20:30 -0500
Received: by mail-il1-x135.google.com with SMTP id o7so6946167ils.2
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 19:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fvfAQQXnsiwqJK5LFbqAh21CyVvT8aHohHzKppo64d4=;
 b=ddbnMrArKkjV64mlk9BjDzgOuuUlQhlYF3iWtrzK4YtaBRnKL0Nf5LFqce2MgrvEtx
 wm8Lt7IF38t5YxyQdVjqEAeqppCIQWD80tPdnyTQgh+3nDHNdmRcmzHUYtGMxrw8Zie1
 5M+xzhclU7cH3eOfkuuiwIJh65nNpkAZ75aXhChTjcEYHOK/eX+mRZQhq3oi46r39Whq
 lTFZUd4454PGScAKT8Z/TfF2jNPuGvBdb0l6Bomxb2pRcR1p3uOtEUpmg1cNMjSAXJE1
 J7InRtYOh6yo01IW1b4gI9sS8faH2i7ElX/SBLWC1bvkjg3XUOCJ85Z6cT6gDdNiDDsI
 xmWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fvfAQQXnsiwqJK5LFbqAh21CyVvT8aHohHzKppo64d4=;
 b=LPAWeVghJy22WWxOT3Zed1TAIcuqHRe6dzuD95RtgaY2XJIhFH4M795/C9y5+3iNDB
 Fum6h78VZM+6Inv8aGy0+d/wmvk1H5OebFd2Kpnsa+pG3rnMMwTJrVILksjYGzVfpZYt
 fugpn2fyzXV2reIvUho3zUIaAAzWXQAt5MGTEeaX5dpsG7ft/T3IRdns0Q/Tmvr+ZvAa
 Pj7knsRcL4EpuK8rsRjxZREg88Xy8ejfjeaXL8JSn9oaYVy34iKHdiHRrQ61lw+d9/o1
 LX2F6ag+BSbj9BveajXKO423jiHvFMIx7QosK8l5OE9gocRGQBxtr6l/Q8djRYDaHeGD
 Xo3g==
X-Gm-Message-State: AOAM53054U8UJ2HHjCgydsJCbU11o0lzP5TZrkoAUPV91oXQu4q76e0R
 TaqYlp799raAkLjNwYx+Eejp
X-Received: by 2002:a92:b514:: with SMTP id f20mr14013571ile.253.1612754426158; 
 Sun, 07 Feb 2021 19:20:26 -0800 (PST)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id o8sm8022965ilu.55.2021.02.07.19.20.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 19:20:25 -0800 (PST)
From: Haibo Xu <haibo.xu@linaro.org>
To: drjones@redhat.com,
	richard.henderson@linaro.org
Subject: [RFC PATCH 0/5] target/arm: Add MTE support to KVM guest
Date: Mon,  8 Feb 2021 03:20:01 +0000
Message-Id: <cover.1612747873.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::135;
 envelope-from=haibo.xu@linaro.org; helo=mail-il1-x135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
 qemu-devel@nongnu.org, Haibo Xu <haibo.xu@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8wUjlFv0DQUk

This series add support for MTE(Memory Tagging Extension)[1]
in KVM guest. It's based on Steven Price's kernel KVM patches
V7[2], and has been tested to ensure that test case[3] can be
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

[1] https://community.arm.com/developer/ip-products/processors/b/
    processors-ip-blog/posts/enhancing-memory-safety
[2] https://lwn.net/Articles/842827/
[3] https://elixir.bootlin.com/linux/latest/source/Documentation/
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
 linux-headers/linux/kvm.h | 15 +++++++
 migration/ram.c           | 86 ++++++++++++++++++++++++++++++++++++++-
 target/arm/cpu.c          |  2 +-
 target/arm/kvm.c          |  9 ++++
 target/arm/kvm64.c        | 31 ++++++++++++++
 target/arm/kvm_arm.h      |  2 +
 9 files changed, 176 insertions(+), 16 deletions(-)

-- 
2.17.1

