Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1174264wrm;
        Fri, 18 Oct 2019 09:59:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxdARcBTiPVEnm1ygsQYw/u1AfaN6uzD9g13Hww5YemV9aic4rjKjtUYJQUuIMfOlqr+c6O
X-Received: by 2002:a17:906:fac6:: with SMTP id lu6mr9474143ejb.126.1571417966452;
        Fri, 18 Oct 2019 09:59:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571417966; cv=none;
        d=google.com; s=arc-20160816;
        b=1Aif7V4mQZCiky95kDQ9xmeCICnn/HGvR0InLEgJqUPDpBRbQxNixLHOjh9ZBF1wSE
         GNkNIFN/Ww6pWMMgtOaKad79HonqS579axriMytiGy6ccfWjpXI6P1lYCcCWmhyPSd5J
         0F8ERVVBHFL3CBaBxFA43fbMaGb1wAriuY8U7w2zHnRMeeFDhnBMmyxBO01Y+QeAJzeJ
         KMjLJyPt/8jLZC7CROC5vYpa/zfBjlEDj2kmg8AKH36ceu5s4LxwOyyZE7tzmJfCgk9p
         UTf69J9cF8KGvyWxbloE1ZOwQEA3l7cP2z+4I4i6LuMQtpoDg5WQ1dJu4xr9X2DIEKa0
         w/hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=6Vw5JEKY7XK+klh3K7KSH90DzcAkWBFboMgSM3fJzrM=;
        b=LSVAVLa59I8FbwP/t1s2MSVKhzkDxd5p0sJYEDpQAgdhi+zW/XzpInUxABSGDsAuk/
         9uq8tZMWyR1WCyanE3yGk32zlgHglnhJi1K0aSu955UM7XEVqvATdougo55sPuNQeXMu
         LCaqK322w/G34BiM/gCx8iwzNxW2p+l7kOCPKqH23wLrIVNyG/nGGQWChCbVsw/vijxo
         KXPdNB8NOiWahCjlIIoGeXRwVjevsZWQznuTCIg5VV7zo0dPe6plrf+OZ2/fGoWYVpfK
         mD1SP6EG3pO7z20grMqclY6CoREwLYv4iCPTUlPy/BM0+Y8j1EO2c+GcFbE1KgAKYEQE
         Kiwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lxaF4xje;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ch10si3697065ejb.89.2019.10.18.09.59.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 09:59:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lxaF4xje;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLVb3-0001Lc-F6
	for alex.bennee@linaro.org; Fri, 18 Oct 2019 12:59:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54730)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iLVa4-0001F9-1i
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 12:58:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iLVZy-0003us-QR
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 12:58:21 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:46105)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iLVZy-0003sP-Ku
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 12:58:18 -0400
Received: by mail-ot1-x343.google.com with SMTP id 89so5513476oth.13
 for <qemu-devel@nongnu.org>; Fri, 18 Oct 2019 09:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6Vw5JEKY7XK+klh3K7KSH90DzcAkWBFboMgSM3fJzrM=;
 b=lxaF4xje6lcouaosLDnZySZ5fBy1TcoNQAIlCnOLH5LRSTA2qIQCQkEQjR+gKFFQ75
 xrYAL1Fj4iNsEyVaZUcnMmCnp/wmbsZxuFQNljgh1EBKPKQ4pmu7cLdC2Ov9DAOjxidT
 xkH8+Ur/oxxQ+UpDmkDoJmKH9Hd38rZ4gYm6vXMPHDYY2ubc5w6s+Q6XE6D+TWdBF5Vg
 ONrtRWrWwhWg3Ks/0aYVG8i2mapsmofeBOnkZxMf7EmcjypJgagVmn8EtZk3dvDBkLgl
 8jdjremQCufHb5hCj4FPjOhF70Aii48739VxN4JBJFJpSs2tS3KhNqpbVrzqCb+2dkxw
 jzTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6Vw5JEKY7XK+klh3K7KSH90DzcAkWBFboMgSM3fJzrM=;
 b=KotReqPSgGcU8cjUqa9hWO0xSxfWPIIVaqm+KqW0++sDYg+iaqCaDRSPGcA619eVWO
 OB1PLl+KI36NakGbcejXpkmwQdvo+z9/zhzipyha6rU40kDTVORppO1oL7oRxuGKzjbl
 B45zjz7ZlKHowYegnlJuxqAfqIYHsXgaxSsglBO4SeGKES/W/++OCMRjwYV7jEbpme5k
 MFG+qoDHgOFwDEsCXK8x2Fym3Bnerv+iERzE+l+uxCePXwIqZVsG8vRy6jUqHzQWjKz3
 2sn1OMrFUcFJOjHZjJU78dhg4nGRPFkDjbWC6gEyy3D0nAxZs8FQy9elkjLwWnku/vFK
 DrtA==
X-Gm-Message-State: APjAAAVPCtRCwqvYjIhiEaqa5oAf0EBeYVj9o+wzxU2zBlqyZUveuV7P
 x63lnI7TTZ8EkO1gkFeeUezI1T9e5M2OOb06m9KrHg==
X-Received: by 2002:a05:6830:4c1:: with SMTP id
 s1mr8796928otd.232.1571417895348; 
 Fri, 18 Oct 2019 09:58:15 -0700 (PDT)
MIME-Version: 1.0
References: <20191018154212.13458-1-marcandre.lureau@redhat.com>
 <20191018154212.13458-13-marcandre.lureau@redhat.com>
In-Reply-To: <20191018154212.13458-13-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Oct 2019 17:58:04 +0100
Message-ID: <CAFEAcA-Sf=rc89R+H3VwHwB52RW=BfA2VU70-OcNPx=MJD+zaA@mail.gmail.com>
Subject: Re: [PATCH 12/14] omap-gpio: remove PROP_PTR
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Corey Minyard <cminyard@mvista.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc <qemu-ppc@nongnu.org>, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LgWI8DjYtF47

On Fri, 18 Oct 2019 at 16:43, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> Since clock are not QOM objects, replace PROP_PTR of clocks with
> setters methods.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> -/* Using qdev pointer properties for the clocks is not ideal.
> - * qdev should support a generic means of defining a 'port' with
> - * an arbitrary interface for connecting two devices. Then we
> - * could reframe the omap clock API in terms of clock ports,
> - * and get some type safety. For now the best qdev provides is
> - * passing an arbitrary pointer.
> - * (It's not possible to pass in the string which is the clock
> - * name, because this device does not have the necessary information
> - * (ie the struct omap_mpu_state_s*) to do the clockname to pointer
> - * translation.)
> - */

Ah, here's what's effectively a todo comment that you could
repurpose/adapt/move.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
