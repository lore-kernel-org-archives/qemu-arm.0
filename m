Received: by 2002:ac2:5fca:0:0:0:0:0 with SMTP id q10csp2211424lfg;
        Sun, 11 Jul 2021 01:17:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyd7KwbtI8TXU824W+W0oMB4+vLEeN0S4RiirtxO4Tqkn65/3jdxwCdts4z83qJPkAgWO4n
X-Received: by 2002:a05:6214:518d:: with SMTP id kl13mr45760961qvb.31.1625991450690;
        Sun, 11 Jul 2021 01:17:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625991450; cv=none;
        d=google.com; s=arc-20160816;
        b=OAWPLbpl+UmpGJQXbHcs75NSyzlekCmF68OPCp3zWDwmULM6uykaw1hUfOZvh43lMb
         14hrNmUHiF4mR+IKJKH3EKt1i37tOixkaWbjH21rDeb94qKFgNshtPq9Wt/zQzmUcCc7
         rwvNnALMRolmmIjJfg5xRkBFs+NmG2srUqvlYQne0qYJeXljePKjn32gqHC2AIiouJk9
         sNaV2ftnrlnIW7T9mEFVCDBiruhLEMW25V3dmJ5rZWlJ6SofuLk0G/9clzi9yLegqOzo
         G60kMUJT5aExBfM8YL5xDzukWt+ScZHipifEH/4J+gup+KMsj83pFoQ6PUMlztcdEpJV
         l8eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eaxiLLItV7DdIy9zXLyfsw0BgYEOi9f/6gMYgqfSqlQ=;
        b=ro0xQ8wn1IgJ4fhUYunRLHPtA1rtMgZYgbZKO7H2mNMa/86/dSQM3LhSUbVIKzBgL0
         DF48+rk01R4EeF2KbJ5KWBvcSQq1rypFM7XGfJCwvZ3mtahUugkqyJrhZpqNfii+5Lkk
         iN2cjKkja9EnoFTLjR5aWOKpn4iZNpJ88zvusw6azf3/GEiD4SDNMcS5O3gNiao+JT64
         7PGj8BIq9en9iz4WvJpG8YUIlEVrog3GaJSPaE+wTa7/m7b+tXEnF4YMKICHQ3SqFKhU
         IukYC5zSioqCDSMAsxIoiloSz+WCg8APiEJN6G9cfGEuv3QSqO8akC3G1DD3+vGmnMN6
         9rJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="VHqsXF/i";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kj14si9852465qvb.1.2021.07.11.01.17.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 Jul 2021 01:17:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="VHqsXF/i";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:37300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m2UeY-0000yQ-2e
	for alex.bennee@linaro.org; Sun, 11 Jul 2021 04:17:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1m2UeP-0000xL-Gs; Sun, 11 Jul 2021 04:17:21 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:44983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1m2UeM-0005ZC-Oq; Sun, 11 Jul 2021 04:17:21 -0400
Received: by mail-oi1-x236.google.com with SMTP id x70so8605524oif.11;
 Sun, 11 Jul 2021 01:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eaxiLLItV7DdIy9zXLyfsw0BgYEOi9f/6gMYgqfSqlQ=;
 b=VHqsXF/iETXTjMdXYFDJA4An3UFSMiZ89L1YcM4G1tXN5iTD++q/El24KyCacVEDJa
 rVjrKa01BbfN8Ba7uAsRFg0p1Kjt8YcTaYstJem3iylWkQqYy/43XoFuH7lAxHCk5ABX
 Vs0fnVPrdpaF/HT5jA4N/YfCYj7D3pOafc5rOL+vUoyZeMNPZRPkwK/02KS36f9VX8o2
 XREjpZuhUYu9dWe/yAwVRsJFN2awGLvMNQ2EnxkyYTlbhGJZ3wDCBwZKGhnqfZjJzm/Y
 BrPROBQ2/P+8jXF1MFI9+oriv3gilb/GnRWuWLsejCWwfYxabYf1p7d+zivun94dqtEY
 pEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eaxiLLItV7DdIy9zXLyfsw0BgYEOi9f/6gMYgqfSqlQ=;
 b=el6lzLB++jDv/yz+CDuBbAab5Aj6zSRadfMH6Lx4UBEO3LJ4thR5otyVl2iuUi+fNE
 TFMm3815rzr4uqL5bh7vMvk5390xoBIRWCTiPIgPmAlF7lfaekvCez2aoZhfaWLojQu8
 fwsrb3De4Fauaq8Mc9ZJ/3p6zS4vaJGRJ7ql0eREMWtnnPy2mB/Jke8TzlsgW5rDksyA
 ch0G0ytppVaIcUo4RNeWsRkPk21U9YXomg3cDkymanjgmLk9C/0sl/zRD6ryYfKqARgl
 p6HyhpJ1ZAfivkATw62CjMr+AWZoMODQTxfYk0Sk/OknJDc+3xxKpxF3oOt8dg8ZvXiG
 ShiA==
X-Gm-Message-State: AOAM533yfuZOGq7nnl/Pceed3EoIDcWV+FLiiZKq2FpXzkvScbls8lfH
 n9Pl0Sfv27Kko7swpMxbEgl3/zfjMfUHGuGvtdI=
X-Received: by 2002:aca:bdc4:: with SMTP id
 n187mr34567446oif.169.1625991435783; 
 Sun, 11 Jul 2021 01:17:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAAKa2jmatcBonTYeZCHnE4TR543FKQR4Lrv2iMKaZUprXH=3ng@mail.gmail.com>
 <1437061986.489095.1625809641822@mail.yahoo.com>
In-Reply-To: <1437061986.489095.1625809641822@mail.yahoo.com>
From: Qiang Liu <cyruscyliu@gmail.com>
Date: Sun, 11 Jul 2021 16:17:03 +0800
Message-ID: <CAAKa2jksX=Sco3-ETvue8d4wpyoFBSzgOGua9Z8WyOfeY8jEFQ@mail.gmail.com>
Subject: Re: [QEMU-SECURITY] Out-of-bounds read in xlnx_dp_read
To: P J P <pj.pandit@yahoo.co.in>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=cyruscyliu@gmail.com; helo=mail-oi1-x236.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mathias Payer <mathias.payer@epfl.ch>,
 "yajin@vm-kernel.org" <yajin@vm-kernel.org>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-security@nongnu.org" <qemu-security@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Hlq3z/uc5hMv

On Fri, Jul 9, 2021 at 1:47 PM P J P <pjp@fedoraproject.org> wrote:
>
> Hello Qiang,
>
> On Wednesday, 7 July, 2021, 11:38:09 am IST, Qiang Liu <cyruscyliu@gmail.com> wrote:
> >I found an out-of-bounds read in xlxn_dp_read and here are the details.
> >
> >## Root Cause Analysis
> >
> >1. xlnx_dp_read allows one-element-off read at its default branch
> >because of an improper index.
> >
> >```
> >#define DP_CORE_REG_ARRAY_SIZE (0x3AF >> 2)
> >struct XlnxDPState {
> >    uint32_t core_registers[DP_CORE_REG_ARRAY_SIZE];
> >    MemoryRegion core_iomem;
> >}
> >static uint64_t xlnx_dp_read(void *opaque, hwaddr ...
> >    switch (offset) {
> >        default:                            // (0x3AF >> 2) is equal
> >to (0x3AC >> 2)
> >            assert(offset <= (0x3AC >> 2));  // the op should be <
> >            ret = s->core_registers[offset]; // one-element-off access
> >            break;
> >
> >According to
> >https://www.xilinx.com/html_docs/registers/ug1087/ug1087-zynq-ultrascale-registers.html,
> >offset 0x3AC is allowed.
> >
> >```
> >#!/bin/bash -x
> >export QEMU=/root/qemu/build-ubsan/qemu-system-aarch64
> >export BUILDROOT=./ cat << EOF | $QEMU \
> >-machine xlnx-zcu102,accel=qtest -qtest stdio -monitor none -serial none \
> >-display none -nodefaults -qtest stdio
> >readl 0xfd4a03ac
> >EOF
> >```
> >
> >Let me know if I need to provide more information.
>
> * Thank you so much for reporting this issue and providing the details. I appreciate it.
>
> * It does not look like the issue maybe reproducible with KVM virtualization use case.
>   The machine 'xlnx-zcu102' looks to be a SoC system used in industrial applications.
>
> * Is it reproducible with the KVM virtualization support?
No, it is not. I got an aarch64 host yesterday and tested this
machine. The answer is no.

I'm sorry to bother you. I will test arm/aarch64 machines more with
the aarch64 host in the future.

Best,
Qiang
