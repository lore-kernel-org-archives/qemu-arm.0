Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4965655lfb;
        Tue, 17 Nov 2020 13:18:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxZ0Gvhp5wEejii1Q5b0qAnEslHBdH4yZj3vCrWs1chmtP7VOnCrWhRX00nOG6z4eAU4Gbf
X-Received: by 2002:a25:aac5:: with SMTP id t63mr2520643ybi.22.1605647936304;
        Tue, 17 Nov 2020 13:18:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605647936; cv=none;
        d=google.com; s=arc-20160816;
        b=VxhXgwSSNSrqL+J+kDu8/S3Y3q8MI/3upwuwx3+beDBTQO52xcYfBmfgj/ke3DOvnQ
         5mem/9L6odpc1w6B6AfEvwXsfLOSh7CKyqFTxAtDQ8uroC6Ir5RixTDVyH13ZfHKMOdm
         BlRrM+VcEMOf/wMEF63WOr96aFxW8kPJeSofdM/bvVoHXvbgmiPAU4t4vTmW0PFCDR2S
         rbuGgCE4fJOvxCEwRm3WhVuPN3FrQPrIoqayRW5IlYQspFFCJr68+GLQPs9qHTeyH8UF
         20E7sDFq1w9mkB33bbZujI2Dyx0cEcBaMCHoaTXFqY3kjqlE1qemZQQjN0x0ysbiL66d
         2lrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DT1B096iyxChoXvdwbls7Vs2UfnuwKeCJcHlsGvuCx8=;
        b=bxBK/tRxFI/SyuRvg5NlHMUntjJZ8vYSURumYK76R+QdK6nH3BzIiiDnSRh2Wq6PMA
         kEXYLzC2j8MdrOjkxnEPlRJ4wRqaypvJXiStfEGyu9E1lV9VB/Ro0oT9SGbKDDZ+OECW
         /7hmSc9Y6ai5AVtD0ShZEgrCCQY+IqkxtSCCXAfs69WHl26jYf1fDWosE5UPJbtSaJbH
         AZ/XyDfo1L7JTYWCOA/9OAcmLYXImkvvgMVFJHQq8q6/VU41VoSyHkslsHl7WiqMIIzl
         5q5XbrlN7VDMFS5/cmw/e14pK+RCGfGKTAbVugnxvJ2WHry+zByddL/jKusCHLmYAWZv
         CTRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e095rqKG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v72si23663484ybb.178.2020.11.17.13.18.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Nov 2020 13:18:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e095rqKG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kf8NL-00064d-LN
	for alex.bennee@linaro.org; Tue, 17 Nov 2020 16:18:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kf8N8-00062U-Vh
 for qemu-arm@nongnu.org; Tue, 17 Nov 2020 16:18:42 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:42838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kf8N5-00024b-Ki
 for qemu-arm@nongnu.org; Tue, 17 Nov 2020 16:18:42 -0500
Received: by mail-ed1-x543.google.com with SMTP id v22so24002965edt.9
 for <qemu-arm@nongnu.org>; Tue, 17 Nov 2020 13:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DT1B096iyxChoXvdwbls7Vs2UfnuwKeCJcHlsGvuCx8=;
 b=e095rqKGwmeHT9rP3iwks8zoUP3MIKfOGijrCXN7znG659cm21WBIrGcnf7XTgc4To
 rReia0EZ+6uiTCtl6Xm8Hishv/R8L6C06I0XmjQW626aAA3s65geaMF9pkkRFDBrl2GB
 8492Hb560xCbMA0mhHttXorXvtVe5tvwArlnDeGUrkmXgc6eNlfiJxQLfMOUQlHaFpGM
 RRmtun2F+6n4dzfc0L214rGYjWuUdCwSD38Ux38Vt/BPi2nkRbP40dRcSlG6lpjf1d/8
 gI9eOI21ZFhIrJfbHuYz93RwjdyXObLIdVMPqWEATiagY2Vks9Xbk0M4NLISeXOnRBOC
 5h+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DT1B096iyxChoXvdwbls7Vs2UfnuwKeCJcHlsGvuCx8=;
 b=XMCqK/PDmRqcrMKKC3c6mk0z2POR6jCtwhancRATg6Gnh4PQTDlVmruLECuYJmgRlh
 P8yg1MvaSvPlxAUA/fzqvy03yQhTeHDYwtBWqpqPMjaNNXwVdrok1eR0WzkTZdaE1tQ7
 6Y9XIr6a2VnFuVilnGOBXxHIQjFfTk43Xwd+NGLPcuvLqEEJRiUhAdL1oYo2JQZFdEqW
 Kj80k68PWTpTSKVB8QJdnZ7f2z8xf/ZLuAPo/sg+IsGO3i2Iss78ilC4tVHjDeAhgHmc
 VojZeQ5eridlIEx4UnoJECIg6zWwJq3yIHriFyGrP0PdqoIj6ckSAniLoU4Mob99sbm+
 buWg==
X-Gm-Message-State: AOAM530US9JE5UueSLIkMcF+YWkx7csa7oW+VF3B49dTj5DVpwj8jHo9
 MtVDx1O7PTVKpZh2ptamxoUlINVdtMa1Y5HgQKSNQg==
X-Received: by 2002:aa7:db8a:: with SMTP id u10mr23219975edt.204.1605647917718; 
 Tue, 17 Nov 2020 13:18:37 -0800 (PST)
MIME-Version: 1.0
References: <20201116160831.31000-1-peter.maydell@linaro.org>
 <20201116160831.31000-7-peter.maydell@linaro.org>
 <d5cf2b31-0eb5-8147-2104-93b0c4c54b9b@linaro.org>
In-Reply-To: <d5cf2b31-0eb5-8147-2104-93b0c4c54b9b@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Nov 2020 21:18:26 +0000
Message-ID: <CAFEAcA_0mb5S0KG_sXv9vWXznE9H_uLEcQbtpuLyrw4n7k19aw@mail.gmail.com>
Subject: Re: [PATCH 06/15] target/arm: Enforce M-profile VMRS/VMSR register
 restrictions
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x543.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KtlCxGrW6FBY

On Tue, 17 Nov 2020 at 19:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 11/16/20 8:08 AM, Peter Maydell wrote:
> > -        if (a->rt == 15 && (!a->l || a->reg != ARM_VFP_FPSCR)) {
> > +        if (a->reg != ARM_VFP_FPSCR) {
> > +            return false;
> > +        }
> > +        if (a->rt == 15 && !a->l) {
>
> Alternately, the parenthesis are just off:
>
>   if ((a->rt == 15 && !a->l) || a->reg != ARM_VFP_FPSCR)

Mmm. As you've probably discovered by now, the refactoring
in the subsequent patches means that this code gets moved
and changed anyway; I just wanted it in this separate
patch so the bugfix wasn't hidden in the refactoring.

thanks
-- PMM
