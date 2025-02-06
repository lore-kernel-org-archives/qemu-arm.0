Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1697395njb;
        Thu, 6 Feb 2025 09:34:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU8olyzzd1oDXeGsnNZbGXmP6wQbH35L9SsuXNnUGLFIaCIdgHEHRGICJS3ga9tEq6NUkw6/xKzX8KPzQ==@linaro.org
X-Received: by 2002:a17:902:e88d:b0:21f:14c1:d58e with SMTP id d9443c01a7336-21f17dd6b52mr150330815ad.1.1738863267621;
        Thu, 06 Feb 2025 09:34:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738863267; cv=none;
        d=google.com; s=arc-20240605;
        b=FFDq+a/IwHBmJVRAadVPL6fQ1SGTf7j9XaV31gfcVPSd1UwJXw68PxVp4dR2uoPi/v
         EAc+WymmYnTf6ZVjaZ+Lj+sQiyW9MMrs8Ivb2xZ3eEH6QEvyZeqNLKl/0vKHVpGp7iK1
         qofFrxOKZ7Y/chSnJhXQ1kGlyZXyRsjmqgVf1kboJ63RZxQ3alWPjZEwrZQ3b4tfpCaR
         ORQnpoNPvTTMG+cSQEl1DVsSGcAyCf142+Q1Csnah+p5fr4rO9mMEmsrjwLmjpMsfA/I
         a4QnUuDx7Hkbs4C8/w0a2KqJj8Iy79EE53IFmNrfBEP6IaElVlxX171DqCx3QGzAuxBu
         shpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N3oaUqlq9HpIZZmIz6s3ZZLT25evRAcGajYotaDqYww=;
        fh=ZOL0zrHJgkgzcKuthFfClxKweB8uwaXEWDchd2kCbec=;
        b=EJ4S3O/EQ3tfvAjTm4dAgCtZh5Rm05FPl/RZ4dbEF9zAiED99/8HvioI/Y2lpxyci8
         SWboFCMl18APyqU4MQOo/lgQZKQbN5bs6YSVjBpuB0QCikmL6Wmyc4GWK3fndDoQpyla
         y6JVbBvLjXmow/lcx/Ay+HYMTvpeoaSxXF7sGi0QzuPFvBg1ISMe4uNUG0/zJIVkfchi
         PQoS32Qncqh4bZciUZi1LWm3+XwIpIEpjNIs1GLxM2bK6032E1/eLr2J6srNDGDIAnv6
         hS5QfC5FvzzTAlobk0QIirEmwy+Gf+NpUQ7HK0Iy7Xcb8JErq0A+qStHTq5EHOl8mSay
         V7kA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=IexNAbL3;
       spf=pass (google.com: domain of jcmvbkbc@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=jcmvbkbc@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <jcmvbkbc@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-21f36814eb0sor14168195ad.14.2025.02.06.09.34.27
        (Google Transport Security);
        Thu, 06 Feb 2025 09:34:27 -0800 (PST)
Received-SPF: pass (google.com: domain of jcmvbkbc@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=IexNAbL3;
       spf=pass (google.com: domain of jcmvbkbc@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=jcmvbkbc@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738863267; x=1739468067; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N3oaUqlq9HpIZZmIz6s3ZZLT25evRAcGajYotaDqYww=;
        b=IexNAbL34WsFdaRqGY6HPVB11haL+SOSRH+SNmXVNHwrcZO3MtBobgsVJHQGw3VJ40
         0IO8tYdghivqPCc4cTmZXZumo1K61uJpxt77TMvplLUGLZGqcaDFom5/u4FCJSB6ZbQ0
         FI4lfSf58OG+uH0FcLTr3as4I8PReULmqpsn0C31GAwgtrPJcRTDAtia+D3jB99x9F/n
         gIiGw/kJ629YfbG9mq16a6ygkZjzEOTYFt4p0tWE4SWJpO/9ETQh6qB7C2BphR4IqVCB
         dNI7ZKIAlJjXozB5S+sX4Ux/6YyQUkUD6yNKofqjxQSw6ondoEpbxBJR9bjmNVTWl4LT
         3i3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738863267; x=1739468067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N3oaUqlq9HpIZZmIz6s3ZZLT25evRAcGajYotaDqYww=;
        b=BKFjhXYdKvudEzzWqlFReld2y0puWJSsKuHVNJzLNeZO6gBDnR+USOOy1Y8bulX6pq
         M9gYgnJF6PSPW8Wy9k96hPivQgWJUpyXkaDCcXx4KO1uk9Iz3P7gpjjv1iY4yZuSEQSy
         O+ahygByQjF7ltH3Gwd0ZjDRnl5mebVbUX88C6WmnOY6+6eGJ1T0Xkm3Gi8DIk+xlLs3
         98OeXOzotp8onsv+ohg2GkKDC+cvB92vUaUQbC8OA4L5k8mGVr1Hpu2NHwzw9FJ9xQ3Y
         6s2Y/fXsTaysUXmd6iIZYnOTiR0G+5fVloKQJYzMBvESRx8mu9XqCIdwD3zkxjNk/Vuw
         m7mg==
X-Forwarded-Encrypted: i=1; AJvYcCU1nsE595Ktff+eSMfT/zhzlGgMgtalL6VDerhAuArnU9qXkyBuixXA8GQyAEqQhle3wH6hRmFJgMcz87THeQ==@linaro.org, AJvYcCV1/BUOEGZUoA6IAwLOCfKmtuBHNWUKVaeiH+pQL43Rrr/6KlA6Sy/FEPD8d/BCJKWUCHExh/bNsgkmUw==@linaro.org, AJvYcCVFwOIKvR9Ch+GKgsNg+3znGzXc83dGLFuvRsKDay6qnzX8hBV7taVAZAftqsPTw9xzS9+bJWQ3TiargEwqlWGxnDI=@linaro.org
X-Gm-Message-State: AOJu0YwljQbWoz52hofH7aBl8Flt/frcv4PttVnZLnKZ7eEhfGlKlo+a
	JFDwQnM0ZtW5SNbw6/C1LkESXwVekhACgGuDxwb0kV7munMQdPfRgqpzogY2Ix7B2nEh9pCMMlT
	gRqroJoZ2n10S45iPe0WuxILfV+hpVA==
X-Gm-Gg: ASbGnctvrFjoYuozc1l+mavzOdE5ToAJCaA60fZeJn8FHgI4Db5GEn/jex3tpzSMgAw
	2SQJPjactfjNhZOgYWjnE0168KvzuWMTbKqDqDeHX/UT+gnGYJ13rl0oXFIQ4U6QzI79wkeP6qz
	GvtS4VHFwL0T4PScswORrVASKummxP
X-Google-Smtp-Source: AGHT+IGYMLjQxmmXi2Q3HO6/dfm119AbBljnoXa5dPciQ8yvTIf7hZJOAjbqVgXA8CeOHC7hqPtUEO5jj0e/EmcDrMI=
X-Received: by 2002:a17:90b:2ec8:b0:2ee:dd79:e046 with SMTP id
 98e67ed59e1d1-2f9e076c07bmr11787120a91.13.1738863266915; Thu, 06 Feb 2025
 09:34:26 -0800 (PST)
MIME-Version: 1.0
References: <20250206131052.30207-1-philmd@linaro.org> <20250206131052.30207-12-philmd@linaro.org>
 <Z6S3Mgt1G7fIjeBB@redhat.com> <4624f149-76d0-4da5-8f13-8c015043c335@linaro.org>
 <Z6THtfjL6UVhBiW7@redhat.com> <3156dc3b-9553-4b5f-a934-f29ee0601887@linaro.org>
In-Reply-To: <3156dc3b-9553-4b5f-a934-f29ee0601887@linaro.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 6 Feb 2025 09:34:15 -0800
X-Gm-Features: AWEUYZmJ_9jUQaqkqkoyKOVYkIWzM-3OuZKytA289UKgMN27dz0ArI2w-4sXGHA
Message-ID: <CAMo8BfJrzj1rERAXXZ8dfVYjnD744mCdCcNUuB1qeqD45dTUAA@mail.gmail.com>
Subject: Re: [PATCH v5 11/16] hw/microblaze: Support various endianness for
 s3adsp1800 machines
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, Anton Johansson <anjo@rev.ng>, 
	Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Peter Maydell <peter.maydell@linaro.org>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Markus Armbruster <armbru@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 4vKDOraMyDLv

On Thu, Feb 6, 2025 at 7:04=E2=80=AFAM Philippe Mathieu-Daud=C3=A9 <philmd@=
linaro.org> wrote:
> On 6/2/25 15:31, Daniel P. Berrang=C3=A9 wrote:
> > We would pick an arbitrary endianness of our choosing
> > I guess. How does this work in physical machines ? Is
> > the choice of endianess a firmware setting, or a choice
> > by the vendor when manufacturing in some way ?
>
> Like MIPS*, SH4* and Xtensa*, it is a jumper on the board
> (wired to a CPU pin which is sampled once at cold reset).

This is not exactly the case for xtensa. Each xtensa CPU is either
big- or little-endian and it's a static property of the CPU
configuration. On physical machines it's either fixed (e.g. if
the CPU is a part of an ASIC), or it's a part of a bitstream that
gets loaded into an FPGA and there may be a selector for one
of the bitstreams in the onboard FLASH. In either case there's
normally no board-level switch for the CPU endianness.

Also big- and little-endian instruction encodings are different on
otherwise identical xtensa CPUs.

--=20
Thanks.
-- Max
