Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2427764lfi;
        Thu, 26 Mar 2020 14:50:13 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vugpBQzVMWQ5Y/mW+ZsUYvPg+iAMvPrqFCF7PpfM1emvTAJcUcYhJnmTillkycbKN5PIDi9
X-Received: by 2002:a37:a446:: with SMTP id n67mr11120802qke.298.1585259413822;
        Thu, 26 Mar 2020 14:50:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585259413; cv=none;
        d=google.com; s=arc-20160816;
        b=aTbXeDk2iVAELiAqKkyOnwOwY+xKuGrgQ7DZDRkKrNcIOpi6Pe0DNJd+yYGMeA3o/Z
         UgwYgSBFehYfdHNCzZM0rk8+aB7axjCrPFriOuitYBhL+vtBPi9jGihqFKPPLFOF6ag+
         QzHDqaamvPaXYs/A9NmK/zlifLrJ3GFIRj3PTLCKMqU5si8FmkOZj0bcu04LG5lQh61t
         m+CgE+7LVJ4NDMWyS1j/jCLBn+pfsfEhYIe6vI+CYfiyYV5kQrV4SbrEzKciYO64NfCC
         5W2Cvxfd2YJ5AqZIhkMY5YoW56+Yl7NVrHQ/t2mCxb0jjm8G7eDsNdSFv3WbWUTdllwC
         TkSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=vmLYY/rJrxioBTJ6A3rg5gqalSw/omoc/qj0U0fRPSE=;
        b=u3IU0DSEwMxKWkYy274W2IAucdnfDnvhZ3p5TTVP4S/iNd6PMPAUq/xWk9kbOueQvY
         S3QV9vYSzgJl2ZlIOMjTRr+DvGmoqq7wLX3RNawElc+49FLtn1MjxicchqJ+npynE4RY
         hgEZVTuhEYk84I9pyJMM2d6QlsEYnGnWVDoVRxa5VxYgxVM5uTXCDYDIsmNfhWTwum0a
         zZ9mh4dlBP+ibQS/UdRyGaiVtUowhH4eWDcmJ3FV0vZBRI/3Dz2WqzcQvnvDSUYKWOW3
         Q9Pc0r21emlGgh23h+cpRzVI8PInnoIu5F3hGZ+MVbNIxjbdMPde2W1Xd60rJoB321pj
         aAIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yQEU2NIU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p13si2262048qvt.85.2020.03.26.14.50.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Mar 2020 14:50:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yQEU2NIU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jHaOD-00083g-5R
	for alex.bennee@linaro.org; Thu, 26 Mar 2020 17:50:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50569)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jHaO3-000837-L8
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 17:50:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jHaO2-0007Ft-Jn
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 17:50:03 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:39817)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jHaO2-0007F0-Eo
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 17:50:02 -0400
Received: by mail-ot1-x331.google.com with SMTP id x11so7642875otp.6
 for <qemu-arm@nongnu.org>; Thu, 26 Mar 2020 14:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vmLYY/rJrxioBTJ6A3rg5gqalSw/omoc/qj0U0fRPSE=;
 b=yQEU2NIUaXHDdBFNz4pgJz1tMyrv9l34vb3Y0c+nuVoIB8ExwwDNBGsdtn7yywEcQ0
 l4vCc+i0qgYX13ySmSuu65Jq5cAbOdxybDYd+5u39WLfd1UH70wwU4rDHyFoyGwA3/42
 CTew5CcCEVqDh6eWLETY+5yoNv1cHj1HSLExV7XFbWt70WbXLXG5h9OQKCYohoApY2aO
 cO0S4hzl1jI8K+hx5O7wkZAIfE/4vVF+hbPQuJbRPuOdPa3zoF1zC5o4eOHSqDRZymTD
 F50uKR8yfaIyuk+dYy9VoGj+j9NmGNb/w/X6B4wUpJfysTCgwGeLMRaTVUKXYTPGp9t1
 ngvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vmLYY/rJrxioBTJ6A3rg5gqalSw/omoc/qj0U0fRPSE=;
 b=dnXRdjBtyZMdfXGZ1/qQBy8W1xBRFoOnZmTT84/oOkuivaTTH7gKQdfaAwqIyNK9PZ
 BxIWXHvRjVDFODacDXew+bG9p9KSOW1G5sTEUSOCGPqG1vYyRNH3He8WnIhvT+pd3NLX
 39TPh4zGYNtlMDMZMu+PfM97kVVTZXKU7edoAdCvDGZxx7McKStprBmKDVvapn7Mgzys
 SJRhpuMF1gVXbxYubd/pSW1sZ0l7II68CrskwbeSywixvdAzc4bL3haGdTwGnudL2NDt
 OAHZruwzQoHG8Fwys+MtAaAsk0sqzN4UFlw+nHHxznbenAhy/lMIR/W5ys1iCV4aoi6O
 I7qg==
X-Gm-Message-State: ANhLgQ1pYUCCbH8BCpUfrX/y18jDQcagW/iJI3wwm8rB25CI4lB/8HKZ
 cctPWGckV3IHz61O80sTLLbSrUKt+m0wS7ed7Hbseg==
X-Received: by 2002:a05:6830:1f39:: with SMTP id
 e25mr8151827oth.135.1585259401764; 
 Thu, 26 Mar 2020 14:50:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200325191830.16553-1-f4bug@amsat.org>
 <20200325191830.16553-10-f4bug@amsat.org>
In-Reply-To: <20200325191830.16553-10-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Mar 2020 21:49:50 +0000
Message-ID: <CAFEAcA-2FNSxHaZUuogdmFXSc7DqKHPSVD6f-Vkpnh_pTmXHQg@mail.gmail.com>
Subject: Re: [PATCH-for-5.0 09/12] hw/mips/mips_malta: Add missing
 error-propagation code
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::331
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
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm <qemu-arm@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x1ZmzVgs4f0i

On Wed, 25 Mar 2020 at 19:19, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Running the coccinelle script produced:
>
>   $ spatch \
>     --macro-file scripts/cocci-macro-file.h --include-headers \
>     --sp-file scripts/coccinelle/object_property_missing_error_propagate.=
cocci \
>     --keep-comments --smpl-spacing --dir hw
>
>   [[manual check required: error_propagate() might be missing in object_p=
roperty_set_int() hw/mips/mips_malta.c:1193:4]]
>   [[manual check required: error_propagate() might be missing in object_p=
roperty_set_str() hw/mips/mips_malta.c:1192:4]]
>
> Add the missing error_propagate() after manual review by adding
> a Error* parameter to create_cps().
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/mips/mips_malta.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
