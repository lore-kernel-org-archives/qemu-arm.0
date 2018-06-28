Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp7477670wrq;
        Thu, 28 Jun 2018 07:12:38 -0700 (PDT)
X-Received: by 2002:a9d:5c0c:: with SMTP id o12-v6mr5735494otk.83.1530195158873;
        Thu, 28 Jun 2018 07:12:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530195158; cv=none;
        d=google.com; s=arc-20160816;
        b=lJtLIWm0ZYTLh5P4Oi2IWaE7NZ+iETZntpBnsgv71yd4Oft13Vt69+U0Zdi+Tt9CaH
         kfoauFnm+7yC6abBRUUWdRZnngGF0ARGM4NdXXdX8oCshtWf5fXtHKH33y7HpvSp3sjt
         JLCdrh3ogLqID5QfgxP3bI3n23+4EJxVsoKfADfNcqYd7vAFuAkLYvwP7yntCjPlEghu
         jK245v2hqOzpQeobbA+26ywT4rLkVAHw7n2nYq5ZmBMK3mEM6BEPShn+sL0tHAdesqAO
         oVM3qRuTiOiqeh/z879K4MuQBrtrXS524wscEby71Tjh7r4ojLrjXgD3v9Ql9xqydZ5I
         hrUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=gcFnTsv4TEC51lUYu/bNRJSB3vYK4nlu6BbgNiKxLq4=;
        b=ivlDTSvsMkU7D4adayoARpPEAvBZXRmvRi6k6OnUdNvto5ViPhBCFXRX5lmQum6Yz6
         xhrChTndVhJNNpyUlyuH2fMI5pvn49VyO5dojOjlr1c5vrae2d3KAx/A4X8T6sR3+QJW
         0JC2b1Y2LrA92EigaZaTk5FYWUbu575aiMi318kjz4cWtyH6HEgQN1yBezzt7hX7PjXx
         8GC0dtbTo4p6F/DHmYpTM6VeqbpM3v1t3CNwz+2yD0mYi3iX1XlRVOQcZ/wxLVRq5BsT
         rZkaucHWFXdoY/ZbMJSGapZF9SfO3PngasqBHw4wjastWTEHVVojRR+LPYA4faMe2cjd
         T7gQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e2JN6K7T;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id b39-v6sor1483512oth.133.2018.06.28.07.12.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 28 Jun 2018 07:12:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e2JN6K7T;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gcFnTsv4TEC51lUYu/bNRJSB3vYK4nlu6BbgNiKxLq4=;
        b=e2JN6K7TTI6HATo5XgAhkZ61KpeVbgAFzAyCP+zln0xge+ezh5BIFuh51wSZ8GzMb+
         81OIA1xU/z8u3xBjcwuLxHtFjSAZqH1z1IxFMtbTBGUXYkjCqFUeIc96YkOji38Nyd/Z
         UH9pJyK1lOmSIytDUsmcUnfXCOIUJX6Vpib3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gcFnTsv4TEC51lUYu/bNRJSB3vYK4nlu6BbgNiKxLq4=;
        b=frU94QRu6pEWzTQbWc1/iuOYIOplQe0ZYPXrZc8IfpHJxuBZaOoYss7UtskqbgRl48
         WL7fomJyhi8TM31q14s018DSuvaf5Q7Vq3NlehjrjKOGXXGzEVh1jQHNYBkhBIdVMzYW
         UL9qupL7URqXPZr9h/XOg2V6PxIpI1nCyqKg0ynzLOVpiwudllyuly1LmpC2y8E0WtSQ
         uai0+SWAbysJELJduLaBgYgQ3a3hD7C5lcDLSTHdnu0EP8R1P0EgRscNTgO0/UrC9XNA
         C6D0T18QfsGYgdnmbf/Fsm79L8PjI7i73raNvb14ASzLlfYWF2SF6umwy/+tk3MFgkXy
         q2bw==
X-Gm-Message-State: APt69E3YTzG6xOE5327QW3ELqNItq8Rdx6zmwLopB1gBZJgfuTc9CEWl
	4R5UWS5Cfr/Y9QUesT6WyeBTCozRMFzorfG2uUwWArGHtkM=
X-Google-Smtp-Source: AAOMgpfPLYRv0Cp5aKo8VGqCSyrGem4sq+kKmFgiuk/BBdyeB0tBXJVZl6tc8dXtLxx2NnraoMepjhHzNDuLxdTLzuw=
X-Received: by 2002:a9d:44d0:: with SMTP id p16-v6mr4610otg.126.1530195158198;
 Thu, 28 Jun 2018 07:12:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:902:0:0:0:0:0 with HTTP; Thu, 28 Jun 2018 07:12:17 -0700 (PDT)
In-Reply-To: <87y3ezuozw.fsf@linaro.org>
References: <20180627043328.11531-1-richard.henderson@linaro.org> <87y3ezuozw.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jun 2018 15:12:17 +0100
Message-ID: <CAFEAcA_EXZAHQEyj63Pko8XJqiEnsAHjLXAP6G1R29tqSf+W0A@mail.gmail.com>
Subject: Re: [Qemu-arm] [PATCH v6 00/35] target/arm SVE patches
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: PqW823e1J3rk

On 28 June 2018 at 12:30, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
>
> Richard Henderson <richard.henderson@linaro.org> writes:
>
>> This is the remainder of the SVE enablement patches,
>> with an extra bonus patch to enable ARMv8.2-DotProd.
>>
>> V6 updates based on review.
>
> One failure from the VQ3 test set:
>
> ../qemu.git/aarch64-linux-user/qemu-aarch64 \
>   ./risu --test-sve=3D3 \
>   sve-all-short-v8.3+sve@vq3/insn_sdiv_z_p_zz___INC.risu.bin \
>   --trace=3Dsve-all-short-v8.3+sve@vq3/insn_sdiv_z_p_zz___INC.risu.bin.tr=
ace
>
> Gives:
>
>   loading test image
>   sve-all-short-v8.3+sve@vq3/insn_sdiv_z_p_zz___INC.risu.bin...
>   starting apprentice image at 0x4000801000
>   starting image
>   fish: =E2=80=9C../qemu.git/aarch64-linux-user/=E2=80=A6=E2=80=9D termin=
ated by signal SIGFPE
>   (Floating point exception)

Do you have the insn that it's barfing on? In particular,
I'm guessing from the test name that this is for something
covered by one of the SDIV_zpzz lines in sve.decode, which
is already in master rather than in this test series.
If that's true, then it shouldn't block applying this set...

thanks
-- PMM
