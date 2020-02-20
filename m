Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp654095lfg;
        Thu, 20 Feb 2020 06:50:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqzHxJheofFIUI6XctMi3n16PQ0z7O9Sb5zYE9V+AqP7rUEE3IjmRTk8ncToRd3BeFZDzQip
X-Received: by 2002:ac8:741a:: with SMTP id p26mr26170323qtq.76.1582210254611;
        Thu, 20 Feb 2020 06:50:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582210254; cv=none;
        d=google.com; s=arc-20160816;
        b=MoVYUEChFooLbUB0qrZzwNl+utq3rzafFMlTAAE/uxW6xooIK6AvnXQQKlFKK22tG8
         /3eXzfQHOE/k9b4Fl1+2SgD1PnMm7ySyVCakZu93mW3H/0x1PYv/5oH/O0KEyMThUEsV
         nrukfrWKAj9i2t3ppMU4M6qULs10rJo3sxLZIS1FUXIU9lrOxJnLO7zBaJHcu3yH2DP4
         Zr5ZfBt5lzsXk93Bi2OcPAmc6VjcODvhPIkwoaxo1RtpiC4xRK3m/DnZVSwGO2zHDjGV
         ZeAJACs+RIfeehO691DD6K4KUyAKKbNQu1oh/vUCwK597e0ong8F/EosYMqzMQ0Cc3jQ
         SHUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=afYl0DVEoEhQ/EBMwBMpftX3lzsz91ArZ4Bz9hqJxoM=;
        b=tNTpvTXOMbrwVGctNxZJ6K5kRsRl5YMnYIpCastbsWEXw6iaZzYy7OKEfvl4MzxEB9
         GjOSxANUXfP7UIwarZOmCLHG9zhwabSreENKXIp3vCKCusGOfE3vxz3Te5s3lIvXySEw
         ULn0PHafmyPa18jnkoFX5uHrhkoHAit+30SVBbGtOWqsTlB3xIW+pZhsOEjdmKc8HwJk
         LAAJJ3bRCF4KBbSesLCWDx2CbUyio0pe4dnVG57FKGK65/EOhOvIDigX6A0DjAIQAB2Z
         rbrleHIKSheu9XcWoHEETdeTFvDU9eQFxR/M7LMZWRLf0L0ht4Nr8sY1fSXdj6S+F2h2
         lv3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XvT9C2r5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c11si1606795qte.105.2020.02.20.06.50.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Feb 2020 06:50:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XvT9C2r5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j4nAD-0002Wo-TK
	for alex.bennee@linaro.org; Thu, 20 Feb 2020 09:50:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43986)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j4n9l-0002TQ-3e
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 09:50:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j4n9j-0000zU-U5
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 09:50:24 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:45723)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j4n9j-0000yv-NS
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 09:50:23 -0500
Received: by mail-ot1-x341.google.com with SMTP id 59so3838878otp.12
 for <qemu-devel@nongnu.org>; Thu, 20 Feb 2020 06:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=afYl0DVEoEhQ/EBMwBMpftX3lzsz91ArZ4Bz9hqJxoM=;
 b=XvT9C2r5f+zEmvR/bgZdkDRyZhwObYqZFMl/2N4K7JfLhbUm9R72p3VKo13fij+sma
 ++TsJOS9UnPtjKBEi5kWNs1phjZRM//LnaQx8gH6Z1GqvhatrlnncxL7kg1I9MewLRfc
 z6U6KYOOgF3FB5fHYyomtIIeMnEap42cnffRfvM0wbZgy/0Op5J8Znj0YDyirj8ymMdH
 HZIGoMeATLoAvDujTYULWAcjcKdl0m85rzMTqQvulgGDmaAEPDh1N3RH5MWMRbl2bt0l
 jtSMOzUus73QsJbkTLA9fPgWpmbrb/NHXb+/RKwTT/IxX8CEDjqXNdjDxvgoCqKR3Pjv
 1o3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=afYl0DVEoEhQ/EBMwBMpftX3lzsz91ArZ4Bz9hqJxoM=;
 b=fdGpZcUPaZFkzLhqs4mWGr7dvd5VsF+eiqsHNGzHL0b7Jd+b9NiD0nhpRHdjdicEFw
 SpTu5JOAfPwckTKQvbMMR6xVFNDv7htQZ4t2ZvCgCkgyMdbwW+lVE5zyiYBdFoJGO602
 WzOJZiZmXcSCeEbl4OLSXBDkANgyOqd6w3thoonqjf/BrEaTB1+55ewMwQu744XNzOo3
 VU0+EXkUr/NJYaQX4MddNDxQi4Z8qZUMMEPf1AV3OXRErKh3J6f2WBE6vrq0GBG9Smcs
 id8+OO4oC9fQLDbv+PYEBAxT40/X8J+t59mIq3FVqfA4WY1HBa46z7wH5wKckUQYnuZo
 U8Nw==
X-Gm-Message-State: APjAAAX/Um/5modTQQ3fZQJDJl4QRwvuRJZBXfWRXVxM3CjQ2DHd89pE
 7u+o2Mr/wy7f4hnVOsQZwODqif3mcjuWDoDO5YM+Vq2V
X-Received: by 2002:a05:6830:4a4:: with SMTP id
 l4mr24095274otd.91.1582210222568; 
 Thu, 20 Feb 2020 06:50:22 -0800 (PST)
MIME-Version: 1.0
References: <20200217204812.9857-1-linux@roeck-us.net>
In-Reply-To: <20200217204812.9857-1-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Feb 2020 14:50:11 +0000
Message-ID: <CAFEAcA88XmvNkombS=3-vpYPbbKBoDdKzrrEDAU_0kmYHAkKSA@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] arm: allwinner: Wire up USB ports
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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
Cc: Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: q3KenYIuWkC2

On Mon, 17 Feb 2020 at 20:48, Guenter Roeck <linux@roeck-us.net> wrote:
>
> Instantiate EHCI and OHCI controllers on Allwinner A10.
>
> The first patch in the series moves the declaration of EHCISysBusState
> from hcd-ohci.c to hcd-ohci.h. This lets us add the structure to
> AwA10State. Similar, TYPE_SYSBUS_OHCI is moved to be able to use it
> outside its driver.
>
> The second patch introduces the ehci-sysbus property "companion-enable".
> This lets us use object_property_set_bool() to enable companion mode.
>
> The third patch instantiates EHCI and OHCI ports for Allwinner-A10
> and marks the OHCI ports as companions of the respective EHCI ports.
>
> Tested by attaching various high speed and full speed devices, and by
> booting from USB drive.
>
> v3: Rebased to master
> v2: Add summary
>     Rewrite to instantiate OHCI in companion mode; add patch 2/3
>     Merge EHCI and OHCI instantiation into a single patch
>



Applied to target-arm.next, thanks.

-- PMM
