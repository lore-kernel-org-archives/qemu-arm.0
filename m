Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp536733lfc;
        Thu, 3 Sep 2020 06:32:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHX2KNJhNrv7Kq0x3nh1R2Q/0iKSlEFREJW57RkQXYtGiLplzPbrvJlALt8YH8ZcEvlRYI
X-Received: by 2002:a25:5856:: with SMTP id m83mr2686061ybb.325.1599139946865;
        Thu, 03 Sep 2020 06:32:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599139946; cv=none;
        d=google.com; s=arc-20160816;
        b=RZSI0jddiXxbUGrejr0Elt2hZekhlDiAI0jm+aWZVYHv6h98IOWILBYsFP/WYFXSZc
         7nm/5KPJishyALA7mjciwphXBtplz6QDFQz/fI9BMx2V/Vu00RkfgVMpJUNaMroOREPL
         /7egwp6ycoy5zGKXB0BOl3AK5A+5QpAKGA8823YxxjqFTTpPSCFBgSRCrsmP3QUmN5Uw
         PpeTXlv9QMn3l2jjcR8IPZ2ps9aqQ4F9URIAgbAk5Vhifk1EIrnkjb6czDkbwtVJ4m0V
         4dXwqSVAqZCpRF+Ps3KVIkNG35aiR5xzTa4vayEm1vTOPVm78kqUZ6vuIXXcrf04VbsW
         +p4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=IS2FHzcfT+ool6leykwthfQBd2V3RQBhWX+2lK4kgQI=;
        b=ldT6Mmu9H7ibQj3zsNmzYTFBacs/Kmo9FhFNeh68wsfKYRPIQY7IoZ8cH1JLO9v9yA
         46fJAz792rX/0Ii/np3v2NKKNXv2oX5cgsePSq+0avtkNVi6ffcki6Ts/HmR9Cy2b2/i
         12pp42qGN9COahBrVo/9FwYJQWes/lJSToDJqsk49CWArDUyD24t6oj6s13M2mlNFf7A
         XI3joTXPjNVDcm6KKsJMUsI2CNje6CT+eOq5C3j6wYBmEs3Lcz1y9flg5DlmokyqUtnU
         UUmsPnFvXVkke1Ev/FGR7U3Z55A90ummw1WUN9jyIha/u+pQZTUA2J+6ahBZldR3UU4U
         MGvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bqlRJZlq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r16si3110888ybk.302.2020.09.03.06.32.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Sep 2020 06:32:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bqlRJZlq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDpLm-0007Ia-7D
	for alex.bennee@linaro.org; Thu, 03 Sep 2020 09:32:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kDpLd-0007Ha-4G
 for qemu-arm@nongnu.org; Thu, 03 Sep 2020 09:32:17 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:39830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kDpLa-0007ur-Lu
 for qemu-arm@nongnu.org; Thu, 03 Sep 2020 09:32:16 -0400
Received: by mail-wr1-x42b.google.com with SMTP id a17so3242424wrn.6
 for <qemu-arm@nongnu.org>; Thu, 03 Sep 2020 06:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IS2FHzcfT+ool6leykwthfQBd2V3RQBhWX+2lK4kgQI=;
 b=bqlRJZlqNn/GTIJmJrTh5zrBPGPKEnn1llMYtjSitorBlIHMCVxqvLy7zCrjdwjFpz
 /KTRQQAyD9wfmDogOlQ9ttZ7kJ5Qp01Kg7MMAzOBHmjpXTqpMq/i/0exwINk0cnfDdhy
 eyG2oh8gnChxqKdGPostdg1y57vKdF2HSGCu4+m8AqD5NhKcOE00FNLfJUWC/SM2kr+x
 hl+IUzd0yGz9gQpvvRpjxcMVLpdRhsoCm/WeZaYZdkhX0R+3uCqqqzupYLgDOaNZPV2c
 R1YaqJo+Pe+QRkXAyQYdyghAcSaPyZPh/K2hiXHo3t6MR4IZECSZKIoF9ZlBYFjmM+Kh
 2+ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IS2FHzcfT+ool6leykwthfQBd2V3RQBhWX+2lK4kgQI=;
 b=ELhtdmpmIROgecQxcwhlRtomfw28wT5yxNhk6nAEzL0p0NOFwbYbhBDVHJgii1J7rK
 kHSJm4solb8UtHfSUf9qFKehr7MnaqABiq1mpePqtFSiLfiJqw/W25Dak+/bJez+45sR
 foKkF3LmNulwRRk/UNDk7zDhS1s4meQ9hiRfJD4BiZ9EHVNQol7Hpd1EIoYPRoNVynCt
 JdzC/1SlF7mTLv6GcU2WRHHMv3GMziBS9qFNYuQJo3u3rnx8REuRtl77XzTCvJ6jGM2a
 PQ38oSeYrWxX2FicpweDMc9MrYaholdkM7rUfws9ltFOhzUB35kH5vz8x98NvXbcVnPS
 fXmg==
X-Gm-Message-State: AOAM530GB+b6iCbzfeOFAP1XY0eKzclFKs7JE5uZpBaxkz4roiquB2TV
 ic8l0eDPzWnPaYl/kTfg1EIqjfCAfM9TC+y6
X-Received: by 2002:adf:f808:: with SMTP id s8mr2476180wrp.268.1599139932186; 
 Thu, 03 Sep 2020 06:32:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id k24sm4301988wmj.19.2020.09.03.06.32.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 06:32:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/3] target/arm: Decode Neon fp sizes in decodetree
Date: Thu,  3 Sep 2020 14:32:06 +0100
Message-Id: <20200903133209.5141-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xWX86Eebri1P

This patchset fixes something that Richard pointed out during
review of my fp16 patchset.

In the Neon instruction set, integer operations always have a 2-bit
size field with an encoding corresponding to QEMU's MO_{8,16,32,64}
constants: 0 for 8 bit, 1 for 16 bit, 2 for 32 bit and 3 for 64-bit.
However for the floating point instructions, since only 16-bit
and 32-bit floats are supported some instructions use one of the
size bits as part of decode, leaving only a 1-bit size field,
which might be encoded either as 0 for 16-bit float and 1 for
32-bit float, or the other way around as 0 for 32-bit float and
1 for 16-bit float.

Currently we simply pass the raw size field values through from
decodetree to the trans_ functions, which means that when reading
or writing the code for a trans_ function you need to know the
encoding of the size field for that insn. This patchset moves
the handling of the different possible encodings into the decodetree
file, so that the trans_ function is always passed a MO_* value
for the size.

thanks
-- PMM

Peter Maydell (3):
  target/arm: Convert Neon 3-same-fp size field to MO_* in decode
  target/arm: Convert Neon VCVT fp size field to MO_* in decode
  target/arm: Convert VCMLA, VCADD size field to MO_* in decode

 target/arm/neon-dp.decode       | 18 ++++++++------
 target/arm/neon-shared.decode   | 18 +++++++++-----
 target/arm/translate-neon.c.inc | 42 ++++++++++++++++++++-------------
 3 files changed, 48 insertions(+), 30 deletions(-)

-- 
2.20.1

