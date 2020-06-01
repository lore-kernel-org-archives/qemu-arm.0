Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2981029lfc;
        Mon, 1 Jun 2020 03:46:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwWjYZ4OPpvXBPHGpQwi2RoHT85HQfpZOcE5LB71DRoJrZWaFKfagMKL9zQN/QvoCPxypeS
X-Received: by 2002:a25:1344:: with SMTP id 65mr32993785ybt.183.1591008370356;
        Mon, 01 Jun 2020 03:46:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591008370; cv=none;
        d=google.com; s=arc-20160816;
        b=I9ekJfikuNvKhDMrUuRSruiM5ZpY2DS6WcHmW+E54OozKnWsOTziwwXswCBvyNM9PM
         T98qpFLe0k5xPZbt/FNlfp5sjDj9XaAvI9glefGSvcIUTf/miEiRQ7N2UKNR/CikDUCN
         Z1V27eKW3HhV2ULCUUKKFeoFgxud9/G7exN2iH7HYbYsqAZ8hawMEem2dndHcWfGRN5m
         ZjEw46JbkO8O9OE/dach9HD9veeqsEu/VSKqK2MVqQEN6ilWKdqwjnw5+RRKLxEzglGv
         a3MTU9RvnQtEsjFIYo3bh8eCgDTkkBvMbJFdbzcgPsu940MX/zrzgz5nk07vHqs/2K6t
         nO3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=P8oanKv6ySihFAuQFSVe2IXsbtNjLXc3uCG4fPgHb0k=;
        b=vT3T26rj4Buq5j9HCbc1Mc1MnZ87HtI9USMPnTubjbA8vtoQOWer6V/7aask1nRREE
         zrhdNp/Xe6J8VLIGd2QzjflTDMMe7HsB/+CRX8Y6IgSAA0QyCtznH/bnvpFtRBYb0Rs3
         Dtm/j9QvfdJ+PVW28uSR/D26bJgCPEesfpFeXoP1Vd8tcG2j0n0xrokk1Nn4LpWns3Gt
         ECUeFBX4m5HrkVm2/WTJkuRn83qbbptwdICNny3LWlrmZ6HbnnE7AJiokJY9pBjKKZX/
         zkWldXR0w4OHsooaaO18/AFQk3mfmy91UPIHkZd0Fs6YClQI+eHH3yJVwJAcrq6559Xz
         cAag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I+Z4Yath;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t13si9803650ybl.463.2020.06.01.03.46.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jun 2020 03:46:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I+Z4Yath;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jfhxJ-00078V-Lb
	for alex.bennee@linaro.org; Mon, 01 Jun 2020 06:46:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jfhxA-00077j-5W
 for qemu-arm@nongnu.org; Mon, 01 Jun 2020 06:46:00 -0400
Received: from mail-oo1-xc44.google.com ([2607:f8b0:4864:20::c44]:43185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jfhx8-0005SR-5E
 for qemu-arm@nongnu.org; Mon, 01 Jun 2020 06:45:59 -0400
Received: by mail-oo1-xc44.google.com with SMTP id n31so532601ooi.10
 for <qemu-arm@nongnu.org>; Mon, 01 Jun 2020 03:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=P8oanKv6ySihFAuQFSVe2IXsbtNjLXc3uCG4fPgHb0k=;
 b=I+Z4Yathuh8v8CfqHlZWYAXiL78S051sjFCFc5+VvNzN9uLauDTceBJP6TUC2fc4u5
 /R4Y1sGn5D6QNo+LxZHua10THni3b44AVG75fpoA70Nb+OxQWlk3tgoG0Kzd/7bIxwCh
 m/ez4adAp+R91akPug4n8EtD7m/epCDMBilpjZTyfJzp/4jfOAfDedVQtRatK4/c1J+M
 7QSxXM32ouq7Y6CFMMJLc7eshQ2UnMGX6WytjFkSw2lDbjER7+rj34Xoniqt+///WNJa
 0hL8qBkLxKyvpXh1qUz2oMAvQpJ0/F1R31PJNXaurQBg9nN68Ez2+pFk12DflF/H2FqE
 5ITw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=P8oanKv6ySihFAuQFSVe2IXsbtNjLXc3uCG4fPgHb0k=;
 b=KJK+I+BfGXOVTWZ6eRdv2GeGAbqlHsUoNrWFdzFLm82r4Ibh3upmWcylJIhg9r1Ztx
 ebs8gPclyP6PE3IIjUGVwVgoha4HYkTc59A7xsFt23GfFdE9qPA94BRMwh3wq0SbRmOX
 1xIAJFklVQPLf298YqDmqoA0I51KZ9XBJjSgGX/mRenWZGTZ5nz62EzmQLj1YgxZ2VOS
 C9g6Hk6jXVWn0pOqCmOquYqNaxw7bL1J/YKy4EyiSnDDhTktgzRYGgKj4j4znD6E9sPT
 DvJ8aZ0AaEYTyI98jnGb47HnC6YjgxV4BTI5SNIMhB3RmuVYK5dyYe94byWpy9ivBZqs
 FKdA==
X-Gm-Message-State: AOAM530Fijk6+NRLN1GK39A4bQJXea7Yd8Q9N3BWdR2LpqA5eW7HZpVV
 jg9n9CtuSpiMOxi6lNh6oXsMukCjfkdWLWrCMO/SdA==
X-Received: by 2002:a4a:a2c4:: with SMTP id r4mr15206136ool.20.1591008356696; 
 Mon, 01 Jun 2020 03:45:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200531175425.10329-1-f4bug@amsat.org>
 <20200531175425.10329-6-f4bug@amsat.org>
 <CAFEAcA9CkBy=e3EmJhKko9XGbL7A_E_vedm8jt_H3+Gr6yzbhA@mail.gmail.com>
 <2e78619d-543b-55b7-f241-7652274fcf4a@amsat.org>
In-Reply-To: <2e78619d-543b-55b7-f241-7652274fcf4a@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Jun 2020 11:45:45 +0100
Message-ID: <CAFEAcA-zcNUEoSS0was=Sd4d7VUDZGEhV5aDinkxKi_z2NHF2w@mail.gmail.com>
Subject: Re: [PATCH 5/6] exec: Restrict 32-bit CPUs to 32-bit address space
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::c44;
 envelope-from=peter.maydell@linaro.org; helo=mail-oo1-xc44.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-s390x <qemu-s390x@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: afQMTp201rAA

On Mon, 1 Jun 2020 at 09:09, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
> On 5/31/20 9:09 PM, Peter Maydell wrote:
> > [*] Strictly speaking, it would depend on the
> > maximum physical address size used by any transaction
> > master in the system -- in theory you could have a
> > 32-bit-only CPU and a DMA controller that could be
> > programmed with 64-bit addresses. In practice the
> > CPU can generally address at least as much of the
> > physical address space as any other transaction master.
>
> Yes, I tried the Malta with 32-bit core, while the GT64120 northbridge
> addresses 64-bit:

> From "In practice the CPU can generally address at least as much of the
> physical address space as any other transaction master." I understand
> for QEMU @system address space must be as big as the largest transaction
> a bus master can do".

That depends on what happens for transactions that are off the end
of the range, I suppose -- usually a 32-bit CPU system design will
for obvious reasons not put ram or devices over 4GB, so if the
behaviour for a DMA access past 4GB is the same whether there's
nothing mapped there or whether the access is just off-the-end then
it doesn't matter how QEMU models it. I haven't tested to see what an
off-the-end transaction does, though.

I'm inclined to say that since 'hwaddr' is always a 64-bit type we should
stick to having the system memory address space be64 bits.

> I think what confuse me is what QEMU means by 'system-memory', I
> understand it historically as the address space of the first CPU core.

Historically I think it was more "there is only one address space and
this is it": it wasn't the first CPU's address space, it was what *every*
CPU saw, and what every DMA device used, because the APIs
pre-MemoryRegion had no concept of separate address spaces at all.
So system-memory starts off as a way to continue to provide those
old semantics in an AddressSpace/MemoryRegion design, and we've
then gradually increased the degree to which different transaction
masters use different AddressSpaces. Typically system-memory
today is often "whatever's common to all CPUs" (and then you
overlay per-CPU devices etc on top of that), but it might have
less stuff than that in it (I have a feeling the arm-sse SoCs put
less stuff into system-memory than you might expect). How much
freedom you have to not put stuff into the system-memory address
space depends on things like whether the guest architecture's
target/foo code or some DMA device model on the board still uses
APIs that don't specify the address space and instead use the
system address space.

thanks
-- PMM
