Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp918330njb;
        Tue, 18 Feb 2025 11:30:16 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWD3Tf3e5UUhWtYTkebSYghiTbf6LriA+s5SuEgYCBL70dbD6mRzOWY83fuShmA7SQXj0Rk0/PIAAuPYw==@linaro.org
X-Google-Smtp-Source: AGHT+IGvCdE0kv6x9DRdWx37wbVqVIpqJc4VUMUkgq5jqwIhbSnpOZl/n+Q18Fsq+XsNweIxeReo
X-Received: by 2002:a05:6808:4d9:b0:3f3:fb4e:f5b6 with SMTP id 5614622812f47-3f3fb4ef7e2mr5558160b6e.15.1739907015770;
        Tue, 18 Feb 2025 11:30:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739907015; cv=none;
        d=google.com; s=arc-20240605;
        b=Vu17HYQzdeRHe/O0cP3caGT7vRiRhaLBU0VGE4M4jz1ERwlQYWMXr7HleHD6jVfwNq
         qB/dehmqYLUWbOZfNDqUM6RE5Yea/f/6dc1YFWk37yQ6mfzmyrhGUpeSUu7IaYQ9+0lk
         /qdNCjStnrT6CCCymYrqqQSVc91FMIAOz59n/PDPrQr+xEj3DlWImsZDZ6gP9kgikMSf
         cf0Dv0dzWskQ67m2vnopU3tIFT3iuTFBEDgGLBrPYq1CIG3luMrkTSlZq60Fzfwq/KU9
         c0JeO15se7N0DVKgXSTlVxiciMJmw7PZU1dJJAmhep30HiY7D6stzgSuR0o69jI0Efnj
         1O7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-id:mime-version:user-agent:references:message-id
         :in-reply-to:subject:cc:to:from:date:dkim-signature;
        bh=7ITAOt6cpCpDVb6glnbNyNWtoGH9hbLBZWVJwHOBmdU=;
        fh=dipJbbVY3fTpEZP61/OJLsAdHLtrYaNIIVxbVGEOHok=;
        b=X+7Bg6UHSRX7c6pgNO7ZGAI5k1MNCkQxL5K0Q27aqd/KYTXPtBNoWsfaG0Yu4NdpFz
         C5nhHlQ/IfD/J91FSCixueppShoIzJqDzBeQvlgbL7U5Zgp28i5sHn5nELQeNqvV5pXL
         Va/vuiST3c3fj5zWghURSqBIhsT95D8PJhyXiFa3DUa3Vxvq3jzVNocHbgLnRg5zTzuX
         9svNBA1EDeVMCcDMaHs5+1ejW0rEsSsCI0a5H81yRqlQ1VlUN66h1uHxYsF3O0NwCQuE
         aBaT/i3U1MDkmN/XG774eNsNI0x8YW70PanXfjV9f8/Vj8KWEz+H1CBsG5WFc4bYqWpO
         QUTw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Q9b0bNzo;
       spf=pass (google.com: domain of sstabellini@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=sstabellini@kernel.org;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <sstabellini@kernel.org>
Received: from dfw.source.kernel.org (dfw.source.kernel.org. [139.178.84.217])
        by mx.google.com with ESMTPS id 5614622812f47-3f3da9264f3si11825503b6e.53.2025.02.18.11.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 11:30:15 -0800 (PST)
Received-SPF: pass (google.com: domain of sstabellini@kernel.org designates 139.178.84.217 as permitted sender) client-ip=139.178.84.217;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Q9b0bNzo;
       spf=pass (google.com: domain of sstabellini@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=sstabellini@kernel.org;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8D0DF5C544A;
	Tue, 18 Feb 2025 19:29:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3091AC4CEE2;
	Tue, 18 Feb 2025 19:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739907014;
	bh=D0SmKXnflUF1ENknpmghSoPwbGW+dV6iEGQTiKLiGkM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Q9b0bNzo2GKJ3P5Xaenndxxjunnkiowf73I3YoZMkGzz/9m3DI5W6nlgJZbijiPdE
	 y05lVFMBHQkfh29eo3Hia6sY/NC6jyoMwGGIS4ox0x1aA9txS0r3CSNtf47kb7XXn3
	 2jw0eyggkxm0fYjvyx72eXB8AzDztykIyjtKjKH3IH6K+v4fMajnUj6LQJ1OXH5JTH
	 PSwyUXYMNnC71CMOUmru8M9Q8+uBE5k5nGif0Wl9US2432af4b9M1yHqUyJ7WRhu03
	 ZA/NlJiRNrF5IKgzuIDvdc+iGOLJFcUhQEGwjz/Pk1FsfXo0Mz0T6lvieZMho5k24X
	 jVzw/uqhFU4WA==
Date: Tue, 18 Feb 2025 11:30:10 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
    qemu-devel@nongnu.org, David Woodhouse <dwmw2@infradead.org>, 
    "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>, 
    Paul Durrant <paul@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony PERARD <anthony@xenproject.org>, 
    "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Thomas Huth <thuth@redhat.com>, 
    Richard Henderson <richard.henderson@linaro.org>, 
    qemu-arm <qemu-arm@nongnu.org>, 
    =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
    =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PULL 3/9] meson: Disallow 64-bit on 32-bit Xen emulation
In-Reply-To: <9b22d0ff-5902-4ec7-ae54-e974482ebd87@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2502181120100.1085376@ubuntu-linux-20-04-desktop>
References: <20250208205725.568631-1-richard.henderson@linaro.org> <20250208205725.568631-4-richard.henderson@linaro.org> <aeaf0f19-0f14-4a02-9c51-09521e7c75e1@linaro.org> <9b22d0ff-5902-4ec7-ae54-e974482ebd87@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1975763779-1739906423=:1085376"
Content-ID: <alpine.DEB.2.22.394.2502181121020.1085376@ubuntu-linux-20-04-desktop>
X-TUID: 9XRPU//dSvos

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1975763779-1739906423=:1085376
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2502181121021.1085376@ubuntu-linux-20-04-desktop>

On Tue, 18 Feb 2025, Andrew Cooper wrote:
> On 18/02/2025 11:20 am, Philippe Mathieu-Daudé wrote:
> > Hi,
> >
> > Adding Xen community.
> >
> > On 8/2/25 21:57, Richard Henderson wrote:
> >> Require a 64-bit host binary to spawn a 64-bit guest.
> >>
> >> Reviewed-by: Thomas Huth <thuth@redhat.com>
> >> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> >> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >> ---
> >>   meson.build | 9 +++++++--
> >>   1 file changed, 7 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/meson.build b/meson.build
> >> index 1af8aeb194..911955cfa8 100644
> >> --- a/meson.build
> >> +++ b/meson.build
> >> @@ -304,9 +304,14 @@ else
> >>   endif
> >>   accelerator_targets = { 'CONFIG_KVM': kvm_targets }
> >>   -if cpu in ['x86', 'x86_64']
> >> +if cpu == 'x86'
> >> +  xen_targets = ['i386-softmmu']
> >> +elif cpu == 'x86_64'
> >>     xen_targets = ['i386-softmmu', 'x86_64-softmmu']
> >> -elif cpu in ['arm', 'aarch64']
> >> +elif cpu == 'arm'
> >> +  # i386 emulator provides xenpv machine type for multiple
> >> architectures
> >> +  xen_targets = ['i386-softmmu']
> >
> > Is actually someone *testing* this config? I'm having hard time building
> > it, so am very suspicious about how it runs, and start to wonder if I'm
> > not just wasting my time (as could be our CI).
> 
> It was intentional.  I believe it was Stefano (CC'd) who introduced it.
> 
> Xen uses qemu-system-i386 everywhere because qemu-system-x86_64 doesn't
> make compatible VMs.  I'm not sure why; I suspect it's bugs in the Xen
> machine types, but I don't know QEMU well enough to be sure.
> 
> Another thing that (at least, was) tied to qemu-system-i386 was using
> Qemu as a XenBlk <-> QCOW adapter, at which point it wasn't even really
> a system emulator, just a paravirtual disk implementation.
> 
> This is, AIUI, what ARM wants with the xenpv machine.  If there's a
> better way to do this, please do say.
> 
> 
> Looking through Xen's CI, I can't see any of the ARM builds building
> QEMU at all.  I think it's quite possible it's not tested any more.

Hi all,

I answered on a similar question recently:
https://marc.info/?l=qemu-devel&m=173862237031104&w=2

In short, while QEMU for x86 HVM guest is required, QEMU is not required
for x86 PVH guests, and ARM guests. The model is different and QEMU is
only providing PV backends or virtio backends if the VM is configured
that way. You can have a fully functional VM without QEMU (or other
virtio backends provider).

In this context, the original integration of QEMU for Xen on ARM was
done reusing the qemu-system-i386 target. But Edgar recently upstreamed
a much better newer machine that is cleaner, simpler and faster: XenPVH
(see hw/arm/xen-pvh.c and hw/i386/xen/xen-pvh.c). So we don't need
qemu-system-i386 on either ARM32 or ARM64 anymore.

Moreover, for ARM32 specifically, I think it would be OK to remove QEMU
support for ARM32 Xen machines in general because of the reasons I wrote
in the other email and above here.
--8323329-1975763779-1739906423=:1085376--
