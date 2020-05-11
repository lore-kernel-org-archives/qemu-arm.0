Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp79681lfb;
        Mon, 11 May 2020 03:48:30 -0700 (PDT)
X-Google-Smtp-Source: APiQypJGuPEzxugUUyBtNrChprv739EsBhMacvem/wkCVXPByKuTxYz6CeJNWz5sIZebsXPAnF/I
X-Received: by 2002:a17:906:1d4c:: with SMTP id o12mr13179503ejh.357.1589194110173;
        Mon, 11 May 2020 03:48:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589194110; cv=none;
        d=google.com; s=arc-20160816;
        b=1KqbBdOcNoeVL/mHBLqBSyrWrOHSqc1TAkDDVfb+YVuXYSqVWbktDA3Unt9uXtdgpV
         icwYuSoZu9yuJyorWGvJDo6WZUnRIMbcUEOrG7C6zCbhJ5FR4nMXLpSJQeeA1uNgDCWC
         pwvPF9bEjmdR7BayAlBBZ7wnzifcodlQZT6r2vpCqG2cFatsCXO7C8aPo9ivgdRIpGxI
         LyHU31ibW//lHLn8M1qFOvqIV1xjGr9YJSbaiPpowa+75EpZ2MMLd16diZ6jjC+1fIru
         d/0YOG8T3SLqt8roedN3n4YibyzUlvtoimaHoOlMVrEjinlBuARCom6Y2Dwa6uD0hf4l
         vJCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:dkim-signature;
        bh=KlmmA2MHC2p9ucBn5WuzMb+82+m0WhyyJAMEd9g6YCk=;
        b=eCURzHDEMFv078MfiBOyFOOEHrAGxDvTjjwq3VolA52zzdsbf+hE4xsOEhmUUz4OVc
         TJp0cMIpDz37rhDOiZPIwV6qz4DNbu0y1Gn3G4JFtOmsffLy3M/6eXgVaVWAo3btAIEL
         bIHUqMwpG29+Ts3A5TdZ59pIkvmYG61TUnfK182Ez6uSJu1sMclqsYfRVGCa+1TyvvvJ
         zNjH/qYM7DaN7eai6x4CYhxnFhvKB39dcWEe6CqGkK+P0+zoVfNuMe5XC3nVEgZyUxnT
         ZqrhE+w5b9kJqF8Vw9CdSQHOhVJMBU+D1K6EHoEDOgUDhEogzLjNmQaw3j8UMcfsLEST
         5raQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aq8ufIiO;
       spf=pass (google.com: domain of cohuck@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id v5si5541996eji.392.2020.05.11.03.48.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 May 2020 03:48:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aq8ufIiO;
       spf=pass (google.com: domain of cohuck@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589194109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KlmmA2MHC2p9ucBn5WuzMb+82+m0WhyyJAMEd9g6YCk=;
	b=aq8ufIiO7l1TMEDMebb6wpMwAZrtd2OC5z8tDEunYkqnr8zFygltw4xxbwqs7oCrNby8xU
	sXkrE66cdMxL5iFVeu1UafI1S6LcFoKqM2Dtgc7SoMu5uQz+H9cEYHX6WETpgXmUDWF7Bv
	mBZa4ut9ssBj8+llXRfMf4CUiy7NWg8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-3HDEFuK_NcqXad5t8TAN2Q-1; Mon, 11 May 2020 06:48:25 -0400
X-MC-Unique: 3HDEFuK_NcqXad5t8TAN2Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40BA2100CCCA;
	Mon, 11 May 2020 10:48:22 +0000 (UTC)
Received: from gondolin (ovpn-112-254.ams2.redhat.com [10.36.112.254])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 600E9196B9;
	Mon, 11 May 2020 10:48:13 +0000 (UTC)
Date: Mon, 11 May 2020 12:48:04 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>, Mark
 Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Max Filippov
 <jcmvbkbc@gmail.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Stafford Horne <shorne@gmail.com>, Roman
 Bolshakov <r.bolshakov@yadro.com>, Sagar Karandikar
 <sagark@eecs.berkeley.edu>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-s390x@nongnu.org, Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Marek Vasut <marex@denx.de>, Alistair Francis <Alistair.Francis@wdc.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-riscv@nongnu.org, Aurelien Jarno
 <aurelien@aurel32.net>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Chris Wulff <crwulff@gmail.com>, Richard Henderson
 <rth@twiddle.net>, David Gibson <david@gibson.dropbear.id.au>, David
 Hildenbrand <david@redhat.com>, Alex =?UTF-8?B?QmVubsOpZQ==?=
 <alex.bennee@linaro.org>
Subject: Re: [PATCH 08/11] target/s390x: Restrict system-mode declarations
Message-ID: <20200511124804.1a7a43aa.cohuck@redhat.com>
In-Reply-To: <20200509130910.26335-9-f4bug@amsat.org>
References: <20200509130910.26335-1-f4bug@amsat.org>
	<20200509130910.26335-9-f4bug@amsat.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: mRRwaEh9Ij8n

On Sat,  9 May 2020 15:09:07 +0200
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> As these declarations are restricted to !CONFIG_USER_ONLY in
> helper.c, only declare them when system-mode emulation is used.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  target/s390x/internal.h | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>=20
> diff --git a/target/s390x/internal.h b/target/s390x/internal.h
> index c1678dc6bc..ddc276cdf4 100644
> --- a/target/s390x/internal.h
> +++ b/target/s390x/internal.h
> @@ -236,7 +236,6 @@ int s390_cpu_write_elf64_note(WriteCoreDumpFunction f=
, CPUState *cs,
> =20
>  /* cc_helper.c */
>  const char *cc_name(enum cc_op cc_op);
> -void load_psw(CPUS390XState *env, uint64_t mask, uint64_t addr);
>  uint32_t calc_cc(CPUS390XState *env, uint32_t cc_op, uint64_t src, uint6=
4_t dst,
>                   uint64_t vr);
> =20
> @@ -303,18 +302,20 @@ void s390_cpu_gdb_init(CPUState *cs);
> =20
>  /* helper.c */
>  void s390_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
> -hwaddr s390_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
> -hwaddr s390_cpu_get_phys_addr_debug(CPUState *cpu, vaddr addr);
> +void do_restart_interrupt(CPUS390XState *env);
> +
> +#ifndef CONFIG_USER_ONLY
> +void load_psw(CPUS390XState *env, uint64_t mask, uint64_t addr);

load_psw() is in cc_helper.c (and not in helper.c). Rather add the
#ifndef above, even if it is a bit awkward? Otherwise, the wrong
comment makes it confusing.

>  uint64_t get_psw_mask(CPUS390XState *env);
>  void s390_cpu_recompute_watchpoints(CPUState *cs);
>  void s390x_tod_timer(void *opaque);
>  void s390x_cpu_timer(void *opaque);
> -void do_restart_interrupt(CPUS390XState *env);
>  void s390_handle_wait(S390CPU *cpu);
> +hwaddr s390_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
> +hwaddr s390_cpu_get_phys_addr_debug(CPUState *cpu, vaddr addr);
>  #define S390_STORE_STATUS_DEF_ADDR offsetof(LowCore, floating_pt_save_ar=
ea)
>  int s390_store_status(S390CPU *cpu, hwaddr addr, bool store_arch);
>  int s390_store_adtl_status(S390CPU *cpu, hwaddr addr, hwaddr len);
> -#ifndef CONFIG_USER_ONLY
>  LowCore *cpu_map_lowcore(CPUS390XState *env);
>  void cpu_unmap_lowcore(LowCore *lowcore);
>  #endif /* CONFIG_USER_ONLY */
