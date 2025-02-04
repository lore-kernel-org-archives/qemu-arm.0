Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp267336njb;
        Tue, 4 Feb 2025 07:03:04 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWVXMY/nhQ1bK4YxjINupE6j4cNmkd8laMn/dgzt2cpA7X6hJSuGd+osU4O/mFoI0AiUXxW9cORLDgZJg==@linaro.org
X-Received: by 2002:a05:6902:11ce:b0:e33:67d8:654e with SMTP id 3f1490d57ef6-e58a4bfd22fmr20187112276.49.1738681384600;
        Tue, 04 Feb 2025 07:03:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738681384; cv=none;
        d=google.com; s=arc-20240605;
        b=cWTE2uQ/TuBPmaFQmCwWfYtI1sUJrnjKGl12VsysRssRSNntvJPF2/GSUkPL2mtmwU
         sBDMqC0P8Up7oOyfIRVp2yvZtKGU3rcUqZ6LPJhWR/LprCU8JaGmhjtVfebak1atVhG9
         Np3C3hY8HxJKRK3sU/DsNgunThTkCryMRP/LOi+N2PWahM6Uj8X49QsrfwmpHQZP33h7
         RHTJgc3HfRPSx4b8nLBkcFCyg7HRnfIODdCbV1q+g5wRsJPX15GtYiAhiACbhLAQwIK2
         V60WP8P5LyZ5MGWyo2vdFWTihyvtgP1S+pagGaIZU8XyIIjtBXrAkkixauxBiuxbNmY3
         FmUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xVwOgDmF4gi+qCbLpHs+nCN3M6GyYgsFZqSNBxemEzY=;
        fh=e6o65q/BrA1hT0oDGcRioHtA2+dbZsvnEwexCpN91as=;
        b=EOxGz/Mrfi2Hg45isbArLGcqPasFcf6yVZ4l1X+S2rSDYhPfQs9qbdU3EevkRMd69r
         MvK3Q5uV5ncJCgzZSnVA5gYDC9Zf5npWR73X1PS/9YO+FGtv615s7KmCD+k9L2eZx6Dx
         BzMHaRP1XppgaKLa6wyU1S6k70jFPgRTKklYIPFQCBW/BT8sXMnBtpcH8e2nTQcOg2E6
         /AH1oReN1AYZsyn4bV3YrEWdi0hedQnmQ6D4+3i4xCzco+qm/Jty29wWX4f0eWGX0Rsr
         qtIPyHNLZ1q1f2fqbj7gKjhAm2TC6Li8CKS4Qn80OAL6GG65AHe1E4b6CquuIa6mfWCL
         BY/A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ADIeQ5Cw;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 3f1490d57ef6-e5acb2fe5b0sor4716128276.7.2025.02.04.07.03.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 04 Feb 2025 07:03:03 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ADIeQ5Cw;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738681383; x=1739286183; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xVwOgDmF4gi+qCbLpHs+nCN3M6GyYgsFZqSNBxemEzY=;
        b=ADIeQ5CwiFrno9F7WQf/kHPBlpB8iIxElibPgva1jlEUcrqiGEfoh23Kw6433Y3XWK
         DEfQVciHsuJXo8dYwXfyMl6TwhkpZQE9MFHSfNPGJhJJkBcc4PxjO2VDN9B4mduaYE4/
         E4MCH0/y6GiePqS2hw5kEGKO9zCuCAlZ1zreeF45dVPV+gQyiO5VLZa9kfXe5gXVW6xy
         E+V/r2nge1ER34jHZJypApgL5sbnYOkTr0OQEICoXsl+BomWq5U+tomg/LyIK2+id50u
         esQK4UJs1/c2+CPOueZEYgRulcic4L2/PjI9I979eHnyCR9602WW4KI+bn4Oia9L58pq
         Nvow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738681383; x=1739286183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xVwOgDmF4gi+qCbLpHs+nCN3M6GyYgsFZqSNBxemEzY=;
        b=nOeDTGmbm60JKfyys1WauDYR3zy/HvboQAlVqNmgNTlbJ4tir4qkoiHzaUHHxQKL9t
         fVRsDjwSGVibY1ulI0TZclg3iFz8GyiRCTlcWI+LYt15cAL5m8Spx7WveUSu0rfw8R2R
         VWDS9SPJBEb+h6Fqd+usUzAFJg09dOQ+iRfBYtSP3xTULFsPY3OE6aHGFVL6X58//Ro6
         ky1Q/MhM4BlZ+xR31FlNF/GZW5Y6Jp2LA1mXIHlPmdIImq9jPzBzywJLVTuX7pnsWR2Z
         ic6SrUV6qMmSQgJLdNvhxpx9nRcXccBUa3AY/OYYSN+PpoCFiunItfh11kZNvYQv0qtY
         KDNw==
X-Forwarded-Encrypted: i=1; AJvYcCUeh89qoCkJZ18ZDZzdBLlFDXdzCGGqck3dzSNdPW/8WPZoZLpeOxETxl8djDYAwKuRZPg4gVXf4czCNg==@linaro.org
X-Gm-Message-State: AOJu0YzqNdPyQfBqtPtWEGxWNpasZdxcmuLJjWmOxpc4LvQ0cwVGsRCb
	vS9w74tpaECrODunl6DPIuGtC2GBXUPuUo9rhT5xoubsvvFTOpCiDnmGD1B30tue1x9aM6UHy9r
	yadoFcRsR4I9b503/WmUI8jeXuXeGp5XnAzlm39/8
X-Gm-Gg: ASbGncsYRSfymIqiYZ/NZNNzAPufbmyhZaRRnH+g1QU/mRqRgaM5G/LHt/CgGBAzFLj
	8PSD+WGOgNtjh/kFJHmJt2Av4gjQ5EDNSKpWdrEIXEZi6XBl3xWr4Qn3S2BiM+V0BLS8mLZEFlw
	==
X-Google-Smtp-Source: AGHT+IE2+k4dNWOkjUTNBGQCMdedxo5hXuTuw4YJ3BG8iG4wy/uAUcm0YywyQycDBV42GKSiyvDT3lZDO1LQJv3KK84=
X-Received: by 2002:a05:6902:98d:b0:e5b:16b3:ed03 with SMTP id
 3f1490d57ef6-e5b16b3ed8emr2138400276.32.1738681383020; Tue, 04 Feb 2025
 07:03:03 -0800 (PST)
MIME-Version: 1.0
References: <20250204002240.97830-1-philmd@linaro.org> <20250204002240.97830-3-philmd@linaro.org>
In-Reply-To: <20250204002240.97830-3-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Feb 2025 15:02:51 +0000
X-Gm-Features: AWEUYZkhKyrTk-DrJEK9mRsV5YS6tnbUjpd1wInUYBoaRRy0O3OpFYDsFvLcKMQ
Message-ID: <CAFEAcA-q-SBmM8QSfMvNwpiYohzjBRTyTuYc8fW1-a4=25YpQA@mail.gmail.com>
Subject: Re: [PATCH v2 02/12] hw/arm/raspi: Merge model 4B with other models
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	BALATON Zoltan <balaton@eik.bme.hu>, Laurent Vivier <lvivier@redhat.com>, 
	Ovchinnikov Vitalii <vitalii.ovchinnikov@auriga.com>, Jared Mauch <jared+home@puck.nether.net>, 
	Fabiano Rosas <farosas@suse.de>, Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	devel@lists.libvirt.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: GuFObP+XvMUj

On Tue, 4 Feb 2025 at 00:22, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> Except we alter the device tree blob, the 4B
> is just another raspi model.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/arm/raspi.c     | 114 ++++++++++++++++++++++++++++++++++++-
>  hw/arm/raspi4b.c   | 136 ---------------------------------------------
>  hw/arm/meson.build |   2 +-
>  3 files changed, 114 insertions(+), 138 deletions(-)
>  delete mode 100644 hw/arm/raspi4b.c

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
