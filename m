Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2188606ejc;
        Fri, 10 Mar 2023 10:07:48 -0800 (PST)
X-Received: by 2002:a05:6a20:4c88:b0:cc:786d:2128 with SMTP id fq8-20020a056a204c8800b000cc786d2128mr21402186pzb.53.1678471668487;
        Fri, 10 Mar 2023 10:07:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678471668; cv=none;
        d=google.com; s=arc-20160816;
        b=es0md5T6PXfi7+Azf9kjZJ2LcuQ2pvByRo4opD8Eu8gcbRBgCTnjkmDbpR5tBbs1wb
         r/ipIeznribZtOijqlWNVDaIt+vEnFKrSuDt6JHSOUKjBVcGG4oDcjQS/iUK7a+EG08q
         sAmePImcnqOL+gH1N7s4GtUFv4liEV5oR/NBiOza1L0jcIuAHG1Nu2ccDKlKlcPGt9Tw
         8v59cr4lCp1jIcxzyR+2KTYivfmpRBKZv5efp4rm/nkUAVnXrn8u3glBAgHonxK4GVje
         8WkiowE4uF+QfDTC+Rph1cUuo25wuQBVW4JKYTYcpD/EhCMX7l3LWsd7CyIYDj7TN16k
         aC4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yDWH/Bafpq6Al4Qixgc7s1DXFTyThL0etvF5h9pL7lQ=;
        b=jijxprouULup95nyEdXKRzhPrvMyby6KYGj7HcQl31p49OHJFAzACxs4X9jUAab1L4
         Ae1nPvKnZPs+YZsvJV7Xy7QlvQ1jw8VpJwHaVZO5233FImVDA0lCLaT0C0HUs+bEMHuh
         LBPkvV4L0zqg13bEn5Zm9xi2pzp4aKhfyA/YBFxmEfLyCAYFQiZi/Z99devwQBA4Ipxt
         w47zLtV7tiSwn5z9QeuhEbluNogLnNNByHMGJ2BRMBOE5T4Y8XOckNJ+zkwLL+glhm5H
         emNnMiRkMjfVkceUEWVSc+xGF19+rijtDgkHidt+mQzuaTdBfOXCuZnq5UkaMfXRmQ7g
         t6MQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ufUd3hGn;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n27-20020aa7985b000000b005d33273468csor139270pfq.61.2023.03.10.10.07.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 10 Mar 2023 10:07:48 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ufUd3hGn;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678471668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yDWH/Bafpq6Al4Qixgc7s1DXFTyThL0etvF5h9pL7lQ=;
        b=ufUd3hGnNtztI7jy8iYLCXJtY8hs4V8LKpugLfajkYgv1yK0Bm2Mjl5tZlZN9gDBBr
         zvmv1Mh+Y2+ZDxtta96pTjzmKbV8pDKK4hoIxVHO31AZFmOAYP0htE+C5wNGrZt1Udfu
         /VjcfZf7C9fr+V9V1d9FyxQJs9rAf5k81jwM03Krj7d0W9AsmVif5sUFEdxzkmdDyN/L
         9YCdPTQYdP+dnZKo4uIxjoyXjXLc7DIs+ISvjDUyb3365SGzalaggnelUHDGMqavxMQC
         STrzEXl6BRvNjtx0TWOBr0EHw9CZg6/L2Pfk2Jyqujaw8IvWoMjbpYB1h7vyVmXoZrIF
         UujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678471668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yDWH/Bafpq6Al4Qixgc7s1DXFTyThL0etvF5h9pL7lQ=;
        b=ovABTj8VGhm/OJhEFM8xXc3/PtHU12qhA3BIbFFX0smJWndJ3zr0WA4kivr22kBfE5
         obOK7MCqw2GblUAkdpAM2DJ1HoGs5MCD9587Heq3kDZX5r6Mv2hZsNStpfq89HlF/jF/
         KhQxi8ymVZSTjlTY8UDD5or3ZhS/1Jm/Yg/wIokCBmjNQ8zA9ZAlksj6moI/wsVD7iRH
         8q5P+8iz/4asTt9juRc07CwtoqqueVupyAH+9cLSYkuPjojfGP/8iLORKA9PTk0KRKmz
         fTZBbIQq2+vb6rs2PnteakuO8NijS5Ya8LfJe/8zP2Pi16KVXg4qmLi8xqVqltl2YvUw
         kc4A==
X-Gm-Message-State: AO0yUKV9u6HquYcF+Ck1jrTX9hh5smI14fP8VaynEoxdN+nZK6weHyQn
	iaD7s+a/yo4HtB+N6e/SYru638roceIBNw5CX58N862U8JrzAjKW0DM=
X-Google-Smtp-Source: AK7set8HQKUciAtKD6ti0HoI8lLeBrCAPYFvgFEuiUaYb3zpsolCQraHgI6fMinx04ogvg/awNtpdszwf/iUn3wkfVo=
X-Received: by 2002:a62:d041:0:b0:592:41a:1054 with SMTP id
 p62-20020a62d041000000b00592041a1054mr10923450pfg.5.1678471667819; Fri, 10
 Mar 2023 10:07:47 -0800 (PST)
MIME-Version: 1.0
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
 <20230310103123.2118519-10-alex.bennee@linaro.org> <CAFEAcA89K6_-Uc0XmEa1q+_z_yuppq1kvh=uPfv9V80MBH=aQg@mail.gmail.com>
 <87wn3ocwqz.fsf@suse.de>
In-Reply-To: <87wn3ocwqz.fsf@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Mar 2023 18:07:36 +0000
Message-ID: <CAFEAcA_bjTPO+68gV0V7436S2n=iJAoH3qXGw1v9-xhG2N0CLA@mail.gmail.com>
Subject: Re: [PATCH 09/11] tests/tcg: disable pauth for aarch64 gdb tests
To: Fabiano Rosas <farosas@suse.de>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
	Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Beraldo Leal <bleal@redhat.com>, Luis Machado <luis.machado@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 3t7bcZu0aQRl

On Fri, 10 Mar 2023 at 18:00, Fabiano Rosas <farosas@suse.de> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Fri, 10 Mar 2023 at 10:31, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
> >>
> >> You need a very new gdb to be able to run with pauth support otherwise
> >> your likely to hit asserts and aborts. Disable pauth for now until we
> >> can properly probe support in gdb.
> >>
> >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >
> > If it makes gdb fall over, then shouldn't we be disabling
> > the pauth gdbstub stuff entirely ? Otherwise even if our
> > tests are fine our users will not be...
> >
>
> Have you seem my message on IRC about changing the feature name in the
> XML? I think the issue is that we're putting the .xml in a "namespace"
> where GDB expects to only find stuff which it has code to
> support. Changing from "org.gnu.gdb.aarch64.pauth" to
> "org.qemu.aarch64.pauth" made it stop crashing and I can read the
> registers just fine.

But then presumably a pauth-aware GDB won't actually know
the values it needs to be able to convert between with-PAC
and without-PAC addresses for backtracing?

Luis, how is this intended to work? Is there some way the
stub can check with the gdb that's connected whether the
gdb is able to cope with the pauth XML, so it can avoid
sending it to a gdb that is going to crash if it sees it ?

thanks
-- PMM
