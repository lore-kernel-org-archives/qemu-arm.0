Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp1425138ejb;
        Tue, 14 Feb 2023 08:32:05 -0800 (PST)
X-Google-Smtp-Source: AK7set+3DsTbfCK7yvBaRsNUP24ynjUuFaxOLu7dYB//Zl8j7d68d11VQJ/FFjwAd2dJt0r47Nzw
X-Received: by 2002:a05:6214:da2:b0:56e:9f19:71f9 with SMTP id h2-20020a0562140da200b0056e9f1971f9mr186994qvh.17.1676392325635;
        Tue, 14 Feb 2023 08:32:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676392325; cv=none;
        d=google.com; s=arc-20160816;
        b=DpiI6s+3fCzeaTCnKrGZ39APCB8Ief3fGdSXJSAZ2Oe7ezo+esvEBFpjF9GeBGLH55
         sYwaOUEC5eJELCg+l00iTEyYY8zhG/sq71S2eT2NLODBy6B8yEcs46BhWVanbtjsORvN
         RbS6gxPKcnP2OeFzB4KT2PqaMO72oDN1oJ3UKZJOFzI/0Vj83E2fM10WHVl2HlGPUtgl
         7Ww3SvGkflioqafyx6AB/wkZWkV7UlEVtLeoY0KhLmjUB2ceX2DKeK+qBX+q/IursdeU
         PunWDwAdlTss6Lwa/fy53YIGFU66CeBCQi2V8qEY2AsVWWbOqIYtXJAFCBLCED48Bhfx
         wXcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=XPjfx2KfYL2ddUZpoHPW9GkaTnvkl4j+odd05Yy+n3c=;
        b=yAdzUmHWP2Doc8G3BobFPzaJTvZwrVCUBALc1ubzPUqD/ycm3IqlrGzprieq3qimHm
         WVkRizgnvUjNDlStrUhjwkkFs4VgCYir3Brq3wFwsmJaMP4VgA2QI9H05tF6M1FliOO9
         GMHCE3Qly1Bm/R5fFc4/4x4mWdFdJ2/8Y/G3uG/MIYjwr+OMq2ZpWx7GLDU+mBEARwrx
         gRRmohIjsZTyUIaCuGV8URwbeYeYSr5y7KJsr2WM9ApRUSMClPxVgwIVpz+3y0/rAeKW
         R53L/IJzvSGRilyZCuSVbfXistesb+AGOHVSC8DkFvgNt5Tb/ldFeKsvqOJBzYNAN3aU
         RIYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JACeXZ15;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 204-20020a370ad5000000b0071017f8baaesi11454516qkk.9.2023.02.14.08.32.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Feb 2023 08:32:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JACeXZ15;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pRyCy-0006Uy-NC; Tue, 14 Feb 2023 11:31:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRyCn-0006Pa-0g
 for qemu-arm@nongnu.org; Tue, 14 Feb 2023 11:30:59 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRyCl-00024m-91
 for qemu-arm@nongnu.org; Tue, 14 Feb 2023 11:30:56 -0500
Received: by mail-pf1-x430.google.com with SMTP id g9so10536027pfo.5
 for <qemu-arm@nongnu.org>; Tue, 14 Feb 2023 08:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XPjfx2KfYL2ddUZpoHPW9GkaTnvkl4j+odd05Yy+n3c=;
 b=JACeXZ15qEShF/YeMVMnXpO9nCir/MbfwzZe7lhZLi/m78ntOHs6nYnz6qJ0mk549F
 vFfpcd0sH+gD6j6nS1C3KTDEMgFlC4M6LAdHncmN3p4+5NAswM1m54+D/Mwu3Pw29nbT
 /L6YtaQQI/sdsF+heXCTvB3VwxX9AwVvpJoLlkMoZGr/kXRxn2zUj+uFdT9sHhmqhwRu
 e23LCAkeeIEb2fei+pvCIVpndaIzpfJTxqzSEsugFcyChfgL7lfyJW1mGXW3tUj6mVTL
 thRyLFHd5dMmmXkCd9QjKbhcgcN+clM9tjAwpW3MUp2PfLvCZfrxRuSKEkgSS4HZu6q2
 qjWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XPjfx2KfYL2ddUZpoHPW9GkaTnvkl4j+odd05Yy+n3c=;
 b=wLb6HadZQTjFaL+YVEEkyXnTMyWYOjklX/oQ/mUltlw6+455XBSJwOb3wN1m2+ROoF
 91UntTlRmq8oHNIGtDfaFxV+OBfngVgVyde7B/+TQhu4cEdtSFN0WiDlDaCRjlQbsA1Y
 avCUaMObMQWR20Y7R7lFbHV+FTU8pXRsKQSbHQmMtMPFtY68jVo+i6vo4uLWBX9CSSye
 tkNVEQxFCGtljC9Mik0WvLUWX4j8P9voTdmnxlHoGyfWIPZ6Mf1wMpCdHxA8BOjcWw2q
 HUIk0lg+dPKvOs6vU0UkU2G81Pm441cvL83uxJbHiXuQ1JFg9oA48QZrHgqfYgTw1Ez6
 t+4Q==
X-Gm-Message-State: AO0yUKXVLPu6r/UTb1hfDN4wfVweWbjGYuN3W4Gf8nomoBURbeNBxAty
 WcocGYCFksbBbH9e1TTOGE2LVw==
X-Received: by 2002:aa7:96ad:0:b0:5a8:16b7:ce6e with SMTP id
 g13-20020aa796ad000000b005a816b7ce6emr12433pfk.10.1676392251609; 
 Tue, 14 Feb 2023 08:30:51 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 d17-20020aa78691000000b0058d99337381sm10337011pfo.172.2023.02.14.08.30.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 08:30:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 00/14] target/arm: gdbstub cleanups and additions
Date: Tue, 14 Feb 2023 06:30:34 -1000
Message-Id: <20230214163048.903964-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
X-TUID: Wg3/Q3V6bzy4

This is my pauth enhancements from last year, the corresponding gdb
patches for which are nearing merge.  If lore and patchew are to be
believed, I never posted this to the list, only pushed a branch so
that issue #1105 could see it.

Since the cleanups there conflict with the recent m-profile gdbstub
patch set, I set about to resolve those.  In the process, I merged
the secure extension code with the sysregs, since they're simply
presenting different views of the same registers.


r~


David Reiss (3):
  target/arm: Export arm_v7m_mrs_control
  target/arm: Export arm_v7m_get_sp_ptr
  target/arm: Support reading m-profile system registers from gdb

Richard Henderson (11):
  target/arm: Normalize aarch64 gdbstub get/set function names
  target/arm: Unexport arm_gen_dynamic_sysreg_xml
  target/arm: Move arm_gen_dynamic_svereg_xml to gdbstub64.c
  target/arm: Split out output_vector_union_type
  target/arm: Simplify register counting in arm_gen_dynamic_svereg_xml
  target/arm: Hoist pred_width in arm_gen_dynamic_svereg_xml
  target/arm: Fix svep width in arm_gen_dynamic_svereg_xml
  target/arm: Add name argument to output_vector_union_type
  target/arm: Simplify iteration over bit widths
  target/arm: Create pauth_ptr_mask
  target/arm: Implement gdbstub pauth extension

 configs/targets/aarch64-linux-user.mak    |   2 +-
 configs/targets/aarch64-softmmu.mak       |   2 +-
 configs/targets/aarch64_be-linux-user.mak |   2 +-
 target/arm/cpu.h                          |   8 +-
 target/arm/internals.h                    |  34 ++-
 target/arm/gdbstub.c                      | 287 +++++++++++++---------
 target/arm/gdbstub64.c                    | 171 ++++++++++++-
 target/arm/m_helper.c                     |  90 ++++---
 target/arm/pauth_helper.c                 |  26 +-
 gdb-xml/aarch64-pauth.xml                 |  15 ++
 10 files changed, 453 insertions(+), 184 deletions(-)
 create mode 100644 gdb-xml/aarch64-pauth.xml

-- 
2.34.1

