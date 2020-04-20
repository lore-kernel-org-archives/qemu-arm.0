Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp4309672lfm;
        Mon, 20 Apr 2020 14:23:56 -0700 (PDT)
X-Google-Smtp-Source: APiQypLCr9qicTTD5a7l8P5huE4fECeXSNKyOi7t4At/YPN+ukfXWf8z1XkrU0HvU334NOujI65F
X-Received: by 2002:a0c:b5dd:: with SMTP id o29mr6062682qvf.87.1587417836539;
        Mon, 20 Apr 2020 14:23:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587417836; cv=none;
        d=google.com; s=arc-20160816;
        b=wUv7zX6HaAGCpXEIAUy/mgyFxFLoJ5zfnz/Pjxo2Zh1pYpo4QOSEZxg/E/Xqlh6pAG
         D7s+06K1hUWGSOlqGAoo/ROt8SFdejSRmUAPGUfBZCvdlu8sQ6v5vKkGEx/P8dKEXk3Q
         4Mcm5VuFiLt/RYqlog/m8qLfH3M/Iq73kvvnMvFVXE1PRiV4siyxx8ZYh5FZru8wdkdu
         Fv3nXjbuQcxuHXODiV3VqFaEGQLXo8v7qxX+FMyu9dOGeePlbkX7kzthP7qGEfSy7y2Q
         7hm9ylmjVkScD/uzkRs+7KbBCs2ngzjW+YIwm98uRI1Af0Jlai+cloL1XB3WlbB4tFns
         fbEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=jR1xP74Qc41hrsGlhwi6bPFQ+EgssQ3e/OSS6cjeibE=;
        b=064U2RyXTzmQpGKR7wFVYnHyu57RTGheu/mgMb5jHz03fGovgTuls2C921IFs8dm/4
         xlQ11SJNDXZ3E27QL8afA0HttlKRfOER9P+e8vNiuOoHNkjO1E7KVlg49ZNUq7vQNowC
         Rk1dth/5X4Kot8R65mzAetdLaGtIyjUxABgG2AjJLXHyP5xxUpU2ucskALnFDqLcB0Co
         +FhA8FmAh/9RYHVS1CEI+maQAOPlpJOQOTcZCdX6142Hy8JPpzNqQoL0mLy0GvqbrOkF
         jZNITrnR4cMuGc6sFiIhXyWYov1cwmiaGdPHMVApgNs7D56H0dLeHc3i9oozLUyfk/jy
         Nunw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VQoiLqSx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o14si299270qkk.228.2020.04.20.14.23.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Apr 2020 14:23:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VQoiLqSx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jQdtT-0008ID-U8
	for alex.bennee@linaro.org; Mon, 20 Apr 2020 17:23:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42064)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jQdro-0006nR-5N
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 17:22:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jQdrn-0006kG-Fw
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 17:22:11 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:42853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jQdrn-0006gf-3o
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 17:22:11 -0400
Received: by mail-wr1-x444.google.com with SMTP id j2so13992079wrs.9
 for <qemu-devel@nongnu.org>; Mon, 20 Apr 2020 14:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jR1xP74Qc41hrsGlhwi6bPFQ+EgssQ3e/OSS6cjeibE=;
 b=VQoiLqSxqNcwNBHqL+X6tVNTcAUM0cvZnZ2mGUO1yLnBrYBVmmH5kmR85yWDlinRSp
 0fj3+yknAVmi/8gUoE5C+HXd1vp5VcJnm+W24LJs/pO1ibHnbAaHsRslBsa1iuK6ejOT
 0Zph/nMjQuP/d/urfsirDD9dNAE86en7AzpkwuSIf5CVKQO5PwujdKQVpXcQ4yeXflt0
 eKXJNDyTkDnrHkxH/Rt0anaGeKsG8BkT0KBIgiW84GtFNPOZkdkuqpRSlogPARlIyg/e
 wTOycxRSK6M1bwjsXhbqNw3tTf1TyvOuP/wFfRpA9o89mJVP0arxliIc+5KD5f2ugfgM
 oyNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jR1xP74Qc41hrsGlhwi6bPFQ+EgssQ3e/OSS6cjeibE=;
 b=dzOV3dcf+5H+LOA+N5pLOp5pyVKQVEM7yZFphtDvq7MA3A+rd31hJe11bNWIQRIAfY
 M12xftinG/wI3f6kbxPRDlPolYSH3Gh0vBWK5cvRpshZkr0L9U1ppORs4GOHWsJ6S/6a
 bIftpJXNfWCpJDycaQutaS2zLyhSX6t045pVmtiEJGJaKilnygt9XPM0eZLpoYCzt7wC
 PAehG5/ZFePmFWv9kVUda+wWxgKKyqdCmrTGWsG3CXPXKqN/haq21E23NkJsrAEyg9c6
 IJjanhTWfVBfGwH7EiH46JgRcCzVSOiP/On4tuiBcU6FtR6Lu+nr7OfwtdrwxVTNQDW0
 aK+A==
X-Gm-Message-State: AGi0PuZ4AGC8GzEf6HBbPbBfyDZrdGSiQAt20RGRlJdepRbKtuihEoy1
 yOFVV6EqyvHdSVxYgWJnhlNDBw==
X-Received: by 2002:a05:6000:f:: with SMTP id
 h15mr20403789wrx.408.1587417729496; 
 Mon, 20 Apr 2020 14:22:09 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j10sm823663wmi.18.2020.04.20.14.22.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 14:22:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/4] linux-user/arm: Fix BKPT, SVC immediate handling
Date: Mon, 20 Apr 2020 22:22:02 +0100
Message-Id: <20200420212206.12776-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::444
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: omerg681@gmail.com, Riku Voipio <riku.voipio@iki.fi>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zNDiHLfvZnGV

This patchseries fixes issues with the code in linux-user/arm/cpu_loop.c:
 * it incorrectly thinks BKPT is a syscall instruction
   (https://bugs.launchpad.net/qemu/+bug/1873898, reported via irc)
 * a stale line of code means we incorrectly NOP SVC #0xf0002
 * we don't implement the distinction between 0x9f0000..0x9f07ff
   (should return -ENOSYS if not implemented) and higher numbers
   (should cause a SIGILL)
 * we abort() for bad immediate values to SVC (ie not the 0 of EABI
   or the >0x9f0000 of OABI); the kernel delivers a SIGILL for these
 * for Thumb mode, we never use the immediate value from the insn,
   but we always read it anyway

This patchseries fixes all those things. (I started out fixing the
BKPT bug; everything else is problems I spotted along the way while
I was reading this bit of code...)

thanks
-- PMM

Peter Maydell (4):
  linux-user/arm: BKPT should cause SIGTRAP, not be a syscall
  linux-user/arm: Remove bogus SVC 0xf0002 handling
  linux-user/arm: Handle invalid arm-specific syscalls correctly
  linux-user/arm: Fix identification of syscall numbers

 linux-user/arm/cpu_loop.c | 145 +++++++++++++++++++++-----------------
 1 file changed, 81 insertions(+), 64 deletions(-)

-- 
2.20.1

