Received: by 2002:a17:504:5c6a:b0:1be9:327d:8ee3 with SMTP id dm10csp178698njc;
        Fri, 21 Feb 2025 02:10:46 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXue/Dc1iG0fgmYb4+tUQQJf+pVSnBF75xv8X8aqex37fE6Ei3NFLQftlAVt8589f4TP8gkSS8lZt+PVQ==@linaro.org
X-Received: by 2002:a05:6000:2a8:b0:38f:2a53:1d78 with SMTP id ffacd0b85a97d-38f6e759571mr2459606f8f.10.1740132646581;
        Fri, 21 Feb 2025 02:10:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740132646; cv=none;
        d=google.com; s=arc-20240605;
        b=jLtAdMJB0a5Gyu9S++EspI453htn3Tat3syh5g3iu/UWGBO3sl5/rw2sXlqdAPXrP9
         P5YfGyWcRXNTNm9tu8WwDmM69pGJ9ztXkML8P5XnbXAMn+D/xVae3Pe0H+iiS3hwSzpq
         yAtd9+dM16DlUiotcTvxu8pwJ2TP6LxEMzmGiMKaxw2oLIj7hm72ctjxaLp1Vb1lc98N
         NWR50isKW3STO/NpMYmMJGwaqd8V+0N5819al2t/o2ytyJXs1IJF90KsLmkeAQgs+7eR
         vp9GFEiImb9msQ28/lUhMjLpWJAYq/XYvJKBIPqbLAce27RaBM6gOWTiihBmZF/d3ZWw
         syng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=FP8RwPyV644IP7Cxg0fHu3PhVMjCMcjQhZCVS3A2oyA=;
        fh=UUnqYdFmA6w98pPfHpldhwloFDqF6OoMMFLOju/ej2g=;
        b=JFcEJEFsszjhypix9PFtsaVIkyCd5nK4KXh64j9mP8eG8JagY96lmeXT9zE7Dui0fl
         +UZNXzPa2pHG+h/vjhKujCVW14rWNy4ZSoFzxVvJBjX1mKtJ0C2lPPa8uzhh1O7l0V98
         Eil0pZtsWW8wqhfAHZY8WGhWEaN6oQZU1x7BFeUfzfIhZHPsE/FIZ6LIFjH3asTXa9Hr
         L4bgA2H50ScawGShlYogdD9uD5Dyvch5GzIufpJjTfb79ioL/urEKzxLJaglACky2H0i
         aVx7plWZtu478JSCjmdg6b+3+HhopYR3FYBdmQv4mS1wuKq9wTnRo/b0f+8JDXXmpcel
         2+Ig==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of th.huth@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=th.huth@gmail.com
Return-Path: <th.huth@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38f2597609csor5729643f8f.5.2025.02.21.02.10.46
        (Google Transport Security);
        Fri, 21 Feb 2025 02:10:46 -0800 (PST)
Received-SPF: pass (google.com: domain of th.huth@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of th.huth@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=th.huth@gmail.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740132646; x=1740737446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FP8RwPyV644IP7Cxg0fHu3PhVMjCMcjQhZCVS3A2oyA=;
        b=PN3vhDKBxD4Ly47cOkZ3DL+1bUojj0LxWXkqOuSPtEoSrEz6mQDKJLMLFpzJjnifcS
         2eN4VfEZvt+JumWTVruin2ckogaUtBJpNtKgCdK9GKoTsLVO4h/jYEWJ7s8jVShsvJkg
         h4DjWKPxJ+tU6fPx0jFDxcHsTch9zxkZzTPGw5UdseoQTpF889S4eaPXu/A+99h2/v56
         farK/UEvqBbxD4S7+hCwh6S2Ngl84/T265KPveYt4czaa0fEOtRV6DmLyI5S+U5cgU2o
         T2EmEVlkcv6+4NYiuAAJybJbwdUjBcFiaxai4iI7h5cySKg/GPuIrNbMvOlq/vzwm8i4
         8IPA==
X-Forwarded-Encrypted: i=1; AJvYcCVmjC4cInIrsKb4nKNFhik/yC2kdtMzPpWG6+43hiHImlckI2vr+7UsUa9AIsTBbTObBMBbHhn1RiOzXMSiSw==@linaro.org, AJvYcCW3IsK8UYKXO83Wp2TVUtT+BlVuLWIfYDB12pvH9/g1gO9a/P9UvXrKDg3o+wgswws/cyQJeme62x862w==@linaro.org
X-Gm-Message-State: AOJu0YwD6Aa2krEk618hOJy2iLvSGPb/nppaEn3L8wu1934MgNMuAY9d
	KaC/rzW6bVPMuS5rFSPOME8Fwk+W9f+hcwPdE4OYFLk/4cyUPXl/BQOFUUY5
X-Gm-Gg: ASbGncs+3aEFtB3/FtZ2tdig/iuuYNB6iC6/NETKeQyIro2I+QGZti1IhhLl0eGRtR9
	nntgIzuJ9650YeCbLZP8R6VOXrJam/3QnzjiqJf7X1/f+wzk7mRcZjSvgncy5nAfa5siYtgE8f6
	fjYtV+7Dwcx77J04lxSr8SdehCW+O/kL2RKqPT5UibDtE+8RlA57DJ6iDNnJhyoD1HLZGiaO7nX
	1yhjj2S/4gN51RAens2tAkrgSpl6G5rVlUe2AxVpoJvw/W5+4SPSWlstVUvmXMLKd0/DBBpIJXG
	5kQ4w2H67HkduHA2D/MhnW5KRixMAwH2jOWfv+qdqwWNS8i8
X-Google-Smtp-Source: AGHT+IE6LfnYu4sY5P0Se25D5TQSkvvopjHqNUh7lEcQ+f3F8IeJZabezMNS0bp/iplA/4W3CqXtnA==
X-Received: by 2002:a5d:648a:0:b0:38f:43c8:f751 with SMTP id ffacd0b85a97d-38f6f0959c5mr2795062f8f.35.1740132645751;
        Fri, 21 Feb 2025 02:10:45 -0800 (PST)
Return-Path: <th.huth@gmail.com>
Received: from tpx1 (ip-109-42-51-157.web.vodafone.de. [109.42.51.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f8730sm23519623f8f.93.2025.02.21.02.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 02:10:45 -0800 (PST)
Date: Fri, 21 Feb 2025 11:10:43 +0100
From: Thomas Huth <huth@tuxfamily.org>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau
 <marcandre.lureau@redhat.com>, Alex =?UTF-8?B?QmVubsOpZQ==?=
 <alex.bennee@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, Shin'ichiro
 Kawasaki <shinichiro.kawasaki@wdc.com>, Rayhan Faizel
 <rayhan.faizel@gmail.com>, qemu-arm@nongnu.org, Evgeny Iakovlev
 <eiakovlev@linux.microsoft.com>, Paolo Bonzini <pbonzini@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>, Luc Michel <luc.michel@amd.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: Re: [PATCH v2 7/9] hw/char/mcf_uart: Use FIFO_DEPTH definition
 instead of magic values
Message-ID: <20250221111043.6417c938@tpx1>
In-Reply-To: <20250220092903.3726-8-philmd@linaro.org>
References: <20250220092903.3726-1-philmd@linaro.org>
	<20250220092903.3726-8-philmd@linaro.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: wSD4BI3pN0Um

Am Thu, 20 Feb 2025 10:29:00 +0100
schrieb Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>:

> Defines FIFO_DEPTH and use it, fixing coding style.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Luc Michel <luc.michel@amd.com>
> ---
>  hw/char/mcf_uart.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)

Reviewed-by: Thomas Huth <huth@tuxfamily.org>
