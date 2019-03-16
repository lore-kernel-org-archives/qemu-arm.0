Received: by 2002:a5d:4d11:0:0:0:0:0 with SMTP id z17csp756290wrt;
        Sat, 16 Mar 2019 13:34:24 -0700 (PDT)
X-Received: by 2002:a37:c381:: with SMTP id r1mr7689715qkl.358.1552768464729;
        Sat, 16 Mar 2019 13:34:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552768464; cv=none;
        d=google.com; s=arc-20160816;
        b=NBT2nvw2wxnztJs5QyRW1wnMJWgesFXU7JkYmgDxxQrjjyk/BN6NVMKazEzRG00WBd
         4JBoQo+VlDirduCzn2F4MIyzgzQcx8n9/KRhcN1MaKy9xDxloFxKqcs82J2+OIdpaEZb
         qz9lMI8/yqMW4GKYCv4HkrWmxHGfpskKnnraB+Az0bmz3AB4/je357gH9JzioRydm7Dg
         IcZO17tsAvvmzueuXxVP8WB4DwHGqTPKzw1qwbZ6p4fk+ICWLfdg+1kNK6+LenHgsnfJ
         C3gCmVPYimx+gS9SJex00LAI/uQnJqoyB1drI+KzOqgbiMmwaLbg1E7IfznrKQYTf9ip
         Op/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DbtxxwCONuDrUCmzmnQ/YdGj9s9nPCzfzFNorcGDqLQ=;
        b=0v5eXmz/bb3fqGNvBp/Ur8M6eVxcm4PNswQPUbGaK+fNsn+EFaYSQYK6dJtXjkhk5L
         T4Q8Xvnu/XvsB9hthl8lrQ35b8fGt8BQT6z4z+9M7nKc6WDj9L/HZr/kGHtn0LUwqL7P
         yrTCwzGfiRb45nygGvrvN68rBBuzBfRSJw6gp/+fE+llbXxjMtpBm0D21kEbRBN65/UJ
         5WO//wAqOh8NTtmEPNc99xjfy7b7vPz0YPeG0MWxUf2jYc1R3jh7huHVl3ZnywAt34Ok
         zLZUhbEecDymYV3n5KhuakRhyS6zcxHBLX/Vr03QRyxOsaVgqBr50I9rIOSAMrc7Am6O
         GSCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=QzQQQ6pg;
       spf=pass (google.com: domain of cialdi@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=cialdi@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <cialdi@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k5sor6078584qvp.54.2019.03.16.13.34.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 16 Mar 2019 13:34:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of cialdi@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=QzQQQ6pg;
       spf=pass (google.com: domain of cialdi@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=cialdi@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DbtxxwCONuDrUCmzmnQ/YdGj9s9nPCzfzFNorcGDqLQ=;
        b=QzQQQ6pg7mHrWRgo9qUJI23cXN6m/z2Aa6ZVkoj8k2johVYCqm8k7KR12iNSyfaqBl
         cmw9UQczNuNT99Zkoo60rbr/fwJ7mJyaR95s4WKV94km2t81xQUvxFs1/RJKX8ZEvqig
         WfOugiZ4571m9BDjgjTyw8VzRt2I0AXdOXgZ5DXmLCBTEZ1E3hpT6YDe56oYO4hnxGSI
         H6YRglOKZfd4Xh56bX0RMSuvV+yAgkcMoBzjP9Le9t1Ay3WCW/pZ2MdYFU7vp0I0RRne
         6cbj+7GOklDrMUKS8k7+zMqDDX8SXXljETFDj0I311a2YJR9tHd2HGHtY7DR55WRHfmm
         I2dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DbtxxwCONuDrUCmzmnQ/YdGj9s9nPCzfzFNorcGDqLQ=;
        b=EFhrdQd/2RL1/9o/EnVrqNbzLHz0wwpFTDQs+yvi+QsWzJOUekDqskWSWGyRO+Ch34
         TZ2yA/Y6hqt8OeConjJiT0D1sVqIlbmMaYZW7J2tM+7nbMIuNzhVwzd+bjpIVgldUhZy
         2y+2QHoH9fnx/6+q8wxiL/svZnJauQm3fodYSjDF0UKi6WzpHSoUqAP+nr/eR96AFcKs
         bEhZJacPUF7YSNWTiIq3F8Dud8CozOiduNUVLXb9yUJ+CorwUhoVULlzEqc51VF72fzK
         kgdS9Ya+6KMJR+ECoCjzYfC+utKzJfUWILcOcz4VQkXElWPZJMaZ3kX84DOejdaEUjWO
         6SEg==
X-Gm-Message-State: APjAAAVUEEk83Zr5/LUwBpxFjK3RiAJWRvTrWE4lPVE/UWiGKLFYe8kj
	gr7+EIOI5+E6wicoYYnr7bg/vmka15uUTHmMpbD7yKfQWwQ=
X-Google-Smtp-Source: APXvYqzikdIx0bu5/IgA/aEXhw/6pIkbZe71AxsB8C7wYO4z7XoRg+KrKxr3kqP43A2+uzp1CtU5eaqjL3Wkmu4taB8=
X-Received: by 2002:a0c:aca4:: with SMTP id m33mr7571553qvc.136.1552768464050;
 Sat, 16 Mar 2019 13:34:24 -0700 (PDT)
MIME-Version: 1.0
References: <CABgYhWf=unSbmTksO+gkUuX+UL3g8HvEuDAeDdxBQVbzci05DQ@mail.gmail.com>
 <CAFEAcA8xqO=iV9oJWWdPHhhDFRmAoegMpwUZQUszXLwG7zS=Hw@mail.gmail.com>
 <CABgYhWdu-H6zfWjwwtJbFK6TJa89tqERtX=djYpFobWjir_C6A@mail.gmail.com> <87sgvnt4d4.fsf@zen.linaroharston>
In-Reply-To: <87sgvnt4d4.fsf@zen.linaroharston>
From: Massimiliano Cialdi <cialdi@gmail.com>
Date: Sat, 16 Mar 2019 21:34:12 +0100
Message-ID: <CABgYhWfre7FcfvRZ+gRQi9k_1S_CTBKvMix8zGQdOLK2c-vRNA@mail.gmail.com>
Subject: Re: [Qemu-arm] QEMU user mode for cortex M
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>
Content-Type: multipart/mixed; boundary="000000000000b8038a05843c1489"
X-TUID: 8dbe85J02VYQ

--000000000000b8038a05843c1489
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 16, 2019 at 1:01 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
>
> Massimiliano Cialdi <cialdi@gmail.com> writes:
>
> > I have my exetutable compiled with
> > /opt/gcc-arm-none-eabi-8-2018-q4-major/bin/arm-none-eabi-gcc -std=3Dgnu=
11
> > -mcpu=3Dcortex-m7 -mthumb -mfloat-abi=3Dhard -mfpu=3Dfpv5-d16 -fno-comm=
on
> > -specs=3Drdimon.specs -Wl,--cref,-Map=3Dmain.map main.c -o main.elf
>
> I thought you wanted to target a cortex-m4?
yes.
I tried to compile it like this.:
/opt/gcc-arm-none-eabi-8-2018-q4-major/bin/arm-none-eabi-gcc
-std=3Dgnu11 -mcpu=3Dcortex-m4 -mthumb  -fno-common -specs=3Drdimon.specs
-Wl,--cref,-Map=3Dmain.map -T prova.ld -O0 -g3 main.c -o main.elf
The linker script is attached

I don't know how to compile with arm-linux-gnueabihf-gcc

>
> Have a look at how test-armv6m-undef is built. It is the simplest
> dumbest M profile image you can build with a kernel that maps to 0 and a
> simple reset vector at the start of the vector table:
I don't want to have to deal with interrupt vectors and memory layouts.
Just see "hallo world!" on the output.



> I don't know what the virt machine defaults to for CPU but I'm fairly
> sure it's not an m-profile CPU.
I had only tried the machine none and virt... I didn't know which one
to choose for cortex M4


> It's hard to say without seeing what your test is doing. However I can fo=
rce
> a cortex-m4 on a microbit and run the following ok:
>
>   ./qemu-system-arm  -monitor none -display none \
>                      -chardev file,path=3Dtest-armv6m-undef.out,id=3Doutp=
ut \
>                      -semihosting -M microbit \
>                      -cpu cortex-m4 \
>                      -kernel tests/test-armv6m-undef
>                      -d in_asm,cpu,nochain

tried with:
~/Downloads/qemu/qemu-3.1.0/arm-softmmu/qemu-system-arm -d
in_asm,cpu,nochain,unimp,guest_errors -chardev
file,path=3Dprova.out,id=3Doutput -machine microbit -cpu cortex-m4
-monitor null -serial null  -semihosting -nographic
-semihosting-config enable=3Don,target=3Dnative  -kernel main.elf
----------------
IN:
0x00000000:  00000000  andeq    r0, r0, r0

R00=3D00000000 R01=3D00000000 R02=3D00000000 R03=3D00000000
R04=3D00000000 R05=3D00000000 R06=3D00000000 R07=3D00000000
R08=3D00000000 R09=3D00000000 R10=3D00000000 R11=3D00000000
R12=3D00000000 R13=3D00000000 R14=3Dffffffff R15=3D00000000
XPSR=3D40000000 -Z-- A priv-thread
nrf51_soc.private: unimplemented device write (size 4, value 0x0,
offset 0xfffffe0)
nrf51_soc.private: unimplemented device write (size 4, value 0x0,
offset 0xfffffe4)
nrf51_soc.private: unimplemented device write (size 4, value 0x0,
offset 0xfffffe8)
nrf51_soc.private: unimplemented device write (size 4, value 0x0,
offset 0xfffffec)
nrf51_soc.private: unimplemented device write (size 4, value 0x0,
offset 0xffffff0)
nrf51_soc.private: unimplemented device write (size 4, value
0xffffffff, offset 0xffffff4)
nrf51_soc.private: unimplemented device write (size 4, value 0x0,
offset 0xffffff8)
nrf51_soc.private: unimplemented device write (size 4, value
0x40000000, offset 0xffffffc)
----------------
IN:
0x00000000:  00000000  andeq    r0, r0, r0

R00=3D00000000 R01=3D00000000 R02=3D00000000 R03=3D00000000
R04=3D00000000 R05=3D00000000 R06=3D00000000 R07=3D00000000
R08=3D00000000 R09=3D00000000 R10=3D00000000 R11=3D00000000
R12=3D00000000 R13=3Dffffffe0 R14=3Dfffffff9 R15=3D00000000
XPSR=3D40000003 -Z-- A handler
qemu: fatal: Lockup: can't escalate 3 to HardFault (current priority -1)

R00=3D00000000 R01=3D00000000 R02=3D00000000 R03=3D00000000
R04=3D00000000 R05=3D00000000 R06=3D00000000 R07=3D00000000
R08=3D00000000 R09=3D00000000 R10=3D00000000 R11=3D00000000
R12=3D00000000 R13=3Dffffffe0 R14=3Dfffffff9 R15=3D00000000
XPSR=3D40000003 -Z-- A handler
FPSCR: 00000000
Aborted (core dumped)


still no success

best regards
Max


--
Et nunc, auxilium solis, vincam!
Oppugnatio solaris!
VIS!

Massimiliano Cialdi
cialdi@gmail.com

--000000000000b8038a05843c1489
Content-Type: application/octet-stream; name="prova.ld"
Content-Disposition: attachment; filename="prova.ld"
Content-Transfer-Encoding: base64
Content-ID: <f_jtbxsukn0>
X-Attachment-Id: f_jtbxsukn0

LyogU2NyaXB0IGZvciAteiBjb21icmVsb2M6IGNvbWJpbmUgYW5kIHNvcnQgcmVsb2Mgc2VjdGlv
bnMgKi8KLyogQ29weXJpZ2h0IChDKSAyMDE0LTIwMTggRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9u
LCBJbmMuCiAgIENvcHlpbmcgYW5kIGRpc3RyaWJ1dGlvbiBvZiB0aGlzIHNjcmlwdCwgd2l0aCBv
ciB3aXRob3V0IG1vZGlmaWNhdGlvbiwKICAgYXJlIHBlcm1pdHRlZCBpbiBhbnkgbWVkaXVtIHdp
dGhvdXQgcm95YWx0eSBwcm92aWRlZCB0aGUgY29weXJpZ2h0CiAgIG5vdGljZSBhbmQgdGhpcyBu
b3RpY2UgYXJlIHByZXNlcnZlZC4gICovCk9VVFBVVF9GT1JNQVQoImVsZjMyLWxpdHRsZWFybSIs
ICJlbGYzMi1iaWdhcm0iLAoJICAgICAgImVsZjMyLWxpdHRsZWFybSIpCk9VVFBVVF9BUkNIKGFy
bSkKRU5UUlkoX3N0YXJ0KQpTRUNUSU9OUwp7CiAgLyogUmVhZC1vbmx5IHNlY3Rpb25zLCBtZXJn
ZWQgaW50byB0ZXh0IHNlZ21lbnQ6ICovCiAgUFJPVklERSAoX19leGVjdXRhYmxlX3N0YXJ0ID0g
U0VHTUVOVF9TVEFSVCgidGV4dC1zZWdtZW50IiwgMHgxMDEwMCkpOyAuID0gU0VHTUVOVF9TVEFS
VCgidGV4dC1zZWdtZW50IiwgMHgxMDEwMCk7CiAgLmludGVycCAgICAgICAgIDogeyAqKC5pbnRl
cnApIH0KICAubm90ZS5nbnUuYnVpbGQtaWQgIDogeyAqKC5ub3RlLmdudS5idWlsZC1pZCkgfQog
IC5oYXNoICAgICAgICAgICA6IHsgKiguaGFzaCkgfQogIC5nbnUuaGFzaCAgICAgICA6IHsgKigu
Z251Lmhhc2gpIH0KICAuZHluc3ltICAgICAgICAgOiB7ICooLmR5bnN5bSkgfQogIC5keW5zdHIg
ICAgICAgICA6IHsgKiguZHluc3RyKSB9CiAgLmdudS52ZXJzaW9uICAgIDogeyAqKC5nbnUudmVy
c2lvbikgfQogIC5nbnUudmVyc2lvbl9kICA6IHsgKiguZ251LnZlcnNpb25fZCkgfQogIC5nbnUu
dmVyc2lvbl9yICA6IHsgKiguZ251LnZlcnNpb25fcikgfQogIC5yZWwuZHluICAgICAgICA6CiAg
ICB7CiAgICAgICooLnJlbC5pbml0KQogICAgICAqKC5yZWwudGV4dCAucmVsLnRleHQuKiAucmVs
LmdudS5saW5rb25jZS50LiopCiAgICAgICooLnJlbC5maW5pKQogICAgICAqKC5yZWwucm9kYXRh
IC5yZWwucm9kYXRhLiogLnJlbC5nbnUubGlua29uY2Uuci4qKQogICAgICAqKC5yZWwuZGF0YS5y
ZWwucm8gLnJlbC5kYXRhLnJlbC5yby4qIC5yZWwuZ251LmxpbmtvbmNlLmQucmVsLnJvLiopCiAg
ICAgICooLnJlbC5kYXRhIC5yZWwuZGF0YS4qIC5yZWwuZ251LmxpbmtvbmNlLmQuKikKICAgICAg
KigucmVsLnRkYXRhIC5yZWwudGRhdGEuKiAucmVsLmdudS5saW5rb25jZS50ZC4qKQogICAgICAq
KC5yZWwudGJzcyAucmVsLnRic3MuKiAucmVsLmdudS5saW5rb25jZS50Yi4qKQogICAgICAqKC5y
ZWwuY3RvcnMpCiAgICAgICooLnJlbC5kdG9ycykKICAgICAgKigucmVsLmdvdCkKICAgICAgKigu
cmVsLmJzcyAucmVsLmJzcy4qIC5yZWwuZ251LmxpbmtvbmNlLmIuKikKICAgICAgUFJPVklERV9I
SURERU4gKF9fcmVsX2lwbHRfc3RhcnQgPSAuKTsKICAgICAgKigucmVsLmlwbHQpCiAgICAgIFBS
T1ZJREVfSElEREVOIChfX3JlbF9pcGx0X2VuZCA9IC4pOwogICAgfQogIC5yZWxhLmR5biAgICAg
ICA6CiAgICB7CiAgICAgICooLnJlbGEuaW5pdCkKICAgICAgKigucmVsYS50ZXh0IC5yZWxhLnRl
eHQuKiAucmVsYS5nbnUubGlua29uY2UudC4qKQogICAgICAqKC5yZWxhLmZpbmkpCiAgICAgICoo
LnJlbGEucm9kYXRhIC5yZWxhLnJvZGF0YS4qIC5yZWxhLmdudS5saW5rb25jZS5yLiopCiAgICAg
ICooLnJlbGEuZGF0YSAucmVsYS5kYXRhLiogLnJlbGEuZ251LmxpbmtvbmNlLmQuKikKICAgICAg
KigucmVsYS50ZGF0YSAucmVsYS50ZGF0YS4qIC5yZWxhLmdudS5saW5rb25jZS50ZC4qKQogICAg
ICAqKC5yZWxhLnRic3MgLnJlbGEudGJzcy4qIC5yZWxhLmdudS5saW5rb25jZS50Yi4qKQogICAg
ICAqKC5yZWxhLmN0b3JzKQogICAgICAqKC5yZWxhLmR0b3JzKQogICAgICAqKC5yZWxhLmdvdCkK
ICAgICAgKigucmVsYS5ic3MgLnJlbGEuYnNzLiogLnJlbGEuZ251LmxpbmtvbmNlLmIuKikKICAg
ICAgUFJPVklERV9ISURERU4gKF9fcmVsYV9pcGx0X3N0YXJ0ID0gLik7CiAgICAgICooLnJlbGEu
aXBsdCkKICAgICAgUFJPVklERV9ISURERU4gKF9fcmVsYV9pcGx0X2VuZCA9IC4pOwogICAgfQog
IC5yZWwucGx0ICAgICAgICA6CiAgICB7CiAgICAgICooLnJlbC5wbHQpCiAgICB9CiAgLnJlbGEu
cGx0ICAgICAgIDoKICAgIHsKICAgICAgKigucmVsYS5wbHQpCiAgICB9CiAgLmluaXQgICAgICAg
ICAgIDoKICB7CiAgICBLRUVQICgqKFNPUlRfTk9ORSguaW5pdCkpKQogIH0KICAucGx0ICAgICAg
ICAgICAgOiB7ICooLnBsdCkgfQogIC5pcGx0ICAgICAgICAgICA6IHsgKiguaXBsdCkgfQogIC50
ZXh0ICAgICAgICAgICA6CiAgewogICAgKigudGV4dC51bmxpa2VseSAudGV4dC4qX3VubGlrZWx5
IC50ZXh0LnVubGlrZWx5LiopCiAgICAqKC50ZXh0LmV4aXQgLnRleHQuZXhpdC4qKQogICAgKigu
dGV4dC5zdGFydHVwIC50ZXh0LnN0YXJ0dXAuKikKICAgICooLnRleHQuaG90IC50ZXh0LmhvdC4q
KQogICAgKigudGV4dCAuc3R1YiAudGV4dC4qIC5nbnUubGlua29uY2UudC4qKQogICAgLyogLmdu
dS53YXJuaW5nIHNlY3Rpb25zIGFyZSBoYW5kbGVkIHNwZWNpYWxseSBieSBlbGYzMi5lbS4gICov
CiAgICAqKC5nbnUud2FybmluZykKICAgICooLmdsdWVfN3QpICooLmdsdWVfNykgKigudmZwMTFf
dmVuZWVyKSAqKC52NF9ieCkKICB9CiAgLmZpbmkgICAgICAgICAgIDoKICB7CiAgICBLRUVQICgq
KFNPUlRfTk9ORSguZmluaSkpKQogIH0KICBQUk9WSURFIChfX2V0ZXh0ID0gLik7CiAgUFJPVklE
RSAoX2V0ZXh0ID0gLik7CiAgUFJPVklERSAoZXRleHQgPSAuKTsKICAucm9kYXRhICAgICAgICAg
OiB7ICooLnJvZGF0YSAucm9kYXRhLiogLmdudS5saW5rb25jZS5yLiopIH0KICAucm9kYXRhMSAg
ICAgICAgOiB7ICooLnJvZGF0YTEpIH0KICAuQVJNLmV4dGFiICAgOiB7ICooLkFSTS5leHRhYiog
LmdudS5saW5rb25jZS5hcm1leHRhYi4qKSB9CiAgIFBST1ZJREVfSElEREVOIChfX2V4aWR4X3N0
YXJ0ID0gLik7CiAgLkFSTS5leGlkeCAgIDogeyAqKC5BUk0uZXhpZHgqIC5nbnUubGlua29uY2Uu
YXJtZXhpZHguKikgfQogICBQUk9WSURFX0hJRERFTiAoX19leGlkeF9lbmQgPSAuKTsKICAuZWhf
ZnJhbWVfaGRyICAgOiB7ICooLmVoX2ZyYW1lX2hkcikgKiguZWhfZnJhbWVfZW50cnkgLmVoX2Zy
YW1lX2VudHJ5LiopIH0KICAuZWhfZnJhbWUgICAgICAgOiBPTkxZX0lGX1JPIHsgS0VFUCAoKigu
ZWhfZnJhbWUpKSAqKC5laF9mcmFtZS4qKSB9CiAgLmdjY19leGNlcHRfdGFibGUgICA6IE9OTFlf
SUZfUk8geyAqKC5nY2NfZXhjZXB0X3RhYmxlIC5nY2NfZXhjZXB0X3RhYmxlLiopIH0KICAuZ251
X2V4dGFiICAgOiBPTkxZX0lGX1JPIHsgKiguZ251X2V4dGFiKikgfQogIC8qIFRoZXNlIHNlY3Rp
b25zIGFyZSBnZW5lcmF0ZWQgYnkgdGhlIFN1bi9PcmFjbGUgQysrIGNvbXBpbGVyLiAgKi8KICAu
ZXhjZXB0aW9uX3JhbmdlcyAgIDogT05MWV9JRl9STyB7ICooLmV4Y2VwdGlvbl9yYW5nZXMqKSB9
CiAgLyogQWRqdXN0IHRoZSBhZGRyZXNzIGZvciB0aGUgZGF0YSBzZWdtZW50LiAgV2Ugd2FudCB0
byBhZGp1c3QgdXAgdG8KICAgICB0aGUgc2FtZSBhZGRyZXNzIHdpdGhpbiB0aGUgcGFnZSBvbiB0
aGUgbmV4dCBwYWdlIHVwLiAgKi8KICAuID0gQUxJR04oQ09OU1RBTlQgKE1BWFBBR0VTSVpFKSkg
KyAoLiAmIChDT05TVEFOVCAoTUFYUEFHRVNJWkUpIC0gMSkpOwogIC8qIEV4Y2VwdGlvbiBoYW5k
bGluZyAgKi8KICAuZWhfZnJhbWUgICAgICAgOiBPTkxZX0lGX1JXIHsgS0VFUCAoKiguZWhfZnJh
bWUpKSAqKC5laF9mcmFtZS4qKSB9CiAgLmdudV9leHRhYiAgICAgIDogT05MWV9JRl9SVyB7ICoo
LmdudV9leHRhYikgfQogIC5nY2NfZXhjZXB0X3RhYmxlICAgOiBPTkxZX0lGX1JXIHsgKiguZ2Nj
X2V4Y2VwdF90YWJsZSAuZ2NjX2V4Y2VwdF90YWJsZS4qKSB9CiAgLmV4Y2VwdGlvbl9yYW5nZXMg
ICA6IE9OTFlfSUZfUlcgeyAqKC5leGNlcHRpb25fcmFuZ2VzKikgfQogIC8qIFRocmVhZCBMb2Nh
bCBTdG9yYWdlIHNlY3Rpb25zICAqLwogIC50ZGF0YQkgIDoKICAgewogICAgIFBST1ZJREVfSElE
REVOIChfX3RkYXRhX3N0YXJ0ID0gLik7CiAgICAgKigudGRhdGEgLnRkYXRhLiogLmdudS5saW5r
b25jZS50ZC4qKQogICB9CiAgLnRic3MJCSAgOiB7ICooLnRic3MgLnRic3MuKiAuZ251Lmxpbmtv
bmNlLnRiLiopICooLnRjb21tb24pIH0KICAucHJlaW5pdF9hcnJheSAgICA6CiAgewogICAgUFJP
VklERV9ISURERU4gKF9fcHJlaW5pdF9hcnJheV9zdGFydCA9IC4pOwogICAgS0VFUCAoKigucHJl
aW5pdF9hcnJheSkpCiAgICBQUk9WSURFX0hJRERFTiAoX19wcmVpbml0X2FycmF5X2VuZCA9IC4p
OwogIH0KICAuaW5pdF9hcnJheSAgICA6CiAgewogICAgUFJPVklERV9ISURERU4gKF9faW5pdF9h
cnJheV9zdGFydCA9IC4pOwogICAgS0VFUCAoKihTT1JUX0JZX0lOSVRfUFJJT1JJVFkoLmluaXRf
YXJyYXkuKikgU09SVF9CWV9JTklUX1BSSU9SSVRZKC5jdG9ycy4qKSkpCiAgICBLRUVQICgqKC5p
bml0X2FycmF5IEVYQ0xVREVfRklMRSAoKmNydGJlZ2luLm8gKmNydGJlZ2luPy5vICpjcnRlbmQu
byAqY3J0ZW5kPy5vICkgLmN0b3JzKSkKICAgIFBST1ZJREVfSElEREVOIChfX2luaXRfYXJyYXlf
ZW5kID0gLik7CiAgfQogIC5maW5pX2FycmF5ICAgIDoKICB7CiAgICBQUk9WSURFX0hJRERFTiAo
X19maW5pX2FycmF5X3N0YXJ0ID0gLik7CiAgICBLRUVQICgqKFNPUlRfQllfSU5JVF9QUklPUklU
WSguZmluaV9hcnJheS4qKSBTT1JUX0JZX0lOSVRfUFJJT1JJVFkoLmR0b3JzLiopKSkKICAgIEtF
RVAgKCooLmZpbmlfYXJyYXkgRVhDTFVERV9GSUxFICgqY3J0YmVnaW4ubyAqY3J0YmVnaW4/Lm8g
KmNydGVuZC5vICpjcnRlbmQ/Lm8gKSAuZHRvcnMpKQogICAgUFJPVklERV9ISURERU4gKF9fZmlu
aV9hcnJheV9lbmQgPSAuKTsKICB9CiAgLmN0b3JzICAgICAgICAgIDoKICB7CiAgICAvKiBnY2Mg
dXNlcyBjcnRiZWdpbi5vIHRvIGZpbmQgdGhlIHN0YXJ0IG9mCiAgICAgICB0aGUgY29uc3RydWN0
b3JzLCBzbyB3ZSBtYWtlIHN1cmUgaXQgaXMKICAgICAgIGZpcnN0LiAgQmVjYXVzZSB0aGlzIGlz
IGEgd2lsZGNhcmQsIGl0CiAgICAgICBkb2Vzbid0IG1hdHRlciBpZiB0aGUgdXNlciBkb2VzIG5v
dAogICAgICAgYWN0dWFsbHkgbGluayBhZ2FpbnN0IGNydGJlZ2luLm87IHRoZQogICAgICAgbGlu
a2VyIHdvbid0IGxvb2sgZm9yIGEgZmlsZSB0byBtYXRjaCBhCiAgICAgICB3aWxkY2FyZC4gIFRo
ZSB3aWxkY2FyZCBhbHNvIG1lYW5zIHRoYXQgaXQKICAgICAgIGRvZXNuJ3QgbWF0dGVyIHdoaWNo
IGRpcmVjdG9yeSBjcnRiZWdpbi5vCiAgICAgICBpcyBpbi4gICovCiAgICBLRUVQICgqY3J0YmVn
aW4ubyguY3RvcnMpKQogICAgS0VFUCAoKmNydGJlZ2luPy5vKC5jdG9ycykpCiAgICAvKiBXZSBk
b24ndCB3YW50IHRvIGluY2x1ZGUgdGhlIC5jdG9yIHNlY3Rpb24gZnJvbQogICAgICAgdGhlIGNy
dGVuZC5vIGZpbGUgdW50aWwgYWZ0ZXIgdGhlIHNvcnRlZCBjdG9ycy4KICAgICAgIFRoZSAuY3Rv
ciBzZWN0aW9uIGZyb20gdGhlIGNydGVuZCBmaWxlIGNvbnRhaW5zIHRoZQogICAgICAgZW5kIG9m
IGN0b3JzIG1hcmtlciBhbmQgaXQgbXVzdCBiZSBsYXN0ICovCiAgICBLRUVQICgqKEVYQ0xVREVf
RklMRSAoKmNydGVuZC5vICpjcnRlbmQ/Lm8gKSAuY3RvcnMpKQogICAgS0VFUCAoKihTT1JUKC5j
dG9ycy4qKSkpCiAgICBLRUVQICgqKC5jdG9ycykpCiAgfQogIC5kdG9ycyAgICAgICAgICA6CiAg
ewogICAgS0VFUCAoKmNydGJlZ2luLm8oLmR0b3JzKSkKICAgIEtFRVAgKCpjcnRiZWdpbj8ubygu
ZHRvcnMpKQogICAgS0VFUCAoKihFWENMVURFX0ZJTEUgKCpjcnRlbmQubyAqY3J0ZW5kPy5vICkg
LmR0b3JzKSkKICAgIEtFRVAgKCooU09SVCguZHRvcnMuKikpKQogICAgS0VFUCAoKiguZHRvcnMp
KQogIH0KICAuamNyICAgICAgICAgICAgOiB7IEtFRVAgKCooLmpjcikpIH0KICAuZGF0YS5yZWwu
cm8gOiB7ICooLmRhdGEucmVsLnJvLmxvY2FsKiAuZ251LmxpbmtvbmNlLmQucmVsLnJvLmxvY2Fs
LiopICooLmRhdGEucmVsLnJvIC5kYXRhLnJlbC5yby4qIC5nbnUubGlua29uY2UuZC5yZWwucm8u
KikgfQogIC5keW5hbWljICAgICAgICA6IHsgKiguZHluYW1pYykgfQogIC5nb3QgICAgICAgICAg
ICA6IHsgKiguZ290LnBsdCkgKiguaWdvdC5wbHQpICooLmdvdCkgKiguaWdvdCkgfQogIC5kYXRh
ICAgICAgICAgICA6CiAgewogICAgX19kYXRhX3N0YXJ0ID0gLjsKICAgICooLmRhdGEgLmRhdGEu
KiAuZ251LmxpbmtvbmNlLmQuKikKICAgIFNPUlQoQ09OU1RSVUNUT1JTKQogIH0KICAuZGF0YTEg
ICAgICAgICAgOiB7ICooLmRhdGExKSB9CiAgX2VkYXRhID0gLjsgUFJPVklERSAoZWRhdGEgPSAu
KTsKICAuID0gLjsKICBfX2Jzc19zdGFydCA9IC47CiAgX19ic3Nfc3RhcnRfXyA9IC47CiAgLmJz
cyAgICAgICAgICAgIDoKICB7CiAgICooLmR5bmJzcykKICAgKiguYnNzIC5ic3MuKiAuZ251Lmxp
bmtvbmNlLmIuKikKICAgKihDT01NT04pCiAgIC8qIEFsaWduIGhlcmUgdG8gZW5zdXJlIHRoYXQg
dGhlIC5ic3Mgc2VjdGlvbiBvY2N1cGllcyBzcGFjZSB1cCB0bwogICAgICBfZW5kLiAgQWxpZ24g
YWZ0ZXIgLmJzcyB0byBlbnN1cmUgY29ycmVjdCBhbGlnbm1lbnQgZXZlbiBpZiB0aGUKICAgICAg
LmJzcyBzZWN0aW9uIGRpc2FwcGVhcnMgYmVjYXVzZSB0aGVyZSBhcmUgbm8gaW5wdXQgc2VjdGlv
bnMuCiAgICAgIEZJWE1FOiBXaHkgZG8gd2UgbmVlZCBpdD8gV2hlbiB0aGVyZSBpcyBubyAuYnNz
IHNlY3Rpb24sIHdlIGRvIG5vdAogICAgICBwYWQgdGhlIC5kYXRhIHNlY3Rpb24uICAqLwogICAu
ID0gQUxJR04oLiAhPSAwID8gMzIgLyA4IDogMSk7CiAgfQogIF9ic3NfZW5kX18gPSAuOyBfX2Jz
c19lbmRfXyA9IC47CiAgLiA9IEFMSUdOKDMyIC8gOCk7CiAgLiA9IFNFR01FTlRfU1RBUlQoImxk
YXRhLXNlZ21lbnQiLCAuKTsKICAuID0gQUxJR04oMzIgLyA4KTsKICBfX2VuZF9fID0gLjsKICBf
ZW5kID0gLjsgUFJPVklERSAoZW5kID0gLik7CiAgLnN0YWNrICAgICAgICAgMHg4MDAwMCA6CiAg
ewogICAgX3N0YWNrID0gLjsKICAgICooLnN0YWNrKQogIH0KICAvKiBTdGFicyBkZWJ1Z2dpbmcg
c2VjdGlvbnMuICAqLwogIC5zdGFiICAgICAgICAgIDAgOiB7ICooLnN0YWIpIH0KICAuc3RhYnN0
ciAgICAgICAwIDogeyAqKC5zdGFic3RyKSB9CiAgLnN0YWIuZXhjbCAgICAgMCA6IHsgKiguc3Rh
Yi5leGNsKSB9CiAgLnN0YWIuZXhjbHN0ciAgMCA6IHsgKiguc3RhYi5leGNsc3RyKSB9CiAgLnN0
YWIuaW5kZXggICAgMCA6IHsgKiguc3RhYi5pbmRleCkgfQogIC5zdGFiLmluZGV4c3RyIDAgOiB7
ICooLnN0YWIuaW5kZXhzdHIpIH0KICAuY29tbWVudCAgICAgICAwIDogeyAqKC5jb21tZW50KSB9
CiAgLmdudS5idWlsZC5hdHRyaWJ1dGVzIDogeyAqKC5nbnUuYnVpbGQuYXR0cmlidXRlcyAuZ251
LmJ1aWxkLmF0dHJpYnV0ZXMuKikgfQogIC8qIERXQVJGIGRlYnVnIHNlY3Rpb25zLgogICAgIFN5
bWJvbHMgaW4gdGhlIERXQVJGIGRlYnVnZ2luZyBzZWN0aW9ucyBhcmUgcmVsYXRpdmUgdG8gdGhl
IGJlZ2lubmluZwogICAgIG9mIHRoZSBzZWN0aW9uIHNvIHdlIGJlZ2luIHRoZW0gYXQgMC4gICov
CiAgLyogRFdBUkYgMSAqLwogIC5kZWJ1ZyAgICAgICAgICAwIDogeyAqKC5kZWJ1ZykgfQogIC5s
aW5lICAgICAgICAgICAwIDogeyAqKC5saW5lKSB9CiAgLyogR05VIERXQVJGIDEgZXh0ZW5zaW9u
cyAqLwogIC5kZWJ1Z19zcmNpbmZvICAwIDogeyAqKC5kZWJ1Z19zcmNpbmZvKSB9CiAgLmRlYnVn
X3NmbmFtZXMgIDAgOiB7ICooLmRlYnVnX3NmbmFtZXMpIH0KICAvKiBEV0FSRiAxLjEgYW5kIERX
QVJGIDIgKi8KICAuZGVidWdfYXJhbmdlcyAgMCA6IHsgKiguZGVidWdfYXJhbmdlcykgfQogIC5k
ZWJ1Z19wdWJuYW1lcyAwIDogeyAqKC5kZWJ1Z19wdWJuYW1lcykgfQogIC8qIERXQVJGIDIgKi8K
ICAuZGVidWdfaW5mbyAgICAgMCA6IHsgKiguZGVidWdfaW5mbyAuZ251LmxpbmtvbmNlLndpLiop
IH0KICAuZGVidWdfYWJicmV2ICAgMCA6IHsgKiguZGVidWdfYWJicmV2KSB9CiAgLmRlYnVnX2xp
bmUgICAgIDAgOiB7ICooLmRlYnVnX2xpbmUgLmRlYnVnX2xpbmUuKiAuZGVidWdfbGluZV9lbmQp
IH0KICAuZGVidWdfZnJhbWUgICAgMCA6IHsgKiguZGVidWdfZnJhbWUpIH0KICAuZGVidWdfc3Ry
ICAgICAgMCA6IHsgKiguZGVidWdfc3RyKSB9CiAgLmRlYnVnX2xvYyAgICAgIDAgOiB7ICooLmRl
YnVnX2xvYykgfQogIC5kZWJ1Z19tYWNpbmZvICAwIDogeyAqKC5kZWJ1Z19tYWNpbmZvKSB9CiAg
LyogU0dJL01JUFMgRFdBUkYgMiBleHRlbnNpb25zICovCiAgLmRlYnVnX3dlYWtuYW1lcyAwIDog
eyAqKC5kZWJ1Z193ZWFrbmFtZXMpIH0KICAuZGVidWdfZnVuY25hbWVzIDAgOiB7ICooLmRlYnVn
X2Z1bmNuYW1lcykgfQogIC5kZWJ1Z190eXBlbmFtZXMgMCA6IHsgKiguZGVidWdfdHlwZW5hbWVz
KSB9CiAgLmRlYnVnX3Zhcm5hbWVzICAwIDogeyAqKC5kZWJ1Z192YXJuYW1lcykgfQogIC8qIERX
QVJGIDMgKi8KICAuZGVidWdfcHVidHlwZXMgMCA6IHsgKiguZGVidWdfcHVidHlwZXMpIH0KICAu
ZGVidWdfcmFuZ2VzICAgMCA6IHsgKiguZGVidWdfcmFuZ2VzKSB9CiAgLyogRFdBUkYgRXh0ZW5z
aW9uLiAgKi8KICAuZGVidWdfbWFjcm8gICAgMCA6IHsgKiguZGVidWdfbWFjcm8pIH0KICAuZGVi
dWdfYWRkciAgICAgMCA6IHsgKiguZGVidWdfYWRkcikgfQogIC5BUk0uYXR0cmlidXRlcyAwIDog
eyBLRUVQICgqKC5BUk0uYXR0cmlidXRlcykpIEtFRVAgKCooLmdudS5hdHRyaWJ1dGVzKSkgfQog
IC5ub3RlLmdudS5hcm0uaWRlbnQgMCA6IHsgS0VFUCAoKigubm90ZS5nbnUuYXJtLmlkZW50KSkg
fQogIC9ESVNDQVJELyA6IHsgKigubm90ZS5HTlUtc3RhY2spICooLmdudV9kZWJ1Z2xpbmspICoo
LmdudS5sdG9fKikgfQp9Cg==
--000000000000b8038a05843c1489--
