Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1201246lfc;
        Sun, 21 Feb 2021 11:34:03 -0800 (PST)
X-Received: by 2002:aa7:d816:: with SMTP id v22mr19422072edq.37.1613936042935;
        Sun, 21 Feb 2021 11:34:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613936042; cv=none;
        d=google.com; s=arc-20160816;
        b=QKGCZi+a6SKOZGFuGpEh2ziZ5UrJLRgz3vqJRQVpHJEM8RWue6xVNdUr23m/rxP7ti
         AW0N/uT+PDdpCkSj4Z+BS7vSoNc4SqeNPwDRYw0Tl15PyLdnycaNnUwr07AR19BG6czi
         9mN8Q3rzCaUP+/GlQcuap0GhH6LZVt3b4G/9VsWmn3ymsFbLt8ay8pOMW9tqIyJznl4L
         PRMZSRIPxRe5nPHys464B1+E16IXWPnBnzI61bzaN6+aAaRPAvjxJ59Zf9Aj1RUic/ph
         YPmkJ++MXoEq0z7wZLJW5Hy0K/J+84qWla4sHS/tN2wHt5no4mTtHpAb4aImb2Acrc7v
         mByg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zBEwbRQZqPnJXRYP2FP1goznLCE+yrtMu47gx1HCXa4=;
        b=C11c4Y1wJ9cdqOceM1hff49hn2BFiogt4Lq9IFD831cHkHcRqEt8dAQCNWfdDfkUsx
         G1wXfkZRi+1PBZC0MTdCif9Por/xIOV6UF/r8TWUdCbRSitafD3f/uMFgJakB55uPHEX
         UAywUy4gEJYAKk9+OgT0AIp0BwGPzjdVY7ATU/L14TVSXyQ5JcG3nbYbx2y8YKmR5vvt
         Uajw5TD5AnCufrQgq4+tECANQQxbKOJIvW5nLBY3jA3rCRP9RGyrpKdJR6zrAeeitw67
         Su1nmFSrdWtz9bSdweHDo3eURIhd5w4uTzUJsSwZjmfnXtENyWzp7PtOk/aElWQhebR8
         bXPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="J/2OUPci";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id qt10sor6711822ejb.46.2021.02.21.11.34.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 21 Feb 2021 11:34:02 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="J/2OUPci";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zBEwbRQZqPnJXRYP2FP1goznLCE+yrtMu47gx1HCXa4=;
        b=J/2OUPcihfNJ4FCDRe8Qigzz5UuX9PqUmQOg1A15JFALO0iihdrRjdaIfHpTjonkk+
         3adVsLFrZCZSMo6g0hhDh4tIXRWIXgMWn/Hz5hE8KYLX6of3ZM1RcbAJl5f3ippktWkG
         hf7ZLAkZkKFt5iWkFzdp0eUi5qnoiDRNPc10VhMqsTf8rLi+QHNNfbygPgXjWaW7lNro
         /QCQ/x7vWrsDOV5LL6DcU55ApQEuPzM+VtYiVYUALOtzLLCCl44M6hgHOzYzN0SCn5H6
         jvmk1SALCMNgjOGkTv5+IaGnxhuZHkhikNC9El8JUW4Bw/NJFCaArcIaAWkvUtL3EFd9
         8vuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zBEwbRQZqPnJXRYP2FP1goznLCE+yrtMu47gx1HCXa4=;
        b=H6EIvs9SvbH2xXjETM6K00MywCN7nuxAYXPFpVQr6SNIfvXFcOvCXQyAxBnvMzy6tP
         AgP/T7z9eGfPUTBjwItcXrU4B6fLOTWQ5cjvDv/c3U2Hyub9FNuYg6T2zHbcRFXOZJI1
         CrK1q3bRIcV8xJx8Vo0ZPT0b+UrDObdTLQCoEUFBI4qDvG96bjY/6s3i2JxXULQAN8W9
         eyqAwOsNRrd2YycSMJFpUezoU4yVmNw9/iEMMMQj5e2o/xQxn3n5qGidT6DFG35mCKMU
         6DguLR3FNSmRc3bRK3ADM6fclF9GlKJwfAUSoUVh8OIoBAbslHpq69v+eQy9ozIwFBFY
         5NSw==
X-Gm-Message-State: AOAM530cYTAeqASqRDavtXUOifyT0Q7yK65Id1DcyJhI3ur119uvFBqT
	gtdbW8eR5HvIOs/ukKF/uidLR8b4jCNv4Dm59qJm1obD
X-Google-Smtp-Source: ABdhPJx0nusow2zAbE1Do+Uf9EJH8RTbfH97UWPpv3QAaeNvvJY6aLBYiFFVy9aVJ+o0uFXHcx4bzNnz4R9i8VHaWOo=
X-Received: by 2002:a17:906:66cc:: with SMTP id k12mr1658746ejp.382.1613936042667;
 Sun, 21 Feb 2021 11:34:02 -0800 (PST)
MIME-Version: 1.0
References: <cef2f119-3612-65a0-d828-b480179dc3a9@amsat.org>
In-Reply-To: <cef2f119-3612-65a0-d828-b480179dc3a9@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 21 Feb 2021 19:33:51 +0000
Message-ID: <CAFEAcA-yLQNLVUPZPRnTTNupkUrgcTRHVR=SW1Yb6KEUeQjkoQ@mail.gmail.com>
Subject: Re: tests: n810 arm failing
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Thomas Huth <thuth@redhat.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-devel <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: v4/vgYQuPezP

On Sun, 21 Feb 2021 at 17:26, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Hi,
>
> The n810 arm test failed on latest master:
>
> https://gitlab.com/qemu-project/qemu/-/jobs/1045015424/artifacts/browse/b=
uild/tests/results/latest/test-results/26-tests_acceptance_machine_arm_n8x0=
.py_N8x0Machine.test_n810/

It passed on the gitlab CI run on the exact same commit hash
as 'staging' before I pushed the merge, though...

-- PMM
