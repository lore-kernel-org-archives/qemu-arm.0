Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1544580wrd;
        Thu, 30 Aug 2018 01:39:54 -0700 (PDT)
X-Received: by 2002:aca:3507:: with SMTP id c7-v6mr1693621oia.46.1535618394270;
        Thu, 30 Aug 2018 01:39:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535618394; cv=none;
        d=google.com; s=arc-20160816;
        b=Ux7rUzKHxZn5Y6jp0EJPT6NrpcJacmJhJJPMf1/BAj0kUUXhN9pTVepA6agd9RyVa2
         8/JrRdL8xFybwFBZi0W+mwMabFRX5iVR6Y259Wnn6zSpXfUBwxTEcv1ha7NzjUz9vS8a
         T5OAWRE/rQfppzpUWSggoTvZEbtTKOAjcwh/DUCQHtSeOlh7hkp2+cpgw0tYTI+v54uU
         MT635BejjD1/ksxmNYcPod9lPFGyEtmioAm31G0N1uz3lFh7f79szpkwu7656S9RzkJ7
         clJpOMO4d53aNmWaMdc/P2uCz4L3W4hL6AmY1ZMLYiakmK2bkboZWoqWIHWDG+hLpKqi
         KlwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=BV2bAWN6WZfilL/F324Z0KmZKso6mTo7oTp+TH0T270=;
        b=dtv3I7bwezVnKnu+XW5GT4+qMGDMv8hpfVcXEvyH9x44ldWEOBKUGW0YzxrQerFq1R
         JeLo81vGoLqX48xPrMUJ3uAzxgCZIzgyhj6RcNrXF2UimrRn/0iD3r2TgP7+SWAFT2A1
         6Cl0tZS+eYKhw4UOMBqchFxQvuG+X9mrHM8xazysDCSh0khC+7pVFSjlVhhmrjyD1uQU
         MXafuD8FFuit+BzcG/BVTeW2zwzh8w5pQyo4MxE+02L/k/tgXKFJlsC7F/Cl+Bm/qCdP
         OzrqBH12O8Wi7Jf+rpNlG0BBKycfGEIFZhPRpkt1gWCi9+CfXYC1ueyJ94HwBdMVIPb4
         j4ag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="hW1X/bLw";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id r11-v6sor5239908oic.133.2018.08.30.01.39.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 30 Aug 2018 01:39:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="hW1X/bLw";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=BV2bAWN6WZfilL/F324Z0KmZKso6mTo7oTp+TH0T270=;
        b=hW1X/bLwxZUk556Re+OImCi9XghLNlKIjgmTEHO24l7Cug7N+YMjHFdAoY52aaoEH8
         e/rbYHZdJIotmgneS7VWhPGsDgrUJDbfbYd1efrltSH1GjYasbMjAXQCNoZnR99ZUvZC
         iJj082/RG0aZn6k/nHleFqkSALW5Us74hDOH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=BV2bAWN6WZfilL/F324Z0KmZKso6mTo7oTp+TH0T270=;
        b=SG2+KklIC6X3qX9M8FtBWnnfai2TNuJFUFji9UxMW52UWgp0ehPFaPds1J8Nq92ws5
         SpCoAJGV04JfvY8ImwGcmHDlom8J/JtHdndqI1yCFkSAt8BTO4lc5KmVxNE/kUqj3gYl
         fJJkCjl0b0KpVF6fojoyg2BoE+7QahoTsCfBtFJlLMdmOYujd/newqUTT/nyFKVnssep
         dVz/1evHYZ2lRJhE+MhQWnZXHCyyPqNeHcb8MUk7vhZXVM0axNZMFU0CKjbDAPyI40Yn
         p9RFgG9U3vBTtml+X0DLmPQCnUWQ40B0UGPvVUKs20ekGd9eXZG1iVtnhcFdEPgpqeVl
         SKSA==
X-Gm-Message-State: APzg51B5xKcmC5lbqsoPtD8+257vc5zB7fuJGEej57DP9kcpsZMFczGu
	hnhm+UVTU7S1btewrsZ1i0nvKJ9si3GtC9AqFzWav5NA
X-Google-Smtp-Source: ANB0VdZWdDpZj+45pPOV0C+bRrhh0Ic4JGYVErgMMo8W5opUD6wLEDbmX4mTQqa1YyFGAsAuUkUL/t4LH/bjFsXgk7U=
X-Received: by 2002:aca:d946:: with SMTP id q67-v6mr1466802oig.212.1535618393971;
 Thu, 30 Aug 2018 01:39:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 30 Aug 2018 01:39:33
 -0700 (PDT)
In-Reply-To: <20180830083117.iekobw7l3arkt24m@bivouac.eciton.net>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <CAFEAcA9hivJzqksiSZbco4+EysYj=_y0t3k_L7TobxNPS8T2dQ@mail.gmail.com>
 <CAHmQWvC4Kp1CAeCe8ZTGtSeG7fnT=Xen4GFKfnhTBWUCJdQV+g@mail.gmail.com>
 <20180829134219.cmyqipnvukk6k2rp@kamzik.brq.redhat.com> <CAHmQWvA5t7zbbDDM0UvuKSL_Z8ey+x+vOGZumYjwsq0FC5AHGA@mail.gmail.com>
 <20180830083117.iekobw7l3arkt24m@bivouac.eciton.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Aug 2018 09:39:33 +0100
Message-ID: <CAFEAcA_s+9-4PYHyx_aAnxwt4e=VH77uBG7rC4JA++nOyjAaPw@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine type
To: Leif Lindholm <leif.lindholm@linaro.org>
Cc: Hongbo Zhang <hongbo.zhang@linaro.org>, Andrew Jones <drjones@redhat.com>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: Nd83GT8kSg2M

On 30 August 2018 at 09:31, Leif Lindholm <leif.lindholm@linaro.org> wrote:
> On Thu, Aug 30, 2018 at 03:07:29PM +0800, Hongbo Zhang wrote:
>> @Ard, @Leif, is there any possibility to remove all the DT nodes?
>> On real hardware, how does UEFI find the memory size and CPU number?
>
> Usually by asking some form of SCP/PMU.
> So until we have rock-solid multi-cpu-instance (making terms up here,
> there may be a proper name already?) support upstream, we need to take
> shortcuts.

I would expect that you'd want a "faked-on-the-QEMU end" SCP
communications endpoint to start with anyway. We have one of
those for vexpress, for instance.

thanks
-- PMM
