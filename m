Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1204195dyc;
        Fri, 4 Jul 2025 06:14:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWTXN1oqPvKryymucxqdcVgfwjZ5rdqymxJnW9xLdrSIftkWVQgm2urOZy276X7Z+qh4432eNWIOq+TCQ==@linaro.org
X-Received: by 2002:a05:6902:1b82:b0:e87:9baa:f8af with SMTP id 3f1490d57ef6-e89a0c4d4a5mr2050475276.20.1751634887672;
        Fri, 04 Jul 2025 06:14:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751634887; cv=none;
        d=google.com; s=arc-20240605;
        b=ApZ/GO+X9y0Zhe9PuYEqJfGheQhNzz1K3Jl3Hjvn+CJ3GcZWlGhPJ41n/176q4V05Q
         znm3zwQhsC5DS5A2TaskXxhIdSxcw+g43qO8MV+2RKUCUiiMs1b9i+CIWMYfwTSnoVBc
         baLgnn/JhE6Hn/ZYv9D6bK1Ev0Rd4HoUvsvaMQB9M081abjMd/1A9yP5TFwcy8ymV8ip
         oURbN2+oQYvecKD6tgeXpDAL46kBh6Pujtcxe/eH8oIWIgUYJINyDcg2/z7T+881KckB
         iehIUl3FBFrOOa5Q20o0UkY2StqOX81inRObf7xY+7g30Cn58wDgjbolzd9JhHEZqq2i
         Bq2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sgWVAeX696ADS4wvC22eym6C0NlcHUXH23NkY2yCwBQ=;
        fh=Rv1nGrEUn6xAcaochcZo/bDBl5LN4rP4cPrz4X6k/GI=;
        b=dI2kHQKoE0TsIM4hN9EeCAG3kdFCEUvj7moYTuTkHiZFB8ZBCroxQNmDWDHLbGRdZR
         d9vwy/bGADlVbqMXfHVgRW2WR/Y9D7THgmXoXk375cbGtEEuct6upxvA1pwVjQoPQREL
         bfU68P3Y8ZwHBo+QR1ZpKYVfSY2NCPkH1a3ffs8NXQe2mJhKVjtoQEy/FntbUA2pbiFK
         VBs7EZY/vsZ06K1y/ulU1Fa3lKFibOSywq54Vez5HlEzTqTrhwZglkwySyO/wfvYiCW/
         wyzNNNfSCKZDpQXNOn/IWHbf0jGPUKJExCByBKbB3QZ2f56vT5cdTWYrOMvfD1QV+DzP
         Lr0g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Zh//s9S9";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-716659a9456sor11726727b3.6.2025.07.04.06.14.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Jul 2025 06:14:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Zh//s9S9";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751634887; x=1752239687; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sgWVAeX696ADS4wvC22eym6C0NlcHUXH23NkY2yCwBQ=;
        b=Zh//s9S9CUwMxjPuOo9mOKJRVuK6nb/B5YS4YWkr1ppZnbbv883PkPfnhz67e9YlR3
         EiQywOKd9a7YQSoRuZjR6vOg5/5U+t3mjN3XaeDN2R/h6xRPAyoukBfNdsVI/+coyQxu
         sr+ngGUw2bdQM8HEaFX9/GNowbf+5r0FbqU/LMspF6jNI16dx0D/hy/NUWtVNTA3eKVy
         bNYHruDZxUDwkZMRWfjuw4X1ya8zlp+9KjsLKTBdFmf84nyaTQ+G60uSIhDJTTuyyUIi
         lIKSzD+jH5WC1eau+Yk9XeX0b1F+/MksgnkLjKTqyIB4wA2YQN0EHzo/GmNRCmcc3Z/7
         /SxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751634887; x=1752239687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sgWVAeX696ADS4wvC22eym6C0NlcHUXH23NkY2yCwBQ=;
        b=fQXzNRHUedyapD77jKefrgnZd/yT9Fwgrh8/V4zunzKx4fu+QEQ/1LbyrTD36cEoPG
         WS6ScHOzTKNukJbThmKhsMQLbd9Iw15XlpyX11l77xV4251QlPNWi9lAAB4hk1PBvPC0
         9Utuz1c3yYKMtKW/Fv9GTRk/+qVH39FNX4AMKp/If/DLxcJOQ4fFXJMgbLicq4I1sEBo
         82yMlWtCLr+40b4nC0hqquNbikJDBIR6gtQlOMhs+3sNQb70gnaNKf0vLfkeK1HM2v2A
         MrzHHNATFkVvbK98747/VBN42xNITEybB02Ign6mYVRHztVWI5q+goiu3Iupg1oWL4Pl
         vfsg==
X-Forwarded-Encrypted: i=1; AJvYcCWwUUS5XizfklWx6VeHw4+Q1PmHc1lduUS03ONiV2AS4JtEvXf/uB/XymYHKu9YADjIRy7MQf83DD7svQ==@linaro.org
X-Gm-Message-State: AOJu0YxPcplRH37ESuNiqtch4ZBj3I4nsPTd0wuSX7Zk+ynLqoQAQyw0
	yNWA2nUq1XHD7QYZy2Wrjq9cYAe3mB07DS4HgIudWZthzDfrV1WS73gs0N788ik2qgaDBJW3Cc7
	wnV38uzWufjw8dp2GbFphPdjT2PLFUBr20QbCEVzJoaSb
X-Gm-Gg: ASbGnctx8MqXWeJJ/DabuJtN33u5qlEqalFyisgCxfwmhdp3A/hMgMaIz2XTkSHgDBx
	lvR5ukI7PstsxQHSlI5CoulHhrr4kygtQ6jMoKvXQFFsfiCWJhA8fFeTCgwm0cvh8gnKcGJpFUx
	AsVtQxSYr4/Ue2lJMsj1TxkUA1IOYr6kVe2d9EOr37DrsP
X-Google-Smtp-Source: AGHT+IEHxTsdq5sMOzOnAwfpPI4wg9delp+RPxDCQpnHTDrXLQVwhIyURHz98cxNnYgMDTeSEIqW8ZsAm+f12EfyNFU=
X-Received: by 2002:a05:690c:88e:b0:712:d70b:45f0 with SMTP id
 00721157ae682-7166b81c144mr23919717b3.32.1751634887184; Fri, 04 Jul 2025
 06:14:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250630130937.3487-1-philmd@linaro.org> <20250630130937.3487-6-philmd@linaro.org>
 <e3e2f53a-33ad-49b0-99fc-c7af4b76a0d8@linaro.org>
In-Reply-To: <e3e2f53a-33ad-49b0-99fc-c7af4b76a0d8@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Jul 2025 14:14:35 +0100
X-Gm-Features: Ac12FXwb63s5deve8w9I1Hy8-x-UmmimYtbFzSHox7twYcg-uVB5CEEY8rdhakg
Message-ID: <CAFEAcA82LrhSz47_Q_FwbBmC-Nve-WR2bhfWoWyvYi_60MSBaw@mail.gmail.com>
Subject: Re: [PATCH 5/6] target/arm: Share ARM_PSCI_CALL trace event between
 TCG and HVF
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	qemu-devel@nongnu.org, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org, 
	Stefan Hajnoczi <stefanha@redhat.com>, Mads Ynddal <mads@ynddal.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: UG+gZy8pjuCi

On Mon, 30 Jun 2025 at 17:53, Pierrick Bouvier
<pierrick.bouvier@linaro.org> wrote:
>
> On 6/30/25 6:09 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> > It is useful to compare PSCI calls of the same guest running
> > under TCG or HVF.
> >
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> > ---
> >   target/arm/hvf/hvf.c    | 3 ++-
> >   target/arm/tcg/psci.c   | 3 +++
> >   target/arm/trace-events | 3 +++
> >   3 files changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> > index 7a99118c8c2..6309c5b872e 100644
> > --- a/target/arm/hvf/hvf.c
> > +++ b/target/arm/hvf/hvf.c
> > @@ -34,6 +34,7 @@
> >   #include "target/arm/multiprocessing.h"
> >   #include "target/arm/gtimer.h"
> >   #include "trace.h"
> > +#include "../trace.h"


> Just a nit, using 'target/arm/trace.h' might be more readable than
> '../trace.h'.

Mmm. docs/devel/tracing.rst rather discourages this:

# While it is possible to include a trace.h file from outside a source
file's own
# sub-directory, this is discouraged in general. It is strongly preferred t=
hat
# all events be declared directly in the sub-directory that uses them. The =
only
# exception is where there are some shared trace events defined in the top =
level
# directory trace-events file.

I don't know if we want to loosen that to permit events
that are shared between multiple subdirs (cc'ing the
trace subsystem maintainers for their view).

git grep 'include.*trace.h' | grep -v '"trace.h"'| grep -v 'trace.h:'|less

suggests that the only current place where we're including
a trace.h not in the same directory is linux-user, where
we opt to use the full linux-user/trace.h path. So probably
for consistency we should use target/arm/trace.h here.

(That grep also shows up that hw/uefi is missing its
trace.h header and the .c files are including
trace-hw_uefi.h directly...)

-- PMM
