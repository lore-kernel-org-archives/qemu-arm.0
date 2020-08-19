Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp377120lfy;
        Wed, 19 Aug 2020 04:46:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCa35WDTdWuJR3QGscHqK1aQa5LHFn8oLcF55lZlstGgIsEHO5euIbQlIYkkAZJd7NMxYW
X-Received: by 2002:a25:aab1:: with SMTP id t46mr29999955ybi.249.1597837588648;
        Wed, 19 Aug 2020 04:46:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597837588; cv=none;
        d=google.com; s=arc-20160816;
        b=zuR2REvSP6Lk/QKcWk8ISlxPdUsM/sVMHHD+N7ZsaCDBdWXbwVER19GEmt0HoG8xvm
         /JoRSzY31Hawv3ngCOh0Zi/s8pf/W0cTILFbtXXWob9Mxo+m8uhXH9a34ybj/hHX2fek
         cpkNNBHo2yKiHGAm6/nDs7ZZ8GbJm6SFkd1y4jC6QgsAsTrfuH812zPkeqpbsU3etEf/
         nUZ4HTaXDfyat2xBmEmNUZBbu89zuSyJDD+t/PGO/lxzgatGdd9kyHHBzzJTGJUamyRs
         uWzZO3vcHwc7to5zt5WZPP8rvWa3tE7C6bGhzZReHhdG7LUm8WsSp+mYJYzHmk/m82XX
         rEog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=PsbTF3zRPo60l2eU8a2AAtyCLEVLWJ6EWbQu/vefJQc=;
        b=07wgzfRgpfDlbvnwbOFI6z1OnNmqfGUIv8hRlDw0cfZWeP2m7ic8oGTWdHuEDup5Rh
         adcEzEa7ksdJc9XcE3HbQuodcOGd+92aIEs34zooNS6Eb/25mv4yz16drPnBMe13o7SI
         5UBtQypMEbOEeO8fbzwGFGYRfa/7zolr4uSIdVxl3vrfUGH6ovKVLfltTgT4bKNpPBYw
         UuysemYHbwodgQZJpazWN31Agj5UwRTl0uCjqJilyQdgPY5Xc13q68kOU/yy/CujzH5d
         eQDXv99Qn1Q27bBnsKh9a5w1v1zqnt3WasPoJs8DL/o4kNL/HGmF8oyH7dL3tUX9P5Pk
         SXXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 8si24029231ybo.374.2020.08.19.04.46.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Aug 2020 04:46:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k8MY0-0007MQ-0T
	for alex.bennee@linaro.org; Wed, 19 Aug 2020 07:46:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.dupaquis@trusted-objects.com>)
 id 1k8MXj-0007LE-5u
 for qemu-arm@nongnu.org; Wed, 19 Aug 2020 07:46:11 -0400
Received: from mailex.trusted-objects.com
 ([2001:41d0:117:dd00::95ca:f4cc]:48343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <v.dupaquis@trusted-objects.com>)
 id 1k8MXg-0003Wb-Lk
 for qemu-arm@nongnu.org; Wed, 19 Aug 2020 07:46:10 -0400
Received: from [IPv6:2a01:e35:2e98:43c0:a15c:94c1:ab75:f0c7]
 (2a01:e35:2e98:43c0:a15c:94c1:ab75:f0c7) by S76918.EX76918.lan
 (2001:41d0:117:dd00::95ca:f4cc) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P521) id 15.1.2044.4; Wed, 19
 Aug 2020 13:40:55 +0200
Subject: Re: Arm Cortex M4 floating point
To: Mircea Cociuba <cociuba_mircea@yahoo.com>, Peter Maydell
 <peter.maydell@linaro.org>
References: <1995755327.3077884.1597670507808.ref@mail.yahoo.com>
 <1995755327.3077884.1597670507808@mail.yahoo.com>
 <CAFEAcA8OAWdW8MS+7Fe-WUt+B7rP1AruUZWuAo9rAgP5P_0udQ@mail.gmail.com>
 <2127347711.3710404.1597756636356@mail.yahoo.com>
 <CAFEAcA89ydoNcWyBxRvdc648ifOD1sS6e-p0pqoiQe6w=bj=wg@mail.gmail.com>
 <1348331683.3733974.1597759332262@mail.yahoo.com>
 <CAFEAcA85SRv0DUqa5L62WLpbzBeV7Wh91GmyOG3GJrxWpTtXNQ@mail.gmail.com>
 <1227370812.4280844.1597836314970@mail.yahoo.com>
From: vincent Dupaquis <v.dupaquis@trusted-objects.com>
Message-ID: <8ac8f14f-0941-9054-ee29-c9694bce09d5@trusted-objects.com>
Date: Wed, 19 Aug 2020 13:40:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1227370812.4280844.1597836314970@mail.yahoo.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: fr-FR
X-Originating-IP: [2a01:e35:2e98:43c0:a15c:94c1:ab75:f0c7]
X-ClientProxiedBy: S76918.EX76918.lan (2001:41d0:117:dd00::95ca:f4cc) To
 S76918.EX76918.lan (2001:41d0:117:dd00::95ca:f4cc)
Received-SPF: none client-ip=2001:41d0:117:dd00::95ca:f4cc;
 envelope-from=v.dupaquis@trusted-objects.com; helo=mailex.trusted-objects.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BxQ/8agtCCoV

The core starts in priviledged mode, most probably you should do this at
startup.

Le 19/08/2020 à 13:25, Mircea Cociuba a écrit :
> hello, 
> This email will be non qemu related, but close to the original problem.
>
> I managed to get the FPU activation sequence to compile, found it on
> the ARM comunity site:
>
>     // ARM 100166_0001_00_en S7.3.2
>     __asm("ldr.w r0, =0xE000ED88"); // CPACR
>     __asm("ldr r1, [r0]");
>     __asm("orr r1, r1, 0xF << 20"); // [20:23] enable CP10 and CP11
>     __asm("str r1, [r0]"); 
>
> The documentation also specifies that this code must be executed in
> priviledged mode.
> There is little to no reference to priviledged mode in the Arm
> documentation.
> It briefly specifies that a certain CONTROL register must have a
> specific bit(nPriv) set to be in privileged mode.
> Where can I find the description of the is register and memory
> location? and are there specific instructions that work on it?
>
> /Mircea Cociuba/
> /"To be or not to be, that is not a question, it's FF"./
>
>
> On Tuesday, August 18, 2020, 06:35:33 PM GMT+3, Peter Maydell
> <peter.maydell@linaro.org> wrote:
>
>
> On Tue, 18 Aug 2020 at 15:02, Mircea Cociuba <cociuba_mircea@yahoo.com
> <mailto:cociuba_mircea@yahoo.com>> wrote:
> > gcc params: -Wall -Werror -O2 -nostdlib -nostartfiles
> -ffreestanding  -mcpu=cortex-m4 -mhard-float -mfpu=vfpv4-d16 (to make
> sure I have FPU instructions)
> >
> > the source code:
> >
> > void PUT32 ( unsigned int, unsigned int );
> > #define UART0BASE 0x4000C000
> >
> > int notmain ( void )
> > {
> >    unsigned int rx;
> >
> >
> >    unsigned char s[]="QEMU is not that interesting";
> >
> >    //dummy FPU command
> >    asm("vmov s15, r3"); // If you are to remove this, the qemu would
> print after I type the command continue in gdb, with this line, it
> shows nothing
>
> This looks like you're trying to use the FPU, but you haven't
> enabled it. If you're writing bare metal code then it is
> the job of your guest code to make sure it enables the FPU
> first, exactly as it has to do on real hardware. Check
> the Arm architecture reference manual for the details of
> how to do this (I think the main thing is writing to the
> CPACR to enable the FPU).
>
> Otherwise QEMU will correctly emulate the behaviour you
> get on real h/w if you try to use the FPU when it is disabled:
> the CPU takes an exception.
>
>
> thanks
> -- PMM
>
-- 

*Vincent Dupaquis*
Software security & Cryptography expert
06 24 58 17 05
/Europarc de Pichaury Bâtiment B8 1330 rue Guillibert de la Lauzière
13290 Aix-en-Provence/

www.trusted-objects.com <http://www.trusted-objects.com>
