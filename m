Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp675743wru;
        Wed, 25 Jul 2018 06:03:42 -0700 (PDT)
X-Received: by 2002:a24:2c03:: with SMTP id i3-v6mr5968287iti.90.1532523822170;
        Wed, 25 Jul 2018 06:03:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532523822; cv=none;
        d=google.com; s=arc-20160816;
        b=fFf55BXwNNb98dOI2CjdfufiSN44p23uQ6E8RlouoixkGePbDYU4KOOIKdno/Qji4V
         CNXCsoq0QghMOLAIu4Up9noCWLUQrdbpKCJUwDSjN6Z4VvsZDliguWdMBi76bjl+iC4O
         N0C1B7vIlg+R/DT0qlOsWCm34qOHPf8rlPiyFqxXhy1yFr7ZTT1o5v90TeinWRU6a3wH
         qNmUVEAUl4Dpg4TYxtJPpsUpTP33QmacGBUy1tCnLEICaLiKrzdC8nqyQH/eLJW9N5yV
         tIW20XAw2aec86MlelQxy3RznjiGCzdJ8c/UbDUYCdbZalVR027UUythyOYL2jNxd3vu
         /WZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=is2/NnXeJLGaXmTEmZyjo8NBn7I+qsxBEmnST5wkxpA=;
        b=0tM4IUQEYUwzn5gYy1S7qAEaoruEAtFYvBlreahBIB3gAeuds1/Pc/8YC9cFXqKrRt
         upQo+z7PlwlNbD5cZJtUXyCJK/SKO9DzBF6DwSmQNSwijyVPZ17PMQMHZdIsOtdbtDbV
         mlf6YMlerNATbxVn64CZeMKV7fV7dgOJyIELcBGzHF57ifMAgmj1WOpYOqDy6AwnvyWj
         6jSmbHAhJhLalNLAtWbB2NJBJGAZV/0Sc1R3TnHgceyDdrUtRGwJYjJ9gGKoZALpJIZM
         Q3ORgrIeVSHvtBArP4dVhzfUVi6w9Op4M2CReZjudxE0WpPuFSBn73+VZMelEMh3HmV4
         CQZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jazOOxdU;
       spf=pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=ard.biesheuvel@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <ard.biesheuvel@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id z142-v6sor4508391ioe.192.2018.07.25.06.03.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 25 Jul 2018 06:03:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jazOOxdU;
       spf=pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=ard.biesheuvel@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=is2/NnXeJLGaXmTEmZyjo8NBn7I+qsxBEmnST5wkxpA=;
        b=jazOOxdU0r4i2ET2t5tBtlZoc2FKev4lzmQiL2fnovEOuulO+MniwtgUwOzJgbHLbB
         QMRaaMn65OYbBm9E/qmCzsZOzn/KLu+33OZuYnzpJZuZ7N+w0PcyeqvCdKc8c47E4y2c
         5Xi7jPN7Vz4A+MdSGy1Kn8uQFpeanjgxXVJoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=is2/NnXeJLGaXmTEmZyjo8NBn7I+qsxBEmnST5wkxpA=;
        b=gSVkunMnRycSLoJAtEg+ZLHEy22qPwLcWx88as4bDQyIkR0eYoByAaxPrS+niumbL5
         cSxHupW5aYzrIzsm7K5++e7SonLD/0CFVwKMSwAT4iSL1loI9mldnxp+IsoT/esH+mhj
         WHNV0mgIw9g6mkTf7WLxHL3QqwS7vA/GIjRWOZQZk9d/n6rC3vjJor14jRdOGkkrUoqn
         hd/nQ+yp4cJYWlyQnF8I/0LyKQdoyBeojWVKbIHYh6nRYlkcpc72cy2ubrTlKODQoWcd
         KCpGeizDu3tqLVkbqYZBZKdkq/HD6L+UPK9NxROcmtnQWmHfk5gIJJ2GOXkq63UCO1IS
         VLkw==
X-Gm-Message-State: AOUpUlHLi51zEWrA4aKIioqjY/9PpkJn64zW6W34DvZD5va/GPlnam25
	Kt8KmDUATfudzy13WyZohPfaTpT8SrEYkZK9Bs3JpACV
X-Google-Smtp-Source: AAOMgpfyd1zUuF+7siGe823x5YtbwEMSB8Szf7LYbHtXO8K3hGUd8XUjWs6c3gP7V8q1aHt0fL7P/F5zqfvRz4eSIAw=
X-Received: by 2002:a6b:5d1a:: with SMTP id r26-v6mr16296061iob.170.1532523821767;
 Wed, 25 Jul 2018 06:03:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:ac05:0:0:0:0:0 with HTTP; Wed, 25 Jul 2018 06:03:40
 -0700 (PDT)
In-Reply-To: <20180725125944.5nd5ydm4x4e3vvjw@kamzik.brq.redhat.com>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <20180725095426.f7kv4ftngeje6pkx@kamzik.brq.redhat.com> <CAHmQWvDu+P26Y5CJfcQ=1_9C=hej_B8w7dLMbmuOmCV-+pYOJQ@mail.gmail.com>
 <20180725114404.6g335n3rfjt23hjc@kamzik.brq.redhat.com> <CAFEAcA8wi2QV9cVg_Hp=8MYw_zfxvVciR2CbRZiGJNiQNPdHqg@mail.gmail.com>
 <20180725124700.GF12855@redhat.com> <20180725125944.5nd5ydm4x4e3vvjw@kamzik.brq.redhat.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Wed, 25 Jul 2018 15:03:40 +0200
Message-ID: <CAKv+Gu-pbJj59wH7wgZ6Uq+Uko9wYEBqSF=WaC3LL68CFkbxEw@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine type
To: Andrew Jones <drjones@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Peter Maydell <peter.maydell@linaro.org>, Hongbo Zhang <hongbo.zhang@linaro.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Leif Lindholm <leif.lindholm@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: FPpJ6RhzRnuX

On 25 July 2018 at 14:59, Andrew Jones <drjones@redhat.com> wrote:
> On Wed, Jul 25, 2018 at 01:47:00PM +0100, Daniel P. Berrang=C3=A9 wrote:
>> Would iut make any sense to call the machine  "refplatform"  or "refboar=
d"
>> to indicate it is a generic reference platform, not specifically followi=
ng
>> any particular real impl, albeit influence by the sbsa spec.
>>
>
> That would indeed stop me from whining about a machine model with an
> 'sbsa' name not strictly implementing a minimal SBSA machine :-)
>

I still don't get why only a minimal machine is worth considering,
given that a real-world minimal SBSA machine is not capable of doing
anything useful.
