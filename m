Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp488901ejb;
        Mon, 13 Mar 2023 10:09:29 -0700 (PDT)
X-Received: by 2002:a17:903:41c3:b0:19e:699e:9b64 with SMTP id u3-20020a17090341c300b0019e699e9b64mr44409263ple.65.1678727368932;
        Mon, 13 Mar 2023 10:09:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678727368; cv=none;
        d=google.com; s=arc-20160816;
        b=M9cnzI0nMB58WooEhWdaFc+o1/jRi8jbsQ5yabrGpsWwM8Cs3SfvcBYhtcwJJQe/Ao
         WBwtbjGrEckoY2g9SfVWTyY86KLTds87JlXxokToWlELhSJ3cfMzvG+aY/6S5ai0Zq0z
         g1PK6fqJpcCYnniUSxOdXMPcLQ1MG52YxcQLAsQ9T2KsXbqHOcW06jFdfZCbzH+/L2VT
         DQsW4GMpAinWR1n6Oe0AYVPYnaxsiX66MomqjFqHNM3B+a5aBJNabERvQU1AeXNiDek1
         CyrJnTbdxeJf80bh/txUzPZoar0USRkNZNhYsztWfzkYKOb3U3/I0RGY6cNLNh31xeCy
         +9xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=03IQcUsRg7qASUmrF84Q3wh2BxDd5m4j8ye3VrsXtVA=;
        b=fvWVc5mDUYmENyG3J0taQiHBGopMPPBxJLF7/jUO80nzlDIWk+llaR4KF3rDyIkZPE
         HWenf9R5dMMArEXL2ceVdZs83xsWNitddpxrsesXOZ06SVB0imfuye1oCVsda8zrHx1o
         9ICNLMCabnAa1hUgF99J6i54nQihGIHMUfHzuv/Ab8hcn/99vxHZwGynP+smF3p+Es7m
         8WKlPB9vXtMf7CdX2reSxOBXudU4QFum+Lta5vGB3Lpgcwe2MBPadPNnOX8+yI8Toqer
         LxM8PACoeiP6umZtTCaLQ7Gjb6lvjKj3/cnYwV07UeVAtiOmfXXY5nCyRzZRe1Vh///S
         wrAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gcgiXaJo;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id kt7-20020a170903088700b0019cbcb1d786sor138517plb.63.2023.03.13.10.09.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 Mar 2023 10:09:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gcgiXaJo;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678727368;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=03IQcUsRg7qASUmrF84Q3wh2BxDd5m4j8ye3VrsXtVA=;
        b=gcgiXaJoyPtvXyi7fGs/gX/RuWlo5k1MTekBtjKlnWcKmPxtu+wq2KvSmO9kvnvIJn
         m6TnWAZCM9kDfX5DhouxGHKn11wJva8dmApIS0mMsbJNSntUMUSIBsJuzeJr9lsIjhsC
         MMrEOmBTgN1sU5jIOH4SoBTZx8Fs+64BOWE3kHvhgowncRFMWiehF3HiQgokUJWZHbmn
         opg9cm2SbEYZsxrkNSoxf6PzAeyp9oSVn9k8Se06qq2HC/I5+AcOEnZ/in3CpEZYXnw6
         GTOk9yLSGGicr6v+gk6p5mtbPBuea+DRPmGkYqi1qYVVoPNYE6tBToXLtnmr7nC+YuKj
         F+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678727368;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=03IQcUsRg7qASUmrF84Q3wh2BxDd5m4j8ye3VrsXtVA=;
        b=3vrtcl15YUtQjgRHu0oXn4d+9Yl/t+2sNO6p3zl5v3/uLomxqVfMzIHWuho+esjt8A
         HBVsnu5kQLwSs8NADoNX4P/MgBiKMqONZH9CRG46V+YBkAX/VGlkev2uF1iJKSET53Lo
         /kzwV/60fVZlk26rnSqwy8OwyP4LZkTEHd3ojmrYWD+ydIghRVHwwbkrgkMht+6rIfdg
         A2kn8U0rqDAmBOoSCkYU0r44F4nqDOShLJmDE2ixGL/8rcnC3TYa63HZNQD7gIh/huG0
         m/8OKUAo5czkeX2p+9D9GPqVqL818LPCYWzghi16tCUxL8CJpl92H2Lh70IMRfAzt1qJ
         +hxg==
X-Gm-Message-State: AO0yUKW9BDtSbxhmnskIz45ghZbc5ZD0AcstvcYeK6hMSMUY1jtdqcM5
	c34+FIfnMxzwGaWRkD96e+9IopigiomZ6j562vD4bP/e
X-Google-Smtp-Source: AK7set/4d7hQmuZDoG5vUjUiFeuGELCFVp0ln3zUzjXs2zx2X9XrDdSOpKsjUt7LWWA3qBf1YE0ixkdh7oG9Q98u70U=
X-Received: by 2002:a17:903:807:b0:19f:87b5:186d with SMTP id
 kr7-20020a170903080700b0019f87b5186dmr2134515plb.9.1678727368487; Mon, 13 Mar
 2023 10:09:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230313114648.426607-1-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114648.426607-1-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Mar 2023 17:09:17 +0000
Message-ID: <CAFEAcA9WO57pN2bD47wgV0W3o3pUr26N1-iEbkXmDxgFCztpfA@mail.gmail.com>
Subject: Re: [PULL v2 00/25] Win socket patches
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, 
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Eric Blake <eblake@redhat.com>, Samuel Thibault <samuel.thibault@ens-lyon.org>, 
	Hanna Reitz <hreitz@redhat.com>, Stefan Weil <sw@weilnetz.de>, Thomas Huth <thuth@redhat.com>, 
	Fam Zheng <fam@euphon.net>, Beraldo Leal <bleal@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jason Wang <jasowang@redhat.com>, Michael Roth <michael.roth@amd.com>, 
	Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-arm@nongnu.org, 
	Joel Stanley <joel@jms.id.au>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
	Laurent Vivier <lvivier@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: E+eanFaP2KZ0

On Mon, 13 Mar 2023 at 11:46, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> The following changes since commit 29c8a9e31a982874ce4e2c15f2bf82d5f8dc35=
17:
>
>   Merge tag 'linux-user-for-8.0-pull-request' of https://gitlab.com/laure=
nt_vivier/qemu into staging (2023-03-12 10:57:00 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/marcandre.lureau/qemu.git tags/win-socket-pull-reque=
st
>
> for you to fetch changes up to 4bf21c7f748bee42b6f4692f8c37a11d1033b2d1:
>
>   monitor: restrict command getfd to POSIX hosts (2023-03-13 15:46:09 +04=
00)
>
> ----------------------------------------------------------------
> QMP command to import win32 sockets
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM
