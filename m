Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp57561lff;
        Tue, 3 Dec 2019 18:16:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqyYS/rDxSrhzyDrvTBnfQhl09Y4oglqDWn9WmGI/zBX8pKk1vLSZudbFGxPJDafT40WxDGZ
X-Received: by 2002:a05:620a:1116:: with SMTP id o22mr682066qkk.190.1575425804239;
        Tue, 03 Dec 2019 18:16:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575425804; cv=none;
        d=google.com; s=arc-20160816;
        b=aCrq9fVIeZn/ecxuBFRLtNCrsY8XNaavU95nRFzesglvO3jChy8L7fih/shuv/Hh3r
         mR0un/5oIT94ngnTRB0eVnSREWK+AkAYZfmxdQ/jxbpk43ZAUdGfsgCEi6HNl0ZuAkPj
         CG0bKD8sXsayl63tzo2DGAr1DliDjS8eQV9eEUjoVBfdW1YsK3MGvCuxaDBaK4W0BtYj
         8rH9/CgzUi1PgeE8vw8YbqZk7jBZqNA8u5ekAXLOv6Yw9vb305rkneHg10+/+NO4x8ad
         crEW1rfGJQJeaWLbVjrM3zh8AlW/eI9/5RocOhwRzd6137/2pYK9f0PrImZaXafVGEg6
         Drkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=wXEE1wJyPj6gtPCkc/kKuPTioY0kF5NKRS4t1wJ7Jmc=;
        b=FbR9+MY3dLuwZwXQJSV4OgzqausXMEvFzO3P/iJIOxr4adOsVSRis0frpQWcLnhRjW
         z1Of2QPje/UNQQ/tw9y90qqokZMtfvYZsIyidkrb5U1B/uS4QMLmpO9iBzfkG2/ytDPI
         CmtuFuyhsjq7mC/hjHB5nnJBSniJ/EtwUdKVe+QRujVmMMLIzZYB1aruC8B/FSiC/gwi
         X1rH00xtjfa4j7uB4Ut/0GA2r3Tfv28v2Fs7EJQ2Im/NUzL4OtdkdyTYuEpf57sAQ/fJ
         IbKBs+uODHLdiT90+ifjWCTLG2O61hBTlF3EH1TguPiEWbd9nntiH0zWNGD3Fl3yPRN4
         LNgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=C4xRQfOb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t41si1010693qtt.162.2019.12.03.18.16.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2019 18:16:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=C4xRQfOb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1icKDY-0004oG-KC
	for alex.bennee@linaro.org; Tue, 03 Dec 2019 21:16:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34845)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jasowang@redhat.com>) id 1icKCF-0004gA-PX
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 21:15:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jasowang@redhat.com>) id 1icKC4-0004OP-WB
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 21:15:13 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:42600
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jasowang@redhat.com>) id 1icKC4-00047o-On
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 21:15:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575425702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wXEE1wJyPj6gtPCkc/kKuPTioY0kF5NKRS4t1wJ7Jmc=;
 b=C4xRQfObzwW5631IpFrJGDcK85FOkNpIirXrsx/oYcuul3+J7NqKm10i0Ah5AMD5eOPwuk
 erneeYbyEzC4HwDfT9Dao9iG8o920PT+IIYiLzHOYxAG13bGcu79dYoilvTCp16kDIF1WJ
 kAijK0m0dHKz7dR8QoLiO2/yeTIrnC4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-CeDC4bRnON-60DPUodyBfg-1; Tue, 03 Dec 2019 21:15:00 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75363107ACC4;
 Wed,  4 Dec 2019 02:14:58 +0000 (UTC)
Received: from [10.72.12.78] (ovpn-12-78.pek2.redhat.com [10.72.12.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7EE2060C80;
 Wed,  4 Dec 2019 02:14:51 +0000 (UTC)
Subject: Re: [PATCH] net/imx_fec: Updating the IMX_FEC IP to support loopback
 mode.
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Wasim, Bilal" <Bilal_Wasim@mentor.com>
References: <20191129150508.24404-1-bilalwasim676@gmail.com>
 <afe9efde-7ac1-8607-446a-8fbf10accece@redhat.com>
 <8c956ae31e8f44a2b831a5030b2448b4@SVR-IES-MBX-03.mgc.mentorg.com>
 <CAP+75-X_POJfTO=gOUu1zCPtcfnQ5yemQo0hqB_s3jy_C17o9g@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <db2c5074-307c-d20e-73f2-9c2b44612d6f@redhat.com>
Date: Wed, 4 Dec 2019 10:14:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAP+75-X_POJfTO=gOUu1zCPtcfnQ5yemQo0hqB_s3jy_C17o9g@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: CeDC4bRnON-60DPUodyBfg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "aa1ronham@gmail.com" <aa1ronham@gmail.com>,
 "jcd@tribudubois.net" <jcd@tribudubois.net>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "bilalwasim676@gmail.com" <bilalwasim676@gmail.com>,
 "linux@roeck-us.net" <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +WNmfGAr4rz8


On 2019/11/30 =E4=B8=8A=E5=8D=8812:04, Philippe Mathieu-Daud=C3=A9 wrote:
> On Fri, Nov 29, 2019 at 4:59 PM Wasim, Bilal <Bilal_Wasim@mentor.com> wro=
te:
>> Thanks for the pointers philippe.. Is the patch okay to be merged withou=
t it or do I need to do a re-submission with the updated username ?
> If there are no review comments on your patch, I think the maintainer
> taking your patch can fix this details directly, no need to resend.
>
>> -----Original Message-----
>> From: Philippe Mathieu-Daud=C3=A9 [mailto:philmd@redhat.com]
>> Sent: Friday, November 29, 2019 8:38 PM
>> To: bilalwasim676@gmail.com; qemu-devel@nongnu.org
>> Cc: peter.maydell@linaro.org; aa1ronham@gmail.com; jcd@tribudubois.net; =
qemu-arm@nongnu.org; Wasim, Bilal <Bilal_Wasim@mentor.com>; linux@roeck-us.=
net; Jason Wang <jasowang@redhat.com>
>> Subject: Re: [PATCH] net/imx_fec: Updating the IMX_FEC IP to support loo=
pback mode.
>>
>> Hi Bilal,
>>
>> Cc'ing Jason, the maintainer of network devices.
>>
>> On 11/29/19 4:05 PM, bilalwasim676@gmail.com wrote:
>>> From: bwasim <bilal_wasim@mentor.com>
>> Your git setup misses your 'user.name', you could fix it running:
>>
>>     git config user.name "Bilal Wasim"
>>
>> (eventually with the --global option).
>>
>> The patch looks good otherwise.
>>
>> Thanks!


Applied with the fix for user.name.

Thanks


>>
>>> Loopback mode only works when specific conditions (as dictated by the
>>> IP guide) are met, i.e. the MII_MODE is set and the RMII_MODE is
>>> cleared. If not, we simply send the packet on the output queue (for TX
>>> to the host network). Tested by running a custom RTOS and TXing a ton
>>> of packets. The same packets were received on the RX side..
>>>
>>> Signed-off-by: Bilal Wasim <bilal_wasim@mentor.com>
>>> ---
>>>    hw/net/imx_fec.c | 27 +++++++++++++++++++++++++--
>>>    1 file changed, 25 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c index
>>> bd99236864..c51e7f7363 100644
>>> --- a/hw/net/imx_fec.c
>>> +++ b/hw/net/imx_fec.c
>>> @@ -256,6 +256,29 @@ static const VMStateDescription vmstate_imx_eth =
=3D
>>> {
>>>
>>>    static void imx_eth_update(IMXFECState *s);
>>>
>>> +/*
>>> + * Function to check if the MAC is configured to run in loopback mode.
>>> + * If so, invoke the "receive" routine.
>>> + * Else write to the output.
>>> + * */
>>> +static void send_pkt(IMXFECState *s, uint8_t *frame, int frame_size)
>>> +{
>>> +    NetClientState *nc =3D qemu_get_queue(s->nic);
>>> +
>>> +    /*
>>> +     * Loopback or Normal mode ?
>>> +     * Per the FEC Manual: If loopback is enabled, the MII_MODE
>>> +     * should be SET and the RMII_MODE should be cleared. Loopback
>>> +     * will only work if this criterion is met. If not met,
>>> +     * we will send the frame on the output queue. */
>>> +    if ((s->regs[ENET_RCR] & ENET_RCR_LOOP) && (s->regs[ENET_RCR] & EN=
ET_RCR_MII_MODE)
>>> +            && !(s->regs[ENET_RCR] & ENET_RCR_RMII_MODE)) {
>>> +        nc->info->receive(nc, frame, frame_size);
>>> +    } else {
>>> +        qemu_send_packet(nc, frame, frame_size);
>>> +    }
>>> +}
>>> +
>>>    /*
>>>     * The MII phy could raise a GPIO to the processor which in turn
>>>     * could be handled as an interrpt by the OS.
>>> @@ -488,7 +511,7 @@ static void imx_fec_do_tx(IMXFECState *s)
>>>            frame_size +=3D len;
>>>            if (bd.flags & ENET_BD_L) {
>>>                /* Last buffer in frame.  */
>>> -            qemu_send_packet(qemu_get_queue(s->nic), s->frame, frame_s=
ize);
>>> +            send_pkt(s, (uint8_t *)&s->frame, frame_size);
>>>                ptr =3D s->frame;
>>>                frame_size =3D 0;
>>>                s->regs[ENET_EIR] |=3D ENET_INT_TXF; @@ -586,7 +609,7 @@
>>> static void imx_enet_do_tx(IMXFECState *s, uint32_t index)
>>>                }
>>>                /* Last buffer in frame.  */
>>>
>>> -            qemu_send_packet(qemu_get_queue(s->nic), s->frame, frame_s=
ize);
>>> +            send_pkt(s, (uint8_t *)&s->frame, frame_size);
>>>                ptr =3D s->frame;
>>>
>>>                frame_size =3D 0;
>>>

