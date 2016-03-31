Received: by 10.25.208.211 with SMTP id h202csp2937413lfg;
        Wed, 30 Mar 2016 18:50:21 -0700 (PDT)
X-Received: by 10.140.239.66 with SMTP id k63mr14532456qhc.11.1459389021394;
        Wed, 30 Mar 2016 18:50:21 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d51si6054763qga.77.2016.03.30.18.50.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 Mar 2016 18:50:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57603 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1alRkb-0007nk-1G
	for alex.bennee@linaro.org; Wed, 30 Mar 2016 21:50:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43533)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1alRkZ-0007na-I3
	for qemu-arm@nongnu.org; Wed, 30 Mar 2016 21:50:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1alRkW-00070S-BT
	for qemu-arm@nongnu.org; Wed, 30 Mar 2016 21:50:19 -0400
Received: from m12-17.163.com ([220.181.12.17]:44950)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1alRkU-000707-Oi; Wed, 30 Mar 2016 21:50:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=eBv9k
	jhZ1J4lkWz0XklWbVIgDNb4xVfc6f9VkrIWyBs=; b=mxMfLjse2n5FEYq3jFXQS
	m5cEe7Jr73bB+8qTnZZ4RM+bpy99JQYr6MH2VAEVOI7jttEkSsAH5yf+gG/cj9/9
	OhzaNkQ8djCbJcTTUJ+dm1EVbHRLT7ytNFaeHTV38GMjjEEr3feUpSPXDZL9VIuU
	w4Ll/uDeF7ohpQJEihnGKQ=
Received: from [192.168.31.184] (unknown [118.187.28.42])
	by smtp13 (Coremail) with SMTP id EcCowAC3vgIvgvxWSfTIAg--.9870S2;
	Thu, 31 Mar 2016 09:49:36 +0800 (CST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1457334350-5675-1-git-send-email-zxq_yx_007@163.com>
	<CAFEAcA98BiQipq4PL=_9fBeOa01ESzyp7U4ghN0gZuxAyAqwoA@mail.gmail.com>
	<CAFEAcA-P25AkJLBLst04J=BxTVvbfuQQAiE8nVS=w7oMXdtX8A@mail.gmail.com>
From: xiaoqiang zhao <zxq_yx_007@163.com>
Message-ID: <56FC81E0.1000203@163.com>
Date: Thu, 31 Mar 2016 09:48:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-P25AkJLBLst04J=BxTVvbfuQQAiE8nVS=w7oMXdtX8A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EcCowAC3vgIvgvxWSfTIAg--.9870S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU6YFADUUUU
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiFg89xlWBP+IKvwAAse
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.17
Cc: Rob Herring <robh@kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
	Andrew Zaborowski <balrogg@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH 0/9] some QOM'ify work under hw/arm
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vokKWImPhlUB


在 2016年03月16日 20:00, Peter Maydell 写道:
> On 16 March 2016 at 11:31, Peter Maydell <peter.maydell@linaro.org> wrote:
>> A general note -- since these aren't bug fixes and we're in soft
>> freeze now, I don't think we should put them in until 2.6 is out.
>> I'll review the patches in a second, though.
> Well, the patches all look good -- ping me after 2.6 is out to
> apply them to target-arm.next then.
>
> Where I've noted possible further cleanups, that's intended as
> an "if you like writing cleanup patches" thing -- you don't need
> to try to do them as part of this patch series.
>
> thanks
> -- PMM
ping !

