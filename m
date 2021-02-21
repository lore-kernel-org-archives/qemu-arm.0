Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp966833lfc;
        Sun, 21 Feb 2021 04:12:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzajIrWGK4xk0NCgXcffmPywj2rYJ+XPCvhhUP07PxjuggLlSWvw6RKZpv4lYExBabw04ne
X-Received: by 2002:a25:4252:: with SMTP id p79mr24936272yba.492.1613909550534;
        Sun, 21 Feb 2021 04:12:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613909550; cv=none;
        d=google.com; s=arc-20160816;
        b=SygDg5fa4SgzSg0WFwAWhWsb7vHjB8Tv6IQARLUt+L0IPJathoh3QfZVHcooKYJD4A
         JgsM98NBt73/qYOSunb7zl0uzvtEvkOLVrL0PxEn/T2dZSsrKMnHsSJsblFM96sl5rVH
         xHwpNzss8Z7GO4m8BZX6/8J69sxYlpNrNj+1/TtTaFw2OY/td84l/mqwEuA+yc/Vwvv1
         a8OElYeyypeNLRZJ5hMV7eikxNNtmi/3uSPczNReWIq9xqR7uTxZELidmKl6GXLB6Tau
         JMa1I6QWGbMBOWG5x54bFZgSpb6BUInkgq1sExqGYG3V/1he6L0o9c6KI06lDmRMF3zu
         AZ6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ePgzoOyWpt4Witqye3vdqFhEOaApnPYTFSOKtHPnDJg=;
        b=QQoebL8AST99Z4/kgOwuabpT+cW07tHRczyVU1N+GinA5onHyfSgIxbWv43IYtjjuO
         eZFSne8Rt+hSb1zVG8kGuzhURYuMF4+P745w8iIgX6R8SWcQUqbM4NsjpolExVuDEg84
         RGETA3oeCslcV3OXq6oVeLZgmnReQkoW/ChZtmCvvX/WQbxOsVS6nOiGG4/hFzoMrEDf
         7SanxZu1F5cVKD6dtF+7nc5uPdzIIsjlV1ZNpkLK7wZOEXlr8qZia71Qh+bfQXZqMFlk
         gderaW9CdDHIUaL5H0hW86suUisZD0zMY8Tz2AXai385kpo+8vH+j2tPICKXfurQCpdY
         mtiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XIyPdCCJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q12si16400601ybm.8.2021.02.21.04.12.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Feb 2021 04:12:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XIyPdCCJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lDnbB-0007PW-Tq
	for alex.bennee@linaro.org; Sun, 21 Feb 2021 07:12:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lDnb1-0007Nc-7q
 for qemu-arm@nongnu.org; Sun, 21 Feb 2021 07:12:19 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:37069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lDnay-0001rP-Qw
 for qemu-arm@nongnu.org; Sun, 21 Feb 2021 07:12:18 -0500
Received: by mail-ed1-x52f.google.com with SMTP id h25so4669198eds.4
 for <qemu-arm@nongnu.org>; Sun, 21 Feb 2021 04:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ePgzoOyWpt4Witqye3vdqFhEOaApnPYTFSOKtHPnDJg=;
 b=XIyPdCCJfw+EzhdOefRgsznjvu+mXcQTLQwgcZ0hQgZJirMLSYEXdTlsViCb1gxFAu
 omgh7eCbS6vjwyPxEIAYhkTx9hEtXAhOxu9K2nHgjA+tVPCQndHEMSvJo++K0zb6Q1Sq
 Yyf2e55bBVj+Wvr84H4Rka01lozexgCo3Gi3jj1iVCobYBmWhE8mHv4Tt4apwItcjAcR
 cza92zytt5kdIoaueCZbVaKs+xfnZrnjk6IYPmOhog/NPa8zOST227wrT3khBhlWtyv4
 otPeLpMyvpqjRdNcEOGoOGVBtTnM+PugX4NkWvV1g5b1jGBFx0fs80NvMODFSpnK+WuI
 eztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ePgzoOyWpt4Witqye3vdqFhEOaApnPYTFSOKtHPnDJg=;
 b=UUITm+Wapp9gV0EUYysvrAipTlCIgv5ynWYFn83orqsMrPj4HduOqWuSRMyFClPUP+
 TzhZ2z0yHapAy76klYsFsvQ49Jx2vZG0PITycUFw5muT/Qn0ftpLAS0VIQD+vDNFkIvb
 KIoZ+9ajTkA1KQQ4K0xCzMLQIGMmQMiQPK49/nEGSF71t5HoqY4trMoMxzv1OLL88YLf
 JHiJmyv4pyauBSdW5wSlM8gij9JDjFJLCJjUlgbQRje21ge1eZwB1q8LVlelHhjqgFhx
 uuT3a2gSk624hxRfaH9yx4WU7n40l0uDF1BMHd5sl6dCcDjKbS6qOe06x5k+GzGUgISC
 U/rA==
X-Gm-Message-State: AOAM5308TbAO7DOb0coWSqf+kGnMVmUYBoxtKSLExozLSFZ8iUpoFFzw
 Axxa473y2EtWXdwD95xtKIwtmbwdr5IAc+JBDNRwGw==
X-Received: by 2002:a05:6402:3514:: with SMTP id
 b20mr17390252edd.100.1613909535184; 
 Sun, 21 Feb 2021 04:12:15 -0800 (PST)
MIME-Version: 1.0
References: <20210220212903.20944-1-richard.henderson@linaro.org>
In-Reply-To: <20210220212903.20944-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 21 Feb 2021 12:12:04 +0000
Message-ID: <CAFEAcA_3GUsYLY89Y62k0Rfaqu3JHdPYphueW2t04C6FgvQmTA@mail.gmail.com>
Subject: Re: [PATCH 0/2] tcg/aarch64: Fixes to vector ops
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vbfJ2u7uliBw

On Sat, 20 Feb 2021 at 21:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> I guess it has been a while since I've run aa32 risu on aa64 host.
>
> The launchpad bug is something that should have been seen from the
> beginning, but the similar aa64 operations are expanded as integer
> code, not vector code.  The aa32 neon code has only recently been
> converted to use gvecs.
>
> The cmle0 (zero) bug has been exposed by the recent constant
> propagation improvements; previously we saw a reg/reg compare.

Idle thought: would it be possible to have a test framework that
exercised the TCG backend without being dependent on a particular
guest frontend?

thanks
-- PMM
