Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp3354015lfg;
        Wed, 26 Feb 2020 09:42:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqymx0gDeArJbkWqAe0oDa63ou9UAt1zeMbaAe3wcsJJxXUTwTKW/yUA3N/5r8dtISKaSvfO
X-Received: by 2002:ad4:52eb:: with SMTP id p11mr171437qvu.211.1582738974101;
        Wed, 26 Feb 2020 09:42:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582738974; cv=none;
        d=google.com; s=arc-20160816;
        b=JiQeXikwOHMiN/P76nCcdSThw1IYyHc6kV5SZVIasOLP14+ZXq/jbQEh41DWStk1Oe
         re4L9197DGmy81SuhU3jBRgfHCOC1K3oTn45GSscq3IH/xZPQxEB+gb+R/Bi+1sP1eVg
         djaHO2C2MuEQb3APEm4eTvZiNqbNQqrih/ZR5dLuI2nTENl+bYOd7OkOUgneCYEXy5/B
         6Gma+Q0eUrWyx3Y89u/0gT1c+At3PRWZQGkjEdZcu8hvqBVc5lYobpvrL405K37YCime
         iR/G157KgycD41UhgtZBPNAt4bAf4HZT85oXNvgF/sag69bXcD2iFshWiP5CBmrJIz6O
         mHIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:dkim-signature;
        bh=R7vlve06xJUYKViIfIetyL+xd4OQb6eg8G10/jwSB78=;
        b=N9uACFOXihQeWEK/Wglf9xObZhgTA5M3GFw3RJos/72oMzfM0mbP1l876yjsZ1hKJj
         DGPpiRcY2Oax7Q94TmqHRnVj17f4wSVmxiLBYbdEYZXyg7Yom+wDI2jqutBTy0p2UIeF
         bCTZALnxvPlK+7SkHA4XrI9IOwqyOga0WSvzSi5rV8GcsrlzNC0iMLYXQ8PxPnqhdZ0E
         gF46Qjb19zlevC3gx7SWNPVO+Z1YalxrIjeN1TSoRe7dyJa5MJI9OKa+PCNt4A70LDTw
         fnR2wy4DzwFWys8rNXmLxNjeStcRq1wwExoWWTojjHYZvZkKQUsIlSqn7P81wFH1IvNZ
         FIbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ab0l92Of;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y11si71801qtn.167.2020.02.26.09.42.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2020 09:42:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ab0l92Of;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j70hx-00015L-Ft
	for alex.bennee@linaro.org; Wed, 26 Feb 2020 12:42:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54978)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j70ho-00013g-TO
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 12:42:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j70hn-0005lC-SM
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 12:42:44 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:26424
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j70hn-0005iy-PD
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 12:42:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582738963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R7vlve06xJUYKViIfIetyL+xd4OQb6eg8G10/jwSB78=;
 b=Ab0l92OfunGf6NISMsJeN8UHPZKGT+JMKcde7Wo6njw6kuKSJrtGHhKd5CLSfklpDd3aCF
 dr7tIFN6Zj64/ubmPaqAVOMbYPGMQIPA5XR8dsG7mXWVz86TvwAo0N5vkHE/sNhXdaTQgu
 A5bQEyqNuowT0fehxsCWB/jg6yKIX3I=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-b-a9g2U2Nmq3XBqMiAvFaw-1; Wed, 26 Feb 2020 12:42:39 -0500
X-MC-Unique: b-a9g2U2Nmq3XBqMiAvFaw-1
Received: by mail-wm1-f71.google.com with SMTP id x9so1188288wmc.7
 for <qemu-arm@nongnu.org>; Wed, 26 Feb 2020 09:42:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j/IpPYrRgI6zE/eaofYXVxetlw0aFn3xDxEy6HlGXfE=;
 b=kojhNM6VDGlBzQuqgq3lUmj9DshO3xaThrsPLFu0ytFoNEkCnggmq9Br5SGUXo2gbh
 HF5XtN+jvmKSmNReQQGwcX4VoKWXlyCcdRJgQi/qR6u3YOTyDuOupFLmydYw6wJguqO2
 fwkB4TCVwqiVNlHiBrhLG3C7VKmEFQc4phi9HXUNp8gJQkCQSR2/d5Fmj7azKRNvZoSD
 jF16h56/jRs6poEVJ8Lk8gElX72yR6wMkNf2J3rL1pixW8yZmYFC0Leh5FtWlQE29SZ6
 Bg8MuLSQzuqmnNDQU3DwAdDBF5lF5meO59Wc+wxIZiaAcFUUcctFMUcLdCTYApJeOZsW
 7uSg==
X-Gm-Message-State: APjAAAWc7PFNqMY+lKgOOamMxTVJjCqZ0s5IR7t5FcRJScUHssqY2GW4
 q3B5y5aJJB0z53l5UQzSIAjS5upixDuVQ+rKtgMMv2QD7OH/TCqHcCVTagR/T/rVIgOF1KYbgfG
 MMJFLnE2ptFjr
X-Received: by 2002:a7b:c3d1:: with SMTP id t17mr2987wmj.27.1582738958038;
 Wed, 26 Feb 2020 09:42:38 -0800 (PST)
X-Received: by 2002:a7b:c3d1:: with SMTP id t17mr2916wmj.27.1582738956906;
 Wed, 26 Feb 2020 09:42:36 -0800 (PST)
Received: from [192.168.1.35] (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id x6sm4129174wrr.6.2020.02.26.09.42.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2020 09:42:36 -0800 (PST)
Subject: Re: [PATCH] hw/arm/smmu-common: a fix to smmu_find_smmu_pcibus
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 peterx@redhat.com
References: <20200226172628.17449-1-eric.auger@redhat.com>
 <6f82ec7a-fb74-a47a-100b-325d5de36a7d@redhat.com>
Message-ID: <039d7268-9884-8a29-890b-8e06dd2a0994@redhat.com>
Date: Wed, 26 Feb 2020 18:42:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <6f82ec7a-fb74-a47a-100b-325d5de36a7d@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pGkVhWHWl4mz

On 2/26/20 6:37 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Hi Eric,
>=20
> On 2/26/20 6:26 PM, Eric Auger wrote:
>> Make sure a null SMMUPciBus is returned in case we were
>> not able to identify a pci bus matching the @bus_num.
>>
>> This matches the fix done on intel iommu in commit:
>> a2e1cd41ccfe796529abfd1b6aeb1dd4393762a2
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>> =C2=A0 hw/arm/smmu-common.c | 1 +
>> =C2=A0 1 file changed, 1 insertion(+)
>>
>> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
>> index 0f2573f004..67d7b2d0fd 100644
>> --- a/hw/arm/smmu-common.c
>> +++ b/hw/arm/smmu-common.c
>> @@ -301,6 +301,7 @@ SMMUPciBus *smmu_find_smmu_pcibus(SMMUState *s,=20
>> uint8_t bus_num)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return smmu_pci_bus;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 }
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 smmu_pci_bus =3D NULL;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return smmu_pci_bus;
>> =C2=A0 }
>>
>=20
> Patch is easy to review but code not. By inverting the if() statement I=
=20
> find the code easier to review. The patch isn't however:

I used 'git-diff -W' instead of 'git-diff -w'. -w works better:

-- >8 --
@@ -290,10 +290,12 @@ inline int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t=20
iova, IOMMUAccessFlags perm,
  SMMUPciBus *smmu_find_smmu_pcibus(SMMUState *s, uint8_t bus_num)
  {
      SMMUPciBus *smmu_pci_bus =3D s->smmu_pcibus_by_bus_num[bus_num];
-
-    if (!smmu_pci_bus) {
      GHashTableIter iter;

+    if (smmu_pci_bus) {
+        return smmu_pci_bus;
+    }
+
      g_hash_table_iter_init(&iter, s->smmu_pcibus_by_busptr);
      while (g_hash_table_iter_next(&iter, NULL, (void **)&smmu_pci_bus)) {
          if (pci_bus_num(smmu_pci_bus->bus) =3D=3D bus_num) {
@@ -301,8 +303,8 @@ SMMUPciBus *smmu_find_smmu_pcibus(SMMUState *s,=20
uint8_t bus_num)
              return smmu_pci_bus;
          }
      }
-    }
-    return smmu_pci_bus;
+
+    return NULL;
  }

---

>=20
> The code is easier although:
>=20
> SMMUPciBus *smmu_find_smmu_pcibus(SMMUState *s, uint8_t bus_num)
> {
>  =C2=A0=C2=A0=C2=A0 SMMUPciBus *smmu_pci_bus =3D s->smmu_pcibus_by_bus_nu=
m[bus_num];
>  =C2=A0=C2=A0=C2=A0 GHashTableIter iter;
>=20
>  =C2=A0=C2=A0=C2=A0 if (smmu_pci_bus) {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return smmu_pci_bus;
>  =C2=A0=C2=A0=C2=A0 }
>=20
>  =C2=A0=C2=A0=C2=A0 g_hash_table_iter_init(&iter, s->smmu_pcibus_by_buspt=
r);
>  =C2=A0=C2=A0=C2=A0 while (g_hash_table_iter_next(&iter, NULL, (void **)&=
smmu_pci_bus)) {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (pci_bus_num(smmu_pci_bus-=
>bus) =3D=3D bus_num) {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s->sm=
mu_pcibus_by_bus_num[bus_num] =3D smmu_pci_bus;
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retur=
n smmu_pci_bus;
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>  =C2=A0=C2=A0=C2=A0 }
>=20
>  =C2=A0=C2=A0=C2=A0 return NULL;
> }
>=20
> What do you think?

