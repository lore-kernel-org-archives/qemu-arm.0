Received: by 2002:a17:906:9417:b0:98e:baa:bd63 with SMTP id q23csp1466827ejx;
        Tue, 27 Jun 2023 07:32:24 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4y85TTjFp7O6svi1XBaw2qwQtxY2Bn1RDpkVNSkD+ArB9N59Brhvnbj4GxZ+8soMxCACmT
X-Received: by 2002:a05:6214:2262:b0:62d:eaa8:27d6 with SMTP id gs2-20020a056214226200b0062deaa827d6mr45363237qvb.25.1687876343551;
        Tue, 27 Jun 2023 07:32:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687876343; cv=none;
        d=google.com; s=arc-20160816;
        b=kf8lwtKYJYXBCg44xVNVteyQy+1s0XMtBh8G8xsoOVtRHjgRDPSX+kcQatLDLUsjXa
         mETfogrCJ9XoGpeeYKtSHXZgPCgy5qeB6vEMO74U+cy/nYz76rAXj+uodmVe7v9T1YW7
         XI0E2XTyTC0Q9PYRxU4coS9IXU7TAPTS613z0VtSBwxQoPkyPlJGBFS1Q/OstuYbW8Sl
         PYYThpwFdzqYpV69GC2zZUJxUmQXhNBDXVOduM1EZZRjOMrx1zju6WZ1W+XBtw9CLzuY
         ryIViLu9PcHDXyxcflKohVqQbZFdU4okzSO03xbyckB1T55FbcibMIURZaqJOeArfq2A
         OXVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=yxvTDyQvLjJ5Hw+Gg5z/m6yoJqAg9U1og/uO/OaRy0I=;
        fh=oMA5r/9sLN71+E6gM+hD1dlCNT0StpPMLqUdYOw5oq4=;
        b=ZPFVaALQkyZWXLtkITWiG0iVNapbPQrmGk9rWRUFNtDGt4wAVmzj/yCfeK6nciJTK9
         vwN+cjfrvx4MrO/TmWNtiYYPjR/jlXXtCHuDmwjEnDcSmjJ0B5ZWb07ipHFlTQbPWUfh
         SsVbv13/3FdCMxr/8FnB2qgyvMgO5PE/Jx0kPQoYDtw3LFH56xF0SD8tinZ4XgGOmxV5
         xH0O47Rjbby7TEBi6JGKeR5No8gQgJ8sk0ZZYIN1sxxacRF0ge45OTicRRBN8jUW/vTB
         cz29LYYaRkAPrumPrcktMPX+mlegrt3qGHMGS/Dcv7XnkWkyt9e2kwZqzcENOmXjCIuY
         cWxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MW6SZfLj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gi4-20020a056214248400b0063583e718f9si2758534qvb.479.2023.06.27.07.32.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Jun 2023 07:32:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MW6SZfLj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qE9jp-0003pd-IU; Tue, 27 Jun 2023 10:32:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qE9jn-0003oz-OJ
 for qemu-arm@nongnu.org; Tue, 27 Jun 2023 10:32:11 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qE9jl-0003RM-Uh
 for qemu-arm@nongnu.org; Tue, 27 Jun 2023 10:32:11 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-51d97ba7c01so2933883a12.2
 for <qemu-arm@nongnu.org>; Tue, 27 Jun 2023 07:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687876328; x=1690468328;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yxvTDyQvLjJ5Hw+Gg5z/m6yoJqAg9U1og/uO/OaRy0I=;
 b=MW6SZfLjSKQh552EgVaoFeLfHzY1f6x9PpdDfAErE/vGK42pKhlBk+wzVryUk8ppqo
 3B2Y4e5KSdkv2RUCexxBewuUGf8VZypNCHN9Y/KoQp9nkyoj9YAbqGEn8PFZpHFYCGks
 NQBXSzOdsoy6mZBGntiqeubXIHtKjNFHlYA+/QVZZFXHBLJ4pJdFsdDKL6BbvNtbibrO
 0G6h8A26Q0N87qcq28xgqRqUeG+UZ22T9yrIfGHFZMsw1jjaLZke8LuS/BXBsEtdkjbf
 113SqIq5xNokwnx6IYOW36CFH9eN9JwInq33WTpfOE1v6DzAwQge+duEtCe+zjlbcBaC
 FWag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687876328; x=1690468328;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yxvTDyQvLjJ5Hw+Gg5z/m6yoJqAg9U1og/uO/OaRy0I=;
 b=M61qERrSbyIakiMT7vgz8D6XRm/eK6wPs1SI8mBpthCygr4x1bRyJXtSL3mSaUBjbj
 XxJM2IF512lrvJWANzPqTzqOMhrDwPZo7Wy4KasY0Z9PAD7dpSuvSOy6hSrnli0fYvWU
 jcAyauuTnp2s/lGtJi4VY43ikWl/6YcHTlKnrOXv9j3SGoqgMoZ6ZvwzbCuFlxNsBb39
 hGeprYw9tRR2tHUpJxWETTxiYdhgW+8aMcIPiWBQNG59H0aM4XrwLWS3P8gV2sE8KjeJ
 MDzeoboDB1uxLcW+PwAfvpQlzycwfbh9scosq9/xtq+U/Qzykupg94niPjOH/uBqMBxf
 evUg==
X-Gm-Message-State: AC+VfDzxjl0QlRLDGRsh0/cv/eNwPwweu5ECtQc5L13dnkd1EFXwEi9C
 JroS+RDoagJTDt11i2IHtLACyXbwTVZuS5e9CUeMuq9WXuRnDWUW
X-Received: by 2002:aa7:d3d8:0:b0:51d:a485:27be with SMTP id
 o24-20020aa7d3d8000000b0051da48527bemr2461285edr.8.1687876328225; Tue, 27 Jun
 2023 07:32:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ-ErDDkWPE6QFF5Qvq2OQ55aaMoRPKXT9a-+1Ma79XVkw_c6A@mail.gmail.com>
 <CAFEAcA9vjp3o08F+aLB9DPga0tQgmHhaweZADB_wrniZ38GrBQ@mail.gmail.com>
 <CAJ-ErDCb_bvCg-RYYnsawxhM47wSnAj3qFeP4hKB9AdjDDswKA@mail.gmail.com>
 <CAJ-ErDBJi_0SeeOBjjNbyEE5BiYjcgEBA4tx7uULgOB1=FfUEw@mail.gmail.com>
In-Reply-To: <CAJ-ErDBJi_0SeeOBjjNbyEE5BiYjcgEBA4tx7uULgOB1=FfUEw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Jun 2023 15:31:57 +0100
Message-ID: <CAFEAcA-Ww0qDs63mbBbVGbGFD_iWmfV0WPMz6tLq=7jmew+UTg@mail.gmail.com>
Subject: Re: Regarding hello world program for ARM M7 (s32k312) using qemu
To: abhijit patil <patilabhijit180@gmail.com>
Cc: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: MqBcL3ny6xgl

On Tue, 27 Jun 2023 at 15:09, abhijit patil <patilabhijit180@gmail.com> wrote:
>
> Does it have for ARM M7 any board?...I read somewhere that if you have latest version 5 for qemu then it supports the ARM M7 machine...is it right?...and if yes where can we download the same and the programs and other things for ARM M7 using qemu

Yes, QEMU supports the Cortex-M7; the machine using it is the
mps2-an500 (which is a model of an FPGA image for an Arm
development board).

We (ie the upstream QEMU community) provide QEMU in source
code form. You can find more information about compiling it
here: https://www.qemu.org/download/
Or if you're running a Linux distro it's probably more
convenient to use the distro-packaged QEMU.

Generally we do not try to provide support for how to build
and run guest binaries -- there are too many possible
development environments and target boards and so on for
that. We provide the emulated hardware, you have to bring
the software :-)

thanks
-- PMM
