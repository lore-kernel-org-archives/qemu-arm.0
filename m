Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp3193036lfi;
        Mon, 30 Mar 2020 14:04:26 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtbya2ySIubu0irLnQPZBL3qM3596leXvwjUuXgtQUuuMkWFKSYf3fxqnhPRU1ze9EjpDYu
X-Received: by 2002:a37:4c8d:: with SMTP id z135mr1245681qka.128.1585602265801;
        Mon, 30 Mar 2020 14:04:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585602265; cv=none;
        d=google.com; s=arc-20160816;
        b=R3k0q52xbCTTWF5py5c0ZAB3FG8gIcYcDeqtovydXWqR7FDQ/FlxuhEAqd7WGaV8HZ
         tCP9UY30tDgkdt07cyGIypZs6lLIqolyqRS/zECX0MrEEy5DF/aDGgcEYXNY3b96W2wF
         nwxQc6Nbg1+SMLgNnOXLX9wKLrUb/9bAcQKy2wQ2DqNE8C/Z2WjInk3RpqXGX8tZOth5
         u/yLtfbkfHSd2R8yNVvlspDisjCeTjH7RE2tnM45hr3EO+8bewuZZgPBAngzpYhZy/44
         wYvtoGLz1hpiroUC+aLkCSh7+TS49+VhQsvnpLw92tWYm2iLt1lLHu8j6zZKxVN0jc16
         agaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=GOZtPYlJYkzukGwNx4Y9x7WEX4ppgFY4ZIR1eVR/7yU=;
        b=CN7y35XwFxoZ23nRyFJlX83Gx9JaspVUPiynmIPsE5Hrb2vMiJNu6IvxvNrmbJOQta
         vUgWUjYpA0Fc7QkehXz/c2XS0Yqo5Hdz00W45qEQ5Tu9A+As0xfHsya1nLAyQLwVZ08a
         iJ1nt0qqzqVnjAhnuj+05FrGjd344PgrUrITouuzq1BtLNfIe3FxBKj8ZTORxUjjYYMm
         Runz9uidQ8OKkjIFFYGNPctrnipKneE9L9jev06z0D79MixGYboLtUcmHDV1FWZtabnk
         sZ9ZmYzKb6gz1j/d/aZHPSEnRqlUtnDFdYFrIROzofxC7gTSqqPSR0vx3q72NoNcFsFD
         rwXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QVzxmaMK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c14si9000048qkc.56.2020.03.30.14.04.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Mar 2020 14:04:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QVzxmaMK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jJ1a5-0006YC-2N
	for alex.bennee@linaro.org; Mon, 30 Mar 2020 17:04:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40486)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jJ1Zl-0006XZ-Vg
 for qemu-arm@nongnu.org; Mon, 30 Mar 2020 17:04:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jJ1Zk-0002d5-DX
 for qemu-arm@nongnu.org; Mon, 30 Mar 2020 17:04:05 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:46085)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jJ1Zk-0002bF-2V
 for qemu-arm@nongnu.org; Mon, 30 Mar 2020 17:04:04 -0400
Received: by mail-wr1-x442.google.com with SMTP id j17so23328507wru.13
 for <qemu-arm@nongnu.org>; Mon, 30 Mar 2020 14:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GOZtPYlJYkzukGwNx4Y9x7WEX4ppgFY4ZIR1eVR/7yU=;
 b=QVzxmaMKMve3RG9zta7/gXvwyTcZxoq8Gk6nC8mZ2Yw2yyCXMGy6+nYN0cIAcAwwrp
 K6qc38osB+k0mHsc20jVfPpYR3vaG3Rs2I/H1ZDPzBo+tDpWF07StARg27Pfjmk328+4
 S70fRZ9HkHuZkpwHWm+6G4onzArSi2J26Jz2lP9b3w2S24tNTb/NaMobhcHlLbY8AewF
 wZiUsmDChgzpjmj4M3PS/47hhEWd9u9OnYwBpCnRjseBekIGbCw4xnrx6EwtYSPRDo3J
 n3U7ZGKE+xymKWuEUOk8G6SxKcRZ1pZOB/2VXnfgUfKPSfykqc4eqlDgZWsOJHsauuNY
 PvHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GOZtPYlJYkzukGwNx4Y9x7WEX4ppgFY4ZIR1eVR/7yU=;
 b=USCHApjpl0YDDQucPQqj8kZxjiSZ7kbR1HL0g3MUHC+XTGHKjLI1MBbw6cVQ7+T7t1
 c4RSnMLuLK6cmP5/+H3i2E0kRKt7f+DdgkvWZkK3WBn0M0pjUk/6zLTAsqRhSmTu3z9r
 Ml0+0ljT1jgT8SO5Br98n/sOMXhPG9tQ2wXps85XovchqKqFpJkdnmab/nLMJ7oVBqW+
 2gzQfyYlJKSEJE8yfiUId/dIq/oqKDM57T2gDbcTgsy/wFYtB4yr+haa9OjIxL240UOf
 eNzh1ItzkyJG1VssAKmrnn54e4KBj68BytkPyLh8k5EsrOAskCdaiYdc0//Gwud8U92w
 5Spg==
X-Gm-Message-State: ANhLgQ1JP3Vnkssw/P0w9Kv5nCZumcF/9M++yT3eKsYJZUwx4h0emISj
 1stlePH2scFggZ+oVMbzP2ajjgDxzPHXeA==
X-Received: by 2002:adf:ab5d:: with SMTP id r29mr18258373wrc.158.1585602242416; 
 Mon, 30 Mar 2020 14:04:02 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p21sm1012700wma.0.2020.03.30.14.04.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2020 14:04:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/4] arm: Implement ARMv8.2-TTS2UXN
Date: Mon, 30 Mar 2020 22:03:56 +0100
Message-Id: <20200330210400.11724-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
X-TUID: XF8/OQZ7wdmB

This is obviously not 5.0 material, but I figured it would be better
to push it out for review now rather than hang on to it and forget...

TTS2UXN is an ARMv8.2 extension which changes the 'XN' field in stage
2 translation table descriptors from just bit [54] to bits [54:53],
allowing stage 2 to control execution permissions separately for EL0
and EL1.

For QEMU this had the potential to be awkward, because it means that
the stage 2 translation now depends on whether it's being used
for an EL0 or an EL1 stage 1 access (the address doesn't change
but the access permissions do). Fortunately, although we allocated
a QEMU TLB/MMU index for Stage 2, we never actually look anything
up in the TLB. So patch 1 turns ARMMMUIdx_Stage2 into a 'NOTLB'
index (ie one without a QEMU TLB), thus avoiding the complication
of splitting it into separate Stage2-for-EL0 and Stage2-for-EL1
indexes. Once we've done that the actual implementation is pretty
trivial -- we just need to plumb an extra 's1_is_el0' argument
into get_phys_addr_lpae(), and then use it to decide what to do.

Peter Maydell (4):
  target/arm: Don't use a TLB for ARMMMUIdx_Stage2
  target/arm: Use enum constant in get_phys_addr_lpae() call
  target/arm: Add new 's1_is_el0' argument to get_phys_addr_lpae()
  target/arm: Implement ARMv8.2-TTS2UXN

 target/arm/cpu-param.h |   2 +-
 target/arm/cpu.h       |  36 ++++++--
 target/arm/cpu.c       |   1 +
 target/arm/cpu64.c     |   2 +
 target/arm/helper.c    | 183 ++++++++++++++++-------------------------
 5 files changed, 107 insertions(+), 117 deletions(-)

-- 
2.20.1

