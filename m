Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp1099019ejb;
        Fri, 17 Mar 2023 10:26:41 -0700 (PDT)
X-Received: by 2002:a17:902:e80c:b0:19a:acc2:73e4 with SMTP id u12-20020a170902e80c00b0019aacc273e4mr8892682plg.22.1679074000918;
        Fri, 17 Mar 2023 10:26:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679074000; cv=none;
        d=google.com; s=arc-20160816;
        b=dsKkBgt8Wr09vOM6BvveroPVOXtDC2xWP0xWDZU98Jw9j1Ph2/YUmB+bFa451QEnCw
         EdIFI4Mwn/KzJEvRVORRFYT2hIGkSPOjcaG7hqoQnYFix9CSrVpKwoCnnvHRvuKiBE5+
         8kAJH6mp0OZYPmtrsJ1iwap04/d2CGB3ER941nhsqKg34jHdHQ/+AQ+GGtdv/FjWgs3D
         mE6CTgQeI73SM6dDuQhdHf9lJGCj3WFL7F8YgK/ic6d/S+ItEFdbTeOHtiPbiy9wc3h+
         3idBHqjYqgAaOyxzLJNWWxRV/NA+ITwglzkQOlbkHZw9Q5z8yjj9OBTI1wo5GkUa62hr
         WkTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5pcs5rVYYWTe1wsOB9ATbEmtsmSIbU5zUtrKNqRUMnQ=;
        b=G8nmAdElfAAh4rz2AO6xv/PhFZG/Eb/lEPLkbWSZ6U9QB11e+F8/n49z9CjjlS/j5f
         VKf5ApDlRyK/NNKjT2vMJ6k8ZGFHZoxIE6Ar7F6B8defyLja9GA4mH4iDCVg1N0P7RrY
         V7M0J1O4La+zhvspde8OCZLnJydA05E7iU32qV8OiNe9mlXdkwJGcT7BUR8T/Ij9Vs+f
         JYs8dTuCsdKdJCP1LrYmsB55FtGOoxNJC9hIXh59CyonPNMpYTEfFBOj3OB0kHQT+hR1
         vaavUPNa/E2auve8s5MTmccmO00EFMO4MFiIjnCWjh1/4nZVrGxvVrHGvmOrcpLhOhpC
         6Rvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SrJWeBSP;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e19-20020a170902ed9300b001a05156bd1asor1209637plj.188.2023.03.17.10.26.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 17 Mar 2023 10:26:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SrJWeBSP;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679074000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5pcs5rVYYWTe1wsOB9ATbEmtsmSIbU5zUtrKNqRUMnQ=;
        b=SrJWeBSPWydRGoa15c33zsI+mNdxjSBmmiHrWu3nZfAMzSP6dkKFdLvRGdz2mZE5tx
         igN1CR10p1nLPYZ3kGRJBWt195ZhIEv+Gi5KM9AMPF/5LEqPGriZNrqYrb7um/RDaBkR
         6rz/5IrToRLBxQfFfulTs29W+InF05+oGU7GyNY/KLQyDA8a6TWB/8+ESGCPg5veFcWP
         Cxc4VsjTANFeGY4BQ8mrXJVv6pgisrQ9got6wuuujmTvpXVKIwG47NETbd5lp1KdPSSZ
         kdXBxSWU9o5ACT6UrG5gQ/M895VKh/rbmXIX8YNmE5L37FZ4+Pa2fi0TG9oV7M6kYJnc
         KULA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679074000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5pcs5rVYYWTe1wsOB9ATbEmtsmSIbU5zUtrKNqRUMnQ=;
        b=YcFQXtvfd8LGULwE73yTtDgaTXjG0JiCBCr9Pg2lz6J1Y7ngJcM+tMbmc/we8tPwSg
         lSINChz9B2Sc5tg0LyikbwApqN0g5BHP3rfp8BV7S0aMgmig/GSHnaWgSpQBJe/UmVx8
         6o4tRym5aWhM5B4cmI1lBG4MM5vaL6VWkWpeNq67ebZivcYepA5KDgLumfDAHsvjsQeh
         Kxfu0igO+aICUvF+IzR1FLC8SIA6MhKRudhg+XXR9xPWc1TO0U1efq77jBb0sT2f/trY
         QzDIquuSBPEuFWslNku/OpfP64jH2NndbgcTG/WgYgvf42NUB3bSjJCiGqNTWtYRBIQ2
         Cvbw==
X-Gm-Message-State: AO0yUKXHkTVD9lQXl5ADgJXi1b8YG3zYqg6DW0nNHalOJ3qrrw93ehg5
	8XCGaJ3oHnwd6MSQK4KQcNXbcJlF5N7XSGZADrtes+CdjtBf+sZam28=
X-Google-Smtp-Source: AK7set/FX6uHPZzkdm2rj6m+WnLJQrvP8NuuqcuC/2JWBLVt/kVuZ64qZhDLriL8YOzL8aANKLe2WkhUDBMtTk/qF3o=
X-Received: by 2002:a17:903:234e:b0:19a:5953:e85c with SMTP id
 c14-20020a170903234e00b0019a5953e85cmr1582123plh.1.1679074000396; Fri, 17 Mar
 2023 10:26:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230317165057.1522743-1-peter.maydell@linaro.org> <87ilez70mt.fsf@linaro.org>
In-Reply-To: <87ilez70mt.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Mar 2023 17:26:29 +0000
Message-ID: <CAFEAcA9qt9UToEjX7r2MWCLZ3i-zyPPgQHFvFUyLXCHF6QUKXg@mail.gmail.com>
Subject: Re: [PATCH for-8.0] target/arm: Don't advertise aarch64-pauth.xml to gdb
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
	Richard Henderson <richard.henderson@linaro.org>, Luis Machado <luis.machado@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: k8F+x+dRQL6V

On Fri, 17 Mar 2023 at 17:23, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > Unfortunately a bug in older versions of gdb means that they will
> > crash if QEMU sends them the aarch64-pauth.xml.  This bug is fixed in
> > gdb commit 1ba3a3222039eb25, and there are plans to backport that to
> > affected gdb release branches, but since the bug affects gdb 9
> > through 12 it is very widely deployed (for instance by distros).
> >
> > It is not currently clear what the best way to deal with this is; it
> > has been proposed to define a new XML feature name that old gdb will
> > ignore but newer gdb can handle.  Since QEMU's 8.0 release is
> > imminent and at least one of our CI runners is now falling over this,
> > disable the pauth XML for the moment.  We can follow up with a more
> > considered fix either in time for 8.0 or else for the 8.1 release.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> Queued to pr/170323-for-8.0-1, thanks.

I'll take this via target-arm.next, so please unqueue this one.

-- PMM
