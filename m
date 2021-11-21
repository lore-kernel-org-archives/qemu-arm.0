Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp5072416lfk;
        Sat, 20 Nov 2021 23:52:18 -0800 (PST)
X-Received: by 2002:a05:6808:19aa:: with SMTP id bj42mr12376439oib.37.1637481138768;
        Sat, 20 Nov 2021 23:52:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637481138; cv=none;
        d=google.com; s=arc-20160816;
        b=A4P8xLaPPQLsqWpqGcTaSImpWarByQ911aunYwas2BgxUVYSSOm0TAIomNDt+SbTzO
         NVU5uyI3jsRt3uelmcS1iQicsYyNWDqYncZFLIHAtAvIaIFyfSJ9QcpXuSJkB30okfrT
         gqtEo/M+TqIbtjxoV+zmvkk50OlGZbwQJV27eWKlAiiQk6+ZYjxoW8uVGZUIcLgI4g8N
         rZkkx6QfTk/ot+jRpjDZs6mBj7oF/5WHedTgB8VDLvRtPBKWBwSheiyuPNgRltziJ1aQ
         i9n7IAMGGVm9T8MUd6Xx/mYo+4wiRPBcnnXLaqh9QIOJ23wXtVqHKKIqcdSCsLE2v7oi
         3N0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BQqQ9aUgY1YMjUx5GM11KCpEzdk2dgXfVbtIFk5iJK4=;
        b=wIsStV8cvzmiq1GHyigoJs4jzwBEa7eIdcwLnXZsA1IgLWV9pbmShC9Ocwr7qhLXfX
         y3s0vOygnmmY4KWkf9j2+vO06bC03fn9ojcxNeF6G9Um7LKpwnp6UMsIWd7jRXMMDV/S
         CV6QICzOxbePHs/CLwNzE7J9GSdcCQB/jyYljrnOAl3KkTeSku68Qe9x+MYAS/O/DO6B
         WgyEBH1xqUH6AqaDhK7fMKWU9LNefkG6//T20jcCeGZ4ZmsG1ygWCXR52PwtAUfT6gqy
         KgYjQj1wMpTyuEOa/RgHHdvQ/vSpRNCfPnL9JpibZXv100yVv8L+vn4G8IOJ/LtqvT/Y
         5Rvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=Grzcy1Se;
       spf=pass (google.com: domain of idan.horowitz@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=idan.horowitz@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <idan.horowitz@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w132sor1333623oig.149.2021.11.20.23.52.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 20 Nov 2021 23:52:18 -0800 (PST)
Received-SPF: pass (google.com: domain of idan.horowitz@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=Grzcy1Se;
       spf=pass (google.com: domain of idan.horowitz@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=idan.horowitz@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BQqQ9aUgY1YMjUx5GM11KCpEzdk2dgXfVbtIFk5iJK4=;
        b=Grzcy1SeOq8X/+7TCz0OtaGvyyxvzyzih3NoIghu2VVxYCzBNWgy2DOWYuviNslPyW
         CA4+HW/Y8UbRXPIj3nnnG4XW8rBS9RtWW+ZYqK3l7uU063/Q0NArXdF31swJ19336Yr8
         NYyUgqdvFQguvtzyuJqrgMyLibNnb64oVDOvWgSm8249m+fLmtzvcrV8qBLooqzMnb74
         C4rSnulidRrB1aPF29TXhqHpLsV8g8QiWYacPUaD0Eg27xulCUg8sa/BJ/WgqqJ2m5D/
         nRyBg3Y+FFSFXL2NH3hWEjbvh+g78JwKinxl0xHiu9Oh5+QIiSi5Jk2Uguu0EXmHklv9
         7lxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BQqQ9aUgY1YMjUx5GM11KCpEzdk2dgXfVbtIFk5iJK4=;
        b=sImLU6YWKmuAOkb5cFTwgmrxnHLE9Sus3shoUJuOK+Tb7KlTVdo0nTZXRdmdwKFBSv
         /u65wmm9q10RgP67X5BUUb+RVd5un1gQPCk3JhhlCK6StuiJnlpLW72SOmcNrtW99Spv
         qdh7u5VlYCSo+MDQlh6G6uxy6AEQ9KarWoDHCMGO+A1ObJGsPJa/ZCgzxW7KOjzNUW5z
         8WmFK4l7TIJuc16BJxC7WISvyAPabN9DtU7ArGobFjsFayA/QGs00nQxXa/5CNdPSvQS
         nawV8hltRGrCp77tZKVJ0ODFBvEwZREUTyA28mKFVhZegbO9O3+jhyJ9iCVlKpa5gaCB
         zitA==
X-Gm-Message-State: AOAM531OQEx6pB/hsYDDP2mNQRHbTQPu3zOl3yBf4HOrPS1JTZtpf3Mr
	5yhEWMfzdyVQXQMK9x7hnbi6f5wbBr/4poNlOoYUvJE/
X-Google-Smtp-Source: ABdhPJxLHFCdMlYUT3tFAMgScHwxU6b7Hyc3k/W7x5kDw87f2BtocXjyM1gvJdXSoovkZwa0n8nhxfjF6/wO3qBG1k8=
X-Received: by 2002:a05:6808:f01:: with SMTP id m1mr13062673oiw.166.1637481138137;
 Sat, 20 Nov 2021 23:52:18 -0800 (PST)
MIME-Version: 1.0
References: <CA+4MfEJhOsmUWmifkzJ7jSw8B0q7X2mJe=jist4AiTwhYd8Wug@mail.gmail.com>
 <87fsrtv13t.fsf@linaro.org>
In-Reply-To: <87fsrtv13t.fsf@linaro.org>
From: Idan Horowitz <idan.horowitz@gmail.com>
Date: Sun, 21 Nov 2021 09:52:06 +0200
Message-ID: <CA+4MfE+gT-CGEVZot=26DqwCRY+F-xZhTRSOsKKBVb29Un46Dw@mail.gmail.com>
Subject: Re: DSB does not seem to wait for TLBI completion
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: paHVc9nhbI6e

Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
> If we exit the translation block like the code for ISB does then that
> will give a chance for all the queued work to complete. If we have done
> a _synced call this includes bringing all vCPUs to a halt before
> flushing and restarting.
>
> Try:
>
> modified   target/arm/translate-a64.c
> @@ -1553,6 +1553,7 @@ static void handle_sync(DisasContext *s, uint32_t i=
nsn,
>              break;
>          }
>          tcg_gen_mb(bar);
> +        gen_goto_tb(s, 0, s->base.pc_next);
>          return;
>      case 6: /* ISB */
>
> and see if that helps. I suspect do be efficient we should probably do
> some more decode on the instruction to make that decision as ending a
> block for every DMB/DSB might be overkill and impact performance.
>
> I don't think we have a way to track pending state awaiting a DSB
> instruction in the translator but in theory we could. I thought
> (ri->type & ARM_CP_IO) for system registers would ensure an end of block
> but apparently that is only for icount.
>

I am actually running in icount mode (-icount shift=3D10 specifically),
and adding the translation block exit or just using ISB directly does
not seem to affect it unfortunately.

> --
> Alex Benn=C3=A9e

Idan Horowitz
