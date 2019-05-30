Received: by 2002:a17:90a:ad88:0:0:0:0 with SMTP id s8csp775808pjq;
        Thu, 30 May 2019 05:36:58 -0700 (PDT)
X-Received: by 2002:a05:6830:14cd:: with SMTP id t13mr2448694otq.25.1559219818081;
        Thu, 30 May 2019 05:36:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559219818; cv=none;
        d=google.com; s=arc-20160816;
        b=UTCCBbwp/K6Zehh8PpLdsgcI0zoTRPdZ3z3aIwI8beVrSO7YkaqpSMUiLSuyvgxUJV
         q/LmqjzxQ0xKTPwXLV59Q/MZ7YLkWtamTx98r1yR4WZgsMyEq7DH8IiN/0jwDj7XBsRq
         s26KkgwIiqH2hTccA8e2pwYRi6/nB/iKOaISaEUPqWKTDuY7LofGS72AD3Yb806ZEVB6
         oNW3mx8rREyyax0gFN4neF46UD/XHXY1wekG/fI6mtUllmvjeLD2yFWJ96u5X6kLx9lb
         krMFTdHMdH3RxwZacosuxu4GDtky1y7EtG8uPwR5gBiPTKUVbKqu0hDGXjbuGXNatGue
         NFZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SNhDjSsemuPua9o7EteytJfzv74/9R2ERNOQV11FCkg=;
        b=0gJqX/dM80f9+s9X2OKeKqLMaGdCp+XEP0txZYsQwgTLs4l469+f8sJmEIjNM9Gw6+
         ptzT7/jlNW2L2zqNgKljVE9/tlMPfvZl3YLI99m+JeBB5tnAgncHtr3BPSQavZEEup2f
         2zcD/TP+TSZDZxKey1YuEWUCuFOGiUoT+rXfZ90Ko4iEFg16S1krCex2dmi6MPT8+ecn
         32xCkfqhG7MwHQt0ltXPU3OySWDUcjKq6ixXwJS9RM22qTn6dc5BntLTyXeR427rXfb4
         C+4Rifo/EjXlMxBGyOHK7ZfH8hR0zCMLkbH/Q7H202EleJKZlvfjIHHdM/ZFLpjcaJc8
         f29w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gtRUUjNG;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r16sor1191230otp.180.2019.05.30.05.36.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 30 May 2019 05:36:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gtRUUjNG;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=SNhDjSsemuPua9o7EteytJfzv74/9R2ERNOQV11FCkg=;
        b=gtRUUjNGz5WcK1q0mE3McQZNFlmnr+5vghfPfPw0O3ftbyitlTmic3ESP+QU4YpwM6
         dtxrvVLgrtuW/osFylnOVD++U1Lzrd32TInDCywE7k+FGPftc3OJhImX/RKj798Jg8iW
         zV9BXATpTDGoL6H0VLE4sCzf0R+30Xz/isYoLWpn6YPamIJ3UJuiHJuacgGE58srnrkN
         1xTQyRLTkOuqHmj4K2Nx8ZfQpUsejWyPuehPVnRPU5UMi+jgthTRMogTupEnxV6Lot65
         oE6Gc0tZ+Z2PcOZEQ0r1IycGpaSD2Plg8VEHdbMCN6zfaciSJEdZ+dSymU2Cv+AZCSG2
         YQZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=SNhDjSsemuPua9o7EteytJfzv74/9R2ERNOQV11FCkg=;
        b=NGyGkgEVl7qSdLzcHskXtSzoaiTsqS3vbpAROFPpm+HR/kY6JWb+ory+pd8QAoUR3q
         6wYkE1F8/vzOzBoZbiO58zd3+R64qgzZGqvFC2N/8NGRDcr9r49rUoyNyTz0Wja4UsLK
         fhdiJh5Rxtoca8VB280uO6LYcgUdvbuJy8zC91VEJbdX6jFbQp1VsPwetpF6KnOtXqcr
         vU1FqbcFyFctzbbHO5RfWg6MbTlrUbiE6pnn15d5jrquYQhEoaeJ3UgVYe9SYNsO6zcA
         R9keI3VIofL7bEyIldQQAwcIkkUlSfN6yrbCAViyE1uOCiYSCT15aX5v1arZ5O3nEznN
         UwWg==
X-Gm-Message-State: APjAAAVHnhCZX25pURQu/zqt+eXONBv7rRbiylWHAhQvz8XJX9dOephJ
	uHTaZJZVCMy+A3gi22/I/Ru7E8uD5sFvKGvHvBq6ean85cUzpA==
X-Google-Smtp-Source: APXvYqxVYJLaNeCSkyuj76RNGsZiSLJCe9qmWrrCTxGIruiqFPONjOjHYpxwCJbLjvRYJwXdrIwtBI9tVG9m9D9hELY=
X-Received: by 2002:a05:6830:209a:: with SMTP id y26mr2464331otq.232.1559219817616;
 Thu, 30 May 2019 05:36:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190528094953.14898-1-alex.bennee@linaro.org>
 <20190528094953.14898-7-alex.bennee@linaro.org> <CAFEAcA8Azc9g7MfWE1_WbRQCMejHXpE62bYojRw+B9maAX=+hQ@mail.gmail.com>
 <87zhn43yt8.fsf@zen.linaroharston>
In-Reply-To: <87zhn43yt8.fsf@zen.linaroharston>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 May 2019 13:36:46 +0100
Message-ID: <CAFEAcA_jaYEhnw4C6oPEW6tMvVC+W2v-upPqf8y1qmtm9CkJVA@mail.gmail.com>
Subject: Re: [PULL 06/28] target/arm: use the common interface for
 WRITE0/WRITEC in arm-semi
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Richard Henderson <richard.henderson@linaro.org>, 
	Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>, 
	"open list:ARM" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: HzjBwW4XlObg

On Thu, 30 May 2019 at 13:35, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > Also it looks a bit dodgy that we are passed in a
> > specific length value but we then go and look at the length
> > of the string, but we trust the specific length value over
> > the length of the string. If len is larger than the real
> > length of the string (including terminating NUL) then the
> > write() will read off the end of the string.
>
> It is an admittedly in-elegant hack to deal with the fact we call the
> same function for outputting a character as well as a string. None of
> the guests actually give us the length:
>
>  * @len: length of string or 0 (string is null terminated)
>
> We could formalise it by making s/len/is_char/ and making it a bool or
> just add some more text to the description.

I think it would be cleaner to have separate functions for
"write a char" and "write a string" rather than having one
function with a bool flag parameter which every callsite passes
as a constant value.

thanks
-- PMM
