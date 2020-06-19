Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp530248lfm;
        Fri, 19 Jun 2020 05:15:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAKYKqZFIhLS7Uicb0lHNVL8UG1BdO+HXaebTqx86Fq9YymtyR+lw9HIO+gaspc10h1Zt6
X-Received: by 2002:a05:620a:68a:: with SMTP id f10mr3057063qkh.419.1592568959764;
        Fri, 19 Jun 2020 05:15:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592568959; cv=none;
        d=google.com; s=arc-20160816;
        b=YfDL87KlBZebaLOmMBoMH+SqAayhzi9PH9M5iy2dt/RM2OuNoUPsWnmjnTF31PEcLk
         3Kb5H8L6FR+HKlocyvYTxpcCVOxI+x5bvkMXcOWv2n/s/bbfiyrqdj4lTRTOWnPzRZPR
         O3zWrzymg5GAT+gLVWL7w+3+ClYd8vzD5EqBs1Xdw7wzguKdgalBCJwwojCyJf7+5Y6c
         iGWYQqcsQ/SgMfpPlABrvXXkv/mDRT0aAQtSBoefnMtlx5H2iT5V+jUhZGApLKMWW0+N
         OjVVrInKf28fy/lLRbx6IjUBHr6V5OIw2bs3REWBFU83GFDjcMP8kpUnif+jpbQ+xY6V
         9Xjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=raNmDAs88YCpD9jlVxdmpkRgWf/+xljBtCkmvsP3lbk=;
        b=ud25XErrfpjtKXeL48r8ejYvDptdKEvCGm+vUg44OOFDo8FUBAyS6K0YNfA8zHkM6I
         GNjwwDx0Ccj43n2URQS21Y18m5sfRIH+D3hnyl8fsDidkfjr7stfSsY0ggH7Gw40E8qB
         A/x0dgmNKKJDK+B4LOWCsPLJokaPpnw6wqrDGwGo7+VKGQsKkCGMDfdYriLTFt54j0NV
         Z0SlB2QHXxLpRRAH0uFMUHKfWd8KGvVTQgbDaSYj0TjB4p6p0XoOZnLI8Uw6mMnAtfNt
         Ac+TrhhneEF6nA4Na20uwIBSZxfIg1EzNFRF8Q/l939cTVAHnzLcEuEP5KK0zTpzkMex
         ulPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T0dC6Tvp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v24si1288045qkg.26.2020.06.19.05.15.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jun 2020 05:15:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T0dC6Tvp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jmFw7-00032W-47
	for alex.bennee@linaro.org; Fri, 19 Jun 2020 08:15:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jmFvT-0002Rc-Os
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 08:15:19 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:33568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jmFvQ-0000qX-Or
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 08:15:19 -0400
Received: by mail-oi1-x243.google.com with SMTP id i74so8264640oib.0
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2020 05:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=raNmDAs88YCpD9jlVxdmpkRgWf/+xljBtCkmvsP3lbk=;
 b=T0dC6TvpNcLVAmrq7WwFCjwddNyj4VHQrFARjvRu8ZSECfHDIoBlxAEJkhGRDgQU7S
 KDs7x5zBVRck/nW9ybZLRdviB5iNmaq1qC32LW1/OD8zSAB+oEMhaptTdl5LluK1btqE
 dordIDwCdyHz3MiCTIq64GZAKbCJFfOlpF3iLZSiAq4DqU3VoH9kiFemP/mSc6Uzbrha
 otprxPp6zQeLQY04hpP0RxjtM6bFt2VhKIv4cUHavt7sgTIDZpMqHTvaGPTpLWoRZNIv
 UOKcGvq1DBiS1aasq6uuabmeVBy0NSUjB2CQZ4kGqc9E0OOCBVVWJGcWLw1ZnZBys8DX
 yL2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=raNmDAs88YCpD9jlVxdmpkRgWf/+xljBtCkmvsP3lbk=;
 b=PPhsidK48IKTgJ97/6LMnrsb/cgVLZJBz3D+CFPwM9HDdh8Fpw5CJgdglOlug5sghP
 cBwO3YA3CWMmFiMYpgcBMCZTcLspSByZI+MApm1FvAVj5MkC55IRvuhfFQ+HGnUrGylU
 PSESnGpMSNmG95i4CNHhFFA7WVkqHquT5+tMuxFn5tuZraMnIlGHhtskfdiqwaTI1b28
 2YMtgtDpGN5MIYlxYcnt6CcjnjYM/sQp5jfvWm23gBuOPwCnJFjSZYyuyRtotyHB6ErN
 42NLBu/Km1Foa09WglArXGtohvtgkzPnK+zyLXeJ1lxLgJTb28bVpI6deVcHkFbo0Lz4
 S7pg==
X-Gm-Message-State: AOAM533wGnWP5D6E3u457jUjyAr9pRYd4Z6JfzxS9K+kCdx7WU4EcuiK
 wv6hqADJKp6ACBOUS7OAF1h2ItWvRdcReIBhNjfy+w==
X-Received: by 2002:aca:568c:: with SMTP id k134mr2630895oib.48.1592568915141; 
 Fri, 19 Jun 2020 05:15:15 -0700 (PDT)
MIME-Version: 1.0
References: <828021babb144be29ce518681ff6d89f@huawei.com>
In-Reply-To: <828021babb144be29ce518681ff6d89f@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Jun 2020 13:15:04 +0100
Message-ID: <CAFEAcA-_fYKwnOqLLZnzotAbwHWBQj7pwDVCE1vCCXA8VBfp6g@mail.gmail.com>
Subject: Re: [QUESTION] ARMv8.4-SecEL2 support
To: Henrik Uhrenfeldt <henrik.uhrenfeldt@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x243.google.com
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TYu5q16CemCn

On Fri, 19 Jun 2020 at 12:21, Henrik Uhrenfeldt
<henrik.uhrenfeldt@huawei.com> wrote:
> I am about to do some work with the ARM Secure EL2 feature (ARMv8.4-SecEL2). QEMU virt target has been my environment of choice for some time, and I would like to do it in QEMU virt if possible.

> Several places in target/arm/helper.c mention "TODO: ARMv8.4-SecEL2". Would anyone here on the list be aware of any current plans to support it?

I'm not aware of any current plans. Certainly it is not very
high up Linaro's roadmap (we have a lot of other emulation
features we want to add that are higher priority.)
If you wanted to implement the emulation support we'd
be happy to help review your patches.

thanks
-- PMM
