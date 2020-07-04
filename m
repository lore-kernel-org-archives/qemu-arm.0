Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3330989lfm;
        Sat, 4 Jul 2020 06:18:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjUAovxDmBCrXVMXsVKfWXgPKrjnPcGzt2NKcQAo/KiQ8L/BpCHcW2ahh0i3lBJX6lvb6t
X-Received: by 2002:a25:b948:: with SMTP id s8mr63995599ybm.487.1593868687099;
        Sat, 04 Jul 2020 06:18:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593868687; cv=none;
        d=google.com; s=arc-20160816;
        b=igpd2p42S22J7WFnfLApEQlklscu1LbEztpVxJHY3k134Ulu1Xl738oFV03ZgcAlI7
         8/x7ByDBQsMXJmVI1Ld2ROiO8hxTybhbfGR6cpCh+cERUFoPDOjkTOMfHJtzljPTsfqg
         fclOJdaV6duEGm8zQPMjK0yipwSe2HBVTwpKE3C3zKhQlAftMZ8//pcKqfqFuS3pdXhk
         UT4Q0rNVFO77mtdrKHYGjq5YvHRoGCKWLiZGWWknTrucr1ssCX3OTUeSP1tycpOXid17
         LB+G/oy16qZMo4pyFv2B/bfSpGU5QtBOVCRDrvqjBbnUjP/aJPF0sJFhUaKKJPLNyCuz
         9YcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=jRoFPoj570cUCJDY9Ru8RG58kx7r8IBi9ZSrZJs1vtY=;
        b=v9Bpubl1IQOmzhDyWJrPRJEmUaGHy/ar/8xXsEwWTAbQhdq5RueruE9/RYC+yVVsE3
         BaeP61VAVeatf84ngGJ6pyd6XlNOT2/Asl10+hiNWSDrlgg/6OtWkcntx/q+NWXXjqj6
         k6GR2/yLIdNDeVtGPBVvG2tm94yeQnfpiT07zvwypgHh9BvpncweiC24Ax3HmjS+XmLq
         0VY3moggp900fXN+OSIWUjX+z/OymHpj+ZOVS5hsoDV5R4WFQyEIIWQXBo1yUgvygkxS
         Q4oxSuZ9uBfWUJOwYaGtV1CJcWAAIM521HtkQbzm1kQ0Wp/GnyzGsZExYOBnx8YCgvp/
         GP2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=MdXUDqtz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f15si14600140ybq.437.2020.07.04.06.18.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Jul 2020 06:18:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=MdXUDqtz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:51976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jri3S-0005Th-HM
	for alex.bennee@linaro.org; Sat, 04 Jul 2020 09:18:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sergey.anoufrienko@gmail.com>)
 id 1jrdrr-0005ua-09
 for qemu-arm@nongnu.org; Sat, 04 Jul 2020 04:49:51 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:35502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sergey.anoufrienko@gmail.com>)
 id 1jrdrp-00056J-Gn
 for qemu-arm@nongnu.org; Sat, 04 Jul 2020 04:49:50 -0400
Received: by mail-ej1-x62e.google.com with SMTP id rk21so36836964ejb.2
 for <qemu-arm@nongnu.org>; Sat, 04 Jul 2020 01:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=jRoFPoj570cUCJDY9Ru8RG58kx7r8IBi9ZSrZJs1vtY=;
 b=MdXUDqtzVchX+fLe9PpnKI1LPHSoJhRXB8CkoxiGeifluJKsrALJHreGJ28r3sB3w+
 BO/GaDg0kmqc4BP5WgOIvpeT5tNLULrGWTG2p/o+YsnN6oXXMD49quoo4BWAmxC1TFV2
 NSzLamFkpSA6AFdxYSsbYO1F84QroY58Ehjvb+F6bLv+T4/K5cdss0JRGEM8mj6yn014
 8yYCKFgk4AOfRRsm3ixWHPanTkfUWhc26TAjU6EcVNxgbVstg9lB8WSspSgugFB9371h
 d13//INtfBVLL9cLu6MLkj+AeLqcPfDLOBGwKL00SPo3aA1iu4ybjKqt1L4GrOY4k00n
 LWnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=jRoFPoj570cUCJDY9Ru8RG58kx7r8IBi9ZSrZJs1vtY=;
 b=qZlH6ZkcK/c5H6Fny5qSGC0ZW7FKM0D1JT2o1qFyk9VMjQs8/59YT1tmduDCckFH+t
 OOK5xhlQU2sFnuIFLZQyfKcjdRJaJ9b811ONbo41Q+6Ghjf2daSPnSjRhC3/QAa8soS6
 NXUUvkIr02u2XJDd/zLGGlWsLAnZm8q/vzY1lFKtKWlaev/54ZZfobPN82gt+TVq6Bpy
 dQuA6zj3U0FXak8SEObVUheLGZWf8JEf27eH1PvHBQhmm0nZjc/Cmii/yjnkNb4/0k7x
 Vk3cleFhNpkDmq+JURH9E0nedMBurP1EtFj32pDeie90XvDu1bwyJrXNFgALu6C3L9GF
 +efA==
X-Gm-Message-State: AOAM533ZGlxe1XRaiRGCLwfEA/9lGMt81ahfbzkz8Ogu/KSZwqtPM3gD
 MU/rcmt/zNRRepfYVr/roCY0UTUvkDLOuGANNmE18g==
X-Received: by 2002:a17:906:2296:: with SMTP id
 p22mr34741266eja.510.1593852587172; 
 Sat, 04 Jul 2020 01:49:47 -0700 (PDT)
MIME-Version: 1.0
From: Sergey Anufrienko <sergey.anoufrienko@gmail.com>
Date: Sat, 4 Jul 2020 11:49:35 +0300
Message-ID: <CA+V0Fiu-3fG6JH6bH__8u5RG2kv=MLAwadNHkNoF6b8E-GkU9A@mail.gmail.com>
Subject: How to debug AArch64 QEMU in AArch32 mode?
To: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=sergey.anoufrienko@gmail.com; helo=mail-ej1-x62e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 04 Jul 2020 09:17:38 -0400
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gVhUDPg5uDC+

Hello,

I am writing an AArch64 hypervisor running in AArch64 EL2, which
switches to AArch32 EL1 to run a 32-bit VM. Right now I'm able to only
debug AArch64 code up to the point where "eret" instruction is
executed to switch to AArch32. Setting a breakpoint to the AArch32
entrypoint also doesn't work. I tried GDB multiarch and to switch
architecture at runtime from aarch64 to armv7, but it complains about
incompatible data structures.

Right now the only working way to see what's happening in the 32-bit
EL1 is to use "-d in_asm,cpu", which will correctly display 32-bit ARM
code after the "eret" has been executed.

So the question Is there any way to debug the AArch32 code running in
qemu-system-aarch64?

Thanks!
