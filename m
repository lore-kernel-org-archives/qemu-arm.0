Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp438686dyc;
        Thu, 3 Jul 2025 03:32:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUCNpQ8F0JJeIg71AkYj/+LV1e7OM9HoH4kV8+QAdhGnmjnV4zVKTXYm/HAU61OWeM1heL2W12d4DCVsg==@linaro.org
X-Received: by 2002:a05:690c:4442:b0:712:d7dd:e25a with SMTP id 00721157ae682-7165d123290mr18869717b3.6.1751538774684;
        Thu, 03 Jul 2025 03:32:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751538774; cv=none;
        d=google.com; s=arc-20240605;
        b=Vh34BMUkKKa+lePZzq+H3zwH5vBvdY0cl8vEEachUv2X5eQgek2qwbsSwQ/hS6/jat
         +4uVauXdfGbkbSdXv/lUtZC6cn+f6qj465/eTaJMZzfItcOaxURgWx+Xw6sbUE420vyv
         qsX5iAu2GFWmBAx5ljBuPhysZcR2mzQX12MCsvM/3jECFwbdNRqZyiP2w2psh1i+nURt
         fAc+RxmSPxT1JdHhKguCpijmPZhwA9q2Ruwf36fuyMd/YOn/WUaOVwzQduIantttfTEE
         U0aXMxEJY2buaQa0McoV8pwdD7kIK9C2D0l5eHfW4fXZi/FXORxz0UNWxfIQal3RwK4F
         1uaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9JFhMaeEwwADu3C6VXIiYJoBN4oIakfDgczE9dKM5mA=;
        fh=eiwJjvTUWvHlJSDSfnEjwkk8ZNMFSzaoyg3RT0/jgbY=;
        b=HvZmc3tYwhnt9bj+ZfItvCfT/sHE7YPgdr/NGeObU70rm3zLWAA8qjfXGige/Yzw4b
         A5717VsqNMuNkni3XgsoLdEJJSjL/2R7mRRC+O1Te83roYMzKBzfAKk5IVZ54ChTxhGR
         a6sThNJfhiqHipEtDS7t8M/QC4i0webV519X2lWuywLUcd6i86Dt5u3RQZ/I/6w9qfAc
         FBBpQmwsnfODjIP7DZeE9kzyotINlL6W1CtGpm4NRctKNRDFkh/BvSePVaZ55TBSefig
         Z7bxlXf66cHCpBfTQTt7d8Ks0yU4gUJrvV4sBL+dVA9DAoxn14TuRQEss2+yzM+sAMxV
         18hw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YkmddYQ+;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-71658996ff0sor10179997b3.4.2025.07.03.03.32.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Jul 2025 03:32:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YkmddYQ+;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751538774; x=1752143574; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9JFhMaeEwwADu3C6VXIiYJoBN4oIakfDgczE9dKM5mA=;
        b=YkmddYQ+ftDNOEf91wn1ExzKpZrnlFhZXtpAvtIbXtI4rj/0wuB6kRZAkgWRepdDMM
         FNBuG7chPuN4GO9dCa7IkfwehegIr8F7gqrLbhGaCqiTytmmyq7Y65SxDQYO+c+55zhM
         hQfN33xPzzC0gnmtFhEkOWpCrNlf6KulpxGhkyApDua2u6NS2rN676VRC/GIO4p7gqAR
         TZHqXCr/Tulf/N5l5lkYr686dnlnO72vtduQ2tN7Ps/jeC78tZfxIY2uDLuj/0ROsWxP
         za5ri3FVcM6nKzdvuw5neDw5O128M/b8fYJdIgKXSzYUh1qtHOSBzJo1z80iB48oMsyx
         ycQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751538774; x=1752143574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9JFhMaeEwwADu3C6VXIiYJoBN4oIakfDgczE9dKM5mA=;
        b=YNTBrtdUXZfALFCDot/PlxyMcPkd05MHxmIjbXFvXScf9QWNutJ3HK7AgsO2lJXQAv
         46DOSJ1WUgj5YeFxi9waK3q19R+9zvuByNyC1245iikKyyGT/fdTZ/rE+w5WepUHMieB
         QSVyvgbWchnPEm3tWSxv7HbuBFZb56PTZs0sHOjUgjtpTAkHNWZWiyF4XI/FJN6diUhD
         DNLXgbsEu1/KRF1Pi9vKglKp7opzOZVB275V4GsX4pVG7wr304WPtuKeBcNpvGywgJ3+
         2wSd4aqxRYH1QZhsXvEy4WLv7EDjOy8PxBAAjt5FRFRZ/xMbLrWsjqbh7Kz9tNw5nM02
         KKOA==
X-Forwarded-Encrypted: i=1; AJvYcCUt+yIfo66ohL1UUdKzg1dKQZDZlXYYOewe+d3YNc3RSupo8pUVmmJLrJwyNKpYELyrfg0T89qQc9nS6w==@linaro.org
X-Gm-Message-State: AOJu0YyTNO4Vk2nG7kjvfGEw67sSS6RgmR41Q6CP3QuujXf8drTqpN2A
	KZ8fNyk3UjZJOKr44z9AcKaY4n4RX8xmhMdVBRPP9KfJXJCol+di4JCuPa7mYTw4lJyUP6BWBUk
	l6BCtCAS9RyznjHlb63l/a4qSnxYHOeNG4dbrImYTd1iB
X-Gm-Gg: ASbGncvLnDwVTw+ScssCJD0dZ5ZYYGOYT+X/Tm2N/5gYXmjdXRqaoBB06aHT+nCJIDL
	ICB7o7uSKbA65mTV9GTJN3EWPGrCb1VTz+8vP0K7e+lYUHoSyUZ8KIjM3YBTQ2qJiRCIG8TIRiq
	LoDteFiRXWAf6qPwRUzqVRNrc1ZiCvsckISbfdpnTlO8qKeEH5lW5iCPE=
X-Google-Smtp-Source: AGHT+IFlCkxUMEtVjvCjkmTevhlE7cT7fpOUj1ITBrtJEyvH08vmJvsJPLTXniW+wz4A/Jzq9EvrwPOHSl3kzH5nnt4=
X-Received: by 2002:a05:690c:1d:b0:70e:404f:6714 with SMTP id
 00721157ae682-7165cb464b8mr20715487b3.19.1751538774260; Thu, 03 Jul 2025
 03:32:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250702123410.761208-1-richard.henderson@linaro.org> <20250702123410.761208-59-richard.henderson@linaro.org>
In-Reply-To: <20250702123410.761208-59-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 11:32:43 +0100
X-Gm-Features: Ac12FXyjpsIxNaUm7tI5jH_cl4fv0YMu46W-I69aQJA9D2iKQ7LP2iWMhUoiRQY
Message-ID: <CAFEAcA_-Z3SX6Pw8vsEE6MDq-WZVccOP1bS2Kn4-VNG-ub=REQ@mail.gmail.com>
Subject: Re: [PATCH v3 58/97] target/arm: Implement FCLAMP for SME2, SVE2p1
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: YJ5dRGu9Uafv

On Wed, 2 Jul 2025 at 13:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is the single vector version within SVE decode space.
>
> Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
