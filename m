Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp1203164lft;
        Fri, 1 Jul 2022 05:30:32 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1twpKjeABtNxHP38UQ/Mh/xkYA0jfG75LDPe5ZJLM/1JyIJQvJ5ANp314HeD5lZUd906gUA
X-Received: by 2002:a37:a695:0:b0:6b2:58b7:3ed0 with SMTP id p143-20020a37a695000000b006b258b73ed0mr1640713qke.749.1656678631885;
        Fri, 01 Jul 2022 05:30:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656678631; cv=none;
        d=google.com; s=arc-20160816;
        b=catHqVmaJsBUyJ0El8JLI/rX961QzPGVH4gedYP1f7uaNKamV5nH1Q/uKelyvTAuhW
         /ce2s0KgzuXzvmqiUCbYF2AqHmoJZs9zVOR6SPCcQspGU0zbU7KYACrTfUWRrR3jcR1O
         n6vTGP6MtXABkTpUjSdIoBxpTGCaqUQzXiWmD0Aj3ab8YL4r8P34cb7dw0rrjrxr29Fx
         mgAk8ib1PEr9eAFg3mE9oOBCeFfOkb7UolSbbL4OwbWSSKeXRxtu9j5s5FEN+Gs8OZB6
         cwcLovjyl9pPtLZ6WIW+QaGyXVQxGnZzKm+QmNROKYk+BBO1UcETHnqs3Jy2SUVNExUG
         9HZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=g55W5Fpqz8nBO+Mlq/wUDiUkCuLxOKyl15FW5KEdJJw=;
        b=FLF7IqhDInr/ScB+xowD64bKzWbAhKhTAD62YysiFnCFzLeNStq85Zf3DZjuXbsUU4
         yw8G2YD8hwkp3dzE0CEX3B4eGK6UvqBVqwKk0iEidr2/zutZy4Yvs39Rrc/SQYi3IJ4r
         q2F0NjOXm7UgkyYcYijCxjoO+l0lpAjhy1YZtGSQwLdtsJ2JdVhio+UtEomrDjuGL6TE
         M5kPJgWiTGCdY0mt5SD5D7gvwEG/QNQnAU2YOu8ZmZmodydwT4t3byR8vPkRFz50Ch6q
         o1wVQMI9rWnQlZvAnDfC68DtLn2Cj90jNMWWSzPTZwlioVSAUkXZVDGBo8/OzuC7nsgM
         GNVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KcxeB1VH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m7-20020a05620a214700b006a6d57659acsi12042338qkm.589.2022.07.01.05.30.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Jul 2022 05:30:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KcxeB1VH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7Fn5-0000YA-7s
	for alex.bennee@linaro.org; Fri, 01 Jul 2022 08:30:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7FmV-0000Ts-DD
 for qemu-arm@nongnu.org; Fri, 01 Jul 2022 08:29:55 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:46745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7FmT-00050c-St
 for qemu-arm@nongnu.org; Fri, 01 Jul 2022 08:29:55 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id l11so3726635ybu.13
 for <qemu-arm@nongnu.org>; Fri, 01 Jul 2022 05:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g55W5Fpqz8nBO+Mlq/wUDiUkCuLxOKyl15FW5KEdJJw=;
 b=KcxeB1VHbYhzrmAqccQWxXfyNt1p9CB36UdZt5iOYq01fFnffA4kzqspb7UyG1dzJj
 lJhOzhHeNI/yJK3Eh0HF65oAsppiX6V+gRn05Ls+vrLs6zvkYtm5SdaTFVyb+vxYNu+i
 fjhQN1J6mJxarUWHYdXZNFtlx6H1o7ldqhyUZbOBgHEauJvt73sLSsiu5rMJWzAw1zzj
 3+P5zIzd6KZCLHgqut+tz2UODXMy/rhAIG8fetPzI1ZqCUEp3HAWcee0wvQIU03qe23+
 jL6GDyA2g+rJYad4YsW9E6MWu1hOGsC0rxTzga3cBQOdD9WcVKMB4ScxiqHglG0hIvMu
 nv5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g55W5Fpqz8nBO+Mlq/wUDiUkCuLxOKyl15FW5KEdJJw=;
 b=4oQpusNiVx0x6NiRfT/HZYX8UuyaH8JbZenn++8/B1eM2A4BLgtNLhlHcTbiQwE3n7
 U5q2plO1BMGr80Z9lLB2HLUKQylobWaFmfYmhvVVA2wi5mzQUF3LOFiiDy6pB22vnAfI
 8cl0le55Rc6gzj+OFtpBaFn300vPhMfUWeUjOhoYipECQOIw6USfsHHkrpyeA3r7aaiB
 i97gZ0i1N09F4JCSl0A+B+d6Jh1UCgCXqctdFMOpHEUfC4q8oievzkFEWyN81oyixiF0
 HHefbG1AL+K8FHxf/gdXmzjQ9sYW+hnLexryKzAnMtoUsqvz9RPz37hxITuTf12yiIUo
 IF0g==
X-Gm-Message-State: AJIora/UAawAQo30DlOBBvrEL24XKaau7y5vGWqSqP2fwyzXOWaW3J/q
 pzmqYBHA7J2O7ambO0YwJlOqivvkJFtrJvX44FpmXqCi1mU=
X-Received: by 2002:a25:d74a:0:b0:66d:eddf:c495 with SMTP id
 o71-20020a25d74a000000b0066deddfc495mr1878281ybg.479.1656678592751; Fri, 01
 Jul 2022 05:29:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-12-richard.henderson@linaro.org>
In-Reply-To: <20220628042117.368549-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Jul 2022 13:29:14 +0100
Message-ID: <CAFEAcA-Bsc-hZ5LYyJP9joJscbqCDCrHew4-Qktf8p19q2afzA@mail.gmail.com>
Subject: Re: [PATCH v4 11/45] target/arm: Mark gather/scatter load/store as
 non-streaming
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UviUBHLzrSqT

On Tue, 28 Jun 2022 at 05:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Mark these as a non-streaming instructions, which should trap
> if full a64 support is not enabled in streaming mode.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
