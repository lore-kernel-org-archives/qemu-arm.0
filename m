Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp2292178lfg;
        Mon, 23 Aug 2021 16:05:44 -0700 (PDT)
X-Received: by 2002:a17:902:ab53:b029:12c:57a6:13ae with SMTP id ij19-20020a170902ab53b029012c57a613aemr30436778plb.53.1629759943963;
        Mon, 23 Aug 2021 16:05:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629759943; cv=none;
        d=google.com; s=arc-20160816;
        b=rSOX3cBESVDY1qA7veDRpz+a+NR9uLTttegt8AhgRvue8dLQsiPVAXjIITF4NOlvde
         zDT372ytbLUlaHnhQ6wgQrpinTDZ+2w3mpFawhZBUf7fPiB5XFPiI6fbBBergxJg+elm
         maQxXhTZ1D0xmLt9Cxnz9aF0jbru5sO/cQQrWop93dRSCMMToU2H1BoM3f19tVMZ4mtq
         4AKdBGw/6AzpJMxe+zMbuW3F50k5zRmfj3VnmrSv1N1dbKrCDmrGPa/lN0i5QVpy4fsN
         S6yT6Hjt5ynxNWpMI0ecCgn6EttnSyU3ZtumRnCvlCD2mAQHXAxnZZSw/ddizlT/hvTo
         /PkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=JW3d3CKiYWG0P5M1jjy7msXIjoNn2Et5CEq342/vUTg=;
        b=BFxXDZOCVskDBPgY2W1RaHE2LUKZith8hKu5OC8X+iP2hmHxSHoUpkP7NDaSrY3Znl
         TPbFtt7eyjZ/hcXMdXdEZ824JCxJExrxqQgrUwUNPKW0gM6573kIJrYBSETfnexYMDkb
         KVNQe1r1EjtqF9lb+K2ebcALtBLlrqqc7lJXfce9k58Ob7C/AhKKvwQ6QjgYavZxGcU8
         4zgW7Hj815Nyy5Td1jCdiTOOMZpA6YSoXdgacwbilWk0NhyNk/n9x4pMuU4Bq141CmqC
         6UJzgNTAvirKl1OW6wOWt4udanlQFm5X2WCIkkFriEFnXvWoPN7jitZnW6iHqxYsdmpD
         62Ig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=i9l5SeF+;
       spf=pass (google.com: domain of changbin.du@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=changbin.du@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <changbin.du@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k4sor5680pgj.24.2021.08.23.16.05.43
        (Google Transport Security);
        Mon, 23 Aug 2021 16:05:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of changbin.du@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=i9l5SeF+;
       spf=pass (google.com: domain of changbin.du@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=changbin.du@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=JW3d3CKiYWG0P5M1jjy7msXIjoNn2Et5CEq342/vUTg=;
        b=i9l5SeF+LPsuZayn9/1DdRw5ojB1Vx72jIao4RSkeXts4drqx6pMABxLl9lJh+G6hG
         PZQgyAf/jS3/0kruQy3GS4V5BJN0U3OE0RR+4TPIIdl+Of8iseVxqc4/auyuori7504h
         NZihaiUGJgWDp0NNZZ3bUhVaALC7JOSx81iZgfgmTwlwXPb6KZ+Ck3eI/BUld8qPPMm9
         8u7zqHOyH3JWEilzEBYQy0LweUi8o6g8xTqor0TP81Jr23yVh93j37jrsYAbM8owjmoh
         c8D31eKs45o9ZUDI4WFIKJHYHQErsHfl80Oxt2n0GzAfBkvPBgU0TUQOVJqd2paAIZO9
         bdjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=JW3d3CKiYWG0P5M1jjy7msXIjoNn2Et5CEq342/vUTg=;
        b=H0QrKxKruuxdEDG+DEj6RnP9F39+QUmKlLhXekPZjQ/A3L3NHmBEH0bCDJl+2MLYBU
         vfDIj5VlRibPFU8vkzOFKuheUV4JOr59aMvr5D+U9OK/FtB9/kTg2nfLn6qtPqu22V0Y
         HWsoLsgn+gNFaVBErvCSajaPOshZy6qezlLwpnv1A+V1WRVtf0Vm9pdZeRCOIHMqWSr8
         YwUniozFjrXnpiVBqH0tV4xh8I+keL1tX7M5pBIJ3E77l9wC41jR8QC4He+TQhSyFX+3
         SzHEXMU3kbstaKoZtDaG6zpprqjfErw7TmqPlGcsMjhTMt2U5p2I02ID8rzdmR/LRsFg
         PkWQ==
X-Gm-Message-State: AOAM5306QUNgjP5uwF52btysXHnhT7POaJx+ufMv4wp5MZIDps97XFOC
	3uIawpfJkWi+5ihFU/+VxEIgU3CJOLugPA==
X-Google-Smtp-Source: ABdhPJzB6lUbQ55FTmaSxafbCovZCZAn6A4xKkze17JWYb0oB/phYm8b5xeVnu1I6JaUZbZyCxX5+Q==
X-Received: by 2002:a63:8948:: with SMTP id v69mr34146486pgd.132.1629759943276;
        Mon, 23 Aug 2021 16:05:43 -0700 (PDT)
Return-Path: <changbin.du@gmail.com>
Received: from mail.google.com ([141.164.41.4])
        by smtp.gmail.com with ESMTPSA id lk17sm255431pjb.44.2021.08.23.16.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 16:05:42 -0700 (PDT)
Date: Tue, 24 Aug 2021 07:05:35 +0800
From: Changbin Du <changbin.du@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Changbin Du <changbin.du@gmail.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bin.meng@windriver.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	"open list:RISC-V" <qemu-riscv@nongnu.org>
Subject: Re: [PATCH 0/3] gdbstub: add support for switchable endianness
Message-ID: <20210823230535.js3gymomh2chmznc@mail.google.com>
References: <20210823142004.17935-1-changbin.du@gmail.com>
 <7523c6ad-52cd-0b20-b09d-01bd537edbb3@redhat.com>
 <CAFEAcA8WKdZiuzjXgwj_9T7ewDbkLky+_NKaXw6WQ95V8x=0Tw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA8WKdZiuzjXgwj_9T7ewDbkLky+_NKaXw6WQ95V8x=0Tw@mail.gmail.com>
X-TUID: B4PvPXWimimx

On Mon, Aug 23, 2021 at 04:30:05PM +0100, Peter Maydell wrote:
> On Mon, 23 Aug 2021 at 16:21, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
> >
> > On 8/23/21 4:20 PM, Changbin Du wrote:
> > > To resolve the issue to debug switchable targets, this serias introduces
> > > basic infrastructure for gdbstub and enable support for ARM and RISC-V
> > > targets.
> > >
> > > For example, now there is no problem to debug an big-enadian aarch64 target
> > > on x86 host.
> > >
> > >   $ qemu-system-aarch64 -gdb tcp::1234,endianness=big ...
> >
> > I don't understand why you need all that.
> > Maybe you aren't using gdb-multiarch?
> >
> > You can install it or start it via QEMU Debian Docker image:
> >
> > $ docker run -it --rm -v /tmp:/tmp -u $UID --network=host \
> >   registry.gitlab.com/qemu-project/qemu/qemu/debian10 \
> >   gdb-multiarch -q \
> >     --ex 'set architecture aarch64' \
> >     --ex 'set endian big'
> > The target architecture is assumed to be aarch64
> > The target is assumed to be big endian
> > (gdb) target remote 172.17.0.1:1234
> 
> I don't think that will help, because an AArch64 CPU (at least
> in the boards we model) will always start up in little-endian,
> and our gdbstub will always transfer register data etc in
> little-endian order, because gdb cannot cope with a target that
> isn't always the same endianness. Fixing this requires gdb
Yes, that's the problem.

> changes to be more capable of handling dynamic target changes
> (this would also help with eg debugging across 32<->64 bit switches);
> as I understand it that gdb work would be pretty significant,
> and at least for aarch64 pretty much nobody cares about
> big-endian, so nobody's got round to doing it yet.
> 
Mostly we do not care dynamic target changes because nearly all OS will setup
endianness mode by its first instruction. And dynamic changes for gdb is hard
since the byte order of debugging info in elf is fixed. And currently the GDB
remote protocol does not support querying endianness info from remote.

So usually we needn't change byte order during a debug session, but we just want
the qemu gdbstub can send data in and handle data it received in right byte order.
This patch does this work with the help of users via the option 'endianness='.

> Our target/ppc/gdbstub.c code takes a different tack: it
> always sends register data in the same order the CPU is
> currently in, which has a different set of cases when it
> goes wrong.
>
Yes, I tried to do this before. But as I said above GDB unable to handle dynamic
target changing. Maybe we can take this way as 'endianness=default'? Anyway,
this requires each target provides a interface to determine the current byte
order.

> thanks
> -- PMM

-- 
Cheers,
Changbin Du
