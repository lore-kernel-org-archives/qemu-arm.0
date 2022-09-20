Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp1980761ejy;
        Tue, 20 Sep 2022 12:01:22 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Dt28p6QjbJ8aG5nJae7ICmkYKZ9AU8oYgJCH+iw14XkXLfGnIg62LTXPbnIT1sFJ3RGVJ
X-Received: by 2002:a05:622a:15cc:b0:35c:f4ce:bdc8 with SMTP id d12-20020a05622a15cc00b0035cf4cebdc8mr6545497qty.383.1663700481809;
        Tue, 20 Sep 2022 12:01:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663700481; cv=none;
        d=google.com; s=arc-20160816;
        b=LR0dRBV+sqBoRKdgLv8K1YJr5netW6Kauiu+liWTz5Ab1h6Stn25sWSTIytzl0T9Zi
         16cGDVtLNDQAMcmneLsotvNmcUQY01AOqYfxt0JOwIwWfbt89xSCkWohldGR6Bzzu/eY
         zV9jVz/SP4z2WpsV8S9s/CfxzigskHoHRa96B8YeLWWjFXo7eWJ7keGwgnvA6XHRDI/y
         ijMyJhq5brnIkM8n6v40PGTQZpWE1a6vitXNeAx9lrszK81I3MWycwMH/63KVEu1azWS
         bXGJBJ+S0FYTanKfwEJgrenl1Z9pUNX3zY9c3Clsn1qSCSFFTDIfEBddb9c8tAfvvbdJ
         vQgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=yc11HwSM7YgO+gEFfU6wqmQndk/XclUvErpmHtS057w=;
        b=aGTh1snslESw+6vHGpCJgqm7J+MqQaxnNwNdu0iNsnPvGUvYXVPvPRV+uxmvxQgXtT
         dCp9fgLCvRs8jRvgMOfvwOKAEaP3lp1LOTVWt11hukGEEMYnqptYtCsz5P5lWwBiE1zh
         WuNCE+nJtCsAnuxNJ7qa8mIlFFFXQWyP7KYiJR5bjZ9Yfix0b8NdG46YbxKYYmjEbcBL
         uyfA7sCvnqkE61utogEegqKjYzNj2zwpQI9VmWqV3GWE6CEoAdJg7SnKLyW/dmSV2Hj2
         yv8bph9US546e2Ppb+h2hYyqbaS6TxAbOrGrmr/rCJhd7zIQn7n9jpTrFzXTk5PmQE/7
         pq7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bytedance-com.20210112.gappssmtp.com header.s=20210112 header.b="mbq/Ow4o";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bytedance.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x30-20020a05620a0b5e00b006bbbef7d484si339171qkg.626.2022.09.20.12.01.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Sep 2022 12:01:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bytedance-com.20210112.gappssmtp.com header.s=20210112 header.b="mbq/Ow4o";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bytedance.com
Received: from localhost ([::1]:41950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oaiUj-0006I0-8q
	for alex.bennee@linaro.org; Tue, 20 Sep 2022 15:01:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangjian.3032@bytedance.com>)
 id 1oaf0A-0005Iu-MR
 for qemu-arm@nongnu.org; Tue, 20 Sep 2022 11:17:35 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:35332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhangjian.3032@bytedance.com>)
 id 1oaf04-0006ah-Bw
 for qemu-arm@nongnu.org; Tue, 20 Sep 2022 11:17:30 -0400
Received: by mail-lf1-x132.google.com with SMTP id z25so4377649lfr.2
 for <qemu-arm@nongnu.org>; Tue, 20 Sep 2022 08:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=yc11HwSM7YgO+gEFfU6wqmQndk/XclUvErpmHtS057w=;
 b=mbq/Ow4oe5dAZTOCkOAr/TvhGVuVkbGD6vMEx2KCWnU0XmjE8+bHRftfTFmmJC+USE
 amBovffcSnpLBKWXlhVBtLS1lSmqMQl0cM7J2G3afo8sW4jV3KMzf27LtPxvyp/3375U
 egxUS7fyRgesjFLqCLE2ZqJIXJ/jNM5Y1vgkI3znn2XbuBpHWs9ypHrjpEeS0TdGOp6e
 OOy2HIh2d+sr40FMSSb8i1hiJdP3in8ZHbxdQ4kXTTG3bD/+d9gD7p3zGxB+b3m2dFNY
 WdD2hkjhRSn/nJUVEzLuPfSctxq25Sdp9K7SWtslHM7cPdBRJn/KdgjS1F1ZUKoGExSX
 l36Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=yc11HwSM7YgO+gEFfU6wqmQndk/XclUvErpmHtS057w=;
 b=J97nFF1Q97d07dehwXTl6DpTPmfekTGfn/FxuFvjTF4atkq1NLaGeDO0OucVrgOH6x
 XAIyS871VOWNx48aNL56vSvC8Nbx+IUCGiBTFykEkIe2PCoglu5A5c4ZAq/wL3ITcBI+
 IvPBdsat2L4xvWBwFIu+2W9h8D1VZjX+TJutxoS98LtOJQgEAdJV0pDoXyHisC3td0lv
 bbb9UsQKebBudjkq9Ry4yzn2jmg+7YcXsHXiou3OnDWmZyeZUJdOsO784gu0IV6SOar5
 EY4ctYHeKjk0FQT4EC2czAylRH+0Zd9tz2GY330oewpQGroUIxekdArgLV8T8qx6FfL8
 Dc8w==
X-Gm-Message-State: ACrzQf21O1YIp/qCY6b26LDz5+pW9p0SGebAkNXSNz4D7L8NQSYFNnnf
 t+hzgw3DUSHfQDF4fTCNsjgP1fNy2fKaXVQOukAKzw==
X-Received: by 2002:a19:5505:0:b0:497:ad71:39f4 with SMTP id
 n5-20020a195505000000b00497ad7139f4mr8267818lfe.226.1663687045982; Tue, 20
 Sep 2022 08:17:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220919172112.2706026-1-zhangjian.3032@bytedance.com>
 <8aa93a4f-beef-a0a6-8bac-3b69ba25de7e@amsat.org>
In-Reply-To: <8aa93a4f-beef-a0a6-8bac-3b69ba25de7e@amsat.org>
From: Zhang Jian <zhangjian.3032@bytedance.com>
Date: Tue, 20 Sep 2022 23:17:14 +0800
Message-ID: <CA+J-oUt96e0kNwDsee8YgmRkKSzPb==aD=VHU0My9a=CV-8RuQ@mail.gmail.com>
Subject: Re: [Phishing Risk] [External] Re: [PATCH 0/3] Add a host power device
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: peter.maydell@linaro.org, clg@kaod.org, andrew@aj.id.au, joel@jms.id.au, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, yulei.sh@bytedance.com, 
 tangyiwei.2022@bytedance.com, chentingting.2150@bytedance.com, 
 yuhao.17@bytedance.com, wangxiaohua.1217@bytedance.com, 
 xiening.xll@bytedance.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=zhangjian.3032@bytedance.com; helo=mail-lf1-x132.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
X-TUID: 1f2+L2JAzpVZ

Hi Philippe,

Thanks for your reply.

On Tue, Sep 20, 2022 at 7:09 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Hi Jian,
>
> On 19/9/22 19:21, Jian Zhang wrote:
> > This patchset adds a host power device and added it into the g220a
> > mahcine. The BMC have a important is to control the power of the host,
> > usually it is nessary in a hardware platform.
> >
> > The BMC(soc) usually had a output pin to control the power of the host,
> > and a input pin to get the power status of the host.
> >
> > The host power device is a generic device to simulate the host power,
> > accept the power control command from the BMC and report the power
> > status.
> >
> > Test on the g220a machine, the host power control command can be simply
> > work.
> >
> > Jian Zhang (3):
> >    hw/gpio/aspeed_gpio: Add gpios in/out init
> >    hw/misc/host_power: Add a simple host power device
> >    hw/arm/aspeed: g220a: Add host-power device
>
> "power-good" is just a TYPE_LED object, but it doesn't seem you are
> really interested in using it.
>
yeah, i'd like to just send an irq when the `switch` status changed.

> My understanding of your "power-button" is a latching switch.
>
yeah, this really like a latching switch.

> This could be indeed useful. I'd name this model TYPE_LATCHING_SWITCH
> and put it in hw/misc/latching-switch.c (since it is external to a
> SoC). It has one input and one output. Naming them is not particularly
> useful IMHO.
ok, it's make sense, using input and output directly.
> The triggering edge should be a property (it might have
> a default, positive/negative), and the switch state must to be in
> vmstate for the object to be migratable.
Ok, i got it.
>
> ("power-good"/"power-button" is what this particular board choose to
> use the latch switch input/output for).
>
> Do you mind renaming your series accordingly ("latching switch"),
> and adding the vmstate?
>
Ok, the name latching switch makes more sense and is more generic.

> Also I'd reorder your series as 2,1,3:
> - introduce the new device
> - prepare aspeed_gpio
> - wire aspeed_g220a
>
okay~
> Regards,
>
> Phil.

Thanks for your reply.

Thanks, Jian.
