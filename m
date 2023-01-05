Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp244362ejb;
        Thu, 5 Jan 2023 03:51:53 -0800 (PST)
X-Received: by 2002:a05:6a00:84c:b0:581:1ee0:75a with SMTP id q12-20020a056a00084c00b005811ee0075amr44882033pfk.32.1672919513752;
        Thu, 05 Jan 2023 03:51:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672919513; cv=none;
        d=google.com; s=arc-20160816;
        b=tnL2bk42AAoWP4Aw9UavwhGY3JovJxcGgCauqJCZKFZPZY9oDtQvLWEkwWKWCPVEjJ
         WJzH3KYpAo5BmnT6cZqRzS/WQQxLy6oXDkRVbN0jHVyux+t43bwH7kDdyjArAYpkCfnN
         HPka2fVsH8ISfA0lUZ812hv9X2iT7bfpmpet9WI05a+vOGVulmwq5EctQWjbt/luTnI0
         7+/HvKj3uKJEetYLCxc/1ieN1wFUDmRR/VN4svKGKl/+TGLI/Rv61DlqzOBMN0Bs3HCb
         02p2QyAqlCK+U/jNOMDk59TX0zyCZ/YaITRUizuaZnSKaWxmW01n094ii/yAKMRRA5LG
         UynA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kENL7zooPtJIi9NIEvIqTLkqmG0cHOnsRINd6CTofig=;
        b=ZUg3mBBpSwpZCVrA8HrY7ObHhxQwUqT3nCKS4yoTvttcNQan9zSg1GwjzbthksmQKU
         sydh0PD3kICnmbJ9Fht/7RfVt9M/xUVd4OZ2REpmNvMbtk0/bbo+BHVSurvfQd02M4wD
         m26rKwiLdg65BtWwXahvtKbacRuTGf4QrmPutDYGkt8Gd0OJ+dmb//6Zh8ntWNFR0JhO
         RqrWE6eHTgZGNCB9t+jU+1mf4fD7n21/75o/VBZG3gfFur0Jfm7UimFX+SNASirIgQBh
         WS54dN9IkHrzCa9tFf3YO5FP7vUR7RON3ypLZ/ozDaAlfGqp+R81I68k0UQ+GMlnhAPn
         dORw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RkHXpkT6;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m123-20020a625881000000b0053b9ec925efsor15049840pfb.50.2023.01.05.03.51.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 05 Jan 2023 03:51:53 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RkHXpkT6;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kENL7zooPtJIi9NIEvIqTLkqmG0cHOnsRINd6CTofig=;
        b=RkHXpkT6M1X8ZY9qVZ4JVhOms43+E/7dypmYxBJS0t6QHfWazeN26s/Tvt3kUjpGiH
         sQcTo33DvK93dSZZEiQZzax7qKdx1vLzS0eGuAxHHhK0hoiROasdjQ7o69W+A5f7jI6O
         TWZoVLn4hI87hyJzCyUOjagNha7ZFfuLke7zMl7JMuz65HHlNxAmiYw+JdgltBdIxzid
         A2JLcksMfRXcouZAjg0cImovl2dFGL/Q9yN89N5AlxfnEXmzSi9am/b0yEiGxKb6gEnJ
         6jmYvsDOlW57+9Iqs906TEXEekOM6dN5+aEVFQ//jCO8uF+dpTsP5WC/00DGtqTEByE3
         4oPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kENL7zooPtJIi9NIEvIqTLkqmG0cHOnsRINd6CTofig=;
        b=3Z+ezY4WvmQ37zq910wVLdGj3mL3UwDBn9g1anrOTc8KlwoinUp2RLpevhwZngc3hI
         X9si1miTfSJYiqUFmdp5nlIV06dgg95jPByx2bcuT0o2qW+cnLSrgYH0/x61GzJZn061
         /E5hkW3ekO2ioWymAAbmSrDyN86DbiMOLmhRwoXdoGEFXnSITogLiIYLohduZfUjbFa/
         SdJoHqGHIV3qXnW/dymkYvWV9vdh9t3GhU+90H5Z5Gond5jG4S90BZF068RucNC9kP81
         1rN9x1zeqzx0ot3x6sQTp97+ktTNbMVG+wi6ZJA6WCcEjG2jvGdZ9SeyJWkPrSm2eU8g
         rdGQ==
X-Gm-Message-State: AFqh2kqXzSJgLirOODC4CWZ03ekZYJWzENmcC5j/Fc4gujMJSh5VcDoD
	daNOpdxjUMF+SMiyyIjhAYWcsokwNlCsVW1I3nN2S9xnFq0OLvys
X-Google-Smtp-Source: AMrXdXsbw16T7OID38zisWL29wwgq0gX7Z7LBa+Y4mGOna3DVTDUdetGwhZAGVA9iUdx8GkNI85kxJ745MOS6pBq7SM=
X-Received: by 2002:a63:3d4:0:b0:492:50dc:da4d with SMTP id
 203-20020a6303d4000000b0049250dcda4dmr2310726pgd.192.1672919513208; Thu, 05
 Jan 2023 03:51:53 -0800 (PST)
MIME-Version: 1.0
References: <20230105114304.2017493-1-alex.bennee@linaro.org>
In-Reply-To: <20230105114304.2017493-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Jan 2023 11:51:41 +0000
Message-ID: <CAFEAcA-iBM9qnkJ4hm3vmboyZY=+9ErWENwbi=zHZ1YJ9DNDFw@mail.gmail.com>
Subject: Re: [RFC PATCH] target/arm: fix handling of HLT semihosting in system mode
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	qemu-stable <qemu-stable@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: gd+6/7LKsdDI

On Thu, 5 Jan 2023 at 11:43, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> The check semihosting_enabled() wants to know if the guest is
> currently in user mode. Unlike the other cases the test was inverted
> causing us to block semihosting calls in non-EL0 modes.
>
> Fixes: 19b26317e9 (target/arm: Honour -semihosting-config userspace=3Don)
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Whoops. I guess I must have only tested SVC AA32 semihosting
or something. We should

Cc: qemu-stable@nongnu.org

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

and applied to target-arm.next.

-- PMM
