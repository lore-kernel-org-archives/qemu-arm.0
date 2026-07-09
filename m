Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1499FC44508
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Jul 2026 13:43:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1whp1q-0007qb-3l; Thu, 09 Jul 2026 09:43:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1whp1g-0007o8-Gp
 for qemu-arm@nongnu.org; Thu, 09 Jul 2026 09:42:52 -0400
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1whp1d-0004wI-Bl
 for qemu-arm@nongnu.org; Thu, 09 Jul 2026 09:42:52 -0400
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-667a0f55a59so2315054d50.1
 for <qemu-arm@nongnu.org>; Thu, 09 Jul 2026 06:42:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783604568; cv=none;
 d=google.com; s=arc-20260327;
 b=P1HGj4ZPF/Amanyiw3LNnkCPmZriZ2NnvfWMmexZehdjbYACgnW5ml68jljsvluSs6
 D5OwALZUZ8odoyTMegZVa1R9iVcbDbbubzlSS337UEVsDFNX7g2S3NLLQ8KjOyqbExgs
 y10P/JXm/9XXF9VcfoKQZ0Ov2risL0mvHbH1Wwsgtgky6+05Ly4KF+ddUB3olMk8xpyE
 /VegiY9HJq17bxUPJbt+UBrTfBg27va7FFH6d1NaktW70N/13vfVNSyy6DxCWF2oBY+i
 ZxP/j2ecJB/gEj4slHzSHQEaXpvkgkqs2UOQgqqszsD0Dy1IqPPXaGEfRYgOKRw4qNB1
 jeQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=4f47UdzlpaPaLaEHs49RxH5ctcH6rW/5dLJR9+xiMVs=;
 fh=E+sLtDFIQjaGNw0GYwXWhEeyZ6vY9Inbhqy0oEN88AM=;
 b=VK2FVn/fYW8sHENP9grTt4ZE81QCVHV5yc8IemXgHKQmQm4ZUK/OA9cNq6bulpeVOO
 jdLa1LaM6kdA5wKDhMrrNeAjvQXxTW3ZbRGPQjab/HgdZZ0Eas+uzMP1CzjHuJLfFErs
 EPhpTpfdsHlSSMkeHPk1OJkFo5UaohpOYIPhMOFKBzlA+x4jPabxs7sL0kd/Mgb5SvFX
 lmRKEFm0uEk0zWaWmERqc6fUgQya40nZv12n80ZUi/0BorDbedGsALQvbLHqx+9dAJcQ
 rQ5odd6Yridhp0bz2jh0EEl2oTH0DO4qQsx57QYAOvThC3lIwgg0jldaxmMiEcAHLMtb
 yleQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783604568; x=1784209368; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=4f47UdzlpaPaLaEHs49RxH5ctcH6rW/5dLJR9+xiMVs=;
 b=UKeBXfdxSWRkSwXPnyNAi2d0DRGVA1NxQ0YARLXCrDFg6eyp7VHqv1ra/yLqSMzkDK
 G7nEAND2WyO5x4McL9kHxgTLv6RbG8oZY1TLCtD31lCGwXjQQr6AUVn6ownLU2Cdcctp
 pD+M1DqzVlbb18Y57jo0qQY5V4iu2pKTpk9YMxINnsmNjsqP2Olk+uVvzzHQqHnsyUj2
 bM/yO+rFqTRKN05EIEDIVIMEB33ARlm+UYxBlBz373BX6/GhH8igfAOMf4yLS3MgaAXf
 OVU8RdrchZvTvC+IY+UEE5k/MNZZPPWPNCppKesM71Mlpr6fw7ct6Rnwitax0jmOM0wj
 zw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783604568; x=1784209368;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=4f47UdzlpaPaLaEHs49RxH5ctcH6rW/5dLJR9+xiMVs=;
 b=q6dWejkKl7IY561FGGeQBVV46ng99a26NFM2N3XI36WsAOOonNzeTu2yzufpe+IKoK
 s3RE86WuUG1wg0LTH2gij1bNsZd9mOSdqjNndNNdppZq77BnX8PnhIDtc8KMWKzlR4mG
 wVGodnSiGf71xGRZDphXheqFFJWQCN7CNtlx+b6hlsdaM83VKgv4R2bitFqjTQq1H4CH
 f/F2KZH37W1MhYTWhL5O+TGeu0vYv6vWgc3r16YB39Rgd4U7ZrhFKffG2cx11OUrNsJP
 lj9UJAa5E5lLIgYC/L3LWbPgsWmxcSoQjHTa9V1Yd68VFgFMuBMZwC6TCHoklg07yZSU
 PQuw==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro3n4/j8lW3tRwY8fgcg2QgyXr1nagL5tluXJ3TOFmhxYxNo6NlevxmQozYq3IcS8j3orTmOuehng==@nongnu.org
X-Gm-Message-State: AOJu0YxM1eQLw4UW/oPpGD0qDPvMEUWEyZVSJvS2Za47AML75T3IRJmH
 CVUGoqRIfbFk8aTFyb+lq6UNo+bwuXb+i2vUdWMmREqlgyEFvSMIWg0+e6/Bjl8lQK5SFE+Hu3+
 AsfWjkV8QjQmZFXRSii93dgkunX9Kp9ko4ElUilgofg==
X-Gm-Gg: AfdE7cl5KxvE2BlnkQv9ujdT66yoaWPVVcoaOkVTKz/iKuy3RBIumvb80CaywK1JnJ8
 9ToIlIMzs/2F3BLtz9ugUMK80pLbcqrw72WLoGE2CrxEtCGTPRVjojjixaJl9j658rX8QrcbPPn
 vkZbyolqjWEAvGngcDpxo9mGM4uARhujq9Ut5LBb/DumlD6MGzalYH00Tc2+Ixl4JCql6zh3MOx
 aWAz/wMS0QMWhmBpjOinUXYa2ytpxSbzPuofcO9vSdvOAu+x5XwsMzsog2cSn80eLDM9uG33U4E
 nWCvfCsKafoTmk9/1TNJVkeu0txPF98ZvR5zNsmAnGY3rtkuVhKrfowH
X-Received: by 2002:a05:690e:d4e:b0:667:67e3:4747 with SMTP id
 956f58d0204a3-6679f00e6dfmr4896508d50.15.1783604568011; Thu, 09 Jul 2026
 06:42:48 -0700 (PDT)
MIME-Version: 1.0
References: <87o6gge6b0.fsf@pond.sub.org>
 <CAFEAcA9goRQuxw3VD7AqUOHHTdOXu8MSfCxdQMBviE3QgGD58w@mail.gmail.com>
 <87zf00cn7m.fsf@pond.sub.org> <ak-i1dNY_RrGNHAM@redhat.com>
In-Reply-To: <ak-i1dNY_RrGNHAM@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jul 2026 14:42:36 +0100
X-Gm-Features: AVVi8CenNDKnjzGdESqchhDSqsDMSy6UlHlkVjZbw6v6FR4WVJLBJc2NNjTeOAY
Message-ID: <CAFEAcA_=rz22ZqPr77REQa5BJRZVuEkriq-gJ9xGg4E46JPUxQ@mail.gmail.com>
Subject: Re: A few Machines crash when "no default audio driver available"
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org, 
 Jan Kiszka <jan.kiszka@siemens.com>, qemu-arm@nongnu.org, 
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-ppc@nongnu.org, 
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12e.google.com
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

On Thu, 9 Jul 2026 at 14:32, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
>
> On Thu, Jul 09, 2026 at 03:22:05PM +0200, Markus Armbruster wrote:
> > Cc: mainainters for "Overall Audio backends"
> > Peter Maydell <peter.maydell@linaro.org> writes:
> >
> > > On Thu, 9 Jul 2026 at 12:44, Markus Armbruster <armbru@redhat.com> wr=
ote:
> > >>
> > >> I stumbled over ARM machine musicpal, PPC machines pegasos1, pegasos=
2,
> > >> and MIPS machine fuloong2e crashes.
> > >>
> > >> I run them like this:
> > >>
> > >> $ qemu-system-aarch64 -M musicpal -nodefaults -S -display none -moni=
tor stdio
> > >
> > >> Died when device_set_realized() tried to propagate a "no default aud=
io
> > >> driver available" error to &error_abort.
> > >
> > > Is this something we want to have be a possibility the devices
> > > have to cope with? Can we have the "ignores all audio data"
> > > backend be always available instead?
> >
> > There's plenty of precedence for /dev/null-like backends.
> >
> > > Otherwise every audio device needs to cope with "there is no
> > > audio backend available" and implement "do nothing with the
> > > audio data" itself.
> >
> > Yes.
>
> We've got a bit of tension between "no defaults" and "builtin audio
> devices" here.
>
> Cnosider if I had instead done
>
>   qemu-system-x86_64 -M pc -device ac97 -nodefaults
>
> It is not unreasonable to expect to see an error because you asked
> explicitly for 'ac97'  and forgot to wire up the required audio
> backend, and asked to NOT have any defaults.
>
> But with your 'musicpal' machine example, you never asked for the
> frontend device, so you should be forgiven for also not asking
> for a audio backend.

Ah, so this is because of -nodefaults, not because QEMU was
somehow built with no audio backends in it.

> If we guarantee a /dev/null audio backend always exists, we help
> the second case but degrade the first case

As a possible analogy, for network devices we just warn in
the analogous "device created but no backend wired up":

 ./build/x86/qemu-system-x86_64 -nodefaults -device e1000 -display none
qemu-system-x86_64: warning: nic e1000.0 has no peer

and the effective behaviour is that output packets are dropped.

We could make audio devices do that (which would be basically
equivalent to "if we need an audio backend and we don't have
one, warn and create the null backend").

-- PMM

