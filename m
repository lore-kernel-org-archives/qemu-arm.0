Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp862888wrg;
        Thu, 16 May 2019 09:43:40 -0700 (PDT)
X-Received: by 2002:aca:cc41:: with SMTP id c62mr7401648oig.167.1558025020547;
        Thu, 16 May 2019 09:43:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558025020; cv=none;
        d=google.com; s=arc-20160816;
        b=uvez6givo+XmyFewLGj1PZbNS0AQf1NqwJ79zyIGTvPQbT8rHS5o6B3dcQnv04EWhN
         qxeG2tBN/zUIXCXdfemMMbPrQCJuIUw4l7JV+aqSGs6ZocFD/Uldo6iSzBTlf5iD4Zkx
         nyo6VaF6lV6cbmFHD2CaNbPjMoGLZ7XH7IMSPA3IR9jhIC9zcbbucuyN3JaZ2Uixrnnj
         2InFkMQ3IweLvAfe3cOfoFMQnIMpgRI8S4TLVs2Y8q8KuA8ZS+1Eq11dSoXBrKY2pRQZ
         7OYj/tNryN+U+LrRVkkkNJk/EG8fGLE49rdvvfr8cqlE/KE4NKX9PWV/hGqPIms9GAMX
         DLaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7+za8/mffhd/+flkPPB9/EXj+dL01I/fv/Vq9n9G+4A=;
        b=zohr7SxUoPWpSmZgvQXjle14UHfr/P1Y9DDyGGTRVgeGdTLPbynj6mgPu9XpVzN87d
         h253R8P1nVhIASmN2eO5e4ShOGNdnjT6z/o6zTmgOjQcVwNRabWqPti5rQ2uX5sqAtOA
         MT+3kvG9fiKuJTwsDBbvkVBDZXOcnR1o6QTRUHw+pcgjBlEBE5sPMeJOgiVpXTnFw1Yb
         jzXaoC1qsFK0swbYMbhRKX3RboPMExuUTe/8uIzSBhog9FaG8v5o8DYiL/lrhIjeBlGk
         yscKpYmoDxjaV/02S9o1quq0qynmMiBIOthmug/xCkH7AuRPv7aSh8tYbIjz8TxMTWAN
         ZARg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dvYgO0L9;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id h11sor397215otq.150.2019.05.16.09.43.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 16 May 2019 09:43:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dvYgO0L9;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7+za8/mffhd/+flkPPB9/EXj+dL01I/fv/Vq9n9G+4A=;
        b=dvYgO0L9sd/CbCApiufLqliLyg1PBnS8hlJ/xecY4FNUZvATBGqhpPINlETT6E7v0s
         fhB6NkeqBLhX02aO+Ai9qO3xWmAgPg2VDNH4Z0ke9U3N1puuu3DIQPOZ2fMEdepY+Piv
         3J/UjFxH9Py3Y3FWNUMESh4rKVOAToRjGmQM6iVaXGKW7US92hnUQkH013Ze02u+TUvj
         vh0tuXnrI/qIfyJa7ebqYJ66UBO/fTi7WO35FbjmlQSJm8YZ50CSvzGQ9CULn9GB2iwJ
         fSxtl9eQJTpgt5r+THcvUIDXKCaEfgWTULTRfy4j6y1socwZZnuLANN/K/wdhNqfD+EM
         m8eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7+za8/mffhd/+flkPPB9/EXj+dL01I/fv/Vq9n9G+4A=;
        b=mV5AcNG6uXe5nDPAlm3DkserkTJY6vt2Bgxa9ssubVGAJ4tagor1XhRaoG13fkVFix
         YFkTa59vvjG9f4XtbDAUYqJVZ0Fa/CEkB/nYiQ3XTYhjwjWOia4cCqUmqFAU0BJG6ubm
         TtUHEj6Uea0CDT7UNcxBwhNhOq9Z6xQfmsTjqfKO+hsxjPjaSbSuqxsaKwr7S0Lfczz/
         2zJnoVDCxAvMv32yNAJWF9Z6/ObPY3tx8G3cXe5A/TDaExplt28azI/8630q4RN9zgns
         tQHCWdIo2jJRhQKbIyFwqn1JUwabRp9zvbITTrzGi6oLjx7qMJdEVkmyxxbCufUe3PvZ
         A52Q==
X-Gm-Message-State: APjAAAWMA68UNba5HD0CYdxUeYZKnF2aAIdFFRwxDwGW0KJw3I5FXVWn
	qJes+QNTyOJK0Bt7gKaYw+w7YaXK0UtM5tAgJ6IFPfUw
X-Google-Smtp-Source: APXvYqwLu8cONCw0CKhczX+QZb/Nrhaj9bm4pNmUkcAbABtmCEhkfvL2NarjGsXr46Oewmvj9FM/yKkotWyrFxDqgcI=
X-Received: by 2002:a9d:760b:: with SMTP id k11mr29107479otl.135.1558025019335;
 Thu, 16 May 2019 09:43:39 -0700 (PDT)
MIME-Version: 1.0
References: <ad91b397f360b2fc7f4087e476f7df5b04d42ddb.1558021877.git.alistair.francis@wdc.com>
In-Reply-To: <ad91b397f360b2fc7f4087e476f7df5b04d42ddb.1558021877.git.alistair.francis@wdc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 May 2019 17:43:28 +0100
Message-ID: <CAFEAcA85+TK5LbsJRa8r1G4--J10AAceWS_o4-SmnoOp5VACFA@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] target/arm: Fix vector operation segfault
To: Alistair Francis <alistair.francis@wdc.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Alistair Francis <alistair23@gmail.com>, 
	qemu-arm <qemu-arm@nongnu.org>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: dZq2CL7DxXKl

On Thu, 16 May 2019 at 16:56, Alistair Francis <alistair.francis@wdc.com> w=
rote:
>
> Commit 89e68b575 "target/arm: Use vector operations for saturation"
> causes this abort() when booting QEMU ARM with a Cortex-A15:
>
> 0  0x00007ffff4c2382f in raise () at /usr/lib/libc.so.6
> 1  0x00007ffff4c0e672 in abort () at /usr/lib/libc.so.6
> 2  0x00005555559c1839 in disas_neon_data_insn (insn=3D<optimized out>, s=
=3D<optimized out>) at ./target/arm/translate.c:6673
> 3  0x00005555559c1839 in disas_neon_data_insn (s=3D<optimized out>, insn=
=3D<optimized out>) at ./target/arm/translate.c:6386
> 4  0x00005555559cd8a4 in disas_arm_insn (insn=3D4081107068, s=3D0x7fffe59=
a9510) at ./target/arm/translate.c:9289
> 5  0x00005555559cd8a4 in arm_tr_translate_insn (dcbase=3D0x7fffe59a9510, =
cpu=3D<optimized out>) at ./target/arm/translate.c:13612
> 6  0x00005555558d1d39 in translator_loop (ops=3D0x5555561cc580 <arm_trans=
lator_ops>, db=3D0x7fffe59a9510, cpu=3D0x55555686a2f0, tb=3D<optimized out>=
, max_insns=3D<optimized out>) at ./accel/tcg/translator.c:96
> 7  0x00005555559d10d4 in gen_intermediate_code (cpu=3Dcpu@entry=3D0x55555=
686a2f0, tb=3Dtb@entry=3D0x7fffd7840080 <code_gen_buffer+126091347>, max_in=
sns=3Dmax_insns@entry=3D512) at ./target/arm/translate.c:13901
> 8  0x00005555558d06b9 in tb_gen_code (cpu=3Dcpu@entry=3D0x55555686a2f0, p=
c=3D3067096216, cs_base=3D0, flags=3D192, cflags=3D-16252928, cflags@entry=
=3D524288) at ./accel/tcg/translate-all.c:1736
> 9  0x00005555558ce467 in tb_find (cf_mask=3D524288, tb_exit=3D1, last_tb=
=3D0x7fffd783e640 <code_gen_buffer+126084627>, cpu=3D0x1) at ./accel/tcg/cp=
u-exec.c:407
> 10 0x00005555558ce467 in cpu_exec (cpu=3Dcpu@entry=3D0x55555686a2f0) at .=
/accel/tcg/cpu-exec.c:728
> 11 0x000055555588b0cf in tcg_cpu_exec (cpu=3D0x55555686a2f0) at ./cpus.c:=
1431
> 12 0x000055555588d223 in qemu_tcg_cpu_thread_fn (arg=3D0x55555686a2f0) at=
 ./cpus.c:1735
> 13 0x000055555588d223 in qemu_tcg_cpu_thread_fn (arg=3Darg@entry=3D0x5555=
5686a2f0) at ./cpus.c:1709
> 14 0x0000555555d2629a in qemu_thread_start (args=3D<optimized out>) at ./=
util/qemu-thread-posix.c:502
> 15 0x00007ffff4db8a92 in start_thread () at /usr/lib/libpthread.
>
> This patch ensures that we don't hit the abort() in the second switch
> case in disas_neon_data_insn() as we will return from the first case.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>



Applied to target-arm.next, thanks.

-- PMM
