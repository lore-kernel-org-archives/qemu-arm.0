Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1585851njf;
        Tue, 3 Sep 2024 13:53:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUBJWs9m2RDVX9tqSZb9BqZQxU3Ru8SCdNsz8l+t6ayi8MkSv0ir+CYwocJfFWLeJOzwctleLXKOMTmig==@linaro.org
X-Google-Smtp-Source: AGHT+IFxJBT5MktTLM1r8WhHFCcu7+4wujpY8wG/On7xqV+1ScDpX8RWnaKi9/NmvD0uXjNcRgbk
X-Received: by 2002:a05:6808:2202:b0:3df:160d:f6ff with SMTP id 5614622812f47-3df1c18d92amr15720172b6e.36.1725396823431;
        Tue, 03 Sep 2024 13:53:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725396823; cv=none;
        d=google.com; s=arc-20160816;
        b=Ch9BtcdDo4BduodGXDB88k+T0arb85Fl0wfLLizwQaSBjayEmY/Li05RNlS5tW4x1C
         03P2bkKRx/2Rc4UJW5BYKBuuxjaeHoMePQUqWYjpbkSplR03WW1GNeQlq6yd9Xjbl3tk
         vHfkMBAzo8MesygeGNY3X8AAm4WqTf03Rbnlou+l47T8zM2TLtCFhgtrz+6gS9Crw5zE
         g+u/nVaxiEbsBGjg/LSPA8Xhl542wx4MTISbwfmFp62BqluheNhpxEUIBpjYxJZPmaFd
         96S4fZ8FEpcpU3zVRSG4quXxsdhOhfxkSgjfnEo9mUdMrCYYdJ6lbbu82NDGZ8E6ijS+
         5YyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=r7tg6CaTXyopZLdIkoixAJLVCFVDrJo7qa3noZXsgOw=;
        fh=/sSbKuWfIfA/8vaBq3QpCDv99wQbsvJ9Ny6qk2y91Ks=;
        b=njoLzXNKB7fvqGh2PM+EXG3TA2U9qviYhET1iGG1+WKdaAOxOoIukWsgN/HBHH4p64
         cE/s0IEsjCn35nFZFQF6xl8zwr5ajpCa6RxfcZ3JIDsAvmI3BEgAzM3XVdgW0AGc2zbc
         UiDWQMTvw7qs5UBXtz3F844xerG2VP7PMP/MSp3s/93l+EcUWg6gejIMaRnpuJeu6XPI
         +UHIvORCYukD8X1O1nPQAdDPwvJvciL5gJ/Xhb7Tqsw0POMO/CBTlPaaofgBF+cJ107u
         gnKfyPBgvgu3CQQ6zrvnXHPfGnX2P0eXHBO1PiAO27JGffYbxL6mm3EeTBJHO8nPtxQH
         M6fw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="TodL/HUI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45682d887c3si130193971cf.436.2024.09.03.13.53.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2024 13:53:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="TodL/HUI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slaWa-0002R3-4Q; Tue, 03 Sep 2024 16:53:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marietto2008@gmail.com>)
 id 1slaWO-0002FJ-7A; Tue, 03 Sep 2024 16:53:04 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marietto2008@gmail.com>)
 id 1slaWF-000194-2t; Tue, 03 Sep 2024 16:53:03 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-2d8a54f1250so2182100a91.0; 
 Tue, 03 Sep 2024 13:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725396773; x=1726001573; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=r7tg6CaTXyopZLdIkoixAJLVCFVDrJo7qa3noZXsgOw=;
 b=TodL/HUIsuC8kiDYtykeT1ZkHbFNAbsZIBaKCNSGrn7tCtTjld32+qAPMhdZ2hMtEE
 bPSMemoFC8TPrx3Dts/7LOyN5PxomTGr1K9qaM4JBbGDF7ABwH1OwCunKCtWUlBov+EG
 qJ8vonw4WqSQ/elX916+J0cZBsHxXj3fdDUVGgE67jbAF54WTGa+LSQmHXgIBBTsq8dN
 BxuofQpKM5s81t+5dLHOSn3lsJFkxx7+Te8Taqe3jgvYNyx8OB9o47GoNs3uRLwd7g0S
 qZGu/LqKc5DHectVKWmlk2TDQL05cO09zxkybh32iI4GkPAJYRokoy79uQgC5xH8hJpU
 UARA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725396773; x=1726001573;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r7tg6CaTXyopZLdIkoixAJLVCFVDrJo7qa3noZXsgOw=;
 b=w4lm7Kx6hh3/i+DJqKonbmTUPYyUsFnmnTRaf8Iv0PTOKp0wfKvuQCsYXbCQYLdRWY
 60DwXmpvFsICsW84iQMy41PJGLN2Y4l3sR6tx/vJWqQHhZdi0Br3OoJ0xpQM1imFZcjf
 brICeSfcXi4zrgWch9zQ9iLW3xo7SU3FK+jcpg4O8Y7QXrL153vrn3vEYwn/hnwKkH+C
 vw2ssTJqQkK7b2b387Xe0whKyet1FV2Iitr8GulMrmsmekFNvFYQkRynA72+VUGHZrFM
 Bo7yGr8Wt8e+uOdpWrI6a7k/9fJ4vYooiaXJJgxcqmB3x5siZP+jixL+lYjvwaDw3/rM
 Bk3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8lhFEVoPA44XQy/00DkEsrCjeCLZ5ebtz5N3+XFKtAeP6P7TPv15tq9Wqq0qABBeKFDyd1Q1ADw==@nongnu.org,
 AJvYcCV5M2qxxqC4hZi27Idh57ho7TF/m3vpbR9mzN+iYczQaPvmVGHV2RD0fpC29JK12D+2tAmA1q/ebATWRw5i@nongnu.org
X-Gm-Message-State: AOJu0YzEKahs2zm9nylZPLiF0VsezFQHOJjok8Anw/lYfiUNQ9oQLjz4
 uaZpGZKZ3tP2S0oH/yHlmQW0CGY1aBQeHOjh/Uuef0Jmnbw2fHApwJLz+Yzp1c9TzXgfxjQ2Zht
 KhYCn7p7yI0s4qElo1CXU2JTR5kw=
X-Received: by 2002:a17:90b:1888:b0:2d1:ca16:5555 with SMTP id
 98e67ed59e1d1-2d890620d8fmr10829708a91.37.1725396772396; Tue, 03 Sep 2024
 13:52:52 -0700 (PDT)
MIME-Version: 1.0
References: <CA+1FSiirzpq4wjcKTLSexiOWtv26sgD37h=wA2qxv8Qh5MW_-w@mail.gmail.com>
 <23d60255-614a-4a06-b449-644f215555d0@linaro.org>
 <CA+1FSiitcSBa3JZaAZMGkdB356d2M0rPqscwFnNXGML5HghVCQ@mail.gmail.com>
 <c80e855a-ac1c-40b6-8a76-966e53c0b7d7@linaro.org>
 <4cbc21b0-0634-445d-8a67-7705a4e186d8@linaro.org>
 <CA+1FSigiu8xXF1OPs1oSPS7LiGe23gsN73RwPpJUYH=X5EkTRQ@mail.gmail.com>
 <CA+1FSiiH9LP-7UupNLjDyZJGqJAHAjN2nSLFm9fCx=ZNphxGoQ@mail.gmail.com>
 <CA+1FSih6t-Ccnxh1GvOFMf9pMjcfV1V+yyJHV=ZH0c2RY0Kjng@mail.gmail.com>
 <268989a3-cd5c-41fc-ba0d-5eb71bc6e9dc@linaro.org>
 <CA+1FSijygoVZmTkYR8Xoob4yQQdf9o3CZ2-LmzDrBh2e0VaerQ@mail.gmail.com>
 <CA+1FSigOmKen0QPKSEQqt15Zzrx4UFSCpj+5DJMCJtGnFcE+Hw@mail.gmail.com>
 <CA+1FSijfe+5V4RHs-1ow2JwAeiKcmW31V2Ddx9a9zxb_kybDFg@mail.gmail.com>
 <70b240aa-98de-4998-8c1b-34349fc831ba@linaro.org>
 <CA+1FSiiyb2v7oy43exRuY7kQpLgUcEifAE2zrEtpYPkgAY+TRw@mail.gmail.com>
 <6eac1f19-59a2-440a-a5b3-f4d9654ba539@linaro.org>
 <CA+1FSigjog5DO4UJ4bjo+rvtRc2ih+yJF0q9HM7y6N=aSg6w=A@mail.gmail.com>
In-Reply-To: <CA+1FSigjog5DO4UJ4bjo+rvtRc2ih+yJF0q9HM7y6N=aSg6w=A@mail.gmail.com>
From: Mario Marietto <marietto2008@gmail.com>
Date: Tue, 3 Sep 2024 22:52:13 +0200
Message-ID: <CA+1FSijxZ5Ocic-aGTikNxr_faS54fP=P+2uuCxfypMJKEE2aQ@mail.gmail.com>
Subject: Re: Error : init: partition(s) not found in /sys, waiting for their
 uevent(s): mmcblk0p2, mmcblk0p3 while trying to emulate Android 14 on Ubuntu
 24.04 X64 bit using qemu-system-aarch64.
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-discuss@nongnu.org, 
 qemu-arm <qemu-arm@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000b72a0706213d3dae"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=marietto2008@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 NORMAL_HTTP_TO_IP=0.001, NUMERIC_HTTP_ADDR=1.242, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Gpi0EmO7cOZn

--000000000000b72a0706213d3dae
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Unfortunately the usage of qemu patched to boot Android 10 on the Jetson
nano didn't change anything. I get the same exact errors as before. :(

On Tue, Sep 3, 2024 at 8:14=E2=80=AFPM Mario Marietto <marietto2008@gmail.c=
om>
wrote:

> >Depends which version of Android you use, but images are getting bigger
> and bigger every time since Android 5, so I'm not surprised it >takes mor=
e
> and more time to boot.
>
> If I will be able to boot Android 10 using the qemu patched by
> Antmicro,maybe I will try if it will work with Android 14 for Raspberry P=
i
> 4.
> Just for the sake of my curiosity.
>
>
>
> On Tue, Sep 3, 2024 at 8:03=E2=80=AFPM Pierrick Bouvier <
> pierrick.bouvier@linaro.org> wrote:
>
>> On 9/3/24 10:17, Mario Marietto wrote:
>> > @Pierrick Bouvier :
>> >
>> > ---> I'm really glad to see it worked! Are you already running the
>> > raspberry image, or vanilla AOSP ?
>> >
>> > No and I don't think I will. I have a project that I'm working on that
>> > aims to emulate Android for Arm on Linux x64 bit. I knew that it would
>> > be slow,but I didn't think it would be so much. When I used AVD as an
>> > emulator,Android went faster.
>> >
>> >
>>
>> Depends which version of Android you use, but images are getting bigger
>> and bigger everytime since Android 5, so I'm not surprised it takes more
>> and more time to boot.
>>
>> By AVD, if you refer to Android emulator included in Android Studio,
>> it's a downstream fork of QEMU. So the performance will be on par (or
>> worse) than upstream QEMU.
>>
>> The only way to have something that goes fast is to have aarch64
>> hardware and use kvm acceleration (on Linux, or equivalent on
>> Windows/MacOS).
>>
>> >       @Peter Maydell <mailto:peter.maydell@linaro.org> :
>> >
>> >
>> > I think that I've understood the reason why several years ago it
>> worked.
>> > Probably I'd used this special version of qemu :
>> >
>> >
>> > https://github.com/antmicro/kvm-aosp-qemu/releases/tag/5.0.0-kvm-aosp
>> > <https://github.com/antmicro/kvm-aosp-qemu/releases/tag/5.0.0-kvm-aosp=
>
>> >
>> > I'm sure that it contains the necessary patches to be able to boot
>> > Android 10 on the Jetson Nano.
>> >
>> > On Tue, Sep 3, 2024 at 6:31=E2=80=AFPM Pierrick Bouvier
>> > <pierrick.bouvier@linaro.org <mailto:pierrick.bouvier@linaro.org>>
>> wrote:
>> >
>> >     Without answering specifically on your question, if you want to
>> >     exchange
>> >     files with a android guest, simply use adb (push/pull commands).
>> It's
>> >     much better and faster than any other solution you can try, and
>> >     cuttlefish tools already setup all the adb stuff for you.
>> >
>> >     You can use adb-sync (https://github.com/jb2170/better-adb-sync
>> >     <https://github.com/jb2170/better-adb-sync>) to have
>> >     something similar to rsync, in case you want to send files
>> >     incrementally.
>> >
>> >     Pierrick
>> >
>> >     On 9/3/24 08:24, Mario Marietto wrote:
>> >      > Hello.
>> >      >
>> >      > Actually I'm using my Jetson Nano and I'm trying to emulate
>> >     Android 10
>> >      > by antmicro. I'm trying to use the same parameters used several
>> >     years
>> >      > ago,when it worked. What I want to try now is to enable
>> >     virtio-blk-pci
>> >      > on qemu. Probably in addition to using qemu 5.0,I had configure=
d
>> >     qemu
>> >      > with virtio-blk-pci enabled,because I used these parameters and
>> they
>> >      > worked great :
>> >      >
>> >      > -drive
>> >      >
>> >
>>  index=3D0,if=3Dnone,id=3Dsystem,file=3D/home/aresuser/Desktop/antmicro/=
aosp-img/system-rw.img
>> \
>> >      >          -device virtio-blk-pci,drive=3Dsystem \
>> >      >          -drive
>> >      >
>> >
>>  index=3D1,if=3Dnone,id=3Dvendor,file=3D/home/aresuser/Desktop/antmicro/=
aosp-img/vendor-rw.img
>> \
>> >      >          -device virtio-blk-pci,drive=3Dvendor \
>> >      >          -drive
>> >      >
>> >
>>  index=3D2,if=3Dnone,id=3Duserdata,file=3D/home/aresuser/Desktop/antmicr=
o/aosp-img/userdata.img
>> \
>> >      >          -device virtio-blk-pci,drive=3Duserdata \
>> >      >
>> >      > Can someone tell me how to enable the "VirtFS support" in qemu
>> 5.0 ?
>> >      > because at the moment it is configured to "no" :
>> >      >
>> >      > root@jetson:/home/aresuser/Desktop/antmicro/qemu-5.0.0#
>> ./configure
>> >      > Install prefix    /usr/local
>> >      > BIOS directory    /usr/local/share/qemu
>> >      > firmware path     /usr/local/share/qemu-firmware
>> >      > binary directory  /usr/local/bin
>> >      > library directory /usr/local/lib
>> >      > module directory  /usr/local/lib/qemu
>> >      > libexec directory /usr/local/libexec
>> >      > include directory /usr/local/include
>> >      > config directory  /usr/local/etc
>> >      > local state directory   /usr/local/var
>> >      > Manual directory  /usr/local/share/man
>> >      > ELF interp prefix /usr/gnemul/qemu-%M
>> >      > Build directory   /home/aresuser/Desktop/antmicro/qemu-5.0.0
>> >      > Source path       /home/aresuser/Desktop/antmicro/qemu-5.0.0
>> >      > GIT binary        git
>> >      > GIT submodules
>> >      > C compiler        cc
>> >      > Host C compiler   cc
>> >      > C++ compiler      c++
>> >      > Objective-C compiler clang
>> >      > ARFLAGS           rv
>> >      > CFLAGS            -O2 -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3D2 -=
g
>> >      > QEMU_CFLAGS       -I/usr/include/pixman-1
>> -I$(SRC_PATH)/dtc/libfdt
>> >      >   -pthread -I/usr/include/glib-2.0
>> >      > -I/usr/lib/aarch64-linux-gnu/glib-2.0/include -fPIE -DPIE
>> >       -D_GNU_SOURCE
>> >      > -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -Wstrict-prototype=
s
>> >      > -Wredundant-decls -Wall -Wundef -Wwrite-strings
>> -Wmissing-prototypes
>> >      > -fno-strict-aliasing -fno-common -fwrapv -std=3Dgnu99
>> >      >   -Wexpansion-to-defined -Wendif-labels -Wno-shift-negative-val=
ue
>> >      > -Wno-missing-include-dirs -Wempty-body -Wnested-externs
>> >      > -Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers
>> >      > -Wold-style-declaration -Wold-style-definition -Wtype-limits
>> >      > -fstack-protector-strong  -I/usr/include/libpng16
>> >      >   -I$(SRC_PATH)/capstone/include
>> >      > QEMU_LDFLAGS      -L$(BUILD_DIR)/dtc/libfdt -Wl,-z,relro
>> >     -Wl,-z,now -pie
>> >      >   -fstack-protector-strong
>> >      > make              make
>> >      > install           install
>> >      > python            /usr/bin/python3 -B (3.10.12)
>> >      > genisoimage       /usr/bin/genisoimage
>> >      > slirp support     internal
>> >      > smbd              /usr/sbin/smbd
>> >      > module support    no
>> >      > alt path mod load no
>> >      > host CPU          aarch64
>> >      > host big endian   no
>> >      > target list       aarch64-softmmu alpha-softmmu arm-softmmu
>> >     cris-softmmu
>> >      > hppa-softmmu i386-softmmu lm32-softmmu m68k-softmmu
>> >     microblaze-softmmu
>> >      > microblazeel-softmmu mips-softmmu mips64-softmmu mips64el-softm=
mu
>> >      > mipsel-softmmu moxie-softmmu nios2-softmmu or1k-softmmu
>> ppc-softmmu
>> >      > ppc64-softmmu riscv32-softmmu riscv64-softmmu rx-softmmu
>> >     s390x-softmmu
>> >      > sh4-softmmu sh4eb-softmmu sparc-softmmu sparc64-softmmu
>> >     tricore-softmmu
>> >      > unicore32-softmmu x86_64-softmmu xtensa-softmmu xtensaeb-softmm=
u
>> >      > aarch64-linux-user aarch64_be-linux-user alpha-linux-user
>> >     arm-linux-user
>> >      > armeb-linux-user cris-linux-user hppa-linux-user i386-linux-use=
r
>> >      > m68k-linux-user microblaze-linux-user microblazeel-linux-user
>> >      > mips-linux-user mips64-linux-user mips64el-linux-user
>> >     mipsel-linux-user
>> >      > mipsn32-linux-user mipsn32el-linux-user nios2-linux-user
>> >     or1k-linux-user
>> >      > ppc-linux-user ppc64-linux-user ppc64abi32-linux-user
>> >     ppc64le-linux-user
>> >      > riscv32-linux-user riscv64-linux-user s390x-linux-user
>> >     sh4-linux-user
>> >      > sh4eb-linux-user sparc-linux-user sparc32plus-linux-user
>> >      > sparc64-linux-user tilegx-linux-user x86_64-linux-user
>> >     xtensa-linux-user
>> >      > xtensaeb-linux-user
>> >      > gprof enabled     no
>> >      > sparse enabled    no
>> >      > strip binaries    yes
>> >      > profiler          no
>> >      > static build      no
>> >      > SDL support       yes (2.26.1)
>> >      > SDL image support no
>> >      > GTK support       yes (3.24.33)
>> >      > GTK GL support    yes
>> >      > VTE support       no
>> >      > TLS priority      NORMAL
>> >      > GNUTLS support    no
>> >      > libgcrypt         no
>> >      > nettle            no
>> >      > libtasn1          no
>> >      > PAM               no
>> >      > iconv support     yes
>> >      > curses support    yes
>> >      > virgl support     no
>> >      > curl support      no
>> >      > mingw32 support   no
>> >      > Audio drivers     pa oss
>> >      > Block whitelist (rw)
>> >      > Block whitelist (ro)
>> >      >
>> >      > *VirtFS support    no*
>> >      >
>> >      > Multipath support no
>> >      > VNC support       yes
>> >      > VNC SASL support  no
>> >      > VNC JPEG support  yes
>> >      > VNC PNG support   yes
>> >      > xen support       no
>> >      > brlapi support    no
>> >      > Documentation     no
>> >      > PIE               yes
>> >      > vde support       no
>> >      > netmap support    no
>> >      > Linux AIO support no
>> >      > Linux io_uring support no
>> >      > ATTR/XATTR support yes
>> >      > Install blobs     yes
>> >      > KVM support       yes
>> >      > HAX support       no
>> >      > HVF support       no
>> >      > WHPX support      no
>> >      > TCG support       yes
>> >      > TCG debug enabled no
>> >      > TCG interpreter   no
>> >      > malloc trim support yes
>> >      > RDMA support      no
>> >      > PVRDMA support    no
>> >      > fdt support       git
>> >      > membarrier        no
>> >      > preadv support    yes
>> >      > fdatasync         yes
>> >      > madvise           yes
>> >      > posix_madvise     yes
>> >      > posix_memalign    yes
>> >      > libcap-ng support no
>> >      > vhost-net support yes
>> >      > vhost-crypto support yes
>> >      > vhost-scsi support yes
>> >      > vhost-vsock support yes
>> >      > vhost-user support yes
>> >      > vhost-user-fs support yes
>> >      > Trace backends    log
>> >      > spice support     no
>> >      > rbd support       no
>> >      > xfsctl support    no
>> >      > smartcard support no
>> >      > libusb            no
>> >      > usb net redir     no
>> >      > OpenGL support    yes
>> >      > OpenGL dmabufs    yes
>> >      > libiscsi support  no
>> >      > libnfs support    no
>> >      > build guest agent yes
>> >      > QGA VSS support   no
>> >      > QGA w32 disk info no
>> >      > QGA MSI support   no
>> >      > seccomp support   no
>> >      > coroutine backend ucontext
>> >      > coroutine pool    yes
>> >      > debug stack usage no
>> >      > mutex debugging   no
>> >      > crypto afalg      no
>> >      > GlusterFS support no
>> >      > gcov              gcov
>> >      > gcov enabled      no
>> >      > TPM support       yes
>> >      > libssh support    no
>> >      > QOM debugging     yes
>> >      > Live block migration yes
>> >      > lzo support       no
>> >      > snappy support    no
>> >      > bzip2 support     no
>> >      > lzfse support     no
>> >      > zstd support      no
>> >      > NUMA host support yes
>> >      > libxml2           yes
>> >      > tcmalloc support  no
>> >      > jemalloc support  no
>> >      > avx2 optimization
>> >      > avx512f optimization no
>> >      > replication support yes
>> >      > VxHS block device no
>> >      > bochs support     yes
>> >      > cloop support     yes
>> >      > dmg support       yes
>> >      > qcow v1 support   yes
>> >      > vdi support       yes
>> >      > vvfat support     yes
>> >      > qed support       yes
>> >      > parallels support yes
>> >      > sheepdog support  yes
>> >      > capstone          internal
>> >      > libpmem support   no
>> >      > libudev           yes
>> >      > default devices   yes
>> >      > plugin support    no
>> >      > fuzzing support   no
>> >      > gdb               /usr/bin/gdb
>> >      > cross containers  docker
>> >      >
>> >      > Thanks.
>> >      >
>> >      > On Tue, Sep 3, 2024 at 10:55=E2=80=AFAM Mario Marietto
>> >     <marietto2008@gmail.com <mailto:marietto2008@gmail.com>
>> >      > <mailto:marietto2008@gmail.com <mailto:marietto2008@gmail.com>>=
>
>> >     wrote:
>> >      >
>> >      >     Finally it worked :
>> >      >
>> >      >     Istantanea_2024-09-03_10-51-35.jpg
>> >      >     Very thanks man. In any case it is VERY slow and not usable
>> >     at all.
>> >      >     Is there something that I can do to improve its speed ?
>> >      >
>> >      >
>> >      >     On Tue, Sep 3, 2024 at 10:33=E2=80=AFAM Mario Marietto
>> >      >     <marietto2008@gmail.com <mailto:marietto2008@gmail.com>
>> >     <mailto:marietto2008@gmail.com <mailto:marietto2008@gmail.com>>>
>> wrote:
>> >      >
>> >      >
>> >       ziomario@Z390-AORUS-PRO-DEST:/mnt/zroot-133/_OS/Android/aosp_14/=
android-image$
>> HOME=3D$(pwd) ./bin/launch_cvd -vm_manager qemu_cli
>> -report_anonymous_usage_stats=3Dn --start_webrtc=3Dfalse
>> >      >
>> >      >         09-03 10:04:44.206 2786386 2786386 I launch_cvd:
>> main.cc:235
>> >      >         Using system_image_dir of:
>> >      >
>> >
>>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> >      >         NOTICE:
>> >      >
>> >      >         By using this Android Virtual Device, you agree to
>> >      >         Google Terms of Service
>> >     (https://policies.google.com/terms <
>> https://policies.google.com/terms>
>> >      >         <https://policies.google.com/terms
>> >     <https://policies.google.com/terms>>).
>> >      >         The Google Privacy Policy
>> >     (https://policies.google.com/privacy
>> >     <https://policies.google.com/privacy>
>> >      >         <https://policies.google.com/privacy
>> >     <https://policies.google.com/privacy>>)
>> >      >         describes how Google handles information generated as
>> you use
>> >      >         Google Services.
>> >      >
>> >
>>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> >      >
>> >      >         Reading --config option from:
>> >      >
>> >       /mnt/zroot-133/_OS/Android/aosp_14/android-image/android-info.tx=
t
>> >      >         Launching CVD using --config=3D'phone'.
>> >      >         GPU auto mode: detected prerequisites for accelerated
>> >     rendering
>> >      >         support.
>> >      >         Enabling --gpu_mode=3Dgfxstream.
>> >      >         GPU vhost user auto mode: not yet supported with
>> >     qemu_cli. Not
>> >      >         enabling vhost user gpu.
>> >      >         Requested resuming a previous session (the default
>> >     behavior) but
>> >      >         the base images have changed under the overlay, making
>> the
>> >      >         overlay incompatible. Wiping the overlay files.
>> >      >         Path for instance UDS: /tmp/cf_avd_1000
>> >      >
>> >      >         The following lines contain useful debugging informatio=
n:
>> >      >           Serial console is disabled; use -console=3Dtrue to
>> enable it.
>> >      >           Logcat output:
>> >      >
>> >
>>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/cuttlefish/instances/c=
vd-1/logs/logcat
>> >      >
>> >      >           Kernel log:
>> >      >
>> >
>>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/cuttlefish/instances/c=
vd-1/kernel.log
>> >      >           Launcher log:
>> >      >
>> >
>>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/cuttlefish/instances/c=
vd-1/logs/launcher.log
>> >      >
>> >      >           Instance configuration:
>> >      >
>> >
>>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/cuttlefish/instances/c=
vd-1/cuttlefish_config.json
>> >      >
>> >      >           Launcher Build ID: 12309296
>> >      >
>> >      >
>> >
>>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/modem_simulator
>> >      >
>> >
>>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/tombstone_receiver
>> >      >
>>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/log_tee
>> >      >
>>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/wmediumd
>> >      >
>> >
>>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/casimir_control_se=
rver
>> >      >
>> >
>>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/screen_recording_s=
erver
>> >      >
>> >       /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/adb_connect=
or
>> >      >
>> >
>>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/socket_vsock_proxy
>> >      >
>> >
>>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/socket_vsock_proxy
>> >      >
>> >       /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/tcp_connect=
or
>> >      >
>> >
>>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/control_env_proxy_=
server
>> >      >
>> >       /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/echo_server
>> >      >         Start modem simulator, server_fds: 58, Sim type: normal
>> >      >
>> >
>>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/gnss_grpc_proxy
>> >      >
>> >
>>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/logcat_receiver
>> >      >
>> >
>>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/kernel_log_monitor
>> >      >
>> >
>>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/openwrt_control_se=
rver
>> >      >
>>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/log_tee
>> >      >
>> >
>>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/process_restarter
>> >      >
>>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/netsimd
>> >      >
>> >
>>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/socket_vsock_proxy
>> >      >
>> >      >         Failed to open socket: Connection refused
>> >      >
>> >      >
>> >      >
>> >
>>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/socket_vsock_proxy
>> >      >
>> >       /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/secure_env
>> >      >
>> >
>>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/x86_64-linux-gnu/q=
emu/qemu-system-aarch64
>> >      >         Server listening on
>> >      >
>> >       unix:/tmp/cf_avd_1000/cvd-1/grpc_socket/CasimirControlServer.soc=
k
>> >      >         Server listening on
>> >      >         unix:/tmp/cf_avd_1000/cvd-1/grpc_socket/EchoServer.sock
>> >      >         Server listening on
>> >      >
>> >       unix:/tmp/cf_avd_1000/cvd-1/grpc_socket/OpenwrtControlServer.soc=
k
>> >      >         root-canal I 09-03 10:06:13.219 device_boutique.cc:37
>> >      >         Registering beacon
>> >      >         root-canal I 09-03 10:06:13.219 device_boutique.cc:37
>> >      >         Registering beacon_swarm
>> >      >         root-canal I 09-03 10:06:13.219 device_boutique.cc:37
>> >      >         Registering scripted_beacon
>> >      >         root-canal I 09-03 10:06:13.219 device_boutique.cc:37
>> >      >         Registering sniffer
>> >      >         Server listening on
>> >      >
>> >       unix:/tmp/cf_avd_1000/cvd-1/grpc_socket/ControlEnvProxyServer.so=
ck
>> >      >         netsimd I 09-03 08:06:13.221 rust_main.rs:98
>> >     <http://rust_main.rs:98>
>> >      >         <http://rust_main.rs:98 <http://rust_main.rs:98>> -
>> >     netsim artifacts path:
>> >      >         "/tmp/android-ziomario/netsimd"
>> >      >         netsimd I 09-03 08:06:13.221 rust_main.rs:101
>> >     <http://rust_main.rs:101>
>> >      >         <http://rust_main.rs:101 <http://rust_main.rs:101>> -
>> >     NetsimdArgs {
>> >      >             fd_startup_str: Some(
>> >      >                 "{\"devices\":[{\"name\":\"0.0.0.0:6520
>> >     <http://0.0.0.0:6520>
>> >      >         <http://0.0.0.0:6520
>> >     <http://0.0.0.0:6520
>> >>\",\"chips\":[{\"kind\":\"BLUETOOTH\",\"fdIn\":81,\"fdOut\":82},{\"kin=
d\":\"UWB\",\"fdIn
>> >      >         \":83,\"fdOut\":84}]}]}",
>> >      >             ),
>> >      >             no_cli_ui: false,
>> >      >             no_web_ui: false,
>> >      >             pcap: false,
>> >      >             disable_address_reuse: false,
>> >      >             hci_port: Some(
>> >      >                 7300,
>> >      >             ),
>> >      >             connector_instance: None,
>> >      >             instance: Some(
>> >      >                 1,
>> >      >             ),
>> >      >             logtostderr: false,
>> >      >             dev: false,
>> >      >             rust_grpc: false,
>> >      >             rust_hostapd: false,
>> >      >             rust_slirp: true,
>> >      >             vsock: None,
>> >      >             config: None,
>> >      >             host_dns: None,
>> >      >             http_proxy: None,
>> >      >             wifi_tap: None,
>> >      >             test_beacons: false,
>> >      >             no_test_beacons: false,
>> >      >             no_shutdown: false,
>> >      >             verbose: false,
>> >      >             version: false,
>> >      >         }
>> >      >         Size of OBJECT =3D 1204
>> >      >         Size of components in TPMT_SENSITIVE =3D 744
>> >      >             TPMI_ALG_PUBLIC                 2
>> >      >             TPM2B_AUTH                      50
>> >      >             TPM2B_DIGEST                    50
>> >      >             TPMU_SENSITIVE_COMPOSITE        642
>> >      >         MAX_CONTEXT_SIZE can be reduced to 1264 (1344)
>> >      >         size : 360
>> >      >         starting Rust KeyMint TA implementation in a thread
>> >      >         starting C++ KeyMint implementation in a thread with FD=
s
>> >     in=3D31,
>> >      >         out=3D30
>> >      >         KeyMint Rust TA running with infile=3D37, outfile=3D36,
>> >      >         security_level=3DSoftware
>> >      >         No secure deletion data file found. Creating one.
>> >      >         I0903 10:06:13.249418 2786724 SharedLibrary.cpp:64]
>> >      >         SharedLibrary::open for [libvulkan.so]
>> >      >
>> >      >         I0903 10:06:13.249507 2786724 SharedLibrary.cpp:76]
>> >      >         SharedLibrary::open for [libvulkan.so]: not found in ma=
p,
>> >     open
>> >      >         for the first time
>> >      >
>> >      >         I0903 10:06:13.249511 2786724 SharedLibrary.cpp:186]
>> >      >         SharedLibrary::open for [libvulkan.so] (posix): begin
>> >      >
>> >      >         I0903 10:06:13.249514 2786724 SharedLibrary.cpp:244]
>> >      >         SharedLibrary::open for [libvulkan.so] (posix,linux):
>> call
>> >      >         dlopen on [libvulkan.so
>> >      >         ]
>> >      >
>> >      >         added library libvulkan.so
>> >      >         I0903 10:06:13.250535 2786724 HealthMonitor.cpp:280]
>> >      >         HealthMonitor disabled.
>> >      >         createGlobalVkEmulation:964 Selecting Vulkan device:
>> NVIDIA
>> >      >         GeForce GTX 1060 3GB
>> >      >         initialize: Supports id properties, got a vulkan device
>> UUID
>> >      >         I0903 10:06:13.354756 2786724 SharedLibrary.cpp:76]
>> >      >         SharedLibrary::open for [libGLESv2.so]: not found in ma=
p,
>> >     open
>> >      >         for the first time
>> >      >
>> >      >         I0903 10:06:13.354764 2786724 SharedLibrary.cpp:186]
>> >      >         SharedLibrary::open for [libGLESv2.so] (posix): begin
>> >      >
>> >      >         I0903 10:06:13.354768 2786724 SharedLibrary.cpp:244]
>> >      >         SharedLibrary::open for [libGLESv2.so] (posix,linux):
>> call
>> >      >         dlopen on [libGLESv2.so
>> >      >         ]
>> >      >
>> >      >         I0903 10:06:13.355076 2786724 SharedLibrary.cpp:76]
>> >      >         SharedLibrary::open for [libEGL.so]: not found in map,
>> >     open for
>> >      >         the first time
>> >      >
>> >      >         I0903 10:06:13.355081 2786724 SharedLibrary.cpp:186]
>> >      >         SharedLibrary::open for [libEGL.so] (posix): begin
>> >      >
>> >      >         I0903 10:06:13.355084 2786724 SharedLibrary.cpp:244]
>> >      >         SharedLibrary::open for [libEGL.so] (posix,linux): call
>> >     dlopen
>> >      >         on [libEGL.so]
>> >      >
>> >      >         I0903 10:06:13.448821 2786724
>> VkCommonOperations.cpp:1226]
>> >      >         Initializing VkEmulation features:
>> >      >         I0903 10:06:13.448837 2786724
>> VkCommonOperations.cpp:1227]
>> >      >              glInteropSupported: true
>> >      >         I0903 10:06:13.448840 2786724
>> VkCommonOperations.cpp:1228]
>> >      >              useDeferredCommands: true
>> >      >         I0903 10:06:13.448842 2786724
>> VkCommonOperations.cpp:1230]
>> >      >              createResourceWithRequirements: true
>> >      >         I0903 10:06:13.448844 2786724
>> VkCommonOperations.cpp:1231]
>> >      >              useVulkanComposition: false
>> >      >         I0903 10:06:13.448846 2786724
>> VkCommonOperations.cpp:1232]
>> >      >              useVulkanNativeSwapchain: false
>> >      >         I0903 10:06:13.448848 2786724
>> VkCommonOperations.cpp:1233]
>> >      >              enable guestRenderDoc: false
>> >      >         I0903 10:06:13.448850 2786724
>> VkCommonOperations.cpp:1234]
>> >      >              ASTC LDR emulation mode: 2
>> >      >         I0903 10:06:13.448852 2786724
>> VkCommonOperations.cpp:1235]
>> >      >              enable ETC2 emulation: true
>> >      >         I0903 10:06:13.448854 2786724
>> VkCommonOperations.cpp:1236]
>> >      >              enable Ycbcr emulation: false
>> >      >         I0903 10:06:13.448856 2786724
>> VkCommonOperations.cpp:1237]
>> >      >              guestUsesAngle: false
>> >      >         I0903 10:06:13.448858 2786724
>> VkCommonOperations.cpp:1238]
>> >      >              useDedicatedAllocations: false
>> >      >         I0903 10:06:13.449542 2786724 FrameBuffer.cpp:486]
>> Graphics
>> >      >         Adapter Vendor Google (NVIDIA Corporation)
>> >      >         I0903 10:06:13.449548 2786724 FrameBuffer.cpp:487]
>> Graphics
>> >      >         Adapter Android Emulator OpenGL ES Translator (NVIDIA
>> GeForce
>> >      >         GTX 1060 3GB/
>> >      >         PCIe/SSE2)
>> >      >         I0903 10:06:13.449551 2786724 FrameBuffer.cpp:488]
>> >     Graphics API
>> >      >         Version OpenGL ES 3.0 (OpenGL ES 3.2 NVIDIA 535.183.01)
>> >      >         I0903 10:06:13.449553 2786724 FrameBuffer.cpp:489]
>> >     Graphics API
>> >      >         Extensions GL_OES_EGL_sync GL_OES_EGL_image
>> >      >         GL_OES_EGL_image_external G
>> >      >         L_OES_depth24 GL_OES_depth32 GL_OES_element_index_uint
>> >      >         GL_OES_texture_float GL_OES_texture_float_linear
>> >      >         GL_OES_compressed_paletted_text
>> >      >         ure GL_OES_compressed_ETC1_RGB8_texture
>> GL_OES_depth_texture
>> >      >         GL_OES_texture_half_float
>> GL_OES_texture_half_float_linear
>> >      >         GL_OES_packed_d
>> >      >         epth_stencil GL_OES_vertex_half_float
>> >      >         GL_OES_standard_derivatives GL_OES_texture_npot
>> >      >         GL_OES_rgb8_rgba8 GL_OVR_multiview2 GL_EXT_multiv
>> >      >         iew_texture_multisample GL_EXT_color_buffer_float
>> >      >         GL_EXT_color_buffer_half_float
>> GL_EXT_texture_format_BGRA8888
>> >      >         GL_APPLE_texture_format
>> >      >         _BGRA8888 GL_EXT_texture_buffer GL_OES_texture_buffer
>> >      >         GL_EXT_draw_buffers_indexed
>> >      >         I0903 10:06:13.449559 2786724 FrameBuffer.cpp:490]
>> Graphics
>> >      >         Device Extensions N/A
>> >      >         GUEST_UBOOT_VERSION: 2024.01-g1ed8f8bde33e-ab12091206
>> (Jul 10
>> >      >         2024 - 23:47:38 +0000)
>> >      >         U-Boot 20
>> >      >         starting Rust KeyMint TA implementation in a thread
>> >      >         starting C++ KeyMint implementation in a thread with FD=
s
>> >     in=3D31,
>> >      >         out=3D30
>> >      >         KeyMint Rust TA running with infile=3D37, outfile=3D36,
>> >      >         security_level=3DSoftware
>> >      >         Secure deletion data file found. Parsing.
>> >      >         2024-09-03T08:06:13.626075Z qemu-system-aarch64:
>> >      >         virtio-serial-bus: Unexpected port id 16 for device
>> >     virtio-serial.0
>> >      >         2024-09-03T08:06:13.626410Z qemu-system-aarch64:
>> >      >         virtio-serial-bus: Unexpected port id 17 for device
>> >     virtio-serial.0
>> >      >         2024-09-03T08:06:13.626599Z qemu-system-aarch64:
>> >      >         virtio-serial-bus: Unexpected port id 18 for device
>> >     virtio-serial.0
>> >      >         2024-09-03T08:06:13.626788Z qemu-system-aarch64:
>> >      >         virtio-serial-bus: Unexpected port id 19 for device
>> >     virtio-serial.0
>> >      >         2024-09-03T08:06:13.626980Z qemu-system-aarch64:
>> >      >         virtio-serial-bus: Unexpected port id 20 for device
>> >     virtio-serial.0
>> >      >         2024-09-03T08:06:13.627171Z qemu-system-aarch64:
>> >      >         virtio-serial-bus: Unexpected port id 21 for device
>> >     virtio-serial.0
>> >      >         2024-09-03T08:06:13.627360Z qemu-system-aarch64:
>> >      >         virtio-serial-bus: Unexpected port id 22 for device
>> >     virtio-serial.0
>> >      >         2024-09-03T08:06:13.627549Z qemu-system-aarch64:
>> >      >         virtio-serial-bus: Unexpected port id 23 for device
>> >     virtio-serial.0
>> >      >         2024-09-03T08:06:13.627738Z qemu-system-aarch64:
>> >      >         virtio-serial-bus: Unexpected port id 24 for device
>> >     virtio-serial.0
>> >      >         2024-09-03T08:06:13.627930Z qemu-system-aarch64:
>> >      >         virtio-serial-bus: Unexpected port id 25 for device
>> >     virtio-serial.0
>> >      >         2024-09-03T08:06:13.628119Z qemu-system-aarch64:
>> >      >         virtio-serial-bus: Unexpected port id 26 for device
>> >     virtio-serial.0
>> >      >         2024-09-03T08:06:13.628307Z qemu-system-aarch64:
>> >      >         virtio-serial-bus: Unexpected port id 27 for device
>> >     virtio-serial.0
>> >      >         2024-09-03T08:06:13.628496Z qemu-system-aarch64:
>> >      >         virtio-serial-bus: Unexpected port id 28 for device
>> >     virtio-serial.0
>> >      >         2024-09-03T08:06:13.628683Z qemu-system-aarch64:
>> >      >         virtio-serial-bus: Unexpected port id 29 for device
>> >     virtio-serial.0
>> >      >         2024-09-03T08:06:13.628874Z qemu-system-aarch64:
>> >      >         virtio-serial-bus: Unexpected port id 30 for device
>> >     virtio-serial.0
>> >      >
>> >      >         GUEST_KERNEL_VERSION:
>> >      >         6.6.46-android15-8-g3569b053517c-ab12290856-4k
>> >      >         (kleaf@build-host) (Android (11368308, +pgo, +bolt,
>> +lto,
>> >     +mlgo,
>> >      >         based on r510928) clang version 18.0.0
>> >      >         (https://android.googlesource.com/toolchain/llvm-projec=
t
>> >     <https://android.googlesource.com/toolchain/llvm-project>
>> >      >         <https://android.googlesource.com/toolchain/llvm-projec=
t
>> >     <https://android.googlesource.com/toolchain/llvm-project>>
>> >      >         477610d4d0d988e69dbc3fae4fe86bff3f07f2b5), LLD 18.0.0)
>> #1 SMP
>> >      >         PREEMPT Wed Aug 28 21:43:33 UTC 2024
>> >      >         ] Linux version
>> >      >         transport message failed, response body: device
>> >     '0.0.0.0:6520 <http://0.0.0.0:6520>
>> >      >         <http://0.0.0.0:6520 <http://0.0.0.0:6520>>' not found
>> >      >         transport message failed, response body: device
>> >     '0.0.0.0:6520 <http://0.0.0.0:6520>
>> >      >         <http://0.0.0.0:6520 <http://0.0.0.0:6520>>' not found
>> >      >         transport message failed, response body: device
>> >     '0.0.0.0:6520 <http://0.0.0.0:6520>
>> >      >         <http://0.0.0.0:6520 <http://0.0.0.0:6520>>' not found
>> >      >         transport message failed, response body: device
>> >     '0.0.0.0:6520 <http://0.0.0.0:6520>
>> >      >         <http://0.0.0.0:6520 <http://0.0.0.0:6520>>' not found
>> >      >         GUEST_BUILD_FINGERPRINT:
>> >      >
>> >
>>  generic/aosp_cf_arm64_only_phone/vsoc_arm64_only:VanillaIceCream/MAIN.1=
c019b0c/12309296:userdebug/test-keys
>> >      >         transport message failed, response body: device
>> >     '0.0.0.0:6520 <http://0.0.0.0:6520>
>> >      >         <http://0.0.0.0:6520 <http://0.0.0.0:6520>>' not found
>> >      >         transport message failed, response body: device
>> >     '0.0.0.0:6520 <http://0.0.0.0:6520>
>> >      >         <http://0.0.0.0:6520 <http://0.0.0.0:6520>>' not found
>> >      >         transport message failed, response body: device
>> >     '0.0.0.0:6520 <http://0.0.0.0:6520>
>> >      >         <http://0.0.0.0:6520 <http://0.0.0.0:6520>>' not found
>> >      >         transport message failed, response body: device
>> >     '0.0.0.0:6520 <http://0.0.0.0:6520>
>> >      >         <http://0.0.0.0:6520 <http://0.0.0.0:6520>>' not found
>> >      >         transport message failed, response body: device
>> >     '0.0.0.0:6520 <http://0.0.0.0:6520>
>> >      >         <http://0.0.0.0:6520 <http://0.0.0.0:6520>>' not found
>> >      >         transport message failed, response body: device
>> >     '0.0.0.0:6520 <http://0.0.0.0:6520>
>> >      >         <http://0.0.0.0:6520 <http://0.0.0.0:6520>>' not found
>> >      >         transport message failed, response body: device
>> >     '0.0.0.0:6520 <http://0.0.0.0:6520>
>> >      >         <http://0.0.0.0:6520 <http://0.0.0.0:6520>>' not found
>> >      >         transport message failed, response body: device
>> >     '0.0.0.0:6520 <http://0.0.0.0:6520>
>> >      >         <http://0.0.0.0:6520 <http://0.0.0.0:6520>>' not found
>> >      >         init: starting service 'adbd'...
>> >      >         proxy_fastboot] Stop event (11) received. Stopping prox=
y
>> >      >         proxy_adb] Start event (5) received. Starting proxy
>> >      >         proxy_adb] From: tcp: 6520
>> >      >         proxy_adb] To: vsock: 3:5555 vhost_user: false
>> >      >         transport message failed, response body: device
>> >     '0.0.0.0:6520 <http://0.0.0.0:6520>
>> >      >         <http://0.0.0.0:6520 <http://0.0.0.0:6520>>' not found
>> >      >         I0903 10:09:30.816108 2787314 IntelDrmDecoder.cpp:38]
>> >      >         IntelDrmDecoder created for context 2
>> >      >         I0903 10:09:32.764820 2787316 IntelDrmDecoder.cpp:38]
>> >      >         IntelDrmDecoder created for context 7
>> >      >         VIRTUAL_DEVICE_DISPLAY_POWER_MODE_CHANGED
>> >      >         VIRTUAL_DEVICE_DISPLAY_POWER_MODE_CHANGED
>> >      >         I0903 10:10:20.918014 2787359 IntelDrmDecoder.cpp:38]
>> >      >         IntelDrmDecoder created for context 11
>> >      >
>> >      >         I see a lot of errors,but it seems connected :
>> >      >
>> >      >         ziomario@Z390-AORUS-PRO-DEST:~/Scrivania$ adb devices
>> >      >         List of devices attached
>> >      > 0.0.0.0:6520 <http://0.0.0.0:6520> <http://0.0.0.0:6520
>> >     <http://0.0.0.0:6520>>    device
>> >      >
>> >      >         but scrcpy didn't work :
>> >      >
>> >      >         ziomario@Z390-AORUS-PRO-DEST:~/Scrivania$ scrcpy
>> >      >
>> >      >         scrcpy 2.6.1 <https://github.com/Genymobile/scrcpy
>> >     <https://github.com/Genymobile/scrcpy>
>> >      >         <https://github.com/Genymobile/scrcpy
>> >     <https://github.com/Genymobile/scrcpy>>>
>> >      >         INFO: ADB device found:
>> >      >         INFO:     --> (tcpip) 0.0.0.0:6520 <http://0.0.0.0:6520=
>
>> >     <http://0.0.0.0:6520 <http://0.0.0.0:6520>>
>> >      >                             device
>> >       Cuttlefish_arm64_phone_64_bit_only
>> >      >
>> >      >         /usr/local/share/scrcpy/scrcpy-server: 1 file pushed, 0
>> >     skipped.
>> >      >         90.0 MB/s (71112 bytes in 0.001s)
>> >      >         [server] INFO: Device: [Google] generic Cuttlefish arm6=
4
>> >     phone
>> >      >         64-bit only (Android 14)
>> >      >         [server] ERROR: Could not register rotation watcher
>> >      >         java.lang.NullPointerException: Attempt to invoke virtu=
al
>> >     method
>> >      >         'java.lang.Class java.lang.Object.getClass()' on a null
>> >     object
>> >      >         reference
>> >      >
>> >      >                 at
>> >      >
>> >
>>  com.genymobile.scrcpy.wrappers.WindowManager.registerRotationWatcher(Wi=
ndowManager.java:185)
>> >      >                 at
>> >      >
>>  com.genymobile.scrcpy.device.Device.<init>(Device.java:93)
>> >      >                 at
>> >     com.genymobile.scrcpy.Server.scrcpy(Server.java:145)
>> >      >                 at
>> >      >
>>  com.genymobile.scrcpy.Server.internalMain(Server.java:290)
>> >      >                 at
>> com.genymobile.scrcpy.Server.main(Server.java:245)
>> >      >                 at
>> >      >
>> >       com.android.internal.os.RuntimeInit.nativeFinishInit(Native
>> Method)
>> >      >                 at
>> >      >
>> >       com.android.internal.os.RuntimeInit.main(RuntimeInit.java:369)
>> >      >
>> >      >         [server] ERROR: Could not register display fold listene=
r
>> >      >
>> >      >         java.lang.NullPointerException: Attempt to invoke virtu=
al
>> >     method
>> >      >         'java.lang.Class java.lang.Object.getClass()' on a null
>> >     object
>> >      >         reference
>> >      >
>> >      >                 at
>> >      >
>> >
>>  com.genymobile.scrcpy.wrappers.WindowManager.registerDisplayFoldListene=
r(WindowManager.java:206)
>> >      >                 at
>> >      >
>>  com.genymobile.scrcpy.device.Device.<init>(Device.java:108)
>> >      >                 at
>> >     com.genymobile.scrcpy.Server.scrcpy(Server.java:145)
>> >      >                 at
>> >      >
>>  com.genymobile.scrcpy.Server.internalMain(Server.java:290)
>> >      >                 at
>> com.genymobile.scrcpy.Server.main(Server.java:245)
>> >      >                 at
>> >      >
>> >       com.android.internal.os.RuntimeInit.nativeFinishInit(Native
>> Method)
>> >      >                 at
>> >      >
>> >       com.android.internal.os.RuntimeInit.main(RuntimeInit.java:369)
>> >      >
>> >      >         [server] WARN: No clipboard manager, copy-paste between
>> >     device
>> >      >         and computer will not work
>> >      >         [server] ERROR: Attempt to invoke virtual method
>> >      >         'android.view.InputDevice
>> >      >
>> >       android.hardware.input.InputManagerGlobal.getInputDevice(int)'
>> >      >         on a null object reference
>> >      >         java.lang.NullPointerException: Attempt to invoke virtu=
al
>> >     method
>> >      >         'android.view.InputDevice
>> >      >
>> >       android.hardware.input.InputManagerGlobal.getInputDevice(int)'
>> >      >         on a null object reference
>> >      >                 at
>> >      >
>>  android.view.KeyCharacterMap.load(KeyCharacterMap.java:364)
>> >      >                 at
>> >      >
>> >
>>  com.genymobile.scrcpy.control.Controller.<init>(Controller.java:45)
>> >      >                 at
>> >     com.genymobile.scrcpy.Server.scrcpy(Server.java:159)
>> >      >                 at
>> >      >
>>  com.genymobile.scrcpy.Server.internalMain(Server.java:290)
>> >      >                 at
>> com.genymobile.scrcpy.Server.main(Server.java:245)
>> >      >                 at
>> >      >
>> >       com.android.internal.os.RuntimeInit.nativeFinishInit(Native
>> Method)
>> >      >                 at
>> >      >
>> >       com.android.internal.os.RuntimeInit.main(RuntimeInit.java:369)
>> >      >
>> >      >         INFO: Renderer: opengl
>> >      >         INFO: OpenGL version: 4.6.0 NVIDIA 535.183.01
>> >      >         INFO: Trilinear filtering enabled
>> >      >         WARN: Device disconnected
>> >      >         ERROR: Demuxer 'video': stream disabled due to connecti=
on
>> >     error
>> >      >         ERROR: Demuxer 'audio': stream disabled due to connecti=
on
>> >     error
>> >      >
>> >      >         Even if the phone is still up :
>> >      >
>> >      >         ziomario@Z390-AORUS-PRO-DEST:~/Scrivania$ adb devices
>> >      >         List of devices attached
>> >      > 0.0.0.0:6520 <http://0.0.0.0:6520> <http://0.0.0.0:6520
>> >     <http://0.0.0.0:6520>>    device
>> >      >
>> >      >         On Tue, Sep 3, 2024 at 1:03=E2=80=AFAM Pierrick Bouvier
>> >      >         <pierrick.bouvier@linaro.org
>> >     <mailto:pierrick.bouvier@linaro.org>
>> >      >         <mailto:pierrick.bouvier@linaro.org
>> >     <mailto:pierrick.bouvier@linaro.org>>> wrote:
>> >      >
>> >      >             The cvd-host package in this case are
>> binaries/libraries
>> >      >             compiled for
>> >      >             aarch64, so it can be used on linux aarch64 and
>> >     benefit from
>> >      >             kvm
>> >      >             acceleration.
>> >      >
>> >      >             In your case, running emulation from a x64 host, yo=
u
>> need
>> >      >             cvd-host_package-x86_64.tar.gz instead.
>> >      >
>> >      >             On 9/2/24 15:38, Mario Marietto wrote:
>> >      >              > Update :
>> >      >              >
>> >      >              >
>> >      >
>> >       ziomario@Z390-AORUS-PRO-DEST:/mnt/zroot-133/_OS/Android/aosp_14/=
android-image/bin$
>> mkdir x86_64-linux-musl
>> >      >              >
>> >      >              >
>> >      >
>> >       ziomario@Z390-AORUS-PRO-DEST:/mnt/zroot-133/_OS/Android/aosp_14/=
android-image/bin$
>> cp
>> /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/aarch64-linux-musl/=
crosvm
>> /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/x86_64-linux-musl
>> >      >              >
>> >      >              >
>> >      >
>> >       ziomario@Z390-AORUS-PRO-DEST:/mnt/zroot-133/_OS/Android/aosp_14/=
android-image$
>> HOME=3D$(pwd) ./bin/launch_cvd -vm_manager qemu_cli
>> -report_anonymous_usage_stats=3Dn --start_webrtc=3Dfalse
>> >      >              >
>> >      >              >
>> >      >              > Unfortunately it does not work :
>> >      >              >
>> >      >              >
>> >      >              > 09-03 00:03:28.916 2737211 2737211 I launch_cvd:
>> >      >             main.cc:235 Using
>> >      >              > system_image_dir of:
>> >      >              >
>> >      >
>> >
>>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> >      >              > NOTICE:
>> >      >              >
>> >      >              > By using this Android Virtual Device, you agree =
to
>> >      >              > Google Terms of Service
>> >      >             (https://policies.google.com/terms
>> >     <https://policies.google.com/terms>
>> >      >             <https://policies.google.com/terms
>> >     <https://policies.google.com/terms>>
>> >      >              > <https://policies.google.com/terms
>> >     <https://policies.google.com/terms>
>> >      >             <https://policies.google.com/terms
>> >     <https://policies.google.com/terms>>>).
>> >      >              > The Google Privacy Policy
>> >      >             (https://policies.google.com/privacy
>> >     <https://policies.google.com/privacy>
>> >      >             <https://policies.google.com/privacy
>> >     <https://policies.google.com/privacy>>
>> >      >              > <https://policies.google.com/privacy
>> >     <https://policies.google.com/privacy>
>> >      >             <https://policies.google.com/privacy
>> >     <https://policies.google.com/privacy>>>)
>> >      >              > describes how Google handles information generat=
ed
>> >     as you use
>> >      >              > Google Services.
>> >      >              >
>> >      >
>> >
>>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> >      >              >
>> >      >              > Reading --config option from:
>> >      >              >
>> >      >
>> >       /mnt/zroot-133/_OS/Android/aosp_14/android-image/android-info.tx=
t
>> >      >              > Launching CVD using --config=3D'phone'.
>> >      >              >
>> >      >
>> >
>>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/aarch64-linux-gnu/=
gfxstream_graphics_detector:
>> error while loading shared
>> >      >              >
>> >      >              > libraries: libc.so.6: cannot open shared object
>> >     file: No
>> >      >             such file or
>> >      >              > directory
>> >      >              >
>> >      >              > Failed to run graphics detector, bad return valu=
e:
>> >     127.
>> >      >             Assuming no
>> >      >              > availability.
>> >      >              > GPU auto mode: did not detect prerequisites for
>> >      >             accelerated rendering
>> >      >              > support, enabling --gpu_mode=3Dguest_swiftshader=
.
>> >      >              > GPU vhost user auto mode: not needed for
>> >      >             --gpu_mode=3Dguest_swiftshader.
>> >      >              > Not enabling vhost user gpu.
>> >      >              > Requested resuming a previous session (the defau=
lt
>> >      >             behavior) but the
>> >      >              > base images have changed under the overlay,
>> making the
>> >      >             overlay
>> >      >              > incompatible. Wiping the overlay files.
>> >      >              >
>> >      >              > Path for instance UDS: /tmp/cf_avd_1000
>> >      >              >
>> >      >              > The following lines contain useful debugging
>> >     information:
>> >      >              >   Serial console is disabled; use -console=3Dtru=
e to
>> >     enable it.
>> >      >              >   Logcat output:
>> >      >              >
>> >      >
>> >
>>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/cuttlefish/instances/c=
vd-1/logs/logcat
>> >      >              >   Kernel log:
>> >      >              >
>> >      >
>> >
>>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/cuttlefish/instances/c=
vd-1/kernel.log
>> >      >              >   Launcher log:
>> >      >              >
>> >      >
>> >
>>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/cuttlefish/instances/c=
vd-1/logs/launcher.log
>> >      >              >   Instance configuration:
>> >      >              >
>> >      >
>> >
>>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/cuttlefish/instances/c=
vd-1/cuttlefish_config.json
>> >      >              >   Launcher Build ID: 12309296
>> >      >              > 4. main.cc:232| RunCvdMain|
>> >      >              > 3. main.cc:104| Run|
>> >      >              > 2. server_loop_impl.cpp:89| Run|
>> >      >              > 1. qemu_manager.cpp:247| StartCommands|
>> >      >              > |
>> >      >
>> >       device/google/cuttlefish/host/libs/vm_manager/qemu_manager.cpp:9=
7
>> >      >              > | Result<std::pair<int, int>>
>> >      >             cuttlefish::vm_manager::(anonymous
>> >      >              > namespace)::GetQemuVersion(const std::string &)
>> >      >              > v CF_EXPECT(qemu_version_ret =3D=3D 0)
>> >      >              >
>> >      >
>> >
>>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/aarch64-linux-gnu/=
qemu/qemu-system-aarch64
>> -version returned unexpected response .
>> >      >              > Stderr was
>> >      >              >
>> >      >
>> >
>>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/aarch64-linux-gnu/=
qemu/qemu-system-aarch64:
>> error while loading shared
>> >      >              >
>> >      >              > libraries: libncursesw.so.6: cannot open shared
>> object
>> >      >             file: No such
>> >      >              > file or directory
>> >      >              >
>> >      >              > On Mon, Sep 2, 2024 at 11:30=E2=80=AFPM Mario Ma=
rietto
>> >      >             <marietto2008@gmail.com
>> >     <mailto:marietto2008@gmail.com> <mailto:marietto2008@gmail.com
>> >     <mailto:marietto2008@gmail.com>>
>> >      >              > <mailto:marietto2008@gmail.com
>> >     <mailto:marietto2008@gmail.com>
>> >      >             <mailto:marietto2008@gmail.com
>> >     <mailto:marietto2008@gmail.com>>>> wrote:
>> >      >              >
>> >      >              >     Something is not right :
>> >      >              >
>> >      >              >
>> >      >
>> >       ziomario@Z390-AORUS-PRO-DEST:/mnt/zroot-133/_OS/Android/aosp_14/=
android-image$
>> unzip ../aosp_cf_*.zip
>> >      >              >
>> >      >              >     Archive:
>> >       ../aosp_cf_arm64_only_phone-img-12309296.zip
>> >      >              >       inflating: android-info.txt
>> >      >              >       inflating: fastboot-info.txt
>> >      >              >       inflating: kernel_16k
>> >      >              >       inflating: ramdisk_16k.img
>> >      >              >       inflating: boot.img
>> >      >              >       inflating: boot_16k.img
>> >      >              >       inflating: bootloader
>> >      >              >       inflating: init_boot.img
>> >      >              >       inflating: userdata.img
>> >      >              >       inflating: vbmeta.img
>> >      >              >       inflating: vbmeta_system.img
>> >      >              >       inflating: vbmeta_system_dlkm.img
>> >      >              >       inflating: vbmeta_vendor_dlkm.img
>> >      >              >       inflating: vendor_boot.img
>> >      >              >       inflating: super.img
>> >      >              >
>> >      >              >
>> >      >
>> >       ziomario@Z390-AORUS-PRO-DEST:/mnt/zroot-133/_OS/Android/aosp_14/=
android-image$
>> tar xzvf ../cvd-host_package.tar.gz
>> >      >              >
>> >      >              >
>> >      >              >     ./
>> >      >              >     ./lib64/
>> >      >              >     ./lib64/android.hardware.keymaster@3.0.so
>> >     <mailto:android.hardware.keymaster@3.0.so>
>> >      >             <mailto:android.hardware.keymaster@3.0.so
>> >     <mailto:android.hardware.keymaster@3.0.so>>
>> >      >              >     <mailto:android.hardware.keymaster@3.0.so
>> >     <mailto:android.hardware.keymaster@3.0.so>
>> >      >             <mailto:android.hardware.keymaster@3.0.so
>> >     <mailto:android.hardware.keymaster@3.0.so>>>
>> >      >              >     ./lib64/libciborium_io.dylib.so
>> >     <http://libciborium_io.dylib.so>
>> >      >             <http://libciborium_io.dylib.so
>> >     <http://libciborium_io.dylib.so>>
>> >      >             <http://libciborium_io.dylib.so
>> >     <http://libciborium_io.dylib.so>
>> >      >             <http://libciborium_io.dylib.so
>> >     <http://libciborium_io.dylib.so>>>
>> >      >              >     ./lib64/libjpeg.so
>> >      >              >     ./lib64/cuttlefish_net.so
>> >      >              >     ./lib64/libbase.so
>> >      >              >     ./lib64/vulkan.pastel.so
>> >     <http://vulkan.pastel.so> <http://vulkan.pastel.so
>> >     <http://vulkan.pastel.so>>
>> >      >             <http://vulkan.pastel.so <http://vulkan.pastel.so>
>> >     <http://vulkan.pastel.so <http://vulkan.pastel.so>>>
>> >      >              >     ./lib64/libcuttlefish_host_config.so
>> >      >              >     ./lib64/libflagset.dylib.so
>> >     <http://libflagset.dylib.so>
>> >      >             <http://libflagset.dylib.so
>> >     <http://libflagset.dylib.so>> <http://libflagset.dylib.so
>> >     <http://libflagset.dylib.so>
>> >      >             <http://libflagset.dylib.so
>> >     <http://libflagset.dylib.so>>>
>> >      >              >     ./lib64/libkmr_common.dylib.so
>> >     <http://libkmr_common.dylib.so>
>> >      >             <http://libkmr_common.dylib.so
>> >     <http://libkmr_common.dylib.so>>
>> >      >             <http://libkmr_common.dylib.so
>> >     <http://libkmr_common.dylib.so> <http://libkmr_common.dylib.so
>> >     <http://libkmr_common.dylib.so>>>
>> >      >              >     ./lib64/libpkcs1.dylib.so
>> >     <http://libpkcs1.dylib.so> <http://libpkcs1.dylib.so
>> >     <http://libpkcs1.dylib.so>>
>> >      >             <http://libpkcs1.dylib.so <http://libpkcs1.dylib.so=
>
>> >     <http://libpkcs1.dylib.so <http://libpkcs1.dylib.so>>>
>> >      >              >     ./lib64/libicui18n-host.so
>> >      >              >     ./lib64/libwayland_client.so
>> >      >              >     ./lib64/libunwindstack.so
>> >      >              >     ./lib64/libkmr_ta.dylib.so
>> >     <http://libkmr_ta.dylib.so>
>> >      >             <http://libkmr_ta.dylib.so
>> >     <http://libkmr_ta.dylib.so>> <http://libkmr_ta.dylib.so
>> >     <http://libkmr_ta.dylib.so>
>> >      >             <http://libkmr_ta.dylib.so <
>> http://libkmr_ta.dylib.so>>>
>> >      >              >     ./lib64/libcoset.dylib.so
>> >     <http://libcoset.dylib.so> <http://libcoset.dylib.so
>> >     <http://libcoset.dylib.so>>
>> >      >             <http://libcoset.dylib.so <http://libcoset.dylib.so=
>
>> >     <http://libcoset.dylib.so <http://libcoset.dylib.so>>>
>> >      >              >     ./lib64/libcppbor.so
>> >      >              >     ./lib64/libgatekeeper.so
>> >      >              >     ./lib64/libyuv.so
>> >      >              >     ./lib64/libgrpc++.so
>> >      >              >     ./lib64/libkmr_cf_ffi.so
>> >      >              >     ./lib64/libcppcose_rkp.so
>> >      >              >     ./lib64/libcuttlefish_transport.so
>> >      >              >     ./lib64/liblzma.so
>> >      >              >     ./lib64/libciborium_ll.dylib.so
>> >     <http://libciborium_ll.dylib.so>
>> >      >             <http://libciborium_ll.dylib.so
>> >     <http://libciborium_ll.dylib.so>>
>> >      >             <http://libciborium_ll.dylib.so
>> >     <http://libciborium_ll.dylib.so>
>> >      >             <http://libciborium_ll.dylib.so
>> >     <http://libciborium_ll.dylib.so>>>
>> >      >              >     ./lib64/libcuttlefish_allocd_utils.so
>> >      >              >     ./lib64/libgflags.so
>> >      >              >     ./lib64/android.hardware.keymaster@4.0.so
>> >     <mailto:android.hardware.keymaster@4.0.so>
>> >      >             <mailto:android.hardware.keymaster@4.0.so
>> >     <mailto:android.hardware.keymaster@4.0.so>>
>> >      >              >     <mailto:android.hardware.keymaster@4.0.so
>> >     <mailto:android.hardware.keymaster@4.0.so>
>> >      >             <mailto:android.hardware.keymaster@4.0.so
>> >     <mailto:android.hardware.keymaster@4.0.so>>>
>> >      >              >     ./lib64/libcfg_if.dylib.so
>> >     <http://libcfg_if.dylib.so>
>> >      >             <http://libcfg_if.dylib.so
>> >     <http://libcfg_if.dylib.so>> <http://libcfg_if.dylib.so
>> >     <http://libcfg_if.dylib.so>
>> >      >             <http://libcfg_if.dylib.so <
>> http://libcfg_if.dylib.so>>>
>> >      >              >     ./lib64/libspki.dylib.so
>> >     <http://libspki.dylib.so> <http://libspki.dylib.so
>> >     <http://libspki.dylib.so>>
>> >      >             <http://libspki.dylib.so <http://libspki.dylib.so>
>> >     <http://libspki.dylib.so <http://libspki.dylib.so>>>
>> >      >              >     ./lib64/libzeroize.dylib.so
>> >     <http://libzeroize.dylib.so>
>> >      >             <http://libzeroize.dylib.so
>> >     <http://libzeroize.dylib.so>> <http://libzeroize.dylib.so
>> >     <http://libzeroize.dylib.so>
>> >      >             <http://libzeroize.dylib.so
>> >     <http://libzeroize.dylib.so>>>
>> >      >              >     ./lib64/libcgrouprc.so
>> >      >              >     ./lib64/libprotobuf-cpp-full.so
>> >      >              >     ./lib64/libcutils.so
>> >      >              >     ./lib64/libsqlite.so
>> >      >              >     ./lib64/libcuttlefish_utils_result.so
>> >      >              >     ./lib64/libbinder_ndk.so
>> >      >              >     ./lib64/libext2_uuid-host.so
>> >      >              >     ./lib64/libhex.dylib.so
>> >     <http://libhex.dylib.so> <http://libhex.dylib.so
>> >     <http://libhex.dylib.so>>
>> >      >             <http://libhex.dylib.so <http://libhex.dylib.so>
>> >     <http://libhex.dylib.so <http://libhex.dylib.so>>>
>> >      >              >     ./lib64/libc_musl.so
>> >      >              >     ./lib64/libconst_oid.dylib.so
>> >     <http://libconst_oid.dylib.so>
>> >      >             <http://libconst_oid.dylib.so
>> >     <http://libconst_oid.dylib.so>> <http://libconst_oid.dylib.so
>> >     <http://libconst_oid.dylib.so>
>> >      >             <http://libconst_oid.dylib.so
>> >     <http://libconst_oid.dylib.so>>>
>> >      >              >     ./lib64/libprotobuf_support.dylib.so
>> >     <http://libprotobuf_support.dylib.so>
>> >      >             <http://libprotobuf_support.dylib.so
>> >     <http://libprotobuf_support.dylib.so>>
>> >      >              >     <http://libprotobuf_support.dylib.so
>> >     <http://libprotobuf_support.dylib.so>
>> >      >             <http://libprotobuf_support.dylib.so
>> >     <http://libprotobuf_support.dylib.so>>>
>> >      >              >     ./lib64/tpm2-tss2-tcti.so
>> >      >              >     ./lib64/libserde.dylib.so
>> >     <http://libserde.dylib.so> <http://libserde.dylib.so
>> >     <http://libserde.dylib.so>>
>> >      >             <http://libserde.dylib.so <http://libserde.dylib.so=
>
>> >     <http://libserde.dylib.so <http://libserde.dylib.so>>>
>> >      >              >     ./lib64/libartpalette.so
>> >      >              >     ./lib64/liblog.so
>> >      >              >     ./lib64/libonce_cell.dylib.so
>> >     <http://libonce_cell.dylib.so>
>> >      >             <http://libonce_cell.dylib.so
>> >     <http://libonce_cell.dylib.so>> <http://libonce_cell.dylib.so
>> >     <http://libonce_cell.dylib.so>
>> >      >             <http://libonce_cell.dylib.so
>> >     <http://libonce_cell.dylib.so>>>
>> >      >              >     ./lib64/libthiserror.dylib.so
>> >     <http://libthiserror.dylib.so>
>> >      >             <http://libthiserror.dylib.so
>> >     <http://libthiserror.dylib.so>> <http://libthiserror.dylib.so
>> >     <http://libthiserror.dylib.so>
>> >      >             <http://libthiserror.dylib.so
>> >     <http://libthiserror.dylib.so>>>
>> >      >              >     ./lib64/libssl-host.so
>> >      >              >     ./lib64/libc++.so
>> >      >              >     ./lib64/libext4_utils.so
>> >      >              >     ./lib64/libpkcs8.dylib.so
>> >     <http://libpkcs8.dylib.so> <http://libpkcs8.dylib.so
>> >     <http://libpkcs8.dylib.so>>
>> >      >             <http://libpkcs8.dylib.so <http://libpkcs8.dylib.so=
>
>> >     <http://libpkcs8.dylib.so <http://libpkcs8.dylib.so>>>
>> >      >              >     ./lib64/libsparse-host.so
>> >      >              >     ./lib64/sandboxed_api_sandbox2.so
>> >      >              >     ./lib64/libcuttlefish_command_util.so
>> >      >              >     ./lib64/libbssl_sys.dylib.so
>> >     <http://libbssl_sys.dylib.so>
>> >      >             <http://libbssl_sys.dylib.so
>> >     <http://libbssl_sys.dylib.so>> <http://libbssl_sys.dylib.so
>> >     <http://libbssl_sys.dylib.so>
>> >      >             <http://libbssl_sys.dylib.so
>> >     <http://libbssl_sys.dylib.so>>>
>> >      >              >     ./lib64/libkeymaster_messages.so
>> >      >              >     ./lib64/libcuttlefish_web.so
>> >      >              >     ./lib64/libvpx.so
>> >      >              >     ./lib64/libopus.so
>> >      >              >     ./lib64/libminijail.so
>> >      >              >     ./lib64/libcurl-host.so
>> >      >              >
>>  ./lib64/libcuttlefish_kernel_log_monitor_utils.so
>> >      >              >     ./lib64/tpm2-tss2-util.so
>> >      >              >     ./lib64/liblibc.dylib.so
>> >     <http://liblibc.dylib.so> <http://liblibc.dylib.so
>> >     <http://liblibc.dylib.so>>
>> >      >             <http://liblibc.dylib.so <http://liblibc.dylib.so>
>> >     <http://liblibc.dylib.so <http://liblibc.dylib.so>>>
>> >      >              >     ./lib64/libprotobuf.dylib.so
>> >     <http://libprotobuf.dylib.so>
>> >      >             <http://libprotobuf.dylib.so
>> >     <http://libprotobuf.dylib.so>> <http://libprotobuf.dylib.so
>> >     <http://libprotobuf.dylib.so>
>> >      >             <http://libprotobuf.dylib.so
>> >     <http://libprotobuf.dylib.so>>>
>> >      >              >     ./lib64/libbitflags.dylib.so
>> >     <http://libbitflags.dylib.so>
>> >      >             <http://libbitflags.dylib.so
>> >     <http://libbitflags.dylib.so>> <http://libbitflags.dylib.so
>> >     <http://libbitflags.dylib.so>
>> >      >             <http://libbitflags.dylib.so
>> >     <http://libbitflags.dylib.so>>>
>> >      >              >     ./lib64/libutils.so
>> >      >              >     ./lib64/libjsoncpp.so
>> >      >              >     ./lib64/libext2_blkid-host.so
>> >      >              >     ./lib64/libnl.so
>> >      >              >     ./lib64/tpm2-tss2-sys.so
>> >      >              >     ./lib64/libartbase.so
>> >      >              >     ./lib64/libxml2.so
>> >      >              >     ./lib64/libkmr_proto_rust.dylib.so
>> >     <http://libkmr_proto_rust.dylib.so>
>> >      >             <http://libkmr_proto_rust.dylib.so
>> >     <http://libkmr_proto_rust.dylib.so>>
>> >      >             <http://libkmr_proto_rust.dylib.so
>> >     <http://libkmr_proto_rust.dylib.so>
>> >      >             <http://libkmr_proto_rust.dylib.so
>> >     <http://libkmr_proto_rust.dylib.so>>>
>> >      >              >     ./lib64/libcuttlefish_security.so
>> >      >              >     ./lib64/libsecure_env_tpm.dylib.so
>> >     <http://libsecure_env_tpm.dylib.so>
>> >      >             <http://libsecure_env_tpm.dylib.so
>> >     <http://libsecure_env_tpm.dylib.so>>
>> >      >             <http://libsecure_env_tpm.dylib.so
>> >     <http://libsecure_env_tpm.dylib.so>
>> >      >             <http://libsecure_env_tpm.dylib.so
>> >     <http://libsecure_env_tpm.dylib.so>>>
>> >      >              >     ./lib64/libz-host.so
>> >      >              >     ./lib64/libprocessgroup.so
>> >      >              >     ./lib64/libcrypto_utils.so
>> >      >              >     ./lib64/libder.dylib.so
>> >     <http://libder.dylib.so> <http://libder.dylib.so
>> >     <http://libder.dylib.so>>
>> >      >             <http://libder.dylib.so <http://libder.dylib.so>
>> >     <http://libder.dylib.so <http://libder.dylib.so>>>
>> >      >              >     ./lib64/libdexfile.so
>> >      >              >     ./lib64/cf_metrics_proto.so
>> >      >              >     ./lib64/tpm2-tss2-esys.so
>> >      >              >     ./lib64/libcuttlefish_utils.so
>> >      >              >     ./lib64/libkeymaster_portable.so
>> >      >              >     ./lib64/libfruit.so
>> >      >              >     ./lib64/tpm2-tss2-rc.so
>> >      >              >     ./lib64/libcap.so
>> >      >              >     ./lib64/libnix.dylib.so
>> >     <http://libnix.dylib.so> <http://libnix.dylib.so
>> >     <http://libnix.dylib.so>>
>> >      >             <http://libnix.dylib.so <http://libnix.dylib.so>
>> >     <http://libnix.dylib.so <http://libnix.dylib.so>>>
>> >      >              >     ./lib64/libicuuc-host.so
>> >      >              >     ./lib64/libziparchive.so
>> >      >              >     ./lib64/libkmr_ta_nonsecure.dylib.so
>> >     <http://libkmr_ta_nonsecure.dylib.so>
>> >      >             <http://libkmr_ta_nonsecure.dylib.so
>> >     <http://libkmr_ta_nonsecure.dylib.so>>
>> >      >              >     <http://libkmr_ta_nonsecure.dylib.so
>> >     <http://libkmr_ta_nonsecure.dylib.so>
>> >      >             <http://libkmr_ta_nonsecure.dylib.so
>> >     <http://libkmr_ta_nonsecure.dylib.so>>>
>> >      >              >     ./lib64/libstd.dylib.so
>> >     <http://libstd.dylib.so> <http://libstd.dylib.so
>> >     <http://libstd.dylib.so>>
>> >      >             <http://libstd.dylib.so <http://libstd.dylib.so>
>> >     <http://libstd.dylib.so <http://libstd.dylib.so>>>
>> >      >              >     ./lib64/libhalf.dylib.so
>> >     <http://libhalf.dylib.so> <http://libhalf.dylib.so
>> >     <http://libhalf.dylib.so>>
>> >      >             <http://libhalf.dylib.so <http://libhalf.dylib.so>
>> >     <http://libhalf.dylib.so <http://libhalf.dylib.so>>>
>> >      >              >     ./lib64/tpm2-tss2-mu.so
>> >      >              >     ./lib64/libmemoffset.dylib.so
>> >     <http://libmemoffset.dylib.so>
>> >      >             <http://libmemoffset.dylib.so
>> >     <http://libmemoffset.dylib.so>> <http://libmemoffset.dylib.so
>> >     <http://libmemoffset.dylib.so>
>> >      >             <http://libmemoffset.dylib.so
>> >     <http://libmemoffset.dylib.so>>>
>> >      >              >     ./lib64/liblp.so
>> >      >              >     ./lib64/libcuttlefish_fs.so
>> >      >              >     ./lib64/libProxyConfig.so
>> >      >              >     ./lib64/libopenssl.dylib.so
>> >     <http://libopenssl.dylib.so>
>> >      >             <http://libopenssl.dylib.so
>> >     <http://libopenssl.dylib.so>> <http://libopenssl.dylib.so
>> >     <http://libopenssl.dylib.so>
>> >      >             <http://libopenssl.dylib.so
>> >     <http://libopenssl.dylib.so>>>
>> >      >              >     ./lib64/libkmr_wire.dylib.so
>> >     <http://libkmr_wire.dylib.so>
>> >      >             <http://libkmr_wire.dylib.so
>> >     <http://libkmr_wire.dylib.so>> <http://libkmr_wire.dylib.so
>> >     <http://libkmr_wire.dylib.so>
>> >      >             <http://libkmr_wire.dylib.so
>> >     <http://libkmr_wire.dylib.so>>>
>> >      >              >     ./lib64/libkmr_crypto_boring.dylib.so
>> >     <http://libkmr_crypto_boring.dylib.so>
>> >      >             <http://libkmr_crypto_boring.dylib.so
>> >     <http://libkmr_crypto_boring.dylib.so>>
>> >      >              >     <http://libkmr_crypto_boring.dylib.so
>> >     <http://libkmr_crypto_boring.dylib.so>
>> >      >             <http://libkmr_crypto_boring.dylib.so
>> >     <http://libkmr_crypto_boring.dylib.so>>>
>> >      >              >     ./lib64/liblog_rust.dylib.so
>> >     <http://liblog_rust.dylib.so>
>> >      >             <http://liblog_rust.dylib.so
>> >     <http://liblog_rust.dylib.so>> <http://liblog_rust.dylib.so
>> >     <http://liblog_rust.dylib.so>
>> >      >             <http://liblog_rust.dylib.so
>> >     <http://liblog_rust.dylib.so>>>
>> >      >              >     ./lib64/libhidlbase.so
>> >      >              >     ./lib64/libgrpc_wrap.so
>> >      >              >     ./lib64/libgrpc++_unsecure.so
>> >      >              >     ./lib64/libbytes.dylib.so
>> >     <http://libbytes.dylib.so> <http://libbytes.dylib.so
>> >     <http://libbytes.dylib.so>>
>> >      >             <http://libbytes.dylib.so <http://libbytes.dylib.so=
>
>> >     <http://libbytes.dylib.so <http://libbytes.dylib.so>>>
>> >      >              >     ./lib64/libsoft_attestation_cert.so
>> >      >              >     ./lib64/libcuttlefish_run_cvd_proto.so
>> >      >              >     ./lib64/libbinder.so
>> >      >              >     ./lib64/libcrypto-host.so
>> >      >              >     ./lib64/libwebm_mkvmuxer.so
>> >      >              >     ./lib64/libkmr_cf.dylib.so
>> >     <http://libkmr_cf.dylib.so>
>> >      >             <http://libkmr_cf.dylib.so
>> >     <http://libkmr_cf.dylib.so>> <http://libkmr_cf.dylib.so
>> >     <http://libkmr_cf.dylib.so>
>> >      >             <http://libkmr_cf.dylib.so <
>> http://libkmr_cf.dylib.so>>>
>> >      >              >     ./lib64/libciborium.dylib.so
>> >     <http://libciborium.dylib.so>
>> >      >             <http://libciborium.dylib.so
>> >     <http://libciborium.dylib.so>> <http://libciborium.dylib.so
>> >     <http://libciborium.dylib.so>
>> >      >             <http://libciborium.dylib.so
>> >     <http://libciborium.dylib.so>>>
>> >      >              >     ./lib64/libpuresoftkeymasterdevice_host.so
>> >      >              >     ./lib64/libx509_cert.dylib.so
>> >     <http://libx509_cert.dylib.so>
>> >      >             <http://libx509_cert.dylib.so
>> >     <http://libx509_cert.dylib.so>> <http://libx509_cert.dylib.so
>> >     <http://libx509_cert.dylib.so>
>> >      >             <http://libx509_cert.dylib.so
>> >     <http://libx509_cert.dylib.so>>>
>> >      >              >     ./lib64/libsec1.dylib.so
>> >     <http://libsec1.dylib.so> <http://libsec1.dylib.so
>> >     <http://libsec1.dylib.so>>
>> >      >             <http://libsec1.dylib.so <http://libsec1.dylib.so>
>> >     <http://libsec1.dylib.so <http://libsec1.dylib.so>>>
>> >      >              >     ./nativetest64/
>> >      >              >     ./nativetest64/modem_simulator_test/
>> >      >              >
>> >       ./nativetest64/modem_simulator_test/modem_simulator_test
>> >      >              >     ./nativetest64/cuttlefish_net_tests/
>> >      >              >
>> >       ./nativetest64/cuttlefish_net_tests/cuttlefish_net_tests
>> >      >              >     ./etc/
>> >      >              >     ./etc/modem_simulator/
>> >      >              >     ./etc/modem_simulator/files/
>> >      >              >
>> >      >
>> >
>>  ./etc/modem_simulator/files/iccprofile_for_sim0_for_CtsCarrierApiTestCa=
ses.xml
>> >      >              >
>> >       ./etc/modem_simulator/files/iccprofile_for_sim0.xml
>> >      >              >
>>  ./etc/modem_simulator/files/numeric_operator.xml
>> >      >              >     ./etc/cvd_rsa4096.avbpubkey
>> >      >              >     ./etc/bootloader_aarch64/
>> >      >              >     ./etc/bootloader_aarch64/bootloader.qemu
>> >      >              >     ./etc/bootloader_aarch64/bootloader.crosvm
>> >      >              >     ./etc/bootloader_riscv64/
>> >      >              >     ./etc/bootloader_riscv64/bootloader.qemu
>> >      >              >     ./etc/automotive/
>> >      >              >     ./etc/automotive/vhalconfig/
>> >      >              >
>> >      >
>> >       ./etc/automotive/vhalconfig/VendorClusterTestProperties.json
>> >      >              >
>>  ./etc/automotive/vhalconfig/DefaultProperties.json
>> >      >              >
>>  ./etc/automotive/vhalconfig/TestProperties.json
>> >      >              >     ./etc/automotive/proxy_config.json
>> >      >              >     ./etc/cvd_rsa2048.avbpubkey
>> >      >              >     ./etc/cvd_avb_testkey_rsa4096.pem
>> >      >              >     ./etc/bootloader_arm/
>> >      >              >     ./etc/bootloader_arm/bootloader.qemu
>> >      >              >     ./etc/bootloader_x86_64/
>> >      >              >     ./etc/bootloader_x86_64/bootloader.qemu
>> >      >              >     ./etc/bootloader_x86_64/bootloader.crosvm
>> >      >              >     ./etc/cvd_avb_testkey_rsa2048.pem
>> >      >              >     ./etc/openwrt/
>> >      >              >     ./etc/openwrt/images/
>> >      >              >     ./etc/openwrt/images/openwrt_kernel_aarch64
>> >      >              >     ./etc/openwrt/images/openwrt_rootfs_x86_64
>> >      >              >     ./etc/openwrt/images/openwrt_rootfs_aarch64
>> >      >              >     ./etc/openwrt/images/openwrt_kernel_x86_64
>> >      >              >     ./etc/cvd_config/
>> >      >              >     ./etc/cvd_config/cvd_config_tv.json
>> >      >              >     ./etc/cvd_config/cvd_config_tablet.json
>> >      >              >     ./etc/cvd_config/cvd_config_wear.json
>> >      >              >     ./etc/cvd_config/cvd_config_auto_portrait.js=
on
>> >      >              >     ./etc/cvd_config/cvd_config_slim.json
>> >      >              >     ./etc/cvd_config/cvd_config_go.json
>> >      >              >     ./etc/cvd_config/cvd_config_foldable.json
>> >      >              >     ./etc/cvd_config/cvd_config_auto.json
>> >      >              >     ./etc/cvd_config/cvd_config_auto_md.json
>> >      >              >     ./etc/cvd_config/cvd_config_phone.json
>> >      >              >     ./usr/
>> >      >              >     ./usr/share/
>> >      >              >     ./usr/share/vulkan/
>> >      >              >     ./usr/share/vulkan/icd.d/
>> >      >              >
>>  ./usr/share/vulkan/icd.d/vk_swiftshader_icd.json
>> >      >              >     ./usr/share/qemu/
>> >      >              >     ./usr/share/qemu/aarch64-linux-gnu/
>> >      >              >
>> >      >
>> >
>>  ./usr/share/qemu/aarch64-linux-gnu/opensbi-riscv64-generic-fw_dynamic.b=
in
>> >      >              >
>>  ./usr/share/qemu/aarch64-linux-gnu/efi-virtio.rom
>> >      >              >     ./usr/share/qemu/aarch64-linux-gnu/keymaps/
>> >      >              >
>>  ./usr/share/qemu/aarch64-linux-gnu/keymaps/en-us
>> >      >              >     ./usr/share/webrtc/
>> >      >              >     ./usr/share/webrtc/assets/
>> >      >              >     ./usr/share/webrtc/assets/style.css
>> >      >              >     ./usr/share/webrtc/assets/index.css
>> >      >              >     ./usr/share/webrtc/assets/index.html
>> >      >              >     ./usr/share/webrtc/assets/js/
>> >      >              >     ./usr/share/webrtc/assets/js/location.js
>> >      >              >     ./usr/share/webrtc/assets/js/rootcanal.js
>> >      >              >     ./usr/share/webrtc/assets/js/app.js
>> >      >              >     ./usr/share/webrtc/assets/js/touch.js
>> >      >              >     ./usr/share/webrtc/assets/js/adb.js
>> >      >              >     ./usr/share/webrtc/assets/js/index.js
>> >      >              >     ./usr/share/webrtc/assets/js/cf_webrtc.js
>> >      >              >
>>  ./usr/share/webrtc/assets/js/server_connector.js
>> >      >              >     ./usr/share/webrtc/assets/js/controls.js
>> >      >              >     ./usr/share/webrtc/assets/controls.css
>> >      >              >     ./usr/share/webrtc/assets/custom.css
>> >      >              >     ./usr/share/webrtc/assets/client.html
>> >      >              >     ./usr/share/webrtc/certs/
>> >      >              >     ./usr/share/webrtc/certs/server.p12
>> >      >              >     ./usr/share/webrtc/certs/server.key
>> >      >              >     ./usr/share/webrtc/certs/trusted.pem
>> >      >              >     ./usr/share/webrtc/certs/server.crt
>> >      >              >     ./usr/share/zoneinfo/
>> >      >              >     ./usr/share/zoneinfo/tzdata
>> >      >              >     ./usr/share/crosvm/
>> >      >              >     ./usr/share/crosvm/aarch64-linux-gnu/
>> >      >              >     ./usr/share/crosvm/aarch64-linux-gnu/seccomp=
/
>> >      >              >
>> >      >
>> >
>>  ./usr/share/crosvm/aarch64-linux-gnu/seccomp/snd_null_device.policy
>> >      >              >
>> >      >
>> >
>>  ./usr/share/crosvm/aarch64-linux-gnu/seccomp/gpu_render_server.policy
>> >      >              >
>> >      >
>> >       ./usr/share/crosvm/aarch64-linux-gnu/seccomp/battery.policy
>> >      >              >
>> >      >
>> >       ./usr/share/crosvm/aarch64-linux-gnu/seccomp/block_device.policy
>> >      >              >
>> >      >
>> >       ./usr/share/crosvm/aarch64-linux-gnu/seccomp/pmem_device.policy
>> >      >              >
>> >      >
>> >       ./usr/share/crosvm/aarch64-linux-gnu/seccomp/wl_device.policy
>> >      >              >
>> >      >
>> >       ./usr/share/crosvm/aarch64-linux-gnu/seccomp/9p_device.policy
>> >      >              >
>> >      >
>> >       ./usr/share/crosvm/aarch64-linux-gnu/seccomp/input_device.policy
>> >      >              >
>> >      >
>> >       ./usr/share/crosvm/aarch64-linux-gnu/seccomp/net_device.policy
>> >      >              >
>> >      >
>> >       ./usr/share/crosvm/aarch64-linux-gnu/seccomp/rng_device.policy
>> >      >              >
>> >      >
>> >       ./usr/share/crosvm/aarch64-linux-gnu/seccomp/coiommu_device.poli=
cy
>> >      >              >
>> >      >
>> >       ./usr/share/crosvm/aarch64-linux-gnu/seccomp/gpu_device.policy
>> >      >              >
>> >      >
>> >       ./usr/share/crosvm/aarch64-linux-gnu/seccomp/serial_device.polic=
y
>> >      >              >
>> >      >
>> >
>>  ./usr/share/crosvm/aarch64-linux-gnu/seccomp/cras_audio_device.policy
>> >      >              >
>> >      >
>> >
>>  ./usr/share/crosvm/aarch64-linux-gnu/seccomp/null_audio_device.policy
>> >      >              >
>> >      >
>> >
>>  ./usr/share/crosvm/aarch64-linux-gnu/seccomp/snd_cras_device.policy
>> >      >              >
>> >      >
>> >
>>  ./usr/share/crosvm/aarch64-linux-gnu/seccomp/vhost_scmi_device.policy
>> >      >              >
>> >      >
>> >       ./usr/share/crosvm/aarch64-linux-gnu/seccomp/balloon_device.poli=
cy
>> >      >              >
>> >      >
>> >
>>  ./usr/share/crosvm/aarch64-linux-gnu/seccomp/vhost_net_device.policy
>> >      >              >
>> >      >
>> >
>>  ./usr/share/crosvm/aarch64-linux-gnu/seccomp/vhost_vsock_device.policy
>> >      >              >
>> >      >
>> >       ./usr/share/crosvm/aarch64-linux-gnu/seccomp/fs_device.policy
>> >      >              >
>> >      >
>> >       ./usr/share/crosvm/aarch64-linux-gnu/seccomp/video_device.policy
>> >      >              >
>> >      >
>> >       ./usr/share/crosvm/aarch64-linux-gnu/seccomp/xhci_device.policy
>> >      >              >
>> >      >
>> >
>>  ./usr/share/crosvm/aarch64-linux-gnu/seccomp/vios_audio_device.policy
>> >      >              >     ./bin/
>> >      >              >     ./bin/modem_simulator
>> >      >              >     ./bin/ms-tpm-20-ref
>> >      >              >     ./bin/mkenvimage_slim
>> >      >              >     ./bin/metrics
>> >      >              >     ./bin/socket_vsock_proxy
>> >      >              >     ./bin/resize.f2fs
>> >      >              >     ./bin/metrics_launcher
>> >      >              >     ./bin/automotive_vsock_proxy
>> >      >              >     ./bin/newfs_msdos
>> >      >              >     ./bin/netsim-ui/
>> >      >              >     ./bin/netsim-ui/assets/
>> >      >              >     ./bin/netsim-ui/assets/grid-background.svg
>> >      >              >     ./bin/netsim-ui/assets/netsim-logo.svg
>> >      >              >     ./bin/netsim-ui/assets/polar-background.svg
>> >      >              >
>>  ./bin/netsim-ui/assets/hexagonal-background.png
>> >      >              >     ./bin/netsim-ui/assets/netsim-logo-b.svg
>> >      >              >     ./bin/netsim-ui/node_modules/
>> >      >              >     ./bin/netsim-ui/node_modules/tslib/
>> >      >              >
>>  ./bin/netsim-ui/node_modules/tslib/tslib.es6.js
>> >      >              >     ./bin/netsim-ui/index.html
>> >      >              >     ./bin/netsim-ui/js/
>> >      >              >     ./bin/netsim-ui/js/device-info.js
>> >      >              >     ./bin/netsim-ui/js/device-list.js
>> >      >              >     ./bin/netsim-ui/js/packet-info.js
>> >      >              >     ./bin/netsim-ui/js/device-dropzone.js
>> >      >              >     ./bin/netsim-ui/js/navigation-bar.js
>> >      >              >     ./bin/netsim-ui/js/device-map.js
>> >      >              >     ./bin/netsim-ui/js/device-dragzone.js
>> >      >              >     ./bin/netsim-ui/js/netsim-app.js
>> >      >              >     ./bin/netsim-ui/js/customize-map-button.js
>> >      >              >     ./bin/netsim-ui/js/device-observer.js
>> >      >              >     ./bin/netsim-ui/js/license-info.js
>> >      >              >     ./bin/netsim-ui/js/cube-sprite.js
>> >      >              >     ./bin/netsim-ui/js/pyramid-sprite.js
>> >      >              >     ./bin/unpack_bootimg
>> >      >              >     ./bin/adb
>> >      >              >     ./bin/extract-vmlinux
>> >      >              >     ./bin/health
>> >      >              >     ./bin/screen_recording_server
>> >      >              >     ./bin/lz4
>> >      >              >     ./bin/wmediumd_gen_config
>> >      >              >     ./bin/gnss_grpc_proxy
>> >      >              >     ./bin/simg2img
>> >      >              >     ./bin/secure_env
>> >      >              >     ./bin/mke2fs
>> >      >              >     ./bin/snapshot_util_cvd
>> >      >              >     ./bin/cvd_internal_display
>> >      >              >     ./bin/acloud_translator
>> >      >              >     ./bin/defrag.f2fs
>> >      >              >     ./bin/tombstone_receiver
>> >      >              >     ./bin/root-canal
>> >      >              >     ./bin/netsimd
>> >      >              >     ./bin/console_forwarder
>> >      >              >     ./bin/powerwash_cvd
>> >      >              >     ./bin/process_restarter
>> >      >              >     ./bin/fsck.f2fs
>> >      >              >     ./bin/cvd_host_bugreport
>> >      >              >     ./bin/extract-ikconfig
>> >      >              >     ./bin/cvd_internal_status
>> >      >              >     ./bin/webRTC
>> >      >              >     ./bin/acloud
>> >      >              >     ./bin/tcp_connector
>> >      >              >     ./bin/process_sandboxer
>> >      >              >     ./bin/webrtc_operator
>> >      >              >     ./bin/cvd_update_location
>> >      >              >     ./bin/e2fsdroid
>> >      >              >     ./bin/avbtool
>> >      >              >     ./bin/fastboot
>> >      >              >     ./bin/build_super_image
>> >      >              >     ./bin/powerbtn_cvd
>> >      >              >     ./bin/allocd_client
>> >      >              >     ./bin/dump.f2fs
>> >      >              >     ./bin/netsim
>> >      >              >     ./bin/casimir
>> >      >              >     ./bin/pica
>> >      >              >     ./bin/cvd_update_security_algorithm
>> >      >              >     ./bin/record_cvd
>> >      >              >     ./bin/vhal_proxy_server
>> >      >              >     ./bin/cvd_status
>> >      >              >     ./bin/cvd_import_locations
>> >      >              >     ./bin/launch_cvd
>> >      >              >     ./bin/cvd_internal_start
>> >      >              >     ./bin/restart_cvd
>> >      >              >     ./bin/cvd_internal_host_bugreport
>> >      >              >     ./bin/mkuserimg_mke2fs
>> >      >              >     ./bin/fec
>> >      >              >     ./bin/cvd_internal_env
>> >      >              >     ./bin/vhost_device_vsock
>> >      >              >     ./bin/cvd_internal_stop
>> >      >              >     ./bin/cvd_send_sms
>> >      >              >     ./bin/assemble_cvd
>> >      >              >     ./bin/cvd_send_id_disclosure
>> >      >              >     ./bin/mcopy
>> >      >              >     ./bin/operator_proxy
>> >      >              >     ./bin/mkbootfs
>> >      >              >     ./bin/run_cvd
>> >      >              >     ./bin/openwrt_control_server
>> >      >              >     ./bin/mkbootimg
>> >      >              >     ./bin/kernel_log_monitor
>> >      >              >     ./bin/mmd
>> >      >              >     ./bin/toybox
>> >      >              >     ./bin/crosvm
>> >      >              >     ./bin/aarch64-linux-musl/
>> >      >              >     ./bin/aarch64-linux-musl/crosvm
>> >      >              >     ./bin/sefcontext_compile
>> >      >              >     ./bin/wmediumd
>> >      >              >     ./bin/echo_server
>> >      >              >     ./bin/log_tee
>> >      >              >     ./bin/lpmake
>> >      >              >     ./bin/logcat_receiver
>> >      >              >     ./bin/lpunpack
>> >      >              >     ./bin/control_env_proxy_server
>> >      >              >     ./bin/mtools
>> >      >              >     ./bin/adb_connector
>> >      >              >     ./bin/aarch64-linux-gnu/
>> >      >              >     ./bin/aarch64-linux-gnu/libepoxy.so.0
>> >      >              >     ./bin/aarch64-linux-gnu/libffi.so.7
>> >      >              >     ./bin/aarch64-linux-gnu/qemu/
>> >      >              >
>>  ./bin/aarch64-linux-gnu/qemu/qemu-system-x86_64
>> >      >              >     ./bin/aarch64-linux-gnu/qemu/libepoxy.so.0
>> >      >              >
>>  ./bin/aarch64-linux-gnu/qemu/libvirglrenderer.so.1
>> >      >              >     ./bin/aarch64-linux-gnu/qemu/libgbm.so.1
>> >      >              >
>> >       ./bin/aarch64-linux-gnu/qemu/libgfxstream_backend.so.0
>> >      >              >
>> >       ./bin/aarch64-linux-gnu/qemu/librutabaga_gfx_ffi.so.0
>> >      >              >
>>  ./bin/aarch64-linux-gnu/qemu/qemu-system-riscv64
>> >      >              >
>>  ./bin/aarch64-linux-gnu/qemu/qemu-system-aarch64
>> >      >              >     ./bin/aarch64-linux-gnu/qemu/libc++.so.1
>> >      >              >     ./bin/aarch64-linux-gnu/qemu/libunwind.so.1
>> >      >              >     ./bin/aarch64-linux-gnu/qemu/libz.so.1
>> >      >              >     ./bin/aarch64-linux-gnu/qemu/libc++abi.so.1
>> >      >              >     ./bin/aarch64-linux-gnu/libvirglrenderer.so.=
1
>> >      >              >     ./bin/aarch64-linux-gnu/libdrm.so.2
>> >      >              >     ./bin/aarch64-linux-gnu/libgbm.so.1
>> >      >              >
>>  ./bin/aarch64-linux-gnu/libgfxstream_backend.so
>> >      >              >     ./bin/aarch64-linux-gnu/libwayland-client.so=
.0
>> >      >              >     ./bin/aarch64-linux-gnu/libminijail.so
>> >      >              >
>> >       ./bin/aarch64-linux-gnu/gfxstream_graphics_detector
>> >      >              >     ./bin/aarch64-linux-gnu/crosvm
>> >      >              >     ./bin/lpadd
>> >      >              >     ./bin/make_f2fs
>> >      >              >     ./bin/sandboxer_proxy
>> >      >              >     ./bin/stop_cvd
>> >      >              >     ./bin/casimir_control_server
>> >      >              >
>> >      >              >
>> >      >              >
>> >      >
>> >       ziomario@Z390-AORUS-PRO-DEST:/mnt/zroot-133/_OS/Android/aosp_14/=
android-image$
>> HOME=3D$(pwd) ./bin/launch_cvd -vm_manager qemu_cli
>> -report_anonymous_usage_stats=3Dn --start_webrtc=3Dfalse
>> >      >              >
>> >      >              >
>> >      >              >     09-02 23:27:10.473 2729990 2729990 I
>> launch_cvd:
>> >      >             main.cc:235 Using
>> >      >              >     system_image_dir of:
>> >      >              >
>> >      >
>> >
>>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> >      >              >     NOTICE:
>> >      >              >
>> >      >              >     By using this Android Virtual Device, you
>> agree to
>> >      >              >     Google Terms of Service
>> >      >             (https://policies.google.com/terms
>> >     <https://policies.google.com/terms>
>> >      >             <https://policies.google.com/terms
>> >     <https://policies.google.com/terms>>
>> >      >              >     <https://policies.google.com/terms
>> >     <https://policies.google.com/terms>
>> >      >             <https://policies.google.com/terms
>> >     <https://policies.google.com/terms>>>).
>> >      >              >     The Google Privacy Policy
>> >      >             (https://policies.google.com/privacy
>> >     <https://policies.google.com/privacy>
>> >      >             <https://policies.google.com/privacy
>> >     <https://policies.google.com/privacy>>
>> >      >              >     <https://policies.google.com/privacy
>> >     <https://policies.google.com/privacy>
>> >      >             <https://policies.google.com/privacy
>> >     <https://policies.google.com/privacy>>>)
>> >      >              >     describes how Google handles information
>> >     generated as
>> >      >             you use
>> >      >              >     Google Services.
>> >      >              >
>> >      >
>> >
>>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> >      >              >
>> >      >              >     Reading --config option from:
>> >      >              >
>> >      >
>> >       /mnt/zroot-133/_OS/Android/aosp_14/android-image/android-info.tx=
t
>> >      >              >     Launching CVD using --config=3D'phone'.
>> >      >              >     aarch64-binfmt-P: Could not open
>> >      >             '/lib/ld-linux-aarch64.so.1': No
>> >      >              >     such file or directory
>> >      >              >     Failed to run graphics detector, bad return
>> value:
>> >      >             255. Assuming no
>> >      >              >     availability.
>> >      >              >     GPU auto mode: did not detect prerequisites
>> for
>> >      >             accelerated
>> >      >              >     rendering support, enabling
>> >     --gpu_mode=3Dguest_swiftshader.
>> >      >              >     GPU vhost user auto mode: not needed for
>> >      >              >     --gpu_mode=3Dguest_swiftshader. Not enabling
>> >     vhost user
>> >      >             gpu.
>> >      >              >     Requested resuming a previous session (the
>> default
>> >      >             behavior) but the
>> >      >              >     base images have changed under the overlay,
>> making
>> >      >             the overlay inc
>> >      >              >     ompatible. Wiping the overlay files.
>> >      >              >     Path for instance UDS: /tmp/cf_avd_1000
>> >      >              >     Failed to run
>> >      >              >
>> >      >
>> >       `/mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/crosvm
>> >      >              >     create_qcow2 --backing-file
>> >      >             /mnt/zroot-133/_OS/Android/aosp_
>> >      >              >
>> >      >
>> >
>>  14/android-image/cuttlefish/instances/cvd-1/persistent_composite.img
>> >      >              >
>> >      >
>> >       /mnt/zroot-133/_OS/Android/aosp_14/android-image/cuttlefish/inst=
an
>> >      >              >     ces/cvd-1/persistent_composite_overlay.img`
>> >      >              >     stdout:
>> >      >              >     ###
>> >      >              >
>> >      >              >     ###
>> >      >              >     stderr:
>> >      >              >     ###
>> >      >              >
>> >      >
>> >       /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/crosvm: rig=
a
>> 3:
>> >      >              >
>> >      >
>> >       /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/x86_64-linu=
x-
>> >      >              >     musl/crosvm: File o directory non esistente
>> >      >              >
>> >      >              >     ###
>> >      >              >     Return code: "127"
>> >      >              >     qemu: uncaught target signal 6 (Aborted) -
>> >     core dumped
>> >      >              >     09-02 23:27:31.223 2729990 2729990 E
>> launch_cvd:
>> >      >             subprocess.cpp:207
>> >      >              >     Subprocess 2730018 was interrupted by a sign=
al
>> >      >             'Aborted' (6)
>> >      >              >     09-02 23:27:31.224 2729990 2729990 E
>> launch_cvd:
>> >      >             main.cc:323
>> >      >              >     assemble_cvd returned -1
>> >      >              >
>> >      >              >     On Mon, Sep 2, 2024 at 11:20=E2=80=AFPM Mari=
o Marietto
>> >      >              >     <marietto2008@gmail.com
>> >     <mailto:marietto2008@gmail.com>
>> >      >             <mailto:marietto2008@gmail.com
>> >     <mailto:marietto2008@gmail.com>>
>> >      >             <mailto:marietto2008@gmail.com
>> >     <mailto:marietto2008@gmail.com>
>> >      >             <mailto:marietto2008@gmail.com
>> >     <mailto:marietto2008@gmail.com>>>> wrote:
>> >      >              >
>> >      >              >         Hello.
>> >      >              >
>> >      >              >         I've downloaded this file :
>> >      >              >         aosp_cf_arm64_only_phone-img-12309296.zi=
p
>> and
>> >      >             this file :
>> >      >              >         cvd-host_package.tar.gz
>> >      >              >
>> >      >              >         from here :
>> >      >              >
>> >      >
>> >
>> https://ci.android.com/builds/submitted/12309296/aosp_cf_arm64_only_phon=
e-trunk_staging-userdebug/latest
>> <
>> https://ci.android.com/builds/submitted/12309296/aosp_cf_arm64_only_phon=
e-trunk_staging-userdebug/latest>
>> <
>> https://ci.android.com/builds/submitted/12309296/aosp_cf_arm64_only_phon=
e-trunk_staging-userdebug/latest
>> <
>> https://ci.android.com/builds/submitted/12309296/aosp_cf_arm64_only_phon=
e-trunk_staging-userdebug/latest>>
>> <
>> https://ci.android.com/builds/submitted/12309296/aosp_cf_arm64_only_phon=
e-trunk_staging-userdebug/latest
>> <
>> https://ci.android.com/builds/submitted/12309296/aosp_cf_arm64_only_phon=
e-trunk_staging-userdebug/latest>
>> <
>> https://ci.android.com/builds/submitted/12309296/aosp_cf_arm64_only_phon=
e-trunk_staging-userdebug/latest
>> <
>> https://ci.android.com/builds/submitted/12309296/aosp_cf_arm64_only_phon=
e-trunk_staging-userdebug/latest
>> >>>
>> >      >              >
>> >      >              >         But let's say that I don't want to use t=
he
>> >     *.img
>> >      >             files that are
>> >      >              >         stored inside
>> >      >             "aosp_cf_arm64_only_phone-img-12309296.zip",but
>> >      >              >         the same files that have been produced
>> when I
>> >      >             have compiled this
>> >      >              >         version of Android :
>> >      >              >
>> >      >              >
>> >      >
>> >
>> https://github.com/raspberry-vanilla/android_local_manifest?tab=3Dreadme=
-ov-file
>> <
>> https://github.com/raspberry-vanilla/android_local_manifest?tab=3Dreadme=
-ov-file>
>> <
>> https://github.com/raspberry-vanilla/android_local_manifest?tab=3Dreadme=
-ov-file
>> <
>> https://github.com/raspberry-vanilla/android_local_manifest?tab=3Dreadme=
-ov-file>>
>> <
>> https://github.com/raspberry-vanilla/android_local_manifest?tab=3Dreadme=
-ov-file
>> <
>> https://github.com/raspberry-vanilla/android_local_manifest?tab=3Dreadme=
-ov-file>
>> <
>> https://github.com/raspberry-vanilla/android_local_manifest?tab=3Dreadme=
-ov-file
>> <
>> https://github.com/raspberry-vanilla/android_local_manifest?tab=3Dreadme=
-ov-file
>> >>>
>> >      >              >
>> >      >              >         Can I do it ? Is it supposed to work the
>> >     same ?
>> >      >              >
>> >      >              >         Thanks.
>> >      >              >
>> >      >              >         On Mon, Sep 2, 2024 at 10:23=E2=80=AFPM =
Pierrick
>> >     Bouvier
>> >      >              >         <pierrick.bouvier@linaro.org
>> >     <mailto:pierrick.bouvier@linaro.org>
>> >      >             <mailto:pierrick.bouvier@linaro.org
>> >     <mailto:pierrick.bouvier@linaro.org>>
>> >      >              >         <mailto:pierrick.bouvier@linaro.org
>> >     <mailto:pierrick.bouvier@linaro.org>
>> >      >             <mailto:pierrick.bouvier@linaro.org
>> >     <mailto:pierrick.bouvier@linaro.org>>>> wrote:
>> >      >              >
>> >      >              >
>> >      >              >
>> >      >              >             On 9/2/24 13:20, Pierrick Bouvier
>> wrote:
>> >      >              >              > On 9/2/24 12:53, Mario Marietto
>> wrote:
>> >      >              >              >> Hello Pierrick.
>> >      >              >              >>
>> >      >              >              >> With Cuttlefish can I emulate
>> >     Android 14
>> >      >             for arm64 ? I
>> >      >              >             ask because in
>> >      >              >              >> your script I read :
>> >      >              >              >>
>> >      >              >              >>
>> >      >             "|/home/user/.work/qemu/build/qemu-system-x86_64",
>> so,I
>> >      >              >             suspect that you
>> >      >              >              >> have emulated Android x64 bit,bu=
t
>> >     I need
>> >      >             arm64. |
>> >      >              >              >>
>> >      >              >              >
>> >      >              >              > Yes, it works for both
>> >     architecture. The
>> >      >             only thing I
>> >      >              >             didn't try is an
>> >      >              >              > arm64 vm accelerated with kvm (I
>> don't
>> >      >             have this a
>> >      >              >             linux-aarch64
>> >      >              >              > machine), but it should work.
>> >      >              >
>> >      >              >             And of course, if you want to write =
a
>> >     custom
>> >      >             wrapper for
>> >      >              >             qemu, name it
>> >      >              >             qemu-system-aarch64, and call the sa=
me
>> >     binary
>> >      >             instead of
>> >      >              >             x86_64 variants.
>> >      >              >
>> >      >              >              >
>> >      >              >              >> I also read "for aarch64 images:
>> >     select
>> >      >              >              >>
>> >      >             |aosp_cf_arm64_only_phone-trunk_staging-userdebug" =
:
>> I'm
>> >      >              >             not able to
>> >      >              >              >> download this kind of images. I
>> don't
>> >      >             understand how the
>> >      >              >             Branch Grid
>> >      >              >              >> works. Can you explain to me a
>> >     little bit
>> >      >             more ?
>> >      >              >              >> |
>> >      >              >              >
>> >      >              >              > You have a link just next to it
>> >     ("Branch
>> >      >             grid") on the
>> >      >              >             wiki page.
>> >      >              >              > Once on ci android page, click on
>> >     filter
>> >      >             button (three
>> >      >              >             bars, inverted
>> >      >              >              > pyramid), and select
>> >      >              >
>> >       aosp_cf_arm64_only_phone-trunk_staging-userdebug.
>> >      >              >              > Then go to artifacts, and downloa=
d
>> >     image and
>> >      >              >             cvd_host_x86_64 package, as
>> >      >              >              > wiki mentions.
>> >      >              >              >
>> >      >              >              > Don't hesitate to ask more
>> questions on
>> >      >             this. I imagine
>> >      >              >             this topic might
>> >      >              >              > interest some people who try to d=
o
>> the
>> >      >             same thing.
>> >      >              >              >
>> >      >              >              > Pierrick
>> >      >              >              >
>> >      >              >              >> |
>> >      >              >              >> |
>> >      >              >              >>
>> >      >              >              >>
>> >      >              >              >> On Mon, Sep 2, 2024 at 8:47=E2=
=80=AFPM
>> >     Pierrick
>> >      >             Bouvier
>> >      >              >              >> <pierrick.bouvier@linaro.org
>> >     <mailto:pierrick.bouvier@linaro.org>
>> >      >             <mailto:pierrick.bouvier@linaro.org
>> >     <mailto:pierrick.bouvier@linaro.org>>
>> >      >              >             <mailto:pierrick.bouvier@linaro.org
>> >     <mailto:pierrick.bouvier@linaro.org>
>> >      >             <mailto:pierrick.bouvier@linaro.org
>> >     <mailto:pierrick.bouvier@linaro.org>>>
>> >      >              >             <mailto:pierrick.bouvier@linaro.org
>> >     <mailto:pierrick.bouvier@linaro.org>
>> >      >             <mailto:pierrick.bouvier@linaro.org
>> >     <mailto:pierrick.bouvier@linaro.org>>
>> >      >              >             <mailto:pierrick.bouvier@linaro.org
>> >     <mailto:pierrick.bouvier@linaro.org>
>> >      >             <mailto:pierrick.bouvier@linaro.org
>> >     <mailto:pierrick.bouvier@linaro.org>>>>> wrote:
>> >      >              >              >>
>> >      >              >              >>      Hello Mario,
>> >      >              >              >>
>> >      >              >              >>      very recently, I had to
>> >     investigate
>> >      >             booting time of
>> >      >              >             Android when using
>> >      >              >              >>      QEMU. You can probably
>> manage to
>> >      >             boot this with
>> >      >              >             only QEMU alone, but in
>> >      >              >              >>      my experience, using
>> Cuttlefish
>> >      >             tooling is an
>> >      >              >             easier approach.
>> >      >              >              >>
>> >      >              >              >>      If you really want to use
>> >     only QEMU,
>> >      >             you can use
>> >      >              >             Cuttlefish to get
>> >      >              >              >>      exact
>> >      >              >              >>      command line used (which di=
sk
>> >     goes
>> >      >             where), and
>> >      >              >             iterate from that.
>> >      >              >              >>
>> >      >              >              >>      Instructions:
>> >      >              >              >>
>> >      >              >
>> >      >
>> >
>> https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29464068097/Run+Andr=
oid+using+QEMU
>> <
>> https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29464068097/Run+Andr=
oid+using+QEMU>
>> <
>> https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29464068097/Run+Andr=
oid+using+QEMU
>> <
>> https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29464068097/Run+Andr=
oid+using+QEMU>>
>> <
>> https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29464068097/Run+Andr=
oid+using+QEMU
>> <
>> https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29464068097/Run+Andr=
oid+using+QEMU>
>> <
>> https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29464068097/Run+Andr=
oid+using+QEMU
>> <
>> https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29464068097/Run+Andr=
oid+using+QEMU>>>
>> <
>> https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29464068097/Run+Andr=
oid+using+QEMU
>> <
>> https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29464068097/Run+Andr=
oid+using+QEMU>
>> <
>> https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29464068097/Run+Andr=
oid+using+QEMU
>> <
>> https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29464068097/Run+Andr=
oid+using+QEMU>>
>> <
>> https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29464068097/Run+Andr=
oid+using+QEMU
>> <
>> https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29464068097/Run+Andr=
oid+using+QEMU>
>> <
>> https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29464068097/Run+Andr=
oid+using+QEMU
>> <
>> https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29464068097/Run+Andr=
oid+using+QEMU
>> >>>>
>> >      >              >              >>
>> >      >              >              >>      As you'll see, I could not
>> get a
>> >      >             direct graphic
>> >      >              >             output, but using
>> >      >              >              >>      scrcpy, it worked well for
>> >     me. Hope
>> >      >             it can fit your
>> >      >              >             use case.
>> >      >              >              >>
>> >      >              >              >>      Regards,
>> >      >              >              >>      Pierrick
>> >      >              >              >>
>> >      >              >              >>      On 9/2/24 06:49, Mario
>> >     Marietto wrote:
>> >      >              >              >>       > Hello.
>> >      >              >              >>       >
>> >      >              >              >>       > I would like to emulate
>> >     Android
>> >      >             14 on my Ubuntu
>> >      >              >             24.04 OS X64 bit
>> >      >              >              >>      using
>> >      >              >              >>       > qemu-system-aarch64. I
>> tried
>> >      >             using the following
>> >      >              >             parameters :
>> >      >              >              >>       >
>> >      >              >              >>       > qemu-system-aarch64 \
>> >      >              >              >>       >          -smp 4 \
>> >      >              >              >>       >          -m 2048 \
>> >      >              >              >>       >          -cpu cortex-a72=
 \
>> >      >              >              >>       >          -M virt \
>> >      >              >              >>       >          -device
>> >      >             virtio-gpu-pci,xres=3D1024,yres=3D768 \
>> >      >              >              >>       >          -display
>> sdl,gl=3Don \
>> >      >              >              >>       >          -device usb-ehc=
i
>> \
>> >      >              >              >>       >          -device usb-kbd=
 \
>> >      >              >              >>       >          -device
>> >     virtio-tablet-pci \
>> >      >              >              >>       >          -usb \
>> >      >              >              >>       >          -serial stdio \
>> >      >              >              >>       >          -kernel
>> >      >              >             /mnt/zroot-133/_OS/Android/rpi4/Imag=
e
>> \
>> >      >              >              >>       >          -initrd
>> >      >              >
>> >       /mnt/zroot-133/_OS/Android/rpi4/ramdisk.img \
>> >      >              >              >>       >          -drive
>> >      >              >              >>       >
>> >      >              >              >>
>> >      >              >
>> >      >
>> >
>>  index=3D0,if=3Dnone,id=3Dsystem,file=3D/mnt/zroot-133/_OS/Android/rpi4/=
boot.img \
>> >      >              >              >>       >          -device
>> >      >             virtio-blk-pci,drive=3Dboot \
>> >      >              >              >>       >          -drive
>> >      >              >              >>       >
>> >      >              >              >>
>> >      >              >
>> >      >
>> >
>>  index=3D1,if=3Dnone,id=3Dsystem,file=3D/mnt/zroot-133/_OS/Android/rpi4/=
system.img \
>> >      >              >              >>       >          -device
>> >      >             virtio-blk-pci,drive=3Dsystem \
>> >      >              >              >>       >          -drive
>> >      >              >              >>       >
>> >      >              >              >>
>> >      >              >
>> >      >
>> >
>>  index=3D2,if=3Dnone,id=3Dvendor,file=3D/mnt/zroot-133/_OS/Android/rpi4/=
vendor.img \
>> >      >              >              >>       >          -device
>> >      >             virtio-blk-pci,drive=3Dvendor \
>> >      >              >              >>       > -append
>> "console=3DttyAMA0,38400
>> >      >             drm.debug=3D0x0
>> >      >              >             rootwait rootdelay=3D5
>> >      >              >              >>       > root=3D/dev/mmcblk0p2
>> >      >             androidboot.hardware=3Drpi4
>> >      >              >              >>       >
>> androidboot.selinux=3Dpermissive
>> >      >             security=3Dselinux
>> >      >              >             selinux=3D1
>> >      >              >              >>       >
>> androidboot.qemu.hw.mainkeys=3D0
>> >      >              >             androidboot.lcd.density=3D160"
>> >      >              >              >>       >
>> >      >              >              >>       > The error I get in short
>> is :
>> >      >              >              >>       >
>> >      >              >              >>       > [ 1.993668] init: bool
>> >      >              >              >>       >
>> >      >              >              >>
>> >      >              >
>> >      >
>> >
>>  android::init::BlockDevInitializer::InitDevices(std::set<std::string>):
>> >      >              >              >>       > partition(s) not found i=
n
>> >     /sys,
>> >      >             waiting for
>> >      >              >             their uevent(s):
>> >      >              >              >>      mmcblk0p2,
>> >      >              >              >>       > mmcblk0p3
>> >      >              >              >>       >
>> >      >              >              >>       >
>> >      >              >              >>       > One user suggested to :
>> >      >              >              >>       >
>> >      >              >              >>       >
>> >      >              >              >>       >
>> >      >              >              >>       >
>> >      >              >              >>       >
>> >      >              >              >>       > Hi!!! The "/sys" is a
>> "dynamic
>> >      >             fs" created at
>> >      >              >             ram from the
>> >      >              >              >>      kernel, to
>> >      >              >              >>       > export a lot of
>> >     things...so most
>> >      >             of the files
>> >      >              >             only exist at runtime.
>> >      >              >              >>       > Normally, the partitions
>> >     from the
>> >      >             block device
>> >      >              >             have a symlink at
>> >      >              >              >>       > /sys/<something>/<...>
>> that
>> >      >             points to /dev/
>> >      >              >             block node. It seems
>> >      >              >              >>      that
>> >      >              >              >>       > there are no such files
>> under
>> >      >             /sys according to
>> >      >              >             what init is looking
>> >      >              >              >>       > for. You can double chec=
k
>> >     this at
>> >      >             init source
>> >      >              >             code to check the
>> >      >              >              >>      exact
>> >      >              >              >>       > path but I'm guessing th=
at
>> >     you'll
>> >      >             have to change
>> >      >              >             the qemu arguments
>> >      >              >              >>       > regarding the block
>> device.
>> >      >              >              >>       >
>> >      >              >              >>       > About userdata.img I thi=
nk
>> >     it's
>> >      >             normal since in
>> >      >              >             the old days, the
>> >      >              >              >>      image
>> >      >              >              >>       > was a "empty sparse
>> >     image", that
>> >      >             means, at the
>> >      >              >             first flashing
>> >      >              >              >>      process,
>> >      >              >              >>       > there isn't userdata
>> >     information,
>> >      >             we're just
>> >      >              >             "flashing the
>> >      >              >              >>      partition"
>> >      >              >              >>       > with empty data.
>> >      >              >              >>       > Tks!!!
>> >      >              >              >>       >
>> >      >              >              >>       >
>> >      >              >              >>       >
>> >      >              >              >>       > So,in short I should
>> >     change the
>> >      >             qemu arguments
>> >      >              >             regarding the block
>> >      >              >              >>       > device. I tried in this
>> way :
>> >      >              >              >>       >
>> >      >              >              >>       >
>> >      >              >              >>       > qemu-system-aarch64 \
>> >      >              >              >>       >          -smp 4 \
>> >      >              >              >>       >          -m 2048 \
>> >      >              >              >>       >          -cpu cortex-a72=
 \
>> >      >              >              >>       >          -M virt \
>> >      >              >              >>       >          -device
>> >      >             virtio-gpu-pci,xres=3D1024,yres=3D768 \
>> >      >              >              >>       >          -display
>> sdl,gl=3Don \
>> >      >              >              >>       >          -device usb-ehc=
i
>> \
>> >      >              >              >>       >          -device usb-kbd=
 \
>> >      >              >              >>       >          -device
>> >     virtio-tablet-pci \
>> >      >              >              >>       >          -usb \
>> >      >              >              >>       >          -serial stdio \
>> >      >              >              >>       >          -kernel
>> >      >              >             /mnt/zroot-133/_OS/Android/rpi4/Imag=
e
>> \
>> >      >              >              >>       >          -initrd
>> >      >              >
>> >       /mnt/zroot-133/_OS/Android/rpi4/ramdisk.img \
>> >      >              >              >>       >          -hda
>> >      >              >
>>  /mnt/zroot-133/_OS/Android/rpi4/boot.img \
>> >      >              >              >>       >          -hdb
>> >      >              >
>> >       /mnt/zroot-133/_OS/Android/rpi4/system.img \
>> >      >              >              >>       >          -hdc
>> >      >              >
>> >       /mnt/zroot-133/_OS/Android/rpi4/vendor.img \
>> >      >              >              >>       >        -append
>> >     "console=3DttyAMA0,38400
>> >      >              >             drm.debug=3D0x0 rootwait
>> >      >              >              >>      rootdelay=3D5
>> >      >              >              >>       > root=3D/dev/mmcblk0p2
>> >      >             androidboot.hardware=3Drpi4
>> >      >              >              >>       >
>> androidboot.selinux=3Dpermissive
>> >      >             security=3Dselinux
>> >      >              >             selinux=3D1
>> >      >              >              >>       >
>> androidboot.qemu.hw.mainkeys=3D0
>> >      >              >             androidboot.lcd.density=3D160"
>> >      >              >              >>       >
>> >      >              >              >>       >
>> >      >              >              >>       > but the error is still
>> >     there. Do
>> >      >             you know some
>> >      >              >             different alternative
>> >      >              >              >>       > block devices to try ?
>> thanks.
>> >      >              >              >>       >
>> >      >              >              >>       >
>> >      >              >              >>       > --
>> >      >              >              >>       > Mario.
>> >      >              >              >>
>> >      >              >              >>
>> >      >              >              >>
>> >      >              >              >> --
>> >      >              >              >> Mario.
>> >      >              >
>> >      >              >
>> >      >              >
>> >      >              >         --
>> >      >              >         Mario.
>> >      >              >
>> >      >              >
>> >      >              >
>> >      >              >     --
>> >      >              >     Mario.
>> >      >              >
>> >      >              >
>> >      >              >
>> >      >              > --
>> >      >              > Mario.
>> >      >
>> >      >
>> >      >
>> >      >         --
>> >      >         Mario.
>> >      >
>> >      >
>> >      >
>> >      >     --
>> >      >     Mario.
>> >      >
>> >      >
>> >      >
>> >      > --
>> >      > Mario.
>> >
>> >
>> >
>> > --
>> > Mario.
>>
>
>
> --
> Mario.
>


--=20
Mario.

--000000000000b72a0706213d3dae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+VW5mb3J0dW5hdGVseSB0aGUgdXNhZ2Ugb2YgcWVtdSBwYXRjaGVkIHRv
IGJvb3QgQW5kcm9pZCAxMCBvbiB0aGUgSmV0c29uIG5hbm8gZGlkbiYjMzk7dCBjaGFuZ2UgYW55
dGhpbmcuIEkgZ2V0IHRoZSBzYW1lIGV4YWN0IGVycm9ycyBhcyBiZWZvcmUuIDooPGJyPjwvZGl2
Pjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWls
X2F0dHIiPk9uIFR1ZSwgU2VwIDMsIDIwMjQgYXQgODoxNOKAr1BNIE1hcmlvIE1hcmlldHRvICZs
dDs8YSBocmVmPSJtYWlsdG86bWFyaWV0dG8yMDA4QGdtYWlsLmNvbSI+bWFyaWV0dG8yMDA4QGdt
YWlsLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxf
cXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNv
bGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+PGRpdiBkaXI9Imx0ciI+PGRp
dj4mZ3Q7RGVwZW5kcyB3aGljaCB2ZXJzaW9uIG9mIEFuZHJvaWQgeW91IHVzZSwgYnV0IGltYWdl
cyBhcmUgZ2V0dGluZyBiaWdnZXIgYW5kIGJpZ2dlciBldmVyeSB0aW1lIHNpbmNlIEFuZHJvaWQg
NSwgc28gSSYjMzk7bSBub3Qgc3VycHJpc2VkIGl0ICZndDt0YWtlcyBtb3JlIA0KYW5kIG1vcmUg
dGltZSB0byBib290LjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+SWYgSSB3aWxsIGJlIGFibGUg
dG8gYm9vdCBBbmRyb2lkIDEwIHVzaW5nIHRoZSBxZW11IHBhdGNoZWQgYnkgQW50bWljcm8sbWF5
YmUgSSB3aWxsIHRyeSBpZiBpdCB3aWxsIHdvcmsgd2l0aCBBbmRyb2lkIDE0IGZvciBSYXNwYmVy
cnkgUGkgNC4gPGJyPjwvZGl2PjxkaXY+SnVzdCBmb3IgdGhlIHNha2Ugb2YgbXkgY3VyaW9zaXR5
LjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjwvZGl2Pjxicj48ZGl2IGNsYXNz
PSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIFR1ZSwg
U2VwIDMsIDIwMjQgYXQgODowM+KAr1BNIFBpZXJyaWNrIEJvdXZpZXIgJmx0OzxhIGhyZWY9Im1h
aWx0bzpwaWVycmljay5ib3V2aWVyQGxpbmFyby5vcmciIHRhcmdldD0iX2JsYW5rIj5waWVycmlj
ay5ib3V2aWVyQGxpbmFyby5vcmc8L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+PGJsb2NrcXVvdGUg
Y2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRl
ci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPk9uIDkv
My8yNCAxMDoxNywgTWFyaW8gTWFyaWV0dG8gd3JvdGU6PGJyPg0KJmd0OyBAUGllcnJpY2sgQm91
dmllciA6PGJyPg0KJmd0OyA8YnI+DQomZ3Q7IC0tLSZndDsgSSYjMzk7bSByZWFsbHkgZ2xhZCB0
byBzZWUgaXQgd29ya2VkISBBcmUgeW91IGFscmVhZHkgcnVubmluZyB0aGUgPGJyPg0KJmd0OyBy
YXNwYmVycnkgaW1hZ2UsIG9yIHZhbmlsbGEgQU9TUCA/PGJyPg0KJmd0Ozxicj4NCiZndDsgTm8g
YW5kIEkgZG9uJiMzOTt0IHRoaW5rIEkgd2lsbC4gSSBoYXZlIGEgcHJvamVjdCB0aGF0IEkmIzM5
O20gd29ya2luZyBvbiB0aGF0IDxicj4NCiZndDsgYWltcyB0byBlbXVsYXRlIEFuZHJvaWQgZm9y
IEFybSBvbiBMaW51eCB4NjQgYml0LiBJIGtuZXcgdGhhdCBpdCB3b3VsZCA8YnI+DQomZ3Q7IGJl
IHNsb3csYnV0IEkgZGlkbiYjMzk7dCB0aGluayBpdCB3b3VsZCBiZSBzbyBtdWNoLiBXaGVuIEkg
dXNlZCBBVkQgYXMgYW4gPGJyPg0KJmd0OyBlbXVsYXRvcixBbmRyb2lkIHdlbnQgZmFzdGVyLjxi
cj4NCiZndDsgPGJyPg0KJmd0Ozxicj4NCjxicj4NCkRlcGVuZHMgd2hpY2ggdmVyc2lvbiBvZiBB
bmRyb2lkIHlvdSB1c2UsIGJ1dCBpbWFnZXMgYXJlIGdldHRpbmcgYmlnZ2VyIDxicj4NCmFuZCBi
aWdnZXIgZXZlcnl0aW1lIHNpbmNlIEFuZHJvaWQgNSwgc28gSSYjMzk7bSBub3Qgc3VycHJpc2Vk
IGl0IHRha2VzIG1vcmUgPGJyPg0KYW5kIG1vcmUgdGltZSB0byBib290Ljxicj4NCjxicj4NCkJ5
IEFWRCwgaWYgeW91IHJlZmVyIHRvIEFuZHJvaWQgZW11bGF0b3IgaW5jbHVkZWQgaW4gQW5kcm9p
ZCBTdHVkaW8sIDxicj4NCml0JiMzOTtzIGEgZG93bnN0cmVhbSBmb3JrIG9mIFFFTVUuIFNvIHRo
ZSBwZXJmb3JtYW5jZSB3aWxsIGJlIG9uIHBhciAob3IgPGJyPg0Kd29yc2UpIHRoYW4gdXBzdHJl
YW0gUUVNVS48YnI+DQo8YnI+DQpUaGUgb25seSB3YXkgdG8gaGF2ZSBzb21ldGhpbmcgdGhhdCBn
b2VzIGZhc3QgaXMgdG8gaGF2ZSBhYXJjaDY0IDxicj4NCmhhcmR3YXJlIGFuZCB1c2Uga3ZtIGFj
Y2VsZXJhdGlvbiAob24gTGludXgsIG9yIGVxdWl2YWxlbnQgb24gPGJyPg0KV2luZG93cy9NYWNP
UykuPGJyPg0KPGJyPg0KJmd0O8KgIMKgIMKgIMKgQFBldGVyIE1heWRlbGwgJmx0O21haWx0bzo8
YSBocmVmPSJtYWlsdG86cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnIiB0YXJnZXQ9Il9ibGFuayI+
cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPC9hPiZndDsgOjxicj4NCiZndDsgPGJyPg0KJmd0OyA8
YnI+DQomZ3Q7IEkgdGhpbmsgdGhhdCBJJiMzOTt2ZSB1bmRlcnN0b29kIHRoZSByZWFzb24gd2h5
IHNldmVyYWwgeWVhcnMgYWdvIGl0IHdvcmtlZC4gPGJyPg0KJmd0OyBQcm9iYWJseSBJJiMzOTtk
IHVzZWQgdGhpcyBzcGVjaWFsIHZlcnNpb24gb2YgcWVtdSA6PGJyPg0KJmd0OyA8YnI+DQomZ3Q7
IDxicj4NCiZndDsgPGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL2FudG1pY3JvL2t2bS1hb3Nw
LXFlbXUvcmVsZWFzZXMvdGFnLzUuMC4wLWt2bS1hb3NwIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdl
dD0iX2JsYW5rIj5odHRwczovL2dpdGh1Yi5jb20vYW50bWljcm8va3ZtLWFvc3AtcWVtdS9yZWxl
YXNlcy90YWcvNS4wLjAta3ZtLWFvc3A8L2E+IDxicj4NCiZndDsgJmx0OzxhIGhyZWY9Imh0dHBz
Oi8vZ2l0aHViLmNvbS9hbnRtaWNyby9rdm0tYW9zcC1xZW11L3JlbGVhc2VzL3RhZy81LjAuMC1r
dm0tYW9zcCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9naXRodWIu
Y29tL2FudG1pY3JvL2t2bS1hb3NwLXFlbXUvcmVsZWFzZXMvdGFnLzUuMC4wLWt2bS1hb3NwPC9h
PiZndDs8YnI+DQomZ3Q7IDxicj4NCiZndDsgSSYjMzk7bSBzdXJlIHRoYXQgaXQgY29udGFpbnMg
dGhlIG5lY2Vzc2FyeSBwYXRjaGVzIHRvIGJlIGFibGUgdG8gYm9vdCA8YnI+DQomZ3Q7IEFuZHJv
aWQgMTAgb24gdGhlIEpldHNvbiBOYW5vLjxicj4NCiZndDsgPGJyPg0KJmd0OyBPbiBUdWUsIFNl
cCAzLCAyMDI0IGF0IDY6MzHigK9QTSBQaWVycmljayBCb3V2aWVyIDxicj4NCiZndDsgJmx0Ozxh
IGhyZWY9Im1haWx0bzpwaWVycmljay5ib3V2aWVyQGxpbmFyby5vcmciIHRhcmdldD0iX2JsYW5r
Ij5waWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc8L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFp
bHRvOnBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnBpZXJyaWNr
LmJvdXZpZXJAbGluYXJvLm9yZzwvYT4mZ3Q7Jmd0OyB3cm90ZTo8YnI+DQomZ3Q7IDxicj4NCiZn
dDvCoCDCoCDCoFdpdGhvdXQgYW5zd2VyaW5nIHNwZWNpZmljYWxseSBvbiB5b3VyIHF1ZXN0aW9u
LCBpZiB5b3Ugd2FudCB0bzxicj4NCiZndDvCoCDCoCDCoGV4Y2hhbmdlPGJyPg0KJmd0O8KgIMKg
IMKgZmlsZXMgd2l0aCBhIGFuZHJvaWQgZ3Vlc3QsIHNpbXBseSB1c2UgYWRiIChwdXNoL3B1bGwg
Y29tbWFuZHMpLiBJdCYjMzk7czxicj4NCiZndDvCoCDCoCDCoG11Y2ggYmV0dGVyIGFuZCBmYXN0
ZXIgdGhhbiBhbnkgb3RoZXIgc29sdXRpb24geW91IGNhbiB0cnksIGFuZDxicj4NCiZndDvCoCDC
oCDCoGN1dHRsZWZpc2ggdG9vbHMgYWxyZWFkeSBzZXR1cCBhbGwgdGhlIGFkYiBzdHVmZiBmb3Ig
eW91Ljxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgWW91IGNhbiB1c2UgYWRiLXN5bmMgKDxh
IGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS9qYjIxNzAvYmV0dGVyLWFkYi1zeW5jIiByZWw9Im5v
cmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2dpdGh1Yi5jb20vamIyMTcwL2JldHRl
ci1hZGItc3luYzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cHM6Ly9naXRo
dWIuY29tL2piMjE3MC9iZXR0ZXItYWRiLXN5bmMiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJf
YmxhbmsiPmh0dHBzOi8vZ2l0aHViLmNvbS9qYjIxNzAvYmV0dGVyLWFkYi1zeW5jPC9hPiZndDsp
IHRvIGhhdmU8YnI+DQomZ3Q7wqAgwqAgwqBzb21ldGhpbmcgc2ltaWxhciB0byByc3luYywgaW4g
Y2FzZSB5b3Ugd2FudCB0byBzZW5kIGZpbGVzPGJyPg0KJmd0O8KgIMKgIMKgaW5jcmVtZW50YWxs
eS48YnI+DQomZ3Q7IDxicj4NCiZndDvCoCDCoCDCoFBpZXJyaWNrPGJyPg0KJmd0OyA8YnI+DQom
Z3Q7wqAgwqAgwqBPbiA5LzMvMjQgMDg6MjQsIE1hcmlvIE1hcmlldHRvIHdyb3RlOjxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7IEhlbGxvLjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDsgQWN0dWFsbHkgSSYjMzk7bSB1c2luZyBteSBKZXRzb24gTmFubyBhbmQgSSYj
Mzk7bSB0cnlpbmcgdG8gZW11bGF0ZTxicj4NCiZndDvCoCDCoCDCoEFuZHJvaWQgMTA8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0OyBieSBhbnRtaWNyby4gSSYjMzk7bSB0cnlpbmcgdG8gdXNlIHRoZSBz
YW1lIHBhcmFtZXRlcnMgdXNlZCBzZXZlcmFsPGJyPg0KJmd0O8KgIMKgIMKgeWVhcnM8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0OyBhZ28sd2hlbiBpdCB3b3JrZWQuIFdoYXQgSSB3YW50IHRvIHRyeSBu
b3cgaXMgdG8gZW5hYmxlPGJyPg0KJmd0O8KgIMKgIMKgdmlydGlvLWJsay1wY2k8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0OyBvbiBxZW11LiBQcm9iYWJseSBpbiBhZGRpdGlvbiB0byB1c2luZyBxZW11
IDUuMCxJIGhhZCBjb25maWd1cmVkPGJyPg0KJmd0O8KgIMKgIMKgcWVtdTxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7IHdpdGggdmlydGlvLWJsay1wY2kgZW5hYmxlZCxiZWNhdXNlIEkgdXNlZCB0aGVz
ZSBwYXJhbWV0ZXJzIGFuZCB0aGV5PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgd29ya2VkIGdyZWF0
IDo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IC1kcml2ZTxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgaW5kZXg9MCxpZj1ub25lLGlk
PXN5c3RlbSxmaWxlPS9ob21lL2FyZXN1c2VyL0Rlc2t0b3AvYW50bWljcm8vYW9zcC1pbWcvc3lz
dGVtLXJ3LmltZyBcPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCAtZGV2aWNl
IHZpcnRpby1ibGstcGNpLGRyaXZlPXN5c3RlbSBcPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoCDCoCDCoCAtZHJpdmU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDC
oGluZGV4PTEsaWY9bm9uZSxpZD12ZW5kb3IsZmlsZT0vaG9tZS9hcmVzdXNlci9EZXNrdG9wL2Fu
dG1pY3JvL2Fvc3AtaW1nL3ZlbmRvci1ydy5pbWcgXDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAgLWRldmljZSB2aXJ0aW8tYmxrLXBjaSxkcml2ZT12ZW5kb3IgXDxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgLWRyaXZlPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDs8YnI+DQomZ3Q7wqAgwqAgwqBpbmRleD0yLGlmPW5vbmUsaWQ9dXNlcmRhdGEsZmlsZT0vaG9t
ZS9hcmVzdXNlci9EZXNrdG9wL2FudG1pY3JvL2Fvc3AtaW1nL3VzZXJkYXRhLmltZyBcPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCAtZGV2aWNlIHZpcnRpby1ibGstcGNpLGRy
aXZlPXVzZXJkYXRhIFw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7IENhbiBzb21lb25lIHRlbGwgbWUgaG93IHRvIGVuYWJsZSB0aGUgJnF1b3Q7VmlydEZTIHN1
cHBvcnQmcXVvdDsgaW4gcWVtdSA1LjAgPzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IGJlY2F1c2Ug
YXQgdGhlIG1vbWVudCBpdCBpcyBjb25maWd1cmVkIHRvICZxdW90O25vJnF1b3Q7IDo8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IHJvb3RAamV0c29uOi9ob21l
L2FyZXN1c2VyL0Rlc2t0b3AvYW50bWljcm8vcWVtdS01LjAuMCMgLi9jb25maWd1cmU8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0OyBJbnN0YWxsIHByZWZpeCDCoCDCoC91c3IvbG9jYWw8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0OyBCSU9TIGRpcmVjdG9yeSDCoCDCoC91c3IvbG9jYWwvc2hhcmUvcWVtdTxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7IGZpcm13YXJlIHBhdGggwqAgwqAgL3Vzci9sb2NhbC9zaGFy
ZS9xZW11LWZpcm13YXJlPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgYmluYXJ5IGRpcmVjdG9yeSDC
oC91c3IvbG9jYWwvYmluPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgbGlicmFyeSBkaXJlY3Rvcnkg
L3Vzci9sb2NhbC9saWI8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBtb2R1bGUgZGlyZWN0b3J5IMKg
L3Vzci9sb2NhbC9saWIvcWVtdTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IGxpYmV4ZWMgZGlyZWN0
b3J5IC91c3IvbG9jYWwvbGliZXhlYzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IGluY2x1ZGUgZGly
ZWN0b3J5IC91c3IvbG9jYWwvaW5jbHVkZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IGNvbmZpZyBk
aXJlY3RvcnkgwqAvdXNyL2xvY2FsL2V0Yzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IGxvY2FsIHN0
YXRlIGRpcmVjdG9yeSDCoCAvdXNyL2xvY2FsL3Zhcjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IE1h
bnVhbCBkaXJlY3RvcnkgwqAvdXNyL2xvY2FsL3NoYXJlL21hbjxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7IEVMRiBpbnRlcnAgcHJlZml4IC91c3IvZ25lbXVsL3FlbXUtJU08YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0OyBCdWlsZCBkaXJlY3RvcnkgwqAgL2hvbWUvYXJlc3VzZXIvRGVza3RvcC9hbnRtaWNy
by9xZW11LTUuMC4wPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgU291cmNlIHBhdGggwqAgwqAgwqAg
L2hvbWUvYXJlc3VzZXIvRGVza3RvcC9hbnRtaWNyby9xZW11LTUuMC4wPGJyPg0KJmd0O8KgIMKg
IMKgICZndDsgR0lUIGJpbmFyeSDCoCDCoCDCoCDCoGdpdDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
IEdJVCBzdWJtb2R1bGVzPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgQyBjb21waWxlciDCoCDCoCDC
oCDCoGNjPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgSG9zdCBDIGNvbXBpbGVyIMKgIGNjPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDsgQysrIGNvbXBpbGVyIMKgIMKgIMKgYysrPGJyPg0KJmd0O8KgIMKg
IMKgICZndDsgT2JqZWN0aXZlLUMgY29tcGlsZXIgY2xhbmc8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
OyBBUkZMQUdTIMKgIMKgIMKgIMKgIMKgIHJ2PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgQ0ZMQUdT
IMKgIMKgIMKgIMKgIMKgIMKgLU8yIC1VX0ZPUlRJRllfU09VUkNFIC1EX0ZPUlRJRllfU09VUkNF
PTIgLWc8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBRRU1VX0NGTEFHUyDCoCDCoCDCoCAtSS91c3Iv
aW5jbHVkZS9waXhtYW4tMSAtSSQoU1JDX1BBVEgpL2R0Yy9saWJmZHQ8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgLXB0aHJlYWQgLUkvdXNyL2luY2x1ZGUvZ2xpYi0yLjA8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0OyAtSS91c3IvbGliL2FhcmNoNjQtbGludXgtZ251L2dsaWItMi4wL2luY2x1ZGUg
LWZQSUUgLURQSUU8YnI+DQomZ3Q7wqAgwqAgwqAgwqAtRF9HTlVfU09VUkNFPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDsgLURfRklMRV9PRkZTRVRfQklUUz02NCAtRF9MQVJHRUZJTEVfU09VUkNFIC1X
c3RyaWN0LXByb3RvdHlwZXM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyAtV3JlZHVuZGFudC1kZWNs
cyAtV2FsbCAtV3VuZGVmIC1Xd3JpdGUtc3RyaW5ncyAtV21pc3NpbmctcHJvdG90eXBlczxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7IC1mbm8tc3RyaWN0LWFsaWFzaW5nIC1mbm8tY29tbW9uIC1md3Jh
cHYgLXN0ZD1nbnU5OTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAtV2V4cGFuc2lvbi10by1k
ZWZpbmVkIC1XZW5kaWYtbGFiZWxzIC1Xbm8tc2hpZnQtbmVnYXRpdmUtdmFsdWU8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0OyAtV25vLW1pc3NpbmctaW5jbHVkZS1kaXJzIC1XZW1wdHktYm9keSAtV25l
c3RlZC1leHRlcm5zPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgLVdmb3JtYXQtc2VjdXJpdHkgLVdm
b3JtYXQteTJrIC1XaW5pdC1zZWxmIC1XaWdub3JlZC1xdWFsaWZpZXJzPGJyPg0KJmd0O8KgIMKg
IMKgICZndDsgLVdvbGQtc3R5bGUtZGVjbGFyYXRpb24gLVdvbGQtc3R5bGUtZGVmaW5pdGlvbiAt
V3R5cGUtbGltaXRzPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgLWZzdGFjay1wcm90ZWN0b3Itc3Ry
b25nIMKgLUkvdXNyL2luY2x1ZGUvbGlicG5nMTY8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
LUkkKFNSQ19QQVRIKS9jYXBzdG9uZS9pbmNsdWRlPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgUUVN
VV9MREZMQUdTIMKgIMKgIMKgLUwkKEJVSUxEX0RJUikvZHRjL2xpYmZkdCAtV2wsLXoscmVscm88
YnI+DQomZ3Q7wqAgwqAgwqAtV2wsLXosbm93IC1waWU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgLWZzdGFjay1wcm90ZWN0b3Itc3Ryb25nPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgbWFrZSDC
oCDCoCDCoCDCoCDCoCDCoCDCoG1ha2U8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBpbnN0YWxsIMKg
IMKgIMKgIMKgIMKgIGluc3RhbGw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBweXRob24gwqAgwqAg
wqAgwqAgwqAgwqAvdXNyL2Jpbi9weXRob24zIC1CICgzLjEwLjEyKTxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7IGdlbmlzb2ltYWdlIMKgIMKgIMKgIC91c3IvYmluL2dlbmlzb2ltYWdlPGJyPg0KJmd0
O8KgIMKgIMKgICZndDsgc2xpcnAgc3VwcG9ydCDCoCDCoCBpbnRlcm5hbDxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7IHNtYmQgwqAgwqAgwqAgwqAgwqAgwqAgwqAvdXNyL3NiaW4vc21iZDxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7IG1vZHVsZSBzdXBwb3J0IMKgIMKgbm88YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0OyBhbHQgcGF0aCBtb2QgbG9hZCBubzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IGhvc3QgQ1BV
IMKgIMKgIMKgIMKgIMKgYWFyY2g2NDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IGhvc3QgYmlnIGVu
ZGlhbiDCoCBubzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IHRhcmdldCBsaXN0IMKgIMKgIMKgIGFh
cmNoNjQtc29mdG1tdSBhbHBoYS1zb2Z0bW11IGFybS1zb2Z0bW11PGJyPg0KJmd0O8KgIMKgIMKg
Y3Jpcy1zb2Z0bW11PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgaHBwYS1zb2Z0bW11IGkzODYtc29m
dG1tdSBsbTMyLXNvZnRtbXUgbTY4ay1zb2Z0bW11PGJyPg0KJmd0O8KgIMKgIMKgbWljcm9ibGF6
ZS1zb2Z0bW11PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgbWljcm9ibGF6ZWVsLXNvZnRtbXUgbWlw
cy1zb2Z0bW11IG1pcHM2NC1zb2Z0bW11IG1pcHM2NGVsLXNvZnRtbXU8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0OyBtaXBzZWwtc29mdG1tdSBtb3hpZS1zb2Z0bW11IG5pb3MyLXNvZnRtbXUgb3Ixay1z
b2Z0bW11IHBwYy1zb2Z0bW11PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgcHBjNjQtc29mdG1tdSBy
aXNjdjMyLXNvZnRtbXUgcmlzY3Y2NC1zb2Z0bW11IHJ4LXNvZnRtbXU8YnI+DQomZ3Q7wqAgwqAg
wqBzMzkweC1zb2Z0bW11PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgc2g0LXNvZnRtbXUgc2g0ZWIt
c29mdG1tdSBzcGFyYy1zb2Z0bW11IHNwYXJjNjQtc29mdG1tdTxicj4NCiZndDvCoCDCoCDCoHRy
aWNvcmUtc29mdG1tdTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IHVuaWNvcmUzMi1zb2Z0bW11IHg4
Nl82NC1zb2Z0bW11IHh0ZW5zYS1zb2Z0bW11IHh0ZW5zYWViLXNvZnRtbXU8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0OyBhYXJjaDY0LWxpbnV4LXVzZXIgYWFyY2g2NF9iZS1saW51eC11c2VyIGFscGhh
LWxpbnV4LXVzZXI8YnI+DQomZ3Q7wqAgwqAgwqBhcm0tbGludXgtdXNlcjxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7IGFybWViLWxpbnV4LXVzZXIgY3Jpcy1saW51eC11c2VyIGhwcGEtbGludXgtdXNl
ciBpMzg2LWxpbnV4LXVzZXI8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBtNjhrLWxpbnV4LXVzZXIg
bWljcm9ibGF6ZS1saW51eC11c2VyIG1pY3JvYmxhemVlbC1saW51eC11c2VyPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDsgbWlwcy1saW51eC11c2VyIG1pcHM2NC1saW51eC11c2VyIG1pcHM2NGVsLWxp
bnV4LXVzZXI8YnI+DQomZ3Q7wqAgwqAgwqBtaXBzZWwtbGludXgtdXNlcjxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7IG1pcHNuMzItbGludXgtdXNlciBtaXBzbjMyZWwtbGludXgtdXNlciBuaW9zMi1s
aW51eC11c2VyPGJyPg0KJmd0O8KgIMKgIMKgb3Ixay1saW51eC11c2VyPGJyPg0KJmd0O8KgIMKg
IMKgICZndDsgcHBjLWxpbnV4LXVzZXIgcHBjNjQtbGludXgtdXNlciBwcGM2NGFiaTMyLWxpbnV4
LXVzZXI8YnI+DQomZ3Q7wqAgwqAgwqBwcGM2NGxlLWxpbnV4LXVzZXI8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0OyByaXNjdjMyLWxpbnV4LXVzZXIgcmlzY3Y2NC1saW51eC11c2VyIHMzOTB4LWxpbnV4
LXVzZXI8YnI+DQomZ3Q7wqAgwqAgwqBzaDQtbGludXgtdXNlcjxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7IHNoNGViLWxpbnV4LXVzZXIgc3BhcmMtbGludXgtdXNlciBzcGFyYzMycGx1cy1saW51eC11
c2VyPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgc3BhcmM2NC1saW51eC11c2VyIHRpbGVneC1saW51
eC11c2VyIHg4Nl82NC1saW51eC11c2VyPGJyPg0KJmd0O8KgIMKgIMKgeHRlbnNhLWxpbnV4LXVz
ZXI8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyB4dGVuc2FlYi1saW51eC11c2VyPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDsgZ3Byb2YgZW5hYmxlZCDCoCDCoCBubzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
IHNwYXJzZSBlbmFibGVkIMKgIMKgbm88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBzdHJpcCBiaW5h
cmllcyDCoCDCoHllczxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IHByb2ZpbGVyIMKgIMKgIMKgIMKg
IMKgbm88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBzdGF0aWMgYnVpbGQgwqAgwqAgwqBubzxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7IFNETCBzdXBwb3J0IMKgIMKgIMKgIHllcyAoMi4yNi4xKTxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7IFNETCBpbWFnZSBzdXBwb3J0IG5vPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDsgR1RLIHN1cHBvcnQgwqAgwqAgwqAgeWVzICgzLjI0LjMzKTxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7IEdUSyBHTCBzdXBwb3J0IMKgIMKgeWVzPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgVlRF
IHN1cHBvcnQgwqAgwqAgwqAgbm88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBUTFMgcHJpb3JpdHkg
wqAgwqAgwqBOT1JNQUw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBHTlVUTFMgc3VwcG9ydCDCoCDC
oG5vPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgbGliZ2NyeXB0IMKgIMKgIMKgIMKgIG5vPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDsgbmV0dGxlIMKgIMKgIMKgIMKgIMKgIMKgbm88YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0OyBsaWJ0YXNuMSDCoCDCoCDCoCDCoCDCoG5vPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDsgUEFNIMKgIMKgIMKgIMKgIMKgIMKgIMKgIG5vPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgaWNv
bnYgc3VwcG9ydCDCoCDCoCB5ZXM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBjdXJzZXMgc3VwcG9y
dCDCoCDCoHllczxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IHZpcmdsIHN1cHBvcnQgwqAgwqAgbm88
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBjdXJsIHN1cHBvcnQgwqAgwqAgwqBubzxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7IG1pbmd3MzIgc3VwcG9ydCDCoCBubzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
IEF1ZGlvIGRyaXZlcnMgwqAgwqAgcGEgb3NzPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgQmxvY2sg
d2hpdGVsaXN0IChydyk8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBCbG9jayB3aGl0ZWxpc3QgKHJv
KTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgKlZpcnRGUyBz
dXBwb3J0IMKgIMKgbm8qPGJyPg0KJmd0O8KgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0OyBNdWx0aXBhdGggc3VwcG9ydCBubzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IFZOQyBzdXBw
b3J0IMKgIMKgIMKgIHllczxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IFZOQyBTQVNMIHN1cHBvcnQg
wqBubzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IFZOQyBKUEVHIHN1cHBvcnQgwqB5ZXM8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0OyBWTkMgUE5HIHN1cHBvcnQgwqAgeWVzPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDsgeGVuIHN1cHBvcnQgwqAgwqAgwqAgbm88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBicmxh
cGkgc3VwcG9ydCDCoCDCoG5vPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgRG9jdW1lbnRhdGlvbiDC
oCDCoCBubzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IFBJRSDCoCDCoCDCoCDCoCDCoCDCoCDCoCB5
ZXM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyB2ZGUgc3VwcG9ydCDCoCDCoCDCoCBubzxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7IG5ldG1hcCBzdXBwb3J0IMKgIMKgbm88YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0OyBMaW51eCBBSU8gc3VwcG9ydCBubzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IExpbnV4IGlv
X3VyaW5nIHN1cHBvcnQgbm88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBBVFRSL1hBVFRSIHN1cHBv
cnQgeWVzPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgSW5zdGFsbCBibG9icyDCoCDCoCB5ZXM8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0OyBLVk0gc3VwcG9ydCDCoCDCoCDCoCB5ZXM8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0OyBIQVggc3VwcG9ydCDCoCDCoCDCoCBubzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
IEhWRiBzdXBwb3J0IMKgIMKgIMKgIG5vPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgV0hQWCBzdXBw
b3J0IMKgIMKgIMKgbm88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBUQ0cgc3VwcG9ydCDCoCDCoCDC
oCB5ZXM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBUQ0cgZGVidWcgZW5hYmxlZCBubzxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7IFRDRyBpbnRlcnByZXRlciDCoCBubzxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7IG1hbGxvYyB0cmltIHN1cHBvcnQgeWVzPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgUkRNQSBz
dXBwb3J0IMKgIMKgIMKgbm88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBQVlJETUEgc3VwcG9ydCDC
oCDCoG5vPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgZmR0IHN1cHBvcnQgwqAgwqAgwqAgZ2l0PGJy
Pg0KJmd0O8KgIMKgIMKgICZndDsgbWVtYmFycmllciDCoCDCoCDCoCDCoG5vPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDsgcHJlYWR2IHN1cHBvcnQgwqAgwqB5ZXM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
OyBmZGF0YXN5bmMgwqAgwqAgwqAgwqAgeWVzPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgbWFkdmlz
ZSDCoCDCoCDCoCDCoCDCoCB5ZXM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBwb3NpeF9tYWR2aXNl
IMKgIMKgIHllczxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IHBvc2l4X21lbWFsaWduIMKgIMKgeWVz
PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgbGliY2FwLW5nIHN1cHBvcnQgbm88YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0OyB2aG9zdC1uZXQgc3VwcG9ydCB5ZXM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyB2
aG9zdC1jcnlwdG8gc3VwcG9ydCB5ZXM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyB2aG9zdC1zY3Np
IHN1cHBvcnQgeWVzPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgdmhvc3QtdnNvY2sgc3VwcG9ydCB5
ZXM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyB2aG9zdC11c2VyIHN1cHBvcnQgeWVzPGJyPg0KJmd0
O8KgIMKgIMKgICZndDsgdmhvc3QtdXNlci1mcyBzdXBwb3J0IHllczxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7IFRyYWNlIGJhY2tlbmRzIMKgIMKgbG9nPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgc3Bp
Y2Ugc3VwcG9ydCDCoCDCoCBubzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IHJiZCBzdXBwb3J0IMKg
IMKgIMKgIG5vPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgeGZzY3RsIHN1cHBvcnQgwqAgwqBubzxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7IHNtYXJ0Y2FyZCBzdXBwb3J0IG5vPGJyPg0KJmd0O8KgIMKg
IMKgICZndDsgbGlidXNiIMKgIMKgIMKgIMKgIMKgIMKgbm88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
OyB1c2IgbmV0IHJlZGlyIMKgIMKgIG5vPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgT3BlbkdMIHN1
cHBvcnQgwqAgwqB5ZXM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBPcGVuR0wgZG1hYnVmcyDCoCDC
oHllczxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IGxpYmlzY3NpIHN1cHBvcnQgwqBubzxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7IGxpYm5mcyBzdXBwb3J0IMKgIMKgbm88YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0OyBidWlsZCBndWVzdCBhZ2VudCB5ZXM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBRR0EgVlNT
IHN1cHBvcnQgwqAgbm88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBRR0EgdzMyIGRpc2sgaW5mbyBu
bzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IFFHQSBNU0kgc3VwcG9ydCDCoCBubzxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7IHNlY2NvbXAgc3VwcG9ydCDCoCBubzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
IGNvcm91dGluZSBiYWNrZW5kIHVjb250ZXh0PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgY29yb3V0
aW5lIHBvb2wgwqAgwqB5ZXM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBkZWJ1ZyBzdGFjayB1c2Fn
ZSBubzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IG11dGV4IGRlYnVnZ2luZyDCoCBubzxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7IGNyeXB0byBhZmFsZyDCoCDCoCDCoG5vPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDsgR2x1c3RlckZTIHN1cHBvcnQgbm88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBnY292IMKg
IMKgIMKgIMKgIMKgIMKgIMKgZ2Nvdjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IGdjb3YgZW5hYmxl
ZCDCoCDCoCDCoG5vPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgVFBNIHN1cHBvcnQgwqAgwqAgwqAg
eWVzPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgbGlic3NoIHN1cHBvcnQgwqAgwqBubzxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7IFFPTSBkZWJ1Z2dpbmcgwqAgwqAgeWVzPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDsgTGl2ZSBibG9jayBtaWdyYXRpb24geWVzPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgbHpv
IHN1cHBvcnQgwqAgwqAgwqAgbm88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBzbmFwcHkgc3VwcG9y
dCDCoCDCoG5vPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgYnppcDIgc3VwcG9ydCDCoCDCoCBubzxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7IGx6ZnNlIHN1cHBvcnQgwqAgwqAgbm88YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0OyB6c3RkIHN1cHBvcnQgwqAgwqAgwqBubzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
IE5VTUEgaG9zdCBzdXBwb3J0IHllczxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IGxpYnhtbDIgwqAg
wqAgwqAgwqAgwqAgeWVzPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgdGNtYWxsb2Mgc3VwcG9ydCDC
oG5vPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgamVtYWxsb2Mgc3VwcG9ydCDCoG5vPGJyPg0KJmd0
O8KgIMKgIMKgICZndDsgYXZ4MiBvcHRpbWl6YXRpb248YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBh
dng1MTJmIG9wdGltaXphdGlvbiBubzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IHJlcGxpY2F0aW9u
IHN1cHBvcnQgeWVzPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgVnhIUyBibG9jayBkZXZpY2Ugbm88
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBib2NocyBzdXBwb3J0IMKgIMKgIHllczxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7IGNsb29wIHN1cHBvcnQgwqAgwqAgeWVzPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDsgZG1nIHN1cHBvcnQgwqAgwqAgwqAgeWVzPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgcWNvdyB2
MSBzdXBwb3J0IMKgIHllczxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IHZkaSBzdXBwb3J0IMKgIMKg
IMKgIHllczxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IHZ2ZmF0IHN1cHBvcnQgwqAgwqAgeWVzPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDsgcWVkIHN1cHBvcnQgwqAgwqAgwqAgeWVzPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDsgcGFyYWxsZWxzIHN1cHBvcnQgeWVzPGJyPg0KJmd0O8KgIMKgIMKgICZndDsg
c2hlZXBkb2cgc3VwcG9ydCDCoHllczxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IGNhcHN0b25lIMKg
IMKgIMKgIMKgIMKgaW50ZXJuYWw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBsaWJwbWVtIHN1cHBv
cnQgwqAgbm88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBsaWJ1ZGV2IMKgIMKgIMKgIMKgIMKgIHll
czxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IGRlZmF1bHQgZGV2aWNlcyDCoCB5ZXM8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0OyBwbHVnaW4gc3VwcG9ydCDCoCDCoG5vPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDsgZnV6emluZyBzdXBwb3J0IMKgIG5vPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgZ2RiIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIC91c3IvYmluL2dkYjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IGNyb3Nz
IGNvbnRhaW5lcnMgwqBkb2NrZXI8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7IFRoYW5rcy48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7IE9uIFR1ZSwgU2VwIDMsIDIwMjQgYXQgMTA6NTXigK9BTSBNYXJpbyBNYXJpZXR0bzxi
cj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJtYWlsdG86bWFyaWV0dG8yMDA4QGdtYWlsLmNv
bSIgdGFyZ2V0PSJfYmxhbmsiPm1hcmlldHRvMjAwOEBnbWFpbC5jb208L2E+ICZsdDttYWlsdG86
PGEgaHJlZj0ibWFpbHRvOm1hcmlldHRvMjAwOEBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5t
YXJpZXR0bzIwMDhAZ21haWwuY29tPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyAmbHQ7
bWFpbHRvOjxhIGhyZWY9Im1haWx0bzptYXJpZXR0bzIwMDhAZ21haWwuY29tIiB0YXJnZXQ9Il9i
bGFuayI+bWFyaWV0dG8yMDA4QGdtYWlsLmNvbTwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWls
dG86bWFyaWV0dG8yMDA4QGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPm1hcmlldHRvMjAwOEBn
bWFpbC5jb208L2E+Jmd0OyZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgd3JvdGU6PGJyPg0KJmd0
O8KgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgRmluYWxseSBpdCB3
b3JrZWQgOjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoElzdGFudGFuZWFfMjAyNC0wOS0wM18xMC01MS0zNS5qcGc8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgVmVyeSB0aGFua3MgbWFuLiBJbiBhbnkgY2FzZSBpdCBpcyBWRVJZIHNsb3cg
YW5kIG5vdCB1c2FibGU8YnI+DQomZ3Q7wqAgwqAgwqBhdCBhbGwuPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoElzIHRoZXJlIHNvbWV0aGluZyB0aGF0IEkgY2FuIGRvIHRvIGltcHJvdmUg
aXRzIHNwZWVkID88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoE9uIFR1ZSwgU2VwIDMsIDIwMjQgYXQgMTA6
MzPigK9BTSBNYXJpbyBNYXJpZXR0bzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmbHQ7
PGEgaHJlZj0ibWFpbHRvOm1hcmlldHRvMjAwOEBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5t
YXJpZXR0bzIwMDhAZ21haWwuY29tPC9hPiAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzptYXJp
ZXR0bzIwMDhAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+bWFyaWV0dG8yMDA4QGdtYWlsLmNv
bTwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86bWFy
aWV0dG8yMDA4QGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPm1hcmlldHRvMjAwOEBnbWFpbC5j
b208L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOm1hcmlldHRvMjAwOEBnbWFpbC5jb20i
IHRhcmdldD0iX2JsYW5rIj5tYXJpZXR0bzIwMDhAZ21haWwuY29tPC9hPiZndDsmZ3Q7Jmd0OyB3
cm90ZTo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqB6aW9tYXJpb0BaMzkwLUFPUlVTLVBSTy1ERVNUOi9t
bnQvenJvb3QtMTMzL19PUy9BbmRyb2lkL2Fvc3BfMTQvYW5kcm9pZC1pbWFnZSQgSE9NRT0kKHB3
ZCkgLi9iaW4vbGF1bmNoX2N2ZCAtdm1fbWFuYWdlciBxZW11X2NsaSAtcmVwb3J0X2Fub255bW91
c191c2FnZV9zdGF0cz1uIC0tc3RhcnRfd2VicnRjPWZhbHNlPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgMDktMDMgMTA6MDQ6NDQuMjA2
IDI3ODYzODYgMjc4NjM4NiBJIGxhdW5jaF9jdmQ6IG1haW4uY2M6MjM1PGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoFVzaW5nIHN5c3RlbV9pbWFnZV9kaXIgb2Y6PGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDCoD09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT08
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgTk9USUNFOjxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoEJ5IHVzaW5nIHRo
aXMgQW5kcm9pZCBWaXJ0dWFsIERldmljZSwgeW91IGFncmVlIHRvPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoEdvb2dsZSBUZXJtcyBvZiBTZXJ2aWNlPGJyPg0KJmd0O8KgIMKg
IMKgKDxhIGhyZWY9Imh0dHBzOi8vcG9saWNpZXMuZ29vZ2xlLmNvbS90ZXJtcyIgcmVsPSJub3Jl
ZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9wb2xpY2llcy5nb29nbGUuY29tL3Rlcm1z
PC9hPiAmbHQ7PGEgaHJlZj0iaHR0cHM6Ly9wb2xpY2llcy5nb29nbGUuY29tL3Rlcm1zIiByZWw9
Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL3BvbGljaWVzLmdvb2dsZS5jb20v
dGVybXM8L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAmbHQ7PGEg
aHJlZj0iaHR0cHM6Ly9wb2xpY2llcy5nb29nbGUuY29tL3Rlcm1zIiByZWw9Im5vcmVmZXJyZXIi
IHRhcmdldD0iX2JsYW5rIj5odHRwczovL3BvbGljaWVzLmdvb2dsZS5jb20vdGVybXM8L2E+PGJy
Pg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHBzOi8vcG9saWNpZXMuZ29vZ2xlLmNvbS90
ZXJtcyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9wb2xpY2llcy5n
b29nbGUuY29tL3Rlcm1zPC9hPiZndDsmZ3Q7KS48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgIMKgIMKgVGhlIEdvb2dsZSBQcml2YWN5IFBvbGljeTxicj4NCiZndDvCoCDCoCDCoCg8YSBo
cmVmPSJodHRwczovL3BvbGljaWVzLmdvb2dsZS5jb20vcHJpdmFjeSIgcmVsPSJub3JlZmVycmVy
IiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9wb2xpY2llcy5nb29nbGUuY29tL3ByaXZhY3k8L2E+
PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHBzOi8vcG9saWNpZXMuZ29vZ2xlLmNv
bS9wcml2YWN5IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL3BvbGlj
aWVzLmdvb2dsZS5jb20vcHJpdmFjeTwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwczovL3BvbGljaWVzLmdvb2dsZS5jb20vcHJpdmFj
eSIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9wb2xpY2llcy5nb29n
bGUuY29tL3ByaXZhY3k8L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHBzOi8v
cG9saWNpZXMuZ29vZ2xlLmNvbS9wcml2YWN5IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2Js
YW5rIj5odHRwczovL3BvbGljaWVzLmdvb2dsZS5jb20vcHJpdmFjeTwvYT4mZ3Q7Jmd0Oyk8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgZGVzY3JpYmVzIGhvdyBHb29nbGUgaGFu
ZGxlcyBpbmZvcm1hdGlvbiBnZW5lcmF0ZWQgYXMgeW91IHVzZTxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqBHb29nbGUgU2VydmljZXMuPGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDCoD09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT08YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBSZWFkaW5nIC0tY29u
ZmlnIG9wdGlvbiBmcm9tOjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqA8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAvbW50L3pyb290LTEzMy9fT1MvQW5kcm9pZC9hb3NwXzE0L2FuZHJvaWQt
aW1hZ2UvYW5kcm9pZC1pbmZvLnR4dDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqBMYXVuY2hpbmcgQ1ZEIHVzaW5nIC0tY29uZmlnPSYjMzk7cGhvbmUmIzM5Oy48YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgR1BVIGF1dG8gbW9kZTogZGV0ZWN0ZWQgcHJlcmVx
dWlzaXRlcyBmb3IgYWNjZWxlcmF0ZWQ8YnI+DQomZ3Q7wqAgwqAgwqByZW5kZXJpbmc8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgc3VwcG9ydC48YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgRW5hYmxpbmcgLS1ncHVfbW9kZT1nZnhzdHJlYW0uPGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoEdQVSB2aG9zdCB1c2VyIGF1dG8gbW9kZTogbm90
IHlldCBzdXBwb3J0ZWQgd2l0aDxicj4NCiZndDvCoCDCoCDCoHFlbXVfY2xpLiBOb3Q8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgZW5hYmxpbmcgdmhvc3QgdXNlciBncHUuPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoFJlcXVlc3RlZCByZXN1bWluZyBhIHBy
ZXZpb3VzIHNlc3Npb24gKHRoZSBkZWZhdWx0PGJyPg0KJmd0O8KgIMKgIMKgYmVoYXZpb3IpIGJ1
dDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqB0aGUgYmFzZSBpbWFnZXMgaGF2
ZSBjaGFuZ2VkIHVuZGVyIHRoZSBvdmVybGF5LCBtYWtpbmcgdGhlPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoG92ZXJsYXkgaW5jb21wYXRpYmxlLiBXaXBpbmcgdGhlIG92ZXJs
YXkgZmlsZXMuPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoFBhdGggZm9yIGlu
c3RhbmNlIFVEUzogL3RtcC9jZl9hdmRfMTAwMDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoFRoZSBmb2xsb3dpbmcgbGluZXMgY29udGFp
biB1c2VmdWwgZGVidWdnaW5nIGluZm9ybWF0aW9uOjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqBTZXJpYWwgY29uc29sZSBpcyBkaXNhYmxlZDsgdXNlIC1jb25zb2xlPXRy
dWUgdG8gZW5hYmxlIGl0Ljxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqBM
b2djYXQgb3V0cHV0Ojxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqA8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAvbW50L3pyb290LTEzMy9fT1MvQW5kcm9pZC9hb3NwXzE0L2FuZHJvaWQtaW1h
Z2UvY3V0dGxlZmlzaC9pbnN0YW5jZXMvY3ZkLTEvbG9ncy9sb2djYXQ8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqBLZXJuZWwgbG9n
Ojxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAv
bW50L3pyb290LTEzMy9fT1MvQW5kcm9pZC9hb3NwXzE0L2FuZHJvaWQtaW1hZ2UvY3V0dGxlZmlz
aC9pbnN0YW5jZXMvY3ZkLTEva2VybmVsLmxvZzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAgwqAgwqAgwqBMYXVuY2hlciBsb2c6PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDC
oDxicj4NCiZndDvCoCDCoCDCoCDCoC9tbnQvenJvb3QtMTMzL19PUy9BbmRyb2lkL2Fvc3BfMTQv
YW5kcm9pZC1pbWFnZS9jdXR0bGVmaXNoL2luc3RhbmNlcy9jdmQtMS9sb2dzL2xhdW5jaGVyLmxv
Zzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoEluc3RhbmNlIGNvbmZpZ3VyYXRpb246PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDCoC9tbnQvenJvb3QtMTMzL19PUy9BbmRyb2lkL2Fv
c3BfMTQvYW5kcm9pZC1pbWFnZS9jdXR0bGVmaXNoL2luc3RhbmNlcy9jdmQtMS9jdXR0bGVmaXNo
X2NvbmZpZy5qc29uPGJyPg0KJmd0O8KgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgTGF1bmNoZXIgQnVpbGQgSUQ6IDEyMzA5Mjk2PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgPGJyPg0KJmd0O8Kg
IMKgIMKgIMKgL21udC96cm9vdC0xMzMvX09TL0FuZHJvaWQvYW9zcF8xNC9hbmRyb2lkLWltYWdl
L2Jpbi9tb2RlbV9zaW11bGF0b3I8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgPGJy
Pg0KJmd0O8KgIMKgIMKgIMKgL21udC96cm9vdC0xMzMvX09TL0FuZHJvaWQvYW9zcF8xNC9hbmRy
b2lkLWltYWdlL2Jpbi90b21ic3RvbmVfcmVjZWl2ZXI8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgL21udC96cm9vdC0xMzMvX09TL0FuZHJvaWQvYW9zcF8xNC9hbmRyb2lkLWlt
YWdlL2Jpbi9sb2dfdGVlPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoC9tbnQv
enJvb3QtMTMzL19PUy9BbmRyb2lkL2Fvc3BfMTQvYW5kcm9pZC1pbWFnZS9iaW4vd21lZGl1bWQ8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKgL21u
dC96cm9vdC0xMzMvX09TL0FuZHJvaWQvYW9zcF8xNC9hbmRyb2lkLWltYWdlL2Jpbi9jYXNpbWly
X2NvbnRyb2xfc2VydmVyPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoDxicj4NCiZn
dDvCoCDCoCDCoCDCoC9tbnQvenJvb3QtMTMzL19PUy9BbmRyb2lkL2Fvc3BfMTQvYW5kcm9pZC1p
bWFnZS9iaW4vc2NyZWVuX3JlY29yZGluZ19zZXJ2ZXI8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKgL21udC96cm9vdC0xMzMvX09TL0FuZHJvaWQv
YW9zcF8xNC9hbmRyb2lkLWltYWdlL2Jpbi9hZGJfY29ubmVjdG9yPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDCoC9tbnQvenJvb3QtMTMzL19PUy9B
bmRyb2lkL2Fvc3BfMTQvYW5kcm9pZC1pbWFnZS9iaW4vc29ja2V0X3Zzb2NrX3Byb3h5PGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDCoC9tbnQvenJv
b3QtMTMzL19PUy9BbmRyb2lkL2Fvc3BfMTQvYW5kcm9pZC1pbWFnZS9iaW4vc29ja2V0X3Zzb2Nr
X3Byb3h5PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDC
oCDCoC9tbnQvenJvb3QtMTMzL19PUy9BbmRyb2lkL2Fvc3BfMTQvYW5kcm9pZC1pbWFnZS9iaW4v
dGNwX2Nvbm5lY3Rvcjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqA8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAvbW50L3pyb290LTEzMy9fT1MvQW5kcm9pZC9hb3NwXzE0L2FuZHJvaWQtaW1h
Z2UvYmluL2NvbnRyb2xfZW52X3Byb3h5X3NlcnZlcjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAvbW50L3pyb290LTEzMy9fT1MvQW5kcm9pZC9h
b3NwXzE0L2FuZHJvaWQtaW1hZ2UvYmluL2VjaG9fc2VydmVyPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCDCoCDCoFN0YXJ0IG1vZGVtIHNpbXVsYXRvciwgc2VydmVyX2ZkczogNTgsIFNp
bSB0eXBlOiBub3JtYWw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgPGJyPg0KJmd0
O8KgIMKgIMKgIMKgL21udC96cm9vdC0xMzMvX09TL0FuZHJvaWQvYW9zcF8xNC9hbmRyb2lkLWlt
YWdlL2Jpbi9nbnNzX2dycGNfcHJveHk8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
PGJyPg0KJmd0O8KgIMKgIMKgIMKgL21udC96cm9vdC0xMzMvX09TL0FuZHJvaWQvYW9zcF8xNC9h
bmRyb2lkLWltYWdlL2Jpbi9sb2djYXRfcmVjZWl2ZXI8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKgL21udC96cm9vdC0xMzMvX09TL0FuZHJvaWQv
YW9zcF8xNC9hbmRyb2lkLWltYWdlL2Jpbi9rZXJuZWxfbG9nX21vbml0b3I8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKgL21udC96cm9vdC0xMzMv
X09TL0FuZHJvaWQvYW9zcF8xNC9hbmRyb2lkLWltYWdlL2Jpbi9vcGVud3J0X2NvbnRyb2xfc2Vy
dmVyPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoC9tbnQvenJvb3QtMTMzL19P
Uy9BbmRyb2lkL2Fvc3BfMTQvYW5kcm9pZC1pbWFnZS9iaW4vbG9nX3RlZTxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAvbW50L3pyb290LTEzMy9f
T1MvQW5kcm9pZC9hb3NwXzE0L2FuZHJvaWQtaW1hZ2UvYmluL3Byb2Nlc3NfcmVzdGFydGVyPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoC9tbnQvenJvb3QtMTMzL19PUy9BbmRy
b2lkL2Fvc3BfMTQvYW5kcm9pZC1pbWFnZS9iaW4vbmV0c2ltZDxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAvbW50L3pyb290LTEzMy9fT1MvQW5k
cm9pZC9hb3NwXzE0L2FuZHJvaWQtaW1hZ2UvYmluL3NvY2tldF92c29ja19wcm94eTxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoEZhaWxl
ZCB0byBvcGVuIHNvY2tldDogQ29ubmVjdGlvbiByZWZ1c2VkPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAvbW50L3pyb290LTEzMy9fT1MvQW5kcm9pZC9hb3NwXzE0
L2FuZHJvaWQtaW1hZ2UvYmluL3NvY2tldF92c29ja19wcm94eTxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAvbW50L3pyb290LTEzMy9fT1MvQW5k
cm9pZC9hb3NwXzE0L2FuZHJvaWQtaW1hZ2UvYmluL3NlY3VyZV9lbnY8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKgL21udC96cm9vdC0xMzMvX09T
L0FuZHJvaWQvYW9zcF8xNC9hbmRyb2lkLWltYWdlL2Jpbi94ODZfNjQtbGludXgtZ251L3FlbXUv
cWVtdS1zeXN0ZW0tYWFyY2g2NDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBT
ZXJ2ZXIgbGlzdGVuaW5nIG9uPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoDxicj4N
CiZndDvCoCDCoCDCoCDCoHVuaXg6L3RtcC9jZl9hdmRfMTAwMC9jdmQtMS9ncnBjX3NvY2tldC9D
YXNpbWlyQ29udHJvbFNlcnZlci5zb2NrPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoFNlcnZlciBsaXN0ZW5pbmcgb248YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgdW5peDovdG1wL2NmX2F2ZF8xMDAwL2N2ZC0xL2dycGNfc29ja2V0L0VjaG9TZXJ2ZXIuc29j
azxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBTZXJ2ZXIgbGlzdGVuaW5nIG9u
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDCoHVu
aXg6L3RtcC9jZl9hdmRfMTAwMC9jdmQtMS9ncnBjX3NvY2tldC9PcGVud3J0Q29udHJvbFNlcnZl
ci5zb2NrPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoHJvb3QtY2FuYWwgSSAw
OS0wMyAxMDowNjoxMy4yMTkgZGV2aWNlX2JvdXRpcXVlLmNjOjM3PGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoFJlZ2lzdGVyaW5nIGJlYWNvbjxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqByb290LWNhbmFsIEkgMDktMDMgMTA6MDY6MTMuMjE5IGRldmljZV9i
b3V0aXF1ZS5jYzozNzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBSZWdpc3Rl
cmluZyBiZWFjb25fc3dhcm08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgcm9v
dC1jYW5hbCBJIDA5LTAzIDEwOjA2OjEzLjIxOSBkZXZpY2VfYm91dGlxdWUuY2M6Mzc8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgUmVnaXN0ZXJpbmcgc2NyaXB0ZWRfYmVhY29u
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoHJvb3QtY2FuYWwgSSAwOS0wMyAx
MDowNjoxMy4yMTkgZGV2aWNlX2JvdXRpcXVlLmNjOjM3PGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoFJlZ2lzdGVyaW5nIHNuaWZmZXI8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgU2VydmVyIGxpc3RlbmluZyBvbjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqB1bml4Oi90bXAvY2ZfYXZkXzEwMDAvY3ZkLTEv
Z3JwY19zb2NrZXQvQ29udHJvbEVudlByb3h5U2VydmVyLnNvY2s8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgbmV0c2ltZCBJIDA5LTAzIDA4OjA2OjEzLjIyMSA8YSBocmVmPSJo
dHRwOi8vcnVzdF9tYWluLnJzOjk4IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5y
dXN0X21haW4ucnM6OTg8L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9y
dXN0X21haW4ucnM6OTgiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9y
dXN0X21haW4ucnM6OTg8L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAmbHQ7PGEgaHJlZj0iaHR0cDovL3J1c3RfbWFpbi5yczo5OCIgcmVsPSJub3JlZmVycmVyIiB0
YXJnZXQ9Il9ibGFuayI+aHR0cDovL3J1c3RfbWFpbi5yczo5ODwvYT4gJmx0OzxhIGhyZWY9Imh0
dHA6Ly9ydXN0X21haW4ucnM6OTgiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0
dHA6Ly9ydXN0X21haW4ucnM6OTg8L2E+Jmd0OyZndDsgLTxicj4NCiZndDvCoCDCoCDCoG5ldHNp
bSBhcnRpZmFjdHMgcGF0aDo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgJnF1
b3Q7L3RtcC9hbmRyb2lkLXppb21hcmlvL25ldHNpbWQmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgbmV0c2ltZCBJIDA5LTAzIDA4OjA2OjEzLjIyMSA8YSBocmVmPSJo
dHRwOi8vcnVzdF9tYWluLnJzOjEwMSIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+
cnVzdF9tYWluLnJzOjEwMTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDov
L3J1c3RfbWFpbi5yczoxMDEiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6
Ly9ydXN0X21haW4ucnM6MTAxPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
IMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9ydXN0X21haW4ucnM6MTAxIiByZWw9Im5vcmVmZXJy
ZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vcnVzdF9tYWluLnJzOjEwMTwvYT4gJmx0OzxhIGhy
ZWY9Imh0dHA6Ly9ydXN0X21haW4ucnM6MTAxIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2Js
YW5rIj5odHRwOi8vcnVzdF9tYWluLnJzOjEwMTwvYT4mZ3Q7Jmd0OyAtPGJyPg0KJmd0O8KgIMKg
IMKgTmV0c2ltZEFyZ3Mgezxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqDC
oMKgZmRfc3RhcnR1cF9zdHI6IFNvbWUoPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoMKgwqDCoMKgwqDCoCZxdW90O3tcJnF1b3Q7ZGV2aWNlc1wmcXVvdDs6W3tcJnF1b3Q7
bmFtZVwmcXVvdDs6XCZxdW90OzxhIGhyZWY9Imh0dHA6Ly8wLjAuMC4wOjY1MjAiIHJlbD0ibm9y
ZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPjAuMC4wLjA6NjUyMDwvYT48YnI+DQomZ3Q7wqAgwqAg
wqAmbHQ7PGEgaHJlZj0iaHR0cDovLzAuMC4wLjA6NjUyMCIgcmVsPSJub3JlZmVycmVyIiB0YXJn
ZXQ9Il9ibGFuayI+aHR0cDovLzAuMC4wLjA6NjUyMDwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vMC4wLjAuMDo2NTIwIiByZWw9
Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vMC4wLjAuMDo2NTIwPC9hPjxicj4N
CiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vMC4wLjAuMDo2NTIwIiByZWw9Im5vcmVm
ZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vMC4wLjAuMDo2NTIwPC9hPiZndDsmZ3Q7XCZx
dW90OyxcJnF1b3Q7Y2hpcHNcJnF1b3Q7Olt7XCZxdW90O2tpbmRcJnF1b3Q7OlwmcXVvdDtCTFVF
VE9PVEhcJnF1b3Q7LFwmcXVvdDtmZEluXCZxdW90Ozo4MSxcJnF1b3Q7ZmRPdXRcJnF1b3Q7Ojgy
fSx7XCZxdW90O2tpbmRcJnF1b3Q7OlwmcXVvdDtVV0JcJnF1b3Q7LFwmcXVvdDtmZEluPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoFwmcXVvdDs6ODMsXCZxdW90O2ZkT3V0XCZx
dW90Ozo4NH1dfV19JnF1b3Q7LDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqDCoMKgKSw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgwqDCoG5vX2Ns
aV91aTogZmFsc2UsPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoMKgwqBu
b193ZWJfdWk6IGZhbHNlLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqDC
oMKgcGNhcDogZmFsc2UsPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoMKg
wqBkaXNhYmxlX2FkZHJlc3NfcmV1c2U6IGZhbHNlLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqDCoMKgaGNpX3BvcnQ6IFNvbWUoPGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoMKgwqDCoMKgwqDCoDczMDAsPGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoMKgwqApLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqDCoMKgY29ubmVjdG9yX2luc3RhbmNlOiBOb25lLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAgwqAgwqDCoMKgaW5zdGFuY2U6IFNvbWUoPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCDCoCDCoCDCoMKgwqDCoMKgwqDCoDEsPGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoMKgwqApLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqDCoMKgbG9ndG9zdGRlcnI6IGZhbHNlLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAgwqAgwqAgwqDCoMKgZGV2OiBmYWxzZSw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
IMKgIMKgIMKgwqDCoHJ1c3RfZ3JwYzogZmFsc2UsPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoCDCoCDCoCDCoMKgwqBydXN0X2hvc3RhcGQ6IGZhbHNlLDxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqAgwqDCoMKgcnVzdF9zbGlycDogdHJ1ZSw8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgwqDCoHZzb2NrOiBOb25lLDxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqDCoMKgY29uZmlnOiBOb25lLDxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqDCoMKgaG9zdF9kbnM6IE5vbmUsPGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoMKgwqBodHRwX3Byb3h5OiBOb25lLDxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqDCoMKgd2lmaV90YXA6IE5vbmUsPGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoMKgwqB0ZXN0X2JlYWNvbnM6IGZhbHNlLDxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqDCoMKgbm9fdGVzdF9iZWFjb25z
OiBmYWxzZSw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgwqDCoG5vX3No
dXRkb3duOiBmYWxzZSw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgwqDC
oHZlcmJvc2U6IGZhbHNlLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqDC
oMKgdmVyc2lvbjogZmFsc2UsPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoH08
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgU2l6ZSBvZiBPQkpFQ1QgPSAxMjA0
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoFNpemUgb2YgY29tcG9uZW50cyBp
biBUUE1UX1NFTlNJVElWRSA9IDc0NDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqDCoMKgVFBNSV9BTEdfUFVCTElDIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
Mjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqDCoMKgVFBNMkJfQVVUSCDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqA1MDxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqDCoMKgVFBNMkJfRElHRVNUIMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgNTA8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
IMKgIMKgIMKgwqDCoFRQTVVfU0VOU0lUSVZFX0NPTVBPU0lURSDCoMKgwqDCoMKgwqDCoDY0Mjxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBNQVhfQ09OVEVYVF9TSVpFIGNhbiBi
ZSByZWR1Y2VkIHRvIDEyNjQgKDEzNDQpPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoHNpemUgOiAzNjA8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgc3RhcnRp
bmcgUnVzdCBLZXlNaW50IFRBIGltcGxlbWVudGF0aW9uIGluIGEgdGhyZWFkPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoHN0YXJ0aW5nIEMrKyBLZXlNaW50IGltcGxlbWVudGF0
aW9uIGluIGEgdGhyZWFkIHdpdGggRkRzPGJyPg0KJmd0O8KgIMKgIMKgaW49MzEsPGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoG91dD0zMDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAgwqBLZXlNaW50IFJ1c3QgVEEgcnVubmluZyB3aXRoIGluZmlsZT0zNywgb3V0
ZmlsZT0zNiw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgc2VjdXJpdHlfbGV2
ZWw9U29mdHdhcmU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgTm8gc2VjdXJl
IGRlbGV0aW9uIGRhdGEgZmlsZSBmb3VuZC4gQ3JlYXRpbmcgb25lLjxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqBJMDkwMyAxMDowNjoxMy4yNDk0MTggMjc4NjcyNCBTaGFyZWRM
aWJyYXJ5LmNwcDo2NF08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgU2hhcmVk
TGlicmFyeTo6b3BlbiBmb3IgW2xpYnZ1bGthbi5zb108YnI+DQomZ3Q7wqAgwqAgwqAgJmd0Ozxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBJMDkwMyAxMDowNjoxMy4yNDk1MDcg
Mjc4NjcyNCBTaGFyZWRMaWJyYXJ5LmNwcDo3Nl08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgIMKgIMKgU2hhcmVkTGlicmFyeTo6b3BlbiBmb3IgW2xpYnZ1bGthbi5zb106IG5vdCBmb3Vu
ZCBpbiBtYXAsPGJyPg0KJmd0O8KgIMKgIMKgb3Blbjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqBmb3IgdGhlIGZpcnN0IHRpbWU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0Ozxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBJMDkwMyAxMDowNjoxMy4yNDk1MTEgMjc4
NjcyNCBTaGFyZWRMaWJyYXJ5LmNwcDoxODZdPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCDCoCDCoFNoYXJlZExpYnJhcnk6Om9wZW4gZm9yIFtsaWJ2dWxrYW4uc29dIChwb3NpeCk6IGJl
Z2luPGJyPg0KJmd0O8KgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
IMKgIMKgSTA5MDMgMTA6MDY6MTMuMjQ5NTE0IDI3ODY3MjQgU2hhcmVkTGlicmFyeS5jcHA6MjQ0
XTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBTaGFyZWRMaWJyYXJ5OjpvcGVu
IGZvciBbbGlidnVsa2FuLnNvXSAocG9zaXgsbGludXgpOiBjYWxsPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoGRsb3BlbiBvbiBbbGlidnVsa2FuLnNvPGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoF08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0Ozxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBhZGRlZCBsaWJyYXJ5IGxpYnZ1bGthbi5zbzxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBJMDkwMyAxMDowNjoxMy4yNTA1MzUgMjc4
NjcyNCBIZWFsdGhNb25pdG9yLmNwcDoyODBdPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCDCoCDCoEhlYWx0aE1vbml0b3IgZGlzYWJsZWQuPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoCDCoCDCoGNyZWF0ZUdsb2JhbFZrRW11bGF0aW9uOjk2NCBTZWxlY3RpbmcgVnVsa2FuIGRl
dmljZTogTlZJRElBPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoEdlRm9yY2Ug
R1RYIDEwNjAgM0dCPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoGluaXRpYWxp
emU6IFN1cHBvcnRzIGlkIHByb3BlcnRpZXMsIGdvdCBhIHZ1bGthbiBkZXZpY2UgVVVJRDxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBJMDkwMyAxMDowNjoxMy4zNTQ3NTYgMjc4
NjcyNCBTaGFyZWRMaWJyYXJ5LmNwcDo3Nl08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
IMKgIMKgU2hhcmVkTGlicmFyeTo6b3BlbiBmb3IgW2xpYkdMRVN2Mi5zb106IG5vdCBmb3VuZCBp
biBtYXAsPGJyPg0KJmd0O8KgIMKgIMKgb3Blbjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAgwqAgwqBmb3IgdGhlIGZpcnN0IHRpbWU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0Ozxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBJMDkwMyAxMDowNjoxMy4zNTQ3NjQgMjc4Njcy
NCBTaGFyZWRMaWJyYXJ5LmNwcDoxODZdPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoFNoYXJlZExpYnJhcnk6Om9wZW4gZm9yIFtsaWJHTEVTdjIuc29dIChwb3NpeCk6IGJlZ2lu
PGJyPg0KJmd0O8KgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgSTA5MDMgMTA6MDY6MTMuMzU0NzY4IDI3ODY3MjQgU2hhcmVkTGlicmFyeS5jcHA6MjQ0XTxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBTaGFyZWRMaWJyYXJ5OjpvcGVuIGZv
ciBbbGliR0xFU3YyLnNvXSAocG9zaXgsbGludXgpOiBjYWxsPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCDCoCDCoGRsb3BlbiBvbiBbbGliR0xFU3YyLnNvPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoF08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBJMDkwMyAxMDowNjoxMy4zNTUwNzYgMjc4NjcyNCBTaGFy
ZWRMaWJyYXJ5LmNwcDo3Nl08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgU2hh
cmVkTGlicmFyeTo6b3BlbiBmb3IgW2xpYkVHTC5zb106IG5vdCBmb3VuZCBpbiBtYXAsPGJyPg0K
Jmd0O8KgIMKgIMKgb3BlbiBmb3I8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
dGhlIGZpcnN0IHRpbWU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqBJMDkwMyAxMDowNjoxMy4zNTUwODEgMjc4NjcyNCBTaGFyZWRMaWJy
YXJ5LmNwcDoxODZdPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoFNoYXJlZExp
YnJhcnk6Om9wZW4gZm9yIFtsaWJFR0wuc29dIChwb3NpeCk6IGJlZ2luPGJyPg0KJmd0O8KgIMKg
IMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgSTA5MDMgMTA6MDY6
MTMuMzU1MDg0IDI3ODY3MjQgU2hhcmVkTGlicmFyeS5jcHA6MjQ0XTxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqBTaGFyZWRMaWJyYXJ5OjpvcGVuIGZvciBbbGliRUdMLnNvXSAo
cG9zaXgsbGludXgpOiBjYWxsPGJyPg0KJmd0O8KgIMKgIMKgZGxvcGVuPGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoG9uIFtsaWJFR0wuc29dPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgSTA5MDMgMTA6MDY6MTMuNDQ4
ODIxIDI3ODY3MjQgVmtDb21tb25PcGVyYXRpb25zLmNwcDoxMjI2XTxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqBJbml0aWFsaXppbmcgVmtFbXVsYXRpb24gZmVhdHVyZXM6PGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoEkwOTAzIDEwOjA2OjEzLjQ0ODgzNyAy
Nzg2NzI0IFZrQ29tbW9uT3BlcmF0aW9ucy5jcHA6MTIyN108YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgwqDCoMKgZ2xJbnRlcm9wU3VwcG9ydGVkOiB0cnVlPGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoEkwOTAzIDEwOjA2OjEzLjQ0ODg0MCAyNzg2NzI0
IFZrQ29tbW9uT3BlcmF0aW9ucy5jcHA6MTIyOF08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgIMKgIMKgIMKgwqDCoMKgdXNlRGVmZXJyZWRDb21tYW5kczogdHJ1ZTxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBJMDkwMyAxMDowNjoxMy40NDg4NDIgMjc4NjcyNCBWa0Nv
bW1vbk9wZXJhdGlvbnMuY3BwOjEyMzBdPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoMKgwqDCoGNyZWF0ZVJlc291cmNlV2l0aFJlcXVpcmVtZW50czogdHJ1ZTxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBJMDkwMyAxMDowNjoxMy40NDg4NDQgMjc4Njcy
NCBWa0NvbW1vbk9wZXJhdGlvbnMuY3BwOjEyMzFdPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoCDCoCDCoCDCoMKgwqDCoHVzZVZ1bGthbkNvbXBvc2l0aW9uOiBmYWxzZTxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBJMDkwMyAxMDowNjoxMy40NDg4NDYgMjc4NjcyNCBW
a0NvbW1vbk9wZXJhdGlvbnMuY3BwOjEyMzJdPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCDCoCDCoCDCoMKgwqDCoHVzZVZ1bGthbk5hdGl2ZVN3YXBjaGFpbjogZmFsc2U8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgSTA5MDMgMTA6MDY6MTMuNDQ4ODQ4IDI3ODY3MjQg
VmtDb21tb25PcGVyYXRpb25zLmNwcDoxMjMzXTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAgwqAgwqAgwqDCoMKgwqBlbmFibGUgZ3Vlc3RSZW5kZXJEb2M6IGZhbHNlPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoEkwOTAzIDEwOjA2OjEzLjQ0ODg1MCAyNzg2NzI0IFZr
Q29tbW9uT3BlcmF0aW9ucy5jcHA6MTIzNF08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
IMKgIMKgIMKgwqDCoMKgQVNUQyBMRFIgZW11bGF0aW9uIG1vZGU6IDI8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgSTA5MDMgMTA6MDY6MTMuNDQ4ODUyIDI3ODY3MjQgVmtDb21t
b25PcGVyYXRpb25zLmNwcDoxMjM1XTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqDCoMKgwqBlbmFibGUgRVRDMiBlbXVsYXRpb246IHRydWU8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgSTA5MDMgMTA6MDY6MTMuNDQ4ODU0IDI3ODY3MjQgVmtDb21tb25P
cGVyYXRpb25zLmNwcDoxMjM2XTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqDCoMKgwqBlbmFibGUgWWNiY3IgZW11bGF0aW9uOiBmYWxzZTxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqBJMDkwMyAxMDowNjoxMy40NDg4NTYgMjc4NjcyNCBWa0NvbW1vbk9w
ZXJhdGlvbnMuY3BwOjEyMzddPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oMKgwqDCoGd1ZXN0VXNlc0FuZ2xlOiBmYWxzZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAgwqAgwqBJMDkwMyAxMDowNjoxMy40NDg4NTggMjc4NjcyNCBWa0NvbW1vbk9wZXJhdGlvbnMu
Y3BwOjEyMzhdPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoMKgwqDCoHVz
ZURlZGljYXRlZEFsbG9jYXRpb25zOiBmYWxzZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAgwqAgwqBJMDkwMyAxMDowNjoxMy40NDk1NDIgMjc4NjcyNCBGcmFtZUJ1ZmZlci5jcHA6NDg2
XSBHcmFwaGljczxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBBZGFwdGVyIFZl
bmRvciBHb29nbGUgKE5WSURJQSBDb3Jwb3JhdGlvbik8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgSTA5MDMgMTA6MDY6MTMuNDQ5NTQ4IDI3ODY3MjQgRnJhbWVCdWZmZXIuY3Bw
OjQ4N10gR3JhcGhpY3M8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgQWRhcHRl
ciBBbmRyb2lkIEVtdWxhdG9yIE9wZW5HTCBFUyBUcmFuc2xhdG9yIChOVklESUEgR2VGb3JjZTxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBHVFggMTA2MCAzR0IvPGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoFBDSWUvU1NFMik8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgSTA5MDMgMTA6MDY6MTMuNDQ5NTUxIDI3ODY3MjQgRnJhbWVCdWZm
ZXIuY3BwOjQ4OF08YnI+DQomZ3Q7wqAgwqAgwqBHcmFwaGljcyBBUEk8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgVmVyc2lvbiBPcGVuR0wgRVMgMy4wIChPcGVuR0wgRVMgMy4y
IE5WSURJQSA1MzUuMTgzLjAxKTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBJ
MDkwMyAxMDowNjoxMy40NDk1NTMgMjc4NjcyNCBGcmFtZUJ1ZmZlci5jcHA6NDg5XTxicj4NCiZn
dDvCoCDCoCDCoEdyYXBoaWNzIEFQSTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqBFeHRlbnNpb25zIEdMX09FU19FR0xfc3luYyBHTF9PRVNfRUdMX2ltYWdlPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoEdMX09FU19FR0xfaW1hZ2VfZXh0ZXJuYWwgRzxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBMX09FU19kZXB0aDI0IEdMX09FU19kZXB0
aDMyIEdMX09FU19lbGVtZW50X2luZGV4X3VpbnQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgIMKgIMKgR0xfT0VTX3RleHR1cmVfZmxvYXQgR0xfT0VTX3RleHR1cmVfZmxvYXRfbGluZWFy
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoEdMX09FU19jb21wcmVzc2VkX3Bh
bGV0dGVkX3RleHQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgdXJlIEdMX09F
U19jb21wcmVzc2VkX0VUQzFfUkdCOF90ZXh0dXJlIEdMX09FU19kZXB0aF90ZXh0dXJlPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoEdMX09FU190ZXh0dXJlX2hhbGZfZmxvYXQg
R0xfT0VTX3RleHR1cmVfaGFsZl9mbG9hdF9saW5lYXI8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgR0xfT0VTX3BhY2tlZF9kPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCDCoCDCoGVwdGhfc3RlbmNpbCBHTF9PRVNfdmVydGV4X2hhbGZfZmxvYXQ8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgR0xfT0VTX3N0YW5kYXJkX2Rlcml2YXRpdmVzIEdMX09F
U190ZXh0dXJlX25wb3Q8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgR0xfT0VT
X3JnYjhfcmdiYTggR0xfT1ZSX211bHRpdmlldzIgR0xfRVhUX211bHRpdjxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBpZXdfdGV4dHVyZV9tdWx0aXNhbXBsZSBHTF9FWFRfY29s
b3JfYnVmZmVyX2Zsb2F0PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoEdMX0VY
VF9jb2xvcl9idWZmZXJfaGFsZl9mbG9hdCBHTF9FWFRfdGV4dHVyZV9mb3JtYXRfQkdSQTg4ODg8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgR0xfQVBQTEVfdGV4dHVyZV9mb3Jt
YXQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgX0JHUkE4ODg4IEdMX0VYVF90
ZXh0dXJlX2J1ZmZlciBHTF9PRVNfdGV4dHVyZV9idWZmZXI8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgR0xfRVhUX2RyYXdfYnVmZmVyc19pbmRleGVkPGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoEkwOTAzIDEwOjA2OjEzLjQ0OTU1OSAyNzg2NzI0IEZyYW1l
QnVmZmVyLmNwcDo0OTBdIEdyYXBoaWNzPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoERldmljZSBFeHRlbnNpb25zIE4vQTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqBHVUVTVF9VQk9PVF9WRVJTSU9OOiAyMDI0LjAxLWcxZWQ4ZjhiZGUzM2UtYWIxMjA5MTIw
NiAoSnVsIDEwPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoDIwMjQgLSAyMzo0
NzozOCArMDAwMCk8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgVS1Cb290IDIw
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoHN0YXJ0aW5nIFJ1c3QgS2V5TWlu
dCBUQSBpbXBsZW1lbnRhdGlvbiBpbiBhIHRocmVhZDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqBzdGFydGluZyBDKysgS2V5TWludCBpbXBsZW1lbnRhdGlvbiBpbiBhIHRocmVh
ZCB3aXRoIEZEczxicj4NCiZndDvCoCDCoCDCoGluPTMxLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAgwqBvdXQ9MzA8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
S2V5TWludCBSdXN0IFRBIHJ1bm5pbmcgd2l0aCBpbmZpbGU9MzcsIG91dGZpbGU9MzYsPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoHNlY3VyaXR5X2xldmVsPVNvZnR3YXJlPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoFNlY3VyZSBkZWxldGlvbiBkYXRhIGZp
bGUgZm91bmQuIFBhcnNpbmcuPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoDIw
MjQtMDktMDNUMDg6MDY6MTMuNjI2MDc1WiBxZW11LXN5c3RlbS1hYXJjaDY0Ojxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqB2aXJ0aW8tc2VyaWFsLWJ1czogVW5leHBlY3RlZCBw
b3J0IGlkIDE2IGZvciBkZXZpY2U8YnI+DQomZ3Q7wqAgwqAgwqB2aXJ0aW8tc2VyaWFsLjA8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgMjAyNC0wOS0wM1QwODowNjoxMy42MjY0
MTBaIHFlbXUtc3lzdGVtLWFhcmNoNjQ6PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoHZpcnRpby1zZXJpYWwtYnVzOiBVbmV4cGVjdGVkIHBvcnQgaWQgMTcgZm9yIGRldmljZTxi
cj4NCiZndDvCoCDCoCDCoHZpcnRpby1zZXJpYWwuMDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAyMDI0LTA5LTAzVDA4OjA2OjEzLjYyNjU5OVogcWVtdS1zeXN0ZW0tYWFyY2g2
NDo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgdmlydGlvLXNlcmlhbC1idXM6
IFVuZXhwZWN0ZWQgcG9ydCBpZCAxOCBmb3IgZGV2aWNlPGJyPg0KJmd0O8KgIMKgIMKgdmlydGlv
LXNlcmlhbC4wPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoDIwMjQtMDktMDNU
MDg6MDY6MTMuNjI2Nzg4WiBxZW11LXN5c3RlbS1hYXJjaDY0Ojxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqB2aXJ0aW8tc2VyaWFsLWJ1czogVW5leHBlY3RlZCBwb3J0IGlkIDE5
IGZvciBkZXZpY2U8YnI+DQomZ3Q7wqAgwqAgwqB2aXJ0aW8tc2VyaWFsLjA8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgMjAyNC0wOS0wM1QwODowNjoxMy42MjY5ODBaIHFlbXUt
c3lzdGVtLWFhcmNoNjQ6PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoHZpcnRp
by1zZXJpYWwtYnVzOiBVbmV4cGVjdGVkIHBvcnQgaWQgMjAgZm9yIGRldmljZTxicj4NCiZndDvC
oCDCoCDCoHZpcnRpby1zZXJpYWwuMDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAyMDI0LTA5LTAzVDA4OjA2OjEzLjYyNzE3MVogcWVtdS1zeXN0ZW0tYWFyY2g2NDo8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgdmlydGlvLXNlcmlhbC1idXM6IFVuZXhwZWN0
ZWQgcG9ydCBpZCAyMSBmb3IgZGV2aWNlPGJyPg0KJmd0O8KgIMKgIMKgdmlydGlvLXNlcmlhbC4w
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoDIwMjQtMDktMDNUMDg6MDY6MTMu
NjI3MzYwWiBxZW11LXN5c3RlbS1hYXJjaDY0Ojxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAgwqAgwqB2aXJ0aW8tc2VyaWFsLWJ1czogVW5leHBlY3RlZCBwb3J0IGlkIDIyIGZvciBkZXZp
Y2U8YnI+DQomZ3Q7wqAgwqAgwqB2aXJ0aW8tc2VyaWFsLjA8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgMjAyNC0wOS0wM1QwODowNjoxMy42Mjc1NDlaIHFlbXUtc3lzdGVtLWFh
cmNoNjQ6PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoHZpcnRpby1zZXJpYWwt
YnVzOiBVbmV4cGVjdGVkIHBvcnQgaWQgMjMgZm9yIGRldmljZTxicj4NCiZndDvCoCDCoCDCoHZp
cnRpby1zZXJpYWwuMDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAyMDI0LTA5
LTAzVDA4OjA2OjEzLjYyNzczOFogcWVtdS1zeXN0ZW0tYWFyY2g2NDo8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgdmlydGlvLXNlcmlhbC1idXM6IFVuZXhwZWN0ZWQgcG9ydCBp
ZCAyNCBmb3IgZGV2aWNlPGJyPg0KJmd0O8KgIMKgIMKgdmlydGlvLXNlcmlhbC4wPGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoDIwMjQtMDktMDNUMDg6MDY6MTMuNjI3OTMwWiBx
ZW11LXN5c3RlbS1hYXJjaDY0Ojxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqB2
aXJ0aW8tc2VyaWFsLWJ1czogVW5leHBlY3RlZCBwb3J0IGlkIDI1IGZvciBkZXZpY2U8YnI+DQom
Z3Q7wqAgwqAgwqB2aXJ0aW8tc2VyaWFsLjA8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
IMKgIMKgMjAyNC0wOS0wM1QwODowNjoxMy42MjgxMTlaIHFlbXUtc3lzdGVtLWFhcmNoNjQ6PGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoHZpcnRpby1zZXJpYWwtYnVzOiBVbmV4
cGVjdGVkIHBvcnQgaWQgMjYgZm9yIGRldmljZTxicj4NCiZndDvCoCDCoCDCoHZpcnRpby1zZXJp
YWwuMDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAyMDI0LTA5LTAzVDA4OjA2
OjEzLjYyODMwN1ogcWVtdS1zeXN0ZW0tYWFyY2g2NDo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgdmlydGlvLXNlcmlhbC1idXM6IFVuZXhwZWN0ZWQgcG9ydCBpZCAyNyBmb3Ig
ZGV2aWNlPGJyPg0KJmd0O8KgIMKgIMKgdmlydGlvLXNlcmlhbC4wPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoDIwMjQtMDktMDNUMDg6MDY6MTMuNjI4NDk2WiBxZW11LXN5c3Rl
bS1hYXJjaDY0Ojxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqB2aXJ0aW8tc2Vy
aWFsLWJ1czogVW5leHBlY3RlZCBwb3J0IGlkIDI4IGZvciBkZXZpY2U8YnI+DQomZ3Q7wqAgwqAg
wqB2aXJ0aW8tc2VyaWFsLjA8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgMjAy
NC0wOS0wM1QwODowNjoxMy42Mjg2ODNaIHFlbXUtc3lzdGVtLWFhcmNoNjQ6PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoHZpcnRpby1zZXJpYWwtYnVzOiBVbmV4cGVjdGVkIHBv
cnQgaWQgMjkgZm9yIGRldmljZTxicj4NCiZndDvCoCDCoCDCoHZpcnRpby1zZXJpYWwuMDxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAyMDI0LTA5LTAzVDA4OjA2OjEzLjYyODg3
NFogcWVtdS1zeXN0ZW0tYWFyY2g2NDo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgdmlydGlvLXNlcmlhbC1idXM6IFVuZXhwZWN0ZWQgcG9ydCBpZCAzMCBmb3IgZGV2aWNlPGJy
Pg0KJmd0O8KgIMKgIMKgdmlydGlvLXNlcmlhbC4wPGJyPg0KJmd0O8KgIMKgIMKgICZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgR1VFU1RfS0VSTkVMX1ZFUlNJT046PGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoDYuNi40Ni1hbmRyb2lkMTUtOC1nMzU2
OWIwNTM1MTdjLWFiMTIyOTA4NTYtNGs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgKGtsZWFmQGJ1aWxkLWhvc3QpIChBbmRyb2lkICgxMTM2ODMwOCwgK3BnbywgK2JvbHQsICts
dG8sPGJyPg0KJmd0O8KgIMKgIMKgK21sZ28sPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCDCoCDCoGJhc2VkIG9uIHI1MTA5MjgpIGNsYW5nIHZlcnNpb24gMTguMC4wPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCg8YSBocmVmPSJodHRwczovL2FuZHJvaWQuZ29vZ2xl
c291cmNlLmNvbS90b29sY2hhaW4vbGx2bS1wcm9qZWN0IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdl
dD0iX2JsYW5rIj5odHRwczovL2FuZHJvaWQuZ29vZ2xlc291cmNlLmNvbS90b29sY2hhaW4vbGx2
bS1wcm9qZWN0PC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwczovL2FuZHJv
aWQuZ29vZ2xlc291cmNlLmNvbS90b29sY2hhaW4vbGx2bS1wcm9qZWN0IiByZWw9Im5vcmVmZXJy
ZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2FuZHJvaWQuZ29vZ2xlc291cmNlLmNvbS90b29s
Y2hhaW4vbGx2bS1wcm9qZWN0PC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
IMKgIMKgJmx0OzxhIGhyZWY9Imh0dHBzOi8vYW5kcm9pZC5nb29nbGVzb3VyY2UuY29tL3Rvb2xj
aGFpbi9sbHZtLXByb2plY3QiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBz
Oi8vYW5kcm9pZC5nb29nbGVzb3VyY2UuY29tL3Rvb2xjaGFpbi9sbHZtLXByb2plY3Q8L2E+PGJy
Pg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHBzOi8vYW5kcm9pZC5nb29nbGVzb3VyY2Uu
Y29tL3Rvb2xjaGFpbi9sbHZtLXByb2plY3QiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxh
bmsiPmh0dHBzOi8vYW5kcm9pZC5nb29nbGVzb3VyY2UuY29tL3Rvb2xjaGFpbi9sbHZtLXByb2pl
Y3Q8L2E+Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgNDc3NjEw
ZDRkMGQ5ODhlNjlkYmMzZmFlNGZlODZiZmYzZjA3ZjJiNSksIExMRCAxOC4wLjApICMxIFNNUDxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBQUkVFTVBUIFdlZCBBdWcgMjggMjE6
NDM6MzMgVVRDIDIwMjQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgXSBMaW51
eCB2ZXJzaW9uPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoHRyYW5zcG9ydCBt
ZXNzYWdlIGZhaWxlZCwgcmVzcG9uc2UgYm9keTogZGV2aWNlPGJyPg0KJmd0O8KgIMKgIMKgJiMz
OTs8YSBocmVmPSJodHRwOi8vMC4wLjAuMDo2NTIwIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0i
X2JsYW5rIj4wLjAuMC4wOjY1MjA8L2E+ICZsdDs8YSBocmVmPSJodHRwOi8vMC4wLjAuMDo2NTIw
IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vMC4wLjAuMDo2NTIwPC9h
PiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgJmx0OzxhIGhyZWY9Imh0
dHA6Ly8wLjAuMC4wOjY1MjAiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6
Ly8wLjAuMC4wOjY1MjA8L2E+ICZsdDs8YSBocmVmPSJodHRwOi8vMC4wLjAuMDo2NTIwIiByZWw9
Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vMC4wLjAuMDo2NTIwPC9hPiZndDsm
Z3Q7JiMzOTsgbm90IGZvdW5kPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoHRy
YW5zcG9ydCBtZXNzYWdlIGZhaWxlZCwgcmVzcG9uc2UgYm9keTogZGV2aWNlPGJyPg0KJmd0O8Kg
IMKgIMKgJiMzOTs8YSBocmVmPSJodHRwOi8vMC4wLjAuMDo2NTIwIiByZWw9Im5vcmVmZXJyZXIi
IHRhcmdldD0iX2JsYW5rIj4wLjAuMC4wOjY1MjA8L2E+ICZsdDs8YSBocmVmPSJodHRwOi8vMC4w
LjAuMDo2NTIwIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vMC4wLjAu
MDo2NTIwPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgJmx0Ozxh
IGhyZWY9Imh0dHA6Ly8wLjAuMC4wOjY1MjAiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxh
bmsiPmh0dHA6Ly8wLjAuMC4wOjY1MjA8L2E+ICZsdDs8YSBocmVmPSJodHRwOi8vMC4wLjAuMDo2
NTIwIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vMC4wLjAuMDo2NTIw
PC9hPiZndDsmZ3Q7JiMzOTsgbm90IGZvdW5kPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCDCoCDCoHRyYW5zcG9ydCBtZXNzYWdlIGZhaWxlZCwgcmVzcG9uc2UgYm9keTogZGV2aWNlPGJy
Pg0KJmd0O8KgIMKgIMKgJiMzOTs8YSBocmVmPSJodHRwOi8vMC4wLjAuMDo2NTIwIiByZWw9Im5v
cmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj4wLjAuMC4wOjY1MjA8L2E+ICZsdDs8YSBocmVmPSJo
dHRwOi8vMC4wLjAuMDo2NTIwIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRw
Oi8vMC4wLjAuMDo2NTIwPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly8wLjAuMC4wOjY1MjAiIHJlbD0ibm9yZWZlcnJlciIgdGFy
Z2V0PSJfYmxhbmsiPmh0dHA6Ly8wLjAuMC4wOjY1MjA8L2E+ICZsdDs8YSBocmVmPSJodHRwOi8v
MC4wLjAuMDo2NTIwIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vMC4w
LjAuMDo2NTIwPC9hPiZndDsmZ3Q7JiMzOTsgbm90IGZvdW5kPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCDCoCDCoHRyYW5zcG9ydCBtZXNzYWdlIGZhaWxlZCwgcmVzcG9uc2UgYm9keTog
ZGV2aWNlPGJyPg0KJmd0O8KgIMKgIMKgJiMzOTs8YSBocmVmPSJodHRwOi8vMC4wLjAuMDo2NTIw
IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj4wLjAuMC4wOjY1MjA8L2E+ICZsdDs8
YSBocmVmPSJodHRwOi8vMC4wLjAuMDo2NTIwIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2Js
YW5rIj5odHRwOi8vMC4wLjAuMDo2NTIwPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly8wLjAuMC4wOjY1MjAiIHJlbD0ibm9yZWZl
cnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly8wLjAuMC4wOjY1MjA8L2E+ICZsdDs8YSBocmVm
PSJodHRwOi8vMC4wLjAuMDo2NTIwIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5o
dHRwOi8vMC4wLjAuMDo2NTIwPC9hPiZndDsmZ3Q7JiMzOTsgbm90IGZvdW5kPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoEdVRVNUX0JVSUxEX0ZJTkdFUlBSSU5UOjxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqBnZW5lcmljL2Fv
c3BfY2ZfYXJtNjRfb25seV9waG9uZS92c29jX2FybTY0X29ubHk6VmFuaWxsYUljZUNyZWFtL01B
SU4uMWMwMTliMGMvMTIzMDkyOTY6dXNlcmRlYnVnL3Rlc3Qta2V5czxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqB0cmFuc3BvcnQgbWVzc2FnZSBmYWlsZWQsIHJlc3BvbnNlIGJv
ZHk6IGRldmljZTxicj4NCiZndDvCoCDCoCDCoCYjMzk7PGEgaHJlZj0iaHR0cDovLzAuMC4wLjA6
NjUyMCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+MC4wLjAuMDo2NTIwPC9hPiAm
bHQ7PGEgaHJlZj0iaHR0cDovLzAuMC4wLjA6NjUyMCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9
Il9ibGFuayI+aHR0cDovLzAuMC4wLjA6NjUyMDwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vMC4wLjAuMDo2NTIwIiByZWw9Im5v
cmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vMC4wLjAuMDo2NTIwPC9hPiAmbHQ7PGEg
aHJlZj0iaHR0cDovLzAuMC4wLjA6NjUyMCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFu
ayI+aHR0cDovLzAuMC4wLjA6NjUyMDwvYT4mZ3Q7Jmd0OyYjMzk7IG5vdCBmb3VuZDxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqB0cmFuc3BvcnQgbWVzc2FnZSBmYWlsZWQsIHJl
c3BvbnNlIGJvZHk6IGRldmljZTxicj4NCiZndDvCoCDCoCDCoCYjMzk7PGEgaHJlZj0iaHR0cDov
LzAuMC4wLjA6NjUyMCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+MC4wLjAuMDo2
NTIwPC9hPiAmbHQ7PGEgaHJlZj0iaHR0cDovLzAuMC4wLjA6NjUyMCIgcmVsPSJub3JlZmVycmVy
IiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovLzAuMC4wLjA6NjUyMDwvYT4mZ3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vMC4wLjAuMDo2NTIw
IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vMC4wLjAuMDo2NTIwPC9h
PiAmbHQ7PGEgaHJlZj0iaHR0cDovLzAuMC4wLjA6NjUyMCIgcmVsPSJub3JlZmVycmVyIiB0YXJn
ZXQ9Il9ibGFuayI+aHR0cDovLzAuMC4wLjA6NjUyMDwvYT4mZ3Q7Jmd0OyYjMzk7IG5vdCBmb3Vu
ZDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqB0cmFuc3BvcnQgbWVzc2FnZSBm
YWlsZWQsIHJlc3BvbnNlIGJvZHk6IGRldmljZTxicj4NCiZndDvCoCDCoCDCoCYjMzk7PGEgaHJl
Zj0iaHR0cDovLzAuMC4wLjA6NjUyMCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+
MC4wLjAuMDo2NTIwPC9hPiAmbHQ7PGEgaHJlZj0iaHR0cDovLzAuMC4wLjA6NjUyMCIgcmVsPSJu
b3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovLzAuMC4wLjA6NjUyMDwvYT4mZ3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vMC4w
LjAuMDo2NTIwIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vMC4wLjAu
MDo2NTIwPC9hPiAmbHQ7PGEgaHJlZj0iaHR0cDovLzAuMC4wLjA6NjUyMCIgcmVsPSJub3JlZmVy
cmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovLzAuMC4wLjA6NjUyMDwvYT4mZ3Q7Jmd0OyYjMzk7
IG5vdCBmb3VuZDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqB0cmFuc3BvcnQg
bWVzc2FnZSBmYWlsZWQsIHJlc3BvbnNlIGJvZHk6IGRldmljZTxicj4NCiZndDvCoCDCoCDCoCYj
Mzk7PGEgaHJlZj0iaHR0cDovLzAuMC4wLjA6NjUyMCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9
Il9ibGFuayI+MC4wLjAuMDo2NTIwPC9hPiAmbHQ7PGEgaHJlZj0iaHR0cDovLzAuMC4wLjA6NjUy
MCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovLzAuMC4wLjA6NjUyMDwv
YT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCZsdDs8YSBocmVmPSJo
dHRwOi8vMC4wLjAuMDo2NTIwIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRw
Oi8vMC4wLjAuMDo2NTIwPC9hPiAmbHQ7PGEgaHJlZj0iaHR0cDovLzAuMC4wLjA6NjUyMCIgcmVs
PSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovLzAuMC4wLjA6NjUyMDwvYT4mZ3Q7
Jmd0OyYjMzk7IG5vdCBmb3VuZDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqB0
cmFuc3BvcnQgbWVzc2FnZSBmYWlsZWQsIHJlc3BvbnNlIGJvZHk6IGRldmljZTxicj4NCiZndDvC
oCDCoCDCoCYjMzk7PGEgaHJlZj0iaHR0cDovLzAuMC4wLjA6NjUyMCIgcmVsPSJub3JlZmVycmVy
IiB0YXJnZXQ9Il9ibGFuayI+MC4wLjAuMDo2NTIwPC9hPiAmbHQ7PGEgaHJlZj0iaHR0cDovLzAu
MC4wLjA6NjUyMCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovLzAuMC4w
LjA6NjUyMDwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCZsdDs8
YSBocmVmPSJodHRwOi8vMC4wLjAuMDo2NTIwIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2Js
YW5rIj5odHRwOi8vMC4wLjAuMDo2NTIwPC9hPiAmbHQ7PGEgaHJlZj0iaHR0cDovLzAuMC4wLjA6
NjUyMCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovLzAuMC4wLjA6NjUy
MDwvYT4mZ3Q7Jmd0OyYjMzk7IG5vdCBmb3VuZDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAgwqAgwqB0cmFuc3BvcnQgbWVzc2FnZSBmYWlsZWQsIHJlc3BvbnNlIGJvZHk6IGRldmljZTxi
cj4NCiZndDvCoCDCoCDCoCYjMzk7PGEgaHJlZj0iaHR0cDovLzAuMC4wLjA6NjUyMCIgcmVsPSJu
b3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+MC4wLjAuMDo2NTIwPC9hPiAmbHQ7PGEgaHJlZj0i
aHR0cDovLzAuMC4wLjA6NjUyMCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0
cDovLzAuMC4wLjA6NjUyMDwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCZsdDs8YSBocmVmPSJodHRwOi8vMC4wLjAuMDo2NTIwIiByZWw9Im5vcmVmZXJyZXIiIHRh
cmdldD0iX2JsYW5rIj5odHRwOi8vMC4wLjAuMDo2NTIwPC9hPiAmbHQ7PGEgaHJlZj0iaHR0cDov
LzAuMC4wLjA6NjUyMCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovLzAu
MC4wLjA6NjUyMDwvYT4mZ3Q7Jmd0OyYjMzk7IG5vdCBmb3VuZDxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqB0cmFuc3BvcnQgbWVzc2FnZSBmYWlsZWQsIHJlc3BvbnNlIGJvZHk6
IGRldmljZTxicj4NCiZndDvCoCDCoCDCoCYjMzk7PGEgaHJlZj0iaHR0cDovLzAuMC4wLjA6NjUy
MCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+MC4wLjAuMDo2NTIwPC9hPiAmbHQ7
PGEgaHJlZj0iaHR0cDovLzAuMC4wLjA6NjUyMCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9i
bGFuayI+aHR0cDovLzAuMC4wLjA6NjUyMDwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vMC4wLjAuMDo2NTIwIiByZWw9Im5vcmVm
ZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vMC4wLjAuMDo2NTIwPC9hPiAmbHQ7PGEgaHJl
Zj0iaHR0cDovLzAuMC4wLjA6NjUyMCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+
aHR0cDovLzAuMC4wLjA6NjUyMDwvYT4mZ3Q7Jmd0OyYjMzk7IG5vdCBmb3VuZDxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqB0cmFuc3BvcnQgbWVzc2FnZSBmYWlsZWQsIHJlc3Bv
bnNlIGJvZHk6IGRldmljZTxicj4NCiZndDvCoCDCoCDCoCYjMzk7PGEgaHJlZj0iaHR0cDovLzAu
MC4wLjA6NjUyMCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+MC4wLjAuMDo2NTIw
PC9hPiAmbHQ7PGEgaHJlZj0iaHR0cDovLzAuMC4wLjA6NjUyMCIgcmVsPSJub3JlZmVycmVyIiB0
YXJnZXQ9Il9ibGFuayI+aHR0cDovLzAuMC4wLjA6NjUyMDwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vMC4wLjAuMDo2NTIwIiBy
ZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vMC4wLjAuMDo2NTIwPC9hPiAm
bHQ7PGEgaHJlZj0iaHR0cDovLzAuMC4wLjA6NjUyMCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9
Il9ibGFuayI+aHR0cDovLzAuMC4wLjA6NjUyMDwvYT4mZ3Q7Jmd0OyYjMzk7IG5vdCBmb3VuZDxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBpbml0OiBzdGFydGluZyBzZXJ2aWNl
ICYjMzk7YWRiZCYjMzk7Li4uPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoHBy
b3h5X2Zhc3Rib290XSBTdG9wIGV2ZW50ICgxMSkgcmVjZWl2ZWQuIFN0b3BwaW5nIHByb3h5PGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoHByb3h5X2FkYl0gU3RhcnQgZXZlbnQg
KDUpIHJlY2VpdmVkLiBTdGFydGluZyBwcm94eTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAgwqAgwqBwcm94eV9hZGJdIEZyb206IHRjcDogNjUyMDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAgwqBwcm94eV9hZGJdIFRvOiB2c29jazogMzo1NTU1IHZob3N0X3VzZXI6IGZh
bHNlPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoHRyYW5zcG9ydCBtZXNzYWdl
IGZhaWxlZCwgcmVzcG9uc2UgYm9keTogZGV2aWNlPGJyPg0KJmd0O8KgIMKgIMKgJiMzOTs8YSBo
cmVmPSJodHRwOi8vMC4wLjAuMDo2NTIwIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5r
Ij4wLjAuMC4wOjY1MjA8L2E+ICZsdDs8YSBocmVmPSJodHRwOi8vMC4wLjAuMDo2NTIwIiByZWw9
Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vMC4wLjAuMDo2NTIwPC9hPiZndDs8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly8w
LjAuMC4wOjY1MjAiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly8wLjAu
MC4wOjY1MjA8L2E+ICZsdDs8YSBocmVmPSJodHRwOi8vMC4wLjAuMDo2NTIwIiByZWw9Im5vcmVm
ZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vMC4wLjAuMDo2NTIwPC9hPiZndDsmZ3Q7JiMz
OTsgbm90IGZvdW5kPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoEkwOTAzIDEw
OjA5OjMwLjgxNjEwOCAyNzg3MzE0IEludGVsRHJtRGVjb2Rlci5jcHA6MzhdPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoEludGVsRHJtRGVjb2RlciBjcmVhdGVkIGZvciBjb250
ZXh0IDI8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgSTA5MDMgMTA6MDk6MzIu
NzY0ODIwIDI3ODczMTYgSW50ZWxEcm1EZWNvZGVyLmNwcDozOF08YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgSW50ZWxEcm1EZWNvZGVyIGNyZWF0ZWQgZm9yIGNvbnRleHQgNzxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBWSVJUVUFMX0RFVklDRV9ESVNQTEFZ
X1BPV0VSX01PREVfQ0hBTkdFRDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBW
SVJUVUFMX0RFVklDRV9ESVNQTEFZX1BPV0VSX01PREVfQ0hBTkdFRDxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqBJMDkwMyAxMDoxMDoyMC45MTgwMTQgMjc4NzM1OSBJbnRlbERy
bURlY29kZXIuY3BwOjM4XTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBJbnRl
bERybURlY29kZXIgY3JlYXRlZCBmb3IgY29udGV4dCAxMTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoEkgc2VlIGEgbG90IG9mIGVycm9y
cyxidXQgaXQgc2VlbXMgY29ubmVjdGVkIDo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0Ozxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqB6aW9tYXJpb0BaMzkwLUFPUlVTLVBSTy1ERVNU
On4vU2NyaXZhbmlhJCBhZGIgZGV2aWNlczxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqBMaXN0IG9mIGRldmljZXMgYXR0YWNoZWQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyA8YSBo
cmVmPSJodHRwOi8vMC4wLjAuMDo2NTIwIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5r
Ij4wLjAuMC4wOjY1MjA8L2E+ICZsdDs8YSBocmVmPSJodHRwOi8vMC4wLjAuMDo2NTIwIiByZWw9
Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vMC4wLjAuMDo2NTIwPC9hPiZndDsg
Jmx0OzxhIGhyZWY9Imh0dHA6Ly8wLjAuMC4wOjY1MjAiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0
PSJfYmxhbmsiPmh0dHA6Ly8wLjAuMC4wOjY1MjA8L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0Ozxh
IGhyZWY9Imh0dHA6Ly8wLjAuMC4wOjY1MjAiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxh
bmsiPmh0dHA6Ly8wLjAuMC4wOjY1MjA8L2E+Jmd0OyZndDsgwqDCoMKgZGV2aWNlPGJyPg0KJmd0
O8KgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgYnV0IHNj
cmNweSBkaWRuJiMzOTt0IHdvcmsgOjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoHppb21hcmlvQFozOTAtQU9SVVMtUFJPLURFU1Q6fi9T
Y3JpdmFuaWEkIHNjcmNweTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoHNjcmNweSAyLjYuMSAmbHQ7PGEgaHJlZj0iaHR0cHM6Ly9naXRo
dWIuY29tL0dlbnltb2JpbGUvc2NyY3B5IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5r
Ij5odHRwczovL2dpdGh1Yi5jb20vR2VueW1vYmlsZS9zY3JjcHk8L2E+PGJyPg0KJmd0O8KgIMKg
IMKgJmx0OzxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS9HZW55bW9iaWxlL3NjcmNweSIgcmVs
PSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9naXRodWIuY29tL0dlbnltb2Jp
bGUvc2NyY3B5PC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgJmx0
OzxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS9HZW55bW9iaWxlL3NjcmNweSIgcmVsPSJub3Jl
ZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9naXRodWIuY29tL0dlbnltb2JpbGUvc2Ny
Y3B5PC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20v
R2VueW1vYmlsZS9zY3JjcHkiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBz
Oi8vZ2l0aHViLmNvbS9HZW55bW9iaWxlL3NjcmNweTwvYT4mZ3Q7Jmd0OyZndDs8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgSU5GTzogQURCIGRldmljZSBmb3VuZDo8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgSU5GTzogwqDCoMKgwqAtLSZndDsgKHRjcGlw
KSA8YSBocmVmPSJodHRwOi8vMC4wLjAuMDo2NTIwIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0i
X2JsYW5rIj4wLjAuMC4wOjY1MjA8L2E+ICZsdDs8YSBocmVmPSJodHRwOi8vMC4wLjAuMDo2NTIw
IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vMC4wLjAuMDo2NTIwPC9h
PiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovLzAuMC4wLjA6NjUyMCIg
cmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovLzAuMC4wLjA6NjUyMDwvYT4g
Jmx0OzxhIGhyZWY9Imh0dHA6Ly8wLjAuMC4wOjY1MjAiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0
PSJfYmxhbmsiPmh0dHA6Ly8wLjAuMC4wOjY1MjA8L2E+Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgZGV2aWNlPGJyPg0KJmd0O8KgIMKgIMKgIMKgQ3V0dGxlZmlzaF9hcm02NF9waG9uZV82NF9i
aXRfb25seTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoCDCoCDCoC91c3IvbG9jYWwvc2hhcmUvc2NyY3B5L3NjcmNweS1zZXJ2ZXI6IDEgZmlsZSBw
dXNoZWQsIDA8YnI+DQomZ3Q7wqAgwqAgwqBza2lwcGVkLjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAgwqA5MC4wIE1CL3MgKDcxMTEyIGJ5dGVzIGluIDAuMDAxcyk8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgW3NlcnZlcl0gSU5GTzogRGV2aWNlOiBbR29vZ2xl
XSBnZW5lcmljIEN1dHRsZWZpc2ggYXJtNjQ8YnI+DQomZ3Q7wqAgwqAgwqBwaG9uZTxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqA2NC1iaXQgb25seSAoQW5kcm9pZCAxNCk8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgW3NlcnZlcl0gRVJST1I6IENvdWxkIG5v
dCByZWdpc3RlciByb3RhdGlvbiB3YXRjaGVyPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCDCoCDCoGphdmEubGFuZy5OdWxsUG9pbnRlckV4Y2VwdGlvbjogQXR0ZW1wdCB0byBpbnZva2Ug
dmlydHVhbDxicj4NCiZndDvCoCDCoCDCoG1ldGhvZDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAmIzM5O2phdmEubGFuZy5DbGFzcyBqYXZhLmxhbmcuT2JqZWN0LmdldENsYXNz
KCkmIzM5OyBvbiBhIG51bGw8YnI+DQomZ3Q7wqAgwqAgwqBvYmplY3Q8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgcmVmZXJlbmNlPGJyPg0KJmd0O8KgIMKgIMKgICZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgwqDCoMKgwqDCoCBhdDxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqBjb20uZ2VueW1v
YmlsZS5zY3JjcHkud3JhcHBlcnMuV2luZG93TWFuYWdlci5yZWdpc3RlclJvdGF0aW9uV2F0Y2hl
cihXaW5kb3dNYW5hZ2VyLmphdmE6MTg1KTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqDCoMKgwqDCoMKgwqBhdDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqBjb20uZ2VueW1vYmlsZS5zY3JjcHkuZGV2aWNlLkRldmljZS4mbHQ7aW5pdCZndDsoRGV2aWNl
LmphdmE6OTMpPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoMKgwqDCoMKg
wqDCoGF0PGJyPg0KJmd0O8KgIMKgIMKgY29tLmdlbnltb2JpbGUuc2NyY3B5LlNlcnZlci5zY3Jj
cHkoU2VydmVyLmphdmE6MTQ1KTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqDCoMKgwqDCoMKgwqBhdDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBjb20u
Z2VueW1vYmlsZS5zY3JjcHkuU2VydmVyLmludGVybmFsTWFpbihTZXJ2ZXIuamF2YToyOTApPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoMKgwqDCoMKgwqDCoGF0IGNvbS5n
ZW55bW9iaWxlLnNjcmNweS5TZXJ2ZXIubWFpbihTZXJ2ZXIuamF2YToyNDUpPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoMKgwqDCoMKgwqDCoGF0PGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDCoGNvbS5hbmRyb2lkLmludGVy
bmFsLm9zLlJ1bnRpbWVJbml0Lm5hdGl2ZUZpbmlzaEluaXQoTmF0aXZlIE1ldGhvZCk8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgwqDCoMKgwqDCoMKgYXQ8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKgY29tLmFuZHJvaWQu
aW50ZXJuYWwub3MuUnVudGltZUluaXQubWFpbihSdW50aW1lSW5pdC5qYXZhOjM2OSk8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBbc2Vy
dmVyXSBFUlJPUjogQ291bGQgbm90IHJlZ2lzdGVyIGRpc3BsYXkgZm9sZCBsaXN0ZW5lcjxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoGph
dmEubGFuZy5OdWxsUG9pbnRlckV4Y2VwdGlvbjogQXR0ZW1wdCB0byBpbnZva2UgdmlydHVhbDxi
cj4NCiZndDvCoCDCoCDCoG1ldGhvZDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAmIzM5O2phdmEubGFuZy5DbGFzcyBqYXZhLmxhbmcuT2JqZWN0LmdldENsYXNzKCkmIzM5OyBv
biBhIG51bGw8YnI+DQomZ3Q7wqAgwqAgwqBvYmplY3Q8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgcmVmZXJlbmNlPGJyPg0KJmd0O8KgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgwqDCoMKgwqDCoCBhdDxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqBjb20uZ2VueW1vYmlsZS5zY3Jj
cHkud3JhcHBlcnMuV2luZG93TWFuYWdlci5yZWdpc3RlckRpc3BsYXlGb2xkTGlzdGVuZXIoV2lu
ZG93TWFuYWdlci5qYXZhOjIwNik8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgwqDCoMKgwqDCoMKgYXQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgY29t
Lmdlbnltb2JpbGUuc2NyY3B5LmRldmljZS5EZXZpY2UuJmx0O2luaXQmZ3Q7KERldmljZS5qYXZh
OjEwOCk8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgwqDCoMKgwqDCoMKg
YXQ8YnI+DQomZ3Q7wqAgwqAgwqBjb20uZ2VueW1vYmlsZS5zY3JjcHkuU2VydmVyLnNjcmNweShT
ZXJ2ZXIuamF2YToxNDUpPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoMKg
wqDCoMKgwqDCoGF0PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoGNvbS5nZW55
bW9iaWxlLnNjcmNweS5TZXJ2ZXIuaW50ZXJuYWxNYWluKFNlcnZlci5qYXZhOjI5MCk8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgwqDCoMKgwqDCoMKgYXQgY29tLmdlbnlt
b2JpbGUuc2NyY3B5LlNlcnZlci5tYWluKFNlcnZlci5qYXZhOjI0NSk8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgwqDCoMKgwqDCoMKgYXQ8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKgY29tLmFuZHJvaWQuaW50ZXJuYWwu
b3MuUnVudGltZUluaXQubmF0aXZlRmluaXNoSW5pdChOYXRpdmUgTWV0aG9kKTxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqDCoMKgwqDCoMKgwqBhdDxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqBjb20uYW5kcm9pZC5pbnRl
cm5hbC5vcy5SdW50aW1lSW5pdC5tYWluKFJ1bnRpbWVJbml0LmphdmE6MzY5KTxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoFtzZXJ2ZXJd
IFdBUk46IE5vIGNsaXBib2FyZCBtYW5hZ2VyLCBjb3B5LXBhc3RlIGJldHdlZW48YnI+DQomZ3Q7
wqAgwqAgwqBkZXZpY2U8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgYW5kIGNv
bXB1dGVyIHdpbGwgbm90IHdvcms8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
W3NlcnZlcl0gRVJST1I6IEF0dGVtcHQgdG8gaW52b2tlIHZpcnR1YWwgbWV0aG9kPGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCYjMzk7YW5kcm9pZC52aWV3LklucHV0RGV2aWNl
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDCoGFu
ZHJvaWQuaGFyZHdhcmUuaW5wdXQuSW5wdXRNYW5hZ2VyR2xvYmFsLmdldElucHV0RGV2aWNlKGlu
dCkmIzM5Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBvbiBhIG51bGwgb2Jq
ZWN0IHJlZmVyZW5jZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBqYXZhLmxh
bmcuTnVsbFBvaW50ZXJFeGNlcHRpb246IEF0dGVtcHQgdG8gaW52b2tlIHZpcnR1YWw8YnI+DQom
Z3Q7wqAgwqAgwqBtZXRob2Q8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgJiMz
OTthbmRyb2lkLnZpZXcuSW5wdXREZXZpY2U8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
IMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKgYW5kcm9pZC5oYXJkd2FyZS5pbnB1dC5JbnB1dE1hbmFn
ZXJHbG9iYWwuZ2V0SW5wdXREZXZpY2UoaW50KSYjMzk7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoG9uIGEgbnVsbCBvYmplY3QgcmVmZXJlbmNlPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoCDCoMKgwqDCoMKgwqDCoGF0PGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCDCoCDCoGFuZHJvaWQudmlldy5LZXlDaGFyYWN0ZXJNYXAubG9hZChLZXlDaGFy
YWN0ZXJNYXAuamF2YTozNjQpPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oMKgwqDCoMKgwqDCoGF0PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoDxicj4NCiZn
dDvCoCDCoCDCoCDCoGNvbS5nZW55bW9iaWxlLnNjcmNweS5jb250cm9sLkNvbnRyb2xsZXIuJmx0
O2luaXQmZ3Q7KENvbnRyb2xsZXIuamF2YTo0NSk8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgIMKgIMKgIMKgwqDCoMKgwqDCoMKgYXQ8YnI+DQomZ3Q7wqAgwqAgwqBjb20uZ2VueW1vYmls
ZS5zY3JjcHkuU2VydmVyLnNjcmNweShTZXJ2ZXIuamF2YToxNTkpPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoCDCoMKgwqDCoMKgwqDCoGF0PGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCDCoCDCoGNvbS5nZW55bW9iaWxlLnNjcmNweS5TZXJ2ZXIuaW50ZXJuYWxNYWlu
KFNlcnZlci5qYXZhOjI5MCk8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
wqDCoMKgwqDCoMKgYXQgY29tLmdlbnltb2JpbGUuc2NyY3B5LlNlcnZlci5tYWluKFNlcnZlci5q
YXZhOjI0NSk8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgwqDCoMKgwqDC
oMKgYXQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgPGJyPg0KJmd0O8KgIMKgIMKg
IMKgY29tLmFuZHJvaWQuaW50ZXJuYWwub3MuUnVudGltZUluaXQubmF0aXZlRmluaXNoSW5pdChO
YXRpdmUgTWV0aG9kKTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqDCoMKg
wqDCoMKgwqBhdDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqA8YnI+DQomZ3Q7wqAg
wqAgwqAgwqBjb20uYW5kcm9pZC5pbnRlcm5hbC5vcy5SdW50aW1lSW5pdC5tYWluKFJ1bnRpbWVJ
bml0LmphdmE6MzY5KTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCDCoCDCoElORk86IFJlbmRlcmVyOiBvcGVuZ2w8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgSU5GTzogT3BlbkdMIHZlcnNpb246IDQuNi4wIE5WSURJQSA1MzUu
MTgzLjAxPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoElORk86IFRyaWxpbmVh
ciBmaWx0ZXJpbmcgZW5hYmxlZDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBX
QVJOOiBEZXZpY2UgZGlzY29ubmVjdGVkPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoEVSUk9SOiBEZW11eGVyICYjMzk7dmlkZW8mIzM5Ozogc3RyZWFtIGRpc2FibGVkIGR1ZSB0
byBjb25uZWN0aW9uPGJyPg0KJmd0O8KgIMKgIMKgZXJyb3I8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgRVJST1I6IERlbXV4ZXIgJiMzOTthdWRpbyYjMzk7OiBzdHJlYW0gZGlz
YWJsZWQgZHVlIHRvIGNvbm5lY3Rpb248YnI+DQomZ3Q7wqAgwqAgwqBlcnJvcjxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoEV2ZW4gaWYg
dGhlIHBob25lIGlzIHN0aWxsIHVwIDo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0Ozxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqB6aW9tYXJpb0BaMzkwLUFPUlVTLVBSTy1ERVNUOn4v
U2NyaXZhbmlhJCBhZGIgZGV2aWNlczxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqBMaXN0IG9mIGRldmljZXMgYXR0YWNoZWQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyA8YSBocmVm
PSJodHRwOi8vMC4wLjAuMDo2NTIwIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj4w
LjAuMC4wOjY1MjA8L2E+ICZsdDs8YSBocmVmPSJodHRwOi8vMC4wLjAuMDo2NTIwIiByZWw9Im5v
cmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vMC4wLjAuMDo2NTIwPC9hPiZndDsgJmx0
OzxhIGhyZWY9Imh0dHA6Ly8wLjAuMC4wOjY1MjAiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJf
YmxhbmsiPmh0dHA6Ly8wLjAuMC4wOjY1MjA8L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhy
ZWY9Imh0dHA6Ly8wLjAuMC4wOjY1MjAiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsi
Pmh0dHA6Ly8wLjAuMC4wOjY1MjA8L2E+Jmd0OyZndDsgwqDCoMKgZGV2aWNlPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgT24gVHVlLCBT
ZXAgMywgMjAyNCBhdCAxOjAz4oCvQU0gUGllcnJpY2sgQm91dmllcjxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0ibWFpbHRvOnBpZXJyaWNrLmJvdXZpZXJA
bGluYXJvLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZzwv
YT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpwaWVycmljay5i
b3V2aWVyQGxpbmFyby5vcmciIHRhcmdldD0iX2JsYW5rIj5waWVycmljay5ib3V2aWVyQGxpbmFy
by5vcmc8L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAmbHQ7bWFp
bHRvOjxhIGhyZWY9Im1haWx0bzpwaWVycmljay5ib3V2aWVyQGxpbmFyby5vcmciIHRhcmdldD0i
X2JsYW5rIj5waWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc8L2E+PGJyPg0KJmd0O8KgIMKgIMKg
Jmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnIiB0
YXJnZXQ9Il9ibGFuayI+cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnPC9hPiZndDsmZ3Q7Jmd0
OyB3cm90ZTo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqBUaGUgY3ZkLWhvc3QgcGFja2FnZSBpbiB0aGlzIGNhc2UgYXJlIGJp
bmFyaWVzL2xpYnJhcmllczxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqBjb21waWxlZCBmb3I8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
YWFyY2g2NCwgc28gaXQgY2FuIGJlIHVzZWQgb24gbGludXggYWFyY2g2NCBhbmQ8YnI+DQomZ3Q7
wqAgwqAgwqBiZW5lZml0IGZyb208YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKga3ZtPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoGFjY2Vs
ZXJhdGlvbi48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqBJbiB5b3VyIGNhc2UsIHJ1bm5pbmcgZW11bGF0aW9uIGZyb20gYSB4
NjQgaG9zdCwgeW91IG5lZWQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgY3ZkLWhvc3RfcGFja2FnZS14ODZfNjQudGFyLmd6IGluc3RlYWQuPGJyPg0KJmd0O8KgIMKg
IMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgT24gOS8y
LzI0IDE1OjM4LCBNYXJpbyBNYXJpZXR0byB3cm90ZTo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgICZndDsgVXBkYXRlIDo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgPGJy
Pg0KJmd0O8KgIMKgIMKgIMKgemlvbWFyaW9AWjM5MC1BT1JVUy1QUk8tREVTVDovbW50L3pyb290
LTEzMy9fT1MvQW5kcm9pZC9hb3NwXzE0L2FuZHJvaWQtaW1hZ2UvYmluJCBta2RpciB4ODZfNjQt
bGludXgtbXVzbDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0
Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqB6aW9t
YXJpb0BaMzkwLUFPUlVTLVBSTy1ERVNUOi9tbnQvenJvb3QtMTMzL19PUy9BbmRyb2lkL2Fvc3Bf
MTQvYW5kcm9pZC1pbWFnZS9iaW4kIGNwIC9tbnQvenJvb3QtMTMzL19PUy9BbmRyb2lkL2Fvc3Bf
MTQvYW5kcm9pZC1pbWFnZS9iaW4vYWFyY2g2NC1saW51eC1tdXNsL2Nyb3N2bSAvbW50L3pyb290
LTEzMy9fT1MvQW5kcm9pZC9hb3NwXzE0L2FuZHJvaWQtaW1hZ2UvYmluL3g4Nl82NC1saW51eC1t
dXNsPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDCoHppb21hcmlvQFoz
OTAtQU9SVVMtUFJPLURFU1Q6L21udC96cm9vdC0xMzMvX09TL0FuZHJvaWQvYW9zcF8xNC9hbmRy
b2lkLWltYWdlJCBIT01FPSQocHdkKSAuL2Jpbi9sYXVuY2hfY3ZkIC12bV9tYW5hZ2VyIHFlbXVf
Y2xpIC1yZXBvcnRfYW5vbnltb3VzX3VzYWdlX3N0YXRzPW4gLS1zdGFydF93ZWJydGM9ZmFsc2U8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsgVW5mb3J0dW5hdGVseSBpdCBkb2VzIG5vdCB3
b3JrIDo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsgMDktMDMgMDA6MDM6MjguOTE2IDI3
MzcyMTEgMjczNzIxMSBJIGxhdW5jaF9jdmQ6PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoG1haW4uY2M6MjM1IFVzaW5nPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCAmZ3Q7IHN5c3RlbV9pbWFnZV9kaXIgb2Y6PGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDCoD09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT08YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsgTk9USUNFOjxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyBCeSB1c2luZyB0aGlzIEFuZHJvaWQgVmlydHVh
bCBEZXZpY2UsIHlvdSBhZ3JlZSB0bzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgJmd0OyBHb29nbGUgVGVybXMgb2YgU2VydmljZTxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAoPGEgaHJlZj0iaHR0cHM6Ly9wb2xpY2llcy5nb29nbGUu
Y29tL3Rlcm1zIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL3BvbGlj
aWVzLmdvb2dsZS5jb20vdGVybXM8L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0
dHBzOi8vcG9saWNpZXMuZ29vZ2xlLmNvbS90ZXJtcyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9
Il9ibGFuayI+aHR0cHM6Ly9wb2xpY2llcy5nb29nbGUuY29tL3Rlcm1zPC9hPiZndDs8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHBzOi8v
cG9saWNpZXMuZ29vZ2xlLmNvbS90ZXJtcyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFu
ayI+aHR0cHM6Ly9wb2xpY2llcy5nb29nbGUuY29tL3Rlcm1zPC9hPjxicj4NCiZndDvCoCDCoCDC
oCZsdDs8YSBocmVmPSJodHRwczovL3BvbGljaWVzLmdvb2dsZS5jb20vdGVybXMiIHJlbD0ibm9y
ZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vcG9saWNpZXMuZ29vZ2xlLmNvbS90ZXJt
czwvYT4mZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
Jmd0OyAmbHQ7PGEgaHJlZj0iaHR0cHM6Ly9wb2xpY2llcy5nb29nbGUuY29tL3Rlcm1zIiByZWw9
Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL3BvbGljaWVzLmdvb2dsZS5jb20v
dGVybXM8L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHBzOi8vcG9saWNpZXMu
Z29vZ2xlLmNvbS90ZXJtcyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6
Ly9wb2xpY2llcy5nb29nbGUuY29tL3Rlcm1zPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHBzOi8vcG9saWNpZXMuZ29vZ2xl
LmNvbS90ZXJtcyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9wb2xp
Y2llcy5nb29nbGUuY29tL3Rlcm1zPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJo
dHRwczovL3BvbGljaWVzLmdvb2dsZS5jb20vdGVybXMiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0
PSJfYmxhbmsiPmh0dHBzOi8vcG9saWNpZXMuZ29vZ2xlLmNvbS90ZXJtczwvYT4mZ3Q7Jmd0OyZn
dDspLjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyBUaGUg
R29vZ2xlIFByaXZhY3kgUG9saWN5PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCg8YSBocmVmPSJodHRwczovL3BvbGljaWVzLmdvb2dsZS5jb20vcHJpdmFjeSIgcmVs
PSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9wb2xpY2llcy5nb29nbGUuY29t
L3ByaXZhY3k8L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHBzOi8vcG9saWNp
ZXMuZ29vZ2xlLmNvbS9wcml2YWN5IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5o
dHRwczovL3BvbGljaWVzLmdvb2dsZS5jb20vcHJpdmFjeTwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwczovL3BvbGljaWVz
Lmdvb2dsZS5jb20vcHJpdmFjeSIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0
cHM6Ly9wb2xpY2llcy5nb29nbGUuY29tL3ByaXZhY3k8L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0
OzxhIGhyZWY9Imh0dHBzOi8vcG9saWNpZXMuZ29vZ2xlLmNvbS9wcml2YWN5IiByZWw9Im5vcmVm
ZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL3BvbGljaWVzLmdvb2dsZS5jb20vcHJpdmFj
eTwvYT4mZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
Jmd0OyAmbHQ7PGEgaHJlZj0iaHR0cHM6Ly9wb2xpY2llcy5nb29nbGUuY29tL3ByaXZhY3kiIHJl
bD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vcG9saWNpZXMuZ29vZ2xlLmNv
bS9wcml2YWN5PC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwczovL3BvbGlj
aWVzLmdvb2dsZS5jb20vcHJpdmFjeSIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+
aHR0cHM6Ly9wb2xpY2llcy5nb29nbGUuY29tL3ByaXZhY3k8L2E+Jmd0Ozxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cHM6Ly9wb2xpY2ll
cy5nb29nbGUuY29tL3ByaXZhY3kiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0
dHBzOi8vcG9saWNpZXMuZ29vZ2xlLmNvbS9wcml2YWN5PC9hPjxicj4NCiZndDvCoCDCoCDCoCZs
dDs8YSBocmVmPSJodHRwczovL3BvbGljaWVzLmdvb2dsZS5jb20vcHJpdmFjeSIgcmVsPSJub3Jl
ZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9wb2xpY2llcy5nb29nbGUuY29tL3ByaXZh
Y3k8L2E+Jmd0OyZndDsmZ3Q7KTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgJmd0OyBkZXNjcmliZXMgaG93IEdvb2dsZSBoYW5kbGVzIGluZm9ybWF0aW9uIGdlbmVy
YXRlZDxicj4NCiZndDvCoCDCoCDCoGFzIHlvdSB1c2U8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgICZndDsgR29vZ2xlIFNlcnZpY2VzLjxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqA9PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7IFJlYWRpbmcgLS1jb25maWcgb3B0aW9uIGZyb206
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDCoC9tbnQv
enJvb3QtMTMzL19PUy9BbmRyb2lkL2Fvc3BfMTQvYW5kcm9pZC1pbWFnZS9hbmRyb2lkLWluZm8u
dHh0PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7IExhdW5j
aGluZyBDVkQgdXNpbmcgLS1jb25maWc9JiMzOTtwaG9uZSYjMzk7Ljxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAvbW50L3pyb290LTEzMy9fT1MvQW5k
cm9pZC9hb3NwXzE0L2FuZHJvaWQtaW1hZ2UvYmluL2FhcmNoNjQtbGludXgtZ251L2dmeHN0cmVh
bV9ncmFwaGljc19kZXRlY3RvcjogZXJyb3Igd2hpbGUgbG9hZGluZyBzaGFyZWQ8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsgbGlicmFyaWVzOiBsaWJjLnNvLjY6IGNhbm5v
dCBvcGVuIHNoYXJlZCBvYmplY3Q8YnI+DQomZ3Q7wqAgwqAgwqBmaWxlOiBObzxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqBzdWNoIGZpbGUgb3I8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsgZGlyZWN0b3J5PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7IEZhaWxlZCB0byBydW4gZ3JhcGhpY3MgZGV0ZWN0
b3IsIGJhZCByZXR1cm4gdmFsdWU6PGJyPg0KJmd0O8KgIMKgIMKgMTI3Ljxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqBBc3N1bWluZyBubzxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyBhdmFpbGFiaWxpdHkuPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7IEdQVSBhdXRvIG1vZGU6IGRpZCBu
b3QgZGV0ZWN0IHByZXJlcXVpc2l0ZXMgZm9yPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoGFjY2VsZXJhdGVkIHJlbmRlcmluZzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyBzdXBwb3J0LCBlbmFibGluZyAtLWdwdV9tb2RlPWd1
ZXN0X3N3aWZ0c2hhZGVyLjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgJmd0OyBHUFUgdmhvc3QgdXNlciBhdXRvIG1vZGU6IG5vdCBuZWVkZWQgZm9yPGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoC0tZ3B1X21vZGU9Z3Vlc3Rfc3dpZnRz
aGFkZXIuPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7IE5v
dCBlbmFibGluZyB2aG9zdCB1c2VyIGdwdS48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgICZndDsgUmVxdWVzdGVkIHJlc3VtaW5nIGEgcHJldmlvdXMgc2Vzc2lvbiAo
dGhlIGRlZmF1bHQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgYmVo
YXZpb3IpIGJ1dCB0aGU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
ICZndDsgYmFzZSBpbWFnZXMgaGF2ZSBjaGFuZ2VkIHVuZGVyIHRoZSBvdmVybGF5LCBtYWtpbmcg
dGhlPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoG92ZXJsYXk8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsgaW5jb21wYXRpYmxl
LiBXaXBpbmcgdGhlIG92ZXJsYXkgZmlsZXMuPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCAmZ3Q7IFBhdGggZm9yIGluc3RhbmNlIFVEUzogL3RtcC9jZl9hdmRfMTAwMDxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyBUaGUgZm9sbG93aW5nIGxpbmVzIGNvbnRh
aW4gdXNlZnVsIGRlYnVnZ2luZzxicj4NCiZndDvCoCDCoCDCoGluZm9ybWF0aW9uOjxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgU2VyaWFsIGNvbnNv
bGUgaXMgZGlzYWJsZWQ7IHVzZSAtY29uc29sZT10cnVlIHRvPGJyPg0KJmd0O8KgIMKgIMKgZW5h
YmxlIGl0Ljxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8Kg
IMKgTG9nY2F0IG91dHB1dDo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgPGJyPg0KJmd0
O8KgIMKgIMKgIMKgL21udC96cm9vdC0xMzMvX09TL0FuZHJvaWQvYW9zcF8xNC9hbmRyb2lkLWlt
YWdlL2N1dHRsZWZpc2gvaW5zdGFuY2VzL2N2ZC0xL2xvZ3MvbG9nY2F0PGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqBLZXJuZWwgbG9nOjxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAvbW50L3pyb290LTEz
My9fT1MvQW5kcm9pZC9hb3NwXzE0L2FuZHJvaWQtaW1hZ2UvY3V0dGxlZmlzaC9pbnN0YW5jZXMv
Y3ZkLTEva2VybmVsLmxvZzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgJmd0O8KgIMKgTGF1bmNoZXIgbG9nOjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqA8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAvbW50L3pyb290LTEzMy9fT1MvQW5kcm9pZC9hb3NwXzE0L2Fu
ZHJvaWQtaW1hZ2UvY3V0dGxlZmlzaC9pbnN0YW5jZXMvY3ZkLTEvbG9ncy9sYXVuY2hlci5sb2c8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoEluc3Rh
bmNlIGNvbmZpZ3VyYXRpb246PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoDxicj4NCiZn
dDvCoCDCoCDCoCDCoC9tbnQvenJvb3QtMTMzL19PUy9BbmRyb2lkL2Fvc3BfMTQvYW5kcm9pZC1p
bWFnZS9jdXR0bGVmaXNoL2luc3RhbmNlcy9jdmQtMS9jdXR0bGVmaXNoX2NvbmZpZy5qc29uPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqBMYXVuY2hl
ciBCdWlsZCBJRDogMTIzMDkyOTY8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgICZndDsgNC4gbWFpbi5jYzoyMzJ8IFJ1bkN2ZE1haW58PGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7IDMuIG1haW4uY2M6MTA0fCBSdW58PGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7IDIuIHNlcnZlcl9sb29w
X2ltcGwuY3BwOjg5fCBSdW58PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCAmZ3Q7IDEuIHFlbXVfbWFuYWdlci5jcHA6MjQ3fCBTdGFydENvbW1hbmRzfDxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyB8PGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDCoGRldmljZS9nb29n
bGUvY3V0dGxlZmlzaC9ob3N0L2xpYnMvdm1fbWFuYWdlci9xZW11X21hbmFnZXIuY3BwOjk3PGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7IHwgUmVzdWx0Jmx0
O3N0ZDo6cGFpciZsdDtpbnQsIGludCZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoGN1dHRsZWZpc2g6OnZtX21hbmFnZXI6Oihhbm9ueW1vdXM8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsgbmFtZXNwYWNlKTo6R2V0
UWVtdVZlcnNpb24oY29uc3Qgc3RkOjpzdHJpbmcgJmFtcDspPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7IHYgQ0ZfRVhQRUNUKHFlbXVfdmVyc2lvbl9yZXQg
PT0gMCk8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKg
L21udC96cm9vdC0xMzMvX09TL0FuZHJvaWQvYW9zcF8xNC9hbmRyb2lkLWltYWdlL2Jpbi9hYXJj
aDY0LWxpbnV4LWdudS9xZW11L3FlbXUtc3lzdGVtLWFhcmNoNjQgLXZlcnNpb24gcmV0dXJuZWQg
dW5leHBlY3RlZCByZXNwb25zZSAuPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmZ3Q7IFN0ZGVyciB3YXM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgPGJy
Pg0KJmd0O8KgIMKgIMKgIMKgL21udC96cm9vdC0xMzMvX09TL0FuZHJvaWQvYW9zcF8xNC9hbmRy
b2lkLWltYWdlL2Jpbi9hYXJjaDY0LWxpbnV4LWdudS9xZW11L3FlbXUtc3lzdGVtLWFhcmNoNjQ6
IGVycm9yIHdoaWxlIGxvYWRpbmcgc2hhcmVkPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCAmZ3Q7IGxpYnJhcmllczogbGlibmN1cnNlc3cuc28uNjogY2Fubm90IG9wZW4gc2hhcmVk
IG9iamVjdDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqBmaWxlOiBO
byBzdWNoPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7IGZp
bGUgb3IgZGlyZWN0b3J5PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7IE9u
IE1vbiwgU2VwIDIsIDIwMjQgYXQgMTE6MzDigK9QTSBNYXJpbyBNYXJpZXR0bzxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0ibWFpbHRvOm1hcmll
dHRvMjAwOEBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5tYXJpZXR0bzIwMDhAZ21haWwuY29t
PC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOm1hcmlldHRv
MjAwOEBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5tYXJpZXR0bzIwMDhAZ21haWwuY29tPC9h
PiZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86bWFyaWV0dG8yMDA4QGdtYWlsLmNvbSIg
dGFyZ2V0PSJfYmxhbmsiPm1hcmlldHRvMjAwOEBnbWFpbC5jb208L2E+PGJyPg0KJmd0O8KgIMKg
IMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86bWFyaWV0dG8yMDA4QGdtYWlsLmNvbSIgdGFy
Z2V0PSJfYmxhbmsiPm1hcmlldHRvMjAwOEBnbWFpbC5jb208L2E+Jmd0OyZndDs8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsgJmx0O21haWx0bzo8YSBocmVm
PSJtYWlsdG86bWFyaWV0dG8yMDA4QGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPm1hcmlldHRv
MjAwOEBnbWFpbC5jb208L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJt
YWlsdG86bWFyaWV0dG8yMDA4QGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPm1hcmlldHRvMjAw
OEBnbWFpbC5jb208L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzptYXJpZXR0bzIwMDhAZ21haWwuY29tIiB0
YXJnZXQ9Il9ibGFuayI+bWFyaWV0dG8yMDA4QGdtYWlsLmNvbTwvYT48YnI+DQomZ3Q7wqAgwqAg
wqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzptYXJpZXR0bzIwMDhAZ21haWwuY29tIiB0YXJn
ZXQ9Il9ibGFuayI+bWFyaWV0dG8yMDA4QGdtYWlsLmNvbTwvYT4mZ3Q7Jmd0OyZndDsmZ3Q7IHdy
b3RlOjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgU29tZXRo
aW5nIGlzIG5vdCByaWdodCA6PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoDxicj4NCiZndDvCoCDC
oCDCoCDCoHppb21hcmlvQFozOTAtQU9SVVMtUFJPLURFU1Q6L21udC96cm9vdC0xMzMvX09TL0Fu
ZHJvaWQvYW9zcF8xNC9hbmRyb2lkLWltYWdlJCB1bnppcCAuLi9hb3NwX2NmXyouemlwPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqBBcmNoaXZlOjxicj4NCiZn
dDvCoCDCoCDCoCDCoC4uL2Fvc3BfY2ZfYXJtNjRfb25seV9waG9uZS1pbWctMTIzMDkyOTYuemlw
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqBpbmZsYXRpbmc6IGFuZHJvaWQtaW5mby50eHQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoGluZmxhdGluZzogZmFzdGJvb3QtaW5mby50
eHQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDC
oCDCoGluZmxhdGluZzoga2VybmVsXzE2azxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgaW5mbGF0aW5nOiByYW1kaXNrXzE2ay5pbWc8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoGlu
ZmxhdGluZzogYm9vdC5pbWc8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDvCoCDCoCDCoCDCoGluZmxhdGluZzogYm9vdF8xNmsuaW1nPGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqBpbmZsYXRpbmc6IGJv
b3Rsb2FkZXI8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvC
oCDCoCDCoCDCoGluZmxhdGluZzogaW5pdF9ib290LmltZzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgaW5mbGF0aW5nOiB1c2VyZGF0YS5p
bWc8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDC
oCDCoGluZmxhdGluZzogdmJtZXRhLmltZzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgaW5mbGF0aW5nOiB2Ym1ldGFfc3lzdGVtLmltZzxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
aW5mbGF0aW5nOiB2Ym1ldGFfc3lzdGVtX2Rsa20uaW1nPGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqBpbmZsYXRpbmc6IHZibWV0YV92ZW5k
b3JfZGxrbS5pbWc8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZn
dDvCoCDCoCDCoCDCoGluZmxhdGluZzogdmVuZG9yX2Jvb3QuaW1nPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqBpbmZsYXRpbmc6IHN1cGVy
LmltZzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqB6aW9tYXJp
b0BaMzkwLUFPUlVTLVBSTy1ERVNUOi9tbnQvenJvb3QtMTMzL19PUy9BbmRyb2lkL2Fvc3BfMTQv
YW5kcm9pZC1pbWFnZSQgdGFyIHh6dmYgLi4vY3ZkLWhvc3RfcGFja2FnZS50YXIuZ3o8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vPGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0Lzxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9saWI2NC88YSBocmVmPSJt
YWlsdG86YW5kcm9pZC5oYXJkd2FyZS5rZXltYXN0ZXJAMy4wLnNvIiB0YXJnZXQ9Il9ibGFuayI+
YW5kcm9pZC5oYXJkd2FyZS5rZXltYXN0ZXJAMy4wLnNvPC9hPjxicj4NCiZndDvCoCDCoCDCoCZs
dDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmFuZHJvaWQuaGFyZHdhcmUua2V5bWFzdGVyQDMuMC5z
byIgdGFyZ2V0PSJfYmxhbmsiPmFuZHJvaWQuaGFyZHdhcmUua2V5bWFzdGVyQDMuMC5zbzwvYT4m
Z3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDttYWlsdG86
PGEgaHJlZj0ibWFpbHRvOmFuZHJvaWQuaGFyZHdhcmUua2V5bWFzdGVyQDMuMC5zbyIgdGFyZ2V0
PSJfYmxhbmsiPmFuZHJvaWQuaGFyZHdhcmUua2V5bWFzdGVyQDMuMC5zbzwvYT48YnI+DQomZ3Q7
wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzphbmRyb2lkLmhhcmR3YXJlLmtleW1h
c3RlckAzLjAuc28iIHRhcmdldD0iX2JsYW5rIj5hbmRyb2lkLmhhcmR3YXJlLmtleW1hc3RlckAz
LjAuc288L2E+Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmFuZHJvaWQuaGFyZHdh
cmUua2V5bWFzdGVyQDMuMC5zbyIgdGFyZ2V0PSJfYmxhbmsiPmFuZHJvaWQuaGFyZHdhcmUua2V5
bWFzdGVyQDMuMC5zbzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1h
aWx0bzphbmRyb2lkLmhhcmR3YXJlLmtleW1hc3RlckAzLjAuc28iIHRhcmdldD0iX2JsYW5rIj5h
bmRyb2lkLmhhcmR3YXJlLmtleW1hc3RlckAzLjAuc288L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzphbmRy
b2lkLmhhcmR3YXJlLmtleW1hc3RlckAzLjAuc28iIHRhcmdldD0iX2JsYW5rIj5hbmRyb2lkLmhh
cmR3YXJlLmtleW1hc3RlckAzLjAuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8
YSBocmVmPSJtYWlsdG86YW5kcm9pZC5oYXJkd2FyZS5rZXltYXN0ZXJAMy4wLnNvIiB0YXJnZXQ9
Il9ibGFuayI+YW5kcm9pZC5oYXJkd2FyZS5rZXltYXN0ZXJAMy4wLnNvPC9hPiZndDsmZ3Q7Jmd0
Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKg
Li9saWI2NC88YSBocmVmPSJodHRwOi8vbGliY2lib3JpdW1faW8uZHlsaWIuc28iIHJlbD0ibm9y
ZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmxpYmNpYm9yaXVtX2lvLmR5bGliLnNvPC9hPjxicj4N
CiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGliY2lib3JpdW1faW8uZHlsaWIuc28i
IHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJjaWJvcml1bV9pby5k
eWxpYi5zbzwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCZsdDs8YSBocmVmPSJodHRwOi8vbGliY2lib3JpdW1faW8uZHlsaWIuc28iIHJlbD0ibm9yZWZl
cnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJjaWJvcml1bV9pby5keWxpYi5zbzwvYT48
YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmNpYm9yaXVtX2lvLmR5bGli
LnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGliY2lib3JpdW1f
aW8uZHlsaWIuc288L2E+Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJjaWJvcml1bV9pby5keWxpYi5zbyIgcmVs
PSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmNpYm9yaXVtX2lvLmR5bGli
LnNvPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGliY2lib3JpdW1f
aW8uZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJj
aWJvcml1bV9pby5keWxpYi5zbzwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGliY2lib3JpdW1faW8uZHlsaWIuc28i
IHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJjaWJvcml1bV9pby5k
eWxpYi5zbzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmNpYm9y
aXVtX2lvLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8v
bGliY2lib3JpdW1faW8uZHlsaWIuc288L2E+Jmd0OyZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0L2xpYmpwZWcuc288
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4v
bGliNjQvY3V0dGxlZmlzaF9uZXQuc288YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvbGliYmFzZS5zbzxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9saWI2NC88YSBocmVmPSJo
dHRwOi8vdnVsa2FuLnBhc3RlbC5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+
dnVsa2FuLnBhc3RlbC5zbzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDov
L3Z1bGthbi5wYXN0ZWwuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6
Ly92dWxrYW4ucGFzdGVsLnNvPC9hPiZndDsgJmx0OzxhIGhyZWY9Imh0dHA6Ly92dWxrYW4ucGFz
dGVsLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vdnVsa2FuLnBh
c3RlbC5zbzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL3Z1bGthbi5w
YXN0ZWwuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly92dWxrYW4u
cGFzdGVsLnNvPC9hPiZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vdnVsa2FuLnBhc3RlbC5zbyIgcmVsPSJub3JlZmVy
cmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL3Z1bGthbi5wYXN0ZWwuc288L2E+ICZsdDs8YSBo
cmVmPSJodHRwOi8vdnVsa2FuLnBhc3RlbC5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9i
bGFuayI+aHR0cDovL3Z1bGthbi5wYXN0ZWwuc288L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCZs
dDs8YSBocmVmPSJodHRwOi8vdnVsa2FuLnBhc3RlbC5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJn
ZXQ9Il9ibGFuayI+aHR0cDovL3Z1bGthbi5wYXN0ZWwuc288L2E+ICZsdDs8YSBocmVmPSJodHRw
Oi8vdnVsa2FuLnBhc3RlbC5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0
cDovL3Z1bGthbi5wYXN0ZWwuc288L2E+Jmd0OyZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0L2xpYmN1dHRsZWZpc2hf
aG9zdF9jb25maWcuc288YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
ICZndDvCoCDCoCDCoC4vbGliNjQvPGEgaHJlZj0iaHR0cDovL2xpYmZsYWdzZXQuZHlsaWIuc28i
IHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmxpYmZsYWdzZXQuZHlsaWIuc288L2E+
PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJmbGFnc2V0LmR5bGliLnNv
IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGliZmxhZ3NldC5keWxp
Yi5zbzwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZs
dDs8YSBocmVmPSJodHRwOi8vbGliZmxhZ3NldC5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0
YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmZsYWdzZXQuZHlsaWIuc288L2E+PGJyPg0KJmd0O8Kg
IMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJmbGFnc2V0LmR5bGliLnNvIiByZWw9Im5vcmVm
ZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGliZmxhZ3NldC5keWxpYi5zbzwvYT4mZ3Q7
Jmd0OyAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmZsYWdzZXQuZHlsaWIuc28iIHJlbD0ibm9yZWZl
cnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJmbGFnc2V0LmR5bGliLnNvPC9hPjxicj4N
CiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGliZmxhZ3NldC5keWxpYi5zbyIgcmVs
PSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmZsYWdzZXQuZHlsaWIuc288
L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7PGEg
aHJlZj0iaHR0cDovL2xpYmZsYWdzZXQuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0
PSJfYmxhbmsiPmh0dHA6Ly9saWJmbGFnc2V0LmR5bGliLnNvPC9hPjxicj4NCiZndDvCoCDCoCDC
oCZsdDs8YSBocmVmPSJodHRwOi8vbGliZmxhZ3NldC5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVy
IiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmZsYWdzZXQuZHlsaWIuc288L2E+Jmd0OyZndDsm
Z3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAuL2xpYjY0LzxhIGhyZWY9Imh0dHA6Ly9saWJrbXJfY29tbW9uLmR5bGliLnNvIiByZWw9Im5v
cmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5saWJrbXJfY29tbW9uLmR5bGliLnNvPC9hPjxicj4N
CiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGlia21yX2NvbW1vbi5keWxpYi5zbyIg
cmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmttcl9jb21tb24uZHls
aWIuc288L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAm
bHQ7PGEgaHJlZj0iaHR0cDovL2xpYmttcl9jb21tb24uZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJl
ciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJrbXJfY29tbW9uLmR5bGliLnNvPC9hPjxicj4N
CiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGlia21yX2NvbW1vbi5keWxpYi5zbyIg
cmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmttcl9jb21tb24uZHls
aWIuc288L2E+Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJrbXJfY29tbW9uLmR5bGliLnNvIiByZWw9Im5vcmVm
ZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlia21yX2NvbW1vbi5keWxpYi5zbzwvYT48
YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmttcl9jb21tb24uZHlsaWIu
c28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJrbXJfY29tbW9u
LmR5bGliLnNvPC9hPiZndDsgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJrbXJfY29tbW9uLmR5bGli
LnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlia21yX2NvbW1v
bi5keWxpYi5zbzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmtt
cl9jb21tb24uZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6
Ly9saWJrbXJfY29tbW9uLmR5bGliLnNvPC9hPiZndDsmZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9saWI2NC88YSBocmVmPSJo
dHRwOi8vbGlicGtjczEuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsi
PmxpYnBrY3MxLmR5bGliLnNvPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRw
Oi8vbGlicGtjczEuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0
dHA6Ly9saWJwa2NzMS5keWxpYi5zbzwvYT4mZ3Q7ICZsdDs8YSBocmVmPSJodHRwOi8vbGlicGtj
czEuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJw
a2NzMS5keWxpYi5zbzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xp
YnBrY3MxLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8v
bGlicGtjczEuZHlsaWIuc288L2E+Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJwa2NzMS5keWxpYi5zbyIgcmVs
PSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYnBrY3MxLmR5bGliLnNvPC9h
PiAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYnBrY3MxLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIi
IHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlicGtjczEuZHlsaWIuc288L2E+Jmd0Ozxicj4NCiZn
dDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGlicGtjczEuZHlsaWIuc28iIHJlbD0ibm9y
ZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJwa2NzMS5keWxpYi5zbzwvYT4gJmx0
OzxhIGhyZWY9Imh0dHA6Ly9saWJwa2NzMS5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJn
ZXQ9Il9ibGFuayI+aHR0cDovL2xpYnBrY3MxLmR5bGliLnNvPC9hPiZndDsmZ3Q7Jmd0Ozxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9saWI2
NC9saWJpY3VpMThuLWhvc3Quc288YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvbGlid2F5bGFuZF9jbGllbnQuc288YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvbGli
dW53aW5kc3RhY2suc288YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
ICZndDvCoCDCoCDCoC4vbGliNjQvPGEgaHJlZj0iaHR0cDovL2xpYmttcl90YS5keWxpYi5zbyIg
cmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+bGlia21yX3RhLmR5bGliLnNvPC9hPjxi
cj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGlia21yX3RhLmR5bGliLnNvIiBy
ZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlia21yX3RhLmR5bGliLnNv
PC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmx0Ozxh
IGhyZWY9Imh0dHA6Ly9saWJrbXJfdGEuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0
PSJfYmxhbmsiPmh0dHA6Ly9saWJrbXJfdGEuZHlsaWIuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKg
Jmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJrbXJfdGEuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIg
dGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJrbXJfdGEuZHlsaWIuc288L2E+Jmd0OyZndDsgJmx0
OzxhIGhyZWY9Imh0dHA6Ly9saWJrbXJfdGEuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFy
Z2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJrbXJfdGEuZHlsaWIuc288L2E+PGJyPg0KJmd0O8KgIMKg
IMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJrbXJfdGEuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJl
ciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJrbXJfdGEuZHlsaWIuc288L2E+Jmd0Ozxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDov
L2xpYmttcl90YS5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0
cDovL2xpYmttcl90YS5keWxpYi5zbzwvYT4gJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJrbXJfdGEu
ZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJrbXJf
dGEuZHlsaWIuc288L2E+Jmd0OyZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0LzxhIGhyZWY9Imh0dHA6Ly9saWJjb3Nl
dC5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+bGliY29zZXQuZHls
aWIuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJjb3NldC5k
eWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmNvc2V0
LmR5bGliLnNvPC9hPiZndDsgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJjb3NldC5keWxpYi5zbyIg
cmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmNvc2V0LmR5bGliLnNv
PC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGliY29zZXQuZHlsaWIu
c28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJjb3NldC5keWxp
Yi5zbzwvYT4mZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmNvc2V0LmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIi
IHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGliY29zZXQuZHlsaWIuc288L2E+ICZsdDs8YSBocmVm
PSJodHRwOi8vbGliY29zZXQuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxh
bmsiPmh0dHA6Ly9saWJjb3NldC5keWxpYi5zbzwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmx0
OzxhIGhyZWY9Imh0dHA6Ly9saWJjb3NldC5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJn
ZXQ9Il9ibGFuayI+aHR0cDovL2xpYmNvc2V0LmR5bGliLnNvPC9hPiAmbHQ7PGEgaHJlZj0iaHR0
cDovL2xpYmNvc2V0LmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5o
dHRwOi8vbGliY29zZXQuZHlsaWIuc288L2E+Jmd0OyZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0L2xpYmNwcGJvci5z
bzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKg
Li9saWI2NC9saWJnYXRla2VlcGVyLnNvPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0L2xpYnl1di5zbzxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9saWI2NC9saWJncnBjKysu
c288YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDC
oC4vbGliNjQvbGlia21yX2NmX2ZmaS5zbzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9saWI2NC9saWJjcHBjb3NlX3JrcC5zbzxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9saWI2NC9s
aWJjdXR0bGVmaXNoX3RyYW5zcG9ydC5zbzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9saWI2NC9saWJsem1hLnNvPGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0LzxhIGhyZWY9
Imh0dHA6Ly9saWJjaWJvcml1bV9sbC5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9
Il9ibGFuayI+bGliY2lib3JpdW1fbGwuZHlsaWIuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0
OzxhIGhyZWY9Imh0dHA6Ly9saWJjaWJvcml1bV9sbC5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVy
IiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmNpYm9yaXVtX2xsLmR5bGliLnNvPC9hPiZndDs8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmx0OzxhIGhyZWY9Imh0
dHA6Ly9saWJjaWJvcml1bV9sbC5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9i
bGFuayI+aHR0cDovL2xpYmNpYm9yaXVtX2xsLmR5bGliLnNvPC9hPjxicj4NCiZndDvCoCDCoCDC
oCZsdDs8YSBocmVmPSJodHRwOi8vbGliY2lib3JpdW1fbGwuZHlsaWIuc28iIHJlbD0ibm9yZWZl
cnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJjaWJvcml1bV9sbC5keWxpYi5zbzwvYT4m
Z3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7PGEg
aHJlZj0iaHR0cDovL2xpYmNpYm9yaXVtX2xsLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRh
cmdldD0iX2JsYW5rIj5odHRwOi8vbGliY2lib3JpdW1fbGwuZHlsaWIuc288L2E+PGJyPg0KJmd0
O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJjaWJvcml1bV9sbC5keWxpYi5zbyIgcmVs
PSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmNpYm9yaXVtX2xsLmR5bGli
LnNvPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmx0
OzxhIGhyZWY9Imh0dHA6Ly9saWJjaWJvcml1bV9sbC5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVy
IiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmNpYm9yaXVtX2xsLmR5bGliLnNvPC9hPjxicj4N
CiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGliY2lib3JpdW1fbGwuZHlsaWIuc28i
IHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJjaWJvcml1bV9sbC5k
eWxpYi5zbzwvYT4mZ3Q7Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvbGliY3V0dGxlZmlzaF9hbGxvY2RfdXRpbHMu
c288YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDC
oC4vbGliNjQvbGliZ2ZsYWdzLnNvPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0LzxhIGhyZWY9Im1haWx0bzphbmRyb2lkLmhhcmR3
YXJlLmtleW1hc3RlckA0LjAuc28iIHRhcmdldD0iX2JsYW5rIj5hbmRyb2lkLmhhcmR3YXJlLmtl
eW1hc3RlckA0LjAuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJt
YWlsdG86YW5kcm9pZC5oYXJkd2FyZS5rZXltYXN0ZXJANC4wLnNvIiB0YXJnZXQ9Il9ibGFuayI+
YW5kcm9pZC5oYXJkd2FyZS5rZXltYXN0ZXJANC4wLnNvPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86YW5k
cm9pZC5oYXJkd2FyZS5rZXltYXN0ZXJANC4wLnNvIiB0YXJnZXQ9Il9ibGFuayI+YW5kcm9pZC5o
YXJkd2FyZS5rZXltYXN0ZXJANC4wLnNvPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86
PGEgaHJlZj0ibWFpbHRvOmFuZHJvaWQuaGFyZHdhcmUua2V5bWFzdGVyQDQuMC5zbyIgdGFyZ2V0
PSJfYmxhbmsiPmFuZHJvaWQuaGFyZHdhcmUua2V5bWFzdGVyQDQuMC5zbzwvYT4mZ3Q7Jmd0Ozxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgJmx0
O21haWx0bzo8YSBocmVmPSJtYWlsdG86YW5kcm9pZC5oYXJkd2FyZS5rZXltYXN0ZXJANC4wLnNv
IiB0YXJnZXQ9Il9ibGFuayI+YW5kcm9pZC5oYXJkd2FyZS5rZXltYXN0ZXJANC4wLnNvPC9hPjxi
cj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmFuZHJvaWQuaGFyZHdh
cmUua2V5bWFzdGVyQDQuMC5zbyIgdGFyZ2V0PSJfYmxhbmsiPmFuZHJvaWQuaGFyZHdhcmUua2V5
bWFzdGVyQDQuMC5zbzwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmFuZHJvaWQuaGFyZHdhcmUua2V5bWFz
dGVyQDQuMC5zbyIgdGFyZ2V0PSJfYmxhbmsiPmFuZHJvaWQuaGFyZHdhcmUua2V5bWFzdGVyQDQu
MC5zbzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzphbmRy
b2lkLmhhcmR3YXJlLmtleW1hc3RlckA0LjAuc28iIHRhcmdldD0iX2JsYW5rIj5hbmRyb2lkLmhh
cmR3YXJlLmtleW1hc3RlckA0LjAuc288L2E+Jmd0OyZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0LzxhIGhyZWY9Imh0
dHA6Ly9saWJjZmdfaWYuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsi
PmxpYmNmZ19pZi5keWxpYi5zbzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0
cDovL2xpYmNmZ19pZi5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+
aHR0cDovL2xpYmNmZ19pZi5keWxpYi5zbzwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGliY2ZnX2lmLmR5bGliLnNv
IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGliY2ZnX2lmLmR5bGli
LnNvPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGliY2ZnX2lmLmR5
bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGliY2ZnX2lm
LmR5bGliLnNvPC9hPiZndDsmZ3Q7ICZsdDs8YSBocmVmPSJodHRwOi8vbGliY2ZnX2lmLmR5bGli
LnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGliY2ZnX2lmLmR5
bGliLnNvPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGliY2ZnX2lm
LmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGliY2Zn
X2lmLmR5bGliLnNvPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJjZmdfaWYuZHlsaWIuc28iIHJlbD0ibm9yZWZl
cnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJjZmdfaWYuZHlsaWIuc288L2E+ICZsdDs8
YSBocmVmPSJodHRwOi8vbGliY2ZnX2lmLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdl
dD0iX2JsYW5rIj5odHRwOi8vbGliY2ZnX2lmLmR5bGliLnNvPC9hPiZndDsmZ3Q7Jmd0Ozxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9saWI2
NC88YSBocmVmPSJodHRwOi8vbGlic3BraS5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJn
ZXQ9Il9ibGFuayI+bGlic3BraS5keWxpYi5zbzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEg
aHJlZj0iaHR0cDovL2xpYnNwa2kuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJf
YmxhbmsiPmh0dHA6Ly9saWJzcGtpLmR5bGliLnNvPC9hPiZndDsgJmx0OzxhIGhyZWY9Imh0dHA6
Ly9saWJzcGtpLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRw
Oi8vbGlic3BraS5keWxpYi5zbzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0
cDovL2xpYnNwa2kuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0
dHA6Ly9saWJzcGtpLmR5bGliLnNvPC9hPiZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGlic3BraS5keWxpYi5zbyIg
cmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYnNwa2kuZHlsaWIuc288
L2E+ICZsdDs8YSBocmVmPSJodHRwOi8vbGlic3BraS5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVy
IiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYnNwa2kuZHlsaWIuc288L2E+Jmd0Ozxicj4NCiZn
dDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGlic3BraS5keWxpYi5zbyIgcmVsPSJub3Jl
ZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYnNwa2kuZHlsaWIuc288L2E+ICZsdDs8
YSBocmVmPSJodHRwOi8vbGlic3BraS5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9
Il9ibGFuayI+aHR0cDovL2xpYnNwa2kuZHlsaWIuc288L2E+Jmd0OyZndDsmZ3Q7PGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0Lzxh
IGhyZWY9Imh0dHA6Ly9saWJ6ZXJvaXplLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdl
dD0iX2JsYW5rIj5saWJ6ZXJvaXplLmR5bGliLnNvPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDs8
YSBocmVmPSJodHRwOi8vbGliemVyb2l6ZS5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJn
ZXQ9Il9ibGFuayI+aHR0cDovL2xpYnplcm9pemUuZHlsaWIuc288L2E+Jmd0Ozxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYnpl
cm9pemUuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9s
aWJ6ZXJvaXplLmR5bGliLnNvPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRw
Oi8vbGliemVyb2l6ZS5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+
aHR0cDovL2xpYnplcm9pemUuZHlsaWIuc288L2E+Jmd0OyZndDsgJmx0OzxhIGhyZWY9Imh0dHA6
Ly9saWJ6ZXJvaXplLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5o
dHRwOi8vbGliemVyb2l6ZS5keWxpYi5zbzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJl
Zj0iaHR0cDovL2xpYnplcm9pemUuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJf
YmxhbmsiPmh0dHA6Ly9saWJ6ZXJvaXplLmR5bGliLnNvPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJ6ZXJvaXpl
LmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGliemVy
b2l6ZS5keWxpYi5zbzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xp
Ynplcm9pemUuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6
Ly9saWJ6ZXJvaXplLmR5bGliLnNvPC9hPiZndDsmZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9saWI2NC9saWJjZ3JvdXByYy5z
bzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKg
Li9saWI2NC9saWJwcm90b2J1Zi1jcHAtZnVsbC5zbzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9saWI2NC9saWJjdXRpbHMuc288YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQv
bGlic3FsaXRlLnNvPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAuL2xpYjY0L2xpYmN1dHRsZWZpc2hfdXRpbHNfcmVzdWx0LnNvPGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0L2xp
YmJpbmRlcl9uZGsuc288YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
ICZndDvCoCDCoCDCoC4vbGliNjQvbGliZXh0Ml91dWlkLWhvc3Quc288YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvPGEgaHJlZj0i
aHR0cDovL2xpYmhleC5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+
bGliaGV4LmR5bGliLnNvPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8v
bGliaGV4LmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8v
bGliaGV4LmR5bGliLnNvPC9hPiZndDsgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJoZXguZHlsaWIu
c28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJoZXguZHlsaWIu
c288L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJoZXguZHlsaWIu
c28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJoZXguZHlsaWIu
c288L2E+Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
Jmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJoZXguZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFy
Z2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJoZXguZHlsaWIuc288L2E+ICZsdDs8YSBocmVmPSJodHRw
Oi8vbGliaGV4LmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRw
Oi8vbGliaGV4LmR5bGliLnNvPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0i
aHR0cDovL2xpYmhleC5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+
aHR0cDovL2xpYmhleC5keWxpYi5zbzwvYT4gJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJoZXguZHls
aWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJoZXguZHls
aWIuc288L2E+Jmd0OyZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0L2xpYmNfbXVzbC5zbzxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9saWI2NC88YSBocmVmPSJo
dHRwOi8vbGliY29uc3Rfb2lkLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2Js
YW5rIj5saWJjb25zdF9vaWQuZHlsaWIuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhy
ZWY9Imh0dHA6Ly9saWJjb25zdF9vaWQuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0
PSJfYmxhbmsiPmh0dHA6Ly9saWJjb25zdF9vaWQuZHlsaWIuc288L2E+Jmd0Ozxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmNv
bnN0X29pZC5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDov
L2xpYmNvbnN0X29pZC5keWxpYi5zbzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0i
aHR0cDovL2xpYmNvbnN0X29pZC5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9i
bGFuayI+aHR0cDovL2xpYmNvbnN0X29pZC5keWxpYi5zbzwvYT4mZ3Q7Jmd0OyAmbHQ7PGEgaHJl
Zj0iaHR0cDovL2xpYmNvbnN0X29pZC5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9
Il9ibGFuayI+aHR0cDovL2xpYmNvbnN0X29pZC5keWxpYi5zbzwvYT48YnI+DQomZ3Q7wqAgwqAg
wqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmNvbnN0X29pZC5keWxpYi5zbyIgcmVsPSJub3JlZmVy
cmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmNvbnN0X29pZC5keWxpYi5zbzwvYT4mZ3Q7
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDs8YSBocmVmPSJo
dHRwOi8vbGliY29uc3Rfb2lkLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2Js
YW5rIj5odHRwOi8vbGliY29uc3Rfb2lkLmR5bGliLnNvPC9hPjxicj4NCiZndDvCoCDCoCDCoCZs
dDs8YSBocmVmPSJodHRwOi8vbGliY29uc3Rfb2lkLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIi
IHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGliY29uc3Rfb2lkLmR5bGliLnNvPC9hPiZndDsmZ3Q7
Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKg
IMKgLi9saWI2NC88YSBocmVmPSJodHRwOi8vbGlicHJvdG9idWZfc3VwcG9ydC5keWxpYi5zbyIg
cmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+bGlicHJvdG9idWZfc3VwcG9ydC5keWxp
Yi5zbzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYnByb3RvYnVm
X3N1cHBvcnQuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6
Ly9saWJwcm90b2J1Zl9zdXBwb3J0LmR5bGliLnNvPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJwcm90b2J1Zl9z
dXBwb3J0LmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8v
bGlicHJvdG9idWZfc3VwcG9ydC5keWxpYi5zbzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEg
aHJlZj0iaHR0cDovL2xpYnByb3RvYnVmX3N1cHBvcnQuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJl
ciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJwcm90b2J1Zl9zdXBwb3J0LmR5bGliLnNvPC9h
PiZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYnByb3RvYnVmX3N1cHBvcnQuZHlsaWIuc28i
IHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJwcm90b2J1Zl9zdXBw
b3J0LmR5bGliLnNvPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGli
cHJvdG9idWZfc3VwcG9ydC5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFu
ayI+aHR0cDovL2xpYnByb3RvYnVmX3N1cHBvcnQuZHlsaWIuc288L2E+Jmd0Ozxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYnBy
b3RvYnVmX3N1cHBvcnQuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsi
Pmh0dHA6Ly9saWJwcm90b2J1Zl9zdXBwb3J0LmR5bGliLnNvPC9hPjxicj4NCiZndDvCoCDCoCDC
oCZsdDs8YSBocmVmPSJodHRwOi8vbGlicHJvdG9idWZfc3VwcG9ydC5keWxpYi5zbyIgcmVsPSJu
b3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYnByb3RvYnVmX3N1cHBvcnQuZHls
aWIuc288L2E+Jmd0OyZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0L3RwbTItdHNzMi10Y3RpLnNvPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0LzxhIGhy
ZWY9Imh0dHA6Ly9saWJzZXJkZS5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9i
bGFuayI+bGlic2VyZGUuZHlsaWIuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9
Imh0dHA6Ly9saWJzZXJkZS5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFu
ayI+aHR0cDovL2xpYnNlcmRlLmR5bGliLnNvPC9hPiZndDsgJmx0OzxhIGhyZWY9Imh0dHA6Ly9s
aWJzZXJkZS5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDov
L2xpYnNlcmRlLmR5bGliLnNvPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRw
Oi8vbGlic2VyZGUuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0
dHA6Ly9saWJzZXJkZS5keWxpYi5zbzwvYT4mZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYnNlcmRlLmR5bGliLnNv
IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlic2VyZGUuZHlsaWIu
c288L2E+ICZsdDs8YSBocmVmPSJodHRwOi8vbGlic2VyZGUuZHlsaWIuc28iIHJlbD0ibm9yZWZl
cnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJzZXJkZS5keWxpYi5zbzwvYT4mZ3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJzZXJkZS5keWxpYi5zbyIgcmVs
PSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYnNlcmRlLmR5bGliLnNvPC9h
PiAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYnNlcmRlLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIi
IHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlic2VyZGUuZHlsaWIuc288L2E+Jmd0OyZndDsmZ3Q7
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAu
L2xpYjY0L2xpYmFydHBhbGV0dGUuc288YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvbGlibG9nLnNvPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0LzxhIGhyZWY9Imh0
dHA6Ly9saWJvbmNlX2NlbGwuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxh
bmsiPmxpYm9uY2VfY2VsbC5keWxpYi5zbzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJl
Zj0iaHR0cDovL2xpYm9uY2VfY2VsbC5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9
Il9ibGFuayI+aHR0cDovL2xpYm9uY2VfY2VsbC5keWxpYi5zbzwvYT4mZ3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGlib25j
ZV9jZWxsLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8v
bGlib25jZV9jZWxsLmR5bGliLnNvPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJo
dHRwOi8vbGlib25jZV9jZWxsLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2Js
YW5rIj5odHRwOi8vbGlib25jZV9jZWxsLmR5bGliLnNvPC9hPiZndDsmZ3Q7ICZsdDs8YSBocmVm
PSJodHRwOi8vbGlib25jZV9jZWxsLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0i
X2JsYW5rIj5odHRwOi8vbGlib25jZV9jZWxsLmR5bGliLnNvPC9hPjxicj4NCiZndDvCoCDCoCDC
oCZsdDs8YSBocmVmPSJodHRwOi8vbGlib25jZV9jZWxsLmR5bGliLnNvIiByZWw9Im5vcmVmZXJy
ZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlib25jZV9jZWxsLmR5bGliLnNvPC9hPiZndDs8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmx0OzxhIGhyZWY9Imh0
dHA6Ly9saWJvbmNlX2NlbGwuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxh
bmsiPmh0dHA6Ly9saWJvbmNlX2NlbGwuZHlsaWIuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0
OzxhIGhyZWY9Imh0dHA6Ly9saWJvbmNlX2NlbGwuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIg
dGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJvbmNlX2NlbGwuZHlsaWIuc288L2E+Jmd0OyZndDsm
Z3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAuL2xpYjY0LzxhIGhyZWY9Imh0dHA6Ly9saWJ0aGlzZXJyb3IuZHlsaWIuc28iIHJlbD0ibm9y
ZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmxpYnRoaXNlcnJvci5keWxpYi5zbzwvYT48YnI+DQom
Z3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYnRoaXNlcnJvci5keWxpYi5zbyIgcmVs
PSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYnRoaXNlcnJvci5keWxpYi5z
bzwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDs8
YSBocmVmPSJodHRwOi8vbGlidGhpc2Vycm9yLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRh
cmdldD0iX2JsYW5rIj5odHRwOi8vbGlidGhpc2Vycm9yLmR5bGliLnNvPC9hPjxicj4NCiZndDvC
oCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGlidGhpc2Vycm9yLmR5bGliLnNvIiByZWw9Im5v
cmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlidGhpc2Vycm9yLmR5bGliLnNvPC9h
PiZndDsmZ3Q7ICZsdDs8YSBocmVmPSJodHRwOi8vbGlidGhpc2Vycm9yLmR5bGliLnNvIiByZWw9
Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlidGhpc2Vycm9yLmR5bGliLnNv
PC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGlidGhpc2Vycm9yLmR5
bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlidGhpc2Vy
cm9yLmR5bGliLnNvPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJ0aGlzZXJyb3IuZHlsaWIuc28iIHJlbD0ibm9y
ZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJ0aGlzZXJyb3IuZHlsaWIuc288L2E+
PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJ0aGlzZXJyb3IuZHlsaWIu
c28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJ0aGlzZXJyb3Iu
ZHlsaWIuc288L2E+Jmd0OyZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0L2xpYnNzbC1ob3N0LnNvPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0L2xpYmMr
Ky5zbzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKg
IMKgLi9saWI2NC9saWJleHQ0X3V0aWxzLnNvPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0LzxhIGhyZWY9Imh0dHA6Ly9saWJwa2Nz
OC5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+bGlicGtjczguZHls
aWIuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJwa2NzOC5k
eWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYnBrY3M4
LmR5bGliLnNvPC9hPiZndDsgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJwa2NzOC5keWxpYi5zbyIg
cmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYnBrY3M4LmR5bGliLnNv
PC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGlicGtjczguZHlsaWIu
c28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJwa2NzOC5keWxp
Yi5zbzwvYT4mZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYnBrY3M4LmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIi
IHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlicGtjczguZHlsaWIuc288L2E+ICZsdDs8YSBocmVm
PSJodHRwOi8vbGlicGtjczguZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxh
bmsiPmh0dHA6Ly9saWJwa2NzOC5keWxpYi5zbzwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmx0
OzxhIGhyZWY9Imh0dHA6Ly9saWJwa2NzOC5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJn
ZXQ9Il9ibGFuayI+aHR0cDovL2xpYnBrY3M4LmR5bGliLnNvPC9hPiAmbHQ7PGEgaHJlZj0iaHR0
cDovL2xpYnBrY3M4LmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5o
dHRwOi8vbGlicGtjczguZHlsaWIuc288L2E+Jmd0OyZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0L2xpYnNwYXJzZS1o
b3N0LnNvPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAuL2xpYjY0L3NhbmRib3hlZF9hcGlfc2FuZGJveDIuc288YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvbGliY3V0dGxlZmlz
aF9jb21tYW5kX3V0aWwuc288YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDvCoCDCoCDCoC4vbGliNjQvPGEgaHJlZj0iaHR0cDovL2xpYmJzc2xfc3lzLmR5bGli
LnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5saWJic3NsX3N5cy5keWxpYi5z
bzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmJzc2xfc3lzLmR5
bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGliYnNzbF9z
eXMuZHlsaWIuc288L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmJzc2xfc3lzLmR5bGliLnNvIiByZWw9Im5vcmVm
ZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGliYnNzbF9zeXMuZHlsaWIuc288L2E+PGJy
Pg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJic3NsX3N5cy5keWxpYi5zbyIg
cmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmJzc2xfc3lzLmR5bGli
LnNvPC9hPiZndDsmZ3Q7ICZsdDs8YSBocmVmPSJodHRwOi8vbGliYnNzbF9zeXMuZHlsaWIuc28i
IHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJic3NsX3N5cy5keWxp
Yi5zbzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmJzc2xfc3lz
LmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGliYnNz
bF9zeXMuZHlsaWIuc288L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmJzc2xfc3lzLmR5bGliLnNvIiByZWw9Im5v
cmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGliYnNzbF9zeXMuZHlsaWIuc288L2E+
PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJic3NsX3N5cy5keWxpYi5z
byIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmJzc2xfc3lzLmR5
bGliLnNvPC9hPiZndDsmZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9saWI2NC9saWJrZXltYXN0ZXJfbWVzc2FnZXMuc288YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGli
NjQvbGliY3V0dGxlZmlzaF93ZWIuc288YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvbGlidnB4LnNvPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0L2xpYm9wdXMuc288
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4v
bGliNjQvbGlibWluaWphaWwuc288YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvbGliY3VybC1ob3N0LnNvPGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0L2xpYmN1dHRs
ZWZpc2hfa2VybmVsX2xvZ19tb25pdG9yX3V0aWxzLnNvPGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0L3RwbTItdHNzMi11dGlsLnNv
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAu
L2xpYjY0LzxhIGhyZWY9Imh0dHA6Ly9saWJsaWJjLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIi
IHRhcmdldD0iX2JsYW5rIj5saWJsaWJjLmR5bGliLnNvPC9hPjxicj4NCiZndDvCoCDCoCDCoCZs
dDs8YSBocmVmPSJodHRwOi8vbGlibGliYy5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJn
ZXQ9Il9ibGFuayI+aHR0cDovL2xpYmxpYmMuZHlsaWIuc288L2E+Jmd0OyAmbHQ7PGEgaHJlZj0i
aHR0cDovL2xpYmxpYmMuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsi
Pmh0dHA6Ly9saWJsaWJjLmR5bGliLnNvPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVm
PSJodHRwOi8vbGlibGliYy5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFu
ayI+aHR0cDovL2xpYmxpYmMuZHlsaWIuc288L2E+Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJsaWJjLmR5bGli
LnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlibGliYy5keWxp
Yi5zbzwvYT4gJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJsaWJjLmR5bGliLnNvIiByZWw9Im5vcmVm
ZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlibGliYy5keWxpYi5zbzwvYT4mZ3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJsaWJjLmR5bGliLnNvIiByZWw9
Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlibGliYy5keWxpYi5zbzwvYT4g
Jmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJsaWJjLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRh
cmdldD0iX2JsYW5rIj5odHRwOi8vbGlibGliYy5keWxpYi5zbzwvYT4mZ3Q7Jmd0OyZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGli
NjQvPGEgaHJlZj0iaHR0cDovL2xpYnByb3RvYnVmLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIi
IHRhcmdldD0iX2JsYW5rIj5saWJwcm90b2J1Zi5keWxpYi5zbzwvYT48YnI+DQomZ3Q7wqAgwqAg
wqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYnByb3RvYnVmLmR5bGliLnNvIiByZWw9Im5vcmVmZXJy
ZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlicHJvdG9idWYuZHlsaWIuc288L2E+Jmd0Ozxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0
cDovL2xpYnByb3RvYnVmLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5r
Ij5odHRwOi8vbGlicHJvdG9idWYuZHlsaWIuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0Ozxh
IGhyZWY9Imh0dHA6Ly9saWJwcm90b2J1Zi5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJn
ZXQ9Il9ibGFuayI+aHR0cDovL2xpYnByb3RvYnVmLmR5bGliLnNvPC9hPiZndDsmZ3Q7ICZsdDs8
YSBocmVmPSJodHRwOi8vbGlicHJvdG9idWYuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFy
Z2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJwcm90b2J1Zi5keWxpYi5zbzwvYT48YnI+DQomZ3Q7wqAg
wqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYnByb3RvYnVmLmR5bGliLnNvIiByZWw9Im5vcmVm
ZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlicHJvdG9idWYuZHlsaWIuc288L2E+Jmd0
Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0i
aHR0cDovL2xpYnByb3RvYnVmLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2Js
YW5rIj5odHRwOi8vbGlicHJvdG9idWYuZHlsaWIuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0
OzxhIGhyZWY9Imh0dHA6Ly9saWJwcm90b2J1Zi5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0
YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYnByb3RvYnVmLmR5bGliLnNvPC9hPiZndDsmZ3Q7Jmd0
Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKg
Li9saWI2NC88YSBocmVmPSJodHRwOi8vbGliYml0ZmxhZ3MuZHlsaWIuc28iIHJlbD0ibm9yZWZl
cnJlciIgdGFyZ2V0PSJfYmxhbmsiPmxpYmJpdGZsYWdzLmR5bGliLnNvPC9hPjxicj4NCiZndDvC
oCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGliYml0ZmxhZ3MuZHlsaWIuc28iIHJlbD0ibm9y
ZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJiaXRmbGFncy5keWxpYi5zbzwvYT4m
Z3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDs8YSBocmVm
PSJodHRwOi8vbGliYml0ZmxhZ3MuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJf
YmxhbmsiPmh0dHA6Ly9saWJiaXRmbGFncy5keWxpYi5zbzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAm
bHQ7PGEgaHJlZj0iaHR0cDovL2xpYmJpdGZsYWdzLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIi
IHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGliYml0ZmxhZ3MuZHlsaWIuc288L2E+Jmd0OyZndDsg
Jmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJiaXRmbGFncy5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVy
IiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmJpdGZsYWdzLmR5bGliLnNvPC9hPjxicj4NCiZn
dDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGliYml0ZmxhZ3MuZHlsaWIuc28iIHJlbD0i
bm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJiaXRmbGFncy5keWxpYi5zbzwv
YT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDs8YSBo
cmVmPSJodHRwOi8vbGliYml0ZmxhZ3MuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0
PSJfYmxhbmsiPmh0dHA6Ly9saWJiaXRmbGFncy5keWxpYi5zbzwvYT48YnI+DQomZ3Q7wqAgwqAg
wqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmJpdGZsYWdzLmR5bGliLnNvIiByZWw9Im5vcmVmZXJy
ZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGliYml0ZmxhZ3MuZHlsaWIuc288L2E+Jmd0OyZn
dDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAuL2xpYjY0L2xpYnV0aWxzLnNvPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0L2xpYmpzb25jcHAuc288YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvbGliZXh0
Ml9ibGtpZC1ob3N0LnNvPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAuL2xpYjY0L2xpYm5sLnNvPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0L3RwbTItdHNzMi1zeXMuc288YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGli
NjQvbGliYXJ0YmFzZS5zbzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgJmd0O8KgIMKgIMKgLi9saWI2NC9saWJ4bWwyLnNvPGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0LzxhIGhyZWY9Imh0dHA6Ly9s
aWJrbXJfcHJvdG9fcnVzdC5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFu
ayI+bGlia21yX3Byb3RvX3J1c3QuZHlsaWIuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0Ozxh
IGhyZWY9Imh0dHA6Ly9saWJrbXJfcHJvdG9fcnVzdC5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVy
IiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmttcl9wcm90b19ydXN0LmR5bGliLnNvPC9hPiZn
dDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmx0OzxhIGhyZWY9
Imh0dHA6Ly9saWJrbXJfcHJvdG9fcnVzdC5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJn
ZXQ9Il9ibGFuayI+aHR0cDovL2xpYmttcl9wcm90b19ydXN0LmR5bGliLnNvPC9hPjxicj4NCiZn
dDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGlia21yX3Byb3RvX3J1c3QuZHlsaWIuc28i
IHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJrbXJfcHJvdG9fcnVz
dC5keWxpYi5zbzwvYT4mZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmttcl9wcm90b19ydXN0LmR5bGliLnNvIiBy
ZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlia21yX3Byb3RvX3J1c3Qu
ZHlsaWIuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJrbXJf
cHJvdG9fcnVzdC5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0
cDovL2xpYmttcl9wcm90b19ydXN0LmR5bGliLnNvPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJrbXJfcHJvdG9f
cnVzdC5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xp
Ymttcl9wcm90b19ydXN0LmR5bGliLnNvPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVm
PSJodHRwOi8vbGlia21yX3Byb3RvX3J1c3QuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFy
Z2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJrbXJfcHJvdG9fcnVzdC5keWxpYi5zbzwvYT4mZ3Q7Jmd0
OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDC
oCDCoC4vbGliNjQvbGliY3V0dGxlZmlzaF9zZWN1cml0eS5zbzxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9saWI2NC88YSBocmVmPSJodHRw
Oi8vbGlic2VjdXJlX2Vudl90cG0uZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJf
YmxhbmsiPmxpYnNlY3VyZV9lbnZfdHBtLmR5bGliLnNvPC9hPjxicj4NCiZndDvCoCDCoCDCoCZs
dDs8YSBocmVmPSJodHRwOi8vbGlic2VjdXJlX2Vudl90cG0uZHlsaWIuc28iIHJlbD0ibm9yZWZl
cnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJzZWN1cmVfZW52X3RwbS5keWxpYi5zbzwv
YT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDs8YSBo
cmVmPSJodHRwOi8vbGlic2VjdXJlX2Vudl90cG0uZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIg
dGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJzZWN1cmVfZW52X3RwbS5keWxpYi5zbzwvYT48YnI+
DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYnNlY3VyZV9lbnZfdHBtLmR5bGli
LnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlic2VjdXJlX2Vu
dl90cG0uZHlsaWIuc288L2E+Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJzZWN1cmVfZW52X3RwbS5keWxpYi5z
byIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYnNlY3VyZV9lbnZf
dHBtLmR5bGliLnNvPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGli
c2VjdXJlX2Vudl90cG0uZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsi
Pmh0dHA6Ly9saWJzZWN1cmVfZW52X3RwbS5keWxpYi5zbzwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGlic2VjdXJl
X2Vudl90cG0uZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6
Ly9saWJzZWN1cmVfZW52X3RwbS5keWxpYi5zbzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEg
aHJlZj0iaHR0cDovL2xpYnNlY3VyZV9lbnZfdHBtLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIi
IHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlic2VjdXJlX2Vudl90cG0uZHlsaWIuc288L2E+Jmd0
OyZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAuL2xpYjY0L2xpYnotaG9zdC5zbzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9saWI2NC9saWJwcm9jZXNzZ3JvdXAuc288YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGli
NjQvbGliY3J5cHRvX3V0aWxzLnNvPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0LzxhIGhyZWY9Imh0dHA6Ly9saWJkZXIuZHlsaWIu
c28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmxpYmRlci5keWxpYi5zbzwvYT48
YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmRlci5keWxpYi5zbyIgcmVs
PSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmRlci5keWxpYi5zbzwvYT4m
Z3Q7ICZsdDs8YSBocmVmPSJodHRwOi8vbGliZGVyLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIi
IHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGliZGVyLmR5bGliLnNvPC9hPjxicj4NCiZndDvCoCDC
oCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGliZGVyLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIi
IHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGliZGVyLmR5bGliLnNvPC9hPiZndDsmZ3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8v
bGliZGVyLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8v
bGliZGVyLmR5bGliLnNvPC9hPiAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmRlci5keWxpYi5zbyIg
cmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmRlci5keWxpYi5zbzwv
YT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJkZXIuZHlsaWIu
c28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJkZXIuZHlsaWIu
c288L2E+ICZsdDs8YSBocmVmPSJodHRwOi8vbGliZGVyLmR5bGliLnNvIiByZWw9Im5vcmVmZXJy
ZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGliZGVyLmR5bGliLnNvPC9hPiZndDsmZ3Q7Jmd0
Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKg
Li9saWI2NC9saWJkZXhmaWxlLnNvPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0L2NmX21ldHJpY3NfcHJvdG8uc288YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvdHBt
Mi10c3MyLWVzeXMuc288YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
ICZndDvCoCDCoCDCoC4vbGliNjQvbGliY3V0dGxlZmlzaF91dGlscy5zbzxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9saWI2NC9saWJrZXlt
YXN0ZXJfcG9ydGFibGUuc288YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDvCoCDCoCDCoC4vbGliNjQvbGliZnJ1aXQuc288YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvdHBtMi10c3MyLXJjLnNv
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAu
L2xpYjY0L2xpYmNhcC5zbzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgJmd0O8KgIMKgIMKgLi9saWI2NC88YSBocmVmPSJodHRwOi8vbGlibml4LmR5bGliLnNvIiBy
ZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5saWJuaXguZHlsaWIuc288L2E+PGJyPg0K
Jmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJuaXguZHlsaWIuc28iIHJlbD0ibm9y
ZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJuaXguZHlsaWIuc288L2E+Jmd0OyAm
bHQ7PGEgaHJlZj0iaHR0cDovL2xpYm5peC5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJn
ZXQ9Il9ibGFuayI+aHR0cDovL2xpYm5peC5keWxpYi5zbzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAm
bHQ7PGEgaHJlZj0iaHR0cDovL2xpYm5peC5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJn
ZXQ9Il9ibGFuayI+aHR0cDovL2xpYm5peC5keWxpYi5zbzwvYT4mZ3Q7Jmd0Ozxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYm5p
eC5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYm5p
eC5keWxpYi5zbzwvYT4gJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJuaXguZHlsaWIuc28iIHJlbD0i
bm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJuaXguZHlsaWIuc288L2E+Jmd0
Ozxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGlibml4LmR5bGliLnNvIiBy
ZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlibml4LmR5bGliLnNvPC9h
PiAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYm5peC5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0
YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYm5peC5keWxpYi5zbzwvYT4mZ3Q7Jmd0OyZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGli
NjQvbGliaWN1dWMtaG9zdC5zbzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgJmd0O8KgIMKgIMKgLi9saWI2NC9saWJ6aXBhcmNoaXZlLnNvPGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0LzxhIGhyZWY9
Imh0dHA6Ly9saWJrbXJfdGFfbm9uc2VjdXJlLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRh
cmdldD0iX2JsYW5rIj5saWJrbXJfdGFfbm9uc2VjdXJlLmR5bGliLnNvPC9hPjxicj4NCiZndDvC
oCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGlia21yX3RhX25vbnNlY3VyZS5keWxpYi5zbyIg
cmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmttcl90YV9ub25zZWN1
cmUuZHlsaWIuc288L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmttcl90YV9ub25zZWN1cmUuZHlsaWIuc28iIHJl
bD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJrbXJfdGFfbm9uc2VjdXJl
LmR5bGliLnNvPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGlia21y
X3RhX25vbnNlY3VyZS5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+
aHR0cDovL2xpYmttcl90YV9ub25zZWN1cmUuZHlsaWIuc288L2E+Jmd0OyZndDs8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCZsdDs8YSBocmVm
PSJodHRwOi8vbGlia21yX3RhX25vbnNlY3VyZS5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0
YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmttcl90YV9ub25zZWN1cmUuZHlsaWIuc288L2E+PGJy
Pg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJrbXJfdGFfbm9uc2VjdXJlLmR5
bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlia21yX3Rh
X25vbnNlY3VyZS5keWxpYi5zbzwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGlia21yX3RhX25vbnNlY3VyZS5keWxp
Yi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmttcl90YV9u
b25zZWN1cmUuZHlsaWIuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6
Ly9saWJrbXJfdGFfbm9uc2VjdXJlLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0i
X2JsYW5rIj5odHRwOi8vbGlia21yX3RhX25vbnNlY3VyZS5keWxpYi5zbzwvYT4mZ3Q7Jmd0OyZn
dDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDC
oC4vbGliNjQvPGEgaHJlZj0iaHR0cDovL2xpYnN0ZC5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVy
IiB0YXJnZXQ9Il9ibGFuayI+bGlic3RkLmR5bGliLnNvPC9hPjxicj4NCiZndDvCoCDCoCDCoCZs
dDs8YSBocmVmPSJodHRwOi8vbGlic3RkLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdl
dD0iX2JsYW5rIj5odHRwOi8vbGlic3RkLmR5bGliLnNvPC9hPiZndDsgJmx0OzxhIGhyZWY9Imh0
dHA6Ly9saWJzdGQuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0
dHA6Ly9saWJzdGQuZHlsaWIuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0
dHA6Ly9saWJzdGQuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0
dHA6Ly9saWJzdGQuZHlsaWIuc288L2E+Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJzdGQuZHlsaWIuc28iIHJl
bD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJzdGQuZHlsaWIuc288L2E+
ICZsdDs8YSBocmVmPSJodHRwOi8vbGlic3RkLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRh
cmdldD0iX2JsYW5rIj5odHRwOi8vbGlic3RkLmR5bGliLnNvPC9hPiZndDs8YnI+DQomZ3Q7wqAg
wqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYnN0ZC5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVy
IiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYnN0ZC5keWxpYi5zbzwvYT4gJmx0OzxhIGhyZWY9
Imh0dHA6Ly9saWJzdGQuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsi
Pmh0dHA6Ly9saWJzdGQuZHlsaWIuc288L2E+Jmd0OyZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0LzxhIGhyZWY9Imh0
dHA6Ly9saWJoYWxmLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5s
aWJoYWxmLmR5bGliLnNvPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8v
bGliaGFsZi5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDov
L2xpYmhhbGYuZHlsaWIuc288L2E+Jmd0OyAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmhhbGYuZHls
aWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJoYWxmLmR5
bGliLnNvPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGliaGFsZi5k
eWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmhhbGYu
ZHlsaWIuc288L2E+Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJoYWxmLmR5bGliLnNvIiByZWw9Im5vcmVmZXJy
ZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGliaGFsZi5keWxpYi5zbzwvYT4gJmx0OzxhIGhy
ZWY9Imh0dHA6Ly9saWJoYWxmLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2Js
YW5rIj5odHRwOi8vbGliaGFsZi5keWxpYi5zbzwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmx0
OzxhIGhyZWY9Imh0dHA6Ly9saWJoYWxmLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdl
dD0iX2JsYW5rIj5odHRwOi8vbGliaGFsZi5keWxpYi5zbzwvYT4gJmx0OzxhIGhyZWY9Imh0dHA6
Ly9saWJoYWxmLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRw
Oi8vbGliaGFsZi5keWxpYi5zbzwvYT4mZ3Q7Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvdHBtMi10c3MyLW11LnNv
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAu
L2xpYjY0LzxhIGhyZWY9Imh0dHA6Ly9saWJtZW1vZmZzZXQuZHlsaWIuc28iIHJlbD0ibm9yZWZl
cnJlciIgdGFyZ2V0PSJfYmxhbmsiPmxpYm1lbW9mZnNldC5keWxpYi5zbzwvYT48YnI+DQomZ3Q7
wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYm1lbW9mZnNldC5keWxpYi5zbyIgcmVsPSJu
b3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYm1lbW9mZnNldC5keWxpYi5zbzwv
YT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDs8YSBo
cmVmPSJodHRwOi8vbGlibWVtb2Zmc2V0LmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdl
dD0iX2JsYW5rIj5odHRwOi8vbGlibWVtb2Zmc2V0LmR5bGliLnNvPC9hPjxicj4NCiZndDvCoCDC
oCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGlibWVtb2Zmc2V0LmR5bGliLnNvIiByZWw9Im5vcmVm
ZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlibWVtb2Zmc2V0LmR5bGliLnNvPC9hPiZn
dDsmZ3Q7ICZsdDs8YSBocmVmPSJodHRwOi8vbGlibWVtb2Zmc2V0LmR5bGliLnNvIiByZWw9Im5v
cmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlibWVtb2Zmc2V0LmR5bGliLnNvPC9h
Pjxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGlibWVtb2Zmc2V0LmR5bGli
LnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlibWVtb2Zmc2V0
LmR5bGliLnNvPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJtZW1vZmZzZXQuZHlsaWIuc28iIHJlbD0ibm9yZWZl
cnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJtZW1vZmZzZXQuZHlsaWIuc288L2E+PGJy
Pg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJtZW1vZmZzZXQuZHlsaWIuc28i
IHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJtZW1vZmZzZXQuZHls
aWIuc288L2E+Jmd0OyZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0L2xpYmxwLnNvPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0L2xpYmN1dHRsZWZpc2hf
ZnMuc288YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDC
oCDCoC4vbGliNjQvbGliUHJveHlDb25maWcuc288YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvPGEgaHJlZj0iaHR0cDovL2xpYm9w
ZW5zc2wuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmxpYm9wZW5z
c2wuZHlsaWIuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJv
cGVuc3NsLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8v
bGlib3BlbnNzbC5keWxpYi5zbzwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGlib3BlbnNzbC5keWxpYi5zbyIgcmVs
PSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYm9wZW5zc2wuZHlsaWIuc288
L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJvcGVuc3NsLmR5bGli
LnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlib3BlbnNzbC5k
eWxpYi5zbzwvYT4mZ3Q7Jmd0OyAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYm9wZW5zc2wuZHlsaWIu
c28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJvcGVuc3NsLmR5
bGliLnNvPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGlib3BlbnNz
bC5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYm9w
ZW5zc2wuZHlsaWIuc288L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYm9wZW5zc2wuZHlsaWIuc28iIHJlbD0ibm9y
ZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJvcGVuc3NsLmR5bGliLnNvPC9hPjxi
cj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGlib3BlbnNzbC5keWxpYi5zbyIg
cmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYm9wZW5zc2wuZHlsaWIu
c288L2E+Jmd0OyZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0LzxhIGhyZWY9Imh0dHA6Ly9saWJrbXJfd2lyZS5keWxp
Yi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+bGlia21yX3dpcmUuZHlsaWIu
c288L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJrbXJfd2lyZS5k
eWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmttcl93
aXJlLmR5bGliLnNvPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJrbXJfd2lyZS5keWxpYi5zbyIgcmVsPSJub3Jl
ZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmttcl93aXJlLmR5bGliLnNvPC9hPjxi
cj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGlia21yX3dpcmUuZHlsaWIuc28i
IHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJrbXJfd2lyZS5keWxp
Yi5zbzwvYT4mZ3Q7Jmd0OyAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmttcl93aXJlLmR5bGliLnNv
IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlia21yX3dpcmUuZHls
aWIuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJrbXJfd2ly
ZS5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmtt
cl93aXJlLmR5bGliLnNvPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJrbXJfd2lyZS5keWxpYi5zbyIgcmVsPSJu
b3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmttcl93aXJlLmR5bGliLnNvPC9h
Pjxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGlia21yX3dpcmUuZHlsaWIu
c28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJrbXJfd2lyZS5k
eWxpYi5zbzwvYT4mZ3Q7Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvPGEgaHJlZj0iaHR0cDovL2xpYmttcl9jcnlw
dG9fYm9yaW5nLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5saWJr
bXJfY3J5cHRvX2JvcmluZy5keWxpYi5zbzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJl
Zj0iaHR0cDovL2xpYmttcl9jcnlwdG9fYm9yaW5nLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIi
IHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlia21yX2NyeXB0b19ib3JpbmcuZHlsaWIuc288L2E+
Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJl
Zj0iaHR0cDovL2xpYmttcl9jcnlwdG9fYm9yaW5nLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIi
IHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlia21yX2NyeXB0b19ib3JpbmcuZHlsaWIuc288L2E+
PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJrbXJfY3J5cHRvX2Jvcmlu
Zy5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmtt
cl9jcnlwdG9fYm9yaW5nLmR5bGliLnNvPC9hPiZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xp
Ymttcl9jcnlwdG9fYm9yaW5nLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2Js
YW5rIj5odHRwOi8vbGlia21yX2NyeXB0b19ib3JpbmcuZHlsaWIuc288L2E+PGJyPg0KJmd0O8Kg
IMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJrbXJfY3J5cHRvX2JvcmluZy5keWxpYi5zbyIg
cmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmttcl9jcnlwdG9fYm9y
aW5nLmR5bGliLnNvPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJrbXJfY3J5cHRvX2JvcmluZy5keWxpYi5zbyIg
cmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmttcl9jcnlwdG9fYm9y
aW5nLmR5bGliLnNvPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGli
a21yX2NyeXB0b19ib3JpbmcuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxh
bmsiPmh0dHA6Ly9saWJrbXJfY3J5cHRvX2JvcmluZy5keWxpYi5zbzwvYT4mZ3Q7Jmd0OyZndDs8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4v
bGliNjQvPGEgaHJlZj0iaHR0cDovL2xpYmxvZ19ydXN0LmR5bGliLnNvIiByZWw9Im5vcmVmZXJy
ZXIiIHRhcmdldD0iX2JsYW5rIj5saWJsb2dfcnVzdC5keWxpYi5zbzwvYT48YnI+DQomZ3Q7wqAg
wqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmxvZ19ydXN0LmR5bGliLnNvIiByZWw9Im5vcmVm
ZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlibG9nX3J1c3QuZHlsaWIuc288L2E+Jmd0
Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0i
aHR0cDovL2xpYmxvZ19ydXN0LmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2Js
YW5rIj5odHRwOi8vbGlibG9nX3J1c3QuZHlsaWIuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0
OzxhIGhyZWY9Imh0dHA6Ly9saWJsb2dfcnVzdC5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0
YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmxvZ19ydXN0LmR5bGliLnNvPC9hPiZndDsmZ3Q7ICZs
dDs8YSBocmVmPSJodHRwOi8vbGlibG9nX3J1c3QuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIg
dGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJsb2dfcnVzdC5keWxpYi5zbzwvYT48YnI+DQomZ3Q7
wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmxvZ19ydXN0LmR5bGliLnNvIiByZWw9Im5v
cmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlibG9nX3J1c3QuZHlsaWIuc288L2E+
Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJl
Zj0iaHR0cDovL2xpYmxvZ19ydXN0LmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0i
X2JsYW5rIj5odHRwOi8vbGlibG9nX3J1c3QuZHlsaWIuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKg
Jmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJsb2dfcnVzdC5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVy
IiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmxvZ19ydXN0LmR5bGliLnNvPC9hPiZndDsmZ3Q7
Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKg
IMKgLi9saWI2NC9saWJoaWRsYmFzZS5zbzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9saWI2NC9saWJncnBjX3dyYXAuc288YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvbGli
Z3JwYysrX3Vuc2VjdXJlLnNvPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0LzxhIGhyZWY9Imh0dHA6Ly9saWJieXRlcy5keWxpYi5z
byIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+bGliYnl0ZXMuZHlsaWIuc288L2E+
PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJieXRlcy5keWxpYi5zbyIg
cmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmJ5dGVzLmR5bGliLnNv
PC9hPiZndDsgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJieXRlcy5keWxpYi5zbyIgcmVsPSJub3Jl
ZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmJ5dGVzLmR5bGliLnNvPC9hPjxicj4N
CiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGliYnl0ZXMuZHlsaWIuc28iIHJlbD0i
bm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJieXRlcy5keWxpYi5zbzwvYT4m
Z3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7PGEg
aHJlZj0iaHR0cDovL2xpYmJ5dGVzLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0i
X2JsYW5rIj5odHRwOi8vbGliYnl0ZXMuZHlsaWIuc288L2E+ICZsdDs8YSBocmVmPSJodHRwOi8v
bGliYnl0ZXMuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6
Ly9saWJieXRlcy5keWxpYi5zbzwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9
Imh0dHA6Ly9saWJieXRlcy5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFu
ayI+aHR0cDovL2xpYmJ5dGVzLmR5bGliLnNvPC9hPiAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmJ5
dGVzLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGli
Ynl0ZXMuZHlsaWIuc288L2E+Jmd0OyZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0L2xpYnNvZnRfYXR0ZXN0YXRpb25f
Y2VydC5zbzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8Kg
IMKgIMKgLi9saWI2NC9saWJjdXR0bGVmaXNoX3J1bl9jdmRfcHJvdG8uc288YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvbGliYmlu
ZGVyLnNvPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAuL2xpYjY0L2xpYmNyeXB0by1ob3N0LnNvPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0L2xpYndlYm1fbWt2bXV4ZXIuc288
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4v
bGliNjQvPGEgaHJlZj0iaHR0cDovL2xpYmttcl9jZi5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVy
IiB0YXJnZXQ9Il9ibGFuayI+bGlia21yX2NmLmR5bGliLnNvPC9hPjxicj4NCiZndDvCoCDCoCDC
oCZsdDs8YSBocmVmPSJodHRwOi8vbGlia21yX2NmLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIi
IHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlia21yX2NmLmR5bGliLnNvPC9hPiZndDs8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9s
aWJrbXJfY2YuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6
Ly9saWJrbXJfY2YuZHlsaWIuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0
dHA6Ly9saWJrbXJfY2YuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsi
Pmh0dHA6Ly9saWJrbXJfY2YuZHlsaWIuc288L2E+Jmd0OyZndDsgJmx0OzxhIGhyZWY9Imh0dHA6
Ly9saWJrbXJfY2YuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0
dHA6Ly9saWJrbXJfY2YuZHlsaWIuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9
Imh0dHA6Ly9saWJrbXJfY2YuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxh
bmsiPmh0dHA6Ly9saWJrbXJfY2YuZHlsaWIuc288L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmttcl9jZi5keWxp
Yi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmttcl9jZi5k
eWxpYi5zbzwvYT4gJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJrbXJfY2YuZHlsaWIuc28iIHJlbD0i
bm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJrbXJfY2YuZHlsaWIuc288L2E+
Jmd0OyZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAuL2xpYjY0LzxhIGhyZWY9Imh0dHA6Ly9saWJjaWJvcml1bS5keWxpYi5zbyIg
cmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+bGliY2lib3JpdW0uZHlsaWIuc288L2E+
PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJjaWJvcml1bS5keWxpYi5z
byIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmNpYm9yaXVtLmR5
bGliLnNvPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
Jmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJjaWJvcml1bS5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVy
IiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmNpYm9yaXVtLmR5bGliLnNvPC9hPjxicj4NCiZn
dDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGliY2lib3JpdW0uZHlsaWIuc28iIHJlbD0i
bm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJjaWJvcml1bS5keWxpYi5zbzwv
YT4mZ3Q7Jmd0OyAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmNpYm9yaXVtLmR5bGliLnNvIiByZWw9
Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGliY2lib3JpdW0uZHlsaWIuc288
L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJjaWJvcml1bS5keWxp
Yi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmNpYm9yaXVt
LmR5bGliLnNvPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJjaWJvcml1bS5keWxpYi5zbyIgcmVsPSJub3JlZmVy
cmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmNpYm9yaXVtLmR5bGliLnNvPC9hPjxicj4N
CiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGliY2lib3JpdW0uZHlsaWIuc28iIHJl
bD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJjaWJvcml1bS5keWxpYi5z
bzwvYT4mZ3Q7Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDvCoCDCoCDCoC4vbGliNjQvbGlicHVyZXNvZnRrZXltYXN0ZXJkZXZpY2VfaG9zdC5z
bzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKg
Li9saWI2NC88YSBocmVmPSJodHRwOi8vbGlieDUwOV9jZXJ0LmR5bGliLnNvIiByZWw9Im5vcmVm
ZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5saWJ4NTA5X2NlcnQuZHlsaWIuc288L2E+PGJyPg0KJmd0
O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJ4NTA5X2NlcnQuZHlsaWIuc28iIHJlbD0i
bm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJ4NTA5X2NlcnQuZHlsaWIuc288
L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7PGEg
aHJlZj0iaHR0cDovL2xpYng1MDlfY2VydC5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJn
ZXQ9Il9ibGFuayI+aHR0cDovL2xpYng1MDlfY2VydC5keWxpYi5zbzwvYT48YnI+DQomZ3Q7wqAg
wqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYng1MDlfY2VydC5keWxpYi5zbyIgcmVsPSJub3Jl
ZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYng1MDlfY2VydC5keWxpYi5zbzwvYT4m
Z3Q7Jmd0OyAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYng1MDlfY2VydC5keWxpYi5zbyIgcmVsPSJu
b3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYng1MDlfY2VydC5keWxpYi5zbzwv
YT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYng1MDlfY2VydC5keWxp
Yi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYng1MDlfY2Vy
dC5keWxpYi5zbzwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGlieDUwOV9jZXJ0LmR5bGliLnNvIiByZWw9Im5vcmVm
ZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlieDUwOV9jZXJ0LmR5bGliLnNvPC9hPjxi
cj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGlieDUwOV9jZXJ0LmR5bGliLnNv
IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlieDUwOV9jZXJ0LmR5
bGliLnNvPC9hPiZndDsmZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9saWI2NC88YSBocmVmPSJodHRwOi8vbGlic2VjMS5keWxp
Yi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+bGlic2VjMS5keWxpYi5zbzwv
YT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYnNlYzEuZHlsaWIuc28i
IHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJzZWMxLmR5bGliLnNv
PC9hPiZndDsgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJzZWMxLmR5bGliLnNvIiByZWw9Im5vcmVm
ZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlic2VjMS5keWxpYi5zbzwvYT48YnI+DQom
Z3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYnNlYzEuZHlsaWIuc28iIHJlbD0ibm9y
ZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJzZWMxLmR5bGliLnNvPC9hPiZndDsm
Z3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDs8YSBocmVm
PSJodHRwOi8vbGlic2VjMS5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFu
ayI+aHR0cDovL2xpYnNlYzEuZHlsaWIuc288L2E+ICZsdDs8YSBocmVmPSJodHRwOi8vbGlic2Vj
MS5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYnNl
YzEuZHlsaWIuc288L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8v
bGlic2VjMS5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDov
L2xpYnNlYzEuZHlsaWIuc288L2E+ICZsdDs8YSBocmVmPSJodHRwOi8vbGlic2VjMS5keWxpYi5z
byIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYnNlYzEuZHlsaWIu
c288L2E+Jmd0OyZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAuL25hdGl2ZXRlc3Q2NC88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbmF0aXZldGVzdDY0L21vZGVtX3NpbXVs
YXRvcl90ZXN0Lzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0
O8KgIMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKgLi9uYXRpdmV0ZXN0NjQvbW9kZW1fc2ltdWxhdG9y
X3Rlc3QvbW9kZW1fc2ltdWxhdG9yX3Rlc3Q8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbmF0aXZldGVzdDY0L2N1dHRsZWZpc2hfbmV0X3Rl
c3RzLzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKg
PGJyPg0KJmd0O8KgIMKgIMKgIMKgLi9uYXRpdmV0ZXN0NjQvY3V0dGxlZmlzaF9uZXRfdGVzdHMv
Y3V0dGxlZmlzaF9uZXRfdGVzdHM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgICZndDvCoCDCoCDCoC4vZXRjLzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9ldGMvbW9kZW1fc2ltdWxhdG9yLzxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9ldGMvbW9kZW1f
c2ltdWxhdG9yL2ZpbGVzLzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqA8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAuL2V0Yy9tb2RlbV9zaW11bGF0b3IvZmlsZXMvaWNjcHJvZmlsZV9mb3Jf
c2ltMF9mb3JfQ3RzQ2FycmllckFwaVRlc3RDYXNlcy54bWw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDCoC4vZXRj
L21vZGVtX3NpbXVsYXRvci9maWxlcy9pY2Nwcm9maWxlX2Zvcl9zaW0wLnhtbDxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9ldGMvbW9kZW1f
c2ltdWxhdG9yL2ZpbGVzL251bWVyaWNfb3BlcmF0b3IueG1sPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2V0Yy9jdmRfcnNhNDA5Ni5hdmJw
dWJrZXk8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDC
oCDCoC4vZXRjL2Jvb3Rsb2FkZXJfYWFyY2g2NC88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vZXRjL2Jvb3Rsb2FkZXJfYWFyY2g2NC9ib290
bG9hZGVyLnFlbXU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZn
dDvCoCDCoCDCoC4vZXRjL2Jvb3Rsb2FkZXJfYWFyY2g2NC9ib290bG9hZGVyLmNyb3N2bTxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9ldGMv
Ym9vdGxvYWRlcl9yaXNjdjY0Lzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgJmd0O8KgIMKgIMKgLi9ldGMvYm9vdGxvYWRlcl9yaXNjdjY0L2Jvb3Rsb2FkZXIucWVt
dTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKg
Li9ldGMvYXV0b21vdGl2ZS88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDvCoCDCoCDCoC4vZXRjL2F1dG9tb3RpdmUvdmhhbGNvbmZpZy88YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKgLi9ldGMvYXV0b21vdGl2
ZS92aGFsY29uZmlnL1ZlbmRvckNsdXN0ZXJUZXN0UHJvcGVydGllcy5qc29uPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2V0Yy9hdXRvbW90
aXZlL3ZoYWxjb25maWcvRGVmYXVsdFByb3BlcnRpZXMuanNvbjxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9ldGMvYXV0b21vdGl2ZS92aGFs
Y29uZmlnL1Rlc3RQcm9wZXJ0aWVzLmpzb248YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vZXRjL2F1dG9tb3RpdmUvcHJveHlfY29uZmlnLmpz
b248YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDC
oC4vZXRjL2N2ZF9yc2EyMDQ4LmF2YnB1YmtleTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9ldGMvY3ZkX2F2Yl90ZXN0a2V5X3JzYTQwOTYu
cGVtPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAuL2V0Yy9ib290bG9hZGVyX2FybS88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDvCoCDCoCDCoC4vZXRjL2Jvb3Rsb2FkZXJfYXJtL2Jvb3Rsb2FkZXIucWVt
dTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKg
Li9ldGMvYm9vdGxvYWRlcl94ODZfNjQvPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2V0Yy9ib290bG9hZGVyX3g4Nl82NC9ib290bG9hZGVy
LnFlbXU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDC
oCDCoC4vZXRjL2Jvb3Rsb2FkZXJfeDg2XzY0L2Jvb3Rsb2FkZXIuY3Jvc3ZtPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2V0Yy9jdmRfYXZi
X3Rlc3RrZXlfcnNhMjA0OC5wZW08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgICZndDvCoCDCoCDCoC4vZXRjL29wZW53cnQvPGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2V0Yy9vcGVud3J0L2ltYWdlcy88YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vZXRj
L29wZW53cnQvaW1hZ2VzL29wZW53cnRfa2VybmVsX2FhcmNoNjQ8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vZXRjL29wZW53cnQvaW1hZ2Vz
L29wZW53cnRfcm9vdGZzX3g4Nl82NDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9ldGMvb3BlbndydC9pbWFnZXMvb3BlbndydF9yb290ZnNf
YWFyY2g2NDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8Kg
IMKgIMKgLi9ldGMvb3BlbndydC9pbWFnZXMvb3BlbndydF9rZXJuZWxfeDg2XzY0PGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2V0Yy9jdmRf
Y29uZmlnLzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8Kg
IMKgIMKgLi9ldGMvY3ZkX2NvbmZpZy9jdmRfY29uZmlnX3R2Lmpzb248YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vZXRjL2N2ZF9jb25maWcv
Y3ZkX2NvbmZpZ190YWJsZXQuanNvbjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9ldGMvY3ZkX2NvbmZpZy9jdmRfY29uZmlnX3dlYXIuanNv
bjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKg
Li9ldGMvY3ZkX2NvbmZpZy9jdmRfY29uZmlnX2F1dG9fcG9ydHJhaXQuanNvbjxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9ldGMvY3ZkX2Nv
bmZpZy9jdmRfY29uZmlnX3NsaW0uanNvbjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9ldGMvY3ZkX2NvbmZpZy9jdmRfY29uZmlnX2dvLmpz
b248YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDC
oC4vZXRjL2N2ZF9jb25maWcvY3ZkX2NvbmZpZ19mb2xkYWJsZS5qc29uPGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2V0Yy9jdmRfY29uZmln
L2N2ZF9jb25maWdfYXV0by5qc29uPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2V0Yy9jdmRfY29uZmlnL2N2ZF9jb25maWdfYXV0b19tZC5q
c29uPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAuL2V0Yy9jdmRfY29uZmlnL2N2ZF9jb25maWdfcGhvbmUuanNvbjxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi91c3IvPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL3Vzci9zaGFyZS88
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4v
dXNyL3NoYXJlL3Z1bGthbi88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDvCoCDCoCDCoC4vdXNyL3NoYXJlL3Z1bGthbi9pY2QuZC88YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vdXNyL3NoYXJlL3Z1bGth
bi9pY2QuZC92a19zd2lmdHNoYWRlcl9pY2QuanNvbjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi91c3Ivc2hhcmUvcWVtdS88YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vdXNyL3NoYXJl
L3FlbXUvYWFyY2g2NC1saW51eC1nbnUvPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oDxicj4NCiZndDvCoCDCoCDCoCDCoC4vdXNyL3NoYXJlL3FlbXUvYWFyY2g2NC1saW51eC1nbnUv
b3BlbnNiaS1yaXNjdjY0LWdlbmVyaWMtZndfZHluYW1pYy5iaW48YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vdXNyL3NoYXJlL3FlbXUvYWFy
Y2g2NC1saW51eC1nbnUvZWZpLXZpcnRpby5yb208YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vdXNyL3NoYXJlL3FlbXUvYWFyY2g2NC1saW51
eC1nbnUva2V5bWFwcy88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
ICZndDvCoCDCoCDCoC4vdXNyL3NoYXJlL3FlbXUvYWFyY2g2NC1saW51eC1nbnUva2V5bWFwcy9l
bi11czxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKg
IMKgLi91c3Ivc2hhcmUvd2VicnRjLzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgJmd0O8KgIMKgIMKgLi91c3Ivc2hhcmUvd2VicnRjL2Fzc2V0cy88YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vdXNyL3NoYXJl
L3dlYnJ0Yy9hc3NldHMvc3R5bGUuY3NzPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL3Vzci9zaGFyZS93ZWJydGMvYXNzZXRzL2luZGV4LmNz
czxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKg
Li91c3Ivc2hhcmUvd2VicnRjL2Fzc2V0cy9pbmRleC5odG1sPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL3Vzci9zaGFyZS93ZWJydGMvYXNz
ZXRzL2pzLzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8Kg
IMKgIMKgLi91c3Ivc2hhcmUvd2VicnRjL2Fzc2V0cy9qcy9sb2NhdGlvbi5qczxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi91c3Ivc2hhcmUv
d2VicnRjL2Fzc2V0cy9qcy9yb290Y2FuYWwuanM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vdXNyL3NoYXJlL3dlYnJ0Yy9hc3NldHMvanMv
YXBwLmpzPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAuL3Vzci9zaGFyZS93ZWJydGMvYXNzZXRzL2pzL3RvdWNoLmpzPGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL3Vzci9zaGFyZS93ZWJy
dGMvYXNzZXRzL2pzL2FkYi5qczxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgJmd0O8KgIMKgIMKgLi91c3Ivc2hhcmUvd2VicnRjL2Fzc2V0cy9qcy9pbmRleC5qczxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi91
c3Ivc2hhcmUvd2VicnRjL2Fzc2V0cy9qcy9jZl93ZWJydGMuanM8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vdXNyL3NoYXJlL3dlYnJ0Yy9h
c3NldHMvanMvc2VydmVyX2Nvbm5lY3Rvci5qczxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi91c3Ivc2hhcmUvd2VicnRjL2Fzc2V0cy9qcy9j
b250cm9scy5qczxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0
O8KgIMKgIMKgLi91c3Ivc2hhcmUvd2VicnRjL2Fzc2V0cy9jb250cm9scy5jc3M8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vdXNyL3NoYXJl
L3dlYnJ0Yy9hc3NldHMvY3VzdG9tLmNzczxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi91c3Ivc2hhcmUvd2VicnRjL2Fzc2V0cy9jbGllbnQu
aHRtbDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKg
IMKgLi91c3Ivc2hhcmUvd2VicnRjL2NlcnRzLzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi91c3Ivc2hhcmUvd2VicnRjL2NlcnRzL3NlcnZl
ci5wMTI8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDC
oCDCoC4vdXNyL3NoYXJlL3dlYnJ0Yy9jZXJ0cy9zZXJ2ZXIua2V5PGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL3Vzci9zaGFyZS93ZWJydGMv
Y2VydHMvdHJ1c3RlZC5wZW08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDvCoCDCoCDCoC4vdXNyL3NoYXJlL3dlYnJ0Yy9jZXJ0cy9zZXJ2ZXIuY3J0PGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL3Vzci9z
aGFyZS96b25laW5mby88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
ICZndDvCoCDCoCDCoC4vdXNyL3NoYXJlL3pvbmVpbmZvL3R6ZGF0YTxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi91c3Ivc2hhcmUvY3Jvc3Zt
Lzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKg
Li91c3Ivc2hhcmUvY3Jvc3ZtL2FhcmNoNjQtbGludXgtZ251Lzxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi91c3Ivc2hhcmUvY3Jvc3ZtL2Fh
cmNoNjQtbGludXgtZ251L3NlY2NvbXAvPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oDxicj4NCiZndDvCoCDCoCDCoCDCoC4vdXNyL3NoYXJlL2Nyb3N2bS9hYXJjaDY0LWxpbnV4LWdu
dS9zZWNjb21wL3NuZF9udWxsX2RldmljZS5wb2xpY3k8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKgLi91c3Ivc2hhcmUvY3Jvc3ZtL2FhcmNoNjQt
bGludXgtZ251L3NlY2NvbXAvZ3B1X3JlbmRlcl9zZXJ2ZXIucG9saWN5PGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDCoC4vdXNyL3NoYXJlL2Nyb3N2
bS9hYXJjaDY0LWxpbnV4LWdudS9zZWNjb21wL2JhdHRlcnkucG9saWN5PGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDCoC4vdXNyL3NoYXJlL2Nyb3N2
bS9hYXJjaDY0LWxpbnV4LWdudS9zZWNjb21wL2Jsb2NrX2RldmljZS5wb2xpY3k8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKgLi91c3Ivc2hhcmUv
Y3Jvc3ZtL2FhcmNoNjQtbGludXgtZ251L3NlY2NvbXAvcG1lbV9kZXZpY2UucG9saWN5PGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDCoC4vdXNyL3No
YXJlL2Nyb3N2bS9hYXJjaDY0LWxpbnV4LWdudS9zZWNjb21wL3dsX2RldmljZS5wb2xpY3k8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKgLi91c3Iv
c2hhcmUvY3Jvc3ZtL2FhcmNoNjQtbGludXgtZ251L3NlY2NvbXAvOXBfZGV2aWNlLnBvbGljeTxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAuL3Vz
ci9zaGFyZS9jcm9zdm0vYWFyY2g2NC1saW51eC1nbnUvc2VjY29tcC9pbnB1dF9kZXZpY2UucG9s
aWN5PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDC
oC4vdXNyL3NoYXJlL2Nyb3N2bS9hYXJjaDY0LWxpbnV4LWdudS9zZWNjb21wL25ldF9kZXZpY2Uu
cG9saWN5PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDC
oCDCoC4vdXNyL3NoYXJlL2Nyb3N2bS9hYXJjaDY0LWxpbnV4LWdudS9zZWNjb21wL3JuZ19kZXZp
Y2UucG9saWN5PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoDxicj4NCiZndDvCoCDC
oCDCoCDCoC4vdXNyL3NoYXJlL2Nyb3N2bS9hYXJjaDY0LWxpbnV4LWdudS9zZWNjb21wL2NvaW9t
bXVfZGV2aWNlLnBvbGljeTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqA8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAuL3Vzci9zaGFyZS9jcm9zdm0vYWFyY2g2NC1saW51eC1nbnUvc2VjY29t
cC9ncHVfZGV2aWNlLnBvbGljeTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqA8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAuL3Vzci9zaGFyZS9jcm9zdm0vYWFyY2g2NC1saW51eC1nbnUvc2Vj
Y29tcC9zZXJpYWxfZGV2aWNlLnBvbGljeTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAuL3Vzci9zaGFyZS9jcm9zdm0vYWFyY2g2NC1saW51eC1n
bnUvc2VjY29tcC9jcmFzX2F1ZGlvX2RldmljZS5wb2xpY3k8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKgLi91c3Ivc2hhcmUvY3Jvc3ZtL2FhcmNo
NjQtbGludXgtZ251L3NlY2NvbXAvbnVsbF9hdWRpb19kZXZpY2UucG9saWN5PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDCoC4vdXNyL3NoYXJlL2Ny
b3N2bS9hYXJjaDY0LWxpbnV4LWdudS9zZWNjb21wL3NuZF9jcmFzX2RldmljZS5wb2xpY3k8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKgLi91c3Iv
c2hhcmUvY3Jvc3ZtL2FhcmNoNjQtbGludXgtZ251L3NlY2NvbXAvdmhvc3Rfc2NtaV9kZXZpY2Uu
cG9saWN5PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDC
oCDCoC4vdXNyL3NoYXJlL2Nyb3N2bS9hYXJjaDY0LWxpbnV4LWdudS9zZWNjb21wL2JhbGxvb25f
ZGV2aWNlLnBvbGljeTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqA8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAuL3Vzci9zaGFyZS9jcm9zdm0vYWFyY2g2NC1saW51eC1nbnUvc2VjY29tcC92
aG9zdF9uZXRfZGV2aWNlLnBvbGljeTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqA8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAuL3Vzci9zaGFyZS9jcm9zdm0vYWFyY2g2NC1saW51eC1nbnUv
c2VjY29tcC92aG9zdF92c29ja19kZXZpY2UucG9saWN5PGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDCoC4vdXNyL3NoYXJlL2Nyb3N2bS9hYXJjaDY0
LWxpbnV4LWdudS9zZWNjb21wL2ZzX2RldmljZS5wb2xpY3k8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKgLi91c3Ivc2hhcmUvY3Jvc3ZtL2FhcmNo
NjQtbGludXgtZ251L3NlY2NvbXAvdmlkZW9fZGV2aWNlLnBvbGljeTxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAuL3Vzci9zaGFyZS9jcm9zdm0v
YWFyY2g2NC1saW51eC1nbnUvc2VjY29tcC94aGNpX2RldmljZS5wb2xpY3k8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKgLi91c3Ivc2hhcmUvY3Jv
c3ZtL2FhcmNoNjQtbGludXgtZ251L3NlY2NvbXAvdmlvc19hdWRpb19kZXZpY2UucG9saWN5PGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jp
bi88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDC
oC4vYmluL21vZGVtX3NpbXVsYXRvcjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vbXMtdHBtLTIwLXJlZjxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vbWtlbnZpbWFnZV9z
bGltPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAuL2Jpbi9tZXRyaWNzPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAuL2Jpbi9zb2NrZXRfdnNvY2tfcHJveHk8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL3Jlc2l6ZS5mMmZzPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jp
bi9tZXRyaWNzX2xhdW5jaGVyPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9hdXRvbW90aXZlX3Zzb2NrX3Byb3h5PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9uZXdmc19t
c2Rvczxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKg
IMKgLi9iaW4vbmV0c2ltLXVpLzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vbmV0c2ltLXVpL2Fzc2V0cy88YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL25ldHNpbS11aS9h
c3NldHMvZ3JpZC1iYWNrZ3JvdW5kLnN2Zzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vbmV0c2ltLXVpL2Fzc2V0cy9uZXRzaW0tbG9n
by5zdmc8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDC
oCDCoC4vYmluL25ldHNpbS11aS9hc3NldHMvcG9sYXItYmFja2dyb3VuZC5zdmc8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL25ldHNp
bS11aS9hc3NldHMvaGV4YWdvbmFsLWJhY2tncm91bmQucG5nPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9uZXRzaW0tdWkvYXNzZXRz
L25ldHNpbS1sb2dvLWIuc3ZnPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9uZXRzaW0tdWkvbm9kZV9tb2R1bGVzLzxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vbmV0c2lt
LXVpL25vZGVfbW9kdWxlcy90c2xpYi88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL25ldHNpbS11aS9ub2RlX21vZHVsZXMvdHNsaWIv
dHNsaWIuZXM2LmpzPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAuL2Jpbi9uZXRzaW0tdWkvaW5kZXguaHRtbDxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vbmV0c2ltLXVpL2pzLzxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9i
aW4vbmV0c2ltLXVpL2pzL2RldmljZS1pbmZvLmpzPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9uZXRzaW0tdWkvanMvZGV2aWNlLWxp
c3QuanM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDC
oCDCoC4vYmluL25ldHNpbS11aS9qcy9wYWNrZXQtaW5mby5qczxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vbmV0c2ltLXVpL2pzL2Rl
dmljZS1kcm9wem9uZS5qczxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgJmd0O8KgIMKgIMKgLi9iaW4vbmV0c2ltLXVpL2pzL25hdmlnYXRpb24tYmFyLmpzPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9u
ZXRzaW0tdWkvanMvZGV2aWNlLW1hcC5qczxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vbmV0c2ltLXVpL2pzL2RldmljZS1kcmFnem9u
ZS5qczxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKg
IMKgLi9iaW4vbmV0c2ltLXVpL2pzL25ldHNpbS1hcHAuanM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL25ldHNpbS11aS9qcy9jdXN0
b21pemUtbWFwLWJ1dHRvbi5qczxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vbmV0c2ltLXVpL2pzL2RldmljZS1vYnNlcnZlci5qczxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9i
aW4vbmV0c2ltLXVpL2pzL2xpY2Vuc2UtaW5mby5qczxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vbmV0c2ltLXVpL2pzL2N1YmUtc3By
aXRlLmpzPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAuL2Jpbi9uZXRzaW0tdWkvanMvcHlyYW1pZC1zcHJpdGUuanM8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL3VucGFja19ib290
aW1nPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAuL2Jpbi9hZGI8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZn
dDvCoCDCoCDCoC4vYmluL2V4dHJhY3Qtdm1saW51eDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vaGVhbHRoPGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9zY3JlZW5fcmVj
b3JkaW5nX3NlcnZlcjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
Jmd0O8KgIMKgIMKgLi9iaW4vbHo0PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi93bWVkaXVtZF9nZW5fY29uZmlnPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9nbnNzX2dy
cGNfcHJveHk8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvC
oCDCoCDCoC4vYmluL3NpbWcyaW1nPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9zZWN1cmVfZW52PGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9ta2UyZnM8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL3NuYXBz
aG90X3V0aWxfY3ZkPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAuL2Jpbi9jdmRfaW50ZXJuYWxfZGlzcGxheTxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vYWNsb3VkX3RyYW5zbGF0
b3I8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDC
oC4vYmluL2RlZnJhZy5mMmZzPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi90b21ic3RvbmVfcmVjZWl2ZXI8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL3Jvb3QtY2FuYWw8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4v
YmluL25ldHNpbWQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZn
dDvCoCDCoCDCoC4vYmluL2NvbnNvbGVfZm9yd2FyZGVyPGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9wb3dlcndhc2hfY3ZkPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9w
cm9jZXNzX3Jlc3RhcnRlcjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgJmd0O8KgIMKgIMKgLi9iaW4vZnNjay5mMmZzPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9jdmRfaG9zdF9idWdyZXBvcnQ8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmlu
L2V4dHJhY3QtaWtjb25maWc8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDvCoCDCoCDCoC4vYmluL2N2ZF9pbnRlcm5hbF9zdGF0dXM8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL3dlYlJUQzxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4v
YWNsb3VkPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAuL2Jpbi90Y3BfY29ubmVjdG9yPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9wcm9jZXNzX3NhbmRib3hlcjxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vd2VicnRj
X29wZXJhdG9yPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAuL2Jpbi9jdmRfdXBkYXRlX2xvY2F0aW9uPGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9lMmZzZHJvaWQ8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL2F2YnRv
b2w8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDC
oC4vYmluL2Zhc3Rib290PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAuL2Jpbi9idWlsZF9zdXBlcl9pbWFnZTxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vcG93ZXJidG5fY3ZkPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jp
bi9hbGxvY2RfY2xpZW50PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAuL2Jpbi9kdW1wLmYyZnM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL25ldHNpbTxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vY2FzaW1pcjxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4v
cGljYTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKg
IMKgLi9iaW4vY3ZkX3VwZGF0ZV9zZWN1cml0eV9hbGdvcml0aG08YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL3JlY29yZF9jdmQ8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmlu
L3ZoYWxfcHJveHlfc2VydmVyPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9jdmRfc3RhdHVzPGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9jdmRfaW1wb3J0X2xvY2F0aW9u
czxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKg
Li9iaW4vbGF1bmNoX2N2ZDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgJmd0O8KgIMKgIMKgLi9iaW4vY3ZkX2ludGVybmFsX3N0YXJ0PGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9yZXN0YXJ0X2N2ZDxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9i
aW4vY3ZkX2ludGVybmFsX2hvc3RfYnVncmVwb3J0PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9ta3VzZXJpbWdfbWtlMmZzPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9m
ZWM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDC
oC4vYmluL2N2ZF9pbnRlcm5hbF9lbnY8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL3Zob3N0X2RldmljZV92c29jazxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vY3ZkX2lu
dGVybmFsX3N0b3A8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZn
dDvCoCDCoCDCoC4vYmluL2N2ZF9zZW5kX3Ntczxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vYXNzZW1ibGVfY3ZkPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9jdmRfc2Vu
ZF9pZF9kaXNjbG9zdXJlPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAuL2Jpbi9tY29weTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vb3BlcmF0b3JfcHJveHk8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL21rYm9vdGZz
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAu
L2Jpbi9ydW5fY3ZkPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAuL2Jpbi9vcGVud3J0X2NvbnRyb2xfc2VydmVyPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9ta2Jvb3RpbWc8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmlu
L2tlcm5lbF9sb2dfbW9uaXRvcjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vbW1kPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi90b3lib3g8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL2Nyb3N2bTxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vYWFy
Y2g2NC1saW51eC1tdXNsLzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgJmd0O8KgIMKgIMKgLi9iaW4vYWFyY2g2NC1saW51eC1tdXNsL2Nyb3N2bTxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vc2VmY29u
dGV4dF9jb21waWxlPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAuL2Jpbi93bWVkaXVtZDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vZWNob19zZXJ2ZXI8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL2xvZ190ZWU8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmlu
L2xwbWFrZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8Kg
IMKgIMKgLi9iaW4vbG9nY2F0X3JlY2VpdmVyPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9scHVucGFjazxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vY29udHJvbF9lbnZf
cHJveHlfc2VydmVyPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAuL2Jpbi9tdG9vbHM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL2FkYl9jb25uZWN0b3I8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL2FhcmNoNjQtbGlu
dXgtZ251Lzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8Kg
IMKgIMKgLi9iaW4vYWFyY2g2NC1saW51eC1nbnUvbGliZXBveHkuc28uMDxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vYWFyY2g2NC1s
aW51eC1nbnUvbGliZmZpLnNvLjc8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgICZndDvCoCDCoCDCoC4vYmluL2FhcmNoNjQtbGludXgtZ251L3FlbXUvPGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9hYXJj
aDY0LWxpbnV4LWdudS9xZW11L3FlbXUtc3lzdGVtLXg4Nl82NDxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vYWFyY2g2NC1saW51eC1n
bnUvcWVtdS9saWJlcG94eS5zby4wPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9hYXJjaDY0LWxpbnV4LWdudS9xZW11L2xpYnZpcmds
cmVuZGVyZXIuc28uMTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
Jmd0O8KgIMKgIMKgLi9iaW4vYWFyY2g2NC1saW51eC1nbnUvcWVtdS9saWJnYm0uc28uMTxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgPGJyPg0KJmd0
O8KgIMKgIMKgIMKgLi9iaW4vYWFyY2g2NC1saW51eC1nbnUvcWVtdS9saWJnZnhzdHJlYW1fYmFj
a2VuZC5zby4wPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7
wqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAuL2Jpbi9hYXJjaDY0LWxpbnV4LWdudS9xZW11L2xp
YnJ1dGFiYWdhX2dmeF9mZmkuc28uMDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vYWFyY2g2NC1saW51eC1nbnUvcWVtdS9xZW11LXN5
c3RlbS1yaXNjdjY0PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAuL2Jpbi9hYXJjaDY0LWxpbnV4LWdudS9xZW11L3FlbXUtc3lzdGVtLWFhcmNo
NjQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDC
oC4vYmluL2FhcmNoNjQtbGludXgtZ251L3FlbXUvbGliYysrLnNvLjE8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL2FhcmNoNjQtbGlu
dXgtZ251L3FlbXUvbGlidW53aW5kLnNvLjE8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL2FhcmNoNjQtbGludXgtZ251L3FlbXUvbGli
ei5zby4xPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAuL2Jpbi9hYXJjaDY0LWxpbnV4LWdudS9xZW11L2xpYmMrK2FiaS5zby4xPGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9hYXJj
aDY0LWxpbnV4LWdudS9saWJ2aXJnbHJlbmRlcmVyLnNvLjE8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL2FhcmNoNjQtbGludXgtZ251
L2xpYmRybS5zby4yPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAuL2Jpbi9hYXJjaDY0LWxpbnV4LWdudS9saWJnYm0uc28uMTxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vYWFyY2g2
NC1saW51eC1nbnUvbGliZ2Z4c3RyZWFtX2JhY2tlbmQuc288YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL2FhcmNoNjQtbGludXgtZ251
L2xpYndheWxhbmQtY2xpZW50LnNvLjA8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL2FhcmNoNjQtbGludXgtZ251L2xpYm1pbmlqYWls
LnNvPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqA8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAuL2Jpbi9hYXJjaDY0LWxpbnV4LWdudS9nZnhzdHJlYW1fZ3Jh
cGhpY3NfZGV0ZWN0b3I8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
ICZndDvCoCDCoCDCoC4vYmluL2FhcmNoNjQtbGludXgtZ251L2Nyb3N2bTxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vbHBhZGQ8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmlu
L21ha2VfZjJmczxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0
O8KgIMKgIMKgLi9iaW4vc2FuZGJveGVyX3Byb3h5PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9zdG9wX2N2ZDxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vY2FzaW1pcl9j
b250cm9sX3NlcnZlcjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqB6aW9tYXJp
b0BaMzkwLUFPUlVTLVBSTy1ERVNUOi9tbnQvenJvb3QtMTMzL19PUy9BbmRyb2lkL2Fvc3BfMTQv
YW5kcm9pZC1pbWFnZSQgSE9NRT0kKHB3ZCkgLi9iaW4vbGF1bmNoX2N2ZCAtdm1fbWFuYWdlciBx
ZW11X2NsaSAtcmVwb3J0X2Fub255bW91c191c2FnZV9zdGF0cz1uIC0tc3RhcnRfd2VicnRjPWZh
bHNlPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAwOS0wMiAyMzoyNzoxMC40
NzMgMjcyOTk5MCAyNzI5OTkwIEkgbGF1bmNoX2N2ZDo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgbWFpbi5jYzoyMzUgVXNpbmc8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoHN5c3RlbV9pbWFnZV9kaXIgb2Y6PGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDCoD09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDC
oCDCoE5PVElDRTo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZn
dDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDC
oEJ5IHVzaW5nIHRoaXMgQW5kcm9pZCBWaXJ0dWFsIERldmljZSwgeW91IGFncmVlIHRvPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqBHb29nbGUg
VGVybXMgb2YgU2VydmljZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAoPGEgaHJlZj0iaHR0cHM6Ly9wb2xpY2llcy5nb29nbGUuY29tL3Rlcm1zIiByZWw9Im5vcmVm
ZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL3BvbGljaWVzLmdvb2dsZS5jb20vdGVybXM8
L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHBzOi8vcG9saWNpZXMuZ29vZ2xl
LmNvbS90ZXJtcyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9wb2xp
Y2llcy5nb29nbGUuY29tL3Rlcm1zPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHBzOi8vcG9saWNpZXMuZ29vZ2xlLmNvbS90
ZXJtcyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9wb2xpY2llcy5n
b29nbGUuY29tL3Rlcm1zPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwczov
L3BvbGljaWVzLmdvb2dsZS5jb20vdGVybXMiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxh
bmsiPmh0dHBzOi8vcG9saWNpZXMuZ29vZ2xlLmNvbS90ZXJtczwvYT4mZ3Q7Jmd0Ozxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgJmx0OzxhIGhy
ZWY9Imh0dHBzOi8vcG9saWNpZXMuZ29vZ2xlLmNvbS90ZXJtcyIgcmVsPSJub3JlZmVycmVyIiB0
YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9wb2xpY2llcy5nb29nbGUuY29tL3Rlcm1zPC9hPjxicj4N
CiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwczovL3BvbGljaWVzLmdvb2dsZS5jb20vdGVy
bXMiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vcG9saWNpZXMuZ29v
Z2xlLmNvbS90ZXJtczwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCZsdDs8YSBocmVmPSJodHRwczovL3BvbGljaWVzLmdvb2dsZS5jb20vdGVybXMiIHJl
bD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vcG9saWNpZXMuZ29vZ2xlLmNv
bS90ZXJtczwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cHM6Ly9wb2xpY2ll
cy5nb29nbGUuY29tL3Rlcm1zIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRw
czovL3BvbGljaWVzLmdvb2dsZS5jb20vdGVybXM8L2E+Jmd0OyZndDsmZ3Q7KS48YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoFRoZSBHb29nbGUg
UHJpdmFjeSBQb2xpY3k8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
KDxhIGhyZWY9Imh0dHBzOi8vcG9saWNpZXMuZ29vZ2xlLmNvbS9wcml2YWN5IiByZWw9Im5vcmVm
ZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL3BvbGljaWVzLmdvb2dsZS5jb20vcHJpdmFj
eTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cHM6Ly9wb2xpY2llcy5nb29n
bGUuY29tL3ByaXZhY3kiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8v
cG9saWNpZXMuZ29vZ2xlLmNvbS9wcml2YWN5PC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHBzOi8vcG9saWNpZXMuZ29vZ2xl
LmNvbS9wcml2YWN5IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL3Bv
bGljaWVzLmdvb2dsZS5jb20vcHJpdmFjeTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJl
Zj0iaHR0cHM6Ly9wb2xpY2llcy5nb29nbGUuY29tL3ByaXZhY3kiIHJlbD0ibm9yZWZlcnJlciIg
dGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vcG9saWNpZXMuZ29vZ2xlLmNvbS9wcml2YWN5PC9hPiZn
dDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAmbHQ7PGEgaHJlZj0iaHR0cHM6Ly9wb2xpY2llcy5nb29nbGUuY29tL3ByaXZhY3kiIHJl
bD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vcG9saWNpZXMuZ29vZ2xlLmNv
bS9wcml2YWN5PC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwczovL3BvbGlj
aWVzLmdvb2dsZS5jb20vcHJpdmFjeSIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+
aHR0cHM6Ly9wb2xpY2llcy5nb29nbGUuY29tL3ByaXZhY3k8L2E+Jmd0Ozxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cHM6Ly9wb2xpY2ll
cy5nb29nbGUuY29tL3ByaXZhY3kiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0
dHBzOi8vcG9saWNpZXMuZ29vZ2xlLmNvbS9wcml2YWN5PC9hPjxicj4NCiZndDvCoCDCoCDCoCZs
dDs8YSBocmVmPSJodHRwczovL3BvbGljaWVzLmdvb2dsZS5jb20vcHJpdmFjeSIgcmVsPSJub3Jl
ZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9wb2xpY2llcy5nb29nbGUuY29tL3ByaXZh
Y3k8L2E+Jmd0OyZndDsmZ3Q7KTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgJmd0O8KgIMKgIMKgZGVzY3JpYmVzIGhvdyBHb29nbGUgaGFuZGxlcyBpbmZvcm1hdGlv
bjxicj4NCiZndDvCoCDCoCDCoGdlbmVyYXRlZCBhczxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqB5b3UgdXNlPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqBHb29nbGUgU2VydmljZXMuPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDCoD09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT08YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoFJlYWRpbmcgLS1jb25maWcgb3B0
aW9uIGZyb206PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoDxicj4NCiZndDvCoCDC
oCDCoCDCoC9tbnQvenJvb3QtMTMzL19PUy9BbmRyb2lkL2Fvc3BfMTQvYW5kcm9pZC1pbWFnZS9h
bmRyb2lkLWluZm8udHh0PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqBMYXVuY2hpbmcgQ1ZEIHVzaW5nIC0tY29uZmlnPSYjMzk7cGhvbmUmIzM5
Oy48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDC
oGFhcmNoNjQtYmluZm10LVA6IENvdWxkIG5vdCBvcGVuPGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCYjMzk7L2xpYi9sZC1saW51eC1hYXJjaDY0LnNvLjEmIzM5Ozog
Tm88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDC
oHN1Y2ggZmlsZSBvciBkaXJlY3Rvcnk8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDvCoCDCoCDCoEZhaWxlZCB0byBydW4gZ3JhcGhpY3MgZGV0ZWN0b3IsIGJh
ZCByZXR1cm4gdmFsdWU6PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oDI1NS4gQXNzdW1pbmcgbm88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDvCoCDCoCDCoGF2YWlsYWJpbGl0eS48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoEdQVSBhdXRvIG1vZGU6IGRpZCBub3QgZGV0ZWN0
IHByZXJlcXVpc2l0ZXMgZm9yPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoGFjY2VsZXJhdGVkPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqByZW5kZXJpbmcgc3VwcG9ydCwgZW5hYmxpbmc8YnI+DQomZ3Q7wqAgwqAg
wqAtLWdwdV9tb2RlPWd1ZXN0X3N3aWZ0c2hhZGVyLjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgR1BVIHZob3N0IHVzZXIgYXV0byBtb2RlOiBu
b3QgbmVlZGVkIGZvcjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
Jmd0O8KgIMKgIMKgLS1ncHVfbW9kZT1ndWVzdF9zd2lmdHNoYWRlci4gTm90IGVuYWJsaW5nPGJy
Pg0KJmd0O8KgIMKgIMKgdmhvc3QgdXNlcjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqBncHUuPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqBSZXF1ZXN0ZWQgcmVzdW1pbmcgYSBwcmV2aW91cyBzZXNzaW9uICh0aGUg
ZGVmYXVsdDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqBiZWhhdmlv
cikgYnV0IHRoZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0
O8KgIMKgIMKgYmFzZSBpbWFnZXMgaGF2ZSBjaGFuZ2VkIHVuZGVyIHRoZSBvdmVybGF5LCBtYWtp
bmc8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgdGhlIG92ZXJsYXkg
aW5jPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqBvbXBhdGlibGUuIFdpcGluZyB0aGUgb3ZlcmxheSBmaWxlcy48YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoFBhdGggZm9yIGluc3RhbmNlIFVE
UzogL3RtcC9jZl9hdmRfMTAwMDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgJmd0O8KgIMKgIMKgRmFpbGVkIHRvIHJ1bjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqBgL21udC96cm9vdC0xMzMvX09TL0FuZHJvaWQv
YW9zcF8xNC9hbmRyb2lkLWltYWdlL2Jpbi9jcm9zdm08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoGNyZWF0ZV9xY293MiAtLWJhY2tpbmctZmls
ZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAvbW50L3pyb290LTEz
My9fT1MvQW5kcm9pZC9hb3NwXzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqA8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAxNC9hbmRyb2lkLWltYWdlL2N1dHRsZWZpc2gvaW5zdGFuY2VzL2N2
ZC0xL3BlcnNpc3RlbnRfY29tcG9zaXRlLmltZzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAvbW50L3pyb290LTEzMy9fT1MvQW5kcm9pZC9hb3Nw
XzE0L2FuZHJvaWQtaW1hZ2UvY3V0dGxlZmlzaC9pbnN0YW48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoGNlcy9jdmQtMS9wZXJzaXN0ZW50X2Nv
bXBvc2l0ZV9vdmVybGF5LmltZ2A8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgICZndDvCoCDCoCDCoHN0ZG91dDo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCMjIzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgJmd0O8KgIMKgIMKgIyMjPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqBzdGRlcnI6PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAjIyM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKgL21udC96cm9vdC0xMzMvX09TL0FuZHJvaWQvYW9z
cF8xNC9hbmRyb2lkLWltYWdlL2Jpbi9jcm9zdm06IHJpZ2EgMzo8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKgL21udC96cm9vdC0xMzMvX09TL0Fu
ZHJvaWQvYW9zcF8xNC9hbmRyb2lkLWltYWdlL2Jpbi94ODZfNjQtbGludXgtPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqBtdXNsL2Nyb3N2bTog
RmlsZSBvIGRpcmVjdG9yeSBub24gZXNpc3RlbnRlPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAjIyM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDvCoCDCoCDCoFJldHVybiBjb2RlOiAmcXVvdDsxMjcmcXVvdDs8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoHFlbXU6IHVu
Y2F1Z2h0IHRhcmdldCBzaWduYWwgNiAoQWJvcnRlZCkgLTxicj4NCiZndDvCoCDCoCDCoGNvcmUg
ZHVtcGVkPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAwOS0wMiAyMzoyNzozMS4yMjMgMjcyOTk5MCAyNzI5OTkwIEUgbGF1bmNoX2N2ZDo8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgc3VicHJvY2Vzcy5jcHA6MjA3
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqBT
dWJwcm9jZXNzIDI3MzAwMTggd2FzIGludGVycnVwdGVkIGJ5IGEgc2lnbmFsPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCYjMzk7QWJvcnRlZCYjMzk7ICg2KTxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgMDktMDIg
MjM6Mjc6MzEuMjI0IDI3Mjk5OTAgMjcyOTk5MCBFIGxhdW5jaF9jdmQ6PGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoG1haW4uY2M6MzIzPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqBhc3NlbWJsZV9jdmQgcmV0dXJu
ZWQgLTE8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoE9uIE1v
biwgU2VwIDIsIDIwMjQgYXQgMTE6MjDigK9QTSBNYXJpbyBNYXJpZXR0bzxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Im1h
aWx0bzptYXJpZXR0bzIwMDhAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+bWFyaWV0dG8yMDA4
QGdtYWlsLmNvbTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0
bzptYXJpZXR0bzIwMDhAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+bWFyaWV0dG8yMDA4QGdt
YWlsLmNvbTwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOm1hcmlldHRvMjAwOEBnbWFpbC5jb20iIHRhcmdl
dD0iX2JsYW5rIj5tYXJpZXR0bzIwMDhAZ21haWwuY29tPC9hPjxicj4NCiZndDvCoCDCoCDCoCZs
dDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOm1hcmlldHRvMjAwOEBnbWFpbC5jb20iIHRhcmdldD0i
X2JsYW5rIj5tYXJpZXR0bzIwMDhAZ21haWwuY29tPC9hPiZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOm1h
cmlldHRvMjAwOEBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5tYXJpZXR0bzIwMDhAZ21haWwu
Y29tPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOm1hcmll
dHRvMjAwOEBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5tYXJpZXR0bzIwMDhAZ21haWwuY29t
PC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmx0O21h
aWx0bzo8YSBocmVmPSJtYWlsdG86bWFyaWV0dG8yMDA4QGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxh
bmsiPm1hcmlldHRvMjAwOEBnbWFpbC5jb208L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0
bzo8YSBocmVmPSJtYWlsdG86bWFyaWV0dG8yMDA4QGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsi
Pm1hcmlldHRvMjAwOEBnbWFpbC5jb208L2E+Jmd0OyZndDsmZ3Q7Jmd0OyB3cm90ZTo8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoEhlbGxvLjxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgSSYjMzk7dmUg
ZG93bmxvYWRlZCB0aGlzIGZpbGUgOjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgYW9zcF9jZl9hcm02NF9vbmx5X3Bob25lLWltZy0x
MjMwOTI5Ni56aXAgYW5kPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oHRoaXMgZmlsZSA6PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqBjdmQtaG9zdF9wYWNrYWdlLnRhci5nejxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgZnJvbSBoZXJlIDo8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0Ozxicj4NCiZndDvCoCDCoCDCoDxhIGhyZWY9Imh0dHBzOi8vY2kuYW5kcm9pZC5jb20vYnVp
bGRzL3N1Ym1pdHRlZC8xMjMwOTI5Ni9hb3NwX2NmX2FybTY0X29ubHlfcGhvbmUtdHJ1bmtfc3Rh
Z2luZy11c2VyZGVidWcvbGF0ZXN0IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5o
dHRwczovL2NpLmFuZHJvaWQuY29tL2J1aWxkcy9zdWJtaXR0ZWQvMTIzMDkyOTYvYW9zcF9jZl9h
cm02NF9vbmx5X3Bob25lLXRydW5rX3N0YWdpbmctdXNlcmRlYnVnL2xhdGVzdDwvYT4gJmx0Ozxh
IGhyZWY9Imh0dHBzOi8vY2kuYW5kcm9pZC5jb20vYnVpbGRzL3N1Ym1pdHRlZC8xMjMwOTI5Ni9h
b3NwX2NmX2FybTY0X29ubHlfcGhvbmUtdHJ1bmtfc3RhZ2luZy11c2VyZGVidWcvbGF0ZXN0IiBy
ZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2NpLmFuZHJvaWQuY29tL2J1
aWxkcy9zdWJtaXR0ZWQvMTIzMDkyOTYvYW9zcF9jZl9hcm02NF9vbmx5X3Bob25lLXRydW5rX3N0
YWdpbmctdXNlcmRlYnVnL2xhdGVzdDwvYT4mZ3Q7ICZsdDs8YSBocmVmPSJodHRwczovL2NpLmFu
ZHJvaWQuY29tL2J1aWxkcy9zdWJtaXR0ZWQvMTIzMDkyOTYvYW9zcF9jZl9hcm02NF9vbmx5X3Bo
b25lLXRydW5rX3N0YWdpbmctdXNlcmRlYnVnL2xhdGVzdCIgcmVsPSJub3JlZmVycmVyIiB0YXJn
ZXQ9Il9ibGFuayI+aHR0cHM6Ly9jaS5hbmRyb2lkLmNvbS9idWlsZHMvc3VibWl0dGVkLzEyMzA5
Mjk2L2Fvc3BfY2ZfYXJtNjRfb25seV9waG9uZS10cnVua19zdGFnaW5nLXVzZXJkZWJ1Zy9sYXRl
c3Q8L2E+ICZsdDs8YSBocmVmPSJodHRwczovL2NpLmFuZHJvaWQuY29tL2J1aWxkcy9zdWJtaXR0
ZWQvMTIzMDkyOTYvYW9zcF9jZl9hcm02NF9vbmx5X3Bob25lLXRydW5rX3N0YWdpbmctdXNlcmRl
YnVnL2xhdGVzdCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9jaS5h
bmRyb2lkLmNvbS9idWlsZHMvc3VibWl0dGVkLzEyMzA5Mjk2L2Fvc3BfY2ZfYXJtNjRfb25seV9w
aG9uZS10cnVua19zdGFnaW5nLXVzZXJkZWJ1Zy9sYXRlc3Q8L2E+Jmd0OyZndDsgJmx0OzxhIGhy
ZWY9Imh0dHBzOi8vY2kuYW5kcm9pZC5jb20vYnVpbGRzL3N1Ym1pdHRlZC8xMjMwOTI5Ni9hb3Nw
X2NmX2FybTY0X29ubHlfcGhvbmUtdHJ1bmtfc3RhZ2luZy11c2VyZGVidWcvbGF0ZXN0IiByZWw9
Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2NpLmFuZHJvaWQuY29tL2J1aWxk
cy9zdWJtaXR0ZWQvMTIzMDkyOTYvYW9zcF9jZl9hcm02NF9vbmx5X3Bob25lLXRydW5rX3N0YWdp
bmctdXNlcmRlYnVnL2xhdGVzdDwvYT4gJmx0OzxhIGhyZWY9Imh0dHBzOi8vY2kuYW5kcm9pZC5j
b20vYnVpbGRzL3N1Ym1pdHRlZC8xMjMwOTI5Ni9hb3NwX2NmX2FybTY0X29ubHlfcGhvbmUtdHJ1
bmtfc3RhZ2luZy11c2VyZGVidWcvbGF0ZXN0IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2Js
YW5rIj5odHRwczovL2NpLmFuZHJvaWQuY29tL2J1aWxkcy9zdWJtaXR0ZWQvMTIzMDkyOTYvYW9z
cF9jZl9hcm02NF9vbmx5X3Bob25lLXRydW5rX3N0YWdpbmctdXNlcmRlYnVnL2xhdGVzdDwvYT4m
Z3Q7ICZsdDs8YSBocmVmPSJodHRwczovL2NpLmFuZHJvaWQuY29tL2J1aWxkcy9zdWJtaXR0ZWQv
MTIzMDkyOTYvYW9zcF9jZl9hcm02NF9vbmx5X3Bob25lLXRydW5rX3N0YWdpbmctdXNlcmRlYnVn
L2xhdGVzdCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9jaS5hbmRy
b2lkLmNvbS9idWlsZHMvc3VibWl0dGVkLzEyMzA5Mjk2L2Fvc3BfY2ZfYXJtNjRfb25seV9waG9u
ZS10cnVua19zdGFnaW5nLXVzZXJkZWJ1Zy9sYXRlc3Q8L2E+ICZsdDs8YSBocmVmPSJodHRwczov
L2NpLmFuZHJvaWQuY29tL2J1aWxkcy9zdWJtaXR0ZWQvMTIzMDkyOTYvYW9zcF9jZl9hcm02NF9v
bmx5X3Bob25lLXRydW5rX3N0YWdpbmctdXNlcmRlYnVnL2xhdGVzdCIgcmVsPSJub3JlZmVycmVy
IiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9jaS5hbmRyb2lkLmNvbS9idWlsZHMvc3VibWl0dGVk
LzEyMzA5Mjk2L2Fvc3BfY2ZfYXJtNjRfb25seV9waG9uZS10cnVua19zdGFnaW5nLXVzZXJkZWJ1
Zy9sYXRlc3Q8L2E+Jmd0OyZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqBCdXQgbGV0JiMzOTtzIHNheSB0aGF0IEkgZG9uJiMzOTt0IHdh
bnQgdG8gdXNlIHRoZTxicj4NCiZndDvCoCDCoCDCoCouaW1nPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoGZpbGVzIHRoYXQgYXJlPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBzdG9yZWQgaW5zaWRlPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZxdW90O2Fvc3BfY2ZfYXJt
NjRfb25seV9waG9uZS1pbWctMTIzMDkyOTYuemlwJnF1b3Q7LGJ1dDxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgdGhlIHNhbWUgZmls
ZXMgdGhhdCBoYXZlIGJlZW4gcHJvZHVjZWQgd2hlbiBJPGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoGhhdmUgY29tcGlsZWQgdGhpczxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgdmVyc2lvbiBvZiBBbmRy
b2lkIDo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoDxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS9y
YXNwYmVycnktdmFuaWxsYS9hbmRyb2lkX2xvY2FsX21hbmlmZXN0P3RhYj1yZWFkbWUtb3YtZmls
ZSIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9naXRodWIuY29tL3Jh
c3BiZXJyeS12YW5pbGxhL2FuZHJvaWRfbG9jYWxfbWFuaWZlc3Q/dGFiPXJlYWRtZS1vdi1maWxl
PC9hPiAmbHQ7PGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL3Jhc3BiZXJyeS12YW5pbGxhL2Fu
ZHJvaWRfbG9jYWxfbWFuaWZlc3Q/dGFiPXJlYWRtZS1vdi1maWxlIiByZWw9Im5vcmVmZXJyZXIi
IHRhcmdldD0iX2JsYW5rIj5odHRwczovL2dpdGh1Yi5jb20vcmFzcGJlcnJ5LXZhbmlsbGEvYW5k
cm9pZF9sb2NhbF9tYW5pZmVzdD90YWI9cmVhZG1lLW92LWZpbGU8L2E+Jmd0OyAmbHQ7PGEgaHJl
Zj0iaHR0cHM6Ly9naXRodWIuY29tL3Jhc3BiZXJyeS12YW5pbGxhL2FuZHJvaWRfbG9jYWxfbWFu
aWZlc3Q/dGFiPXJlYWRtZS1vdi1maWxlIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5r
Ij5odHRwczovL2dpdGh1Yi5jb20vcmFzcGJlcnJ5LXZhbmlsbGEvYW5kcm9pZF9sb2NhbF9tYW5p
ZmVzdD90YWI9cmVhZG1lLW92LWZpbGU8L2E+ICZsdDs8YSBocmVmPSJodHRwczovL2dpdGh1Yi5j
b20vcmFzcGJlcnJ5LXZhbmlsbGEvYW5kcm9pZF9sb2NhbF9tYW5pZmVzdD90YWI9cmVhZG1lLW92
LWZpbGUiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZ2l0aHViLmNv
bS9yYXNwYmVycnktdmFuaWxsYS9hbmRyb2lkX2xvY2FsX21hbmlmZXN0P3RhYj1yZWFkbWUtb3Yt
ZmlsZTwvYT4mZ3Q7Jmd0OyAmbHQ7PGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL3Jhc3BiZXJy
eS12YW5pbGxhL2FuZHJvaWRfbG9jYWxfbWFuaWZlc3Q/dGFiPXJlYWRtZS1vdi1maWxlIiByZWw9
Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2dpdGh1Yi5jb20vcmFzcGJlcnJ5
LXZhbmlsbGEvYW5kcm9pZF9sb2NhbF9tYW5pZmVzdD90YWI9cmVhZG1lLW92LWZpbGU8L2E+ICZs
dDs8YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vcmFzcGJlcnJ5LXZhbmlsbGEvYW5kcm9pZF9s
b2NhbF9tYW5pZmVzdD90YWI9cmVhZG1lLW92LWZpbGUiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0
PSJfYmxhbmsiPmh0dHBzOi8vZ2l0aHViLmNvbS9yYXNwYmVycnktdmFuaWxsYS9hbmRyb2lkX2xv
Y2FsX21hbmlmZXN0P3RhYj1yZWFkbWUtb3YtZmlsZTwvYT4mZ3Q7ICZsdDs8YSBocmVmPSJodHRw
czovL2dpdGh1Yi5jb20vcmFzcGJlcnJ5LXZhbmlsbGEvYW5kcm9pZF9sb2NhbF9tYW5pZmVzdD90
YWI9cmVhZG1lLW92LWZpbGUiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBz
Oi8vZ2l0aHViLmNvbS9yYXNwYmVycnktdmFuaWxsYS9hbmRyb2lkX2xvY2FsX21hbmlmZXN0P3Rh
Yj1yZWFkbWUtb3YtZmlsZTwvYT4gJmx0OzxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS9yYXNw
YmVycnktdmFuaWxsYS9hbmRyb2lkX2xvY2FsX21hbmlmZXN0P3RhYj1yZWFkbWUtb3YtZmlsZSIg
cmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9naXRodWIuY29tL3Jhc3Bi
ZXJyeS12YW5pbGxhL2FuZHJvaWRfbG9jYWxfbWFuaWZlc3Q/dGFiPXJlYWRtZS1vdi1maWxlPC9h
PiZndDsmZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKg
IMKgIMKgIMKgQ2FuIEkgZG8gaXQgPyBJcyBpdCBzdXBwb3NlZCB0byB3b3JrIHRoZTxicj4NCiZn
dDvCoCDCoCDCoHNhbWUgPzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgVGhhbmtzLjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgT24gTW9uLCBTZXAgMiwgMjAyNCBhdCAxMDoyM+KAr1BNIFBpZXJyaWNr
PGJyPg0KJmd0O8KgIMKgIMKgQm91dmllcjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgJmx0OzxhIGhyZWY9Im1haWx0bzpwaWVycmlj
ay5ib3V2aWVyQGxpbmFyby5vcmciIHRhcmdldD0iX2JsYW5rIj5waWVycmljay5ib3V2aWVyQGxp
bmFyby5vcmc8L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86
cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnIiB0YXJnZXQ9Il9ibGFuayI+cGllcnJpY2suYm91
dmllckBsaW5hcm8ub3JnPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cGllcnJpY2suYm91dmllckBsaW5h
cm8ub3JnIiB0YXJnZXQ9Il9ibGFuayI+cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnPC9hPjxi
cj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnBpZXJyaWNrLmJvdXZp
ZXJAbGluYXJvLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9y
ZzwvYT4mZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cGllcnJpY2suYm91
dmllckBsaW5hcm8ub3JnIiB0YXJnZXQ9Il9ibGFuayI+cGllcnJpY2suYm91dmllckBsaW5hcm8u
b3JnPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnBpZXJy
aWNrLmJvdXZpZXJAbGluYXJvLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnBpZXJyaWNrLmJvdXZpZXJA
bGluYXJvLm9yZzwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9y
ZyIgdGFyZ2V0PSJfYmxhbmsiPnBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZzwvYT48YnI+DQom
Z3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpwaWVycmljay5ib3V2aWVyQGxp
bmFyby5vcmciIHRhcmdldD0iX2JsYW5rIj5waWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc8L2E+
Jmd0OyZndDsmZ3Q7Jmd0OyB3cm90ZTo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
ICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoE9uIDkvMi8yNCAxMzoyMCwgUGllcnJpY2sgQm91dmllciB3cm90ZTo8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCAmZ3Q7IE9uIDkvMi8yNCAxMjo1MywgTWFyaW8gTWFyaWV0dG8gd3JvdGU6PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
Jmd0OyZndDsgSGVsbG8gUGllcnJpY2suPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDs8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAm
Z3Q7Jmd0OyBXaXRoIEN1dHRsZWZpc2ggY2FuIEkgZW11bGF0ZTxicj4NCiZndDvCoCDCoCDCoEFu
ZHJvaWQgMTQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgZm9yIGFy
bTY0ID8gSTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgYXNrIGJlY2F1c2UgaW48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0OyB5b3Vy
IHNjcmlwdCBJIHJlYWQgOjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDs8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJnF1b3Q7fC9ob21lL3Vz
ZXIvLndvcmsvcWVtdS9idWlsZC9xZW11LXN5c3RlbS14ODZfNjQmcXVvdDssIHNvLEk8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoHN1c3BlY3QgdGhhdCB5b3U8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0OyBoYXZlIGVtdWxhdGVkIEFu
ZHJvaWQgeDY0IGJpdCxidXQ8YnI+DQomZ3Q7wqAgwqAgwqBJIG5lZWQ8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgYXJtNjQuIHw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0Ozxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7IFllcywgaXQgd29ya3MgZm9yIGJvdGg8YnI+
DQomZ3Q7wqAgwqAgwqBhcmNoaXRlY3R1cmUuIFRoZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqBvbmx5IHRoaW5nIEk8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoGRpZG4mIzM5O3QgdHJ5IGlz
IGFuPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgJmd0OyBhcm02NCB2bSBhY2NlbGVyYXRlZCB3aXRoIGt2bSAoSSBkb24m
IzM5O3Q8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgaGF2ZSB0aGlz
IGE8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoGxpbnV4LWFhcmNoNjQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7IG1hY2hpbmUpLCBidXQg
aXQgc2hvdWxkIHdvcmsuPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqBBbmQgb2YgY291cnNlLCBpZiB5b3Ugd2FudCB0byB3cml0ZSBhPGJy
Pg0KJmd0O8KgIMKgIMKgY3VzdG9tPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoHdyYXBwZXIgZm9yPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqBxZW11LCBuYW1lIGl0PGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqBxZW11
LXN5c3RlbS1hYXJjaDY0LCBhbmQgY2FsbCB0aGUgc2FtZTxicj4NCiZndDvCoCDCoCDCoGJpbmFy
eTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqBpbnN0ZWFkIG9mPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqB4ODZfNjQgdmFyaWFudHMuPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7IEkgYWxz
byByZWFkICZxdW90O2ZvciBhYXJjaDY0IGltYWdlczo8YnI+DQomZ3Q7wqAgwqAgwqBzZWxlY3Q8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqB8YW9zcF9jZl9hcm02NF9vbmx5X3Bob25lLXRydW5rX3N0YWdpbmctdXNlcmRlYnVnJnF1
b3Q7IDogSSYjMzk7bTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgbm90IGFibGUgdG88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0OyBk
b3dubG9hZCB0aGlzIGtpbmQgb2YgaW1hZ2VzLiBJIGRvbiYjMzk7dDxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqB1bmRlcnN0YW5kIGhvdyB0aGU8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoEJy
YW5jaCBHcmlkPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDsgd29ya3MuIENhbiB5b3UgZXhwbGFpbiB0byBt
ZSBhPGJyPg0KJmd0O8KgIMKgIMKgbGl0dGxlIGJpdDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqBtb3JlID88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0OyB8PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgICZndDsgWW91IGhhdmUgYSBsaW5rIGp1c3QgbmV4dCB0byBpdDxicj4N
CiZndDvCoCDCoCDCoCgmcXVvdDtCcmFuY2g8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgZ3JpZCZxdW90Oykgb24gdGhlPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqB3aWtpIHBhZ2UuPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgJmd0OyBPbmNlIG9uIGNpIGFuZHJvaWQgcGFnZSwgY2xpY2sgb248YnI+DQomZ3Q7wqAg
wqAgwqBmaWx0ZXI8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgYnV0
dG9uICh0aHJlZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgYmFycywgaW52ZXJ0ZWQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7IHB5cmFt
aWQpLCBhbmQgc2VsZWN0PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqBhb3NwX2NmX2FybTY0
X29ubHlfcGhvbmUtdHJ1bmtfc3RhZ2luZy11c2VyZGVidWcuPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyBUaGVu
IGdvIHRvIGFydGlmYWN0cywgYW5kIGRvd25sb2FkPGJyPg0KJmd0O8KgIMKgIMKgaW1hZ2UgYW5k
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqBjdmRfaG9zdF94ODZfNjQgcGFja2FnZSwgYXM8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7IHdp
a2kgbWVudGlvbnMuPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsgRG9uJiMzOTt0IGhl
c2l0YXRlIHRvIGFzayBtb3JlIHF1ZXN0aW9ucyBvbjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqB0aGlzLiBJIGltYWdpbmU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoHRoaXMgdG9waWMgbWln
aHQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCAmZ3Q7IGludGVyZXN0IHNvbWUgcGVvcGxlIHdobyB0cnkgdG8gZG8gdGhl
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoHNhbWUgdGhpbmcuPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsgUGllcnJpY2s8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgJmd0OyZndDsgfDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7IHw8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7
Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDsgT24gTW9uLCBTZXAg
MiwgMjAyNCBhdCA4OjQ34oCvUE08YnI+DQomZ3Q7wqAgwqAgwqBQaWVycmljazxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqBCb3V2aWVyPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZn
dDsgJmx0OzxhIGhyZWY9Im1haWx0bzpwaWVycmljay5ib3V2aWVyQGxpbmFyby5vcmciIHRhcmdl
dD0iX2JsYW5rIj5waWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc8L2E+PGJyPg0KJmd0O8KgIMKg
IMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cGllcnJpY2suYm91dmllckBsaW5hcm8ub3Jn
IiB0YXJnZXQ9Il9ibGFuayI+cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnPC9hPiZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmx0O21haWx0bzo8YSBocmVm
PSJtYWlsdG86cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnIiB0YXJnZXQ9Il9ibGFuayI+cGll
cnJpY2suYm91dmllckBsaW5hcm8ub3JnPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86
PGEgaHJlZj0ibWFpbHRvOnBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZyIgdGFyZ2V0PSJfYmxh
bmsiPnBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZzwvYT4mZ3Q7Jmd0Ozxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmx0
O21haWx0bzo8YSBocmVmPSJtYWlsdG86cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnIiB0YXJn
ZXQ9Il9ibGFuayI+cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnPC9hPjxicj4NCiZndDvCoCDC
oCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9y
ZyIgdGFyZ2V0PSJfYmxhbmsiPnBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZzwvYT4mZ3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJl
Zj0ibWFpbHRvOnBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnBp
ZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRv
OjxhIGhyZWY9Im1haWx0bzpwaWVycmljay5ib3V2aWVyQGxpbmFyby5vcmciIHRhcmdldD0iX2Js
YW5rIj5waWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc8L2E+Jmd0OyZndDsmZ3Q7PGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpwaWVycmljay5ib3V2aWVyQGxpbmFyby5vcmci
IHRhcmdldD0iX2JsYW5rIj5waWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc8L2E+PGJyPg0KJmd0
O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cGllcnJpY2suYm91dmllckBsaW5h
cm8ub3JnIiB0YXJnZXQ9Il9ibGFuayI+cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnPC9hPiZn
dDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmx0O21haWx0bzo8
YSBocmVmPSJtYWlsdG86cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnIiB0YXJnZXQ9Il9ibGFu
ayI+cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDtt
YWlsdG86PGEgaHJlZj0ibWFpbHRvOnBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZyIgdGFyZ2V0
PSJfYmxhbmsiPnBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZzwvYT4mZ3Q7Jmd0Ozxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cGllcnJpY2suYm91dmllckBsaW5hcm8ub3Jn
IiB0YXJnZXQ9Il9ibGFuayI+cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnPC9hPjxicj4NCiZn
dDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnBpZXJyaWNrLmJvdXZpZXJAbGlu
YXJvLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZzwvYT4m
Z3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDttYWlsdG86
PGEgaHJlZj0ibWFpbHRvOnBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZyIgdGFyZ2V0PSJfYmxh
bmsiPnBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7
bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpwaWVycmljay5ib3V2aWVyQGxpbmFyby5vcmciIHRhcmdl
dD0iX2JsYW5rIj5waWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc8L2E+Jmd0OyZndDsmZ3Q7Jmd0
OyZndDsgd3JvdGU6PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKg
IMKgIEhlbGxvIE1hcmlvLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvC
oCDCoCDCoCB2ZXJ5IHJlY2VudGx5LCBJIGhhZCB0bzxicj4NCiZndDvCoCDCoCDCoGludmVzdGln
YXRlPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoGJvb3RpbmcgdGlt
ZSBvZjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgQW5kcm9pZCB3aGVuIHVzaW5nPGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDC
oCDCoCBRRU1VLiBZb3UgY2FuIHByb2JhYmx5IG1hbmFnZSB0bzxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqBib290IHRoaXMgd2l0aDxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgb25seSBRRU1V
IGFsb25lLCBidXQgaW48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIG15IGV4cGVyaWVuY2Us
IHVzaW5nIEN1dHRsZWZpc2g8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgdG9vbGluZyBpcyBhbjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgZWFzaWVyIGFwcHJvYWNoLjxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZn
dDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCBJZiB5b3UgcmVhbGx5IHdhbnQgdG8g
dXNlPGJyPg0KJmd0O8KgIMKgIMKgb25seSBRRU1VLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqB5b3UgY2FuIHVzZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgQ3V0dGxlZmlzaCB0byBnZXQ8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIGV4YWN0PGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDC
oCDCoCBjb21tYW5kIGxpbmUgdXNlZCAod2hpY2ggZGlzazxicj4NCiZndDvCoCDCoCDCoGdvZXM8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgd2hlcmUpLCBhbmQ8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoGl0ZXJhdGUgZnJvbSB0aGF0Ljxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
Jmd0OyZndDvCoCDCoCDCoCBJbnN0cnVjdGlvbnM6PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDs8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoDxhIGhyZWY9Imh0dHBzOi8vbGluYXJvLmF0bGFzc2lh
bi5uZXQvd2lraS9zcGFjZXMvUUVNVS9wYWdlcy8yOTQ2NDA2ODA5Ny9SdW4rQW5kcm9pZCt1c2lu
ZytRRU1VIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2xpbmFyby5h
dGxhc3NpYW4ubmV0L3dpa2kvc3BhY2VzL1FFTVUvcGFnZXMvMjk0NjQwNjgwOTcvUnVuK0FuZHJv
aWQrdXNpbmcrUUVNVTwvYT4gJmx0OzxhIGhyZWY9Imh0dHBzOi8vbGluYXJvLmF0bGFzc2lhbi5u
ZXQvd2lraS9zcGFjZXMvUUVNVS9wYWdlcy8yOTQ2NDA2ODA5Ny9SdW4rQW5kcm9pZCt1c2luZytR
RU1VIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2xpbmFyby5hdGxh
c3NpYW4ubmV0L3dpa2kvc3BhY2VzL1FFTVUvcGFnZXMvMjk0NjQwNjgwOTcvUnVuK0FuZHJvaWQr
dXNpbmcrUUVNVTwvYT4mZ3Q7ICZsdDs8YSBocmVmPSJodHRwczovL2xpbmFyby5hdGxhc3NpYW4u
bmV0L3dpa2kvc3BhY2VzL1FFTVUvcGFnZXMvMjk0NjQwNjgwOTcvUnVuK0FuZHJvaWQrdXNpbmcr
UUVNVSIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9saW5hcm8uYXRs
YXNzaWFuLm5ldC93aWtpL3NwYWNlcy9RRU1VL3BhZ2VzLzI5NDY0MDY4MDk3L1J1bitBbmRyb2lk
K3VzaW5nK1FFTVU8L2E+ICZsdDs8YSBocmVmPSJodHRwczovL2xpbmFyby5hdGxhc3NpYW4ubmV0
L3dpa2kvc3BhY2VzL1FFTVUvcGFnZXMvMjk0NjQwNjgwOTcvUnVuK0FuZHJvaWQrdXNpbmcrUUVN
VSIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9saW5hcm8uYXRsYXNz
aWFuLm5ldC93aWtpL3NwYWNlcy9RRU1VL3BhZ2VzLzI5NDY0MDY4MDk3L1J1bitBbmRyb2lkK3Vz
aW5nK1FFTVU8L2E+Jmd0OyZndDsgJmx0OzxhIGhyZWY9Imh0dHBzOi8vbGluYXJvLmF0bGFzc2lh
bi5uZXQvd2lraS9zcGFjZXMvUUVNVS9wYWdlcy8yOTQ2NDA2ODA5Ny9SdW4rQW5kcm9pZCt1c2lu
ZytRRU1VIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2xpbmFyby5h
dGxhc3NpYW4ubmV0L3dpa2kvc3BhY2VzL1FFTVUvcGFnZXMvMjk0NjQwNjgwOTcvUnVuK0FuZHJv
aWQrdXNpbmcrUUVNVTwvYT4gJmx0OzxhIGhyZWY9Imh0dHBzOi8vbGluYXJvLmF0bGFzc2lhbi5u
ZXQvd2lraS9zcGFjZXMvUUVNVS9wYWdlcy8yOTQ2NDA2ODA5Ny9SdW4rQW5kcm9pZCt1c2luZytR
RU1VIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2xpbmFyby5hdGxh
c3NpYW4ubmV0L3dpa2kvc3BhY2VzL1FFTVUvcGFnZXMvMjk0NjQwNjgwOTcvUnVuK0FuZHJvaWQr
dXNpbmcrUUVNVTwvYT4mZ3Q7ICZsdDs8YSBocmVmPSJodHRwczovL2xpbmFyby5hdGxhc3NpYW4u
bmV0L3dpa2kvc3BhY2VzL1FFTVUvcGFnZXMvMjk0NjQwNjgwOTcvUnVuK0FuZHJvaWQrdXNpbmcr
UUVNVSIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9saW5hcm8uYXRs
YXNzaWFuLm5ldC93aWtpL3NwYWNlcy9RRU1VL3BhZ2VzLzI5NDY0MDY4MDk3L1J1bitBbmRyb2lk
K3VzaW5nK1FFTVU8L2E+ICZsdDs8YSBocmVmPSJodHRwczovL2xpbmFyby5hdGxhc3NpYW4ubmV0
L3dpa2kvc3BhY2VzL1FFTVUvcGFnZXMvMjk0NjQwNjgwOTcvUnVuK0FuZHJvaWQrdXNpbmcrUUVN
VSIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9saW5hcm8uYXRsYXNz
aWFuLm5ldC93aWtpL3NwYWNlcy9RRU1VL3BhZ2VzLzI5NDY0MDY4MDk3L1J1bitBbmRyb2lkK3Vz
aW5nK1FFTVU8L2E+Jmd0OyZndDsmZ3Q7ICZsdDs8YSBocmVmPSJodHRwczovL2xpbmFyby5hdGxh
c3NpYW4ubmV0L3dpa2kvc3BhY2VzL1FFTVUvcGFnZXMvMjk0NjQwNjgwOTcvUnVuK0FuZHJvaWQr
dXNpbmcrUUVNVSIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9saW5h
cm8uYXRsYXNzaWFuLm5ldC93aWtpL3NwYWNlcy9RRU1VL3BhZ2VzLzI5NDY0MDY4MDk3L1J1bitB
bmRyb2lkK3VzaW5nK1FFTVU8L2E+ICZsdDs8YSBocmVmPSJodHRwczovL2xpbmFyby5hdGxhc3Np
YW4ubmV0L3dpa2kvc3BhY2VzL1FFTVUvcGFnZXMvMjk0NjQwNjgwOTcvUnVuK0FuZHJvaWQrdXNp
bmcrUUVNVSIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9saW5hcm8u
YXRsYXNzaWFuLm5ldC93aWtpL3NwYWNlcy9RRU1VL3BhZ2VzLzI5NDY0MDY4MDk3L1J1bitBbmRy
b2lkK3VzaW5nK1FFTVU8L2E+Jmd0OyAmbHQ7PGEgaHJlZj0iaHR0cHM6Ly9saW5hcm8uYXRsYXNz
aWFuLm5ldC93aWtpL3NwYWNlcy9RRU1VL3BhZ2VzLzI5NDY0MDY4MDk3L1J1bitBbmRyb2lkK3Vz
aW5nK1FFTVUiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vbGluYXJv
LmF0bGFzc2lhbi5uZXQvd2lraS9zcGFjZXMvUUVNVS9wYWdlcy8yOTQ2NDA2ODA5Ny9SdW4rQW5k
cm9pZCt1c2luZytRRU1VPC9hPiAmbHQ7PGEgaHJlZj0iaHR0cHM6Ly9saW5hcm8uYXRsYXNzaWFu
Lm5ldC93aWtpL3NwYWNlcy9RRU1VL3BhZ2VzLzI5NDY0MDY4MDk3L1J1bitBbmRyb2lkK3VzaW5n
K1FFTVUiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vbGluYXJvLmF0
bGFzc2lhbi5uZXQvd2lraS9zcGFjZXMvUUVNVS9wYWdlcy8yOTQ2NDA2ODA5Ny9SdW4rQW5kcm9p
ZCt1c2luZytRRU1VPC9hPiZndDsmZ3Q7ICZsdDs8YSBocmVmPSJodHRwczovL2xpbmFyby5hdGxh
c3NpYW4ubmV0L3dpa2kvc3BhY2VzL1FFTVUvcGFnZXMvMjk0NjQwNjgwOTcvUnVuK0FuZHJvaWQr
dXNpbmcrUUVNVSIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9saW5h
cm8uYXRsYXNzaWFuLm5ldC93aWtpL3NwYWNlcy9RRU1VL3BhZ2VzLzI5NDY0MDY4MDk3L1J1bitB
bmRyb2lkK3VzaW5nK1FFTVU8L2E+ICZsdDs8YSBocmVmPSJodHRwczovL2xpbmFyby5hdGxhc3Np
YW4ubmV0L3dpa2kvc3BhY2VzL1FFTVUvcGFnZXMvMjk0NjQwNjgwOTcvUnVuK0FuZHJvaWQrdXNp
bmcrUUVNVSIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9saW5hcm8u
YXRsYXNzaWFuLm5ldC93aWtpL3NwYWNlcy9RRU1VL3BhZ2VzLzI5NDY0MDY4MDk3L1J1bitBbmRy
b2lkK3VzaW5nK1FFTVU8L2E+Jmd0OyAmbHQ7PGEgaHJlZj0iaHR0cHM6Ly9saW5hcm8uYXRsYXNz
aWFuLm5ldC93aWtpL3NwYWNlcy9RRU1VL3BhZ2VzLzI5NDY0MDY4MDk3L1J1bitBbmRyb2lkK3Vz
aW5nK1FFTVUiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vbGluYXJv
LmF0bGFzc2lhbi5uZXQvd2lraS9zcGFjZXMvUUVNVS9wYWdlcy8yOTQ2NDA2ODA5Ny9SdW4rQW5k
cm9pZCt1c2luZytRRU1VPC9hPiAmbHQ7PGEgaHJlZj0iaHR0cHM6Ly9saW5hcm8uYXRsYXNzaWFu
Lm5ldC93aWtpL3NwYWNlcy9RRU1VL3BhZ2VzLzI5NDY0MDY4MDk3L1J1bitBbmRyb2lkK3VzaW5n
K1FFTVUiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vbGluYXJvLmF0
bGFzc2lhbi5uZXQvd2lraS9zcGFjZXMvUUVNVS9wYWdlcy8yOTQ2NDA2ODA5Ny9SdW4rQW5kcm9p
ZCt1c2luZytRRU1VPC9hPiZndDsmZ3Q7Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0Ozxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAgQXMgeW91JiMzOTtsbCBzZWUsIEkgY291bGQgbm90IGdl
dCBhPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoGRpcmVjdCBncmFw
aGljPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqBvdXRwdXQsIGJ1dCB1c2luZzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAg
wqAgc2NyY3B5LCBpdCB3b3JrZWQgd2VsbCBmb3I8YnI+DQomZ3Q7wqAgwqAgwqBtZS4gSG9wZTxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqBpdCBjYW4gZml0IHlvdXI8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoHVzZSBjYXNlLjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZn
dDvCoCDCoCDCoCBSZWdhcmRzLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAgUGllcnJpY2s8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAgT24gOS8yLzI0
IDA2OjQ5LCBNYXJpbzxicj4NCiZndDvCoCDCoCDCoE1hcmlldHRvIHdyb3RlOjxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
ICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IEhlbGxvLjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDsgSSB3b3VsZCBsaWtl
IHRvIGVtdWxhdGU8YnI+DQomZ3Q7wqAgwqAgwqBBbmRyb2lkPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoDE0IG9uIG15IFVidW50dTxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgMjQuMDQgT1Mg
WDY0IGJpdDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAgdXNpbmc8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7
Jmd0O8KgIMKgIMKgIMKgJmd0OyBxZW11LXN5c3RlbS1hYXJjaDY0LiBJIHRyaWVkPGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoHVzaW5nIHRoZSBmb2xsb3dpbmc8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoHBhcmFtZXRlcnMgOjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDsgcWVtdS1zeXN0ZW0tYWFyY2g2NCBcPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCAtc21wIDQgXDxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgLW0gMjA0OCBc
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCAtY3B1IGNv
cnRleC1hNzIgXDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAg
wqAgLU0gdmlydCBcPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCDCoCAtZGV2aWNlPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoHZp
cnRpby1ncHUtcGNpLHhyZXM9MTAyNCx5cmVzPTc2OCBcPGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCAtZGlzcGxheSBzZGwsZ2w9b24gXDxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
ICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgLWRldmljZSB1c2ItZWhjaSBc
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCAtZGV2aWNl
IHVzYi1rYmQgXDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAg
wqAgLWRldmljZTxicj4NCiZndDvCoCDCoCDCoHZpcnRpby10YWJsZXQtcGNpIFw8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCAmZ3Q7Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIC11c2IgXDxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
ICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgLXNlcmlhbCBzdGRpbyBcPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCAta2VybmVsPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAvbW50L3pyb290LTEzMy9fT1MvQW5kcm9pZC9ycGk0L0ltYWdlIFw8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCAmZ3Q7Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIC1pbml0cmQ8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoDxi
cj4NCiZndDvCoCDCoCDCoCDCoC9tbnQvenJvb3QtMTMzL19PUy9BbmRyb2lkL3JwaTQvcmFtZGlz
ay5pbWcgXDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqDCoMKg
IC1kcml2ZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0
OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgPGJyPg0KJmd0O8KgIMKgIMKg
IMKgaW5kZXg9MCxpZj1ub25lLGlkPXN5c3RlbSxmaWxlPS9tbnQvenJvb3QtMTMzL19PUy9BbmRy
b2lkL3JwaTQvYm9vdC5pbWcgXDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAgwqAgLWRldmljZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqB2aXJ0aW8tYmxrLXBjaSxkcml2ZT1ib290IFw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgwqDCoMKgwqDCoMKgIC1kcml2ZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKgaW5kZXg9MSxpZj1ub25lLGlkPXN5c3RlbSxm
aWxlPS9tbnQvenJvb3QtMTMzL19PUy9BbmRyb2lkL3JwaTQvc3lzdGVtLmltZyBcPGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCAtZGV2aWNlPGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoHZpcnRpby1ibGstcGNpLGRyaXZlPXN5
c3RlbSBcPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCAt
ZHJpdmU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsm
Z3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDC
oGluZGV4PTIsaWY9bm9uZSxpZD12ZW5kb3IsZmlsZT0vbW50L3pyb290LTEzMy9fT1MvQW5kcm9p
ZC9ycGk0L3ZlbmRvci5pbWcgXDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAgwqAgLWRldmljZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqB2aXJ0aW8tYmxrLXBjaSxkcml2ZT12ZW5kb3IgXDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7IC1hcHBlbmQgJnF1b3Q7Y29uc29sZT10dHlBTUEwLDM4NDAwPGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoGRybS5kZWJ1Zz0weDA8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oHJvb3R3YWl0IHJvb3RkZWxheT01PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDsg
cm9vdD0vZGV2L21tY2JsazBwMjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqBhbmRyb2lkYm9vdC5oYXJkd2FyZT1ycGk0PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDC
oCDCoCZndDsgYW5kcm9pZGJvb3Quc2VsaW51eD1wZXJtaXNzaXZlPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoHNlY3VyaXR5PXNlbGludXg8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoHNlbGlu
dXg9MTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGFuZHJvaWRib290LnFlbXUu
aHcubWFpbmtleXM9MDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgYW5kcm9pZGJvb3QubGNkLmRlbnNpdHk9MTYwJnF1b3Q7
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8Kg
IMKgIMKgIMKgJmd0OyBUaGUgZXJyb3IgSSBnZXQgaW4gc2hvcnQgaXMgOjxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZn
dDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDsg
WyAxLjk5MzY2OF0gaW5pdDogYm9vbDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgPGJy
Pg0KJmd0O8KgIMKgIMKgIMKgYW5kcm9pZDo6aW5pdDo6QmxvY2tEZXZJbml0aWFsaXplcjo6SW5p
dERldmljZXMoc3RkOjpzZXQmbHQ7c3RkOjpzdHJpbmcmZ3Q7KTo8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0
O8KgIMKgIMKgIMKgJmd0OyBwYXJ0aXRpb24ocykgbm90IGZvdW5kIGluPGJyPg0KJmd0O8KgIMKg
IMKgL3N5cyw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgd2FpdGlu
ZyBmb3I8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoHRoZWlyIHVldmVudChzKTo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKg
IMKgIG1tY2JsazBwMiw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIMKgJmd0OyBtbWNibGsw
cDM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDsgT25lIHVz
ZXIgc3VnZ2VzdGVkIHRvIDo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDC
oCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZn
dDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDsg
SGkhISEgVGhlICZxdW90Oy9zeXMmcXVvdDsgaXMgYSAmcXVvdDtkeW5hbWljPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoGZzJnF1b3Q7IGNyZWF0ZWQgYXQ8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoHJhbSBmcm9tIHRoZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAga2VybmVsLCB0bzxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGV4cG9ydCBhIGxvdCBvZjxicj4NCiZn
dDvCoCDCoCDCoHRoaW5ncy4uLnNvIG1vc3Q8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgb2YgdGhlIGZpbGVzPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqBvbmx5IGV4aXN0IGF0IHJ1bnRpbWUu
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDsgTm9ybWFsbHksIHRoZSBwYXJ0aXRp
b25zPGJyPg0KJmd0O8KgIMKgIMKgZnJvbSB0aGU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgYmxvY2sgZGV2aWNlPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqBoYXZlIGEgc3ltbGluayBhdDxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IC9zeXMvJmx0O3NvbWV0aGluZyZndDsv
Jmx0Oy4uLiZndDsgdGhhdDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqBwb2ludHMgdG8gL2Rldi88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoGJsb2NrIG5vZGUuIEl0IHNlZW1zPGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgJmd0OyZndDvCoCDCoCDCoCB0aGF0PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZn
dDsgdGhlcmUgYXJlIG5vIHN1Y2ggZmlsZXMgdW5kZXI8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgL3N5cyBhY2NvcmRpbmcgdG88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoHdoYXQgaW5pdCBp
cyBsb29raW5nPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDsgZm9yLiBZb3UgY2Fu
IGRvdWJsZSBjaGVjazxicj4NCiZndDvCoCDCoCDCoHRoaXMgYXQ8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgaW5pdCBzb3VyY2U8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoGNvZGUgdG8gY2hl
Y2sgdGhlPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCBleGFjdDxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7IHBhdGggYnV0IEkmIzM5O20gZ3Vlc3NpbmcgdGhhdDxicj4NCiZn
dDvCoCDCoCDCoHlvdSYjMzk7bGw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgaGF2ZSB0byBjaGFuZ2U8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoHRoZSBxZW11IGFyZ3VtZW50czxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHJlZ2FyZGluZyB0aGUgYmxvY2sgZGV2aWNlLjxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDC
oCDCoCDCoCZndDsgQWJvdXQgdXNlcmRhdGEuaW1nIEkgdGhpbms8YnI+DQomZ3Q7wqAgwqAgwqBp
dCYjMzk7czxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqBub3JtYWwg
c2luY2UgaW48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoHRoZSBvbGQgZGF5cywgdGhlPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvC
oCDCoCDCoCBpbWFnZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHdhcyBhICZx
dW90O2VtcHR5IHNwYXJzZTxicj4NCiZndDvCoCDCoCDCoGltYWdlJnF1b3Q7LCB0aGF0PGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoG1lYW5zLCBhdCB0aGU8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoGZpcnN0IGZsYXNoaW5nPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCBwcm9jZXNzLDxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHRoZXJlIGlzbiYjMzk7dCB1c2VyZGF0
YTxicj4NCiZndDvCoCDCoCDCoGluZm9ybWF0aW9uLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqB3ZSYjMzk7cmUganVzdDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJnF1b3Q7Zmxhc2hpbmcg
dGhlPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCBwYXJ0aXRpb24mcXVvdDs8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCAmZ3Q7Jmd0O8KgIMKgIMKgIMKgJmd0OyB3aXRoIGVtcHR5IGRhdGEuPGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0
OyZndDvCoCDCoCDCoCDCoCZndDsgVGtzISEhPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDC
oCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDsgU28s
aW4gc2hvcnQgSSBzaG91bGQ8YnI+DQomZ3Q7wqAgwqAgwqBjaGFuZ2UgdGhlPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoHFlbXUgYXJndW1lbnRzPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqBy
ZWdhcmRpbmcgdGhlIGJsb2NrPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDsgZGV2
aWNlLiBJIHRyaWVkIGluIHRoaXMgd2F5IDo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIMKg
Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZn
dDvCoCDCoCDCoCDCoCZndDsgcWVtdS1zeXN0ZW0tYWFyY2g2NCBcPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCAtc21wIDQgXDxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgLW0gMjA0OCBcPGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0
OyZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCAtY3B1IGNvcnRleC1hNzIgXDxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgLU0gdmlydCBcPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCAtZGV2aWNlPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoHZpcnRpby1ncHUtcGNpLHhy
ZXM9MTAyNCx5cmVzPTc2OCBcPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCDCoCAtZGlzcGxheSBzZGwsZ2w9b24gXDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgLWRldmljZSB1c2ItZWhjaSBcPGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0
OyZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCAtZGV2aWNlIHVzYi1rYmQgXDxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgLWRldmljZTxicj4N
CiZndDvCoCDCoCDCoHZpcnRpby10YWJsZXQtcGNpIFw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIC11c2IgXDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgLXNlcmlhbCBzdGRpbyBcPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCAta2VybmVsPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAvbW50L3py
b290LTEzMy9fT1MvQW5kcm9pZC9ycGk0L0ltYWdlIFw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIC1pbml0cmQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDC
oCDCoC9tbnQvenJvb3QtMTMzL19PUy9BbmRyb2lkL3JwaTQvcmFtZGlzay5pbWcgXDxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqDCoMKgwqDCoMKgwqAgLWhkYTxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgL21udC96cm9vdC0xMzMvX09TL0FuZHJvaWQvcnBpNC9ib290LmltZyBcPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
Jmd0OyZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCAtaGRiPGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqA8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAvbW50L3pyb290LTEzMy9fT1MvQW5kcm9pZC9ycGk0L3N5c3RlbS5pbWcg
XDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgLWhkYzxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKgL21udC96cm9vdC0xMzMvX09TL0FuZHJvaWQvcnBp
NC92ZW5kb3IuaW1nIFw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgIC1hcHBlbmQ8YnI+DQomZ3Q7wqAgwqAgwqAmcXVvdDtjb25zb2xlPXR0eUFNQTAsMzg0MDA8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoGRybS5kZWJ1Zz0weDAgcm9vdHdhaXQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKg
IMKgIHJvb3RkZWxheT01PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDsgcm9vdD0v
ZGV2L21tY2JsazBwMjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqBh
bmRyb2lkYm9vdC5oYXJkd2FyZT1ycGk0PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZn
dDsgYW5kcm9pZGJvb3Quc2VsaW51eD1wZXJtaXNzaXZlPGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoHNlY3VyaXR5PXNlbGludXg8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoHNlbGludXg9MTxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGFuZHJvaWRib290LnFlbXUuaHcubWFp
bmtleXM9MDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgYW5kcm9pZGJvb3QubGNkLmRlbnNpdHk9MTYwJnF1b3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKg
IMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGJ1dCB0aGUgZXJyb3Ig
aXMgc3RpbGw8YnI+DQomZ3Q7wqAgwqAgwqB0aGVyZS4gRG88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgeW91IGtub3cgc29tZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgZGlmZmVyZW50IGFs
dGVybmF0aXZlPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDsgYmxvY2sgZGV2aWNl
cyB0byB0cnkgPyB0aGFua3MuPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7IC0tPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDsgTWFyaW8uPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgJmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0OyZndDsgLS08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0OyBNYXJpby48YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoC0tPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBNYXJpby48YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
ICZndDvCoCDCoCDCoC0tPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqBNYXJpby48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZn
dDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsgLS08YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsgTWFyaW8uPGJyPg0KJmd0O8KgIMKg
IMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoC0tPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCDCoCDCoE1hcmlvLjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAtLTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqBNYXJpby48YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZn
dDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyAtLTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IE1hcmlv
Ljxicj4NCiZndDsgPGJyPg0KJmd0OyA8YnI+DQomZ3Q7IDxicj4NCiZndDsgLS0gPGJyPg0KJmd0
OyBNYXJpby48YnI+DQo8L2Jsb2NrcXVvdGU+PC9kaXY+PGJyIGNsZWFyPSJhbGwiPjxicj48c3Bh
biBjbGFzcz0iZ21haWxfc2lnbmF0dXJlX3ByZWZpeCI+LS0gPC9zcGFuPjxicj48ZGl2IGRpcj0i
bHRyIiBjbGFzcz0iZ21haWxfc2lnbmF0dXJlIj5NYXJpby48YnI+PC9kaXY+DQo8L2Jsb2NrcXVv
dGU+PC9kaXY+PGJyIGNsZWFyPSJhbGwiPjxicj48c3BhbiBjbGFzcz0iZ21haWxfc2lnbmF0dXJl
X3ByZWZpeCI+LS0gPC9zcGFuPjxicj48ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfc2lnbmF0
dXJlIj5NYXJpby48YnI+PC9kaXY+DQo=
--000000000000b72a0706213d3dae--
