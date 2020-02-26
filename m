Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2474530lfg;
        Tue, 25 Feb 2020 19:03:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqxx4aVy/wZXR0WB/E27PcZ17BnkyeVLLNzs3Jzo43SeZEGvHrOx+isCOtQpbshopfH0Hw3Y
X-Received: by 2002:a05:620a:13e1:: with SMTP id h1mr2883385qkl.462.1582686219844;
        Tue, 25 Feb 2020 19:03:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582686219; cv=none;
        d=google.com; s=arc-20160816;
        b=pHMqXxlgPeUPD3Cdsa11yp0p4C0b0mlnEFhEHUdug+igIr8CeBURTQ7tSwXafsq5hE
         1xjgS0J5A5rZkKTEvvEh/Bc0WU7ah+JQJpx/V4l1aB39kEMUMTtVw3/q+MYBTTj+Hf38
         OR8IKlBheOnlina56b5UfTrgPFM8g+AKLPLGEL83DJcGZN6xNiQvq/LHCTYMsc+HT0ha
         GhXUSoYngfsjkQTZmgIR+2HPwymZHzs08xZwPMmb63rOBDrTXaveloCaYNm4Py5ZGXaa
         96NW5kh0uLPcNjupV/xB3LIh4zP4LTwDQSQkgCR+fJBjm8kINrEy6OC/vllI6DMyPprz
         GLUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=2zKs5bLq9Rp65Ty9SQjKjFhjAMDJT91D9JmD0xAKM+4=;
        b=jXGewiTU6rmueqpqHrCwBf8XCV65nOOOSKd/hw1BwnK1KRnzCYLXwwn/TqNv4o5Kax
         V+Zx+LV+piqM7udF5EaKhm/T2EHxh/wRuhztnuoFGCKPmEqkQNMyC9hT//Tg4pm6+o9V
         4nfr9EIlutoOk5vDAhfTPrs9A2DlLofEKwVS0ZJmwTp6kNADR5Usq9YK3iDFMJSU/ceX
         QxCnruNXuQOoj+2rKBfxrQjeL4O9fhKVWolT0/CeMMQpTAU8TmcLoGWvc/+hljFEFKaM
         Rrk+SWtEF/e7Z22/MzquuxFMsIP42kPfG9LDf4sc10mfqIpU8jvFlVLt4ztw8QWdzHm0
         vzUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gdrwcdE2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o11si265279qkh.136.2020.02.25.19.03.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2020 19:03:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gdrwcdE2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6mz5-0003r5-9I
	for alex.bennee@linaro.org; Tue, 25 Feb 2020 22:03:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38502)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jasowang@redhat.com>) id 1j6myt-0003qi-T9
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 22:03:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jasowang@redhat.com>) id 1j6mys-0004oD-Fn
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 22:03:27 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:35203
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jasowang@redhat.com>) id 1j6mys-0004dx-CE
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 22:03:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582686204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2zKs5bLq9Rp65Ty9SQjKjFhjAMDJT91D9JmD0xAKM+4=;
 b=gdrwcdE2YbC960vEOQLeC2NBgIg4ANf3d7NwUZjwxOioZe3bdgjhs/fqIIenGJTWHxyhFB
 NleZKBUS2v9ek8BduUR1zvJ+zie9HXNk6DVW3jLwumfbVGTH4tUeXYV2snegyKn0yblGf5
 0p43/31uk8/ZSXLHKZVO32Pc6re5fwY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-NVg7D-73NpOG-lInkh4Hvw-1; Tue, 25 Feb 2020 22:03:20 -0500
X-MC-Unique: NVg7D-73NpOG-lInkh4Hvw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1164313E4;
 Wed, 26 Feb 2020 03:03:19 +0000 (UTC)
Received: from [10.72.13.217] (ovpn-13-217.pek2.redhat.com [10.72.13.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BC29760BE1;
 Wed, 26 Feb 2020 03:03:09 +0000 (UTC)
Subject: Re: [PATCH] hw/net/imx_fec: write TGSR and TCSR3 in imx_enet_write()
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200225025923.19328-1-kuhn.chenqun@huawei.com>
 <9206dda7-0e12-b68e-87ca-1985b61381bc@redhat.com>
 <CAFEAcA-W+brVEmGr29i6JO4GFrnoLAce-qoMQpQc56x6B4BY3A@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <9fc2581c-56a1-0969-6a13-1454a1865264@redhat.com>
Date: Wed, 26 Feb 2020 11:03:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-W+brVEmGr29i6JO4GFrnoLAce-qoMQpQc56x6B4BY3A@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>, Chen Qun <kuhn.chenqun@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MwIfqs3j5UaO


On 2020/2/25 =E4=B8=8B=E5=8D=886:18, Peter Maydell wrote:
> On Tue, 25 Feb 2020 at 05:41, Jason Wang <jasowang@redhat.com> wrote:
>>
>> On 2020/2/25 =E4=B8=8A=E5=8D=8810:59, Chen Qun wrote:
>>> The current code causes clang static code analyzer generate warning:
>>> hw/net/imx_fec.c:858:9: warning: Value stored to 'value' is never read
>>>           value =3D value & 0x0000000f;
>>>           ^       ~~~~~~~~~~~~~~~~~~
>>> hw/net/imx_fec.c:864:9: warning: Value stored to 'value' is never read
>>>           value =3D value & 0x000000fd;
>>>           ^       ~~~~~~~~~~~~~~~~~~
>>>
>>> According to the definition of the function, the two =E2=80=9Cvalue=E2=
=80=9D assignments
>>>    should be written to registers.
>>>
>>> Reported-by: Euler Robot <euler.robot@huawei.com>
>>> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
>>> ---
>>> I'm not sure if this modification is correct, just from the function
>>>    definition, it is correct.
>>> ---
>>>    hw/net/imx_fec.c | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
>>> index 6a124a154a..92f6215712 100644
>>> --- a/hw/net/imx_fec.c
>>> +++ b/hw/net/imx_fec.c
>>> @@ -855,13 +855,13 @@ static void imx_enet_write(IMXFECState *s, uint32=
_t index, uint32_t value)
>>>            break;
>>>        case ENET_TGSR:
>>>            /* implement clear timer flag */
>>> -        value =3D value & 0x0000000f;
>>> +        s->regs[index] =3D value & 0x0000000f;
>>>            break;
> Hi; the datasheet for this SoC says that these bits
> of the register are write-1-to-clear, so while this
> is definitely a bug I don't think this is the right fix.
>
>>>        case ENET_TCSR0:
>>>        case ENET_TCSR1:
>>>        case ENET_TCSR2:
>>>        case ENET_TCSR3:
>>> -        value =3D value & 0x000000fd;
>>> +        s->regs[index] =3D value & 0x000000fd;
>>>            break;
> Here bit 7 is write-1-to-clear, though bits 0 and
> 2..5 are simple write-the-value.
>
>>>        case ENET_TCCR0:
>>>        case ENET_TCCR1:
>>
>> Applied.
> Could you drop this from your queue, please?
>
> thanks
> -- PMM


Sure, Chen please send V2 to address Peter's comment.

Thanks

