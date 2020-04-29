Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp627145lfm;
        Wed, 29 Apr 2020 07:19:50 -0700 (PDT)
X-Google-Smtp-Source: APiQypLdRqbB7UvFj24m6LXmqm3d27VcpMDU32VHGDyr6Cmr2y8pQl9pJTH2ZLYjt8PmU+Ok2Snl
X-Received: by 2002:a37:e214:: with SMTP id g20mr33455246qki.317.1588169990168;
        Wed, 29 Apr 2020 07:19:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588169990; cv=none;
        d=google.com; s=arc-20160816;
        b=QSS4Umn+xnpIdbgJRhWpVuE7gEdnNif0yvm9o2gx+HZjkkULDhplfM+FBNLzpxZBUG
         LUCV68rWhL9DsGpK7bJwXV2tcZk4fLwTJVOfU4Pzy2ST88qG9/IBdiIoTy218EP6UDVN
         yoQXzVBlb0Il8G5+7k7j5vGRLqAI3a8MAO8tM5a2pMrB5BXNUPwrJzfUXE5G9ZBoXstD
         LSq7f7U3MnjPC457WTz8WGTGhnOyQoM6JXpSxKuGKzT3TScmR5Y1f82dK6UZPnZTiPme
         7RzEgepFbA/gTR0U3NKyQrPpPDSeABCo63t5fYeCH+GYjsuZ/0FKzr1H3JryuDt6NreR
         F5rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=wl2HW2d2NHrNYnWWykZcNKyi/UUsvgu+A6lE9OuphoQ=;
        b=R/SlGaf4FW8VsHIFBOJRLSONihO+NFRUZ7o3vwUw+XMxFUtRzUt4nYTNZbC3tzPRpS
         TjMyZn653lTyaxPe0O/rHy8WoLC7jRysXZkKSc/6j5Di8JZ8qTacH45ri4JhiPuaS1mc
         8hSrEUTHQ9QGa60YSx2KH8whdVJxaf2F5b9tAoJamqFRVaElPD0Hs8yodfdDgvAmBU8Y
         QmEeOAEvhOHN81MLBvVegLXv09wxB/wonOpiqBLPAtjUsytAxmZa7Ia6Fzub8bdpg1Lr
         2fkHHZ7DPjSeJquHIQgZJhc5SSDDgfoZ2XpTSneRFu+zh8nRdnh8AEipx4Pja98FrhBx
         tzcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mM8KbQ70;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id d6si12580662qvp.167.2020.04.29.07.19.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Apr 2020 07:19:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mM8KbQ70;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jTnYz-0000KG-E2
	for alex.bennee@linaro.org; Wed, 29 Apr 2020 10:19:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46388)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jTnYd-00007r-Pg
 for qemu-arm@nongnu.org; Wed, 29 Apr 2020 10:19:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jTnYO-0002aH-9Y
 for qemu-arm@nongnu.org; Wed, 29 Apr 2020 10:19:27 -0400
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c]:37045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jTnYN-0002Yg-Ri
 for qemu-arm@nongnu.org; Wed, 29 Apr 2020 10:19:11 -0400
Received: by mail-oo1-xc2c.google.com with SMTP id g14so455160ooa.4
 for <qemu-arm@nongnu.org>; Wed, 29 Apr 2020 07:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wl2HW2d2NHrNYnWWykZcNKyi/UUsvgu+A6lE9OuphoQ=;
 b=mM8KbQ70OwfH77GOKP0WW1bkmko5xWQJlajEI07+R4QFAVuqF2v+GK6dffIDyZ+AHs
 FGgxCQx1GsbvYmleE2QLAbtpSnC9src4QdMXI92IloZcRFfUyu614ZgvuQz2Yz4GqvU0
 /zLkapifMrYrJLDjQem5Pa1S8eX1Cx5FN8edZ6ViyiWtxSyp3RyOWsvvPf6JqGDnFIoi
 oQ2LVmygbvjsuRwCKRtilbnft908ApcMyXNfkJl6si/70PbTRO52HNwVeXRnKroRNoQo
 ddb+6McVFdlH1nX81vJTDfY0uxOECKoj9g0Zgne5+auggCs97e2JaKpdWW7pP5Hn/YaC
 ymWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wl2HW2d2NHrNYnWWykZcNKyi/UUsvgu+A6lE9OuphoQ=;
 b=DOH8wJhB9rdoS2DophyiKrcQyJKtMR8eB9j0BUViS21jwNcc7Jt75lOvPolWkL7itx
 1UFAE4v6eZfxVlvg5mIRz7A7Nnb6XHxZviDNLyHEGC3wEeWPVMme6sxpdc5jfA+8xfnT
 enTb6YZRptzqUmOS5jUI4Ob3+7/LS3DU2r1ZogYgQyj8TSPikph1dX6KAy9VhSKXnXpN
 FIsb3g0Pi+5Tr5G5XOeCwwyIyT7D9lAxMa9PZ63k6FbgACaUzymHdnqBKzT1ySFAdbCh
 McdPRX9oPNVgjKra/Fog3TccVG1vJbYfcDXnM4MvcgLWc07CIsXBY57tWdZcXX0eHZsl
 e0Dw==
X-Gm-Message-State: AGi0PuYt7qzKqhHGY0TYaEtB6WEjKkDx8eXon482rFlTgVpHazWEbQHM
 c0w8YawcTiFB88ErwlutzAzGHBHKxDc3+P+NF0FkFA==
X-Received: by 2002:a4a:8253:: with SMTP id t19mr27354181oog.69.1588169950346; 
 Wed, 29 Apr 2020 07:19:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ5bNgcK9S-1RH=CdqB_wfPu+qPMYZFWWgso06QHfD-NOiRFuQ@mail.gmail.com>
In-Reply-To: <CAJ5bNgcK9S-1RH=CdqB_wfPu+qPMYZFWWgso06QHfD-NOiRFuQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 29 Apr 2020 15:18:58 +0100
Message-ID: <CAFEAcA8nBcwuPJC=Zc_H0ojzphNX4+STU7p9vreXZv55yrcxyA@mail.gmail.com>
Subject: Re: Guest has not initialized the display (yet).
To: Prabhnoor Ghuman <technochicken2038@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-oo1-xc2c.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::c2c
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: leif@nuviainc.com, qemu-arm <qemu-arm@nongnu.org>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vuVVPhn4xOg/

On Wed, 29 Apr 2020 at 10:04, Prabhnoor Ghuman
<technochicken2038@gmail.com> wrote:
>
> Over the last couple of days, I have been trying to run a QEMU system due=
 to a server that I was setting up. I wanted to protect my actual computer =
from anything malicious that could get onto it due to a person being able t=
o upload. The speed wasn't great and I realised the problem was likely the =
fact that the x86_64 emulator doesn't allow for multithreading TCG (well I =
can't find anything saying it does anyway), and I had the option enabled. I=
 therefore decided I could go use a different architecture because the oper=
ating system I would like to use is openSUSE, and it supports aarch64 as we=
ll. I have an installer ISO and a QCOW2 disk image. I tried booting the sys=
tem and then the error came up: "Guest has not initialized the display (yet=
)".

This isn't an error. It's just telling you that the guest has
not yet done anything to cause graphics to be displayed yet.
Usually that's because the guest doesn't have support for
the graphics device or it's not been configured to put out
graphical output at all, or because the guest has just crashed
without doing anything.

> Here are the command line parameters I am using at the moment:
>
> qemu-system-aarch64 -cdrom "C:\Users\GHU0002\Downloads\openSUSE-Tumblewee=
d-NET-aarch64-Snapshot20200421-Media.iso" -drive file=3DDrive.qcow2 -m 2G -=
smp 4 -machine sbsa-ref -usbdevice tablet -net nic -net user -accel tcg,thr=
ead=3Dmulti -vga xenfb -display gtk

The major thing you're missing here is that you haven't
specified a firmware/bios (UEFI) image. This machine won't
boot without one.

Why are you using 'xenfb' ? I wouldn't really expect that to
work except in a Xen specific setup; you're more likely to
have success with either virtio graphics or with a normal
pci vga device.

The other option would be to not use graphics at all and
just get the guest to use a serial console.

I've cc'd the sbsa-ref maintainers to see if they have a
good tutorial/basic command line to start with.

> Sidenote: I am using the 'sbsa-ref' machine because it is the only one th=
at seemed to support everything I needed: 4 Cores, 2GB RAM, USB, and a CD d=
rive. If it is just a problem with the machine, please suggest another that=
 I can use.

Since your list doesn't include "graphics" the 'virt'
board is another one that you could try, if you're happy
with only serial. (You'll still need to provide it with
either a UEFI bios image file or a kernel to boot, though:
it won't boot if provided with only a cdrom iso file.)

You might also find that using libvirt/virt-manager
rather than running QEMU directly is an easier approach
since it will generally know what devices it needs to put
on the command line to get a working setup.

thanks
-- PMM
