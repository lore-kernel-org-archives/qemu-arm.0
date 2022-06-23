Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2835430lft;
        Thu, 23 Jun 2022 03:27:16 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vb0xubnRnjgdXIu4OnlIssCzELJ1owQrDkhYTdeS651W+QrfX7VPQHB1s0Rw6ONuKpS5zG
X-Received: by 2002:ad4:5be6:0:b0:464:4f31:870 with SMTP id k6-20020ad45be6000000b004644f310870mr31180581qvc.109.1655980036279;
        Thu, 23 Jun 2022 03:27:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655980036; cv=none;
        d=google.com; s=arc-20160816;
        b=FLOcpl7wGPZJNMV6eeUC8ltU6M7TqagKfB5hPNgV/ZLGHQVULbEW9lw/E3oqJBllqQ
         FUBGIUKlAyWq1F0UXImczMV91H/DBdh/zPbVF12xZsQupTHzYAylaIvoFyeFggZtbzJp
         jehTcX+rP+krqcviij+k1F9oixE1wFwv6wB+yf2fvDlj3+1gVrOrO4MWpgA1kqedu3I1
         hY8uVzHvq0EuHqR7xf9u/5CRgAfKNBuK6JWDpExirxlPmj8n32dPaHF3upDhxN++Kgnu
         Ggjf2l7YeXt0uX+KT9agiH4+f/fTciwCjYvqukJk+JKPTbZqla9WdvjA+9xlV9b+Imot
         ocVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=1kUdEyYsiBtSxa3OFxYiRQYPCMEFo7s5I5wp24Gjr7Q=;
        b=dxrFh3HEc71ivlEwQ7wOjRtYmZs7BZVwQ9wxsYbRJx4LgTkF1D7VnzHwukiSy7ZZ6f
         agrH0ZfPBnsHu8VeK+r2Yk7ZDHiEhUYOqC0pfgw6ir9dwMcBiSvPRMI1EtfgrhQI0ekJ
         bzm+2wKAD0X95soKsN9imKx+Dyat/U9QV1PMnK9xelMuM0UFkHJFsQcp8HMd+RkkTPPC
         6Mk+dt28cYj9fgFoaqqnen+x5Yc+R87xGCjp5s3ZRql4utOGomJwIwKoWvCpWck355BW
         lzyHfmFzmUw3GsihTHuBGB6jGFvjBk3Ia+i4zV6ohLqqGzuj2YAm+WVF7jleKNLpWPS1
         N4Zg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcdkim header.b=XUOLvFrf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j14-20020a05621419ce00b00470679c86bdsi3098836qvc.382.2022.06.23.03.27.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jun 2022 03:27:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcdkim header.b=XUOLvFrf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from localhost ([::1]:40228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4K3P-0008VW-Nd
	for alex.bennee@linaro.org; Thu, 23 Jun 2022 06:27:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_ggregory@quicinc.com>)
 id 1o4K0m-0007cZ-8D; Thu, 23 Jun 2022 06:24:32 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:13493)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quic_ggregory@quicinc.com>)
 id 1o4K0j-00055Q-Sh; Thu, 23 Jun 2022 06:24:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655979869; x=1687515869;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=1kUdEyYsiBtSxa3OFxYiRQYPCMEFo7s5I5wp24Gjr7Q=;
 b=XUOLvFrfuBtIjRWYkt/X0fTEc2Ovr8PfraRwJj/Isy7uni9m10YlZ16/
 TWnsl43GnMviW8/QLzjJby/cdhFF2IfLVznVmCCwqFGzp51dSC8JhU3q3
 1pjHmAxnS2mppJydbfbhm4NhLC2LnROAx7A9q7+nHahZaygVzhNeIJ5W1 c=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 23 Jun 2022 03:24:25 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 03:24:25 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 23 Jun 2022 03:24:24 -0700
Received: from quicinc.com (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 23 Jun
 2022 03:24:23 -0700
Date: Thu, 23 Jun 2022 11:24:21 +0100
From: Graeme Gregory <quic_ggregory@quicinc.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
CC: Joel Stanley <joel@jms.id.au>, Jae Hyun Yoo <quic_jaehyoo@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Titus Rwantare <titusr@google.com>, 
 Andrew Jeffery <andrew@aj.id.au>, Maheswara Kurapati
 <quic_mkurapat@quicinc.com>, qemu-arm <qemu-arm@nongnu.org>, QEMU Developers
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH 0/9] Add Qualcomm BMC machines
Message-ID: <20220623102421.nj56xcmrpnoc5wbg@ggregory-linuxws>
References: <20220622172830.101210-1-quic_jaehyoo@quicinc.com>
 <CACPK8Xcfyu0BxEhVZDQ=mfw0OcPgSm6nVSzpmT5nviq7X+rFTA@mail.gmail.com>
 <2780eff7-17de-0496-7a5b-f3ede706794a@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2780eff7-17de-0496-7a5b-f3ede706794a@kaod.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Received-SPF: pass client-ip=199.106.114.39;
 envelope-from=quic_ggregory@quicinc.com; helo=alexa-out-sd-02.qualcomm.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 2evvTnBwE0av

On Thu, Jun 23, 2022 at 08:48:49AM +0200, Cédric Le Goater wrote:
> On 6/23/22 07:25, Joel Stanley wrote:
> > On Wed, 22 Jun 2022 at 17:29, Jae Hyun Yoo <quic_jaehyoo@quicinc.com> wrote:
> > > 
> > > Hello,
> > > 
> > > I'm sending a series to add Qualcomm BMC machines that are equipped with
> > > Aspeed AST2600 SoC. Also, this series adds MAX31785 fan controller device
> > > emulation. Please help to review.
> > 
> > Thanks for the MAX31785 model, that's handy to have.
> > 
> > I'm all for more emulation and testing using Qemu models, but I wonder
> > if you need to add all three of your boards. They seem to be a
> > progression (evb-proto -> dc-scm -> firework). Could you get away with
> > just one or two of those?
> 
> I am not sure the evb-proto-bmc is useful to upstream. The other two
> are fine.
> 
> Thanks,
> 

I am happy with dropping the evb-proto-bmc machine. We used that
internally before actual hardware was available.

Graeme

> C.
> 
> 
> 
> > 
> > 
> > > 
> > > Thanks,
> > > 
> > > Jae
> > > 
> > > Graeme Gregory (2):
> > >    hw/arm/aspeed: qcom-dc-scm-v1: add block backed FRU device
> > >    hw/arm/aspeed: add Qualcomm Firework machine and FRU device
> > > 
> > > Jae Hyun Yoo (3):
> > >    hw/arm/aspeed: add support for the Qualcomm EVB proto board
> > >    hw/arm/aspeed: add support for the Qualcomm DC-SCM v1 board
> > >    hw/arm/aspeed: firework: add I2C MUXes for VR channels
> > > 
> > > Maheswara Kurapati (4):
> > >    hw/i2c: pmbus: Page #255 is valid page for read requests.
> > >    hw/sensor: add Maxim MAX31785 device
> > >    hw/arm/aspeed: firework: Add MAX31785 Fan controllers
> > >    hw/arm/aspeed: firework: Add Thermal Diodes
> > > 
> > >   hw/arm/Kconfig        |   1 +
> > >   hw/arm/aspeed.c       | 158 +++++++++++-
> > >   hw/i2c/pmbus_device.c |   1 -
> > >   hw/sensor/Kconfig     |   4 +
> > >   hw/sensor/max31785.c  | 580 ++++++++++++++++++++++++++++++++++++++++++
> > >   hw/sensor/meson.build |   1 +
> > >   6 files changed, 742 insertions(+), 3 deletions(-)
> > >   create mode 100644 hw/sensor/max31785.c
> > > 
> > > --
> > > 2.25.1
> > > 
> 
