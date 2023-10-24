Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2174176ejb;
        Tue, 24 Oct 2023 09:35:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJTD+8yhX2/ID5dXrti8XRWRGYA2BZGpPms1uWAyUFzGSBJ09MlGVKU2is5PU2Wzk1ZsyN
X-Received: by 2002:a05:620a:1786:b0:774:3497:a7a3 with SMTP id ay6-20020a05620a178600b007743497a7a3mr13738041qkb.17.1698165334927;
        Tue, 24 Oct 2023 09:35:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698165334; cv=none;
        d=google.com; s=arc-20160816;
        b=Yi7brF5iQsCYYAx0AsUyWQkpzJNPkjNjffKdlao7VBb4RJLpKeK1o+fN2VsVdjmDxz
         Et8gt9/FVKtpPa1INmozD0CnwwZMqNMhWmj1vgZ7qnsG5suenZ70IPdv7ooSU6A6mIq5
         Le0Ypnyu7VnizuYb7fuVa72jSYgnW01dyKHC2rBJF+cuRhm0m7Z09GQqk/st8UphNkOz
         ooFXttDXuqXkzY8DUi7b5rdaZ0IrLwmi1ZABo5WHrAsHfPdadyT2yAfe0LHLl47yhyQN
         bE+dNNjxdUH89rAil4K+0FLiMKYwSU3ci8bUsi+6szk0Bo+gTWc8yvUhjRA/qxy4Nik2
         ZP1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=36Ak5eB0m5J1zM/IZMmGa4L9AvRMMkX41INBVpt2JKw=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=WV6VJq9bmT85YrQCncTdTmx34T8RUUa+29zjnXxz0Yuc9N2yRytKeC4cxEL+0ggBhr
         Qc6iKQAdZqkc3LeY4Iy8v8SPCt4kx6V0CQFJrLKjcg3i4MOKN0y/2BZ86cNTppQK2CLo
         4G3Xc7j65KsZbw2xqexENXbbPuCnQ2iQnW0nMmo1vSlRQRjzB9Q5gUOtxurOgopMuqXb
         JGw+gnlggsGUvjDvrXEy9qPzg0ydHWbtvSJj49L5DsJlVRxJEqT+9h75MlERxEczSTUl
         G/g2sVdoEEr9w7UErxcelafZ7Jm0viw4Lhx7EZ5Lsd0Nl9ldegKFyhuz1Zk7bNrJEIvz
         ZgyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CKCuGyDI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m14-20020a05620a290e00b007756fe9b8f6si7882592qkp.447.2023.10.24.09.35.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Oct 2023 09:35:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CKCuGyDI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvKNJ-00022F-NM; Tue, 24 Oct 2023 12:35:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qvKND-0001xc-Rh
 for qemu-arm@nongnu.org; Tue, 24 Oct 2023 12:35:22 -0400
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qvKN9-0004Lj-0I
 for qemu-arm@nongnu.org; Tue, 24 Oct 2023 12:35:17 -0400
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2c4fe37f166so67330831fa.1
 for <qemu-arm@nongnu.org>; Tue, 24 Oct 2023 09:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698165312; x=1698770112; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=36Ak5eB0m5J1zM/IZMmGa4L9AvRMMkX41INBVpt2JKw=;
 b=CKCuGyDINItWz4//nOLfZBzZp70mE2hlvjm06u3ZSWRB6OBYnMgzQjcpLPk+hi5myu
 GtvKP0UHVBRuNhObgpHL6f77SR8SZhSPwu2zf+DT+GkctDjPTcuCifyXA1SiOVKp2KVk
 tGQV1r6XundjhJPzjE+PvRTN6pTZQtUNS18FcTAPRvq1ZPjwBV+Re9Xe5VAS4Js4XPKR
 TGSiRAvpznimgjHoQj4uYZRMrh9eYvGWyANaVunGeJz5Cf8rz0fcrFH9JUtlRdufPhsH
 NEWDDSGvlzEANNjAIVmbOEsZAVm0fR99cIzpWxA83PWkoxytTlPKSWwki1vFyJ7jcPzm
 Pjhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698165312; x=1698770112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=36Ak5eB0m5J1zM/IZMmGa4L9AvRMMkX41INBVpt2JKw=;
 b=F4QeixtPVxL8j+Nmne4ZrE9btsEv6V3+01379GOILFZkGR6i0DZU8oN7aaqCQ1NkVh
 jLpf2zRs5hjxTIhGqtQtw63Fhh+mmc9uOw7ey4n9ZvLN9vewEHxJylzgfjYUZ3BEyL8I
 icnlkD4mYAsR4Lp3dHNsvklsejCSpZByJPc565Eut5NXxdGyMsBo9wxa00vgsuI4D8K2
 oiMekqCBmX1hLW4rOLP5RygA+UacaqVarBntXjebkbiolSLIHrAlMNGB4J5DTHK0dkGr
 +5qfB+WTwXLBHtL/1YS54/nkxQEbRkyMXyuig2wK010mU5INhOp83yhmnCyB776uC2Jt
 wHRw==
X-Gm-Message-State: AOJu0Ywug9AcXWKhcJf6mzHOGBS2hml76C8T9pxkabMpoKFA0ncnMiSi
 wddD2G6XmxiHwfiavhDYVlKIVg+0wR5TKw6atiA=
X-Received: by 2002:a2e:b0c3:0:b0:2c5:1702:a434 with SMTP id
 g3-20020a2eb0c3000000b002c51702a434mr9211381ljl.52.1698165312038; 
 Tue, 24 Oct 2023 09:35:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c418c00b0040773c69fc0sm16860101wmh.11.2023.10.24.09.35.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Oct 2023 09:35:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/6] target/arm: Move feature tests to their own header
Date: Tue, 24 Oct 2023 17:35:04 +0100
Message-Id: <20231024163510.2972081-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x22b.google.com
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
X-TUID: GEasgRNQ7VBm

The main aim of this patchset is patch 1: there are a lot of
feature test functions in target/arm/cpu.h now (~1000 lines,
nearly a quarter of the file), and most of the source files that
pull in the target cpu.h do not care about them. So we can move
them out to a new cpu-features.h, hopefully reducing compile
time and avoiding having to recompile so many files when adding
a new feature test function.

Patches 2-5 are followup cleanup, which I don't feel so strongly
about. They try to impose a little order on the AArch64 test
functions by sorting them so that feature tests on the same
ID register are grouped together. This is pretty much how the
file started, except that as we added new features sometimes
we put them at the bottom of the list rather than in their
right place. But if this feels like unnecessary churn I'm
happy to drop these.

thanks
-- PMM

Peter Maydell (6):
  target/arm: Move feature test functions to their own header
  target/arm: Move ID_AA64MMFR1 and ID_AA64MMFR2 tests together
  target/arm: Move ID_AA64MMFR0 tests up to before MMFR1 and MMFR2
  target/arm: Move ID_AA64ISAR* test functions together
  target/arm: Move ID_AA64PFR* tests together
  target/arm: Move ID_AA64DFR* feature tests together

 bsd-user/arm/target_arch.h        |   1 +
 linux-user/aarch64/target_prctl.h |   2 +
 target/arm/cpu-features.h         | 994 ++++++++++++++++++++++++++++++
 target/arm/cpu.h                  | 971 -----------------------------
 target/arm/internals.h            |   1 +
 target/arm/tcg/translate.h        |   2 +-
 hw/arm/armv7m.c                   |   1 +
 hw/intc/armv7m_nvic.c             |   1 +
 linux-user/aarch64/cpu_loop.c     |   1 +
 linux-user/aarch64/signal.c       |   1 +
 linux-user/arm/signal.c           |   1 +
 linux-user/elfload.c              |   4 +
 linux-user/mmap.c                 |   4 +
 target/arm/arch_dump.c            |   1 +
 target/arm/cpu.c                  |   1 +
 target/arm/cpu64.c                |   1 +
 target/arm/debug_helper.c         |   1 +
 target/arm/gdbstub.c              |   1 +
 target/arm/helper.c               |   1 +
 target/arm/kvm64.c                |   1 +
 target/arm/machine.c              |   1 +
 target/arm/ptw.c                  |   1 +
 target/arm/tcg/cpu64.c            |   1 +
 target/arm/tcg/hflags.c           |   1 +
 target/arm/tcg/m_helper.c         |   1 +
 target/arm/tcg/op_helper.c        |   1 +
 target/arm/tcg/pauth_helper.c     |   1 +
 target/arm/tcg/tlb_helper.c       |   1 +
 target/arm/vfp_helper.c           |   1 +
 29 files changed, 1028 insertions(+), 972 deletions(-)
 create mode 100644 target/arm/cpu-features.h

-- 
2.34.1

