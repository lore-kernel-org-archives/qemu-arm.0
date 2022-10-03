Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp127568ocb;
        Mon, 3 Oct 2022 09:24:59 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM55UyjVEY6WYzFi3QowvDc4yfi5R/y264c+Do2UzMMhA/UBNgNO/IDSatBvAKHEgUSg0EBu
X-Received: by 2002:a05:620a:2b44:b0:6ce:20e9:50 with SMTP id dp4-20020a05620a2b4400b006ce20e90050mr14458461qkb.356.1664814299101;
        Mon, 03 Oct 2022 09:24:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664814299; cv=none;
        d=google.com; s=arc-20160816;
        b=UoUS+PPJI3AIi0NlAcJMlmhM5MrUY29XpZLpdHhchsZ++vtw4nIIv/K1hxCR8KffgE
         8utyEreBkWqLy+A7ly+R97ykrMUAgmyG51GEEnJP42mDs/qX95o9eDxzjXNMgAN01qgR
         c38ckyOlQhji47ieaOWCeVdW7X2OBXvHB038lBwAcyoM6bGg7UMO1UYOwQ+gl7PygWf+
         RPy8iJu97L8GxThfJshC/hRlMuxuBgnr9yp1p0hUpbUxoUXboRKzKCHHnl/aPrcWy/dm
         nsKU/cZKIG2UhGIc4PePIg7ULdFzMvxw+soIQV7GXKP7pmW5nz1A+SjqwAWWjLZwxuaP
         Y3bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=lCZHg5x4HGzTZDn3BalI2idxXb7plNTlyEM9gtVZfKw=;
        b=TjGmYkvKdMSZaxGNbyYEc1/a9d8+6HvVGizbrOcncf+9NbIp3LAgNSHNME0pk0Yav6
         BGvop7D0DAjg8KIM+E+ri7wf6p/sp18olXINrTPuX9sWUN3dBgS7LNjGFvt48lDZuQ+O
         I89GZ+L/ixR5iYIKiEpmTJWlP0m588xYGlxo3ZyazFO280qcSGJfcHD5Ocqyl+PSMi8G
         IsF1Zn9A+xk/zR+0fAAtm74K9VVUB3imVHYWSQIze0AUgSUE3Z+igS/QhZ6zHYtSxgg9
         XV9giuUxYNAIG/3570cyVFJzRMuO6+Npin9TD7PeYNMgJ7xoO4E79NMcN+2Wqp27bLiX
         W2lQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="TubP/lmU";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jt12-20020a05621427ec00b004afa183904fsi123548qvb.163.2022.10.03.09.24.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Oct 2022 09:24:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="TubP/lmU";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ofOFU-0000Zn-H8
	for alex.bennee@linaro.org; Mon, 03 Oct 2022 12:24:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ofOE1-0007ra-7l
 for qemu-arm@nongnu.org; Mon, 03 Oct 2022 12:23:26 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:41492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ofODv-0000GG-02
 for qemu-arm@nongnu.org; Mon, 03 Oct 2022 12:23:24 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 fn7-20020a05600c688700b003b4fb113b86so6133484wmb.0
 for <qemu-arm@nongnu.org>; Mon, 03 Oct 2022 09:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date;
 bh=lCZHg5x4HGzTZDn3BalI2idxXb7plNTlyEM9gtVZfKw=;
 b=TubP/lmUcxD1ZHcVPJeSi948QQMZK+VtJdHvLaguR8qoDwUXhNd9shXGIaOhyUn7UD
 8Mj1DbbEu7Ya/IbrXnpey5ZUgMa9opouk50w/dDvRW6Gj6eC1RrJXR7lvoV21dC4mIej
 oCYwdLOMJ3PokgHtbRjVphz0D0ji0KNaJNHR1IT5Ndn03VEJAA6LnGcnaDmIkoz09I0J
 6kPQZspVp/N9yLi+8IuTaR8+XtMx8nWfoEneJczatHEqQhalVngmg4Ftr8WeZ+8qh2KK
 YINyQOpYD27stKqL38PVA0+qt3Eh+jwuxLm1hncGEvrNmCa16Toy+OI3Wr6ONvbmiRBD
 fB9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date;
 bh=lCZHg5x4HGzTZDn3BalI2idxXb7plNTlyEM9gtVZfKw=;
 b=slFoQu9roqD/WAtd9MFx1Lo3z5tAfsBbk4/ENL7A80mJImTFjxj9kajnV4vV7XsdU+
 4utE2Y9ohAp12ffkw704WoANSVgrdL+oDQ8lMo/i4EBN3UOEip36LISnNiDnHPXHv5+U
 S1pw9pfebQPuxMvkM2yKIiZ5K71oWOhZhmk7UMxQd2Z/tXamz8Y8cBObJ07wodH8nhvW
 qq2UQozqBRIk1/aieTWCGQOuQC/eqZ9rog1ZKOz01bIDZFVALcpx/3sdzvHSn3EFcQZn
 iuT3K2jSbNP/tUs8xpRuH/QMf91jKhihJ2Kt4UL+f5lUH69lMhDwyKUnyal9kvK2zBb9
 DhjA==
X-Gm-Message-State: ACrzQf0MqPyw9YGCuyb0YdkLTuaV9JVJd9ZzycEvaLUO994xBjbuiXMs
 C6w8rkm2nrg8qJWcZrLG9FN9GEFB6wbkWw==
X-Received: by 2002:a05:600c:27d1:b0:3b4:5e9c:23ed with SMTP id
 l17-20020a05600c27d100b003b45e9c23edmr7150650wmb.180.1664814197511; 
 Mon, 03 Oct 2022 09:23:17 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a5d62c2000000b0022afce9ea93sm9897856wrv.40.2022.10.03.09.23.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 09:23:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] target/arm: Enforce implemented granule size limits
Date: Mon,  3 Oct 2022 17:23:12 +0100
Message-Id: <20221003162315.2833797-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JUxGcJJQ0Kas

Arm CPUs support some subset of the granule (page) sizes 4K, 16K and
64K.  The guest selects the one it wants using bits in the TCR_ELx
registers.  If it tries to program these registers with a value that
is either reserved or which requests a size that the CPU does not
implement, the architecture requires that the CPU behaves as if the
field was programmed to some size that has been implemented.
Currently we don't implement this, and instead let the guest use any
granule size, even if the CPU ID register fields say it isn't
present.

Patch 1 in this series makes us enforce this architectural
requirement (the main effect will be that we stop incorrectly
implementing 16K granules on most of the non-cpu-max CPUs).

Patch 2 is new in v2, and extends the use of the new ARMGranuleSize
enum to the ARMVAParameters struct.

Patch 3 adds FEAT_GTG to the list of supported features, because
all this feature really is is the definition of the separate
fields for stage1 and stage2 granule support in ID_AA64MMFR0_EL1,
and we already updated -cpu max to report its granule support
that way when we were adding the LPA2 support.

v1->v2 changes:
 * renamed the enum to ARMGranuleSize, moved it to internals.h
 * new patch 2

Patch 2 is the only unreviewed one.

thanks
-- PMM

Peter Maydell (3):
  target/arm: Don't allow guest to use unimplemented granule sizes
  target/arm: Use ARMGranuleSize in ARMVAParameters
  docs/system/arm/emulation.rst: Report FEAT_GTG support

 docs/system/arm/emulation.rst |   1 +
 target/arm/cpu.h              |  33 ++++++++
 target/arm/internals.h        |  32 +++++++-
 target/arm/helper.c           | 137 +++++++++++++++++++++++++++++-----
 target/arm/ptw.c              |   8 +-
 5 files changed, 185 insertions(+), 26 deletions(-)

-- 
2.25.1

