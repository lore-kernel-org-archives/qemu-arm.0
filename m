Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1543297njf;
        Tue, 3 Sep 2024 11:15:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW762qJcL42Xug3sjW3FHztDIwARb5OzGlwh+GOjXN7McMDY8I+zbEY91MddichBXd7kOiBkSVT9yGXDw==@linaro.org
X-Google-Smtp-Source: AGHT+IGgzwMRw9P9Ovrhq/XXkhnyuvvsvgebGRJJ4c3ZFbtFRtVhthPB5NnkDUDrsACpZRHmD6eI
X-Received: by 2002:adf:f64d:0:b0:371:7e3f:6cc with SMTP id ffacd0b85a97d-376dcc8b871mr1125982f8f.9.1725387321370;
        Tue, 03 Sep 2024 11:15:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725387321; cv=none;
        d=google.com; s=arc-20160816;
        b=qLnWJ17QAxsgjS1PBblCVZO+EZ7X2LdRqUY2iASiy/jQ43HCK3yEig3+ll+ramjXTD
         RkJLqcFRtZ79U4sAnatJC8kKW7ae/fYrv1pOokaUXQR0iBm+MJNSS6YdLgrtflO7is7z
         Y2w7eCo+Tk10vn5UZuaDfgIwMrO07/77/+vku5mn8krruru+BnkKkySnnH/KF/D+rrXD
         YLqEZ/Zdq8TgWWob/e4bzyOeCMn+FpmsuPWmxP+RM9yi/LukURz7pAwRzAc2OznFSGup
         sRQdbFuxad3wznLozH5+r0mEULtFOwBn9JbzQQBlc2+/EYJ0sYPTkBzVfFgZvBB6rSRq
         rmvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=JAj21yocxKP9SOpou9Omqh0AuVyU78fMO4l2N5TfaqY=;
        fh=Zg3lQni1M7TByzyaPh9mSNr37Q5og1N1+AuU9IW+VH0=;
        b=sG9SwDpgrv+Fl9BDi5mAoOeW5Fu4xo4Upar+SWfMPjXqZqejSFTd07g8xWRNyHWQs6
         S67E4HIDzCHYBO4v3jgOfMqfMg+vVCA46K2xRt5XDQ0tmksw2iGptkVnmkQm5GGjJN1T
         XGWU0lMcH8n9EnMTPgPN4igpj8useNlkYqR9UZCieeEL9eDare2B5PG6U7zxVit0tmt0
         DJ8Q/6QL4EA6jUQz/K+yy+FjD4I9jYN73MRvJbtvWU8R6+gkGQXUScRJR5u68a3XD7Nj
         Dyum0s317WoklSsjWdM3CV+MegIJEun7ZfbERZ1xPx7KGsFC071CWsaeJGVJ69ZWFNx3
         tNzg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=UVk+djyT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-374bf3d5ce0si3627674f8f.933.2024.09.03.11.15.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2024 11:15:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=UVk+djyT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slY3J-0005z3-KM; Tue, 03 Sep 2024 14:14:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marietto2008@gmail.com>)
 id 1slY3H-0005rO-Sm; Tue, 03 Sep 2024 14:14:51 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marietto2008@gmail.com>)
 id 1slY3A-0001WZ-1l; Tue, 03 Sep 2024 14:14:51 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-7143ae1b560so3071715b3a.1; 
 Tue, 03 Sep 2024 11:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725387282; x=1725992082; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JAj21yocxKP9SOpou9Omqh0AuVyU78fMO4l2N5TfaqY=;
 b=UVk+djyTvk9yWKlvKkv8O4FViEJUVXWRwfVaXNtGwR4i99u6wQkCXoPjkjgo4Kida+
 61bm8ie+lsTSNyL3sU8NDK56LxNuSlT2V/g9ki1DOb1aT+Z9mQE64FD6O0NvWkCF3Qmb
 k1WRlAVvShqYRAu0yfMG1hC0fGntfXV7a7CaUUJHs3IS4kjtFBYnToBFRhEU+SA1BWM7
 nFXebNMetxDtuj+k20vV16BlpThiCqSuCzvf2Pmfz9u9o9Ec07LVIH2srO6EN4dYGF0h
 mrlAzBaMbwQa6wgX8okjhOrjIjy0C/ZOOQLODl9v/JCs99OKLHJz/COECDqjKMnPgvih
 +08g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725387282; x=1725992082;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JAj21yocxKP9SOpou9Omqh0AuVyU78fMO4l2N5TfaqY=;
 b=VRU9i62c7mgGFRw/mw4MZ3Fcp3hN6hp6GegDsbsMd7thsEpHDSkvZSHsFPEGgtczCq
 UXYvZMOgprpJwImdmSDE64YpHsYTT9icDIS1jCywztnsqjy2kjMDPoRCrYpIDej1pd7Q
 SdJQJ4hgAKSlgkDBPSgKm69SAHbn9Ti/Rp5pfbrzsUszjpQoz4SLl3fQ2ft2RBD2ynjh
 fXX2Bo4H8melDhbQifYMPd9mQdnnvDfmF78G0awfOBacxXKSU9/DzT1C/0h4LwakgwiE
 zfl9ogaCiBY+ZWEAAbttPzwu9LIX22NQaziwnpDJXf09tk55+ETy+x/Af0a5KkKMs4IT
 S3pg==
X-Forwarded-Encrypted: i=1;
 AJvYcCURKC34ev0Y/k17PW+KSrD//V63IW70C+q2O6hvHa+27MP188jAlS+ZxSqg+Q/FkA6TxNScSpGNsRqOYnO8@nongnu.org,
 AJvYcCUxG9Lmhl6lp9E6yGz0nxIprHA9NHGlp+P/CCkxwDFyHtlvR6qteTap1f116pKOuGOCjVmxS+99TQ==@nongnu.org
X-Gm-Message-State: AOJu0YwIWoBRy0CX3hr1hVZlD0ZlzrH2QYcAZ7pY+qyFVpUUraR8iRLu
 E69OhvJbFXipwNZ32xVTJqrDLDEdi+D7BYo9565cMhUo0l5bIuWHgU/2C9Rfv2xE7jZtZ+lFlXV
 Cm83mqsQ3geWLri4p0rMpbd5mWubHfh5Jib4=
X-Received: by 2002:a05:6a21:4603:b0:1cc:e500:5f30 with SMTP id
 adf61e73a8af0-1cece517cd4mr12342652637.24.1725387281702; Tue, 03 Sep 2024
 11:14:41 -0700 (PDT)
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
In-Reply-To: <6eac1f19-59a2-440a-a5b3-f4d9654ba539@linaro.org>
From: Mario Marietto <marietto2008@gmail.com>
Date: Tue, 3 Sep 2024 20:14:01 +0200
Message-ID: <CA+1FSigjog5DO4UJ4bjo+rvtRc2ih+yJF0q9HM7y6N=aSg6w=A@mail.gmail.com>
Subject: Re: Error : init: partition(s) not found in /sys, waiting for their
 uevent(s): mmcblk0p2, mmcblk0p3 while trying to emulate Android 14 on Ubuntu
 24.04 X64 bit using qemu-system-aarch64.
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-discuss@nongnu.org, 
 qemu-arm <qemu-arm@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000006a7ed06213b086c"
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=marietto2008@gmail.com; helo=mail-pf1-x429.google.com
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
X-TUID: lym7HuVeWGUs

--00000000000006a7ed06213b086c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>Depends which version of Android you use, but images are getting bigger
and bigger every time since Android 5, so I'm not surprised it >takes more
and more time to boot.

If I will be able to boot Android 10 using the qemu patched by
Antmicro,maybe I will try if it will work with Android 14 for Raspberry Pi
4.
Just for the sake of my curiosity.



On Tue, Sep 3, 2024 at 8:03=E2=80=AFPM Pierrick Bouvier <pierrick.bouvier@l=
inaro.org>
wrote:

> On 9/3/24 10:17, Mario Marietto wrote:
> > @Pierrick Bouvier :
> >
> > ---> I'm really glad to see it worked! Are you already running the
> > raspberry image, or vanilla AOSP ?
> >
> > No and I don't think I will. I have a project that I'm working on that
> > aims to emulate Android for Arm on Linux x64 bit. I knew that it would
> > be slow,but I didn't think it would be so much. When I used AVD as an
> > emulator,Android went faster.
> >
> >
>
> Depends which version of Android you use, but images are getting bigger
> and bigger everytime since Android 5, so I'm not surprised it takes more
> and more time to boot.
>
> By AVD, if you refer to Android emulator included in Android Studio,
> it's a downstream fork of QEMU. So the performance will be on par (or
> worse) than upstream QEMU.
>
> The only way to have something that goes fast is to have aarch64
> hardware and use kvm acceleration (on Linux, or equivalent on
> Windows/MacOS).
>
> >       @Peter Maydell <mailto:peter.maydell@linaro.org> :
> >
> >
> > I think that I've understood the reason why several years ago it worked=
.
> > Probably I'd used this special version of qemu :
> >
> >
> > https://github.com/antmicro/kvm-aosp-qemu/releases/tag/5.0.0-kvm-aosp
> > <https://github.com/antmicro/kvm-aosp-qemu/releases/tag/5.0.0-kvm-aosp>
> >
> > I'm sure that it contains the necessary patches to be able to boot
> > Android 10 on the Jetson Nano.
> >
> > On Tue, Sep 3, 2024 at 6:31=E2=80=AFPM Pierrick Bouvier
> > <pierrick.bouvier@linaro.org <mailto:pierrick.bouvier@linaro.org>>
> wrote:
> >
> >     Without answering specifically on your question, if you want to
> >     exchange
> >     files with a android guest, simply use adb (push/pull commands). It=
's
> >     much better and faster than any other solution you can try, and
> >     cuttlefish tools already setup all the adb stuff for you.
> >
> >     You can use adb-sync (https://github.com/jb2170/better-adb-sync
> >     <https://github.com/jb2170/better-adb-sync>) to have
> >     something similar to rsync, in case you want to send files
> >     incrementally.
> >
> >     Pierrick
> >
> >     On 9/3/24 08:24, Mario Marietto wrote:
> >      > Hello.
> >      >
> >      > Actually I'm using my Jetson Nano and I'm trying to emulate
> >     Android 10
> >      > by antmicro. I'm trying to use the same parameters used several
> >     years
> >      > ago,when it worked. What I want to try now is to enable
> >     virtio-blk-pci
> >      > on qemu. Probably in addition to using qemu 5.0,I had configured
> >     qemu
> >      > with virtio-blk-pci enabled,because I used these parameters and
> they
> >      > worked great :
> >      >
> >      > -drive
> >      >
> >
>  index=3D0,if=3Dnone,id=3Dsystem,file=3D/home/aresuser/Desktop/antmicro/a=
osp-img/system-rw.img
> \
> >      >          -device virtio-blk-pci,drive=3Dsystem \
> >      >          -drive
> >      >
> >
>  index=3D1,if=3Dnone,id=3Dvendor,file=3D/home/aresuser/Desktop/antmicro/a=
osp-img/vendor-rw.img
> \
> >      >          -device virtio-blk-pci,drive=3Dvendor \
> >      >          -drive
> >      >
> >
>  index=3D2,if=3Dnone,id=3Duserdata,file=3D/home/aresuser/Desktop/antmicro=
/aosp-img/userdata.img
> \
> >      >          -device virtio-blk-pci,drive=3Duserdata \
> >      >
> >      > Can someone tell me how to enable the "VirtFS support" in qemu
> 5.0 ?
> >      > because at the moment it is configured to "no" :
> >      >
> >      > root@jetson:/home/aresuser/Desktop/antmicro/qemu-5.0.0#
> ./configure
> >      > Install prefix    /usr/local
> >      > BIOS directory    /usr/local/share/qemu
> >      > firmware path     /usr/local/share/qemu-firmware
> >      > binary directory  /usr/local/bin
> >      > library directory /usr/local/lib
> >      > module directory  /usr/local/lib/qemu
> >      > libexec directory /usr/local/libexec
> >      > include directory /usr/local/include
> >      > config directory  /usr/local/etc
> >      > local state directory   /usr/local/var
> >      > Manual directory  /usr/local/share/man
> >      > ELF interp prefix /usr/gnemul/qemu-%M
> >      > Build directory   /home/aresuser/Desktop/antmicro/qemu-5.0.0
> >      > Source path       /home/aresuser/Desktop/antmicro/qemu-5.0.0
> >      > GIT binary        git
> >      > GIT submodules
> >      > C compiler        cc
> >      > Host C compiler   cc
> >      > C++ compiler      c++
> >      > Objective-C compiler clang
> >      > ARFLAGS           rv
> >      > CFLAGS            -O2 -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3D2 -g
> >      > QEMU_CFLAGS       -I/usr/include/pixman-1 -I$(SRC_PATH)/dtc/libf=
dt
> >      >   -pthread -I/usr/include/glib-2.0
> >      > -I/usr/lib/aarch64-linux-gnu/glib-2.0/include -fPIE -DPIE
> >       -D_GNU_SOURCE
> >      > -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -Wstrict-prototypes
> >      > -Wredundant-decls -Wall -Wundef -Wwrite-strings
> -Wmissing-prototypes
> >      > -fno-strict-aliasing -fno-common -fwrapv -std=3Dgnu99
> >      >   -Wexpansion-to-defined -Wendif-labels -Wno-shift-negative-valu=
e
> >      > -Wno-missing-include-dirs -Wempty-body -Wnested-externs
> >      > -Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers
> >      > -Wold-style-declaration -Wold-style-definition -Wtype-limits
> >      > -fstack-protector-strong  -I/usr/include/libpng16
> >      >   -I$(SRC_PATH)/capstone/include
> >      > QEMU_LDFLAGS      -L$(BUILD_DIR)/dtc/libfdt -Wl,-z,relro
> >     -Wl,-z,now -pie
> >      >   -fstack-protector-strong
> >      > make              make
> >      > install           install
> >      > python            /usr/bin/python3 -B (3.10.12)
> >      > genisoimage       /usr/bin/genisoimage
> >      > slirp support     internal
> >      > smbd              /usr/sbin/smbd
> >      > module support    no
> >      > alt path mod load no
> >      > host CPU          aarch64
> >      > host big endian   no
> >      > target list       aarch64-softmmu alpha-softmmu arm-softmmu
> >     cris-softmmu
> >      > hppa-softmmu i386-softmmu lm32-softmmu m68k-softmmu
> >     microblaze-softmmu
> >      > microblazeel-softmmu mips-softmmu mips64-softmmu mips64el-softmm=
u
> >      > mipsel-softmmu moxie-softmmu nios2-softmmu or1k-softmmu
> ppc-softmmu
> >      > ppc64-softmmu riscv32-softmmu riscv64-softmmu rx-softmmu
> >     s390x-softmmu
> >      > sh4-softmmu sh4eb-softmmu sparc-softmmu sparc64-softmmu
> >     tricore-softmmu
> >      > unicore32-softmmu x86_64-softmmu xtensa-softmmu xtensaeb-softmmu
> >      > aarch64-linux-user aarch64_be-linux-user alpha-linux-user
> >     arm-linux-user
> >      > armeb-linux-user cris-linux-user hppa-linux-user i386-linux-user
> >      > m68k-linux-user microblaze-linux-user microblazeel-linux-user
> >      > mips-linux-user mips64-linux-user mips64el-linux-user
> >     mipsel-linux-user
> >      > mipsn32-linux-user mipsn32el-linux-user nios2-linux-user
> >     or1k-linux-user
> >      > ppc-linux-user ppc64-linux-user ppc64abi32-linux-user
> >     ppc64le-linux-user
> >      > riscv32-linux-user riscv64-linux-user s390x-linux-user
> >     sh4-linux-user
> >      > sh4eb-linux-user sparc-linux-user sparc32plus-linux-user
> >      > sparc64-linux-user tilegx-linux-user x86_64-linux-user
> >     xtensa-linux-user
> >      > xtensaeb-linux-user
> >      > gprof enabled     no
> >      > sparse enabled    no
> >      > strip binaries    yes
> >      > profiler          no
> >      > static build      no
> >      > SDL support       yes (2.26.1)
> >      > SDL image support no
> >      > GTK support       yes (3.24.33)
> >      > GTK GL support    yes
> >      > VTE support       no
> >      > TLS priority      NORMAL
> >      > GNUTLS support    no
> >      > libgcrypt         no
> >      > nettle            no
> >      > libtasn1          no
> >      > PAM               no
> >      > iconv support     yes
> >      > curses support    yes
> >      > virgl support     no
> >      > curl support      no
> >      > mingw32 support   no
> >      > Audio drivers     pa oss
> >      > Block whitelist (rw)
> >      > Block whitelist (ro)
> >      >
> >      > *VirtFS support    no*
> >      >
> >      > Multipath support no
> >      > VNC support       yes
> >      > VNC SASL support  no
> >      > VNC JPEG support  yes
> >      > VNC PNG support   yes
> >      > xen support       no
> >      > brlapi support    no
> >      > Documentation     no
> >      > PIE               yes
> >      > vde support       no
> >      > netmap support    no
> >      > Linux AIO support no
> >      > Linux io_uring support no
> >      > ATTR/XATTR support yes
> >      > Install blobs     yes
> >      > KVM support       yes
> >      > HAX support       no
> >      > HVF support       no
> >      > WHPX support      no
> >      > TCG support       yes
> >      > TCG debug enabled no
> >      > TCG interpreter   no
> >      > malloc trim support yes
> >      > RDMA support      no
> >      > PVRDMA support    no
> >      > fdt support       git
> >      > membarrier        no
> >      > preadv support    yes
> >      > fdatasync         yes
> >      > madvise           yes
> >      > posix_madvise     yes
> >      > posix_memalign    yes
> >      > libcap-ng support no
> >      > vhost-net support yes
> >      > vhost-crypto support yes
> >      > vhost-scsi support yes
> >      > vhost-vsock support yes
> >      > vhost-user support yes
> >      > vhost-user-fs support yes
> >      > Trace backends    log
> >      > spice support     no
> >      > rbd support       no
> >      > xfsctl support    no
> >      > smartcard support no
> >      > libusb            no
> >      > usb net redir     no
> >      > OpenGL support    yes
> >      > OpenGL dmabufs    yes
> >      > libiscsi support  no
> >      > libnfs support    no
> >      > build guest agent yes
> >      > QGA VSS support   no
> >      > QGA w32 disk info no
> >      > QGA MSI support   no
> >      > seccomp support   no
> >      > coroutine backend ucontext
> >      > coroutine pool    yes
> >      > debug stack usage no
> >      > mutex debugging   no
> >      > crypto afalg      no
> >      > GlusterFS support no
> >      > gcov              gcov
> >      > gcov enabled      no
> >      > TPM support       yes
> >      > libssh support    no
> >      > QOM debugging     yes
> >      > Live block migration yes
> >      > lzo support       no
> >      > snappy support    no
> >      > bzip2 support     no
> >      > lzfse support     no
> >      > zstd support      no
> >      > NUMA host support yes
> >      > libxml2           yes
> >      > tcmalloc support  no
> >      > jemalloc support  no
> >      > avx2 optimization
> >      > avx512f optimization no
> >      > replication support yes
> >      > VxHS block device no
> >      > bochs support     yes
> >      > cloop support     yes
> >      > dmg support       yes
> >      > qcow v1 support   yes
> >      > vdi support       yes
> >      > vvfat support     yes
> >      > qed support       yes
> >      > parallels support yes
> >      > sheepdog support  yes
> >      > capstone          internal
> >      > libpmem support   no
> >      > libudev           yes
> >      > default devices   yes
> >      > plugin support    no
> >      > fuzzing support   no
> >      > gdb               /usr/bin/gdb
> >      > cross containers  docker
> >      >
> >      > Thanks.
> >      >
> >      > On Tue, Sep 3, 2024 at 10:55=E2=80=AFAM Mario Marietto
> >     <marietto2008@gmail.com <mailto:marietto2008@gmail.com>
> >      > <mailto:marietto2008@gmail.com <mailto:marietto2008@gmail.com>>>
> >     wrote:
> >      >
> >      >     Finally it worked :
> >      >
> >      >     Istantanea_2024-09-03_10-51-35.jpg
> >      >     Very thanks man. In any case it is VERY slow and not usable
> >     at all.
> >      >     Is there something that I can do to improve its speed ?
> >      >
> >      >
> >      >     On Tue, Sep 3, 2024 at 10:33=E2=80=AFAM Mario Marietto
> >      >     <marietto2008@gmail.com <mailto:marietto2008@gmail.com>
> >     <mailto:marietto2008@gmail.com <mailto:marietto2008@gmail.com>>>
> wrote:
> >      >
> >      >
> >       ziomario@Z390-AORUS-PRO-DEST:/mnt/zroot-133/_OS/Android/aosp_14/a=
ndroid-image$
> HOME=3D$(pwd) ./bin/launch_cvd -vm_manager qemu_cli
> -report_anonymous_usage_stats=3Dn --start_webrtc=3Dfalse
> >      >
> >      >         09-03 10:04:44.206 2786386 2786386 I launch_cvd:
> main.cc:235
> >      >         Using system_image_dir of:
> >      >
> >       =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >      >         NOTICE:
> >      >
> >      >         By using this Android Virtual Device, you agree to
> >      >         Google Terms of Service
> >     (https://policies.google.com/terms <
> https://policies.google.com/terms>
> >      >         <https://policies.google.com/terms
> >     <https://policies.google.com/terms>>).
> >      >         The Google Privacy Policy
> >     (https://policies.google.com/privacy
> >     <https://policies.google.com/privacy>
> >      >         <https://policies.google.com/privacy
> >     <https://policies.google.com/privacy>>)
> >      >         describes how Google handles information generated as yo=
u
> use
> >      >         Google Services.
> >      >
> >       =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >      >
> >      >         Reading --config option from:
> >      >
> >       /mnt/zroot-133/_OS/Android/aosp_14/android-image/android-info.txt
> >      >         Launching CVD using --config=3D'phone'.
> >      >         GPU auto mode: detected prerequisites for accelerated
> >     rendering
> >      >         support.
> >      >         Enabling --gpu_mode=3Dgfxstream.
> >      >         GPU vhost user auto mode: not yet supported with
> >     qemu_cli. Not
> >      >         enabling vhost user gpu.
> >      >         Requested resuming a previous session (the default
> >     behavior) but
> >      >         the base images have changed under the overlay, making t=
he
> >      >         overlay incompatible. Wiping the overlay files.
> >      >         Path for instance UDS: /tmp/cf_avd_1000
> >      >
> >      >         The following lines contain useful debugging information=
:
> >      >           Serial console is disabled; use -console=3Dtrue to ena=
ble
> it.
> >      >           Logcat output:
> >      >
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/cuttlefish/instances/cv=
d-1/logs/logcat
> >      >
> >      >           Kernel log:
> >      >
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/cuttlefish/instances/cv=
d-1/kernel.log
> >      >           Launcher log:
> >      >
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/cuttlefish/instances/cv=
d-1/logs/launcher.log
> >      >
> >      >           Instance configuration:
> >      >
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/cuttlefish/instances/cv=
d-1/cuttlefish_config.json
> >      >
> >      >           Launcher Build ID: 12309296
> >      >
> >      >
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/modem_simulator
> >      >
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/tombstone_receiver
> >      >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/log_tee
> >      >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/wmediumd
> >      >
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/casimir_control_ser=
ver
> >      >
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/screen_recording_se=
rver
> >      >
> >       /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/adb_connecto=
r
> >      >
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/socket_vsock_proxy
> >      >
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/socket_vsock_proxy
> >      >
> >       /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/tcp_connecto=
r
> >      >
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/control_env_proxy_s=
erver
> >      >
> >       /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/echo_server
> >      >         Start modem simulator, server_fds: 58, Sim type: normal
> >      >
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/gnss_grpc_proxy
> >      >
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/logcat_receiver
> >      >
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/kernel_log_monitor
> >      >
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/openwrt_control_ser=
ver
> >      >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/log_tee
> >      >
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/process_restarter
> >      >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/netsimd
> >      >
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/socket_vsock_proxy
> >      >
> >      >         Failed to open socket: Connection refused
> >      >
> >      >
> >      >
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/socket_vsock_proxy
> >      >
> >       /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/secure_env
> >      >
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/x86_64-linux-gnu/qe=
mu/qemu-system-aarch64
> >      >         Server listening on
> >      >
> >       unix:/tmp/cf_avd_1000/cvd-1/grpc_socket/CasimirControlServer.sock
> >      >         Server listening on
> >      >         unix:/tmp/cf_avd_1000/cvd-1/grpc_socket/EchoServer.sock
> >      >         Server listening on
> >      >
> >       unix:/tmp/cf_avd_1000/cvd-1/grpc_socket/OpenwrtControlServer.sock
> >      >         root-canal I 09-03 10:06:13.219 device_boutique.cc:37
> >      >         Registering beacon
> >      >         root-canal I 09-03 10:06:13.219 device_boutique.cc:37
> >      >         Registering beacon_swarm
> >      >         root-canal I 09-03 10:06:13.219 device_boutique.cc:37
> >      >         Registering scripted_beacon
> >      >         root-canal I 09-03 10:06:13.219 device_boutique.cc:37
> >      >         Registering sniffer
> >      >         Server listening on
> >      >
> >       unix:/tmp/cf_avd_1000/cvd-1/grpc_socket/ControlEnvProxyServer.soc=
k
> >      >         netsimd I 09-03 08:06:13.221 rust_main.rs:98
> >     <http://rust_main.rs:98>
> >      >         <http://rust_main.rs:98 <http://rust_main.rs:98>> -
> >     netsim artifacts path:
> >      >         "/tmp/android-ziomario/netsimd"
> >      >         netsimd I 09-03 08:06:13.221 rust_main.rs:101
> >     <http://rust_main.rs:101>
> >      >         <http://rust_main.rs:101 <http://rust_main.rs:101>> -
> >     NetsimdArgs {
> >      >             fd_startup_str: Some(
> >      >                 "{\"devices\":[{\"name\":\"0.0.0.0:6520
> >     <http://0.0.0.0:6520>
> >      >         <http://0.0.0.0:6520
> >     <http://0.0.0.0:6520
> >>\",\"chips\":[{\"kind\":\"BLUETOOTH\",\"fdIn\":81,\"fdOut\":82},{\"kind=
\":\"UWB\",\"fdIn
> >      >         \":83,\"fdOut\":84}]}]}",
> >      >             ),
> >      >             no_cli_ui: false,
> >      >             no_web_ui: false,
> >      >             pcap: false,
> >      >             disable_address_reuse: false,
> >      >             hci_port: Some(
> >      >                 7300,
> >      >             ),
> >      >             connector_instance: None,
> >      >             instance: Some(
> >      >                 1,
> >      >             ),
> >      >             logtostderr: false,
> >      >             dev: false,
> >      >             rust_grpc: false,
> >      >             rust_hostapd: false,
> >      >             rust_slirp: true,
> >      >             vsock: None,
> >      >             config: None,
> >      >             host_dns: None,
> >      >             http_proxy: None,
> >      >             wifi_tap: None,
> >      >             test_beacons: false,
> >      >             no_test_beacons: false,
> >      >             no_shutdown: false,
> >      >             verbose: false,
> >      >             version: false,
> >      >         }
> >      >         Size of OBJECT =3D 1204
> >      >         Size of components in TPMT_SENSITIVE =3D 744
> >      >             TPMI_ALG_PUBLIC                 2
> >      >             TPM2B_AUTH                      50
> >      >             TPM2B_DIGEST                    50
> >      >             TPMU_SENSITIVE_COMPOSITE        642
> >      >         MAX_CONTEXT_SIZE can be reduced to 1264 (1344)
> >      >         size : 360
> >      >         starting Rust KeyMint TA implementation in a thread
> >      >         starting C++ KeyMint implementation in a thread with FDs
> >     in=3D31,
> >      >         out=3D30
> >      >         KeyMint Rust TA running with infile=3D37, outfile=3D36,
> >      >         security_level=3DSoftware
> >      >         No secure deletion data file found. Creating one.
> >      >         I0903 10:06:13.249418 2786724 SharedLibrary.cpp:64]
> >      >         SharedLibrary::open for [libvulkan.so]
> >      >
> >      >         I0903 10:06:13.249507 2786724 SharedLibrary.cpp:76]
> >      >         SharedLibrary::open for [libvulkan.so]: not found in map=
,
> >     open
> >      >         for the first time
> >      >
> >      >         I0903 10:06:13.249511 2786724 SharedLibrary.cpp:186]
> >      >         SharedLibrary::open for [libvulkan.so] (posix): begin
> >      >
> >      >         I0903 10:06:13.249514 2786724 SharedLibrary.cpp:244]
> >      >         SharedLibrary::open for [libvulkan.so] (posix,linux): ca=
ll
> >      >         dlopen on [libvulkan.so
> >      >         ]
> >      >
> >      >         added library libvulkan.so
> >      >         I0903 10:06:13.250535 2786724 HealthMonitor.cpp:280]
> >      >         HealthMonitor disabled.
> >      >         createGlobalVkEmulation:964 Selecting Vulkan device:
> NVIDIA
> >      >         GeForce GTX 1060 3GB
> >      >         initialize: Supports id properties, got a vulkan device
> UUID
> >      >         I0903 10:06:13.354756 2786724 SharedLibrary.cpp:76]
> >      >         SharedLibrary::open for [libGLESv2.so]: not found in map=
,
> >     open
> >      >         for the first time
> >      >
> >      >         I0903 10:06:13.354764 2786724 SharedLibrary.cpp:186]
> >      >         SharedLibrary::open for [libGLESv2.so] (posix): begin
> >      >
> >      >         I0903 10:06:13.354768 2786724 SharedLibrary.cpp:244]
> >      >         SharedLibrary::open for [libGLESv2.so] (posix,linux): ca=
ll
> >      >         dlopen on [libGLESv2.so
> >      >         ]
> >      >
> >      >         I0903 10:06:13.355076 2786724 SharedLibrary.cpp:76]
> >      >         SharedLibrary::open for [libEGL.so]: not found in map,
> >     open for
> >      >         the first time
> >      >
> >      >         I0903 10:06:13.355081 2786724 SharedLibrary.cpp:186]
> >      >         SharedLibrary::open for [libEGL.so] (posix): begin
> >      >
> >      >         I0903 10:06:13.355084 2786724 SharedLibrary.cpp:244]
> >      >         SharedLibrary::open for [libEGL.so] (posix,linux): call
> >     dlopen
> >      >         on [libEGL.so]
> >      >
> >      >         I0903 10:06:13.448821 2786724 VkCommonOperations.cpp:122=
6]
> >      >         Initializing VkEmulation features:
> >      >         I0903 10:06:13.448837 2786724 VkCommonOperations.cpp:122=
7]
> >      >              glInteropSupported: true
> >      >         I0903 10:06:13.448840 2786724 VkCommonOperations.cpp:122=
8]
> >      >              useDeferredCommands: true
> >      >         I0903 10:06:13.448842 2786724 VkCommonOperations.cpp:123=
0]
> >      >              createResourceWithRequirements: true
> >      >         I0903 10:06:13.448844 2786724 VkCommonOperations.cpp:123=
1]
> >      >              useVulkanComposition: false
> >      >         I0903 10:06:13.448846 2786724 VkCommonOperations.cpp:123=
2]
> >      >              useVulkanNativeSwapchain: false
> >      >         I0903 10:06:13.448848 2786724 VkCommonOperations.cpp:123=
3]
> >      >              enable guestRenderDoc: false
> >      >         I0903 10:06:13.448850 2786724 VkCommonOperations.cpp:123=
4]
> >      >              ASTC LDR emulation mode: 2
> >      >         I0903 10:06:13.448852 2786724 VkCommonOperations.cpp:123=
5]
> >      >              enable ETC2 emulation: true
> >      >         I0903 10:06:13.448854 2786724 VkCommonOperations.cpp:123=
6]
> >      >              enable Ycbcr emulation: false
> >      >         I0903 10:06:13.448856 2786724 VkCommonOperations.cpp:123=
7]
> >      >              guestUsesAngle: false
> >      >         I0903 10:06:13.448858 2786724 VkCommonOperations.cpp:123=
8]
> >      >              useDedicatedAllocations: false
> >      >         I0903 10:06:13.449542 2786724 FrameBuffer.cpp:486]
> Graphics
> >      >         Adapter Vendor Google (NVIDIA Corporation)
> >      >         I0903 10:06:13.449548 2786724 FrameBuffer.cpp:487]
> Graphics
> >      >         Adapter Android Emulator OpenGL ES Translator (NVIDIA
> GeForce
> >      >         GTX 1060 3GB/
> >      >         PCIe/SSE2)
> >      >         I0903 10:06:13.449551 2786724 FrameBuffer.cpp:488]
> >     Graphics API
> >      >         Version OpenGL ES 3.0 (OpenGL ES 3.2 NVIDIA 535.183.01)
> >      >         I0903 10:06:13.449553 2786724 FrameBuffer.cpp:489]
> >     Graphics API
> >      >         Extensions GL_OES_EGL_sync GL_OES_EGL_image
> >      >         GL_OES_EGL_image_external G
> >      >         L_OES_depth24 GL_OES_depth32 GL_OES_element_index_uint
> >      >         GL_OES_texture_float GL_OES_texture_float_linear
> >      >         GL_OES_compressed_paletted_text
> >      >         ure GL_OES_compressed_ETC1_RGB8_texture
> GL_OES_depth_texture
> >      >         GL_OES_texture_half_float GL_OES_texture_half_float_line=
ar
> >      >         GL_OES_packed_d
> >      >         epth_stencil GL_OES_vertex_half_float
> >      >         GL_OES_standard_derivatives GL_OES_texture_npot
> >      >         GL_OES_rgb8_rgba8 GL_OVR_multiview2 GL_EXT_multiv
> >      >         iew_texture_multisample GL_EXT_color_buffer_float
> >      >         GL_EXT_color_buffer_half_float
> GL_EXT_texture_format_BGRA8888
> >      >         GL_APPLE_texture_format
> >      >         _BGRA8888 GL_EXT_texture_buffer GL_OES_texture_buffer
> >      >         GL_EXT_draw_buffers_indexed
> >      >         I0903 10:06:13.449559 2786724 FrameBuffer.cpp:490]
> Graphics
> >      >         Device Extensions N/A
> >      >         GUEST_UBOOT_VERSION: 2024.01-g1ed8f8bde33e-ab12091206
> (Jul 10
> >      >         2024 - 23:47:38 +0000)
> >      >         U-Boot 20
> >      >         starting Rust KeyMint TA implementation in a thread
> >      >         starting C++ KeyMint implementation in a thread with FDs
> >     in=3D31,
> >      >         out=3D30
> >      >         KeyMint Rust TA running with infile=3D37, outfile=3D36,
> >      >         security_level=3DSoftware
> >      >         Secure deletion data file found. Parsing.
> >      >         2024-09-03T08:06:13.626075Z qemu-system-aarch64:
> >      >         virtio-serial-bus: Unexpected port id 16 for device
> >     virtio-serial.0
> >      >         2024-09-03T08:06:13.626410Z qemu-system-aarch64:
> >      >         virtio-serial-bus: Unexpected port id 17 for device
> >     virtio-serial.0
> >      >         2024-09-03T08:06:13.626599Z qemu-system-aarch64:
> >      >         virtio-serial-bus: Unexpected port id 18 for device
> >     virtio-serial.0
> >      >         2024-09-03T08:06:13.626788Z qemu-system-aarch64:
> >      >         virtio-serial-bus: Unexpected port id 19 for device
> >     virtio-serial.0
> >      >         2024-09-03T08:06:13.626980Z qemu-system-aarch64:
> >      >         virtio-serial-bus: Unexpected port id 20 for device
> >     virtio-serial.0
> >      >         2024-09-03T08:06:13.627171Z qemu-system-aarch64:
> >      >         virtio-serial-bus: Unexpected port id 21 for device
> >     virtio-serial.0
> >      >         2024-09-03T08:06:13.627360Z qemu-system-aarch64:
> >      >         virtio-serial-bus: Unexpected port id 22 for device
> >     virtio-serial.0
> >      >         2024-09-03T08:06:13.627549Z qemu-system-aarch64:
> >      >         virtio-serial-bus: Unexpected port id 23 for device
> >     virtio-serial.0
> >      >         2024-09-03T08:06:13.627738Z qemu-system-aarch64:
> >      >         virtio-serial-bus: Unexpected port id 24 for device
> >     virtio-serial.0
> >      >         2024-09-03T08:06:13.627930Z qemu-system-aarch64:
> >      >         virtio-serial-bus: Unexpected port id 25 for device
> >     virtio-serial.0
> >      >         2024-09-03T08:06:13.628119Z qemu-system-aarch64:
> >      >         virtio-serial-bus: Unexpected port id 26 for device
> >     virtio-serial.0
> >      >         2024-09-03T08:06:13.628307Z qemu-system-aarch64:
> >      >         virtio-serial-bus: Unexpected port id 27 for device
> >     virtio-serial.0
> >      >         2024-09-03T08:06:13.628496Z qemu-system-aarch64:
> >      >         virtio-serial-bus: Unexpected port id 28 for device
> >     virtio-serial.0
> >      >         2024-09-03T08:06:13.628683Z qemu-system-aarch64:
> >      >         virtio-serial-bus: Unexpected port id 29 for device
> >     virtio-serial.0
> >      >         2024-09-03T08:06:13.628874Z qemu-system-aarch64:
> >      >         virtio-serial-bus: Unexpected port id 30 for device
> >     virtio-serial.0
> >      >
> >      >         GUEST_KERNEL_VERSION:
> >      >         6.6.46-android15-8-g3569b053517c-ab12290856-4k
> >      >         (kleaf@build-host) (Android (11368308, +pgo, +bolt, +lto=
,
> >     +mlgo,
> >      >         based on r510928) clang version 18.0.0
> >      >         (https://android.googlesource.com/toolchain/llvm-project
> >     <https://android.googlesource.com/toolchain/llvm-project>
> >      >         <https://android.googlesource.com/toolchain/llvm-project
> >     <https://android.googlesource.com/toolchain/llvm-project>>
> >      >         477610d4d0d988e69dbc3fae4fe86bff3f07f2b5), LLD 18.0.0) #=
1
> SMP
> >      >         PREEMPT Wed Aug 28 21:43:33 UTC 2024
> >      >         ] Linux version
> >      >         transport message failed, response body: device
> >     '0.0.0.0:6520 <http://0.0.0.0:6520>
> >      >         <http://0.0.0.0:6520 <http://0.0.0.0:6520>>' not found
> >      >         transport message failed, response body: device
> >     '0.0.0.0:6520 <http://0.0.0.0:6520>
> >      >         <http://0.0.0.0:6520 <http://0.0.0.0:6520>>' not found
> >      >         transport message failed, response body: device
> >     '0.0.0.0:6520 <http://0.0.0.0:6520>
> >      >         <http://0.0.0.0:6520 <http://0.0.0.0:6520>>' not found
> >      >         transport message failed, response body: device
> >     '0.0.0.0:6520 <http://0.0.0.0:6520>
> >      >         <http://0.0.0.0:6520 <http://0.0.0.0:6520>>' not found
> >      >         GUEST_BUILD_FINGERPRINT:
> >      >
> >
>  generic/aosp_cf_arm64_only_phone/vsoc_arm64_only:VanillaIceCream/MAIN.1c=
019b0c/12309296:userdebug/test-keys
> >      >         transport message failed, response body: device
> >     '0.0.0.0:6520 <http://0.0.0.0:6520>
> >      >         <http://0.0.0.0:6520 <http://0.0.0.0:6520>>' not found
> >      >         transport message failed, response body: device
> >     '0.0.0.0:6520 <http://0.0.0.0:6520>
> >      >         <http://0.0.0.0:6520 <http://0.0.0.0:6520>>' not found
> >      >         transport message failed, response body: device
> >     '0.0.0.0:6520 <http://0.0.0.0:6520>
> >      >         <http://0.0.0.0:6520 <http://0.0.0.0:6520>>' not found
> >      >         transport message failed, response body: device
> >     '0.0.0.0:6520 <http://0.0.0.0:6520>
> >      >         <http://0.0.0.0:6520 <http://0.0.0.0:6520>>' not found
> >      >         transport message failed, response body: device
> >     '0.0.0.0:6520 <http://0.0.0.0:6520>
> >      >         <http://0.0.0.0:6520 <http://0.0.0.0:6520>>' not found
> >      >         transport message failed, response body: device
> >     '0.0.0.0:6520 <http://0.0.0.0:6520>
> >      >         <http://0.0.0.0:6520 <http://0.0.0.0:6520>>' not found
> >      >         transport message failed, response body: device
> >     '0.0.0.0:6520 <http://0.0.0.0:6520>
> >      >         <http://0.0.0.0:6520 <http://0.0.0.0:6520>>' not found
> >      >         transport message failed, response body: device
> >     '0.0.0.0:6520 <http://0.0.0.0:6520>
> >      >         <http://0.0.0.0:6520 <http://0.0.0.0:6520>>' not found
> >      >         init: starting service 'adbd'...
> >      >         proxy_fastboot] Stop event (11) received. Stopping proxy
> >      >         proxy_adb] Start event (5) received. Starting proxy
> >      >         proxy_adb] From: tcp: 6520
> >      >         proxy_adb] To: vsock: 3:5555 vhost_user: false
> >      >         transport message failed, response body: device
> >     '0.0.0.0:6520 <http://0.0.0.0:6520>
> >      >         <http://0.0.0.0:6520 <http://0.0.0.0:6520>>' not found
> >      >         I0903 10:09:30.816108 2787314 IntelDrmDecoder.cpp:38]
> >      >         IntelDrmDecoder created for context 2
> >      >         I0903 10:09:32.764820 2787316 IntelDrmDecoder.cpp:38]
> >      >         IntelDrmDecoder created for context 7
> >      >         VIRTUAL_DEVICE_DISPLAY_POWER_MODE_CHANGED
> >      >         VIRTUAL_DEVICE_DISPLAY_POWER_MODE_CHANGED
> >      >         I0903 10:10:20.918014 2787359 IntelDrmDecoder.cpp:38]
> >      >         IntelDrmDecoder created for context 11
> >      >
> >      >         I see a lot of errors,but it seems connected :
> >      >
> >      >         ziomario@Z390-AORUS-PRO-DEST:~/Scrivania$ adb devices
> >      >         List of devices attached
> >      > 0.0.0.0:6520 <http://0.0.0.0:6520> <http://0.0.0.0:6520
> >     <http://0.0.0.0:6520>>    device
> >      >
> >      >         but scrcpy didn't work :
> >      >
> >      >         ziomario@Z390-AORUS-PRO-DEST:~/Scrivania$ scrcpy
> >      >
> >      >         scrcpy 2.6.1 <https://github.com/Genymobile/scrcpy
> >     <https://github.com/Genymobile/scrcpy>
> >      >         <https://github.com/Genymobile/scrcpy
> >     <https://github.com/Genymobile/scrcpy>>>
> >      >         INFO: ADB device found:
> >      >         INFO:     --> (tcpip) 0.0.0.0:6520 <http://0.0.0.0:6520>
> >     <http://0.0.0.0:6520 <http://0.0.0.0:6520>>
> >      >                             device
> >       Cuttlefish_arm64_phone_64_bit_only
> >      >
> >      >         /usr/local/share/scrcpy/scrcpy-server: 1 file pushed, 0
> >     skipped.
> >      >         90.0 MB/s (71112 bytes in 0.001s)
> >      >         [server] INFO: Device: [Google] generic Cuttlefish arm64
> >     phone
> >      >         64-bit only (Android 14)
> >      >         [server] ERROR: Could not register rotation watcher
> >      >         java.lang.NullPointerException: Attempt to invoke virtua=
l
> >     method
> >      >         'java.lang.Class java.lang.Object.getClass()' on a null
> >     object
> >      >         reference
> >      >
> >      >                 at
> >      >
> >
>  com.genymobile.scrcpy.wrappers.WindowManager.registerRotationWatcher(Win=
dowManager.java:185)
> >      >                 at
> >      >         com.genymobile.scrcpy.device.Device.<init>(Device.java:9=
3)
> >      >                 at
> >     com.genymobile.scrcpy.Server.scrcpy(Server.java:145)
> >      >                 at
> >      >         com.genymobile.scrcpy.Server.internalMain(Server.java:29=
0)
> >      >                 at
> com.genymobile.scrcpy.Server.main(Server.java:245)
> >      >                 at
> >      >
> >       com.android.internal.os.RuntimeInit.nativeFinishInit(Native Metho=
d)
> >      >                 at
> >      >
> >       com.android.internal.os.RuntimeInit.main(RuntimeInit.java:369)
> >      >
> >      >         [server] ERROR: Could not register display fold listener
> >      >
> >      >         java.lang.NullPointerException: Attempt to invoke virtua=
l
> >     method
> >      >         'java.lang.Class java.lang.Object.getClass()' on a null
> >     object
> >      >         reference
> >      >
> >      >                 at
> >      >
> >
>  com.genymobile.scrcpy.wrappers.WindowManager.registerDisplayFoldListener=
(WindowManager.java:206)
> >      >                 at
> >      >
>  com.genymobile.scrcpy.device.Device.<init>(Device.java:108)
> >      >                 at
> >     com.genymobile.scrcpy.Server.scrcpy(Server.java:145)
> >      >                 at
> >      >         com.genymobile.scrcpy.Server.internalMain(Server.java:29=
0)
> >      >                 at
> com.genymobile.scrcpy.Server.main(Server.java:245)
> >      >                 at
> >      >
> >       com.android.internal.os.RuntimeInit.nativeFinishInit(Native Metho=
d)
> >      >                 at
> >      >
> >       com.android.internal.os.RuntimeInit.main(RuntimeInit.java:369)
> >      >
> >      >         [server] WARN: No clipboard manager, copy-paste between
> >     device
> >      >         and computer will not work
> >      >         [server] ERROR: Attempt to invoke virtual method
> >      >         'android.view.InputDevice
> >      >
> >       android.hardware.input.InputManagerGlobal.getInputDevice(int)'
> >      >         on a null object reference
> >      >         java.lang.NullPointerException: Attempt to invoke virtua=
l
> >     method
> >      >         'android.view.InputDevice
> >      >
> >       android.hardware.input.InputManagerGlobal.getInputDevice(int)'
> >      >         on a null object reference
> >      >                 at
> >      >
>  android.view.KeyCharacterMap.load(KeyCharacterMap.java:364)
> >      >                 at
> >      >
> >       com.genymobile.scrcpy.control.Controller.<init>(Controller.java:4=
5)
> >      >                 at
> >     com.genymobile.scrcpy.Server.scrcpy(Server.java:159)
> >      >                 at
> >      >         com.genymobile.scrcpy.Server.internalMain(Server.java:29=
0)
> >      >                 at
> com.genymobile.scrcpy.Server.main(Server.java:245)
> >      >                 at
> >      >
> >       com.android.internal.os.RuntimeInit.nativeFinishInit(Native Metho=
d)
> >      >                 at
> >      >
> >       com.android.internal.os.RuntimeInit.main(RuntimeInit.java:369)
> >      >
> >      >         INFO: Renderer: opengl
> >      >         INFO: OpenGL version: 4.6.0 NVIDIA 535.183.01
> >      >         INFO: Trilinear filtering enabled
> >      >         WARN: Device disconnected
> >      >         ERROR: Demuxer 'video': stream disabled due to connectio=
n
> >     error
> >      >         ERROR: Demuxer 'audio': stream disabled due to connectio=
n
> >     error
> >      >
> >      >         Even if the phone is still up :
> >      >
> >      >         ziomario@Z390-AORUS-PRO-DEST:~/Scrivania$ adb devices
> >      >         List of devices attached
> >      > 0.0.0.0:6520 <http://0.0.0.0:6520> <http://0.0.0.0:6520
> >     <http://0.0.0.0:6520>>    device
> >      >
> >      >         On Tue, Sep 3, 2024 at 1:03=E2=80=AFAM Pierrick Bouvier
> >      >         <pierrick.bouvier@linaro.org
> >     <mailto:pierrick.bouvier@linaro.org>
> >      >         <mailto:pierrick.bouvier@linaro.org
> >     <mailto:pierrick.bouvier@linaro.org>>> wrote:
> >      >
> >      >             The cvd-host package in this case are
> binaries/libraries
> >      >             compiled for
> >      >             aarch64, so it can be used on linux aarch64 and
> >     benefit from
> >      >             kvm
> >      >             acceleration.
> >      >
> >      >             In your case, running emulation from a x64 host, you
> need
> >      >             cvd-host_package-x86_64.tar.gz instead.
> >      >
> >      >             On 9/2/24 15:38, Mario Marietto wrote:
> >      >              > Update :
> >      >              >
> >      >              >
> >      >
> >       ziomario@Z390-AORUS-PRO-DEST:/mnt/zroot-133/_OS/Android/aosp_14/a=
ndroid-image/bin$
> mkdir x86_64-linux-musl
> >      >              >
> >      >              >
> >      >
> >       ziomario@Z390-AORUS-PRO-DEST:/mnt/zroot-133/_OS/Android/aosp_14/a=
ndroid-image/bin$
> cp
> /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/aarch64-linux-musl/c=
rosvm
> /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/x86_64-linux-musl
> >      >              >
> >      >              >
> >      >
> >       ziomario@Z390-AORUS-PRO-DEST:/mnt/zroot-133/_OS/Android/aosp_14/a=
ndroid-image$
> HOME=3D$(pwd) ./bin/launch_cvd -vm_manager qemu_cli
> -report_anonymous_usage_stats=3Dn --start_webrtc=3Dfalse
> >      >              >
> >      >              >
> >      >              > Unfortunately it does not work :
> >      >              >
> >      >              >
> >      >              > 09-03 00:03:28.916 2737211 2737211 I launch_cvd:
> >      >             main.cc:235 Using
> >      >              > system_image_dir of:
> >      >              >
> >      >
> >       =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >      >              > NOTICE:
> >      >              >
> >      >              > By using this Android Virtual Device, you agree t=
o
> >      >              > Google Terms of Service
> >      >             (https://policies.google.com/terms
> >     <https://policies.google.com/terms>
> >      >             <https://policies.google.com/terms
> >     <https://policies.google.com/terms>>
> >      >              > <https://policies.google.com/terms
> >     <https://policies.google.com/terms>
> >      >             <https://policies.google.com/terms
> >     <https://policies.google.com/terms>>>).
> >      >              > The Google Privacy Policy
> >      >             (https://policies.google.com/privacy
> >     <https://policies.google.com/privacy>
> >      >             <https://policies.google.com/privacy
> >     <https://policies.google.com/privacy>>
> >      >              > <https://policies.google.com/privacy
> >     <https://policies.google.com/privacy>
> >      >             <https://policies.google.com/privacy
> >     <https://policies.google.com/privacy>>>)
> >      >              > describes how Google handles information generate=
d
> >     as you use
> >      >              > Google Services.
> >      >              >
> >      >
> >       =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >      >              >
> >      >              > Reading --config option from:
> >      >              >
> >      >
> >       /mnt/zroot-133/_OS/Android/aosp_14/android-image/android-info.txt
> >      >              > Launching CVD using --config=3D'phone'.
> >      >              >
> >      >
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/aarch64-linux-gnu/g=
fxstream_graphics_detector:
> error while loading shared
> >      >              >
> >      >              > libraries: libc.so.6: cannot open shared object
> >     file: No
> >      >             such file or
> >      >              > directory
> >      >              >
> >      >              > Failed to run graphics detector, bad return value=
:
> >     127.
> >      >             Assuming no
> >      >              > availability.
> >      >              > GPU auto mode: did not detect prerequisites for
> >      >             accelerated rendering
> >      >              > support, enabling --gpu_mode=3Dguest_swiftshader.
> >      >              > GPU vhost user auto mode: not needed for
> >      >             --gpu_mode=3Dguest_swiftshader.
> >      >              > Not enabling vhost user gpu.
> >      >              > Requested resuming a previous session (the defaul=
t
> >      >             behavior) but the
> >      >              > base images have changed under the overlay, makin=
g
> the
> >      >             overlay
> >      >              > incompatible. Wiping the overlay files.
> >      >              >
> >      >              > Path for instance UDS: /tmp/cf_avd_1000
> >      >              >
> >      >              > The following lines contain useful debugging
> >     information:
> >      >              >   Serial console is disabled; use -console=3Dtrue=
 to
> >     enable it.
> >      >              >   Logcat output:
> >      >              >
> >      >
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/cuttlefish/instances/cv=
d-1/logs/logcat
> >      >              >   Kernel log:
> >      >              >
> >      >
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/cuttlefish/instances/cv=
d-1/kernel.log
> >      >              >   Launcher log:
> >      >              >
> >      >
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/cuttlefish/instances/cv=
d-1/logs/launcher.log
> >      >              >   Instance configuration:
> >      >              >
> >      >
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/cuttlefish/instances/cv=
d-1/cuttlefish_config.json
> >      >              >   Launcher Build ID: 12309296
> >      >              > 4. main.cc:232| RunCvdMain|
> >      >              > 3. main.cc:104| Run|
> >      >              > 2. server_loop_impl.cpp:89| Run|
> >      >              > 1. qemu_manager.cpp:247| StartCommands|
> >      >              > |
> >      >
> >       device/google/cuttlefish/host/libs/vm_manager/qemu_manager.cpp:97
> >      >              > | Result<std::pair<int, int>>
> >      >             cuttlefish::vm_manager::(anonymous
> >      >              > namespace)::GetQemuVersion(const std::string &)
> >      >              > v CF_EXPECT(qemu_version_ret =3D=3D 0)
> >      >              >
> >      >
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/aarch64-linux-gnu/q=
emu/qemu-system-aarch64
> -version returned unexpected response .
> >      >              > Stderr was
> >      >              >
> >      >
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/aarch64-linux-gnu/q=
emu/qemu-system-aarch64:
> error while loading shared
> >      >              >
> >      >              > libraries: libncursesw.so.6: cannot open shared
> object
> >      >             file: No such
> >      >              > file or directory
> >      >              >
> >      >              > On Mon, Sep 2, 2024 at 11:30=E2=80=AFPM Mario Mar=
ietto
> >      >             <marietto2008@gmail.com
> >     <mailto:marietto2008@gmail.com> <mailto:marietto2008@gmail.com
> >     <mailto:marietto2008@gmail.com>>
> >      >              > <mailto:marietto2008@gmail.com
> >     <mailto:marietto2008@gmail.com>
> >      >             <mailto:marietto2008@gmail.com
> >     <mailto:marietto2008@gmail.com>>>> wrote:
> >      >              >
> >      >              >     Something is not right :
> >      >              >
> >      >              >
> >      >
> >       ziomario@Z390-AORUS-PRO-DEST:/mnt/zroot-133/_OS/Android/aosp_14/a=
ndroid-image$
> unzip ../aosp_cf_*.zip
> >      >              >
> >      >              >     Archive:
> >       ../aosp_cf_arm64_only_phone-img-12309296.zip
> >      >              >       inflating: android-info.txt
> >      >              >       inflating: fastboot-info.txt
> >      >              >       inflating: kernel_16k
> >      >              >       inflating: ramdisk_16k.img
> >      >              >       inflating: boot.img
> >      >              >       inflating: boot_16k.img
> >      >              >       inflating: bootloader
> >      >              >       inflating: init_boot.img
> >      >              >       inflating: userdata.img
> >      >              >       inflating: vbmeta.img
> >      >              >       inflating: vbmeta_system.img
> >      >              >       inflating: vbmeta_system_dlkm.img
> >      >              >       inflating: vbmeta_vendor_dlkm.img
> >      >              >       inflating: vendor_boot.img
> >      >              >       inflating: super.img
> >      >              >
> >      >              >
> >      >
> >       ziomario@Z390-AORUS-PRO-DEST:/mnt/zroot-133/_OS/Android/aosp_14/a=
ndroid-image$
> tar xzvf ../cvd-host_package.tar.gz
> >      >              >
> >      >              >
> >      >              >     ./
> >      >              >     ./lib64/
> >      >              >     ./lib64/android.hardware.keymaster@3.0.so
> >     <mailto:android.hardware.keymaster@3.0.so>
> >      >             <mailto:android.hardware.keymaster@3.0.so
> >     <mailto:android.hardware.keymaster@3.0.so>>
> >      >              >     <mailto:android.hardware.keymaster@3.0.so
> >     <mailto:android.hardware.keymaster@3.0.so>
> >      >             <mailto:android.hardware.keymaster@3.0.so
> >     <mailto:android.hardware.keymaster@3.0.so>>>
> >      >              >     ./lib64/libciborium_io.dylib.so
> >     <http://libciborium_io.dylib.so>
> >      >             <http://libciborium_io.dylib.so
> >     <http://libciborium_io.dylib.so>>
> >      >             <http://libciborium_io.dylib.so
> >     <http://libciborium_io.dylib.so>
> >      >             <http://libciborium_io.dylib.so
> >     <http://libciborium_io.dylib.so>>>
> >      >              >     ./lib64/libjpeg.so
> >      >              >     ./lib64/cuttlefish_net.so
> >      >              >     ./lib64/libbase.so
> >      >              >     ./lib64/vulkan.pastel.so
> >     <http://vulkan.pastel.so> <http://vulkan.pastel.so
> >     <http://vulkan.pastel.so>>
> >      >             <http://vulkan.pastel.so <http://vulkan.pastel.so>
> >     <http://vulkan.pastel.so <http://vulkan.pastel.so>>>
> >      >              >     ./lib64/libcuttlefish_host_config.so
> >      >              >     ./lib64/libflagset.dylib.so
> >     <http://libflagset.dylib.so>
> >      >             <http://libflagset.dylib.so
> >     <http://libflagset.dylib.so>> <http://libflagset.dylib.so
> >     <http://libflagset.dylib.so>
> >      >             <http://libflagset.dylib.so
> >     <http://libflagset.dylib.so>>>
> >      >              >     ./lib64/libkmr_common.dylib.so
> >     <http://libkmr_common.dylib.so>
> >      >             <http://libkmr_common.dylib.so
> >     <http://libkmr_common.dylib.so>>
> >      >             <http://libkmr_common.dylib.so
> >     <http://libkmr_common.dylib.so> <http://libkmr_common.dylib.so
> >     <http://libkmr_common.dylib.so>>>
> >      >              >     ./lib64/libpkcs1.dylib.so
> >     <http://libpkcs1.dylib.so> <http://libpkcs1.dylib.so
> >     <http://libpkcs1.dylib.so>>
> >      >             <http://libpkcs1.dylib.so <http://libpkcs1.dylib.so>
> >     <http://libpkcs1.dylib.so <http://libpkcs1.dylib.so>>>
> >      >              >     ./lib64/libicui18n-host.so
> >      >              >     ./lib64/libwayland_client.so
> >      >              >     ./lib64/libunwindstack.so
> >      >              >     ./lib64/libkmr_ta.dylib.so
> >     <http://libkmr_ta.dylib.so>
> >      >             <http://libkmr_ta.dylib.so
> >     <http://libkmr_ta.dylib.so>> <http://libkmr_ta.dylib.so
> >     <http://libkmr_ta.dylib.so>
> >      >             <http://libkmr_ta.dylib.so <http://libkmr_ta.dylib.s=
o
> >>>
> >      >              >     ./lib64/libcoset.dylib.so
> >     <http://libcoset.dylib.so> <http://libcoset.dylib.so
> >     <http://libcoset.dylib.so>>
> >      >             <http://libcoset.dylib.so <http://libcoset.dylib.so>
> >     <http://libcoset.dylib.so <http://libcoset.dylib.so>>>
> >      >              >     ./lib64/libcppbor.so
> >      >              >     ./lib64/libgatekeeper.so
> >      >              >     ./lib64/libyuv.so
> >      >              >     ./lib64/libgrpc++.so
> >      >              >     ./lib64/libkmr_cf_ffi.so
> >      >              >     ./lib64/libcppcose_rkp.so
> >      >              >     ./lib64/libcuttlefish_transport.so
> >      >              >     ./lib64/liblzma.so
> >      >              >     ./lib64/libciborium_ll.dylib.so
> >     <http://libciborium_ll.dylib.so>
> >      >             <http://libciborium_ll.dylib.so
> >     <http://libciborium_ll.dylib.so>>
> >      >             <http://libciborium_ll.dylib.so
> >     <http://libciborium_ll.dylib.so>
> >      >             <http://libciborium_ll.dylib.so
> >     <http://libciborium_ll.dylib.so>>>
> >      >              >     ./lib64/libcuttlefish_allocd_utils.so
> >      >              >     ./lib64/libgflags.so
> >      >              >     ./lib64/android.hardware.keymaster@4.0.so
> >     <mailto:android.hardware.keymaster@4.0.so>
> >      >             <mailto:android.hardware.keymaster@4.0.so
> >     <mailto:android.hardware.keymaster@4.0.so>>
> >      >              >     <mailto:android.hardware.keymaster@4.0.so
> >     <mailto:android.hardware.keymaster@4.0.so>
> >      >             <mailto:android.hardware.keymaster@4.0.so
> >     <mailto:android.hardware.keymaster@4.0.so>>>
> >      >              >     ./lib64/libcfg_if.dylib.so
> >     <http://libcfg_if.dylib.so>
> >      >             <http://libcfg_if.dylib.so
> >     <http://libcfg_if.dylib.so>> <http://libcfg_if.dylib.so
> >     <http://libcfg_if.dylib.so>
> >      >             <http://libcfg_if.dylib.so <http://libcfg_if.dylib.s=
o
> >>>
> >      >              >     ./lib64/libspki.dylib.so
> >     <http://libspki.dylib.so> <http://libspki.dylib.so
> >     <http://libspki.dylib.so>>
> >      >             <http://libspki.dylib.so <http://libspki.dylib.so>
> >     <http://libspki.dylib.so <http://libspki.dylib.so>>>
> >      >              >     ./lib64/libzeroize.dylib.so
> >     <http://libzeroize.dylib.so>
> >      >             <http://libzeroize.dylib.so
> >     <http://libzeroize.dylib.so>> <http://libzeroize.dylib.so
> >     <http://libzeroize.dylib.so>
> >      >             <http://libzeroize.dylib.so
> >     <http://libzeroize.dylib.so>>>
> >      >              >     ./lib64/libcgrouprc.so
> >      >              >     ./lib64/libprotobuf-cpp-full.so
> >      >              >     ./lib64/libcutils.so
> >      >              >     ./lib64/libsqlite.so
> >      >              >     ./lib64/libcuttlefish_utils_result.so
> >      >              >     ./lib64/libbinder_ndk.so
> >      >              >     ./lib64/libext2_uuid-host.so
> >      >              >     ./lib64/libhex.dylib.so
> >     <http://libhex.dylib.so> <http://libhex.dylib.so
> >     <http://libhex.dylib.so>>
> >      >             <http://libhex.dylib.so <http://libhex.dylib.so>
> >     <http://libhex.dylib.so <http://libhex.dylib.so>>>
> >      >              >     ./lib64/libc_musl.so
> >      >              >     ./lib64/libconst_oid.dylib.so
> >     <http://libconst_oid.dylib.so>
> >      >             <http://libconst_oid.dylib.so
> >     <http://libconst_oid.dylib.so>> <http://libconst_oid.dylib.so
> >     <http://libconst_oid.dylib.so>
> >      >             <http://libconst_oid.dylib.so
> >     <http://libconst_oid.dylib.so>>>
> >      >              >     ./lib64/libprotobuf_support.dylib.so
> >     <http://libprotobuf_support.dylib.so>
> >      >             <http://libprotobuf_support.dylib.so
> >     <http://libprotobuf_support.dylib.so>>
> >      >              >     <http://libprotobuf_support.dylib.so
> >     <http://libprotobuf_support.dylib.so>
> >      >             <http://libprotobuf_support.dylib.so
> >     <http://libprotobuf_support.dylib.so>>>
> >      >              >     ./lib64/tpm2-tss2-tcti.so
> >      >              >     ./lib64/libserde.dylib.so
> >     <http://libserde.dylib.so> <http://libserde.dylib.so
> >     <http://libserde.dylib.so>>
> >      >             <http://libserde.dylib.so <http://libserde.dylib.so>
> >     <http://libserde.dylib.so <http://libserde.dylib.so>>>
> >      >              >     ./lib64/libartpalette.so
> >      >              >     ./lib64/liblog.so
> >      >              >     ./lib64/libonce_cell.dylib.so
> >     <http://libonce_cell.dylib.so>
> >      >             <http://libonce_cell.dylib.so
> >     <http://libonce_cell.dylib.so>> <http://libonce_cell.dylib.so
> >     <http://libonce_cell.dylib.so>
> >      >             <http://libonce_cell.dylib.so
> >     <http://libonce_cell.dylib.so>>>
> >      >              >     ./lib64/libthiserror.dylib.so
> >     <http://libthiserror.dylib.so>
> >      >             <http://libthiserror.dylib.so
> >     <http://libthiserror.dylib.so>> <http://libthiserror.dylib.so
> >     <http://libthiserror.dylib.so>
> >      >             <http://libthiserror.dylib.so
> >     <http://libthiserror.dylib.so>>>
> >      >              >     ./lib64/libssl-host.so
> >      >              >     ./lib64/libc++.so
> >      >              >     ./lib64/libext4_utils.so
> >      >              >     ./lib64/libpkcs8.dylib.so
> >     <http://libpkcs8.dylib.so> <http://libpkcs8.dylib.so
> >     <http://libpkcs8.dylib.so>>
> >      >             <http://libpkcs8.dylib.so <http://libpkcs8.dylib.so>
> >     <http://libpkcs8.dylib.so <http://libpkcs8.dylib.so>>>
> >      >              >     ./lib64/libsparse-host.so
> >      >              >     ./lib64/sandboxed_api_sandbox2.so
> >      >              >     ./lib64/libcuttlefish_command_util.so
> >      >              >     ./lib64/libbssl_sys.dylib.so
> >     <http://libbssl_sys.dylib.so>
> >      >             <http://libbssl_sys.dylib.so
> >     <http://libbssl_sys.dylib.so>> <http://libbssl_sys.dylib.so
> >     <http://libbssl_sys.dylib.so>
> >      >             <http://libbssl_sys.dylib.so
> >     <http://libbssl_sys.dylib.so>>>
> >      >              >     ./lib64/libkeymaster_messages.so
> >      >              >     ./lib64/libcuttlefish_web.so
> >      >              >     ./lib64/libvpx.so
> >      >              >     ./lib64/libopus.so
> >      >              >     ./lib64/libminijail.so
> >      >              >     ./lib64/libcurl-host.so
> >      >              >
>  ./lib64/libcuttlefish_kernel_log_monitor_utils.so
> >      >              >     ./lib64/tpm2-tss2-util.so
> >      >              >     ./lib64/liblibc.dylib.so
> >     <http://liblibc.dylib.so> <http://liblibc.dylib.so
> >     <http://liblibc.dylib.so>>
> >      >             <http://liblibc.dylib.so <http://liblibc.dylib.so>
> >     <http://liblibc.dylib.so <http://liblibc.dylib.so>>>
> >      >              >     ./lib64/libprotobuf.dylib.so
> >     <http://libprotobuf.dylib.so>
> >      >             <http://libprotobuf.dylib.so
> >     <http://libprotobuf.dylib.so>> <http://libprotobuf.dylib.so
> >     <http://libprotobuf.dylib.so>
> >      >             <http://libprotobuf.dylib.so
> >     <http://libprotobuf.dylib.so>>>
> >      >              >     ./lib64/libbitflags.dylib.so
> >     <http://libbitflags.dylib.so>
> >      >             <http://libbitflags.dylib.so
> >     <http://libbitflags.dylib.so>> <http://libbitflags.dylib.so
> >     <http://libbitflags.dylib.so>
> >      >             <http://libbitflags.dylib.so
> >     <http://libbitflags.dylib.so>>>
> >      >              >     ./lib64/libutils.so
> >      >              >     ./lib64/libjsoncpp.so
> >      >              >     ./lib64/libext2_blkid-host.so
> >      >              >     ./lib64/libnl.so
> >      >              >     ./lib64/tpm2-tss2-sys.so
> >      >              >     ./lib64/libartbase.so
> >      >              >     ./lib64/libxml2.so
> >      >              >     ./lib64/libkmr_proto_rust.dylib.so
> >     <http://libkmr_proto_rust.dylib.so>
> >      >             <http://libkmr_proto_rust.dylib.so
> >     <http://libkmr_proto_rust.dylib.so>>
> >      >             <http://libkmr_proto_rust.dylib.so
> >     <http://libkmr_proto_rust.dylib.so>
> >      >             <http://libkmr_proto_rust.dylib.so
> >     <http://libkmr_proto_rust.dylib.so>>>
> >      >              >     ./lib64/libcuttlefish_security.so
> >      >              >     ./lib64/libsecure_env_tpm.dylib.so
> >     <http://libsecure_env_tpm.dylib.so>
> >      >             <http://libsecure_env_tpm.dylib.so
> >     <http://libsecure_env_tpm.dylib.so>>
> >      >             <http://libsecure_env_tpm.dylib.so
> >     <http://libsecure_env_tpm.dylib.so>
> >      >             <http://libsecure_env_tpm.dylib.so
> >     <http://libsecure_env_tpm.dylib.so>>>
> >      >              >     ./lib64/libz-host.so
> >      >              >     ./lib64/libprocessgroup.so
> >      >              >     ./lib64/libcrypto_utils.so
> >      >              >     ./lib64/libder.dylib.so
> >     <http://libder.dylib.so> <http://libder.dylib.so
> >     <http://libder.dylib.so>>
> >      >             <http://libder.dylib.so <http://libder.dylib.so>
> >     <http://libder.dylib.so <http://libder.dylib.so>>>
> >      >              >     ./lib64/libdexfile.so
> >      >              >     ./lib64/cf_metrics_proto.so
> >      >              >     ./lib64/tpm2-tss2-esys.so
> >      >              >     ./lib64/libcuttlefish_utils.so
> >      >              >     ./lib64/libkeymaster_portable.so
> >      >              >     ./lib64/libfruit.so
> >      >              >     ./lib64/tpm2-tss2-rc.so
> >      >              >     ./lib64/libcap.so
> >      >              >     ./lib64/libnix.dylib.so
> >     <http://libnix.dylib.so> <http://libnix.dylib.so
> >     <http://libnix.dylib.so>>
> >      >             <http://libnix.dylib.so <http://libnix.dylib.so>
> >     <http://libnix.dylib.so <http://libnix.dylib.so>>>
> >      >              >     ./lib64/libicuuc-host.so
> >      >              >     ./lib64/libziparchive.so
> >      >              >     ./lib64/libkmr_ta_nonsecure.dylib.so
> >     <http://libkmr_ta_nonsecure.dylib.so>
> >      >             <http://libkmr_ta_nonsecure.dylib.so
> >     <http://libkmr_ta_nonsecure.dylib.so>>
> >      >              >     <http://libkmr_ta_nonsecure.dylib.so
> >     <http://libkmr_ta_nonsecure.dylib.so>
> >      >             <http://libkmr_ta_nonsecure.dylib.so
> >     <http://libkmr_ta_nonsecure.dylib.so>>>
> >      >              >     ./lib64/libstd.dylib.so
> >     <http://libstd.dylib.so> <http://libstd.dylib.so
> >     <http://libstd.dylib.so>>
> >      >             <http://libstd.dylib.so <http://libstd.dylib.so>
> >     <http://libstd.dylib.so <http://libstd.dylib.so>>>
> >      >              >     ./lib64/libhalf.dylib.so
> >     <http://libhalf.dylib.so> <http://libhalf.dylib.so
> >     <http://libhalf.dylib.so>>
> >      >             <http://libhalf.dylib.so <http://libhalf.dylib.so>
> >     <http://libhalf.dylib.so <http://libhalf.dylib.so>>>
> >      >              >     ./lib64/tpm2-tss2-mu.so
> >      >              >     ./lib64/libmemoffset.dylib.so
> >     <http://libmemoffset.dylib.so>
> >      >             <http://libmemoffset.dylib.so
> >     <http://libmemoffset.dylib.so>> <http://libmemoffset.dylib.so
> >     <http://libmemoffset.dylib.so>
> >      >             <http://libmemoffset.dylib.so
> >     <http://libmemoffset.dylib.so>>>
> >      >              >     ./lib64/liblp.so
> >      >              >     ./lib64/libcuttlefish_fs.so
> >      >              >     ./lib64/libProxyConfig.so
> >      >              >     ./lib64/libopenssl.dylib.so
> >     <http://libopenssl.dylib.so>
> >      >             <http://libopenssl.dylib.so
> >     <http://libopenssl.dylib.so>> <http://libopenssl.dylib.so
> >     <http://libopenssl.dylib.so>
> >      >             <http://libopenssl.dylib.so
> >     <http://libopenssl.dylib.so>>>
> >      >              >     ./lib64/libkmr_wire.dylib.so
> >     <http://libkmr_wire.dylib.so>
> >      >             <http://libkmr_wire.dylib.so
> >     <http://libkmr_wire.dylib.so>> <http://libkmr_wire.dylib.so
> >     <http://libkmr_wire.dylib.so>
> >      >             <http://libkmr_wire.dylib.so
> >     <http://libkmr_wire.dylib.so>>>
> >      >              >     ./lib64/libkmr_crypto_boring.dylib.so
> >     <http://libkmr_crypto_boring.dylib.so>
> >      >             <http://libkmr_crypto_boring.dylib.so
> >     <http://libkmr_crypto_boring.dylib.so>>
> >      >              >     <http://libkmr_crypto_boring.dylib.so
> >     <http://libkmr_crypto_boring.dylib.so>
> >      >             <http://libkmr_crypto_boring.dylib.so
> >     <http://libkmr_crypto_boring.dylib.so>>>
> >      >              >     ./lib64/liblog_rust.dylib.so
> >     <http://liblog_rust.dylib.so>
> >      >             <http://liblog_rust.dylib.so
> >     <http://liblog_rust.dylib.so>> <http://liblog_rust.dylib.so
> >     <http://liblog_rust.dylib.so>
> >      >             <http://liblog_rust.dylib.so
> >     <http://liblog_rust.dylib.so>>>
> >      >              >     ./lib64/libhidlbase.so
> >      >              >     ./lib64/libgrpc_wrap.so
> >      >              >     ./lib64/libgrpc++_unsecure.so
> >      >              >     ./lib64/libbytes.dylib.so
> >     <http://libbytes.dylib.so> <http://libbytes.dylib.so
> >     <http://libbytes.dylib.so>>
> >      >             <http://libbytes.dylib.so <http://libbytes.dylib.so>
> >     <http://libbytes.dylib.so <http://libbytes.dylib.so>>>
> >      >              >     ./lib64/libsoft_attestation_cert.so
> >      >              >     ./lib64/libcuttlefish_run_cvd_proto.so
> >      >              >     ./lib64/libbinder.so
> >      >              >     ./lib64/libcrypto-host.so
> >      >              >     ./lib64/libwebm_mkvmuxer.so
> >      >              >     ./lib64/libkmr_cf.dylib.so
> >     <http://libkmr_cf.dylib.so>
> >      >             <http://libkmr_cf.dylib.so
> >     <http://libkmr_cf.dylib.so>> <http://libkmr_cf.dylib.so
> >     <http://libkmr_cf.dylib.so>
> >      >             <http://libkmr_cf.dylib.so <http://libkmr_cf.dylib.s=
o
> >>>
> >      >              >     ./lib64/libciborium.dylib.so
> >     <http://libciborium.dylib.so>
> >      >             <http://libciborium.dylib.so
> >     <http://libciborium.dylib.so>> <http://libciborium.dylib.so
> >     <http://libciborium.dylib.so>
> >      >             <http://libciborium.dylib.so
> >     <http://libciborium.dylib.so>>>
> >      >              >     ./lib64/libpuresoftkeymasterdevice_host.so
> >      >              >     ./lib64/libx509_cert.dylib.so
> >     <http://libx509_cert.dylib.so>
> >      >             <http://libx509_cert.dylib.so
> >     <http://libx509_cert.dylib.so>> <http://libx509_cert.dylib.so
> >     <http://libx509_cert.dylib.so>
> >      >             <http://libx509_cert.dylib.so
> >     <http://libx509_cert.dylib.so>>>
> >      >              >     ./lib64/libsec1.dylib.so
> >     <http://libsec1.dylib.so> <http://libsec1.dylib.so
> >     <http://libsec1.dylib.so>>
> >      >             <http://libsec1.dylib.so <http://libsec1.dylib.so>
> >     <http://libsec1.dylib.so <http://libsec1.dylib.so>>>
> >      >              >     ./nativetest64/
> >      >              >     ./nativetest64/modem_simulator_test/
> >      >              >
> >       ./nativetest64/modem_simulator_test/modem_simulator_test
> >      >              >     ./nativetest64/cuttlefish_net_tests/
> >      >              >
> >       ./nativetest64/cuttlefish_net_tests/cuttlefish_net_tests
> >      >              >     ./etc/
> >      >              >     ./etc/modem_simulator/
> >      >              >     ./etc/modem_simulator/files/
> >      >              >
> >      >
> >
>  ./etc/modem_simulator/files/iccprofile_for_sim0_for_CtsCarrierApiTestCas=
es.xml
> >      >              >
> >       ./etc/modem_simulator/files/iccprofile_for_sim0.xml
> >      >              >
>  ./etc/modem_simulator/files/numeric_operator.xml
> >      >              >     ./etc/cvd_rsa4096.avbpubkey
> >      >              >     ./etc/bootloader_aarch64/
> >      >              >     ./etc/bootloader_aarch64/bootloader.qemu
> >      >              >     ./etc/bootloader_aarch64/bootloader.crosvm
> >      >              >     ./etc/bootloader_riscv64/
> >      >              >     ./etc/bootloader_riscv64/bootloader.qemu
> >      >              >     ./etc/automotive/
> >      >              >     ./etc/automotive/vhalconfig/
> >      >              >
> >      >
> >       ./etc/automotive/vhalconfig/VendorClusterTestProperties.json
> >      >              >
>  ./etc/automotive/vhalconfig/DefaultProperties.json
> >      >              >     ./etc/automotive/vhalconfig/TestProperties.js=
on
> >      >              >     ./etc/automotive/proxy_config.json
> >      >              >     ./etc/cvd_rsa2048.avbpubkey
> >      >              >     ./etc/cvd_avb_testkey_rsa4096.pem
> >      >              >     ./etc/bootloader_arm/
> >      >              >     ./etc/bootloader_arm/bootloader.qemu
> >      >              >     ./etc/bootloader_x86_64/
> >      >              >     ./etc/bootloader_x86_64/bootloader.qemu
> >      >              >     ./etc/bootloader_x86_64/bootloader.crosvm
> >      >              >     ./etc/cvd_avb_testkey_rsa2048.pem
> >      >              >     ./etc/openwrt/
> >      >              >     ./etc/openwrt/images/
> >      >              >     ./etc/openwrt/images/openwrt_kernel_aarch64
> >      >              >     ./etc/openwrt/images/openwrt_rootfs_x86_64
> >      >              >     ./etc/openwrt/images/openwrt_rootfs_aarch64
> >      >              >     ./etc/openwrt/images/openwrt_kernel_x86_64
> >      >              >     ./etc/cvd_config/
> >      >              >     ./etc/cvd_config/cvd_config_tv.json
> >      >              >     ./etc/cvd_config/cvd_config_tablet.json
> >      >              >     ./etc/cvd_config/cvd_config_wear.json
> >      >              >     ./etc/cvd_config/cvd_config_auto_portrait.jso=
n
> >      >              >     ./etc/cvd_config/cvd_config_slim.json
> >      >              >     ./etc/cvd_config/cvd_config_go.json
> >      >              >     ./etc/cvd_config/cvd_config_foldable.json
> >      >              >     ./etc/cvd_config/cvd_config_auto.json
> >      >              >     ./etc/cvd_config/cvd_config_auto_md.json
> >      >              >     ./etc/cvd_config/cvd_config_phone.json
> >      >              >     ./usr/
> >      >              >     ./usr/share/
> >      >              >     ./usr/share/vulkan/
> >      >              >     ./usr/share/vulkan/icd.d/
> >      >              >
>  ./usr/share/vulkan/icd.d/vk_swiftshader_icd.json
> >      >              >     ./usr/share/qemu/
> >      >              >     ./usr/share/qemu/aarch64-linux-gnu/
> >      >              >
> >      >
> >
>  ./usr/share/qemu/aarch64-linux-gnu/opensbi-riscv64-generic-fw_dynamic.bi=
n
> >      >              >
>  ./usr/share/qemu/aarch64-linux-gnu/efi-virtio.rom
> >      >              >     ./usr/share/qemu/aarch64-linux-gnu/keymaps/
> >      >              >
>  ./usr/share/qemu/aarch64-linux-gnu/keymaps/en-us
> >      >              >     ./usr/share/webrtc/
> >      >              >     ./usr/share/webrtc/assets/
> >      >              >     ./usr/share/webrtc/assets/style.css
> >      >              >     ./usr/share/webrtc/assets/index.css
> >      >              >     ./usr/share/webrtc/assets/index.html
> >      >              >     ./usr/share/webrtc/assets/js/
> >      >              >     ./usr/share/webrtc/assets/js/location.js
> >      >              >     ./usr/share/webrtc/assets/js/rootcanal.js
> >      >              >     ./usr/share/webrtc/assets/js/app.js
> >      >              >     ./usr/share/webrtc/assets/js/touch.js
> >      >              >     ./usr/share/webrtc/assets/js/adb.js
> >      >              >     ./usr/share/webrtc/assets/js/index.js
> >      >              >     ./usr/share/webrtc/assets/js/cf_webrtc.js
> >      >              >
>  ./usr/share/webrtc/assets/js/server_connector.js
> >      >              >     ./usr/share/webrtc/assets/js/controls.js
> >      >              >     ./usr/share/webrtc/assets/controls.css
> >      >              >     ./usr/share/webrtc/assets/custom.css
> >      >              >     ./usr/share/webrtc/assets/client.html
> >      >              >     ./usr/share/webrtc/certs/
> >      >              >     ./usr/share/webrtc/certs/server.p12
> >      >              >     ./usr/share/webrtc/certs/server.key
> >      >              >     ./usr/share/webrtc/certs/trusted.pem
> >      >              >     ./usr/share/webrtc/certs/server.crt
> >      >              >     ./usr/share/zoneinfo/
> >      >              >     ./usr/share/zoneinfo/tzdata
> >      >              >     ./usr/share/crosvm/
> >      >              >     ./usr/share/crosvm/aarch64-linux-gnu/
> >      >              >     ./usr/share/crosvm/aarch64-linux-gnu/seccomp/
> >      >              >
> >      >
> >       ./usr/share/crosvm/aarch64-linux-gnu/seccomp/snd_null_device.poli=
cy
> >      >              >
> >      >
> >
>  ./usr/share/crosvm/aarch64-linux-gnu/seccomp/gpu_render_server.policy
> >      >              >
> >      >
> >       ./usr/share/crosvm/aarch64-linux-gnu/seccomp/battery.policy
> >      >              >
> >      >
> >       ./usr/share/crosvm/aarch64-linux-gnu/seccomp/block_device.policy
> >      >              >
> >      >
> >       ./usr/share/crosvm/aarch64-linux-gnu/seccomp/pmem_device.policy
> >      >              >
> >      >
> >       ./usr/share/crosvm/aarch64-linux-gnu/seccomp/wl_device.policy
> >      >              >
> >      >
> >       ./usr/share/crosvm/aarch64-linux-gnu/seccomp/9p_device.policy
> >      >              >
> >      >
> >       ./usr/share/crosvm/aarch64-linux-gnu/seccomp/input_device.policy
> >      >              >
> >      >
> >       ./usr/share/crosvm/aarch64-linux-gnu/seccomp/net_device.policy
> >      >              >
> >      >
> >       ./usr/share/crosvm/aarch64-linux-gnu/seccomp/rng_device.policy
> >      >              >
> >      >
> >       ./usr/share/crosvm/aarch64-linux-gnu/seccomp/coiommu_device.polic=
y
> >      >              >
> >      >
> >       ./usr/share/crosvm/aarch64-linux-gnu/seccomp/gpu_device.policy
> >      >              >
> >      >
> >       ./usr/share/crosvm/aarch64-linux-gnu/seccomp/serial_device.policy
> >      >              >
> >      >
> >
>  ./usr/share/crosvm/aarch64-linux-gnu/seccomp/cras_audio_device.policy
> >      >              >
> >      >
> >
>  ./usr/share/crosvm/aarch64-linux-gnu/seccomp/null_audio_device.policy
> >      >              >
> >      >
> >       ./usr/share/crosvm/aarch64-linux-gnu/seccomp/snd_cras_device.poli=
cy
> >      >              >
> >      >
> >
>  ./usr/share/crosvm/aarch64-linux-gnu/seccomp/vhost_scmi_device.policy
> >      >              >
> >      >
> >       ./usr/share/crosvm/aarch64-linux-gnu/seccomp/balloon_device.polic=
y
> >      >              >
> >      >
> >
>  ./usr/share/crosvm/aarch64-linux-gnu/seccomp/vhost_net_device.policy
> >      >              >
> >      >
> >
>  ./usr/share/crosvm/aarch64-linux-gnu/seccomp/vhost_vsock_device.policy
> >      >              >
> >      >
> >       ./usr/share/crosvm/aarch64-linux-gnu/seccomp/fs_device.policy
> >      >              >
> >      >
> >       ./usr/share/crosvm/aarch64-linux-gnu/seccomp/video_device.policy
> >      >              >
> >      >
> >       ./usr/share/crosvm/aarch64-linux-gnu/seccomp/xhci_device.policy
> >      >              >
> >      >
> >
>  ./usr/share/crosvm/aarch64-linux-gnu/seccomp/vios_audio_device.policy
> >      >              >     ./bin/
> >      >              >     ./bin/modem_simulator
> >      >              >     ./bin/ms-tpm-20-ref
> >      >              >     ./bin/mkenvimage_slim
> >      >              >     ./bin/metrics
> >      >              >     ./bin/socket_vsock_proxy
> >      >              >     ./bin/resize.f2fs
> >      >              >     ./bin/metrics_launcher
> >      >              >     ./bin/automotive_vsock_proxy
> >      >              >     ./bin/newfs_msdos
> >      >              >     ./bin/netsim-ui/
> >      >              >     ./bin/netsim-ui/assets/
> >      >              >     ./bin/netsim-ui/assets/grid-background.svg
> >      >              >     ./bin/netsim-ui/assets/netsim-logo.svg
> >      >              >     ./bin/netsim-ui/assets/polar-background.svg
> >      >              >     ./bin/netsim-ui/assets/hexagonal-background.p=
ng
> >      >              >     ./bin/netsim-ui/assets/netsim-logo-b.svg
> >      >              >     ./bin/netsim-ui/node_modules/
> >      >              >     ./bin/netsim-ui/node_modules/tslib/
> >      >              >     ./bin/netsim-ui/node_modules/tslib/tslib.es6.=
js
> >      >              >     ./bin/netsim-ui/index.html
> >      >              >     ./bin/netsim-ui/js/
> >      >              >     ./bin/netsim-ui/js/device-info.js
> >      >              >     ./bin/netsim-ui/js/device-list.js
> >      >              >     ./bin/netsim-ui/js/packet-info.js
> >      >              >     ./bin/netsim-ui/js/device-dropzone.js
> >      >              >     ./bin/netsim-ui/js/navigation-bar.js
> >      >              >     ./bin/netsim-ui/js/device-map.js
> >      >              >     ./bin/netsim-ui/js/device-dragzone.js
> >      >              >     ./bin/netsim-ui/js/netsim-app.js
> >      >              >     ./bin/netsim-ui/js/customize-map-button.js
> >      >              >     ./bin/netsim-ui/js/device-observer.js
> >      >              >     ./bin/netsim-ui/js/license-info.js
> >      >              >     ./bin/netsim-ui/js/cube-sprite.js
> >      >              >     ./bin/netsim-ui/js/pyramid-sprite.js
> >      >              >     ./bin/unpack_bootimg
> >      >              >     ./bin/adb
> >      >              >     ./bin/extract-vmlinux
> >      >              >     ./bin/health
> >      >              >     ./bin/screen_recording_server
> >      >              >     ./bin/lz4
> >      >              >     ./bin/wmediumd_gen_config
> >      >              >     ./bin/gnss_grpc_proxy
> >      >              >     ./bin/simg2img
> >      >              >     ./bin/secure_env
> >      >              >     ./bin/mke2fs
> >      >              >     ./bin/snapshot_util_cvd
> >      >              >     ./bin/cvd_internal_display
> >      >              >     ./bin/acloud_translator
> >      >              >     ./bin/defrag.f2fs
> >      >              >     ./bin/tombstone_receiver
> >      >              >     ./bin/root-canal
> >      >              >     ./bin/netsimd
> >      >              >     ./bin/console_forwarder
> >      >              >     ./bin/powerwash_cvd
> >      >              >     ./bin/process_restarter
> >      >              >     ./bin/fsck.f2fs
> >      >              >     ./bin/cvd_host_bugreport
> >      >              >     ./bin/extract-ikconfig
> >      >              >     ./bin/cvd_internal_status
> >      >              >     ./bin/webRTC
> >      >              >     ./bin/acloud
> >      >              >     ./bin/tcp_connector
> >      >              >     ./bin/process_sandboxer
> >      >              >     ./bin/webrtc_operator
> >      >              >     ./bin/cvd_update_location
> >      >              >     ./bin/e2fsdroid
> >      >              >     ./bin/avbtool
> >      >              >     ./bin/fastboot
> >      >              >     ./bin/build_super_image
> >      >              >     ./bin/powerbtn_cvd
> >      >              >     ./bin/allocd_client
> >      >              >     ./bin/dump.f2fs
> >      >              >     ./bin/netsim
> >      >              >     ./bin/casimir
> >      >              >     ./bin/pica
> >      >              >     ./bin/cvd_update_security_algorithm
> >      >              >     ./bin/record_cvd
> >      >              >     ./bin/vhal_proxy_server
> >      >              >     ./bin/cvd_status
> >      >              >     ./bin/cvd_import_locations
> >      >              >     ./bin/launch_cvd
> >      >              >     ./bin/cvd_internal_start
> >      >              >     ./bin/restart_cvd
> >      >              >     ./bin/cvd_internal_host_bugreport
> >      >              >     ./bin/mkuserimg_mke2fs
> >      >              >     ./bin/fec
> >      >              >     ./bin/cvd_internal_env
> >      >              >     ./bin/vhost_device_vsock
> >      >              >     ./bin/cvd_internal_stop
> >      >              >     ./bin/cvd_send_sms
> >      >              >     ./bin/assemble_cvd
> >      >              >     ./bin/cvd_send_id_disclosure
> >      >              >     ./bin/mcopy
> >      >              >     ./bin/operator_proxy
> >      >              >     ./bin/mkbootfs
> >      >              >     ./bin/run_cvd
> >      >              >     ./bin/openwrt_control_server
> >      >              >     ./bin/mkbootimg
> >      >              >     ./bin/kernel_log_monitor
> >      >              >     ./bin/mmd
> >      >              >     ./bin/toybox
> >      >              >     ./bin/crosvm
> >      >              >     ./bin/aarch64-linux-musl/
> >      >              >     ./bin/aarch64-linux-musl/crosvm
> >      >              >     ./bin/sefcontext_compile
> >      >              >     ./bin/wmediumd
> >      >              >     ./bin/echo_server
> >      >              >     ./bin/log_tee
> >      >              >     ./bin/lpmake
> >      >              >     ./bin/logcat_receiver
> >      >              >     ./bin/lpunpack
> >      >              >     ./bin/control_env_proxy_server
> >      >              >     ./bin/mtools
> >      >              >     ./bin/adb_connector
> >      >              >     ./bin/aarch64-linux-gnu/
> >      >              >     ./bin/aarch64-linux-gnu/libepoxy.so.0
> >      >              >     ./bin/aarch64-linux-gnu/libffi.so.7
> >      >              >     ./bin/aarch64-linux-gnu/qemu/
> >      >              >     ./bin/aarch64-linux-gnu/qemu/qemu-system-x86_=
64
> >      >              >     ./bin/aarch64-linux-gnu/qemu/libepoxy.so.0
> >      >              >
>  ./bin/aarch64-linux-gnu/qemu/libvirglrenderer.so.1
> >      >              >     ./bin/aarch64-linux-gnu/qemu/libgbm.so.1
> >      >              >
> >       ./bin/aarch64-linux-gnu/qemu/libgfxstream_backend.so.0
> >      >              >
> >       ./bin/aarch64-linux-gnu/qemu/librutabaga_gfx_ffi.so.0
> >      >              >
>  ./bin/aarch64-linux-gnu/qemu/qemu-system-riscv64
> >      >              >
>  ./bin/aarch64-linux-gnu/qemu/qemu-system-aarch64
> >      >              >     ./bin/aarch64-linux-gnu/qemu/libc++.so.1
> >      >              >     ./bin/aarch64-linux-gnu/qemu/libunwind.so.1
> >      >              >     ./bin/aarch64-linux-gnu/qemu/libz.so.1
> >      >              >     ./bin/aarch64-linux-gnu/qemu/libc++abi.so.1
> >      >              >     ./bin/aarch64-linux-gnu/libvirglrenderer.so.1
> >      >              >     ./bin/aarch64-linux-gnu/libdrm.so.2
> >      >              >     ./bin/aarch64-linux-gnu/libgbm.so.1
> >      >              >     ./bin/aarch64-linux-gnu/libgfxstream_backend.=
so
> >      >              >     ./bin/aarch64-linux-gnu/libwayland-client.so.=
0
> >      >              >     ./bin/aarch64-linux-gnu/libminijail.so
> >      >              >
> >       ./bin/aarch64-linux-gnu/gfxstream_graphics_detector
> >      >              >     ./bin/aarch64-linux-gnu/crosvm
> >      >              >     ./bin/lpadd
> >      >              >     ./bin/make_f2fs
> >      >              >     ./bin/sandboxer_proxy
> >      >              >     ./bin/stop_cvd
> >      >              >     ./bin/casimir_control_server
> >      >              >
> >      >              >
> >      >              >
> >      >
> >       ziomario@Z390-AORUS-PRO-DEST:/mnt/zroot-133/_OS/Android/aosp_14/a=
ndroid-image$
> HOME=3D$(pwd) ./bin/launch_cvd -vm_manager qemu_cli
> -report_anonymous_usage_stats=3Dn --start_webrtc=3Dfalse
> >      >              >
> >      >              >
> >      >              >     09-02 23:27:10.473 2729990 2729990 I
> launch_cvd:
> >      >             main.cc:235 Using
> >      >              >     system_image_dir of:
> >      >              >
> >      >
> >       =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >      >              >     NOTICE:
> >      >              >
> >      >              >     By using this Android Virtual Device, you
> agree to
> >      >              >     Google Terms of Service
> >      >             (https://policies.google.com/terms
> >     <https://policies.google.com/terms>
> >      >             <https://policies.google.com/terms
> >     <https://policies.google.com/terms>>
> >      >              >     <https://policies.google.com/terms
> >     <https://policies.google.com/terms>
> >      >             <https://policies.google.com/terms
> >     <https://policies.google.com/terms>>>).
> >      >              >     The Google Privacy Policy
> >      >             (https://policies.google.com/privacy
> >     <https://policies.google.com/privacy>
> >      >             <https://policies.google.com/privacy
> >     <https://policies.google.com/privacy>>
> >      >              >     <https://policies.google.com/privacy
> >     <https://policies.google.com/privacy>
> >      >             <https://policies.google.com/privacy
> >     <https://policies.google.com/privacy>>>)
> >      >              >     describes how Google handles information
> >     generated as
> >      >             you use
> >      >              >     Google Services.
> >      >              >
> >      >
> >       =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >      >              >
> >      >              >     Reading --config option from:
> >      >              >
> >      >
> >       /mnt/zroot-133/_OS/Android/aosp_14/android-image/android-info.txt
> >      >              >     Launching CVD using --config=3D'phone'.
> >      >              >     aarch64-binfmt-P: Could not open
> >      >             '/lib/ld-linux-aarch64.so.1': No
> >      >              >     such file or directory
> >      >              >     Failed to run graphics detector, bad return
> value:
> >      >             255. Assuming no
> >      >              >     availability.
> >      >              >     GPU auto mode: did not detect prerequisites f=
or
> >      >             accelerated
> >      >              >     rendering support, enabling
> >     --gpu_mode=3Dguest_swiftshader.
> >      >              >     GPU vhost user auto mode: not needed for
> >      >              >     --gpu_mode=3Dguest_swiftshader. Not enabling
> >     vhost user
> >      >             gpu.
> >      >              >     Requested resuming a previous session (the
> default
> >      >             behavior) but the
> >      >              >     base images have changed under the overlay,
> making
> >      >             the overlay inc
> >      >              >     ompatible. Wiping the overlay files.
> >      >              >     Path for instance UDS: /tmp/cf_avd_1000
> >      >              >     Failed to run
> >      >              >
> >      >
> >       `/mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/crosvm
> >      >              >     create_qcow2 --backing-file
> >      >             /mnt/zroot-133/_OS/Android/aosp_
> >      >              >
> >      >
> >
>  14/android-image/cuttlefish/instances/cvd-1/persistent_composite.img
> >      >              >
> >      >
> >       /mnt/zroot-133/_OS/Android/aosp_14/android-image/cuttlefish/insta=
n
> >      >              >     ces/cvd-1/persistent_composite_overlay.img`
> >      >              >     stdout:
> >      >              >     ###
> >      >              >
> >      >              >     ###
> >      >              >     stderr:
> >      >              >     ###
> >      >              >
> >      >
> >       /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/crosvm: riga
> 3:
> >      >              >
> >      >
> >       /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/x86_64-linux=
-
> >      >              >     musl/crosvm: File o directory non esistente
> >      >              >
> >      >              >     ###
> >      >              >     Return code: "127"
> >      >              >     qemu: uncaught target signal 6 (Aborted) -
> >     core dumped
> >      >              >     09-02 23:27:31.223 2729990 2729990 E
> launch_cvd:
> >      >             subprocess.cpp:207
> >      >              >     Subprocess 2730018 was interrupted by a signa=
l
> >      >             'Aborted' (6)
> >      >              >     09-02 23:27:31.224 2729990 2729990 E
> launch_cvd:
> >      >             main.cc:323
> >      >              >     assemble_cvd returned -1
> >      >              >
> >      >              >     On Mon, Sep 2, 2024 at 11:20=E2=80=AFPM Mario=
 Marietto
> >      >              >     <marietto2008@gmail.com
> >     <mailto:marietto2008@gmail.com>
> >      >             <mailto:marietto2008@gmail.com
> >     <mailto:marietto2008@gmail.com>>
> >      >             <mailto:marietto2008@gmail.com
> >     <mailto:marietto2008@gmail.com>
> >      >             <mailto:marietto2008@gmail.com
> >     <mailto:marietto2008@gmail.com>>>> wrote:
> >      >              >
> >      >              >         Hello.
> >      >              >
> >      >              >         I've downloaded this file :
> >      >              >         aosp_cf_arm64_only_phone-img-12309296.zip
> and
> >      >             this file :
> >      >              >         cvd-host_package.tar.gz
> >      >              >
> >      >              >         from here :
> >      >              >
> >      >
> >
> https://ci.android.com/builds/submitted/12309296/aosp_cf_arm64_only_phone=
-trunk_staging-userdebug/latest
> <
> https://ci.android.com/builds/submitted/12309296/aosp_cf_arm64_only_phone=
-trunk_staging-userdebug/latest>
> <
> https://ci.android.com/builds/submitted/12309296/aosp_cf_arm64_only_phone=
-trunk_staging-userdebug/latest
> <
> https://ci.android.com/builds/submitted/12309296/aosp_cf_arm64_only_phone=
-trunk_staging-userdebug/latest>>
> <
> https://ci.android.com/builds/submitted/12309296/aosp_cf_arm64_only_phone=
-trunk_staging-userdebug/latest
> <
> https://ci.android.com/builds/submitted/12309296/aosp_cf_arm64_only_phone=
-trunk_staging-userdebug/latest>
> <
> https://ci.android.com/builds/submitted/12309296/aosp_cf_arm64_only_phone=
-trunk_staging-userdebug/latest
> <
> https://ci.android.com/builds/submitted/12309296/aosp_cf_arm64_only_phone=
-trunk_staging-userdebug/latest
> >>>
> >      >              >
> >      >              >         But let's say that I don't want to use th=
e
> >     *.img
> >      >             files that are
> >      >              >         stored inside
> >      >             "aosp_cf_arm64_only_phone-img-12309296.zip",but
> >      >              >         the same files that have been produced
> when I
> >      >             have compiled this
> >      >              >         version of Android :
> >      >              >
> >      >              >
> >      >
> >
> https://github.com/raspberry-vanilla/android_local_manifest?tab=3Dreadme-=
ov-file
> <
> https://github.com/raspberry-vanilla/android_local_manifest?tab=3Dreadme-=
ov-file>
> <
> https://github.com/raspberry-vanilla/android_local_manifest?tab=3Dreadme-=
ov-file
> <
> https://github.com/raspberry-vanilla/android_local_manifest?tab=3Dreadme-=
ov-file>>
> <
> https://github.com/raspberry-vanilla/android_local_manifest?tab=3Dreadme-=
ov-file
> <
> https://github.com/raspberry-vanilla/android_local_manifest?tab=3Dreadme-=
ov-file>
> <
> https://github.com/raspberry-vanilla/android_local_manifest?tab=3Dreadme-=
ov-file
> <
> https://github.com/raspberry-vanilla/android_local_manifest?tab=3Dreadme-=
ov-file
> >>>
> >      >              >
> >      >              >         Can I do it ? Is it supposed to work the
> >     same ?
> >      >              >
> >      >              >         Thanks.
> >      >              >
> >      >              >         On Mon, Sep 2, 2024 at 10:23=E2=80=AFPM P=
ierrick
> >     Bouvier
> >      >              >         <pierrick.bouvier@linaro.org
> >     <mailto:pierrick.bouvier@linaro.org>
> >      >             <mailto:pierrick.bouvier@linaro.org
> >     <mailto:pierrick.bouvier@linaro.org>>
> >      >              >         <mailto:pierrick.bouvier@linaro.org
> >     <mailto:pierrick.bouvier@linaro.org>
> >      >             <mailto:pierrick.bouvier@linaro.org
> >     <mailto:pierrick.bouvier@linaro.org>>>> wrote:
> >      >              >
> >      >              >
> >      >              >
> >      >              >             On 9/2/24 13:20, Pierrick Bouvier
> wrote:
> >      >              >              > On 9/2/24 12:53, Mario Marietto
> wrote:
> >      >              >              >> Hello Pierrick.
> >      >              >              >>
> >      >              >              >> With Cuttlefish can I emulate
> >     Android 14
> >      >             for arm64 ? I
> >      >              >             ask because in
> >      >              >              >> your script I read :
> >      >              >              >>
> >      >              >              >>
> >      >             "|/home/user/.work/qemu/build/qemu-system-x86_64",
> so,I
> >      >              >             suspect that you
> >      >              >              >> have emulated Android x64 bit,but
> >     I need
> >      >             arm64. |
> >      >              >              >>
> >      >              >              >
> >      >              >              > Yes, it works for both
> >     architecture. The
> >      >             only thing I
> >      >              >             didn't try is an
> >      >              >              > arm64 vm accelerated with kvm (I
> don't
> >      >             have this a
> >      >              >             linux-aarch64
> >      >              >              > machine), but it should work.
> >      >              >
> >      >              >             And of course, if you want to write a
> >     custom
> >      >             wrapper for
> >      >              >             qemu, name it
> >      >              >             qemu-system-aarch64, and call the sam=
e
> >     binary
> >      >             instead of
> >      >              >             x86_64 variants.
> >      >              >
> >      >              >              >
> >      >              >              >> I also read "for aarch64 images:
> >     select
> >      >              >              >>
> >      >             |aosp_cf_arm64_only_phone-trunk_staging-userdebug" :
> I'm
> >      >              >             not able to
> >      >              >              >> download this kind of images. I
> don't
> >      >             understand how the
> >      >              >             Branch Grid
> >      >              >              >> works. Can you explain to me a
> >     little bit
> >      >             more ?
> >      >              >              >> |
> >      >              >              >
> >      >              >              > You have a link just next to it
> >     ("Branch
> >      >             grid") on the
> >      >              >             wiki page.
> >      >              >              > Once on ci android page, click on
> >     filter
> >      >             button (three
> >      >              >             bars, inverted
> >      >              >              > pyramid), and select
> >      >              >
> >       aosp_cf_arm64_only_phone-trunk_staging-userdebug.
> >      >              >              > Then go to artifacts, and download
> >     image and
> >      >              >             cvd_host_x86_64 package, as
> >      >              >              > wiki mentions.
> >      >              >              >
> >      >              >              > Don't hesitate to ask more
> questions on
> >      >             this. I imagine
> >      >              >             this topic might
> >      >              >              > interest some people who try to do
> the
> >      >             same thing.
> >      >              >              >
> >      >              >              > Pierrick
> >      >              >              >
> >      >              >              >> |
> >      >              >              >> |
> >      >              >              >>
> >      >              >              >>
> >      >              >              >> On Mon, Sep 2, 2024 at 8:47=E2=80=
=AFPM
> >     Pierrick
> >      >             Bouvier
> >      >              >              >> <pierrick.bouvier@linaro.org
> >     <mailto:pierrick.bouvier@linaro.org>
> >      >             <mailto:pierrick.bouvier@linaro.org
> >     <mailto:pierrick.bouvier@linaro.org>>
> >      >              >             <mailto:pierrick.bouvier@linaro.org
> >     <mailto:pierrick.bouvier@linaro.org>
> >      >             <mailto:pierrick.bouvier@linaro.org
> >     <mailto:pierrick.bouvier@linaro.org>>>
> >      >              >             <mailto:pierrick.bouvier@linaro.org
> >     <mailto:pierrick.bouvier@linaro.org>
> >      >             <mailto:pierrick.bouvier@linaro.org
> >     <mailto:pierrick.bouvier@linaro.org>>
> >      >              >             <mailto:pierrick.bouvier@linaro.org
> >     <mailto:pierrick.bouvier@linaro.org>
> >      >             <mailto:pierrick.bouvier@linaro.org
> >     <mailto:pierrick.bouvier@linaro.org>>>>> wrote:
> >      >              >              >>
> >      >              >              >>      Hello Mario,
> >      >              >              >>
> >      >              >              >>      very recently, I had to
> >     investigate
> >      >             booting time of
> >      >              >             Android when using
> >      >              >              >>      QEMU. You can probably manag=
e
> to
> >      >             boot this with
> >      >              >             only QEMU alone, but in
> >      >              >              >>      my experience, using
> Cuttlefish
> >      >             tooling is an
> >      >              >             easier approach.
> >      >              >              >>
> >      >              >              >>      If you really want to use
> >     only QEMU,
> >      >             you can use
> >      >              >             Cuttlefish to get
> >      >              >              >>      exact
> >      >              >              >>      command line used (which dis=
k
> >     goes
> >      >             where), and
> >      >              >             iterate from that.
> >      >              >              >>
> >      >              >              >>      Instructions:
> >      >              >              >>
> >      >              >
> >      >
> >
> https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29464068097/Run+Andro=
id+using+QEMU
> <
> https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29464068097/Run+Andro=
id+using+QEMU>
> <
> https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29464068097/Run+Andro=
id+using+QEMU
> <
> https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29464068097/Run+Andro=
id+using+QEMU>>
> <
> https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29464068097/Run+Andro=
id+using+QEMU
> <
> https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29464068097/Run+Andro=
id+using+QEMU>
> <
> https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29464068097/Run+Andro=
id+using+QEMU
> <
> https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29464068097/Run+Andro=
id+using+QEMU>>>
> <
> https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29464068097/Run+Andro=
id+using+QEMU
> <
> https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29464068097/Run+Andro=
id+using+QEMU>
> <
> https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29464068097/Run+Andro=
id+using+QEMU
> <
> https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29464068097/Run+Andro=
id+using+QEMU>>
> <
> https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29464068097/Run+Andro=
id+using+QEMU
> <
> https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29464068097/Run+Andro=
id+using+QEMU>
> <
> https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29464068097/Run+Andro=
id+using+QEMU
> <
> https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29464068097/Run+Andro=
id+using+QEMU
> >>>>
> >      >              >              >>
> >      >              >              >>      As you'll see, I could not
> get a
> >      >             direct graphic
> >      >              >             output, but using
> >      >              >              >>      scrcpy, it worked well for
> >     me. Hope
> >      >             it can fit your
> >      >              >             use case.
> >      >              >              >>
> >      >              >              >>      Regards,
> >      >              >              >>      Pierrick
> >      >              >              >>
> >      >              >              >>      On 9/2/24 06:49, Mario
> >     Marietto wrote:
> >      >              >              >>       > Hello.
> >      >              >              >>       >
> >      >              >              >>       > I would like to emulate
> >     Android
> >      >             14 on my Ubuntu
> >      >              >             24.04 OS X64 bit
> >      >              >              >>      using
> >      >              >              >>       > qemu-system-aarch64. I
> tried
> >      >             using the following
> >      >              >             parameters :
> >      >              >              >>       >
> >      >              >              >>       > qemu-system-aarch64 \
> >      >              >              >>       >          -smp 4 \
> >      >              >              >>       >          -m 2048 \
> >      >              >              >>       >          -cpu cortex-a72 =
\
> >      >              >              >>       >          -M virt \
> >      >              >              >>       >          -device
> >      >             virtio-gpu-pci,xres=3D1024,yres=3D768 \
> >      >              >              >>       >          -display
> sdl,gl=3Don \
> >      >              >              >>       >          -device usb-ehci=
 \
> >      >              >              >>       >          -device usb-kbd =
\
> >      >              >              >>       >          -device
> >     virtio-tablet-pci \
> >      >              >              >>       >          -usb \
> >      >              >              >>       >          -serial stdio \
> >      >              >              >>       >          -kernel
> >      >              >             /mnt/zroot-133/_OS/Android/rpi4/Image=
 \
> >      >              >              >>       >          -initrd
> >      >              >
> >       /mnt/zroot-133/_OS/Android/rpi4/ramdisk.img \
> >      >              >              >>       >          -drive
> >      >              >              >>       >
> >      >              >              >>
> >      >              >
> >      >
> >
>  index=3D0,if=3Dnone,id=3Dsystem,file=3D/mnt/zroot-133/_OS/Android/rpi4/b=
oot.img \
> >      >              >              >>       >          -device
> >      >             virtio-blk-pci,drive=3Dboot \
> >      >              >              >>       >          -drive
> >      >              >              >>       >
> >      >              >              >>
> >      >              >
> >      >
> >
>  index=3D1,if=3Dnone,id=3Dsystem,file=3D/mnt/zroot-133/_OS/Android/rpi4/s=
ystem.img \
> >      >              >              >>       >          -device
> >      >             virtio-blk-pci,drive=3Dsystem \
> >      >              >              >>       >          -drive
> >      >              >              >>       >
> >      >              >              >>
> >      >              >
> >      >
> >
>  index=3D2,if=3Dnone,id=3Dvendor,file=3D/mnt/zroot-133/_OS/Android/rpi4/v=
endor.img \
> >      >              >              >>       >          -device
> >      >             virtio-blk-pci,drive=3Dvendor \
> >      >              >              >>       > -append
> "console=3DttyAMA0,38400
> >      >             drm.debug=3D0x0
> >      >              >             rootwait rootdelay=3D5
> >      >              >              >>       > root=3D/dev/mmcblk0p2
> >      >             androidboot.hardware=3Drpi4
> >      >              >              >>       >
> androidboot.selinux=3Dpermissive
> >      >             security=3Dselinux
> >      >              >             selinux=3D1
> >      >              >              >>       >
> androidboot.qemu.hw.mainkeys=3D0
> >      >              >             androidboot.lcd.density=3D160"
> >      >              >              >>       >
> >      >              >              >>       > The error I get in short
> is :
> >      >              >              >>       >
> >      >              >              >>       > [ 1.993668] init: bool
> >      >              >              >>       >
> >      >              >              >>
> >      >              >
> >      >
> >
>  android::init::BlockDevInitializer::InitDevices(std::set<std::string>):
> >      >              >              >>       > partition(s) not found in
> >     /sys,
> >      >             waiting for
> >      >              >             their uevent(s):
> >      >              >              >>      mmcblk0p2,
> >      >              >              >>       > mmcblk0p3
> >      >              >              >>       >
> >      >              >              >>       >
> >      >              >              >>       > One user suggested to :
> >      >              >              >>       >
> >      >              >              >>       >
> >      >              >              >>       >
> >      >              >              >>       >
> >      >              >              >>       >
> >      >              >              >>       > Hi!!! The "/sys" is a
> "dynamic
> >      >             fs" created at
> >      >              >             ram from the
> >      >              >              >>      kernel, to
> >      >              >              >>       > export a lot of
> >     things...so most
> >      >             of the files
> >      >              >             only exist at runtime.
> >      >              >              >>       > Normally, the partitions
> >     from the
> >      >             block device
> >      >              >             have a symlink at
> >      >              >              >>       > /sys/<something>/<...> th=
at
> >      >             points to /dev/
> >      >              >             block node. It seems
> >      >              >              >>      that
> >      >              >              >>       > there are no such files
> under
> >      >             /sys according to
> >      >              >             what init is looking
> >      >              >              >>       > for. You can double check
> >     this at
> >      >             init source
> >      >              >             code to check the
> >      >              >              >>      exact
> >      >              >              >>       > path but I'm guessing tha=
t
> >     you'll
> >      >             have to change
> >      >              >             the qemu arguments
> >      >              >              >>       > regarding the block devic=
e.
> >      >              >              >>       >
> >      >              >              >>       > About userdata.img I thin=
k
> >     it's
> >      >             normal since in
> >      >              >             the old days, the
> >      >              >              >>      image
> >      >              >              >>       > was a "empty sparse
> >     image", that
> >      >             means, at the
> >      >              >             first flashing
> >      >              >              >>      process,
> >      >              >              >>       > there isn't userdata
> >     information,
> >      >             we're just
> >      >              >             "flashing the
> >      >              >              >>      partition"
> >      >              >              >>       > with empty data.
> >      >              >              >>       > Tks!!!
> >      >              >              >>       >
> >      >              >              >>       >
> >      >              >              >>       >
> >      >              >              >>       > So,in short I should
> >     change the
> >      >             qemu arguments
> >      >              >             regarding the block
> >      >              >              >>       > device. I tried in this
> way :
> >      >              >              >>       >
> >      >              >              >>       >
> >      >              >              >>       > qemu-system-aarch64 \
> >      >              >              >>       >          -smp 4 \
> >      >              >              >>       >          -m 2048 \
> >      >              >              >>       >          -cpu cortex-a72 =
\
> >      >              >              >>       >          -M virt \
> >      >              >              >>       >          -device
> >      >             virtio-gpu-pci,xres=3D1024,yres=3D768 \
> >      >              >              >>       >          -display
> sdl,gl=3Don \
> >      >              >              >>       >          -device usb-ehci=
 \
> >      >              >              >>       >          -device usb-kbd =
\
> >      >              >              >>       >          -device
> >     virtio-tablet-pci \
> >      >              >              >>       >          -usb \
> >      >              >              >>       >          -serial stdio \
> >      >              >              >>       >          -kernel
> >      >              >             /mnt/zroot-133/_OS/Android/rpi4/Image=
 \
> >      >              >              >>       >          -initrd
> >      >              >
> >       /mnt/zroot-133/_OS/Android/rpi4/ramdisk.img \
> >      >              >              >>       >          -hda
> >      >              >
>  /mnt/zroot-133/_OS/Android/rpi4/boot.img \
> >      >              >              >>       >          -hdb
> >      >              >
> >       /mnt/zroot-133/_OS/Android/rpi4/system.img \
> >      >              >              >>       >          -hdc
> >      >              >
> >       /mnt/zroot-133/_OS/Android/rpi4/vendor.img \
> >      >              >              >>       >        -append
> >     "console=3DttyAMA0,38400
> >      >              >             drm.debug=3D0x0 rootwait
> >      >              >              >>      rootdelay=3D5
> >      >              >              >>       > root=3D/dev/mmcblk0p2
> >      >             androidboot.hardware=3Drpi4
> >      >              >              >>       >
> androidboot.selinux=3Dpermissive
> >      >             security=3Dselinux
> >      >              >             selinux=3D1
> >      >              >              >>       >
> androidboot.qemu.hw.mainkeys=3D0
> >      >              >             androidboot.lcd.density=3D160"
> >      >              >              >>       >
> >      >              >              >>       >
> >      >              >              >>       > but the error is still
> >     there. Do
> >      >             you know some
> >      >              >             different alternative
> >      >              >              >>       > block devices to try ?
> thanks.
> >      >              >              >>       >
> >      >              >              >>       >
> >      >              >              >>       > --
> >      >              >              >>       > Mario.
> >      >              >              >>
> >      >              >              >>
> >      >              >              >>
> >      >              >              >> --
> >      >              >              >> Mario.
> >      >              >
> >      >              >
> >      >              >
> >      >              >         --
> >      >              >         Mario.
> >      >              >
> >      >              >
> >      >              >
> >      >              >     --
> >      >              >     Mario.
> >      >              >
> >      >              >
> >      >              >
> >      >              > --
> >      >              > Mario.
> >      >
> >      >
> >      >
> >      >         --
> >      >         Mario.
> >      >
> >      >
> >      >
> >      >     --
> >      >     Mario.
> >      >
> >      >
> >      >
> >      > --
> >      > Mario.
> >
> >
> >
> > --
> > Mario.
>


--=20
Mario.

--00000000000006a7ed06213b086c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdj4mZ3Q7RGVwZW5kcyB3aGljaCB2ZXJzaW9uIG9mIEFuZHJvaWQg
eW91IHVzZSwgYnV0IGltYWdlcyBhcmUgZ2V0dGluZyBiaWdnZXIgYW5kIGJpZ2dlciBldmVyeSB0
aW1lIHNpbmNlIEFuZHJvaWQgNSwgc28gSSYjMzk7bSBub3Qgc3VycHJpc2VkIGl0ICZndDt0YWtl
cyBtb3JlIA0KYW5kIG1vcmUgdGltZSB0byBib290LjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+
SWYgSSB3aWxsIGJlIGFibGUgdG8gYm9vdCBBbmRyb2lkIDEwIHVzaW5nIHRoZSBxZW11IHBhdGNo
ZWQgYnkgQW50bWljcm8sbWF5YmUgSSB3aWxsIHRyeSBpZiBpdCB3aWxsIHdvcmsgd2l0aCBBbmRy
b2lkIDE0IGZvciBSYXNwYmVycnkgUGkgNC4gPGJyPjwvZGl2PjxkaXY+SnVzdCBmb3IgdGhlIHNh
a2Ugb2YgbXkgY3VyaW9zaXR5LjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2Pjwv
ZGl2Pjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9Imdt
YWlsX2F0dHIiPk9uIFR1ZSwgU2VwIDMsIDIwMjQgYXQgODowM+KAr1BNIFBpZXJyaWNrIEJvdXZp
ZXIgJmx0OzxhIGhyZWY9Im1haWx0bzpwaWVycmljay5ib3V2aWVyQGxpbmFyby5vcmciPnBpZXJy
aWNrLmJvdXZpZXJAbGluYXJvLm9yZzwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48YmxvY2txdW90
ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9y
ZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+T24g
OS8zLzI0IDEwOjE3LCBNYXJpbyBNYXJpZXR0byB3cm90ZTo8YnI+DQomZ3Q7IEBQaWVycmljayBC
b3V2aWVyIDo8YnI+DQomZ3Q7IDxicj4NCiZndDsgLS0tJmd0OyBJJiMzOTttIHJlYWxseSBnbGFk
IHRvIHNlZSBpdCB3b3JrZWQhIEFyZSB5b3UgYWxyZWFkeSBydW5uaW5nIHRoZSA8YnI+DQomZ3Q7
IHJhc3BiZXJyeSBpbWFnZSwgb3IgdmFuaWxsYSBBT1NQID88YnI+DQomZ3Q7PGJyPg0KJmd0OyBO
byBhbmQgSSBkb24mIzM5O3QgdGhpbmsgSSB3aWxsLiBJIGhhdmUgYSBwcm9qZWN0IHRoYXQgSSYj
Mzk7bSB3b3JraW5nIG9uIHRoYXQgPGJyPg0KJmd0OyBhaW1zIHRvIGVtdWxhdGUgQW5kcm9pZCBm
b3IgQXJtIG9uIExpbnV4IHg2NCBiaXQuIEkga25ldyB0aGF0IGl0IHdvdWxkIDxicj4NCiZndDsg
YmUgc2xvdyxidXQgSSBkaWRuJiMzOTt0IHRoaW5rIGl0IHdvdWxkIGJlIHNvIG11Y2guIFdoZW4g
SSB1c2VkIEFWRCBhcyBhbiA8YnI+DQomZ3Q7IGVtdWxhdG9yLEFuZHJvaWQgd2VudCBmYXN0ZXIu
PGJyPg0KJmd0OyA8YnI+DQomZ3Q7PGJyPg0KPGJyPg0KRGVwZW5kcyB3aGljaCB2ZXJzaW9uIG9m
IEFuZHJvaWQgeW91IHVzZSwgYnV0IGltYWdlcyBhcmUgZ2V0dGluZyBiaWdnZXIgPGJyPg0KYW5k
IGJpZ2dlciBldmVyeXRpbWUgc2luY2UgQW5kcm9pZCA1LCBzbyBJJiMzOTttIG5vdCBzdXJwcmlz
ZWQgaXQgdGFrZXMgbW9yZSA8YnI+DQphbmQgbW9yZSB0aW1lIHRvIGJvb3QuPGJyPg0KPGJyPg0K
QnkgQVZELCBpZiB5b3UgcmVmZXIgdG8gQW5kcm9pZCBlbXVsYXRvciBpbmNsdWRlZCBpbiBBbmRy
b2lkIFN0dWRpbywgPGJyPg0KaXQmIzM5O3MgYSBkb3duc3RyZWFtIGZvcmsgb2YgUUVNVS4gU28g
dGhlIHBlcmZvcm1hbmNlIHdpbGwgYmUgb24gcGFyIChvciA8YnI+DQp3b3JzZSkgdGhhbiB1cHN0
cmVhbSBRRU1VLjxicj4NCjxicj4NClRoZSBvbmx5IHdheSB0byBoYXZlIHNvbWV0aGluZyB0aGF0
IGdvZXMgZmFzdCBpcyB0byBoYXZlIGFhcmNoNjQgPGJyPg0KaGFyZHdhcmUgYW5kIHVzZSBrdm0g
YWNjZWxlcmF0aW9uIChvbiBMaW51eCwgb3IgZXF1aXZhbGVudCBvbiA8YnI+DQpXaW5kb3dzL01h
Y09TKS48YnI+DQo8YnI+DQomZ3Q7wqAgwqAgwqAgwqBAUGV0ZXIgTWF5ZGVsbCAmbHQ7bWFpbHRv
OjxhIGhyZWY9Im1haWx0bzpwZXRlci5tYXlkZWxsQGxpbmFyby5vcmciIHRhcmdldD0iX2JsYW5r
Ij5wZXRlci5tYXlkZWxsQGxpbmFyby5vcmc8L2E+Jmd0OyA6PGJyPg0KJmd0OyA8YnI+DQomZ3Q7
IDxicj4NCiZndDsgSSB0aGluayB0aGF0IEkmIzM5O3ZlIHVuZGVyc3Rvb2QgdGhlIHJlYXNvbiB3
aHkgc2V2ZXJhbCB5ZWFycyBhZ28gaXQgd29ya2VkLiA8YnI+DQomZ3Q7IFByb2JhYmx5IEkmIzM5
O2QgdXNlZCB0aGlzIHNwZWNpYWwgdmVyc2lvbiBvZiBxZW11IDo8YnI+DQomZ3Q7IDxicj4NCiZn
dDsgPGJyPg0KJmd0OyA8YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vYW50bWljcm8va3ZtLWFv
c3AtcWVtdS9yZWxlYXNlcy90YWcvNS4wLjAta3ZtLWFvc3AiIHJlbD0ibm9yZWZlcnJlciIgdGFy
Z2V0PSJfYmxhbmsiPmh0dHBzOi8vZ2l0aHViLmNvbS9hbnRtaWNyby9rdm0tYW9zcC1xZW11L3Jl
bGVhc2VzL3RhZy81LjAuMC1rdm0tYW9zcDwvYT4gPGJyPg0KJmd0OyAmbHQ7PGEgaHJlZj0iaHR0
cHM6Ly9naXRodWIuY29tL2FudG1pY3JvL2t2bS1hb3NwLXFlbXUvcmVsZWFzZXMvdGFnLzUuMC4w
LWt2bS1hb3NwIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2dpdGh1
Yi5jb20vYW50bWljcm8va3ZtLWFvc3AtcWVtdS9yZWxlYXNlcy90YWcvNS4wLjAta3ZtLWFvc3A8
L2E+Jmd0Ozxicj4NCiZndDsgPGJyPg0KJmd0OyBJJiMzOTttIHN1cmUgdGhhdCBpdCBjb250YWlu
cyB0aGUgbmVjZXNzYXJ5IHBhdGNoZXMgdG8gYmUgYWJsZSB0byBib290IDxicj4NCiZndDsgQW5k
cm9pZCAxMCBvbiB0aGUgSmV0c29uIE5hbm8uPGJyPg0KJmd0OyA8YnI+DQomZ3Q7IE9uIFR1ZSwg
U2VwIDMsIDIwMjQgYXQgNjozMeKAr1BNIFBpZXJyaWNrIEJvdXZpZXIgPGJyPg0KJmd0OyAmbHQ7
PGEgaHJlZj0ibWFpbHRvOnBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZyIgdGFyZ2V0PSJfYmxh
bmsiPnBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZzwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJt
YWlsdG86cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnIiB0YXJnZXQ9Il9ibGFuayI+cGllcnJp
Y2suYm91dmllckBsaW5hcm8ub3JnPC9hPiZndDsmZ3Q7IHdyb3RlOjxicj4NCiZndDsgPGJyPg0K
Jmd0O8KgIMKgIMKgV2l0aG91dCBhbnN3ZXJpbmcgc3BlY2lmaWNhbGx5IG9uIHlvdXIgcXVlc3Rp
b24sIGlmIHlvdSB3YW50IHRvPGJyPg0KJmd0O8KgIMKgIMKgZXhjaGFuZ2U8YnI+DQomZ3Q7wqAg
wqAgwqBmaWxlcyB3aXRoIGEgYW5kcm9pZCBndWVzdCwgc2ltcGx5IHVzZSBhZGIgKHB1c2gvcHVs
bCBjb21tYW5kcykuIEl0JiMzOTtzPGJyPg0KJmd0O8KgIMKgIMKgbXVjaCBiZXR0ZXIgYW5kIGZh
c3RlciB0aGFuIGFueSBvdGhlciBzb2x1dGlvbiB5b3UgY2FuIHRyeSwgYW5kPGJyPg0KJmd0O8Kg
IMKgIMKgY3V0dGxlZmlzaCB0b29scyBhbHJlYWR5IHNldHVwIGFsbCB0aGUgYWRiIHN0dWZmIGZv
ciB5b3UuPGJyPg0KJmd0OyA8YnI+DQomZ3Q7wqAgwqAgwqBZb3UgY2FuIHVzZSBhZGItc3luYyAo
PGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL2piMjE3MC9iZXR0ZXItYWRiLXN5bmMiIHJlbD0i
bm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZ2l0aHViLmNvbS9qYjIxNzAvYmV0
dGVyLWFkYi1zeW5jPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwczovL2dp
dGh1Yi5jb20vamIyMTcwL2JldHRlci1hZGItc3luYyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9
Il9ibGFuayI+aHR0cHM6Ly9naXRodWIuY29tL2piMjE3MC9iZXR0ZXItYWRiLXN5bmM8L2E+Jmd0
OykgdG8gaGF2ZTxicj4NCiZndDvCoCDCoCDCoHNvbWV0aGluZyBzaW1pbGFyIHRvIHJzeW5jLCBp
biBjYXNlIHlvdSB3YW50IHRvIHNlbmQgZmlsZXM8YnI+DQomZ3Q7wqAgwqAgwqBpbmNyZW1lbnRh
bGx5Ljxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgUGllcnJpY2s8YnI+DQomZ3Q7IDxicj4N
CiZndDvCoCDCoCDCoE9uIDkvMy8yNCAwODoyNCwgTWFyaW8gTWFyaWV0dG8gd3JvdGU6PGJyPg0K
Jmd0O8KgIMKgIMKgICZndDsgSGVsbG8uPGJyPg0KJmd0O8KgIMKgIMKgICZndDs8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0OyBBY3R1YWxseSBJJiMzOTttIHVzaW5nIG15IEpldHNvbiBOYW5vIGFuZCBJ
JiMzOTttIHRyeWluZyB0byBlbXVsYXRlPGJyPg0KJmd0O8KgIMKgIMKgQW5kcm9pZCAxMDxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7IGJ5IGFudG1pY3JvLiBJJiMzOTttIHRyeWluZyB0byB1c2UgdGhl
IHNhbWUgcGFyYW1ldGVycyB1c2VkIHNldmVyYWw8YnI+DQomZ3Q7wqAgwqAgwqB5ZWFyczxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7IGFnbyx3aGVuIGl0IHdvcmtlZC4gV2hhdCBJIHdhbnQgdG8gdHJ5
IG5vdyBpcyB0byBlbmFibGU8YnI+DQomZ3Q7wqAgwqAgwqB2aXJ0aW8tYmxrLXBjaTxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7IG9uIHFlbXUuIFByb2JhYmx5IGluIGFkZGl0aW9uIHRvIHVzaW5nIHFl
bXUgNS4wLEkgaGFkIGNvbmZpZ3VyZWQ8YnI+DQomZ3Q7wqAgwqAgwqBxZW11PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDsgd2l0aCB2aXJ0aW8tYmxrLXBjaSBlbmFibGVkLGJlY2F1c2UgSSB1c2VkIHRo
ZXNlIHBhcmFtZXRlcnMgYW5kIHRoZXk8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyB3b3JrZWQgZ3Jl
YXQgOjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgLWRyaXZl
PGJyPg0KJmd0O8KgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqBpbmRleD0wLGlmPW5vbmUs
aWQ9c3lzdGVtLGZpbGU9L2hvbWUvYXJlc3VzZXIvRGVza3RvcC9hbnRtaWNyby9hb3NwLWltZy9z
eXN0ZW0tcncuaW1nIFw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIC1kZXZp
Y2UgdmlydGlvLWJsay1wY2ksZHJpdmU9c3lzdGVtIFw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgIC1kcml2ZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKg
IMKgaW5kZXg9MSxpZj1ub25lLGlkPXZlbmRvcixmaWxlPS9ob21lL2FyZXN1c2VyL0Rlc2t0b3Av
YW50bWljcm8vYW9zcC1pbWcvdmVuZG9yLXJ3LmltZyBcPGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCAtZGV2aWNlIHZpcnRpby1ibGstcGNpLGRyaXZlPXZlbmRvciBcPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCAtZHJpdmU8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0Ozxicj4NCiZndDvCoCDCoCDCoGluZGV4PTIsaWY9bm9uZSxpZD11c2VyZGF0YSxmaWxlPS9o
b21lL2FyZXN1c2VyL0Rlc2t0b3AvYW50bWljcm8vYW9zcC1pbWcvdXNlcmRhdGEuaW1nIFw8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIC1kZXZpY2UgdmlydGlvLWJsay1wY2ks
ZHJpdmU9dXNlcmRhdGEgXDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKg
ICZndDsgQ2FuIHNvbWVvbmUgdGVsbCBtZSBob3cgdG8gZW5hYmxlIHRoZSAmcXVvdDtWaXJ0RlMg
c3VwcG9ydCZxdW90OyBpbiBxZW11IDUuMCA/PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgYmVjYXVz
ZSBhdCB0aGUgbW9tZW50IGl0IGlzIGNvbmZpZ3VyZWQgdG8gJnF1b3Q7bm8mcXVvdDsgOjxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgcm9vdEBqZXRzb246L2hv
bWUvYXJlc3VzZXIvRGVza3RvcC9hbnRtaWNyby9xZW11LTUuMC4wIyAuL2NvbmZpZ3VyZTxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7IEluc3RhbGwgcHJlZml4IMKgIMKgL3Vzci9sb2NhbDxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7IEJJT1MgZGlyZWN0b3J5IMKgIMKgL3Vzci9sb2NhbC9zaGFyZS9xZW11
PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgZmlybXdhcmUgcGF0aCDCoCDCoCAvdXNyL2xvY2FsL3No
YXJlL3FlbXUtZmlybXdhcmU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBiaW5hcnkgZGlyZWN0b3J5
IMKgL3Vzci9sb2NhbC9iaW48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBsaWJyYXJ5IGRpcmVjdG9y
eSAvdXNyL2xvY2FsL2xpYjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IG1vZHVsZSBkaXJlY3Rvcnkg
wqAvdXNyL2xvY2FsL2xpYi9xZW11PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgbGliZXhlYyBkaXJl
Y3RvcnkgL3Vzci9sb2NhbC9saWJleGVjPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgaW5jbHVkZSBk
aXJlY3RvcnkgL3Vzci9sb2NhbC9pbmNsdWRlPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgY29uZmln
IGRpcmVjdG9yeSDCoC91c3IvbG9jYWwvZXRjPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgbG9jYWwg
c3RhdGUgZGlyZWN0b3J5IMKgIC91c3IvbG9jYWwvdmFyPGJyPg0KJmd0O8KgIMKgIMKgICZndDsg
TWFudWFsIGRpcmVjdG9yeSDCoC91c3IvbG9jYWwvc2hhcmUvbWFuPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDsgRUxGIGludGVycCBwcmVmaXggL3Vzci9nbmVtdWwvcWVtdS0lTTxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7IEJ1aWxkIGRpcmVjdG9yeSDCoCAvaG9tZS9hcmVzdXNlci9EZXNrdG9wL2FudG1p
Y3JvL3FlbXUtNS4wLjA8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBTb3VyY2UgcGF0aCDCoCDCoCDC
oCAvaG9tZS9hcmVzdXNlci9EZXNrdG9wL2FudG1pY3JvL3FlbXUtNS4wLjA8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0OyBHSVQgYmluYXJ5IMKgIMKgIMKgIMKgZ2l0PGJyPg0KJmd0O8KgIMKgIMKgICZn
dDsgR0lUIHN1Ym1vZHVsZXM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBDIGNvbXBpbGVyIMKgIMKg
IMKgIMKgY2M8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBIb3N0IEMgY29tcGlsZXIgwqAgY2M8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0OyBDKysgY29tcGlsZXIgwqAgwqAgwqBjKys8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0OyBPYmplY3RpdmUtQyBjb21waWxlciBjbGFuZzxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7IEFSRkxBR1MgwqAgwqAgwqAgwqAgwqAgcnY8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBDRkxB
R1MgwqAgwqAgwqAgwqAgwqAgwqAtTzIgLVVfRk9SVElGWV9TT1VSQ0UgLURfRk9SVElGWV9TT1VS
Q0U9MiAtZzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IFFFTVVfQ0ZMQUdTIMKgIMKgIMKgIC1JL3Vz
ci9pbmNsdWRlL3BpeG1hbi0xIC1JJChTUkNfUEFUSCkvZHRjL2xpYmZkdDxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAtcHRocmVhZCAtSS91c3IvaW5jbHVkZS9nbGliLTIuMDxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7IC1JL3Vzci9saWIvYWFyY2g2NC1saW51eC1nbnUvZ2xpYi0yLjAvaW5jbHVk
ZSAtZlBJRSAtRFBJRTxicj4NCiZndDvCoCDCoCDCoCDCoC1EX0dOVV9TT1VSQ0U8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0OyAtRF9GSUxFX09GRlNFVF9CSVRTPTY0IC1EX0xBUkdFRklMRV9TT1VSQ0Ug
LVdzdHJpY3QtcHJvdG90eXBlczxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IC1XcmVkdW5kYW50LWRl
Y2xzIC1XYWxsIC1XdW5kZWYgLVd3cml0ZS1zdHJpbmdzIC1XbWlzc2luZy1wcm90b3R5cGVzPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDsgLWZuby1zdHJpY3QtYWxpYXNpbmcgLWZuby1jb21tb24gLWZ3
cmFwdiAtc3RkPWdudTk5PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoC1XZXhwYW5zaW9uLXRv
LWRlZmluZWQgLVdlbmRpZi1sYWJlbHMgLVduby1zaGlmdC1uZWdhdGl2ZS12YWx1ZTxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7IC1Xbm8tbWlzc2luZy1pbmNsdWRlLWRpcnMgLVdlbXB0eS1ib2R5IC1X
bmVzdGVkLWV4dGVybnM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyAtV2Zvcm1hdC1zZWN1cml0eSAt
V2Zvcm1hdC15MmsgLVdpbml0LXNlbGYgLVdpZ25vcmVkLXF1YWxpZmllcnM8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0OyAtV29sZC1zdHlsZS1kZWNsYXJhdGlvbiAtV29sZC1zdHlsZS1kZWZpbml0aW9u
IC1XdHlwZS1saW1pdHM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyAtZnN0YWNrLXByb3RlY3Rvci1z
dHJvbmcgwqAtSS91c3IvaW5jbHVkZS9saWJwbmcxNjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAtSSQoU1JDX1BBVEgpL2NhcHN0b25lL2luY2x1ZGU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBR
RU1VX0xERkxBR1MgwqAgwqAgwqAtTCQoQlVJTERfRElSKS9kdGMvbGliZmR0IC1XbCwteixyZWxy
bzxicj4NCiZndDvCoCDCoCDCoC1XbCwteixub3cgLXBpZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAtZnN0YWNrLXByb3RlY3Rvci1zdHJvbmc8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBtYWtl
IMKgIMKgIMKgIMKgIMKgIMKgIMKgbWFrZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IGluc3RhbGwg
wqAgwqAgwqAgwqAgwqAgaW5zdGFsbDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IHB5dGhvbiDCoCDC
oCDCoCDCoCDCoCDCoC91c3IvYmluL3B5dGhvbjMgLUIgKDMuMTAuMTIpPGJyPg0KJmd0O8KgIMKg
IMKgICZndDsgZ2VuaXNvaW1hZ2UgwqAgwqAgwqAgL3Vzci9iaW4vZ2VuaXNvaW1hZ2U8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0OyBzbGlycCBzdXBwb3J0IMKgIMKgIGludGVybmFsPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDsgc21iZCDCoCDCoCDCoCDCoCDCoCDCoCDCoC91c3Ivc2Jpbi9zbWJkPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDsgbW9kdWxlIHN1cHBvcnQgwqAgwqBubzxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7IGFsdCBwYXRoIG1vZCBsb2FkIG5vPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgaG9zdCBD
UFUgwqAgwqAgwqAgwqAgwqBhYXJjaDY0PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgaG9zdCBiaWcg
ZW5kaWFuIMKgIG5vPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgdGFyZ2V0IGxpc3QgwqAgwqAgwqAg
YWFyY2g2NC1zb2Z0bW11IGFscGhhLXNvZnRtbXUgYXJtLXNvZnRtbXU8YnI+DQomZ3Q7wqAgwqAg
wqBjcmlzLXNvZnRtbXU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBocHBhLXNvZnRtbXUgaTM4Ni1z
b2Z0bW11IGxtMzItc29mdG1tdSBtNjhrLXNvZnRtbXU8YnI+DQomZ3Q7wqAgwqAgwqBtaWNyb2Js
YXplLXNvZnRtbXU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBtaWNyb2JsYXplZWwtc29mdG1tdSBt
aXBzLXNvZnRtbXUgbWlwczY0LXNvZnRtbXUgbWlwczY0ZWwtc29mdG1tdTxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7IG1pcHNlbC1zb2Z0bW11IG1veGllLXNvZnRtbXUgbmlvczItc29mdG1tdSBvcjFr
LXNvZnRtbXUgcHBjLXNvZnRtbXU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBwcGM2NC1zb2Z0bW11
IHJpc2N2MzItc29mdG1tdSByaXNjdjY0LXNvZnRtbXUgcngtc29mdG1tdTxicj4NCiZndDvCoCDC
oCDCoHMzOTB4LXNvZnRtbXU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBzaDQtc29mdG1tdSBzaDRl
Yi1zb2Z0bW11IHNwYXJjLXNvZnRtbXUgc3BhcmM2NC1zb2Z0bW11PGJyPg0KJmd0O8KgIMKgIMKg
dHJpY29yZS1zb2Z0bW11PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgdW5pY29yZTMyLXNvZnRtbXUg
eDg2XzY0LXNvZnRtbXUgeHRlbnNhLXNvZnRtbXUgeHRlbnNhZWItc29mdG1tdTxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7IGFhcmNoNjQtbGludXgtdXNlciBhYXJjaDY0X2JlLWxpbnV4LXVzZXIgYWxw
aGEtbGludXgtdXNlcjxicj4NCiZndDvCoCDCoCDCoGFybS1saW51eC11c2VyPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDsgYXJtZWItbGludXgtdXNlciBjcmlzLWxpbnV4LXVzZXIgaHBwYS1saW51eC11
c2VyIGkzODYtbGludXgtdXNlcjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IG02OGstbGludXgtdXNl
ciBtaWNyb2JsYXplLWxpbnV4LXVzZXIgbWljcm9ibGF6ZWVsLWxpbnV4LXVzZXI8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0OyBtaXBzLWxpbnV4LXVzZXIgbWlwczY0LWxpbnV4LXVzZXIgbWlwczY0ZWwt
bGludXgtdXNlcjxicj4NCiZndDvCoCDCoCDCoG1pcHNlbC1saW51eC11c2VyPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDsgbWlwc24zMi1saW51eC11c2VyIG1pcHNuMzJlbC1saW51eC11c2VyIG5pb3My
LWxpbnV4LXVzZXI8YnI+DQomZ3Q7wqAgwqAgwqBvcjFrLWxpbnV4LXVzZXI8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0OyBwcGMtbGludXgtdXNlciBwcGM2NC1saW51eC11c2VyIHBwYzY0YWJpMzItbGlu
dXgtdXNlcjxicj4NCiZndDvCoCDCoCDCoHBwYzY0bGUtbGludXgtdXNlcjxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7IHJpc2N2MzItbGludXgtdXNlciByaXNjdjY0LWxpbnV4LXVzZXIgczM5MHgtbGlu
dXgtdXNlcjxicj4NCiZndDvCoCDCoCDCoHNoNC1saW51eC11c2VyPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDsgc2g0ZWItbGludXgtdXNlciBzcGFyYy1saW51eC11c2VyIHNwYXJjMzJwbHVzLWxpbnV4
LXVzZXI8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBzcGFyYzY0LWxpbnV4LXVzZXIgdGlsZWd4LWxp
bnV4LXVzZXIgeDg2XzY0LWxpbnV4LXVzZXI8YnI+DQomZ3Q7wqAgwqAgwqB4dGVuc2EtbGludXgt
dXNlcjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IHh0ZW5zYWViLWxpbnV4LXVzZXI8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0OyBncHJvZiBlbmFibGVkIMKgIMKgIG5vPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDsgc3BhcnNlIGVuYWJsZWQgwqAgwqBubzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IHN0cmlwIGJp
bmFyaWVzIMKgIMKgeWVzPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgcHJvZmlsZXIgwqAgwqAgwqAg
wqAgwqBubzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IHN0YXRpYyBidWlsZCDCoCDCoCDCoG5vPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDsgU0RMIHN1cHBvcnQgwqAgwqAgwqAgeWVzICgyLjI2LjEpPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDsgU0RMIGltYWdlIHN1cHBvcnQgbm88YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0OyBHVEsgc3VwcG9ydCDCoCDCoCDCoCB5ZXMgKDMuMjQuMzMpPGJyPg0KJmd0O8KgIMKg
IMKgICZndDsgR1RLIEdMIHN1cHBvcnQgwqAgwqB5ZXM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBW
VEUgc3VwcG9ydCDCoCDCoCDCoCBubzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IFRMUyBwcmlvcml0
eSDCoCDCoCDCoE5PUk1BTDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IEdOVVRMUyBzdXBwb3J0IMKg
IMKgbm88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBsaWJnY3J5cHQgwqAgwqAgwqAgwqAgbm88YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0OyBuZXR0bGUgwqAgwqAgwqAgwqAgwqAgwqBubzxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7IGxpYnRhc24xIMKgIMKgIMKgIMKgIMKgbm88YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0OyBQQU0gwqAgwqAgwqAgwqAgwqAgwqAgwqAgbm88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBp
Y29udiBzdXBwb3J0IMKgIMKgIHllczxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IGN1cnNlcyBzdXBw
b3J0IMKgIMKgeWVzPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgdmlyZ2wgc3VwcG9ydCDCoCDCoCBu
bzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IGN1cmwgc3VwcG9ydCDCoCDCoCDCoG5vPGJyPg0KJmd0
O8KgIMKgIMKgICZndDsgbWluZ3czMiBzdXBwb3J0IMKgIG5vPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDsgQXVkaW8gZHJpdmVycyDCoCDCoCBwYSBvc3M8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBCbG9j
ayB3aGl0ZWxpc3QgKHJ3KTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IEJsb2NrIHdoaXRlbGlzdCAo
cm8pPGJyPg0KJmd0O8KgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyAqVmlydEZT
IHN1cHBvcnQgwqAgwqBubyo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7IE11bHRpcGF0aCBzdXBwb3J0IG5vPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgVk5DIHN1
cHBvcnQgwqAgwqAgwqAgeWVzPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgVk5DIFNBU0wgc3VwcG9y
dCDCoG5vPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgVk5DIEpQRUcgc3VwcG9ydCDCoHllczxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7IFZOQyBQTkcgc3VwcG9ydCDCoCB5ZXM8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0OyB4ZW4gc3VwcG9ydCDCoCDCoCDCoCBubzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IGJy
bGFwaSBzdXBwb3J0IMKgIMKgbm88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBEb2N1bWVudGF0aW9u
IMKgIMKgIG5vPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgUElFIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IHllczxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IHZkZSBzdXBwb3J0IMKgIMKgIMKgIG5vPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDsgbmV0bWFwIHN1cHBvcnQgwqAgwqBubzxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7IExpbnV4IEFJTyBzdXBwb3J0IG5vPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgTGludXgg
aW9fdXJpbmcgc3VwcG9ydCBubzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IEFUVFIvWEFUVFIgc3Vw
cG9ydCB5ZXM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBJbnN0YWxsIGJsb2JzIMKgIMKgIHllczxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7IEtWTSBzdXBwb3J0IMKgIMKgIMKgIHllczxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7IEhBWCBzdXBwb3J0IMKgIMKgIMKgIG5vPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDsgSFZGIHN1cHBvcnQgwqAgwqAgwqAgbm88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBXSFBYIHN1
cHBvcnQgwqAgwqAgwqBubzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IFRDRyBzdXBwb3J0IMKgIMKg
IMKgIHllczxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IFRDRyBkZWJ1ZyBlbmFibGVkIG5vPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDsgVENHIGludGVycHJldGVyIMKgIG5vPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDsgbWFsbG9jIHRyaW0gc3VwcG9ydCB5ZXM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBSRE1B
IHN1cHBvcnQgwqAgwqAgwqBubzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IFBWUkRNQSBzdXBwb3J0
IMKgIMKgbm88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBmZHQgc3VwcG9ydCDCoCDCoCDCoCBnaXQ8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBtZW1iYXJyaWVyIMKgIMKgIMKgIMKgbm88YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0OyBwcmVhZHYgc3VwcG9ydCDCoCDCoHllczxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7IGZkYXRhc3luYyDCoCDCoCDCoCDCoCB5ZXM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBtYWR2
aXNlIMKgIMKgIMKgIMKgIMKgIHllczxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IHBvc2l4X21hZHZp
c2UgwqAgwqAgeWVzPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgcG9zaXhfbWVtYWxpZ24gwqAgwqB5
ZXM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBsaWJjYXAtbmcgc3VwcG9ydCBubzxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7IHZob3N0LW5ldCBzdXBwb3J0IHllczxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
IHZob3N0LWNyeXB0byBzdXBwb3J0IHllczxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IHZob3N0LXNj
c2kgc3VwcG9ydCB5ZXM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyB2aG9zdC12c29jayBzdXBwb3J0
IHllczxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IHZob3N0LXVzZXIgc3VwcG9ydCB5ZXM8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0OyB2aG9zdC11c2VyLWZzIHN1cHBvcnQgeWVzPGJyPg0KJmd0O8KgIMKg
IMKgICZndDsgVHJhY2UgYmFja2VuZHMgwqAgwqBsb2c8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBz
cGljZSBzdXBwb3J0IMKgIMKgIG5vPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgcmJkIHN1cHBvcnQg
wqAgwqAgwqAgbm88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyB4ZnNjdGwgc3VwcG9ydCDCoCDCoG5v
PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgc21hcnRjYXJkIHN1cHBvcnQgbm88YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0OyBsaWJ1c2IgwqAgwqAgwqAgwqAgwqAgwqBubzxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7IHVzYiBuZXQgcmVkaXIgwqAgwqAgbm88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBPcGVuR0wg
c3VwcG9ydCDCoCDCoHllczxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IE9wZW5HTCBkbWFidWZzIMKg
IMKgeWVzPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgbGliaXNjc2kgc3VwcG9ydCDCoG5vPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDsgbGlibmZzIHN1cHBvcnQgwqAgwqBubzxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7IGJ1aWxkIGd1ZXN0IGFnZW50IHllczxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IFFHQSBW
U1Mgc3VwcG9ydCDCoCBubzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IFFHQSB3MzIgZGlzayBpbmZv
IG5vPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgUUdBIE1TSSBzdXBwb3J0IMKgIG5vPGJyPg0KJmd0
O8KgIMKgIMKgICZndDsgc2VjY29tcCBzdXBwb3J0IMKgIG5vPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDsgY29yb3V0aW5lIGJhY2tlbmQgdWNvbnRleHQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBjb3Jv
dXRpbmUgcG9vbCDCoCDCoHllczxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IGRlYnVnIHN0YWNrIHVz
YWdlIG5vPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgbXV0ZXggZGVidWdnaW5nIMKgIG5vPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDsgY3J5cHRvIGFmYWxnIMKgIMKgIMKgbm88YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0OyBHbHVzdGVyRlMgc3VwcG9ydCBubzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IGdjb3Yg
wqAgwqAgwqAgwqAgwqAgwqAgwqBnY292PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgZ2NvdiBlbmFi
bGVkIMKgIMKgIMKgbm88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBUUE0gc3VwcG9ydCDCoCDCoCDC
oCB5ZXM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBsaWJzc2ggc3VwcG9ydCDCoCDCoG5vPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDsgUU9NIGRlYnVnZ2luZyDCoCDCoCB5ZXM8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0OyBMaXZlIGJsb2NrIG1pZ3JhdGlvbiB5ZXM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBs
em8gc3VwcG9ydCDCoCDCoCDCoCBubzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IHNuYXBweSBzdXBw
b3J0IMKgIMKgbm88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBiemlwMiBzdXBwb3J0IMKgIMKgIG5v
PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgbHpmc2Ugc3VwcG9ydCDCoCDCoCBubzxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7IHpzdGQgc3VwcG9ydCDCoCDCoCDCoG5vPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDsgTlVNQSBob3N0IHN1cHBvcnQgeWVzPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgbGlieG1sMiDC
oCDCoCDCoCDCoCDCoCB5ZXM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyB0Y21hbGxvYyBzdXBwb3J0
IMKgbm88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBqZW1hbGxvYyBzdXBwb3J0IMKgbm88YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0OyBhdngyIG9wdGltaXphdGlvbjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
IGF2eDUxMmYgb3B0aW1pemF0aW9uIG5vPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgcmVwbGljYXRp
b24gc3VwcG9ydCB5ZXM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBWeEhTIGJsb2NrIGRldmljZSBu
bzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IGJvY2hzIHN1cHBvcnQgwqAgwqAgeWVzPGJyPg0KJmd0
O8KgIMKgIMKgICZndDsgY2xvb3Agc3VwcG9ydCDCoCDCoCB5ZXM8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0OyBkbWcgc3VwcG9ydCDCoCDCoCDCoCB5ZXM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBxY293
IHYxIHN1cHBvcnQgwqAgeWVzPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgdmRpIHN1cHBvcnQgwqAg
wqAgwqAgeWVzPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgdnZmYXQgc3VwcG9ydCDCoCDCoCB5ZXM8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBxZWQgc3VwcG9ydCDCoCDCoCDCoCB5ZXM8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0OyBwYXJhbGxlbHMgc3VwcG9ydCB5ZXM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
OyBzaGVlcGRvZyBzdXBwb3J0IMKgeWVzPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgY2Fwc3RvbmUg
wqAgwqAgwqAgwqAgwqBpbnRlcm5hbDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IGxpYnBtZW0gc3Vw
cG9ydCDCoCBubzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IGxpYnVkZXYgwqAgwqAgwqAgwqAgwqAg
eWVzPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgZGVmYXVsdCBkZXZpY2VzIMKgIHllczxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7IHBsdWdpbiBzdXBwb3J0IMKgIMKgbm88YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0OyBmdXp6aW5nIHN1cHBvcnQgwqAgbm88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBnZGIgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgL3Vzci9iaW4vZ2RiPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgY3Jv
c3MgY29udGFpbmVycyDCoGRvY2tlcjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDsgVGhhbmtzLjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKg
IMKgICZndDsgT24gVHVlLCBTZXAgMywgMjAyNCBhdCAxMDo1NeKAr0FNIE1hcmlvIE1hcmlldHRv
PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Im1haWx0bzptYXJpZXR0bzIwMDhAZ21haWwu
Y29tIiB0YXJnZXQ9Il9ibGFuayI+bWFyaWV0dG8yMDA4QGdtYWlsLmNvbTwvYT4gJmx0O21haWx0
bzo8YSBocmVmPSJtYWlsdG86bWFyaWV0dG8yMDA4QGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsi
Pm1hcmlldHRvMjAwOEBnbWFpbC5jb208L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICZs
dDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOm1hcmlldHRvMjAwOEBnbWFpbC5jb20iIHRhcmdldD0i
X2JsYW5rIj5tYXJpZXR0bzIwMDhAZ21haWwuY29tPC9hPiAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1h
aWx0bzptYXJpZXR0bzIwMDhAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+bWFyaWV0dG8yMDA4
QGdtYWlsLmNvbTwvYT4mZ3Q7Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqB3cm90ZTo8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqBGaW5hbGx5IGl0
IHdvcmtlZCA6PGJyPg0KJmd0O8KgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgSXN0YW50YW5lYV8yMDI0LTA5LTAzXzEwLTUxLTM1LmpwZzxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqBWZXJ5IHRoYW5rcyBtYW4uIEluIGFueSBjYXNlIGl0IGlzIFZFUlkgc2xv
dyBhbmQgbm90IHVzYWJsZTxicj4NCiZndDvCoCDCoCDCoGF0IGFsbC48YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgSXMgdGhlcmUgc29tZXRoaW5nIHRoYXQgSSBjYW4gZG8gdG8gaW1wcm92
ZSBpdHMgc3BlZWQgPzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZn
dDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgT24gVHVlLCBTZXAgMywgMjAyNCBhdCAx
MDozM+KAr0FNIE1hcmlvIE1hcmlldHRvPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZs
dDs8YSBocmVmPSJtYWlsdG86bWFyaWV0dG8yMDA4QGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsi
Pm1hcmlldHRvMjAwOEBnbWFpbC5jb208L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOm1h
cmlldHRvMjAwOEBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5tYXJpZXR0bzIwMDhAZ21haWwu
Y29tPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpt
YXJpZXR0bzIwMDhAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+bWFyaWV0dG8yMDA4QGdtYWls
LmNvbTwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86bWFyaWV0dG8yMDA4QGdtYWlsLmNv
bSIgdGFyZ2V0PSJfYmxhbmsiPm1hcmlldHRvMjAwOEBnbWFpbC5jb208L2E+Jmd0OyZndDsmZ3Q7
IHdyb3RlOjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDCoHppb21hcmlvQFozOTAtQU9SVVMtUFJPLURFU1Q6
L21udC96cm9vdC0xMzMvX09TL0FuZHJvaWQvYW9zcF8xNC9hbmRyb2lkLWltYWdlJCBIT01FPSQo
cHdkKSAuL2Jpbi9sYXVuY2hfY3ZkIC12bV9tYW5hZ2VyIHFlbXVfY2xpIC1yZXBvcnRfYW5vbnlt
b3VzX3VzYWdlX3N0YXRzPW4gLS1zdGFydF93ZWJydGM9ZmFsc2U8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAwOS0wMyAxMDowNDo0NC4y
MDYgMjc4NjM4NiAyNzg2Mzg2IEkgbGF1bmNoX2N2ZDogbWFpbi5jYzoyMzU8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgVXNpbmcgc3lzdGVtX2ltYWdlX2RpciBvZjo8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKgPT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBOT1RJQ0U6PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgQnkgdXNpbmcg
dGhpcyBBbmRyb2lkIFZpcnR1YWwgRGV2aWNlLCB5b3UgYWdyZWUgdG88YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgR29vZ2xlIFRlcm1zIG9mIFNlcnZpY2U8YnI+DQomZ3Q7wqAg
wqAgwqAoPGEgaHJlZj0iaHR0cHM6Ly9wb2xpY2llcy5nb29nbGUuY29tL3Rlcm1zIiByZWw9Im5v
cmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL3BvbGljaWVzLmdvb2dsZS5jb20vdGVy
bXM8L2E+ICZsdDs8YSBocmVmPSJodHRwczovL3BvbGljaWVzLmdvb2dsZS5jb20vdGVybXMiIHJl
bD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vcG9saWNpZXMuZ29vZ2xlLmNv
bS90ZXJtczwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCZsdDs8
YSBocmVmPSJodHRwczovL3BvbGljaWVzLmdvb2dsZS5jb20vdGVybXMiIHJlbD0ibm9yZWZlcnJl
ciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vcG9saWNpZXMuZ29vZ2xlLmNvbS90ZXJtczwvYT48
YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cHM6Ly9wb2xpY2llcy5nb29nbGUuY29t
L3Rlcm1zIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL3BvbGljaWVz
Lmdvb2dsZS5jb20vdGVybXM8L2E+Jmd0OyZndDspLjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqBUaGUgR29vZ2xlIFByaXZhY3kgUG9saWN5PGJyPg0KJmd0O8KgIMKgIMKgKDxh
IGhyZWY9Imh0dHBzOi8vcG9saWNpZXMuZ29vZ2xlLmNvbS9wcml2YWN5IiByZWw9Im5vcmVmZXJy
ZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL3BvbGljaWVzLmdvb2dsZS5jb20vcHJpdmFjeTwv
YT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cHM6Ly9wb2xpY2llcy5nb29nbGUu
Y29tL3ByaXZhY3kiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vcG9s
aWNpZXMuZ29vZ2xlLmNvbS9wcml2YWN5PC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHBzOi8vcG9saWNpZXMuZ29vZ2xlLmNvbS9wcml2
YWN5IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL3BvbGljaWVzLmdv
b2dsZS5jb20vcHJpdmFjeTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cHM6
Ly9wb2xpY2llcy5nb29nbGUuY29tL3ByaXZhY3kiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJf
YmxhbmsiPmh0dHBzOi8vcG9saWNpZXMuZ29vZ2xlLmNvbS9wcml2YWN5PC9hPiZndDsmZ3Q7KTxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBkZXNjcmliZXMgaG93IEdvb2dsZSBo
YW5kbGVzIGluZm9ybWF0aW9uIGdlbmVyYXRlZCBhcyB5b3UgdXNlPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoEdvb2dsZSBTZXJ2aWNlcy48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKgPT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PTxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoFJlYWRpbmcgLS1j
b25maWcgb3B0aW9uIGZyb206PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoDxicj4N
CiZndDvCoCDCoCDCoCDCoC9tbnQvenJvb3QtMTMzL19PUy9BbmRyb2lkL2Fvc3BfMTQvYW5kcm9p
ZC1pbWFnZS9hbmRyb2lkLWluZm8udHh0PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoExhdW5jaGluZyBDVkQgdXNpbmcgLS1jb25maWc9JiMzOTtwaG9uZSYjMzk7Ljxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBHUFUgYXV0byBtb2RlOiBkZXRlY3RlZCBwcmVy
ZXF1aXNpdGVzIGZvciBhY2NlbGVyYXRlZDxicj4NCiZndDvCoCDCoCDCoHJlbmRlcmluZzxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBzdXBwb3J0Ljxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqBFbmFibGluZyAtLWdwdV9tb2RlPWdmeHN0cmVhbS48YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgR1BVIHZob3N0IHVzZXIgYXV0byBtb2RlOiBu
b3QgeWV0IHN1cHBvcnRlZCB3aXRoPGJyPg0KJmd0O8KgIMKgIMKgcWVtdV9jbGkuIE5vdDxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBlbmFibGluZyB2aG9zdCB1c2VyIGdwdS48
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgUmVxdWVzdGVkIHJlc3VtaW5nIGEg
cHJldmlvdXMgc2Vzc2lvbiAodGhlIGRlZmF1bHQ8YnI+DQomZ3Q7wqAgwqAgwqBiZWhhdmlvcikg
YnV0PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoHRoZSBiYXNlIGltYWdlcyBo
YXZlIGNoYW5nZWQgdW5kZXIgdGhlIG92ZXJsYXksIG1ha2luZyB0aGU8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgb3ZlcmxheSBpbmNvbXBhdGlibGUuIFdpcGluZyB0aGUgb3Zl
cmxheSBmaWxlcy48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgUGF0aCBmb3Ig
aW5zdGFuY2UgVURTOiAvdG1wL2NmX2F2ZF8xMDAwPGJyPg0KJmd0O8KgIMKgIMKgICZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgVGhlIGZvbGxvd2luZyBsaW5lcyBjb250
YWluIHVzZWZ1bCBkZWJ1Z2dpbmcgaW5mb3JtYXRpb246PGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoFNlcmlhbCBjb25zb2xlIGlzIGRpc2FibGVkOyB1c2UgLWNvbnNvbGU9
dHJ1ZSB0byBlbmFibGUgaXQuPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oExvZ2NhdCBvdXRwdXQ6PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoDxicj4NCiZn
dDvCoCDCoCDCoCDCoC9tbnQvenJvb3QtMTMzL19PUy9BbmRyb2lkL2Fvc3BfMTQvYW5kcm9pZC1p
bWFnZS9jdXR0bGVmaXNoL2luc3RhbmNlcy9jdmQtMS9sb2dzL2xvZ2NhdDxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoEtlcm5lbCBs
b2c6PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDC
oC9tbnQvenJvb3QtMTMzL19PUy9BbmRyb2lkL2Fvc3BfMTQvYW5kcm9pZC1pbWFnZS9jdXR0bGVm
aXNoL2luc3RhbmNlcy9jdmQtMS9rZXJuZWwubG9nPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoCDCoCDCoCDCoExhdW5jaGVyIGxvZzo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
IMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKgL21udC96cm9vdC0xMzMvX09TL0FuZHJvaWQvYW9zcF8x
NC9hbmRyb2lkLWltYWdlL2N1dHRsZWZpc2gvaW5zdGFuY2VzL2N2ZC0xL2xvZ3MvbGF1bmNoZXIu
bG9nPGJyPg0KJmd0O8KgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
IMKgIMKgIMKgSW5zdGFuY2UgY29uZmlndXJhdGlvbjo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKgL21udC96cm9vdC0xMzMvX09TL0FuZHJvaWQv
YW9zcF8xNC9hbmRyb2lkLWltYWdlL2N1dHRsZWZpc2gvaW5zdGFuY2VzL2N2ZC0xL2N1dHRsZWZp
c2hfY29uZmlnLmpzb248YnI+DQomZ3Q7wqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqAgwqBMYXVuY2hlciBCdWlsZCBJRDogMTIzMDkyOTY8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqA8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAvbW50L3pyb290LTEzMy9fT1MvQW5kcm9pZC9hb3NwXzE0L2FuZHJvaWQtaW1h
Z2UvYmluL21vZGVtX3NpbXVsYXRvcjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqA8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAvbW50L3pyb290LTEzMy9fT1MvQW5kcm9pZC9hb3NwXzE0L2Fu
ZHJvaWQtaW1hZ2UvYmluL3RvbWJzdG9uZV9yZWNlaXZlcjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAgwqAvbW50L3pyb290LTEzMy9fT1MvQW5kcm9pZC9hb3NwXzE0L2FuZHJvaWQt
aW1hZ2UvYmluL2xvZ190ZWU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgL21u
dC96cm9vdC0xMzMvX09TL0FuZHJvaWQvYW9zcF8xNC9hbmRyb2lkLWltYWdlL2Jpbi93bWVkaXVt
ZDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAv
bW50L3pyb290LTEzMy9fT1MvQW5kcm9pZC9hb3NwXzE0L2FuZHJvaWQtaW1hZ2UvYmluL2Nhc2lt
aXJfY29udHJvbF9zZXJ2ZXI8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgL21udC96cm9vdC0xMzMvX09TL0FuZHJvaWQvYW9zcF8xNC9hbmRyb2lk
LWltYWdlL2Jpbi9zY3JlZW5fcmVjb3JkaW5nX3NlcnZlcjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAvbW50L3pyb290LTEzMy9fT1MvQW5kcm9p
ZC9hb3NwXzE0L2FuZHJvaWQtaW1hZ2UvYmluL2FkYl9jb25uZWN0b3I8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKgL21udC96cm9vdC0xMzMvX09T
L0FuZHJvaWQvYW9zcF8xNC9hbmRyb2lkLWltYWdlL2Jpbi9zb2NrZXRfdnNvY2tfcHJveHk8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKgL21udC96
cm9vdC0xMzMvX09TL0FuZHJvaWQvYW9zcF8xNC9hbmRyb2lkLWltYWdlL2Jpbi9zb2NrZXRfdnNv
Y2tfcHJveHk8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgPGJyPg0KJmd0O8KgIMKg
IMKgIMKgL21udC96cm9vdC0xMzMvX09TL0FuZHJvaWQvYW9zcF8xNC9hbmRyb2lkLWltYWdlL2Jp
bi90Y3BfY29ubmVjdG9yPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoDxicj4NCiZn
dDvCoCDCoCDCoCDCoC9tbnQvenJvb3QtMTMzL19PUy9BbmRyb2lkL2Fvc3BfMTQvYW5kcm9pZC1p
bWFnZS9iaW4vY29udHJvbF9lbnZfcHJveHlfc2VydmVyPGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDCoC9tbnQvenJvb3QtMTMzL19PUy9BbmRyb2lk
L2Fvc3BfMTQvYW5kcm9pZC1pbWFnZS9iaW4vZWNob19zZXJ2ZXI8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgU3RhcnQgbW9kZW0gc2ltdWxhdG9yLCBzZXJ2ZXJfZmRzOiA1OCwg
U2ltIHR5cGU6IG5vcm1hbDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqA8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAvbW50L3pyb290LTEzMy9fT1MvQW5kcm9pZC9hb3NwXzE0L2FuZHJvaWQt
aW1hZ2UvYmluL2duc3NfZ3JwY19wcm94eTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAvbW50L3pyb290LTEzMy9fT1MvQW5kcm9pZC9hb3NwXzE0
L2FuZHJvaWQtaW1hZ2UvYmluL2xvZ2NhdF9yZWNlaXZlcjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAvbW50L3pyb290LTEzMy9fT1MvQW5kcm9p
ZC9hb3NwXzE0L2FuZHJvaWQtaW1hZ2UvYmluL2tlcm5lbF9sb2dfbW9uaXRvcjxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAvbW50L3pyb290LTEz
My9fT1MvQW5kcm9pZC9hb3NwXzE0L2FuZHJvaWQtaW1hZ2UvYmluL29wZW53cnRfY29udHJvbF9z
ZXJ2ZXI8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgL21udC96cm9vdC0xMzMv
X09TL0FuZHJvaWQvYW9zcF8xNC9hbmRyb2lkLWltYWdlL2Jpbi9sb2dfdGVlPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDCoC9tbnQvenJvb3QtMTMz
L19PUy9BbmRyb2lkL2Fvc3BfMTQvYW5kcm9pZC1pbWFnZS9iaW4vcHJvY2Vzc19yZXN0YXJ0ZXI8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgL21udC96cm9vdC0xMzMvX09TL0Fu
ZHJvaWQvYW9zcF8xNC9hbmRyb2lkLWltYWdlL2Jpbi9uZXRzaW1kPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDCoC9tbnQvenJvb3QtMTMzL19PUy9B
bmRyb2lkL2Fvc3BfMTQvYW5kcm9pZC1pbWFnZS9iaW4vc29ja2V0X3Zzb2NrX3Byb3h5PGJyPg0K
Jmd0O8KgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgRmFp
bGVkIHRvIG9wZW4gc29ja2V0OiBDb25uZWN0aW9uIHJlZnVzZWQ8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCDCoDxicj4NCiZndDvCoCDCoCDCoCDCoC9tbnQvenJvb3QtMTMzL19PUy9BbmRyb2lkL2Fvc3Bf
MTQvYW5kcm9pZC1pbWFnZS9iaW4vc29ja2V0X3Zzb2NrX3Byb3h5PGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDCoC9tbnQvenJvb3QtMTMzL19PUy9B
bmRyb2lkL2Fvc3BfMTQvYW5kcm9pZC1pbWFnZS9iaW4vc2VjdXJlX2Vudjxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAvbW50L3pyb290LTEzMy9f
T1MvQW5kcm9pZC9hb3NwXzE0L2FuZHJvaWQtaW1hZ2UvYmluL3g4Nl82NC1saW51eC1nbnUvcWVt
dS9xZW11LXN5c3RlbS1hYXJjaDY0PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oFNlcnZlciBsaXN0ZW5pbmcgb248YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgPGJy
Pg0KJmd0O8KgIMKgIMKgIMKgdW5peDovdG1wL2NmX2F2ZF8xMDAwL2N2ZC0xL2dycGNfc29ja2V0
L0Nhc2ltaXJDb250cm9sU2VydmVyLnNvY2s8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
IMKgIMKgU2VydmVyIGxpc3RlbmluZyBvbjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqB1bml4Oi90bXAvY2ZfYXZkXzEwMDAvY3ZkLTEvZ3JwY19zb2NrZXQvRWNob1NlcnZlci5z
b2NrPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoFNlcnZlciBsaXN0ZW5pbmcg
b248YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKg
dW5peDovdG1wL2NmX2F2ZF8xMDAwL2N2ZC0xL2dycGNfc29ja2V0L09wZW53cnRDb250cm9sU2Vy
dmVyLnNvY2s8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgcm9vdC1jYW5hbCBJ
IDA5LTAzIDEwOjA2OjEzLjIxOSBkZXZpY2VfYm91dGlxdWUuY2M6Mzc8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgUmVnaXN0ZXJpbmcgYmVhY29uPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoHJvb3QtY2FuYWwgSSAwOS0wMyAxMDowNjoxMy4yMTkgZGV2aWNl
X2JvdXRpcXVlLmNjOjM3PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoFJlZ2lz
dGVyaW5nIGJlYWNvbl9zd2FybTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBy
b290LWNhbmFsIEkgMDktMDMgMTA6MDY6MTMuMjE5IGRldmljZV9ib3V0aXF1ZS5jYzozNzxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBSZWdpc3RlcmluZyBzY3JpcHRlZF9iZWFj
b248YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgcm9vdC1jYW5hbCBJIDA5LTAz
IDEwOjA2OjEzLjIxOSBkZXZpY2VfYm91dGlxdWUuY2M6Mzc8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgUmVnaXN0ZXJpbmcgc25pZmZlcjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAgwqBTZXJ2ZXIgbGlzdGVuaW5nIG9uPGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDCoHVuaXg6L3RtcC9jZl9hdmRfMTAwMC9jdmQt
MS9ncnBjX3NvY2tldC9Db250cm9sRW52UHJveHlTZXJ2ZXIuc29jazxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqBuZXRzaW1kIEkgMDktMDMgMDg6MDY6MTMuMjIxIDxhIGhyZWY9
Imh0dHA6Ly9ydXN0X21haW4ucnM6OTgiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsi
PnJ1c3RfbWFpbi5yczo5ODwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDov
L3J1c3RfbWFpbi5yczo5OCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDov
L3J1c3RfbWFpbi5yczo5ODwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCZsdDs8YSBocmVmPSJodHRwOi8vcnVzdF9tYWluLnJzOjk4IiByZWw9Im5vcmVmZXJyZXIi
IHRhcmdldD0iX2JsYW5rIj5odHRwOi8vcnVzdF9tYWluLnJzOjk4PC9hPiAmbHQ7PGEgaHJlZj0i
aHR0cDovL3J1c3RfbWFpbi5yczo5OCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+
aHR0cDovL3J1c3RfbWFpbi5yczo5ODwvYT4mZ3Q7Jmd0OyAtPGJyPg0KJmd0O8KgIMKgIMKgbmV0
c2ltIGFydGlmYWN0cyBwYXRoOjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAm
cXVvdDsvdG1wL2FuZHJvaWQtemlvbWFyaW8vbmV0c2ltZCZxdW90Ozxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqBuZXRzaW1kIEkgMDktMDMgMDg6MDY6MTMuMjIxIDxhIGhyZWY9
Imh0dHA6Ly9ydXN0X21haW4ucnM6MTAxIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5r
Ij5ydXN0X21haW4ucnM6MTAxPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRw
Oi8vcnVzdF9tYWluLnJzOjEwMSIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0
cDovL3J1c3RfbWFpbi5yczoxMDE8L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL3J1c3RfbWFpbi5yczoxMDEiIHJlbD0ibm9yZWZl
cnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9ydXN0X21haW4ucnM6MTAxPC9hPiAmbHQ7PGEg
aHJlZj0iaHR0cDovL3J1c3RfbWFpbi5yczoxMDEiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJf
YmxhbmsiPmh0dHA6Ly9ydXN0X21haW4ucnM6MTAxPC9hPiZndDsmZ3Q7IC08YnI+DQomZ3Q7wqAg
wqAgwqBOZXRzaW1kQXJncyB7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oMKgwqBmZF9zdGFydHVwX3N0cjogU29tZSg8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
IMKgIMKgIMKgwqDCoMKgwqDCoMKgJnF1b3Q7e1wmcXVvdDtkZXZpY2VzXCZxdW90Ozpbe1wmcXVv
dDtuYW1lXCZxdW90OzpcJnF1b3Q7PGEgaHJlZj0iaHR0cDovLzAuMC4wLjA6NjUyMCIgcmVsPSJu
b3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+MC4wLjAuMDo2NTIwPC9hPjxicj4NCiZndDvCoCDC
oCDCoCZsdDs8YSBocmVmPSJodHRwOi8vMC4wLjAuMDo2NTIwIiByZWw9Im5vcmVmZXJyZXIiIHRh
cmdldD0iX2JsYW5rIj5odHRwOi8vMC4wLjAuMDo2NTIwPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly8wLjAuMC4wOjY1MjAiIHJl
bD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly8wLjAuMC4wOjY1MjA8L2E+PGJy
Pg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly8wLjAuMC4wOjY1MjAiIHJlbD0ibm9y
ZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly8wLjAuMC4wOjY1MjA8L2E+Jmd0OyZndDtc
JnF1b3Q7LFwmcXVvdDtjaGlwc1wmcXVvdDs6W3tcJnF1b3Q7a2luZFwmcXVvdDs6XCZxdW90O0JM
VUVUT09USFwmcXVvdDssXCZxdW90O2ZkSW5cJnF1b3Q7OjgxLFwmcXVvdDtmZE91dFwmcXVvdDs6
ODJ9LHtcJnF1b3Q7a2luZFwmcXVvdDs6XCZxdW90O1VXQlwmcXVvdDssXCZxdW90O2ZkSW48YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgXCZxdW90Ozo4MyxcJnF1b3Q7ZmRPdXRc
JnF1b3Q7Ojg0fV19XX0mcXVvdDssPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoMKgwqApLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqDCoMKgbm9f
Y2xpX3VpOiBmYWxzZSw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgwqDC
oG5vX3dlYl91aTogZmFsc2UsPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oMKgwqBwY2FwOiBmYWxzZSw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
wqDCoGRpc2FibGVfYWRkcmVzc19yZXVzZTogZmFsc2UsPGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoMKgwqBoY2lfcG9ydDogU29tZSg8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgwqDCoMKgwqDCoMKgNzMwMCw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgwqDCoCksPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoMKgwqBjb25uZWN0b3JfaW5zdGFuY2U6IE5vbmUsPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCDCoCDCoCDCoMKgwqBpbnN0YW5jZTogU29tZSg8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgwqDCoMKgwqDCoMKgMSw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgwqDCoCksPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoMKgwqBsb2d0b3N0ZGVycjogZmFsc2UsPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoCDCoCDCoCDCoMKgwqBkZXY6IGZhbHNlLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAgwqAgwqAgwqDCoMKgcnVzdF9ncnBjOiBmYWxzZSw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgwqDCoHJ1c3RfaG9zdGFwZDogZmFsc2UsPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoCDCoMKgwqBydXN0X3NsaXJwOiB0cnVlLDxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqDCoMKgdnNvY2s6IE5vbmUsPGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoMKgwqBjb25maWc6IE5vbmUsPGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoMKgwqBob3N0X2RuczogTm9uZSw8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgwqDCoGh0dHBfcHJveHk6IE5vbmUsPGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoMKgwqB3aWZpX3RhcDogTm9uZSw8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgwqDCoHRlc3RfYmVhY29uczogZmFsc2Us
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoMKgwqBub190ZXN0X2JlYWNv
bnM6IGZhbHNlLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqDCoMKgbm9f
c2h1dGRvd246IGZhbHNlLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqDC
oMKgdmVyYm9zZTogZmFsc2UsPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oMKgwqB2ZXJzaW9uOiBmYWxzZSw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
fTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBTaXplIG9mIE9CSkVDVCA9IDEy
MDQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgU2l6ZSBvZiBjb21wb25lbnRz
IGluIFRQTVRfU0VOU0lUSVZFID0gNzQ0PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoMKgwqBUUE1JX0FMR19QVUJMSUMgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAyPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoMKgwqBUUE0yQl9BVVRI
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoDUwPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoMKgwqBUUE0yQl9ESUdFU1QgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqA1MDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAgwqAgwqAgwqDCoMKgVFBNVV9TRU5TSVRJVkVfQ09NUE9TSVRFIMKgwqDCoMKgwqDCoMKgNjQy
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoE1BWF9DT05URVhUX1NJWkUgY2Fu
IGJlIHJlZHVjZWQgdG8gMTI2NCAoMTM0NCk8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
IMKgIMKgc2l6ZSA6IDM2MDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBzdGFy
dGluZyBSdXN0IEtleU1pbnQgVEEgaW1wbGVtZW50YXRpb24gaW4gYSB0aHJlYWQ8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgc3RhcnRpbmcgQysrIEtleU1pbnQgaW1wbGVtZW50
YXRpb24gaW4gYSB0aHJlYWQgd2l0aCBGRHM8YnI+DQomZ3Q7wqAgwqAgwqBpbj0zMSw8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgb3V0PTMwPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCDCoCDCoEtleU1pbnQgUnVzdCBUQSBydW5uaW5nIHdpdGggaW5maWxlPTM3LCBv
dXRmaWxlPTM2LDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBzZWN1cml0eV9s
ZXZlbD1Tb2Z0d2FyZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBObyBzZWN1
cmUgZGVsZXRpb24gZGF0YSBmaWxlIGZvdW5kLiBDcmVhdGluZyBvbmUuPGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoEkwOTAzIDEwOjA2OjEzLjI0OTQxOCAyNzg2NzI0IFNoYXJl
ZExpYnJhcnkuY3BwOjY0XTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBTaGFy
ZWRMaWJyYXJ5OjpvcGVuIGZvciBbbGlidnVsa2FuLnNvXTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoEkwOTAzIDEwOjA2OjEzLjI0OTUw
NyAyNzg2NzI0IFNoYXJlZExpYnJhcnkuY3BwOjc2XTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqBTaGFyZWRMaWJyYXJ5OjpvcGVuIGZvciBbbGlidnVsa2FuLnNvXTogbm90IGZv
dW5kIGluIG1hcCw8YnI+DQomZ3Q7wqAgwqAgwqBvcGVuPGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoGZvciB0aGUgZmlyc3QgdGltZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoEkwOTAzIDEwOjA2OjEzLjI0OTUxMSAy
Nzg2NzI0IFNoYXJlZExpYnJhcnkuY3BwOjE4Nl08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgIMKgIMKgU2hhcmVkTGlicmFyeTo6b3BlbiBmb3IgW2xpYnZ1bGthbi5zb10gKHBvc2l4KTog
YmVnaW48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAgwqAgwqBJMDkwMyAxMDowNjoxMy4yNDk1MTQgMjc4NjcyNCBTaGFyZWRMaWJyYXJ5LmNwcDoy
NDRdPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoFNoYXJlZExpYnJhcnk6Om9w
ZW4gZm9yIFtsaWJ2dWxrYW4uc29dIChwb3NpeCxsaW51eCk6IGNhbGw8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgZGxvcGVuIG9uIFtsaWJ2dWxrYW4uc288YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgXTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoGFkZGVkIGxpYnJhcnkgbGlidnVsa2FuLnNvPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoEkwOTAzIDEwOjA2OjEzLjI1MDUzNSAy
Nzg2NzI0IEhlYWx0aE1vbml0b3IuY3BwOjI4MF08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgIMKgIMKgSGVhbHRoTW9uaXRvciBkaXNhYmxlZC48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgY3JlYXRlR2xvYmFsVmtFbXVsYXRpb246OTY0IFNlbGVjdGluZyBWdWxrYW4g
ZGV2aWNlOiBOVklESUE8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgR2VGb3Jj
ZSBHVFggMTA2MCAzR0I8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgaW5pdGlh
bGl6ZTogU3VwcG9ydHMgaWQgcHJvcGVydGllcywgZ290IGEgdnVsa2FuIGRldmljZSBVVUlEPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoEkwOTAzIDEwOjA2OjEzLjM1NDc1NiAy
Nzg2NzI0IFNoYXJlZExpYnJhcnkuY3BwOjc2XTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAgwqAgwqBTaGFyZWRMaWJyYXJ5OjpvcGVuIGZvciBbbGliR0xFU3YyLnNvXTogbm90IGZvdW5k
IGluIG1hcCw8YnI+DQomZ3Q7wqAgwqAgwqBvcGVuPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoCDCoCDCoGZvciB0aGUgZmlyc3QgdGltZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoEkwOTAzIDEwOjA2OjEzLjM1NDc2NCAyNzg2
NzI0IFNoYXJlZExpYnJhcnkuY3BwOjE4Nl08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
IMKgIMKgU2hhcmVkTGlicmFyeTo6b3BlbiBmb3IgW2xpYkdMRVN2Mi5zb10gKHBvc2l4KTogYmVn
aW48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqBJMDkwMyAxMDowNjoxMy4zNTQ3NjggMjc4NjcyNCBTaGFyZWRMaWJyYXJ5LmNwcDoyNDRd
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoFNoYXJlZExpYnJhcnk6Om9wZW4g
Zm9yIFtsaWJHTEVTdjIuc29dIChwb3NpeCxsaW51eCk6IGNhbGw8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgZGxvcGVuIG9uIFtsaWJHTEVTdjIuc288YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgXTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoEkwOTAzIDEwOjA2OjEzLjM1NTA3NiAyNzg2NzI0IFNo
YXJlZExpYnJhcnkuY3BwOjc2XTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBT
aGFyZWRMaWJyYXJ5OjpvcGVuIGZvciBbbGliRUdMLnNvXTogbm90IGZvdW5kIGluIG1hcCw8YnI+
DQomZ3Q7wqAgwqAgwqBvcGVuIGZvcjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqB0aGUgZmlyc3QgdGltZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoEkwOTAzIDEwOjA2OjEzLjM1NTA4MSAyNzg2NzI0IFNoYXJlZExp
YnJhcnkuY3BwOjE4Nl08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgU2hhcmVk
TGlicmFyeTo6b3BlbiBmb3IgW2xpYkVHTC5zb10gKHBvc2l4KTogYmVnaW48YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBJMDkwMyAxMDow
NjoxMy4zNTUwODQgMjc4NjcyNCBTaGFyZWRMaWJyYXJ5LmNwcDoyNDRdPGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoFNoYXJlZExpYnJhcnk6Om9wZW4gZm9yIFtsaWJFR0wuc29d
IChwb3NpeCxsaW51eCk6IGNhbGw8YnI+DQomZ3Q7wqAgwqAgwqBkbG9wZW48YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgb24gW2xpYkVHTC5zb108YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBJMDkwMyAxMDowNjoxMy40
NDg4MjEgMjc4NjcyNCBWa0NvbW1vbk9wZXJhdGlvbnMuY3BwOjEyMjZdPGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoEluaXRpYWxpemluZyBWa0VtdWxhdGlvbiBmZWF0dXJlczo8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgSTA5MDMgMTA6MDY6MTMuNDQ4ODM3
IDI3ODY3MjQgVmtDb21tb25PcGVyYXRpb25zLmNwcDoxMjI3XTxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqAgwqDCoMKgwqBnbEludGVyb3BTdXBwb3J0ZWQ6IHRydWU8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgSTA5MDMgMTA6MDY6MTMuNDQ4ODQwIDI3ODY3
MjQgVmtDb21tb25PcGVyYXRpb25zLmNwcDoxMjI4XTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqDCoMKgwqB1c2VEZWZlcnJlZENvbW1hbmRzOiB0cnVlPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoEkwOTAzIDEwOjA2OjEzLjQ0ODg0MiAyNzg2NzI0IFZr
Q29tbW9uT3BlcmF0aW9ucy5jcHA6MTIzMF08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
IMKgIMKgIMKgwqDCoMKgY3JlYXRlUmVzb3VyY2VXaXRoUmVxdWlyZW1lbnRzOiB0cnVlPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoEkwOTAzIDEwOjA2OjEzLjQ0ODg0NCAyNzg2
NzI0IFZrQ29tbW9uT3BlcmF0aW9ucy5jcHA6MTIzMV08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgwqDCoMKgdXNlVnVsa2FuQ29tcG9zaXRpb246IGZhbHNlPGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoEkwOTAzIDEwOjA2OjEzLjQ0ODg0NiAyNzg2NzI0
IFZrQ29tbW9uT3BlcmF0aW9ucy5jcHA6MTIzMl08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgIMKgIMKgIMKgwqDCoMKgdXNlVnVsa2FuTmF0aXZlU3dhcGNoYWluOiBmYWxzZTxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBJMDkwMyAxMDowNjoxMy40NDg4NDggMjc4Njcy
NCBWa0NvbW1vbk9wZXJhdGlvbnMuY3BwOjEyMzNdPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoCDCoCDCoCDCoMKgwqDCoGVuYWJsZSBndWVzdFJlbmRlckRvYzogZmFsc2U8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgSTA5MDMgMTA6MDY6MTMuNDQ4ODUwIDI3ODY3MjQg
VmtDb21tb25PcGVyYXRpb25zLmNwcDoxMjM0XTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAgwqAgwqAgwqDCoMKgwqBBU1RDIExEUiBlbXVsYXRpb24gbW9kZTogMjxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBJMDkwMyAxMDowNjoxMy40NDg4NTIgMjc4NjcyNCBWa0Nv
bW1vbk9wZXJhdGlvbnMuY3BwOjEyMzVdPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoMKgwqDCoGVuYWJsZSBFVEMyIGVtdWxhdGlvbjogdHJ1ZTxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqBJMDkwMyAxMDowNjoxMy40NDg4NTQgMjc4NjcyNCBWa0NvbW1v
bk9wZXJhdGlvbnMuY3BwOjEyMzZdPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoMKgwqDCoGVuYWJsZSBZY2JjciBlbXVsYXRpb246IGZhbHNlPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoEkwOTAzIDEwOjA2OjEzLjQ0ODg1NiAyNzg2NzI0IFZrQ29tbW9u
T3BlcmF0aW9ucy5jcHA6MTIzN108YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgwqDCoMKgZ3Vlc3RVc2VzQW5nbGU6IGZhbHNlPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoCDCoCDCoEkwOTAzIDEwOjA2OjEzLjQ0ODg1OCAyNzg2NzI0IFZrQ29tbW9uT3BlcmF0aW9u
cy5jcHA6MTIzOF08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgwqDCoMKg
dXNlRGVkaWNhdGVkQWxsb2NhdGlvbnM6IGZhbHNlPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoCDCoCDCoEkwOTAzIDEwOjA2OjEzLjQ0OTU0MiAyNzg2NzI0IEZyYW1lQnVmZmVyLmNwcDo0
ODZdIEdyYXBoaWNzPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoEFkYXB0ZXIg
VmVuZG9yIEdvb2dsZSAoTlZJRElBIENvcnBvcmF0aW9uKTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAgwqBJMDkwMyAxMDowNjoxMy40NDk1NDggMjc4NjcyNCBGcmFtZUJ1ZmZlci5j
cHA6NDg3XSBHcmFwaGljczxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBBZGFw
dGVyIEFuZHJvaWQgRW11bGF0b3IgT3BlbkdMIEVTIFRyYW5zbGF0b3IgKE5WSURJQSBHZUZvcmNl
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoEdUWCAxMDYwIDNHQi88YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgUENJZS9TU0UyKTxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqBJMDkwMyAxMDowNjoxMy40NDk1NTEgMjc4NjcyNCBGcmFtZUJ1
ZmZlci5jcHA6NDg4XTxicj4NCiZndDvCoCDCoCDCoEdyYXBoaWNzIEFQSTxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBWZXJzaW9uIE9wZW5HTCBFUyAzLjAgKE9wZW5HTCBFUyAz
LjIgTlZJRElBIDUzNS4xODMuMDEpPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oEkwOTAzIDEwOjA2OjEzLjQ0OTU1MyAyNzg2NzI0IEZyYW1lQnVmZmVyLmNwcDo0ODldPGJyPg0K
Jmd0O8KgIMKgIMKgR3JhcGhpY3MgQVBJPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoEV4dGVuc2lvbnMgR0xfT0VTX0VHTF9zeW5jIEdMX09FU19FR0xfaW1hZ2U8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgR0xfT0VTX0VHTF9pbWFnZV9leHRlcm5hbCBHPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoExfT0VTX2RlcHRoMjQgR0xfT0VTX2Rl
cHRoMzIgR0xfT0VTX2VsZW1lbnRfaW5kZXhfdWludDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqBHTF9PRVNfdGV4dHVyZV9mbG9hdCBHTF9PRVNfdGV4dHVyZV9mbG9hdF9saW5l
YXI8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgR0xfT0VTX2NvbXByZXNzZWRf
cGFsZXR0ZWRfdGV4dDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqB1cmUgR0xf
T0VTX2NvbXByZXNzZWRfRVRDMV9SR0I4X3RleHR1cmUgR0xfT0VTX2RlcHRoX3RleHR1cmU8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgR0xfT0VTX3RleHR1cmVfaGFsZl9mbG9h
dCBHTF9PRVNfdGV4dHVyZV9oYWxmX2Zsb2F0X2xpbmVhcjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAgwqBHTF9PRVNfcGFja2VkX2Q8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgIMKgIMKgZXB0aF9zdGVuY2lsIEdMX09FU192ZXJ0ZXhfaGFsZl9mbG9hdDxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBHTF9PRVNfc3RhbmRhcmRfZGVyaXZhdGl2ZXMgR0xf
T0VTX3RleHR1cmVfbnBvdDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBHTF9P
RVNfcmdiOF9yZ2JhOCBHTF9PVlJfbXVsdGl2aWV3MiBHTF9FWFRfbXVsdGl2PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoGlld190ZXh0dXJlX211bHRpc2FtcGxlIEdMX0VYVF9j
b2xvcl9idWZmZXJfZmxvYXQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgR0xf
RVhUX2NvbG9yX2J1ZmZlcl9oYWxmX2Zsb2F0IEdMX0VYVF90ZXh0dXJlX2Zvcm1hdF9CR1JBODg4
ODxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBHTF9BUFBMRV90ZXh0dXJlX2Zv
cm1hdDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBfQkdSQTg4ODggR0xfRVhU
X3RleHR1cmVfYnVmZmVyIEdMX09FU190ZXh0dXJlX2J1ZmZlcjxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqBHTF9FWFRfZHJhd19idWZmZXJzX2luZGV4ZWQ8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgSTA5MDMgMTA6MDY6MTMuNDQ5NTU5IDI3ODY3MjQgRnJh
bWVCdWZmZXIuY3BwOjQ5MF0gR3JhcGhpY3M8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
IMKgIMKgRGV2aWNlIEV4dGVuc2lvbnMgTi9BPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCDCoCDCoEdVRVNUX1VCT09UX1ZFUlNJT046IDIwMjQuMDEtZzFlZDhmOGJkZTMzZS1hYjEyMDkx
MjA2IChKdWwgMTA8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgMjAyNCAtIDIz
OjQ3OjM4ICswMDAwKTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBVLUJvb3Qg
MjA8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgc3RhcnRpbmcgUnVzdCBLZXlN
aW50IFRBIGltcGxlbWVudGF0aW9uIGluIGEgdGhyZWFkPGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoHN0YXJ0aW5nIEMrKyBLZXlNaW50IGltcGxlbWVudGF0aW9uIGluIGEgdGhy
ZWFkIHdpdGggRkRzPGJyPg0KJmd0O8KgIMKgIMKgaW49MzEsPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCDCoCDCoG91dD0zMDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqBLZXlNaW50IFJ1c3QgVEEgcnVubmluZyB3aXRoIGluZmlsZT0zNywgb3V0ZmlsZT0zNiw8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgc2VjdXJpdHlfbGV2ZWw9U29mdHdhcmU8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgU2VjdXJlIGRlbGV0aW9uIGRhdGEg
ZmlsZSBmb3VuZC4gUGFyc2luZy48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
MjAyNC0wOS0wM1QwODowNjoxMy42MjYwNzVaIHFlbXUtc3lzdGVtLWFhcmNoNjQ6PGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoHZpcnRpby1zZXJpYWwtYnVzOiBVbmV4cGVjdGVk
IHBvcnQgaWQgMTYgZm9yIGRldmljZTxicj4NCiZndDvCoCDCoCDCoHZpcnRpby1zZXJpYWwuMDxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAyMDI0LTA5LTAzVDA4OjA2OjEzLjYy
NjQxMFogcWVtdS1zeXN0ZW0tYWFyY2g2NDo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
IMKgIMKgdmlydGlvLXNlcmlhbC1idXM6IFVuZXhwZWN0ZWQgcG9ydCBpZCAxNyBmb3IgZGV2aWNl
PGJyPg0KJmd0O8KgIMKgIMKgdmlydGlvLXNlcmlhbC4wPGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoDIwMjQtMDktMDNUMDg6MDY6MTMuNjI2NTk5WiBxZW11LXN5c3RlbS1hYXJj
aDY0Ojxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqB2aXJ0aW8tc2VyaWFsLWJ1
czogVW5leHBlY3RlZCBwb3J0IGlkIDE4IGZvciBkZXZpY2U8YnI+DQomZ3Q7wqAgwqAgwqB2aXJ0
aW8tc2VyaWFsLjA8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgMjAyNC0wOS0w
M1QwODowNjoxMy42MjY3ODhaIHFlbXUtc3lzdGVtLWFhcmNoNjQ6PGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoHZpcnRpby1zZXJpYWwtYnVzOiBVbmV4cGVjdGVkIHBvcnQgaWQg
MTkgZm9yIGRldmljZTxicj4NCiZndDvCoCDCoCDCoHZpcnRpby1zZXJpYWwuMDxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAyMDI0LTA5LTAzVDA4OjA2OjEzLjYyNjk4MFogcWVt
dS1zeXN0ZW0tYWFyY2g2NDo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgdmly
dGlvLXNlcmlhbC1idXM6IFVuZXhwZWN0ZWQgcG9ydCBpZCAyMCBmb3IgZGV2aWNlPGJyPg0KJmd0
O8KgIMKgIMKgdmlydGlvLXNlcmlhbC4wPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoDIwMjQtMDktMDNUMDg6MDY6MTMuNjI3MTcxWiBxZW11LXN5c3RlbS1hYXJjaDY0Ojxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqB2aXJ0aW8tc2VyaWFsLWJ1czogVW5leHBl
Y3RlZCBwb3J0IGlkIDIxIGZvciBkZXZpY2U8YnI+DQomZ3Q7wqAgwqAgwqB2aXJ0aW8tc2VyaWFs
LjA8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgMjAyNC0wOS0wM1QwODowNjox
My42MjczNjBaIHFlbXUtc3lzdGVtLWFhcmNoNjQ6PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoCDCoCDCoHZpcnRpby1zZXJpYWwtYnVzOiBVbmV4cGVjdGVkIHBvcnQgaWQgMjIgZm9yIGRl
dmljZTxicj4NCiZndDvCoCDCoCDCoHZpcnRpby1zZXJpYWwuMDxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqAyMDI0LTA5LTAzVDA4OjA2OjEzLjYyNzU0OVogcWVtdS1zeXN0ZW0t
YWFyY2g2NDo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgdmlydGlvLXNlcmlh
bC1idXM6IFVuZXhwZWN0ZWQgcG9ydCBpZCAyMyBmb3IgZGV2aWNlPGJyPg0KJmd0O8KgIMKgIMKg
dmlydGlvLXNlcmlhbC4wPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoDIwMjQt
MDktMDNUMDg6MDY6MTMuNjI3NzM4WiBxZW11LXN5c3RlbS1hYXJjaDY0Ojxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqB2aXJ0aW8tc2VyaWFsLWJ1czogVW5leHBlY3RlZCBwb3J0
IGlkIDI0IGZvciBkZXZpY2U8YnI+DQomZ3Q7wqAgwqAgwqB2aXJ0aW8tc2VyaWFsLjA8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgMjAyNC0wOS0wM1QwODowNjoxMy42Mjc5MzBa
IHFlbXUtc3lzdGVtLWFhcmNoNjQ6PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oHZpcnRpby1zZXJpYWwtYnVzOiBVbmV4cGVjdGVkIHBvcnQgaWQgMjUgZm9yIGRldmljZTxicj4N
CiZndDvCoCDCoCDCoHZpcnRpby1zZXJpYWwuMDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAgwqAgwqAyMDI0LTA5LTAzVDA4OjA2OjEzLjYyODExOVogcWVtdS1zeXN0ZW0tYWFyY2g2NDo8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgdmlydGlvLXNlcmlhbC1idXM6IFVu
ZXhwZWN0ZWQgcG9ydCBpZCAyNiBmb3IgZGV2aWNlPGJyPg0KJmd0O8KgIMKgIMKgdmlydGlvLXNl
cmlhbC4wPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoDIwMjQtMDktMDNUMDg6
MDY6MTMuNjI4MzA3WiBxZW11LXN5c3RlbS1hYXJjaDY0Ojxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAgwqB2aXJ0aW8tc2VyaWFsLWJ1czogVW5leHBlY3RlZCBwb3J0IGlkIDI3IGZv
ciBkZXZpY2U8YnI+DQomZ3Q7wqAgwqAgwqB2aXJ0aW8tc2VyaWFsLjA8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgMjAyNC0wOS0wM1QwODowNjoxMy42Mjg0OTZaIHFlbXUtc3lz
dGVtLWFhcmNoNjQ6PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoHZpcnRpby1z
ZXJpYWwtYnVzOiBVbmV4cGVjdGVkIHBvcnQgaWQgMjggZm9yIGRldmljZTxicj4NCiZndDvCoCDC
oCDCoHZpcnRpby1zZXJpYWwuMDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAy
MDI0LTA5LTAzVDA4OjA2OjEzLjYyODY4M1ogcWVtdS1zeXN0ZW0tYWFyY2g2NDo8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgdmlydGlvLXNlcmlhbC1idXM6IFVuZXhwZWN0ZWQg
cG9ydCBpZCAyOSBmb3IgZGV2aWNlPGJyPg0KJmd0O8KgIMKgIMKgdmlydGlvLXNlcmlhbC4wPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoDIwMjQtMDktMDNUMDg6MDY6MTMuNjI4
ODc0WiBxZW11LXN5c3RlbS1hYXJjaDY0Ojxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqB2aXJ0aW8tc2VyaWFsLWJ1czogVW5leHBlY3RlZCBwb3J0IGlkIDMwIGZvciBkZXZpY2U8
YnI+DQomZ3Q7wqAgwqAgwqB2aXJ0aW8tc2VyaWFsLjA8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0Ozxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBHVUVTVF9LRVJORUxfVkVSU0lPTjo8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgNi42LjQ2LWFuZHJvaWQxNS04LWcz
NTY5YjA1MzUxN2MtYWIxMjI5MDg1Ni00azxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAoa2xlYWZAYnVpbGQtaG9zdCkgKEFuZHJvaWQgKDExMzY4MzA4LCArcGdvLCArYm9sdCwg
K2x0byw8YnI+DQomZ3Q7wqAgwqAgwqArbWxnbyw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgIMKgIMKgYmFzZWQgb24gcjUxMDkyOCkgY2xhbmcgdmVyc2lvbiAxOC4wLjA8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgKDxhIGhyZWY9Imh0dHBzOi8vYW5kcm9pZC5nb29n
bGVzb3VyY2UuY29tL3Rvb2xjaGFpbi9sbHZtLXByb2plY3QiIHJlbD0ibm9yZWZlcnJlciIgdGFy
Z2V0PSJfYmxhbmsiPmh0dHBzOi8vYW5kcm9pZC5nb29nbGVzb3VyY2UuY29tL3Rvb2xjaGFpbi9s
bHZtLXByb2plY3Q8L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHBzOi8vYW5k
cm9pZC5nb29nbGVzb3VyY2UuY29tL3Rvb2xjaGFpbi9sbHZtLXByb2plY3QiIHJlbD0ibm9yZWZl
cnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vYW5kcm9pZC5nb29nbGVzb3VyY2UuY29tL3Rv
b2xjaGFpbi9sbHZtLXByb2plY3Q8L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cHM6Ly9hbmRyb2lkLmdvb2dsZXNvdXJjZS5jb20vdG9v
bGNoYWluL2xsdm0tcHJvamVjdCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0
cHM6Ly9hbmRyb2lkLmdvb2dsZXNvdXJjZS5jb20vdG9vbGNoYWluL2xsdm0tcHJvamVjdDwvYT48
YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cHM6Ly9hbmRyb2lkLmdvb2dsZXNvdXJj
ZS5jb20vdG9vbGNoYWluL2xsdm0tcHJvamVjdCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9i
bGFuayI+aHR0cHM6Ly9hbmRyb2lkLmdvb2dsZXNvdXJjZS5jb20vdG9vbGNoYWluL2xsdm0tcHJv
amVjdDwvYT4mZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqA0Nzc2
MTBkNGQwZDk4OGU2OWRiYzNmYWU0ZmU4NmJmZjNmMDdmMmI1KSwgTExEIDE4LjAuMCkgIzEgU01Q
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoFBSRUVNUFQgV2VkIEF1ZyAyOCAy
MTo0MzozMyBVVEMgMjAyNDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBdIExp
bnV4IHZlcnNpb248YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgdHJhbnNwb3J0
IG1lc3NhZ2UgZmFpbGVkLCByZXNwb25zZSBib2R5OiBkZXZpY2U8YnI+DQomZ3Q7wqAgwqAgwqAm
IzM5OzxhIGhyZWY9Imh0dHA6Ly8wLjAuMC4wOjY1MjAiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0
PSJfYmxhbmsiPjAuMC4wLjA6NjUyMDwvYT4gJmx0OzxhIGhyZWY9Imh0dHA6Ly8wLjAuMC4wOjY1
MjAiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly8wLjAuMC4wOjY1MjA8
L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0i
aHR0cDovLzAuMC4wLjA6NjUyMCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0
cDovLzAuMC4wLjA6NjUyMDwvYT4gJmx0OzxhIGhyZWY9Imh0dHA6Ly8wLjAuMC4wOjY1MjAiIHJl
bD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly8wLjAuMC4wOjY1MjA8L2E+Jmd0
OyZndDsmIzM5OyBub3QgZm91bmQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
dHJhbnNwb3J0IG1lc3NhZ2UgZmFpbGVkLCByZXNwb25zZSBib2R5OiBkZXZpY2U8YnI+DQomZ3Q7
wqAgwqAgwqAmIzM5OzxhIGhyZWY9Imh0dHA6Ly8wLjAuMC4wOjY1MjAiIHJlbD0ibm9yZWZlcnJl
ciIgdGFyZ2V0PSJfYmxhbmsiPjAuMC4wLjA6NjUyMDwvYT4gJmx0OzxhIGhyZWY9Imh0dHA6Ly8w
LjAuMC4wOjY1MjAiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly8wLjAu
MC4wOjY1MjA8L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAmbHQ7
PGEgaHJlZj0iaHR0cDovLzAuMC4wLjA6NjUyMCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9i
bGFuayI+aHR0cDovLzAuMC4wLjA6NjUyMDwvYT4gJmx0OzxhIGhyZWY9Imh0dHA6Ly8wLjAuMC4w
OjY1MjAiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly8wLjAuMC4wOjY1
MjA8L2E+Jmd0OyZndDsmIzM5OyBub3QgZm91bmQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgIMKgIMKgdHJhbnNwb3J0IG1lc3NhZ2UgZmFpbGVkLCByZXNwb25zZSBib2R5OiBkZXZpY2U8
YnI+DQomZ3Q7wqAgwqAgwqAmIzM5OzxhIGhyZWY9Imh0dHA6Ly8wLjAuMC4wOjY1MjAiIHJlbD0i
bm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPjAuMC4wLjA6NjUyMDwvYT4gJmx0OzxhIGhyZWY9
Imh0dHA6Ly8wLjAuMC4wOjY1MjAiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0
dHA6Ly8wLjAuMC4wOjY1MjA8L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovLzAuMC4wLjA6NjUyMCIgcmVsPSJub3JlZmVycmVyIiB0
YXJnZXQ9Il9ibGFuayI+aHR0cDovLzAuMC4wLjA6NjUyMDwvYT4gJmx0OzxhIGhyZWY9Imh0dHA6
Ly8wLjAuMC4wOjY1MjAiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly8w
LjAuMC4wOjY1MjA8L2E+Jmd0OyZndDsmIzM5OyBub3QgZm91bmQ8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgdHJhbnNwb3J0IG1lc3NhZ2UgZmFpbGVkLCByZXNwb25zZSBib2R5
OiBkZXZpY2U8YnI+DQomZ3Q7wqAgwqAgwqAmIzM5OzxhIGhyZWY9Imh0dHA6Ly8wLjAuMC4wOjY1
MjAiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPjAuMC4wLjA6NjUyMDwvYT4gJmx0
OzxhIGhyZWY9Imh0dHA6Ly8wLjAuMC4wOjY1MjAiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJf
YmxhbmsiPmh0dHA6Ly8wLjAuMC4wOjY1MjA8L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovLzAuMC4wLjA6NjUyMCIgcmVsPSJub3Jl
ZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovLzAuMC4wLjA6NjUyMDwvYT4gJmx0OzxhIGhy
ZWY9Imh0dHA6Ly8wLjAuMC4wOjY1MjAiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsi
Pmh0dHA6Ly8wLjAuMC4wOjY1MjA8L2E+Jmd0OyZndDsmIzM5OyBub3QgZm91bmQ8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgR1VFU1RfQlVJTERfRklOR0VSUFJJTlQ6PGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDCoGdlbmVyaWMv
YW9zcF9jZl9hcm02NF9vbmx5X3Bob25lL3Zzb2NfYXJtNjRfb25seTpWYW5pbGxhSWNlQ3JlYW0v
TUFJTi4xYzAxOWIwYy8xMjMwOTI5Njp1c2VyZGVidWcvdGVzdC1rZXlzPGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoHRyYW5zcG9ydCBtZXNzYWdlIGZhaWxlZCwgcmVzcG9uc2Ug
Ym9keTogZGV2aWNlPGJyPg0KJmd0O8KgIMKgIMKgJiMzOTs8YSBocmVmPSJodHRwOi8vMC4wLjAu
MDo2NTIwIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj4wLjAuMC4wOjY1MjA8L2E+
ICZsdDs8YSBocmVmPSJodHRwOi8vMC4wLjAuMDo2NTIwIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdl
dD0iX2JsYW5rIj5odHRwOi8vMC4wLjAuMDo2NTIwPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly8wLjAuMC4wOjY1MjAiIHJlbD0i
bm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly8wLjAuMC4wOjY1MjA8L2E+ICZsdDs8
YSBocmVmPSJodHRwOi8vMC4wLjAuMDo2NTIwIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2Js
YW5rIj5odHRwOi8vMC4wLjAuMDo2NTIwPC9hPiZndDsmZ3Q7JiMzOTsgbm90IGZvdW5kPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoHRyYW5zcG9ydCBtZXNzYWdlIGZhaWxlZCwg
cmVzcG9uc2UgYm9keTogZGV2aWNlPGJyPg0KJmd0O8KgIMKgIMKgJiMzOTs8YSBocmVmPSJodHRw
Oi8vMC4wLjAuMDo2NTIwIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj4wLjAuMC4w
OjY1MjA8L2E+ICZsdDs8YSBocmVmPSJodHRwOi8vMC4wLjAuMDo2NTIwIiByZWw9Im5vcmVmZXJy
ZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vMC4wLjAuMDo2NTIwPC9hPiZndDs8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly8wLjAuMC4wOjY1
MjAiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly8wLjAuMC4wOjY1MjA8
L2E+ICZsdDs8YSBocmVmPSJodHRwOi8vMC4wLjAuMDo2NTIwIiByZWw9Im5vcmVmZXJyZXIiIHRh
cmdldD0iX2JsYW5rIj5odHRwOi8vMC4wLjAuMDo2NTIwPC9hPiZndDsmZ3Q7JiMzOTsgbm90IGZv
dW5kPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoHRyYW5zcG9ydCBtZXNzYWdl
IGZhaWxlZCwgcmVzcG9uc2UgYm9keTogZGV2aWNlPGJyPg0KJmd0O8KgIMKgIMKgJiMzOTs8YSBo
cmVmPSJodHRwOi8vMC4wLjAuMDo2NTIwIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5r
Ij4wLjAuMC4wOjY1MjA8L2E+ICZsdDs8YSBocmVmPSJodHRwOi8vMC4wLjAuMDo2NTIwIiByZWw9
Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vMC4wLjAuMDo2NTIwPC9hPiZndDs8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly8w
LjAuMC4wOjY1MjAiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly8wLjAu
MC4wOjY1MjA8L2E+ICZsdDs8YSBocmVmPSJodHRwOi8vMC4wLjAuMDo2NTIwIiByZWw9Im5vcmVm
ZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vMC4wLjAuMDo2NTIwPC9hPiZndDsmZ3Q7JiMz
OTsgbm90IGZvdW5kPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoHRyYW5zcG9y
dCBtZXNzYWdlIGZhaWxlZCwgcmVzcG9uc2UgYm9keTogZGV2aWNlPGJyPg0KJmd0O8KgIMKgIMKg
JiMzOTs8YSBocmVmPSJodHRwOi8vMC4wLjAuMDo2NTIwIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdl
dD0iX2JsYW5rIj4wLjAuMC4wOjY1MjA8L2E+ICZsdDs8YSBocmVmPSJodHRwOi8vMC4wLjAuMDo2
NTIwIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vMC4wLjAuMDo2NTIw
PC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgJmx0OzxhIGhyZWY9
Imh0dHA6Ly8wLjAuMC4wOjY1MjAiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0
dHA6Ly8wLjAuMC4wOjY1MjA8L2E+ICZsdDs8YSBocmVmPSJodHRwOi8vMC4wLjAuMDo2NTIwIiBy
ZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vMC4wLjAuMDo2NTIwPC9hPiZn
dDsmZ3Q7JiMzOTsgbm90IGZvdW5kPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oHRyYW5zcG9ydCBtZXNzYWdlIGZhaWxlZCwgcmVzcG9uc2UgYm9keTogZGV2aWNlPGJyPg0KJmd0
O8KgIMKgIMKgJiMzOTs8YSBocmVmPSJodHRwOi8vMC4wLjAuMDo2NTIwIiByZWw9Im5vcmVmZXJy
ZXIiIHRhcmdldD0iX2JsYW5rIj4wLjAuMC4wOjY1MjA8L2E+ICZsdDs8YSBocmVmPSJodHRwOi8v
MC4wLjAuMDo2NTIwIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vMC4w
LjAuMDo2NTIwPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgJmx0
OzxhIGhyZWY9Imh0dHA6Ly8wLjAuMC4wOjY1MjAiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJf
YmxhbmsiPmh0dHA6Ly8wLjAuMC4wOjY1MjA8L2E+ICZsdDs8YSBocmVmPSJodHRwOi8vMC4wLjAu
MDo2NTIwIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vMC4wLjAuMDo2
NTIwPC9hPiZndDsmZ3Q7JiMzOTsgbm90IGZvdW5kPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoCDCoCDCoHRyYW5zcG9ydCBtZXNzYWdlIGZhaWxlZCwgcmVzcG9uc2UgYm9keTogZGV2aWNl
PGJyPg0KJmd0O8KgIMKgIMKgJiMzOTs8YSBocmVmPSJodHRwOi8vMC4wLjAuMDo2NTIwIiByZWw9
Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj4wLjAuMC4wOjY1MjA8L2E+ICZsdDs8YSBocmVm
PSJodHRwOi8vMC4wLjAuMDo2NTIwIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5o
dHRwOi8vMC4wLjAuMDo2NTIwPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
IMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly8wLjAuMC4wOjY1MjAiIHJlbD0ibm9yZWZlcnJlciIg
dGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly8wLjAuMC4wOjY1MjA8L2E+ICZsdDs8YSBocmVmPSJodHRw
Oi8vMC4wLjAuMDo2NTIwIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8v
MC4wLjAuMDo2NTIwPC9hPiZndDsmZ3Q7JiMzOTsgbm90IGZvdW5kPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoHRyYW5zcG9ydCBtZXNzYWdlIGZhaWxlZCwgcmVzcG9uc2UgYm9k
eTogZGV2aWNlPGJyPg0KJmd0O8KgIMKgIMKgJiMzOTs8YSBocmVmPSJodHRwOi8vMC4wLjAuMDo2
NTIwIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj4wLjAuMC4wOjY1MjA8L2E+ICZs
dDs8YSBocmVmPSJodHRwOi8vMC4wLjAuMDo2NTIwIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0i
X2JsYW5rIj5odHRwOi8vMC4wLjAuMDo2NTIwPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly8wLjAuMC4wOjY1MjAiIHJlbD0ibm9y
ZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly8wLjAuMC4wOjY1MjA8L2E+ICZsdDs8YSBo
cmVmPSJodHRwOi8vMC4wLjAuMDo2NTIwIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5r
Ij5odHRwOi8vMC4wLjAuMDo2NTIwPC9hPiZndDsmZ3Q7JiMzOTsgbm90IGZvdW5kPGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoHRyYW5zcG9ydCBtZXNzYWdlIGZhaWxlZCwgcmVz
cG9uc2UgYm9keTogZGV2aWNlPGJyPg0KJmd0O8KgIMKgIMKgJiMzOTs8YSBocmVmPSJodHRwOi8v
MC4wLjAuMDo2NTIwIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj4wLjAuMC4wOjY1
MjA8L2E+ICZsdDs8YSBocmVmPSJodHRwOi8vMC4wLjAuMDo2NTIwIiByZWw9Im5vcmVmZXJyZXIi
IHRhcmdldD0iX2JsYW5rIj5odHRwOi8vMC4wLjAuMDo2NTIwPC9hPiZndDs8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly8wLjAuMC4wOjY1MjAi
IHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly8wLjAuMC4wOjY1MjA8L2E+
ICZsdDs8YSBocmVmPSJodHRwOi8vMC4wLjAuMDo2NTIwIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdl
dD0iX2JsYW5rIj5odHRwOi8vMC4wLjAuMDo2NTIwPC9hPiZndDsmZ3Q7JiMzOTsgbm90IGZvdW5k
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoGluaXQ6IHN0YXJ0aW5nIHNlcnZp
Y2UgJiMzOTthZGJkJiMzOTsuLi48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
cHJveHlfZmFzdGJvb3RdIFN0b3AgZXZlbnQgKDExKSByZWNlaXZlZC4gU3RvcHBpbmcgcHJveHk8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgcHJveHlfYWRiXSBTdGFydCBldmVu
dCAoNSkgcmVjZWl2ZWQuIFN0YXJ0aW5nIHByb3h5PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoCDCoCDCoHByb3h5X2FkYl0gRnJvbTogdGNwOiA2NTIwPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCDCoCDCoHByb3h5X2FkYl0gVG86IHZzb2NrOiAzOjU1NTUgdmhvc3RfdXNlcjog
ZmFsc2U8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgdHJhbnNwb3J0IG1lc3Nh
Z2UgZmFpbGVkLCByZXNwb25zZSBib2R5OiBkZXZpY2U8YnI+DQomZ3Q7wqAgwqAgwqAmIzM5Ozxh
IGhyZWY9Imh0dHA6Ly8wLjAuMC4wOjY1MjAiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxh
bmsiPjAuMC4wLjA6NjUyMDwvYT4gJmx0OzxhIGhyZWY9Imh0dHA6Ly8wLjAuMC4wOjY1MjAiIHJl
bD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly8wLjAuMC4wOjY1MjA8L2E+Jmd0
Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDov
LzAuMC4wLjA6NjUyMCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovLzAu
MC4wLjA6NjUyMDwvYT4gJmx0OzxhIGhyZWY9Imh0dHA6Ly8wLjAuMC4wOjY1MjAiIHJlbD0ibm9y
ZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly8wLjAuMC4wOjY1MjA8L2E+Jmd0OyZndDsm
IzM5OyBub3QgZm91bmQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgSTA5MDMg
MTA6MDk6MzAuODE2MTA4IDI3ODczMTQgSW50ZWxEcm1EZWNvZGVyLmNwcDozOF08YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgSW50ZWxEcm1EZWNvZGVyIGNyZWF0ZWQgZm9yIGNv
bnRleHQgMjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBJMDkwMyAxMDowOToz
Mi43NjQ4MjAgMjc4NzMxNiBJbnRlbERybURlY29kZXIuY3BwOjM4XTxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqBJbnRlbERybURlY29kZXIgY3JlYXRlZCBmb3IgY29udGV4dCA3
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoFZJUlRVQUxfREVWSUNFX0RJU1BM
QVlfUE9XRVJfTU9ERV9DSEFOR0VEPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oFZJUlRVQUxfREVWSUNFX0RJU1BMQVlfUE9XRVJfTU9ERV9DSEFOR0VEPGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoEkwOTAzIDEwOjEwOjIwLjkxODAxNCAyNzg3MzU5IEludGVs
RHJtRGVjb2Rlci5jcHA6MzhdPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoElu
dGVsRHJtRGVjb2RlciBjcmVhdGVkIGZvciBjb250ZXh0IDExPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgSSBzZWUgYSBsb3Qgb2YgZXJy
b3JzLGJ1dCBpdCBzZWVtcyBjb25uZWN0ZWQgOjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoHppb21hcmlvQFozOTAtQU9SVVMtUFJPLURF
U1Q6fi9TY3JpdmFuaWEkIGFkYiBkZXZpY2VzPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCDCoCDCoExpc3Qgb2YgZGV2aWNlcyBhdHRhY2hlZDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IDxh
IGhyZWY9Imh0dHA6Ly8wLjAuMC4wOjY1MjAiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxh
bmsiPjAuMC4wLjA6NjUyMDwvYT4gJmx0OzxhIGhyZWY9Imh0dHA6Ly8wLjAuMC4wOjY1MjAiIHJl
bD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly8wLjAuMC4wOjY1MjA8L2E+Jmd0
OyAmbHQ7PGEgaHJlZj0iaHR0cDovLzAuMC4wLjA6NjUyMCIgcmVsPSJub3JlZmVycmVyIiB0YXJn
ZXQ9Il9ibGFuayI+aHR0cDovLzAuMC4wLjA6NjUyMDwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7
PGEgaHJlZj0iaHR0cDovLzAuMC4wLjA6NjUyMCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9i
bGFuayI+aHR0cDovLzAuMC4wLjA6NjUyMDwvYT4mZ3Q7Jmd0OyDCoMKgwqBkZXZpY2U8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBidXQg
c2NyY3B5IGRpZG4mIzM5O3Qgd29yayA6PGJyPg0KJmd0O8KgIMKgIMKgICZndDs8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgemlvbWFyaW9AWjM5MC1BT1JVUy1QUk8tREVTVDp+
L1Njcml2YW5pYSQgc2NyY3B5PGJyPg0KJmd0O8KgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgc2NyY3B5IDIuNi4xICZsdDs8YSBocmVmPSJodHRwczovL2dp
dGh1Yi5jb20vR2VueW1vYmlsZS9zY3JjcHkiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxh
bmsiPmh0dHBzOi8vZ2l0aHViLmNvbS9HZW55bW9iaWxlL3NjcmNweTwvYT48YnI+DQomZ3Q7wqAg
wqAgwqAmbHQ7PGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL0dlbnltb2JpbGUvc2NyY3B5IiBy
ZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2dpdGh1Yi5jb20vR2VueW1v
YmlsZS9zY3JjcHk8L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAm
bHQ7PGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL0dlbnltb2JpbGUvc2NyY3B5IiByZWw9Im5v
cmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2dpdGh1Yi5jb20vR2VueW1vYmlsZS9z
Y3JjcHk8L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNv
bS9HZW55bW9iaWxlL3NjcmNweSIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0
cHM6Ly9naXRodWIuY29tL0dlbnltb2JpbGUvc2NyY3B5PC9hPiZndDsmZ3Q7Jmd0Ozxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBJTkZPOiBBREIgZGV2aWNlIGZvdW5kOjxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBJTkZPOiDCoMKgwqDCoC0tJmd0OyAodGNw
aXApIDxhIGhyZWY9Imh0dHA6Ly8wLjAuMC4wOjY1MjAiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0
PSJfYmxhbmsiPjAuMC4wLjA6NjUyMDwvYT4gJmx0OzxhIGhyZWY9Imh0dHA6Ly8wLjAuMC4wOjY1
MjAiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly8wLjAuMC4wOjY1MjA8
L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vMC4wLjAuMDo2NTIw
IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vMC4wLjAuMDo2NTIwPC9h
PiAmbHQ7PGEgaHJlZj0iaHR0cDovLzAuMC4wLjA6NjUyMCIgcmVsPSJub3JlZmVycmVyIiB0YXJn
ZXQ9Il9ibGFuayI+aHR0cDovLzAuMC4wLjA6NjUyMDwvYT4mZ3Q7Jmd0Ozxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBkZXZpY2U8YnI+DQomZ3Q7wqAgwqAgwqAgwqBDdXR0bGVmaXNoX2FybTY0X3Bob25lXzY0
X2JpdF9vbmx5PGJyPg0KJmd0O8KgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgL3Vzci9sb2NhbC9zaGFyZS9zY3JjcHkvc2NyY3B5LXNlcnZlcjogMSBmaWxl
IHB1c2hlZCwgMDxicj4NCiZndDvCoCDCoCDCoHNraXBwZWQuPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCDCoCDCoDkwLjAgTUIvcyAoNzExMTIgYnl0ZXMgaW4gMC4wMDFzKTxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBbc2VydmVyXSBJTkZPOiBEZXZpY2U6IFtHb29n
bGVdIGdlbmVyaWMgQ3V0dGxlZmlzaCBhcm02NDxicj4NCiZndDvCoCDCoCDCoHBob25lPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoDY0LWJpdCBvbmx5IChBbmRyb2lkIDE0KTxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBbc2VydmVyXSBFUlJPUjogQ291bGQg
bm90IHJlZ2lzdGVyIHJvdGF0aW9uIHdhdGNoZXI8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgIMKgIMKgamF2YS5sYW5nLk51bGxQb2ludGVyRXhjZXB0aW9uOiBBdHRlbXB0IHRvIGludm9r
ZSB2aXJ0dWFsPGJyPg0KJmd0O8KgIMKgIMKgbWV0aG9kPGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCYjMzk7amF2YS5sYW5nLkNsYXNzIGphdmEubGFuZy5PYmplY3QuZ2V0Q2xh
c3MoKSYjMzk7IG9uIGEgbnVsbDxicj4NCiZndDvCoCDCoCDCoG9iamVjdDxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqByZWZlcmVuY2U8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0Ozxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqDCoMKgwqDCoMKgIGF0PGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDCoGNvbS5nZW55
bW9iaWxlLnNjcmNweS53cmFwcGVycy5XaW5kb3dNYW5hZ2VyLnJlZ2lzdGVyUm90YXRpb25XYXRj
aGVyKFdpbmRvd01hbmFnZXIuamF2YToxODUpPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCDCoCDCoCDCoMKgwqDCoMKgwqDCoGF0PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoGNvbS5nZW55bW9iaWxlLnNjcmNweS5kZXZpY2UuRGV2aWNlLiZsdDtpbml0Jmd0OyhEZXZp
Y2UuamF2YTo5Myk8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgwqDCoMKg
wqDCoMKgYXQ8YnI+DQomZ3Q7wqAgwqAgwqBjb20uZ2VueW1vYmlsZS5zY3JjcHkuU2VydmVyLnNj
cmNweShTZXJ2ZXIuamF2YToxNDUpPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoMKgwqDCoMKgwqDCoGF0PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoGNv
bS5nZW55bW9iaWxlLnNjcmNweS5TZXJ2ZXIuaW50ZXJuYWxNYWluKFNlcnZlci5qYXZhOjI5MCk8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgwqDCoMKgwqDCoMKgYXQgY29t
Lmdlbnltb2JpbGUuc2NyY3B5LlNlcnZlci5tYWluKFNlcnZlci5qYXZhOjI0NSk8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgwqDCoMKgwqDCoMKgYXQ8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKgY29tLmFuZHJvaWQuaW50
ZXJuYWwub3MuUnVudGltZUluaXQubmF0aXZlRmluaXNoSW5pdChOYXRpdmUgTWV0aG9kKTxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqDCoMKgwqDCoMKgwqBhdDxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqBjb20uYW5kcm9p
ZC5pbnRlcm5hbC5vcy5SdW50aW1lSW5pdC5tYWluKFJ1bnRpbWVJbml0LmphdmE6MzY5KTxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoFtz
ZXJ2ZXJdIEVSUk9SOiBDb3VsZCBub3QgcmVnaXN0ZXIgZGlzcGxheSBmb2xkIGxpc3RlbmVyPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
amF2YS5sYW5nLk51bGxQb2ludGVyRXhjZXB0aW9uOiBBdHRlbXB0IHRvIGludm9rZSB2aXJ0dWFs
PGJyPg0KJmd0O8KgIMKgIMKgbWV0aG9kPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCYjMzk7amF2YS5sYW5nLkNsYXNzIGphdmEubGFuZy5PYmplY3QuZ2V0Q2xhc3MoKSYjMzk7
IG9uIGEgbnVsbDxicj4NCiZndDvCoCDCoCDCoG9iamVjdDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAgwqByZWZlcmVuY2U8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0Ozxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqDCoMKgwqDCoMKgIGF0PGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDCoGNvbS5nZW55bW9iaWxlLnNj
cmNweS53cmFwcGVycy5XaW5kb3dNYW5hZ2VyLnJlZ2lzdGVyRGlzcGxheUZvbGRMaXN0ZW5lcihX
aW5kb3dNYW5hZ2VyLmphdmE6MjA2KTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqDCoMKgwqDCoMKgwqBhdDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBj
b20uZ2VueW1vYmlsZS5zY3JjcHkuZGV2aWNlLkRldmljZS4mbHQ7aW5pdCZndDsoRGV2aWNlLmph
dmE6MTA4KTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqDCoMKgwqDCoMKg
wqBhdDxicj4NCiZndDvCoCDCoCDCoGNvbS5nZW55bW9iaWxlLnNjcmNweS5TZXJ2ZXIuc2NyY3B5
KFNlcnZlci5qYXZhOjE0NSk8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
wqDCoMKgwqDCoMKgYXQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgY29tLmdl
bnltb2JpbGUuc2NyY3B5LlNlcnZlci5pbnRlcm5hbE1haW4oU2VydmVyLmphdmE6MjkwKTxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqDCoMKgwqDCoMKgwqBhdCBjb20uZ2Vu
eW1vYmlsZS5zY3JjcHkuU2VydmVyLm1haW4oU2VydmVyLmphdmE6MjQ1KTxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqDCoMKgwqDCoMKgwqBhdDxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqBjb20uYW5kcm9pZC5pbnRlcm5h
bC5vcy5SdW50aW1lSW5pdC5uYXRpdmVGaW5pc2hJbml0KE5hdGl2ZSBNZXRob2QpPGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoMKgwqDCoMKgwqDCoGF0PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDCoGNvbS5hbmRyb2lkLmlu
dGVybmFsLm9zLlJ1bnRpbWVJbml0Lm1haW4oUnVudGltZUluaXQuamF2YTozNjkpPGJyPg0KJmd0
O8KgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgW3NlcnZl
cl0gV0FSTjogTm8gY2xpcGJvYXJkIG1hbmFnZXIsIGNvcHktcGFzdGUgYmV0d2Vlbjxicj4NCiZn
dDvCoCDCoCDCoGRldmljZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBhbmQg
Y29tcHV0ZXIgd2lsbCBub3Qgd29yazxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqBbc2VydmVyXSBFUlJPUjogQXR0ZW1wdCB0byBpbnZva2UgdmlydHVhbCBtZXRob2Q8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgJiMzOTthbmRyb2lkLnZpZXcuSW5wdXREZXZp
Y2U8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKg
YW5kcm9pZC5oYXJkd2FyZS5pbnB1dC5JbnB1dE1hbmFnZXJHbG9iYWwuZ2V0SW5wdXREZXZpY2Uo
aW50KSYjMzk7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoG9uIGEgbnVsbCBv
YmplY3QgcmVmZXJlbmNlPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoGphdmEu
bGFuZy5OdWxsUG9pbnRlckV4Y2VwdGlvbjogQXR0ZW1wdCB0byBpbnZva2UgdmlydHVhbDxicj4N
CiZndDvCoCDCoCDCoG1ldGhvZDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAm
IzM5O2FuZHJvaWQudmlldy5JbnB1dERldmljZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqBhbmRyb2lkLmhhcmR3YXJlLmlucHV0LklucHV0TWFu
YWdlckdsb2JhbC5nZXRJbnB1dERldmljZShpbnQpJiMzOTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgb24gYSBudWxsIG9iamVjdCByZWZlcmVuY2U8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgwqDCoMKgwqDCoMKgYXQ8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgYW5kcm9pZC52aWV3LktleUNoYXJhY3Rlck1hcC5sb2FkKEtleUNo
YXJhY3Rlck1hcC5qYXZhOjM2NCk8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgwqDCoMKgwqDCoMKgYXQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgY29tLmdlbnltb2JpbGUuc2NyY3B5LmNvbnRyb2wuQ29udHJvbGxlci4m
bHQ7aW5pdCZndDsoQ29udHJvbGxlci5qYXZhOjQ1KTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqDCoMKgwqDCoMKgwqBhdDxicj4NCiZndDvCoCDCoCDCoGNvbS5nZW55bW9i
aWxlLnNjcmNweS5TZXJ2ZXIuc2NyY3B5KFNlcnZlci5qYXZhOjE1OSk8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgwqDCoMKgwqDCoMKgYXQ8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgY29tLmdlbnltb2JpbGUuc2NyY3B5LlNlcnZlci5pbnRlcm5hbE1h
aW4oU2VydmVyLmphdmE6MjkwKTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqDCoMKgwqDCoMKgwqBhdCBjb20uZ2VueW1vYmlsZS5zY3JjcHkuU2VydmVyLm1haW4oU2VydmVy
LmphdmE6MjQ1KTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqDCoMKgwqDC
oMKgwqBhdDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqA8YnI+DQomZ3Q7wqAgwqAg
wqAgwqBjb20uYW5kcm9pZC5pbnRlcm5hbC5vcy5SdW50aW1lSW5pdC5uYXRpdmVGaW5pc2hJbml0
KE5hdGl2ZSBNZXRob2QpPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoMKg
wqDCoMKgwqDCoGF0PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoDxicj4NCiZndDvC
oCDCoCDCoCDCoGNvbS5hbmRyb2lkLmludGVybmFsLm9zLlJ1bnRpbWVJbml0Lm1haW4oUnVudGlt
ZUluaXQuamF2YTozNjkpPGJyPg0KJmd0O8KgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgSU5GTzogUmVuZGVyZXI6IG9wZW5nbDxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqBJTkZPOiBPcGVuR0wgdmVyc2lvbjogNC42LjAgTlZJRElBIDUz
NS4xODMuMDE8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgSU5GTzogVHJpbGlu
ZWFyIGZpbHRlcmluZyBlbmFibGVkPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oFdBUk46IERldmljZSBkaXNjb25uZWN0ZWQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
IMKgIMKgRVJST1I6IERlbXV4ZXIgJiMzOTt2aWRlbyYjMzk7OiBzdHJlYW0gZGlzYWJsZWQgZHVl
IHRvIGNvbm5lY3Rpb248YnI+DQomZ3Q7wqAgwqAgwqBlcnJvcjxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqBFUlJPUjogRGVtdXhlciAmIzM5O2F1ZGlvJiMzOTs6IHN0cmVhbSBk
aXNhYmxlZCBkdWUgdG8gY29ubmVjdGlvbjxicj4NCiZndDvCoCDCoCDCoGVycm9yPGJyPg0KJmd0
O8KgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgRXZlbiBp
ZiB0aGUgcGhvbmUgaXMgc3RpbGwgdXAgOjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoHppb21hcmlvQFozOTAtQU9SVVMtUFJPLURFU1Q6
fi9TY3JpdmFuaWEkIGFkYiBkZXZpY2VzPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoExpc3Qgb2YgZGV2aWNlcyBhdHRhY2hlZDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IDxhIGhy
ZWY9Imh0dHA6Ly8wLjAuMC4wOjY1MjAiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsi
PjAuMC4wLjA6NjUyMDwvYT4gJmx0OzxhIGhyZWY9Imh0dHA6Ly8wLjAuMC4wOjY1MjAiIHJlbD0i
bm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly8wLjAuMC4wOjY1MjA8L2E+Jmd0OyAm
bHQ7PGEgaHJlZj0iaHR0cDovLzAuMC4wLjA6NjUyMCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9
Il9ibGFuayI+aHR0cDovLzAuMC4wLjA6NjUyMDwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEg
aHJlZj0iaHR0cDovLzAuMC4wLjA6NjUyMCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFu
ayI+aHR0cDovLzAuMC4wLjA6NjUyMDwvYT4mZ3Q7Jmd0OyDCoMKgwqBkZXZpY2U8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBPbiBUdWUs
IFNlcCAzLCAyMDI0IGF0IDE6MDPigK9BTSBQaWVycmljayBCb3V2aWVyPGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCZsdDs8YSBocmVmPSJtYWlsdG86cGllcnJpY2suYm91dmll
ckBsaW5hcm8ub3JnIiB0YXJnZXQ9Il9ibGFuayI+cGllcnJpY2suYm91dmllckBsaW5hcm8ub3Jn
PC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnBpZXJyaWNr
LmJvdXZpZXJAbGluYXJvLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnBpZXJyaWNrLmJvdXZpZXJAbGlu
YXJvLm9yZzwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCZsdDtt
YWlsdG86PGEgaHJlZj0ibWFpbHRvOnBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZyIgdGFyZ2V0
PSJfYmxhbmsiPnBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZzwvYT48YnI+DQomZ3Q7wqAgwqAg
wqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpwaWVycmljay5ib3V2aWVyQGxpbmFyby5vcmci
IHRhcmdldD0iX2JsYW5rIj5waWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc8L2E+Jmd0OyZndDsm
Z3Q7IHdyb3RlOjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoFRoZSBjdmQtaG9zdCBwYWNrYWdlIGluIHRoaXMgY2FzZSBhcmUg
YmluYXJpZXMvbGlicmFyaWVzPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoGNvbXBpbGVkIGZvcjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqBhYXJjaDY0LCBzbyBpdCBjYW4gYmUgdXNlZCBvbiBsaW51eCBhYXJjaDY0IGFuZDxicj4NCiZn
dDvCoCDCoCDCoGJlbmVmaXQgZnJvbTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqBrdm08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgYWNj
ZWxlcmF0aW9uLjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoEluIHlvdXIgY2FzZSwgcnVubmluZyBlbXVsYXRpb24gZnJvbSBh
IHg2NCBob3N0LCB5b3UgbmVlZDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqBjdmQtaG9zdF9wYWNrYWdlLXg4Nl82NC50YXIuZ3ogaW5zdGVhZC48YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqBPbiA5
LzIvMjQgMTU6MzgsIE1hcmlvIE1hcmlldHRvIHdyb3RlOjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyBVcGRhdGUgOjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqA8
YnI+DQomZ3Q7wqAgwqAgwqAgwqB6aW9tYXJpb0BaMzkwLUFPUlVTLVBSTy1ERVNUOi9tbnQvenJv
b3QtMTMzL19PUy9BbmRyb2lkL2Fvc3BfMTQvYW5kcm9pZC1pbWFnZS9iaW4kIG1rZGlyIHg4Nl82
NC1saW51eC1tdXNsPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAm
Z3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDCoHpp
b21hcmlvQFozOTAtQU9SVVMtUFJPLURFU1Q6L21udC96cm9vdC0xMzMvX09TL0FuZHJvaWQvYW9z
cF8xNC9hbmRyb2lkLWltYWdlL2JpbiQgY3AgL21udC96cm9vdC0xMzMvX09TL0FuZHJvaWQvYW9z
cF8xNC9hbmRyb2lkLWltYWdlL2Jpbi9hYXJjaDY0LWxpbnV4LW11c2wvY3Jvc3ZtIC9tbnQvenJv
b3QtMTMzL19PUy9BbmRyb2lkL2Fvc3BfMTQvYW5kcm9pZC1pbWFnZS9iaW4veDg2XzY0LWxpbnV4
LW11c2w8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKgemlvbWFyaW9A
WjM5MC1BT1JVUy1QUk8tREVTVDovbW50L3pyb290LTEzMy9fT1MvQW5kcm9pZC9hb3NwXzE0L2Fu
ZHJvaWQtaW1hZ2UkIEhPTUU9JChwd2QpIC4vYmluL2xhdW5jaF9jdmQgLXZtX21hbmFnZXIgcWVt
dV9jbGkgLXJlcG9ydF9hbm9ueW1vdXNfdXNhZ2Vfc3RhdHM9biAtLXN0YXJ0X3dlYnJ0Yz1mYWxz
ZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyBVbmZvcnR1bmF0ZWx5IGl0IGRvZXMgbm90
IHdvcmsgOjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyAwOS0wMyAwMDowMzoyOC45MTYg
MjczNzIxMSAyNzM3MjExIEkgbGF1bmNoX2N2ZDo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgbWFpbi5jYzoyMzUgVXNpbmc8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgICZndDsgc3lzdGVtX2ltYWdlX2RpciBvZjo8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKgPT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PTxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyBOT1RJQ0U6PGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7IEJ5IHVzaW5nIHRoaXMgQW5kcm9pZCBWaXJ0
dWFsIERldmljZSwgeW91IGFncmVlIHRvPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmZ3Q7IEdvb2dsZSBUZXJtcyBvZiBTZXJ2aWNlPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCg8YSBocmVmPSJodHRwczovL3BvbGljaWVzLmdvb2ds
ZS5jb20vdGVybXMiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vcG9s
aWNpZXMuZ29vZ2xlLmNvbS90ZXJtczwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0i
aHR0cHM6Ly9wb2xpY2llcy5nb29nbGUuY29tL3Rlcm1zIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdl
dD0iX2JsYW5rIj5odHRwczovL3BvbGljaWVzLmdvb2dsZS5jb20vdGVybXM8L2E+Jmd0Ozxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cHM6
Ly9wb2xpY2llcy5nb29nbGUuY29tL3Rlcm1zIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2Js
YW5rIj5odHRwczovL3BvbGljaWVzLmdvb2dsZS5jb20vdGVybXM8L2E+PGJyPg0KJmd0O8KgIMKg
IMKgJmx0OzxhIGhyZWY9Imh0dHBzOi8vcG9saWNpZXMuZ29vZ2xlLmNvbS90ZXJtcyIgcmVsPSJu
b3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9wb2xpY2llcy5nb29nbGUuY29tL3Rl
cm1zPC9hPiZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCAmZ3Q7ICZsdDs8YSBocmVmPSJodHRwczovL3BvbGljaWVzLmdvb2dsZS5jb20vdGVybXMiIHJl
bD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vcG9saWNpZXMuZ29vZ2xlLmNv
bS90ZXJtczwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cHM6Ly9wb2xpY2ll
cy5nb29nbGUuY29tL3Rlcm1zIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRw
czovL3BvbGljaWVzLmdvb2dsZS5jb20vdGVybXM8L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cHM6Ly9wb2xpY2llcy5nb29n
bGUuY29tL3Rlcm1zIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL3Bv
bGljaWVzLmdvb2dsZS5jb20vdGVybXM8L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9
Imh0dHBzOi8vcG9saWNpZXMuZ29vZ2xlLmNvbS90ZXJtcyIgcmVsPSJub3JlZmVycmVyIiB0YXJn
ZXQ9Il9ibGFuayI+aHR0cHM6Ly9wb2xpY2llcy5nb29nbGUuY29tL3Rlcm1zPC9hPiZndDsmZ3Q7
Jmd0OykuPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7IFRo
ZSBHb29nbGUgUHJpdmFjeSBQb2xpY3k8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgKDxhIGhyZWY9Imh0dHBzOi8vcG9saWNpZXMuZ29vZ2xlLmNvbS9wcml2YWN5IiBy
ZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL3BvbGljaWVzLmdvb2dsZS5j
b20vcHJpdmFjeTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cHM6Ly9wb2xp
Y2llcy5nb29nbGUuY29tL3ByaXZhY3kiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsi
Pmh0dHBzOi8vcG9saWNpZXMuZ29vZ2xlLmNvbS9wcml2YWN5PC9hPiZndDs8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHBzOi8vcG9saWNp
ZXMuZ29vZ2xlLmNvbS9wcml2YWN5IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5o
dHRwczovL3BvbGljaWVzLmdvb2dsZS5jb20vcHJpdmFjeTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAm
bHQ7PGEgaHJlZj0iaHR0cHM6Ly9wb2xpY2llcy5nb29nbGUuY29tL3ByaXZhY3kiIHJlbD0ibm9y
ZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vcG9saWNpZXMuZ29vZ2xlLmNvbS9wcml2
YWN5PC9hPiZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCAmZ3Q7ICZsdDs8YSBocmVmPSJodHRwczovL3BvbGljaWVzLmdvb2dsZS5jb20vcHJpdmFjeSIg
cmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9wb2xpY2llcy5nb29nbGUu
Y29tL3ByaXZhY3k8L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHBzOi8vcG9s
aWNpZXMuZ29vZ2xlLmNvbS9wcml2YWN5IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5r
Ij5odHRwczovL3BvbGljaWVzLmdvb2dsZS5jb20vcHJpdmFjeTwvYT4mZ3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwczovL3BvbGlj
aWVzLmdvb2dsZS5jb20vcHJpdmFjeSIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+
aHR0cHM6Ly9wb2xpY2llcy5nb29nbGUuY29tL3ByaXZhY3k8L2E+PGJyPg0KJmd0O8KgIMKgIMKg
Jmx0OzxhIGhyZWY9Imh0dHBzOi8vcG9saWNpZXMuZ29vZ2xlLmNvbS9wcml2YWN5IiByZWw9Im5v
cmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL3BvbGljaWVzLmdvb2dsZS5jb20vcHJp
dmFjeTwvYT4mZ3Q7Jmd0OyZndDspPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmZ3Q7IGRlc2NyaWJlcyBob3cgR29vZ2xlIGhhbmRsZXMgaW5mb3JtYXRpb24gZ2Vu
ZXJhdGVkPGJyPg0KJmd0O8KgIMKgIMKgYXMgeW91IHVzZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyBHb29nbGUgU2VydmljZXMuPGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDCoD09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT08YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsgUmVhZGluZyAtLWNvbmZpZyBvcHRpb24gZnJv
bTo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKgL21u
dC96cm9vdC0xMzMvX09TL0FuZHJvaWQvYW9zcF8xNC9hbmRyb2lkLWltYWdlL2FuZHJvaWQtaW5m
by50eHQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsgTGF1
bmNoaW5nIENWRCB1c2luZyAtLWNvbmZpZz0mIzM5O3Bob25lJiMzOTsuPGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDCoC9tbnQvenJvb3QtMTMzL19PUy9B
bmRyb2lkL2Fvc3BfMTQvYW5kcm9pZC1pbWFnZS9iaW4vYWFyY2g2NC1saW51eC1nbnUvZ2Z4c3Ry
ZWFtX2dyYXBoaWNzX2RldGVjdG9yOiBlcnJvciB3aGlsZSBsb2FkaW5nIHNoYXJlZDxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyBsaWJyYXJpZXM6IGxpYmMuc28uNjogY2Fu
bm90IG9wZW4gc2hhcmVkIG9iamVjdDxicj4NCiZndDvCoCDCoCDCoGZpbGU6IE5vPGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoHN1Y2ggZmlsZSBvcjxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyBkaXJlY3Rvcnk8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsgRmFpbGVkIHRvIHJ1biBncmFwaGljcyBkZXRl
Y3RvciwgYmFkIHJldHVybiB2YWx1ZTo8YnI+DQomZ3Q7wqAgwqAgwqAxMjcuPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoEFzc3VtaW5nIG5vPGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7IGF2YWlsYWJpbGl0eS48YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsgR1BVIGF1dG8gbW9kZTogZGlk
IG5vdCBkZXRlY3QgcHJlcmVxdWlzaXRlcyBmb3I8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgYWNjZWxlcmF0ZWQgcmVuZGVyaW5nPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7IHN1cHBvcnQsIGVuYWJsaW5nIC0tZ3B1X21vZGU9
Z3Vlc3Rfc3dpZnRzaGFkZXIuPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCAmZ3Q7IEdQVSB2aG9zdCB1c2VyIGF1dG8gbW9kZTogbm90IG5lZWRlZCBmb3I8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgLS1ncHVfbW9kZT1ndWVzdF9zd2lm
dHNoYWRlci48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsg
Tm90IGVuYWJsaW5nIHZob3N0IHVzZXIgZ3B1Ljxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgJmd0OyBSZXF1ZXN0ZWQgcmVzdW1pbmcgYSBwcmV2aW91cyBzZXNzaW9u
ICh0aGUgZGVmYXVsdDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqBi
ZWhhdmlvcikgYnV0IHRoZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgJmd0OyBiYXNlIGltYWdlcyBoYXZlIGNoYW5nZWQgdW5kZXIgdGhlIG92ZXJsYXksIG1ha2lu
ZyB0aGU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgb3ZlcmxheTxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyBpbmNvbXBhdGli
bGUuIFdpcGluZyB0aGUgb3ZlcmxheSBmaWxlcy48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgICZndDsgUGF0aCBmb3IgaW5zdGFuY2UgVURTOiAvdG1wL2NmX2F2ZF8xMDAwPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7IFRoZSBmb2xsb3dpbmcgbGluZXMgY29u
dGFpbiB1c2VmdWwgZGVidWdnaW5nPGJyPg0KJmd0O8KgIMKgIMKgaW5mb3JtYXRpb246PGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqBTZXJpYWwgY29u
c29sZSBpcyBkaXNhYmxlZDsgdXNlIC1jb25zb2xlPXRydWUgdG88YnI+DQomZ3Q7wqAgwqAgwqBl
bmFibGUgaXQuPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7
wqAgwqBMb2djYXQgb3V0cHV0Ojxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqA8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAvbW50L3pyb290LTEzMy9fT1MvQW5kcm9pZC9hb3NwXzE0L2FuZHJvaWQt
aW1hZ2UvY3V0dGxlZmlzaC9pbnN0YW5jZXMvY3ZkLTEvbG9ncy9sb2djYXQ8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoEtlcm5lbCBsb2c6PGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDCoC9tbnQvenJvb3Qt
MTMzL19PUy9BbmRyb2lkL2Fvc3BfMTQvYW5kcm9pZC1pbWFnZS9jdXR0bGVmaXNoL2luc3RhbmNl
cy9jdmQtMS9rZXJuZWwubG9nPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCAmZ3Q7wqAgwqBMYXVuY2hlciBsb2c6PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oDxicj4NCiZndDvCoCDCoCDCoCDCoC9tbnQvenJvb3QtMTMzL19PUy9BbmRyb2lkL2Fvc3BfMTQv
YW5kcm9pZC1pbWFnZS9jdXR0bGVmaXNoL2luc3RhbmNlcy9jdmQtMS9sb2dzL2xhdW5jaGVyLmxv
Zzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgSW5z
dGFuY2UgY29uZmlndXJhdGlvbjo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgL21udC96cm9vdC0xMzMvX09TL0FuZHJvaWQvYW9zcF8xNC9hbmRyb2lk
LWltYWdlL2N1dHRsZWZpc2gvaW5zdGFuY2VzL2N2ZC0xL2N1dHRsZWZpc2hfY29uZmlnLmpzb248
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoExhdW5j
aGVyIEJ1aWxkIElEOiAxMjMwOTI5Njxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgJmd0OyA0LiBtYWluLmNjOjIzMnwgUnVuQ3ZkTWFpbnw8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsgMy4gbWFpbi5jYzoxMDR8IFJ1bnw8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsgMi4gc2VydmVyX2xv
b3BfaW1wbC5jcHA6ODl8IFJ1bnw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgICZndDsgMS4gcWVtdV9tYW5hZ2VyLmNwcDoyNDd8IFN0YXJ0Q29tbWFuZHN8PGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7IHw8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKgZGV2aWNlL2dv
b2dsZS9jdXR0bGVmaXNoL2hvc3QvbGlicy92bV9tYW5hZ2VyL3FlbXVfbWFuYWdlci5jcHA6OTc8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsgfCBSZXN1bHQm
bHQ7c3RkOjpwYWlyJmx0O2ludCwgaW50Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgY3V0dGxlZmlzaDo6dm1fbWFuYWdlcjo6KGFub255bW91czxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyBuYW1lc3BhY2UpOjpH
ZXRRZW11VmVyc2lvbihjb25zdCBzdGQ6OnN0cmluZyAmYW1wOyk8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsgdiBDRl9FWFBFQ1QocWVtdV92ZXJzaW9uX3Jl
dCA9PSAwKTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAvbW50L3pyb290LTEzMy9fT1MvQW5kcm9pZC9hb3NwXzE0L2FuZHJvaWQtaW1hZ2UvYmluL2Fh
cmNoNjQtbGludXgtZ251L3FlbXUvcWVtdS1zeXN0ZW0tYWFyY2g2NCAtdmVyc2lvbiByZXR1cm5l
ZCB1bmV4cGVjdGVkIHJlc3BvbnNlIC48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDsgU3RkZXJyIHdhczxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqA8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAvbW50L3pyb290LTEzMy9fT1MvQW5kcm9pZC9hb3NwXzE0L2Fu
ZHJvaWQtaW1hZ2UvYmluL2FhcmNoNjQtbGludXgtZ251L3FlbXUvcWVtdS1zeXN0ZW0tYWFyY2g2
NDogZXJyb3Igd2hpbGUgbG9hZGluZyBzaGFyZWQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgICZndDsgbGlicmFyaWVzOiBsaWJuY3Vyc2Vzdy5zby42OiBjYW5ub3Qgb3BlbiBzaGFy
ZWQgb2JqZWN0PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoGZpbGU6
IE5vIHN1Y2g8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsg
ZmlsZSBvciBkaXJlY3Rvcnk8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsg
T24gTW9uLCBTZXAgMiwgMjAyNCBhdCAxMTozMOKAr1BNIE1hcmlvIE1hcmlldHRvPGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDs8YSBocmVmPSJtYWlsdG86bWFy
aWV0dG8yMDA4QGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPm1hcmlldHRvMjAwOEBnbWFpbC5j
b208L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86bWFyaWV0
dG8yMDA4QGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPm1hcmlldHRvMjAwOEBnbWFpbC5jb208
L2E+Jmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzptYXJpZXR0bzIwMDhAZ21haWwuY29t
IiB0YXJnZXQ9Il9ibGFuayI+bWFyaWV0dG8yMDA4QGdtYWlsLmNvbTwvYT48YnI+DQomZ3Q7wqAg
wqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzptYXJpZXR0bzIwMDhAZ21haWwuY29tIiB0
YXJnZXQ9Il9ibGFuayI+bWFyaWV0dG8yMDA4QGdtYWlsLmNvbTwvYT4mZ3Q7Jmd0Ozxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyAmbHQ7bWFpbHRvOjxhIGhy
ZWY9Im1haWx0bzptYXJpZXR0bzIwMDhAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+bWFyaWV0
dG8yMDA4QGdtYWlsLmNvbTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9
Im1haWx0bzptYXJpZXR0bzIwMDhAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+bWFyaWV0dG8y
MDA4QGdtYWlsLmNvbTwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOm1hcmlldHRvMjAwOEBnbWFpbC5jb20i
IHRhcmdldD0iX2JsYW5rIj5tYXJpZXR0bzIwMDhAZ21haWwuY29tPC9hPjxicj4NCiZndDvCoCDC
oCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOm1hcmlldHRvMjAwOEBnbWFpbC5jb20iIHRh
cmdldD0iX2JsYW5rIj5tYXJpZXR0bzIwMDhAZ21haWwuY29tPC9hPiZndDsmZ3Q7Jmd0OyZndDsg
d3JvdGU6PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqBTb21l
dGhpbmcgaXMgbm90IHJpZ2h0IDo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZn
dDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgPGJyPg0KJmd0O8Kg
IMKgIMKgIMKgemlvbWFyaW9AWjM5MC1BT1JVUy1QUk8tREVTVDovbW50L3pyb290LTEzMy9fT1Mv
QW5kcm9pZC9hb3NwXzE0L2FuZHJvaWQtaW1hZ2UkIHVuemlwIC4uL2Fvc3BfY2ZfKi56aXA8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoEFyY2hpdmU6PGJyPg0K
Jmd0O8KgIMKgIMKgIMKgLi4vYW9zcF9jZl9hcm02NF9vbmx5X3Bob25lLWltZy0xMjMwOTI5Ni56
aXA8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDC
oCDCoGluZmxhdGluZzogYW5kcm9pZC1pbmZvLnR4dDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgaW5mbGF0aW5nOiBmYXN0Ym9vdC1pbmZv
LnR4dDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKg
IMKgIMKgaW5mbGF0aW5nOiBrZXJuZWxfMTZrPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqBpbmZsYXRpbmc6IHJhbWRpc2tfMTZrLmltZzxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
aW5mbGF0aW5nOiBib290LmltZzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgaW5mbGF0aW5nOiBib290XzE2ay5pbWc8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoGluZmxhdGluZzog
Ym9vdGxvYWRlcjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgaW5mbGF0aW5nOiBpbml0X2Jvb3QuaW1nPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqBpbmZsYXRpbmc6IHVzZXJkYXRh
LmltZzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKg
IMKgIMKgaW5mbGF0aW5nOiB2Ym1ldGEuaW1nPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqBpbmZsYXRpbmc6IHZibWV0YV9zeXN0ZW0uaW1n
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqBpbmZsYXRpbmc6IHZibWV0YV9zeXN0ZW1fZGxrbS5pbWc8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoGluZmxhdGluZzogdmJtZXRhX3Zl
bmRvcl9kbGttLmltZzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgaW5mbGF0aW5nOiB2ZW5kb3JfYm9vdC5pbWc8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoGluZmxhdGluZzogc3Vw
ZXIuaW1nPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDCoHppb21h
cmlvQFozOTAtQU9SVVMtUFJPLURFU1Q6L21udC96cm9vdC0xMzMvX09TL0FuZHJvaWQvYW9zcF8x
NC9hbmRyb2lkLWltYWdlJCB0YXIgeHp2ZiAuLi9jdmQtaG9zdF9wYWNrYWdlLnRhci5nejxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvPGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0LzxhIGhyZWY9
Im1haWx0bzphbmRyb2lkLmhhcmR3YXJlLmtleW1hc3RlckAzLjAuc28iIHRhcmdldD0iX2JsYW5r
Ij5hbmRyb2lkLmhhcmR3YXJlLmtleW1hc3RlckAzLjAuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKg
Jmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86YW5kcm9pZC5oYXJkd2FyZS5rZXltYXN0ZXJAMy4w
LnNvIiB0YXJnZXQ9Il9ibGFuayI+YW5kcm9pZC5oYXJkd2FyZS5rZXltYXN0ZXJAMy4wLnNvPC9h
PiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmx0O21haWx0
bzo8YSBocmVmPSJtYWlsdG86YW5kcm9pZC5oYXJkd2FyZS5rZXltYXN0ZXJAMy4wLnNvIiB0YXJn
ZXQ9Il9ibGFuayI+YW5kcm9pZC5oYXJkd2FyZS5rZXltYXN0ZXJAMy4wLnNvPC9hPjxicj4NCiZn
dDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmFuZHJvaWQuaGFyZHdhcmUua2V5
bWFzdGVyQDMuMC5zbyIgdGFyZ2V0PSJfYmxhbmsiPmFuZHJvaWQuaGFyZHdhcmUua2V5bWFzdGVy
QDMuMC5zbzwvYT4mZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86YW5kcm9pZC5oYXJk
d2FyZS5rZXltYXN0ZXJAMy4wLnNvIiB0YXJnZXQ9Il9ibGFuayI+YW5kcm9pZC5oYXJkd2FyZS5r
ZXltYXN0ZXJAMy4wLnNvPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0i
bWFpbHRvOmFuZHJvaWQuaGFyZHdhcmUua2V5bWFzdGVyQDMuMC5zbyIgdGFyZ2V0PSJfYmxhbmsi
PmFuZHJvaWQuaGFyZHdhcmUua2V5bWFzdGVyQDMuMC5zbzwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmFu
ZHJvaWQuaGFyZHdhcmUua2V5bWFzdGVyQDMuMC5zbyIgdGFyZ2V0PSJfYmxhbmsiPmFuZHJvaWQu
aGFyZHdhcmUua2V5bWFzdGVyQDMuMC5zbzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRv
OjxhIGhyZWY9Im1haWx0bzphbmRyb2lkLmhhcmR3YXJlLmtleW1hc3RlckAzLjAuc28iIHRhcmdl
dD0iX2JsYW5rIj5hbmRyb2lkLmhhcmR3YXJlLmtleW1hc3RlckAzLjAuc288L2E+Jmd0OyZndDsm
Z3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAuL2xpYjY0LzxhIGhyZWY9Imh0dHA6Ly9saWJjaWJvcml1bV9pby5keWxpYi5zbyIgcmVsPSJu
b3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+bGliY2lib3JpdW1faW8uZHlsaWIuc288L2E+PGJy
Pg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJjaWJvcml1bV9pby5keWxpYi5z
byIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmNpYm9yaXVtX2lv
LmR5bGliLnNvPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJjaWJvcml1bV9pby5keWxpYi5zbyIgcmVsPSJub3Jl
ZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmNpYm9yaXVtX2lvLmR5bGliLnNvPC9h
Pjxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGliY2lib3JpdW1faW8uZHls
aWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJjaWJvcml1
bV9pby5keWxpYi5zbzwvYT4mZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmNpYm9yaXVtX2lvLmR5bGliLnNvIiBy
ZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGliY2lib3JpdW1faW8uZHls
aWIuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJjaWJvcml1
bV9pby5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xp
YmNpYm9yaXVtX2lvLmR5bGliLnNvPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJjaWJvcml1bV9pby5keWxpYi5z
byIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmNpYm9yaXVtX2lv
LmR5bGliLnNvPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGliY2li
b3JpdW1faW8uZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6
Ly9saWJjaWJvcml1bV9pby5keWxpYi5zbzwvYT4mZ3Q7Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvbGlianBlZy5z
bzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKg
Li9saWI2NC9jdXR0bGVmaXNoX25ldC5zbzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9saWI2NC9saWJiYXNlLnNvPGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0LzxhIGhyZWY9
Imh0dHA6Ly92dWxrYW4ucGFzdGVsLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5r
Ij52dWxrYW4ucGFzdGVsLnNvPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRw
Oi8vdnVsa2FuLnBhc3RlbC5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0
cDovL3Z1bGthbi5wYXN0ZWwuc288L2E+Jmd0OyAmbHQ7PGEgaHJlZj0iaHR0cDovL3Z1bGthbi5w
YXN0ZWwuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly92dWxrYW4u
cGFzdGVsLnNvPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vdnVsa2Fu
LnBhc3RlbC5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL3Z1bGth
bi5wYXN0ZWwuc288L2E+Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly92dWxrYW4ucGFzdGVsLnNvIiByZWw9Im5vcmVm
ZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vdnVsa2FuLnBhc3RlbC5zbzwvYT4gJmx0Ozxh
IGhyZWY9Imh0dHA6Ly92dWxrYW4ucGFzdGVsLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0i
X2JsYW5rIj5odHRwOi8vdnVsa2FuLnBhc3RlbC5zbzwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKg
Jmx0OzxhIGhyZWY9Imh0dHA6Ly92dWxrYW4ucGFzdGVsLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRh
cmdldD0iX2JsYW5rIj5odHRwOi8vdnVsa2FuLnBhc3RlbC5zbzwvYT4gJmx0OzxhIGhyZWY9Imh0
dHA6Ly92dWxrYW4ucGFzdGVsLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5o
dHRwOi8vdnVsa2FuLnBhc3RlbC5zbzwvYT4mZ3Q7Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvbGliY3V0dGxlZmlz
aF9ob3N0X2NvbmZpZy5zbzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgJmd0O8KgIMKgIMKgLi9saWI2NC88YSBocmVmPSJodHRwOi8vbGliZmxhZ3NldC5keWxpYi5z
byIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+bGliZmxhZ3NldC5keWxpYi5zbzwv
YT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmZsYWdzZXQuZHlsaWIu
c28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJmbGFnc2V0LmR5
bGliLnNvPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
Jmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJmbGFnc2V0LmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIi
IHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGliZmxhZ3NldC5keWxpYi5zbzwvYT48YnI+DQomZ3Q7
wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmZsYWdzZXQuZHlsaWIuc28iIHJlbD0ibm9y
ZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJmbGFnc2V0LmR5bGliLnNvPC9hPiZn
dDsmZ3Q7ICZsdDs8YSBocmVmPSJodHRwOi8vbGliZmxhZ3NldC5keWxpYi5zbyIgcmVsPSJub3Jl
ZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmZsYWdzZXQuZHlsaWIuc288L2E+PGJy
Pg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJmbGFnc2V0LmR5bGliLnNvIiBy
ZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGliZmxhZ3NldC5keWxpYi5z
bzwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDs8
YSBocmVmPSJodHRwOi8vbGliZmxhZ3NldC5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJn
ZXQ9Il9ibGFuayI+aHR0cDovL2xpYmZsYWdzZXQuZHlsaWIuc288L2E+PGJyPg0KJmd0O8KgIMKg
IMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJmbGFnc2V0LmR5bGliLnNvIiByZWw9Im5vcmVmZXJy
ZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGliZmxhZ3NldC5keWxpYi5zbzwvYT4mZ3Q7Jmd0
OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDC
oCDCoC4vbGliNjQvPGEgaHJlZj0iaHR0cDovL2xpYmttcl9jb21tb24uZHlsaWIuc28iIHJlbD0i
bm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmxpYmttcl9jb21tb24uZHlsaWIuc288L2E+PGJy
Pg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJrbXJfY29tbW9uLmR5bGliLnNv
IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlia21yX2NvbW1vbi5k
eWxpYi5zbzwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCZsdDs8YSBocmVmPSJodHRwOi8vbGlia21yX2NvbW1vbi5keWxpYi5zbyIgcmVsPSJub3JlZmVy
cmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmttcl9jb21tb24uZHlsaWIuc288L2E+PGJy
Pg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJrbXJfY29tbW9uLmR5bGliLnNv
IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlia21yX2NvbW1vbi5k
eWxpYi5zbzwvYT4mZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmttcl9jb21tb24uZHlsaWIuc28iIHJlbD0ibm9y
ZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJrbXJfY29tbW9uLmR5bGliLnNvPC9h
Pjxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGlia21yX2NvbW1vbi5keWxp
Yi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmttcl9jb21t
b24uZHlsaWIuc288L2E+Jmd0OyAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmttcl9jb21tb24uZHls
aWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJrbXJfY29t
bW9uLmR5bGliLnNvPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGli
a21yX2NvbW1vbi5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0
cDovL2xpYmttcl9jb21tb24uZHlsaWIuc288L2E+Jmd0OyZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0LzxhIGhyZWY9
Imh0dHA6Ly9saWJwa2NzMS5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFu
ayI+bGlicGtjczEuZHlsaWIuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0
dHA6Ly9saWJwa2NzMS5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+
aHR0cDovL2xpYnBrY3MxLmR5bGliLnNvPC9hPiZndDsgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJw
a2NzMS5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xp
YnBrY3MxLmR5bGliLnNvPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8v
bGlicGtjczEuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6
Ly9saWJwa2NzMS5keWxpYi5zbzwvYT4mZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYnBrY3MxLmR5bGliLnNvIiBy
ZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlicGtjczEuZHlsaWIuc288
L2E+ICZsdDs8YSBocmVmPSJodHRwOi8vbGlicGtjczEuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJl
ciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJwa2NzMS5keWxpYi5zbzwvYT4mZ3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJwa2NzMS5keWxpYi5zbyIgcmVsPSJu
b3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYnBrY3MxLmR5bGliLnNvPC9hPiAm
bHQ7PGEgaHJlZj0iaHR0cDovL2xpYnBrY3MxLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRh
cmdldD0iX2JsYW5rIj5odHRwOi8vbGlicGtjczEuZHlsaWIuc288L2E+Jmd0OyZndDsmZ3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xp
YjY0L2xpYmljdWkxOG4taG9zdC5zbzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9saWI2NC9saWJ3YXlsYW5kX2NsaWVudC5zbzxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9saWI2NC9s
aWJ1bndpbmRzdGFjay5zbzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgJmd0O8KgIMKgIMKgLi9saWI2NC88YSBocmVmPSJodHRwOi8vbGlia21yX3RhLmR5bGliLnNv
IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5saWJrbXJfdGEuZHlsaWIuc288L2E+
PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJrbXJfdGEuZHlsaWIuc28i
IHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJrbXJfdGEuZHlsaWIu
c288L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7
PGEgaHJlZj0iaHR0cDovL2xpYmttcl90YS5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJn
ZXQ9Il9ibGFuayI+aHR0cDovL2xpYmttcl90YS5keWxpYi5zbzwvYT48YnI+DQomZ3Q7wqAgwqAg
wqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmttcl90YS5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVy
IiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmttcl90YS5keWxpYi5zbzwvYT4mZ3Q7Jmd0OyAm
bHQ7PGEgaHJlZj0iaHR0cDovL2xpYmttcl90YS5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0
YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmttcl90YS5keWxpYi5zbzwvYT48YnI+DQomZ3Q7wqAg
wqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmttcl90YS5keWxpYi5zbyIgcmVsPSJub3JlZmVy
cmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmttcl90YS5keWxpYi5zbzwvYT4mZ3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRw
Oi8vbGlia21yX3RhLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5o
dHRwOi8vbGlia21yX3RhLmR5bGliLnNvPC9hPiAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmttcl90
YS5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmtt
cl90YS5keWxpYi5zbzwvYT4mZ3Q7Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvPGEgaHJlZj0iaHR0cDovL2xpYmNv
c2V0LmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5saWJjb3NldC5k
eWxpYi5zbzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmNvc2V0
LmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGliY29z
ZXQuZHlsaWIuc288L2E+Jmd0OyAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmNvc2V0LmR5bGliLnNv
IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGliY29zZXQuZHlsaWIu
c288L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJjb3NldC5keWxp
Yi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmNvc2V0LmR5
bGliLnNvPC9hPiZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGliY29zZXQuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJl
ciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJjb3NldC5keWxpYi5zbzwvYT4gJmx0OzxhIGhy
ZWY9Imh0dHA6Ly9saWJjb3NldC5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9i
bGFuayI+aHR0cDovL2xpYmNvc2V0LmR5bGliLnNvPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAm
bHQ7PGEgaHJlZj0iaHR0cDovL2xpYmNvc2V0LmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRh
cmdldD0iX2JsYW5rIj5odHRwOi8vbGliY29zZXQuZHlsaWIuc288L2E+ICZsdDs8YSBocmVmPSJo
dHRwOi8vbGliY29zZXQuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsi
Pmh0dHA6Ly9saWJjb3NldC5keWxpYi5zbzwvYT4mZ3Q7Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvbGliY3BwYm9y
LnNvPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAuL2xpYjY0L2xpYmdhdGVrZWVwZXIuc288YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvbGlieXV2LnNvPGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0L2xpYmdycGMr
Ky5zbzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKg
IMKgLi9saWI2NC9saWJrbXJfY2ZfZmZpLnNvPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0L2xpYmNwcGNvc2VfcmtwLnNvPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0
L2xpYmN1dHRsZWZpc2hfdHJhbnNwb3J0LnNvPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0L2xpYmx6bWEuc288YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvPGEgaHJl
Zj0iaHR0cDovL2xpYmNpYm9yaXVtX2xsLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdl
dD0iX2JsYW5rIj5saWJjaWJvcml1bV9sbC5keWxpYi5zbzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAm
bHQ7PGEgaHJlZj0iaHR0cDovL2xpYmNpYm9yaXVtX2xsLmR5bGliLnNvIiByZWw9Im5vcmVmZXJy
ZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGliY2lib3JpdW1fbGwuZHlsaWIuc288L2E+Jmd0
Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0i
aHR0cDovL2xpYmNpYm9yaXVtX2xsLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0i
X2JsYW5rIj5odHRwOi8vbGliY2lib3JpdW1fbGwuZHlsaWIuc288L2E+PGJyPg0KJmd0O8KgIMKg
IMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJjaWJvcml1bV9sbC5keWxpYi5zbyIgcmVsPSJub3Jl
ZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmNpYm9yaXVtX2xsLmR5bGliLnNvPC9h
PiZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDs8
YSBocmVmPSJodHRwOi8vbGliY2lib3JpdW1fbGwuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIg
dGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJjaWJvcml1bV9sbC5keWxpYi5zbzwvYT48YnI+DQom
Z3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmNpYm9yaXVtX2xsLmR5bGliLnNvIiBy
ZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGliY2lib3JpdW1fbGwuZHls
aWIuc288L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAm
bHQ7PGEgaHJlZj0iaHR0cDovL2xpYmNpYm9yaXVtX2xsLmR5bGliLnNvIiByZWw9Im5vcmVmZXJy
ZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGliY2lib3JpdW1fbGwuZHlsaWIuc288L2E+PGJy
Pg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJjaWJvcml1bV9sbC5keWxpYi5z
byIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmNpYm9yaXVtX2xs
LmR5bGliLnNvPC9hPiZndDsmZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9saWI2NC9saWJjdXR0bGVmaXNoX2FsbG9jZF91dGls
cy5zbzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKg
IMKgLi9saWI2NC9saWJnZmxhZ3Muc288YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvPGEgaHJlZj0ibWFpbHRvOmFuZHJvaWQuaGFy
ZHdhcmUua2V5bWFzdGVyQDQuMC5zbyIgdGFyZ2V0PSJfYmxhbmsiPmFuZHJvaWQuaGFyZHdhcmUu
a2V5bWFzdGVyQDQuMC5zbzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9
Im1haWx0bzphbmRyb2lkLmhhcmR3YXJlLmtleW1hc3RlckA0LjAuc28iIHRhcmdldD0iX2JsYW5r
Ij5hbmRyb2lkLmhhcmR3YXJlLmtleW1hc3RlckA0LjAuc288L2E+Jmd0Ozxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzph
bmRyb2lkLmhhcmR3YXJlLmtleW1hc3RlckA0LjAuc28iIHRhcmdldD0iX2JsYW5rIj5hbmRyb2lk
LmhhcmR3YXJlLmtleW1hc3RlckA0LjAuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0
bzo8YSBocmVmPSJtYWlsdG86YW5kcm9pZC5oYXJkd2FyZS5rZXltYXN0ZXJANC4wLnNvIiB0YXJn
ZXQ9Il9ibGFuayI+YW5kcm9pZC5oYXJkd2FyZS5rZXltYXN0ZXJANC4wLnNvPC9hPiZndDsmZ3Q7
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAm
bHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzphbmRyb2lkLmhhcmR3YXJlLmtleW1hc3RlckA0LjAu
c28iIHRhcmdldD0iX2JsYW5rIj5hbmRyb2lkLmhhcmR3YXJlLmtleW1hc3RlckA0LjAuc288L2E+
PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86YW5kcm9pZC5oYXJk
d2FyZS5rZXltYXN0ZXJANC4wLnNvIiB0YXJnZXQ9Il9ibGFuayI+YW5kcm9pZC5oYXJkd2FyZS5r
ZXltYXN0ZXJANC4wLnNvPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86YW5kcm9pZC5oYXJkd2FyZS5rZXlt
YXN0ZXJANC4wLnNvIiB0YXJnZXQ9Il9ibGFuayI+YW5kcm9pZC5oYXJkd2FyZS5rZXltYXN0ZXJA
NC4wLnNvPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmFu
ZHJvaWQuaGFyZHdhcmUua2V5bWFzdGVyQDQuMC5zbyIgdGFyZ2V0PSJfYmxhbmsiPmFuZHJvaWQu
aGFyZHdhcmUua2V5bWFzdGVyQDQuMC5zbzwvYT4mZ3Q7Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvPGEgaHJlZj0i
aHR0cDovL2xpYmNmZ19pZi5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFu
ayI+bGliY2ZnX2lmLmR5bGliLnNvPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJo
dHRwOi8vbGliY2ZnX2lmLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5r
Ij5odHRwOi8vbGliY2ZnX2lmLmR5bGliLnNvPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJjZmdfaWYuZHlsaWIu
c28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJjZmdfaWYuZHls
aWIuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJjZmdfaWYu
ZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJjZmdf
aWYuZHlsaWIuc288L2E+Jmd0OyZndDsgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJjZmdfaWYuZHls
aWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJjZmdfaWYu
ZHlsaWIuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJjZmdf
aWYuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJj
ZmdfaWYuZHlsaWIuc288L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmNmZ19pZi5keWxpYi5zbyIgcmVsPSJub3Jl
ZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmNmZ19pZi5keWxpYi5zbzwvYT4gJmx0
OzxhIGhyZWY9Imh0dHA6Ly9saWJjZmdfaWYuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFy
Z2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJjZmdfaWYuZHlsaWIuc288L2E+Jmd0OyZndDsmZ3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xp
YjY0LzxhIGhyZWY9Imh0dHA6Ly9saWJzcGtpLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRh
cmdldD0iX2JsYW5rIj5saWJzcGtpLmR5bGliLnNvPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDs8
YSBocmVmPSJodHRwOi8vbGlic3BraS5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9
Il9ibGFuayI+aHR0cDovL2xpYnNwa2kuZHlsaWIuc288L2E+Jmd0OyAmbHQ7PGEgaHJlZj0iaHR0
cDovL2xpYnNwa2kuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0
dHA6Ly9saWJzcGtpLmR5bGliLnNvPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJo
dHRwOi8vbGlic3BraS5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+
aHR0cDovL2xpYnNwa2kuZHlsaWIuc288L2E+Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJzcGtpLmR5bGliLnNv
IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlic3BraS5keWxpYi5z
bzwvYT4gJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJzcGtpLmR5bGliLnNvIiByZWw9Im5vcmVmZXJy
ZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlic3BraS5keWxpYi5zbzwvYT4mZ3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJzcGtpLmR5bGliLnNvIiByZWw9Im5v
cmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlic3BraS5keWxpYi5zbzwvYT4gJmx0
OzxhIGhyZWY9Imh0dHA6Ly9saWJzcGtpLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdl
dD0iX2JsYW5rIj5odHRwOi8vbGlic3BraS5keWxpYi5zbzwvYT4mZ3Q7Jmd0OyZndDs8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQv
PGEgaHJlZj0iaHR0cDovL2xpYnplcm9pemUuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFy
Z2V0PSJfYmxhbmsiPmxpYnplcm9pemUuZHlsaWIuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0
OzxhIGhyZWY9Imh0dHA6Ly9saWJ6ZXJvaXplLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRh
cmdldD0iX2JsYW5rIj5odHRwOi8vbGliemVyb2l6ZS5keWxpYi5zbzwvYT4mZ3Q7PGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGli
emVyb2l6ZS5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDov
L2xpYnplcm9pemUuZHlsaWIuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0
dHA6Ly9saWJ6ZXJvaXplLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5r
Ij5odHRwOi8vbGliemVyb2l6ZS5keWxpYi5zbzwvYT4mZ3Q7Jmd0OyAmbHQ7PGEgaHJlZj0iaHR0
cDovL2xpYnplcm9pemUuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsi
Pmh0dHA6Ly9saWJ6ZXJvaXplLmR5bGliLnNvPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBo
cmVmPSJodHRwOi8vbGliemVyb2l6ZS5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9
Il9ibGFuayI+aHR0cDovL2xpYnplcm9pemUuZHlsaWIuc288L2E+Jmd0Ozxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYnplcm9p
emUuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJ6
ZXJvaXplLmR5bGliLnNvPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8v
bGliemVyb2l6ZS5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0
cDovL2xpYnplcm9pemUuZHlsaWIuc288L2E+Jmd0OyZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0L2xpYmNncm91cHJj
LnNvPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAuL2xpYjY0L2xpYnByb3RvYnVmLWNwcC1mdWxsLnNvPGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0L2xpYmN1dGlscy5zbzxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9saWI2
NC9saWJzcWxpdGUuc288YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
ICZndDvCoCDCoCDCoC4vbGliNjQvbGliY3V0dGxlZmlzaF91dGlsc19yZXN1bHQuc288YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQv
bGliYmluZGVyX25kay5zbzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgJmd0O8KgIMKgIMKgLi9saWI2NC9saWJleHQyX3V1aWQtaG9zdC5zbzxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9saWI2NC88YSBocmVm
PSJodHRwOi8vbGliaGV4LmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5r
Ij5saWJoZXguZHlsaWIuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6
Ly9saWJoZXguZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6
Ly9saWJoZXguZHlsaWIuc288L2E+Jmd0OyAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmhleC5keWxp
Yi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmhleC5keWxp
Yi5zbzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmhleC5keWxp
Yi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmhleC5keWxp
Yi5zbzwvYT4mZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmhleC5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0
YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmhleC5keWxpYi5zbzwvYT4gJmx0OzxhIGhyZWY9Imh0
dHA6Ly9saWJoZXguZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0
dHA6Ly9saWJoZXguZHlsaWIuc288L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVm
PSJodHRwOi8vbGliaGV4LmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5r
Ij5odHRwOi8vbGliaGV4LmR5bGliLnNvPC9hPiAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmhleC5k
eWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmhleC5k
eWxpYi5zbzwvYT4mZ3Q7Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvbGliY19tdXNsLnNvPGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0LzxhIGhyZWY9
Imh0dHA6Ly9saWJjb25zdF9vaWQuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJf
YmxhbmsiPmxpYmNvbnN0X29pZC5keWxpYi5zbzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEg
aHJlZj0iaHR0cDovL2xpYmNvbnN0X29pZC5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJn
ZXQ9Il9ibGFuayI+aHR0cDovL2xpYmNvbnN0X29pZC5keWxpYi5zbzwvYT4mZ3Q7PGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGli
Y29uc3Rfb2lkLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRw
Oi8vbGliY29uc3Rfb2lkLmR5bGliLnNvPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVm
PSJodHRwOi8vbGliY29uc3Rfb2lkLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0i
X2JsYW5rIj5odHRwOi8vbGliY29uc3Rfb2lkLmR5bGliLnNvPC9hPiZndDsmZ3Q7ICZsdDs8YSBo
cmVmPSJodHRwOi8vbGliY29uc3Rfb2lkLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdl
dD0iX2JsYW5rIj5odHRwOi8vbGliY29uc3Rfb2lkLmR5bGliLnNvPC9hPjxicj4NCiZndDvCoCDC
oCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGliY29uc3Rfb2lkLmR5bGliLnNvIiByZWw9Im5vcmVm
ZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGliY29uc3Rfb2lkLmR5bGliLnNvPC9hPiZn
dDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmx0OzxhIGhyZWY9
Imh0dHA6Ly9saWJjb25zdF9vaWQuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJf
YmxhbmsiPmh0dHA6Ly9saWJjb25zdF9vaWQuZHlsaWIuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKg
Jmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJjb25zdF9vaWQuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJl
ciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJjb25zdF9vaWQuZHlsaWIuc288L2E+Jmd0OyZn
dDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAuL2xpYjY0LzxhIGhyZWY9Imh0dHA6Ly9saWJwcm90b2J1Zl9zdXBwb3J0LmR5bGliLnNv
IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5saWJwcm90b2J1Zl9zdXBwb3J0LmR5
bGliLnNvPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGlicHJvdG9i
dWZfc3VwcG9ydC5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0
cDovL2xpYnByb3RvYnVmX3N1cHBvcnQuZHlsaWIuc288L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYnByb3RvYnVm
X3N1cHBvcnQuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6
Ly9saWJwcm90b2J1Zl9zdXBwb3J0LmR5bGliLnNvPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDs8
YSBocmVmPSJodHRwOi8vbGlicHJvdG9idWZfc3VwcG9ydC5keWxpYi5zbyIgcmVsPSJub3JlZmVy
cmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYnByb3RvYnVmX3N1cHBvcnQuZHlsaWIuc288
L2E+Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZn
dDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGlicHJvdG9idWZfc3VwcG9ydC5keWxpYi5z
byIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYnByb3RvYnVmX3N1
cHBvcnQuZHlsaWIuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9s
aWJwcm90b2J1Zl9zdXBwb3J0LmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2Js
YW5rIj5odHRwOi8vbGlicHJvdG9idWZfc3VwcG9ydC5keWxpYi5zbzwvYT4mZ3Q7PGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGli
cHJvdG9idWZfc3VwcG9ydC5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFu
ayI+aHR0cDovL2xpYnByb3RvYnVmX3N1cHBvcnQuZHlsaWIuc288L2E+PGJyPg0KJmd0O8KgIMKg
IMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJwcm90b2J1Zl9zdXBwb3J0LmR5bGliLnNvIiByZWw9
Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlicHJvdG9idWZfc3VwcG9ydC5k
eWxpYi5zbzwvYT4mZ3Q7Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvdHBtMi10c3MyLXRjdGkuc288YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvPGEg
aHJlZj0iaHR0cDovL2xpYnNlcmRlLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0i
X2JsYW5rIj5saWJzZXJkZS5keWxpYi5zbzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJl
Zj0iaHR0cDovL2xpYnNlcmRlLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2Js
YW5rIj5odHRwOi8vbGlic2VyZGUuZHlsaWIuc288L2E+Jmd0OyAmbHQ7PGEgaHJlZj0iaHR0cDov
L2xpYnNlcmRlLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRw
Oi8vbGlic2VyZGUuZHlsaWIuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0
dHA6Ly9saWJzZXJkZS5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+
aHR0cDovL2xpYnNlcmRlLmR5bGliLnNvPC9hPiZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGlic2VyZGUuZHlsaWIu
c28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJzZXJkZS5keWxp
Yi5zbzwvYT4gJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJzZXJkZS5keWxpYi5zbyIgcmVsPSJub3Jl
ZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYnNlcmRlLmR5bGliLnNvPC9hPiZndDs8
YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYnNlcmRlLmR5bGliLnNvIiBy
ZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlic2VyZGUuZHlsaWIuc288
L2E+ICZsdDs8YSBocmVmPSJodHRwOi8vbGlic2VyZGUuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJl
ciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJzZXJkZS5keWxpYi5zbzwvYT4mZ3Q7Jmd0OyZn
dDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDC
oC4vbGliNjQvbGliYXJ0cGFsZXR0ZS5zbzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9saWI2NC9saWJsb2cuc288YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvPGEgaHJlZj0i
aHR0cDovL2xpYm9uY2VfY2VsbC5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9i
bGFuayI+bGlib25jZV9jZWxsLmR5bGliLnNvPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBo
cmVmPSJodHRwOi8vbGlib25jZV9jZWxsLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdl
dD0iX2JsYW5rIj5odHRwOi8vbGlib25jZV9jZWxsLmR5bGliLnNvPC9hPiZndDs8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJv
bmNlX2NlbGwuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6
Ly9saWJvbmNlX2NlbGwuZHlsaWIuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9
Imh0dHA6Ly9saWJvbmNlX2NlbGwuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJf
YmxhbmsiPmh0dHA6Ly9saWJvbmNlX2NlbGwuZHlsaWIuc288L2E+Jmd0OyZndDsgJmx0OzxhIGhy
ZWY9Imh0dHA6Ly9saWJvbmNlX2NlbGwuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0
PSJfYmxhbmsiPmh0dHA6Ly9saWJvbmNlX2NlbGwuZHlsaWIuc288L2E+PGJyPg0KJmd0O8KgIMKg
IMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJvbmNlX2NlbGwuZHlsaWIuc28iIHJlbD0ibm9yZWZl
cnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJvbmNlX2NlbGwuZHlsaWIuc288L2E+Jmd0
Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0i
aHR0cDovL2xpYm9uY2VfY2VsbC5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9i
bGFuayI+aHR0cDovL2xpYm9uY2VfY2VsbC5keWxpYi5zbzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAm
bHQ7PGEgaHJlZj0iaHR0cDovL2xpYm9uY2VfY2VsbC5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVy
IiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYm9uY2VfY2VsbC5keWxpYi5zbzwvYT4mZ3Q7Jmd0
OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDC
oCDCoC4vbGliNjQvPGEgaHJlZj0iaHR0cDovL2xpYnRoaXNlcnJvci5keWxpYi5zbyIgcmVsPSJu
b3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+bGlidGhpc2Vycm9yLmR5bGliLnNvPC9hPjxicj4N
CiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGlidGhpc2Vycm9yLmR5bGliLnNvIiBy
ZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlidGhpc2Vycm9yLmR5bGli
LnNvPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmx0
OzxhIGhyZWY9Imh0dHA6Ly9saWJ0aGlzZXJyb3IuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIg
dGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJ0aGlzZXJyb3IuZHlsaWIuc288L2E+PGJyPg0KJmd0
O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJ0aGlzZXJyb3IuZHlsaWIuc28iIHJlbD0i
bm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJ0aGlzZXJyb3IuZHlsaWIuc288
L2E+Jmd0OyZndDsgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJ0aGlzZXJyb3IuZHlsaWIuc28iIHJl
bD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJ0aGlzZXJyb3IuZHlsaWIu
c288L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJ0aGlzZXJyb3Iu
ZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJ0aGlz
ZXJyb3IuZHlsaWIuc288L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYnRoaXNlcnJvci5keWxpYi5zbyIgcmVsPSJu
b3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYnRoaXNlcnJvci5keWxpYi5zbzwv
YT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYnRoaXNlcnJvci5keWxp
Yi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYnRoaXNlcnJv
ci5keWxpYi5zbzwvYT4mZ3Q7Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvbGlic3NsLWhvc3Quc288YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvbGli
YysrLnNvPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAuL2xpYjY0L2xpYmV4dDRfdXRpbHMuc288YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvPGEgaHJlZj0iaHR0cDovL2xpYnBr
Y3M4LmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5saWJwa2NzOC5k
eWxpYi5zbzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYnBrY3M4
LmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlicGtj
czguZHlsaWIuc288L2E+Jmd0OyAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYnBrY3M4LmR5bGliLnNv
IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlicGtjczguZHlsaWIu
c288L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJwa2NzOC5keWxp
Yi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYnBrY3M4LmR5
bGliLnNvPC9hPiZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGlicGtjczguZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJl
ciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJwa2NzOC5keWxpYi5zbzwvYT4gJmx0OzxhIGhy
ZWY9Imh0dHA6Ly9saWJwa2NzOC5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9i
bGFuayI+aHR0cDovL2xpYnBrY3M4LmR5bGliLnNvPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAm
bHQ7PGEgaHJlZj0iaHR0cDovL2xpYnBrY3M4LmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRh
cmdldD0iX2JsYW5rIj5odHRwOi8vbGlicGtjczguZHlsaWIuc288L2E+ICZsdDs8YSBocmVmPSJo
dHRwOi8vbGlicGtjczguZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsi
Pmh0dHA6Ly9saWJwa2NzOC5keWxpYi5zbzwvYT4mZ3Q7Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvbGlic3BhcnNl
LWhvc3Quc288YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvC
oCDCoCDCoC4vbGliNjQvc2FuZGJveGVkX2FwaV9zYW5kYm94Mi5zbzxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9saWI2NC9saWJjdXR0bGVm
aXNoX2NvbW1hbmRfdXRpbC5zbzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgJmd0O8KgIMKgIMKgLi9saWI2NC88YSBocmVmPSJodHRwOi8vbGliYnNzbF9zeXMuZHls
aWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmxpYmJzc2xfc3lzLmR5bGli
LnNvPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGliYnNzbF9zeXMu
ZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJic3Ns
X3N5cy5keWxpYi5zbzwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGliYnNzbF9zeXMuZHlsaWIuc28iIHJlbD0ibm9y
ZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJic3NsX3N5cy5keWxpYi5zbzwvYT48
YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmJzc2xfc3lzLmR5bGliLnNv
IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGliYnNzbF9zeXMuZHls
aWIuc288L2E+Jmd0OyZndDsgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJic3NsX3N5cy5keWxpYi5z
byIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmJzc2xfc3lzLmR5
bGliLnNvPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGliYnNzbF9z
eXMuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJi
c3NsX3N5cy5keWxpYi5zbzwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGliYnNzbF9zeXMuZHlsaWIuc28iIHJlbD0i
bm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJic3NsX3N5cy5keWxpYi5zbzwv
YT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmJzc2xfc3lzLmR5bGli
LnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGliYnNzbF9zeXMu
ZHlsaWIuc288L2E+Jmd0OyZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0L2xpYmtleW1hc3Rlcl9tZXNzYWdlcy5zbzxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9s
aWI2NC9saWJjdXR0bGVmaXNoX3dlYi5zbzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9saWI2NC9saWJ2cHguc288YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvbGlib3B1cy5z
bzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKg
Li9saWI2NC9saWJtaW5pamFpbC5zbzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9saWI2NC9saWJjdXJsLWhvc3Quc288YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvbGliY3V0
dGxlZmlzaF9rZXJuZWxfbG9nX21vbml0b3JfdXRpbHMuc288YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvdHBtMi10c3MyLXV0aWwu
c288YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDC
oC4vbGliNjQvPGEgaHJlZj0iaHR0cDovL2xpYmxpYmMuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJl
ciIgdGFyZ2V0PSJfYmxhbmsiPmxpYmxpYmMuZHlsaWIuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKg
Jmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJsaWJjLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRh
cmdldD0iX2JsYW5rIj5odHRwOi8vbGlibGliYy5keWxpYi5zbzwvYT4mZ3Q7ICZsdDs8YSBocmVm
PSJodHRwOi8vbGlibGliYy5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFu
ayI+aHR0cDovL2xpYmxpYmMuZHlsaWIuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhy
ZWY9Imh0dHA6Ly9saWJsaWJjLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2Js
YW5rIj5odHRwOi8vbGlibGliYy5keWxpYi5zbzwvYT4mZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmxpYmMuZHls
aWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJsaWJjLmR5
bGliLnNvPC9hPiAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmxpYmMuZHlsaWIuc28iIHJlbD0ibm9y
ZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJsaWJjLmR5bGliLnNvPC9hPiZndDs8
YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmxpYmMuZHlsaWIuc28iIHJl
bD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJsaWJjLmR5bGliLnNvPC9h
PiAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmxpYmMuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIg
dGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJsaWJjLmR5bGliLnNvPC9hPiZndDsmZ3Q7Jmd0Ozxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9s
aWI2NC88YSBocmVmPSJodHRwOi8vbGlicHJvdG9idWYuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJl
ciIgdGFyZ2V0PSJfYmxhbmsiPmxpYnByb3RvYnVmLmR5bGliLnNvPC9hPjxicj4NCiZndDvCoCDC
oCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGlicHJvdG9idWYuZHlsaWIuc28iIHJlbD0ibm9yZWZl
cnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJwcm90b2J1Zi5keWxpYi5zbzwvYT4mZ3Q7
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDs8YSBocmVmPSJo
dHRwOi8vbGlicHJvdG9idWYuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxh
bmsiPmh0dHA6Ly9saWJwcm90b2J1Zi5keWxpYi5zbzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7
PGEgaHJlZj0iaHR0cDovL2xpYnByb3RvYnVmLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRh
cmdldD0iX2JsYW5rIj5odHRwOi8vbGlicHJvdG9idWYuZHlsaWIuc288L2E+Jmd0OyZndDsgJmx0
OzxhIGhyZWY9Imh0dHA6Ly9saWJwcm90b2J1Zi5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0
YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYnByb3RvYnVmLmR5bGliLnNvPC9hPjxicj4NCiZndDvC
oCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGlicHJvdG9idWYuZHlsaWIuc28iIHJlbD0ibm9y
ZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJwcm90b2J1Zi5keWxpYi5zbzwvYT4m
Z3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDs8YSBocmVm
PSJodHRwOi8vbGlicHJvdG9idWYuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJf
YmxhbmsiPmh0dHA6Ly9saWJwcm90b2J1Zi5keWxpYi5zbzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAm
bHQ7PGEgaHJlZj0iaHR0cDovL2xpYnByb3RvYnVmLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIi
IHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlicHJvdG9idWYuZHlsaWIuc288L2E+Jmd0OyZndDsm
Z3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAuL2xpYjY0LzxhIGhyZWY9Imh0dHA6Ly9saWJiaXRmbGFncy5keWxpYi5zbyIgcmVsPSJub3Jl
ZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+bGliYml0ZmxhZ3MuZHlsaWIuc288L2E+PGJyPg0KJmd0
O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJiaXRmbGFncy5keWxpYi5zbyIgcmVsPSJu
b3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmJpdGZsYWdzLmR5bGliLnNvPC9h
PiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmx0OzxhIGhy
ZWY9Imh0dHA6Ly9saWJiaXRmbGFncy5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9
Il9ibGFuayI+aHR0cDovL2xpYmJpdGZsYWdzLmR5bGliLnNvPC9hPjxicj4NCiZndDvCoCDCoCDC
oCZsdDs8YSBocmVmPSJodHRwOi8vbGliYml0ZmxhZ3MuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJl
ciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJiaXRmbGFncy5keWxpYi5zbzwvYT4mZ3Q7Jmd0
OyAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmJpdGZsYWdzLmR5bGliLnNvIiByZWw9Im5vcmVmZXJy
ZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGliYml0ZmxhZ3MuZHlsaWIuc288L2E+PGJyPg0K
Jmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJiaXRmbGFncy5keWxpYi5zbyIgcmVs
PSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmJpdGZsYWdzLmR5bGliLnNv
PC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmx0Ozxh
IGhyZWY9Imh0dHA6Ly9saWJiaXRmbGFncy5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJn
ZXQ9Il9ibGFuayI+aHR0cDovL2xpYmJpdGZsYWdzLmR5bGliLnNvPC9hPjxicj4NCiZndDvCoCDC
oCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGliYml0ZmxhZ3MuZHlsaWIuc28iIHJlbD0ibm9yZWZl
cnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJiaXRmbGFncy5keWxpYi5zbzwvYT4mZ3Q7
Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvC
oCDCoCDCoC4vbGliNjQvbGlidXRpbHMuc288YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvbGlianNvbmNwcC5zbzxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9saWI2NC9saWJl
eHQyX2Jsa2lkLWhvc3Quc288YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDvCoCDCoCDCoC4vbGliNjQvbGlibmwuc288YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvdHBtMi10c3MyLXN5cy5zbzxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9s
aWI2NC9saWJhcnRiYXNlLnNvPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0L2xpYnhtbDIuc288YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvPGEgaHJlZj0iaHR0cDov
L2xpYmttcl9wcm90b19ydXN0LmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2Js
YW5rIj5saWJrbXJfcHJvdG9fcnVzdC5keWxpYi5zbzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7
PGEgaHJlZj0iaHR0cDovL2xpYmttcl9wcm90b19ydXN0LmR5bGliLnNvIiByZWw9Im5vcmVmZXJy
ZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlia21yX3Byb3RvX3J1c3QuZHlsaWIuc288L2E+
Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJl
Zj0iaHR0cDovL2xpYmttcl9wcm90b19ydXN0LmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRh
cmdldD0iX2JsYW5rIj5odHRwOi8vbGlia21yX3Byb3RvX3J1c3QuZHlsaWIuc288L2E+PGJyPg0K
Jmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJrbXJfcHJvdG9fcnVzdC5keWxpYi5z
byIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmttcl9wcm90b19y
dXN0LmR5bGliLnNvPC9hPiZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGlia21yX3Byb3RvX3J1c3QuZHlsaWIuc28i
IHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJrbXJfcHJvdG9fcnVz
dC5keWxpYi5zbzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmtt
cl9wcm90b19ydXN0LmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5o
dHRwOi8vbGlia21yX3Byb3RvX3J1c3QuZHlsaWIuc288L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmttcl9wcm90
b19ydXN0LmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8v
bGlia21yX3Byb3RvX3J1c3QuZHlsaWIuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhy
ZWY9Imh0dHA6Ly9saWJrbXJfcHJvdG9fcnVzdC5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0
YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmttcl9wcm90b19ydXN0LmR5bGliLnNvPC9hPiZndDsm
Z3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8Kg
IMKgIMKgLi9saWI2NC9saWJjdXR0bGVmaXNoX3NlY3VyaXR5LnNvPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0LzxhIGhyZWY9Imh0
dHA6Ly9saWJzZWN1cmVfZW52X3RwbS5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9
Il9ibGFuayI+bGlic2VjdXJlX2Vudl90cG0uZHlsaWIuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKg
Jmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJzZWN1cmVfZW52X3RwbS5keWxpYi5zbyIgcmVsPSJub3Jl
ZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYnNlY3VyZV9lbnZfdHBtLmR5bGliLnNv
PC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmx0Ozxh
IGhyZWY9Imh0dHA6Ly9saWJzZWN1cmVfZW52X3RwbS5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVy
IiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYnNlY3VyZV9lbnZfdHBtLmR5bGliLnNvPC9hPjxi
cj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGlic2VjdXJlX2Vudl90cG0uZHls
aWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJzZWN1cmVf
ZW52X3RwbS5keWxpYi5zbzwvYT4mZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYnNlY3VyZV9lbnZfdHBtLmR5bGli
LnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlic2VjdXJlX2Vu
dl90cG0uZHlsaWIuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9s
aWJzZWN1cmVfZW52X3RwbS5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFu
ayI+aHR0cDovL2xpYnNlY3VyZV9lbnZfdHBtLmR5bGliLnNvPC9hPiZndDs8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJzZWN1
cmVfZW52X3RwbS5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0
cDovL2xpYnNlY3VyZV9lbnZfdHBtLmR5bGliLnNvPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDs8
YSBocmVmPSJodHRwOi8vbGlic2VjdXJlX2Vudl90cG0uZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJl
ciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJzZWN1cmVfZW52X3RwbS5keWxpYi5zbzwvYT4m
Z3Q7Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZn
dDvCoCDCoCDCoC4vbGliNjQvbGliei1ob3N0LnNvPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0L2xpYnByb2Nlc3Nncm91cC5zbzxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9s
aWI2NC9saWJjcnlwdG9fdXRpbHMuc288YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvPGEgaHJlZj0iaHR0cDovL2xpYmRlci5keWxp
Yi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+bGliZGVyLmR5bGliLnNvPC9h
Pjxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGliZGVyLmR5bGliLnNvIiBy
ZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGliZGVyLmR5bGliLnNvPC9h
PiZndDsgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJkZXIuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJl
ciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJkZXIuZHlsaWIuc288L2E+PGJyPg0KJmd0O8Kg
IMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJkZXIuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJl
ciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJkZXIuZHlsaWIuc288L2E+Jmd0OyZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6
Ly9saWJkZXIuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6
Ly9saWJkZXIuZHlsaWIuc288L2E+ICZsdDs8YSBocmVmPSJodHRwOi8vbGliZGVyLmR5bGliLnNv
IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGliZGVyLmR5bGliLnNv
PC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmRlci5keWxp
Yi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmRlci5keWxp
Yi5zbzwvYT4gJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJkZXIuZHlsaWIuc28iIHJlbD0ibm9yZWZl
cnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJkZXIuZHlsaWIuc288L2E+Jmd0OyZndDsm
Z3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAuL2xpYjY0L2xpYmRleGZpbGUuc288YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvY2ZfbWV0cmljc19wcm90by5zbzxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9saWI2NC90
cG0yLXRzczItZXN5cy5zbzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgJmd0O8KgIMKgIMKgLi9saWI2NC9saWJjdXR0bGVmaXNoX3V0aWxzLnNvPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0L2xpYmtl
eW1hc3Rlcl9wb3J0YWJsZS5zbzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgJmd0O8KgIMKgIMKgLi9saWI2NC9saWJmcnVpdC5zbzxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9saWI2NC90cG0yLXRzczItcmMu
c288YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDC
oC4vbGliNjQvbGliY2FwLnNvPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0LzxhIGhyZWY9Imh0dHA6Ly9saWJuaXguZHlsaWIuc28i
IHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmxpYm5peC5keWxpYi5zbzwvYT48YnI+
DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYm5peC5keWxpYi5zbyIgcmVsPSJu
b3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYm5peC5keWxpYi5zbzwvYT4mZ3Q7
ICZsdDs8YSBocmVmPSJodHRwOi8vbGlibml4LmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRh
cmdldD0iX2JsYW5rIj5odHRwOi8vbGlibml4LmR5bGliLnNvPC9hPjxicj4NCiZndDvCoCDCoCDC
oCZsdDs8YSBocmVmPSJodHRwOi8vbGlibml4LmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRh
cmdldD0iX2JsYW5rIj5odHRwOi8vbGlibml4LmR5bGliLnNvPC9hPiZndDsmZ3Q7PGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGli
bml4LmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGli
bml4LmR5bGliLnNvPC9hPiAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYm5peC5keWxpYi5zbyIgcmVs
PSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYm5peC5keWxpYi5zbzwvYT4m
Z3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJuaXguZHlsaWIuc28i
IHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJuaXguZHlsaWIuc288
L2E+ICZsdDs8YSBocmVmPSJodHRwOi8vbGlibml4LmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIi
IHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlibml4LmR5bGliLnNvPC9hPiZndDsmZ3Q7Jmd0Ozxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9s
aWI2NC9saWJpY3V1Yy1ob3N0LnNvPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0L2xpYnppcGFyY2hpdmUuc288YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvPGEgaHJl
Zj0iaHR0cDovL2xpYmttcl90YV9ub25zZWN1cmUuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIg
dGFyZ2V0PSJfYmxhbmsiPmxpYmttcl90YV9ub25zZWN1cmUuZHlsaWIuc288L2E+PGJyPg0KJmd0
O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJrbXJfdGFfbm9uc2VjdXJlLmR5bGliLnNv
IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlia21yX3RhX25vbnNl
Y3VyZS5keWxpYi5zbzwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGlia21yX3RhX25vbnNlY3VyZS5keWxpYi5zbyIg
cmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmttcl90YV9ub25zZWN1
cmUuZHlsaWIuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJr
bXJfdGFfbm9uc2VjdXJlLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5r
Ij5odHRwOi8vbGlia21yX3RhX25vbnNlY3VyZS5keWxpYi5zbzwvYT4mZ3Q7Jmd0Ozxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgJmx0OzxhIGhy
ZWY9Imh0dHA6Ly9saWJrbXJfdGFfbm9uc2VjdXJlLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIi
IHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlia21yX3RhX25vbnNlY3VyZS5keWxpYi5zbzwvYT48
YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmttcl90YV9ub25zZWN1cmUu
ZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJrbXJf
dGFfbm9uc2VjdXJlLmR5bGliLnNvPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJrbXJfdGFfbm9uc2VjdXJlLmR5
bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlia21yX3Rh
X25vbnNlY3VyZS5keWxpYi5zbzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0
cDovL2xpYmttcl90YV9ub25zZWN1cmUuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0
PSJfYmxhbmsiPmh0dHA6Ly9saWJrbXJfdGFfbm9uc2VjdXJlLmR5bGliLnNvPC9hPiZndDsmZ3Q7
Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKg
IMKgLi9saWI2NC88YSBocmVmPSJodHRwOi8vbGlic3RkLmR5bGliLnNvIiByZWw9Im5vcmVmZXJy
ZXIiIHRhcmdldD0iX2JsYW5rIj5saWJzdGQuZHlsaWIuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKg
Jmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJzdGQuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFy
Z2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJzdGQuZHlsaWIuc288L2E+Jmd0OyAmbHQ7PGEgaHJlZj0i
aHR0cDovL2xpYnN0ZC5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+
aHR0cDovL2xpYnN0ZC5keWxpYi5zbzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0i
aHR0cDovL2xpYnN0ZC5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+
aHR0cDovL2xpYnN0ZC5keWxpYi5zbzwvYT4mZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYnN0ZC5keWxpYi5zbyIg
cmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYnN0ZC5keWxpYi5zbzwv
YT4gJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJzdGQuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIg
dGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJzdGQuZHlsaWIuc288L2E+Jmd0Ozxicj4NCiZndDvC
oCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGlic3RkLmR5bGliLnNvIiByZWw9Im5vcmVmZXJy
ZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlic3RkLmR5bGliLnNvPC9hPiAmbHQ7PGEgaHJl
Zj0iaHR0cDovL2xpYnN0ZC5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFu
ayI+aHR0cDovL2xpYnN0ZC5keWxpYi5zbzwvYT4mZ3Q7Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvPGEgaHJlZj0i
aHR0cDovL2xpYmhhbGYuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsi
PmxpYmhhbGYuZHlsaWIuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6
Ly9saWJoYWxmLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRw
Oi8vbGliaGFsZi5keWxpYi5zbzwvYT4mZ3Q7ICZsdDs8YSBocmVmPSJodHRwOi8vbGliaGFsZi5k
eWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmhhbGYu
ZHlsaWIuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJoYWxm
LmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGliaGFs
Zi5keWxpYi5zbzwvYT4mZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmhhbGYuZHlsaWIuc28iIHJlbD0ibm9yZWZl
cnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJoYWxmLmR5bGliLnNvPC9hPiAmbHQ7PGEg
aHJlZj0iaHR0cDovL2xpYmhhbGYuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJf
YmxhbmsiPmh0dHA6Ly9saWJoYWxmLmR5bGliLnNvPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAm
bHQ7PGEgaHJlZj0iaHR0cDovL2xpYmhhbGYuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFy
Z2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJoYWxmLmR5bGliLnNvPC9hPiAmbHQ7PGEgaHJlZj0iaHR0
cDovL2xpYmhhbGYuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0
dHA6Ly9saWJoYWxmLmR5bGliLnNvPC9hPiZndDsmZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9saWI2NC90cG0yLXRzczItbXUu
c288YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDC
oC4vbGliNjQvPGEgaHJlZj0iaHR0cDovL2xpYm1lbW9mZnNldC5keWxpYi5zbyIgcmVsPSJub3Jl
ZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+bGlibWVtb2Zmc2V0LmR5bGliLnNvPC9hPjxicj4NCiZn
dDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGlibWVtb2Zmc2V0LmR5bGliLnNvIiByZWw9
Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlibWVtb2Zmc2V0LmR5bGliLnNv
PC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmx0Ozxh
IGhyZWY9Imh0dHA6Ly9saWJtZW1vZmZzZXQuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFy
Z2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJtZW1vZmZzZXQuZHlsaWIuc288L2E+PGJyPg0KJmd0O8Kg
IMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJtZW1vZmZzZXQuZHlsaWIuc28iIHJlbD0ibm9y
ZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJtZW1vZmZzZXQuZHlsaWIuc288L2E+
Jmd0OyZndDsgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJtZW1vZmZzZXQuZHlsaWIuc28iIHJlbD0i
bm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJtZW1vZmZzZXQuZHlsaWIuc288
L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJtZW1vZmZzZXQuZHls
aWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJtZW1vZmZz
ZXQuZHlsaWIuc288L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYm1lbW9mZnNldC5keWxpYi5zbyIgcmVsPSJub3Jl
ZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYm1lbW9mZnNldC5keWxpYi5zbzwvYT48
YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYm1lbW9mZnNldC5keWxpYi5z
byIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYm1lbW9mZnNldC5k
eWxpYi5zbzwvYT4mZ3Q7Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvbGlibHAuc288YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvbGliY3V0dGxlZmlz
aF9mcy5zbzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8Kg
IMKgIMKgLi9saWI2NC9saWJQcm94eUNvbmZpZy5zbzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9saWI2NC88YSBocmVmPSJodHRwOi8vbGli
b3BlbnNzbC5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+bGlib3Bl
bnNzbC5keWxpYi5zbzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xp
Ym9wZW5zc2wuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6
Ly9saWJvcGVuc3NsLmR5bGliLnNvPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJvcGVuc3NsLmR5bGliLnNvIiBy
ZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlib3BlbnNzbC5keWxpYi5z
bzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYm9wZW5zc2wuZHls
aWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJvcGVuc3Ns
LmR5bGliLnNvPC9hPiZndDsmZ3Q7ICZsdDs8YSBocmVmPSJodHRwOi8vbGlib3BlbnNzbC5keWxp
Yi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYm9wZW5zc2wu
ZHlsaWIuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJvcGVu
c3NsLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGli
b3BlbnNzbC5keWxpYi5zbzwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGlib3BlbnNzbC5keWxpYi5zbyIgcmVsPSJu
b3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYm9wZW5zc2wuZHlsaWIuc288L2E+
PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJvcGVuc3NsLmR5bGliLnNv
IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlib3BlbnNzbC5keWxp
Yi5zbzwvYT4mZ3Q7Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvPGEgaHJlZj0iaHR0cDovL2xpYmttcl93aXJlLmR5
bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5saWJrbXJfd2lyZS5keWxp
Yi5zbzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmttcl93aXJl
LmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlia21y
X3dpcmUuZHlsaWIuc288L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmttcl93aXJlLmR5bGliLnNvIiByZWw9Im5v
cmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlia21yX3dpcmUuZHlsaWIuc288L2E+
PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJrbXJfd2lyZS5keWxpYi5z
byIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmttcl93aXJlLmR5
bGliLnNvPC9hPiZndDsmZ3Q7ICZsdDs8YSBocmVmPSJodHRwOi8vbGlia21yX3dpcmUuZHlsaWIu
c28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJrbXJfd2lyZS5k
eWxpYi5zbzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmttcl93
aXJlLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGli
a21yX3dpcmUuZHlsaWIuc288L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmttcl93aXJlLmR5bGliLnNvIiByZWw9
Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlia21yX3dpcmUuZHlsaWIuc288
L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJrbXJfd2lyZS5keWxp
Yi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmttcl93aXJl
LmR5bGliLnNvPC9hPiZndDsmZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9saWI2NC88YSBocmVmPSJodHRwOi8vbGlia21yX2Ny
eXB0b19ib3JpbmcuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmxp
Ymttcl9jcnlwdG9fYm9yaW5nLmR5bGliLnNvPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBo
cmVmPSJodHRwOi8vbGlia21yX2NyeXB0b19ib3JpbmcuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJl
ciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJrbXJfY3J5cHRvX2JvcmluZy5keWxpYi5zbzwv
YT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDs8YSBo
cmVmPSJodHRwOi8vbGlia21yX2NyeXB0b19ib3JpbmcuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJl
ciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJrbXJfY3J5cHRvX2JvcmluZy5keWxpYi5zbzwv
YT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmttcl9jcnlwdG9fYm9y
aW5nLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGli
a21yX2NyeXB0b19ib3JpbmcuZHlsaWIuc288L2E+Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8v
bGlia21yX2NyeXB0b19ib3JpbmcuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJf
YmxhbmsiPmh0dHA6Ly9saWJrbXJfY3J5cHRvX2JvcmluZy5keWxpYi5zbzwvYT48YnI+DQomZ3Q7
wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmttcl9jcnlwdG9fYm9yaW5nLmR5bGliLnNv
IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlia21yX2NyeXB0b19i
b3JpbmcuZHlsaWIuc288L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmttcl9jcnlwdG9fYm9yaW5nLmR5bGliLnNv
IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlia21yX2NyeXB0b19i
b3JpbmcuZHlsaWIuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9s
aWJrbXJfY3J5cHRvX2JvcmluZy5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9i
bGFuayI+aHR0cDovL2xpYmttcl9jcnlwdG9fYm9yaW5nLmR5bGliLnNvPC9hPiZndDsmZ3Q7Jmd0
Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKg
Li9saWI2NC88YSBocmVmPSJodHRwOi8vbGlibG9nX3J1c3QuZHlsaWIuc28iIHJlbD0ibm9yZWZl
cnJlciIgdGFyZ2V0PSJfYmxhbmsiPmxpYmxvZ19ydXN0LmR5bGliLnNvPC9hPjxicj4NCiZndDvC
oCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGlibG9nX3J1c3QuZHlsaWIuc28iIHJlbD0ibm9y
ZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJsb2dfcnVzdC5keWxpYi5zbzwvYT4m
Z3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDs8YSBocmVm
PSJodHRwOi8vbGlibG9nX3J1c3QuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJf
YmxhbmsiPmh0dHA6Ly9saWJsb2dfcnVzdC5keWxpYi5zbzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAm
bHQ7PGEgaHJlZj0iaHR0cDovL2xpYmxvZ19ydXN0LmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIi
IHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlibG9nX3J1c3QuZHlsaWIuc288L2E+Jmd0OyZndDsg
Jmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJsb2dfcnVzdC5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVy
IiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmxvZ19ydXN0LmR5bGliLnNvPC9hPjxicj4NCiZn
dDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGlibG9nX3J1c3QuZHlsaWIuc28iIHJlbD0i
bm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJsb2dfcnVzdC5keWxpYi5zbzwv
YT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDs8YSBo
cmVmPSJodHRwOi8vbGlibG9nX3J1c3QuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0
PSJfYmxhbmsiPmh0dHA6Ly9saWJsb2dfcnVzdC5keWxpYi5zbzwvYT48YnI+DQomZ3Q7wqAgwqAg
wqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmxvZ19ydXN0LmR5bGliLnNvIiByZWw9Im5vcmVmZXJy
ZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlibG9nX3J1c3QuZHlsaWIuc288L2E+Jmd0OyZn
dDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAuL2xpYjY0L2xpYmhpZGxiYXNlLnNvPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0L2xpYmdycGNfd3JhcC5zbzxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9saWI2NC9s
aWJncnBjKytfdW5zZWN1cmUuc288YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvPGEgaHJlZj0iaHR0cDovL2xpYmJ5dGVzLmR5bGli
LnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5saWJieXRlcy5keWxpYi5zbzwv
YT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmJ5dGVzLmR5bGliLnNv
IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGliYnl0ZXMuZHlsaWIu
c288L2E+Jmd0OyAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmJ5dGVzLmR5bGliLnNvIiByZWw9Im5v
cmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGliYnl0ZXMuZHlsaWIuc288L2E+PGJy
Pg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJieXRlcy5keWxpYi5zbyIgcmVs
PSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmJ5dGVzLmR5bGliLnNvPC9h
PiZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDs8
YSBocmVmPSJodHRwOi8vbGliYnl0ZXMuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0
PSJfYmxhbmsiPmh0dHA6Ly9saWJieXRlcy5keWxpYi5zbzwvYT4gJmx0OzxhIGhyZWY9Imh0dHA6
Ly9saWJieXRlcy5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0
cDovL2xpYmJ5dGVzLmR5bGliLnNvPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJl
Zj0iaHR0cDovL2xpYmJ5dGVzLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2Js
YW5rIj5odHRwOi8vbGliYnl0ZXMuZHlsaWIuc288L2E+ICZsdDs8YSBocmVmPSJodHRwOi8vbGli
Ynl0ZXMuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9s
aWJieXRlcy5keWxpYi5zbzwvYT4mZ3Q7Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvbGlic29mdF9hdHRlc3RhdGlv
bl9jZXJ0LnNvPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAuL2xpYjY0L2xpYmN1dHRsZWZpc2hfcnVuX2N2ZF9wcm90by5zbzxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9saWI2NC9saWJi
aW5kZXIuc288YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvC
oCDCoCDCoC4vbGliNjQvbGliY3J5cHRvLWhvc3Quc288YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvbGlid2VibV9ta3ZtdXhlci5z
bzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKg
Li9saWI2NC88YSBocmVmPSJodHRwOi8vbGlia21yX2NmLmR5bGliLnNvIiByZWw9Im5vcmVmZXJy
ZXIiIHRhcmdldD0iX2JsYW5rIj5saWJrbXJfY2YuZHlsaWIuc288L2E+PGJyPg0KJmd0O8KgIMKg
IMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJrbXJfY2YuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJl
ciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJrbXJfY2YuZHlsaWIuc288L2E+Jmd0Ozxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDov
L2xpYmttcl9jZi5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0
cDovL2xpYmttcl9jZi5keWxpYi5zbzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0i
aHR0cDovL2xpYmttcl9jZi5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFu
ayI+aHR0cDovL2xpYmttcl9jZi5keWxpYi5zbzwvYT4mZ3Q7Jmd0OyAmbHQ7PGEgaHJlZj0iaHR0
cDovL2xpYmttcl9jZi5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+
aHR0cDovL2xpYmttcl9jZi5keWxpYi5zbzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJl
Zj0iaHR0cDovL2xpYmttcl9jZi5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9i
bGFuayI+aHR0cDovL2xpYmttcl9jZi5keWxpYi5zbzwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGlia21yX2NmLmR5
bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlia21yX2Nm
LmR5bGliLnNvPC9hPiAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmttcl9jZi5keWxpYi5zbyIgcmVs
PSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmttcl9jZi5keWxpYi5zbzwv
YT4mZ3Q7Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
ICZndDvCoCDCoCDCoC4vbGliNjQvPGEgaHJlZj0iaHR0cDovL2xpYmNpYm9yaXVtLmR5bGliLnNv
IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5saWJjaWJvcml1bS5keWxpYi5zbzwv
YT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmNpYm9yaXVtLmR5bGli
LnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGliY2lib3JpdW0u
ZHlsaWIuc288L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmNpYm9yaXVtLmR5bGliLnNvIiByZWw9Im5vcmVmZXJy
ZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGliY2lib3JpdW0uZHlsaWIuc288L2E+PGJyPg0K
Jmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJjaWJvcml1bS5keWxpYi5zbyIgcmVs
PSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmNpYm9yaXVtLmR5bGliLnNv
PC9hPiZndDsmZ3Q7ICZsdDs8YSBocmVmPSJodHRwOi8vbGliY2lib3JpdW0uZHlsaWIuc28iIHJl
bD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJjaWJvcml1bS5keWxpYi5z
bzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmNpYm9yaXVtLmR5
bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGliY2lib3Jp
dW0uZHlsaWIuc288L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmNpYm9yaXVtLmR5bGliLnNvIiByZWw9Im5vcmVm
ZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGliY2lib3JpdW0uZHlsaWIuc288L2E+PGJy
Pg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJjaWJvcml1bS5keWxpYi5zbyIg
cmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmNpYm9yaXVtLmR5bGli
LnNvPC9hPiZndDsmZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgJmd0O8KgIMKgIMKgLi9saWI2NC9saWJwdXJlc29mdGtleW1hc3RlcmRldmljZV9ob3N0
LnNvPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAuL2xpYjY0LzxhIGhyZWY9Imh0dHA6Ly9saWJ4NTA5X2NlcnQuZHlsaWIuc28iIHJlbD0ibm9y
ZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmxpYng1MDlfY2VydC5keWxpYi5zbzwvYT48YnI+DQom
Z3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYng1MDlfY2VydC5keWxpYi5zbyIgcmVs
PSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYng1MDlfY2VydC5keWxpYi5z
bzwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDs8
YSBocmVmPSJodHRwOi8vbGlieDUwOV9jZXJ0LmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRh
cmdldD0iX2JsYW5rIj5odHRwOi8vbGlieDUwOV9jZXJ0LmR5bGliLnNvPC9hPjxicj4NCiZndDvC
oCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGlieDUwOV9jZXJ0LmR5bGliLnNvIiByZWw9Im5v
cmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlieDUwOV9jZXJ0LmR5bGliLnNvPC9h
PiZndDsmZ3Q7ICZsdDs8YSBocmVmPSJodHRwOi8vbGlieDUwOV9jZXJ0LmR5bGliLnNvIiByZWw9
Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlieDUwOV9jZXJ0LmR5bGliLnNv
PC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGlieDUwOV9jZXJ0LmR5
bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlieDUwOV9j
ZXJ0LmR5bGliLnNvPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJ4NTA5X2NlcnQuZHlsaWIuc28iIHJlbD0ibm9y
ZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJ4NTA5X2NlcnQuZHlsaWIuc288L2E+
PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJ4NTA5X2NlcnQuZHlsaWIu
c28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJ4NTA5X2NlcnQu
ZHlsaWIuc288L2E+Jmd0OyZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0LzxhIGhyZWY9Imh0dHA6Ly9saWJzZWMxLmR5
bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5saWJzZWMxLmR5bGliLnNv
PC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGlic2VjMS5keWxpYi5z
byIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYnNlYzEuZHlsaWIu
c288L2E+Jmd0OyAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYnNlYzEuZHlsaWIuc28iIHJlbD0ibm9y
ZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJzZWMxLmR5bGliLnNvPC9hPjxicj4N
CiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGlic2VjMS5keWxpYi5zbyIgcmVsPSJu
b3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYnNlYzEuZHlsaWIuc288L2E+Jmd0
OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmx0OzxhIGhy
ZWY9Imh0dHA6Ly9saWJzZWMxLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2Js
YW5rIj5odHRwOi8vbGlic2VjMS5keWxpYi5zbzwvYT4gJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJz
ZWMxLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGli
c2VjMS5keWxpYi5zbzwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6
Ly9saWJzZWMxLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRw
Oi8vbGlic2VjMS5keWxpYi5zbzwvYT4gJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJzZWMxLmR5bGli
LnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlic2VjMS5keWxp
Yi5zbzwvYT4mZ3Q7Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgICZndDvCoCDCoCDCoC4vbmF0aXZldGVzdDY0Lzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9uYXRpdmV0ZXN0NjQvbW9kZW1fc2lt
dWxhdG9yX3Rlc3QvPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAm
Z3Q7wqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAuL25hdGl2ZXRlc3Q2NC9tb2RlbV9zaW11bGF0
b3JfdGVzdC9tb2RlbV9zaW11bGF0b3JfdGVzdDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9uYXRpdmV0ZXN0NjQvY3V0dGxlZmlzaF9uZXRf
dGVzdHMvPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAg
wqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAuL25hdGl2ZXRlc3Q2NC9jdXR0bGVmaXNoX25ldF90ZXN0
cy9jdXR0bGVmaXNoX25ldF90ZXN0czxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9ldGMvPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2V0Yy9tb2RlbV9zaW11bGF0b3IvPGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2V0Yy9tb2Rl
bV9zaW11bGF0b3IvZmlsZXMvPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoDxicj4N
CiZndDvCoCDCoCDCoCDCoC4vZXRjL21vZGVtX3NpbXVsYXRvci9maWxlcy9pY2Nwcm9maWxlX2Zv
cl9zaW0wX2Zvcl9DdHNDYXJyaWVyQXBpVGVzdENhc2VzLnhtbDxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKgLi9l
dGMvbW9kZW1fc2ltdWxhdG9yL2ZpbGVzL2ljY3Byb2ZpbGVfZm9yX3NpbTAueG1sPGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2V0Yy9tb2Rl
bV9zaW11bGF0b3IvZmlsZXMvbnVtZXJpY19vcGVyYXRvci54bWw8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vZXRjL2N2ZF9yc2E0MDk2LmF2
YnB1YmtleTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8Kg
IMKgIMKgLi9ldGMvYm9vdGxvYWRlcl9hYXJjaDY0Lzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9ldGMvYm9vdGxvYWRlcl9hYXJjaDY0L2Jv
b3Rsb2FkZXIucWVtdTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
Jmd0O8KgIMKgIMKgLi9ldGMvYm9vdGxvYWRlcl9hYXJjaDY0L2Jvb3Rsb2FkZXIuY3Jvc3ZtPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2V0
Yy9ib290bG9hZGVyX3Jpc2N2NjQvPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2V0Yy9ib290bG9hZGVyX3Jpc2N2NjQvYm9vdGxvYWRlci5x
ZW11PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAuL2V0Yy9hdXRvbW90aXZlLzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgJmd0O8KgIMKgIMKgLi9ldGMvYXV0b21vdGl2ZS92aGFsY29uZmlnLzxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAuL2V0Yy9hdXRvbW90
aXZlL3ZoYWxjb25maWcvVmVuZG9yQ2x1c3RlclRlc3RQcm9wZXJ0aWVzLmpzb248YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vZXRjL2F1dG9t
b3RpdmUvdmhhbGNvbmZpZy9EZWZhdWx0UHJvcGVydGllcy5qc29uPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2V0Yy9hdXRvbW90aXZlL3Zo
YWxjb25maWcvVGVzdFByb3BlcnRpZXMuanNvbjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9ldGMvYXV0b21vdGl2ZS9wcm94eV9jb25maWcu
anNvbjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKg
IMKgLi9ldGMvY3ZkX3JzYTIwNDguYXZicHVia2V5PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2V0Yy9jdmRfYXZiX3Rlc3RrZXlfcnNhNDA5
Ni5wZW08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDC
oCDCoC4vZXRjL2Jvb3Rsb2FkZXJfYXJtLzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9ldGMvYm9vdGxvYWRlcl9hcm0vYm9vdGxvYWRlci5x
ZW11PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAuL2V0Yy9ib290bG9hZGVyX3g4Nl82NC88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vZXRjL2Jvb3Rsb2FkZXJfeDg2XzY0L2Jvb3Rsb2Fk
ZXIucWVtdTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8Kg
IMKgIMKgLi9ldGMvYm9vdGxvYWRlcl94ODZfNjQvYm9vdGxvYWRlci5jcm9zdm08YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vZXRjL2N2ZF9h
dmJfdGVzdGtleV9yc2EyMDQ4LnBlbTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9ldGMvb3BlbndydC88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vZXRjL29wZW53cnQvaW1hZ2VzLzxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9l
dGMvb3BlbndydC9pbWFnZXMvb3BlbndydF9rZXJuZWxfYWFyY2g2NDxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9ldGMvb3BlbndydC9pbWFn
ZXMvb3BlbndydF9yb290ZnNfeDg2XzY0PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2V0Yy9vcGVud3J0L2ltYWdlcy9vcGVud3J0X3Jvb3Rm
c19hYXJjaDY0PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAuL2V0Yy9vcGVud3J0L2ltYWdlcy9vcGVud3J0X2tlcm5lbF94ODZfNjQ8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vZXRjL2N2
ZF9jb25maWcvPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAuL2V0Yy9jdmRfY29uZmlnL2N2ZF9jb25maWdfdHYuanNvbjxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9ldGMvY3ZkX2NvbmZp
Zy9jdmRfY29uZmlnX3RhYmxldC5qc29uPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2V0Yy9jdmRfY29uZmlnL2N2ZF9jb25maWdfd2Vhci5q
c29uPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAuL2V0Yy9jdmRfY29uZmlnL2N2ZF9jb25maWdfYXV0b19wb3J0cmFpdC5qc29uPGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2V0Yy9jdmRf
Y29uZmlnL2N2ZF9jb25maWdfc2xpbS5qc29uPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2V0Yy9jdmRfY29uZmlnL2N2ZF9jb25maWdfZ28u
anNvbjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKg
IMKgLi9ldGMvY3ZkX2NvbmZpZy9jdmRfY29uZmlnX2ZvbGRhYmxlLmpzb248YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vZXRjL2N2ZF9jb25m
aWcvY3ZkX2NvbmZpZ19hdXRvLmpzb248YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDvCoCDCoCDCoC4vZXRjL2N2ZF9jb25maWcvY3ZkX2NvbmZpZ19hdXRvX21k
Lmpzb248YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDC
oCDCoC4vZXRjL2N2ZF9jb25maWcvY3ZkX2NvbmZpZ19waG9uZS5qc29uPGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL3Vzci88YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vdXNyL3NoYXJl
Lzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKg
Li91c3Ivc2hhcmUvdnVsa2FuLzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgJmd0O8KgIMKgIMKgLi91c3Ivc2hhcmUvdnVsa2FuL2ljZC5kLzxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi91c3Ivc2hhcmUvdnVs
a2FuL2ljZC5kL3ZrX3N3aWZ0c2hhZGVyX2ljZC5qc29uPGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL3Vzci9zaGFyZS9xZW11Lzxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi91c3Ivc2hh
cmUvcWVtdS9hYXJjaDY0LWxpbnV4LWdudS88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKgLi91c3Ivc2hhcmUvcWVtdS9hYXJjaDY0LWxpbnV4LWdu
dS9vcGVuc2JpLXJpc2N2NjQtZ2VuZXJpYy1md19keW5hbWljLmJpbjxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi91c3Ivc2hhcmUvcWVtdS9h
YXJjaDY0LWxpbnV4LWdudS9lZmktdmlydGlvLnJvbTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi91c3Ivc2hhcmUvcWVtdS9hYXJjaDY0LWxp
bnV4LWdudS9rZXltYXBzLzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgJmd0O8KgIMKgIMKgLi91c3Ivc2hhcmUvcWVtdS9hYXJjaDY0LWxpbnV4LWdudS9rZXltYXBz
L2VuLXVzPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAuL3Vzci9zaGFyZS93ZWJydGMvPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL3Vzci9zaGFyZS93ZWJydGMvYXNzZXRzLzxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi91c3Ivc2hh
cmUvd2VicnRjL2Fzc2V0cy9zdHlsZS5jc3M8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vdXNyL3NoYXJlL3dlYnJ0Yy9hc3NldHMvaW5kZXgu
Y3NzPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAuL3Vzci9zaGFyZS93ZWJydGMvYXNzZXRzL2luZGV4Lmh0bWw8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vdXNyL3NoYXJlL3dlYnJ0Yy9h
c3NldHMvanMvPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAuL3Vzci9zaGFyZS93ZWJydGMvYXNzZXRzL2pzL2xvY2F0aW9uLmpzPGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL3Vzci9zaGFy
ZS93ZWJydGMvYXNzZXRzL2pzL3Jvb3RjYW5hbC5qczxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi91c3Ivc2hhcmUvd2VicnRjL2Fzc2V0cy9q
cy9hcHAuanM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvC
oCDCoCDCoC4vdXNyL3NoYXJlL3dlYnJ0Yy9hc3NldHMvanMvdG91Y2guanM8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vdXNyL3NoYXJlL3dl
YnJ0Yy9hc3NldHMvanMvYWRiLmpzPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL3Vzci9zaGFyZS93ZWJydGMvYXNzZXRzL2pzL2luZGV4Lmpz
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAu
L3Vzci9zaGFyZS93ZWJydGMvYXNzZXRzL2pzL2NmX3dlYnJ0Yy5qczxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi91c3Ivc2hhcmUvd2VicnRj
L2Fzc2V0cy9qcy9zZXJ2ZXJfY29ubmVjdG9yLmpzPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL3Vzci9zaGFyZS93ZWJydGMvYXNzZXRzL2pz
L2NvbnRyb2xzLmpzPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAuL3Vzci9zaGFyZS93ZWJydGMvYXNzZXRzL2NvbnRyb2xzLmNzczxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi91c3Ivc2hh
cmUvd2VicnRjL2Fzc2V0cy9jdXN0b20uY3NzPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL3Vzci9zaGFyZS93ZWJydGMvYXNzZXRzL2NsaWVu
dC5odG1sPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAuL3Vzci9zaGFyZS93ZWJydGMvY2VydHMvPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL3Vzci9zaGFyZS93ZWJydGMvY2VydHMvc2Vy
dmVyLnAxMjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8Kg
IMKgIMKgLi91c3Ivc2hhcmUvd2VicnRjL2NlcnRzL3NlcnZlci5rZXk8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vdXNyL3NoYXJlL3dlYnJ0
Yy9jZXJ0cy90cnVzdGVkLnBlbTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgJmd0O8KgIMKgIMKgLi91c3Ivc2hhcmUvd2VicnRjL2NlcnRzL3NlcnZlci5jcnQ8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vdXNy
L3NoYXJlL3pvbmVpbmZvLzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgJmd0O8KgIMKgIMKgLi91c3Ivc2hhcmUvem9uZWluZm8vdHpkYXRhPGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL3Vzci9zaGFyZS9jcm9z
dm0vPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAuL3Vzci9zaGFyZS9jcm9zdm0vYWFyY2g2NC1saW51eC1nbnUvPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL3Vzci9zaGFyZS9jcm9zdm0v
YWFyY2g2NC1saW51eC1nbnUvc2VjY29tcC88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKgLi91c3Ivc2hhcmUvY3Jvc3ZtL2FhcmNoNjQtbGludXgt
Z251L3NlY2NvbXAvc25kX251bGxfZGV2aWNlLnBvbGljeTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAuL3Vzci9zaGFyZS9jcm9zdm0vYWFyY2g2
NC1saW51eC1nbnUvc2VjY29tcC9ncHVfcmVuZGVyX3NlcnZlci5wb2xpY3k8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKgLi91c3Ivc2hhcmUvY3Jv
c3ZtL2FhcmNoNjQtbGludXgtZ251L3NlY2NvbXAvYmF0dGVyeS5wb2xpY3k8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKgLi91c3Ivc2hhcmUvY3Jv
c3ZtL2FhcmNoNjQtbGludXgtZ251L3NlY2NvbXAvYmxvY2tfZGV2aWNlLnBvbGljeTxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAuL3Vzci9zaGFy
ZS9jcm9zdm0vYWFyY2g2NC1saW51eC1nbnUvc2VjY29tcC9wbWVtX2RldmljZS5wb2xpY3k8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKgLi91c3Iv
c2hhcmUvY3Jvc3ZtL2FhcmNoNjQtbGludXgtZ251L3NlY2NvbXAvd2xfZGV2aWNlLnBvbGljeTxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAuL3Vz
ci9zaGFyZS9jcm9zdm0vYWFyY2g2NC1saW51eC1nbnUvc2VjY29tcC85cF9kZXZpY2UucG9saWN5
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDCoC4v
dXNyL3NoYXJlL2Nyb3N2bS9hYXJjaDY0LWxpbnV4LWdudS9zZWNjb21wL2lucHV0X2RldmljZS5w
b2xpY3k8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgPGJyPg0KJmd0O8KgIMKgIMKg
IMKgLi91c3Ivc2hhcmUvY3Jvc3ZtL2FhcmNoNjQtbGludXgtZ251L3NlY2NvbXAvbmV0X2Rldmlj
ZS5wb2xpY3k8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgPGJyPg0KJmd0O8KgIMKg
IMKgIMKgLi91c3Ivc2hhcmUvY3Jvc3ZtL2FhcmNoNjQtbGludXgtZ251L3NlY2NvbXAvcm5nX2Rl
dmljZS5wb2xpY3k8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZn
dDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgPGJyPg0KJmd0O8Kg
IMKgIMKgIMKgLi91c3Ivc2hhcmUvY3Jvc3ZtL2FhcmNoNjQtbGludXgtZ251L3NlY2NvbXAvY29p
b21tdV9kZXZpY2UucG9saWN5PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoDxicj4N
CiZndDvCoCDCoCDCoCDCoC4vdXNyL3NoYXJlL2Nyb3N2bS9hYXJjaDY0LWxpbnV4LWdudS9zZWNj
b21wL2dwdV9kZXZpY2UucG9saWN5PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoDxi
cj4NCiZndDvCoCDCoCDCoCDCoC4vdXNyL3NoYXJlL2Nyb3N2bS9hYXJjaDY0LWxpbnV4LWdudS9z
ZWNjb21wL3NlcmlhbF9kZXZpY2UucG9saWN5PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoDxicj4NCiZndDvCoCDCoCDCoCDCoC4vdXNyL3NoYXJlL2Nyb3N2bS9hYXJjaDY0LWxpbnV4
LWdudS9zZWNjb21wL2NyYXNfYXVkaW9fZGV2aWNlLnBvbGljeTxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAuL3Vzci9zaGFyZS9jcm9zdm0vYWFy
Y2g2NC1saW51eC1nbnUvc2VjY29tcC9udWxsX2F1ZGlvX2RldmljZS5wb2xpY3k8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKgLi91c3Ivc2hhcmUv
Y3Jvc3ZtL2FhcmNoNjQtbGludXgtZ251L3NlY2NvbXAvc25kX2NyYXNfZGV2aWNlLnBvbGljeTxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAuL3Vz
ci9zaGFyZS9jcm9zdm0vYWFyY2g2NC1saW51eC1nbnUvc2VjY29tcC92aG9zdF9zY21pX2Rldmlj
ZS5wb2xpY3k8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgPGJyPg0KJmd0O8KgIMKg
IMKgIMKgLi91c3Ivc2hhcmUvY3Jvc3ZtL2FhcmNoNjQtbGludXgtZ251L3NlY2NvbXAvYmFsbG9v
bl9kZXZpY2UucG9saWN5PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoDxicj4NCiZn
dDvCoCDCoCDCoCDCoC4vdXNyL3NoYXJlL2Nyb3N2bS9hYXJjaDY0LWxpbnV4LWdudS9zZWNjb21w
L3Zob3N0X25ldF9kZXZpY2UucG9saWN5PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oDxicj4NCiZndDvCoCDCoCDCoCDCoC4vdXNyL3NoYXJlL2Nyb3N2bS9hYXJjaDY0LWxpbnV4LWdu
dS9zZWNjb21wL3Zob3N0X3Zzb2NrX2RldmljZS5wb2xpY3k8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKgLi91c3Ivc2hhcmUvY3Jvc3ZtL2FhcmNo
NjQtbGludXgtZ251L3NlY2NvbXAvZnNfZGV2aWNlLnBvbGljeTxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAuL3Vzci9zaGFyZS9jcm9zdm0vYWFy
Y2g2NC1saW51eC1nbnUvc2VjY29tcC92aWRlb19kZXZpY2UucG9saWN5PGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDCoC4vdXNyL3NoYXJlL2Nyb3N2
bS9hYXJjaDY0LWxpbnV4LWdudS9zZWNjb21wL3hoY2lfZGV2aWNlLnBvbGljeTxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAuL3Vzci9zaGFyZS9j
cm9zdm0vYWFyY2g2NC1saW51eC1nbnUvc2VjY29tcC92aW9zX2F1ZGlvX2RldmljZS5wb2xpY3k8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4v
YmluLzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKg
IMKgLi9iaW4vbW9kZW1fc2ltdWxhdG9yPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9tcy10cG0tMjAtcmVmPGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9ta2VudmltYWdl
X3NsaW08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDC
oCDCoC4vYmluL21ldHJpY3M8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDvCoCDCoCDCoC4vYmluL3NvY2tldF92c29ja19wcm94eTxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vcmVzaXplLmYyZnM8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4v
YmluL21ldHJpY3NfbGF1bmNoZXI8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgICZndDvCoCDCoCDCoC4vYmluL2F1dG9tb3RpdmVfdnNvY2tfcHJveHk8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL25ld2Zz
X21zZG9zPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAuL2Jpbi9uZXRzaW0tdWkvPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9uZXRzaW0tdWkvYXNzZXRzLzxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vbmV0c2ltLXVp
L2Fzc2V0cy9ncmlkLWJhY2tncm91bmQuc3ZnPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9uZXRzaW0tdWkvYXNzZXRzL25ldHNpbS1s
b2dvLnN2Zzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8Kg
IMKgIMKgLi9iaW4vbmV0c2ltLXVpL2Fzc2V0cy9wb2xhci1iYWNrZ3JvdW5kLnN2Zzxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vbmV0
c2ltLXVpL2Fzc2V0cy9oZXhhZ29uYWwtYmFja2dyb3VuZC5wbmc8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL25ldHNpbS11aS9hc3Nl
dHMvbmV0c2ltLWxvZ28tYi5zdmc8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgICZndDvCoCDCoCDCoC4vYmluL25ldHNpbS11aS9ub2RlX21vZHVsZXMvPGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9uZXRz
aW0tdWkvbm9kZV9tb2R1bGVzL3RzbGliLzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vbmV0c2ltLXVpL25vZGVfbW9kdWxlcy90c2xp
Yi90c2xpYi5lczYuanM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
ICZndDvCoCDCoCDCoC4vYmluL25ldHNpbS11aS9pbmRleC5odG1sPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9uZXRzaW0tdWkvanMv
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAu
L2Jpbi9uZXRzaW0tdWkvanMvZGV2aWNlLWluZm8uanM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL25ldHNpbS11aS9qcy9kZXZpY2Ut
bGlzdC5qczxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8Kg
IMKgIMKgLi9iaW4vbmV0c2ltLXVpL2pzL3BhY2tldC1pbmZvLmpzPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9uZXRzaW0tdWkvanMv
ZGV2aWNlLWRyb3B6b25lLmpzPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9uZXRzaW0tdWkvanMvbmF2aWdhdGlvbi1iYXIuanM8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmlu
L25ldHNpbS11aS9qcy9kZXZpY2UtbWFwLmpzPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9uZXRzaW0tdWkvanMvZGV2aWNlLWRyYWd6
b25lLmpzPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAuL2Jpbi9uZXRzaW0tdWkvanMvbmV0c2ltLWFwcC5qczxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vbmV0c2ltLXVpL2pzL2N1
c3RvbWl6ZS1tYXAtYnV0dG9uLmpzPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9uZXRzaW0tdWkvanMvZGV2aWNlLW9ic2VydmVyLmpz
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAu
L2Jpbi9uZXRzaW0tdWkvanMvbGljZW5zZS1pbmZvLmpzPGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9uZXRzaW0tdWkvanMvY3ViZS1z
cHJpdGUuanM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvC
oCDCoCDCoC4vYmluL25ldHNpbS11aS9qcy9weXJhbWlkLXNwcml0ZS5qczxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vdW5wYWNrX2Jv
b3RpbWc8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDC
oCDCoC4vYmluL2FkYjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
Jmd0O8KgIMKgIMKgLi9iaW4vZXh0cmFjdC12bWxpbnV4PGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9oZWFsdGg8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL3NjcmVlbl9y
ZWNvcmRpbmdfc2VydmVyPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAuL2Jpbi9sejQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL3dtZWRpdW1kX2dlbl9jb25maWc8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL2duc3Nf
Z3JwY19wcm94eTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0
O8KgIMKgIMKgLi9iaW4vc2ltZzJpbWc8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL3NlY3VyZV9lbnY8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL21rZTJmczxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vc25h
cHNob3RfdXRpbF9jdmQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
ICZndDvCoCDCoCDCoC4vYmluL2N2ZF9pbnRlcm5hbF9kaXNwbGF5PGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9hY2xvdWRfdHJhbnNs
YXRvcjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKg
IMKgLi9iaW4vZGVmcmFnLmYyZnM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgICZndDvCoCDCoCDCoC4vYmluL3RvbWJzdG9uZV9yZWNlaXZlcjxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vcm9vdC1jYW5h
bDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKg
Li9iaW4vbmV0c2ltZDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
Jmd0O8KgIMKgIMKgLi9iaW4vY29uc29sZV9mb3J3YXJkZXI8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL3Bvd2Vyd2FzaF9jdmQ8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmlu
L3Byb2Nlc3NfcmVzdGFydGVyPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9mc2NrLmYyZnM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL2N2ZF9ob3N0X2J1Z3JlcG9ydDxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9i
aW4vZXh0cmFjdC1pa2NvbmZpZzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vY3ZkX2ludGVybmFsX3N0YXR1czxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vd2ViUlRDPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jp
bi9hY2xvdWQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvC
oCDCoCDCoC4vYmluL3RjcF9jb25uZWN0b3I8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL3Byb2Nlc3Nfc2FuZGJveGVyPGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi93ZWJy
dGNfb3BlcmF0b3I8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZn
dDvCoCDCoCDCoC4vYmluL2N2ZF91cGRhdGVfbG9jYXRpb248YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL2UyZnNkcm9pZDxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vYXZi
dG9vbDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKg
IMKgLi9iaW4vZmFzdGJvb3Q8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDvCoCDCoCDCoC4vYmluL2J1aWxkX3N1cGVyX2ltYWdlPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9wb3dlcmJ0bl9jdmQ8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4v
YmluL2FsbG9jZF9jbGllbnQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDvCoCDCoCDCoC4vYmluL2R1bXAuZjJmczxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vbmV0c2ltPGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9jYXNpbWlyPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jp
bi9waWNhPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAuL2Jpbi9jdmRfdXBkYXRlX3NlY3VyaXR5X2FsZ29yaXRobTxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vcmVjb3JkX2N2ZDxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9i
aW4vdmhhbF9wcm94eV9zZXJ2ZXI8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgICZndDvCoCDCoCDCoC4vYmluL2N2ZF9zdGF0dXM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL2N2ZF9pbXBvcnRfbG9jYXRp
b25zPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAuL2Jpbi9sYXVuY2hfY3ZkPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9jdmRfaW50ZXJuYWxfc3RhcnQ8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL3Jlc3RhcnRfY3Zk
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAu
L2Jpbi9jdmRfaW50ZXJuYWxfaG9zdF9idWdyZXBvcnQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL21rdXNlcmltZ19ta2UyZnM8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmlu
L2ZlYzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKg
IMKgLi9iaW4vY3ZkX2ludGVybmFsX2Vudjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vdmhvc3RfZGV2aWNlX3Zzb2NrPGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9jdmRf
aW50ZXJuYWxfc3RvcDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
Jmd0O8KgIMKgIMKgLi9iaW4vY3ZkX3NlbmRfc21zPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9hc3NlbWJsZV9jdmQ8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL2N2ZF9z
ZW5kX2lkX2Rpc2Nsb3N1cmU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDvCoCDCoCDCoC4vYmluL21jb3B5PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9vcGVyYXRvcl9wcm94eTxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vbWtib290
ZnM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDC
oC4vYmluL3J1bl9jdmQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
ICZndDvCoCDCoCDCoC4vYmluL29wZW53cnRfY29udHJvbF9zZXJ2ZXI8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL21rYm9vdGltZzxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9i
aW4va2VybmVsX2xvZ19tb25pdG9yPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9tbWQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL3RveWJveDxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vY3Jvc3ZtPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9h
YXJjaDY0LWxpbnV4LW11c2wvPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9hYXJjaDY0LWxpbnV4LW11c2wvY3Jvc3ZtPGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9zZWZj
b250ZXh0X2NvbXBpbGU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
ICZndDvCoCDCoCDCoC4vYmluL3dtZWRpdW1kPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9lY2hvX3NlcnZlcjxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vbG9nX3RlZTxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9i
aW4vbHBtYWtlPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAuL2Jpbi9sb2djYXRfcmVjZWl2ZXI8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL2xwdW5wYWNrPGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9jb250cm9sX2Vu
dl9wcm94eV9zZXJ2ZXI8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
ICZndDvCoCDCoCDCoC4vYmluL210b29sczxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vYWRiX2Nvbm5lY3Rvcjxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vYWFyY2g2NC1s
aW51eC1nbnUvPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAuL2Jpbi9hYXJjaDY0LWxpbnV4LWdudS9saWJlcG94eS5zby4wPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9hYXJjaDY0
LWxpbnV4LWdudS9saWJmZmkuc28uNzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vYWFyY2g2NC1saW51eC1nbnUvcWVtdS88YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL2Fh
cmNoNjQtbGludXgtZ251L3FlbXUvcWVtdS1zeXN0ZW0teDg2XzY0PGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9hYXJjaDY0LWxpbnV4
LWdudS9xZW11L2xpYmVwb3h5LnNvLjA8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL2FhcmNoNjQtbGludXgtZ251L3FlbXUvbGlidmly
Z2xyZW5kZXJlci5zby4xPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAuL2Jpbi9hYXJjaDY0LWxpbnV4LWdudS9xZW11L2xpYmdibS5zby4xPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqA8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAuL2Jpbi9hYXJjaDY0LWxpbnV4LWdudS9xZW11L2xpYmdmeHN0cmVhbV9i
YWNrZW5kLnNvLjA8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZn
dDvCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDCoC4vYmluL2FhcmNoNjQtbGludXgtZ251L3FlbXUv
bGlicnV0YWJhZ2FfZ2Z4X2ZmaS5zby4wPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9hYXJjaDY0LWxpbnV4LWdudS9xZW11L3FlbXUt
c3lzdGVtLXJpc2N2NjQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
ICZndDvCoCDCoCDCoC4vYmluL2FhcmNoNjQtbGludXgtZ251L3FlbXUvcWVtdS1zeXN0ZW0tYWFy
Y2g2NDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKg
IMKgLi9iaW4vYWFyY2g2NC1saW51eC1nbnUvcWVtdS9saWJjKysuc28uMTxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vYWFyY2g2NC1s
aW51eC1nbnUvcWVtdS9saWJ1bndpbmQuc28uMTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vYWFyY2g2NC1saW51eC1nbnUvcWVtdS9s
aWJ6LnNvLjE8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvC
oCDCoCDCoC4vYmluL2FhcmNoNjQtbGludXgtZ251L3FlbXUvbGliYysrYWJpLnNvLjE8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL2Fh
cmNoNjQtbGludXgtZ251L2xpYnZpcmdscmVuZGVyZXIuc28uMTxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vYWFyY2g2NC1saW51eC1n
bnUvbGliZHJtLnNvLjI8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
ICZndDvCoCDCoCDCoC4vYmluL2FhcmNoNjQtbGludXgtZ251L2xpYmdibS5zby4xPGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9hYXJj
aDY0LWxpbnV4LWdudS9saWJnZnhzdHJlYW1fYmFja2VuZC5zbzxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vYWFyY2g2NC1saW51eC1n
bnUvbGlid2F5bGFuZC1jbGllbnQuc28uMDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vYWFyY2g2NC1saW51eC1nbnUvbGlibWluaWph
aWwuc288YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDC
oDxicj4NCiZndDvCoCDCoCDCoCDCoC4vYmluL2FhcmNoNjQtbGludXgtZ251L2dmeHN0cmVhbV9n
cmFwaGljc19kZXRlY3Rvcjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgJmd0O8KgIMKgIMKgLi9iaW4vYWFyY2g2NC1saW51eC1nbnUvY3Jvc3ZtPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9scGFkZDxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9i
aW4vbWFrZV9mMmZzPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAuL2Jpbi9zYW5kYm94ZXJfcHJveHk8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL3N0b3BfY3ZkPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9jYXNpbWly
X2NvbnRyb2xfc2VydmVyPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDCoHppb21h
cmlvQFozOTAtQU9SVVMtUFJPLURFU1Q6L21udC96cm9vdC0xMzMvX09TL0FuZHJvaWQvYW9zcF8x
NC9hbmRyb2lkLWltYWdlJCBIT01FPSQocHdkKSAuL2Jpbi9sYXVuY2hfY3ZkIC12bV9tYW5hZ2Vy
IHFlbXVfY2xpIC1yZXBvcnRfYW5vbnltb3VzX3VzYWdlX3N0YXRzPW4gLS1zdGFydF93ZWJydGM9
ZmFsc2U8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoDA5LTAyIDIzOjI3OjEw
LjQ3MyAyNzI5OTkwIDI3Mjk5OTAgSSBsYXVuY2hfY3ZkOjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqBtYWluLmNjOjIzNSBVc2luZzxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgc3lzdGVtX2ltYWdlX2RpciBvZjo8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKgPT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8Kg
IMKgIMKgTk9USUNFOjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKg
IMKgQnkgdXNpbmcgdGhpcyBBbmRyb2lkIFZpcnR1YWwgRGV2aWNlLCB5b3UgYWdyZWUgdG88YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoEdvb2ds
ZSBUZXJtcyBvZiBTZXJ2aWNlPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCg8YSBocmVmPSJodHRwczovL3BvbGljaWVzLmdvb2dsZS5jb20vdGVybXMiIHJlbD0ibm9y
ZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vcG9saWNpZXMuZ29vZ2xlLmNvbS90ZXJt
czwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cHM6Ly9wb2xpY2llcy5nb29n
bGUuY29tL3Rlcm1zIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL3Bv
bGljaWVzLmdvb2dsZS5jb20vdGVybXM8L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cHM6Ly9wb2xpY2llcy5nb29nbGUuY29t
L3Rlcm1zIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL3BvbGljaWVz
Lmdvb2dsZS5jb20vdGVybXM8L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHBz
Oi8vcG9saWNpZXMuZ29vZ2xlLmNvbS90ZXJtcyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9i
bGFuayI+aHR0cHM6Ly9wb2xpY2llcy5nb29nbGUuY29tL3Rlcm1zPC9hPiZndDsmZ3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmbHQ7PGEg
aHJlZj0iaHR0cHM6Ly9wb2xpY2llcy5nb29nbGUuY29tL3Rlcm1zIiByZWw9Im5vcmVmZXJyZXIi
IHRhcmdldD0iX2JsYW5rIj5odHRwczovL3BvbGljaWVzLmdvb2dsZS5jb20vdGVybXM8L2E+PGJy
Pg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHBzOi8vcG9saWNpZXMuZ29vZ2xlLmNvbS90
ZXJtcyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9wb2xpY2llcy5n
b29nbGUuY29tL3Rlcm1zPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHBzOi8vcG9saWNpZXMuZ29vZ2xlLmNvbS90ZXJtcyIg
cmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9wb2xpY2llcy5nb29nbGUu
Y29tL3Rlcm1zPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwczovL3BvbGlj
aWVzLmdvb2dsZS5jb20vdGVybXMiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0
dHBzOi8vcG9saWNpZXMuZ29vZ2xlLmNvbS90ZXJtczwvYT4mZ3Q7Jmd0OyZndDspLjxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgVGhlIEdvb2ds
ZSBQcml2YWN5IFBvbGljeTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAoPGEgaHJlZj0iaHR0cHM6Ly9wb2xpY2llcy5nb29nbGUuY29tL3ByaXZhY3kiIHJlbD0ibm9y
ZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vcG9saWNpZXMuZ29vZ2xlLmNvbS9wcml2
YWN5PC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwczovL3BvbGljaWVzLmdv
b2dsZS5jb20vcHJpdmFjeSIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6
Ly9wb2xpY2llcy5nb29nbGUuY29tL3ByaXZhY3k8L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cHM6Ly9wb2xpY2llcy5nb29n
bGUuY29tL3ByaXZhY3kiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8v
cG9saWNpZXMuZ29vZ2xlLmNvbS9wcml2YWN5PC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBo
cmVmPSJodHRwczovL3BvbGljaWVzLmdvb2dsZS5jb20vcHJpdmFjeSIgcmVsPSJub3JlZmVycmVy
IiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9wb2xpY2llcy5nb29nbGUuY29tL3ByaXZhY3k8L2E+
Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvC
oCDCoCDCoCZsdDs8YSBocmVmPSJodHRwczovL3BvbGljaWVzLmdvb2dsZS5jb20vcHJpdmFjeSIg
cmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9wb2xpY2llcy5nb29nbGUu
Y29tL3ByaXZhY3k8L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHBzOi8vcG9s
aWNpZXMuZ29vZ2xlLmNvbS9wcml2YWN5IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5r
Ij5odHRwczovL3BvbGljaWVzLmdvb2dsZS5jb20vcHJpdmFjeTwvYT4mZ3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwczovL3BvbGlj
aWVzLmdvb2dsZS5jb20vcHJpdmFjeSIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+
aHR0cHM6Ly9wb2xpY2llcy5nb29nbGUuY29tL3ByaXZhY3k8L2E+PGJyPg0KJmd0O8KgIMKgIMKg
Jmx0OzxhIGhyZWY9Imh0dHBzOi8vcG9saWNpZXMuZ29vZ2xlLmNvbS9wcml2YWN5IiByZWw9Im5v
cmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL3BvbGljaWVzLmdvb2dsZS5jb20vcHJp
dmFjeTwvYT4mZ3Q7Jmd0OyZndDspPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqBkZXNjcmliZXMgaG93IEdvb2dsZSBoYW5kbGVzIGluZm9ybWF0
aW9uPGJyPg0KJmd0O8KgIMKgIMKgZ2VuZXJhdGVkIGFzPGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoHlvdSB1c2U8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoEdvb2dsZSBTZXJ2aWNlcy48YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKgPT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PTxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgUmVhZGluZyAtLWNvbmZpZyBv
cHRpb24gZnJvbTo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZn
dDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgPGJyPg0KJmd0O8Kg
IMKgIMKgIMKgL21udC96cm9vdC0xMzMvX09TL0FuZHJvaWQvYW9zcF8xNC9hbmRyb2lkLWltYWdl
L2FuZHJvaWQtaW5mby50eHQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDvCoCDCoCDCoExhdW5jaGluZyBDVkQgdXNpbmcgLS1jb25maWc9JiMzOTtwaG9uZSYj
Mzk7Ljxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKg
IMKgYWFyY2g2NC1iaW5mbXQtUDogQ291bGQgbm90IG9wZW48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgJiMzOTsvbGliL2xkLWxpbnV4LWFhcmNoNjQuc28uMSYjMzk7
OiBObzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKg
IMKgc3VjaCBmaWxlIG9yIGRpcmVjdG9yeTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgRmFpbGVkIHRvIHJ1biBncmFwaGljcyBkZXRlY3Rvciwg
YmFkIHJldHVybiB2YWx1ZTo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgMjU1LiBBc3N1bWluZyBubzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgJmd0O8KgIMKgIMKgYXZhaWxhYmlsaXR5Ljxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgR1BVIGF1dG8gbW9kZTogZGlkIG5vdCBkZXRl
Y3QgcHJlcmVxdWlzaXRlcyBmb3I8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgYWNjZWxlcmF0ZWQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDvCoCDCoCDCoHJlbmRlcmluZyBzdXBwb3J0LCBlbmFibGluZzxicj4NCiZndDvCoCDC
oCDCoC0tZ3B1X21vZGU9Z3Vlc3Rfc3dpZnRzaGFkZXIuPGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqBHUFUgdmhvc3QgdXNlciBhdXRvIG1vZGU6
IG5vdCBuZWVkZWQgZm9yPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAtLWdwdV9tb2RlPWd1ZXN0X3N3aWZ0c2hhZGVyLiBOb3QgZW5hYmxpbmc8
YnI+DQomZ3Q7wqAgwqAgwqB2aG9zdCB1c2VyPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoGdwdS48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDvCoCDCoCDCoFJlcXVlc3RlZCByZXN1bWluZyBhIHByZXZpb3VzIHNlc3Npb24gKHRo
ZSBkZWZhdWx0PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoGJlaGF2
aW9yKSBidXQgdGhlPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqBiYXNlIGltYWdlcyBoYXZlIGNoYW5nZWQgdW5kZXIgdGhlIG92ZXJsYXksIG1h
a2luZzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqB0aGUgb3Zlcmxh
eSBpbmM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDC
oCDCoG9tcGF0aWJsZS4gV2lwaW5nIHRoZSBvdmVybGF5IGZpbGVzLjxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgUGF0aCBmb3IgaW5zdGFuY2Ug
VURTOiAvdG1wL2NmX2F2ZF8xMDAwPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqBGYWlsZWQgdG8gcnVuPGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDCoGAvbW50L3pyb290LTEzMy9fT1MvQW5kcm9p
ZC9hb3NwXzE0L2FuZHJvaWQtaW1hZ2UvYmluL2Nyb3N2bTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgY3JlYXRlX3Fjb3cyIC0tYmFja2luZy1m
aWxlPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoC9tbnQvenJvb3Qt
MTMzL19PUy9BbmRyb2lkL2Fvc3BfPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoDxi
cj4NCiZndDvCoCDCoCDCoCDCoDE0L2FuZHJvaWQtaW1hZ2UvY3V0dGxlZmlzaC9pbnN0YW5jZXMv
Y3ZkLTEvcGVyc2lzdGVudF9jb21wb3NpdGUuaW1nPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDCoC9tbnQvenJvb3QtMTMzL19PUy9BbmRyb2lkL2Fv
c3BfMTQvYW5kcm9pZC1pbWFnZS9jdXR0bGVmaXNoL2luc3Rhbjxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgY2VzL2N2ZC0xL3BlcnNpc3RlbnRf
Y29tcG9zaXRlX292ZXJsYXkuaW1nYDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgJmd0O8KgIMKgIMKgc3Rkb3V0Ojxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIyMjPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAjIyM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDvCoCDCoCDCoHN0ZGVycjo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCMjIzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAvbW50L3pyb290LTEzMy9fT1MvQW5kcm9pZC9h
b3NwXzE0L2FuZHJvaWQtaW1hZ2UvYmluL2Nyb3N2bTogcmlnYSAzOjxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAvbW50L3pyb290LTEzMy9fT1Mv
QW5kcm9pZC9hb3NwXzE0L2FuZHJvaWQtaW1hZ2UvYmluL3g4Nl82NC1saW51eC08YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoG11c2wvY3Jvc3Zt
OiBGaWxlIG8gZGlyZWN0b3J5IG5vbiBlc2lzdGVudGU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDvCoCDCoCDCoCMjIzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgUmV0dXJuIGNvZGU6ICZxdW90OzEyNyZxdW90Ozxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgcWVtdTog
dW5jYXVnaHQgdGFyZ2V0IHNpZ25hbCA2IChBYm9ydGVkKSAtPGJyPg0KJmd0O8KgIMKgIMKgY29y
ZSBkdW1wZWQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvC
oCDCoCDCoDA5LTAyIDIzOjI3OjMxLjIyMyAyNzI5OTkwIDI3Mjk5OTAgRSBsYXVuY2hfY3ZkOjxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqBzdWJwcm9jZXNzLmNwcDoy
MDc8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDC
oFN1YnByb2Nlc3MgMjczMDAxOCB3YXMgaW50ZXJydXB0ZWQgYnkgYSBzaWduYWw8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJiMzOTtBYm9ydGVkJiMzOTsgKDYpPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAwOS0w
MiAyMzoyNzozMS4yMjQgMjcyOTk5MCAyNzI5OTkwIEUgbGF1bmNoX2N2ZDo8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgbWFpbi5jYzozMjM8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoGFzc2VtYmxlX2N2ZCByZXR1
cm5lZCAtMTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgT24g
TW9uLCBTZXAgMiwgMjAyNCBhdCAxMToyMOKAr1BNIE1hcmlvIE1hcmlldHRvPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0i
bWFpbHRvOm1hcmlldHRvMjAwOEBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5tYXJpZXR0bzIw
MDhAZ21haWwuY29tPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFp
bHRvOm1hcmlldHRvMjAwOEBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5tYXJpZXR0bzIwMDhA
Z21haWwuY29tPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86bWFyaWV0dG8yMDA4QGdtYWlsLmNvbSIgdGFy
Z2V0PSJfYmxhbmsiPm1hcmlldHRvMjAwOEBnbWFpbC5jb208L2E+PGJyPg0KJmd0O8KgIMKgIMKg
Jmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86bWFyaWV0dG8yMDA4QGdtYWlsLmNvbSIgdGFyZ2V0
PSJfYmxhbmsiPm1hcmlldHRvMjAwOEBnbWFpbC5jb208L2E+Jmd0OyZndDs8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86
bWFyaWV0dG8yMDA4QGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPm1hcmlldHRvMjAwOEBnbWFp
bC5jb208L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86bWFy
aWV0dG8yMDA4QGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPm1hcmlldHRvMjAwOEBnbWFpbC5j
b208L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7
bWFpbHRvOjxhIGhyZWY9Im1haWx0bzptYXJpZXR0bzIwMDhAZ21haWwuY29tIiB0YXJnZXQ9Il9i
bGFuayI+bWFyaWV0dG8yMDA4QGdtYWlsLmNvbTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFp
bHRvOjxhIGhyZWY9Im1haWx0bzptYXJpZXR0bzIwMDhAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFu
ayI+bWFyaWV0dG8yMDA4QGdtYWlsLmNvbTwvYT4mZ3Q7Jmd0OyZndDsmZ3Q7IHdyb3RlOjxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgSGVsbG8uPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBJJiMzOTt2
ZSBkb3dubG9hZGVkIHRoaXMgZmlsZSA6PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBhb3NwX2NmX2FybTY0X29ubHlfcGhvbmUtaW1n
LTEyMzA5Mjk2LnppcCBhbmQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgdGhpcyBmaWxlIDo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoGN2ZC1ob3N0X3BhY2thZ2UudGFyLmd6PGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBmcm9tIGhlcmUgOjxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgPGEgaHJlZj0iaHR0cHM6Ly9jaS5hbmRyb2lkLmNvbS9i
dWlsZHMvc3VibWl0dGVkLzEyMzA5Mjk2L2Fvc3BfY2ZfYXJtNjRfb25seV9waG9uZS10cnVua19z
dGFnaW5nLXVzZXJkZWJ1Zy9sYXRlc3QiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsi
Pmh0dHBzOi8vY2kuYW5kcm9pZC5jb20vYnVpbGRzL3N1Ym1pdHRlZC8xMjMwOTI5Ni9hb3NwX2Nm
X2FybTY0X29ubHlfcGhvbmUtdHJ1bmtfc3RhZ2luZy11c2VyZGVidWcvbGF0ZXN0PC9hPiAmbHQ7
PGEgaHJlZj0iaHR0cHM6Ly9jaS5hbmRyb2lkLmNvbS9idWlsZHMvc3VibWl0dGVkLzEyMzA5Mjk2
L2Fvc3BfY2ZfYXJtNjRfb25seV9waG9uZS10cnVua19zdGFnaW5nLXVzZXJkZWJ1Zy9sYXRlc3Qi
IHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vY2kuYW5kcm9pZC5jb20v
YnVpbGRzL3N1Ym1pdHRlZC8xMjMwOTI5Ni9hb3NwX2NmX2FybTY0X29ubHlfcGhvbmUtdHJ1bmtf
c3RhZ2luZy11c2VyZGVidWcvbGF0ZXN0PC9hPiZndDsgJmx0OzxhIGhyZWY9Imh0dHBzOi8vY2ku
YW5kcm9pZC5jb20vYnVpbGRzL3N1Ym1pdHRlZC8xMjMwOTI5Ni9hb3NwX2NmX2FybTY0X29ubHlf
cGhvbmUtdHJ1bmtfc3RhZ2luZy11c2VyZGVidWcvbGF0ZXN0IiByZWw9Im5vcmVmZXJyZXIiIHRh
cmdldD0iX2JsYW5rIj5odHRwczovL2NpLmFuZHJvaWQuY29tL2J1aWxkcy9zdWJtaXR0ZWQvMTIz
MDkyOTYvYW9zcF9jZl9hcm02NF9vbmx5X3Bob25lLXRydW5rX3N0YWdpbmctdXNlcmRlYnVnL2xh
dGVzdDwvYT4gJmx0OzxhIGhyZWY9Imh0dHBzOi8vY2kuYW5kcm9pZC5jb20vYnVpbGRzL3N1Ym1p
dHRlZC8xMjMwOTI5Ni9hb3NwX2NmX2FybTY0X29ubHlfcGhvbmUtdHJ1bmtfc3RhZ2luZy11c2Vy
ZGVidWcvbGF0ZXN0IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2Np
LmFuZHJvaWQuY29tL2J1aWxkcy9zdWJtaXR0ZWQvMTIzMDkyOTYvYW9zcF9jZl9hcm02NF9vbmx5
X3Bob25lLXRydW5rX3N0YWdpbmctdXNlcmRlYnVnL2xhdGVzdDwvYT4mZ3Q7Jmd0OyAmbHQ7PGEg
aHJlZj0iaHR0cHM6Ly9jaS5hbmRyb2lkLmNvbS9idWlsZHMvc3VibWl0dGVkLzEyMzA5Mjk2L2Fv
c3BfY2ZfYXJtNjRfb25seV9waG9uZS10cnVua19zdGFnaW5nLXVzZXJkZWJ1Zy9sYXRlc3QiIHJl
bD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vY2kuYW5kcm9pZC5jb20vYnVp
bGRzL3N1Ym1pdHRlZC8xMjMwOTI5Ni9hb3NwX2NmX2FybTY0X29ubHlfcGhvbmUtdHJ1bmtfc3Rh
Z2luZy11c2VyZGVidWcvbGF0ZXN0PC9hPiAmbHQ7PGEgaHJlZj0iaHR0cHM6Ly9jaS5hbmRyb2lk
LmNvbS9idWlsZHMvc3VibWl0dGVkLzEyMzA5Mjk2L2Fvc3BfY2ZfYXJtNjRfb25seV9waG9uZS10
cnVua19zdGFnaW5nLXVzZXJkZWJ1Zy9sYXRlc3QiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJf
YmxhbmsiPmh0dHBzOi8vY2kuYW5kcm9pZC5jb20vYnVpbGRzL3N1Ym1pdHRlZC8xMjMwOTI5Ni9h
b3NwX2NmX2FybTY0X29ubHlfcGhvbmUtdHJ1bmtfc3RhZ2luZy11c2VyZGVidWcvbGF0ZXN0PC9h
PiZndDsgJmx0OzxhIGhyZWY9Imh0dHBzOi8vY2kuYW5kcm9pZC5jb20vYnVpbGRzL3N1Ym1pdHRl
ZC8xMjMwOTI5Ni9hb3NwX2NmX2FybTY0X29ubHlfcGhvbmUtdHJ1bmtfc3RhZ2luZy11c2VyZGVi
dWcvbGF0ZXN0IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2NpLmFu
ZHJvaWQuY29tL2J1aWxkcy9zdWJtaXR0ZWQvMTIzMDkyOTYvYW9zcF9jZl9hcm02NF9vbmx5X3Bo
b25lLXRydW5rX3N0YWdpbmctdXNlcmRlYnVnL2xhdGVzdDwvYT4gJmx0OzxhIGhyZWY9Imh0dHBz
Oi8vY2kuYW5kcm9pZC5jb20vYnVpbGRzL3N1Ym1pdHRlZC8xMjMwOTI5Ni9hb3NwX2NmX2FybTY0
X29ubHlfcGhvbmUtdHJ1bmtfc3RhZ2luZy11c2VyZGVidWcvbGF0ZXN0IiByZWw9Im5vcmVmZXJy
ZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2NpLmFuZHJvaWQuY29tL2J1aWxkcy9zdWJtaXR0
ZWQvMTIzMDkyOTYvYW9zcF9jZl9hcm02NF9vbmx5X3Bob25lLXRydW5rX3N0YWdpbmctdXNlcmRl
YnVnL2xhdGVzdDwvYT4mZ3Q7Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoEJ1dCBsZXQmIzM5O3Mgc2F5IHRoYXQgSSBkb24mIzM5O3Qg
d2FudCB0byB1c2UgdGhlPGJyPg0KJmd0O8KgIMKgIMKgKi5pbWc8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgZmlsZXMgdGhhdCBhcmU8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoHN0b3JlZCBpbnNpZGU8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJnF1b3Q7YW9zcF9jZl9h
cm02NF9vbmx5X3Bob25lLWltZy0xMjMwOTI5Ni56aXAmcXVvdDssYnV0PGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqB0aGUgc2FtZSBm
aWxlcyB0aGF0IGhhdmUgYmVlbiBwcm9kdWNlZCB3aGVuIEk8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgaGF2ZSBjb21waWxlZCB0aGlzPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqB2ZXJzaW9uIG9mIEFu
ZHJvaWQgOjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgPGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29t
L3Jhc3BiZXJyeS12YW5pbGxhL2FuZHJvaWRfbG9jYWxfbWFuaWZlc3Q/dGFiPXJlYWRtZS1vdi1m
aWxlIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2dpdGh1Yi5jb20v
cmFzcGJlcnJ5LXZhbmlsbGEvYW5kcm9pZF9sb2NhbF9tYW5pZmVzdD90YWI9cmVhZG1lLW92LWZp
bGU8L2E+ICZsdDs8YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vcmFzcGJlcnJ5LXZhbmlsbGEv
YW5kcm9pZF9sb2NhbF9tYW5pZmVzdD90YWI9cmVhZG1lLW92LWZpbGUiIHJlbD0ibm9yZWZlcnJl
ciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZ2l0aHViLmNvbS9yYXNwYmVycnktdmFuaWxsYS9h
bmRyb2lkX2xvY2FsX21hbmlmZXN0P3RhYj1yZWFkbWUtb3YtZmlsZTwvYT4mZ3Q7ICZsdDs8YSBo
cmVmPSJodHRwczovL2dpdGh1Yi5jb20vcmFzcGJlcnJ5LXZhbmlsbGEvYW5kcm9pZF9sb2NhbF9t
YW5pZmVzdD90YWI9cmVhZG1lLW92LWZpbGUiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxh
bmsiPmh0dHBzOi8vZ2l0aHViLmNvbS9yYXNwYmVycnktdmFuaWxsYS9hbmRyb2lkX2xvY2FsX21h
bmlmZXN0P3RhYj1yZWFkbWUtb3YtZmlsZTwvYT4gJmx0OzxhIGhyZWY9Imh0dHBzOi8vZ2l0aHVi
LmNvbS9yYXNwYmVycnktdmFuaWxsYS9hbmRyb2lkX2xvY2FsX21hbmlmZXN0P3RhYj1yZWFkbWUt
b3YtZmlsZSIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9naXRodWIu
Y29tL3Jhc3BiZXJyeS12YW5pbGxhL2FuZHJvaWRfbG9jYWxfbWFuaWZlc3Q/dGFiPXJlYWRtZS1v
di1maWxlPC9hPiZndDsmZ3Q7ICZsdDs8YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vcmFzcGJl
cnJ5LXZhbmlsbGEvYW5kcm9pZF9sb2NhbF9tYW5pZmVzdD90YWI9cmVhZG1lLW92LWZpbGUiIHJl
bD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZ2l0aHViLmNvbS9yYXNwYmVy
cnktdmFuaWxsYS9hbmRyb2lkX2xvY2FsX21hbmlmZXN0P3RhYj1yZWFkbWUtb3YtZmlsZTwvYT4g
Jmx0OzxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS9yYXNwYmVycnktdmFuaWxsYS9hbmRyb2lk
X2xvY2FsX21hbmlmZXN0P3RhYj1yZWFkbWUtb3YtZmlsZSIgcmVsPSJub3JlZmVycmVyIiB0YXJn
ZXQ9Il9ibGFuayI+aHR0cHM6Ly9naXRodWIuY29tL3Jhc3BiZXJyeS12YW5pbGxhL2FuZHJvaWRf
bG9jYWxfbWFuaWZlc3Q/dGFiPXJlYWRtZS1vdi1maWxlPC9hPiZndDsgJmx0OzxhIGhyZWY9Imh0
dHBzOi8vZ2l0aHViLmNvbS9yYXNwYmVycnktdmFuaWxsYS9hbmRyb2lkX2xvY2FsX21hbmlmZXN0
P3RhYj1yZWFkbWUtb3YtZmlsZSIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0
cHM6Ly9naXRodWIuY29tL3Jhc3BiZXJyeS12YW5pbGxhL2FuZHJvaWRfbG9jYWxfbWFuaWZlc3Q/
dGFiPXJlYWRtZS1vdi1maWxlPC9hPiAmbHQ7PGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL3Jh
c3BiZXJyeS12YW5pbGxhL2FuZHJvaWRfbG9jYWxfbWFuaWZlc3Q/dGFiPXJlYWRtZS1vdi1maWxl
IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2dpdGh1Yi5jb20vcmFz
cGJlcnJ5LXZhbmlsbGEvYW5kcm9pZF9sb2NhbF9tYW5pZmVzdD90YWI9cmVhZG1lLW92LWZpbGU8
L2E+Jmd0OyZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqBDYW4gSSBkbyBpdCA/IElzIGl0IHN1cHBvc2VkIHRvIHdvcmsgdGhlPGJyPg0K
Jmd0O8KgIMKgIMKgc2FtZSA/PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAgwqBUaGFua3MuPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqBPbiBNb24sIFNlcCAyLCAyMDI0IGF0IDEwOjIz4oCvUE0gUGllcnJp
Y2s8YnI+DQomZ3Q7wqAgwqAgwqBCb3V2aWVyPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0ibWFpbHRvOnBpZXJy
aWNrLmJvdXZpZXJAbGluYXJvLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnBpZXJyaWNrLmJvdXZpZXJA
bGluYXJvLm9yZzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0
bzpwaWVycmljay5ib3V2aWVyQGxpbmFyby5vcmciIHRhcmdldD0iX2JsYW5rIj5waWVycmljay5i
b3V2aWVyQGxpbmFyby5vcmc8L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpwaWVycmljay5ib3V2aWVyQGxp
bmFyby5vcmciIHRhcmdldD0iX2JsYW5rIj5waWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc8L2E+
PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cGllcnJpY2suYm91
dmllckBsaW5hcm8ub3JnIiB0YXJnZXQ9Il9ibGFuayI+cGllcnJpY2suYm91dmllckBsaW5hcm8u
b3JnPC9hPiZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpwaWVycmljay5i
b3V2aWVyQGxpbmFyby5vcmciIHRhcmdldD0iX2JsYW5rIj5waWVycmljay5ib3V2aWVyQGxpbmFy
by5vcmc8L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cGll
cnJpY2suYm91dmllckBsaW5hcm8ub3JnIiB0YXJnZXQ9Il9ibGFuayI+cGllcnJpY2suYm91dmll
ckBsaW5hcm8ub3JnPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cGllcnJpY2suYm91dmllckBsaW5hcm8u
b3JnIiB0YXJnZXQ9Il9ibGFuayI+cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnPC9hPjxicj4N
CiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnBpZXJyaWNrLmJvdXZpZXJA
bGluYXJvLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZzwv
YT4mZ3Q7Jmd0OyZndDsmZ3Q7IHdyb3RlOjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgT24gOS8yLzI0IDEzOjIwLCBQaWVycmljayBCb3V2aWVyIHdyb3RlOjxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDsgT24gOS8yLzI0IDEyOjUzLCBNYXJpbyBNYXJpZXR0byB3cm90ZTo8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCAmZ3Q7Jmd0OyBIZWxsbyBQaWVycmljay48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0Ozxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
ICZndDsmZ3Q7IFdpdGggQ3V0dGxlZmlzaCBjYW4gSSBlbXVsYXRlPGJyPg0KJmd0O8KgIMKgIMKg
QW5kcm9pZCAxNDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqBmb3Ig
YXJtNjQgPyBJPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqBhc2sgYmVjYXVzZSBpbjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7IHlv
dXIgc2NyaXB0IEkgcmVhZCA6PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0
Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmcXVvdDt8L2hvbWUv
dXNlci8ud29yay9xZW11L2J1aWxkL3FlbXUtc3lzdGVtLXg4Nl82NCZxdW90Oywgc28sSTxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgc3VzcGVjdCB0aGF0IHlvdTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7IGhhdmUgZW11bGF0ZWQg
QW5kcm9pZCB4NjQgYml0LGJ1dDxicj4NCiZndDvCoCDCoCDCoEkgbmVlZDxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqBhcm02NC4gfDxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsgWWVzLCBpdCB3b3JrcyBmb3IgYm90aDxi
cj4NCiZndDvCoCDCoCDCoGFyY2hpdGVjdHVyZS4gVGhlPGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoG9ubHkgdGhpbmcgSTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgZGlkbiYjMzk7dCB0cnkg
aXMgYW48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCAmZ3Q7IGFybTY0IHZtIGFjY2VsZXJhdGVkIHdpdGgga3ZtIChJIGRv
biYjMzk7dDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqBoYXZlIHRo
aXMgYTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgbGludXgtYWFyY2g2NDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsgbWFjaGluZSksIGJ1
dCBpdCBzaG91bGQgd29yay48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoEFuZCBvZiBjb3Vyc2UsIGlmIHlvdSB3YW50IHRvIHdyaXRlIGE8
YnI+DQomZ3Q7wqAgwqAgwqBjdXN0b208YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgd3JhcHBlciBmb3I8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoHFlbXUsIG5hbWUgaXQ8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoHFl
bXUtc3lzdGVtLWFhcmNoNjQsIGFuZCBjYWxsIHRoZSBzYW1lPGJyPg0KJmd0O8KgIMKgIMKgYmlu
YXJ5PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoGluc3RlYWQgb2Y8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoHg4Nl82NCB2YXJpYW50cy48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDsgSSBh
bHNvIHJlYWQgJnF1b3Q7Zm9yIGFhcmNoNjQgaW1hZ2VzOjxicj4NCiZndDvCoCDCoCDCoHNlbGVj
dDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgICZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoHxhb3NwX2NmX2FybTY0X29ubHlfcGhvbmUtdHJ1bmtfc3RhZ2luZy11c2VyZGVidWcm
cXVvdDsgOiBJJiMzOTttPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqBub3QgYWJsZSB0bzxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7
IGRvd25sb2FkIHRoaXMga2luZCBvZiBpbWFnZXMuIEkgZG9uJiMzOTt0PGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoHVuZGVyc3RhbmQgaG93IHRoZTxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
QnJhbmNoIEdyaWQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0OyB3b3Jrcy4gQ2FuIHlvdSBleHBsYWluIHRv
IG1lIGE8YnI+DQomZ3Q7wqAgwqAgwqBsaXR0bGUgYml0PGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoG1vcmUgPzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7IHw8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgJmd0OyBZb3UgaGF2ZSBhIGxpbmsganVzdCBuZXh0IHRvIGl0PGJy
Pg0KJmd0O8KgIMKgIMKgKCZxdW90O0JyYW5jaDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqBncmlkJnF1b3Q7KSBvbiB0aGU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoHdpa2kgcGFnZS48YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmZ3Q7IE9uY2Ugb24gY2kgYW5kcm9pZCBwYWdlLCBjbGljayBvbjxicj4NCiZndDvC
oCDCoCDCoGZpbHRlcjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqBi
dXR0b24gKHRocmVlPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqBiYXJzLCBpbnZlcnRlZDxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsgcHly
YW1pZCksIGFuZCBzZWxlY3Q8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDCoGFvc3BfY2ZfYXJt
NjRfb25seV9waG9uZS10cnVua19zdGFnaW5nLXVzZXJkZWJ1Zy48YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7IFRo
ZW4gZ28gdG8gYXJ0aWZhY3RzLCBhbmQgZG93bmxvYWQ8YnI+DQomZ3Q7wqAgwqAgwqBpbWFnZSBh
bmQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoGN2ZF9ob3N0X3g4Nl82NCBwYWNrYWdlLCBhczxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsg
d2lraSBtZW50aW9ucy48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyBEb24mIzM5O3Qg
aGVzaXRhdGUgdG8gYXNrIG1vcmUgcXVlc3Rpb25zIG9uPGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoHRoaXMuIEkgaW1hZ2luZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgdGhpcyB0b3BpYyBt
aWdodDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgICZndDsgaW50ZXJlc3Qgc29tZSBwZW9wbGUgd2hvIHRyeSB0byBkbyB0
aGU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgc2FtZSB0aGluZy48
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyBQaWVycmljazxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmZ3Q7Jmd0OyB8PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDsgfDxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZn
dDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0OyBPbiBNb24sIFNl
cCAyLCAyMDI0IGF0IDg6NDfigK9QTTxicj4NCiZndDvCoCDCoCDCoFBpZXJyaWNrPGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoEJvdXZpZXI8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7
Jmd0OyAmbHQ7PGEgaHJlZj0ibWFpbHRvOnBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZyIgdGFy
Z2V0PSJfYmxhbmsiPnBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZzwvYT48YnI+DQomZ3Q7wqAg
wqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpwaWVycmljay5ib3V2aWVyQGxpbmFyby5v
cmciIHRhcmdldD0iX2JsYW5rIj5waWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc8L2E+Jmd0Ozxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhy
ZWY9Im1haWx0bzpwaWVycmljay5ib3V2aWVyQGxpbmFyby5vcmciIHRhcmdldD0iX2JsYW5rIj5w
aWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc8L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0
bzo8YSBocmVmPSJtYWlsdG86cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnIiB0YXJnZXQ9Il9i
bGFuayI+cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnPC9hPiZndDsmZ3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAm
bHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpwaWVycmljay5ib3V2aWVyQGxpbmFyby5vcmciIHRh
cmdldD0iX2JsYW5rIj5waWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc8L2E+PGJyPg0KJmd0O8Kg
IMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cGllcnJpY2suYm91dmllckBsaW5hcm8u
b3JnIiB0YXJnZXQ9Il9ibGFuayI+cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnPC9hPiZndDs8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmx0O21haWx0bzo8YSBo
cmVmPSJtYWlsdG86cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnIiB0YXJnZXQ9Il9ibGFuayI+
cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWls
dG86PGEgaHJlZj0ibWFpbHRvOnBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZyIgdGFyZ2V0PSJf
YmxhbmsiPnBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZzwvYT4mZ3Q7Jmd0OyZndDs8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9y
ZyIgdGFyZ2V0PSJfYmxhbmsiPnBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZzwvYT48YnI+DQom
Z3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpwaWVycmljay5ib3V2aWVyQGxp
bmFyby5vcmciIHRhcmdldD0iX2JsYW5rIj5waWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc8L2E+
Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7bWFpbHRv
OjxhIGhyZWY9Im1haWx0bzpwaWVycmljay5ib3V2aWVyQGxpbmFyby5vcmciIHRhcmdldD0iX2Js
YW5rIj5waWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc8L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0
O21haWx0bzo8YSBocmVmPSJtYWlsdG86cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnIiB0YXJn
ZXQ9Il9ibGFuayI+cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnPC9hPiZndDsmZ3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpwaWVycmljay5ib3V2aWVyQGxpbmFyby5v
cmciIHRhcmdldD0iX2JsYW5rIj5waWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc8L2E+PGJyPg0K
Jmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cGllcnJpY2suYm91dmllckBs
aW5hcm8ub3JnIiB0YXJnZXQ9Il9ibGFuayI+cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnPC9h
PiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmx0O21haWx0
bzo8YSBocmVmPSJtYWlsdG86cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnIiB0YXJnZXQ9Il9i
bGFuayI+cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnPC9hPjxicj4NCiZndDvCoCDCoCDCoCZs
dDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZyIgdGFy
Z2V0PSJfYmxhbmsiPnBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZzwvYT4mZ3Q7Jmd0OyZndDsm
Z3Q7Jmd0OyB3cm90ZTo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAg
wqAgwqAgSGVsbG8gTWFyaW8sPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0
O8KgIMKgIMKgIHZlcnkgcmVjZW50bHksIEkgaGFkIHRvPGJyPg0KJmd0O8KgIMKgIMKgaW52ZXN0
aWdhdGU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgYm9vdGluZyB0
aW1lIG9mPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqBBbmRyb2lkIHdoZW4gdXNpbmc8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8Kg
IMKgIMKgIFFFTVUuIFlvdSBjYW4gcHJvYmFibHkgbWFuYWdlIHRvPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoGJvb3QgdGhpcyB3aXRoPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqBvbmx5IFFF
TVUgYWxvbmUsIGJ1dCBpbjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAgbXkgZXhwZXJpZW5j
ZSwgdXNpbmcgQ3V0dGxlZmlzaDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqB0b29saW5nIGlzIGFuPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqBlYXNpZXIgYXBwcm9hY2guPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIElmIHlvdSByZWFsbHkgd2FudCB0
byB1c2U8YnI+DQomZ3Q7wqAgwqAgwqBvbmx5IFFFTVUsPGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoHlvdSBjYW4gdXNlPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqBDdXR0bGVmaXNoIHRvIGdl
dDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAgZXhhY3Q8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8Kg
IMKgIMKgIGNvbW1hbmQgbGluZSB1c2VkICh3aGljaCBkaXNrPGJyPg0KJmd0O8KgIMKgIMKgZ29l
czxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqB3aGVyZSksIGFuZDxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgaXRlcmF0ZSBmcm9tIHRoYXQuPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDs8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCAmZ3Q7Jmd0O8KgIMKgIMKgIEluc3RydWN0aW9uczo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0Ozxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgPGEgaHJlZj0iaHR0cHM6Ly9saW5hcm8uYXRsYXNz
aWFuLm5ldC93aWtpL3NwYWNlcy9RRU1VL3BhZ2VzLzI5NDY0MDY4MDk3L1J1bitBbmRyb2lkK3Vz
aW5nK1FFTVUiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vbGluYXJv
LmF0bGFzc2lhbi5uZXQvd2lraS9zcGFjZXMvUUVNVS9wYWdlcy8yOTQ2NDA2ODA5Ny9SdW4rQW5k
cm9pZCt1c2luZytRRU1VPC9hPiAmbHQ7PGEgaHJlZj0iaHR0cHM6Ly9saW5hcm8uYXRsYXNzaWFu
Lm5ldC93aWtpL3NwYWNlcy9RRU1VL3BhZ2VzLzI5NDY0MDY4MDk3L1J1bitBbmRyb2lkK3VzaW5n
K1FFTVUiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vbGluYXJvLmF0
bGFzc2lhbi5uZXQvd2lraS9zcGFjZXMvUUVNVS9wYWdlcy8yOTQ2NDA2ODA5Ny9SdW4rQW5kcm9p
ZCt1c2luZytRRU1VPC9hPiZndDsgJmx0OzxhIGhyZWY9Imh0dHBzOi8vbGluYXJvLmF0bGFzc2lh
bi5uZXQvd2lraS9zcGFjZXMvUUVNVS9wYWdlcy8yOTQ2NDA2ODA5Ny9SdW4rQW5kcm9pZCt1c2lu
ZytRRU1VIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2xpbmFyby5h
dGxhc3NpYW4ubmV0L3dpa2kvc3BhY2VzL1FFTVUvcGFnZXMvMjk0NjQwNjgwOTcvUnVuK0FuZHJv
aWQrdXNpbmcrUUVNVTwvYT4gJmx0OzxhIGhyZWY9Imh0dHBzOi8vbGluYXJvLmF0bGFzc2lhbi5u
ZXQvd2lraS9zcGFjZXMvUUVNVS9wYWdlcy8yOTQ2NDA2ODA5Ny9SdW4rQW5kcm9pZCt1c2luZytR
RU1VIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2xpbmFyby5hdGxh
c3NpYW4ubmV0L3dpa2kvc3BhY2VzL1FFTVUvcGFnZXMvMjk0NjQwNjgwOTcvUnVuK0FuZHJvaWQr
dXNpbmcrUUVNVTwvYT4mZ3Q7Jmd0OyAmbHQ7PGEgaHJlZj0iaHR0cHM6Ly9saW5hcm8uYXRsYXNz
aWFuLm5ldC93aWtpL3NwYWNlcy9RRU1VL3BhZ2VzLzI5NDY0MDY4MDk3L1J1bitBbmRyb2lkK3Vz
aW5nK1FFTVUiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vbGluYXJv
LmF0bGFzc2lhbi5uZXQvd2lraS9zcGFjZXMvUUVNVS9wYWdlcy8yOTQ2NDA2ODA5Ny9SdW4rQW5k
cm9pZCt1c2luZytRRU1VPC9hPiAmbHQ7PGEgaHJlZj0iaHR0cHM6Ly9saW5hcm8uYXRsYXNzaWFu
Lm5ldC93aWtpL3NwYWNlcy9RRU1VL3BhZ2VzLzI5NDY0MDY4MDk3L1J1bitBbmRyb2lkK3VzaW5n
K1FFTVUiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vbGluYXJvLmF0
bGFzc2lhbi5uZXQvd2lraS9zcGFjZXMvUUVNVS9wYWdlcy8yOTQ2NDA2ODA5Ny9SdW4rQW5kcm9p
ZCt1c2luZytRRU1VPC9hPiZndDsgJmx0OzxhIGhyZWY9Imh0dHBzOi8vbGluYXJvLmF0bGFzc2lh
bi5uZXQvd2lraS9zcGFjZXMvUUVNVS9wYWdlcy8yOTQ2NDA2ODA5Ny9SdW4rQW5kcm9pZCt1c2lu
ZytRRU1VIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2xpbmFyby5h
dGxhc3NpYW4ubmV0L3dpa2kvc3BhY2VzL1FFTVUvcGFnZXMvMjk0NjQwNjgwOTcvUnVuK0FuZHJv
aWQrdXNpbmcrUUVNVTwvYT4gJmx0OzxhIGhyZWY9Imh0dHBzOi8vbGluYXJvLmF0bGFzc2lhbi5u
ZXQvd2lraS9zcGFjZXMvUUVNVS9wYWdlcy8yOTQ2NDA2ODA5Ny9SdW4rQW5kcm9pZCt1c2luZytR
RU1VIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2xpbmFyby5hdGxh
c3NpYW4ubmV0L3dpa2kvc3BhY2VzL1FFTVUvcGFnZXMvMjk0NjQwNjgwOTcvUnVuK0FuZHJvaWQr
dXNpbmcrUUVNVTwvYT4mZ3Q7Jmd0OyZndDsgJmx0OzxhIGhyZWY9Imh0dHBzOi8vbGluYXJvLmF0
bGFzc2lhbi5uZXQvd2lraS9zcGFjZXMvUUVNVS9wYWdlcy8yOTQ2NDA2ODA5Ny9SdW4rQW5kcm9p
ZCt1c2luZytRRU1VIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2xp
bmFyby5hdGxhc3NpYW4ubmV0L3dpa2kvc3BhY2VzL1FFTVUvcGFnZXMvMjk0NjQwNjgwOTcvUnVu
K0FuZHJvaWQrdXNpbmcrUUVNVTwvYT4gJmx0OzxhIGhyZWY9Imh0dHBzOi8vbGluYXJvLmF0bGFz
c2lhbi5uZXQvd2lraS9zcGFjZXMvUUVNVS9wYWdlcy8yOTQ2NDA2ODA5Ny9SdW4rQW5kcm9pZCt1
c2luZytRRU1VIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2xpbmFy
by5hdGxhc3NpYW4ubmV0L3dpa2kvc3BhY2VzL1FFTVUvcGFnZXMvMjk0NjQwNjgwOTcvUnVuK0Fu
ZHJvaWQrdXNpbmcrUUVNVTwvYT4mZ3Q7ICZsdDs8YSBocmVmPSJodHRwczovL2xpbmFyby5hdGxh
c3NpYW4ubmV0L3dpa2kvc3BhY2VzL1FFTVUvcGFnZXMvMjk0NjQwNjgwOTcvUnVuK0FuZHJvaWQr
dXNpbmcrUUVNVSIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9saW5h
cm8uYXRsYXNzaWFuLm5ldC93aWtpL3NwYWNlcy9RRU1VL3BhZ2VzLzI5NDY0MDY4MDk3L1J1bitB
bmRyb2lkK3VzaW5nK1FFTVU8L2E+ICZsdDs8YSBocmVmPSJodHRwczovL2xpbmFyby5hdGxhc3Np
YW4ubmV0L3dpa2kvc3BhY2VzL1FFTVUvcGFnZXMvMjk0NjQwNjgwOTcvUnVuK0FuZHJvaWQrdXNp
bmcrUUVNVSIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9saW5hcm8u
YXRsYXNzaWFuLm5ldC93aWtpL3NwYWNlcy9RRU1VL3BhZ2VzLzI5NDY0MDY4MDk3L1J1bitBbmRy
b2lkK3VzaW5nK1FFTVU8L2E+Jmd0OyZndDsgJmx0OzxhIGhyZWY9Imh0dHBzOi8vbGluYXJvLmF0
bGFzc2lhbi5uZXQvd2lraS9zcGFjZXMvUUVNVS9wYWdlcy8yOTQ2NDA2ODA5Ny9SdW4rQW5kcm9p
ZCt1c2luZytRRU1VIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2xp
bmFyby5hdGxhc3NpYW4ubmV0L3dpa2kvc3BhY2VzL1FFTVUvcGFnZXMvMjk0NjQwNjgwOTcvUnVu
K0FuZHJvaWQrdXNpbmcrUUVNVTwvYT4gJmx0OzxhIGhyZWY9Imh0dHBzOi8vbGluYXJvLmF0bGFz
c2lhbi5uZXQvd2lraS9zcGFjZXMvUUVNVS9wYWdlcy8yOTQ2NDA2ODA5Ny9SdW4rQW5kcm9pZCt1
c2luZytRRU1VIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2xpbmFy
by5hdGxhc3NpYW4ubmV0L3dpa2kvc3BhY2VzL1FFTVUvcGFnZXMvMjk0NjQwNjgwOTcvUnVuK0Fu
ZHJvaWQrdXNpbmcrUUVNVTwvYT4mZ3Q7ICZsdDs8YSBocmVmPSJodHRwczovL2xpbmFyby5hdGxh
c3NpYW4ubmV0L3dpa2kvc3BhY2VzL1FFTVUvcGFnZXMvMjk0NjQwNjgwOTcvUnVuK0FuZHJvaWQr
dXNpbmcrUUVNVSIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9saW5h
cm8uYXRsYXNzaWFuLm5ldC93aWtpL3NwYWNlcy9RRU1VL3BhZ2VzLzI5NDY0MDY4MDk3L1J1bitB
bmRyb2lkK3VzaW5nK1FFTVU8L2E+ICZsdDs8YSBocmVmPSJodHRwczovL2xpbmFyby5hdGxhc3Np
YW4ubmV0L3dpa2kvc3BhY2VzL1FFTVUvcGFnZXMvMjk0NjQwNjgwOTcvUnVuK0FuZHJvaWQrdXNp
bmcrUUVNVSIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9saW5hcm8u
YXRsYXNzaWFuLm5ldC93aWtpL3NwYWNlcy9RRU1VL3BhZ2VzLzI5NDY0MDY4MDk3L1J1bitBbmRy
b2lkK3VzaW5nK1FFTVU8L2E+Jmd0OyZndDsmZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCBBcyB5b3UmIzM5O2xsIHNlZSwgSSBjb3VsZCBub3Qg
Z2V0IGE8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgZGlyZWN0IGdy
YXBoaWM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoG91dHB1dCwgYnV0IHVzaW5nPGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDC
oCDCoCBzY3JjcHksIGl0IHdvcmtlZCB3ZWxsIGZvcjxicj4NCiZndDvCoCDCoCDCoG1lLiBIb3Bl
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoGl0IGNhbiBmaXQgeW91
cjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgdXNlIGNhc2UuPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7
Jmd0O8KgIMKgIMKgIFJlZ2FyZHMsPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCBQaWVycmlj
azxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgICZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCBPbiA5LzIv
MjQgMDY6NDksIE1hcmlvPGJyPg0KJmd0O8KgIMKgIMKgTWFyaWV0dG8gd3JvdGU6PGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDsgSGVsbG8uPGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDC
oCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIMKgJmd0OyBJIHdvdWxkIGxp
a2UgdG8gZW11bGF0ZTxicj4NCiZndDvCoCDCoCDCoEFuZHJvaWQ8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgMTQgb24gbXkgVWJ1bnR1PGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAyNC4wNCBP
UyBYNjQgYml0PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCB1c2luZzxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZn
dDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHFlbXUtc3lzdGVtLWFhcmNoNjQuIEkgdHJpZWQ8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgdXNpbmcgdGhlIGZvbGxvd2luZzxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgcGFyYW1ldGVycyA6PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDs8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIMKgJmd0OyBxZW11LXN5c3RlbS1hYXJjaDY0IFw8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIC1zbXAgNCBc
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCAtbSAyMDQ4
IFw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIC1jcHUg
Y29ydGV4LWE3MiBcPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCDCoCAtTSB2aXJ0IFw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgIMKgIC1kZXZpY2U8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
dmlydGlvLWdwdS1wY2kseHJlcz0xMDI0LHlyZXM9NzY4IFw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIC1kaXNwbGF5IHNkbCxnbD1vbiBcPGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCAtZGV2aWNlIHVzYi1laGNp
IFw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIC1kZXZp
Y2UgdXNiLWtiZCBcPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCDCoCAtZGV2aWNlPGJyPg0KJmd0O8KgIMKgIMKgdmlydGlvLXRhYmxldC1wY2kgXDxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgLXVzYiBcPGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCAtc2VyaWFsIHN0ZGlvIFw8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIC1rZXJuZWw8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoC9tbnQvenJvb3QtMTMzL19PUy9BbmRyb2lkL3JwaTQvSW1hZ2UgXDxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgLWluaXRyZDxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
PGJyPg0KJmd0O8KgIMKgIMKgIMKgL21udC96cm9vdC0xMzMvX09TL0FuZHJvaWQvcnBpNC9yYW1k
aXNrLmltZyBcPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoMKg
wqAgLWRyaXZlPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAm
Z3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqA8YnI+DQomZ3Q7wqAgwqAg
wqAgwqBpbmRleD0wLGlmPW5vbmUsaWQ9c3lzdGVtLGZpbGU9L21udC96cm9vdC0xMzMvX09TL0Fu
ZHJvaWQvcnBpNC9ib290LmltZyBcPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCDCoCAtZGV2aWNlPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoHZpcnRpby1ibGstcGNpLGRyaXZlPWJvb3QgXDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqDCoMKgwqDCoMKgwqAgLWRyaXZlPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvC
oCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqBpbmRleD0xLGlmPW5vbmUsaWQ9c3lzdGVt
LGZpbGU9L21udC96cm9vdC0xMzMvX09TL0FuZHJvaWQvcnBpNC9zeXN0ZW0uaW1nIFw8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIC1kZXZpY2U8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgdmlydGlvLWJsay1wY2ksZHJpdmU9
c3lzdGVtIFw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKg
IC1kcml2ZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0
OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgPGJyPg0KJmd0O8KgIMKgIMKg
IMKgaW5kZXg9MixpZj1ub25lLGlkPXZlbmRvcixmaWxlPS9tbnQvenJvb3QtMTMzL19PUy9BbmRy
b2lkL3JwaTQvdmVuZG9yLmltZyBcPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCDCoCAtZGV2aWNlPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoHZpcnRpby1ibGstcGNpLGRyaXZlPXZlbmRvciBcPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvC
oCDCoCDCoCDCoCZndDsgLWFwcGVuZCAmcXVvdDtjb25zb2xlPXR0eUFNQTAsMzg0MDA8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgZHJtLmRlYnVnPTB4MDxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgcm9vdHdhaXQgcm9vdGRlbGF5PTU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIMKgJmd0
OyByb290PS9kZXYvbW1jYmxrMHAyPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoGFuZHJvaWRib290LmhhcmR3YXJlPXJwaTQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKg
IMKgIMKgJmd0OyBhbmRyb2lkYm9vdC5zZWxpbnV4PXBlcm1pc3NpdmU8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgc2VjdXJpdHk9c2VsaW51eDxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgc2Vs
aW51eD0xPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDsgYW5kcm9pZGJvb3QucWVt
dS5ody5tYWlua2V5cz0wPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqBhbmRyb2lkYm9vdC5sY2QuZGVuc2l0eT0xNjAmcXVv
dDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7IFRoZSBlcnJvciBJIGdldCBpbiBzaG9ydCBpcyA6PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
Jmd0OyZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIMKgJmd0
OyBbIDEuOTkzNjY4XSBpbml0OiBib29sPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZn
dDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqA8
YnI+DQomZ3Q7wqAgwqAgwqAgwqBhbmRyb2lkOjppbml0OjpCbG9ja0RldkluaXRpYWxpemVyOjpJ
bml0RGV2aWNlcyhzdGQ6OnNldCZsdDtzdGQ6OnN0cmluZyZndDspOjxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7IHBhcnRpdGlvbihzKSBub3QgZm91bmQgaW48YnI+DQomZ3Q7wqAg
wqAgwqAvc3lzLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqB3YWl0
aW5nIGZvcjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgdGhlaXIgdWV2ZW50KHMpOjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAg
wqAgwqAgbW1jYmxrMHAyLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IG1tY2Js
azBwMzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZn
dDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIMKgJmd0OyBPbmUg
dXNlciBzdWdnZXN0ZWQgdG8gOjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKg
IMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
Jmd0OyZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIMKgJmd0
OyBIaSEhISBUaGUgJnF1b3Q7L3N5cyZxdW90OyBpcyBhICZxdW90O2R5bmFtaWM8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgZnMmcXVvdDsgY3JlYXRlZCBhdDxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgcmFtIGZyb20gdGhlPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCBrZXJuZWwsIHRv
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDsgZXhwb3J0IGEgbG90IG9mPGJyPg0K
Jmd0O8KgIMKgIMKgdGhpbmdzLi4uc28gbW9zdDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqBvZiB0aGUgZmlsZXM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoG9ubHkgZXhpc3QgYXQgcnVudGlt
ZS48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIMKgJmd0OyBOb3JtYWxseSwgdGhlIHBhcnRp
dGlvbnM8YnI+DQomZ3Q7wqAgwqAgwqBmcm9tIHRoZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqBibG9jayBkZXZpY2U8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoGhhdmUgYSBzeW1saW5rIGF0
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDsgL3N5cy8mbHQ7c29tZXRoaW5nJmd0
Oy8mbHQ7Li4uJmd0OyB0aGF0PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoHBvaW50cyB0byAvZGV2Lzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgYmxvY2sgbm9kZS4gSXQgc2VlbXM8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIHRoYXQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIMKg
Jmd0OyB0aGVyZSBhcmUgbm8gc3VjaCBmaWxlcyB1bmRlcjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAvc3lzIGFjY29yZGluZyB0bzxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgd2hhdCBpbml0
IGlzIGxvb2tpbmc8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIMKgJmd0OyBmb3IuIFlvdSBj
YW4gZG91YmxlIGNoZWNrPGJyPg0KJmd0O8KgIMKgIMKgdGhpcyBhdDxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqBpbml0IHNvdXJjZTxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgY29kZSB0byBj
aGVjayB0aGU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIGV4YWN0PGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0
OyZndDvCoCDCoCDCoCDCoCZndDsgcGF0aCBidXQgSSYjMzk7bSBndWVzc2luZyB0aGF0PGJyPg0K
Jmd0O8KgIMKgIMKgeW91JiMzOTtsbDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqBoYXZlIHRvIGNoYW5nZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgdGhlIHFlbXUgYXJndW1lbnRzPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDsgcmVnYXJkaW5nIHRoZSBibG9jayBkZXZpY2Uu
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8Kg
IMKgIMKgIMKgJmd0OyBBYm91dCB1c2VyZGF0YS5pbWcgSSB0aGluazxicj4NCiZndDvCoCDCoCDC
oGl0JiMzOTtzPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoG5vcm1h
bCBzaW5jZSBpbjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgdGhlIG9sZCBkYXlzLCB0aGU8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0
O8KgIMKgIMKgIGltYWdlPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDsgd2FzIGEg
JnF1b3Q7ZW1wdHkgc3BhcnNlPGJyPg0KJmd0O8KgIMKgIMKgaW1hZ2UmcXVvdDssIHRoYXQ8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgbWVhbnMsIGF0IHRoZTxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgZmlyc3QgZmxhc2hpbmc8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIHByb2Nlc3Ms
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDsgdGhlcmUgaXNuJiMzOTt0IHVzZXJk
YXRhPGJyPg0KJmd0O8KgIMKgIMKgaW5mb3JtYXRpb24sPGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoHdlJiMzOTtyZSBqdXN0PGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmcXVvdDtmbGFzaGlu
ZyB0aGU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIHBhcnRpdGlvbiZxdW90Ozxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHdpdGggZW1wdHkgZGF0YS48YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAm
Z3Q7Jmd0O8KgIMKgIMKgIMKgJmd0OyBUa3MhISE8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKg
IMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0
OyZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIMKgJmd0OyBT
byxpbiBzaG9ydCBJIHNob3VsZDxicj4NCiZndDvCoCDCoCDCoGNoYW5nZSB0aGU8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgcWVtdSBhcmd1bWVudHM8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oHJlZ2FyZGluZyB0aGUgYmxvY2s8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIMKgJmd0OyBk
ZXZpY2UuIEkgdHJpZWQgaW4gdGhpcyB3YXkgOjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7
Jmd0O8KgIMKgIMKgIMKgJmd0OyBxZW11LXN5c3RlbS1hYXJjaDY0IFw8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIC1zbXAgNCBcPGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0
OyZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCAtbSAyMDQ4IFw8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAm
Z3Q7Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIC1jcHUgY29ydGV4LWE3MiBcPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCAtTSB2aXJ0IFw8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIC1kZXZpY2U8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgdmlydGlvLWdwdS1wY2ks
eHJlcz0xMDI0LHlyZXM9NzY4IFw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgIMKgIC1kaXNwbGF5IHNkbCxnbD1vbiBcPGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCAtZGV2aWNlIHVzYi1laGNpIFw8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAm
Z3Q7Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIC1kZXZpY2UgdXNiLWtiZCBcPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCAtZGV2aWNlPGJy
Pg0KJmd0O8KgIMKgIMKgdmlydGlvLXRhYmxldC1wY2kgXDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgLXVzYiBcPGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCAtc2VyaWFsIHN0ZGlvIFw8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIC1rZXJuZWw8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoC9tbnQv
enJvb3QtMTMzL19PUy9BbmRyb2lkL3JwaTQvSW1hZ2UgXDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgLWluaXRyZDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgPGJyPg0KJmd0O8KgIMKg
IMKgIMKgL21udC96cm9vdC0xMzMvX09TL0FuZHJvaWQvcnBpNC9yYW1kaXNrLmltZyBcPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDvCoCDCoMKgwqDCoMKgwqDCoCAtaGRhPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAvbW50L3pyb290LTEzMy9fT1MvQW5kcm9pZC9ycGk0L2Jvb3QuaW1nIFw8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCAmZ3Q7Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIC1oZGI8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoDxicj4N
CiZndDvCoCDCoCDCoCDCoC9tbnQvenJvb3QtMTMzL19PUy9BbmRyb2lkL3JwaTQvc3lzdGVtLmlt
ZyBcPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCAtaGRj
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAvbW50L3pyb290LTEzMy9fT1MvQW5kcm9pZC9y
cGk0L3ZlbmRvci5pbWcgXDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAgLWFwcGVuZDxicj4NCiZndDvCoCDCoCDCoCZxdW90O2NvbnNvbGU9dHR5QU1BMCwzODQw
MDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgZHJtLmRlYnVnPTB4MCByb290d2FpdDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAg
wqAgwqAgcm9vdGRlbGF5PTU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIMKgJmd0OyByb290
PS9kZXYvbW1jYmxrMHAyPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oGFuZHJvaWRib290LmhhcmR3YXJlPXJwaTQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIMKg
Jmd0OyBhbmRyb2lkYm9vdC5zZWxpbnV4PXBlcm1pc3NpdmU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgc2VjdXJpdHk9c2VsaW51eDxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgc2VsaW51eD0x
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDsgYW5kcm9pZGJvb3QucWVtdS5ody5t
YWlua2V5cz0wPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqBhbmRyb2lkYm9vdC5sY2QuZGVuc2l0eT0xNjAmcXVvdDs8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDsgYnV0IHRoZSBlcnJv
ciBpcyBzdGlsbDxicj4NCiZndDvCoCDCoCDCoHRoZXJlLiBEbzxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqB5b3Uga25vdyBzb21lPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqBkaWZmZXJlbnQg
YWx0ZXJuYXRpdmU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIMKgJmd0OyBibG9jayBkZXZp
Y2VzIHRvIHRyeSA/IHRoYW5rcy48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIMKgJmd0Ozxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDC
oCDCoCDCoCZndDsgLS08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIMKgJmd0OyBNYXJpby48
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZn
dDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0OyAtLTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7IE1hcmlvLjxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgLS08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoE1hcmlvLjxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgJmd0O8KgIMKgIMKgLS08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDvCoCDCoCDCoE1hcmlvLjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyAtLTxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyBNYXJpby48YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDs8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgLS08YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgTWFyaW8uPGJyPg0KJmd0O8KgIMKgIMKgICZndDs8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoC0tPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoE1hcmlvLjxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IC0tPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgTWFy
aW8uPGJyPg0KJmd0OyA8YnI+DQomZ3Q7IDxicj4NCiZndDsgPGJyPg0KJmd0OyAtLSA8YnI+DQom
Z3Q7IE1hcmlvLjxicj4NCjwvYmxvY2txdW90ZT48L2Rpdj48YnIgY2xlYXI9ImFsbCI+PGJyPjxz
cGFuIGNsYXNzPSJnbWFpbF9zaWduYXR1cmVfcHJlZml4Ij4tLSA8L3NwYW4+PGJyPjxkaXYgZGly
PSJsdHIiIGNsYXNzPSJnbWFpbF9zaWduYXR1cmUiPk1hcmlvLjxicj48L2Rpdj4NCg==
--00000000000006a7ed06213b086c--
