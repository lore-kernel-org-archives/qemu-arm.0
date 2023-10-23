Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1253590ejb;
        Mon, 23 Oct 2023 03:12:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2YWdaSOhygy1gvk6GhaoSLSS5ZBDouvjWeh89b8Niebkadl8jY1F8D8Pc6AjbNvbDYy0m
X-Received: by 2002:a05:6214:19c5:b0:66d:15c3:62cb with SMTP id j5-20020a05621419c500b0066d15c362cbmr11536991qvc.36.1698055961046;
        Mon, 23 Oct 2023 03:12:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698055961; cv=none;
        d=google.com; s=arc-20160816;
        b=oxXdRXSGcKEdhBBdA4mtaLsuBUCnR9aYh2J6hEc/2hvXGWKgXUSq8OYtcFwh467+1q
         j5lB/4WzhKVIy5tFrEHqTVwnKP3IGjo1WsMZ5oHzpf2PQjo9J6jN350Cb0ZB4JIgyXcG
         Ht+bol9k9deDv6ELE/xJR1EBD9h3SvC9ZWtSCYHPDOce0Ry5ml+QmwYC7alIHBHadZov
         ik0nZx7qH4u0oiQ/YZ3JnJ4WLbU9cWDQR3mhFiP++2hjDqXBTj8VCjzLSWm7qwok/bVB
         8KtIA+22zgFTfFzK0j4jT7ayt4emqe8x7uGgMeD9PiyzZveoFIdLh/V6PrDvMczJPVMF
         8lTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=A7tENxU+s90CZuhFWuppWsz1Ary2e3txF+/4i3eE1GE=;
        fh=I+5vTLuskc/DFMCVkojxfHkHbvzRlvcgFCoy3mKryPg=;
        b=NO9YPZn6aiK04jZt/cTc+ykQRI15AP0FLS4kqyfAQl7EJOxw9JpGq5elK7tNa6ffo7
         0hZ5gbK78CQBfdmo8wNR9bB/iPMJ4G/HUxuvpV1StmcV81kshJ4jSfbhJWIYcdjcTk4z
         2laovQ5tbrC0vjpgxWqxJ1RETlnIPyCV8u5qlltsodahnOMm2O+1kwvDfTJH+jApjo2I
         y2ME7FMAxfz8zrDJIq4Xwb+PTv/OVfnqeFRCzmOOq7fzgfzCCTucg51ypDiEZbc6SRP9
         nk0IgZIXvy/+PsCTBc/YdHj8j0p6JC1XoOm6aWKTQ5n8viQ4HEqdwIkJluTl4b+v/pPK
         vliQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N+8C3iA3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id mf16-20020a0562145d9000b0066d2072732fsi5649660qvb.456.2023.10.23.03.12.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Oct 2023 03:12:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N+8C3iA3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qurvH-0006G0-05; Mon, 23 Oct 2023 06:12:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qurvG-0006FY-0w
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 06:12:34 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qurvD-0004pJ-9N
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 06:12:33 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-53e751aeb3cso4749466a12.2
 for <qemu-arm@nongnu.org>; Mon, 23 Oct 2023 03:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698055949; x=1698660749; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=A7tENxU+s90CZuhFWuppWsz1Ary2e3txF+/4i3eE1GE=;
 b=N+8C3iA3RPW8+cDAuQWOxlihwPj6KaDC02sqyKCM0eC2vNw98hip3Vd28NUluzlWty
 ZRP6FxICZRa7xnlTdyZ6fDiq9suBXik/yY832jkoDFzn6qVK4QveBEEUWTnGC/VFPn2e
 8n+nzFLBSw+HsgTNQh7iKCDRgFcbG5PhZ3sRT8ArrI4jrEe2WtJoDov8EW7Jb8/MoITR
 YJ8TPyx8ATyTfrE4crLtJKJjElKTutdUfGNY7POcFccUz7elFVFkpEwU72V0ytwK26D7
 sttOUEwsTEope1IiYYnzPaN3SaAHLFsJljn78gRumMepvhaSNDQnfpvvYDfllaq1IXUS
 Rz7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698055949; x=1698660749;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A7tENxU+s90CZuhFWuppWsz1Ary2e3txF+/4i3eE1GE=;
 b=oSUBuAFQU1Si5SR5Z7ERLKKOuZbYfuCe9Bam1L27pJBBTJITyn4+xW4298MPruiqGh
 zPMYF9f8FG55CII32qBEjSeNiDxUilBcfuiLYG+g0lQ+Dx/d7GjbIwBvBsu1Lc9OAhBI
 UgFF5fvs5UIUlkgDNCJ3OtOfQsyK7PpFGtWWZyRvF9EilyjRzKj65wNM/1zV/3hJUhyu
 nxwsK8F/FVsMexl5cbs1cjrr73pgm2sS/WXqITV6AUTHjYE2oV8M79MtuQmAZVzkISVW
 0mUo76KqWfXZf1bJuHHbuQCEmVM/Z0U58saYElN4hiQddd5AGdB+X5zq5OGV+XVmiIGI
 rICg==
X-Gm-Message-State: AOJu0YxiXuVVX5hg23XL+PPBGP6IMXepevljyvs1brszSNzJOYtjvT7X
 Dxx5TMtTfMze2XtkYwYvgUeMUEza6yX1PQ4nGRp62g==
X-Received: by 2002:a05:6402:354d:b0:53e:6db7:ea63 with SMTP id
 f13-20020a056402354d00b0053e6db7ea63mr7127294edd.14.1698055948902; Mon, 23
 Oct 2023 03:12:28 -0700 (PDT)
MIME-Version: 1.0
References: <4831384.GXAFRqVoOG@linux-e202.suse.de>
 <779fbc42-c397-44e0-8682-9a330cd1ec4f@tls.msk.ru>
In-Reply-To: <779fbc42-c397-44e0-8682-9a330cd1ec4f@tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Oct 2023 11:12:18 +0100
Message-ID: <CAFEAcA_3Uay1=7O4t5sXM7ujyFM6tkwQ_BOeDe6K+s2VtXwdBg@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/boot: Set SCR_EL3.FGTEn when booting kernel
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Fabian Vogt <fvogt@suse.de>, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 qemu-stable <qemu-stable@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: JDFvJSztLrPD

On Sat, 21 Oct 2023 at 13:30, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> 13.09.2023 14:57, Fabian Vogt :
> > Just like d7ef5e16a17c sets SCR_EL3.HXEn for FEAT_HCX, this commit
> > handles SCR_EL3.FGTEn for FEAT_FGT:
> >
> > When we direct boot a kernel on a CPU which emulates EL3, we need to
> > set up the EL3 system registers as the Linux kernel documentation
> > specifies:
> >      https://www.kernel.org/doc/Documentation/arm64/booting.rst
> >
> >> For CPUs with the Fine Grained Traps (FEAT_FGT) extension present:
> >> - If EL3 is present and the kernel is entered at EL2:
> >>    - SCR_EL3.FGTEn (bit 27) must be initialised to 0b1.
>
> Am I right assuming this makes no sense to pick up for stable-7.2 since
> it doesn't even have aa64_fgt definitions (commit 15126d9ce2
> "target/arm: Define the FEAT_FGT registers"), or should this commit
> be picked up too?

Correct. stable-7.2 doesn't implement FEAT_FGT, so it doesn't
need this fix for that feature's implementation.

> This and subsequent change in this area, "target/arm: Fix CNTPCT_EL0
> trapping from EL0 when HCR_EL2.E2H is 0"

That's a safe bugfix back to any QEMU that has the code that it's
patching, but it's also not super high priority, since the code has
been that way since 2020 and we only just noticed :-) (Affects
running Xen in emulation under QEMU.)

thanks
-- PMM
