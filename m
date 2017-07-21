Received: by 10.25.44.15 with SMTP id s15csp696605lfs;
        Fri, 21 Jul 2017 06:58:23 -0700 (PDT)
X-Received: by 10.223.144.135 with SMTP id i7mr9730196wri.3.1500645503926;
        Fri, 21 Jul 2017 06:58:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500645503; cv=none;
        d=google.com; s=arc-20160816;
        b=kdWpSbBk5oeAyC12ItmqWq0LENAabvGBY1FhQKmsNi0BTOqMN3yZ6tPQ8IIvBmoAPb
         jEWPkD5SlyOoIkjDoHNV3DyKsz983fMmq/xGJV5l0uYtWHX/1hspGtT+34UvXc99TZLy
         VwtVIJk+VdHmnFalcETQfo7007WX1XC+ViTCw4LcoRpDEHFMR1zuPBFXHwAHyT0vP35y
         MJ1XgT0Q6uHfoCWHDvyKY0GvMQyxu/QheL6E5j+mpzM3sN1f5F614pPowrr3eHP/UL4M
         RDN+9tsT8D1eK9f2bgbDWSdOnbXc7HhH3UiI3TWjmPmS6bIhuDTSt7C7oKDSObRSn/Qz
         jTHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=CM8dYZJ6QghVnBNpceu5zT1HyLlT1zFadnT5hPtm4jU=;
        b=rWLnuxpPBaMRnpJ18cHcRSbTycQNHJ2ebqE9uOBnF9uRI8anV6kNuYq/5UeJoedJ5x
         hK9s7D36MQ4OZi8u3emV4lkqLqMw/whd4Pai6uAXL/xCjr5ShsrZ0t6matZ2Y35n8TQc
         qBLNdaukVRGyxfOtLJtGrNE/62yg5RT9FFdL4bgZAnzHj78G2intCHSv6wLdvOtcDHob
         y7z+00mB+H4N5xgiB+MN7YyRqp7Eq6utpdHFGiB4T2hHnNT3PNhBFEqMOIAKSSs1L6gn
         /WL8YLKfb+ptn4xdcqPz0GcNUGyheIPWNKCGq3BjTs8R0dssCPiadd1nFyY04HqxX4et
         ImPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.b=T3JdgTLU;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::232 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wr0-x232.google.com (mail-wr0-x232.google.com. [2a00:1450:400c:c0c::232])
        by mx.google.com with ESMTPS id c14si6681530wrb.102.2017.07.21.06.58.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Jul 2017 06:58:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::232 as permitted sender) client-ip=2a00:1450:400c:c0c::232;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.b=T3JdgTLU;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::232 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wr0-x232.google.com with SMTP id v105so52636343wrb.0
        for <alex.bennee@linaro.org>; Fri, 21 Jul 2017 06:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CM8dYZJ6QghVnBNpceu5zT1HyLlT1zFadnT5hPtm4jU=;
        b=T3JdgTLUEMnElMmPaCpehMnxMIHzYbQxd8MSbSr3H7muYOgC+4qUoPm6ltBWiDe/uM
         YOF3DMv227ILHw6ZX6BPlow6VZBS0u6maLR0v7tOTkkCKlSWBzsJP1K8ZV70pBFp+p76
         El/tt7QdQQB7rFLAQdL2RmCfqaLm6bTfKsRv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CM8dYZJ6QghVnBNpceu5zT1HyLlT1zFadnT5hPtm4jU=;
        b=PVwx64TDafMoSaZFTbjdW1PGJGVTdvIQ0rt6jqH3CuN2tjmoUCOzEOYTHQx4jcqvwm
         N8GC+FhtnfpHKiQ7CRaSo8mI1mBSG5Hdxg0XNUglJ6JXQeP2hNSZXWFWOGFPWxnezjUa
         ycZFDW2KQhG6ZdHcbP/qHKFlDTeG1YRUmXEC/SIUPo89JvsnGxA4wT/sAXoB6F6LQhhZ
         efPoOylii9VLyZrmfK+kY27HVXOScD+U4Ny6KpPDu9/ddCsPGZBp3hXOg3cYkKefzD1N
         s7y8wngFbSYKXvfBj/2SK3jN2XROFxEjIi+PD0sYIiRvnspN171/jYqulQ9PkuBIj127
         XVYQ==
X-Gm-Message-State: AIVw110GZLjLGDUd9kYdXvT4pH7MqgnXyQFl+8KBr1B4ufs2dDnYbacb
	gcX0X909CX8dl/B8hBH6dVtpNbCq+WVN5mR+BA==
X-Received: by 10.223.165.129 with SMTP id g1mr1604452wrc.167.1500645503237;
 Fri, 21 Jul 2017 06:58:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Fri, 21 Jul 2017 06:58:02 -0700 (PDT)
In-Reply-To: <87mv7x7vbq.fsf@linaro.org>
References: <20170720150426.12393-1-alex.bennee@linaro.org>
 <20170720150426.12393-13-alex.bennee@linaro.org> <4d6ac494-d606-ebaf-6498-7c526467ac62@twiddle.net>
 <87tw266rm3.fsf@linaro.org> <20170721132140.xy2uqronprhzjiga@aurel32.net> <87mv7x7vbq.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Jul 2017 14:58:02 +0100
Message-ID: <CAFEAcA9kEa2PCjEKn1A=-bM7jjFhZc8pjef2J_c9qL8p4bLdaQ@mail.gmail.com>
Subject: Re: [Qemu-devel] [RFC PATCH for 2.11 12/23] target/arm/translate-a64.c:
 add FP16 FAGCT to AdvSIMD 3 Same
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>, 
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: jEjBbwDG1E1F

On 21 July 2017 at 14:50, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
> Aurelien Jarno <aurelien@aurel32.net> writes:
>> As said in another email, some architectures actually use more than one
>> float_status. We therefore need to implement a solution like the one
>> proposed by Richard.
>
> Ahh you mean more than one float_status for a given vCPU context?

Yep. ARM's cpu state struct has
        float_status fp_status;
        float_status standard_fp_status;

which we use to handle (1) operations which use the state
controlled by the FPSCR value and (2) operations which
ignore the FPSCR and use the "Standard FPSCR Value" (generally
Neon ops). More info in the comment in cpu.h...

thanks
-- PMM
