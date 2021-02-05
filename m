Received: by 2002:a0c:aac5:0:0:0:0:0 with SMTP id g5csp578743qvb;
        Fri, 5 Feb 2021 11:21:01 -0800 (PST)
X-Received: by 2002:a17:906:d8a1:: with SMTP id qc1mr5563059ejb.523.1612552861696;
        Fri, 05 Feb 2021 11:21:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612552861; cv=none;
        d=google.com; s=arc-20160816;
        b=tlPu8sQcHKgLdqCm7qXldrzS0NFalpmRc6FqUYQSK0dP2OuVh6NrUyKpGJKynEM+Dx
         utT3ozcqBwhRhfwfV4+yaQGqoM/VjQR/er12xkHOgFLm6YfY4KGa9Ni9yRXAk6OXHCaq
         y1krpp0taY4e0GxW4bBnNkZ84Su+kL+6u8vRk3LVOriB9NfXL6pBqM47gwMnrNiin74D
         eE7UmpPUAE4W8wJZXSGI2+beUj/tlR2Tf0r6wr6xlxbozoluJArrkcQwZF7ngBedrWne
         UJ9tR21jTfsDOYQqLH6YXATWVYi5JuI/EmQGxVZG3Ay9jWe6Pul7vQla3jFhN/5ixDPc
         9eXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bRRgxEAc7dTKtwvAAELeHVlGL4wN8nTZ2F46g97ej2Q=;
        b=g9oUo6eM0igDbRjgP7OL5WBQ0n14fOZ6enszhaKdPXvDrQkBxLITBL0GoLscSD2OTk
         wn5iOc/Vg3Df9zy7ToPuPUWCmHvtVNJEnaBePfH1y+yM+iKLmw8sI1Ze7D9U3O6PVm7m
         YxGK8i6PaFFoTZ2BF+1+CGWO3SKZJejTg6H97147N59bwRJWHQX/RnfXFt/mYtq5/G02
         Et9yirR1n3u4G0g4x1bdLm3a/xgy0T1N6fGTFB0bIbUiJUa64OOEVoaQ/u+9SslGzGSt
         r8u7BAfODq2Xwd499JkDtCJFC+g1X+spHl3Mcyo9hkRKk6D/8KYsZzy9BBL62hX07aQv
         mP9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KBEb4VZD;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d12sor1846421ejj.60.2021.02.05.11.21.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 05 Feb 2021 11:21:01 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KBEb4VZD;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bRRgxEAc7dTKtwvAAELeHVlGL4wN8nTZ2F46g97ej2Q=;
        b=KBEb4VZDcRrl9XI19d0na1hkjxCgwAOKRc6XUB/gO6q5VDvFZ3Kp+kJGMGEPp+dnGF
         D6QFQaEyuuLPQHMyzldlberVOhw2XvEvjKpdZxksEUuUKllTDaQB6HTwmGSi7C++IK49
         S9YowSCbUpAJDvEsCs2N7sE5QinMgXELgNLNofJOLUmSyzECJj5yyzjC1EP1AYrqZt4R
         0yphete09v8UbQYGkro0T4om5bmLj5Nk0ris0dfp+YYsrDSRqCHCFRegFi2r2CTsFczc
         /LsArqSDHthjvIPJVge4MEhLeV8dlj1suPlS7YwWh/OwyINYYhBCAhu2jqEcKUBtM3r3
         26Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bRRgxEAc7dTKtwvAAELeHVlGL4wN8nTZ2F46g97ej2Q=;
        b=UQyo5Lh7GwFH/zt1YFUUjPXGiCsKJGZoGC4kdHdmaCR2O+LwZ4CGr+Cz3UKkjUBGq1
         9gxvh3F2jQc/Qkd4JHUpO9mWB8eqJJpwPPz5uaBZ5t9LueVtVBUyZE7Ei75Aq9A0caFg
         seQRKUHXI3Gkq9/aR4zMjanfi9baifsBgbZTK9Sk1msEIG4HEGVlcIL5rRYWpTmTWhZ6
         HbGEknbPCphAf3a6nXy+5PIPhp7TCO0WeM5Ewfea1pnFvMEQsQOxcXVOT+ogQElBIpmO
         c8zbkEiPGK3UqBL+r8u4+ziE2dHstounPPK6LNVk1vtM061Bmdyxk8ZgWBglS3hG6fpS
         RKHA==
X-Gm-Message-State: AOAM531vwD+oWKgaojHyGy3whoHGS5OhsvZli3ZC9SbP+T7Swz72IesY
	ynGzqphwrCOFLmmLyiZX9y7++GsK6dvhaNd5KA9qNEHmJqZmkw==
X-Google-Smtp-Source: ABdhPJyVGF3zK3LlWC8E4wckoXQKWZOu3gBuRyp4m8rh56GyfxLsT5ZrveJRmJuGLb9QfoX3pJTReiPnUoMK4ucnRL8=
X-Received: by 2002:a05:6402:5107:: with SMTP id m7mr5059453edd.52.1612552861393;
 Fri, 05 Feb 2021 11:21:01 -0800 (PST)
MIME-Version: 1.0
References: <20210205170019.25319-1-peter.maydell@linaro.org> <7d4db6f0-1e11-afb1-2b58-2e115a0a2dd0@amsat.org>
In-Reply-To: <7d4db6f0-1e11-afb1-2b58-2e115a0a2dd0@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Feb 2021 19:20:50 +0000
Message-ID: <CAFEAcA_qZ-k7jZQ7NUxQ+BXQ5LtLC1ogorKaE1iwz2Mm00Xwcw@mail.gmail.com>
Subject: Re: [PATCH 00/24] hw/arm: New board model mps3-an524
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	"Daniel P . Berrange" <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: cObMvz44ln8d

On Fri, 5 Feb 2021 at 18:05, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
> On 2/5/21 5:59 PM, Peter Maydell wrote:
> > (The selftest is part of the AN524
> > download so it's behind a EULA click-through and we can't put it
> > into an acceptance test. We might be able to get something
> > based on Zephyr or Arm TFM.)
>
> Wondering about that... If anyone can go/click/accepts the EULA and
> download artifacts, then I'd like these tests to be committed to the
> repository, with a comment containing the download link, and the test
> can use the skipUntil(BLOB_PATH && BLOB_HASH) syntax to assert the
> binary I downloaded is the same you used for your test.

I would rather not get into that. The selftest doesn't actually
exercise as much of the emulation as you might think anyway.

-- PMM
