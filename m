Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp362179lfp;
        Thu, 30 Sep 2021 08:09:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnehpXI0df5wuq2lEXKFjJ4Nmt/LYNxBs9Ldt0WzLtdUndLgRp2BEutfYawg0AdnuCVnoj
X-Received: by 2002:a17:906:1e0c:: with SMTP id g12mr7563438ejj.155.1633014552835;
        Thu, 30 Sep 2021 08:09:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633014552; cv=none;
        d=google.com; s=arc-20160816;
        b=hgfspwH5lq/QE60jI0o1I7Av8Off4zDS42OM5i0czYIJkC+jO3HilFQBurTgXuzPPQ
         l3VhCYcnVkqqDM/eO6z3+dTorF1QnVzpbioNiv0aPoXRMwEFSh1i3FsTvztcrn1Z3ZFV
         w0PV5CVrclrOImAp6cjLvrMiukhgrMnUtAau9gbqXhi6mSIJetiLT8fPf4/4ujMj5TeB
         PCL2IIFLRnSgyHs8pSAHbY/+DFIJyDR7a6D3WNtZMmXJu9V4yyjNChuuWkcd8hPIvpD+
         iewuWU2LzMOY5juZqD0FyqGKguFWdYmSMwqu1wh/3J0Jc69pfJtOEFSzGOfgJktCQKx1
         HKhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=w4h7/Ss4Ha60rWKYGJeIua0QA6I0Dk/czC85h6uCkXY=;
        b=ahs/gHWGrpkVzttrEtHjVv023SwTjg4Kxepwwi4VfAKImJ2SaUIVHx7i9nsq2qIdlt
         fJr2RD/eYvldVFzaz6R3jOFKKMU+vRi9NZtWBVKmeDn0KoDrSo3w36qfd7OVLR2RkWmw
         kQ9RX92GctRdZjnpHaJsAVdRTvdxU/NRzR0ZF4qBUDLNHGYuv94V7xk3KRQPdo1JEitV
         Dw9jUAGQxOj+/EEnF9Qy+McsWd9f7twm3NJBOeepbhUXXkPfcdUnHV5Yd/n4K3gfCeb5
         BX7bDZS/vNZ6201oa6ug8DLnha/XRuGz/r6cNByA1BrGMSW8w9P8g7tzvT5zrIKKcQh5
         RFKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AYjlDdiv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j24si3533468edt.521.2021.09.30.08.09.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Sep 2021 08:09:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AYjlDdiv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mVxgM-0003x0-Sg
	for alex.bennee@linaro.org; Thu, 30 Sep 2021 11:09:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVxg0-0003vb-N6
 for qemu-arm@nongnu.org; Thu, 30 Sep 2021 11:08:49 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:36522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVxfy-00013l-Bs
 for qemu-arm@nongnu.org; Thu, 30 Sep 2021 11:08:48 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 l18-20020a05600c4f1200b002f8cf606262so8734198wmq.1
 for <qemu-arm@nongnu.org>; Thu, 30 Sep 2021 08:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w4h7/Ss4Ha60rWKYGJeIua0QA6I0Dk/czC85h6uCkXY=;
 b=AYjlDdivBT7Fz8wCFWarbw5PIsgZ/CbcVxj6bV95lPJtbVU4H3VGen02kg0sGFbe/r
 jzQo/lU47Kx/n/lFTqfnuyiW/1sR0EnVH9VmCS/GJEHWrTH/G8NOcOoeGL9kO3CSwRFo
 yoydVhR4+U9eDed2nPKV5TI0XK00pSyOas8IRLc8cDd8JkoFx4e29DY8MGv3NeQA++lV
 iaSOqMlPY2vb/iGeg1NaSxmwgSnenD0eUCNB6Wiz6FfHLT0AlA42uUs9wmUvi+prfiUJ
 rAbDRFcWwhZAdKNnkJyucn4ZSOTbQR3Po9WnXyJdPWGQbz0VZfNDzG5wPbVMwtbUnvvE
 M/dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w4h7/Ss4Ha60rWKYGJeIua0QA6I0Dk/czC85h6uCkXY=;
 b=K7H2Pleq9kDdR+7+ZlQ1jdcZrcbqYTt+YYowf62D7z6szx8lgnGYSAh+jQBIKJiJCV
 oON87Z5PIZCunrlexeMt6/pLPdGja7Nww3AwUgQklYSWyPt+12bq8OEhEpvVSWRokqiN
 TRNNXmDQrCQnokSu8NTBIFXBh1d8CYxPQKRoP2LKC8UYEITif9cg79yzLHr1NMNeA8+O
 fiZlijtB7HZcW+f894rW6qh5iMl/RxIS4ZhPOwscAC8wUSbBQQqYClZHiJ1W8niI3I+b
 llLrX+GMZcsVhO0wIF1o+6dnX7Pxed8FbypGbgNiYvFCj+dDcClpLacVbXCW4hjcyWOk
 HxhQ==
X-Gm-Message-State: AOAM530j67KQG2XgqEV3F+X9ugfhSeS2YvfgbWf0jnFdd+1ZnbZX8tYF
 ldVYNgiiedewlIjMypTKUY+uaLX2i1+kUQ==
X-Received: by 2002:a7b:c7ce:: with SMTP id z14mr1018897wmk.91.1633014524555; 
 Thu, 30 Sep 2021 08:08:44 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id o26sm5085942wmc.17.2021.09.30.08.08.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 08:08:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/3] arm_gicv3: Support multiple redistributor regions
Date: Thu, 30 Sep 2021 16:08:39 +0100
Message-Id: <20210930150842.3810-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yKg7mAEA11YA

Our GICv3 QOM interface includes an array property
redist-region-count which allows board models to specify that the
registributor registers are not in a single contiguous range, but
split into multiple pieces.  We implemented this for KVM, but
currently the TCG GICv3 model insists that there is only one region.
You can see the limit being hit with a setup like:
  qemu-system-aarch64 -machine virt,gic-version=3 -smp 124

This patchset adds support for multiple regions to the emulated
GICv3, which means that the virt board now supports more than
123 CPUs for TCG as well as for KVM.

Patches 1 and 2 are smaller initial cleanup; patch 3 is the
bulk of the feature work.

(This turned out to be pretty simple; we should probably have
done it before...)

-- PMM

Peter Maydell (3):
  hw/intc/arm_gicv3: Move checking of redist-region-count to
    arm_gicv3_common_realize
  hw/intc/arm_gicv3: Set GICR_TYPER.Last correctly when
    nb_redist_regions > 1
  hw/intc/arm_gicv3: Support multiple redistributor regions

 include/hw/intc/arm_gicv3_common.h | 14 ++++++--
 hw/intc/arm_gicv3.c                | 12 +------
 hw/intc/arm_gicv3_common.c         | 56 +++++++++++++++++++-----------
 hw/intc/arm_gicv3_kvm.c            | 10 ++----
 hw/intc/arm_gicv3_redist.c         | 40 +++++++++++----------
 5 files changed, 73 insertions(+), 59 deletions(-)

-- 
2.20.1

