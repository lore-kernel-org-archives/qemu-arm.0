Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp2333930ejs;
        Mon, 3 Jun 2024 08:41:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXx9z0YeS2kB7Qjmbl90B7DsFdaJjODDSifrcrc4FzqT4dagpgx2rMI4CskjAra7x2tF86PlWXMQW6QCnRp9TXW/5KxFdBl
X-Google-Smtp-Source: AGHT+IGbLcexMXYKur2n1p8TsmCO0J0SiIxlXJmvxE+XgBe/+OUJuFqkdHBsVXlY8kvIAF4cW8u7
X-Received: by 2002:a05:620a:408a:b0:794:af72:3cd with SMTP id af79cd13be357-794f5b8f720mr1198628685a.0.1717429288575;
        Mon, 03 Jun 2024 08:41:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717429288; cv=none;
        d=google.com; s=arc-20160816;
        b=Fk4gWCwjTkYMxSTkYj1KY3xq+jrhpw+LxW9PX6X5xckCHhsxNw7iMhDvgMgAer2Ba7
         17VBIVbm9DryZtSIAy15ttIfaPY9wBwHvdmowbsrxKEszqhT1McLuLEKY1OWWIduLRDJ
         a6FOiPNi0AAWF/xYpWTsvqedAs16c6gvkPrG1msxvGCJGeLi5WDPBX5qlttvZ8GIhRej
         XhEQY+uYOiXvn1+Bjz3Lbr0NQmmwk3UMM/iTwpFAZ0MckbbUFs4xqptomlhlK8AChw36
         aqkS3hd2d83sWN7++Y4iZT287VCcIzeKYdWjXAcEpm1hjgVsQ8q7QP+zHVEjaYQgoxx3
         XfoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=53zmldwt7bh1sOPOLCPQWtZDa7mwrlYw1ROjWULNkxo=;
        fh=DBwo5oYV+Zl89FPcGyBzo6mnqwnGCoM6YpiQGc4/RNc=;
        b=ZvBVFrdgzHgJEmag1ZnWIzDvcdhGhy0hLDRka0aBpHvKdhe0L3ZOjSM7Fdi6rRBIhe
         PxsaSnuAq5Wldr+LsRFxAsCkOwfPrqEscZHgGyMg//7ccflhoyqL4KajECIYmXtMx9Wv
         hnnaSnIMqobywH3z00IoNRXoRgyV166er/M9bTEVvxXHKIPva/5pGDpxf2m6s67pEKB6
         PQgSsfE7MrdvS/WzYvxd7GNObLKXhe8pmJ98P1uwiNh7HjHKIPGfNBU5gZ7qrXDWmZJZ
         klk1kTA5qFYkLM4LeXoyENoTtwKnz7uSZFrg4AhUJmd74pyKVsc6MQVA0jxwI6oLeOxV
         QS4w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=K7t8gWYb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-794f2f05ab1si838987685a.105.2024.06.03.08.41.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Jun 2024 08:41:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=K7t8gWYb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sE9ns-0000hg-AF; Mon, 03 Jun 2024 11:40:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gpscrambor.4862500@gmail.com>)
 id 1sE8ot-0002tp-OV
 for qemu-arm@nongnu.org; Mon, 03 Jun 2024 10:37:55 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gpscrambor.4862500@gmail.com>)
 id 1sE8or-00069v-IP
 for qemu-arm@nongnu.org; Mon, 03 Jun 2024 10:37:55 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-24c9f297524so2313581fac.0
 for <qemu-arm@nongnu.org>; Mon, 03 Jun 2024 07:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717425469; x=1718030269; darn=nongnu.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=53zmldwt7bh1sOPOLCPQWtZDa7mwrlYw1ROjWULNkxo=;
 b=K7t8gWYbxihaAGBAKaG4g+7W0xFW6/kIgoKBa7MHHHyJ9IIUaYQ16BvOrFyifEvS6b
 y/ExejRH/L6ve8iMCqMw3dzHeZ2UVq0raABYIPasnKGP21fwB32uqsjMTeOjpHYkl469
 4hvoLrgBR5b2XuHuWqkFESRh1XjRuWYD/sRYTPpmUd34jRVoOu9NhGbqnLmz3/1g8WcH
 ZWU7IvJ5bjjpfOwFj/ZweejiQApnDtvuC7bA+Yz8Nt4Rxv7gLwaKzGwKcexVw1dTJ7Is
 ibpzuevYCUkBqcZWUdHrfD8kjq5pYY60DR2DINQ66Z9iM0c/bjFf981oob26UVRr2qLW
 aX6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717425469; x=1718030269;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=53zmldwt7bh1sOPOLCPQWtZDa7mwrlYw1ROjWULNkxo=;
 b=N0mLMdafkarjsH3XKOxpC5JWb4Ew81cp8WMGB5eTT6THk2kWKzeFDqUGPveSZzlmGn
 xfsLECfX50DKciwLdwh6p97JhrukJkU2w81gxlKElU8coO7CkVkynUZ6AWF2L/2IEsXK
 hI1e4ls+4v1+FZzGsiu6ESK7vJVWjDLIWi9dv1ZRSW5IzrcwPKd3V7yBT37hyqjfk6k/
 pz86Dxyshr73oOyTJwGKLFJXH6VFyGwmgqiTai8Gn3gTT6Fv1ZgkHF/+K098ZWLcN3zG
 ZI6mxj1CkoFMsfHGtoPWgYEsNd88m2hNBF1q6p3LjRFRWcuIe2RBO/uwLT/dvmKoodAL
 lUZw==
X-Gm-Message-State: AOJu0YxwUEQerPoBbuXlGCZEHuSGXpTksgcJBsShN/J1XjrolTHPCj2u
 FWsxskjnnBfU3vKs1uH8ua3u/CxBAPIEahwp2hTU0YK4tL8aqP6IztQUX6xQQSEyl/0CjMaa1IT
 Dtqwwnjzu/mSOKQeG+0U1GGmspSJ1b0zVRg3tGA==
X-Received: by 2002:a05:6870:f70b:b0:24f:cff2:5087 with SMTP id
 586e51a60fabf-2508bcb409dmr10534026fac.41.1717425468956; Mon, 03 Jun 2024
 07:37:48 -0700 (PDT)
MIME-Version: 1.0
From: Eboubaker <gpscrambor.4862500@gmail.com>
Date: Mon, 3 Jun 2024 15:37:36 +0100
Message-ID: <CAG3SUFynWvXY2bAbV0zeAypGL-=d4p6YV6KYpi3ho6TYnxQp0w@mail.gmail.com>
Subject: Running qemu-aarch64 emulator inside Termux
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000000167d90619fd4703"
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=gpscrambor.4862500@gmail.com; helo=mail-oa1-x33.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 03 Jun 2024 11:40:54 -0400
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
X-TUID: GgAZQkWUvJ3O

--0000000000000167d90619fd4703
Content-Type: text/plain; charset="UTF-8"

Hello I tried to run qemu-system-x86_64 to run an alpine image it worked
fine using this command:
```shell

pkg install qemu-utils qemu-common qemu-system-x86_64-headless wget -y
wget http://dl-cdn.alpinelinux.org/alpine/v3.19/releases/x86_64/alpine-virt-3.19.1-x86_64.iso

qemu-img create -f qcow2 alpine.img 5G

qemu-system-x86_64 \
-machine q35 -m 1024 \
-smp cpus=2 -cpu qemu64 \
-drive if=pflash,format=raw,read-only=on,file=$PREFIX/share/qemu/edk2-x86_64-code.fd
\
-netdev user,id=n1,dns=8.8.8.8,hostfwd=tcp::2222-:22 \
-device virtio-net,netdev=n1 \
-cdrom alpine-virt-3.19.1-x86_64.iso \
-nographic \
alpine.img

```
It booted normally and I installed the system in the disk normally.
Then I noticed I can get better performance by using aarch64 instead of
x86_64 since my phone is using arm64 CPU This is what i tried:
```shell

pkg install qemu-system-arm
qemu-img create -f raw alpine-arch64.img 2G
wget https://dl-cdn.alpinelinux.org/alpine/v3.20/releases/aarch64/alpine-virt-3.20.0-aarch64.iso
qemu-system-arm \
-machine virt \
-m 1024 \
-smp cpus=2 \
-drive if=pflash,format=raw,read-only=on,file=$PREFIX/share/qemu/edk2-aarch64-code.fd
\
-netdev user,id=n1,dns=8.8.8.8,hostfwd=tcp::2222-:22 \
-device virtio-net,netdev=n1 \
-drive file=alpine-arch64.img,format=raw,if=virtio \
-cdrom alpine-virt-3.20.0-aarch64.iso \
-nographic

```
But it didn't do anything. I waited for 30 mins with no output on the
terminal. It just hangs there.

--0000000000000167d90619fd4703
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr">Hello I tried to run qemu-system-x86_64 to run a=
n alpine image it worked fine using this command:<br>```shell<br><pre style=
=3D"margin-top:6px;margin-bottom:0px;padding:0px;border:0px;font-size:0.75r=
em;vertical-align:baseline;box-sizing:border-box;border-radius:4px;line-hei=
ght:1rem;max-width:90%;background-clip:border-box"><div class=3D"gmail-code=
Container__49b46" style=3D"margin:0px;padding:0px;border:0px;font-weight:in=
herit;font-style:inherit;font-family:inherit;vertical-align:baseline;outlin=
e:0px"><code class=3D"gmail-scrollbarGhostHairline__00100 gmail-scrollbar_b=
61b2b gmail-hljs gmail-shell" style=3D"margin:0px;padding:0.5em;font-weight=
:inherit;font-style:inherit;font-size:0.875rem;vertical-align:baseline;line=
-height:1.125rem;display:block;overflow-x:auto;border-radius:4px">pkg insta=
ll qemu-utils qemu-common qemu-system-x86_64-headless wget -y
wget <a href=3D"http://dl-cdn.alpinelinux.org/alpine/v3.19/releases/x86_64/=
alpine-virt-3.19.1-x86_64.iso">http://dl-cdn.alpinelinux.org/alpine/v3.19/r=
eleases/x86_64/alpine-virt-3.19.1-x86_64.iso</a>

qemu-img create -f qcow2 alpine.img 5G

qemu-system-x86_64 \
-machine q35 -m 1024 \
-smp cpus=3D2 -cpu qemu64 \
-drive if=3Dpflash,format=3Draw,read-only=3Don,file=3D$PREFIX/share/qemu/ed=
k2-x86_64-code.fd \
-netdev user,id=3Dn1,dns=3D8.8.8.8,hostfwd=3Dtcp::2222-:22 \
-device virtio-net,netdev=3Dn1 \
-cdrom alpine-virt-3.19.1-x86_64.iso \
-nographic \
alpine.img</code></div></pre><span style=3D"margin:0px;padding:0px;border:0=
px;font-family:&quot;gg sans&quot;,&quot;Noto Sans&quot;,&quot;Helvetica Ne=
ue&quot;,Helvetica,Arial,sans-serif,&quot;Apple Symbols&quot;;font-size:16p=
x;vertical-align:baseline;outline:0px"></span>```<br><div dir=3D"ltr">It bo=
oted normally and I installed the system in the disk normally.</div><div di=
r=3D"ltr">Then I noticed I can get better performance by using aarch64 inst=
ead of x86_64 since my phone is using arm64 CPU This is what i tried:</div>=
<div>```shell<br><pre style=3D"margin-top:6px;margin-bottom:0px;padding:0px=
;border:0px;font-size:0.75rem;vertical-align:baseline;box-sizing:border-box=
;border-radius:4px;line-height:1rem;max-width:90%;background-clip:border-bo=
x"><div class=3D"gmail-codeContainer__49b46" style=3D"margin:0px;padding:0p=
x;border:0px;font-weight:inherit;font-style:inherit;font-family:inherit;ver=
tical-align:baseline;outline:0px"><code class=3D"gmail-scrollbarGhostHairli=
ne__00100 gmail-scrollbar_b61b2b gmail-hljs gmail-shell" style=3D"margin:0p=
x;padding:0.5em;font-weight:inherit;font-style:inherit;font-size:0.875rem;v=
ertical-align:baseline;line-height:1.125rem;display:block;overflow-x:auto;b=
order-radius:4px">pkg install qemu-system-arm
qemu-img create -f raw alpine-arch64.img 2G
wget <a href=3D"https://dl-cdn.alpinelinux.org/alpine/v3.20/releases/aarch6=
4/alpine-virt-3.20.0-aarch64.iso
qemu-system-arm">https://dl-cdn.alpinelinux.org/alpine/v3.20/releases/aarch=
64/alpine-virt-3.20.0-aarch64.iso
qemu-system-arm</a> \
-machine virt \
-m 1024 \
-smp cpus=3D2 \
-drive if=3Dpflash,format=3Draw,read-only=3Don,file=3D$PREFIX/share/qemu/ed=
k2-aarch64-code.fd \
-netdev user,id=3Dn1,dns=3D8.8.8.8,hostfwd=3Dtcp::2222-:22 \
-device virtio-net,netdev=3Dn1 \
-drive file=3Dalpine-arch64.img,format=3Draw,if=3Dvirtio \
-cdrom alpine-virt-3.20.0-aarch64.iso \
-nographic</code></div></pre><span style=3D"margin:0px;padding:0px;border:0=
px;font-family:&quot;gg sans&quot;,&quot;Noto Sans&quot;,&quot;Helvetica Ne=
ue&quot;,Helvetica,Arial,sans-serif,&quot;Apple Symbols&quot;;font-size:16p=
x;vertical-align:baseline;outline:0px"></span>```<br><div>But it didn&#39;t=
 do anything. I waited for 30 mins with no output on the terminal. It just =
hangs there.</div></div><div><br></div></div></div></div></div></div></div>

--0000000000000167d90619fd4703--
