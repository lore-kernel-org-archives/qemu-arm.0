Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp29523wri;
        Tue, 5 Nov 2019 15:41:24 -0800 (PST)
X-Received: by 2002:adf:d850:: with SMTP id k16mr25717012wrl.204.1572997284365;
        Tue, 05 Nov 2019 15:41:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1572997284; cv=none;
        d=google.com; s=arc-20160816;
        b=vzokyxTrunT1ZSjHXr6gr3E560SiAASE08Eq6plxK+0HYcCbBbY/OaaYEMbvssmAX5
         y2i4c9zxvCb/6PHjCboUIjZYDjNNQJddvxp89Ic9yWytFfhY7kXgo4b9aKjzVqjY+ufw
         6mfSAqEseF7f5TAr/fgDNtZzRAsGeVf0KMK0QHZSiWTRmS5EFaoqVIZLEzX6F+Ex5J8j
         r9rOb2bhDr1/vhfpK5F8X03HFh5aPnC1cAM5ln/BTNsfJcpk0TQ7ixJaf+kH5gazV/Gh
         es13iypxX+ccJAKH9TIITqDumN4QaaTIuOW9kbTSi74iEWbLnAxnVVVh0ay+PfTevZr+
         sAEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=3G6n6Zl5Ml5xiNIOzQAAwJRvPoWHJs+oXuob89eeLPI=;
        b=x7DnL+XgSbVfydWEp41kzbW7kxqcpShoggZYGCrQdE5fslJFTMqvjBpD64iLTOK7Pq
         HP7pw1jPOe/KIsf7A9LnSJ8grYLGd/UxgATsmy6BBbmmpqghqVo9KPyAanLAc7X16x+p
         92OBKOQWJqbEwSKStCi4RnZdR2LJEoWtTAtIsY57RFbevAuOr84aCB1Qo5yvKuHHyjtu
         YFE6moBIvSXB9hFtGSTVj4ZN39iclydWKBcwawFVNB6y8wgTY4i/NGi2+YOVGzzq2p0Q
         wDtJOiWdqhjzm1Xv89E7y4QatyJ0BdLRAqYFbX6w1aT2QW2FhEFB6VI7znUBjzf1DQE1
         uO1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Lk7ZPi/s";
       spf=pass (google.com: domain of beata.michalska@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=beata.michalska@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <beata.michalska@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id l16sor7381820wrx.17.2019.11.05.15.41.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 05 Nov 2019 15:41:24 -0800 (PST)
Received-SPF: pass (google.com: domain of beata.michalska@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Lk7ZPi/s";
       spf=pass (google.com: domain of beata.michalska@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=beata.michalska@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3G6n6Zl5Ml5xiNIOzQAAwJRvPoWHJs+oXuob89eeLPI=;
        b=Lk7ZPi/sETD/d31zTJ/vC793sX4S0YjuWhqcFhBTsdKrnYpqIC60AacfL5l1zNyasT
         hN53PQo6yI9MywpnPr9bZIeEkqceyNOn1bQHrdutmqok5u+92jKS6YI1SBXGdWWEXAPI
         fJSR9qpxiCGipXRPhPuhV9Wzpd+nG0reJJzDnbc/KpFHbRvMdE01xuTzSuZ6xlEcElUX
         Mia7r4OLP/nyUG8WygLry3Azl1k+semlQvQlNDtGCnBFWCW3tgOS8lW/yzus0X+cQqYP
         PnPsqxvFezn1xeVx7XBF7hDsORzCwmHHWqL3mNLXr/WhFTYZOIph9vMJqYCC52FwkzTX
         EUqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3G6n6Zl5Ml5xiNIOzQAAwJRvPoWHJs+oXuob89eeLPI=;
        b=QlKlkfjffTyTVvvuKiFILG6rLmWQcfvTgQDvNygBMqM/RL2MayIXAHxUSPR76FFt7O
         tubU92JtJsxy1BuBdPtInfsEISK6SuUM517mhI6nyuhstY6N0oUK4lDTtwOm5Q2L6siT
         FZx/Y8bDDiS2jU5xnt59mbAOmECeeG0wQRQKcLxzc4s5CdD5FdpND3rUvWRCEudcNviW
         +V9Wwj2Km7/p6Q8Jt0Ccg2btmWez1lhwEzGx8jHmiSvnnPF9Zs5WIBQsyOx8XZI0xnVJ
         86YZoMuCKKIaLoofoXK/SDU0ZD6J6rMns5mgNReJ7QJ9oM4S20njCkXE9O6qvLUEVSgt
         sIYw==
X-Gm-Message-State: APjAAAU8bUzLQNwPE0qYLk/i5YvLcEDOv2EfeX43L3b3PJ18tbtYhPID
	39KztiFibHkH/XSqRdZSSbJpUGiP
X-Google-Smtp-Source: APXvYqzR1CB7JCYrDPVqOliBqDOtwPa+A221ANbOtGPtaF6iLq7ksr2cTBp6yd6j/Rrn5JAlx0vOjg==
X-Received: by 2002:adf:e886:: with SMTP id d6mr9080066wrm.188.1572997284024;
        Tue, 05 Nov 2019 15:41:24 -0800 (PST)
Return-Path: <beata.michalska@linaro.org>
Received: from moi-limbo-9350.home (host86-144-13-94.range86-144.btcentralplus.com. [86.144.13.94])
        by smtp.gmail.com with ESMTPSA id q25sm27295010wra.3.2019.11.05.15.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 15:41:23 -0800 (PST)
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
Subject: [PATCH v2 0/4] target/arm: Support for Data Cache Clean up to PoP
Date: Tue,  5 Nov 2019 23:40:56 +0000
Message-Id: <20191105234100.22052-1-beata.michalska@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: V2/RPRVAIw5y

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

 exec.c                  | 43 +++++++++++++++++++++++++++++++++++++
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
 util/cutils.c           | 47 +++++++++++++++++++++++++++++++++++++++++
 12 files changed, 193 insertions(+), 4 deletions(-)

-- 
2.7.4
