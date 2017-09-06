Received: by 10.223.172.38 with SMTP id v35csp2047084wrc;
        Tue, 5 Sep 2017 17:35:45 -0700 (PDT)
X-Received: by 10.107.114.8 with SMTP id n8mr977691ioc.174.1504658145799;
        Tue, 05 Sep 2017 17:35:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504658145; cv=none;
        d=google.com; s=arc-20160816;
        b=Z6kuiHJpl1k1s71j1XymQMebFyHZ2POkW5NqL3FakidIChv7mMvK3D6GQVg4HyQ36F
         pliCegfh1d/6LWLot6lWcRsEUEwcocMKp0tIkeUE13CWiw34Kj+SvTN5Q/4TRemQ+eUC
         rVUNzvfQaq10FUrBQXu71cc7SJyj5YhRUINjWAPE45r6/DnPdX+UaI6yvOK1CKD2eZ9i
         UW3kB59kC/laENStersJGI/npDt+/GXSSIo4tAYhWwZs5ulcv/8fW87DC2RkqOSQd+br
         bZ4NUoLB2VSnCqKhcY5MJCn9MJZwpv6kYXKYKszlC6HLCvOQQgX3jjS7GIn50iBq/DXv
         TrIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=eqZVKCKGdNFpU+xau+CuwVEHQs6ZaYn4/UYBSuLj/Q4=;
        b=CyEHHXEybG8PsaJJ7+69P1mjIg+dO5GCQ52Y8TLkTDzc9ey0BorCHqjjDX/1aPa7gK
         i4+NKNJaT/KCtNjsf+O5R1A6BzTmJ1C8BN8cYtDo/VrSOENvHP/dLQb9OltOrBrE5ElG
         pHIUfMLzUiewlKz5E40d8hK4c5rqajei7Ns0e72IhHqDzVPGEWQ4CWvjiw8qeuGLH2UN
         cWDQ2MkLiQIeXx7ZTVOzTYMcDv5VMHEPi9pDycehNa8ITCyHThqCy+6VfJo8sWQie2eF
         Rhxn9Gd5BXSk1trP+TAU54TeHBKK37eK8QBm+8jL5Y7w4jrPdp5WvHWMLW3bc2AlHW3O
         ebdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=HsFenR7c;
       spf=pass (google.com: domain of bobby.prani@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=bobby.prani@gmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <bobby.prani@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l123sor33150ith.29.2017.09.05.17.35.45
        (Google Transport Security);
        Tue, 05 Sep 2017 17:35:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of bobby.prani@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=HsFenR7c;
       spf=pass (google.com: domain of bobby.prani@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=bobby.prani@gmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=eqZVKCKGdNFpU+xau+CuwVEHQs6ZaYn4/UYBSuLj/Q4=;
        b=HsFenR7cepIZW5FQyUT4a4I6RTBDaeToAIjJzRtK4g+7zS0pK7tV62ByQiAgheRQ2d
         IeUA4PBrK0k/8ZHvaLHYT9DNzErfQowdMVlfhArD1kdtnYbuso35ZOLzDYW8+AV9L0yt
         uAEmldayI3hAqgOb/RZkizp0yK1xNkQK9TtpWMYjI/O3+aNyv+aeX+XCbpprrxOTTizY
         yNrkvj+tyoKXOUDBXSRetiWUTPtPkbThisZv2ixYDwrnR2hYmAmHIgvYVWbMIK9BPAxQ
         PoI9tGOUuAivSa7VdaWDJ+/omOxBtFRwyHxMiUgdoJCEgOrYI5+kx361H+JKJP5YoYDy
         1UOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=eqZVKCKGdNFpU+xau+CuwVEHQs6ZaYn4/UYBSuLj/Q4=;
        b=a9Q+i3WxLQUeYYmH6JfL2oUcEVQrj385dBMkDqeK1KFjlcQKkbT4wV/UCx5a0eCWNR
         ejPIyu1Ba4DKawci6J+jcOAuciqWNY77VhihXp5OlRxm/a9YjFn+POcJCqlWTOeHV+A2
         qQ+KVyV/y2li1aWmP9d02TTZESi+QTmEns1rOnWD1/rbAwpbiaSPtNAxhHVVVnufuUy+
         Z2MzsornCdqMRin4/RA9n3/dcXHoQfItv81W7uZ7cZU9OjwATs3Uy0L89gFb4AYUyTRh
         WNl/5dlhmVP8OBq0k+7aJvlG9jx766Z7fEb4FkNA+CJBGaSWA+7QvBjels18UWNPzLXx
         pZ4w==
X-Gm-Message-State: AHPjjUh00jaqBNxUS5b/9TUnalB/Y1toAL/HqZZCZiy4AF0OLjL4IsCD
	ufO9xtyTQtm7Y/rrFwxJhnu/Mx5tJQmp
X-Google-Smtp-Source: ADKCNb65ScQwKuC9n3RtU9LLp0GVWKUmsk43tDm85Jo8posTP8dX/HXtQKbb7Dn1A0WBy8W6VtoMGA21DX2dkrHjY4o=
X-Received: by 10.36.239.134 with SMTP id i128mr1101501ith.68.1504658145249;
 Tue, 05 Sep 2017 17:35:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.166.2 with HTTP; Tue, 5 Sep 2017 17:35:14 -0700 (PDT)
In-Reply-To: <87lgltmjzl.fsf@linaro.org>
References: <20170829063313.10237-1-bobby.prani@gmail.com> <87lgltmjzl.fsf@linaro.org>
From: Pranith Kumar <bobby.prani@gmail.com>
Date: Tue, 5 Sep 2017 20:35:14 -0400
Message-ID: <CAJhHMCBy-rh9o+HymcVVHh4RGcHbrVzQXK7rtvRf2aJ-afSSiw@mail.gmail.com>
Subject: Re: [PATCH 1/5] target/arm: Remove stale comment
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, "open list:ARM" <qemu-arm@nongnu.org>, 
	qemu-devel <qemu-devel@nongnu.org>, Richard Henderson <rth@twiddle.net>, 
	Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: VXX29BJaykiI

Hi Alex,

On Tue, Sep 5, 2017 at 8:02 AM, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
> Pranith Kumar <bobby.prani@gmail.com> writes:
>
>> Update the comment which is not true since MTTCG.
>
> What happened to the cover letter? We seem to have a mix of patches but
> no summary of the overall outcome.
>

These are a bunch of unrelated patches, so there is no theme. I will
include a cover letter saying so from now on.

Thanks,
--=20
Pranith
