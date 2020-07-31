Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3337078lfy;
        Fri, 31 Jul 2020 02:21:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcNC6LWROk84sJV1jYRuuQc4kMLqGw9j05yPePnyqlIiQWGNVgINYZkkTvGt0QIvBHGraT
X-Received: by 2002:a25:86ca:: with SMTP id y10mr4529391ybm.275.1596187268630;
        Fri, 31 Jul 2020 02:21:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596187268; cv=none;
        d=google.com; s=arc-20160816;
        b=XsLUWIY15/XZTRY9NDMI5//kmxSuylPKnWIAfOyWYUqqBpqiQJTXfGfSPOjVeSCnZZ
         SmmRi1Sy8Fp+hFCuLRCCrTjPBlEpBV+7KUWGCs9Amg4LraodNWl2s+LsIHKfsyhvtUvA
         YwlYqKhXnOEB+KIkZ1ZrOWe0JPXRglneOrIMASzPESVzwHFWorNc4W8EJC6Au/nj7pq9
         srgVBSKGbgPvlPxWcGjBlag2yFYK5Fs01kAz7OdPOWjND97VU00ZwRHV+NkmDahElhnj
         CRbRBa51ejI9o2E7MXz9r0JUlFqSQOXTcCXm6Q13iBCwf9coCEkQBMClqPWBPuOZrRxl
         alVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=p/bq1ZJ8SLs8bMKBvzOj1go2qGbYrZnb8EtXbiteBAk=;
        b=POvYcZU6Yf2kbRdvDb2AfYeEKH9Ji3S1RAOVwgmQOeBDznEpaG/II3h4goRQQsoK/b
         dBKQBNcE39ODOQKImq9f8biapsQr6kt8y7a4D+5ODIJh73/IH0ZYkaswq81QuBcndnGi
         IdCUjdKJFwpz24re1CRIQbxISUKWsqnSnt2z3wYOMvYnXdqEr7lVxz5WRHxJNe6a6gVd
         NdfvJO3ih/OK17Bh0U9jlcFfFqD3QZGdB0XMglsWWyV0TH/7++pQFjXgiyGIveJksSFO
         2HikK707LEejTf0oZ/NOQiklBs2484ybFd+3Ht7TRLSWk2YKMb04nbtkT3Z942O09LlK
         GgOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C02GibLj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v197si6579953ybv.56.2020.07.31.02.21.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 Jul 2020 02:21:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C02GibLj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k1RDw-0004gG-1P
	for alex.bennee@linaro.org; Fri, 31 Jul 2020 05:21:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k1RDn-0004fr-Nc
 for qemu-arm@nongnu.org; Fri, 31 Jul 2020 05:20:59 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:38000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k1RDm-0002UR-4Q
 for qemu-arm@nongnu.org; Fri, 31 Jul 2020 05:20:59 -0400
Received: by mail-ot1-x344.google.com with SMTP id q9so6513561oth.5
 for <qemu-arm@nongnu.org>; Fri, 31 Jul 2020 02:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=p/bq1ZJ8SLs8bMKBvzOj1go2qGbYrZnb8EtXbiteBAk=;
 b=C02GibLjlOL82nBjDWyOvyZwfySCAyzA9n8x7f1ih+905rSmdjPodI3yILnbZ7Xa90
 9V2VP8s8tI5uXtBRtL1MB9tP2yihn0A5Z+IHqd4emAYWsaLQLlpPefrfFcR7fZnnVNnR
 OudbXZCbXTzjHvxntsPkC8R4YQb1zBpOA8tFYkuEM3WX9IN+tXyy92rsNj0N/CCeC287
 ZqwvNH08I3NWTlAYG28+Sui4nrVa7il06lC5OcOSnRXIBqUvh6431tAs2olnRwIvFDGZ
 G9uR3bxB7DUPRhJ/kNe62tbwfKm7ejJDlJBPswNoipddiyjrgIDWPQcwzaO5P96Jlsjv
 cPFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=p/bq1ZJ8SLs8bMKBvzOj1go2qGbYrZnb8EtXbiteBAk=;
 b=syoiFAOno7U+I0CgDLoxACm1q2Q6BopCsq9M4EQE+5+rum5P5bx9KpVoYEBmZzBJ+D
 eitA+xWv+myskL7RzsHD9w1wQiM9VBJD933x5QjXn26+dMlcSpmA7kSvfX4+9eIxOGPC
 6y3s+QFB11SK4L0rFE6S/FSsOATz5gEiJ8UrRg105VdN84F66g3UCOECrHqKN/8GY2cC
 BJZlQnuQt/1Gnlas84kub8dcHsMHyaf5We2A/MBdJgik4aqrfNl8RKN+K/f4ITUrlpIu
 iNVsfyd9zpjFSPKPfsamVmtPPztgc0t3LFR5RkS7m1HczQVsVFpfOoLMScSMOPVxw03V
 RCnQ==
X-Gm-Message-State: AOAM533O7VCtIRyjez9W8h/VmGXt9ycdzlliYywO+7zYBpIylU0PqGaD
 BNFDgi0pFeARF4ShhcafTBPsGRqV2dYrUMc27fDh5YjvqMI=
X-Received: by 2002:a9d:39c2:: with SMTP id y60mr2147241otb.91.1596187256519; 
 Fri, 31 Jul 2020 02:20:56 -0700 (PDT)
MIME-Version: 1.0
References: <1596186433-17364-1-git-send-email-likaige@loongson.cn>
In-Reply-To: <1596186433-17364-1-git-send-email-likaige@loongson.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 31 Jul 2020 10:20:45 +0100
Message-ID: <CAFEAcA-yTM7=Q0V1_8fSUa7KnsgQawcP=Jnh4J4oCrhFAt3dXg@mail.gmail.com>
Subject: Re: [PATCH v3] target/arm: Fix compile error in gcc 4.9.4.
To: Kaige Li <likaige@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-TUID: gusfnMML0pE+

On Fri, 31 Jul 2020 at 10:07, Kaige Li <likaige@loongson.cn> wrote:
>
> Error log:
>
> /home/LiKaige/qemu/target/arm/translate-a64.c: In function =E2=80=98disas=
_ldst=E2=80=99:
> /home/LiKaige/qemu/target/arm/translate-a64.c:3392:5: error: =E2=80=98fn=
=E2=80=99 may be used uninitialized in this function [-Werror=3Dmaybe-unini=
tialized]
>      fn(cpu_reg(s, rt), clean_addr, tcg_rs, get_mem_index(s),
>      ^
> /home/LiKaige/qemu/target/arm/translate-a64.c:3318:22: note: =E2=80=98fn=
=E2=80=99 was declared here
>      AtomicThreeOpFn *fn;
>                       ^
> cc1: all warnings being treated as errors
>
> Add an initiallization value NULL for fn to fix this.

As I said, I've already applied this patch to target-arm.next,
so you don't need to do anything further. It'll get into
master probably on Monday.

thanks
-- PMM
