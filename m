Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp810202lfg;
        Mon, 24 Feb 2020 13:43:11 -0800 (PST)
X-Google-Smtp-Source: APXvYqx6+wYF1R3NY5Rxi7kDI6jpVr4vsRGoAWAc5t1pBAfIsytIgzwrMhhTwJq8KUYEGR8vuL9G
X-Received: by 2002:a05:620a:66f:: with SMTP id a15mr10576695qkh.446.1582580591340;
        Mon, 24 Feb 2020 13:43:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582580591; cv=none;
        d=google.com; s=arc-20160816;
        b=SJ57DeoNb8qBVBq8Lg9/T+KYdbKwBs5B0fiwTk49nmo/fhLjKOUY6GNlOwGW4yYKt2
         tSS9JdV7fdRPk1igId/Qzue6QEtXGW/0Bb9LDoBMX5PcdnV7I2ntaKlILljXoKX1V43B
         nzwp1q499QdvuuFXXr+tI3CwVKVaRR7z7gj/N7JUL+d/zI5z6T1hr2tvdKu1dfQalv9r
         gnVRovdZl1TW4RoOj7N7hiodJl9J1Xc2Nq2GZfy2wa8ozV8F2wqQf3xOyJxgdFCa6t4y
         WNC2Zr9tAOaOtbJoRljG/h71mt19R9di2l7LgFl/9ydZIxu8A4tfTjSSnm61TJfqh4F7
         FvmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=k9AuazKj5Lyr5/IGPo5NEYoU+N88UD1nQwcmMZGXpLQ=;
        b=Dm9XZ1AYskrn1X4n3bnhULykTg6P/D+dsRpt3H9k5dPZIBAdWmYrZ2NJQhp7V+vGiV
         3/djGjsJIo8R41NE35JGBw7aOEWkSjI/LSxCJM//Oa3JqDGUgCHu3gHFn1IV9elD09Tv
         X+CKmQILStC0vx1Rd+KuSyGrW9CZpYr6FxckFABWD6EmdgOl/s9gWRbmL8K+nzQG7haD
         oXe85EfnnxOMycxO0BMMXiSLv5tlCTZhz9NKJdMW44yCcjvO7nB9FzuW5ybaxls16FYo
         PwB4hYPfWpqvGlmKs2BIYTVRp6WRlftMhD6341x1T4YGbepGkgz0AqzfnqIwajMrfTAL
         8IxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZxCKUK7m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1si4037003qkc.88.2020.02.24.13.43.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 13:43:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZxCKUK7m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6LVO-0003mD-NB
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 16:43:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57135)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1j6LBb-0001Bv-BV
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 16:22:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1j6LBa-0007ro-EU
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 16:22:43 -0500
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:37710)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1j6LBU-0007oV-6a; Mon, 24 Feb 2020 16:22:36 -0500
Received: by mail-lj1-x241.google.com with SMTP id q23so11753755ljm.4;
 Mon, 24 Feb 2020 13:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=k9AuazKj5Lyr5/IGPo5NEYoU+N88UD1nQwcmMZGXpLQ=;
 b=ZxCKUK7mnNGWgcJdPCeCbRtDmY9Dqt9OpWufgqFslAsrLrrDx3xstVR+u78xUltfOJ
 OfXkk9Qss65ugChez7fi/j3iGAJxbADwTxW4Oi+cu6E4Xc12ihzBTN68gAUewnyax+oP
 W3kQheUDSt16cswmGdviQ0+GTM6HA1JH9eRb68e3SFzOl4ykQMhxhqHWSVDGWUBR/S09
 6FBg4P3/T/n0u0IE3Qdx1Q0WOU0Auklfwh9ltRnGihf1afahO96Tmf/6ovA4TuaYovvC
 goykd1Cx4mBz4cF98WdfjdEDeZl3dCvXzF73ZZDyvNs9WAapSxzYnNJ0nrQMBJzxmhKy
 M2zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=k9AuazKj5Lyr5/IGPo5NEYoU+N88UD1nQwcmMZGXpLQ=;
 b=Vb6/F6Fw46vczp+CAfWUl86D41+qQRKgRILjD64vPWbSJd/yrbKrrpvPv2xeNZ6ZHJ
 k4DOIYjnciw80jOOfeM6hVeTY3pqnBV0nX88dQNYRxNXGLITHqtS6LZ8DFfxKOlvMYWI
 ajP0baiw8pkpwjgYtMPpevHMJc16sVvmuuAsHEGJBmxyApKOCfe476Uoy5IZ3CwbfFd0
 iCY3y8YRH3CoRaYVPAp3h+37Z/VKeNroCyhwXZFEEKYqw/jER6HQjEXMWmTxDV29jz0N
 a2+Nm6twWXnqPCvgxJ5qDdODSjOlFrJG8/tTV/JMKOUowyZ/NoKJaBuYmllimHwdC/vT
 jvvg==
X-Gm-Message-State: APjAAAW/kkCCpH5m6bdyEbSO76ed27ydY+ZwTYtWlge1F0bGz12AIT9y
 60d5mEABn6KqI9yky8WqFYqIBr0r65iX1l9asg8=
X-Received: by 2002:a2e:7818:: with SMTP id t24mr30769610ljc.195.1582579354670; 
 Mon, 24 Feb 2020 13:22:34 -0800 (PST)
MIME-Version: 1.0
References: <20200224204828.23167-1-philmd@redhat.com>
 <20200224204828.23167-2-philmd@redhat.com>
In-Reply-To: <20200224204828.23167-2-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 24 Feb 2020 13:14:59 -0800
Message-ID: <CAKmqyKMMgSmpuEdGcu1sXrinMMiQCqYz0OcatTALYJ3WVRO=Mw@mail.gmail.com>
Subject: Re: [PATCH v2 01/32] memory: Correctly return alias region type
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::241
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Qemu-block <qemu-block@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair@alistair23.me>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 "open list:New World" <qemu-ppc@nongnu.org>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Michael Walle <michael@walle.cc>, Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TOaQ4FyfszIw

On Mon, Feb 24, 2020 at 12:49 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Since memory region aliases are neither rom nor ram, they are
> described as i/o, which is often incorrect. Return instead the
> type of the original region we are aliasing.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Cc: qemu-trivial@nongnu.org
>
>  memory.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/memory.c b/memory.c
> index aeaa8dcc9e..ce1179874e 100644
> --- a/memory.c
> +++ b/memory.c
> @@ -2818,6 +2818,9 @@ void address_space_destroy(AddressSpace *as)
>
>  static const char *memory_region_type(MemoryRegion *mr)
>  {
> +    if (mr->alias) {
> +        return memory_region_type(mr->alias);
> +    }
>      if (memory_region_is_ram_device(mr)) {
>          return "ramd";
>      } else if (memory_region_is_romd(mr)) {
> --
> 2.21.1
>
>
