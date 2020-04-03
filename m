Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp985433lfi;
        Fri, 3 Apr 2020 11:21:23 -0700 (PDT)
X-Received: by 2002:a9d:58c:: with SMTP id 12mr2276445otd.156.1585938083522;
        Fri, 03 Apr 2020 11:21:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585938083; cv=none;
        d=google.com; s=arc-20160816;
        b=qbnA+t2SIaAQNOQemzy8dc1lSHpU9sMHkSHGWL4OnZGeEarvznzcDXxydGaL5/0oRc
         kFdzPf1Ng61iqaHZYNMzLZwQRpGttLm6kzL18baN1kjs2cLaPEZejbRsdgk653YnOLiZ
         x/2lQjs0NT5436F7ylfL7OZWwvzAeYsZXs7BamU5p17t1sRfjyYfJ7N+qgNSYTd/0SVO
         ZZ6gm2DkG/xg2emfW9+8tfyV5iH+1/Cq8kQMTM+gK9p6yKR/C1S8z0B7h2nNkV11tMHv
         q2jcZXopIx3Xzs432YzE8gjACJGZ5J6Jc07U5dzCbA21/0DgQ5hMY0xlaM0BXTGXyd+o
         NIxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vLKZheo+falulKlRLT42MgwKmcgpnY7d/Pc4nfpmDwA=;
        b=QF50L2nWbgKIaGfVe4XkzdbbkigVZZKVAvjiDIqOYYAqZMQyvHDIjH02jKiReShnli
         B6O4qCiOjSrihWxI3J6E/ASr72A3OOmeVH/PAv0JnH6hVgiE9deGO1Lg6INJ8rnnkm/Z
         Q9UJrYnRmciKeQ0pcc/cUgkX8Yzh+uNJD0Cx2A2K9eCjGjc3dqXFdaZ+X482uf2GthQR
         ce3+qJhvqjIu0DVB9ZiSlckZcaLH87y6EszWB0V0pK/ENSknXaP6V6DWT0XKEpDQ/HD4
         DwAdgkoxaWeryCi+NJppkkHUHKn3hJRE6VDRZ0CKGCPNyxXVNirrT95oK2BheYftFdaV
         /rsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pUV9AdwS;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id x138sor9859701oia.15.2020.04.03.11.21.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 03 Apr 2020 11:21:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pUV9AdwS;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vLKZheo+falulKlRLT42MgwKmcgpnY7d/Pc4nfpmDwA=;
        b=pUV9AdwShAwVdqMEZqxP+ABC/F13Xx4BPA2BIfm6ZQzMPPsK+yRsSzvmTNExIFFJ/n
         7xq8AOEM0ea6F/OIaiPM8aFwAeu9Nzd0so0FMrdTMITApuxLwWQMnf+F6AJa77/pz4NE
         t35MnQHUI0+8qh513b0CwxFef7E2cdEtomgtpAFpI4/lyfB9qNyIzVXyvNxaPOq38V5M
         obN877/wuI2XnQ+vKAJDXZ/08C+gRuD7u4kBJB1L7Dp/VMXbArwGdT9cU9rgpFoExPQC
         1Y3UwpVqq8N5NnoaPWrT3SVFTcsrzF1VslK+zkJRgnw5liUgH/NIyZ3RsMd8b5sGLgoa
         I5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vLKZheo+falulKlRLT42MgwKmcgpnY7d/Pc4nfpmDwA=;
        b=fBdShshaY1qClcwh3BI921aihDY54bVNwcYW1kdvn+3+romCC8vZXPTRzI01HJbRPh
         rVYyhKk0FI80WjBSlRZczv/9GkMKNa0Lzx2qZNUcwRWiTUvO9G5mJRw9wYhbYr4azmmJ
         v5Ew764M7UMmPMv61UK80Kod+9YZNFSoJ/Mm2bSeSHVmcfihBwXUyivmGDNWzFRDwCMS
         ryg2OwLNnQEUWD2cu1IU/m509lpihtYK3Gmus09DQYaw4bN5CurF53plwEFGf6pmOuFh
         F8Z3nbHxBQXPf3Oehd0bHEjGD5L8W/oO53rnG6SPuzdu4Ah3k/GRVLaAuZfF3c6Pw1Cm
         NLYw==
X-Gm-Message-State: AGi0Puau6crMS32zrVPHxyCIwibKVsR+/Do3BySjEADQJWNKLs7uBhAK
	wg1Wk1RmpDtG1ZC48Kz3kUDa21yRzwlnHYl/+II0JpsxTi2wpQ==
X-Google-Smtp-Source: APiQypLyQw/2tJEt/8xBo04I3bvvfux/6I3Fd9A1BiSS3Ca8jwdvvHPqBRDEA8gssM375AdOcMbs1wgno9iy7+OPDP4=
X-Received: by 2002:a05:6808:8cb:: with SMTP id k11mr3876593oij.48.1585938082922;
 Fri, 03 Apr 2020 11:21:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200402143913.24005-1-alex.bennee@linaro.org>
In-Reply-To: <20200402143913.24005-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Apr 2020 19:21:11 +0100
Message-ID: <CAFEAcA-pw+xJnsxhG6N2ibWH0K2McqGQnJ_b5qAzWBa+TV8z4Q@mail.gmail.com>
Subject: Re: [PATCH] target/arm: don't expose "ieee_half" via gdbstub
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 8XDPQkes1hfF

On Thu, 2 Apr 2020 at 15:39, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> While support for parsing ieee_half in the XML description was added
> to gdb in 2019 (a6d0f249) there is no easy way for the gdbstub to know
> if the gdb end will understand it. Disable it for now and allow older
> gdbs to successfully connect to the default -cpu max SVE enabled
> QEMUs.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---



Applied to target-arm.next for 5.0, thanks.

-- PMM
