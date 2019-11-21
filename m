Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp2731831lfc;
        Wed, 20 Nov 2019 16:09:09 -0800 (PST)
X-Received: by 2002:aca:39c2:: with SMTP id g185mr5169930oia.150.1574294949052;
        Wed, 20 Nov 2019 16:09:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574294949; cv=none;
        d=google.com; s=arc-20160816;
        b=UUgw+TVIB+EN+XOmnLCxGYPq/dFYkd6fInMz5DxRO2uqMcl9JpGxQroJNEnvjzb7rk
         YrjNHCMQ8GyjvIsSc/0TqaqeWdy3K52j38uh5AMQUNENtOb/jlGB9P42VDH+vRGt5iNr
         4hQ0W/WiJlI5ApnoXB2XH5e0lpT38AgIif5zIYex1qlryRTWf8Pr4eIsEyAset3kXcCE
         x6ikfGR96rQeIq8mY9saJcLQp6LNG0QLUG/fIJL9zhKCHiNTghQT2R/ZSgJy/wrQmckT
         LLyXfA4yt0NKvAsZ3xSW60G5B/VLo195uWx3pUeEZlFcbiNabxXd2ACQd0rjhRJbIf0o
         VfoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=LnuosNvWWxN4M0Ub7V6G20xasHaJLUMucWeL+3NMq3Q=;
        b=nmO79AQO4h2dhNKtHZtRifzf/VKott/0B6M1FBS5fgrRmzUI433RdEovuRays9mkaA
         CjFhUugYt51GhhfUPBhhYM2Z2BbZv5CQijxx0Zoz2MOseG72NKmmm0QtDAbjO/HQCs/k
         J1CjUsEeW/P6l1E0sT/wdnHvRfRZL4e525o8X2R2T40IWBw5PfopDdK4zP19tNNDY3k7
         fcWPmpKo8OIWNqum7PuV6NcBX/wqwzYyd2xpIeMGilRk540dQkt6CQT+Ody7Vvpe94ug
         OSRf4aizyVS0m/Ke8cDyv1epR3Psr7rnpghhh/BwWkkfS63FVYAc2T3JWazcgOQ8zVhl
         /tHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NXeWgK+S;
       spf=pass (google.com: domain of beata.michalska@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=beata.michalska@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <beata.michalska@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id n48sor385825ota.181.2019.11.20.16.09.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 20 Nov 2019 16:09:09 -0800 (PST)
Received-SPF: pass (google.com: domain of beata.michalska@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NXeWgK+S;
       spf=pass (google.com: domain of beata.michalska@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=beata.michalska@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LnuosNvWWxN4M0Ub7V6G20xasHaJLUMucWeL+3NMq3Q=;
        b=NXeWgK+Ssbx4Zts3a+GEznZ7rnyKg5GgvO6gtlIUPffykMA3WnQY2k8/61lkAfQ74N
         dW3hBjl8UyM+rsE0x6iI5slwFnNxjrcoPwC9p++1r8orqUW+LbyC86/Cal8Xby96uhDP
         yEHTtduXdNxLxLIBqZwPFds+DTcUtI5Y+MV09vtWykaTjhbnMrohllCzpgjYxihw6f/W
         VPQUaJw2GHqMpGYm5+GkSAQ4tDb64WDCtQYsjkpxCft0JjuhsbKRs4qB/rFW5JV0x/q2
         tCrFdSRVzwj5D550Z6Oiw6SBdGQ7o7bShXzExFoF15RS3loTEqBtOyX7Ivi2wQMUZIqa
         ikBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LnuosNvWWxN4M0Ub7V6G20xasHaJLUMucWeL+3NMq3Q=;
        b=T3lvWYju3R5mGykdtugrhaOOA2H8oR+l3kO3S+Is8SpsyhkDyHlqvmTfT53WJSmP6v
         6nTlSh+vrNiaMER4vauaX8jJYlu4Cc5wyVhSaKrdP9I6DrYxKiPlw6eSb6OlI0BKovWF
         cPUmwf6A08PDic5aKgarX34jTXZJsYNEduE/QjWaOZgjCdZ1r+1+s/aELTUZW3OGZPPU
         B7edqUe17veYManDtWuX/x6bio8o9ymHxp4xVyCc+Gd1yP9yDCvd4gG/DOdoKDnqOYTy
         7eBURGGaYqRSQvTuUWr8pevBEKXc5VLIx4I7KhJpE3hJRUVTVctqV1ehfJrYF6wiGXFC
         57kg==
X-Gm-Message-State: APjAAAWmgDWHEr8Gscty+2KOmE3/nWL1zPDEQQjTVdYSc5MCOt7m8RbS
	NK8pJu+siI4rLLucOxR41cyK4UjX
X-Google-Smtp-Source: APXvYqxhhNg1c0F375yrETy33UdkuPy+nXreVkCoPTCe3o/6ihOrVdFsT072/uad2gigwfcWyhsXew==
X-Received: by 2002:a9d:3b26:: with SMTP id z35mr4298201otb.355.1574294948579;
        Wed, 20 Nov 2019 16:09:08 -0800 (PST)
Return-Path: <beata.michalska@linaro.org>
Received: from moi-limbo-9350.arm.com (host86-181-127-240.range86-181.btcentralplus.com. [86.181.127.240])
        by smtp.gmail.com with ESMTPSA id z17sm351439otk.40.2019.11.20.16.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2019 16:09:07 -0800 (PST)
From: Beata Michalska <beata.michalska@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	pbonzini@redhat.com,
	quintela@redhat.com,
	dgilbert@redhat.com,
	eric.auger@redhat.com,
	shameerali.kolothum.thodi@huawei.com
Subject: [PATCH v3 0/4] target/arm: Support for Data Cache Clean up to PoP
Date: Thu, 21 Nov 2019 00:08:39 +0000
Message-Id: <20191121000843.24844-1-beata.michalska@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: wX0rNpMQhyBY

ARMv8.2 introduced support for Data Cache Clean instructions to PoP
(point-of-persistence) and PoDP (point-of-deep-persistence):
ARMv8.2-DCCVAP &  ARMv8.2-DCCVADP respectively.
This patch set adds support for emulating both, though there is no
distinction between the two points: the PoDP is assumed to represent
the same point of persistence as PoP. Case there is no such point specified
for the considered memory system both will fall back to the DV CVAC inst
(clean up to the point of coherency).
The changes introduced include adding probe_read for validating read memory
access to allow verification for mandatory read access for both cache
clean instructions, along with support for writeback for requested memory
regions through msync, if one is available, based otherwise on fsyncdata.

As currently the virt platform is missing support for NVDIMM,
the changes have been tested  with [1] & [2]


[1] https://patchwork.kernel.org/cover/10830237/
[2] https://patchwork.kernel.org/project/qemu-devel/list/?series=159441

v3:
    - Assert on invalid sync range for ram block
    - Drop alignment handling from qemu_msync

v2:
    - Moved the msync into a qemu wrapper with
      CONFIG_POSIX switch + additional comments
    - Fixed length alignment
    - Dropped treating the DC CVAP/CVADP as special case
      and moved those to conditional registration
    - Dropped needless locking for grabbing mem region


Beata Michalska (4):
  tcg: cputlb: Add probe_read
  Memory: Enable writeback for given memory region
  migration: ram: Switch to ram block writeback
  target/arm: Add support for DC CVAP & DC CVADP ins

 exec.c                  | 36 +++++++++++++++++++++++++++++++
 include/exec/exec-all.h |  6 ++++++
 include/exec/memory.h   |  6 ++++++
 include/exec/ram_addr.h |  8 +++++++
 include/qemu/cutils.h   |  1 +
 linux-user/elfload.c    |  2 ++
 memory.c                | 12 +++++++++++
 migration/ram.c         |  5 +----
 target/arm/cpu.h        | 10 +++++++++
 target/arm/cpu64.c      |  1 +
 target/arm/helper.c     | 56 +++++++++++++++++++++++++++++++++++++++++++++++++
 util/cutils.c           | 38 +++++++++++++++++++++++++++++++++
 12 files changed, 177 insertions(+), 4 deletions(-)

-- 
2.7.4
