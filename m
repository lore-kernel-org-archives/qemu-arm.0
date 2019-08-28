Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp567177wrs;
        Wed, 28 Aug 2019 03:51:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxV6m1JTreVuT7L4HfUfrcB5lQPtdZTV9dxH0L6eJGUXFYab4ySvkgsmvv6Xych0doX01Z+
X-Received: by 2002:ac8:425a:: with SMTP id r26mr3383237qtm.309.1566989505852;
        Wed, 28 Aug 2019 03:51:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566989505; cv=none;
        d=google.com; s=arc-20160816;
        b=I3m01pUgW4iXNI8r44+GBOvY+DbdpvH+iJuhoGsN6wdwccxiZ1LMK2O/YWbvhOBq1v
         94ZAu61sUFImH/CTtWI5Wc0RUtWjbdDXNKSCTd2wCzX5mSZKk98efmJD312VgpGgX3ex
         /rxTkqp/uknxhuyPftJkbJgoirWQsQSrQ05oc9k4BZL1jiPqavQ3THB9FDbSzE5roXv4
         4XPkvERpVPuz6AByk7MQj9Dw+PC3mKMoAiWgvgfZwi5LQMizwWAzQIQjf2nbaLfgRGiA
         2aDHS0QKLh91r3wOzw0mcgpDFPrFXDKsZo553M13N6fBPtZIP6Cy59HakovqYF4f7Ocb
         by1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=WPL+qnA37thQmimqqq0DhjiToyo7xb6ZVGQAhzEbED0=;
        b=J5hCkhZA9Eh7NILuBnpdRQpQK7gJUosS/mZJ4pLlYsFuPtF5puALbwTYArWOQVzADH
         7NpZi+OM4YLzr8hFnNMOztWNU5dsJhIBgBgW+gFD9m3UPc4BnbwZ55X6zGtPLCTkA9FZ
         0VD6eYNSLtG0i39k5m8iItTXJqj8LD1ikfYNU2qYMuCaynGUPNCIzpGXnnGe0lfIkzQ0
         /+RIW9mND9aytGSYF2XkzVSwquewa9WOqnBlF6dXFet80y0i9ZMGuUv/pynYn1mA7G54
         i83HclskYb/pvf99yW9OkxkA0sttjuCP7SLvDLvLEKvZt2gV5EwmcmvXA90kIA5lzelq
         eIvA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w14si1461094qvc.110.2019.08.28.03.51.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Aug 2019 03:51:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i2vYG-0007rg-6y
	for alex.bennee@linaro.org; Wed, 28 Aug 2019 06:51:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58607)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gengdongjiu@huawei.com>) id 1i2vXy-0007rV-0C
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 06:51:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <gengdongjiu@huawei.com>) id 1i2vXw-0005z3-Vu
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 06:51:25 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:44906 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
 id 1i2vXw-0005V3-Kt; Wed, 28 Aug 2019 06:51:24 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id DA7BB340A07922D05D6B;
 Wed, 28 Aug 2019 18:51:14 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Wed, 28 Aug 2019
 18:51:09 +0800
To: Peter Maydell <peter.maydell@linaro.org>
References: <1566898915-3129-1-git-send-email-gengdongjiu@huawei.com>
 <CAFEAcA-QunKkEW1BUXrEZVt+QP_Wc=dd0JJpnE+ypkPrca9TXw@mail.gmail.com>
From: gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <d42acb0d-5acf-f289-a55f-6257d1231fdf@huawei.com>
Date: Wed, 28 Aug 2019 18:50:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-QunKkEW1BUXrEZVt+QP_Wc=dd0JJpnE+ypkPrca9TXw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.32
Subject: Re: [Qemu-arm] [PATCH] hw/arm/boot: Load the Non Linux initrd to
 the memory
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Linuxarm <linuxarm@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ah8hrGgrsae9



On 2019/8/27 17:47, Peter Maydell wrote:
> On Tue, 27 Aug 2019 at 10:42, Dongjiu Geng <gengdongjiu@huawei.com> wro=
te:
>>
>> Except support linux operation system, qemu also supports other
>> operation system which is non linux, such as microkernel system.
>>
>> But now Qemu only load linux initrd, so change it to load both
>> linux and Non-linux initrd Image.
>=20
> We currently support two methods of booting:
>  (1) using the boot protocol defined by the Linux kernel
>      (which includes how to find the DTB, initrd, what the
>      secondary CPUs do, and so on)
>  (2) you're a 'bare-metal' image, in which case you get
>      complete control of all the CPUs at once in the same
>      way the hardware does. Raw hardware doesn't provide
>      initrd files, and nor does QEMU.
>=20
> This patch seems to be trying to introduce a third hybrid
> thing. Is there a specification for whatever this boot
> protocol is? How many guest OSes use it? Are they common?
>=20
> If you want an initrd, you can always wrap your guest OS in
> a shim which complies with the Linux kernel boot protocol.
> I think that would be a better approach than this patch.

OK=EF=BC=8C thanks for the suggestion, I will use your suggested method.

>=20
> thanks
> -- PMM
> .
>=20

