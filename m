Received: by 10.223.197.9 with SMTP id q9csp2562603wrf;
        Mon, 9 Oct 2017 08:23:04 -0700 (PDT)
X-Received: by 10.200.46.233 with SMTP id i38mr15457412qta.330.1507562584008;
        Mon, 09 Oct 2017 08:23:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507562583; cv=none;
        d=google.com; s=arc-20160816;
        b=tN3lto2NdcgZYwJsHTe9hVuQ5afS58bvFdpSj0fNA13JRVFH+672yc/8B/l2mMYqEz
         Jsl3rO5zUhMljtx/B/qmflt9Gevd4pbbK5ocPWFz0NDqx17jMKCZCbs4lPHw4SMRon5o
         iGu4mljPBW2IvazfgL/Z0RqA9vpBW8d+/VSZFm6Cubdpds3f6wC6T78ktqOp7UQpLsRc
         jBnYOUbm66tccmQDAy7pBua9QLHtPFJt94oYmaw5/pWcRInVHBSxa6xhD4lrJto0TJ5r
         GOJpKZbNNbjl0f76DNKxws3iuop82PkQxvyXw/RD9v/JGcasJQPOAExxcjZK8RhEgVPU
         z5GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=nSPpBOPMsZ7pH2bRusOZ0HolnzOUpclPfBlQbWjkz7Q=;
        b=coScpmPcfiHxycvywxzVxkFIM4dr39f/CQQxCBFvirI4TJ65EN0PeAwOMYOR62TMXa
         0Xpv9Gc1H2oRfbshfoUSHcRHEzF3+SsL13y3FTcrV5+h1SscMYPEP5sB4peo0BqeAXRh
         ZZgvNfkK4T1QdoXdXstt+GAFa6Wm0Vc08tLpSiP6vXDVfoS6n1pbBXtv4G6ndCA0V59y
         IlpzyLc16YjskB7wTjpFHw5mphn6+byncwm023PlDUfw/14kKXfOZFwhu34ake/Sz9ju
         8iZu0odTnloosICAkXAV2IxEDgpryF0TXrKbT/JOX1rEiskQYirAdUfgaE+L+T1CQNSD
         XpFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LQe0dJsS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h72si320250qka.372.2017.10.09.08.23.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Oct 2017 08:23:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LQe0dJsS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58359 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e1ZtX-0002Ac-HC
	for alex.bennee@linaro.org; Mon, 09 Oct 2017 11:23:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40534)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e1ZtO-00028u-16
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 11:22:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e1ZtN-0006t3-7M
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 11:22:54 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:53509)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1e1ZtN-0006sq-2Z; Mon, 09 Oct 2017 11:22:53 -0400
Received: by mail-qt0-x243.google.com with SMTP id n61so15804414qte.10;
	Mon, 09 Oct 2017 08:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nSPpBOPMsZ7pH2bRusOZ0HolnzOUpclPfBlQbWjkz7Q=;
	b=LQe0dJsSrXpRk87VeVDhvo92tTNiK2lhhD3ihJLY7R1bCzm9opoPVGPfJWSlP9HeJF
	hjQ9SovVic4j8HrkXtLv2i/z+qU349WGOwU8TmpAfoDZ7mDUrYuL/zWHnBfB2rZELJcV
	84sFlBGuXWa6qHM+oC/7cti69J6VZBW0FjryQ3v3zeQesaHWzbVpMU5vGSQkGY62aWjh
	enmiUEwh2wG8+uERpJR+9VTIFEO6Tiix672DWqYXTSke5SXgz/DcXuWbRwvcv2iUza1e
	5kbyIrHeJIJmdmKveXQEzVAB8s0KDxUIq4eQMwy6vzRLy+n72T34oPC/uAr/ToGGQAiQ
	8dlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nSPpBOPMsZ7pH2bRusOZ0HolnzOUpclPfBlQbWjkz7Q=;
	b=lRYd1rSVI0vVI5PmJ9aIbpi+p/N7z7+devmjRRJk2KtxZDtaX1hHQJ8yVF2WpQ3hAJ
	OeIS66LEQb5dFqh8Vx944AYconbI1OaC+e85bIm5ENQYK68vOgyx709U3E3fSzaILpUK
	N0VXrk6sCHC0xWtJKTNwHwGAw5hxpcmDSuWgAUMd9Zo5F5B3t1tXSt3jHw2bzg/piaSo
	7d0o+jUCDS87h89UkeaLe3dgz8hNW5Nppfgl3JDgfy/7zep7HeWybW6IZXlzrbIRsV1l
	VBTbtF/otk30jYMcvHSQcX5UR3vhAbmBpRYq/gZzPsRDTqexLaZ6Zvjn5Kyt8wwLCAc6
	SMXA==
X-Gm-Message-State: AMCzsaU+cui5zzjPxFYmMp5rAw74/JQwvfkj/Smvo0aKa5BK7axLsN5B
	PFgPRiQ+P89ttC/dOIs93mmNoWMhKY3EzptlHJU=
X-Google-Smtp-Source: AOwi7QAv9jWKgA6yl8QXiu59f8IYF5mQh7VA0esoM+oGs6pjsAyzFqzDPFpMFp5K4GlGUnAxq46g/FWRTYWYFqj+1Zk=
X-Received: by 10.200.54.220 with SMTP id b28mr9225234qtc.186.1507562572524;
	Mon, 09 Oct 2017 08:22:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.165 with HTTP; Mon, 9 Oct 2017 08:22:52 -0700 (PDT)
In-Reply-To: <CAFEAcA_+HDjZWHbNhedzL7he=-1WPMRePh917-9BZJK0AYqPdg@mail.gmail.com>
References: <20170918195100.17593-1-andrew.smirnov@gmail.com>
	<20170918195100.17593-8-andrew.smirnov@gmail.com>
	<CAFEAcA_+HDjZWHbNhedzL7he=-1WPMRePh917-9BZJK0AYqPdg@mail.gmail.com>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Mon, 9 Oct 2017 08:22:52 -0700
Message-ID: <CAHQ1cqEF=H_T64zA-_eJG_yi7xb8etG8RB+xLQinxi4H6EKXTg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-arm] [PATCH 07/17] imx_fec: Emulate SHIFT16 in ENETx_RACC
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lTOA1wbxosd/

On Fri, Oct 6, 2017 at 7:02 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 18 September 2017 at 20:50, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
>> Needed to support latest Linux kernel driver which relies on that
>> functionality.
>>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: Jason Wang <jasowang@redhat.com>
>> Cc: qemu-devel@nongnu.org
>> Cc: qemu-arm@nongnu.org
>> Cc: yurovsky@gmail.com
>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>> ---
>>  hw/net/imx_fec.c         | 23 +++++++++++++++++++++++
>>  include/hw/net/imx_fec.h |  2 ++
>>  2 files changed, 25 insertions(+)
>>
>> diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
>> index 8a77136d38..bd62d7a75f 100644
>> --- a/hw/net/imx_fec.c
>> +++ b/hw/net/imx_fec.c
>> @@ -1037,6 +1037,7 @@ static ssize_t imx_enet_receive(NetClientState *nc, const uint8_t *buf,
>>      uint32_t buf_addr;
>>      unsigned int buf_len;
>>      size_t size = len;
>> +    bool shift16 = s->regs[ENET_RACC] & ENET_RACC_SHIFT16;
>>
>>      FEC_PRINTF("len %d\n", (int)size);
>>
>> @@ -1049,6 +1050,10 @@ static ssize_t imx_enet_receive(NetClientState *nc, const uint8_t *buf,
>>      /* 4 bytes for the CRC.  */
>>      size += 4;
>>
>> +    if (shift16) {
>> +        size += 2;
>> +    }
>> +
>>      /* Huge frames are truncted.  */
>>      if (size > s->regs[ENET_FTRL]) {
>>          size = s->regs[ENET_FTRL];
>> @@ -1085,6 +1090,24 @@ static ssize_t imx_enet_receive(NetClientState *nc, const uint8_t *buf,
>>              buf_len += size - 4;
>>          }
>>          buf_addr = bd.data;
>> +
>> +        if (shift16) {
>> +            /*
>> +             * If SHIFT16 bit of ENETx_RACC register is set we need to
>> +             * align the payload to 4-byte boundary.
>> +             */
>> +            const uint8_t zeros[2] = { 0 };
>> +
>> +            dma_memory_write(&address_space_memory, buf_addr,
>> +                             zeros, sizeof(zeros));
>> +
>> +            buf_addr += sizeof(zeros);
>> +            buf_len  -= sizeof(zeros);
>> +
>> +            shift16 = false; /* We only do this once per Ethernet
>> +                              * frame */
>> +        }
>> +
>
> Can you avoid having an end-of-source-line comment that wraps
> to multiple lines, please? (put it on a line of its own, or
> edit down to fit.) Otherwise
>

Sure, will fix in v2.

Thanks,
Andrey Smirnov
