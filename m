Received: by 10.25.159.131 with SMTP id i125csp2026185lfe;
        Tue, 6 Dec 2016 03:27:30 -0800 (PST)
X-Received: by 10.176.16.78 with SMTP id g14mr38143344uab.54.1481023649987;
        Tue, 06 Dec 2016 03:27:29 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x234.google.com (mail-vk0-x234.google.com. [2607:f8b0:400c:c05::234])
        by mx.google.com with ESMTPS id i184si4694088vkd.122.2016.12.06.03.27.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Dec 2016 03:27:29 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::234 as permitted sender) client-ip=2607:f8b0:400c:c05::234;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::234 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE dis=NONE) header.from=linaro.org
Received: by mail-vk0-x234.google.com with SMTP id p9so193970231vkd.3
        for <alex.bennee@linaro.org>; Tue, 06 Dec 2016 03:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Gmet0k9Ou+VJDCZopSdrCM9e7LKnWpw/Xo5CiGUCOVY=;
        b=J/gLHBN7EdXIkwKaqj71zSukfTw40OJ9URHhHxSC/c8fOvWeAOCXPXxT8H7yK11HLT
         2LT73RoNVG+1CBqX5/BlEZqQ4e+gg6k8OwTZek6tI5zbIex8wy/Qmz+8wRA2VVlh0A3b
         xpYzhidi7M44nnHIMrsSiPI1KW2r64U93R+Mo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Gmet0k9Ou+VJDCZopSdrCM9e7LKnWpw/Xo5CiGUCOVY=;
        b=lwaK7wmbzdW5ukYpHmnWzqGw/4ueDsZUsQNn+AkiqVJTDzyUxSYItyIu2MXxhKZq7A
         aAEfgZ9lVdgc6BkHlC83HQtqdb3hJIp83AtVeZS0YyDcI6IY7HuttBpyPIIKthPpyUuB
         4okxrU7qVGz9rKIXE/rCTtSA2fdpRwTUR+ggQu9mK9T07SjNQMnhhJPTcBm8+TlHZ7TB
         MSuxGEGv/zhnuX7g06BIdGQAAP8mTq1FRu8+Nbqk/bUiyJ0RYD2kXxj/XVME8oYsqFOw
         dGjp8dDPHfYg9lcBY85Nz9/5gdGW8hBeii8zJR1ZiozrzpkKYtRYwY/jDnk5rj8dVQD2
         to/A==
X-Gm-Message-State: AKaTC02vIPxiI8B3SzsDaJ7m1liKfn2BIhAxwuPFLXprAyAEC8D5HkdD/amOJkRFQdy2cav+duUUeYMs6PslMZ4zyzg=
X-Received: by 10.31.75.198 with SMTP id y189mr19647565vka.51.1481023649343;
 Tue, 06 Dec 2016 03:27:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Tue, 6 Dec 2016 03:27:08 -0800 (PST)
In-Reply-To: <87pol5z57w.fsf@linaro.org>
References: <87pol5z57w.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Dec 2016 11:27:08 +0000
Message-ID: <CAFEAcA8qUBSSRS5a+0qv=450z5RXdbbS51RJ1Fj9OjO3K63xLw@mail.gmail.com>
Subject: Re: RISU TCG failures (AArch64 on AArch64)
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Claudio Fontana <claudio.fontana@huawei.com>, Claudio Fontana <claudio.fontana@gmail.com>, 
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "open list:ARM" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: y9jsOvm6utv3

On 6 December 2016 at 11:06, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:

A quick eyeball of the logs:

> loading test image testcases.aarch64/insn_ADDPv_ADD_RES1_ADD_RES2_ADDS__I=
NC.risu.bin...
> starting apprentice image at 0x4000801000
> Executed 100 test instructions (pc=3D0x4000801574).Executed 200 test inst=
ructions (pc=3D0x4000801aec).Executed 300 test instructions (pc=3D0x4000801=
d08).Executed 400 test instructions (pc=3D0x4000802264).Executed 500 test i=
nstructions (pc=3D0x40008027b8).Executed 600 test instructions (pc=3D0x4000=
8029e8).Executed 700 test instructions (pc=3D0x4000802f3c).Executed 800 tes=
t instructions (pc=3D0x40008034a8).Executed 900 test instructions (pc=3D0x4=
0008036cc).Executed 1000 test instructions (pc=3D0x4000803c2c).------------=
----
> IN:
> 0x0000004000803cac:  ab1feff6      adds x22, xzr, xzr, lsl #59

>  ---- 0000004000803cac 0000000000000000 0000000000000000
>  movi_i64 tmp2,$0x0
>  movi_i64 tmp3,$0x0
>  movi_i64 tmp7,$0x0
>  add2_i64 tmp5,tmp6,tmp2,tmp7,tmp3,tmp7           dead: 2 3 4 5
>  mov_i32 CF,tmp6                                  sync: 0  dead: 0 1
>  mov_i32 ZF,tmp5
>  movi_i64 tmp9,$0x20
>  shr_i64 tmp8,tmp5,tmp9                           dead: 2
[...]

> OUT: [size=3D108]
> 0x556a9c11a0:  b85f8274      ldur w20, [x19, #-8]
> 0x556a9c11a4:  350002d4      cbnz w20, #+0x58 (addr 0x556a9c11fc)
> 0x556a9c11a8:  b10003f4      adds x20, sp, #0x0 (0)
> 0x556a9c11ac:  9a1f03f5      adc x21, xzr, xzr

Looks like the add2_i64 has emitted a bogus adds, because
it thinks adds (immediate) allows use of xzr when it doesn't
(for this insn Rn=3D=3D31 means SP, not XZR).


> loading test image testcases.aarch64/insn_BSL_CCMN_CCMNi_CCMP__INC.risu.b=
in...
> starting apprentice image at 0x4000801000
> ----------------
> IN:
> 0x000000400080157c:  3a5cabed      ccmn wzr, #28, #NZcV, ge
> 0x0000004000801580:  00005af0      unallocated (Unallocated)

> OP after optimization and liveness analysis:
>  ld_i32 tmp0,env,$0xfffffffffffffff8              dead: 1
>  movi_i32 tmp1,$0x0
>  brcond_i32 tmp0,tmp1,ne,$L0                      dead: 0 1
>
>  ---- 000000400080157c 0000000000000000 0000000000000000
>  xor_i32 tmp1,VF,NF                               dead: 1 2
>  movi_i32 tmp2,$0x0
>  setcond_i32 tmp0,tmp1,tmp2,lt                    dead: 1 2
>  movi_i64 tmp3,$0x1c
>  movi_i64 tmp4,$0x0
>  movi_i32 tmp6,$0x0
>  mov_i32 tmp1,tmp4                                dead: 1
>  mov_i32 tmp2,tmp3                                dead: 1
>  add2_i32 NF,CF,tmp1,tmp6,tmp2,tmp6               dead: 3 5

> 0x55956bfc4c:  310073f5      adds w21, wsp, #0x1c (28)
> 0x55956bfc50:  1a1f03f6      adc w22, wzr, wzr

Same again but with add2_i32.

> loading test image testcases.aarch64/insn_MOVI_MOVK_MOVN_MOVZ__INC.risu.b=
in...


> 0x000000400080be2c:  6f01e7a0      movi v0.2d, #0xffffffff00ff
> 0x000000400080be30:  00005af0      unallocated (Unallocated)

>  ---- 000000400080be2c 0000000000000000 0000000000000000
>  movi_i64 tmp2,$0xffffffff00ff
>  mov_i64 tmp3,tmp2                                dead: 1
>  st_i64 tmp3,env,$0x838
>  st_i64 tmp3,env,$0x840                           dead: 0

> OUT: [size=3D72]
> 0x5561a8beb0:  b85f8274      ldur w20, [x19, #-8]
> 0x5561a8beb4:  350001b4      cbnz w20, #+0x34 (addr 0x5561a8bee8)
> 0x5561a8beb8:  929fe014      mov x20, #0xffffffffffff00ff

Generated move with wrong constant value...

> loading test image testcases.aarch64/insn_UCVTFv_UCVTFvf_UCVTFvis_UCVTFv_=
RES1__INC.risu.bin...
> starting apprentice image at 0x4000801000
> Executed 100 test instructions (pc=3D0x400080158c).Executed 200 test inst=
ructions (pc=3D0x4000801b10).Executed 300 test instructions (pc=3D0x4000802=
08c).Executed 400 test instructions (pc=3D0x40008022c8).Executed 500 test i=
nstructions (pc=3D0x4000802880).Executed 600 test instructions (pc=3D0x4000=
802e10).Executed 700 test instructions (pc=3D0x4000803034).Executed 800 tes=
t instructions (pc=3D0x40008035a8).----------------
> IN:
> 0x0000004000803a74:  6f01e6fc      movi v28.2d, #0xffff00ffffff
> 0x0000004000803a78:  00005af0      unallocated (Unallocated)

>  movi_i64 tmp2,$0xffff00ffffff

> OUT: [size=3D72]
> 0x555c897290:  b85f8274      ldur w20, [x19, #-8]
> 0x555c897294:  350001b4      cbnz w20, #+0x34 (addr 0x555c8972c8)
> 0x555c897298:  92bfe014      mov x20, #0xffffffff00ffffff

Same thing again.

So there's two bugs here, one in handling of add2 in the
backend, and one in constant loading.

thanks
-- PMM
