Received: by 2002:a17:504:5c6a:b0:1be9:327d:8ee3 with SMTP id dm10csp1785902njc;
        Mon, 24 Feb 2025 03:04:12 -0800 (PST)
X-Received: by 2002:a05:6402:e02:b0:5d0:8197:7ab3 with SMTP id 4fb4d7f45d1cf-5e0b70b5fc7mr12426293a12.3.1740395052494;
        Mon, 24 Feb 2025 03:04:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740395052; cv=none;
        d=google.com; s=arc-20240605;
        b=NaoKBuM/GRihqwCftzRNIrkIFfdxnxJR2CiHevjB4zcD9VzegeWK1eLw2R5R2PRUYh
         XoU7LFxrLVuD4rU4h1QFl9UDwEI3y7fVAcU/8Hydqvz72su/yx86rba34CRIBoKUAGQq
         vOgqLPsD0UfZPHF/t8lofmPl+md7BW11kl3QOFM3h4tvD0RefynXrRTYLDcjSrTqkYmi
         GW2iTDEv/rPcfTeN4KXe4Y6Iw41y/OUKtIF5YUEGFItPiMWfCxD26ckSuzEZY3NQ6mmN
         rSis8ZDhUuNHq+v/sJI7oxW8iHgBw6PfHfVqI+YJVbWnguV2iCjhNDx/RenTwYGvq1rk
         NOAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:dkim-signature;
        bh=P3gq1Sc9H5Ms95u4WWh16tH/o7ku03Ter1r8qA1KKf4=;
        fh=n4x6mxQmEN/4oiPSTZ+aZzRUnWgzaTtThRuAlChklVw=;
        b=fW/lRKZle2PBZrCAxUZ+geCb7vBLHouTcfp8DDGA9LA/iK31QxXcN+84evoueF208T
         eeWH3PI3hi+LdIDc1OAbYT2SZJ0bLmBMwmf6gQ29nxo3NGTUT5P+Rokqq+qiTkWcMHNN
         zsMDuwpdF7z30FPIsXM6o0R1YSRytN00GujAdZPz4+UHCqMu8oBC/XutgEhu/QF4cdjw
         DiLHU8Xbbpp4g5PRinJ/velzUZBUlo85a+v/g/iaEhgcbQQN2d29diwd13dS/VmoDZT7
         DTXAy6wZIGGCqjYy1oNk1JFKxmQ0/+b//Wyk3fYl4PQNzWvGNKjuO1fhpd8ks8ASh/LI
         rlfw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="BQCsQ/Ij";
       spf=pass (google.com: domain of shentey@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=shentey@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <shentey@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4fb4d7f45d1cf-5dece25f389sor8934814a12.8.2025.02.24.03.04.12
        (Google Transport Security);
        Mon, 24 Feb 2025 03:04:12 -0800 (PST)
Received-SPF: pass (google.com: domain of shentey@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="BQCsQ/Ij";
       spf=pass (google.com: domain of shentey@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=shentey@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740395052; x=1740999852; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3gq1Sc9H5Ms95u4WWh16tH/o7ku03Ter1r8qA1KKf4=;
        b=BQCsQ/IjgjgyL3Tnf1Xt6sJcumAFuPwA/kwO5y8oI0AhNyJ0Vz0I7q0WVqS2PSKw3o
         VTo6eKRyzpr9q0FBFHPrl2sL4PbJG9PEUdjY/PnixmVnPlKSpMlaLykvn24lmLmiKzeK
         wNUjNH/Js2n0qIJ+7a0RGr7TijnGKxzws3sgexKz+Ix19OTnM73wVOl/YPlc9RDncDT6
         /UnY84kKlMmu9S/sUW78hgcFN6JIj1kT3zdsYs1lmSMv74sjfo+Cqj7KhX/szAM3jkk2
         eoTjJA5ogYpGnVk0xqRonwzaKl8OYTLnb7JB75uDaEZuSkgk1RJltRNH1+sVwCsZIOCq
         mWYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740395052; x=1740999852;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P3gq1Sc9H5Ms95u4WWh16tH/o7ku03Ter1r8qA1KKf4=;
        b=SmBhDtKerfvcem/+QPpB+5vcuMNZ7WImr6rAnT5IvCyQVuRPBUZdKbYRE8F6QKiE+X
         myeW5lt/2DynrByYrZ1VSb+1kcFUHFC5h4yGQw6FccI43G+zkO1JvADj+NJwtZ/8FyGr
         mROmRwdanAvTymjFPizj9GWVZ0nri5aRQNunFqa9iaQt6gtNTd1SOKHViZOHz7Ph5/8x
         j7sVq++h1FvGUQeZGs+ebC1k2KeyDgidWsq/BDE5/1kdPvjolLbqiSyhfpF0otwIQrp3
         oNErz3GQUPHECZcmi9Zq/O/wRU2niDlhNPLCiiMSOafPp/Gw0pkQVw461x0HiSmGFUoh
         W8Jg==
X-Forwarded-Encrypted: i=1; AJvYcCUWA1hrwfq29crQ0+kEgmVZgguNY9LIvTkBMd5zjLrl//z6tC2Nzj7S8GXYsQ98c+C8HkA11Oth@linaro.org, AJvYcCWzI/HICxPsS59Gx2kWkyHHpGFpav97UeAXRYT0g8xb94DecluO/hz8xC968DW+fldfGOjh3AFUdxhduoKS@linaro.org
X-Gm-Message-State: AOJu0YxFar6HBaiFahlQhQa5GY4mQi7mLdEU1nRFMAqe7PxGjfNnk3fQ
	upZTUwbdCkpr48kNGfa91t+vg3AT7EwVSmGN3mUb/WpSTB8A7iaMS1SWpA==
X-Gm-Gg: ASbGncvg4aR9dQ8j3s8Iqq5YS5d+ZtudlRHQe8KhlCv0rW+zd6llF8nJRIKuPGPAfhU
	8I2+s7WqsJfFOY/fDjqf8UR8gLa5/t+hze98q4P5Lz3L9FgNF+vIPIYzVQBNX+oDw87xa/uairs
	0fPDJlPFcV+z9mQDhDGEsKoFRkPguwpTDzvIqLN/cpn6+6Y0NQlglw2qmpGbvfCO5d77cY6eMiW
	diUUer87Y6jgq466UneuXjOKzJ4W8JFcdTBiIEf33iY8I9/R6kJVn3k+bfNpluq466czjzSwnhe
	3Zd3S/snuaVvwQQdz3XmPAx8BMbRRpb0iTXrBfn1dgWPf+HeTdaUI6Q38wSoOf2JFbMOXo1h
X-Google-Smtp-Source: AGHT+IGBqHFtFUDRN/LntORiN4opnGqygXBjVh7tMBshQu6ejUrmysMTXNDU2NxJ35ZxDhbPtkpTvw==
X-Received: by 2002:a05:6402:3554:b0:5dc:5a34:1296 with SMTP id 4fb4d7f45d1cf-5e0b70ef77dmr12639263a12.16.1740395051628;
        Mon, 24 Feb 2025 03:04:11 -0800 (PST)
Return-Path: <shentey@gmail.com>
Received: from [127.0.0.1] (business-90-187-110-129.pool2.vodafone-ip.de. [90.187.110.129])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e09072247esm8696740a12.51.2025.02.24.03.04.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 03:04:11 -0800 (PST)
Date: Mon, 24 Feb 2025 11:04:09 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 =?ISO-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>
CC: =?ISO-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>, Thomas Huth <huth@tuxfamily.org>,
 Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
 Rayhan Faizel <rayhan.faizel@gmail.com>, qemu-arm@nongnu.org,
 Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Luc Michel <luc.michel@amd.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: Re: [PATCH v2 6/9] hw/char/imx_serial: Really use RX FIFO depth
In-Reply-To: <20250220092903.3726-7-philmd@linaro.org>
References: <20250220092903.3726-1-philmd@linaro.org> <20250220092903.3726-7-philmd@linaro.org>
Message-ID: <82869227-447B-4B71-BBD4-6C4E1038D69E@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: eGR9MMFWKb2B



Am 20=2E Februar 2025 09:28:59 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <=
philmd@linaro=2Eorg>:
>While we model a 32-elements RX FIFO since the IMX serial
>model was introduced in commit 988f2442971 ("hw/char/imx_serial:
>Implement receive FIFO and ageing timer") we only read 1 char
>at a time!
>
>Have the IOCanReadHandler handler return how many elements are
>available, and use that in the IOReadHandler handler=2E
>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>Reviewed-by: Luc Michel <luc=2Emichel@amd=2Ecom>

Tested-by: Bernhard Beschow <shentey@gmail=2Ecom>

>---
> hw/char/imx_serial=2Ec | 8 ++++++--
> 1 file changed, 6 insertions(+), 2 deletions(-)
>
>diff --git a/hw/char/imx_serial=2Ec b/hw/char/imx_serial=2Ec
>index 38b4865157e=2E=2E6f14f8403a9 100644
>--- a/hw/char/imx_serial=2Ec
>+++ b/hw/char/imx_serial=2Ec
>@@ -386,7 +386,8 @@ static void imx_serial_write(void *opaque, hwaddr off=
set,
> static int imx_can_receive(void *opaque)
> {
>     IMXSerialState *s =3D (IMXSerialState *)opaque;
>-    return s->ucr2 & UCR2_RXEN && fifo32_num_used(&s->rx_fifo) < FIFO_SI=
ZE;
>+
>+    return s->ucr2 & UCR2_RXEN ? fifo32_num_free(&s->rx_fifo) : 0;
> }
>=20
> static void imx_put_data(void *opaque, uint32_t value)
>@@ -417,7 +418,10 @@ static void imx_receive(void *opaque, const uint8_t =
*buf, int size)
>     IMXSerialState *s =3D (IMXSerialState *)opaque;
>=20
>     s->usr2 |=3D USR2_WAKE;
>-    imx_put_data(opaque, *buf);
>+
>+    for (int i =3D 0; i < size; i++) {
>+        imx_put_data(opaque, buf[i]);
>+    }
> }
>=20
> static void imx_event(void *opaque, QEMUChrEvent event)
