Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp372168ejq;
        Thu, 18 May 2023 03:11:01 -0700 (PDT)
X-Received: by 2002:aa7:d685:0:b0:50b:c4f0:c200 with SMTP id d5-20020aa7d685000000b0050bc4f0c200mr3820219edr.41.1684404661284;
        Thu, 18 May 2023 03:11:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684404661; cv=none;
        d=google.com; s=arc-20160816;
        b=bqa8YymfyQsdQw1ktaA04oDrUuvcog8H0W/WzX+uHuIXvjjN0CJbgOQ1nXxKf7vVgc
         XFwHRuLmD91M0h9Zvqndf2UAIC+k90kt+iVoqH5/P73kFdXZvPUDoI5Fk4ttFk+XNaIa
         XQ3sUaUKYDkjWpP59/RWMYzGvjH09kFnQb0RicNRGCwooFT3D2yyjDNWsPrMcmqnnKg4
         Wf/lSVMTmBShpD02tUQLgOyijVRiktQxiA0AvCKcx3NZ2Tedxi4tr5e3Vc05idPEnrtG
         PVsoHxMM1onTycyArGbs1YWm63gE3jSy0Ghsv7UHXN49DeoDC9u4C1kqI7nleZhzu2yV
         ki/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vScuOnyVFxi8AXSnCF0Ztm0U6LugS58i6f/I6I8ifvk=;
        b=WdSLeOK6efCx5WFvjGMrpKCrAJWNzcFCnLHNI+aC8fRzA3caOya5NuSUu7JSg0rSPf
         uC/k76vV+fM99PKIfrRXaij4n3sSo8a4ZhmVKsEisp3r02m7eWWj12Oax3YAZouubGpu
         480aWSEUbRwkWD9P80jkRPR1H4cLhjufPzV+QGHF36NcbXjdYuuXNRQ048IkJXK2fIbW
         Imo2E+cpLUoYkO3pv9PWykBPO7zzXBvVHj99Zzo8BC8gZHQx3n0WxmV4/a2Jh8M36AFN
         48/b7AAIFEO0s0OhPrekru3KqZ4pNCoiNi1NqAl6G/PXRKmBgl68lbVSkSZtOFaio/zi
         NuXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v95m79OP;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s19-20020a508d13000000b00504716eccd1sor476352eds.8.2023.05.18.03.11.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 18 May 2023 03:11:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v95m79OP;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684404661; x=1686996661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vScuOnyVFxi8AXSnCF0Ztm0U6LugS58i6f/I6I8ifvk=;
        b=v95m79OPCOCWNj3YX2w0P5pGLV0AfXrCXJfipoqaTBkxMLJdXoO6DxztxeO7QOx7YT
         8VttwF07ZWR/CyXO+1lA3lVQB3QHthXeQUP/3ROZLjwOPWN+XTUCvXwq9u5BIfJTeEGD
         WkTBV5LkBKo9GxjOAehaGhFz3T+73iggXXLy4ZqLlizMNVuWRKrMMX5FdWSBpc/2hVEL
         ybGm0cERo55w6LMXYV2AXbm8dSESjWw7+/0lzzfo9GMfSxLB0/4P8vDVXPTLB9UGWbRr
         cz3w1isi/LCjDNkjEGkgTCPHWhQm3F7xRbuTsMx2YPCpcw6Vi3gl2SXVbF/kJw8lxO4K
         P+Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684404661; x=1686996661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vScuOnyVFxi8AXSnCF0Ztm0U6LugS58i6f/I6I8ifvk=;
        b=gQQuvfMz/nXkDRMoDjPWBal8G7wm6e3VCDUli4GLEn8BPrujifp+2TSEF9kRHDfXv7
         Mpo92X0rJePhMmQJXuuvW+vSjcmT692B3lZuR4LO2a1WTPCLZGqq0d6KN3wRkORqXgE/
         98Qewzj7fbdV4rsjbZ+uE8IoZteKQMhRaxrM5E4o7BM//4fxuURZEPddQZC/26ZkKpp0
         NExhG0t0oly/bsv4/ObuM3ILp5DXdGnlBSIiQ9jlhKdZv4wgWSm0Ecj5wnCG8/bEyhC3
         DXr/6g+ipHvensLcOpW8ajFCZfbS3CrwGa39cNGD5AsbSQ66HK4XCzGUveR1UmMXqB2O
         xobg==
X-Gm-Message-State: AC+VfDy2wc2ydz+7XdYdVTkaud//XlOA5ZVTikVN+9w5wMxbFKaCEs8R
	6i9RJJowYlYWl/+ZD4nw0NEeSYuz6276ogLkQxVjiXU9nz6eEbNne+s=
X-Google-Smtp-Source: ACHHUZ5plqNHL1Po/U+akHPLRwFBJvc3nWrKp+aNSO7DiCv4vSI99peBowY4iMoQHkZwKCRYpey3C1GQEcuilKiv2xU=
X-Received: by 2002:a50:eb0c:0:b0:50b:c1d6:8d60 with SMTP id
 y12-20020a50eb0c000000b0050bc1d68d60mr4912561edp.21.1684404660879; Thu, 18
 May 2023 03:11:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230516104420.407912-1-alex.bennee@linaro.org>
In-Reply-To: <20230516104420.407912-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 May 2023 11:10:50 +0100
Message-ID: <CAFEAcA8fu-+YUeuhVw8mpgYXO=ueXrCecC-LkhFwoubUkMvg4Q@mail.gmail.com>
Subject: Re: [RFC PATCH] target/arm: add RAZ/WI handling for DBGDTR[TX|RX]
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	Anders Roxell <anders.roxell@linaro.org>, Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 0NoyjSOip7R9

On Tue, 16 May 2023 at 11:44, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The commit b3aa2f2128 (target/arm: provide stubs for more external
> debug registers) was added to handle HyperV's unconditional usage of
> Debug Communications Channel. It turns out that Linux will similarly
> break if you enable CONFIG_HVC_DCC "ARM JTAG DCC console".
>
> Extend the registers we RAZ/WI set to avoid this.

Applied to target-arm.next, thanks.

(In theory we could implement the DCC and wire it up to a
chardev, which might be a cute way of getting early debug.)

-- PMM
