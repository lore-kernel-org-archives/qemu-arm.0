Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3357562lfm;
        Sat, 4 Jul 2020 07:01:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHMZ+C3ugO7GDf/x29MS6q0cqQHRMBKLw71kFbRmQ65RLXLUdj+n5o9USzqVXRruuTkHjU
X-Received: by 2002:a25:e6d0:: with SMTP id d199mr44228757ybh.279.1593871310965;
        Sat, 04 Jul 2020 07:01:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593871310; cv=none;
        d=google.com; s=arc-20160816;
        b=yck/fcjuLj2bQQvt+QYttWkc4OjEgTPPjg2Qqc+sT3/G7U4gtYSPiZEtlLHGgH3pcW
         Z4ZsMyYpFMzA/ONNhFtLziTJp0SJPoUzGV0MQnCLfdrgYXMgr+EMcvPgLXq8/uhqEdVE
         tAQdDtDiQux2/PErXL6Hm++S0ol0iFHloDnur8l40vuA3ar8BT6fZMOM4lIiUhbwway8
         gPAN8UHgr/3URFKijKfVVneSN8Gi5vCCdSGlRfbecOAjHwqCflF4xEPMbSIur8eYkSPX
         P/89GvLLfAHhMhYZcEPjQjtnAtXp2mhpLp/+42KiE+chkXJDTA6bzlBezVJxO52/VO3e
         FN9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tfVSG+TiWBo8awF3CTvoIw1FzKk8Zg6F8BgynY+1BB0=;
        b=gcCvvKe5JpcqlwNDtfkvW9qQXeT7t0fET1Tfi8znHzVMEefXK10lynhOOWm8o1wE6Z
         sZbHqMRjwNPRQ+8b5LprlqtdPfBiDpfP9EEUJvtZprebgEA8llFB23JIC9XHTF7CjGEG
         o46LPBSp3kTirKVwoKXc3lYUvqgdRziS4DAlPGx0P7Nx4R3AiCBUnUJno38miozu2Z7t
         QkgrzGWigi3LpeA3VuWhzAALBltquara5aMpYjtI1Y7cCGo0uowgsjL7FkQpKEwxSUnz
         CdTLpMn6MN+Bl0zNtEMTBP9dpeRWip+bZTf5M0f8Q1Uk6ylNa+KxQaaetYl+ywiIWFKD
         T+gg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MVVPLznH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l9si22087190ybt.31.2020.07.04.07.01.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Jul 2020 07:01:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MVVPLznH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrijm-0002FW-By
	for alex.bennee@linaro.org; Sat, 04 Jul 2020 10:01:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jrijg-0002EB-CB
 for qemu-arm@nongnu.org; Sat, 04 Jul 2020 10:01:44 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:37677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jrije-00020m-JO
 for qemu-arm@nongnu.org; Sat, 04 Jul 2020 10:01:44 -0400
Received: by mail-ot1-x331.google.com with SMTP id w17so20668566otl.4
 for <qemu-arm@nongnu.org>; Sat, 04 Jul 2020 07:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tfVSG+TiWBo8awF3CTvoIw1FzKk8Zg6F8BgynY+1BB0=;
 b=MVVPLznHq6aXcZsMyXhhQffQ6Xrc1OepYj+OYJgB6Gp6nWRDr6sx22UVIFTinQlczo
 emHbXBEEQS3mt/CloxQemQGGNqtJ0gh+mXiPxYU6KxruuGfj26pMrEvCw+iAbMc8MYMR
 lbu9JpFQtRpBtOd2ovGNMij/WKA8YuSKtIdrOjgtx+hF9uCFUnJmvp9zpIjpJh4h8cV3
 aqFPsV7xZIFYVWC0MbSbkjKgKYbe3DGpEqHK25hBjTQEvizRQFNF2xMeihmvu1mDQKBT
 fnaifnfrw1aMYodd7Xxl/Zcf3n8V38LAUYhw+ckntextcKf4J3Iy5Xc2ob19vjqegjEn
 lsDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tfVSG+TiWBo8awF3CTvoIw1FzKk8Zg6F8BgynY+1BB0=;
 b=r0pkIuLDLxH4ubOB5Pz+DvYF3QhV3Utm/Dw+A7WbHu8FZaKGuOJ2669cdlvQRdJKLu
 SPzaNTwishrkMw1HKw+OvhgT0QD6mlWjmdeNKb+sjuZCtvca/qKkhwkelkVGTOfezgPP
 E2RsTKDtGLeiJfS9RVxWA2riFLtTGAr2s1Kus+qeEKfRvGqvKTj9J531rGnWGMMFsCkJ
 zzig5zKMi0lmH5piFp8HRQMc/WGZ3VfqT113ZpU/FzvdY0c/mRoalC7+ysIsoaXo9BGT
 l1JFC64iX8jnLpU0EaeS+PJjxB80NGpUHeLf+f6NvTLDM2emk4Zi3RvGxrPopp6VoCcC
 BmzA==
X-Gm-Message-State: AOAM533kfYtm/pkzwdbTCW9CGsDK9m+eOb9JBxlq1TuEtyhLsmAHCodK
 iT3URfKUfXqW/c7ogdfiXKY7xiPS1zum9jPUxoiBkQ==
X-Received: by 2002:a05:6830:1bd3:: with SMTP id
 v19mr32193640ota.91.1593871300649; 
 Sat, 04 Jul 2020 07:01:40 -0700 (PDT)
MIME-Version: 1.0
References: <CA+V0Fiu-3fG6JH6bH__8u5RG2kv=MLAwadNHkNoF6b8E-GkU9A@mail.gmail.com>
In-Reply-To: <CA+V0Fiu-3fG6JH6bH__8u5RG2kv=MLAwadNHkNoF6b8E-GkU9A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 4 Jul 2020 15:01:29 +0100
Message-ID: <CAFEAcA_ygdmkL5Xe2f_HUiABsFg2h8A4ju2Z0of9oDNYv9SvTA@mail.gmail.com>
Subject: Re: How to debug AArch64 QEMU in AArch32 mode?
To: Sergey Anufrienko <sergey.anoufrienko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x331.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sAzUdOpZmwAk

On Sat, 4 Jul 2020 at 14:18, Sergey Anufrienko
<sergey.anoufrienko@gmail.com> wrote:
> I am writing an AArch64 hypervisor running in AArch64 EL2, which
> switches to AArch32 EL1 to run a 32-bit VM. Right now I'm able to only
> debug AArch64 code up to the point where "eret" instruction is
> executed to switch to AArch32. Setting a breakpoint to the AArch32
> entrypoint also doesn't work. I tried GDB multiarch and to switch
> architecture at runtime from aarch64 to armv7, but it complains about
> incompatible data structures.
>
> Right now the only working way to see what's happening in the 32-bit
> EL1 is to use "-d in_asm,cpu", which will correctly display 32-bit ARM
> code after the "eret" has been executed.
>
> So the question Is there any way to debug the AArch32 code running in
> qemu-system-aarch64?

You've found the main thing, which is the debug logging. You're
correct that QEMU's gdbstub for qemu-system-aarch64 is aarch64
only and cannot handle the case when the code switches to aarch32.
This was traditionally because gdb itself did not have any
support for that kind of mode-switching. I believe that there
is now at least in principle some support for that in gdb
(not sure whether as framework only or with specifically handling
for aarch32-aarch64 transitions) but in any case QEMU would
need to implement its end of it, and nobody has done that
design/coding.

thanks
-- PMM
