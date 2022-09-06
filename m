Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp2854327ejh;
        Tue, 6 Sep 2022 03:12:52 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5mj59muiDQzym1ButwQTd7vKX3xedhr6s6Vz58Qbjns2jhd9G237I5r1nnLApsvNdcCFJY
X-Received: by 2002:ac8:59c7:0:b0:344:7ec0:2ff2 with SMTP id f7-20020ac859c7000000b003447ec02ff2mr42512287qtf.614.1662459172710;
        Tue, 06 Sep 2022 03:12:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662459172; cv=none;
        d=google.com; s=arc-20160816;
        b=YMwxiRmLnqfwuzqYnEzj9hHfdhJZKic03wiiK1W15hXRX8oZOjTKfVxxUwffnCmSi9
         GgqbtY67F1aM6CXPWpnd6nYn1GGvbu+n7EzMuQighuAj6SI2uCB+/4/4nVz7ekw288PG
         hEE6LWRljPZFkR/FBfoWP2K619JBe03UmPewLGUPOXx1IFZ3XsomW+gWzmdzNprr8hib
         FgA9H8w1eDmQKHVuozNnqMAz3fQrGFTgl0CNGFCu0CQuJyoxO2cr2BIxYlJ5X2yQvUoS
         dZ4xlbePZmWiYiZFAN+JAmCkUv0kdnNf4F1ejIkLxn1htGzax10xt0CC6cCYGFKl9CNP
         ahOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=rKEl0ZJJnJEhJKZ7s7QOjUyO8vz3YSFy/pN9kmQB2jI=;
        b=QVvhq/XllTRtq9ezfBV8fjB2G+N1WlUwxwvaPsvqB3ivp/vLdVYcCOaPSb1zhBkUzw
         zEKk6UUN15hWXp7uyGkj6HLiAKW8cX5M/aCmvMehXxkDOnBzeBtSZSrsG6fK1Ctz1UWc
         exymGx5hi6PQND3kkDJzIXJSpaqk3Ztw5Ht5Emn9A/DX/blZHEjQKmdN9Oh0d/Xm9bZ9
         pajiGJ+JwJQGOi2V47QALGTirLEcVsfSbCBLGnXdp6D27iUs1FOkkkFaJlKQI6kQgFNx
         EMB0QZMODJXhej5O41/WGtWGZLzdt0zwxJrkAOfAMwq+rzuiZuIBk82cwRRckj7c1KYG
         yFxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="dC/C5noB";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h3-20020a0562140da300b004743835c12asi6698309qvh.575.2022.09.06.03.12.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Sep 2022 03:12:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="dC/C5noB";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oVVZc-0005mD-6v
	for alex.bennee@linaro.org; Tue, 06 Sep 2022 06:12:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVSn-00048v-QX
 for qemu-arm@nongnu.org; Tue, 06 Sep 2022 06:05:52 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:45983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVSf-00032r-4K
 for qemu-arm@nongnu.org; Tue, 06 Sep 2022 06:05:49 -0400
Received: by mail-wr1-x42a.google.com with SMTP id bj14so1372245wrb.12
 for <qemu-arm@nongnu.org>; Tue, 06 Sep 2022 03:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=rKEl0ZJJnJEhJKZ7s7QOjUyO8vz3YSFy/pN9kmQB2jI=;
 b=dC/C5noBn/UTt0vys3xh+4IM9b/f4Nrm9jzlYrgboOmUAFrFO8jxLR2p1RVD+e1Nh0
 h7nYdMLQZKkw8UowmIzLzn7afPVSeEoObgsCyvn5A8JOqwGe9zCK54BSD7vd1ZJw3GEn
 7ZbDxqLrKO95qAzhFEcj47zZHJRGRJJeHTLWsbs+VljUCEkw4th4ZIpOqIo5jHh4FKps
 YtTeKt+L8eoLA9RwoG1447U93xfwV3gkUcMxc6O3gyvcPVqBr/XUgcpssO7Xr42/cepb
 /UhubzHXaoSRwfenol0gnWwlJmhPMWIwvIBYHb8rJk4w9FOLJ4e7lvvYxXmIpXa38wZW
 rp0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=rKEl0ZJJnJEhJKZ7s7QOjUyO8vz3YSFy/pN9kmQB2jI=;
 b=106V3JGey+lSxlGTkRMINAtC+mTQxMtLXm4nGdVhCtcj+0iukOuVp23M7EXXWEd4vj
 d4MdVT/A8M9AL9R9Pufun3yp2fmDQQAEXTWr7uiiwh8+aLzi2JvjgJ0E22hs92au7GpH
 sJFywsf8bmIWkOJkgu/yvuWuoaHerpzsrVH1zgUYqJCQZ4xQwEVQajxu+qTptq/I3DMo
 BTZkOTqnu1oD8N4r/lmPKP55FY6hCgLZKXLAXjju8exAgzuEGYawITUIJgg5WzH2qb8x
 VleA+jBqevnD8k762FoakLxMJ+KHW8lXehqHjv3Hnp9P22bg+nAYdIVKd2X6DlWqYuxu
 w3Uw==
X-Gm-Message-State: ACgBeo1kZGVql8dtoTxBYBPeCTHvsjJIxFj592eITTkMRsJcjh/kzvo7
 qo7eZVGrItE2AXZJEf2tLqr98Q==
X-Received: by 2002:a5d:6d89:0:b0:228:da8b:2537 with SMTP id
 l9-20020a5d6d89000000b00228da8b2537mr1022094wrs.585.1662458730496; 
 Tue, 06 Sep 2022 03:05:30 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 d15-20020a5d6dcf000000b00225307f43fbsm12271081wrz.44.2022.09.06.03.05.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:05:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 0/9] target/arm: pc-relative translation blocks
Date: Tue,  6 Sep 2022 11:05:19 +0100
Message-Id: <20220906100528.343244-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: j2NBIvqyT3KF

This is the Arm specific changes required to reduce the
amount of translation for address space randomization.
This is a re-base and split, with no other significant
changes over v3.


r~


Based-on: 20220906091126.298041-1-richard.henderson@linaro.org
("[PATCH v4 0/7] tcg: pc-relative translation blocks")

branch: https://gitlab.com/rth7680/qemu/-/tree/tgt-arm-pcrel


Richard Henderson (9):
  target/arm: Introduce curr_insn_len
  target/arm: Change gen_goto_tb to work on displacements
  target/arm: Change gen_*set_pc_im to gen_*update_pc
  target/arm: Change gen_exception_insn* to work on displacements
  target/arm: Change gen_exception_internal to work on displacements
  target/arm: Change gen_jmp* to work on displacements
  target/arm: Introduce gen_pc_plus_diff for aarch64
  target/arm: Introduce gen_pc_plus_diff for aarch32
  target/arm: Enable TARGET_TB_PCREL

 target/arm/cpu-param.h        |   2 +
 target/arm/translate-a32.h    |   2 +-
 target/arm/translate.h        |  21 ++-
 target/arm/cpu.c              |  23 ++--
 target/arm/translate-a64.c    | 174 +++++++++++++++----------
 target/arm/translate-m-nocp.c |   6 +-
 target/arm/translate-mve.c    |   2 +-
 target/arm/translate-vfp.c    |  10 +-
 target/arm/translate.c        | 232 +++++++++++++++++++++-------------
 9 files changed, 288 insertions(+), 184 deletions(-)

-- 
2.34.1

