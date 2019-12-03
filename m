Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp1623490lfc;
        Tue, 3 Dec 2019 07:02:31 -0800 (PST)
X-Google-Smtp-Source: APXvYqwQ1FT7/vDYXGDtCSaCaPM3n8xa0VzKJ87cLXVdMyaKkWiUEWuXhTvNipRij7JsXk9afFpI
X-Received: by 2002:a17:906:69d7:: with SMTP id g23mr6551137ejs.20.1575385351614;
        Tue, 03 Dec 2019 07:02:31 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s3si2602601edy.199.2019.12.03.07.02.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2019 07:02:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="XxXuOF/N";
       arc=fail (signature failed);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ic9h3-00088d-6q
	for alex.bennee@linaro.org; Tue, 03 Dec 2019 10:02:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40716)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <damien.hedde@greensocs.com>) id 1ic9ee-000822-I7
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 09:59:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1ic9eX-0002G3-W6
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 09:59:51 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:41166)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1ic9eV-0001ld-EQ; Tue, 03 Dec 2019 09:59:48 -0500
Received: from [172.16.11.102] (crumble.bar.greensocs.com [172.16.11.102])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 50ED396EF0;
 Tue,  3 Dec 2019 14:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1575385179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tidNTzqhuJlf4WZkJ82WQRFfpo9g/npgDroo0yBSuJw=;
 b=XxXuOF/NU+Scg1M65uaSkqLtMoi+Ib7t4WFW9yj79G1R52BvKeeD1C+WlsXhT0+Q39EwEz
 Bm+NzLz/3DOLZczhtoLlBq3Dezg6FGSFKpHxLdaiOTErdc4w+YI3Cnb41DBHIDp+0iPXiU
 Ur+MBnfX2gWm6ZxxujmcuVxXCQZL7tU=
Subject: Re: [PATCH v6 9/9] hw/arm/xilinx_zynq: connect uart clocks to slcr
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190904125531.27545-1-damien.hedde@greensocs.com>
 <20190904125531.27545-10-damien.hedde@greensocs.com>
 <CAFEAcA96yu6Uttsi6eZokjyxE8At18ADF+Q6c7Na2ArvdLME+Q@mail.gmail.com>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <f373af20-0df4-384f-b1a3-10bf873c315e@greensocs.com>
Date: Tue, 3 Dec 2019 15:59:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA96yu6Uttsi6eZokjyxE8At18ADF+Q6c7Na2ArvdLME+Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1575385180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tidNTzqhuJlf4WZkJ82WQRFfpo9g/npgDroo0yBSuJw=;
 b=XhJ2pFL27cJQ5kp/MAGV3fXwOROkxugqBglKMQNyS3/WDafmCCzXBcnt/rX68TpAGBXO6R
 Iy2j20qwfW04d/OXd35EAHEkLG9/KGJBL7EmgMGw/wxRU+9EsWEn+vJsdX3/DGDjAgmT9y
 uVxnJ8VygfmiMUbwQUcpxyhSoOuSZHo=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1575385180; a=rsa-sha256; cv=none;
 b=F0f1SvObNKyMvucWXfP+8kSnxjVaUqdaH3BRtZR+s44mJxCQKcWD2CeiTJ8yE7jfQuoMNb
 RUVW4COGCe69/hZjkZl+2HMmJj9sBd5DCPVrh6nh2cX3V8FkURi9Td5B67GLe1qGAC4uVq
 NXqShNHPBXntZ8vbFeWFttBBrlLcBTA=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=damien smtp.mailfrom=damien.hedde@greensocs.com
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 5.135.226.135
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Mark Burton <mark.burton@greensocs.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: szNU7gwml87F



On 12/2/19 4:34 PM, Peter Maydell wrote:
> On Wed, 4 Sep 2019 at 13:56, Damien Hedde <damien.hedde@greensocs.com> wrote:
>>
>> Add the connection between the slcr's output clocks and the uarts inputs.
>>
>> Also add the main board clock 'ps_clk', which is hard-coded to 33.33MHz
>> (the default frequency). This clock is used to feed the slcr's input
>> clock.
>>
>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> 
> Nothing obviously wrong in the body of the patch, but as with
> 7 and 8, review from a Xilinx person would be helpful.
> 
> /* board base frequency: 33.333333 MHz */
> #define PS_CLK_FREQUENCY (100 * 1000 * 1000 / 3)
> 
> This is interesting, because it's not an integer... I'll come back
> to this topic in a reply to the cover letter in a moment.

For this precise case, what I wanted is the resulting integer which I
got from the device trees in linux (btw I should probably add this point
in  comment). Just thought it was more readable this way than "33333333".

--
Damien
