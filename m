Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp2625948lfc;
        Sun, 17 Oct 2021 21:57:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEQeA54mY1twoIRYlyaN4gI1OV1lo7GgK+tApuUKgiXKQ/3x3V+P4bbYQJ3AFWjO2oyfHE
X-Received: by 2002:a25:378e:: with SMTP id e136mr29200595yba.26.1634533068801;
        Sun, 17 Oct 2021 21:57:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634533068; cv=none;
        d=google.com; s=arc-20160816;
        b=pU8PWeGDkSfkrcN6O1Mq1rwCL/w4bD5s9g69MBmD7I4kpcQz0Tu/ELbaXBnjbWcUwT
         SuckZs6Bqfne+WH+QH2282aWbJIApiWudBTPRAClqpDXu9+x705it6fHnZwbRB2V1s0E
         MHmyjPIXhCL+7Pc7Pd9Dfx4a+7WumohIBFRywYrSlPCsemSqPUw0sFLN9YfbMShV0JQ8
         lw2Eu1Kh27B20beTSglp20FI55DrEdbqX2ISLU4W1N9VRFi+dL4G939dVudebDIhD25U
         7uwnyMCh+H7ysDpXijQ/c8QoLbR0pT5JXGcONVP5w6GguI2s1Yx7YJq9/GZnMJBXmVrV
         Dcrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=GtaziyCnqfG5Xjo/j6TeduCvP6NnpHRolRfWiiKaqW0=;
        b=UD84HzJvWbXDPoscztd9keb+s+xaCkFi/h7jegQidteFGh37kq7tqG5zaDMDO0j2pq
         S06crfSUjh286Z/shNX7DOa60Qbp3tb6mCBy1UprUr1IfGtwyoujPghH19xDUYT43JC2
         4mB+otPtC1CnSTOSopFyR4K7mnM88TPmfyPpwecFIA4WChTwQIfVpRJohsSf2N7LuVMX
         nkFG1AeqZKygPl9yu03pD4/UPnJJyDAmp5EDVZiS1sNnmn6uL4EKbA5ia/m8IhYsN+JP
         45lkqn1WdLPzP/R771b4+eTjked/XicwYC1Svekaks66cXGMIFgQ7n1ujyFjGD3kyFBI
         mDbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@zx2c4.com header.s=20210105 header.b=NYF2ksRH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=zx2c4.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b81si15805286ybc.201.2021.10.17.21.57.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Oct 2021 21:57:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@zx2c4.com header.s=20210105 header.b=NYF2ksRH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=zx2c4.com
Received: from localhost ([::1]:48348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mcKia-0004Cd-6S
	for alex.bennee@linaro.org; Mon, 18 Oct 2021 00:57:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=/m5+=PG=zx2c4.com=Jason@kernel.org>)
 id 1mcKNP-0005F3-04
 for qemu-arm@nongnu.org; Mon, 18 Oct 2021 00:35:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:42154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=/m5+=PG=zx2c4.com=Jason@kernel.org>)
 id 1mcKNL-00007b-AH
 for qemu-arm@nongnu.org; Mon, 18 Oct 2021 00:35:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 124876127C
 for <qemu-arm@nongnu.org>; Mon, 18 Oct 2021 04:35:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="NYF2ksRH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1634531746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=GtaziyCnqfG5Xjo/j6TeduCvP6NnpHRolRfWiiKaqW0=;
 b=NYF2ksRHe6AKXVO9N65l9eIXZQ65mt51IEAgxG1RLEYkrA5kJbvQV+uuYT1gFNco5K5G6C
 wts9NA7MzaT7d2yUfLZJCONXANL7xZfKc70ZJt9+9guRrww6pwTN8s22/XHxsGGNN1n8yP
 1Qc0FjuDD0mLsmRLRWYheYLOf/uvHHU=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 79c8c911
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO) for <qemu-arm@nongnu.org>;
 Mon, 18 Oct 2021 04:35:46 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id g6so700824ybb.3
 for <qemu-arm@nongnu.org>; Sun, 17 Oct 2021 21:35:46 -0700 (PDT)
X-Gm-Message-State: AOAM5310mDz8H8kmGgeJcvnyZ0wnkkksTqmqcGWM3tHN1NKavVnIJ+ik
 hdxwmtSDlX6mPB/h0tqVttCkVB70Qd3Z0zqmcXQ=
X-Received: by 2002:a25:bcd1:: with SMTP id l17mr1219630ybm.449.1634531745841; 
 Sun, 17 Oct 2021 21:35:45 -0700 (PDT)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 17 Oct 2021 22:35:35 -0600
X-Gmail-Original-Message-ID: <CAHmME9pA1vOzOocjMGBp0JeQEzYHjEy6qQjbnQM4eukzrSaWfg@mail.gmail.com>
Message-ID: <CAHmME9pA1vOzOocjMGBp0JeQEzYHjEy6qQjbnQM4eukzrSaWfg@mail.gmail.com>
Subject: tcg emulation of arm64, running windows, emulating x86
To: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=198.145.29.99;
 envelope-from=SRS0=/m5+=PG=zx2c4.com=Jason@kernel.org; helo=mail.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rIXCA5LxHJF0

Hi,

QEMU appears to successfully run Windows on ARM64. This works
especially well with kvm when there's real hardware, but it also works
using TCG.

Windows on ARM64 itself has an emulator for x86 inside of it, which is
more or less essential, as the OS hasn't been fully ported to ARM64
(e.g. .NET 4.5 binaries). This emulator works fine in KVM with real
hardware. It worked fine in TCG, through Windows build 1709, but after
that Windows build it no longer works. Instead, x86 programs hang with
100% cpu usage at some point during their emulation. Presumably some
new feature is being used that TCG does not implement or implements
incorrectly. I would like to find out what that is.

There are a number of things I could investigate to better understand this:
- Debugging the Windows emulator at runtime and seeing where it's
stuck in a loop.
- Debugging QEMU and seeing what the TCG code gen is doing.
- Carefully diff'ing xtajit.dll from 1709 and from after 1709.

But I thought it'd be helpful if I asked here first about potential
"hints". For example, does anybody know of some feature TCG doesn't
implement that an x86 emulator on arm64 is likely to use? Any pointers
or intuitions?

Thank you,
Jason
