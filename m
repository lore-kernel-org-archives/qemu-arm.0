Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp177508wrp;
        Tue, 3 Sep 2019 02:09:13 -0700 (PDT)
X-Received: by 2002:a05:6830:1bd4:: with SMTP id v20mr18412708ota.159.1567501753564;
        Tue, 03 Sep 2019 02:09:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567501753; cv=none;
        d=google.com; s=arc-20160816;
        b=CoSrl/1Ofvwl0w0QqvBt+yRMxbjIdeIK9cV3EBXe+xHPZ4Y+0tSuZEwvxIp+zhxEh6
         htcrYy1hSzekG/06qRQqXdGtqHVG24qQV/A6BRRB79ojVOmuyZ2UL2Ok5WQXUKXI92wW
         ozx2vSY6dpKoYTzdpa5AarJWRK5m/qMhUnoszpsFxECM7zWLKFA8OrWcBHJW/p1r0oYw
         9mmP0wm0U9eXDJaB9o7hb2ZqPpqWWooTEx9w8bgxJoQM1P6AL/I5MVyWKINX0irb3bw5
         7Ror3cS9sIOV7SbgRGEUHRkW7igrE9Wjh0XJ3s3Y+YJdN7w6HjvWFcsCKH4GsBw/KJP6
         Q8lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GinhXmUU9TXQVsUcajUaYcNNt5ZI5PaZZ1md5npj4Lo=;
        b=l8fjVkq81xYcuaYCjjjt+GAV4H3GFCydMntJG8Lk+TYjprYCljIaPhfFavxH/0jWRB
         V7AluU5GTDGjhXY/uU52eObCqZPWI2Qobsoq+cORYqY/HBw2G3rfVfvFu9kmgiQ0CAkq
         LPeRSMhCKDPjObHnCVUmoNQq7fB7kcQZ0Y3o/G4hyQGmfa+G/HRnkW3K8OVPg/Oj/1t1
         CzDyIne7OjLNWVRu/3tpp1zERNRPXNZdwqWAZGA6AMjYX3uTbdmeGicHDYdaypQbfzvL
         EaYFZLkXdKBOC8o3gsnEkWTogD4es2It4++w8oc455AwJxTHU7x+Xhg0UgQXcPjKwVut
         oBeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="WXErh4N/";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id x19sor8727123oto.181.2019.09.03.02.09.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 03 Sep 2019 02:09:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="WXErh4N/";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=GinhXmUU9TXQVsUcajUaYcNNt5ZI5PaZZ1md5npj4Lo=;
        b=WXErh4N/+ZYdTvOH7CZqIWqs0zY2LJ9clq6wDVx2vSmG/T65S6CVS0WG5EHgiPogay
         daZd79cATRgRA0QPq86NH5Q3X5W5fWhpHaTMjkdW+7lZwxmCJBZ4WZN/IUiMcDy5XHMf
         q58ui27Zc/sJitVyREYEBqg/HYJxvPREwjfYh0oMaDeAdee7uTH2NYezVpmJLTADl2U4
         X0Y1dHJVV6ebVNCm8CF8kUGthnnkwiiLvTTETXfKU2X+u14CqekhfnK4lmgV7Odv04NQ
         9tQ4FTmhg8jXpqp4KEsT4XqWuw8mY6kU5kTIAuYifNoUoIcuPU4BR+6zptAuWu+1xtfb
         xT1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=GinhXmUU9TXQVsUcajUaYcNNt5ZI5PaZZ1md5npj4Lo=;
        b=MerpE44Mk6MTFsNFPhnYaD3Z2n1pvg08H7Gh8EK6zLF925qIVlyZV/BiN7ITpL47VY
         2eM1aC5YlchB9Mrde/YyGYzWTiV6LNiSm/BJET3SElBhMOTa00r+2sxNgl6QeBFVK/0X
         /pXFNKrxQi5xGdgW8Bsmt2HXTqibAAq2WScITzLtDSw8We9bzGAuQJgXxLx5SOKCHh/Q
         DTpx+x2cgtKSdmnqUZnTmxl+cmagNwC6JDDSMoWFRipD5bplyy6kXbMmR0c3dj3hwN55
         JXPpJAiN4s4WJ6X0qwVGBBVa2mvs4hGoXUbe1SVYxOFZF/V/aGmIkwSNoWy+7gSljY8A
         XvDw==
X-Gm-Message-State: APjAAAUw6YbnWIZZP38jIM6XQh850xHI4BvyxI2JBUD33d8gy1tkcCW/
	GufBmiCibkYht2fagDhX8dTZitLTFcIpBip7qBzrcRvFZDGVyA==
X-Google-Smtp-Source: APXvYqzdocJltUTj5JjjQWlAuNx538lbQS1NdQ43OuXYgDyTCOLWY6TABjrd71dX2NfoHGFekJOKnB+Twla1KRn8dqo=
X-Received: by 2002:a9d:5e11:: with SMTP id d17mr28087598oti.135.1567501753071;
 Tue, 03 Sep 2019 02:09:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190827121931.26836-1-peter.maydell@linaro.org>
 <CAL1e-=j_uoOcyxqv7CZv3V6FWaarBnS1wEnU4k1cAoc1_b5mMg@mail.gmail.com> <87v9uf4t8h.fsf@linaro.org>
In-Reply-To: <87v9uf4t8h.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Sep 2019 10:09:02 +0100
Message-ID: <CAFEAcA-4KqGy-gg4dQu12XziuakO1Gs8SUC=z0Af22fUHn8kTg@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH] target/arm: Free TCG temps in trans_VMOV_64_sp()
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	qemu-stable <qemu-stable@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: w6L5K4ORKnYB

On Thu, 29 Aug 2019 at 21:22, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Aleksandar Markovic <aleksandar.m.mail@gmail.com> writes:
> > I am just curious if you found this by manual code inspection, or perha=
ps
> > using a tool?
>
> I'm guessing that if you run code that exercises this while built with
> --enable-tcg-debug then TCG's sanity checking complains about unfreed
> temps.

Yes, exactly -- this was producing warnings for a random bit
of guest code I happened to be running. (I run most of
my testing with an --enable-debug build, which includes the
TCG debug).

thanks
-- PMM
