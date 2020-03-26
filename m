Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2426400lfi;
        Thu, 26 Mar 2020 14:48:38 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vv1mqh/8JYv6KTF2qFjm4MJhrn/h354iK6w+UX/Z2mXWzZpq7K4uzdJqubBNIaRkoQsRzE7
X-Received: by 2002:a37:cd0:: with SMTP id 199mr11141816qkm.189.1585259318136;
        Thu, 26 Mar 2020 14:48:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585259318; cv=none;
        d=google.com; s=arc-20160816;
        b=KzcFKC/Jw/gysVNrgXNQLFOhFs2bYaj7WfyzocHJscqq13VdIbDXpg6eoIW1/1Ys7I
         oteHLRl9/Ufh8YiYupJICCC+0B+LDLiX+GXq22BysDrRVmLgx+hk5abrcYPVqiMUz0IG
         MR+GKeIjnOlK0416VCGHn3eBj9irY6+hLzaAJFqH996rVi+1iulFIamWiFzYvXkhSLU2
         QLVjgzER7PfOqTFILkwBXYCSbpEzvKS8tenIaKSlFEwqppglmVKNZSofK5JwsnqT62Jl
         PCBSIjSDPAUrCXsUAQzj5Q7ue5JzlbSrDTfHQcADyPvtbsFlUlxjwudv3Z1yc02bNUfJ
         8kWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=ZFaXxcTV2mZj7ztpP7Zlz24D0mXHTvj4xwbEqB7WPNI=;
        b=iAPhmis599MUcIzWQr33j8IUmn/k5i8PI6ZcGagkULq6G8A/R2H1owAFOxkIzMBlJX
         cuUw9/UEHlxz1ZQ2ZxVNgqJrkV/Q/uk7J+XzXpWekJynnYNcYhVlIHiFzyzMJ/l7r8/2
         2HkadlTlUfHzw+ldi26SkwMvDYrWNazzboRnCKIE2IMMgSR4qjnyRL+QHHfAlSDhyVH+
         5H89/FCKdJDLdrezzCuiHgc3eq3JIpjU02Uj/6UxeotMhAnU+EIF3jJ+Pm83waaI7MTc
         aqnvxOwRy3nswSeTadgtf9ebSKKNJalE5b6eEddDA5OqoPe/ADRQTxcEqalLPTU6Iu8K
         T5Ag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=juYgvXXD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k3si2258289qkg.349.2020.03.26.14.48.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Mar 2020 14:48:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=juYgvXXD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jHaMf-00077i-J8
	for alex.bennee@linaro.org; Thu, 26 Mar 2020 17:48:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46261)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jHaM3-0006Vw-Fq
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 17:48:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jHaM1-0004T9-HE
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 17:47:58 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:41482)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jHaM0-0004RC-RK
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 17:47:56 -0400
Received: by mail-ot1-x329.google.com with SMTP id f52so7623603otf.8
 for <qemu-arm@nongnu.org>; Thu, 26 Mar 2020 14:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZFaXxcTV2mZj7ztpP7Zlz24D0mXHTvj4xwbEqB7WPNI=;
 b=juYgvXXDriG1rpjoe2C4H/Ugr3UC3p3gEye4w7GtZyXIYu+Zo+0ki3p4CAgIX15+oQ
 13h5mATdRjtEkuGPVFaxzfcsaweHEuIOXKQCjsIO+enfgSKWiu27x20N8d8AvGiHsxM/
 e4Ce1RNfFU37xU1Ue2YfH/qxSfQCfB7j7QP3+5DySd4yt8Z9JU4wQedhPF4knWQXN7A8
 NaHe8ZVDSrPQDxueQqrQlU9JVviih8K/d0bu9p7aXRExllyFV1dgv1wI0wxlqgdmypgG
 z9RsRkYOfs/e1fquBEPFlNxCbd3k6gbJwwwZ7QWHtMIzm0RlqS/PJ+udzu/7twiznYtH
 rsKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZFaXxcTV2mZj7ztpP7Zlz24D0mXHTvj4xwbEqB7WPNI=;
 b=ALV48FeC+fP8qoJHNvOsG8ejGpBMZP6yjBH4MaJrDId09YIU2CHsNfmggTfGZhs2oU
 CugcVTLCNsYCf5jgcxoffLfy0ugx419Uy072vqqQILP930rdKEwr2saCcRtGKSnJSc/4
 ZV4atPm3alO0ia8C9vU7eEnL0KF9gKCc+jqk2jRlpv32dIcSc+gXQTyQcuIyUPUNIf+z
 4KZfrGg2/OwrB40dshrg7NYiAEqoLn5AZYy0XBWnxyEacLaISTCoVBlL1oRPXgoZvWWX
 9wEwKnNpkwFgfmnE5Zkp3Y7V9oddO5WHcNkTqtmUDvr8qcSVudrij9XDItD7E6q1O96a
 eC0w==
X-Gm-Message-State: ANhLgQ1b4CcJ6WNuO9CaKRtM/n+2MKzxO8icrh565Q0p96te/wyRH0jC
 Rxl8XBHlOTFk6duiHyCoSpZsmtHrSRoniPxsrGWYUQ==
X-Received: by 2002:a4a:d1a5:: with SMTP id z5mr6961361oor.63.1585259275554;
 Thu, 26 Mar 2020 14:47:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200325191830.16553-1-f4bug@amsat.org>
 <20200325191830.16553-9-f4bug@amsat.org>
In-Reply-To: <20200325191830.16553-9-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Mar 2020 21:47:44 +0000
Message-ID: <CAFEAcA-SJSTP==JM9xWJbSYOb-ZM=UyYtHP=2iQGq979SYvjyw@mail.gmail.com>
Subject: Re: [PATCH-for-5.0 08/12] hw/mips/boston: Add missing
 error-propagation code
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::329
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
X-TUID: bF5FheGVhAiE

On Wed, 25 Mar 2020 at 19:18, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
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
roperty_set_int() hw/mips/boston.c:462:4]]
>   [[manual check required: error_propagate() might be missing in object_p=
roperty_set_str() hw/mips/boston.c:460:4]]
>
> Since the uses are inside a MachineClass::init() function,
> directly use &error_fatal instead of error_propagate().
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
