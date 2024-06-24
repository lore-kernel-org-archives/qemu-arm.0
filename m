Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp429301njc;
        Mon, 24 Jun 2024 06:31:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU/vmBnS7MCZ+EeFcmUfUlpiOKjwoxDvRamnv38P+TzIbuQ5RJqf2bCAYXqDv3gOVuS/OZNYkifRueqTDSTG6ib08v1YB4Z
X-Google-Smtp-Source: AGHT+IFFfHbcAddUCjSA6aO0yD7QqWT384Ri3IZ9LFEAuEuAWJYvIPijenEVQhC2BxxbLPCSDHdP
X-Received: by 2002:a05:622a:1487:b0:440:480a:8b69 with SMTP id d75a77b69052e-444d9218c13mr43800691cf.28.1719235892806;
        Mon, 24 Jun 2024 06:31:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719235892; cv=none;
        d=google.com; s=arc-20160816;
        b=kDs7C93V8wRMAe0r9QDs7hzjsooZ0MbXhedQ3zRWbXXzCeiFAbcx/j6imYHgSETrtA
         7BhHyJoQPQIOBW6mGpzQvBndtQeiWw5Q49cF6av88bsZ891O2TK520qBIJn9o9MmQpB9
         8IOJt3fi/kc54PWY+cPLK4uioM5K6IotioZ/JknyfZyvp+z0wBjOs6V0igHMj8g1I6Zc
         TFXcL1Ek873HNqbAEJI+ItKAz/tKRpIZGx11DP8qhZEeRLiBIW5PXp4NfjDXqNbxp6yb
         ca1XE4LsCkNwVy03igQzjI8JTveQmogHDn6IyNqLbus1BjFMOTqzLHLFlCqaWwYpfO83
         Idvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=QW3RvusqWOMaRnIRBchybfSTW6PaZ83JR7WIKVAo8WE=;
        fh=QEw3TrYyd+HC9wOMIIqf5uThqx8R96PNtQ3tWD/r2qU=;
        b=gNU9rM69toja4oDCEvlDKZ0G/FxIph5QNmcnpJBx+2XQWJO7xWo6oJtUVEgfvjZjYC
         A1mZ5leIHuxzWpQjcDotPY1Ale7Urrj92uqi6bxra3OB1Nx+NYM7IKmbHnEd9n6aRCL9
         NHZu+xkFnob/j5AspuyM+13FVFNfl3ubrJu++dXQtSyUZ8AUzXWp6fhPdox1/KbB5482
         5ldVuBYWmPmTHLBKqdRf1EzxU7VJhwd/LnDXeD9lTwHORHdflTEC/T6nA8ASlfICvuo3
         lYEGCxyKB8Axn/GAVXe+NUcdFDkYqNxyp7fDe2WofufSKpZkyuQjh74BtdxPcUODLPgj
         Ttug==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kbnz74XB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-444c2c389d4si80173931cf.463.2024.06.24.06.31.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Jun 2024 06:31:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kbnz74XB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sLjn5-0005f2-MD; Mon, 24 Jun 2024 09:31:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sLjn2-0005e0-W8
 for qemu-arm@nongnu.org; Mon, 24 Jun 2024 09:31:26 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sLjn1-0000x1-6M
 for qemu-arm@nongnu.org; Mon, 24 Jun 2024 09:31:24 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-57d07f07a27so4707518a12.3
 for <qemu-arm@nongnu.org>; Mon, 24 Jun 2024 06:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719235881; x=1719840681; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QW3RvusqWOMaRnIRBchybfSTW6PaZ83JR7WIKVAo8WE=;
 b=kbnz74XBYoJftQK5SGQqC5HCSulXDLKWqJIMfPAvJNf8BisxYOVa2M8OgWbzSkfEBk
 iMSc7qrsWftkWP3mD1Q4HL8ToatkiWu9WAtW52h+Q0drJnmzkJzkW8ZEc2HZABkJ665K
 gGW204SP/OqWeC/m6gcVWTCQ6cJSzbyYvnc6/33aYeo5HTT/RNpvixaW/XHXwvW7amLU
 i6jJVfmT4RlZLWOb5cUr3Il5U/pm7M5WRQUkjETzcFUGJKS+SviAnICy4TTxl04Nmqs8
 tKIbKaPzq7YZDxY7Ob1RGQNQhFTTRTxDkylSElH4GpAZqSoD+0LC2Z7VtuGKPWw0VSnc
 MuTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719235881; x=1719840681;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QW3RvusqWOMaRnIRBchybfSTW6PaZ83JR7WIKVAo8WE=;
 b=R4sScWwGzR2/fS7xhseEmkBTL3Li92chnLcZn84pPy6NkYWeCFXzu1DWnuPe/gMpgG
 Jyl7RD20m0a0Tfzmc92AV6IM2C4l+5SuwxOuuCTUBvJVqzinSjiVDenNMivGKyQMwQNA
 NIe0vcAhAJGAZK7Ju/Kz836O5Iz5lB7EslnVzz2ttD67OeECyVVD4pL8fKNtd/p2rUDw
 nzaEF5c+n0pP8TQbEIQjkNmdNMkRKjkKBBl0bBD4hwv9jetHEHjhVdA4jiWZwaPxF6yP
 CNKOUUbSfnOX4aBRl59ErMoIkSiiu7NIZbYrF+dh+e/nQhcTJflOSnLGwHOLpAU4c8l/
 I0Dg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX413bpKFqL5oYwUa+cWyXNhCC/IAY61R2qCz0vhiob42RM99KfCV3VOINV1I/JT62prllAYd/7dhkQS0/F62UAH3FI
X-Gm-Message-State: AOJu0YyugVo+Wq/hY/QJNlQwWRcSVTOeK9YPET7tK0VWMBJaPew8VUbX
 XBDSUaNPtdHRjznPpy/dUoC7Io/dar8vuhtP1XkbJisMGec12VoqOXvXLhIOR/QOEKO5d8KwZEw
 WT4YBy5QZGNW55i2IYu1gcHQ3l5os/mP7mB/Zodf1nD+zapK+
X-Received: by 2002:a50:8e5c:0:b0:57d:3691:baf9 with SMTP id
 4fb4d7f45d1cf-57d4bd8151bmr2585313a12.22.1719235880992; Mon, 24 Jun 2024
 06:31:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240620-b4-new-firmware-v3-0-29a3a2f1be1e@linaro.org>
In-Reply-To: <20240620-b4-new-firmware-v3-0-29a3a2f1be1e@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Jun 2024 14:31:10 +0100
Message-ID: <CAFEAcA-axo2kObbc_D4U2VvwrQJz+HDPnnSOGt9zmT5VU8e2TA@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] tests/avocado: make sbsa-ref working with >1 core
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, 
 Ard Biesheuvel <ardb+tianocore@kernel.org>, Rebecca Cran <rebecca@bsdio.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: iph3TcHtuKP2

On Thu, 20 Jun 2024 at 11:19, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
>
> Recent changes made sbsa-ref crash when more than 1 cpu core was used.
> We handle it in firmware now so one patch updates it to the working
> snapshot (TF-A 2.11 + EDK2 snapshot + EDK2-platforms snapshot).
>
> Other change drops "-smp 1" from CI to make sure we test default setup
> of sbsa-ref.
>
> Previous firmware worked with 1 cpu by pure luck probably.
>
> To: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org,
> Cc: Peter Maydell <peter.maydell@linaro.org>,
> Cc: Leif Lindholm <quic_llindhol@quicinc.com>,
> Cc: Radoslaw Biernacki <rad@semihalf.com>,
> Cc: Cleber Rosa <crosa@redhat.com>,
> Cc: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
> Cc: Beraldo Leal <bleal@redhat.com>,
> Cc: Ard Biesheuvel <ardb+tianocore@kernel.org>
> Cc: Rebecca Cran <rebecca@bsdio.com>
>
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---



Applied to target-arm.next, thanks.

-- PMM
