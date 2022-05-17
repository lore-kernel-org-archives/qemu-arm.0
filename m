Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp2457301lfj;
        Mon, 16 May 2022 22:49:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8PH+ljDJ8ImO7xurOLIAoUXOUMThB3cdmw+uwqum+czh++prPN6JUSGccA/m3zHkPOL7b
X-Received: by 2002:a05:620a:294c:b0:6a0:4cc8:4bd7 with SMTP id n12-20020a05620a294c00b006a04cc84bd7mr14404333qkp.289.1652766592273;
        Mon, 16 May 2022 22:49:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652766592; cv=none;
        d=google.com; s=arc-20160816;
        b=UZHTf1UOonu+yyBYevBk/HrsZMYPcYiwpxarAQ500X8zgzCIZkMnOsVgtev2VHHjpz
         zwT3f2JQGdLjkj90JAbZnyI1XdbESqfIg+d6i0iTmLe0qmVt+ZtGqx4xHaC2gw1CzfRK
         qnq//a6957r6L0UQ1dFcK/3dfnXVcfmHq27cwaUcXsimUbEy5jq9tpXMz/cpAC89UzEA
         x3+GuTK1GVqwoVolmwsdsFo8QRfUUR1I6MqREwY2gkIkgYLgFUEb+reE9dcHh1gYgGfY
         eRZcbSDhvOfWuR203GuzgdOZ5q+HY0BNStLtFwOudcyNmO54IhRoTqwSBzAxXN7NZfKd
         bVhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=e3KBk6nkeNJQhadgHBeZE6aGoHWOgeb/U7VKNqTlDdI=;
        b=HbRffKwFmlqdoFYVn15vZDswNOx4prnw8QYNTKKwojhBGWYmZ/psuY5o73D2Ylgv2+
         +q54l3po9fr9hLeveem7fZ6x5im+trGaZ6mqU+jhcwhUlYMmFtjevS5aV/W3bSQ47lOO
         iCQzYaE4gsSkv15nkrk7C/uzJsrE2R1dxSaO1kRndY0BJpHB6lEeBMGde2M7fWgfGOip
         OMOYrbiyfMQ5c8oxOAFVeC2vJmmxFyyiciQ17PY2wxZlvY9MM8a1NWRF/bjlnuLojoj/
         dstwK1iR0j9fh21hIPJivsyz8C7U4BJVj7Qgn1RfHGnpKyMzgrsShbJZBHMH/GYu5g69
         bj2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ts6iRBlL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r8-20020a05622a034800b002f5b6d57d82si7214665qtw.264.2022.05.16.22.49.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 May 2022 22:49:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ts6iRBlL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nqq5f-0000Uc-Dn
	for alex.bennee@linaro.org; Tue, 17 May 2022 01:49:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nqq4l-0000T2-Sg
 for qemu-arm@nongnu.org; Tue, 17 May 2022 01:48:56 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:43993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nqq4j-0007nH-K6
 for qemu-arm@nongnu.org; Tue, 17 May 2022 01:48:55 -0400
Received: by mail-pl1-x62f.google.com with SMTP id i17so16404641pla.10
 for <qemu-arm@nongnu.org>; Mon, 16 May 2022 22:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e3KBk6nkeNJQhadgHBeZE6aGoHWOgeb/U7VKNqTlDdI=;
 b=Ts6iRBlLOQ6bYD9I6ibXAYxFTpyPXJYj00TVzsCH9t1Qz5fLR10rplIrhNUQQ8Q3Zz
 Hk7WsC8sJL3vKztUOXUQFrJ3GutFkw0yYwTfgpzfWFORk6auym4rt46dhUEMMhGBeZi0
 aWfuzDj0ql2jwVkmnn8MArCUr2RrwHXXeEGnvqliDOCQjcBJW85h5OH5/dXpbEW72cuQ
 C3zmytSl0bAhCSjDUwUPnSETR8bvfI8CAPwe85Xt772LKBPwBjD7UF+r8klsE9vu1PC6
 jczrTsAMh27Sq98HzRbIk0q3TCnsqrkRlDVVYfu1OBjG5rR1a8hQ+MWnwfTmXMIkM9n+
 naKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e3KBk6nkeNJQhadgHBeZE6aGoHWOgeb/U7VKNqTlDdI=;
 b=Oy4jlWssi55Q5PrA8UX1JoSEAdcdreTHOZUBW0i3YFDXxC0yCfJyQaR/Ev9ANZSiz5
 uGRPvGD86uuNioxFNeuhc8lRIM7gMpH1v6ueQcLUbHeOCKkhmr9RjgkxVBN4hESOp7Zp
 f0hcw4qx1htR1SncxGdo09KEUih1ndqMJeFGS3M9Wh9mpXTFBGoWeoiYAait1jY3UFcr
 mQ6VOgFubt/Lk7ZYriQ4J8qdBy268RnWEyPymMdyy1JYz81E+i/KL+ycT5BIgYiIR93r
 zQLPMUmzCPZJH6Qjs2w+6jlSfd/ZpP8uxvol2PU3YLgL+KnXtrhlJHtZbjtu0Xa+0Bjx
 2tgA==
X-Gm-Message-State: AOAM531iGKAKM4WioKBZABzAgvQpKhISt1C5dUliRaCOz1EowC1Zb1gZ
 ae923+iJP2oZO4HcZeakkX9Tbg==
X-Received: by 2002:a17:902:cf4a:b0:161:64f4:52d8 with SMTP id
 e10-20020a170902cf4a00b0016164f452d8mr11138426plg.83.1652766531964; 
 Mon, 16 May 2022 22:48:51 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 b12-20020a170902d88c00b0015e8d4eb1fasm8146670plz.68.2022.05.16.22.48.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 22:48:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 0/7] target/arm: SME prep patches
Date: Mon, 16 May 2022 22:48:43 -0700
Message-Id: <20220517054850.177016-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
X-TUID: M/qm5f7SG5LA

Changes for v2:
  * Fixed the errors PMM noticed in patch 2.
  * Cleanups for SVE vector length selection.
  * Cleanups for SVE exception el selection.
  * Add el_is_in_host -- I'm not sure this one will really help,
    but it's certainly appearing more and more in the pseudocode.


r~


Richard Henderson (7):
  target/arm: Enable FEAT_HCX for -cpu max
  target/arm: Use FIELD definitions for CPACR, CPTR_ELx
  target/arm: Do not use aarch64_sve_zcr_get_valid_len in reset
  target/arm: Merge aarch64_sve_zcr_get_valid_len into caller
  target/arm: Use uint32_t instead of bitmap for sve vq's
  target/arm: Remove fp checks from sve_exception_el
  target/arm: Add el_is_in_host

 target/arm/cpu.h       |  70 +++++++++++++--
 target/arm/internals.h |  18 ++--
 target/arm/kvm_arm.h   |   7 +-
 hw/arm/boot.c          |   2 +-
 target/arm/cpu.c       |  14 +--
 target/arm/cpu64.c     | 118 ++++++++++++------------
 target/arm/helper.c    | 198 +++++++++++++++++++++++++----------------
 target/arm/kvm64.c     |  36 ++------
 8 files changed, 264 insertions(+), 199 deletions(-)

-- 
2.34.1

