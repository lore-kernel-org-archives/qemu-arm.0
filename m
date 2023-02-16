Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp655508ejb;
        Thu, 16 Feb 2023 08:24:41 -0800 (PST)
X-Received: by 2002:a17:90b:4b0c:b0:230:f96d:4bcc with SMTP id lx12-20020a17090b4b0c00b00230f96d4bccmr7390339pjb.39.1676564681117;
        Thu, 16 Feb 2023 08:24:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676564681; cv=none;
        d=google.com; s=arc-20160816;
        b=fEUxDrxz3/QaXi/aQ1wMzpTx/qceY0mh9vk97pW8m7AwQ69+x/rS2EWArl1fwF6Tpy
         hLeN3ZNqk31b6/HGGX9957pUeC0qRYh41jXAVWZ6d7JtJnN0oVLxXAUTOHlqUGG0n9WO
         6+qDi/RtbTixFVsUGoPjz8fV5kv8l4OJVcOP8u1lTF2X+0N9uVRPpVVE/MhOc4YEgasB
         t9jyccH4TYasH+YvtPRFtMo7CewPGRuOTo2iWaUIZ8oQg5qxKTgAW0R9ICUlzHWwxZrl
         /2OYrx4N/MjWDabk3P1bwsi7bYm3A2A9dUyoYknZb/dpM2ZC8D11IbikmjD5qbrv3GWM
         OP3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ILOlkr33qnTV9X85UzfOUAyhWiKaGbpNvfWSmNqdamc=;
        b=ZoR+OhB3vsEH6aD5lH7A9/qyioo7MUp6WSv2m5NMPphUP4LDjmt/u+UUmasMsJczsF
         HM8ic5LN2PK2D56/h1lfwYtk3VlJVi+vlpm6ZJkSrSYzz/lya5ZbLIgCVla2WsKxGC0B
         OjrOmzm/FdoUHWSq3KMoGtnp0X+0j5Q62n+D9XeFIJ63nT0XDL6+XtyA7v+V2aF5u7Rl
         5lniCgmR7FPtXL3ThRB0CUoKVNCsfOOcAL/VN1SMcIpBwIU9H9uwJrGoQ7wtfF7QvVrm
         G0Nf3VHg4wUgAA9e1NCo6hJW+G8KSthf45mvz9JHVzJH7zYd+Yd2HXVcn4Zezj1st3hu
         GD4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="d/2ODgcb";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w4-20020a17090abc0400b0022c2522280dsor930753pjr.7.2023.02.16.08.24.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 16 Feb 2023 08:24:41 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="d/2ODgcb";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ILOlkr33qnTV9X85UzfOUAyhWiKaGbpNvfWSmNqdamc=;
        b=d/2ODgcbH88rrY5hTkt7Y5x6G7m7hQM74/2WdnRO6poFnaIoSsg6340PeT/AdmWUB+
         jsZsbqZSTIPHJ9WqdsIUQa5w52wJmWMwaqjB4+v5G0fQcNLn1OieUcw/yqTZ8EX6AVC7
         EATDK8jMq92AX5mHSMeoK5Mq+ELQDNHZZSmHFXkDhmdGRSifLAaNZ/E7w9373R7SnfTN
         ahU7Wg6eoCn+SoHlSbi0sKtIEiJ9zUGiJCVeBAK8fFxMxC3HyF8+3d7Nepi+3Kj0+jyB
         OtkM9vf6im79ILg6xMf7+8L1dy7j8KyhqkGT3zQJqqf83Q8TpcYb8LmJRfOpCZcnyzb/
         lMPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ILOlkr33qnTV9X85UzfOUAyhWiKaGbpNvfWSmNqdamc=;
        b=zm/m6UM8rXC8Kwpvb4oJwlNi6yLX1Mkj6MAhFd1AlkMgBr/yxHsCfEuW1BVCR9OSnz
         Stn4MwOjiVX0MvzLKgRFlCSe7lRafX2tq33ID0xa5+9rXCRcem7MnDH5slMWCaI1YQny
         GjH61ZhDl4tsslfzSeIR/42LjBLlJDZUMnmMicaQBBA8LC0l9Gn5Cpq2Kq0fP8Jdvgiq
         sUBZ5qNRj/E8S3i5gWA2sDSGQ/9Ely0Qnhy1NaAKf4Fz1GD5R2rhvPc7uPJT8wcwjptT
         0f3BGXe0HG6AkCDLff+GSBeFkaUnpnpYONf3Im28giYQfVwDTfzLbCSG3B+8UkrL477T
         038g==
X-Gm-Message-State: AO0yUKUr0/U1ugGMqo3zYbyFS1lwZbJhBgdb6Z7d+ESx7/QYFldOGqN5
	aN/4yGuPOtlJ+CmAmKN0tFE4ipWHF3I+MJbyEoEdsb3cqLDXc9di
X-Google-Smtp-Source: AK7set9qeMvKLC5kHiquYDfBDa0j/5iWsNAv37uD7NdcB3JbcYOrOyW3bjngGvoOz0yJ30lb9/PLGocF2zAYVJ5glB4=
X-Received: by 2002:a17:90b:5109:b0:233:dcb5:ee15 with SMTP id
 sc9-20020a17090b510900b00233dcb5ee15mr760603pjb.92.1676564680677; Thu, 16 Feb
 2023 08:24:40 -0800 (PST)
MIME-Version: 1.0
References: <20230213202927.28992-1-farosas@suse.de> <20230213202927.28992-18-farosas@suse.de>
In-Reply-To: <20230213202927.28992-18-farosas@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Feb 2023 16:24:29 +0000
Message-ID: <CAFEAcA-6E_Eds0bv5xyYwYzE6nn=Wg4KhYZfFTswcfjTuhK97Q@mail.gmail.com>
Subject: Re: [PATCH RESEND v5 17/28] target/arm: Move cortex sysregs into cpregs.c
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>, 
	Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>, Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: nloKojl4y98Q

On Mon, 13 Feb 2023 at 20:32, Fabiano Rosas <farosas@suse.de> wrote:
>
> The file cpu_tcg.c is about to be moved into the tcg/ directory, so
> move the register definitions into cpregs.c along with all the others.
>
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  target/arm/cpregs.c    | 59 ++++++++++++++++++++++++++++++++++++++++++
>  target/arm/cpregs.h    |  6 +++++
>  target/arm/cpu64.c     |  1 +
>  target/arm/cpu_tcg.c   | 59 ------------------------------------------
>  target/arm/internals.h |  6 -----
>  5 files changed, 66 insertions(+), 65 deletions(-)

This patch too is throwing more code into cpregs.c. These
are nicely separated out because they are the impdef
registers for the CPU models being defined here. This
is a much better place for them to live, since again
cpu_tcg.c is a smaller source file with a more well-defined
purpose.

thanks
-- PMM
