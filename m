Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp918668njc;
        Sat, 12 Apr 2025 02:12:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:21c3:b0:736:4e0a:7e82 with SMTP id d2e1a72fcca58-73bd11e2d4dmr7785768b3a.10.1744449174357;
        Sat, 12 Apr 2025 02:12:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744449174; cv=none;
        d=google.com; s=arc-20240605;
        b=EZlleMN6HgKDY9p8B3Q2pe+Apuyn/R6lKsM/cpKae65JAMCzBRNIaFsIgnEe6vm01+
         x5Jyu0WGuIC6wYAAp3tecYSPiqtL/JzcCcTnhCqhDXwyGSCYnnulFwbK5s4Nfz+YNHYv
         G/+r12icU8BAT3uH31PM05bWXF2SG4lV8wupW43MefjNatcWTBF9voFOjWn8ecswHcjZ
         uljRkrXua/0TLf+0/av+iPYBbE0sqLUFSd45S0rNovka6nuaKeJwg5xXoXafD+OO4evi
         XK6cl0ufWXvu8dA+ctWHUFO5/230aXrjRmz/BkAivs3nv0+/HL3jhGP9tgVa3IxLcQE2
         LuaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RXCAEsCpdNV1Hq/vICQlZRIZEyF8Nck30VrAqj90PLI=;
        fh=2vHiWKbGaExXO7gjQFzxTxL8sV20F+5MhOGm9irORyY=;
        b=IjHUfKFn8d/DvmQb7EA/ETDN/SpZSbwvTj5VnXfeUevmeXkeQN9amWJtoNRGDYw7NP
         IXq8K91ZblQE5j48uWZQP24AjpuJzOA5Kp6fDw69Y8VuzS9GZHh4nokwVC1IaLUPKsTI
         7GXdPGPf2oZ/2EA0nQEjhOFlcxj8Lz87Wk4Ds7oxSppe/SNRPaNwMfSaXXQOutzD+pUN
         UCFKTo+t/SFTaqzAd60bhfYsmzQE1M78Pf3YMY43XjfHAc9HguPrE7ENfj1ju1cXqILz
         JbEFWcEAPpZBTvaLy9/eEBvbYDV6aQBLze4EJWKTVFCcJfnkAbASYff2fq5u6aHc9xuh
         UkZw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=V+ECUZ9w;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73bc2592413sor3044569b3a.0.2025.04.12.02.12.54
        (Google Transport Security);
        Sat, 12 Apr 2025 02:12:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=V+ECUZ9w;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744449174; x=1745053974; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RXCAEsCpdNV1Hq/vICQlZRIZEyF8Nck30VrAqj90PLI=;
        b=V+ECUZ9wOwwktYqVrC7UHatOF80cDq2X12YIwblMPd/XkgevNcKnlf+R0FYRUOHLNw
         /n6K5Cg5xOBJS2Bbpp8LAFAEOkcnDGxxxTfUEd2uOjQEjnLtTJoNcIrUzVZMwDJ9zOgm
         9vJr5HY2ph1UoUkkK3kiQaI4rBafNPBx5R+jOdAkePUIpsT3TglF3BF4nP7id/27kGbT
         NoubSXoi9w35+I8yAcTVb5scT2wI64odsxIXH5mDpLpE5/iAZk2ngnTF6tj42tEygnC1
         LuN3XPiwXCyOW5kH6JdsNhBO9nblxlYmupmiDxXgo1M0Ve4jq8tuuOmPn7lISxDnkl4j
         j8mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744449174; x=1745053974;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RXCAEsCpdNV1Hq/vICQlZRIZEyF8Nck30VrAqj90PLI=;
        b=q3UEKj/7QUr4Atvp0sPz92Vv2bWrsfqa8hhBx4hg9R80IjHcrHVRRlAyrcHzH/3tVC
         HyDX6rG9uk99Zsj5N6fVMzuU2FT3MjjbNbT1kfDtSUv3HrfBwyCQLW+MiYQF6HgjdRSt
         lmIMBOzEnm0GIgRU46pMd/4YIndxtfFK5Lmt5sicGr5FlQ18qwfMDmbtrbO8dw1UMtUf
         5fyzXlMSvrFzmc61gdzj5HtyuTll4EDtzD57lp+dXxfn0snYPYtdPVKG3+PQ7XIVQY0P
         AMODeE2Sz2i8njJRU3zo6uic3S+1ZVXBdCWHaWUkwC/7q8B3ECIQO0eGmsoZ0SI2VmGU
         glRA==
X-Forwarded-Encrypted: i=1; AJvYcCVsOsIjXW83z5yRCiurNsVv8q/ObKaijVkXdeJwHogd+kYPRvD1+3MHDjDP8SgO933VgR4AmEwRHx5d8Po0@linaro.org, AJvYcCWUXNIMmnbkO1N53BIJSh71lQobRA7mOVDldH5vuF52ayMt2msWQmUviunQg5pHEQk/uznP6IVsQw/Y6jpWs/vA+Po=@linaro.org
X-Gm-Message-State: AOJu0YzUDeefZeOl+dJve7rXXJUfZ5lh+r7IhFj8+Gd7GEDHRfQySRxG
	sR33TsvPkjMc7O5nAXLvy/jzXp6xVp2500vA5TbX1s9MFLAfjj4RDvB2D/bsXvcGYiZ9W1UanUW
	UpOm3JqWgCIgLOsChB+qZd60Gflh2T5GDPg4=
X-Gm-Gg: ASbGnct1PLuDvo16ZjVbYMnwjWEY+la3dSreeKctbnG0+NWGo5N9E/8V+36Y460iGnS
	wRTnFMuhs0vlgqzGrqSmDYNgtg6KiwQvoEbx+KqpCv9f9C7xsbdRCZPXUt1SnCXzQbQZ8EEubOz
	xQ6YVlvUBi91O6448QrpaBYZvvWZFNECpmkTGqyMSUvVRthisGFb0=
X-Google-Smtp-Source: AGHT+IHic7FV/mzSdyc8NyBbU7ypE8WT3b1JFUebnq8RCbFEYga+P8u54vha9RzhjoYiUYnU54FqsJT15f87MjLWyZc=
X-Received: by 2002:a17:90b:584b:b0:2fe:7fea:ca34 with SMTP id
 98e67ed59e1d1-308237cedabmr7339114a91.32.1744449173657; Sat, 12 Apr 2025
 02:12:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1744032780.git.ktokunaga.mail@gmail.com>
 <24b5ff124d70043aff97dc30aa45f8a502676989.1744032780.git.ktokunaga.mail@gmail.com>
 <264d9113-16ce-4c05-a468-78e1f9921df6@linaro.org> <CAEDrbUZO+vJZacBJeE2Od_9Eb+vjX1JYCsNz1QQA4MKFTi9cnw@mail.gmail.com>
In-Reply-To: <CAEDrbUZO+vJZacBJeE2Od_9Eb+vjX1JYCsNz1QQA4MKFTi9cnw@mail.gmail.com>
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Date: Sat, 12 Apr 2025 18:12:41 +0900
X-Gm-Features: ATxdqUHxyLyTB3UgAf4f1Q4Gzo4a9Tocnl1R5OSC2EaYHQ4IoeCHIoqTp3Gf4m4
Message-ID: <CAEDrbUbgUE2E5u7R4xyASzSpvpFQycDxwEueDpHE6AXuaAtLWA@mail.gmail.com>
Subject: Re: [PATCH 07/10] tcg: Add a TCG backend for WebAssembly
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	qemu-devel@nongnu.org
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Thomas Huth <thuth@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
	Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Weiwei Li <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	=?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Eduardo Habkost <eduardo@habkost.net>, Peter Maydell <peter.maydell@linaro.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org, qemu-riscv@nongnu.org, 
	qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000005323d5063291396d"
X-TUID: sglsuIApwdmQ

--0000000000005323d5063291396d
Content-Type: text/plain; charset="UTF-8"

Hi Philippe, let me resend the table as it was corrupted in the last mail.

A: !defined(CONFIG_TCG_INTERPRETER)
B: !defined(EMSCRIPTEN)

                  | A | B | && | || |
------------------+---+---+----+----+
non-emcc + TCI    | F | T | F  | T  |
non-emcc + non-TCI| T | T | T  | T  |
emcc + TCI        | F | F | F  | F  |
emcc + wasm       | T | F | F  | T  |

--0000000000005323d5063291396d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Philippe, let me resend the table as i=
t was corrupted in the last mail.<br><br>A: !defined(CONFIG_TCG_INTERPRETER=
)<br>B: !defined(EMSCRIPTEN)<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | A | B | &amp;&amp; | || |<br>------------------+=
---+---+----+----+<br>non-emcc + TCI =C2=A0 =C2=A0| F | T | F =C2=A0| T =C2=
=A0|<br>non-emcc + non-TCI| T | T | T =C2=A0| T =C2=A0|<br>emcc + TCI =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| F | F | F =C2=A0| F =C2=A0|<br>emcc + wasm =C2=A0=
 =C2=A0 =C2=A0 | T | F | F =C2=A0| T =C2=A0|<br><br></div><br><div class=3D=
"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr"><=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
</blockquote></div></div>

--0000000000005323d5063291396d--
