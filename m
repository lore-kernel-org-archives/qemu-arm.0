Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2838371njk;
        Mon, 27 Jan 2025 18:16:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXEoyM07k/QFrKnjWdod9Hi5noacq5x2ktPEYoRXMvSBVe/iGsd7QdtBVCCzDf1mRRXsMpKNVzrS4Urrg==@linaro.org
X-Google-Smtp-Source: AGHT+IFBtry6ywrEiPpvYis+3j7baCoVv2zAIFBUw/BNr3stc1aqPBvuUTMYk0LIwpmq+X8ZH2Mc
X-Received: by 2002:a05:620a:1793:b0:7af:ce28:a10c with SMTP id af79cd13be357-7be63210307mr6326395785a.12.1738030566217;
        Mon, 27 Jan 2025 18:16:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738030566; cv=none;
        d=google.com; s=arc-20240605;
        b=WdXCJw4xzHDYlntUfWPqxns4zpm3Ym1fApmXc8UK7Xko1t9iAiuqZY/vIbRgeF0Bjh
         T+JL4fSMXCkmLseDEXtFB4r5sWBdIppHUxgCjtF0vsByN+zjLEpzWrzYe+o2lpZ6rvQU
         xA9rMZmwYjgnXC2MRUW/g6oDbJWdPWIZD190+OBacopqfCjLvlcIxP5VvNCSBeLJGOj3
         5z+cFxFpM0GeBrQ0SMy9FXZEZO/9KJwuBL59U8nHIBgFl6sTYB0ufR8DsCBW0zDEf2Oi
         5gfG0E1nci7HNXIy88bXYYkV30uElbiOI7RV5PmqdeX4vxR4qn36JSlh33GGrMlZJoxJ
         t9+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=r9xHoRG6np2r6PA/PJt0tvyafxMMFMkMC3nLervUekI=;
        fh=GFf9WJHhaUXxIlb4pu1GP18CWkszSlTxZVeTnaV2+90=;
        b=Xtukj2pPw/lyoYXVC90Exl/A4onydZxWp8lUU7CzKo6Bjz3KhH2C5ctS/ZQjB9CC8p
         1nWIV6Njo8Lfx43+vnNXVRybCqLW5ANpcd2YqLc9KvsifafpBvUZMbbzoabp15V3UzeS
         tFxIasCGuwu/7Ty6rnrtd+IhdtxBxmF6YC0lKtYRENE664wgqEdwts1o3NiUt/NxbQc/
         UEhUuvnhTWbQH6a655aFc7uG13MBu6EekO4OLqL7TgqhC0hYPwamnD8XePF2Ii3PhuH+
         RWsnYL1+baNjtrF5fF9HY02J+kO4ZEGiDz0pj9txsGDvk1yz9E+r/23N7PF964VkfRXh
         I3+g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Pl9c0gvJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be9ae845c2si1108658285a.70.2025.01.27.18.16.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 18:16:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Pl9c0gvJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tcb8F-0002n7-My; Mon, 27 Jan 2025 21:15:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1tcb8C-0002kk-Ma; Mon, 27 Jan 2025 21:15:13 -0500
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1tcb80-0004Iw-60; Mon, 27 Jan 2025 21:15:12 -0500
Received: by mail-vs1-xe2e.google.com with SMTP id
 ada2fe7eead31-4afdd15db60so1463281137.1; 
 Mon, 27 Jan 2025 18:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738030497; x=1738635297; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r9xHoRG6np2r6PA/PJt0tvyafxMMFMkMC3nLervUekI=;
 b=Pl9c0gvJbs+YweuAdTHqv2XbXtbpFNuTMREeBj9RcLOzicz1sJDjsjGWMnr60ZSKPI
 U085hLFfuKUslvQ+/QK79r4dnjs0naSkZU3GLwKmh1Er6uuhA4K1rPwkpfsdfULHhzRH
 8rHEopTdQ2FKgU23BAnl/KX5vY8EHuzXbVkkdKLOsby+74Sq9BhEZWbnqXAOZ+3MtEIf
 U4x1xY2hFO3bf3ywglifhtWhUaBMuucjRTtWorFVgrZecaiZWoA0+EGoUnmQLzkM4gck
 lHbAOHO2YhuHgEyav0xhCx8eXXaw9CXDNdCg9E7CVF0DxZrzCNEglfUy1LWfioIxrwv4
 z8IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738030497; x=1738635297;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r9xHoRG6np2r6PA/PJt0tvyafxMMFMkMC3nLervUekI=;
 b=TMI7el6Tg190g84PjpFMQMFAr6Ua0I4w3GlvO60r1SpMATduhTo4ew+78vcZJrEtxu
 GZqkImOYPY8Ny9PiR1nD6P0JBPFtNrwkgVZ1fnRRCoMOhblwUg6I4gtXp1PwJmu65LuL
 GqktkvcsYzuoco/8z5Vttb7viPt7L9Kyd9pOGs88XJyQPWLtI5RYtofy4psGp/u98H9M
 CeBrztQjCuwesDYHIA4prV4UPIZDgy0Cf1Dt2ToYmEznWS1jQl9F5XuCRPHntO5UW1oL
 tL2BhF8zqj6AXpB2rRHKfdiNqOq0nC1lYH4p4R/9UOmeXLAt6whLs7PUZI+4iNm7KL6Q
 vqtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1LFT6PZGCowReSdDks3eXoSg9SAts76ADj01N49wAiXZK1B4669YNQcEZQoRCyKxo8r7fQsqXj19p+g==@nongnu.org,
 AJvYcCUefRFVdnaJE3VbvRKFEIdXfAmzWHiHE++5oXba6kHLg7MRZPWvsO4y5e54o+WEwd5hqqzZGAEsjiQ=@nongnu.org,
 AJvYcCUvRy0OlRj7UmOXDPxFtFuokrSSej7n0v+XkzzR16PMvZN6c0Vpkul+EFNzfgJRKGKi4+A+cXj2+g==@nongnu.org,
 AJvYcCXLAylIXYYo7Ow1vzl00qBqgvhptcmhRyigT5Eot22ugOHRffVgU4++D5larEnCSV1XzrjNNloubJ5i9Q==@nongnu.org
X-Gm-Message-State: AOJu0Yw0icegZqrTTiGawRT44iOCj3o5LGpr9H2d75iY1PB4KVUJdgYr
 aAZDeixbAnj/B35PGCazHs6OsbyF32H9PWQL7P2YcDsYn+xrz6yVqDSGHo470MgaQVpq3CtBFaz
 62OaiXHg18AlRYc+2UcD8t35LUF87yw==
X-Gm-Gg: ASbGncv7bGZ2xOhLRe2hP3yCXruScHM44D9csKOUQrhvh4MIrFw4OEcZSuu5nlAk3/u
 mlq/BMeZk+UPWnanXdI3aVAKu0tBdj6MbBVJ3+2/r1kMP1KP2flCn3xECwhTA6qQNTBSvpbT1r3
 AwX6kQqHHZ/Rz8Mf5sn/eyGmnsAA==
X-Received: by 2002:a05:6102:548d:b0:4b6:5e0f:6ddc with SMTP id
 ada2fe7eead31-4b690be8ea7mr32059480137.14.1738030496737; Mon, 27 Jan 2025
 18:14:56 -0800 (PST)
MIME-Version: 1.0
References: <20250127113824.50177-1-philmd@linaro.org>
 <20250127113824.50177-3-philmd@linaro.org>
In-Reply-To: <20250127113824.50177-3-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 28 Jan 2025 12:14:30 +1000
X-Gm-Features: AWEUYZkQfhfKtkyt5YLJdZtqmowkuuA3J0M10zrKucB3xT4x3esttp3fdyDS9ko
Message-ID: <CAKmqyKMXZPnW3iTXVD8iL5cZRTxz+iokCYPhJuruFt7sm8GotQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] hw/loader: Remove unused load_elf_ram()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2e;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: cV/nbAqHPPXu

On Mon, Jan 27, 2025 at 9:39=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> Last use of load_elf_ram() was removed in commit 188e255bf8e
> ("hw/s390x: Remove the possibility to load the s390-netboot.img
> binary"), remove it.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/loader.h | 14 +-------------
>  hw/core/loader.c    | 16 +---------------
>  2 files changed, 2 insertions(+), 28 deletions(-)
>
> diff --git a/include/hw/loader.h b/include/hw/loader.h
> index 8985046be40..9bb34e6f062 100644
> --- a/include/hw/loader.h
> +++ b/include/hw/loader.h
> @@ -155,20 +155,8 @@ ssize_t load_elf_ram_sym(const char *filename,
>                           int clear_lsb, int data_swab,
>                           AddressSpace *as, bool load_rom, symbol_fn_t sy=
m_cb);
>
> -/** load_elf_ram:
> - * Same as load_elf_ram_sym(), but doesn't allow the caller to specify a
> - * symbol callback function
> - */
> -ssize_t load_elf_ram(const char *filename,
> -                     uint64_t (*elf_note_fn)(void *, void *, bool),
> -                     uint64_t (*translate_fn)(void *, uint64_t),
> -                     void *translate_opaque, uint64_t *pentry,
> -                     uint64_t *lowaddr, uint64_t *highaddr, uint32_t *pf=
lags,
> -                     int big_endian, int elf_machine, int clear_lsb,
> -                     int data_swab, AddressSpace *as, bool load_rom);
> -
>  /** load_elf_as:
> - * Same as load_elf_ram(), but always loads the elf as ROM
> + * Same as load_elf_ram_sym(), but always loads the elf as ROM
>   */
>  ssize_t load_elf_as(const char *filename,
>                      uint64_t (*elf_note_fn)(void *, void *, bool),
> diff --git a/hw/core/loader.c b/hw/core/loader.c
> index 4dfdb027eee..ead10fb6cb5 100644
> --- a/hw/core/loader.c
> +++ b/hw/core/loader.c
> @@ -425,26 +425,12 @@ ssize_t load_elf_as(const char *filename,
>                      uint64_t *highaddr, uint32_t *pflags, int big_endian=
,
>                      int elf_machine, int clear_lsb, int data_swab,
>                      AddressSpace *as)
> -{
> -    return load_elf_ram(filename, elf_note_fn, translate_fn, translate_o=
paque,
> -                        pentry, lowaddr, highaddr, pflags, big_endian,
> -                        elf_machine, clear_lsb, data_swab, as, true);
> -}
> -
> -/* return < 0 if error, otherwise the number of bytes loaded in memory *=
/
> -ssize_t load_elf_ram(const char *filename,
> -                     uint64_t (*elf_note_fn)(void *, void *, bool),
> -                     uint64_t (*translate_fn)(void *, uint64_t),
> -                     void *translate_opaque, uint64_t *pentry,
> -                     uint64_t *lowaddr, uint64_t *highaddr, uint32_t *pf=
lags,
> -                     int big_endian, int elf_machine, int clear_lsb,
> -                     int data_swab, AddressSpace *as, bool load_rom)
>  {
>      return load_elf_ram_sym(filename, elf_note_fn,
>                              translate_fn, translate_opaque,
>                              pentry, lowaddr, highaddr, pflags, big_endia=
n,
>                              elf_machine, clear_lsb, data_swab, as,
> -                            load_rom, NULL);
> +                            true, NULL);
>  }
>
>  /* return < 0 if error, otherwise the number of bytes loaded in memory *=
/
> --
> 2.47.1
>
>
