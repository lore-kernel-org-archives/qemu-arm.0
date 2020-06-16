Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2799217lfm;
        Tue, 16 Jun 2020 10:09:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylT3N+CKS7c5et5IBFCmCXHCYgKEW50NvJZ4n+bS1I/9QvIPpjaPMPiCygVxoo4F9qALt4
X-Received: by 2002:a25:bc47:: with SMTP id d7mr6044700ybk.180.1592327343253;
        Tue, 16 Jun 2020 10:09:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592327343; cv=none;
        d=google.com; s=arc-20160816;
        b=Gjmy8gvBYfNntT/5UfcKFrNgNuoLjKya1ogXJMahIdyf7NgJDLADCikjt36FCn8aK6
         ivrBknf+4HFOP1wEt1Ubg2y3KRBCLUFMOHrEVyg3LagI7LZD8HjgODv8rbSV+1s8rADH
         rVJlXB+HHe4uow+52cXg1lelI6ip1MCAX4ffw7P1/KWUkwXX/dSeaYdVJ59SWowY7lfn
         X1KTfBe5y6IbfauhPGdeL/r64ZHALgSDD5AZ5VqC0/F69e5TFTDA1xNzW0FFa7opSeNR
         jWQYcsWkh3cu4g04S9WaQfMC9nn5IJ3TMDTxQBcTF0+h/UvBRgwlkoCuwcPis27XY4yM
         Cbmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=ZjLnKVZ43LyQ+p0ER8o5X1d7VJQL/NrnekmdPJtYTzM=;
        b=JZadZCz9QyT01dQTFu1uzfSKVqhPVrAGG+xVDRnlp75kMQvhT7J1ZS4+3FSUe25P2A
         EQxi5QrZm7nDtS7jnUhUnK2oIh2xOFLr6kG9S0RadTVADWC+xc1keBqL6F+j6V262U2l
         N7vbm6ZZxN7d2hgrX3RhHnJtR7NS9flB7lHI3MD5xYAFsVef8+RdsuTf9o9j0J6qIIk0
         tgtq2kcsP1aFTGCuJ6QoeWtlBjoCsxSOlr3j25if/26WzXxOaBWhyd/sBpepw6jKs6N/
         s00PW00ppfQBgq0Wj6NPVBAp6fL4nTttQumRcrxgVs7LYeFD9Ibt7unx1W1bVfPxpIjp
         7s4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="VoCLw/Np";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u8si16402418ybb.311.2020.06.16.10.09.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jun 2020 10:09:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="VoCLw/Np";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlF54-00010Q-Dj
	for alex.bennee@linaro.org; Tue, 16 Jun 2020 13:09:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlF4u-0000zO-QR
 for qemu-arm@nongnu.org; Tue, 16 Jun 2020 13:08:52 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:51762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlF4r-0007QN-Vy
 for qemu-arm@nongnu.org; Tue, 16 Jun 2020 13:08:52 -0400
Received: by mail-wm1-x32a.google.com with SMTP id b82so3594143wmb.1
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2020 10:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZjLnKVZ43LyQ+p0ER8o5X1d7VJQL/NrnekmdPJtYTzM=;
 b=VoCLw/NpY6+c9VU3QZKkOJPXKDuB/GdvkY8zq1yg5S19mm+0NWWCS09vFG7rIvxvYw
 F5BgB1dYYJ0I8lqVEEnghNN7HxE5nA7tdKh/aph1/wGxfjKJoYCcOkSeC1pQ0Ux9Xdv9
 wLTnyCYjmy4ZwqP3pkBZqQvWdkKhqx7XG9IKcj8meqvcmqUeN43M6WFnPRqgIuGEN0bK
 xtisaZPQhv6BLn1EGzUA6l+MzhTVCVkk+rxZhoiS4XnvBPSSZ/hf6Uwai9jem7jiBBiy
 JV3yZ0HwfkHwcehMl6sVYS5Py6nOObPw89FFAesTppFuBDhuHtfg4KpvTJXe+fWPrCOu
 Op2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZjLnKVZ43LyQ+p0ER8o5X1d7VJQL/NrnekmdPJtYTzM=;
 b=MbhN2y/hQ6jEnDWINIiS8MD8xH0wJswBCIQamW+HCkSk80xNBOOfJicwS0BRn6G9aF
 j511mm6zfiDxXV6O/ab6WnXGDuaJPYqhSCoJIZh7zjiVKpKbWwPQcjCq2AYT/3y/W+6F
 HbXg0+B0/guPlUgdVLo0XhAXojGknsHjzR9eglta468CnZBknI0XDIns3IPRuKAcw0m/
 NtV+OOsLaUUhcG2R8vJTyAWfkGXxH8JAd1RKuU8obCbgDGKOMYVpEQW7tdaG0dqUUS3J
 6gYOgQT8+msj4v1VrXlAqAyWxNR+pkj/bxO2S1l8d4YhyCqgLoxpy6cqqBUaSZYZpRPc
 RsJQ==
X-Gm-Message-State: AOAM531H0mhR3kS2VjxAwlLtYQjdk4XirUC3PxMNteDz0z1bj4vNHN+I
 2gUqyS4N0jfVwvLr+epqHrsFNZJdpoTAmg==
X-Received: by 2002:a1c:9cd3:: with SMTP id f202mr4012327wme.64.1592327327995; 
 Tue, 16 Jun 2020 10:08:47 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y80sm5263216wmc.34.2020.06.16.10.08.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2020 10:08:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 00/21] target/arm: Finish neon decodetree conversion
Date: Tue, 16 Jun 2020 18:08:23 +0100
Message-Id: <20200616170844.13318-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: y39tEjpNUTNn

This patchset completes the conversion of Neon to decodetree
by converting all the instructions in the 2-reg-misc grouping.

There are some potential further cleanups available, which I don't
propose to do (I've spent what feels like too much time on this
refactoring already; I want to move onto implementing FP16 now,
which is what the refactoring was intended to permit):

 * the oddball "TCG temps in global variables" cpu_V0, cpu_V1,
   cpu_M0 are now used only in the iwmmxt codegen; V0 and V1
   would be easy to replace with local temporaries. M0 is
   slightly trickier. The main thing that dissuades me from
   this refactoring is that I don't have an easy way to test the
   iwmmxt codegen.

 * we have a confusingly large number of ways to load and
   store from the Neon/VFP register file:
    - neon_load_reg/neon_store_reg
    - neon_load_reg64/neon_store_reg64
    - neon_load_reg32/neon_store_reg32
    - neon_load_element/neon_store_element
    - neon_load_element64/neon_store_element64
   which all have subtly different semantics. The way that
   neon_load_reg/neon_store_reg do a "create temp on load,
   destroy temp on store" and none of the rest do is particularly
   confusing. I'd like us to have fewer of these but it's not
   immediately obvious what the correct small set of primitives
   should be.

 * it would be nice to make the vfp and neon decode really
   separate translation units rather than #including them
   into translate.c someday

thanks
-- PMM

Peter Maydell (21):
  target/arm: Convert Neon 2-reg-misc VREV64 to decodetree
  target/arm: Convert Neon 2-reg-misc pairwise ops to decodetree
  target/arm: Convert VZIP, VUZP to decodetree
  target/arm: Convert Neon narrowing moves to decodetree
  target/arm: Convert Neon 2-reg-misc VSHLL to decodetree
  target/arm: Convert Neon VCVT f16/f32 insns to decodetree
  target/arm: Convert vectorised 2-reg-misc Neon ops to decodetree
  target/arm: Convert Neon 2-reg-misc crypto operations to decodetree
  target/arm: Rename NeonGenOneOpFn to NeonGenOne64OpFn
  target/arm: Fix capitalization in NeonGenTwo{Single,Double}OPFn
    typedefs
  target/arm: Make gen_swap_half() take separate src and dest
  target/arm: Convert Neon 2-reg-misc VREV32 and VREV16 to decodetree
  target/arm: Convert remaining simple 2-reg-misc Neon ops
  target/arm: Convert Neon VQABS, VQNEG to decodetree
  target/arm: Convert simple fp Neon 2-reg-misc insns
  target/arm: Convert Neon 2-reg-misc fp-compare-with-zero insns to
    decodetree
  target/arm: Convert Neon 2-reg-misc VRINT insns to decodetree
  target/arm: Convert Neon 2-reg-misc VCVT insns to decodetree
  target/arm: Convert Neon VSWP to decodetree
  target/arm: Convert Neon VTRN to decodetree
  target/arm: Move some functions used only in translate-neon.inc.c to
    that file

 target/arm/translate.h          |    8 +-
 target/arm/neon-dp.decode       |  106 +++
 target/arm/translate-a64.c      |    8 +-
 target/arm/translate-neon.inc.c | 1191 ++++++++++++++++++++++++++++++-
 target/arm/translate.c          | 1061 +--------------------------
 5 files changed, 1311 insertions(+), 1063 deletions(-)

-- 
2.20.1

