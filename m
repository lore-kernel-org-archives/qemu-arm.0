Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp895811ejf;
        Fri, 19 Aug 2022 04:02:35 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7Z4ydkBcUe+nzMEIG8kfPAfl+/1eOdaUDlD/k7PVy3tNJ7221tklsxS3YQcOQTKa2h0uz2
X-Received: by 2002:a05:6214:d0e:b0:478:c84c:6c17 with SMTP id 14-20020a0562140d0e00b00478c84c6c17mr5993586qvh.63.1660906955043;
        Fri, 19 Aug 2022 04:02:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660906955; cv=none;
        d=google.com; s=arc-20160816;
        b=eVQ8M3DUMlCvvv/RIt0seB11Yza17etsdk40vIX3ZXtkNeNjtS9w8Hzu4UlT2B91CD
         yDysv+sfmV2LEcQNQU2Oeox3rRI2JFuL9zoKgu7ZdwyN9x33uQbnuycuWS+tDa2z/y9R
         2taSu8+UXPnlvsGwjMGjUwFUpE+EzAlhHaIYiRm5zdZggmxH4VsH9CId0Qm5uqIQc5hB
         ucrQz7Xc2qgtXsISoeHgWDkoFNFI8qJM1TRHHnvvmUqaagvqEUTrLXYs5UW419I4Jsu9
         xw6WLutoNZFHJeomtuZ1pydKPFVFJOZCwkf5B4e146JL6XjXVys700JcYfPIhtT3aVBS
         4sqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=WQxaEKCipo0MfjRykUTGIq/NJfiMMHNyqrHoy0wasXc=;
        b=jKveVK+WgeNGMUY3m5SoUkaQmjzkbHRSJ3pQus32FwMnrnuHFBBrJ4qM8mrN3j27OR
         DokjQePqRlHxzrhg9swhWZpNBqGZ619FSh4k/rBCtpqut5/2zPh55MwPq6LYwUI5Btxh
         oL2G751vHoejXVRILB+P/aMOPfgb5b8kGUCrbj9jpwN3Q0eO+ZdF4X4fSZop42mwsJwV
         k+sffXk2elPuHXnNuKc0z310G2+tvk3cH2Ni3As95sKA62yRzF0He9pMLnHjWjeKIQ4+
         qAaXqM8c6kNW0nhgDcET29CEVPCpOyKLQ1P7y3hZh6Lyq0ObF9udSCywaS6Vj31t6LsC
         bJNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VysPM6q5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m10-20020a05622a118a00b003445685339bsi2039835qtk.12.2022.08.19.04.02.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Aug 2022 04:02:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VysPM6q5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oOzlq-0002Go-IN
	for alex.bennee@linaro.org; Fri, 19 Aug 2022 07:02:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oOzkL-0002CO-LJ
 for qemu-arm@nongnu.org; Fri, 19 Aug 2022 07:01:04 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:35839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oOzkG-0001Q0-3q
 for qemu-arm@nongnu.org; Fri, 19 Aug 2022 07:01:01 -0400
Received: by mail-wr1-x42d.google.com with SMTP id bs25so4765441wrb.2
 for <qemu-arm@nongnu.org>; Fri, 19 Aug 2022 04:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc;
 bh=WQxaEKCipo0MfjRykUTGIq/NJfiMMHNyqrHoy0wasXc=;
 b=VysPM6q5t5fpPWtwTWgT2Thb/lLmDsEUeIqusXONmN3eGXfHL8Qv3WHZOcSwejIrr6
 JHSgT2DwSUUsmfq/0p94nBz3AMuc9cF178pTUZEhxXC7k0n7QLg9ycsKgDMLu1vDYELT
 gSjDpgN5rr82FOVdvtXwq+JN3Y1flLkfTStYCR2G7NyXYfOlARjNHNr1ohZ2kXUJcFbD
 bhd06tEZjsKVnA9lUBKgbFPZHj9P5ayB1BTuiEv56ADgQOB41e1TbHcvAKtAWWjzci3z
 vHM6pSGV8Ti1IFbzwRgHpUiIuX6v+aBs40CcrL6ZAmwimLsmPHluVsUzA7imsjl7Xk0n
 jU8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc;
 bh=WQxaEKCipo0MfjRykUTGIq/NJfiMMHNyqrHoy0wasXc=;
 b=BFtvDxns5iwqX416i2AXdAMllgWfmTdzQyOHsSHOatyQBU4sl9Zt0RgdqWt4xdumWj
 4HiOFEUgHP4BV7iE18dJmK6VQTfp8PUzIjF/M+beCne2+t271kIJi8cL1toKLQ7/iYpx
 B2ozfJdSgvHKSkBqanHINdZwM2V+rQ5WChDpgGO0q7lAGuo6sXisJaO6zvwb5VapfY+q
 dB3OBqTY2K5kC8jkzYqltXbCz++vBgqs6416o/rIsE++rxjPuDpoFpgZcXfh1qblP5wy
 kxR8IQIdkQtQ4CnDPmJgkis0Ckj2FZuZWTo+z2tk0esCDYg/KSfWn821Q9jGmTgI6hbu
 pM2g==
X-Gm-Message-State: ACgBeo2YrTBnJhyBGDrhMmCUo83tSUkoQv1yWLNBXo3AIE6bsZoSPxOB
 K6hyiwycBe3IkdQaWGoz5K4aTRKVBt8KcA==
X-Received: by 2002:a5d:6712:0:b0:225:337c:3889 with SMTP id
 o18-20020a5d6712000000b00225337c3889mr2594264wru.59.1660906854294; 
 Fri, 19 Aug 2022 04:00:54 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p22-20020a7bcc96000000b003a52969e89csm8154985wma.4.2022.08.19.04.00.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 04:00:53 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/6] target/arm: Fix v8 AArch32 RAZ ID regs; implement FEAT_ETS
Date: Fri, 19 Aug 2022 12:00:46 +0100
Message-Id: <20220819110052.2942289-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
X-TUID: 0EjRLOaRe9E1

The main aim of this patchset is to implement FEAT_ETS.
FEAT_ETS provides tighter guarantees on some memory orderings
involving translation table walks that permit guest code to
skip the context-synchronization event they would otherwise
need to do after a TLB maintenance operation. QEMU already
provides the tighter guarantees this feature requires, so
all we need to do is advertise it in the ID registers...

...except that it turns out that for AArch32 this is done
in ID_MMFR5, which is a new-in-v8.6 register that we don't
implement yet. So we need to provide it. And while I was
doing that I noticed that we accidentally forgot to
implement a big chunk of the "reserved for future ID
registers, must RAZ" cp15 space for v8 AArch32. So the
big bit of the patchset is sorting that out :-)

thanks
-- PMM

Peter Maydell (6):
  target/arm: Make cpregs 0, c0, c{3-15}, {0-7} correctly RAZ in v8
  target/arm: Sort KVM reads of AArch32 ID registers into encoding order
  target/arm: Implement ID_MMFR5
  target/arm: Implement ID_DFR1
  target/arm: Advertise FEAT_ETS for '-cpu max'
  target/arm: Add missing space in comment

 docs/system/arm/emulation.rst |  1 +
 target/arm/cpu.h              |  2 +
 target/arm/cpu64.c            |  1 +
 target/arm/cpu_tcg.c          |  6 ++-
 target/arm/helper.c           | 69 +++++++++++++++++++++++++++++++----
 target/arm/kvm64.c            |  8 +++-
 6 files changed, 77 insertions(+), 10 deletions(-)

-- 
2.25.1

