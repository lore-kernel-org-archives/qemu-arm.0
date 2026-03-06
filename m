Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61770FCB619
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Mar 2026 15:44:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyXLy-00036e-4N; Fri, 06 Mar 2026 10:44:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vyXLk-00031i-Ek
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 10:44:25 -0500
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vyXLh-0001Tz-Bb
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 10:44:24 -0500
Received: by mail-yx1-xb12d.google.com with SMTP id
 956f58d0204a3-64ca6595c8aso9152289d50.0
 for <qemu-arm@nongnu.org>; Fri, 06 Mar 2026 07:44:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772811860; cv=none;
 d=google.com; s=arc-20240605;
 b=KiMgsnUk4sabEZc8D/lvnA+cPo2mZ9wJGVJ5Q/LRCV0zGsA60GbmAIG3AeFjnOrdx8
 OgeEOWnGTaLPFAEkRao8ERk53LyEQpgi1KgImOEaA1XAovrM/f+h7tl8023X6PLKIXD5
 Iyoswa+0TxoWuAhRXEIFtv1b9MYMfJrLDFeRRe3eJGxyeVlDcaLB7nfJRr+k75O1Y4Xb
 HGiBEvf0jhXW3zlIEwQPkOUbuoqtNiJRiCpN7a3iz14gtX8FYrp8Exu19xq6BMsbrHf2
 57BZyC6jaIIM6e9XzZaj1x0iaLrJexcl+yMdMxEXc2fJLpYMJkRO7AsjgRnQsx4wXDjw
 ZrOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=pEgehalkeCNp10GuoaFl2X/abjVmlx4h7B5uiXqre5E=;
 fh=P9JuysKvnNN0B/sfaEnmJ8aA6qfF5Q+iAl1zY8RlNVI=;
 b=TG/bqOPkrxdDwBs6GFr/d9qkGqwS+pn82t8pkhrsO8GTaFZXW/g+I85Toh1p0O3HLP
 3rRD6qQmKkTO7wSxxJww+la7f/TbQ92hCuanaHaKZ1LPk6RJn01f6uWDzMqtWFZZLbMD
 oDifkAxkw1iJ45ghVU5wvy2jbPxlCZZ4tSuVrtEIfjE5Sj1YrPV8/p9Fl2sTDg/rJK71
 MwD4d0iQ2mGXPJqL5PpkidA9mzU+5aDZKhEAGmmHs1UplZ0+j+9l+x6+dAPzfcpXLokt
 v8j7ZofyUDwHX94mlFXu/W1gubEw9aI45nBTasB657jQLNts9T34eSzt+NnCRE8jRI02
 ZckA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772811860; x=1773416660; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pEgehalkeCNp10GuoaFl2X/abjVmlx4h7B5uiXqre5E=;
 b=ZnaOcQO+ggmQ/m3U0LuIxja1ll8+D2f2j/zP4o9tZfV3pJBsBf5caF/KWtwMXbwFFZ
 7QKmZBMOe1F/auOOonXwt93/ePT7oSNzPyu37bVQnidJxTkSdEpe8Am4hDbgYTyn7TtQ
 yWnkFUn69JN3Q2tVb9EpyOiZtL6xZmgakY2KZJaGpvaPF2uhSJJLKBCJrBhPOVx+vrR/
 pEpQrPvbQgqUlnnZPbpyMCQu8AEYrCEif7ZuOZt5uuXevPyrvdIsZ0rZhw83iOYj9W8R
 yfCGbXT5zsRn3b/t96joy6BWWHzr1cfNU9Wxo6IOe54I0u+37KBES0tfsTvYprpnE6uV
 GJIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772811860; x=1773416660;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pEgehalkeCNp10GuoaFl2X/abjVmlx4h7B5uiXqre5E=;
 b=CrniyOvSegcaoaVrQ0dovcmosRJdkOzD5bRJz3tI+W2tTykIlJ/Uu7pVizauvCnExF
 QyuHHaiBobho69HynQZwDOhNKraMKpE1aY8pYti0pU7lnE4Nacg4l8WoC3luFbjYkp4H
 3fZbS2CPM4hw6cLd58iK9Cngk0uU5Vfn1DGKhjA39zEjvqVMYynSSoqKSeqkD5RvzNqR
 cqMXIjEGHmIwqKlzoVa50QFvN/PCGc7YbC0MfGYUWgjEnlnat6gF3JVZ2uvbnOaQXf61
 NBSb4RBg+y7j9FozXtv8hS3erOi9zVisCcb1vV15ZEBgJ8lr7qs29azDChualik8pZCu
 RCQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmgo/fz6xJ1BTSfIirlTXmr7hjDVRr7BETgteXKJpBC3UiXwEB9CI0qBryhzHW2mSmuWpLUhzivQ==@nongnu.org
X-Gm-Message-State: AOJu0YwLhuO9a3/UxoguzQGEZVevzAMu0LQMgQ9fb7Z4LC6k8zvcj6Qa
 lA/uMjv42J3q7scFIVtB8zbXeBAUsyU5u2JOj5ZPJnH/9SU0S/BM6XVgN/8Dl0qICckiKbJlEkd
 3Ox7smpQqgG/v5t5z3lvCuP/5W/1iob980OX799cRkw==
X-Gm-Gg: ATEYQzwajaiz/UquHVS3c0V74qTtlfxCpbQ0rSxuhiD4d9e/O5A+qBzeD4PMtf3qu3X
 MjJBCo9AbzoFDO7wAF5m60EggmeFD9iLBbva7SwPwaXzG1r5bH0b6zkmmDpgWMCsEk2+bO1TnMj
 PYDeh5tyjjBZTUC1fu2EOXlGnc2EbcdB+Qx/Snew1BegHJsVqFdDRuze2W19qEMx3Byk6B9TP+l
 LHvmS3yTazG+hbIdKZ2Ya3Qlg8j3Qi5IPFUoR3CqY+HcAyP6VcYntNN/VGET9cEkyYye9fIaVzQ
 TIc4EWUMH4Blby6Ja05mtrxNbeeu57K5qRMTg0jxhuECR3CASj1cg/1tXytujH0F2jSkTxcvTN4
 a2w==
X-Received: by 2002:a53:b602:0:b0:64c:9ec3:d71a with SMTP id
 956f58d0204a3-64d1429cb1bmr1608987d50.48.1772811860064; Fri, 06 Mar 2026
 07:44:20 -0800 (PST)
MIME-Version: 1.0
References: <20260306130107.35359-1-mohamed@unpredictable.fr>
 <CAFEAcA-e4GZB_TRG7Jm3O-RNJneUtk_WufiXNn6=UDHsgG4kdw@mail.gmail.com>
In-Reply-To: <CAFEAcA-e4GZB_TRG7Jm3O-RNJneUtk_WufiXNn6=UDHsgG4kdw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Mar 2026 15:44:08 +0000
X-Gm-Features: AaiRm52O3QsEtKOSRK7EBWX59_vg_qMWiqyyqakDBp4BtQoNNqFRBsOcbaRg_k0
Message-ID: <CAFEAcA8gB-36c1TvJSwJ0MkVMy5z_dqKpVY7KTJ-cMV5rAX1_w@mail.gmail.com>
Subject: Re: [PATCH v15 00/17] HVF: Add support for platform vGIC and nested
 virtualisation
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>, 
 Phil Dennis-Jordan <phil@philjordan.eu>, Alexander Graf <agraf@csgraf.de>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Mads Ynddal <mads@ynddal.dk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12d.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, 6 Mar 2026 at 14:58, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 6 Mar 2026 at 13:01, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
> >
> > Link to branch: https://github.com/mediouni-m/qemu hvf-irqchip-and-nested
> > (tag for this submission: hvf-irqchip-and-nested-v15)
> >
> > This series adds supports for nested virtualisation when using HVF on arm64 Macs.
> >
> > Reviews would be very welcome :-) It's maybe a bit unlikely that this will make
> > it to QEMU 11.0 I might as well try.
> >
> > The first two patches are from the SME enablement series and are present for the
> > series to be buildable on its own.
>
>
>
> Applied to target-arm.next, thanks.

I'm afraid this failed to build in our gitlab CI job for macos:

https://gitlab.com/qemu-project/qemu/-/jobs/13388426185

In file included from ../target/arm/hvf/hvf.c:489:
../target/arm/hvf/sysreg.c.inc:174:21: error: 'HV_SYS_REG_CNTHCTL_EL2'
is only available on macOS 15.0 or newer
[-Werror,-Wunguarded-availability-new]
174 | DEF_SYSREG_VGIC_EL2(HV_SYS_REG_CNTHCTL_EL2, 3, 4, 14, 1, 0)
| ^
/Applications/Xcode_16.1.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/System/Library/Frameworks/Hypervisor.framework/Headers/hv_vcpu_types.h:312:5:
note: 'HV_SYS_REG_CNTHCTL_EL2' has been marked as being introduced in
macOS 15.0 here, but the deployment target is macOS 14.0.0
312 | HV_SYS_REG_CNTHCTL_EL2 API_AVAILABLE(macos(15.0))
API_UNAVAILABLE(ios, tvos) = 0xe708,
| ^

and similarly for other registers.

I'm going to drop the last 4 patches from the series, which I hope will
fix the CI problems.

-- PMM

