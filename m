Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2451096lfc;
        Sun, 31 May 2020 12:15:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwu0iohjD/SiY1oSNVpUx9goZgfm8XAR0y+c+MSs0dRLih5craFhXGd/SSD0whosIRppFX2
X-Received: by 2002:a5b:94c:: with SMTP id x12mr27895236ybq.97.1590952529604;
        Sun, 31 May 2020 12:15:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590952529; cv=none;
        d=google.com; s=arc-20160816;
        b=OhX7rfxdnTlYFoD8SKF7SUmx2xx794x0gOxxLGED2lxprsrsQklZZPsbDqmaIdTYOh
         4NjPKi7XRGPXYyeD7jXcaqV3SsV8eX5oUBBQtXENuvlpwoJuxFpy/sr7x66+DvibY8y6
         sLOV6SaASbr0CD1jkKpfgQKvibg5myL1FXQ8oShhLW8+Es0PJn/cMR1WTuq2NOQ0aNYa
         9W6fjnkg52q8+duflGFnkx78cpjAsZLvJJdvij5wgqyl8lqpEs1SvU+cdrnI3ufQlEag
         UwVo2jGmhxzZy32RhaQJYFHtCZikuWYavwKtJAlHEl4a1jlA+UD4zwDBDiMv0AwOKv8I
         OXEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=kweq74XCuVgqmqCkRPkFimJ4SeeBZ4TcI1aTD5P/9q8=;
        b=EDRicfc7aY5WHIJxt0b3ARuRux/abAzoT9L22ptfQ22r9Kp+DV14eKQA5veSndaSou
         FYRnffPL3UL99FVp/1C0Xgzu3rXKNJp0qXO61mXFpTwdcmCK2N40S/9uH68EFOWc+ebx
         fFOVH3ghUgKM4eiglbPuCM48o2V6LFuw66lLtQjljzDD11v08JqPejUdSorVwG1kbFAg
         3zvGV54/5v26gM31LZ2yqk/aiX+QSTZaOfH2l5T6g5K2/p5GWDb7YSNPsyLT03Lxs8Iq
         dfc7bUgSjIxkTCl1Kd9pGKhUIdVA/ferGzBb/DwaAckYnmog8uX3u5ooArFHzFTbpJh5
         DjoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aURmZAKl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n10si1143179ybd.465.2020.05.31.12.15.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 31 May 2020 12:15:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aURmZAKl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jfTQe-0000Wz-UC
	for alex.bennee@linaro.org; Sun, 31 May 2020 15:15:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jfTQW-0000Wh-I6
 for qemu-arm@nongnu.org; Sun, 31 May 2020 15:15:20 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:36530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jfTQG-0008Kq-TW
 for qemu-arm@nongnu.org; Sun, 31 May 2020 15:15:20 -0400
Received: by mail-oi1-x244.google.com with SMTP id a137so7231518oii.3
 for <qemu-arm@nongnu.org>; Sun, 31 May 2020 12:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kweq74XCuVgqmqCkRPkFimJ4SeeBZ4TcI1aTD5P/9q8=;
 b=aURmZAKl8h77Vzt5Nt3x1SmU90ljksbt7XDq9AHTpxY3ZuxvWR1GdkDhps7/jw91Ip
 WBOTCarYs2EQXe+ug1/Bkde3iwz1huhUzp/6dCZMQ6AdQkZcHz2tNnFRE+m4G4xZMotK
 I7yS8Fd8lRe+J0pbgfzpSbDJMqdABplxEA+McyPrzy3G7l1pga/4raZMe/leEaHHoK1Z
 0S5FN2WJJ180Q460SCUM1AeNQ5RCifgJwCbWLheo5JYH7Ai8aj3oqan+utUBkB8p+WMw
 mpbOBTNK7Fuh9zPK1pDcTmAXhtziJ8ihJe/z++FpvJJwJLuum8LU/0RxtvrCemPPh874
 s4Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kweq74XCuVgqmqCkRPkFimJ4SeeBZ4TcI1aTD5P/9q8=;
 b=PNBnOjJPjrkPUQkcNWRrIiJqKCZ8anbjKHWNdnrEBzrXLE3n1ZwkLTNRZClxLSWkJv
 WUXfCrABUx4uOImkYk+Hw8GUOGhAolcsCIsA+r6Q9pP9crZ1716crPnKSHoX+r1rnaRX
 7YDU856czgI+ZaYb25/J9wJ4O3RYA/N3qU9mqQL0f8pgcG+8H7L05dB1wtE9GfYmv0k2
 AE1hsEJWfpobxA+HEn1f5N2Gzhm+Sw5QzQIjW8gNAeTzk/EqPHBBIB2YxIYt/vveTtSp
 HCpp76vh8mSmOOp+FFMzKODF7elfskcPCd8WRXf2EV2EljUOTmU4lTz6Lt4/UKOi1Ckf
 JMIw==
X-Gm-Message-State: AOAM5325gpGgvjRVw58Hj4xrQe3RF+izRMRP4JTGbjycB0ScEhfWWx5x
 k+pUnzGPwuh3c/lQDrJD15eMsFdcDCiwCV6VDzgf5Q==
X-Received: by 2002:aca:5451:: with SMTP id i78mr7089886oib.48.1590952503278; 
 Sun, 31 May 2020 12:15:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200531175425.10329-1-f4bug@amsat.org>
 <20200531175425.10329-7-f4bug@amsat.org>
In-Reply-To: <20200531175425.10329-7-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 31 May 2020 20:14:52 +0100
Message-ID: <CAFEAcA_awdfsv=UJYQmnyCH6cFVz9O9kjUQ9+_jBb_rz73JepA@mail.gmail.com>
Subject: Re: [RFC PATCH 6/6] memory: Use CPU register size as default
 access_size_max
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x244.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-TUID: DCPZX6mRNjLy

On Sun, 31 May 2020 at 18:54, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Do not restrict 64-bit CPU to 32-bit max access by default.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> RFC because this probably require an audit of all devices
> used on 64-bit targets.
> But if we find such problematic devices, they should instead
> enforce their access_size_max =3D 4 rather than expecting the
> default value to be valid...
> ---
>  memory.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/memory.c b/memory.c
> index fd6f3d6aca..1d6bb5cdb0 100644
> --- a/memory.c
> +++ b/memory.c
> @@ -1370,7 +1370,7 @@ bool memory_region_access_valid(MemoryRegion *mr,
>
>      access_size_max =3D mr->ops->valid.max_access_size;
>      if (!mr->ops->valid.max_access_size) {
> -        access_size_max =3D 4;
> +        access_size_max =3D TARGET_LONG_SIZE;
>      }

This is definitely not the right approach. TARGET_LONG_SIZE
is a property of the CPU, but memory_region_access_valid()
is testing properties of the MemoryRegion (ie the device
being addressed). One can have devices in a system with a
64-bit CPU which can only handle being accessed at 32-bit
width (indeed, it's pretty common). The behaviour of a device
shouldn't change depending on whether we happened to compile
it into a system with TARGET_LONG_SIZE=3D4 or 8.

(If you want to argue that we should make all our devices
explicit about the valid.max_access_size rather than relying
on "default means 4" then I wouldn't necessarily disagree.)

thanks
-- PMM
