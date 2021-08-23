Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp2281626lfg;
        Mon, 23 Aug 2021 15:48:10 -0700 (PDT)
X-Received: by 2002:a62:7ed0:0:b0:3e1:99bb:d824 with SMTP id z199-20020a627ed0000000b003e199bbd824mr35747171pfc.34.1629758889830;
        Mon, 23 Aug 2021 15:48:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629758889; cv=none;
        d=google.com; s=arc-20160816;
        b=YIk0vl0zaaAy6Kd8Ot1UNsys3KJ/ep8bKC6pCrMcrIo1kZg78BP0R6VPUzEMVkOzLx
         7M4533Y6WQmINohvwPKCFKRv6XWKYq5KNGVGxs4sMHlYT8uxCcq3f1Pf/oyKge1kc73M
         7Gl6oETuwMK8m9jbKz7YKQ0ty/rOjN9n589GVOLsesVDmAmGtvv2u6MZXzFCZeaq7iQl
         aGiY5e0z9yeQL/quu2As/vst4UfEJhWtsfOWEHk35Ersg49ZMQIHzPLF1gw5IkJEWhbl
         7GzfeUe0T1kEA5bPAmCSX1WKqKDavCfp9s/IXIAFkrX10T7i1HAff3XZRNbF9DzWQd6S
         Ku8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=C9Ryswg6b8sFnt1nqfjsT9/BG4Qszs4WL1eSmKn8BGk=;
        b=jHW04u3yzxeXQRhiUgq+QOzNYT0c+KR4naAolQIyLut6MXFkTOTQfu/vYEXJjC3WfE
         9naGyIgzfw+jS05FfYmxOcETC7FsQOvK2brftJkujwAjad79VDZ9uwa3AbcC+DX9eCbr
         Dr5G8GIYUAVfoUfuaSCU3qQf2prSOvWGZHEcggA3mTOe/Zv6BW76lo8Iw3jIfk0jMofG
         +KwHJh0G5pKtwYAcT1adG1pDO+NT31j2PqbHhZfFVKSjm19QESWKHCNHChGZ5IZCJ9B9
         PbXDoD+d0C1MPcgFC8wOOFDkN5FczEbiI29LN4K+RN8mSGH49rYCF5r8hRCt0Tm8lWCk
         idKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=hQF36mRU;
       spf=pass (google.com: domain of changbin.du@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=changbin.du@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <changbin.du@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j24sor274673pjn.2.2021.08.23.15.48.09
        (Google Transport Security);
        Mon, 23 Aug 2021 15:48:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of changbin.du@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=hQF36mRU;
       spf=pass (google.com: domain of changbin.du@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=changbin.du@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=C9Ryswg6b8sFnt1nqfjsT9/BG4Qszs4WL1eSmKn8BGk=;
        b=hQF36mRUoPPLg/tVE9p/1n8wI/vt1rliafW9EgAA7qpLuOI9cMUjhIYbA/uL77qrlm
         d58a1e70nkf+vTExq2cPnvkLxoCDyb3nVUdGQmpDXSomqsXLl1fUIegdF6laTb13q0nI
         4uLp9k8eNufcUymp/hi/Cm6PeRut1l6xAYJACgKzqwsETmXtNEKQSgpZxagrIF/0PiD5
         zWxsxL+LTkzeDKwj7e3eX7VfcDIN5f5EI9OQITILsMyedE7dEVmjdAN3ua+FA2pljahY
         MR46ZC765EhRQFnhEGoFbyLCGYkJoK/L60o2YumDRkP0gQ6hSngeeUlYEV8NmTgbkp93
         FPRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=C9Ryswg6b8sFnt1nqfjsT9/BG4Qszs4WL1eSmKn8BGk=;
        b=TnZmpuTg4EoZOLaUBhHD84BnbrSPCKnRJ2dxVM3oTxtok2B6lmcPv1pT66sXWZmiJv
         jHsrZJuuQWazaTMfkJFr6w5ydE9MCS71CZfstttumis5KMx0iOfSAAyIWqwzYuqi9GrK
         bxWgakBfwK5enYXg8l2wSzjxFS0bDlD9cB4Ao84wW7HIdodsUcEtBVgJ08yjuF89Qt6V
         Sp4RT1RCVItsCQdOfoXX+5ATxYu0w1Pu0mm9DbT1VqjaNO/kRbXZk0c+o3/MUQ86hJE0
         DkmdrCIoScSBqZCxiXpcv+NwELuS1optr9facdGlWxoLGrnBSZGLZ7vz7GWlsxLxi/DF
         pQdg==
X-Gm-Message-State: AOAM533NWonE6K0NDbjFugLh/PCFry/x7WChHIo/jHGzdvWxJK/FQtNd
	yz2JWG0boewo7uQpw746hI8=
X-Google-Smtp-Source: ABdhPJwZNYqPWGPEiCe3cfhdG05XtrnEYeejz/6koxB3pN+agS7KjdTetnOkfN30F5PAdCuS+9SjKA==
X-Received: by 2002:a17:90b:3ec5:: with SMTP id rm5mr902251pjb.110.1629758889338;
        Mon, 23 Aug 2021 15:48:09 -0700 (PDT)
Return-Path: <changbin.du@gmail.com>
Received: from mail.google.com ([141.164.41.4])
        by smtp.gmail.com with ESMTPSA id k4sm17048334pff.12.2021.08.23.15.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 15:48:08 -0700 (PDT)
Date: Tue, 24 Aug 2021 06:47:56 +0800
From: Changbin Du <changbin.du@gmail.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: Changbin Du <changbin.du@gmail.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, qemu-riscv@nongnu.org
Subject: Re: [PATCH 0/3] gdbstub: add support for switchable endianness
Message-ID: <20210823224756.p7qtttv675gumtri@mail.google.com>
References: <20210823142004.17935-1-changbin.du@gmail.com>
 <7523c6ad-52cd-0b20-b09d-01bd537edbb3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7523c6ad-52cd-0b20-b09d-01bd537edbb3@redhat.com>
X-TUID: K1iBGyN9os0i

On Mon, Aug 23, 2021 at 05:21:07PM +0200, Philippe Mathieu-Daudé wrote:
> On 8/23/21 4:20 PM, Changbin Du wrote:
> > To resolve the issue to debug switchable targets, this serias introduces
> > basic infrastructure for gdbstub and enable support for ARM and RISC-V
> > targets.
> > 
> > For example, now there is no problem to debug an big-enadian aarch64 target
> > on x86 host.
> > 
> >   $ qemu-system-aarch64 -gdb tcp::1234,endianness=big ...
> 
> I don't understand why you need all that.
> Maybe you aren't using gdb-multiarch?
>
Nope, my gdb support all architectures.

> You can install it or start it via QEMU Debian Docker image:
> 
> $ docker run -it --rm -v /tmp:/tmp -u $UID --network=host \
>   registry.gitlab.com/qemu-project/qemu/qemu/debian10 \
>   gdb-multiarch -q \
>     --ex 'set architecture aarch64' \
>     --ex 'set endian big'
> The target architecture is assumed to be aarch64
> The target is assumed to be big endian
> (gdb) target remote 172.17.0.1:1234
> (gdb)
>
The gdb has no problem to read endianness and arch info from elf. The problem
is how qemu gdbstub handles the byte order it received.

Now let's try to debug a big-enadian aarch64 linux kernel.

1) start qemu with '-gdb tcp::1234'

$ gdb-multiarch vmlinux
(gdb) target remote :1234
Remote debugging using :1234
0x0000004000000000 in ?? ()
=> 0x0000004000000000:	Cannot access memory at address 0x4000000000
(gdb) ni
Cannot access memory at address 0x4000000000
(gdb) show architecture 
The target architecture is set to "auto" (currently "aarch64").
(gdb) show endian 
The target endianness is set automatically (currently big endian).

You see it an't work, not to mention adding breakpoints.

2) start qemu with '-gdb tcp::1234,endianness=big'

$ gdb-multiarch vmlinux
(gdb) target remote :1234
Remote debugging using :1234
0x0000000040000000 in ?? ()
=> 0x0000000040000000:	c0 00 00 58	ldr	x0, 0x40000018
(gdb) ni
0x0000000040000004 in ?? ()
=> 0x0000000040000004:	e1 03 1f aa	mov	x1, xzr
(gdb) b start_kernel
Breakpoint 1 at 0xffff800011130ee8 (2 locations)
(gdb) c
Continuing.

Thread 1 hit Breakpoint 1, 0xffff800011130ee8 in start_kernel ()
=> 0xffff800011130ee8 <start_kernel+0>:	5f 24 03 d5	bti	c
(gdb) bt
#0  0xffff800011130ee8 in start_kernel ()
#1  0xffff8000111303c8 in __primary_switched () at arch/arm64/kernel/head.S:467
Backtrace stopped: previous frame identical to this frame (corrupt stack?)

okay, now it works fine.

-- 
Cheers,
Changbin Du
