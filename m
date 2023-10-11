Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp312421ejc;
        Wed, 11 Oct 2023 12:22:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjb8mFLE979U3I/cnbJtm3Gvpj8U3KeDoANbuyoKMDZdAUiTEcEGP/4oXIWRD3Bt5jbXUE
X-Received: by 2002:a05:6808:1493:b0:3af:75e2:4c34 with SMTP id e19-20020a056808149300b003af75e24c34mr28838022oiw.50.1697052133154;
        Wed, 11 Oct 2023 12:22:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697052133; cv=none;
        d=google.com; s=arc-20160816;
        b=NR4C8WaKqbKS0SX/Mwek2bZv72I7BRhqi7U1kkClrH4IpRWr2rzd1boTh/NiVUNTSN
         l65N2YDQdp1wrh0Pv1BQ5mCDOwDYFg5jyjZ1tu4jlSeFHLUFrLV3+gQE+AMxF5W4/ftb
         gqSbt/aRwbzXiMv2fpXprNQnxZ15nX2lIeMM4L8CnfD7QfMzE0Qx0mm+G0N9D6PFYze+
         Jw+4KrpUfLc4RhjtGyd8LMhP5V/xaNNSXfItmwFc+mT3EnciHeXLMwjIOmDMc+Gw9GK2
         RPWVd8VHXYnm2M1TzciFlFf6bwwWYw6UTQOqUkSe9g2GSGiUeYHYh9PwYII1SrwQkZKB
         9Dbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:date:cc:to:from:subject
         :message-id:dkim-signature;
        bh=UOFvknK9E29Ls6rja1GRQwT69ONy4+nyg4LgCdAHO+A=;
        fh=f5gCeCRWvSChPAhML+3hUT9Uq6Q8hPW6Ls4A1ml+3No=;
        b=YhtvX6kKriC5p4ke3mArVAFSi49INFZQOuUN4XAKDWIDpxzqkA99CbxW2lVP9tYCWr
         SmZAoFrUMkK/dHfJ7BU0R5fKSYojZVAOD3BjBeDTHV0ysTrRdkvkUVAGjgzA+Gd4jMq+
         wnkLUDH5rnFCmiB/xTx6J7laCqJWkXCxOOfsAWvbzplrWZT6M0pTJqaoa4mVJKIEmb5T
         sOIAiQ60JzVJT37sBiYCciIssYl0vvgX4RZSnPrBnoggkFW/3uf2vEz+nxgM0wubokCc
         onAFtm/HCsrNPKs2d61P5bY5gJORZs1e2EJhuIX5idH2iYzV2Pc0ehFnhtfMAr4ue8rv
         aAOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b="OE9r/2OC";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e7-20020a0ce3c7000000b00668da56152csi9620062qvl.506.2023.10.11.12.22.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Oct 2023 12:22:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b="OE9r/2OC";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qqem2-0003it-PZ; Wed, 11 Oct 2023 15:21:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <milesg@linux.vnet.ibm.com>)
 id 1qqem0-0003i4-4M; Wed, 11 Oct 2023 15:21:36 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <milesg@linux.vnet.ibm.com>)
 id 1qqelu-0003Y6-Ti; Wed, 11 Oct 2023 15:21:35 -0400
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39BJCTQZ003295; Wed, 11 Oct 2023 19:21:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=UOFvknK9E29Ls6rja1GRQwT69ONy4+nyg4LgCdAHO+A=;
 b=OE9r/2OC/BcuEMxhEF6j2F6q2xl2heKo8E8o/NKr9viBMrGH61Z51l60Pnt6oJXgmDyW
 Dg4oO/TxeKXeaphWBY/3QAnsblnyS4UymldFSmPSzk9WigUurTep7dbzdE3X6BkY/TNC
 JGq3ugpzxW7hZWg9fF+dvPDf/g1puz9Eb3/R3ppQW7QEVG6SrGDASd3ckI5sC815a10l
 ukSSRnbg6VqTj8LICEB/Y8ofGHWaneAdLOwLS5qPKyPV6MKUG7GsgDcUnlHz+92r/36+
 KobGS0GAlQGbaZVQ2k7W5EbdBZjDoVYN87R4347pOLCMU2RvFsH09jKfUcoUJI8b35qc Eg== 
Received: from ppma12.dal12v.mail.ibm.com
 (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tp1nj09df-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Oct 2023 19:20:55 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
 by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 39BI5mO5024487; Wed, 11 Oct 2023 19:16:18 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
 by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tkhnstpeg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Oct 2023 19:16:18 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com
 [10.241.53.101])
 by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 39BJGHIu23659096
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Oct 2023 19:16:17 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 36BBE58060;
 Wed, 11 Oct 2023 19:16:17 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 07AAB5805C;
 Wed, 11 Oct 2023 19:16:17 +0000 (GMT)
Received: from mamboa4.aus.stglabs.ibm.com (unknown [9.3.84.87])
 by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 11 Oct 2023 19:16:16 +0000 (GMT)
Message-ID: <37b0967012f909184d6965bc80d617d59cd49dd5.camel@linux.vnet.ibm.com>
Subject: Re: [PATCH v2] misc/pca9552: Let external devices set pca9552 inputs
From: Miles Glenn <milesg@linux.vnet.ibm.com>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, andrew@codeconstruct.com.au, Joel Stanley
 <joel@jms.id.au>
Date: Wed, 11 Oct 2023 14:16:16 -0500
In-Reply-To: <08fe62cf-7301-6f44-4239-2dd76a2436cf@kaod.org>
References: <20231005204129.3522685-1-milesg@linux.vnet.ibm.com>
 <08fe62cf-7301-6f44-4239-2dd76a2436cf@kaod.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Jo_ES7IuX23KOcROAK-9eQ9y_ZhSBqQ1
X-Proofpoint-ORIG-GUID: Jo_ES7IuX23KOcROAK-9eQ9y_ZhSBqQ1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-11_14,2023-10-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310110171
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=milesg@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ZJF2DkJHKLon

On Wed, 2023-10-11 at 19:05 +0200, Cédric Le Goater wrote:
> On 10/5/23 22:41, Glenn Miles wrote:
> > Allow external devices to drive pca9552 input pins by adding
> > input GPIO's to the model.  This allows a device to connect
> > its output GPIO's to the pca9552 input GPIO's.
> > 
> > In order for an external device to set the state of a pca9552
> > pin, the pin must first be configured for high impedance (LED
> > is off).  If the pca9552 pin is configured to drive the pin low
> > (LED is on), then external input will be ignored.
> > 
> > Signed-off-by: Glenn Miles <milesg@linux.vnet.ibm.com>
> 
> Why an extra ext_state array ? The input handler should simply update
> the PCA9552_INPUT* registers if the PCA9552_LS* register is
> programmed
> in input mode ?
> 

The ext_state array is needed because the PCA9552_INPUT* values are
now determined by two inputs:  1) The ouput state of the pca9552
device (high impedance or low) and 2) The input from an external
device (also high impedance or low).  Either of these inputs could
change independently of each other, so we can't assume that just
because the pca9552 is driving the gpio low that any external
device is also driving the gpio low.  When the pca9552 switches
its output to high impedance, we must look at how the exernal device
is currently driving the gpio before we can know the new value of the
pin.

> It would be nice to add some test case also.

Yes, I agree.  I have a crude test case that I'm using for my own
testing, but I think it has dependencies on other code (not mine) that
has not been upstreamed yet.  I will look into this.

Thanks,

Glenn

> 
> Thanks,
> 
> C.
> 
> 
> 
> > ---
> > Based-on: <20230927203221.3286895-1-milesg@linux.vnet.ibm.com>
> > ([PATCH] misc/pca9552: Fix inverted input status)
> >   hw/misc/pca9552.c         | 39
> > ++++++++++++++++++++++++++++++++++-----
> >   include/hw/misc/pca9552.h |  3 ++-
> >   2 files changed, 36 insertions(+), 6 deletions(-)
> > 
> > diff --git a/hw/misc/pca9552.c b/hw/misc/pca9552.c
> > index ad811fb249..f28b5ecd7e 100644
> > --- a/hw/misc/pca9552.c
> > +++ b/hw/misc/pca9552.c
> > @@ -113,16 +113,22 @@ static void
> > pca955x_update_pin_input(PCA955xState *s)
> >           switch (config) {
> >           case PCA9552_LED_ON:
> >               /* Pin is set to 0V to turn on LED */
> > -            qemu_set_irq(s->gpio[i], 0);
> > +            qemu_set_irq(s->gpio_out[i], 0);
> >               s->regs[input_reg] &= ~(1 << input_shift);
> >               break;
> >           case PCA9552_LED_OFF:
> >               /*
> >                * Pin is set to Hi-Z to turn off LED and
> > -             * pullup sets it to a logical 1.
> > +             * pullup sets it to a logical 1 unless
> > +             * external device drives it low.
> >                */
> > -            qemu_set_irq(s->gpio[i], 1);
> > -            s->regs[input_reg] |= 1 << input_shift;
> > +            if (s->ext_state[i] == 0) {
> > +                qemu_set_irq(s->gpio_out[i], 0);
> > +                s->regs[input_reg] &= ~(1 << input_shift);
> > +            } else {
> > +                qemu_set_irq(s->gpio_out[i], 1);
> > +                s->regs[input_reg] |= 1 << input_shift;
> > +            }
> >               break;
> >           case PCA9552_LED_PWM0:
> >           case PCA9552_LED_PWM1:
> > @@ -337,6 +343,7 @@ static const VMStateDescription pca9552_vmstate
> > = {
> >           VMSTATE_UINT8(len, PCA955xState),
> >           VMSTATE_UINT8(pointer, PCA955xState),
> >           VMSTATE_UINT8_ARRAY(regs, PCA955xState, PCA955X_NR_REGS),
> > +        VMSTATE_UINT8_ARRAY(ext_state, PCA955xState,
> > PCA955X_PIN_COUNT_MAX),
> >           VMSTATE_I2C_SLAVE(i2c, PCA955xState),
> >           VMSTATE_END_OF_LIST()
> >       }
> > @@ -355,6 +362,7 @@ static void pca9552_reset(DeviceState *dev)
> >       s->regs[PCA9552_LS2] = 0x55;
> >       s->regs[PCA9552_LS3] = 0x55;
> >   
> > +    memset(s->ext_state, 1, PCA955X_PIN_COUNT_MAX);
> >       pca955x_update_pin_input(s);
> >   
> >       s->pointer = 0xFF;
> > @@ -377,6 +385,26 @@ static void pca955x_initfn(Object *obj)
> >       }
> >   }
> >   
> > +static void pca955x_set_ext_state(PCA955xState *s, int pin, int
> > level)
> > +{
> > +    if (s->ext_state[pin] != level) {
> > +        uint16_t pins_status = pca955x_pins_get_status(s);
> > +        s->ext_state[pin] = level;
> > +        pca955x_update_pin_input(s);
> > +        pca955x_display_pins_status(s, pins_status);
> > +    }
> > +}
> > +
> > +static void pca955x_gpio_in_handler(void *opaque, int pin, int
> > level)
> > +{
> > +
> > +    PCA955xState *s = PCA955X(opaque);
> > +    PCA955xClass *k = PCA955X_GET_CLASS(s);
> > +
> > +    assert((pin >= 0) && (pin < k->pin_count));
> > +    pca955x_set_ext_state(s, pin, level);
> > +}
> > +
> >   static void pca955x_realize(DeviceState *dev, Error **errp)
> >   {
> >       PCA955xClass *k = PCA955X_GET_CLASS(dev);
> > @@ -386,7 +414,8 @@ static void pca955x_realize(DeviceState *dev,
> > Error **errp)
> >           s->description = g_strdup("pca-unspecified");
> >       }
> >   
> > -    qdev_init_gpio_out(dev, s->gpio, k->pin_count);
> > +    qdev_init_gpio_out(dev, s->gpio_out, k->pin_count);
> > +    qdev_init_gpio_in(dev, pca955x_gpio_in_handler, k->pin_count);
> >   }
> >   
> >   static Property pca955x_properties[] = {
> > diff --git a/include/hw/misc/pca9552.h b/include/hw/misc/pca9552.h
> > index b6f4e264fe..c36525f0c3 100644
> > --- a/include/hw/misc/pca9552.h
> > +++ b/include/hw/misc/pca9552.h
> > @@ -30,7 +30,8 @@ struct PCA955xState {
> >       uint8_t pointer;
> >   
> >       uint8_t regs[PCA955X_NR_REGS];
> > -    qemu_irq gpio[PCA955X_PIN_COUNT_MAX];
> > +    qemu_irq gpio_out[PCA955X_PIN_COUNT_MAX];
> > +    uint8_t ext_state[PCA955X_PIN_COUNT_MAX];
> >       char *description; /* For debugging purpose only */
> >   };
> >   

