Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp284167ejc;
        Mon, 25 Sep 2023 03:39:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEt3wEuqe8HCWBM+zh+gUFijBJiBQTnkVs/0sDCTX7VJ1hl6k1SKkQPIrU3lqwQIMQobvNd
X-Received: by 2002:a05:620a:17a3:b0:76f:1808:997c with SMTP id ay35-20020a05620a17a300b0076f1808997cmr7891169qkb.20.1695638343553;
        Mon, 25 Sep 2023 03:39:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695638343; cv=none;
        d=google.com; s=arc-20160816;
        b=pfNP7Lz3E6JG5LOhcXTeLRebI+n9xRvyWUbKSWDB8QoPsN6z30Lc2rqW2r06XfZ7Kn
         jzeYes0mr6gVKEnP28AaOof2d0ebBsMx6Sxy2cN9XTEulw6kyq+CUx4ZG809//FJ8D1s
         QTgfEdONBvyWBWmtwd4UmIkk1rUriiZBNJftuqZGnxVksGu9u0txcIleCNS6/eXixkTL
         FTpcQTe9p5bGqfr2LNpX3Pm/ty6JDTwgBDJG1m7sjjq81jT97tNKi6W/1piIPGvB9726
         IXGFDfLrfvQAIsanro/dUgS6fMSBN282t1aa+gsEsxxpL3FCEQABGIPSwYm74hVK1iyE
         52Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:dkim-signature;
        bh=+C377x+CbwazZJZ66olOSzv6nP84m8st+fB2PNbVT1E=;
        fh=u89sVVyqFLG/vPxvb8pEDH0QxlMiUFUsH1Ebr9krIHw=;
        b=kkVOFwaK5ZdCZWfUcg4mTIiY1dY+aKJ6X850CGMCKhdjbdgdyX/+Cryb0YeFhYYnQr
         TwfDrEgGj35FwsmyuCflpu7mPrz794SQaw/MDiAt2/wD9TJ9woPDYy44YemSH9a3PBOI
         Wuu5a5lnNhQ8sJJG0QtAPO30Ii4JezoT3LfzpJz2q33xdLDstZ9Q1FQCWALm1w1bPgCh
         oBJ+MDp/oMbd4OwWxzJ6wUcHxT+HKz/EhpZ0O2gPgEXIyXbNKu+7CgGB4pe2Q7Vp/UMd
         o1tVnI5cPiSVvmkgotXEhHRKi8CD+A0f1kDthHGL+gnFMbheZjS8Vdxy+Xd/8WznbmC0
         eKJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ddPhzWtu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id az17-20020a05620a171100b00774373352acsi344851qkb.762.2023.09.25.03.39.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Sep 2023 03:39:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ddPhzWtu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qkizA-0005hQ-NV; Mon, 25 Sep 2023 06:38:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qkiz9-0005fT-7Y
 for qemu-devel@nongnu.org; Mon, 25 Sep 2023 06:38:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qkiz7-0003qK-Ca
 for qemu-devel@nongnu.org; Mon, 25 Sep 2023 06:38:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695638316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+C377x+CbwazZJZ66olOSzv6nP84m8st+fB2PNbVT1E=;
 b=ddPhzWtuqzXMJV4QnOoR4jB1Jfj7IQOf11sM5PXhw4vuo0xqnqInHhDdqPj3OAJBEVMagh
 vyDVKM6ckO5RxAXImU1KSezZNXKuF2FrjjOvWRL+mm5MdjXx1ikNZuU/AzXoXq5QvSw6mR
 HPYlpFcFid120Sq4zASJmwWJ9r2r52o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-211-N-fPm9dlN7mdOIyD1BPCMg-1; Mon, 25 Sep 2023 06:38:31 -0400
X-MC-Unique: N-fPm9dlN7mdOIyD1BPCMg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 073188039C1;
 Mon, 25 Sep 2023 10:38:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D719AC15BB8;
 Mon, 25 Sep 2023 10:38:30 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id F127D21E6900; Mon, 25 Sep 2023 12:38:29 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org,
 qemu-arm@nongnu.org,  qemu-ppc@nongnu.org,  Eduardo Habkost
 <eduardo@habkost.net>
Subject: Re: [PATCH v2 12/15] hw/display/sm501: Unify common QOM properties
References: <20230203145536.17585-1-philmd@linaro.org>
 <20230203145536.17585-13-philmd@linaro.org>
 <efb25519-b134-e8d0-14ac-58189b39103d@linaro.org>
 <b006d7e3-22fb-54cf-d05e-45f15457032f@eik.bme.hu>
Date: Mon, 25 Sep 2023 12:38:29 +0200
In-Reply-To: <b006d7e3-22fb-54cf-d05e-45f15457032f@eik.bme.hu> (BALATON
 Zoltan's message of "Mon, 27 Feb 2023 18:01:35 +0100 (CET)")
Message-ID: <874jjia66y.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: DUsWaPZfrB/E

BALATON Zoltan <balaton@eik.bme.hu> writes:

> On Mon, 27 Feb 2023, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 3/2/23 15:55, Philippe Mathieu-Daud=C3=A9 wrote:
>>> Since now PCI and SysBus properties are identical, unify them.
>>> Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>>> ---
>>>   hw/display/sm501.c | 11 +++--------
>>>   1 file changed, 3 insertions(+), 8 deletions(-)
>>> diff --git a/hw/display/sm501.c b/hw/display/sm501.c
>>> index efebd93f1e..98375138b2 100644
>>> --- a/hw/display/sm501.c
>>> +++ b/hw/display/sm501.c
>>> @@ -1975,7 +1975,7 @@ static void sm501_realize_sysbus(DeviceState *dev=
, Error **errp)
>>>       /* TODO : chain irq to IRL */
>>>   }
>>>   -static Property sm501_sysbus_properties[] =3D {
>>> +static Property sm501_common_properties[] =3D {
>>>       DEFINE_PROP_UINT32("vram-size", SM501SysBusState, vram_size, 0),
>>>       DEFINE_PROP_END_OF_LIST(),
>>>   };
>>
>>
>>> @@ -2062,11 +2062,6 @@ static void sm501_realize_pci(PCIDevice *dev, Er=
ror **errp)
>>>                        &s->state.mmio_region);
>>>   }
>>>   -static Property sm501_pci_properties[] =3D {
>>> -    DEFINE_PROP_UINT32("vram-size", SM501PCIState, vram_size, 64 * MiB=
),
>
> Oops, indeed the defaults are different so maybe just drop this patch for=
 now.

Okay, I'm ignoring this patch.

