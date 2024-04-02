Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp3989123ejv;
        Tue, 2 Apr 2024 07:25:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX6i05zhjpxdaYhe5ZkzI8PbS5AUKw7eje8ctAQOkBePfDlTS0I3MLkyvcAE2iW5h1mYrNv4/T5Htra/O6rklDD/GOXLMcQ
X-Google-Smtp-Source: AGHT+IHgvy97VtTpzgMCFT7fQTrIG8OGvVX99bcBmQJxIDFTIwimnJHcz6L8aA5gQJn3pQyt7gX2
X-Received: by 2002:ac8:5e0d:0:b0:431:6ef2:3925 with SMTP id h13-20020ac85e0d000000b004316ef23925mr14316327qtx.65.1712067900442;
        Tue, 02 Apr 2024 07:25:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712067900; cv=none;
        d=google.com; s=arc-20160816;
        b=u5ZIBEy6kg6nRNylGMN1kkVPsqJ/5MsoYptR9cd4hDqkIkW70/9UVIkBcRFq8L8VaH
         9HmBRHq4rUIrdozMPrVrSR3CZELYewq7U1Aqnyt17tJ6m6RDymYfukAmU9UQOv8z14sk
         qjO3iNxOV82pfLDb67sMsgGjLM+1PicHVJsbrIVcYtyWmu4/6t4ExHI05XThaff24UNg
         XiW0Q8EL2UtH+J+j+2lOsj4rdG0bOFnA3NZ98V55neJBLUwXjn/eRUdbf1bf/knfmtPd
         8VbZLxstdwNrjJutUen/hjmPZFUN8tr9iLLm7pHLaex7zjBRLEODBUF58px6fYN0gJms
         9H/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=0ARN4/ABZhX8L8cR8XaKVceRbmAnWWSOTXp/b2jJ1bY=;
        fh=tASihUWnBfQ9LrqtALfVWsDuWBUPISUHlxv2pq3XWmU=;
        b=s1g3MX/Gd6DOZm5loYC04P/6hFfbRwJNbRen8KyQF+dOPZXMh0BDc3h+6+mFWpzbCW
         4V2pb6P7lPrEBz6H6e51FGaHA3obR9DbDlYR6KY4RJ9ZeRo+p9+cfp7pYxFfaJw+KX/S
         Iq0YqCiEuGqyFpMUAdi0rliR1mk5lV0CuoB31Fg+t5hzPArHoodFFp43omr8ewsl1ZS6
         9WNhNY5ImXHMR6OKLquU7Lc+hRs/54/4iZu3KHt1tlxmcL56dkyXYhAp90iXuTnVgZP2
         IvLHH1DR6F1Il+4GDrWeJSUDZ+QCtI+QVvLu/gGfbShZlW/xrjQjMiOhv6VWjxXGHa4p
         HSHg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UrJdUsQA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e17-20020ac85dd1000000b0043143eda6efsi12421244qtx.380.2024.04.02.07.25.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Apr 2024 07:25:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UrJdUsQA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rrf45-0000cO-BM; Tue, 02 Apr 2024 10:24:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rrf43-0000b8-Af
 for qemu-arm@nongnu.org; Tue, 02 Apr 2024 10:24:39 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rrf41-0007Qq-I2
 for qemu-arm@nongnu.org; Tue, 02 Apr 2024 10:24:39 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4161ea9bfd8so1888755e9.1
 for <qemu-arm@nongnu.org>; Tue, 02 Apr 2024 07:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712067876; x=1712672676; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0ARN4/ABZhX8L8cR8XaKVceRbmAnWWSOTXp/b2jJ1bY=;
 b=UrJdUsQAlMoJ+TiUTHwVHTgoJ4j4LfkDX5IC6rk9Rco59xPtxAol2rg+JpzPPDTh2x
 g7MMJ3WFtx9QIQFt914CToyYO3Z7aF/UE2D/BAlpuz8SqfB99Jn6C057r1sR00pFM76N
 ttcQps21uH87hj1iBKrDaJ5K3NbaAYXiPO6G/Hywrw3+GCqv5sZSxptE2dpuvKiZmpf9
 wTWwPeBvnQasUzcLX4D8eaSwqUot4Y8k6ulDQA6T8FI9j63/lgCggDPL+sJyK25R4uOd
 p2mXTSqR2YDY3VBGEZ+KR93fIRs0CPjcgupwbLRxjqf7luOemmYZsdzt58QCa6EDEMNF
 3TMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712067876; x=1712672676;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0ARN4/ABZhX8L8cR8XaKVceRbmAnWWSOTXp/b2jJ1bY=;
 b=JDM+v5gYG4m/fyAeCscznUOFMPU8U/rr4QO1iA2rq/l5qV45Y5bUPymJue+dER2s7t
 UU7FqL+lt2clK/KQcBe3xamx6ZiSOjv0bdfgWcln7nsk0/G/c/T/+hqJ9ptOkaxwv3JV
 4yoghjFHfy+z0RLyjsvSlCvtoqYaFWZLgMfDZBLS6+TD47SRkcOivGfhV2W2IcEo6uNT
 a1qnx09Ar5rAgBuW/M3K4t9Xv346KSXUTYupCYeU48yq+dvvVABGEiDHhQBMUzQ6TP3W
 jhL1Vjerg2sTlvunj78Og3ByCG37dwSYCpvGKo/4ar8Q+iE0xZUse9Q9HX05oh2oX7wo
 MLLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZVk4+bmWhVnfpzGkcCAD+6ljWynZn1QUzU9PftYt8NhAIDlUVUGAFHdeidas/fCw9QUPqvZ2LjI2Zlk71IdwtDja3
X-Gm-Message-State: AOJu0YwFmManMDE1PyUGee/HYUizOvNmhKOUoS3sNnz6r75D5SuZUqBl
 cXNTse7unjCCbRi5dNTo6DbfHOWHHcifrd7D6jWBcd2sZVAgV9Y8PuaRZXl5GLI=
X-Received: by 2002:a05:600c:6b0c:b0:415:52e2:64b2 with SMTP id
 jn12-20020a05600c6b0c00b0041552e264b2mr7130224wmb.6.1712067875701; 
 Tue, 02 Apr 2024 07:24:35 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.202.91])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a05600c4f0600b0041469869d11sm21166619wmq.47.2024.04.02.07.24.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 02 Apr 2024 07:24:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 00/15] Misc HW patches for 2024-04-02
Date: Tue,  2 Apr 2024 16:24:15 +0200
Message-ID: <20240402142431.70700-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: u91/IS2M1mVq

The following changes since commit 7fcf7575f3d201fc84ae168017ffdfd6c86257a6:

  Merge tag 'pull-target-arm-20240402' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2024-04-02 11:34:49 +0100)

are available in the Git repository at:

  https://github.com/philmd/qemu.git tags/hw-misc-20240402

for you to fetch changes up to 4c54f5bc8e1d38f15cc35b6a6932d8fbe219c692:

  hw/net/virtio-net: fix qemu set used ring flag even vhost started (2024-04-02 16:15:07 +0200)

----------------------------------------------------------------
Misc HW patch queue

- MAINTAINERS updates (Zhao, Glenn)
- Replace incorrect mentions of 'softmmu' by 'system' (Phil)
- Avoid using inlined functions with external linkage (Phil)
- Restrict CXL to x86 PC PCI-based machines (Phil)
- Remove unnecessary NULL check in bdrv_pad_request (Kevin)
- Fix a pair of -Werror=maybe-uninitialized (Marc-André)
- Initialize variable in xen_evtchn_soft_reset (Artem)
- Do not access virtio-net tx queue until vhost is started (Yajun)

----------------------------------------------------------------

Artem Chernyshev (1):
  hw/xen_evtchn: Initialize flush_kvm_routes

Glenn Miles (1):
  gpio/pca955x: Update maintainer email address

Kevin Wolf (1):
  block: Remove unnecessary NULL check in bdrv_pad_request()

Marc-André Lureau (2):
  plugins: fix -Werror=maybe-uninitialized false-positive
  hw/nvme: fix -Werror=maybe-uninitialized

Philippe Mathieu-Daudé (8):
  accel/tcg/plugin: Remove CONFIG_SOFTMMU_GATE definition
  gdbstub: Correct invalid mentions of 'softmmu' by 'system'
  gdbstub/system: Rename 'user_ctx' argument as 'ctx'
  target/ppc: Rename init_excp_4xx_softmmu() -> init_excp_4xx()
  hw/arm/smmu: Avoid using inlined functions with external linkage again
  accel/hvf: Un-inline hvf_arch_supports_guest_debug()
  qtest/libqos: Reduce size_to_prdtl() declaration scope
  hw/i386/pc: Restrict CXL to PCI-based machines

Yajun Wu (1):
  hw/net/virtio-net: fix qemu set used ring flag even vhost started

Zhao Liu (1):
  MAINTAINERS: Fix error-report.c entry

 MAINTAINERS               |  4 ++--
 gdbstub/internals.h       | 26 +++++++++++++-------------
 tests/qtest/libqos/ahci.h |  1 -
 accel/tcg/plugin-gen.c    |  6 ------
 block/io.c                |  2 +-
 gdbstub/system.c          | 10 +++++-----
 hw/arm/smmu-common.c      |  2 +-
 hw/i386/kvm/xen_evtchn.c  |  2 +-
 hw/i386/pc.c              |  4 +++-
 hw/net/virtio-net.c       |  4 ++++
 hw/nvme/ctrl.c            |  2 +-
 plugins/loader.c          |  2 +-
 target/arm/hvf/hvf.c      |  2 +-
 target/i386/hvf/hvf.c     |  2 +-
 target/ppc/cpu_init.c     |  4 ++--
 tests/qtest/libqos/ahci.c |  2 +-
 16 files changed, 37 insertions(+), 38 deletions(-)

-- 
2.41.0

