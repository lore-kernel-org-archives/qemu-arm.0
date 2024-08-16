Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp1271822njf;
        Fri, 16 Aug 2024 09:14:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXq9DSOvWgxPWo7F7y4Phia+xi4YDI3ZTwxiV1xZDJFV2/eOjyMmIGQCeTvc5bXJUJgS5rjYHOyay5vt14GHb/zAOeqkXVm
X-Google-Smtp-Source: AGHT+IFTijlNwyA/wX9u8fnKiMxqvCvyCTT9k1xxayu0wMg9FBe5SO+xDcUpiBqW8UPhDXEdlyVh
X-Received: by 2002:a05:620a:1727:b0:7a3:5e3f:cc09 with SMTP id af79cd13be357-7a506907603mr457811085a.8.1723824848508;
        Fri, 16 Aug 2024 09:14:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723824848; cv=none;
        d=google.com; s=arc-20160816;
        b=lVBTAb9M/CGu4NODZKKGyfz0Aus9UvdLeIfURbS/VhRiLxmgR3kmFBk6fxVLLteqWN
         SKScM64AA82Dd8c4tv5y2n9pI3WPGtV9XanSjuMQp+N+BZhz6827Xo3wEN377BAZ/JAx
         dClw7+ajoyYHZrTDQ1/zvXy9n9MFDiySLp6fx9JSx41EBpQFJjvvjrEVQMz7l4A0nQkv
         HqwbwqiQmBikL/CBbcOaRrRGM9HP4RuLn/9OGIPhFM/a+ox6EvoJpIY+PH58j+hpcHQS
         9XKc2+FwrcSad1zFmfZwgUd/mpB/2/eH9kvE4pd2hJ/BYUu8Cs7RiDUqTcFMxtevre+U
         pSJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=EI4M/gvSdt6iePTxzBiDbXKkI/BlDGQe8UMEpTZU8r8=;
        fh=8716YcvxZZxTMNcQZ0eLGoLGp1r7TadekkZAFKW2f4M=;
        b=f6b42uehgjlTF+zNn79curNtSwgzR8imKbQrdlTAK+ByKFXaOIAWvUJF9rOBZ82iEG
         BK/PIhvEL1M4ksYlYdccVkTAG2hQpuQmZAMU4688ciJiHZQFj9TYp8CCk5r4zXCyYW7Y
         ZgN7fDwXbjS2AfCvbqs4h0mIgyikhskjAphl1tpXcuRc8XYTeRIw86UqzetRP7F+R0IU
         J8LZF7XugW/bIZC57Yu+JnAVbUasbmZZkFGCUaT3YPZlANGKjRPuXcOYMx8eXb6YWtnN
         TDZS3EKAZ3u+wvhors0yWH05tVgMpxNeSsuXNrDOrPLdKj9C7AH4seRP5+4QCWN6aRPA
         V2CA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KV0C3aNa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45369fe6231si43011421cf.112.2024.08.16.09.14.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Aug 2024 09:14:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KV0C3aNa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sezaO-00089I-Qo; Fri, 16 Aug 2024 12:13:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sezaN-00087v-Cf
 for qemu-arm@nongnu.org; Fri, 16 Aug 2024 12:13:55 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sezaL-0007dM-Py
 for qemu-arm@nongnu.org; Fri, 16 Aug 2024 12:13:55 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-37195f88a17so525648f8f.3
 for <qemu-arm@nongnu.org>; Fri, 16 Aug 2024 09:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723824832; x=1724429632; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EI4M/gvSdt6iePTxzBiDbXKkI/BlDGQe8UMEpTZU8r8=;
 b=KV0C3aNajCMzQDRfbMfKHBD+tCNW7cyC8BdV0tpad85pw86DuqpbBOfJrq0+T9KtWO
 ZuY9H2I/3mzUwltd028cgBCRWGiQcWky2EhPkXVTbIJgmC2TIF9g/wAME6OJXRpSIlDS
 eHLeLAebc7QltobslS63db6sBh6AcgxwDV6L49NyQklsJMSm7fmXJ8LlkEi5/LsVxp4h
 MaxJY6oMVlWR3VYu32rfa/1bhY+VUZmzNrUb0yhVaU5nX+/1hTBX96TfJiuZaEAP7YFS
 a0014dN6P8PWMQLZD/T8sJtYwCOD8NYPKLolo3rXN57K2J3NdkvuenKNZanMlb3Xloz2
 EOLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723824832; x=1724429632;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EI4M/gvSdt6iePTxzBiDbXKkI/BlDGQe8UMEpTZU8r8=;
 b=CylyHWvXZHf0SzrBRwpPVvaITkQ0CDx09zRramCf7iSVmb3cV7n7ZE1Wwxbl01mbDR
 gjluVPZC5P7I0YKNWqnbW4NYhaHG1uKctuB2Ds7ryoGDc6OXmN3QhLeFnk9tFvNYSdcx
 +eYiSxxixmpusNPl9AYdlhIIU1K572uCozcNExg9NXZvEtKBaWHNiRTRQhQi0BNbtFpu
 SMjwuACuWv+Hjy9qh3F8BhpFTh0WKno6w3XJIReVzoNPByDiTXyqUXcStC3muKTZCij7
 wfEl4haFvuIILOCbcxMIWmevA/9pIOmvhIE2SyZYatEHGYQBo9ozbBv2JOYmMwA37Jlo
 mcgw==
X-Gm-Message-State: AOJu0Yw0XGrI+lt+DJ6mWic89wB23mq6/b/RKnW1ztsXBiogwJ/aKqjR
 2hv3z2eiwafDoCS7Q9Xd0e5ZpVZwZc/59kt1hAvTBMIaQytx0hPDXaSRpSWmeHNwSn5uXwfUDbm
 v
X-Received: by 2002:a5d:44ce:0:b0:367:8a2e:b550 with SMTP id
 ffacd0b85a97d-371946ace2fmr1958411f8f.60.1723824831771; 
 Fri, 16 Aug 2024 09:13:51 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-371898bb588sm3912269f8f.115.2024.08.16.09.13.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2024 09:13:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Leif Lindholm <quic_llindhol@quicinc.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Eric Auger <eric.auger@redhat.com>, Radoslaw Biernacki <rad@semihalf.com>
Subject: [PATCH 0/4] hw/arm: Enable 'nested' SMMU in virt, sbsa-ref
Date: Fri, 16 Aug 2024 17:13:46 +0100
Message-Id: <20240816161350.3706332-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 2QHXjdaHbnGE

This patchset enables support for nested (two stage) translations
in the SMMU in the virt and sbsa-ref boards.

Patch 1 is Cornelia's compat-machine machinery patch, which we
need to make this change only happen for virt-9.2 and later;
patch 2 is a trivial "missing comment update" change; patches
3 and 4 are the board changes.

Enabling nested support should be transparent to guests, which
will only enable stage 2 if they actually want it.

thanks
-- PMM

Cornelia Huck (1):
  hw: add compat machines for 9.2

Peter Maydell (3):
  hw/arm/smmuv3: Update comment documenting "stage" property
  hw/arm/virt: Default to two-stage SMMU from virt-9.2
  hw/arm/sbsa-ref: Use two-stage SMMU

 include/hw/arm/virt.h      |  1 +
 include/hw/boards.h        |  3 +++
 include/hw/i386/pc.h       |  3 +++
 hw/arm/sbsa-ref.c          |  1 +
 hw/arm/smmuv3.c            |  1 +
 hw/arm/virt.c              | 19 +++++++++++++++++--
 hw/core/machine.c          |  3 +++
 hw/i386/pc.c               |  3 +++
 hw/i386/pc_piix.c          | 15 ++++++++++++---
 hw/i386/pc_q35.c           | 13 +++++++++++--
 hw/m68k/virt.c             | 11 +++++++++--
 hw/ppc/spapr.c             | 17 ++++++++++++++---
 hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
 13 files changed, 91 insertions(+), 13 deletions(-)

-- 
2.34.1

