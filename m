Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp4106488wro;
        Mon, 29 Oct 2018 04:54:27 -0700 (PDT)
X-Received: by 2002:a9d:4355:: with SMTP id y21mr6651944oti.290.1540814067770;
        Mon, 29 Oct 2018 04:54:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540814067; cv=none;
        d=google.com; s=arc-20160816;
        b=iNVJMTm7W43zIuCb8G6+9hbExv9JY20rPhBsPmC/jx3bacBwE0j5c4fDRnlsNHY8V7
         HfoN3bNo2TZH9fdvVEMEnEhfmJDpD/tE7B7dqd8sX+ujdPOsdRkCyQM2zDSJN/V3sHdA
         X+4MGOfCZ1KA8fz2jRFPmRSkS0ZitVFJK1iP0ngd2M+nQhmhRAVA2xJoG8bc4l0ux3gm
         xwdj5YidmSoEJafEGwQ5JWbi8bv/uUFO2YHp1vWwl6F8TkPc1RFTn5Emzz6Kr4fZJJNU
         nPbtAaYGAC0onNjSdQ5LcTI7KkZrLjX+ZbavsPubESDkEBQBw+97nNwIc3gQpoHu9khr
         Z0WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=YNejyqvlvtqZ5lekjzx/o1ZDa4m359Wd/oZyre5a2vw=;
        b=T7yjXQwkv67epERJCWrvCzB/1NRwPRXfXVYg0se/I173i2vdlMtBgVfKxE+t45PmQV
         l0O+QkFJu0wFbs+skLVPvZCxDlEGQMJ2UNThuxXFr1tx953RObFBKh9fQ5SrfHxlLAvQ
         BwRfczhoWc35EQ4QRfjfbV7vac5XYQwAJGotewsyCdTVPnmE6ykVjePoFqbUUg3EgkG0
         oduo10U6FVHW3I8ljAZKt970xhEikvOtUn5EcnBmUW0dtlT4dTtzaMyatQYuPMxWB7rA
         yMy/UcxXJEXl5UXsEc+X+tZRGNqR/WLG51XK3ouSYqA8m+inpveO8R1MgkEWXe74yV4W
         UdfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hyl9Xec+;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id l62-v6sor8717275oif.94.2018.10.29.04.54.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 29 Oct 2018 04:54:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hyl9Xec+;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=YNejyqvlvtqZ5lekjzx/o1ZDa4m359Wd/oZyre5a2vw=;
        b=hyl9Xec+0issRvxxfMji7qUYEIlErPCw6h5RlkydBiX9OH1ngBVMJOEMNv1HsoEv9k
         ot46Jh8ABhfz6NfoGk2PLoqEJZBl2e6zMeMiccRKw+IRrym8/FuevOzJWu7srgquFrW+
         lznUXZfRwqDBb2kHnBicBWfmgwxdpeOpa8xgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=YNejyqvlvtqZ5lekjzx/o1ZDa4m359Wd/oZyre5a2vw=;
        b=ccVqm1QU6a32jSod1/u8MQjTNVVD5X/3bcUgBNxQVMzB6uA8Jv8eAhEgDmrLSkVu6s
         e/fDh53Ip2dA6ZlUYdsJr6XAzDttSWq6YACX3YS9gRgYHd35+EwFd3fKCHx501NfmFcb
         NqScr54TC2I3/ilEYSM7phpfMCwgMHro1/conm1NDuTQuRU8IPIQIRReYRu4mh5lUjLX
         8RaJiem/sMuDTJ/DYaCDrU5IPrHLCgLnhogFt24gelxeUIkyDeYa3RCgsOKyKtM2QTns
         6qkOI+gCj6D1NNwbVz41KIOzhrDKqi+pLIRU4ZLJJAP3I+1tCWokBCt7g7xg5+9Mce1C
         21Ww==
X-Gm-Message-State: AGRZ1gJa90vvlC0Ar+oAfqE39Tmkw440E7Ur+hmZDISjXU7edg8P9oY1
	lLkOpakp78rwW/pG82IJFiT39Gh6BxKYMxwZdK3NDn5W
X-Google-Smtp-Source: AJdET5ehURSSvcsUSsBmx/awNHewJrPOLYG4gJ/DtIIivq41+pIrhA/ThnUuBG7J2h7ZVmEu2iJiz84nIiymJnQ+nFA=
X-Received: by 2002:aca:c509:: with SMTP id v9-v6mr7717600oif.48.1540814067282;
 Mon, 29 Oct 2018 04:54:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:7c90:0:0:0:0:0 with HTTP; Mon, 29 Oct 2018 04:54:06
 -0700 (PDT)
In-Reply-To: <20181026153125.24738-1-laurent@vivier.eu>
References: <20181026153125.24738-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Oct 2018 11:54:06 +0000
Message-ID: <CAFEAcA-8sN2MGK6OcK5uMbMuw33MMOAgsdr9y4Uj2qmpbTkeig@mail.gmail.com>
Subject: Re: [PULL 00/20] Trivial patches patches
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>, 
	Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>, 
	Michael Walle <michael@walle.cc>, Laurent Vivier <lvivier@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Cleber Rosa <crosa@redhat.com>, Igor Mammedov <imammedo@redhat.com>, 
	"open list:X86" <xen-devel@lists.xenproject.org>, 
	Aleksandar Markovic <amarkovic@wavecomp.com>, Markus Armbruster <armbru@redhat.com>, 
	Max Reitz <mreitz@redhat.com>, Fam Zheng <famz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Anthony Perard <anthony.perard@citrix.com>, Aurelien Jarno <aurelien@aurel32.net>, 
	Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	Thomas Huth <thuth@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>, 
	Riku Voipio <riku.voipio@iki.fi>, Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: NsDMFeKwQSob

On 26 October 2018 at 16:31, Laurent Vivier <laurent@vivier.eu> wrote:
> The following changes since commit 808ebd66e467f77c0d1f8c6346235f81e9c99cf2:
>
>   Merge remote-tracking branch 'remotes/riscv/tags/riscv-for-master-3.1-sf0' into staging (2018-10-25 17:41:03 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-patches-pull-request
>
> for you to fetch changes up to 4b03da6e87c34793137a231b558231fd406c05e8:
>
>   ppc: move at24c to its own CONFIG_ symbol (2018-10-26 17:17:32 +0200)
>
> ----------------------------------------------------------------
> QEMU trivial patches collected between June and October 2018
> (Thank you to Thomas Huth)
>
> ----------------------------------------------------------------

Hi; I get a compile error due to a format string issue:

In file included from
/home/petmay01/qemu-for-merges/hw/net/milkymist-minimac2.c:33:0:
/home/petmay01/qemu-for-merges/hw/net/milkymist-minimac2.c: In
function 'minimac2_write':
/home/petmay01/qemu-for-merges/hw/net/milkymist-minimac2.c:420:23:
error: format '%lx' expects
 argument of type 'long unsigned int', but argument 4 has type
'uint64_t {aka long long unsign
ed int}' [-Werror=format=]
                       "milkymist_minimac2_wr%d: 0x%" HWADDR_PRIx " = 0x%lx\n",
                       ^
/home/petmay01/qemu-for-merges/include/qemu/log.h:85:22: note: in
definition of macro 'qemu_lo
g_mask'
             qemu_log(FMT, ## __VA_ARGS__);              \
                      ^
cc1: all warnings being treated as errors

(affects windows crossbuilds, OSX and 32-bit hosts).

thanks
-- PMM
