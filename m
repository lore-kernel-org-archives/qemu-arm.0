Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp331850ejb;
        Mon, 13 Feb 2023 08:10:36 -0800 (PST)
X-Received: by 2002:a17:902:e808:b0:19a:a5c4:afe9 with SMTP id u8-20020a170902e80800b0019aa5c4afe9mr3012176plg.31.1676304636471;
        Mon, 13 Feb 2023 08:10:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676304636; cv=none;
        d=google.com; s=arc-20160816;
        b=HqPJcOpc8ecvY7Wi8aG1uhgCrVBRjCiDAAhTYFDgwNY+QGVRBM58N50ihL2WmlG/Vl
         R4ID/+Teq92KnLWJ+U1hME5FjRC2CUucgsFmkpczU4dt6sfr23aWGFbgWghp4wQV00xg
         uPGgvA86KQQVn9CW/HpTzrZJMT8UI+JU1Z4bv0UjDVoE/bQ1n9trlPL9fF9gujdZg+Jt
         0cTRLHTzDqvIP5Kc0HCUPnoIinjX/4txNYftecFPVC9OEdnIzE4/6KXfKS/a5KNNMdaq
         Yv4KXtTdASQkrC738SZpAdg1R4Knx7N3IegRkFt/raIF1FOAOmJ27bqkP9v4vlCeXm4e
         iMGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Do+616PQhElMf57hM1MZQYkSUipV+Xi8qUc12DjFbSg=;
        b=KE96yeQlcfXOV/c07JsrgFnNXhzaE7KUU+RiG3d1Vy29oAUhWzxuYUE4c89KT9L/0D
         jolY6Thq5cCzOEXGbjP6Bm6dJjO2AXGV3GWQeeFkX5Hl1NjUvl2yk6J1NKOt/rU39IVx
         Fo7nt/8kY2UopZbiV7oCrtjuyDokDGMueycJLqvC9zly2ZMXQl8yTGNb+83ynX6OdDZ6
         KgBEgREaIVBuGsrkEZErrAHcyNbXBnXCUY4ke7gVLTec1UkyedF/PwIBnESwFPIGf3ty
         GydgNUJyQwNFx0+OsTs9iog01gtRLVX6IgJ0VFAEsoE+0D6X9mlT5c1sFjDl4F0zShVN
         XTLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cOe5rdXY;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l15-20020a170903120f00b001992aa80a42sor5370336plh.67.2023.02.13.08.10.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 Feb 2023 08:10:36 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cOe5rdXY;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Do+616PQhElMf57hM1MZQYkSUipV+Xi8qUc12DjFbSg=;
        b=cOe5rdXYWLX3XCwHx7/Ne8egMNTm4dRXSg+CHvPvIo6Ej+4wMVr2mknoHjzVg5RJJf
         Ta8zYZf5jKf2Dw2NVvC9OozLzRUmNR6vPswlNcYbkvleP7cmZMWbk1my/wFqACCHXNHM
         fu8opu0TxcOuDJ3C9JYaeOwL/px/kDeTdvPPvrCQtY+QEksd1wFaLhywHsbAJKFntc/x
         +dk/9UBIEFCYUCmcGvI0xvIqsHlhw0FQ9ga4dhQwfBEzTNoSYpNLFdnUBvtgPVrzYQO3
         gM29uZeh9E0d80o/06ihfuzFRC+Y8cpxh3mfFXaqtxo60g5v6Gm6IwhxjM9q063TyzOT
         C8Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Do+616PQhElMf57hM1MZQYkSUipV+Xi8qUc12DjFbSg=;
        b=HOSuxrQQ9rbAgJD9mdb7mb/aRxeBe2L1t0jXBFIUeSVaYHnlUvUn2phAeRlcDr/9n+
         JvhKFtQ2OKOxqt0pyX0cQ65z5EmL9DuWMRg2nHulz0uMENdQgLNJiuLrGouu8PkwKy2T
         cKrm8eIUO+JYSJmLvfrAGHmjt81+czX0gsg7Eub1XYu9VkHUosdZbyM+lVGkbkDIOmoK
         z2Y1y9BnuCXV4+s4XOt1pj7KUHBWUbXN+Gj/aSfX1Gr3sgMCocOqBnBhf93uAgjYDMuB
         UpDPKThDwd3uee4MgZv4FwY0dTEdaoWOhEvQMmKIFdCrz7Y/+jpn1Xohi7nxLSEV/Zv0
         Vcew==
X-Gm-Message-State: AO0yUKVO6qRqQ5r3NyPBPvYSHLlhTDy+h8gt/D3ZrNF3+K3f2bzXi4bI
	OxmHY4pYRGDugfyxcGnU6L9pYAtbi6Ti/scSPYmEMtvr
X-Google-Smtp-Source: AK7set/vVoK6jwoKI98v+VrMQ0aaxHGmoeHlD+tkRZ9Bmpy+qc8/h4wnv13Gki6jj3hShdtqkPn/GW5xLhiOwuk9b6o=
X-Received: by 2002:a17:90a:15d6:b0:233:dcb5:ee15 with SMTP id
 w22-20020a17090a15d600b00233dcb5ee15mr1391459pjd.92.1676304636004; Mon, 13
 Feb 2023 08:10:36 -0800 (PST)
MIME-Version: 1.0
References: <20230202211129.984060-1-aaron@os.amperecomputing.com> <20230202211129.984060-3-aaron@os.amperecomputing.com>
In-Reply-To: <20230202211129.984060-3-aaron@os.amperecomputing.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Feb 2023 16:10:24 +0000
Message-ID: <CAFEAcA_nmodWa=t8Y8Othq0K_x8ZBe1R5o_iyVjR_JHJ2V3kMw@mail.gmail.com>
Subject: Re: [PATCH 2/7] target/arm: Implement v8.3 QARMA3 PAC cipher
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	Richard Henderson <richard.henderson@linaro.org>, Vincent Dehors <vincent.dehors@smile.fr>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: Yj+5VqS0oYpY

On Thu, 2 Feb 2023 at 21:13, Aaron Lindsay <aaron@os.amperecomputing.com> wrote:
>
> Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
> ---
>  target/arm/pauth_helper.c | 48 +++++++++++++++++++++++++++++++--------
>  1 file changed, 39 insertions(+), 9 deletions(-)

If you move the stray bit from patch 1 that should be in this patch
into here, then

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
