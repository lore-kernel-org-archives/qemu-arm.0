Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp4973319ejd;
        Tue, 23 Apr 2024 05:20:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVc9oVwyiTHfyrx7qaBqi27FT5sJCDmMaL6mAip65VSbvUpRlzWTEhIxit+6qqtZwlg+5gqQXcoUa+sZIxJz+cX4zQyNO6w
X-Received: by 2002:a05:6512:3c9e:b0:51b:2bc9:f1ba with SMTP id h30-20020a0565123c9e00b0051b2bc9f1bamr5793418lfv.47.1713874832063;
        Tue, 23 Apr 2024 05:20:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713874832; cv=none;
        d=google.com; s=arc-20160816;
        b=OK7HqIv8jEakMbd1fy0XZwXeeKK9U+0azP+2qlSRhTVkcHhW+PRGmSeSYTbgvEzs4U
         c8aUah+FrZzJ3frzbvOLo4OdjvXfimkVqULNKOV+bTje5AWkuTrvFdqzUTpzPGn9y+t/
         c5Zx5AJ36J/8+OkwHFBdzyHAoBeX8tgTq5fUGS6PI7q3VKIjoi4pG4kAU3dfCTChaiG3
         a8Y3tntsvvJUBpgC94HmQ6jY77H1bhNiMablz6Pa1sNEQZJ4tN64V6wzto14+x38aH/l
         n6v6+iK2R4NlkUfhBPacAQtrWHPj6xJkMJytuR5Zcr01hppIVmGiVdbeerSe0Q/Z9wno
         YbtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gYMz7MjvN68OhLwjzExPLgLFmIo+u86IPAUUmgeTNj8=;
        fh=R42lQ2fT2CZYozvi/UisIuf2n4ZGXoxUs0w9JtG+mm8=;
        b=WwYwgIYfHD5tPgHCmENsWgJiuc0RESZ6HfPjTApI1ZUoSfWQda6BpzmO7dK68FCV3k
         m1U0GmIlc5qPcELSzLR0hyJ1/QAmYlfk7dPLwR5syb5QKS7gYvRmyc2RFTiGdnsJwgXw
         iXvXvyPM+zp48eHWZoRq1bIFPZ6aQakEV/z9epCvOy+9zfA7Bg28GId0mU2kY/KKtgF8
         5YdneCmiaYgCgiPLoQEirgZgmcYAmtadU32Dzp2GAvHS4DwSVFEb5kCDQPSXqGP/cDc9
         0BM7ct5ASyc2ZtriGtgG8G5ubQAYNKt9Uc7lxKmzAkiCvlLNA8v0dEsYaLeuMTiXXbhg
         aKbw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m+aXhupO;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c20-20020a50d654000000b0056e2ba5443esor2623302edj.1.2024.04.23.05.20.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 23 Apr 2024 05:20:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m+aXhupO;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713874831; x=1714479631; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gYMz7MjvN68OhLwjzExPLgLFmIo+u86IPAUUmgeTNj8=;
        b=m+aXhupObDf2xNWDVZ9MTY3Pz0KWdHztTPx/dsU45UzWmVYHVSG0o7Z2YAHDF5yp1e
         ujJZUTlSXtJU8eI31kMFmLUwYsZ9yu+zgrlWS+yW4B0rWrhRPOEcnF2m+enaoH0F9yiN
         d6sgh7asqgaKFVN96nexo7v5xYDS+NppYNX0Gu2DeVckC2b+vaNkYbosXExYel/LO3Xt
         Z87eImMW/vEWATyLEz67QMfYDgjvfW3vk7pbDxwkowwWDXF2P21vBWxpYBxxs9++6HkA
         9qw1TXa+KDF8O5FGVBkTplsfertrx+h7ctbyKsKvV9CJGAeOiQi3xT02c+XM3RdxJ3iH
         I+JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713874831; x=1714479631;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gYMz7MjvN68OhLwjzExPLgLFmIo+u86IPAUUmgeTNj8=;
        b=VP2VgKGcRg7d5tIGybYWTQ9c4E/hX/BKBjW55GH58Tddv9QqlFJZoMWnGX3h3EIIrr
         qAW9C+YZYZifCN3k3Yy6cecalOJIx+A511cGzqYFv80jxpknAezg9ft1/CQUpzJHwhGO
         bvUe7FtF8H7WjITYTYpM4s/lU4E9guXtoOhwQIwRtcQUdzRXB35XSBGkBn4xhw6U9mI6
         AVJY74I+UBv8v/3htmOUFDqAx2IE/xT3zHumWmKw657icCLS9XRS97U+GmMgleW7aPtW
         G81uGrNVboqMqjnY2dyS9uP1OP0A/kax0zbKZ9leekzdHXqaaUcjFmbGbepHFi1M3QMQ
         Qb1w==
X-Forwarded-Encrypted: i=1; AJvYcCWrwmFEhpVPYZpGGxtMoKUvZNEdIgQwEfcVPinLSdSYz9zmjVtgUnoET/0DyYfqN69gkQ2ajJUiOwVlDTo6Js/7Fd623skq
X-Gm-Message-State: AOJu0YwLFIIUIvksZLrYJpigXkUipuW7I7YVd7zKhE/ULZsBcy9Fsips
	I61hUj3znq2hyL2oPvN/vtGxPgxE9QEJWhdpZJEH7+INQm/vTQcrhp+fVTSst/HE/Ca35WVmfsn
	r2tiwBd8Ri3xKxS1mEIDYGXPFtuzkQl6b8RrJPncO
X-Google-Smtp-Source: AGHT+IEufC5CQcooFDS8qycrr/9+VHGzEu1NCuH8j9PxeX4emguu3mhQ1mjOuslnsJT6RT+XKfHg4eyQ4b1pVbigUjg=
X-Received: by 2002:a50:9fc1:0:b0:56b:d139:490 with SMTP id
 c59-20020a509fc1000000b0056bd1390490mr9622407edf.6.1713874831482; Tue, 23 Apr
 2024 05:20:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240419155709.318866-2-jean-philippe@linaro.org> <20240419155709.318866-16-jean-philippe@linaro.org>
In-Reply-To: <20240419155709.318866-16-jean-philippe@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Apr 2024 13:20:20 +0100
Message-ID: <CAFEAcA_0wi_Ujt5vjbcUFacNqxktmbF7Kma8uEw+pOUp==W0oA@mail.gmail.com>
Subject: Re: [PATCH v2 14/22] target/arm/kvm-rme: Add Realm Personalization
 Value parameter
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: richard.henderson@linaro.org, philmd@linaro.org, pbonzini@redhat.com, 
	alex.bennee@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
	=?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Eduardo Habkost <eduardo@habkost.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: FUaZ0IbdcM5H

On Fri, 19 Apr 2024 at 16:59, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> The Realm Personalization Value (RPV) is provided by the user to
> distinguish Realms that have the same initial measurement.
>
> The user provides up to 64 hexadecimal bytes. They are stored into the
> RPV in the same order, zero-padded on the right.
>
> Cc: Eric Blake <eblake@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Cc: Eduardo Habkost <eduardo@habkost.net>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
> v1->v2: Move parsing early, store as-is rather than reverted
> ---
>  qapi/qom.json        |  15 +++++-
>  target/arm/kvm-rme.c | 111 +++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 125 insertions(+), 1 deletion(-)
>
> diff --git a/qapi/qom.json b/qapi/qom.json
> index 623ec8071f..91654aa267 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -931,6 +931,18 @@
>    'data': { '*cpu-affinity': ['uint16'],
>              '*node-affinity': ['uint16'] } }
>
> +##
> +# @RmeGuestProperties:
> +#
> +# Properties for rme-guest objects.
> +#
> +# @personalization-value: Realm personalization value, as a 64-byte hex =
string
> +#     (default: 0)
> +#
> +# Since: FIXME
> +##
> +{ 'struct': 'RmeGuestProperties',
> +  'data': { '*personalization-value': 'str' } }
>
>  ##
>  # @ObjectType:
> @@ -1066,7 +1078,8 @@
>        'tls-creds-x509':             'TlsCredsX509Properties',
>        'tls-cipher-suites':          'TlsCredsProperties',
>        'x-remote-object':            'RemoteObjectProperties',
> -      'x-vfio-user-server':         'VfioUserServerProperties'
> +      'x-vfio-user-server':         'VfioUserServerProperties',
> +      'rme-guest':                  'RmeGuestProperties'
>    } }

This list is in alphabetical order. Are we obliged to add new
items to the end for some compatibility reason, or should this new
item be filed in its correct place with the other 'r's ?

thanks
-- PMM
