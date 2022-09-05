Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp2573829ejh;
        Mon, 5 Sep 2022 13:23:27 -0700 (PDT)
X-Google-Smtp-Source: AA6agR59hLni/HmmUA/t7A3XKwpKs9+ql/8s2PgRSaZLzEHpQJWQLCTVormOgPs+RTdm2TO3QReA
X-Received: by 2002:a05:620a:1791:b0:6bb:58d7:fcbb with SMTP id ay17-20020a05620a179100b006bb58d7fcbbmr33386652qkb.377.1662409407242;
        Mon, 05 Sep 2022 13:23:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662409407; cv=none;
        d=google.com; s=arc-20160816;
        b=AW2k+OsqnXFhI0GkN4E/9Bi4moprPNrfJhMhyoRIV6QPwNntRl0dP3h/+4ezYBDX1M
         kg9S7MmDkF4CViZ920c9iR9xe+gxce5HNhCfC0MKO5jzVuOVxEvGWJ2nmO9HTeIcjRGL
         kVJ5O5zuAQ51lJWHhNXrad3e0G5QzcESvJaBzIQSzwNvWiPyXPxwNPqxgxxgCyze2/7e
         skFX7waeEqZm2bHJXamJT6PlA2UVAW2RvFIBXD77eh1F7YZE90fy57sJDSkk/FBcWG10
         rKhunmxuUwEJjnQlABod4ge+CsRY5GeD6sPcTtaLQHIL439MfIBAbtlL/7opqFAixU8x
         dTYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=eoRH/oMXskc9uVLihLPCU4BVLnfjM0NMaLk7vE7BhNg=;
        b=jARgtGJglSfmEWshwlTnXv20/8mFNZ8N7rvzYx4bOmxG0Req9mwL6rGKMQ7rUxvGLC
         GkCwoVWaDQZk0M/FKoqRW6DxeRhmZ28gsIkbDuQIoQ/TP7W9E/mdgksGpZJwguNTbuqk
         lVY4oPfVAZ8/u9GZDgSAlc3Y8FFqDGUAxLL3EqLexugak38Dd5ugA2h8HjrT/kCP4ZJh
         skFlXbJu32ZauD/3+sg2ir0HxIBiK2/CmBwssNPwelMF8CV6GR3Ged0aQiBpVlwy0qM/
         Yw8JekhQqRjqo6gih543APT5YUCCw1+HVQAk8nJUNj1c40sN38Os3aNNHHb7adpzUThu
         QS1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YkT42yzU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bi21-20020a05620a319500b006bb78d095absi7914967qkb.394.2022.09.05.13.23.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Sep 2022 13:23:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YkT42yzU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oVIcw-000742-Np
	for alex.bennee@linaro.org; Mon, 05 Sep 2022 16:23:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVIcc-00073P-2Z
 for qemu-arm@nongnu.org; Mon, 05 Sep 2022 16:23:06 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:40658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVIcZ-0004Wp-6P
 for qemu-arm@nongnu.org; Mon, 05 Sep 2022 16:23:04 -0400
Received: by mail-wr1-x432.google.com with SMTP id b16so12622795wru.7
 for <qemu-arm@nongnu.org>; Mon, 05 Sep 2022 13:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=eoRH/oMXskc9uVLihLPCU4BVLnfjM0NMaLk7vE7BhNg=;
 b=YkT42yzU2Vj7MBwlqZA4h9gw8jT3ixkJzpKqtTkINdo6Zk65E07X5VOc96fDqP8AbN
 pZdTmuNhyYyIFIRrzbxP0ZP0YuiQextAVduj0YCPdn9PSGKJPogqFJwdrwKh0U8oGqdn
 himJGWLEvJOUBW9Y0QJk0yhhGkJAXrXjQciEk6Go9RTZh9UZOAMDeVN+nWyuZ/aQQVzN
 yFT+kISPuS4xIqdgAUS5Tv37jb1FKhPPG3127dFkQ49xctGQazQkDRJN+Z6PCuoYfvx2
 YD6ho2VEhHOjS8gwZwhtuee3KdCFQ1x4+Y2d0pIRaYnZEKelE0W3yuYV/PAgWy5h0ew3
 L2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=eoRH/oMXskc9uVLihLPCU4BVLnfjM0NMaLk7vE7BhNg=;
 b=pcUhcdZUdCXeYescuZ0X6OugSx6z+mNKEfv8ZvpFNbNmnXXFz7NetdGjm7Hmk/+x5n
 8rTnP1RCQ9aszFnJNwCrYma96QhaPhun9wc/EG2HuQpgg2+xWTQ2HJpny1dfbY2N/icP
 Fqcck025q46pH3JFogo1+CLFfE/Z5ShYeNkgtWoiWzRxwg4gGsqZCY6+VGKgsfScZh7+
 FU7DLVM5kcmmSzyAFfBmtiuqAWF7snuqXeT7QZUH1V1FW54TdF49y94VEfKNH5fAjDnd
 vonZgppnFY6SIibC1NvBWOXjMu6iJSAemsWe1GzFrv54Pn8tLQUNxG0Cs8VeJ4+Ygj7c
 rDSw==
X-Gm-Message-State: ACgBeo1wIf05mAZPtfutsUUZwPE9BITZntDJeXcpdT7SzFp+E3rVACyK
 hzN+wDPLYPpCjMATnXKP6djc6w==
X-Received: by 2002:a5d:5232:0:b0:228:6bb8:e985 with SMTP id
 i18-20020a5d5232000000b002286bb8e985mr4565346wra.10.1662409381357; 
 Mon, 05 Sep 2022 13:23:01 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:d0ad:82b5:d7a4:c0a9])
 by smtp.gmail.com with ESMTPSA id
 m14-20020a5d56ce000000b00226d238be98sm9472404wrw.82.2022.09.05.13.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 13:23:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org,
	qemu-arm@nongnu.org,
	pbonzini@redhat.com
Subject: [PATCH v3 0/6] tcg: Introduce CPUTLBEntryFull
Date: Mon,  5 Sep 2022 21:22:53 +0100
Message-Id: <20220905202259.189852-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vxxbrYMIljra

This is split out of two patch sets that I have in flight
that allow atomic updates of guest page tables.

v3 fixes some trivial conflicts with the current tcg-next PR:
https://patchew.org/QEMU/20220904002317.60158-1-richard.henderson@linaro.org/


r~


Richard Henderson (6):
  accel/tcg: Rename CPUIOTLBEntry to CPUTLBEntryFull
  accel/tcg: Drop addr member from SavedIOTLB
  accel/tcg: Suppress auto-invalidate in probe_access_internal
  accel/tcg: Introduce probe_access_full
  accel/tcg: Introduce tlb_set_page_full
  include/exec: Introduce TARGET_PAGE_ENTRY_EXTRA

 include/exec/cpu-defs.h       |  45 +++++--
 include/exec/exec-all.h       |  33 +++++
 include/hw/core/cpu.h         |   1 -
 accel/tcg/cputlb.c            | 218 ++++++++++++++++++++--------------
 target/arm/mte_helper.c       |  14 +--
 target/arm/sve_helper.c       |   4 +-
 target/arm/translate-a64.c    |   2 +-
 target/s390x/tcg/mem_helper.c |   4 -
 8 files changed, 207 insertions(+), 114 deletions(-)

-- 
2.34.1

