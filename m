Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp910188lfp;
        Fri, 31 Jan 2020 09:36:55 -0800 (PST)
X-Received: by 2002:a9d:68da:: with SMTP id i26mr8647792oto.65.1580492215592;
        Fri, 31 Jan 2020 09:36:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580492215; cv=none;
        d=google.com; s=arc-20160816;
        b=CfcIq09IlJr0rYEP4ZsTzNIhHHLvJQTFGLser6Z/YvShWqXW7tsaAlDKb22nQmF4sQ
         2E3bnfDZqzK2NUbudhvEr4wmO84iYDgvFFivEXYQb4FIFOpIqT6dO8+euxKviDUPSQzf
         Q9ZGBxkqRbzHApHTroCcL+Z4fLaMBfqLDTvgWJ1GhyB/KSuFqJUAH5QsjwHHlQz0SX4w
         wFmhB+JhHHlpd5qpv5LH+vu2XlqITPk7QqVciQSyg/f8gdEYQ15KALFo0gk3q1Y2wE5J
         CthEUHRuGLuErhLE74OAbSpJQY+bTVCec86hfxuJZEkHM7GbfD5DGrQuXV6RzQQ4GWQL
         l/pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MwQf5wKkqC3KOw72XmYMlxq7E2cPK4kiOzIVY+cdHzw=;
        b=coBqVvdSfkgWAXKE4RYv5B4O0V8hNCvX1WfiGl8QiXMpz1sfs/eRVavMjq/dErzhwi
         uUCSEmkW7S6GpOpwox3Vvdovszez7SQr9t9Cnwj42vvICD8esPxjIIO7QBjQoYckRd1B
         JAQugSe53MoHEGyfR5JpJWsdFOOROf9JWTu8pKjTYRgMcavkmdI943FRDVvoX16cplv2
         JjxQZmy2GpOuwkJhYIgnr/FreYyF5nlgGqDH6wOtDMgvLzsN4sS0Je8ejzcCNpglHjAS
         gwDe8xf8bM5rMqkQ1MUDovNY1Bnikh6BDauLypLLf9IKh9FySgGc0DN1Sn2Itgkm6K6i
         hCaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CEIyvjN+;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id t17sor4938375otp.86.2020.01.31.09.36.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 31 Jan 2020 09:36:55 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CEIyvjN+;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MwQf5wKkqC3KOw72XmYMlxq7E2cPK4kiOzIVY+cdHzw=;
        b=CEIyvjN+UEAPsXxwBS3yFt/laAeUK4sbYeeUvDFmSgLExP4Lmr1tA4o48bEZ5QriWZ
         Ni5CsntzAMvOJmptTeQ0761PFw+407EGaoeiFsrsIBgBxt50Fuxljb0RMrIPSwD0foE+
         qXOIpY7lbtwu2jT8SYndsVmsu2zkbY0rNwThYQBZFSZvoH/LQyLGQPZLkZccgcNXbqvm
         95PPLo+Mo7qs8ckj8Rx5369G+4JIm8Q1bvG5fw4EYFdoXeFk+sYXMr7OjkPO69tmpniv
         oKVe4nYbnPRhbOr7tjyuePZjvkLQlHL7dQkojszXXdw3/K7cGJXGeZ2EAphynCSMRn1p
         fKIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MwQf5wKkqC3KOw72XmYMlxq7E2cPK4kiOzIVY+cdHzw=;
        b=Mzce/0Njx6DUAh7B+w6UCsskPiTCWbalRMx1ZlzapvR8Vj+OuNfnrZpr3QcX9NS8ph
         Ane6xNe9K4kj6J9PFkQzejWTQemvDAhV/qemV9bWxM3JjSN3EY2TldyCHJSsU1lWyfJj
         nFi9ZVYyx+cRcqsi+NUvOpmWFZZqFeWSRlxHfsPe1KV5/rptx9aX9SyE/Zvun+0JCWdi
         8WMuKy1qNfNwAP/CmonJ1HCmyB9VqXJ3VFYZSHZ/76ZLqwvS3BKnoRAMpL0LGu7DdJuk
         f8PP2HBwGlvFThVyT1u+3F8OWmhd3bXzUVv3Cibv67tATUgqQ5OBgYGPJaz5Wvcx4HEr
         WCHA==
X-Gm-Message-State: APjAAAXQ0qJ0DRgosor3QrbVXKdsZLw7RyTMz2wirMiLLdxr/TCDMwYz
	ZCXsqUBU9+9rfoFIb7uWkUGfyTPgS48tAAYHbQR9M6+M
X-Google-Smtp-Source: APXvYqzH8zJ5o4thc7JBUmbJZcxzhmAT5AWeP4jPytYUoqO1FmoQvkhMSRfFzFvpk2/wDnaU/akRvoSoh4bt/0ad79M=
X-Received: by 2002:a05:6830:4a4:: with SMTP id l4mr8446213otd.91.1580492215139;
 Fri, 31 Jan 2020 09:36:55 -0800 (PST)
MIME-Version: 1.0
References: <20200131153439.26027-1-alex.bennee@linaro.org> <86de4318-8937-c228-973e-f88b41248d03@redhat.com>
In-Reply-To: <86de4318-8937-c228-973e-f88b41248d03@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 31 Jan 2020 17:36:44 +0000
Message-ID: <CAFEAcA8KAuKfb07xf=zs6bY-T2zQzRbifW5wdg1kEcBb+zPGGw@mail.gmail.com>
Subject: Re: [PATCH] target/arm: fix TCG leak for fcvt half->double
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: sKa/rMHjR3WQ

On Fri, 31 Jan 2020 at 16:50, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> On 1/31/20 4:34 PM, Alex Benn=C3=A9e wrote:
> > When support for the AHP flag was added we inexplicably only freed the
> > new temps in one of the two legs. Move those tcg_temp_free to the same
> > level as the allocation to fix that leak.
>
> Probably too much code refactoring :/
>
> >
> > Fixes: 486624fcd3eac
>
> Maybe:
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
>
> > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Thanks; applied to master as that will let me apply the
tracing pullreq without having to suppress or ignore the
warning.

-- PMM
