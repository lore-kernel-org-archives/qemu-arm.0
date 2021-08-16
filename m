Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1193272lfg;
        Mon, 16 Aug 2021 02:37:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwX+gz57PLsEL82Q5KZyfwVjpZLDuf9TzN96BBP7BWPPY3uHmPnD3SacFHzAhi15/PGhujU
X-Received: by 2002:a5d:9bcf:: with SMTP id d15mr12057839ion.88.1629106662687;
        Mon, 16 Aug 2021 02:37:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629106662; cv=none;
        d=google.com; s=arc-20160816;
        b=Auqb7yIZj2VTmeyiSXybz6xNZmn+WGLfe+u4F46eK+E8fz8JLbi19RxJ0AbXP3VlyD
         gZOYWLklLCi2DqYNaqmjgYLqLReovo+DWoJytlfa0s4/EiQjjZP+HjjjpNyFelD/WvZN
         Td03xFIcxAwZOhlKt2OOiWRj5Rgp5zOsOFIJqDdKnflpcfBo66ZHj5ufHHVu0Nx3fZGH
         z2M5Zwhm7zAR+tfKdcgGDNDWQvZEOORMDIQKZwZUDk188iU/U1z13JgqT1SGb5qvGm2T
         GXFtu+4hEZvWEwxgJ7eCAVRjuMi0vmJQqwGsUTPFgXWRURbMzeHH/6/I3D+Xb1s1cSyH
         CrmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=cEeJFdbC9rRTnTQqm32d3tN6zCBpZhmaH3HltzkXtuc=;
        b=gc38hmUJhpn97oL//wuU/xYDgF8Js1nF/DtuYrEhPRuETiG6kM4Y7JZWhWdlwRDuio
         4F1N4eBI3tSwMyLB/5QviPvaTz8YVB7fm5E6t5nV3Mc3ZU3ZlTjPOIXq5wrabuVRD8YZ
         HgPnYpb+yU0bfPjZ+JITNQ65m8QIxuO6zKXAuQPkrQc8Qz4hO8d2Cgj124+ziRE4+A1Q
         SpDupteVFwsV7XZsX9gJMA81bhQxKmH/q3eDB/sOgxoJgr08nv5zRyPxtTFlRQbSME60
         8QBhuPwMeU7ykh51a1TF1ER/qty4q2ylWDYxROv7j9lpKN+cA/yHDIzKDPxkHM0FK8Es
         n16g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p1tC1ICA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y28si1708059iot.48.2021.08.16.02.37.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Aug 2021 02:37:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p1tC1ICA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mFZ3u-0002H1-27
	for alex.bennee@linaro.org; Mon, 16 Aug 2021 05:37:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFZ3m-0002Gr-Ur
 for qemu-arm@nongnu.org; Mon, 16 Aug 2021 05:37:34 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:38880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFZ3l-0004Ew-9i
 for qemu-arm@nongnu.org; Mon, 16 Aug 2021 05:37:34 -0400
Received: by mail-ej1-x636.google.com with SMTP id z20so30596219ejf.5
 for <qemu-arm@nongnu.org>; Mon, 16 Aug 2021 02:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cEeJFdbC9rRTnTQqm32d3tN6zCBpZhmaH3HltzkXtuc=;
 b=p1tC1ICAUdKFDP9Aeo2Rvf/ek3H7uOIZpf+1i8G4jDh2JcYE9o72WMrbs9BbfcuEwM
 z8C8vc6e0qFwovkmKo1jJCTOsWr6RWdK/f1Kq/vRWBhA+jETUwxJbZoDTdqVmtYNLO/k
 ZOT0MyiXtgo+PagY2yYbxicww0PB9UnYQ+2CTZiLphR4jybGbNpCh1hn1DSjcsjFpV5d
 fXcrbIdIfbTpwTDxtLWJ8GsJcJchnhMjrE0MfCOajQ2id1WHp1A81ENucdHk2xwZzWPA
 XcZb+NikMPuz69F8lhz6C+n8In04czO5g2esj1SXLSDxMW0OFY/3i2eTltBoV8C06CDb
 GaqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cEeJFdbC9rRTnTQqm32d3tN6zCBpZhmaH3HltzkXtuc=;
 b=MFczjyD3sA+DfAbh9WHwVLqALGAEHcuqmTXm+s4SzelQD7UyhCqP3G9GZ2a3zsOyKv
 UzAjD1OAfxv7UTqnVkK23KCopXYPfBkCXigPIfn9xm/4PQxDzGgQFepbM2A8MgJ97Z3t
 8PTBOLaBpqTdZRcS8DROpZLlmBB1B/jFPMecZuuF+gN7xwrRJiVx7pI9eY54TlLz3PWc
 Y7tk7ofReAvSQfMYWCocUW7UG4wnFVi6OpxcV5SkzYpsvc+2kPveDPgHkHgBZKY7Qd6q
 NBP5eCscY/RMMkiFOdPg91XPI2w+iZcGwdvjFsZq+x9Ut7d2jfhu6mhiRf6xK2g7Xra8
 h+lg==
X-Gm-Message-State: AOAM532zKnd9J1mcZZIWrvGEqcZ5Pg9xEVfz7lbPmDSZCrcDy1cmB1VH
 3nSK2vfp86sYVzCi4GZ3Ypk6GAdfogC4kSRT3yTHaA==
X-Received: by 2002:a17:906:aac7:: with SMTP id
 kt7mr15236885ejb.4.1629106651495; 
 Mon, 16 Aug 2021 02:37:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-10-peter.maydell@linaro.org>
 <86d7a767-f53e-dfa2-3641-9e39512c0512@amsat.org>
 <CAFEAcA8DNSS-0oXCDWeFNkin=mbNePS3CamnCgvvC+89KOWXTw@mail.gmail.com>
 <bad5ee5a-0f13-6d12-5055-4c649f78aa4e@amsat.org>
In-Reply-To: <bad5ee5a-0f13-6d12-5055-4c649f78aa4e@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Aug 2021 10:36:46 +0100
Message-ID: <CAFEAcA-iG=a_A+OSXrJhh2+qo09vvSJPH7oF0fft_kg229eAvQ@mail.gmail.com>
Subject: Re: [PATCH for-6.2 09/25] clock: Provide builtin multiplier/divider
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NsHN+je3kcyT

On Mon, 16 Aug 2021 at 10:32, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> On 8/16/21 11:05 AM, Peter Maydell wrote:
> > On Sun, 15 Aug 2021 at 17:32, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.=
org> wrote:
> >> I only wonder if we shouldn't check clock_is_enabled() here.
> >> Maybe not assert, but at least report a GUEST_ERROR?
> >
> > Setting the multiplier on a disabled clock doesn't seem like
> > an error to me. I would expect a common way for the guest to
> > program a clock-controller would be "first set the divider
> > and any other parameters; finally, enable the clock".
>
> Eh sorry I meant the other way around :/ It is usually either
> illegal or undefined behavior on real hw to change a clock scale
> while it is active. Personally I'd be interested to catch guests
> doing so. I was thinking of:
>
>     if (clock_is_enabled(clk)) {
>         qemu_log_mask(LOG_GUEST_ERROR,
>                       "Changing scale of ENABLED clock '%s'\n'",
>                       CLOCK_PATH(clk));
>     }

I think if particular clock-controller hardware has that
restriction we should be logging guest errors there. (Doing that
also has the advantage that we can make the error clearer by being
specific about what guest hardware register/device is being
mis-programmed.) I don't think we can be certain enough that it's
always wrong to change the divider on a running clock to put the error
in the common clock API code. (Among other things, I suspect a warning
here would be easy to trigger incorrectly when connecting up hard-wired
clock dividers at startup.)

thanks
-- PMM
