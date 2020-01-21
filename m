Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1199629lfp;
        Tue, 21 Jan 2020 00:33:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqzr9m/cph9lApuSrPkQk4TVmn7KfuM5hrQpdndR+SXdAAXTi2E2VJN/91QTPC9vdL7FDmCq
X-Received: by 2002:a05:6214:190e:: with SMTP id er14mr3809828qvb.28.1579595603232;
        Tue, 21 Jan 2020 00:33:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579595603; cv=none;
        d=google.com; s=arc-20160816;
        b=ySvxrU4xMtdhY8ae89HfhsIXvGFgULOgwUr5ydS+qVMhzahVkCyYhXdPrHqwLCeBe9
         i8u/OxCShabPRT1f8Ji7rC4F61f21dq8MEofa40EVB89fz4ICToyOD1LScdIJ9wlGkgS
         EINRKoYldqdvQK0nez9RBqXhTZqmmg9qSDLR1CmDaE4DPa10NvqhHdSBp7FxCVQtTty0
         7atEZa04sOciV+rD3eDySBBLhNm1tzdE42rswMkG0lNsul4DvFHEk5C86yUcMNf6vNFr
         4yAD0p7Pqd/PYnBQQO3/jTjUUd1V5pLNX3XFsV4pxcLC/gp8khL/d3yWzMjmYDg3tKu6
         4iRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Gid7cAh5ebvOKVZm10w7tj/W/HZTCXSkcFS96JJyvYE=;
        b=O+TsQm5iJOXdjC4byXKblQa8QaX9Q4lGHNq5EVsJgkR8fBLnWrjS7QJ/4g7CeyBNJx
         YDZiF3+txzA02Gk1Yb4IL/+0bVxN4zmQV+U4krPyCyftqjZGEQ4G6kM/3fXreDczDiTQ
         mhzBCVXsHxRAFYZkfmQBiJX64oefpTlL7lOQB9N5zq+DHRC7bmgNLQPYCfJh2L3nDXST
         h39Y2y0XeHm0pYZn5DU+tc58fHV8h6Z36mnMb+/huMeiW94v2e/mNeM6Ac48E549m3ji
         AEPgwaEk5J1ZzziATTQ9xIODQ+O2/UUGdBL5ciO9+s0sYpGSL4KOP2ddpZUTCM669yOv
         ZCWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dXHhklXN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b2si21177980qvy.15.2020.01.21.00.33.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jan 2020 00:33:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dXHhklXN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1itoyQ-0007Pe-HO
	for alex.bennee@linaro.org; Tue, 21 Jan 2020 03:33:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52549)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1itoyC-0007OL-Pb
 for qemu-arm@nongnu.org; Tue, 21 Jan 2020 03:33:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1itoy8-0007Re-Ji
 for qemu-arm@nongnu.org; Tue, 21 Jan 2020 03:33:08 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:60349
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1itoy8-0007Qx-Gd
 for qemu-arm@nongnu.org; Tue, 21 Jan 2020 03:33:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579595583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gid7cAh5ebvOKVZm10w7tj/W/HZTCXSkcFS96JJyvYE=;
 b=dXHhklXN5cbSDV9ng895zOa83WDYWv4Uhlo2/GWTlXMVmtw1AilrTHtvFUgwK41w+iOUAo
 P9iO59RxUaiK3s7nvOUoKjPTIn6Q7h1tRm/Y4HPerdcEVc1RIeaAkYGF6/P1fQXBKFaavN
 YRwIcXweoHjOXNBQsPrxJURUBKxBQhc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-qkkItygAP_u0xue0erOo1Q-1; Tue, 21 Jan 2020 03:33:02 -0500
Received: by mail-wm1-f71.google.com with SMTP id h130so322803wme.7
 for <qemu-arm@nongnu.org>; Tue, 21 Jan 2020 00:33:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UOaGuYWssLX2F/Uy5zHcYy0xRj3+BckKWZ7UWzhilPw=;
 b=DHhhkEwWGOW7UPcIOsZXdy35JKStONk4IoRr8kmysZsNg4ZE8UI3QBP1x3/pMAIDMG
 Jjnzy6iHG5382Z7/qAhpXwZF5BCF61oK7a9XPhvZ/xcFTNu+ut1SKrk9RyHJjTlsm8c7
 Ii6Ev6Am20GhQeGeRfvqpk+kBd3r5yELxjwjD+iuwWAQoB9EpTpUlOGUe5w39NaJ7Sun
 xDgwWf/YMS2lV9rA9P6jXMC091VRVsw+sxPYehRWcBkYhK11mnRerbpkZDCHkYUk24ob
 y81P7Ids3oP8zzNB5YjzzoVh/Slv6BgU8/AyvD9GcXIvf64qYVpujyKY+9NUkl/SGO/P
 cPUQ==
X-Gm-Message-State: APjAAAVvEhwn2ly4mPPO5l1l1xLjYBThISQ4cH1NOj4ZtqikSNIPBOan
 dKtAeCp8228922QxzasaKTYn64KzKrTza8zCyw/a8hGRA3tVr1GPFEteKftX4hnjL1B2CXMLDWg
 MaPZrLHcOJx15
X-Received: by 2002:a5d:484f:: with SMTP id n15mr3797875wrs.365.1579595581224; 
 Tue, 21 Jan 2020 00:33:01 -0800 (PST)
X-Received: by 2002:a5d:484f:: with SMTP id n15mr3797848wrs.365.1579595580848; 
 Tue, 21 Jan 2020 00:33:00 -0800 (PST)
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id r6sm52609896wrq.92.2020.01.21.00.32.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2020 00:33:00 -0800 (PST)
Subject: Re: [PATCH v4 5/7] tests/boot_linux_console: Test booting U-Boot on
 the Raspberry Pi 2
To: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20200120235159.18510-1-f4bug@amsat.org>
 <20200120235159.18510-6-f4bug@amsat.org>
 <20200121065726.ijnw3lwyrnrzanks@sirius.home.kraxel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <bf1f45a0-af53-c2ec-d9c6-098a9ac3465d@redhat.com>
Date: Tue, 21 Jan 2020 09:32:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200121065726.ijnw3lwyrnrzanks@sirius.home.kraxel.org>
Content-Language: en-US
X-MC-Unique: qkkItygAP_u0xue0erOo1Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Laurent Bonnans <laurent.bonnans@here.com>,
 Cheng Xiang <ext-cheng.xiang@here.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PZpL+lfVTdnW

On 1/21/20 7:57 AM, Gerd Hoffmann wrote:
> On Tue, Jan 21, 2020 at 12:51:57AM +0100, Philippe Mathieu-Daud=C3=A9 wro=
te:
>> This test runs U-Boot on the Raspberry Pi 2.
>=20
>> U-Boot is built by the Debian project, see:
>> https://wiki.debian.org/InstallingDebianOn/Allwinner#Creating_a_bootable=
_SD_Card_with_u-boot
>=20
> We already have a u-boot submodule in roms/
>=20
> I guess it makes sense to just build & ship our own binaries
> instead of downloading them from Debian?

Your comment made me realize I pasted the wrong link, I meant this one:
https://wiki.debian.org/U-boot/Status

Maybe the commit description is not clear enough. I don't want to test=20
U-Boot, I want to test all future QEMU releases with this particular=20
pre-built binary, which has been:
1/ built with the proper configuration for the board
2/ tested by someone from the Debian project on physical hardware.

(Goal: catch regressions in QEMU).

The source is available, with build scripts, and reproducible builds:
https://salsa.debian.org/debian/u-boot/blob/master/.gitlab-ci.yml

