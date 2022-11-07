Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp2880453ejx;
        Mon, 7 Nov 2022 02:37:33 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4ctGqZwDywgSk94NFIEgcHZGgKEbwmDfXU5dUHoLUblGONPGHO3QeywkBgKevWsHaZN6nC
X-Received: by 2002:a05:6214:1cc7:b0:4af:6573:c056 with SMTP id g7-20020a0562141cc700b004af6573c056mr43860243qvd.103.1667817452530;
        Mon, 07 Nov 2022 02:37:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1667817452; cv=none;
        d=google.com; s=arc-20160816;
        b=So38QIvjFgZuSkTpnbrj52ezKGvExtN31AeTfL+10x6FMfSqSV9F56zaX5tTPIrN7B
         77+/PKECcZmXs/ZNOcLWQbm2oigK1egKFslww2iyD17xJnKP5D9vM7jeGO1u/E9dO4ty
         NavE3RMF3TM0gcIYnx0Q6bnvHKsSTNDTSMdUl0XBefJ5gcqTSvAEkRBVx8BlO9lLl0hH
         jdXZI7mKEjKNL4qHxSdhfWLycZQbJxG51Ex4UI77JFQWm09iadEeE0A4+Jo8n7pbilug
         +Qj50H7JBiO9dQK3b1Cs2eDqyXi4FP9pIA1KH99k06hSpmkE7NUQlMQufsjENKruFXK8
         Y2bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=eyqzzbieICgv7Yruc3LktNtv7VaTTNWvfDP1r4yRmww=;
        b=qtU5h2qjzcAz17JsAZP7O59o7IHZ5idTpOkIgG5vNUK1Ie6NYBnddj+CEnoeFox+kr
         bvwEIfV769gCazjOmZx4sz5DxJP6oR/7k1GPb9xDZqgpecafopsHrjhbmRj3lbZRb44o
         Y830b2mo3A8lNhSJNFhGWrUvfgSLmG0Q6eNrwbByVw3784g3rJbdsuduCgr46EMHCU3/
         bQ+sUy+lz5RERPBBfzF0dQK4Tint3qc0UQj/XbRC+i+5ZAcdFWYVNyFio6YElG4mMNla
         qLrdeTC3WjxNqM9OtDIk57OJachJlPNUZMRBJOh1+gkjv0gnqGUtaTS5wZUxLU+sOAXS
         gLVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Cl2X8CNi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fz27-20020a05622a5a9b00b00392864bf2b2si4298139qtb.613.2022.11.07.02.37.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Nov 2022 02:37:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Cl2X8CNi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1orzVL-0007Jl-3o; Mon, 07 Nov 2022 05:37:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1orzV5-0007GN-GC
 for qemu-arm@nongnu.org; Mon, 07 Nov 2022 05:37:12 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1orzUu-00042J-5U
 for qemu-arm@nongnu.org; Mon, 07 Nov 2022 05:37:05 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 f5-20020a17090a4a8500b002131bb59d61so12257935pjh.1
 for <qemu-arm@nongnu.org>; Mon, 07 Nov 2022 02:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eyqzzbieICgv7Yruc3LktNtv7VaTTNWvfDP1r4yRmww=;
 b=Cl2X8CNi80uf3z6GQ/95VgCrCaogMmJNcGfrExgrXQXAn9WOhW1qD1OwtOYjJ7yIl1
 MCOl8zyxNYMa0DUAxPIXbLtdPP9MZQT2hknhk5VvFYFeUgXHPqFhRPcO9hMgn7tnK5Bn
 ozokAXWKvw+En9Pt/d+MvmnelV36Jai2G0yg2wpRqqOaA3FDn1G+FGKwR5luYxmxRzGx
 bXDmFbUSq+CKKkf368RAO0D30v63e21sjk5ngw6ROsNKUR0zDWhZDvree2cxOjplrpkq
 8Iss5cLtRg9VWFbMTw+ARqFUXSfWjvoRzCBUaPg19yyXaoiaH9JC4+uP7lbJZN+WU2Jh
 jkxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eyqzzbieICgv7Yruc3LktNtv7VaTTNWvfDP1r4yRmww=;
 b=ZM6yn7ytDa27C2sCFsQJa7C4v6iDF7auRIaiedJlRuiaW29SMBUGn7G1q+Qxwm107J
 vCmHKkMNjphCOyevsvcWw5V6ncEfL7L048p8uxOzJ6ASDLpeEBCWD+0uQID/PzKXImJN
 moy784gRIGPTJgj6vOvKcF9xG4rvkqaQaMji3c+Czk691Q1zHXsnSmkXamaShm8vxdho
 zy/oTWj6btXCgUewYVgrdx8i4LZntGzdu2GfczdP5GKiygUGrUOprYfMhCTRaEyWDDTE
 ih+MnBKRco6VHvHWSWZte1qMqMEDhj9bksQJO6O/5FV4GDYGiS7zNXA1IYHPQXrHZTGU
 WkHQ==
X-Gm-Message-State: ACrzQf0MmKjzYX1Mn6aiLXVxnZlXmo3Y5GNkFpCUc9t7MZvr9ELVOAIe
 7YuE3vgM9RfOPSaUjvvcKqvDLG0t9nq8Eq/acH7veg==
X-Received: by 2002:a17:90b:4b81:b0:213:341d:3ea6 with SMTP id
 lr1-20020a17090b4b8100b00213341d3ea6mr50544889pjb.19.1667817413041; Mon, 07
 Nov 2022 02:36:53 -0800 (PST)
MIME-Version: 1.0
References: <CAEpbZuxvrNf1c_DB9SpkTnRL-qoGbyq+c6boT3pHxc1jTs1rew@mail.gmail.com>
In-Reply-To: <CAEpbZuxvrNf1c_DB9SpkTnRL-qoGbyq+c6boT3pHxc1jTs1rew@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Nov 2022 10:36:41 +0000
Message-ID: <CAFEAcA-Rfk9BcdMJd4LfkvYspdw+x8kZjTfieW6qx8wz-6ubUQ@mail.gmail.com>
Subject: Re: Resolution for past Cortex-M issues
To: Kiron Sen <kiron.r.sen@gmail.com>
Cc: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102d.google.com
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
X-TUID: YWFmeLuHIWYD

On Sat, 5 Nov 2022 at 01:02, Kiron Sen <kiron.r.sen@gmail.com> wrote:
>
> Hi there,
>
> I'm interested in using QEMU for Cortex-M microcontroller
> applications. I found the QEMU support for STM32, Nordic nRF, MPS2/3
> and Stellaris platforms with Cortex-M. I have some concerns about the
> state of Cortex-M support in QEMU after coming across this thread
> from 2016:
> https://qemu-devel.nongnu.narkive.com/jL3tKvyB/arm-cortex-m-issues#post2
>
> > Our M profile interrupt code is really badly mismodelled. It was
> > written many years ago as a hack based on modifying the A profile
> > support and GIC code, but really M profile is different (the
> > interrupt and exception model is an integrated part of the CPU)...
> > For M profile, NMI is just one of the many interrupt/exceptions; we
> > don't really get it right because we're mis-modelling this with
> > interrupts in an external interrupt controller and exceptions in the
> > CPU model.

That thread is 6 years old, it's very out of date. We've since done a
fair amount of work on the M-profile code and fixed all those issues.
The M-profile CPU models are now in pretty good shape, and we model
several different CPUs, including one with support for v8.1M.

-- PMM
