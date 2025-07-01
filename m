Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3036060dye;
        Tue, 1 Jul 2025 02:55:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXjcDDUQUjE6yhNUOybHuw8zVuDI1zJq91dIi5WIiiDFycKgz0iCNAHH0VpLWrvr0w1adBrzpgSscnMKw==@linaro.org
X-Received: by 2002:a05:690c:a0a8:10b0:710:ea78:8ff with SMTP id 00721157ae682-715171af5d9mr168240057b3.23.1751363757472;
        Tue, 01 Jul 2025 02:55:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751363757; cv=none;
        d=google.com; s=arc-20240605;
        b=NSjemZpWQwmLCZn8B6cZs45S5NwJcXq9wdFJ3b1Pz8/mCafTDNZM/boeArGGwqgHKM
         O7VybQ39cT2t2iwG1mMqLK4xu6ytkp15fLupCvA2BjNOwQeKUCO06KrYUln5VsRyBJ79
         wjnTSZhP6gSGqtlgTmXTlLvNN1fjOIyESb9P8NA3KMBWtQNUrUEVL4Cx1ssZlIiz0uSu
         GehpZM05cTG3PmWS6vIo0vIm7uEvJH1w0bj3xh24L9MZGCJi3SZLsEcyA3fQnty57JhT
         ALQlxg1v8RbOMCsSITk5mY1SlAoDJvllWhq251RjnzEKgIuNoUcMK+VToSdokZUN9Ee0
         Ieyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8z0G846kkv98HmmpTnG8gyqbySyckwlmkhjrgs/A22U=;
        fh=WKuVA3iqikON0lLyVVIaPZ/uPh6+3G2+XI5CNRjN2uU=;
        b=eS9LOsXT6PraDhJcad8leR+SFgwx+oAItbtmTH6lOpXXlp2lgIREt6ZEkRqDXsHy7m
         IPewTJcQN95Xh2i3n4RLvzJYso8kmGAMKoZvizjkseFz48bJK4MXpMWjAO65DGNDyaGP
         okYXM1uGoVo/0XCH4v6vqO3EhvUFVGyOG4VFJGtABslRF7I7w92m5c3TLVzv1NW8Qm1y
         GC2brGZB7V5Zz/mv/Jrc538c+2/b4Eh+okZif3OQpNd9bzt/wsb2pxGqHhkxInKNWSeB
         Lrhgayn8kHu9VohnIjJX7dTFU/NcQ24sGTWwiwb9Wwenvh8uEV75qxbr1jlsOyexVvHW
         9u0A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Fw4GqBy3;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-71515cc9407sor56571807b3.13.2025.07.01.02.55.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Jul 2025 02:55:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Fw4GqBy3;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751363757; x=1751968557; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8z0G846kkv98HmmpTnG8gyqbySyckwlmkhjrgs/A22U=;
        b=Fw4GqBy3r5aKNfmqTdirD4eq4xaeRsRQ1cRp1KlneMLGVpn24w3lpMEYRrRhuPPj7/
         k4DmMNTGUi/rAMHn7lwQN2ZurN0yqrqymha/s/a7bhJ6bXG/EpwjEbCRXxNwT3wjlzGW
         L3/xnwI2mJzYTYlYHeRZRofQVMXsYns54v/n+g72WLcKvSSFAhiZMVDeJxAWsKbFj2ia
         c3HCuMeh7Z/xsfYbG1iP69YaYuzZ30nH6zm1F3PGRx5A43av4FpJmj4RbYoLDCYD8wVG
         0YBfAKFZXvoDEKof3O23A13+VCtvfs/Q6qSDUX6SV/aFykJ4IMxzPhUrikzepBwY5AYa
         +4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751363757; x=1751968557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8z0G846kkv98HmmpTnG8gyqbySyckwlmkhjrgs/A22U=;
        b=ThLPaZjFjEHsq3Wzk2G0oV3+KvDaKoLIN2wcIDHloERhh6chl0RFYCv6bvSafiUKpn
         lz6+bWnkWG4TJ9BPyJ7XYYVUZxgQvC55hZ3F4uMzc1PtmpgFqwpmhSoop3sCsWVwUF5W
         QDx7YJ2+keTJarAW0r1CFyo8naHXoFn4qO25AYNnbq0my66HNX1itIdzwFmpL9Mbn+Tq
         eVWBcrO4TMuZ2LXzkowKMji+perp7NY26CzZG5vdagRKsKfBKsS9/jZ/Q0IWn2vIG7hS
         eePgyNVbyPKnYIqFtvDPveakmo3QVoVJDABZEIkwu5Esj9/zf4psClD5zYUfm/Jxhhqg
         dbeA==
X-Forwarded-Encrypted: i=1; AJvYcCUPSu9JlVppWHDiyGPvnpIkoB+Fw35p62LKl8196OkHRDuCLtIdnNY3jumltGtjZ/O/mDt4wn2nxYBYJg==@linaro.org
X-Gm-Message-State: AOJu0Yx5S84KqmjOsx04C4c3RYn0xlzRsmXW2Cspq2wuB8o/Viz48txF
	2KbYw7ajOP3E2wZy7QVT/xdRfThbtcB/Z6qejGuKNxvpGphhnVI/bQA+tPV27JzK0XRqSurBLNE
	MXU6/a9HKQ8W60THkEWmUd8vXDwrGg54CO1YfAm1XktA4
X-Gm-Gg: ASbGncthCoi26b/WKmWGfoZOzkEhv4E3yCXMx1OymCZU0vnhGAW1xeUCkC592kDl0gb
	ZH1xxrvguqZcLsP/QIAT/BeooQx3mCGY3jedUJkbEghiF246rsjuBZpJ0o4kuNwohJ8r9/pQn/O
	wUfbXUegDOOcVbPO2Ois6aGUfQC73KWAJL2ktTHXGiCg/N
X-Google-Smtp-Source: AGHT+IEhKDbR82dp5Cfu/vp4vMY89S4AyhtdRYjU0RTVi8X7AVMwT9nqLWzOCbUd1tBRmTqUP3fTj9xQpyq+Su3kito=
X-Received: by 2002:a05:690c:7401:b0:712:e22d:a235 with SMTP id
 00721157ae682-715171af91amr251415377b3.17.1751363757070; Tue, 01 Jul 2025
 02:55:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250623121845.7214-1-philmd@linaro.org> <20250623121845.7214-13-philmd@linaro.org>
In-Reply-To: <20250623121845.7214-13-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Jul 2025 10:55:44 +0100
X-Gm-Features: Ac12FXxZuvpkYlYeLubDALCRe9b49Ny7Qj6d2gQPpOSrpzaCFQmZmZpMM8bnYto
Message-ID: <CAFEAcA87+SMWdSOGBaGuNDzynaLzoFMKv3PJmbfTyd3mN_TwzQ@mail.gmail.com>
Subject: Re: [PATCH v3 12/26] target/arm: Restrict system register properties
 to system binary
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Leif Lindholm <leif.lindholm@oss.qualcomm.com>, 
	qemu-arm@nongnu.org, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Roman Bolshakov <rbolshakov@ddn.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Alexander Graf <agraf@csgraf.de>, Bernhard Beschow <shentey@gmail.com>, John Snow <jsnow@redhat.com>, 
	Thomas Huth <thuth@redhat.com>, =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	kvm@vger.kernel.org, Eric Auger <eric.auger@redhat.com>, 
	Cameron Esfahani <dirty@apple.com>, Cleber Rosa <crosa@redhat.com>, 
	Radoslaw Biernacki <rad@semihalf.com>, Phil Dennis-Jordan <phil@philjordan.eu>, 
	Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: pnw1mZlTkivc

On Mon, 23 Jun 2025 at 13:19, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Do not expose the following system-specific properties on user-mode
> binaries:
>
>  - psci-conduit
>  - cntfrq (ARM_FEATURE_GENERIC_TIMER)
>  - rvbar (ARM_FEATURE_V8)
>  - has-mpu (ARM_FEATURE_PMSA)
>  - pmsav7-dregion (ARM_FEATURE_PMSA)
>  - reset-cbar (ARM_FEATURE_CBAR)
>  - reset-hivecs (ARM_FEATURE_M)
>  - init-nsvtor (ARM_FEATURE_M)
>  - init-svtor (ARM_FEATURE_M_SECURITY)
>  - idau (ARM_FEATURE_M_SECURITY)

I guess these are user-accessible via "qemu-arm -cpu max,cntfrq=3D ..."
syntax? Makes sense to not expose them, they won't do anything
sensible.

thanks
-- PMM
