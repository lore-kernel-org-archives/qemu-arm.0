Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp1216482lfm;
        Fri, 21 May 2021 07:29:38 -0700 (PDT)
X-Received: by 2002:a05:6402:2788:: with SMTP id b8mr8193195ede.335.1621607378211;
        Fri, 21 May 2021 07:29:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621607378; cv=none;
        d=google.com; s=arc-20160816;
        b=csb7Q/6unsP8WTaifaQZx3Q6DBGfMBHojgUU4Ad1Ilm0t3CEKGIPqnClLDH76IKR8J
         c/JffdG9kVu1551gYux3j+6HEIzSi/fcAJaZBAxXMfWZlpPADji5EjUQHk2SOOw5cQfX
         9qOZoY9Djk4UEAT3N2ZzI8lMlLQ/CCzH8dVR313yfK7Z/6fSrlM1a9l5SsQKNcm5WbJD
         nMoiTOe2dr7WqRlovq1v/PbjOTwxgEV+NFgzaqNbIj5KQnKeXtB5lAnCCJN6RQJh/woV
         Bma5vLFPg36z7BWSoqa2y8V7l6cmiVkU6hF7GDTXmtm4AacyPWUn/kFybTCYtwdlx/hU
         7hhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pdub6D7sV0imYGC0/OXY7yxI4FQou6c+CXhhLwE5v04=;
        b=Fwfci7jVWBF3UWRmcqmtnWDqHMWJmGakRYJeMpHuODDp7VM/1sgiYzMZ4jbJKD7j+M
         7k2A/Foj5GsL4L9AkSVjgYF6GQBM+FNKXpvTztthxVOv3b/rSIt/Hpc89iEP0ov+k4nr
         f45WBYq3eHtc/artI3FVLZwVy38jLx+lJlzJE/UkZcOjZY892NzfxQ073Oz5kyovBeJf
         HQjMHL8hZyf2QoAGGDpOJTM9da/BsA1oxSpjqRuqXvaZVxKayK4tl+LOmd+pUztC0T64
         TTq2kv/LXGJwaPyY/uYrL93CKLyVdN/+nmMpS0+qBT5L1sbK22oGek7z2GkB0rYUxVB+
         Rx2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gZ9hvzje;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f5sor3959723ejh.30.2021.05.21.07.29.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 21 May 2021 07:29:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gZ9hvzje;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=pdub6D7sV0imYGC0/OXY7yxI4FQou6c+CXhhLwE5v04=;
        b=gZ9hvzjem22ibr5vd+g+dcccO7ZWuTp6E53wc7mKH5dicLzG8N01yPZf0GLt20zLWK
         hEzdeJNJddEYmwYUPno0lXW+tPoqPz5IuXKfLudi/BHVIupMAwatmdkmy2BkavQ2pTy+
         Q/ZGfK62KGvauijDEEVBfARtcENoZdlVkdxxWmfr8Qjv09v4UlRYupDFzhOcxuhfavcD
         jQvl/hu5tsQWZRCHD+pUGTW2wRehircjBu1EBKEkZN1tSmcAz9+nNjH9c529Jo65EGlv
         gFfVcLm406CJ1OtiHsm62pUMFfE5YAstfX+m4sOJ52BIvuDt3Q5fEa2/+mOoOjOmBadp
         wNqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=pdub6D7sV0imYGC0/OXY7yxI4FQou6c+CXhhLwE5v04=;
        b=PFkcUw1YVlVc4AVGScjO1yg/FBHrFA93BpJ8fG0kQf7PTlAf0BkrdNuo5OEsseID13
         AkQdVtQTPV7fwLAEVhchWNymjwvTw2X6xWPC+JpUozC/R7QUYtNei1mhMhoA/H/rbCnh
         3S/BodtknQHGoxKTILxlTdB5Ox7M9e2l6yQwHpZVqEZi0ZRQMpW6ZwGb5+x/jiRZsqtJ
         7MA+muc6UCYuHcBy5TJVH9dOOi0ohTnWVTElZ7E//qjhIdjHW/aKNe4Xpm4mwpDO1V4U
         tShwWDlvBpAEMm08l/SQsHZFJskgQiJ2WDSS7AXNc/YPsd+M6BnQ8kHpQrFXmdU9hPWM
         de/A==
X-Gm-Message-State: AOAM531bV0MWDu3DnxAP/XAUWI1RjSO3Ktxb8tCdN2Lj3U40WHQUwQrI
	lb3siZkDw6msZuqC6wmBQ+EFVWGNkFDbntlY6Qg7ynZV
X-Google-Smtp-Source: ABdhPJwC2VlJwooTq2HYo1FkPwhtCoxflv/1lCAq/Bgmcx8IMs/RrfqkoiqfPsOIe3HyWoKbnIqmdc69E5GfKxwrco0=
X-Received: by 2002:a17:906:bcd6:: with SMTP id lw22mr10835261ejb.250.1621607377791;
 Fri, 21 May 2021 07:29:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210520195322.205691-1-willianr@redhat.com> <20210520195322.205691-2-willianr@redhat.com>
 <0f4a1c6c-ddba-ae57-2d55-f59c478dc9c5@redhat.com> <943fcdae-168a-adf8-c82b-b1a88369441c@redhat.com>
 <CAKJDGDZgnsFe9S967jjm1OMHPa25rb-tFmycpdC53WDK6DK1xA@mail.gmail.com>
 <a95cfa21-dde1-cf7c-a4e4-a5cf43c1de1d@redhat.com> <87sg2gb5lf.fsf@linaro.org> <b53b690c-f542-cc35-35a6-e577529ac303@amsat.org>
In-Reply-To: <b53b690c-f542-cc35-35a6-e577529ac303@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 May 2021 15:29:18 +0100
Message-ID: <CAFEAcA98XBN2x=FvJod8U4+NM3fpmJigQsWoi-v4L5HXQpT+Rw@mail.gmail.com>
Subject: Re: [RFC 1/1] acceptance tests: rename acceptance to system
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Thomas Huth <thuth@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, Niek Linnenbank <nieklinnenbank@gmail.com>, 
	qemu-arm <qemu-arm@nongnu.org>, Michael Rolnik <mrolnik@gmail.com>, 
	Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: csfzW9EY8aq0

On Fri, 21 May 2021 at 15:19, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
> If you think these tests belong to tests/tcg/, I am OK to put
> them they, but I don't think adding the Avocado buildsys
> machinery to the already-complex tests/tcg/ Makefiles is going
> to help us...

This does raise the question of what we're actually trying
to distinguish. It seems to me somewhat that what tests/acceptance/
actually contains that makes it interestingly different from other
tests/ stuff is that it's specifically "tests using the Avocado
framework". On that theory we might name it tests/avocado/.

Or we could just leave it as it is -- is the current naming
actually confusing anybody? :-)

thanks
-- PMM
