Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp497002lff;
        Fri, 10 Jan 2020 02:25:06 -0800 (PST)
X-Google-Smtp-Source: APXvYqyONlyn6NOtJ9hkUM0nPfnSiBsLdfNPKqXbcYI7uqG/89q0w6mR0YrZ8eg+eoZM65tJkxnL
X-Received: by 2002:a50:e18b:: with SMTP id k11mr2557113edl.257.1578651906100;
        Fri, 10 Jan 2020 02:25:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578651906; cv=none;
        d=google.com; s=arc-20160816;
        b=itPXY44u+fYgOkJb0lrTJtMIy2b5jWVCrwg0F2GDJxxIj8+m6fsCOlo1zPv+c1a89o
         v1Us8C8hJs0eWy+2XNZ3lJ8x/SOHN7MBsQOPdMvfj8hi7ESiDzH10MM5BVIarNtN/SSj
         P/1o6IVWVLEegzzYd4ZKP+6DSWZMoGJZIaspIl6ZrYwn9xtybXE70wU2gqs2uzgPDFg5
         j0V8rJPr3uBjAJutnvqq3gSUo3+SFCElwnlTeWAONtbmmuxnrh5iVo3/cxYY5ADjZZcd
         zj+eOy06odh2y0IsG0l6N5+phJcgoP2Juz4VFeH3v9er2ngXWzGLmG7N5kY6FRVGhgYB
         KGHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=9U3/EG21C2tfqsHu3qJMfdsi1C954KfRso4RHsOu99c=;
        b=kPHJoDaK2r2el3yDfeyHksDl3RC/PvNm25EQzEislCj9YoyCQ2vE7sg7uKovKKxACv
         JPzOYKiJrc8sTppficf0JPzy52m4849G/UD2lRhJT6lnMqSHtsIoZm+WPuTEGmHHd1CL
         fO2imEv/nUwFZ+yeseXy0yCD8C8zzf9mxM0f8Ok4mYaeFpPyoCyYd5qPYgxw5EnBuzQf
         pb7DZPcGc0q7fSOJAZNikIbY3ep+oeSMs+3qOLfStnEA2Qf+UZK7poeyDi5sHPeMvDHW
         ehfyoZUXif0n5fKo3OoIDiUy0EVW/kBhAcCRr2IOch4IkWV04C0J1I4Zzk3/deg4bi1o
         pL0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a4D4xNLB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k7si982133ejd.225.2020.01.10.02.25.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jan 2020 02:25:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a4D4xNLB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iprTU-0001un-T3
	for alex.bennee@linaro.org; Fri, 10 Jan 2020 05:25:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59585)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iprTL-0001sT-4C
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 05:24:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iprTJ-0002sf-SS
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 05:24:55 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:46252
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iprTJ-0002q0-Ox
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 05:24:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578651893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9U3/EG21C2tfqsHu3qJMfdsi1C954KfRso4RHsOu99c=;
 b=a4D4xNLBpkR6gWNWredVxU5UYvpvCGeW+VqkFuURvE1rrZkYJoDNzwPQgkx4cx5G+uoGzZ
 Ha9dYdxPGOToXrTzhH28bkzYlErKhnBwpOO62uiWWIeriSk6k6bHUZe3ixZelLvH4gpd6W
 qtas8mge2N3JEySdtnHrRruGdL7wEcE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-q1WT5enaNs6Tcoc2AMclig-1; Fri, 10 Jan 2020 05:24:48 -0500
Received: by mail-wm1-f69.google.com with SMTP id 18so586270wmp.0
 for <qemu-arm@nongnu.org>; Fri, 10 Jan 2020 02:24:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YkWvxsJ2SABp/lWqbkSDgTJ+bOcPq06kctyMB3xjxrI=;
 b=tE7B5t6zz24wTZVs7B/P+TbS/Sui9aC5Jj66piJHmfdRvQyYdJifSbC0One7C3L4vr
 M/8oXIZK4fw+mjfJnLHfTE6OcjKc7INbrXRIjkxZVMZZLvfaooFFtflta1jlq75UPZmT
 ScRUvERJzrSRxX/aUUsk5Uxi8yMh645XD/I4eJyd2Nr0XmWIbwrhJP7EQF8b4EysaT4w
 5jC+w2YmP/Ccw6RC5+80VCSMRnEpyUEJLOD872NVKlEPxA7ceMZ0gG3LZSPaRWQifdzK
 ggLcB6w2cpq4MGnrWoBcq4SADHJ/eCViZcIVIgUPSw2m7NMRAY9nx4/TBTirNmi5RdlJ
 /eew==
X-Gm-Message-State: APjAAAU0StQb3TAgW3vLQVb8zQoeak/Gb1819a8YzQU56ZtTsn4hLVPP
 C7XE8c3pMQPN7d7dvu+/wlldBkyohMJ84BbOwI7SbW/+J6zaL9An674cnYkmG9HuwOckE3TJF/V
 mC0jgE84/moGb
X-Received: by 2002:a5d:6a88:: with SMTP id s8mr2594200wru.173.1578651886965; 
 Fri, 10 Jan 2020 02:24:46 -0800 (PST)
X-Received: by 2002:a5d:6a88:: with SMTP id s8mr2594181wru.173.1578651886733; 
 Fri, 10 Jan 2020 02:24:46 -0800 (PST)
Received: from [10.101.1.81] ([176.12.107.132])
 by smtp.gmail.com with ESMTPSA id w20sm1675398wmk.34.2020.01.10.02.24.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jan 2020 02:24:46 -0800 (PST)
Subject: Re: [PATCH 3/5] ftgmac100: check RX and TX buffer alignment
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200107073423.30043-1-clg@kaod.org>
 <20200107073423.30043-4-clg@kaod.org>
 <1587acec-3d08-9dfa-0bcc-37140fd5e2ad@redhat.com>
 <ce0722d4-48ed-e7cd-2436-84d1ee24038f@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <60b09f95-ad05-b420-3900-4afbc95a372c@redhat.com>
Date: Fri, 10 Jan 2020 11:24:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <ce0722d4-48ed-e7cd-2436-84d1ee24038f@kaod.org>
Content-Language: en-US
X-MC-Unique: q1WT5enaNs6Tcoc2AMclig-1
X-Mimecast-Spam-Score: 0
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /RX2f7gBDYjX

On 1/7/20 9:36 AM, C=C3=A9dric Le Goater wrote:
> On 1/7/20 9:27 AM, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 1/7/20 8:34 AM, C=C3=A9dric Le Goater wrote:
>>> These buffers should be aligned on 16 bytes.
>>>
>>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>>> ---
>>>  =C2=A0 hw/net/ftgmac100.c | 13 +++++++++++++
>>>  =C2=A0 1 file changed, 13 insertions(+)
>>>
>>> diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
>>> index 86ac25894a89..051f7b7af2d6 100644
>>> --- a/hw/net/ftgmac100.c
>>> +++ b/hw/net/ftgmac100.c
>>> @@ -198,6 +198,8 @@ typedef struct {
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 des3;
>>>  =C2=A0 } FTGMAC100Desc;
>>>  =C2=A0 +#define FTGMAC100_DESC_ALIGNMENT 16
>>> +
>>>  =C2=A0 /*
>>>  =C2=A0=C2=A0 * Specific RTL8211E MII Registers
>>>  =C2=A0=C2=A0 */
>>> @@ -722,6 +724,12 @@ static void ftgmac100_write(void *opaque, hwaddr a=
ddr,
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s->itc =3D valu=
e;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case FTGMAC100_RXR_BADR: /* Ring buffer=
 address */
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!QEMU_IS_ALIGNED(value,=
 FTGMAC100_DESC_ALIGNMENT)) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qem=
u_log_mask(LOG_GUEST_ERROR, "%s: Bad RX buffer alignment 0x%"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 HWADDR_PRIx "\n", __func__, value);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn;
>>
>> What is the hardware behavior?
>=20
> This is not documented :/

What happens if we don't return?

>>
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> +
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s->rx_ring =3D =
value;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s->rx_descripto=
r =3D s->rx_ring;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>> @@ -731,6 +739,11 @@ static void ftgmac100_write(void *opaque, hwaddr a=
ddr,
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>  =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case FTGMAC100_NPTXR_BADR: /* Tr=
ansmit buffer address */
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!QEMU_IS_ALIGNED(value,=
 FTGMAC100_DESC_ALIGNMENT)) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qem=
u_log_mask(LOG_GUEST_ERROR, "%s: Bad TX buffer alignment 0x%"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 HWADDR_PRIx "\n", __func__, value);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s->tx_ring =3D =
value;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s->tx_descripto=
r =3D s->tx_ring;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>
>>
>=20

