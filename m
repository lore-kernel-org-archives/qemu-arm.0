Received: by 2002:a17:906:70a:b0:9d0:bf65:29fa with SMTP id y10csp112571ejb;
        Tue, 31 Oct 2023 01:06:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlpJDrIDjf4rOYo5h8+d6bLTKYjaO2dTRYgfsUr9KJlQnrJ5DLAzrJonYF/Ulvw71v59p3
X-Received: by 2002:a05:6214:401c:b0:66d:34a8:3ed0 with SMTP id kd28-20020a056214401c00b0066d34a83ed0mr13043466qvb.26.1698739585092;
        Tue, 31 Oct 2023 01:06:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698739585; cv=none;
        d=google.com; s=arc-20160816;
        b=TeAujTiHZaiDWq7JGlxtd3n2Du74ZdLrbT11S9klFy4Yji8JrUxHTqPSUbwXmmMSpN
         cGiYXtyK5m8L9zOE06RLDPsv9xcgPKa2GTnGvT8BKxlg5/saGyk9D/veldGj8zcGO/CE
         +CK4/ZhvMx8NWQWIaGBb9QgKrpKuoUelfwd8ZwUU5v/heJYo6MoQGTM+3zQMaO0ZREwe
         WhRpvw9wLalwRVsLMhrONon/H3sJMQASh6ViXpkUZPR06pRHIZ+0SX+WiQD4zFD35W/B
         9tE87dJGN3qTUwPp+sxpSebdTsOe7Hj6AmuoNg/5Q1xxB1eVwxtRpjpU18x5atOYyJxt
         jm3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=3SW/PuCJjF1Wl8Zlj1bHJrgw+5U8P31218lo5xwDp6A=;
        fh=c4B833ddRB5yiCIA6UqKKSH4KWNJLKesee5JkbiaVck=;
        b=MZKVe2IWrjDa4rIaVzQJG86RuOO7CH88V/hbPPFf/lSZgKGjy60BIXz3wtMHcW/Ubf
         mgwJtuoXf6uESv1hllnBVKQ39imaCuK4ItuNos1dQu6BgswNEeRe0SBIIgoJONRJh5ld
         lN+i+IH023N5bOs2ObjmdiHByBMJDkAV6yVAQ5WAEF8Ew6DMj6+QNwDQ7YfHhO2mC4+e
         IbTNeGmbl9EloTyli+wGK/EKr39l96aPsGzG0qwdpls+aZsSSNo2v8lWaLhUkDipMlJG
         q36s8PGTkPnqnvHq2mZ2yz1Zw3iccSEiF5ru8zM5G9Z7ehYAL/gQaKrBHeorsLg7SFSv
         7MmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lq9Q8dzy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r9-20020a0cf609000000b0065b13b5cbe9si604422qvm.459.2023.10.31.01.06.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Oct 2023 01:06:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lq9Q8dzy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qxjlQ-0008Ig-Bq; Tue, 31 Oct 2023 04:06:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qxjlN-0008Hm-1G
 for qemu-arm@nongnu.org; Tue, 31 Oct 2023 04:06:13 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qxjlJ-00051e-1J
 for qemu-arm@nongnu.org; Tue, 31 Oct 2023 04:06:11 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-307d58b3efbso3363451f8f.0
 for <qemu-arm@nongnu.org>; Tue, 31 Oct 2023 01:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698739567; x=1699344367; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3SW/PuCJjF1Wl8Zlj1bHJrgw+5U8P31218lo5xwDp6A=;
 b=lq9Q8dzy9hUeP4rQVFVUkMU1puU0pd1mHi2UsrzMIgn4+ERns/3jywUxi95SC69fdK
 yZQg0SL3irRv72IRcjfXIayIFE2kRIywAuwhGWCv1t3L4H9RtgulDPtQJKz64T3aLbg9
 ikS0KooZcj0Iqov+rYD7QQCBvFBhepcH9k+flp7YjmfhSChYUAUG/vzv9kyvtSfht3iS
 2PNi+UJrUHz+7Y7k12pXPbKreT7/sjnxBYZFOGA92hGKwDHW8Pv/SbTEWcLe7O4OQC8J
 GzQgcCVT8xxDyFIf6FZJgQT6he1EjgMa7aWr+E9Puhyn4ZHVWwqZ8S1GoOz9k56Oz6DT
 YwIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698739567; x=1699344367;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3SW/PuCJjF1Wl8Zlj1bHJrgw+5U8P31218lo5xwDp6A=;
 b=tMQ1PWU1i1Q1OlyyA4cRe/3+JZr4ks06Zn0RQBToi/+XCyzRFHWtwpYQIpgtE8B9z5
 8CbD8iCRFYUDsIyy8UogHTqjoUhLnQfH7U0Vp/OIZa4bLA4gUGDrX1LP6bu1/PVno3zg
 mYOp3Z0IHr11Belk3BP1CiKuzOs6ylq12+UEYv3gLeo0/OFpVRTTPVpzeiUeIfyOceoy
 F3rsZ0vAID2dGfuqisWTg3MyJ/fFKzzzllFfFjpNyCV7ciGm+wZDyaM5Sg+YB27nOgRK
 D0dqTVSi3ns/2osza/IghRxcH8UujN2poVciXVxABck90edPD2K7WfX0ZzgSbVKVSjNb
 aVCg==
X-Gm-Message-State: AOJu0YyG/Q1bCl06xChOhkD7YGtIxIBxnjtCP6I8MDKsVqUabmDd6AXW
 C7P6L656VT/2OySb8Q9DH3i61w==
X-Received: by 2002:a05:6000:c8:b0:32d:90e6:c477 with SMTP id
 q8-20020a05600000c800b0032d90e6c477mr8686887wrx.26.1698739566966; 
 Tue, 31 Oct 2023 01:06:06 -0700 (PDT)
Received: from m1x-phil.lan (gjh33-h01-176-171-208-14.dsl.sta.abo.bbox.fr.
 [176.171.208.14]) by smtp.gmail.com with ESMTPSA id
 b1-20020a5d6341000000b0032dc1fc84f2sm878303wrw.46.2023.10.31.01.06.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 31 Oct 2023 01:06:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH 0/1] hw/sd: Declare CPU QOM types using DEFINE_TYPES() macro
Date: Tue, 31 Oct 2023 09:06:02 +0100
Message-ID: <20231031080603.86889-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: O+vyj3lqPYT7

Hi,

This is an intent to automatically convert to DEFINE_TYPES().

I used a Comby script, see https://comby.dev/.

Example in Comby playground:
https://comby.live/#%7B%22source%22%3A%22static%20const%20TypeInfo%20pl181_=
info%20%3D%20%7B%5Cn%20%20%20%20.name%20%20%20%20%20%20%20%20%20%20%3D%20TY=
PE_PL181%2C%5Cn%20%20%20%20.parent%20%20%20%20%20%20%20%20%3D%20TYPE_SYS_BU=
S_DEVICE%2C%5Cn%20%20%20%20.instance_size%20%3D%20sizeof(PL181State)%2C%5Cn=
%20%20%20%20.instance_init%20%3D%20pl181_init%2C%5Cn%20%20%20%20.class_init=
%20%20%20%20%3D%20pl181_class_init%2C%5Cn%7D%3B%5Cn%5Cnstatic%20void%20pl18=
1_bus_class_init(ObjectClass%20*klass%2C%20void%20*data)%5Cn%7B%5Cn%20%20%2=
0%20SDBusClass%20*sbc%20%3D%20SD_BUS_CLASS(klass)%3B%5Cn%5Cn%20%20%20%20sbc=
-%3Eset_inserted%20%3D%20pl181_set_inserted%3B%5Cn%20%20%20%20sbc-%3Eset_re=
adonly%20%3D%20pl181_set_readonly%3B%5Cn%7D%5Cn%5Cnstatic%20const%20TypeInf=
o%20pl181_bus_info%20%3D%20%7B%5Cn%20%20%20%20.name%20%3D%20TYPE_PL181_BUS%=
2C%5Cn%20%20%20%20.parent%20%3D%20TYPE_SD_BUS%2C%5Cn%20%20%20%20.instance_s=
ize%20%3D%20sizeof(SDBus)%2C%5Cn%20%20%20%20.class_init%20%3D%20pl181_bus_c=
lass_init%2C%5Cn%7D%3B%5Cn%5Cnstatic%20void%20pl181_register_types(void)%5C=
n%7B%5Cn%20%20%20%20type_register_static(%26pl181_info)%3B%5Cn%20%20%20%20t=
ype_register_static(%26pl181_bus_info)%3B%5Cn%7D%5Cn%5Cntype_init(pl181_reg=
ister_types)%5Cn%22%2C%22match%22%3A%22static%20const%20TypeInfo%20%3A%5Bi1=
a~.*_info%5D%20%3D%20%7B%5Cn%20%20%20%20%3A%5Bbody1%5D%5Cn%7D%3B%5Cn...%5Cn=
static%20const%20TypeInfo%20%3A%5Bi2a~.*_info%5D%20%3D%20%7B%5Cn%20%20%20%2=
0%3A%5Bbody2%5D%5Cn%7D%3B%5Cnstatic%20void%20%3A%5Brt1~.*_register_type.%5D=
(void)%5Cn%7B%5Cn%20%20%20%20type_register_static(%26%3A%5Bi1b~.*_info%5D)%=
3B%5Cn%20%20%20%20type_register_static(%26%3A%5Bi2b~.*_info%5D)%3B%5Cn%7D%5=
Cntype_init(%3A%5Brt2~.*_register_type.%5D)%22%2C%22rule%22%3A%22where%20tr=
ue%22%2C%22rewrite%22%3A%22static%20const%20TypeInfo%20%3A%5Bi1a%5D%5B%5D%2=
0%3D%20%7B%5Cn%20%20%20%20%7B%5Cn%20%20%20%20%3A%5Bbody1%5D%5Cn%20%20%20%20=
%7D%2C%5Cn%20%20%20%20%7B%5Cn%20%20%20%20%3A%5Bbody2%5D%5Cn%20%20%20%20%7D%=
2C%5Cn%7D%3B%5Cn%5CnDEFINE_TYPES(%3A%5Bi1a%5D)%5Cn%22%2C%22language%22%3A%2=
2.generic%22%2C%22substitution_kind%22%3A%22in_place%22%2C%22id%22%3A0%7D

Regards,

Phil.

Philippe Mathieu-Daud=C3=A9 (1):
  hw/sd: Declare CPU QOM types using DEFINE_TYPES() macro

 hw/sd/aspeed_sdhci.c   | 19 ++++++++-----------
 hw/sd/bcm2835_sdhost.c | 33 ++++++++++++++-------------------
 hw/sd/cadence_sdhci.c  | 21 +++++++++------------
 hw/sd/core.c           | 19 ++++++++-----------
 hw/sd/npcm7xx_sdhci.c  | 21 +++++++++------------
 hw/sd/pl181.c          | 35 +++++++++++++++--------------------
 hw/sd/pxa2xx_mmci.c    | 35 +++++++++++++++--------------------
 hw/sd/sd.c             | 37 ++++++++++++++++---------------------
 hw/sd/sdhci-pci.c      | 25 +++++++++++--------------
 hw/sd/ssi-sd.c         | 19 ++++++++-----------
 10 files changed, 113 insertions(+), 151 deletions(-)

--=20
2.41.0

