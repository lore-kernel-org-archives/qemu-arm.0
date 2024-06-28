Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp162811njm;
        Fri, 28 Jun 2024 07:24:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWK65RdqN6hlO1R61hggFiglNi/eL8veCyJkXB2aG7+GcQTlj6hDw1SNt2YuqptbIskdUhKwu3MTsztexgqetjzwR6vsqJd
X-Google-Smtp-Source: AGHT+IFndfSVFKrVr+l6TQgQcRYbyUgG4GMJz63e0QDQWKn7EyBo9lxc9iIZZ3puaz4hZmlUGL6g
X-Received: by 2002:a0c:ec83:0:b0:6b0:9479:cdc9 with SMTP id 6a1803df08f44-6b58d7787afmr72719016d6.49.1719584683594;
        Fri, 28 Jun 2024 07:24:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719584683; cv=none;
        d=google.com; s=arc-20160816;
        b=esXHViK2bHhH1fe8jMRBicyHO1BF5gOwjKA0HA9EIIAeGZPz7kfDpURaE+/xJ+4mpF
         HxT1301HMJbl1DPlYLZXPR2pbvc7addraduKIFlVEIHfleUsaVzTrDt9TObcX8Y04SjP
         fBNUBH97EszyT6sZbb6uWFyUQx+m8Jbh1PF2ZZJCSESHDC6e9d028KXMfyTLxTYHoj9a
         jY/Gkc7X8oE38De8f/FxgOTtz9HXCIG4IhMIu3XscAewDFEZv4M6hWmKp5VDhEFWnA2v
         AeqSYMGgAJFrRUUdBM95lMdP/FA3MKhqit2jMskcnaoXgoCWJsrvLDboWAfrIeWQIZFT
         y3zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=JfU3+6nOeaBoMP9gBKKz5KGzwhl6LY/esOxJus4DARY=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=AY0JFiLwj45+UwDxmxS8pi7yfpqXacu/eR5S+NfT741d+vbP0IeKHqIa+xLukbS27O
         BwxUBVzJ2dZE1Vfcw9BLs690aHqd2RVZiLS+v8oBVoBYZsGTGSxM1WklfGWZAuuIN/dO
         pue/vhyN5h49daiaciGGJG1Ny6bqPXPvfhSIyifn9R+4tZA63QrBJhvf/TCRc3DbwUCx
         6RpUxx+ci3nTAgWabXTocMTf1q6TZX0iGk8SMe20XUmzycx27OFEY28u1gxIYIhLMKoQ
         efK0IEeWlQ672jSURVUVdVdhwA/GcAvlPgR68DOas9yIfDixXYTqH+jAR3tIgqXKBpN7
         0eLQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EK0jeUS5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b59e5ace53si21042176d6.202.2024.06.28.07.24.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jun 2024 07:24:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EK0jeUS5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sNCWC-0002VD-5V; Fri, 28 Jun 2024 10:24:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sNCW5-0002TK-Ai
 for qemu-arm@nongnu.org; Fri, 28 Jun 2024 10:23:57 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sNCW2-0004PR-E8
 for qemu-arm@nongnu.org; Fri, 28 Jun 2024 10:23:57 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-424f2b73629so6783155e9.2
 for <qemu-arm@nongnu.org>; Fri, 28 Jun 2024 07:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719584629; x=1720189429; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=JfU3+6nOeaBoMP9gBKKz5KGzwhl6LY/esOxJus4DARY=;
 b=EK0jeUS5aCX9Vh+dCAwfH62R5IPDkeTJPC1wdtg5hH6Tlh8shaH/wGo7GKKM/1gZMI
 GYS7zuUzjPrvC67h9I7ZZcc8I0G5bQ919IDlfHBv5xptkdWdS5HzONV6HywHHTCdY/8W
 4B1sQiGXrwvIcnbF4Bh/bdjOxRgz5g9NdguL4vS1Ipyrq6gxnibJeZoD/wjzo7pnDIZ/
 ShL5UWAJTJ84NQlry8+CdbP5jcEoDWgen/fvnGst9VYInif6KNuaZ7pib2KKXn7HEkLU
 ujFcUJe3rMxeanGNWmGd3JO0MyKbIhAXii1/ldKvI5mRYU6Kw6YSofndC+NcrnoJGc+z
 yynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719584629; x=1720189429;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JfU3+6nOeaBoMP9gBKKz5KGzwhl6LY/esOxJus4DARY=;
 b=epALpjD9sBNuWxTdkv17uEyLf9lK+qGW2B6+12d62bq8GSp+NeICgCOLCb2Uw4J//x
 gNKE+1DJM81qsV57EGc8UmjWPGe9d52VbgBRRLKQBF87wRghwXrTlTxG9pqPi5XOLV7U
 qSTC2j/zF4B66vkzEcgA8CDpQXb04+37MgU2RjhLrPSQo8nCuYok5Obbbcvv05fcJHlC
 1ZVqfJj6KpRv4R38cVenOCffy3dHT/Pg0GKo1Owfjwj7iBg16p64wvTXl7YwjEK/xml+
 BwOhx/SsWqsoOAjkPZoO43MwRMtuyoyDD4Cb/Exzgeu9OENtaQrrciYs5ABYMmlyd8Rd
 ojAw==
X-Gm-Message-State: AOJu0Ywq1rNHBCz4Y6vhcXlqIm7Mz7Gq1RRsEvwczqDyJxgB98Vvg0vO
 MPQMTQO6TV4CASKKbLG5Cap+5z61xYOBL0EcmSVb8c4wXhFMpOKjKYzxkgsEH2YfTWivj5nm5Ev
 pu2g=
X-Received: by 2002:a05:600c:929:b0:425:65c5:79a9 with SMTP id
 5b1f17b1804b1-42565c57a7emr48275565e9.30.1719584629250; 
 Fri, 28 Jun 2024 07:23:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256af55c0asm37180945e9.15.2024.06.28.07.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jun 2024 07:23:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/9] target/arm: Refactor FPCR/FPSR handling to prepare for
 FEAT_AFP
Date: Fri, 28 Jun 2024 15:23:38 +0100
Message-Id: <20240628142347.1283015-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: OSbxy/FHmq97

In AArch32, the floating point control and status bits are all in a
single register, FPSCR.  In AArch64, these were split into separate
FPCR and FPSR registers, but the bit layouts remained the same, with
no overlaps, so that you could construct an FPSCR value by ORing FPCR
and FPSR, or equivalently could produce FPSR and FPCR by masking an
FPSCR value.  For QEMU's implementation, we opted to use masking to
produce FPSR and FPCR, because we started with an AArch32
implementation of FPSCR.

The addition of the (AArch64-only) FEAT_AFP adds new bits to the FPCR
which overlap with some bits in the FPSR.  This means we'll no longer
be able to consider the FPSCR-encoded value as the primary one, but
instead need to treat FPSR/FPCR as the primary encoding and construct
the FPSCR from those.  (This remains possible because the FEAT_AFP
bits in FPCR don't appear in the FPSCR.)

This patchseries does the necessary refactoring to our handling
of FPCR and FPSR to allow us to implement the new FPCR-only bits:
 * we flip vfp_{get,set}_fpscr() and vfp_{get,set}_{fpcr,fpsr}()
   so that the former call the latter rather than the other way round
 * we make the migration code send FPSR and FPCR separately when there's
   a bit set which can't be represented in the FPSCR format
   (we continue to use the FPSCR format on the wire when possible,
   for migration backwards-compatibility)
 * we store the FPCR and FPSR in the CPU state struct in new
   vfp.fpcr and vfp.fpsr fields, rather than in vfp.xregs[ARM_VFP_FPSCR]
 * we make sure that writes to FPSCR leave bits in FPCR that aren't
   in FPSCR alone

The series also has a bit of tidyup of some of the macro naming etc.

thanks
-- PMM

Peter Maydell (9):
  target/arm: Correct comments about M-profile FPSCR
  target/arm: Make vfp_get_fpscr() call vfp_get_{fpcr,fpsr}
  target/arm: Make vfp_set_fpscr() call vfp_set_{fpcr,fpsr}
  target/arm: Support migration when FPSR/FPCR won't fit in the FPSCR
  target/arm: Implement store_cpu_field_low32() macro
  target/arm: Store FPSR and FPCR in separate CPU state fields
  target/arm: Rename FPCR_ QC, NZCV macros to FPSR_
  target/arm: Rename FPSR_MASK and FPCR_MASK and define them
    symbolically
  target/arm: Allow FPCR bits that aren't in FPSCR

 target/arm/cpu.h                  | 109 ++++++++++++-----
 target/arm/tcg/translate-a32.h    |   7 ++
 target/arm/tcg/translate.h        |   3 +-
 target/arm/machine.c              | 135 ++++++++++++++++++++-
 target/arm/tcg/mve_helper.c       |  12 +-
 target/arm/tcg/translate-m-nocp.c |  22 ++--
 target/arm/tcg/translate-vfp.c    |   4 +-
 target/arm/vfp_helper.c           | 187 +++++++++++++++++++-----------
 8 files changed, 356 insertions(+), 123 deletions(-)

-- 
2.34.1

