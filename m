Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2307792wrq;
        Thu, 7 Jun 2018 09:31:32 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJutxY+dDYMtlom8pI8VvWIrln2PZUg0lpLN1qp815XxX3sWAUoL+V+MYS+L3c+1ZGAIySK
X-Received: by 2002:a37:5705:: with SMTP id l5-v6mr2202724qkb.84.1528389092519;
        Thu, 07 Jun 2018 09:31:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528389092; cv=none;
        d=google.com; s=arc-20160816;
        b=p8nVmVv2ieeAQ2xAiZJsFSLoZ0n3B9Y4VJizpgJfy8kU1cgj2BiUevX3u5cSLO1jeY
         8cB1SKJvb21RdxVqt0L29UgXK0fTqcDjRyYPPwwprB0PKSpgtTl+7Z9/CzApgLs92iX3
         oDKsXaMkmUVSEbysvVKUQ86+Y3ptTWNM2+zvSwdzySlkdKKK/3IEqbY7C31Jlm3hhH68
         UWGWpOccYx798fQer1ICxUtwa9ReGWcT2cSwMsmMhq8j9b1Kwy6P8x4aJbPSd7qLXL85
         tRPyEcbmQnFma/NYkGViXuq01GpX2Y6jNJ6K1AdB85IjSreMZDJNFXWQdo8mgEwD6PoE
         noRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=P7ujnR5WBB/zd4DMv++Nx2p/OPze1z0cv9TpDb7nMdg=;
        b=PYr85VsOLdkjljMcNHjwF/535HFNfgr0rCVxZJlPMVIPHTlWP3+3O1FPmjeRP70hnu
         YRXRBKaLTvqnzsQNRkbmjZUzxqYsC/bxvzK8ID1lnrWh18bzHdb3v70+DbODwbGSRs3r
         sbd7jj+NiwXIcURkywfd6b6X4F9BXP9zk371EfI5ML9ih+UQq95zkzZgFOf5xETtubhM
         s0A/I44wTJCLjtY6e+7k1bRh3qQbDZHe75b+UF+3rWmsNi0yiqqKyQqyBYbn4758sZLr
         pyiTRiyR76rHTw0+Bt+LONdo/kO307O02DE8QGuoI2I4ESeWJzSz/7acWJFjL01sdl08
         d06Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QabUA7Ih;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w1-v6si7195534qtn.312.2018.06.07.09.31.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Jun 2018 09:31:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QabUA7Ih;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59127 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQxoy-00064d-01
	for alex.bennee@linaro.org; Thu, 07 Jun 2018 12:31:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50790)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQxoj-00063l-WF
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 12:31:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQxoh-0000mr-Bj
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 12:31:17 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:38725)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQxoh-0000mh-76; Thu, 07 Jun 2018 12:31:15 -0400
Received: by mail-qt0-x243.google.com with SMTP id x34-v6so10468930qtk.5;
	Thu, 07 Jun 2018 09:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=P7ujnR5WBB/zd4DMv++Nx2p/OPze1z0cv9TpDb7nMdg=;
	b=QabUA7Ih7EDJEmQvS/QWtBrvkGMLyGQN1vJ7xm/1DKR8+J8x5lWG0bQLLJ722KQ+WH
	znx48ijsC2qllCjP8iH1w5mPnMeatqPY1gtJra4UARraBvFzQNcB1MZ2N9IzT3mKfTmt
	hsOYpSpaxNfH4dIKWS0LTXbLmltLxGdEjJv0gfgs88LT5/uxqfZg9BhKGTxx5W473IB6
	4dRsgK8Ani2An9y4JN8CFjOsAiutbOliBt6dpg1vcqoJbUNybyK3tuxmF+H7K71V7egi
	dnJ0786nIPGtlpo0CdzaFXqmC8KnXNNGaL4kVFg05zGIyZGvu3FBm4cqyEPzZQzHXLaY
	Cn/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=P7ujnR5WBB/zd4DMv++Nx2p/OPze1z0cv9TpDb7nMdg=;
	b=kqGDMWvrROVL30k/2/n67R0lhNiPbgMQeEk+vmLVOIrd71SwxQCYbPx0nJj0m0VG/Z
	TxFGK3LYGzgLF9eXSsoMNvEZswEiXjzAPXar12NtFAzVXuBcry04ZNIrszGaLfQSivSe
	3xikg9vFJXpL/wkRxMzvfe1EDoBDC+TX42O9jl1J3Dr9DSKF2N/syI+u6/fAF7rLgHwJ
	Pd6rVXIJIgvXvNPDfCDlL5SYmttuY/5HHmReo1shF7V3O4F5j0I4l4htzNpQZg1tYh/K
	B1sTwa9ppIgP5DKSLJcA+3cp6JTv6TfLXCJPh4DtRYWOaRB2i05HnsrW45K8rvV6Mh82
	F3ZA==
X-Gm-Message-State: APt69E33BlyHdX83js2N3jc6rHaxKLpXo9CEEKpKTnCcqB9c78VI2pYK
	fUNu2lrH6CJMDiclVyD93/4=
X-Received: by 2002:a0c:9690:: with SMTP id
	a16-v6mr2322513qvd.212.1528389074489; 
	Thu, 07 Jun 2018 09:31:14 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	w25-v6sm26826336qtc.21.2018.06.07.09.31.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Jun 2018 09:31:13 -0700 (PDT)
To: Alistair Francis <alistair23@gmail.com>
References: <20180603000827.30872-1-f4bug@amsat.org>
	<20180603000827.30872-6-f4bug@amsat.org>
	<CAKmqyKPRbvPF8gSwpZ3e4xzbpvb0sii=HF7Av==F-chDqBojzA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <f00d6c18-ae7b-75fb-d1c0-c71abf93c330@amsat.org>
Date: Thu, 7 Jun 2018 13:31:04 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKPRbvPF8gSwpZ3e4xzbpvb0sii=HF7Av==F-chDqBojzA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 5/8] hw/sd/ssi-sd: Force cards
 connected in SPI mode to use Spec v1.10
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2CqvyD3Dxrwz

On 06/04/2018 03:26 PM, Alistair Francis wrote:
> On Sat, Jun 2, 2018 at 5:08 PM, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> Can you add a justification for this in the commit message?

Oops, I misplaced the justification in the following patch
(6/8: Disable SEND_IF_COND (CMD8) for Spec v1)

> 
> Alistair
> 
>> ---
>>  hw/sd/ssi-sd.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
>> index ae04b6641b..c62fdc871c 100644
>> --- a/hw/sd/ssi-sd.c
>> +++ b/hw/sd/ssi-sd.c
>> @@ -253,6 +253,8 @@ static void ssi_sd_realize(SSISlave *d, Error **errp)
>>      /* FIXME use a qdev drive property instead of drive_get_next() */
>>      dinfo = drive_get_next(IF_SD);
>>      carddev = qdev_create(&s->sdbus.qbus, TYPE_SD_CARD);
>> +    object_property_set_uint(OBJECT(carddev),
>> +                             SD_PHY_SPECv1_10_VERS, "spec_version", &err);
>>      if (dinfo) {
>>          qdev_prop_set_drive(carddev, "drive", blk_by_legacy_dinfo(dinfo), &err);
>>      }
>> --
>> 2.17.1
>>
>>
> 
