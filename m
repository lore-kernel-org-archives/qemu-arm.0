Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6263BC8303F
	for <qemu-arm@archiver.kernel.org>; Tue, 26 Aug 2025 02:05:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uqj3b-0000kP-CR; Mon, 25 Aug 2025 22:05:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cjchen@igel.co.jp>) id 1uqj3Z-0000dJ-JW
 for qemu-arm@nongnu.org; Mon, 25 Aug 2025 22:05:05 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cjchen@igel.co.jp>) id 1uqj3K-0004Vn-3A
 for qemu-arm@nongnu.org; Mon, 25 Aug 2025 22:05:04 -0400
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-55ce5243f6dso5415490e87.2
 for <qemu-arm@nongnu.org>; Mon, 25 Aug 2025 19:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20230601.gappssmtp.com; s=20230601; t=1756173875; x=1756778675;
 darn=nongnu.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oYbhx6akeMrp0+j7CppN23HVOCbSEz9iiNk+OzyMiew=;
 b=cyD/5Ic9YokVOeId+PJFy821ebZFTjTqeAgvDCtSxpHmBdVrx7QAd+N+0V/3urRl8F
 d2NUKJ7T1zGRhBWzEuiP8WyV24HiyGKJZJ1sRT8MyR4YCzn2mRVOWL79MfK4MQo7oZJD
 5RNcWKtEjdVAs9MEv5dQOJTgCXC6GvnxjQjmkfpmYOuKAioORHoxs18NZKSH9hFgd/K6
 feoaHMzpiq/xybgrHpqAtCFtioQ5LTpEQiI2NmcYKmgZX9zub9FdWUqcNHaDTwKcL3Rr
 N/jILAB9kqYw+2MI+sEbdUVfQF8FCloHiPfTnwTN2J+141EvBVAZFyU+Yso/jV13L21H
 chEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756173875; x=1756778675;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oYbhx6akeMrp0+j7CppN23HVOCbSEz9iiNk+OzyMiew=;
 b=p5pkvBEkgK8BscTqhUUSorpPQUqOR5qtVW6zLc6XhR+aWmpoQZ+L7C6xwcgu4zOuJV
 pGFQmZ2W2Jp0vBqY75c0ISH2cmwY6qjfdUurCR8FLd0TOjxK859kmv+rFi7/Q2IKLRBi
 pBexKaMJ84z4mDLwyyiW795VR6jksmUd8muA5C1V7/NPvszIC3XOPOc1J1jsDsWyXWO+
 5GXx8ZrwyhdnzlWOjaZdfkNe5WX2VLWyTkRBorDJDpgIXK+17RNseBg6838gLy602zo2
 H+7ffj3gNNLSzuaNGswN2KL38WQ+lpizuZixK8tIQd2EUCpasx7PJkPnnsqUqBIuvpjD
 5pxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6GwtbliK9JZmyHbNKSZSDqSSDE/lZCohjRuVXBGbu1hsBBEM62uVJ1ClVEwGuJxQL/E+5OqyIlQ==@nongnu.org
X-Gm-Message-State: AOJu0YxNJ64IplAZJDdyVzIneCdyt804njyFLJnKvMeCg1aemodBJgID
 kaYfx8WpE8D1038sgrkpzPcQi/8UZvpl9exXrBSlScnSdXX2p8EzbcLQcOlD5qZiM/Gl1o+lwqS
 aEcfrT40GEy/ApkCzTEmknlZ5y7Zs+lIlEK0UCRXkSw==
X-Gm-Gg: ASbGnculVj9iId1+Sav2fY+HwwsZwpuhSnAUwYKx56HUQDwGxmQlLZGo6hsx7ssRAxp
 paor40j+FQJ+2f0sOHid7OKLHol8CPhVwbSngdz+wNjjFyDDph//Jsx0mmXvsbR12Q/+mPnFFOR
 0ojaE2DzU0bLj/da/T2vHCmEGysdIabuO2IkiOhmPbRAmTs8mYF0pgzbgxM44ygmlQ3qymEFMk7
 1W1rzYMKlHk1uJseG2p
X-Google-Smtp-Source: AGHT+IEszcJrVgWpZnUqNIKpNx2DkAOEn5XCeJFnYinMzW2Ne9pmJsYXTABQ7yr06tRvIUjlak1xZ0qnVmeooL9zs54=
X-Received: by 2002:a05:6512:3a94:b0:55f:4031:4374 with SMTP id
 2adb3069b0e04-55f40314508mr2318638e87.47.1756173875045; Mon, 25 Aug 2025
 19:04:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250822092410.25833-1-cjchen@igel.co.jp>
 <20250822092410.25833-10-cjchen@igel.co.jp>
 <e755b413-b983-4c98-bda8-e0c7ec6e29b5@linaro.org>
In-Reply-To: <e755b413-b983-4c98-bda8-e0c7ec6e29b5@linaro.org>
From: chen CJ <cjchen@igel.co.jp>
Date: Tue, 26 Aug 2025 11:04:24 +0900
X-Gm-Features: Ac12FXzS2vczPWQMQ-PQmOJZV62OGYrLk4GHU71rFORmH0JpAwXZUq8dRM8DWNo
Message-ID: <CAAMq-Y_9tqhAQmCfyMDhqmQEeF+XiyAq+RXiBY-GJGwmRMsEGw@mail.gmail.com>
Subject: Re: [PATCH RFC v2 9/9] tests/qtest: add test for memory region access
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Keith Busch <kbusch@kernel.org>, 
 Klaus Jensen <its@irrelevant.dk>, Jesper Devantier <foss@defmacro.it>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Tyrone Ting <kfting@nuvoton.com>, 
 Hao Wu <wuhaotsh@google.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Peter Xu <peterx@redhat.com>, 
 David Hildenbrand <david@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>, 
 Tomoyuki Hirose <hrstmyk811m@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=cjchen@igel.co.jp; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

Hi Philippe,

Thanks for the review and the pointer.

You=E2=80=99re right =E2=80=94 the CPUs are not involved in the test path, =
and the only
difference that matters is the binary endianness. I will re-spin the
series and reduce the test matrix to one little-endian and one big-endian
target to avoid redundant runs.

Specifically, I will keep:
  - x86_64  (cpu: "qemu64,apic-id=3D0")  =E2=80=94 little-endian
  - s390x   (cpu: "qemu")              =E2=80=94 big-endian

Thanks again for the feedback. If you have any further comments, please
let me know.

Best regards,
CJ


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> =E6=96=BC 2025=E5=B9=B48=E6=
=9C=8825=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=888:16=E5=AF=AB=E9=81=
=93=EF=BC=9A
>
> On 22/8/25 11:24, CJ Chen wrote:
> > From: Tomoyuki Hirose <hrstmyk811m@gmail.com>
> >
> > This commit adds a qtest for accessing various memory regions. The
> > qtest checks the correctness of handling the access to memory regions
> > by using 'memaccess-testdev'.
> >
> > Signed-off-by: CJ Chen <cjchen@igel.co.jp>
> > Co-developed-by: CJ Chen <cjchen@igel.co.jp>
> > Reported-by: Tomoyuki Hirose <hrstmyk811m@gmail.com>
> > ---
> >   tests/qtest/memaccess-test.c | 597 ++++++++++++++++++++++++++++++++++=
+
> >   tests/qtest/meson.build      |   9 +
> >   2 files changed, 606 insertions(+)
> >   create mode 100644 tests/qtest/memaccess-test.c
> >
> > diff --git a/tests/qtest/memaccess-test.c b/tests/qtest/memaccess-test.=
c
> > new file mode 100644
> > index 0000000000..7e90028ea0
> > --- /dev/null
> > +++ b/tests/qtest/memaccess-test.c
> > @@ -0,0 +1,597 @@
> > +/*
> > + * QEMU memory region access test
> > + *
> > + * SPDX-License-Identifier: GPL-2.0-or-later
> > + *
> > + * Author: Tomoyuki HIROSE <hrstmyk811m@gmail.com>
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "libqtest.h"
> > +
> > +#include "hw/misc/memaccess-testdev.h"
> > +
> > +static const char *arch =3D "";
> > +static const hwaddr base =3D 0x200000000;
> > +
> > +struct arch2cpu {
> > +    const char *arch;
> > +    const char *cpu_model;
> > +};
> > +
> > +static struct arch2cpu cpus_map[] =3D {
> > +    /* tested targets list */
> > +    { "arm", "cortex-a15" },
> > +    { "aarch64", "cortex-a57" },
> > +    { "avr", "avr6-avr-cpu" },
> > +    { "x86_64", "qemu64,apic-id=3D0" },
> > +    { "i386", "qemu32,apic-id=3D0" },
> > +    { "alpha", "ev67" },
> > +    { "cris", "crisv32" },
> > +    { "m68k", "m5206" },
> > +    { "microblaze", "any" },
> > +    { "microblazeel", "any" },
> > +    { "mips", "4Kc" },
> > +    { "mipsel", "I7200" },
> > +    { "mips64", "20Kc" },
> > +    { "mips64el", "I6500" },
> > +    { "or1k", "or1200" },
> > +    { "ppc", "604" },
> > +    { "ppc64", "power8e_v2.1" },
> > +    { "s390x", "qemu" },
> > +    { "sh4", "sh7750r" },
> > +    { "sh4eb", "sh7751r" },
> > +    { "sparc", "LEON2" },
> > +    { "sparc64", "Fujitsu Sparc64" },
> > +    { "tricore", "tc1796" },
> > +    { "xtensa", "dc233c" },
> > +    { "xtensaeb", "fsf" },
> > +    { "hppa", "hppa" },
> > +    { "riscv64", "rv64" },
> > +    { "riscv32", "rv32" },
> > +    { "rx", "rx62n" },
> > +    { "loongarch64", "la464" },
>
> IIUC CPUs are not involved in the test path. The only difference
> is the binary endianness. So we are testing 2 distinct code path
> duplicated as ARRAY_SIZE(cpus_map) =3D 31 times.
>
> Let's run the tests with a pair of common targets and save 29
> pointless tests:
>
> ... cpus_map[] =3D {
>        /* One little endian and one big endian target */
>        { "x86_64", "qemu64,apic-id=3D0" },
>        { "s390x", "qemu" }
> }
>
> > +};
> > +
> > +static const char *get_cpu_model_by_arch(const char *arch)
> > +{
> > +    for (int i =3D 0; i < ARRAY_SIZE(cpus_map); i++) {
> > +        if (!strcmp(arch, cpus_map[i].arch)) {
> > +            return cpus_map[i].cpu_model;
> > +        }
> > +    }
> > +    return NULL;
> > +}
> > +
> > +static QTestState *create_memaccess_qtest(void)
> > +{
> > +    QTestState *qts;
> > +
> > +    qts =3D qtest_initf("-machine none -cpu \"%s\" "
> > +                      "-device memaccess-testdev,address=3D0x%" PRIx64=
,
> > +                      get_cpu_model_by_arch(arch), base);
> > +    return qts;
> > +}
>
>
> > +DEFINE_test_memaccess(little, LITTLE, b, B, valid, VALID)
> > +DEFINE_test_memaccess(little, LITTLE, w, W, valid, VALID)
> > +DEFINE_test_memaccess(little, LITTLE, l, L, valid, VALID)
> > +DEFINE_test_memaccess(little, LITTLE, q, Q, valid, VALID)
> > +DEFINE_test_memaccess(little, LITTLE, b, B, invalid, INVALID)
> > +DEFINE_test_memaccess(little, LITTLE, w, W, invalid, INVALID)
> > +DEFINE_test_memaccess(little, LITTLE, l, L, invalid, INVALID)
> > +DEFINE_test_memaccess(little, LITTLE, q, Q, invalid, INVALID)
> > +DEFINE_test_memaccess(big, BIG, b, B, valid, VALID)
> > +DEFINE_test_memaccess(big, BIG, w, W, valid, VALID)
> > +DEFINE_test_memaccess(big, BIG, l, L, valid, VALID)
> > +DEFINE_test_memaccess(big, BIG, q, Q, valid, VALID)
> > +DEFINE_test_memaccess(big, BIG, b, B, invalid, INVALID)
> > +DEFINE_test_memaccess(big, BIG, w, W, invalid, INVALID)
> > +DEFINE_test_memaccess(big, BIG, l, L, invalid, INVALID)
> > +DEFINE_test_memaccess(big, BIG, q, Q, invalid, INVALID)
> > +
> > +#undef DEFINE_test_memaccess
> > +
> > +static struct {
> > +    const char *name;
> > +    void (*test)(void);
> > +} tests[] =3D {
> > +    {"little_b_valid", test_memaccess_little_b_valid},
> > +    {"little_w_valid", test_memaccess_little_w_valid},
> > +    {"little_l_valid", test_memaccess_little_l_valid},
> > +    {"little_q_valid", test_memaccess_little_q_valid},
> > +    {"little_b_invalid", test_memaccess_little_b_invalid},
> > +    {"little_w_invalid", test_memaccess_little_w_invalid},
> > +    {"little_l_invalid", test_memaccess_little_l_invalid},
> > +    {"little_q_invalid", test_memaccess_little_q_invalid},
> > +    {"big_b_valid", test_memaccess_big_b_valid},
> > +    {"big_w_valid", test_memaccess_big_w_valid},
> > +    {"big_l_valid", test_memaccess_big_l_valid},
> > +    {"big_q_valid", test_memaccess_big_q_valid},
> > +    {"big_b_invalid", test_memaccess_big_b_invalid},
> > +    {"big_w_invalid", test_memaccess_big_w_invalid},
> > +    {"big_l_invalid", test_memaccess_big_l_invalid},
> > +    {"big_q_invalid", test_memaccess_big_q_invalid},
> > +};
> BTW this reminds me of
> https://lore.kernel.org/qemu-devel/20200817161853.593247-8-f4bug@amsat.or=
g/
> ;)

