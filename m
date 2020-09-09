Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp422888lfq;
        Wed, 9 Sep 2020 06:25:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzbCV0aNtdQCZWlCH8o93ewFFa+VDa6SRq6SAFlptT6xQKzPppXQdSxU7uuXNVyHZtDj8dx
X-Received: by 2002:a25:3792:: with SMTP id e140mr5189985yba.379.1599657907678;
        Wed, 09 Sep 2020 06:25:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599657907; cv=none;
        d=google.com; s=arc-20160816;
        b=RyAUPaLqZ1L9dgNGXJEUNAKUQr6DXI3TkXBg5jrz7tnu8bIxmMV/SEjsj5obg3bSNp
         ahy9xAW2oqErTrUdXTwP0Opyr8cXzen5ogKj9xb23rgoADucbUDRPvriuPixiyMd8BAC
         K/fVyaM/MUl06ITNCrlYbjDlunBP1PnWwC5xYylfbUxQZwiOVEh2gdT8H+M8cla/ZrpJ
         WwoSdQDC3uVo9ncw9O9isGN0qisLC991D8CEI6YadYGIa95q6FWsFPEJADkuIc4XLFxE
         pIkxMdt50448pQI3o1eLy1oPtK30h9fGnPCifKW+NV8ccNrHoVsRF2+cmQOM0n+Wi8IX
         PU2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=WZ34cWNxEE29ZHGeDca0Y5fIi3J8/dynHLnNo8kKlfY=;
        b=kA2g+LgBTmU16KOke3bQZyc66VIpOC7Uk52LZVIl1E0U9tH9YKCAexLTQYCS+sJpMd
         hot1YAU45q26MXokpvPtWqP0sBZToYunHJUNqf+BtFBvy4HvMGmDF3mSQcZEnkhlGQ0G
         akntQ8Dcd3KuMUQ7TqVMJY1lIV0tcc1Er7yWigGcVl3i2y6pNz8cBujqpkoXp19/Ijo5
         9JbFsRiq+DD9oCWnZTfuKyaTFn9zKLVLEaiq1qfFixzpPY9uuoS+q1FmE/hRAal915Zr
         /dWBII4uo7Y9Tdd3oBGzNS/Y8hFgGidJM/lQdSrQZ92tO/WRIWunnNssRRKoSVzVDhiY
         WJ4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="atQ/Ghuy";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x19si2908266ybs.274.2020.09.09.06.25.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Sep 2020 06:25:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="atQ/Ghuy";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kG05z-0004V2-2u
	for alex.bennee@linaro.org; Wed, 09 Sep 2020 09:25:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kG04e-0002HM-JW
 for qemu-arm@nongnu.org; Wed, 09 Sep 2020 09:23:44 -0400
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:46470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kG04c-0004Xa-AW
 for qemu-arm@nongnu.org; Wed, 09 Sep 2020 09:23:44 -0400
Received: by mail-ed1-x543.google.com with SMTP id a12so2586989eds.13
 for <qemu-arm@nongnu.org>; Wed, 09 Sep 2020 06:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WZ34cWNxEE29ZHGeDca0Y5fIi3J8/dynHLnNo8kKlfY=;
 b=atQ/GhuyMtltCF4TDWd51HwygjimAA+n6tlAw0K8ssc+8giV6gTYBJR+LfSeTIYI4L
 8K8yWQ1CHMkOfemuFc2VzuCFpEQGN9DdVj2K17ubUaGC3burYAMqRj3bj0TI24RYJFfn
 JNbFOFncgA9CKMIDCgmZha5ufAxSjZiLZ6iLm3vZfhCJ4aDArBUwT0RQ/U7Y/X8mR9wy
 ibCHHv6UBlLyOxDhXn1piJQJmF789Kgdug6Z9Sp8GUWRElhFISvu1lmTzUFyC/K6C188
 k36F2fVLk0TNg7ebUUCA31ZarFkt3tqyPtPx5SFrNL5kN2bfHRPXGPbnfu+S4urJpYJN
 WvSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WZ34cWNxEE29ZHGeDca0Y5fIi3J8/dynHLnNo8kKlfY=;
 b=FqXeiZp6asT4l1No3wncIAe5xmMYlg1c+pWh0NE0tER6SzY7zKasXnGhDgA/e2kpTU
 Ev8kEHurtGunJPi1N/Okn8goG2JNvBs2qQadrUPVnkLN6V/Bd500VdfrUUU2AqHOHZER
 TTkkbPFyJpzGFtA3E7Ua/OGi4YvVk44N50zTTDG9r3rbaTy7mT3AAOagsXsG3LemES20
 WcknrHI+V8ceBDgL8TH3x29/mRkodSMn/0umm7ch8709UyZvDrSS08CBT2zMonYFyGEd
 Q2dflqggiw/upwei6HnPzr0pNsjOa4b2FRkL6RrycdkESl6ct62WqpbE5qf10Lf8Uicq
 oA9w==
X-Gm-Message-State: AOAM531EDOf+fF8m67RYgsGCqsXNd5Whfn6NmH9pB61RiM4eOXHier3t
 MkDdhQJJlqOhPRSXlxb9+7Qvtr37g0c2FJ9BgulAwA==
X-Received: by 2002:aa7:dd4b:: with SMTP id o11mr3944277edw.251.1599657820411; 
 Wed, 09 Sep 2020 06:23:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200903110831.353476-1-philmd@redhat.com>
 <20200908143725.GD7154@stefanha-x1.localdomain>
In-Reply-To: <20200908143725.GD7154@stefanha-x1.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 9 Sep 2020 14:23:29 +0100
Message-ID: <CAFEAcA-Ptc6_jQCna8+BMM1DOY-A+-b4toJiAm8z-9nzwJiDcg@mail.gmail.com>
Subject: Re: [RFC PATCH 00/12] hw: Forbid DMA write accesses to MMIO regions
To: Stefan Hajnoczi <stefanha@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Qemu-block <qemu-block@nongnu.org>, Li Qiang <liq3ea@163.com>,
 "Emilio G . Cota" <cota@braap.org>, Joel Stanley <joel@jms.id.au>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Laszlo Ersek <lersek@redhat.com>,
 Robert Foley <robert.foley@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Tony Nguyen <tony.nguyen@bt.com>,
 Prasad J Pandit <pjp@fedoraproject.org>, Alexander Bulekov <alxndr@bu.edu>,
 Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Klaus Jensen <k.jensen@samsung.com>, Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yp4cQcZACD3l

On Wed, 9 Sep 2020 at 10:12, Stefan Hajnoczi <stefanha@gmail.com> wrote:
>
> On Thu, Sep 03, 2020 at 01:08:19PM +0200, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > The main patch is:
> > "exec/memattrs: Introduce MemTxAttrs::direct_access field".
> > This way we can restrict accesses to ROM/RAM by setting the
> > 'direct_access' field. Illegal accesses return MEMTX_BUS_ERROR.
>
> QEMU needs to simulate the behavior of real hardware. What is the
> behavior of real hardware?

It varies, depending on the hardware. The most common thing
is probably "happens to work by luck", which is OK for hardware
but doesn't help us much since our software implementation is
naturally more serialized than hardware is and since we don't
want to allow guests to make QEMU crash or misbehave.

thanks
-- PMM
