Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp2845513ejs;
        Tue, 4 Jun 2024 03:26:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVZXb+C19nZqzEJicV9pYAR6YgFjt0n4OjKP9m/e3RSeZ7NjU5rivhJjqDF/j4UMw0qCpeCSTRcVBtDd2FWpVofjmEl8VhB
X-Google-Smtp-Source: AGHT+IGrALILNdJATVrPBUG68BlDfFTwKv1/3pBOBLaZTQARNiWIydqIgixfb+LYZlkNCRB1YQQJ
X-Received: by 2002:a19:7403:0:b0:523:b272:c73 with SMTP id 2adb3069b0e04-52b89569542mr6724172e87.7.1717496808805;
        Tue, 04 Jun 2024 03:26:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717496808; cv=none;
        d=google.com; s=arc-20160816;
        b=yi+gqJ9ddMn0Gq4REBj8YOkznR4sskGwAiXacn/DTFymTKxCg052/GYbOed6/EEmgi
         1fqOxI0Q5fM2MO9LF3mnsub+FFbr+2hB447J1KmbBvm7cJWBN1Ks6XrkYZQkG/XxdCvo
         7C47Wy/WtZwndDtoG8ADFHVZFTi4V23BwTBxA4fDfTALtVXK2IHSrcnvIFXk3dzGoUxx
         FYCZiqeu0E093thXiAMEp0r6lbZSAEIdK16iGu/aOFxXtXpfVg4BE/Y81g76SOmQi5KL
         AZw8ijNR2qqJaSACmwRqYHxlLSLUnE3Mn7El9zh4I6F+eXvHz82EmCV/+mBS1HxcLBS+
         5r5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=EnG003yZlqzcrtAFqjutUzPXl+aMqzkPtD0Z2fE9qrs=;
        fh=TSxQsBbPWWLwmElcWMCIUkxqH1GX2T2UdcXLEOyWjZc=;
        b=wd0NSxAFOZPAvKrlKyGLYRMCQvtMZZ2qOAo7YQTH8RBK0lKiKXeFZLKK/ESOYY7OPZ
         S81aN55vZMN0nlWEvJW0wYPxCUddb8uXOtZYqDBkhl/gUmktPvBD078bQCSHeucMjPj5
         wMbwAix1SssVcq+UVZ9I2sCsOgtg1WDfAiySlWg2A9aQFn5GA+XLpwpzpZ+JTtHWG4gz
         zI7ma6qOqrvVqIJiFN1nXYRuQCYFZ1dCUxzHg9zCXjc2sTH69ulrrNqEqFLYPgCPN1Um
         MkPx9vJt3UiehizOAmAXUmQ6G7fWNHiaiTYgaBAUnL1y6Ite1b5rbwYy+eHix/QsJxtS
         TZPw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=gNUmvS9Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-42133fcaa77si45669705e9.114.2024.06.04.03.26.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jun 2024 03:26:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=gNUmvS9Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sERNH-00035L-4E; Tue, 04 Jun 2024 06:26:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gpscrambor.4862500@gmail.com>)
 id 1sERNG-00034H-Al
 for qemu-arm@nongnu.org; Tue, 04 Jun 2024 06:26:38 -0400
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gpscrambor.4862500@gmail.com>)
 id 1sERN7-0005jr-T9
 for qemu-arm@nongnu.org; Tue, 04 Jun 2024 06:26:31 -0400
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-5b9f9e7176eso2621071eaf.2
 for <qemu-arm@nongnu.org>; Tue, 04 Jun 2024 03:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717496788; x=1718101588; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EnG003yZlqzcrtAFqjutUzPXl+aMqzkPtD0Z2fE9qrs=;
 b=gNUmvS9ZM2V3jJwhYNot0EnFlAmMWiGZ84pHkF5L05wvJE0NWGxkLbJtLzOdRGfhd+
 kAZGqxIsRKsUqmvr4qzjiXnip5tOq/B5Efo0V0bvZMzO6RNzFK7kTQql+bOrRDBXPtV/
 kuaJi7mOEl8Ku11+V4kD4iTG/eghSAss4dr07h6NJK1ooDtZca8i/mk8hhwUvSMxEfU9
 aKib4NZNFCQaMaWbU0ptuNUxnRQOX+EUwAC0ulsqRWi+S58nURvIenk1fyzvUMemOFNR
 Ab8tPU9ApQmxxKcg5IkyoVk+ur80GwuZBeWrfaeG02x+cKQ+Z1Ibxh3PDU3nOsQA8F9Z
 VHOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717496788; x=1718101588;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EnG003yZlqzcrtAFqjutUzPXl+aMqzkPtD0Z2fE9qrs=;
 b=TnAIkieh4ghEb3lvzXSDk4VQDC5HO/r05EvCIZXLIrjdGP3ivUAMqIAyJo/5E06IeS
 yN5A1KE+x7jLH+xQ1R/eopfbJaA/e4eNXd7hYnwALK9mgWXwhASnD+sqqnBRCZsvMTZO
 h7cykFagMA5VoqWs9vqXNhFL0WoDUjdgJsRkqPzOEvU0vhw6u2sHH7Wy2M2191ENC3KN
 DCrjauF7kyPsA5yVdtlo4qR7G3i0QfgeGsdHb60iz2V9LFRwvYwkWxsu4WmwgkiUP8Uu
 4S0lvr3xtA/4UysP9Wb/leyjGxv0Yw22A+t11LewzxIDq5ECJUBwz8ZhLAh8oiviN3LX
 +Kqw==
X-Gm-Message-State: AOJu0YzCmuXS4GnUusWrOxTXVwoSFiiGkMeJMu7YvE5veMpUhl/CzvIU
 Cu1XAGAO4tBfUgZZJosC6KSAakR8T/uB9pFTdx14+JPWIC04pqnYDBvF2M37kYHSu66a7QBuD/P
 6tzwBXfSge0DekaQhzsOKWKUP5Tc=
X-Received: by 2002:a05:6820:168e:b0:5b2:ff69:9814 with SMTP id
 006d021491bc7-5ba05b90531mr11341737eaf.2.1717496788106; Tue, 04 Jun 2024
 03:26:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAG3SUFynWvXY2bAbV0zeAypGL-=d4p6YV6KYpi3ho6TYnxQp0w@mail.gmail.com>
 <CAFEAcA8zBEiV1XLvM3HPDA2kxV1rrmBqhgc1_9_W5+phUCkGLg@mail.gmail.com>
In-Reply-To: <CAFEAcA8zBEiV1XLvM3HPDA2kxV1rrmBqhgc1_9_W5+phUCkGLg@mail.gmail.com>
From: Eboubaker <gpscrambor.4862500@gmail.com>
Date: Tue, 4 Jun 2024 12:26:14 +0100
Message-ID: <CAG3SUFzQzpE1iZV+tHZnEk_cbAPKCTPM0g7ofJmL8zpqMuC9sA@mail.gmail.com>
Subject: Re: Running qemu-aarch64 emulator inside Termux
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2a;
 envelope-from=gpscrambor.4862500@gmail.com; helo=mail-oo1-xc2a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, URIBL_SBL_A=0.1 autolearn=no autolearn_force=no
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
X-TUID: DY/OU1/OA833

Hi Peter, Sorry for my ignorance in advance. I am new to qemu. You
were absolutely right, I was using the wrong binary to run aarch64.
Now I used qemu-system-aarch64 and cortex-a45 cpu(that's one of my
phone's architectures i saw with cpu-z utility), the image did run
fine. But I was disappointed to see there is no difference in  I/O
performance as you have stated.

This is the command I did:
```shell
pkg install qemu-system-aarch64
qemu-img create -f raw alpine-arch64.img 2G
wget https://dl-cdn.alpinelinux.org/alpine/v3.20/releases/aarch64/alpine-vi=
rt-3.20.0-aarch64.iso
qemu-system-aarch64 -cpu cortex-a55 \
-machine virt \
-m 1024 \
-smp cpus=3D2 \
-drive if=3Dpflash,format=3Draw,read-only=3Don,file=3D$PREFIX/share/qemu/ed=
k2-aarch64-code.fd
\
-netdev user,id=3Dn1,dns=3D8.8.8.8,hostfwd=3Dtcp::2222-:22 \
-device virtio-net,netdev=3Dn1 \
-cdrom alpine-virt-3.20.0-aarch64.iso -nographic alpine-arch64.img
```

Now here's some background why I am doing this: I have restaurant
clients where they have tablets installed as the kiosk menu. I wanted
my application backend to run in the same machine as the app frontend
(interface for ordering meals). Now I want to be able to run docker on
the tablet so I installed termux https://termux.dev/en (the one in
google play is deprecated). Then I installed qemu to run docker on the
tablet without root or kvm(these kernel modules are not available in
consumer tablets).

Then I tried to build the docker image in qemu but it was taking a lot
of time (I waited like 5 hours) and when it was finally running the
server response time was very high(700ms).

I did some benchmarking. It seems that disk I/O inside Termux directly
is 100Mb/s but when I tested it inside qemu I got like 4Mb/s which I
think is definitely why I experienced The slow building time and the
long response time. Here Is the full Issue that led me to write to
this mailing list:
https://github.com/cyberkernelofficial/docker-in-termux/issues/13
somone said that I should use aarch64 instead of x86_64 so that it
matches the smart phone architecture.

Now I am kind of stuck here, What can I do to increase the I/O
performance? because a drop from 100Mb/s to 4Mb/s is a lot(25 times
reduction). I have tried different disk caching options I saw on the
manpage without success too.


On Mon, Jun 3, 2024 at 4:46=E2=80=AFPM Peter Maydell <peter.maydell@linaro.=
org> wrote:
>
> On Mon, 3 Jun 2024 at 16:41, Eboubaker <gpscrambor.4862500@gmail.com> wro=
te:
> > Then I noticed I can get better performance by using aarch64 instead of=
 x86_64 since my phone is using arm64 CPU This is what i tried:
> > ```shell
> >
> > pkg install qemu-system-arm
> > qemu-img create -f raw alpine-arch64.img 2G
> > wget https://dl-cdn.alpinelinux.org/alpine/v3.20/releases/aarch64/alpin=
e-virt-3.20.0-aarch64.iso
> > qemu-system-arm \
>
> qemu-system-arm is for 32-bit CPUs...
>
> > -machine virt \
> > -m 1024 \
> > -smp cpus=3D2 \
> > -drive if=3Dpflash,format=3Draw,read-only=3Don,file=3D$PREFIX/share/qem=
u/edk2-aarch64-code.fd \
>
> ...but this is a 64-bit BIOS image. It will never boot on this
> QEMU command line.
>
> You need to use qemu-system-aarch64 and specify a -cpu option
> that is a 64-bit CPU.
>
> If you want to actually get the speed improvement from the
> fact you're running a 64-bit guest on a 64-bit host then you
> will also need to tell QEMU to use the KVM accelerator,
> with eg '-enable-kvm'. Your phone's kernel will also
> need to support KVM, of course. I don't know how likely that
> is but I would not be too optimistic.
>
> For pure emulation, there is no particular advantage to having
> the host and target CPU architetures the same.
>
> thanks
> -- PMM
