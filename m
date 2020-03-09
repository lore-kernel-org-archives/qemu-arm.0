Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1025793lfc;
        Mon, 9 Mar 2020 04:22:08 -0700 (PDT)
X-Received: by 2002:aca:1217:: with SMTP id 23mr6888137ois.73.1583752927986;
        Mon, 09 Mar 2020 04:22:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583752927; cv=none;
        d=google.com; s=arc-20160816;
        b=GyXUZTzq5pg+dhpLyB8FaqydqvqnV6hfDqXo+yC3gAL+YscAoNwneY87YbZkRGGblb
         +IVbQ0T5pXLVlgdLkzIXccW4Ey2rn7NpV69oq72nLraCEj+3D7lqQss36c86DWJehmKd
         c4LhdUWArNG4dRFi2PHlNq1ZkWIKa4KTLw2Qb2JzKlOqK14bBlptklOfgl69u81OguMK
         XQJU3vfsIW2f3Iy8Vrr4kwTdURDeDgiUnVHTKWlHmXhDq/Bx+oP+JRYY2u7DU0HVQ9lm
         sGyKeHJ0qT7LSupirUk9VrIxslsQPEsglYYE42x+zZ1yyqV+SnqjuNF0yIey3z8UOvHt
         NnJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pOq5RnEKPS98y3EO2VedHaP73ZUs54LPZ/GTSOLQznI=;
        b=ZR+Uf58FiH7a1QzRvhK4hLAgPCqKOyBjdWYcG0A8ajLxTkX4j3877J4USelTfnONkn
         Xvnn52H8H5kQMItw6xZYEWkzKX7YzY+YDn4eWzgwBTtNTjGHlNmoNhJeCE0HVFSQdiJg
         StFtewXZzDQcihLRPi1nxSzHWwMiPPA3m3f4amYB4T25gjDxnQOolo514Dk127ji5VmO
         Uw6gN0x21RqjCnv1phhoggV/Jsvd+cD8Hh2XO3QN2onkRU6DBqoBYIvMUoYY6Q730t9f
         j0AdmTPqwS/YweC/hSSsEUF3gSUuSuK5qopJkwupQTJH5MUMgoePpknfzRO5ArYanRuK
         4dbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BPFzIMMy;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id l20sor3330688otq.68.2020.03.09.04.22.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 09 Mar 2020 04:22:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BPFzIMMy;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=pOq5RnEKPS98y3EO2VedHaP73ZUs54LPZ/GTSOLQznI=;
        b=BPFzIMMyl6zSZ6JkANnmVsjjykfUlWd20NWVB9+72w/Zvg9SIq8uQ2uvNOhRWLYIvs
         WptO+qaLW51BHsuAIMFury8EdXuhunJzFC+gviEcE2ysqPLA8T7bbA30C88IHPAyFFmV
         nvgoR8gQ6M7bjnNaKL8b1a41SASUNQw7tLVlHO+J/cKvFKjl236kKAmAD2pkqQpr9x1Y
         gB9IYpxYndwIpQUzX0XzLdp/gELGRJLJYkc8tQLNRW/u/+bkW+/p7z87fPTU1D2T7XJa
         MrJH2BMiJkYD4mqBvnggfwI3O7YoENN6eRzqJO8V4W01mnUCgxJmfkL6i3KPDKjDs5tH
         VVfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=pOq5RnEKPS98y3EO2VedHaP73ZUs54LPZ/GTSOLQznI=;
        b=ji7Vjo4gT9eVq4MIP12XMHL5kwDeRWq9D1B5rpMm4s3I0Zlo/HK9HaK3H9pu3ip5xx
         6mi/WaMUv8pL0FdJPf0ieZNpa/qI3B0dcloFjmSf7bOMN2RLrXYuYaWcsTdirxiIlIYv
         5dsNvcBPo4Wyhyb/UU8a+ja5b0PxNHFi9qi9Ld9samJPSwQ9TNCXJsIC8nOtsh2ysAEe
         CjN1gOhE8poyuyP08Vj0OlJl6zpzZHdTRTkCBx78P4aSOR55RS0VKSYwADW2k85o3mr2
         OcE76ZkFFHwgLU1gLITCWSZno3Tt5q14/8c2UA/gDcisSbaHM9qqb5W1fZMVuhiSKf6k
         6Leg==
X-Gm-Message-State: ANhLgQ2hwklvGxhj3oBClsUO7keib34DMYDIFRNBBDdQxHdHelZzMf/z
	PMonCjbTjkKE9IYBmuVJP0XoA5o3dvLQA+D++xzGowD2
X-Google-Smtp-Source: ADFU+vtGxC43jQXbkrSNvVXi+IQQwcCxTNAv1HFc9fqXbwVbQNfIdMB7omjfuCGa4ksDoYZ7OFKkQbXpfsVADIFX9Ds=
X-Received: by 2002:a05:6830:19e2:: with SMTP id t2mr5130301ott.97.1583752927505;
 Mon, 09 Mar 2020 04:22:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200301215029.15196-1-nieklinnenbank@gmail.com>
 <20200301215029.15196-19-nieklinnenbank@gmail.com> <871rq876h3.fsf@linaro.org>
 <CAPan3WrNnrnngwE4pGeYpR9HS7Vr936-ojPZZovNo8ZdoAA0sg@mail.gmail.com>
In-Reply-To: <CAPan3WrNnrnngwE4pGeYpR9HS7Vr936-ojPZZovNo8ZdoAA0sg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Mar 2020 11:21:56 +0000
Message-ID: <CAFEAcA_6Lm-JwbXFLWeetc7+fhnrc5m2+YU28ymFw0MSoKOhwg@mail.gmail.com>
Subject: Re: [PATCH v6 18/18] docs: add Orange Pi PC document
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	Beniamino Galvani <b.galvani@gmail.com>, Jason Wang <jasowang@redhat.com>, 
	Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: utOWMQH4U1cI

On Wed, 4 Mar 2020 at 20:55, Niek Linnenbank <nieklinnenbank@gmail.com> wro=
te:
>
> Hello Alex,
>
> On Wed, Mar 4, 2020 at 11:35 AM Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
>>
>>
>> Niek Linnenbank <nieklinnenbank@gmail.com> writes:
>> > ---
>> >  docs/orangepi.rst | 226
>> > ++++++++++++++++++++++++++++++++++++++++++++++
>>
>> I suspect there is a better place to put this is than the top level. I
>> wonder if it should be docs/specs?
>
>
> Yeah I'm fine to move it to a different subdirectory if needed. Right now=
 its placed in docs,
> as it seems that documents for machines are also placed there, for exampl=
e docs/microvm.rst

The only things in the top level docs/ are a handful of
legacy-ish files that went there because we didn't yet have
a better place to put them. We should avoid increasing the
number of orphan files in the top level (and indeed should
try to move the existing orphans elsewhere).

>> When Peter's document PR goes in later this week there will also be a:
>>
>>   docs/system/target-arm.rst
>>
>> which would benefit from a section for the Orange Pi in it.

Yes, this is now the right place to put arm board-specific
documentation (the rearranging and conversion from texinfo
is now in master). I should move microvm.rst's contents there
I guess.

thanks
-- PMM
