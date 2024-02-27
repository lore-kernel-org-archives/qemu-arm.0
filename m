Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2661260ejf;
        Tue, 27 Feb 2024 05:15:15 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUzacDPver3PbERV05bCAueU70oSeOqQATBF3lwcJugo3eZwcVbteUHKgdj6U4VUDt+2BtQqMgq6iV51Xrd6yPJ6yx5z/AL
X-Google-Smtp-Source: AGHT+IF8fr/xEjEmRAjRdHXHe8gcd/lGbUryH8RHsfzescDOSpLJogHcaGQ4b7kVZCq/fmKS0lGg
X-Received: by 2002:a05:620a:b05:b0:787:8115:23f4 with SMTP id t5-20020a05620a0b0500b00787811523f4mr1586893qkg.61.1709039715481;
        Tue, 27 Feb 2024 05:15:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709039715; cv=none;
        d=google.com; s=arc-20160816;
        b=aqpYE6+nqK/kUTCwIXi0JGzVWM+Nm+3TI91JgNeQeEkaXD2tpdRJjYztS8LROpfHbv
         fMfi8lxx/yQGOU1XLfa1DQ1N6cnLQSrgyvpmX7pEMmAYRA5qnJ8/V0Dt3c8wiGNcucaX
         TA2SFcLzw/WK3+3oDcK2hoPKwEeXErUtCzCQ4vvhZrJ9aDM0V7aqKQGEtFhVnP2tIoDG
         XiYupwIKq9EKkxgvthu3igSpEaVrKqUYKdbIDlnG9kZY1e79h9a3ltCUH/VZh5HEuaiX
         6fLKcJkdh3Rj0GkBA7ALjfrEsuD6nJahOFu4OIKbOMkm+R+zrD/4NbVcbps0RI7IK7QI
         ahrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=CSBJkUzFNY8pF85hnsZXOaZA/YNfrkOwqoVio0ioIW4=;
        fh=DBwo5oYV+Zl89FPcGyBzo6mnqwnGCoM6YpiQGc4/RNc=;
        b=uXAR7ehzST1OyLL/NzJSPKfYmV5dPsuPdFvA5XWKl/iOJg/hS5s0LyDNDf4AmPLCaB
         j1zrBX9kUxapzd3OFT0Yg38DkyzYgNp+DYtWfrbCShFmkXXDdydhZEn21XVndVO8TKT1
         FpQsf4Vhv0+pUas3iGzWPkcFpvb43sn45XRhJmE1r9YgjspS+IWWu/vPO0Fke/E8U1EC
         yE+FdLIS3UIgJwylq565ms71/prMzZKPgpy/xULEfyVG2UxDDTgb6OXuHY5T4ZzNcyFH
         ENCBj/+VNcPleF+GgcPBBEPRXd0aZ6kexvy4obZKh3tWMaAKb5sm+zm3muyTC9eIM2dA
         XZhQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=TEf4P18V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d20-20020a05620a137400b00787d2fe3a08si4399355qkl.7.2024.02.27.05.15.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Feb 2024 05:15:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=TEf4P18V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rexIL-0002mf-AM; Tue, 27 Feb 2024 08:14:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kirill.zhumarin@gmail.com>)
 id 1resvs-0002jl-OY
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 03:35:24 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kirill.zhumarin@gmail.com>)
 id 1resvo-0006JA-QD
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 03:35:22 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-29954bb87b4so2743918a91.2
 for <qemu-arm@nongnu.org>; Tue, 27 Feb 2024 00:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709022914; x=1709627714; darn=nongnu.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=CSBJkUzFNY8pF85hnsZXOaZA/YNfrkOwqoVio0ioIW4=;
 b=TEf4P18VeILcm41tl59MHNgLzFuXrgSpkncDLMahA2J6XGt9WbxZCh+ZWvOVkCV/Li
 3fUf87PgqwX7153L3R6Vdi5htTDJKL68cP05E6/6fu8jazrpaamYABMwhON43RtOSEKo
 /vGhOBQ0vYLpko5u+h2S1aWwnQLknHtOa9ck0uMFDV6GACZqlsAuPrSXeB+hsxnpCppd
 vi2Aw0sqCxvIXNrw+bMhPCrR2+8bD6SyKTv9Km9SFWIrLUkzmXADo+t5FOIztG5IhT+P
 zXefouWnDLyFwWKRWeTIP0gU5zmFQcC99v8tz5UY12IkFFVRamawjkvWOCrYsJmCbeFA
 lgnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709022914; x=1709627714;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CSBJkUzFNY8pF85hnsZXOaZA/YNfrkOwqoVio0ioIW4=;
 b=Yv5qc+dgrlz2upmdwXVp9l6UEGLGoGfleTJr671UMhooJxw/FAZxax5nn1AZFIJnqc
 EQVJVZseN+l4AunAOJlk2WL/BGXQwg3pshTmgyyIK28Pt8A1AnVUqIWDwtCli26nU88J
 yNusqnOz4hjxmkEVqpZwwz93kYoq4c2rx+PcUANzCaXJ+C5wOb5pf+BuIVAwOW5xOa3a
 sAUsKXJ4NVlqJ/zozrxrcZpl43Qi69gGGqHUdwwNMGSr6BsoJyVTeGuetX3rMhkf5reu
 JrwGl6UZ3ZRyl/zYWFefPXn8OwuJa2Sg1zybjBdjZMnMylmiW4rwLmwrXI9dK+kvXmym
 WyLg==
X-Gm-Message-State: AOJu0YzWf8tCUh2D1bI0/mQp8xaPn/Cpx+z5MDuvkBwxN6XFDwb2b9m2
 uDe491Ke2mJ3hMVrqz9nSfZQfm8Ubw0S/ghWerI/gCQL81G+RH0/1wQkxerUcdV1j9G4WLCy6gx
 7ohgXsONFPskinI3QU0yamHVNBUgky4Lc87+sKg==
X-Received: by 2002:a17:90a:4285:b0:299:6a7f:cc09 with SMTP id
 p5-20020a17090a428500b002996a7fcc09mr6394879pjg.33.1709022914021; Tue, 27 Feb
 2024 00:35:14 -0800 (PST)
MIME-Version: 1.0
From: Kirill Zhumarin <kirill.zhumarin@gmail.com>
Date: Tue, 27 Feb 2024 11:35:02 +0300
Message-ID: <CAKAF0m-DmGa-dRABswuSfWkQTh1Cqhie2APi=fGdFLEUA+YaWg@mail.gmail.com>
Subject: Undocumented behavior with CPSR_c mode
To: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=kirill.zhumarin@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 27 Feb 2024 08:14:51 -0500
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
X-TUID: zLwjkDx2/IVs

Hi all. I found a bug. But I don't know if there is a problem with
QEMU or real hardware.

My environment:
Real hardware: Infineon PMB8876 + Infineon PMB8875 (ARM926EJ-S core)
QEMU: from master, arm926ej-s

I found that the M4 bit in CPSR_c is optional when setting CPU mode.
On real hardware, modes 00010 and 10010 are actually equal.

My test code is like this:
```
#include <pmb887x.h>
#include <printf.h>

static inline uint32_t get_cpsr() {
 uint32_t r;
 __asm__ volatile("msr cpsr_c, #0x2");
 __asm__ volatile("MRS %0, cpsr" : "=r" (r) : );
 __asm__ volatile("msr cpsr_c, #0x13");
 return r;
}

int main(void) {
 uint32_t mode = get_cpsr();

 printf("CPSR: %08X\n", mode);
 printf("MODE: %d%d%d%d%d\n", (mode >> 4) & 1, (mode >> 3) & 1, (mode
>> 2) & 1, (mode >> 1) & 1, (mode) & 1);

 while (1);
 return 0;
}
```

And I get different results on qemu and real CPU:

--------------------------------
qemu
CPSR: 60000113
MODE: 10011
--------------------------------
pmb8876 or pmb8875
CPSR: 60000012
MODE: 10010
--------------------------------

QEMU just ignores setting invalid mode.

Of course, I understand, this is an invalid code - according to the
ARM documentation, "00010" mode does not exist.
But this is not a synthetic code. I found it in an existing bootloader
for pmb8876, and it works on a real device.

That code looks like this:
```
msr        cpsr_c,#0xc2 ; go to the IRQ mode
ldr        sp,[DAT_00082e28] ; set IRQ mode stack
...
msr        cpsr_c,#0xc3 ; back to the Supervisor mode
ldr        sp,[DAT_00082e2c] ; set Supervisor mode stack
```

Unfortunately, I do not have other ARM926EJ-S processors to test the
behavior on them.
Should QEMU repeat this undocumented behavior?
