Received: by 10.223.159.82 with SMTP id f18csp948189wrg;
        Tue, 21 Nov 2017 09:28:55 -0800 (PST)
X-Google-Smtp-Source: AGs4zMaFO+TYQhKlbIEBoBDDlHNv58iAP/imADCBENOpniz//S7rTg9IKBqUHJdckmmUdiGW3NK8
X-Received: by 10.129.141.5 with SMTP id d5mr11091591ywg.184.1511285335710;
        Tue, 21 Nov 2017 09:28:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511285335; cv=none;
        d=google.com; s=arc-20160816;
        b=a5qIeehoSRP5INwcnVM3K6JIR024cXrLndR+fbNfao1fq0sVqek31PX6RkxjLB0VAr
         2S/b5WtE2S7KtVZcuYVYgnTQ3JfYVAW/lvVB26xuqE1cQPreHVZ0kVCQMIKeSjYMbcU6
         DiqQtT5RmAle9wdKfSOdag7Dm7tDY/iJufgjZDbw5zOBrL4U4vYndYiIc5cWmaab5NFo
         5torRTaRu8wrCaR7Gho0dPyMtrgPEdtsqcrr2hk1Y1TZ9UeUpHSGsSiwntoYZxIPVFGi
         qMAP6SZqYhkDgJyAsDBQJsVWdTJ2x9+NRW1MOibvtvZSReaaGrN3wAD8Ziv0+Id8YcvK
         5PFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=9PwKvCVpGO4s/xhXPVaveNQ5v0J/7nYI0rrDTnOYcCE=;
        b=aARrkjSFtEljiQbiWzAnNjCsBOseFBbYp9vbX3S2B4dJtihUFKVGjSeHX0ZxbHHo03
         sWoGlvv1/nwjxf+y8vFGuz8NixL3fTb2bgbgF08eU0fGymtKgT9xoTgylVq5PF02Nvu8
         J7Gw+vPB7cJ5vmINGf0LSxmoGb27kEd7C6rHF2x3UMMDUKjPb4GNWpLmMrwAPRZ+Kjk+
         thLwxB5+t/m8d/3jo4L8woAL8vFglzH9/GAs7so4RB8laCPthfCQTIdncJCu9XIyzjZz
         nlLagJC/Usp9Ee+piC3+XOqFAJoAqwsxq+JGW9RBcux4YarbdlovZe3tPMqPSO8PVdY5
         ctoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WhIQ++CA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a124si2950016ywc.611.2017.11.21.09.28.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Nov 2017 09:28:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WhIQ++CA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35689 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eHCLv-0001vq-6P
	for alex.bennee@linaro.org; Tue, 21 Nov 2017 12:28:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57935)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eHCLI-0001Uo-P5
	for qemu-arm@nongnu.org; Tue, 21 Nov 2017 12:28:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eHCL4-0006Sk-LP
	for qemu-arm@nongnu.org; Tue, 21 Nov 2017 12:28:16 -0500
Received: from mail-ot0-x235.google.com ([2607:f8b0:4003:c0f::235]:33360)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eHCL3-0006PW-MO
	for qemu-arm@nongnu.org; Tue, 21 Nov 2017 12:28:02 -0500
Received: by mail-ot0-x235.google.com with SMTP id s12so11199726otc.0
	for <qemu-arm@nongnu.org>; Tue, 21 Nov 2017 09:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=9PwKvCVpGO4s/xhXPVaveNQ5v0J/7nYI0rrDTnOYcCE=;
	b=WhIQ++CAGdxDGk4oGdHPKW0X4SAPPIujGLqDQ9zrcHaRKaJ+prY/tT6F1XLhNmn9/V
	gm1dkojCq39di2/KYfew/FVjiDkz+OsEqjvRlt2k6mAhCLRxsRBCw1ffvb0XeLEUQ3yA
	CnyB9za1Bb82YbUk7P+VJq1rnQtn+bPQdvHEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=9PwKvCVpGO4s/xhXPVaveNQ5v0J/7nYI0rrDTnOYcCE=;
	b=t/iF7QJGqJmOfq7gqJFEnX0vrrOloOINrA3igiYJ9A3VzPZ7z1UCGLqi5d/jsgYAXo
	IPTRgKtJN+q260wzKb3/ajeEZ/eqDuASktWpOLXRIFX4qrAIj1nJ0LjGZPEJ4US3KMAk
	wDzEsIcThCf3RgGim+QwXn5WBupBSg7gWl6nl2eP21pC+5CVrq4pKzHng8cD3g1gTZ7k
	gjT3H+DRzv/xmX7mPDXN/gkk1ov5w9fvMV2dnhvYn9dirydSzv6M1snDJ2AFFljPGDXY
	I/lOm+pSYcdRJ40EjLLFbJ89jOWmoKZJW+OwudZBb4pAACw2GqvMDfVNC1w9kDHCV5W2
	Yx3g==
X-Gm-Message-State: AJaThX4izaRFLW/RLyl9HP3an+0ybMIf00Jf+gB/7Ij4YZcUdCp2e4uY
	C7KaX6mXTbXDzfkVQ8LoOms0LzCJntQ8duDTwuacgg==
X-Received: by 10.157.80.24 with SMTP id a24mr10594812oth.335.1511285280543;
	Tue, 21 Nov 2017 09:28:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Tue, 21 Nov 2017 09:27:40 -0800 (PST)
In-Reply-To: <20171106154813.19936-4-andrew.smirnov@gmail.com>
References: <20171106154813.19936-1-andrew.smirnov@gmail.com>
	<20171106154813.19936-4-andrew.smirnov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Nov 2017 17:27:40 +0000
Message-ID: <CAFEAcA_+9fz4zzWg6najN0pn6-=jRMzz2zbHneZxca=SYyxDKA@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::235
Subject: Re: [Qemu-arm] [PATCH v3 03/30] imx_fec: Change queue flushing
 heuristics
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Andrey Yurovsky <yurovsky@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O8N3HSlCpOPq

On 6 November 2017 at 15:47, Andrey Smirnov <andrew.smirnov@gmail.com> wrot=
e:
> In current implementation, packet queue flushing logic seem to suffer
> from a deadlock like scenario if a packet is received by the interface
> before before Rx ring is initialized by Guest's driver. Consider the
> following sequence of events:
>
>         1. A QEMU instance is started against a TAP device on Linux
>            host, running Linux guest, e. g., something to the effect
>            of:
>
>            qemu-system-arm \
>               -net nic,model=3Dimx.fec,netdev=3Dlan0 \
>               netdev tap,id=3Dlan0,ifname=3Dtap0,script=3Dno,downscript=
=3Dno \
>               ... rest of the arguments ...
>
>         2. Once QEMU starts, but before guest reaches the point where
>            FEC deriver is done initializing the HW, Guest, via TAP
>            interface, receives a number of multicast MDNS packets from
>            Host (not necessarily true for every OS, but it happens at
>            least on Fedora 25)
>
>         3. Recieving a packet in such a state results in
>            imx_eth_can_receive() returning '0', which in turn causes
>            tap_send() to disable corresponding event (tap.c:203)
>
>         4. Once Guest's driver reaches the point where it is ready to
>            recieve packets it prepares Rx ring descriptors and writes
>            ENET_RDAR_RDAR to ENET_RDAR register to indicate to HW that
>            more descriptors are ready. And at this points emulation
>            layer does this:
>
>                  s->regs[index] =3D ENET_RDAR_RDAR;
>                  imx_eth_enable_rx(s);
>
>            which, combined with:
>
>                   if (!s->regs[ENET_RDAR]) {
>                      qemu_flush_queued_packets(qemu_get_queue(s->nic));
>                   }
>
>            results in Rx queue never being flushed and corresponding
>            I/O event beign disabled.
>
> To prevent the problem, change the code to always flush packet queue
> when ENET_RDAR transitions 0 -> ENET_RDAR_RDAR.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: yurovsky@gmail.com
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> diff --git a/include/hw/net/imx_fec.h b/include/hw/net/imx_fec.h
> index 62ad473b05..4bc8f03ec2 100644
> --- a/include/hw/net/imx_fec.h
> +++ b/include/hw/net/imx_fec.h
> @@ -252,6 +252,7 @@ typedef struct IMXFECState {
>      uint32_t phy_int_mask;
>
>      bool is_fec;
> +    bool needs_flush;
>  } IMXFECState;

This field isn't needed any more in this version of the patch, I think?

otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
