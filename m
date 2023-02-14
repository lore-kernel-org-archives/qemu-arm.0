Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp1408551ejb;
        Tue, 14 Feb 2023 08:13:23 -0800 (PST)
X-Google-Smtp-Source: AK7set94N1vkxfqgEfbxPEwTz40hVg8TE2MMBjDt4eVaZrzLVDNwvQP6Z5AcpjGbXQXErinA9LpM
X-Received: by 2002:ac8:7f4d:0:b0:3ae:2272:e43c with SMTP id g13-20020ac87f4d000000b003ae2272e43cmr4343445qtk.29.1676391202926;
        Tue, 14 Feb 2023 08:13:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676391202; cv=none;
        d=google.com; s=arc-20160816;
        b=WwhClihBInVOBMitPrdAagYOs5TcO3qzcguG5UiPKd7bjqDz/veOl8yiGJ8eZCmQxx
         I0ei9PGhH221c/PofyeRfCo2mdxtL6nOPj4uV3jlHtsrJjCo8lM1IbEWDpLcjuWLrAkp
         Hs0Xnxh2TaGqA4bzx0LtEiNCLC+kRaOeo0qPDgRi0rvPkYEsOTWJo9aY7Lo7ypGce0bw
         9p66shffv2EEj62ANiovNvPZlPfS/3mFVXDtL0yTYWkWiAXNFpKRtRD1vI8lx7vxnDxc
         cL+ZZmzrKZyyXUYu7iYEaWl7pRmLThsqHbp5rBs6/GWoPFgclopELz+xKbTzQlNKHvGc
         rEDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=dEI1jBcCGCd9wcK4QXMHYImnKlMiUwECkVipe0en9/c=;
        b=JHPvjYslXumiB+Rblg6hthUYwuq31Ax/wAWSXIPtSWdCcQDsUcqd+1iic+HNa+HqUI
         0/djsHpf+UdUrdqFBZlPu64c6bRrNV5J09HxGhwRdGxhDdw8rSzdebxMDUUXs3KPDTV0
         3WFJQkPXP+gz4L081aacFpreKrGGZlZdVrFDhIukhgFedR+DzCrYUnSkwL31t9qRqyeA
         7UJN5zmCgRa6kW8g4qma2BqMCgcIIPoSC/G63BHmdsrdtOH7tZ7hlN7Nl0JDYH/qgnYJ
         Q48mBX6EC+cbHaXO4Yo3+UsBxHY4FIIiWV5w7C/IC/H4qhTpE8qeie17QxbgITa4eEhD
         LZvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KIkbPcIK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k18-20020ac85fd2000000b003b84c9b1f42si12913864qta.375.2023.02.14.08.13.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Feb 2023 08:13:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KIkbPcIK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pRxvY-0004eC-8J; Tue, 14 Feb 2023 11:13:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pRxvV-0004ds-4v
 for qemu-arm@nongnu.org; Tue, 14 Feb 2023 11:13:05 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pRxvT-0005c8-3y
 for qemu-arm@nongnu.org; Tue, 14 Feb 2023 11:13:04 -0500
Received: by mail-pl1-x634.google.com with SMTP id o8so15163246pls.11
 for <qemu-arm@nongnu.org>; Tue, 14 Feb 2023 08:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1676391181;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dEI1jBcCGCd9wcK4QXMHYImnKlMiUwECkVipe0en9/c=;
 b=KIkbPcIKY4EqrCLlqJtHN3ILkpI5UxG9hnMhM4d6xRzQcwggJVRvJD8bRiVuuxXIbE
 H4UNV+sWuEb4yE5SbyuuGPtIYArxAxoPPCeAACBZM4bnufGMW0xArbdQOFJWG7AqokAK
 h28/rot10bC4golNgDwgEMpam6egtl1uJ9rjNd3hWTh8Mhmt8w4/uepKLqKSchqtpDbJ
 HFEkRRdn8lWlS1MJEL68848tOYjUZjsUOzWJdPUVQ94ONwMd+CONSbAyHGFQMFjxIOxJ
 ilgeHqgTqbWhe25rXTBM3y4NSMbRQ0eANs/i84oaOcEWHnSRdWs6fyDX8cgcJWnkCi2y
 JclQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676391181;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dEI1jBcCGCd9wcK4QXMHYImnKlMiUwECkVipe0en9/c=;
 b=L18rO/Hbezb/ZOHjGAIKURgL4XlXJFqdzrXRloSvQX+dXjZm8GsBlXspaabmq14ub9
 GJSCNGZsEjyGHmHlgpXypt23sNG+Igv7VSaQI/24xFwHNwydQ+m6hkCO/H8CYL95ELXX
 LNExl4zkolQEoOQe4tQeC35CPwzjflbbGPCLio+CeTQPwwtAHgzbI0makYQCajVwt73Z
 zMo1HBCT0db7DNHsAUBgVDHwolGQ4NeYN6glvAtUUkCFPEFKdygu2NagM+SiNmeIsBqu
 ydcKXrOeN0WzWEEwKoJ49wVzW+bRP9lE2orrjPxmHfukVHefJBZfM75TOLhUSnLlwg5V
 4akw==
X-Gm-Message-State: AO0yUKVAa7E4Gb5MZZLGX4N/EA5QyfIxDq3yL8GNZOKqt1Vjwepl3wvU
 9bPsY/gncRAS/lbjjkHTaXK+iHiMxwcQSQRCxOSYMw==
X-Received: by 2002:a17:902:c941:b0:19a:721b:bce1 with SMTP id
 i1-20020a170902c94100b0019a721bbce1mr859833pla.23.1676391181307; Tue, 14 Feb
 2023 08:13:01 -0800 (PST)
MIME-Version: 1.0
References: <167579147730.28776.7263330829354840538-0@git.sr.ht>
 <CAFEAcA8rBdUs6Ri37KP=hc2ZarRKCTDGq=TxHr6xAhe7KkfU8A@mail.gmail.com>
In-Reply-To: <CAFEAcA8rBdUs6Ri37KP=hc2ZarRKCTDGq=TxHr6xAhe7KkfU8A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Feb 2023 16:12:50 +0000
Message-ID: <CAFEAcA95K=vTRzMtuo22DEJxGetS-LE-0x-8kWVOdPiDxGo8pA@mail.gmail.com>
Subject: Re: [PATCH qemu v4 0/2] ARM: Add support for V8M special registers in
 GDB stub
To: "~dreiss-meta" <dreiss@meta.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: wKN0ixO3rWS1

On Tue, 7 Feb 2023 at 17:51, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 7 Feb 2023 at 17:37, ~dreiss-meta <dreiss-meta@git.sr.ht> wrote:
> >
> > New in v4: Moved arm_v7m_mrs_control out of the `#ifdef
> > CONFIG_USER_ONLY` block, unbreaking the user-only build.  The downside
> > is that this function is now taking up space in the user-only binary,
> > but it can (presumably?) never be used because there are no user modes
> > for v8m cores.  Let me know if you'd prefer for me to wrap `#ifdef
> > CONFIG_USER_ONLY` around the v8m registers in the gdb stub.  Also, let
> > me know if you'd prefer a separate commit for renaming and moving
> > v7m_mrs_control.
>
> We do support the M-profile cores in the linux-user executables,
> so this code is "live". The view that the guest program and
> the debugger should see is that the core is always in
> user mode (aka unprivileged, Thread mode).

Having looked more closely at the registers in the
org.gnu.gdb.arm.secext set, I think the right answer here is
that for CONFIG_USER_ONLY we should never expose the second
org.gnu.gdb.arm.secext block. Because the guest is restricted
to non-secure mode only, the registers in the
org.gnu.gdb.arm.m-system block are sufficient to get all the
interesting information, and the debugger shouldn't be confused
by only seeing one of the two, because that's what it sees when
talking to a CPU which doesn't have the security extension.
The register state in the other block is OK.

(I don't think the code as it stands will be broken as such,
but it will let the debugger read a lot of confusing 0s, and
it leaves the door open for us forgetting to prevent writes
if we add system register write suport later, which would let
gdb put QEMU into states it doesn't expect to be in.)

That change is simple (couple of ifdefs in gdbstub.c, and
then it lets us avoid moving the definition of the
arm_v7m_get_sp_ptr() function). But Richard has just told
me he has a rework of some of the gdbstub handling which
he incorporated this patchset into, so I think the best
thing is if he can post that series.

thanks
-- PMM
