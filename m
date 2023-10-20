Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1404758ejb;
        Fri, 20 Oct 2023 10:47:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQDe11127NlQLdVoa/TV2rb0ejfpTqy5s/KoNfdeXw/bCgQkLTOlc18PfT0EDquEBg+WzY
X-Received: by 2002:a05:622a:293:b0:41c:d0b5:c60d with SMTP id z19-20020a05622a029300b0041cd0b5c60dmr2346513qtw.19.1697824029494;
        Fri, 20 Oct 2023 10:47:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697824029; cv=none;
        d=google.com; s=arc-20160816;
        b=uGkET7uesTj3hUe0f4iVb2pU1STIQyfzEwuwpIny3ZjF4e26fae0XMGFO2NVcB+iKi
         /WLy0RZ3WhR2lPB0qZaeEIdUa1ZZVKEEyvSxav1zn2ytDk54AivGTZF66c/VK415q1Q7
         r+4M6cxUovcRr3VjSpVR2V7qTn/IDdAXgiWkiqODZh0DDpGCsPCCl4PjdXcN3RP8Q29k
         3hfxNqJyVhUt1OwNjj29uZf/0vTIXiVO5gP62HLBeo/OQGbKyzyAZrlG0/rcD/imDajP
         YzyivPGxpBmrUxpytWPd2eS3wbQGe3S4wNV8gFjzb7R2Au1CyCrHeRI6Oknb3uzDPncR
         +tlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:date:cc:to:from:subject
         :message-id:dkim-signature;
        bh=tOcei5cKqx+jAenkdcI3tbTfcY+Gva/0jOHTtP5rsBg=;
        fh=vkH5OJd42JFvUzIB7rtlX2sqyhdWJmYVuN5RUcpK6GU=;
        b=uL5WwQzrjl64sHGTrO4LMvqSF++qi6lJRVMxmuWKHtUuVNq07AbSRD7RLgp2Afkfxe
         +5u5b3Rfl0+tmP0Uhc3Hh5wa+PMbelD1SqCk09Rsvnl5K1yvlEsM46Jj67Oy9AezCOiN
         jHoQmhOq89QVTon9W/h8IGe0ruVf78c4gVdTW2BWNOPhXtVUJ8m/Dg2dfK9O7+DEEcTz
         STzmSd+6O+Vijrbt3iW1FDTAfhSQJUBS3tqvipG9h2S4gqJFkXaKpPNTrAPzpT3eQQj1
         xhXDSBtWWTM2mJdvVCGvLHohXjGAxUob2gb6VO9692FC7rcumIqhLtc3njC8RkwpOgu0
         vx4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=jjCSfRxU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a18-20020a05622a02d200b0041cc7a308f5si1702692qtx.536.2023.10.20.10.47.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Oct 2023 10:47:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=jjCSfRxU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qttaA-0004Gg-PD; Fri, 20 Oct 2023 13:46:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <milesg@linux.vnet.ibm.com>)
 id 1qtta4-00049D-2K; Fri, 20 Oct 2023 13:46:40 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <milesg@linux.vnet.ibm.com>)
 id 1qtta1-00049m-E4; Fri, 20 Oct 2023 13:46:39 -0400
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39KHeRt4022256; Fri, 20 Oct 2023 17:46:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=tOcei5cKqx+jAenkdcI3tbTfcY+Gva/0jOHTtP5rsBg=;
 b=jjCSfRxUmH+Jnrce/PQJyrlHCqTeBskwCN5VWq+4QWv5lOT6WpBpBM04wR8R6tcmffdN
 WeRCy8r3yTDE/RBnfKx/1UG9j2kam6li8GsfiNR6z/bm1mqN+YcXgt8oYVSLwz4VO3g6
 rPu3F+TVDUvqM5HeldpE/GWQw9trP0SYikAPtTKYIsequjpPa+1YudRM/U7drf/HhyPS
 VN0pw6h8kMqB7xmRvEB+gLIFJdPkg6D9uq7836xFC8aO4muYMN+HC79F4OOeZH/Y27mS
 X5BJeT/ZjxADyMbtZlC388D3+bBmVLRcAoelREf310jruRWSOapNsb7mi7p4ZEASoPIX Aw== 
Received: from ppma23.wdc07v.mail.ibm.com
 (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tux5dg9cg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Oct 2023 17:46:17 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 39KHWW1T032062; Fri, 20 Oct 2023 17:46:04 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
 by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tuc35p6wn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Oct 2023 17:46:04 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com
 [10.39.53.232])
 by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 39KHk39A3474022
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Oct 2023 17:46:03 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0816658061;
 Fri, 20 Oct 2023 17:46:03 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9E6F958053;
 Fri, 20 Oct 2023 17:46:02 +0000 (GMT)
Received: from mamboa4.aus.stglabs.ibm.com (unknown [9.3.84.87])
 by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 20 Oct 2023 17:46:02 +0000 (GMT)
Message-ID: <ab414faad0e6b5004110fa9c23da6771393c31e8.camel@linux.vnet.ibm.com>
Subject: Re: [PATCH 2/2] misc/pca9552: Let external devices set pca9552 inputs
From: Miles Glenn <milesg@linux.vnet.ibm.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Date: Fri, 20 Oct 2023 12:46:02 -0500
In-Reply-To: <5145c79ae63a5798663cc1ecae205d77865ae30a.camel@codeconstruct.com.au>
References: <20231019204011.3174115-1-milesg@linux.vnet.ibm.com>
 <20231019204011.3174115-3-milesg@linux.vnet.ibm.com>
 <5145c79ae63a5798663cc1ecae205d77865ae30a.camel@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: vHrdt2ARC0KVa-Hen-0IBKUbmmgTACDB
X-Proofpoint-ORIG-GUID: vHrdt2ARC0KVa-Hen-0IBKUbmmgTACDB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-20_10,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 impostorscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310170001 definitions=main-2310200149
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=milesg@linux.vnet.ibm.com; helo=mx0b-001b2d01.pphosted.com
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
X-TUID: ZnipGLX8FXAr

On Fri, 2023-10-20 at 15:18 +1030, Andrew Jeffery wrote:
> On Thu, 2023-10-19 at 15:40 -0500, Glenn Miles wrote:
> > Allow external devices to drive pca9552 input pins by adding
> > input GPIO's to the model.  This allows a device to connect
> > its output GPIO's to the pca9552 input GPIO's.
> > 
> > In order for an external device to set the state of a pca9552
> > pin, the pin must first be configured for high impedance (LED
> > is off).  If the pca9552 pin is configured to drive the pin low
> > (LED is on), then external input will be ignored.
> > 
> > Here is a table describing the logical state of a pca9552 pin
> > given the state being driven by the pca9552 and an external device:
> > 
> >                    PCA9552
> >                    Configured
> >                    State
> > 
> >                   | Hi-Z | Low |
> >             ------+------+-----+
> >   External   Hi-Z |  Hi  | Low |
> >   Device    ------+------+-----+
> >   State      Low  |  Low | Low |
> >             ------+------+-----+
> > 
> > Signed-off-by: Glenn Miles <milesg@linux.vnet.ibm.com>
> > ---
> > 
> > Changes from previous version:
> >  - Added #define's for external state values
> >  - Added logic state table to commit message
> >  - Added cover letter
> > 
> >  hw/misc/pca9552.c         | 41 ++++++++++++++++++++++++++++++++++-
> > ----
> >  include/hw/misc/pca9552.h |  3 ++-
> >  2 files changed, 38 insertions(+), 6 deletions(-)
> > 
> > diff --git a/hw/misc/pca9552.c b/hw/misc/pca9552.c
> > index 445f56a9e8..ed814d1f98 100644
> > --- a/hw/misc/pca9552.c
> > +++ b/hw/misc/pca9552.c
> > @@ -44,6 +44,8 @@ DECLARE_CLASS_CHECKERS(PCA955xClass, PCA955X,
> >  #define PCA9552_LED_OFF  0x1
> >  #define PCA9552_LED_PWM0 0x2
> >  #define PCA9552_LED_PWM1 0x3
> > +#define PCA9552_PIN_LOW  0x0
> > +#define PCA9552_PIN_HIZ  0x1
> >  
> >  static const char *led_state[] = {"on", "off", "pwm0", "pwm1"};
> >  
> > @@ -116,16 +118,22 @@ static void
> > pca955x_update_pin_input(PCA955xState *s)
> >          switch (config) {
> >          case PCA9552_LED_ON:
> >              /* Pin is set to 0V to turn on LED */
> > -            qemu_set_irq(s->gpio[i], 0);
> > +            qemu_set_irq(s->gpio_out[i], 0);
> 
> pca955x_update_pin_input() is called by the external GPIO handling
> path
> as well as the I2C command handling path. If the I2C path sets the
> line
> low followed by the device attached to the GPIO setting the line low
> then I think each change will issue an event on the outbound GPIO. Is
> that desired behaviour? Does it matter?
> 

I think these questions probably depend a lot on the recieving device,
but at best, I think it's inefficient and at worst, depending on the
recieving device, it could lead to bugs, so I'll add a check.

 
> >              s->regs[input_reg] &= ~(1 << input_shift);
> >              break;
> >          case PCA9552_LED_OFF:
> >              /*
> >               * Pin is set to Hi-Z to turn off LED and
> > -             * pullup sets it to a logical 1.
> > +             * pullup sets it to a logical 1 unless
> > +             * external device drives it low.
> >               */
> > -            qemu_set_irq(s->gpio[i], 1);
> > -            s->regs[input_reg] |= 1 << input_shift;
> > +            if (s->ext_state[i] == PCA9552_PIN_LOW) {
> > +                qemu_set_irq(s->gpio_out[i], 0);
> 
> Similarly here - it might be the case that both devices have pulled
> the
> line low and now the I2C path is releasing it. Given the external
> device had already pulled the line low as well should we expect an
> event to occur issued here? Should it matter?
> 
> Andrew
> 

See previous response.

Thanks for the review!

Glenn

> > +                s->regs[input_reg] &= ~(1 << input_shift);
> > +            } else {
> > +                qemu_set_irq(s->gpio_out[i], 1);
> > +                s->regs[input_reg] |= 1 << input_shift;
> > +            }
> >              break;
> >          case PCA9552_LED_PWM0:
> >          case PCA9552_LED_PWM1:
> > @@ -340,6 +348,7 @@ static const VMStateDescription pca9552_vmstate
> > = {
> >          VMSTATE_UINT8(len, PCA955xState),
> >          VMSTATE_UINT8(pointer, PCA955xState),
> >          VMSTATE_UINT8_ARRAY(regs, PCA955xState, PCA955X_NR_REGS),
> > +        VMSTATE_UINT8_ARRAY(ext_state, PCA955xState,
> > PCA955X_PIN_COUNT_MAX),
> >          VMSTATE_I2C_SLAVE(i2c, PCA955xState),
> >          VMSTATE_END_OF_LIST()
> >      }
> > @@ -358,6 +367,7 @@ static void pca9552_reset(DeviceState *dev)
> >      s->regs[PCA9552_LS2] = 0x55;
> >      s->regs[PCA9552_LS3] = 0x55;
> >  
> > +    memset(s->ext_state, PCA9552_PIN_HIZ, PCA955X_PIN_COUNT_MAX);
> >      pca955x_update_pin_input(s);
> >  
> >      s->pointer = 0xFF;
> > @@ -380,6 +390,26 @@ static void pca955x_initfn(Object *obj)
> >      }
> >  }
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
> >  static void pca955x_realize(DeviceState *dev, Error **errp)
> >  {
> >      PCA955xClass *k = PCA955X_GET_CLASS(dev);
> > @@ -389,7 +419,8 @@ static void pca955x_realize(DeviceState *dev,
> > Error **errp)
> >          s->description = g_strdup("pca-unspecified");
> >      }
> >  
> > -    qdev_init_gpio_out(dev, s->gpio, k->pin_count);
> > +    qdev_init_gpio_out(dev, s->gpio_out, k->pin_count);
> > +    qdev_init_gpio_in(dev, pca955x_gpio_in_handler, k->pin_count);
> >  }
> >  
> >  static Property pca955x_properties[] = {
> > diff --git a/include/hw/misc/pca9552.h b/include/hw/misc/pca9552.h
> > index b6f4e264fe..c36525f0c3 100644
> > --- a/include/hw/misc/pca9552.h
> > +++ b/include/hw/misc/pca9552.h
> > @@ -30,7 +30,8 @@ struct PCA955xState {
> >      uint8_t pointer;
> >  
> >      uint8_t regs[PCA955X_NR_REGS];
> > -    qemu_irq gpio[PCA955X_PIN_COUNT_MAX];
> > +    qemu_irq gpio_out[PCA955X_PIN_COUNT_MAX];
> > +    uint8_t ext_state[PCA955X_PIN_COUNT_MAX];
> >      char *description; /* For debugging purpose only */
> >  };
> >  

