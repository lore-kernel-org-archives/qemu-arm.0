Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp4204768lfi;
        Tue, 31 Mar 2020 10:04:06 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsXrTE0MoEebqAqT+mpB3622p+T7sOiawiOuneEwvPEH3Zfz015OQGBPZbGcQEzy4Dl3l8o
X-Received: by 2002:a37:9d89:: with SMTP id g131mr6097083qke.166.1585674246366;
        Tue, 31 Mar 2020 10:04:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585674246; cv=none;
        d=google.com; s=arc-20160816;
        b=YERb8fN/3qXujPufT7CtaQX0zrgCIi4WED/LNbDAhvjSKuyFPlajra9csSyb7PWoRn
         eoaXwTulgJvmXPDQD3/stjBUjUDOoGGDY3/XyIQd3PlFVCuTU1AGlMDT+yC6QWBbgFMX
         29MkH4+/rEF01zm/GdI8seA1CUXMsiAxMj7gIB9WPazlDBV9E/gkN4BV9vw8bGIr0G7g
         VOmXXxmGGDI0uSFzJtLLWqcB0RYRdI2BiU6E21tVQ+wTvBZ4xfHcAUFN8sQRD6C34PUA
         uM7MASsIFH2rwJxKQdA4d6XHW+36kPCf+ewJo21SJyEKlcJLmFSDK6RTHv+41FR5IvYj
         tpiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=9blV1H9Js4on1Ru4pm7hErJIva7kNEymOz2IOkz5vus=;
        b=iYgu1BE+/EvN1Y1UYjgAgdfKKTZfragpt6Z3nnpR/2LWqK0sdoVR+JESIWkcbjdwPI
         lA+zvY4eK4GFf53HN5zFDvOB9h7fKoJ5GS87tQsuoL/AxquVaoOnRXlLyZtRn6+A2Lh+
         DdsjjItZA5UurWWpJv+Kdu0EegRlKhAZ/oqoaiFeXk45WzbEqnpz/iQIU406klTph9CQ
         Ha7Blvk/YPHTE6QdrNAwoOqu1GHfflkKuzA64CWP1HNIEaw9f6CdggSD5I+tETauN58i
         eH8836jY7vA6cEjFOGeorTS3cWRI2jZUcXewma00W8+yWqsKzBLYL2FuD8xod5RQo26P
         yy3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SLv0dQ7u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g36si10506867qtb.333.2020.03.31.10.04.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Mar 2020 10:04:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SLv0dQ7u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jJKJ3-0002QO-La
	for alex.bennee@linaro.org; Tue, 31 Mar 2020 13:04:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47018)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jJKIl-0002Nd-UI
 for qemu-arm@nongnu.org; Tue, 31 Mar 2020 13:03:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jJKIk-00004q-Et
 for qemu-arm@nongnu.org; Tue, 31 Mar 2020 13:03:47 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234]:34232)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jJKIj-0008VM-D9
 for qemu-arm@nongnu.org; Tue, 31 Mar 2020 13:03:45 -0400
Received: by mail-oi1-x234.google.com with SMTP id d3so14995421oic.1
 for <qemu-arm@nongnu.org>; Tue, 31 Mar 2020 10:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9blV1H9Js4on1Ru4pm7hErJIva7kNEymOz2IOkz5vus=;
 b=SLv0dQ7u1fEVRXqkzrOdwk8U3oIebC2JYOFyn5H3Ap9UMGXug+Ki2LmB7tMf5dalMM
 ZVCDWaE8AMUENE4AAGM9ra/L6etUNOIO0ErUUIZBw2fED6xgcVUj4n0J8njSKMLiHhDq
 3RSDUZLhG7dELbTj5yEBthasUqochW4FQpYHaE7A4DDZISu4NzoO7YCDvjyVHh/+0kez
 Q/9AxIKsRcAG6T9teNyd22CpINizKC3dGf0SNqEE+HV2c5jGdtnYolw6HhbMAQXhnNos
 dhUmpaWaiEkUvMXdA6UTMErbxRxVVW94eEBCxXzuU2panAyvzOg+/s0oQLr4YBUmYge/
 OXLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9blV1H9Js4on1Ru4pm7hErJIva7kNEymOz2IOkz5vus=;
 b=Tt48yPkabDH8EG4iI60PbvlvDVxWx+35APRmkIxoKewQh9gIA7+OiZ41hb9m3pPa1j
 eUsty2SC9AurMs0Ux5Wgbb1my2OlBYAD4j6Bmpu/kkLzTP6lCnCStTsrvDHuH7nOwv9h
 5px2GML8wZ/3v9LWw6Z9xdsRzdyu/g2HF/AWt3LEEVgt8T/0vOn2v8z+8c0543C6OP9p
 sDfcwQeTGdIP9jQxJERDzoRqj87UeQQop8lkLj7VgCfhOgON+XZ6kuZNw4n1JwTFThPY
 YZlF/QNjarennk7MtbxzN0F0WfvpKm4KehapZ0Rl6hwj8nJ13uCeFOEDNhJV6j2AKQsA
 oSsg==
X-Gm-Message-State: ANhLgQ01GVJ8WLkXgAwi8yHk7JS64Oo5mfa8ADf5GbKtPU/YumBot5xZ
 uL1a33TZnjeg58Yhwhp+e56InsE/dReBbCz6lgTspg==
X-Received: by 2002:a05:6808:8cb:: with SMTP id
 k11mr2652699oij.48.1585674223782; 
 Tue, 31 Mar 2020 10:03:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200325191830.16553-1-f4bug@amsat.org>
 <20200325191830.16553-13-f4bug@amsat.org>
 <CAFEAcA-26fHbOp5saM+XBCz72fzfz+=+xtiXGRtWnc6CMoiakA@mail.gmail.com>
 <e293f19c-7005-16f0-57df-55ce953fe0a4@redhat.com>
In-Reply-To: <e293f19c-7005-16f0-57df-55ce953fe0a4@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 Mar 2020 18:03:32 +0100
Message-ID: <CAFEAcA-W9V_GvA0yKXY+tsZNSe_DnSbYsd33wNnAP4WWivi-og@mail.gmail.com>
Subject: Re: [PATCH-for-5.0 12/12] hw/riscv/sifive_u: Add missing
 error-propagation code
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::234
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
Cc: Paul Burton <pburton@wavecomp.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Markus Armbruster <armbru@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm <qemu-arm@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BdsydEFMesbd

On Tue, 31 Mar 2020 at 18:02, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote
> What about this memory_region_init_rom() call (and later
> memory_region_init_ram) using error_fatal, same reasoning right?

Yes.

-- PMM
