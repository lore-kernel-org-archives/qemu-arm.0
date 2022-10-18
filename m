Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp2780860ejn;
        Mon, 17 Oct 2022 17:35:07 -0700 (PDT)
X-Received: by 2002:a5e:a811:0:b0:6bc:4534:875c with SMTP id c17-20020a5ea811000000b006bc4534875cmr394480ioa.151.1666053307338;
        Mon, 17 Oct 2022 17:35:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666053307; cv=none;
        d=google.com; s=arc-20160816;
        b=Ql29GCqSjvKMZ5gTS08whFGcuMU63+HopnhsmqF4nQUO/ctUewcOuX2MSP3wbs8USR
         3n5d8Qv/7JOXBUO1jy1yLQLel9nvlYvsLLjUd5/g/Mm8SWFhEGQ50g1DfD0mml/VOfHP
         jL9EWXz+1CIIiN6+uuZjMCAqZFvcK/QyeEI1JfvspESk+TqF2Eh6/OIrGmqmcR3vJ6Ar
         szo5xb35VX+N0swqkGqQ8dQzk1BogwciTL6hGlDf0cm/UU2c7+FSgdLcR4cpHGF0GZtp
         nyA85AIOt/uhmSfCqBcGky9Tav02uoJ5WkIFR7Vx8Fn3MWr+dT+m8pbJIKLaKpJznJqz
         VK8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vE6t4MD2VpTczhThceiMSriM1RVeuGlWNewRT1sYejY=;
        b=RLEUuzj1sOP6PwepOyNC11kX9rJBQBIKsWVd6atOTc0uOIrkW4LITcMR7A7meGocno
         0oGgIydyD4WLij5nAv2RfD0mvGvLNWzGt11ZX2GElrXAqk/16AabI4DNLAX4OKNr/cw/
         gMpulZFdLXq3Se2Fgnz95l/iiRgIgXiM8OIl1jl3i49OJoMN5EjWxYXo8QhPQ+iydfKZ
         JcfB4Qz48Ij44q69HckvdmWGoevnDujaP6ANFk4xPeeb8CXhztadztw39xLt9VlEVCkb
         QPyVVz8ZSzBAhny6KjyyvIBgGDIA9sjdpkT+W/HPqGIIHwBcOo4HVKIYJAgU1ZxnpB13
         1aQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=Wk1NdQaO;
       spf=pass (google.com: domain of paxi.three@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=paxi.three@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <paxi.three@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p7-20020a927407000000b002f8f406781dsor3379775ilc.50.2022.10.17.17.35.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 17 Oct 2022 17:35:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of paxi.three@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=Wk1NdQaO;
       spf=pass (google.com: domain of paxi.three@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=paxi.three@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vE6t4MD2VpTczhThceiMSriM1RVeuGlWNewRT1sYejY=;
        b=Wk1NdQaOSXqfIYjagiZe3rsU4omOe1f0YqdQO53oJ0vYTYqb/fVW6v4u2rPjV3ETCO
         vUEcunMr8RMua72d/0/82UoyucfKQ0gXWIDdnWGOIu42cC0oQqrKwxIQmZfzL2I/IZOj
         mBxM8FNk45kP6JU/iMNeWM1O2YDOGA62HLlUvs4jZm8QA5AIcvZYImlHyopAR65Sff2S
         47brvvVLFq4gKPAV8qPVs1ARkQaaB4cgrU9QaFg+JmvRqaDa82WuMzQDR8wBhVxmXE9T
         JheOZKQ3fdQEScQnFVN+J1GfzpfFN8sV9RMfqwsMw1pSui358MimH1KMisbPRI0hofkJ
         CC5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vE6t4MD2VpTczhThceiMSriM1RVeuGlWNewRT1sYejY=;
        b=ckLclEpcCqG19BBSH0md6eaSfBJ93w45qTGbT4xxeyM1JWWfatNSxtwnkBYZ/gVUQf
         tE3jCbPZpcNuLxn2JpDoe8BMuobZf6loBsiXGJhZCs+0fhb94qT6K5nEFyI9CNlYSuKJ
         RuWdwLsEXkH8s126sYi7tTvsc/XYVMbD6Qc1KhvvR4aiozjAj708nv5Kgu70kD7MbsdF
         Bxt44j+Nfmvb7Z394LyBrMq6yrbQjGRARmFZQWqh0wjDKyD5iDoiUHyN5E/mYNdpqcze
         738YvWYaAUb3HogFuokJFiOLgZMWA5N6k4nAsvxVdeH4HUzMc9a1J89UjEPR2ybH85y1
         uMdw==
X-Gm-Message-State: ACrzQf3kpY9+2I1qQbZgzrLmUJfK3tgsaLFp+CHpRCgjo/P9MHEkVKNS
	zt3D1htMAjPPWSDmjSBNGRDaNRKU3JW1xXnQ9HlEtQ4p
X-Google-Smtp-Source: AMsMyM4pgWkxK5YfQR967Mtpi1ZUlSSl/YJEgxMzNKGiFEmnZPefSIK+wRwzudPJoUDdmkFd/U1Hr5zzvlXHXVPPe9s=
X-Received: by 2002:a92:c9cd:0:b0:2f9:8c46:b487 with SMTP id
 k13-20020a92c9cd000000b002f98c46b487mr447860ilq.280.1666053306703; Mon, 17
 Oct 2022 17:35:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAChpoR45q6huduz7J7jrOrJz3gqHYT+jr1j=QKnfmPbj=wd_pg@mail.gmail.com>
 <878rlee4yf.fsf@linaro.org>
In-Reply-To: <878rlee4yf.fsf@linaro.org>
From: =?UTF-8?B?4K6k4K6+4K6a4K+GIOCvqQ==?= <paxi.three@gmail.com>
Date: Tue, 18 Oct 2022 06:04:54 +0530
Message-ID: <CAChpoR7HyJxQpmg-LhtAmH1k=yOLE-2mGM9=mfJao0e_zqXHRA@mail.gmail.com>
Subject: Re: Running server from within qemu
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000085e28305eb4443c7"
X-TUID: L1rBNWNhK3YJ

--00000000000085e28305eb4443c7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

I tried what you suggested.  I have some observations.

Before going into that that:

The file /etc/config/network within my OpenWRT has:

config interface 'loopback'
option device 'io'
option proto 'static'
option ipaddr '127.0.0.1'
option netmask '255.0.0.0'

config globals 'globals'
option url_prefix 'fd0d:5e50:c550::/40'

config device
option name 'br-lan'
option type 'bridge'
list ports 'eth0'

config interface 'lan'
option device 'br-lan'
option proto 'static'
option ipaddr '192.168.0.201'
option netmask '255.255.255.0'
option ip6assign '60'

config interface 'wan'
option device 'eth1'
option proto 'dhcp'

config interface 'wan6'
option device 'eth1'
option proto 'dhcpv6'

Q: Do I need to make any chsnges in the above file and try?
Note: I actually tried changing the confirmation of 'br-lan' as 'dhcp' and
removing ipaddr, netmask and ip6assign, but no major change in the overall
behaviour.

Without applying the change '-netdev.....' suggested by you and with having
two '-nic user', which you pointed out, when I ran 'ifconfig', I got:
br-lan   Link encap:Whether......
              inet address:192.168.0.201 ..
              :
eth0        Link encap:Whether......
                /*no inet addr*/
                 :
eth1         Link encap:Whether......
                 inet addr:10.0.2.15..
                  :
lo               Link encap:Local Loopback
                 inet addr:127.0.0.1..
                 :
With this configuration I am able to access host-network & internet from
within OpenWRT running on QEMU.  But, this is the same configuration where
I couldn't hit the http server running on port 8000 within OpenWRT from the
host OS, which is the issue which I mentioned in my first email.  FYI, from
the host OS, I was trying to hit http://192.168.0.201:8000 . The IP address
of my host OS is 192.168.0.101

Before trying your suggestion, I just thought of reloading qemu with just a
single '-nic user' and when I ran 'ifconfig' within OpenWRT, I got the
following: (see, eth1 is missing)

br-lan   Link encap:Whether......
              inet address:192.168.0.201 ..
              :
eth0        Link encap:Whether......
                /*no inet addr*/
                 :
lo               Link encap:Local Loopback
                 inet addr:127.0.0.1..
                 :

And I couldn't hit any of the external servers from within army/OpenWRT and
hitting http://192.168.0.201:8000 from host OS also failed.

Now, I tried the option you suggested as '-netdev
user,id=3Dunet,hostfwd=3Dtcp::9000-:8000 -device virtio-net-pci,netdev=3Dun=
et'
alone (without any '-nic user's) so that I can try hitting
http://192.168.0.201:9000 from host OS.  After loading OpenWRT on QEMU, I
tried 'ifconfig' and I got:
br-lan   Link encap:Whether......
              inet address:192.168.0.201 ..
              :
eth0        Link encap:Whether......
                /*no inet addr*/
                 :
lo               Link encap:Local Loopback
                 inet addr:127.0.0.1..
                 :

Which is very similar to the previous case

Here also, I couldn't hit any of the external servers from within
army/OpenWRT and hitting http://192.168.0.201:9000 from host OS also
failed.  Hitting http://192.168.0.101:9000 also failed.

Am I missing anything?

On Mon, Oct 17, 2022, 10:57 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:

>
> =E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AF=86 =E0=AF=A9 <paxi.three@gmail.com> wri=
tes:
>
> > Hi,
> >
> > I am new to using QEMU.  Is it possible to host a simple http/tcp serve=
r
> on a Linux which is running on qemu, without any
> > accompanying vm (KVM), and hit that http server from the host OS (say
> Windows)? What options should I choose in army
> > (command line args) to run any TCP based server from within qemu?
> >
> > As of now I use the following to start my OpenWRT Linux on QEMU:
> > $ qemu-sysyem-arm -M vert-2.9 -kernel openwrt-22.03.1-armvirt-32-zImage
> -no-reboot -nographic -drive
> > file=3Dopenwrt-32-rootfs-ext4.img,if=3Dvirtio,format=3Draw -append
> "root=3D/dev/vda" -m 1G -nic user -nic user
> >
>
> You have two nics in the command line. Anyway using a proper split
> -netdev/-device specification:
>
>   -netdev user,id=3Dunet,hostfwd=3Dtcp::2222-:22 -device
> virtio-net-pci,netdev=3Dunet
>
> which in this case forwards tcp port 2222 on the host to port 22 on the
> guest. Just don't expect brilliant performance.
>
>
> > Thankyou
>
>
> --
> Alex Benn=C3=A9e
>

--00000000000085e28305eb4443c7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"auto">Hi Alex,<div dir=3D"auto"><br></div><di=
v dir=3D"auto">I tried what you suggested.=C2=A0 I have some observations.=
=C2=A0=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">Before goin=
g into that that:</div><div dir=3D"auto">=C2=A0</div><div dir=3D"auto">The =
file /etc/config/network within my OpenWRT has:</div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">config interface &#39;loopback&#39;</div><div dir=
=3D"auto">option device &#39;io&#39;</div><div dir=3D"auto">option proto &#=
39;static&#39;</div><div dir=3D"auto">option ipaddr &#39;127.0.0.1&#39;</di=
v><div dir=3D"auto">option netmask &#39;255.0.0.0&#39;</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">config globals &#39;globals&#39;</div><div d=
ir=3D"auto">option url_prefix &#39;fd0d:5e50:c550::/40&#39;</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">config device</div><div dir=3D"auto">=
option name &#39;br-lan&#39;</div><div dir=3D"auto">option type &#39;bridge=
&#39;</div><div dir=3D"auto">list ports &#39;eth0&#39;</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto"><div dir=3D"auto">config interface &#39;lan&=
#39;</div><div dir=3D"auto">option device &#39;br-lan&#39;</div><div dir=3D=
"auto">option proto &#39;static&#39;</div><div dir=3D"auto">option ipaddr &=
#39;192.168.0.201&#39;</div><div dir=3D"auto">option netmask &#39;255.255.2=
55.0&#39;</div><div dir=3D"auto">option ip6assign &#39;60&#39;</div><div di=
r=3D"auto"><br></div><div dir=3D"auto"><div dir=3D"auto">config interface &=
#39;wan&#39;</div><div dir=3D"auto">option device &#39;eth1&#39;</div><div =
dir=3D"auto">option proto &#39;dhcp&#39;</div><div dir=3D"auto"><br></div><=
div dir=3D"auto"><div dir=3D"auto">config interface &#39;wan6&#39;</div><di=
v dir=3D"auto">option device &#39;eth1&#39;</div><div dir=3D"auto">option p=
roto &#39;dhcpv6&#39;</div><div dir=3D"auto"><br></div><div dir=3D"auto">Q:=
 Do I need to make any chsnges in the above file and try?=C2=A0=C2=A0</div>=
<div dir=3D"auto">Note: I actually tried changing the confirmation of &#39;=
br-lan&#39; as &#39;dhcp&#39; and removing ipaddr, netmask and ip6assign, b=
ut no major change in the overall behaviour.</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">Without applying the change &#39;-netdev.....&#39; sug=
gested by you and with having two &#39;-nic user&#39;, which you pointed ou=
t, when I ran &#39;ifconfig&#39;, I got:</div><div dir=3D"auto">br-lan=C2=
=A0 =C2=A0Link encap:Whether......</div><div dir=3D"auto">=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet address:192.168.0.201 ..</div><div dir=
=3D"auto">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 :</div><div dir=
=3D"auto">eth0=C2=A0 =C2=A0 =C2=A0 =C2=A0 Link encap:Whether......</div><di=
v dir=3D"auto">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*no=
 inet addr*/</div><div dir=3D"auto">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0:</div><div dir=3D"auto">eth1=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0Link encap:Whether......</div><div dir=3D"auto">=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0inet addr:10.0.2.15..</div>=
<div dir=3D"auto">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 :</div><div dir=3D"auto">lo=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0Link encap:Local Loopback</div><div dir=3D"auto">=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0inet addr:127.0.0.1..<b=
r></div><div dir=3D"auto">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0:</div><div dir=3D"auto">With this configuration I am able to =
access host-network &amp; internet from within OpenWRT running on QEMU.=C2=
=A0 But, this is the same configuration where I couldn&#39;t hit the http s=
erver running on port 8000 within OpenWRT from the host OS, which is the is=
sue which I mentioned in my first email.=C2=A0 FYI, from the host OS, I was=
 trying to hit <a href=3D"http://192.168.0.201:8000">http://192.168.0.201:8=
000</a> . The IP address of my host OS is 192.168.0.101</div><div dir=3D"au=
to"><br></div><div dir=3D"auto">Before trying your suggestion, I just thoug=
ht of reloading qemu with just a single &#39;-nic user&#39; and when I ran =
&#39;ifconfig&#39; within OpenWRT, I got the following: (see, eth1 is missi=
ng)</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div dir=3D"auto">br=
-lan=C2=A0 =C2=A0Link encap:Whether......</div><div dir=3D"auto">=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet address:192.168.0.201 ..</div><=
div dir=3D"auto">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 :</div><d=
iv dir=3D"auto">eth0=C2=A0 =C2=A0 =C2=A0 =C2=A0 Link encap:Whether......</d=
iv><div dir=3D"auto">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /*no inet addr*/</div><div dir=3D"auto">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:</div><div dir=3D"auto">lo=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Link encap:Local Loopback</div><div d=
ir=3D"auto">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i=
net addr:127.0.0.1..<br></div><div dir=3D"auto">=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:</div></div><div dir=3D"auto"><br></div=
><div dir=3D"auto">And I couldn&#39;t hit any of the external servers from =
within army/OpenWRT and hitting <a href=3D"http://192.168.0.201:8000">http:=
//192.168.0.201:8000</a> from host OS also failed.</div><div dir=3D"auto"><=
br></div><div dir=3D"auto">Now, I tried the option you suggested as &#39;-n=
etdev user,id=3Dunet,hostfwd=3Dtcp::9000-:8000 -device virtio-net-pci,netde=
v=3Dunet&#39; alone (without any &#39;-nic user&#39;s) so that I can try hi=
tting <a href=3D"http://192.168.0.201:9000">http://192.168.0.201:9000</a> f=
rom host OS.=C2=A0 After loading OpenWRT on QEMU, I tried &#39;ifconfig&#39=
; and I got:</div></div></div></div></div><div dir=3D"auto">br-lan=C2=A0 =
=C2=A0Link encap:Whether......</div><div dir=3D"auto">=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 inet address:192.168.0.201 ..</div><div dir=3D"=
auto">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 :</div><div dir=3D"a=
uto">eth0=C2=A0 =C2=A0 =C2=A0 =C2=A0 Link encap:Whether......</div><div dir=
=3D"auto">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*no inet=
 addr*/</div><div dir=3D"auto">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0:</div><div dir=3D"auto">lo=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0Link encap:Local Loopback</div><div dir=3D"auto"=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0inet addr:12=
7.0.0.1..<br></div><div dir=3D"auto">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0:</div><div dir=3D"auto"><br></div><div dir=3D"auto=
">Which is very similar to the previous case</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">Here also, I couldn&#39;t hit any of the external serv=
ers from within army/OpenWRT and hitting <a href=3D"http://192.168.0.201:90=
00">http://192.168.0.201:9000</a> from host OS also failed.=C2=A0 Hitting <=
a href=3D"http://192.168.0.101:9000">http://192.168.0.101:9000</a> also fai=
led.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Am I missing anythi=
ng?</div><div dir=3D"auto"><br></div><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Mon, Oct 17, 2022, 10:57 PM Alex Benn=C3=A9e =
&lt;<a href=3D"mailto:alex.bennee@linaro.org" target=3D"_blank" rel=3D"nore=
ferrer">alex.bennee@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex"><br>
=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AF=86 =E0=AF=A9 &lt;<a href=3D"mailto:paxi.t=
hree@gmail.com" rel=3D"noreferrer noreferrer" target=3D"_blank">paxi.three@=
gmail.com</a>&gt; writes:<br>
<br>
&gt; Hi,<br>
&gt;<br>
&gt; I am new to using QEMU.=C2=A0 Is it possible to host a simple http/tcp=
 server on a Linux which is running on qemu, without any<br>
&gt; accompanying vm (KVM), and hit that http server from the host OS (say =
Windows)? What options should I choose in army<br>
&gt; (command line args) to run any TCP based server from within qemu?<br>
&gt;<br>
&gt; As of now I use the following to start my OpenWRT Linux on QEMU:<br>
&gt; $ qemu-sysyem-arm -M vert-2.9 -kernel openwrt-22.03.1-armvirt-32-zImag=
e -no-reboot -nographic -drive<br>
&gt; file=3Dopenwrt-32-rootfs-ext4.img,if=3Dvirtio,format=3Draw -append &qu=
ot;root=3D/dev/vda&quot; -m 1G -nic user -nic user<br>
&gt;<br>
<br>
You have two nics in the command line. Anyway using a proper split<br>
-netdev/-device specification:<br>
<br>
=C2=A0 -netdev user,id=3Dunet,hostfwd=3Dtcp::2222-:22 -device virtio-net-pc=
i,netdev=3Dunet<br>
<br>
which in this case forwards tcp port 2222 on the host to port 22 on the<br>
guest. Just don&#39;t expect brilliant performance. <br>
<br>
<br>
&gt; Thankyou<br>
<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
</blockquote></div></div>

--00000000000085e28305eb4443c7--
