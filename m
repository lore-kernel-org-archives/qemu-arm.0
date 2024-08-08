Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp445795njc;
        Thu, 8 Aug 2024 03:16:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVPIWlpB7jzvDmXkzB0iHf70GXQKHlFC6Z9qAh15IrXPwJU7sailaJ+XnoRtfRFMppD3lNROTGOuyMM1Xjehm5DH2mVjdc4
X-Google-Smtp-Source: AGHT+IFau3PDXJXz7duB88OZZpL0MnJCSQjqRBQ42RIo7t8zbRmTmmUsFdC5RhRyX53M6sXUqygW
X-Received: by 2002:a05:620a:c42:b0:79e:fd1e:6fc4 with SMTP id af79cd13be357-7a38278cac8mr169658285a.34.1723112173041;
        Thu, 08 Aug 2024 03:16:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723112173; cv=none;
        d=google.com; s=arc-20160816;
        b=mcjiTaNn3CzHpYVaRBta0PzRz+W/mCejG/lTTRGStUJt9+9RXr1Ll1al/vi+NO7uQv
         MQrfirZdCw1E119vY2Tl92Pq6/SHN96masMiDYMQvtyXlxSdJstcCW+MV6x9nUm3FBXl
         yENE36CQHi+lFsmovpuWgqNGfX3XcZ4X3xQcEGc/NVe/2gObaeQ8+ftA41L/vGeOJMaW
         ko7XutDSTcTQ7yg+ZhlFsSMTZfMEFNLFEB+Cs5dXCc2XOlTNn88bTq/+Boz+5gLXJJ8E
         6h8Fa5+naFnKbkX2q1hJqyH4JINUg5KB+2Uezsve0+cRN2UqsixN/0XtlkUUibMrWPtI
         gQeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=4g8dcmoChDv2it2vHAMsk11DokszwvL88J2ivi3iQ5Q=;
        fh=llyI2s/F7BMeh1eymUR9etavmBqPFRVjY4lTwVCPeF4=;
        b=fm4ZkekkpJaRHGldCN5RYX0Tz3Kbji5HJ3Hvm8h4er/DfFxhqgBcqvNcXLjLm6+oLw
         3EVOr7EZWtSIBhBFdhNqHswVYAJrnxW8dFu3zXn1miPOATyW4flJq6MB75wv8ievZ0nP
         nf5xGjtN80LJ/85h5A5PVlCluko76ua1Dsuhbfr67/1iNzQ88e2Zevo4y2lEZPhpKzPK
         eIVcEh6Ue4ahh3nUzllfuxP4IcNmGSaiOUSiwQAbO3f32gWmsjojEK8d5Vyr+0jjTp9F
         f/gVpH+aAJq3JxxghejpJeXXRmtkdi31SLUJv4y2F+wG1nvJP+KMlZ5Ol+WKuQFKtfmd
         O+aQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S38R128i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a378874a66si394166985a.747.2024.08.08.03.16.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Aug 2024 03:16:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S38R128i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sc0Ba-0002vk-Nx; Thu, 08 Aug 2024 06:15:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sc0BN-0002fz-5O
 for qemu-arm@nongnu.org; Thu, 08 Aug 2024 06:15:48 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sc0BH-00033y-99
 for qemu-arm@nongnu.org; Thu, 08 Aug 2024 06:15:42 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5b8c2a6135eso1167608a12.0
 for <qemu-arm@nongnu.org>; Thu, 08 Aug 2024 03:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723112129; x=1723716929; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4g8dcmoChDv2it2vHAMsk11DokszwvL88J2ivi3iQ5Q=;
 b=S38R128iOFCehoGMSIxOHKNf+PV1WvLHs1q9jz/tR2fSzXJe6Y+qVMFAT+VXml5S89
 rS1RwveQjU0gDuNGKzUSjuAOOF3lPJdCPM0BAhQ+QA0FApJxidLDE3JnWI4htfhFdWkv
 OZjkm/D7/PmcYZfYwGAMPNoC3ra4Qo/rYiRYYUKqCvBTumkHGHI6Cazyw04163rKtMnd
 ocjT5t2q2RJtWis02oNcKcjJtar4kEcMqHL2RLeNJqrWmstoIu++PeqGH+co2b64Sc4M
 GnLI79L87K5Z+v9/lwffgcMVJnuJmKSPUoSvSMKuP6W80VjC1j0Vjai6vthLzVFN7t/i
 HqdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723112129; x=1723716929;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4g8dcmoChDv2it2vHAMsk11DokszwvL88J2ivi3iQ5Q=;
 b=tqWak9zErHCu4R4L/cY1YI1/ofE6f+TEBVai7dk6aeCntVfgqmikTeZQJZsxYTjaVg
 +Jcx5rPM/62o2ZC0ZAP71xQ/Z2xLn6hjONR1tGhkWO/p65861QB6XWda/NQd8vwXeVW4
 xs8zZhbYkkMccyrK9jUcwy+mvZjQvz/MUKvSBMLNwoGm0GY9Dax/e+UrPe5Vhc8IQDC0
 gjsFCMI0bjbge/qxu1D4LO/u2HFSPHVnlRvxUyaxuT9YwNc1nAV83rX1UKgmUczHSXP0
 0em+0c4xrTiveoOFKF4N/tSGv1oUosO3HsHhqF/0dNajgqlvC688//Jdypyr3nvMwwMr
 c/Ow==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtVh8NKYKpRvnO48yGwIl97mSC8bMGF5fX9WQnq0ipe0M+fKV2ee2s1455EJraAG7E/dzX7sNFLp27bvPpVY8UeswP
X-Gm-Message-State: AOJu0Yz9Xvmdvf+VUo0fzhUsnp6RvHp6XeUEXiWemikDbKqxIxFFgYhI
 jpZneF06HFvFFFpM2zcXYkY0+zlT9P+zz7m6DwEiugHKRqhpGXKFM8xsHUv6W+nUFZEdKRaaPHl
 CfhO2K+xn9JW38uisKxrG3pe2GWz9qUoNSDwkYQ==
X-Received: by 2002:a05:6402:280c:b0:59f:9f59:b034 with SMTP id
 4fb4d7f45d1cf-5bbb3c8f81emr1258112a12.13.1723112128774; Thu, 08 Aug 2024
 03:15:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240806141940.22095-1-philmd@linaro.org>
 <20240806141940.22095-2-philmd@linaro.org>
 <f82397e9-3be4-49be-b291-5598acdaf39b@linaro.org>
 <CAFEAcA9emwsK07+itUzMxReOLG8gHaxNdDE8ymuwyuBfsoY2Pg@mail.gmail.com>
 <87bk23skhq.fsf@pond.sub.org>
 <CAFEAcA8J4i-81rOEHBpqbV=c4F26o6qd3Lg9dZV+BuNyZPGg7Q@mail.gmail.com>
 <87ed6z1j77.fsf@pond.sub.org>
In-Reply-To: <87ed6z1j77.fsf@pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Aug 2024 11:15:17 +0100
Message-ID: <CAFEAcA_=GYBGpbvfKMGsYrUKWgcTLrriBKd37jOVFV1YMfy8Mw@mail.gmail.com>
Subject: Re: [RFC PATCH-for-9.1? 1/2] target/arm: Move
 qmp_query_gic_capabilities() to hw/intc/
To: Markus Armbruster <armbru@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>, qemu-arm@nongnu.org, 
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
X-TUID: dESv5AX4yFtD

On Thu, 8 Aug 2024 at 10:02, Markus Armbruster <armbru@redhat.com> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Thu, 8 Aug 2024 at 05:32, Markus Armbruster <armbru@redhat.com> wrote:
> >>
> >> Peter Maydell <peter.maydell@linaro.org> writes:
> >>
> >> [...]
> >>
> >> > The QAPI command which this code is implementing is
> >> > also (a) target-specific and (b) unfortunately
> >> > designed so that it doesn't get passed a particular
> >> > CPU or particular device to query, it's just assumed
> >> > to be a part of the whole simulation.
> >>
> >> We can fix (b) if we care: add a suitable optional argument, default to
> >> the sole GIC in the system, fail if there's more than one.  I assume we
> >> have no machines with more than one now.
> >
> > The exynos4210 SoC (board types 'nuri', 'smdkc210') has
> > two GICs. (It's a rather odd design -- there's the
> > interrupt controller that's part of the main CPU
> > cluster, and then they used a second "external" GIC
> > that feeds into that one.)
>
> Then "fail if there's more than one" would be an incompatible change for
> this machine.
>
> If the two GICs have identical capabilities, it doesn't matter to which
> of the two query-gic-capabilities technically applies.
>
> Else, it matters, and we have an interface issue.  Do we?

It's not possible to use KVM with that machine type, so the
question is a bit moot. (This also indicates that the
interface is not very helpful -- it purports to tell the
management layer whether it can use an accelerated in-kernel
GIC, but because it doesn't specifiy the board type there's
no way to provide an accurate answer. It would be useful
to know exactly what libvirt/etc actually use this for...)

thanks
-- PMM
