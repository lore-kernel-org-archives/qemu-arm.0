Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp123539lfp;
        Mon, 27 Jan 2020 22:53:27 -0800 (PST)
X-Google-Smtp-Source: APXvYqxN1jwb/oX9sUtcZlhUshpUfalMQQH6nL6Nk14dyJF+Ej6IQGfn4KcDjBL1ZbXFrdfhGKe/
X-Received: by 2002:a0c:ea92:: with SMTP id d18mr19219112qvp.201.1580194407257;
        Mon, 27 Jan 2020 22:53:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580194407; cv=none;
        d=google.com; s=arc-20160816;
        b=QkuqTI1lM4DXN0PlNh7rkUyp3q6A4rAyVbO8pvhYwQ3vBLULR3dkoU/My3FYhoBztp
         elTY097KHgyUGmNx75Qnwc+Mg5yJXlERamyDk6gTln28mHLDVV6OxK4dT2yDlV/odzgg
         Ez0DbxlByV/nE4mpFB0/XZVZpcovKz8860vdirvjqdYsLNMV6S3qfnfg6yEH8SsYw8Lk
         gryxFELGTVytlCKneKN3J+T2lQz0plrKrClfXF9znMF1OAQ8PzICXv+fhYGCfEIdZo+t
         j9CtjWi1mgPw+NqWiGyWS0hVvCKBljiqZokLAnKob4ZlXzLlV07MFpt24NH/droSQy1F
         BlnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=bKL9132Az6p0nZnR1vq/tcC+AZJv4+lL3MEYYl/rqbo=;
        b=ojqUROfa6pBgDzIGc8jGvoxc2+iA7JyIbSyK/b1hSTQ6jL2b5M9YDBlFNTZPpyonkL
         B0FV+PbdFaS8VMc/Ss21JZPg3HnDa9SbadsmOKMGhkZA7MM4aYUSY3j9FdamYgicqvuv
         ZD9pz/DKlAbc1Rzsf9WFvn1k37mqpa2UPhS8BGJwsVlddp/mgfobi+QFBHxw/ZXJf+Dg
         Goe2zBdQA8mMFKgLrZGblWxVy8onH7tPq2SC5F51Y+YP8FFNKBo36RSA27zZm5mZwfKn
         EGkX0ZCGhd9ReJ50yQxpFNGNWMRKPBZTDGPoaKB+tfsOXyHTTU/mewIdufqLCA7rR8Jj
         VJ1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VCKeq3Hr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g10si12107870qte.399.2020.01.27.22.53.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2020 22:53:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VCKeq3Hr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iwKkY-000169-Nv
	for alex.bennee@linaro.org; Tue, 28 Jan 2020 01:53:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57504)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iwKkR-000161-9B
 for qemu-arm@nongnu.org; Tue, 28 Jan 2020 01:53:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iwKkP-0008Jm-BV
 for qemu-arm@nongnu.org; Tue, 28 Jan 2020 01:53:18 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:30883
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iwKkP-0008Ja-8c
 for qemu-arm@nongnu.org; Tue, 28 Jan 2020 01:53:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580194396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bKL9132Az6p0nZnR1vq/tcC+AZJv4+lL3MEYYl/rqbo=;
 b=VCKeq3HrpuqNLNPFXVEzgQWzdctyFjSI6fbtaUzzBxTZw6QqQ/MLwQWGrNcFkA/e8lMoyS
 Y+9wTrsraKUbKGLZEtHgCSBuZfOEkrFrnMuIDIGOvIAHfEtGMAF4VRQrubNQr47a0t7Pxd
 pW90kuSNar+Lvln5WoxQCk+eMVnB0Qo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-8gpvJ7QxNNCbQwv_lkHJyQ-1; Tue, 28 Jan 2020 01:53:14 -0500
Received: by mail-wm1-f70.google.com with SMTP id p2so411877wma.3
 for <qemu-arm@nongnu.org>; Mon, 27 Jan 2020 22:53:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1Obb92N5U1ZdbHAQBGBc5mrueWUHclkw6B/w11+y5W8=;
 b=GfBtJPnMk771VhJL2iCEj3+utWYYF9Z4uxLfS8kIacPRP2DCXDnsYiwVOl4KAXiESi
 UX2oHZIVar0At+yp6STqbEMFf0yAJUwAIF1VuVrD8kQAMWDWE4eALKG80qWTLMo5P7TV
 YpHMnumxoD1V4iGttLTex6xqApZ/TFO0vxjFdwISOxpeyRW3iwBAzP+4hQFxfuiCn+YA
 g7InvOwKxkawQAgciG3zxr8y6IvLpqT7jf0lC7fgjNqYsjX2zSGazWwAFkHYT1PpjDvy
 NrPO5zDlmwzwpDUEoosFdeloptlxc6oKRfT8fCMHKfC7h/M8S0xsLfjy7p2s5LSZi0bv
 /aog==
X-Gm-Message-State: APjAAAW3WiDso0kOTwbnheLjgbkkSS0gtB+8p0VSUpoOKBk7Hjw/DZPR
 FvtX8YT0x82tszH1lFaNZly4S3kSMnvnCKijFDWymhOeZSGzWSs+Yjluc1Oltd6SNiIURe+qJiR
 yQd+rOitqUCxr
X-Received: by 2002:a05:600c:1009:: with SMTP id
 c9mr2960110wmc.162.1580194392888; 
 Mon, 27 Jan 2020 22:53:12 -0800 (PST)
X-Received: by 2002:a05:600c:1009:: with SMTP id
 c9mr2960093wmc.162.1580194392655; 
 Mon, 27 Jan 2020 22:53:12 -0800 (PST)
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id q6sm26172070wrx.72.2020.01.27.22.53.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2020 22:53:12 -0800 (PST)
Subject: Re: [PATCH v4 0/7] hw/arm/raspi: Run U-Boot on the raspi machines
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200120235159.18510-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <773d1201-17fc-40b1-fa9a-06ed03732e89@redhat.com>
Date: Tue, 28 Jan 2020 07:53:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200120235159.18510-1-f4bug@amsat.org>
Content-Language: en-US
X-MC-Unique: 8gpvJ7QxNNCbQwv_lkHJyQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 207.211.31.81
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Laurent Bonnans <laurent.bonnans@here.com>,
 Cheng Xiang <ext-cheng.xiang@here.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zOYcwWZ2BQyk

Hi Peter,

(Cc'ed Wainer from the Python part).

On 1/21/20 12:51 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> Following Laurent report:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg639950.html
>=20
> The SYS_timer is already merged, see:
> https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3Dd05be883fc
> "hw/timer/bcm2835: Add the BCM2835 SYS_timer"
>=20
> The first patch should fix Laurent other issue.
> Then few python patches are require to break into U-Boot console,
> and the last patches add U-Boot tests for Raspi2 and Raspi3.
>=20
> Laurent, if you successfully test U-Boot with this patchset again,
> do you mind replying with a "Tested-by:" tag?
>=20
> Regards,
>=20
> Phil.
>=20
> Since v3:
> - rewrote '-smp' fix.
> - tests use Debian 'trustable' u-boot.elf
>=20
> previous feedbacks from Peter on v3:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg655415.html
>=20
> v3: https://www.mail-archive.com/qemu-devel@nongnu.org/msg653807.html
> Supersedes: <20191019234715.25750-1-f4bug@amsat.org>
>=20
> Philippe Mathieu-Daud=C3=A9 (7):
>    hw/arm/raspi: Remove obsolete use of -smp to set the soc 'enabled-cpus=
'

While the first patch is reviewed by Alistair, the rest (acceptance=20
tests) still requires an eye from Cleber/Eduardo.

Can you queue the first patch via your qemu-arm tree?

Thanks,

Phil.

>    Acceptance tests: Extract _console_interaction()
>    Acceptance tests: Add interrupt_interactive_console_until_pattern()
>    python/qemu/machine: Allow to use other serial consoles than default
>    tests/boot_linux_console: Test booting U-Boot on the Raspberry Pi 2
>    tests/boot_linux_console: Test booting U-Boot on the Raspberry Pi 3
>    tests/boot_linux_console: Tag Emcraft Smartfusion2 as running 'u-boot'
>=20
>   hw/arm/raspi.c                            |  2 -
>   python/qemu/machine.py                    |  9 +++-
>   tests/acceptance/avocado_qemu/__init__.py | 59 +++++++++++++++++------
>   tests/acceptance/boot_linux_console.py    | 54 +++++++++++++++++++++
>   4 files changed, 107 insertions(+), 17 deletions(-)
>=20

