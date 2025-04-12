Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp944693njc;
        Sat, 12 Apr 2025 03:38:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH//hNPb2lNNtB8cXmYPjqGs4K1Ciy7mdpLJkfcLE+knzCi1gnSa2QShDJhoG59q9oKbEOj
X-Received: by 2002:a05:6402:3553:b0:5e5:b572:a6d6 with SMTP id 4fb4d7f45d1cf-5f36f646e93mr5096202a12.10.1744454324127;
        Sat, 12 Apr 2025 03:38:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744454324; cv=none;
        d=google.com; s=arc-20240605;
        b=LvVAJ9Z8DaeESKa6TN7R9zi4FS+rYsw5ynOsq4JqAPq3hnRnzKC5Dovcy/R9J0tSuR
         a5n72NHweEI/zmvFVeWk4R19aO8vrIEdk8A1XHknOXIZTBrBC95GRi+CPC3GCW4H/Yoa
         FXp8i9KDRF+dY4lJ0XW1AIrz4fqFHVtxQ8nAR49GyKxrusOeVuFu81+cKp3G+2qneGHV
         mu/75o4SEhVHheal4Z8x0a7XJTRSiHGAw2P0kEcbWVPNY86erpi5XIrbZaKzwkVr/BeI
         OjpI9chwIyGSD9g3RejvSJ62GDO5R7pSkOADnIblcLhr5bN+wb8up8la2Wd0P27/gqxn
         HDjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=cosF4cLG3559+ZAOzHp/RB0TPGm6onnaZsU/QKhSE3M=;
        fh=bRJN2izXgVs0Kxiv6Ue03P0JFZZoTknw9991NlfWliI=;
        b=Gp/UF4liI95rRXxsHKCt0xv3lEHoYdY1Otb+F0lnhQ9tW7OX6/AXkKM2KkaInKOJ1A
         rMubTmS46tf0BT8vyxPkAkHDaUd2WfnsKLOGGGPFU40k3L1iqwCSJMSnNaCMOPksRo8i
         WLkiEPrhjqwXEqZb8/f2+wt9euTD6mKRUlAXOsjgpS55v9JUC2XMzr2qVwUwMYfb8M6Q
         gdz/ZRzdxeXiVr6iShjkvmy+Yq0SOMIuoA5N03tkpLU9Tzl5yKNJTLL47l3AO31Gy6dl
         xtAEZh61GelPk1rh1slzikgf7wW9i6eMtV9TeDXNt0FkKMTx3mpx99WCb2vlRztKLt4U
         aCCA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@crudebyte.com header.s=kylie header.b="jdn/E831";
       spf=pass (google.com: domain of qemu_oss@crudebyte.com designates 5.189.157.229 as permitted sender) smtp.mailfrom=qemu_oss@crudebyte.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=crudebyte.com
Return-Path: <qemu_oss@crudebyte.com>
Received: from kylie.crudebyte.com (kylie.crudebyte.com. [5.189.157.229])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-5f36ee57fafsi2062242a12.68.2025.04.12.03.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 03:38:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu_oss@crudebyte.com designates 5.189.157.229 as permitted sender) client-ip=5.189.157.229;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@crudebyte.com header.s=kylie header.b="jdn/E831";
       spf=pass (google.com: domain of qemu_oss@crudebyte.com designates 5.189.157.229 as permitted sender) smtp.mailfrom=qemu_oss@crudebyte.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=crudebyte.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Content-ID:Content-Description;
	bh=cosF4cLG3559+ZAOzHp/RB0TPGm6onnaZsU/QKhSE3M=; b=jdn/E8317fF0Im23TcxV6tPIqL
	GvmVCQSKUC/KOvv7Kg8vNSqLpC4LkjgXNiN+G0F2IlTc21iRAlx6RdaPu3oXHQkjmofu2mQ3NJBDW
	U6sDZfPyeP3MpyBBh6kpR5nrzVFVah0cheaWfIRmO0V57dpasVfgHtHhlqsroID90FPnUZZSQ1vnK
	Q84pYx1NDDv+AVA+jflpp7vbZ1khzRHSf0Jr2ZkR7yNywWUa3gXsOvT11dt5sGh2L4UqUonVUqs99
	2D1w7oxz5xNOYYL8K0nV5FFW/yMm9mcOwiFLWJLlJXD002rfei4xTibSTLnzbqdqPISNaNzRdjUyN
	tZ1y4M+IZcfBqzVuxEsVCh/ghLkr17QJYnmbkk64Hn9+lovClGmQPpTuovi2rnItzyXAHgQR99NyJ
	lKcDd/VJyiLAwzGrWk46BHb2iimIZ9N3f7hIHp2gfnJil5g1qAn3Pq0H/DcfZo2clSQUEoGB6PHjL
	BPGKi019w4pmryrglo9IGRGtmXslHrK14qB07l3xFGBAWuyH2fZKp9roUWD/VbKEUW0JhzMNsSZGt
	zZKa33rA8Mv1UOwfW7dh1PcLk21b6OCPC6VEHwge3RT43A0yD8EHSxhMdoznmjq1pd3jf6hX4+DyY
	kwMScqfxHSwI5DA2Di5WoN3CuMxc0LBVOAVSJuXyw=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Greg Kurz <groug@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?ISO-8859-1?Q?Marc=2DAndr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Daniel P =?ISO-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Kohei Tokunaga <ktokunaga.mail@gmail.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH 08/10] hw/9pfs: Allow using hw/9pfs with emscripten
Date: Sat, 12 Apr 2025 12:38:34 +0200
Message-ID: <2555565.yjhJSkacHZ@silver>
In-Reply-To: <1881242.gqbg26PhFk@silver>
References:
 <cover.1744032780.git.ktokunaga.mail@gmail.com> <2441396.svyq9LpYvz@silver>
 <1881242.gqbg26PhFk@silver>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-TUID: M2SInU2334nX

On Saturday, April 12, 2025 12:21:47 PM CEST Christian Schoenebeck wrote:
> On Saturday, April 12, 2025 10:21:47 AM CEST Christian Schoenebeck wrote:
> > On Friday, April 11, 2025 12:47:29 PM CEST Kohei Tokunaga wrote:
[...]
> Let my answer my own question: I just checked the wasi sources. The errno
> values are hard coded by the wasi API, consistent over systems. So the current
> mapping of this patch is wrong. macOS uses a different mapping than the wasi
> API.
> 
> https://github.com/WebAssembly/wasi-libc/blob/main/libc-bottom-half/headers/public/__errno_values.h
> 
> https://github.com/emscripten-core/emscripten/blob/4af36cf80647f9a82be617a0ff32f3e56f220e41/system/include/wasi/api.h#L116
> 
> So please use a correct mapping as defined in that header file.
> 
> /Christian
> 
> > Alternatively 9p2000.u protocol variant could be used for Emscripten. Not
> > ideal, as this 9p protocol version is somewhat a legacy protocol from QEMU
> > perspective, reduced performance, less reliable, but it transmits error
> > strings to client which it can map to correct errno values by itself. Linux 9p
> > client uses a hash map for this errno translation of 9p2000.u error strings.

Stupid me. That's host errno -> Linux errno translation. So your values are
obviously correct, sorry!

However still worth comparing the Linux vs. wasi header files on this.

And I would avoid duplicating the macOS translation code. Instead I would just
do a one-line change:

#elif defined(CONFIG_DARWIN) || defined(EMSCRIPTEN)
...

And probably leave a comment with a link to the wasi API header file there, so
in case new errno translations are added for macOS, that people also check
whether those macros exist in the wasi header file as well.

/Christian

