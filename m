Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp4988653ejc;
        Thu, 12 Jan 2023 10:22:23 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuGvEvsn54+ITMimf1AOk5LxlU6fVHYJtXvaoKDm6lAlYEujdV/NOSh6+oYAjfHfuL/yIZv
X-Received: by 2002:ad4:57cb:0:b0:531:807c:1828 with SMTP id y11-20020ad457cb000000b00531807c1828mr83546983qvx.19.1673547742886;
        Thu, 12 Jan 2023 10:22:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673547742; cv=none;
        d=google.com; s=arc-20160816;
        b=vQiSjbTkGQfKAlyiNk1Ph6IQxwSuooKk5DETDkuOX0R7Ea8GE5Tg1ZK5gGTUyzaGwH
         D3ie3uB+zId/i64rkmgS51Z+VVKsl1+x2l7OdZJCO7SVeO6rgQh3YcPcQWsSIWgTc1/e
         KOXMo0EvmNo+Ut5cdlpWtnMucx49TM2NE+FYlAJiWHjyUXHQAnvAnDgbDuMa8U2jPo6t
         H0/5A6Swb5pkyw9IrisTrFbLndiF3Fw0tQJSpzKhm1FKzOCc31krzS7SaQZOY44Vcu9w
         5ZNMFSk0ztBS6sv07qeub3cU61UdJp2USQcAaZCll/VeHFYN0qTo5p0sm39rAwok88Ez
         FaVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:references:in-reply-to:subject:cc:to:from
         :date:dkim-signature;
        bh=UiLbkz2sCCNDdfn+F9Z3YgkH05RCpjiYiTIKfb+RAus=;
        b=glNrg1WuZ4cvhg1VBTW2abKZB8sllRKIkazBhWt8sOFwZBiQuEwxWODJfIctXPRxuk
         NrTztCduhVIdx0MSPxaQLCWG7Z8oH5kpm8FOOaTcGBc2c056/zKIloqEwmDYEPqXwVcz
         1/BzTVT7bQSM1koGrO+s1nP+3g63HlxCpb07YCXQ5mfa2n9m5+TR4674BKxwduqkyqab
         Jo05KCZqLiU3UBOzrQ/qgzhtRkHrC0h9jDTnNL0eqLBoSeoSR9Shky8oYPihlhS062qq
         f/GI/fzmc885BoE0W84lT9MTJqJnn9kT5IjGjuR8p1u9vXmMqwn8lWcrmUcAxxYI2lJa
         MXGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=TrKIhSBv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jt13-20020a05621427ed00b004c6856e91dfsi10248771qvb.3.2023.01.12.10.22.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Jan 2023 10:22:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=TrKIhSBv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pG2DO-0001JD-4S; Thu, 12 Jan 2023 13:22:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pG2DJ-0001EK-A9; Thu, 12 Jan 2023 13:22:09 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pG2DH-0000Vd-4m; Thu, 12 Jan 2023 13:22:08 -0500
Received: by mail-ed1-x534.google.com with SMTP id i9so28053893edj.4;
 Thu, 12 Jan 2023 10:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UiLbkz2sCCNDdfn+F9Z3YgkH05RCpjiYiTIKfb+RAus=;
 b=TrKIhSBvYYRx/GwZiyD99s6lLeAt8lnWxAiWQOJTTP7MzrJcUKOzN0/PRX4EyBWJSK
 pAaYJSDpvWSYAH9ceIOad9G6RNTS0+2XXPifV7PkUprXN9MOgjG/CUiD1QPMWbE3Zr8v
 EwmAQDD7vetXJ7USv6UiHX7JHeG7O7RCDStyjusCe4iDcZBDQ+cjrOQk6QcLbpoa28v1
 UBLBKMcvlhklNqi9gXUrhCtabqWt4daxoNu8zeQ7hGlss3jO6huOlC6uGaHKMeUoW2W2
 mX5igOaXYymPTcK7wrZ1Rsg+EXe8LyXPcs4SJ02+1HxHAx/YxJZsp1mY93djBZu0h+OT
 I5KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UiLbkz2sCCNDdfn+F9Z3YgkH05RCpjiYiTIKfb+RAus=;
 b=kDuf9urF3GgBesf/LV4Xz+4CIYHKTkEeo20oQ1mI/ORKbKzqLOtEfrRBNnF3AVKmbf
 UIGPtSUe3wHWS3viqQiBXM6idciOuEsY2po3It6oIyshHHb+f3c3xDo8jmfH3g6k9uHz
 GKqJbbq3GMA9UdKoNmIMmMo4yJrKPc23RkG+W6ZwIPzU99OpcZRH+5+dxuFH2mPH6735
 huTRdWWBzBpWYpPF8E+uGLqu/vdyITseXPAMM1rB3KOCjg1gr5Z7VBrUk1SZyUzuBhL6
 42YiAuZbNGTJVwcOuFDv4WJm5w7WPSLGk36jsBD8+os3mtJLZw9a1DAuxnfB4Gwg4OrX
 zkLg==
X-Gm-Message-State: AFqh2kriwIF59HGrt7f8IVDRyew+pManMjei7ywUAdCOXKm24dj9mITm
 6p1eSugBAlMsRES1q9kxn6k=
X-Received: by 2002:a50:fa85:0:b0:496:d2f7:77a2 with SMTP id
 w5-20020a50fa85000000b00496d2f777a2mr22337617edr.18.1673547724588; 
 Thu, 12 Jan 2023 10:22:04 -0800 (PST)
Received: from [127.0.0.1] (dynamic-092-224-135-062.92.224.pool.telefonica.de.
 [92.224.135.62]) by smtp.gmail.com with ESMTPSA id
 g2-20020a170906538200b0085c3f08081esm2844357ejo.13.2023.01.12.10.22.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 10:22:04 -0800 (PST)
Date: Thu, 12 Jan 2023 18:21:57 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
CC: John G Johnson <john.g.johnson@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>
Subject: Re: [PATCH v6 28/33] hw/isa/piix3: Merge hw/isa/piix4.c
In-Reply-To: <09d67427-a75b-525d-7744-781287ea4fb3@linaro.org>
References: <20230109172347.1830-1-shentey@gmail.com>
 <20230109172347.1830-29-shentey@gmail.com>
 <09d67427-a75b-525d-7744-781287ea4fb3@linaro.org>
Message-ID: <88F937C9-7F76-45C1-B0E1-2FCA8D35C8C3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-TUID: 13BoOaiwJIEB



Am 12=2E Januar 2023 16:36:30 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <p=
hilmd@linaro=2Eorg>:
>On 9/1/23 18:23, Bernhard Beschow wrote:
>> Now that the PIIX3 and PIIX4 device models are sufficiently consolidate=
d,
>> their implementations can be merged into one file for further
>> consolidation=2E
>>=20
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> Reviewed-by: Michael S=2E Tsirkin <mst@redhat=2Ecom>
>> Message-Id: <20221022150508=2E26830-37-shentey@gmail=2Ecom>
>> ---
>>   hw/isa/{piix3=2Ec =3D> piix=2Ec} | 158 ++++++++++++++++++++
>>   hw/isa/piix4=2Ec             | 285 ----------------------------------=
---
>>   MAINTAINERS                |   6 +-
>>   hw/i386/Kconfig            |   2 +-
>>   hw/isa/Kconfig             |  12 +-
>>   hw/isa/meson=2Ebuild         |   3 +-
>>   hw/mips/Kconfig            |   2 +-
>>   7 files changed, 165 insertions(+), 303 deletions(-)
>>   rename hw/isa/{piix3=2Ec =3D> piix=2Ec} (75%)
>>   delete mode 100644 hw/isa/piix4=2Ec
>
>
>> @@ -489,11 +534,124 @@ static const TypeInfo piix3_xen_info =3D {
>>       =2Eclass_init    =3D piix3_xen_class_init,
>>   };
>>   +static void piix4_realize(PCIDevice *dev, Error **errp)
>> +{
>
>> +    /* initialize pit */
>> +    i8254_pit_init(isa_bus, 0x40, 0, NULL);
>Pre-existing, why there is no equivalent PIT creation in the
>PIIX3 variant? Due to in-kernel PIT in KVM?

Correct, that's one reason=2E The other reason is for interrupt wiring in =
case an HPET is present (see our discussion about the intercept_irq for the=
 rtc)=2E

I would like to create and wire up the PIT in PIIX3 as well=2E Since we'd =
have to take KVM into account here we may need a similar solution as for I8=
259=2E This is another open question for PIIX4 to become a drop-in replacem=
ent for PIIX3=2E Any ideas?

Best regards,
Bernhard
