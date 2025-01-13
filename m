Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp1913388njn;
        Mon, 13 Jan 2025 09:18:04 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUXRtrqtAyEbC3qLTRUTnDHBKibEE2xbJflh2d6Y2Ovuk4WRqsZ4bCSbQ5qBhhPt2VXcasUzK/MSXBCyA==@linaro.org
X-Google-Smtp-Source: AGHT+IF7q7sEnPUU+i7I2lRow6p6alu0HV88683VLutL+Qj2CEXuwQtQtBXVPPVjtzkBAbGn6c/s
X-Received: by 2002:a05:6122:41d:b0:515:25f5:46f6 with SMTP id 71dfb90a1353d-51c7c818af3mr11267733e0c.4.1736788684721;
        Mon, 13 Jan 2025 09:18:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736788684; cv=none;
        d=google.com; s=arc-20240605;
        b=WNFK0LCTkpJhZCKLhbOY0EWFDnPlM84P5AQH5jQlev26O+gZ+pWTqqfrAutzOe1okk
         1IflVmDRuql6GiLEuDY8zLt/C6DbBcIt0TzQJJ5td+QMmqEFsYadUGWD/dEvLQpn3837
         goEcCd39CB83Bo5UrsHUlw0NDaOkUZQmEfeo8mocKIo/94/3DixdveSTktPjYBklt8m7
         y5sdKZkDPmAcfQFbEiGYt9bUrLRW1MPf+xgEuXP3vCPK1/z5ublvefUQ3eM9qcJIi8Va
         p+rSI8CuNT14ao8nRUj7b3RFiVbZX9vFOv5/Odk9auO0mpZW21G51eCJUjX99YKmz6LV
         PRwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:in-reply-to:cc:references
         :message-id:date:subject:mime-version:from:content-transfer-encoding
         :dkim-signature;
        bh=Lf/7DXRr1kzhmsEbGWvW8nm0ZiahBN4RDq78yrh9VQo=;
        fh=xgrLUdB8IUHhJOOBKnEcji2ilZIi9m/k9fjzLN/kvzo=;
        b=O64RadwnmlZBS0punNph/PZkB9rFWfz3AT9WlxakseuZTh12weSo5zrcR6CLNs3JxA
         zyZLjw29VnIypBRpsRZ6Jw2bTfLSYwJK0NdQ64FetCbBc3mrk2OJxrLugvsKcsRiE7s7
         +mMoKBUkBh0qkHuKNeq5ycsd2zJ3SU7eiJbFBdmuoUMyzRJnU/XiiJoMYZ0jbvakEypG
         GSUOGsFlhasongZY5Io3tODmnIQVP9hwCYkPQk1t5UwNZI65YVLXhciHqPlKpJkR20RN
         rQhejXps0maiuybaVaQtlt6iAuKezW4Klh+t1Rkekx/FJJkgzHcOt0loPP40S1Wxmorx
         7DMg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@dgtlrift-com.20230601.gappssmtp.com header.s=20230601 header.b=V+W+M4Yp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-8623b223789si2415290241.74.2025.01.13.09.18.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Jan 2025 09:18:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@dgtlrift-com.20230601.gappssmtp.com header.s=20230601 header.b=V+W+M4Yp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tXO4F-0003Sv-94; Mon, 13 Jan 2025 12:17:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jhanley@dgtlrift.com>)
 id 1tXO44-0003Pz-1q
 for qemu-arm@nongnu.org; Mon, 13 Jan 2025 12:17:32 -0500
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jhanley@dgtlrift.com>)
 id 1tXO40-0003Pu-DA
 for qemu-arm@nongnu.org; Mon, 13 Jan 2025 12:17:23 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-e53aa843a24so7793588276.0
 for <qemu-arm@nongnu.org>; Mon, 13 Jan 2025 09:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dgtlrift-com.20230601.gappssmtp.com; s=20230601; t=1736788634; x=1737393434;
 darn=nongnu.org; 
 h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
 :from:content-transfer-encoding:from:to:cc:subject:date:message-id
 :reply-to; bh=Lf/7DXRr1kzhmsEbGWvW8nm0ZiahBN4RDq78yrh9VQo=;
 b=V+W+M4YpW49JyUK3qSxKPyWnvt+kE2ceYcXdX2vBQG31ztKj3R4+zynIuRJ+Yd6ZYd
 XJnZ+SSEjMzVX5AB9Z1K9wrcFYM9KioyuWaDmgLQEKEn3/xfvVn09IVzPC0WM6iOnUV3
 r4GOyTQLRo2awQigh+vfkYTHNh2xs/qEubNRAsa03JSghtK2UtZ0xJLDOK0fya5DT03T
 CHWe21dKjizIamPxPwskkvhy2fJVNKwITLJuZredLW+gpZz8ld7i24EPQMLfq7vrnyew
 Dvz7pJRRHYptqJrLQlYHuULaD6oya2tyxtiMhxpeeM1H10Q03WwhIx7GCJCTDRI+cHF6
 tjVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736788634; x=1737393434;
 h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
 :from:content-transfer-encoding:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lf/7DXRr1kzhmsEbGWvW8nm0ZiahBN4RDq78yrh9VQo=;
 b=o/J6yIJcusStxSKss9ph9a8gsT2k1mA7gMg0Rl7+MscFZRQ2qxNvc/N0yjLjH6VqB9
 FOfLGzamGfE0b5suXSyOX0CBBxFecTXWbRx7qhO/BzKFoCJlE45QtC23sYNr+C5vZonb
 VbLZ1O28NJAHiKfFmV5VO506L6s/xYiT+eLoQ8y1fDcD2j6/hXGLFt+xonFkh0N0EgEz
 RIZ+gyKegIInf1ilbc9P0ifNbFIu+3GVWGWiTk0YeITedrvtbD4TUVT09KRocpeiTgPq
 hvdWiq1656u9xJQXLnTG5OL8sW7gn401DLZkwRszreaU+S04g5mto36cleP/6iWUKIUw
 /WYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9CUdGQ9nEK6jil7vTBwHl9W9qCoNsNPqF5YXMcCUMjiUxsM1R3tDPYjgWCqcCFR2RMtkTGoLF+Q==@nongnu.org
X-Gm-Message-State: AOJu0YxnaV2xRR5EPSf1mCK9g0oB7Z3HF0D2mbjqm6p8YohOuXOronEI
 UoFQSkSWOWQFz9FVdSkQj+1OrZzHZQF6F3hx7HPgvzZPEJii7pcfGmCIJBKTWIAO2oWE5AhF77t
 b6g==
X-Gm-Gg: ASbGncvVnoQj/3zxM/LS/5e+H/VMoB2m8z/hEEJCtlFWKPCmp0IJ/WLHNGhFMQKP3+9
 1IDklqEVZwZ4NO8aVg9xgXN0fRhCsXIku8/Z51MXtxXgtotAkmdl6F2BJtxedCq+GYgbFnT0V2z
 u4JyMC2YukGguQo9od9P6cja+BAWJCo4pQnxt2LeLP3vQvvOyfasmdZ/a0e8mG4louelMwoSJXX
 kzkuoCgxPoIDIk1hiObvxT+Ys0PQF0ZbgMKB8KYQCS+KN3dCa1eQd65EXpoVgWjo1lOy4rrHRGc
 l3/XlK7c
X-Received: by 2002:a25:a165:0:b0:e38:2a3b:ea58 with SMTP id
 3f1490d57ef6-e550147976bmr13110558276.20.1736788634142; 
 Mon, 13 Jan 2025 09:17:14 -0800 (PST)
Received: from smtpclient.apple ([2600:1005:b084:406e:a453:1881:72be:e6e])
 by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-e55be2487c5sm1613298276.40.2025.01.13.09.17.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jan 2025 09:17:13 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: James Hanley <jhanley@dgtlrift.com>
Mime-Version: 1.0 (1.0)
Subject: Re: Can you emulate cross compilers written for x86 on ARMv8-A?
Date: Mon, 13 Jan 2025 12:17:01 -0500
Message-Id: <3DAC0099-1AD8-4793-BA92-E605CA236EA4@dgtlrift.com>
References: <V8-9mH_0RAMdFX4EVzJvHoDkKGgQnCZBdgFGLs4jNL-gZlRm-tb0YLlx2hmWss8Gidu2rC2IZK3RZiZk-v29J_AIpOdh_t4fi3d3VGEoeS4=@proton.me>
Cc: llvm-admin@lists.llvm.org, qemu-arm@nongnu.org
In-Reply-To: <V8-9mH_0RAMdFX4EVzJvHoDkKGgQnCZBdgFGLs4jNL-gZlRm-tb0YLlx2hmWss8Gidu2rC2IZK3RZiZk-v29J_AIpOdh_t4fi3d3VGEoeS4=@proton.me>
To: Matt Timpson <mdtymczyszyn@proton.me>
X-Mailer: iPhone Mail (22C161)
Received-SPF: permerror client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=jhanley@dgtlrift.com; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Rj7eVhiZOUQS

Not sure what you mean by =E2=80=9Cemulate=E2=80=9D - the gcc suite of tools=
 includes a concept of:
Build - the architecture doing the compiler build
Host - the architecture you are building the compiler for=20
Target - the architecture the compiler is to build for

So you could build on M2 Darwin a compiler to be executed on raspbian A76 ha=
rdware to build target binaries for x86 Linux.

-Jim

> On Jan 12, 2025, at 8:39=E2=80=AFPM, Matt Timpson via <qemu-arm@nongnu.org=
> wrote:
>=20
> =EF=BB=BFHello,
>=20
> The Raspberry Pi forums just banned me, and while they probably banned me f=
or asking beginner-level questions they saw as inappropriate, I feel compell=
ed to clear the air. They didn't formally give me a reason.
>=20
> I had one of those shower thoughts: if you want to run a cross compiler to=
 rewrite x86 software to work on your ARM computer, but those you found only=
 work on x86, couldn't you emulate an x86 system just long enough to rewrite=
 software so it no longer needs an emulator? I understand that compilers tra=
nslate into high-level languages for a reason, even if I don't know why; and=
 everyone who would speak to me suggested just about everything else, but fo=
r sake of completeness, what would happen if I did this the wrong way?
>=20
>=20
> Thanks,
> Matt Timpson =F0=9F=8D=89
>=20
>=20
> Sent with Proton Mail secure email.
>=20
