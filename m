Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp7730766njd;
        Wed, 9 Apr 2025 06:53:38 -0700 (PDT)
X-Received: by 2002:a05:6a21:a342:b0:1fd:e9c8:cf3b with SMTP id adf61e73a8af0-201592d0f16mr6010072637.30.1744206818073;
        Wed, 09 Apr 2025 06:53:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744206818; cv=none;
        d=google.com; s=arc-20240605;
        b=iBFWlj5WODUO0nHyxD0G+zWyrwk80v3dF7a8FqyDeUndPgcIfUVQ+TAyoACUefH46I
         MHEaBAhcuKt2Efue4+XbeAtK7LQEEVHnQnEJciJ/cuJFk5n9/mIOetiplzZH9zbZ8Ily
         GVEmfdpket0W2RrDInEo4HE2cpJUN6tD13pzpz7IKWrDQRpKWYQV/yfBtH02BmNRY0gO
         WbLubZyEGIfGdU8aNqnvur92Z05cmhaTdW2dfMtaRcv0BJ51T9ggcxFmEQfYJVt5BbKW
         Uf9vFjz+s9h9b9jTQYJs8Lorwrw55qmp2qvUPj3b57YSdyxazd2rTsNf+w+4ggVnmvfk
         6TYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fO86AUOVMEMkyzgCe3CigxfkEKJzkLkqDXYq/IelJEs=;
        fh=R3FteP84Tzq4rd+VE1vGD2SwxFGrN8QqlQ+3M6be9d4=;
        b=HT9oG8y3n/qZrhqQUZaWu9fnE3Th+ZndZ6jBj37Vi1vqV1nT7JFBMRufutCQSv7VkM
         B5btGF/xJ4eVihOlyv4zqpGK1BXtQ2wiuKBJFnl6dcGwzefEzzymNv0ebjgv/lS73Cw0
         yicwrkY1TAXx7quHUWjxj+BiThMknsNVs7AxsfmpGFDRch66EV09/vRmO6yePLAsl/la
         mojiNAGIWC1gE9l7SiSZIdqZJi/NsfrwyBm6S77aJBuLZVabbp3rnro8JalELyI3yCBy
         EzcIvVn+o5Itw+hEcnpluuEe+G0/z0CFPAeB96FUGKei4h+EMizO8hb1SsOKhY62nJUN
         hDcg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=OXT4Oud4;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-b029e1e7264sor856903a12.0.2025.04.09.06.53.37
        (Google Transport Security);
        Wed, 09 Apr 2025 06:53:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=OXT4Oud4;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744206817; x=1744811617; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fO86AUOVMEMkyzgCe3CigxfkEKJzkLkqDXYq/IelJEs=;
        b=OXT4Oud4JDnIj211lbnEfq0cKaWJIirdd5a0+9YVvrCKOC5QIQIpn6/1IH9lyrh3Oc
         VFr7rU0Ejq98s45vFD5TSzV3Wb5vTG6FKO8ihjZDRi9G9ERH4zeqnNvYG415UAppVmd0
         xNDxAmOlpRs1EcjYHT652Ni8S6fG1POpn8WGvZyhzAaz7jw3Q1O5S9wVioOp6zr6a5vp
         4YF1NZirN3DpTUU4zSGCp4wf7ZfYAb2cQT74WeV9xUN8JrpgU1Dv53a6vNZvIR4nCJK6
         ZjULeR/NwUM+GyWUPJb33BNUvxaL0iZYHih0iDmnQL3J39ye6ByFcxshH0jMOVYyi7f/
         BA+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744206817; x=1744811617;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fO86AUOVMEMkyzgCe3CigxfkEKJzkLkqDXYq/IelJEs=;
        b=vIm0YxEsyKBhFJx/zSPekS+uIp3U5d93K02aTBIfEM/jVB9Ybhmk3Spnq4CBIoy0+W
         Z4n/mVxAi4gruxJbdXh93ddUVzjXgkPQEV0dQv5RVvLAJ3jX/pWYMuBwO9nGu4iKw7gz
         D1cy/UKFSH69+ephTf/T9dXprgtkOCyIx67GQr118PkF+eb8mSykdKemlr3+fAJiJPy5
         ZRdr9u4sk1w0TLm3SYzJhIj8cD5BV/tomEe/bYYVPwI/fPF4GVFu1ydkGGHeStyRm7S2
         hn2r2llAaQ8D/dGdjyfvm5ccBd5UwptR54HNHZp/WpDPBX6qj44v7ouFbgTy5zqX9ynO
         jOEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWe8ezodRrejjR9ENyqk8yvCghnsaaSfkgOpGv1BcOCZKEQ7RfoU/hHyMZ2DUmmYaHv0OSICZd1OpZlGuNM@linaro.org, AJvYcCWqCBqMfZTn/Rr4l/xIjLmLo5V1wEgBdpEJSD9WNzijZaO8k5wWV4xZ5L4uHSbT69S1j0p1gXTriraVvxuLlFrnIP8=@linaro.org
X-Gm-Message-State: AOJu0Yy3nPFvdBMQkMYL5py2X6boXFDOE2AVYCPJxJHSqUeBhCLVlsHD
	uCEL/4D5c77ZmcLgWY8d+Mf7Jsu48v/yRCRobTMWD/FyjOWC12TUBqLx6XH2xYYTrtrNbJP8deS
	UU2z8V1kilqA8Lt6Of0HYRrsB82hr/nhECw4=
X-Gm-Gg: ASbGnct/6i3ytlG2l1O4JGS0JovrWTFpw43MBYng84BfHczVOZ963o4yu3/bp2C0I3O
	PnOkxgWNPHuj3+M6NB798oSs2ypNisDFGjQrPKJRlKNwSpK79rcqjPvwJJZpWY9sKz7mOwEbuSG
	KZR+zQsl4I0fiMCqRydVChZ7mguM1D/RAw3cZeSR/WvyBgDdgv9Mk+Mk717ZwtFlY=
X-Google-Smtp-Source: AGHT+IEcFr5+7WmmB/L2Y3x0x3gjpCLcCsTZwB8iEN3nZHLGE5ZN9jnOSQr5GjgYEdphHNdpy5MVCHMb1sEwGjJb6G4=
X-Received: by 2002:a17:90b:380a:b0:2ff:570d:88c5 with SMTP id
 98e67ed59e1d1-306dbb8e6f7mr3966680a91.9.1744206817553; Wed, 09 Apr 2025
 06:53:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1744032780.git.ktokunaga.mail@gmail.com>
 <24b5ff124d70043aff97dc30aa45f8a502676989.1744032780.git.ktokunaga.mail@gmail.com>
 <069ad872-5012-4f2a-8ba6-e2a22ce2bb49@linaro.org>
In-Reply-To: <069ad872-5012-4f2a-8ba6-e2a22ce2bb49@linaro.org>
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Date: Wed, 9 Apr 2025 22:53:26 +0900
X-Gm-Features: ATxdqUHcy7JpXUs-uTpIxaoiUmvJiw4LWXS3bgs3RLqnCgbLDwbNS6L7a6WJOo4
Message-ID: <CAEDrbUYX+i908=QxmvSt6SHAK9O6cwu9cT+5NbCw1xbwz3Ja7w@mail.gmail.com>
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
Content-Type: multipart/alternative; boundary="000000000000c67982063258cbc5"
X-TUID: 3z6sd4/TpA1N

--000000000000c67982063258cbc5
Content-Type: text/plain; charset="UTF-8"

> Eh TBH this is too much to review as a single patch.
>
> Do you already have an idea how different the wasm64 implementation can
be?

Sorry for the large patch. I'll split it into smaller patches in the next
version of the series.

With wasm64, instructions that manipulate pointers (e.g., ld/st, qemu_ld/st)
will be updated to handle 64bit pointers. I believe wasm64 will not require
large changes to other parts, such as label handling, goto_tb/goto_ptr, or
the forked TCI.

--000000000000c67982063258cbc5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">&gt; Eh TBH this is too much to review as=
 a single patch.<br>&gt; <br>&gt; Do you already have an idea how different=
 the wasm64 implementation can be?<br><br>Sorry for the large patch. I&#39;=
ll split it into smaller patches in the next<br>version of the series.<br><=
br>With wasm64, instructions that manipulate pointers (e.g., ld/st, qemu_ld=
/st)<br>will be updated to handle 64bit pointers. I believe wasm64 will not=
 require<br>large changes to other parts, such as label handling, goto_tb/g=
oto_ptr, or<br>the forked TCI.<br><br><br></div></div>

--000000000000c67982063258cbc5--
