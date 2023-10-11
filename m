Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp315165ejc;
        Wed, 11 Oct 2023 12:27:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcAa/i0SNwYXkUM8bpv1yJnGkiP5deOsDDPsXDuIe6FmDUeYst419c7YUtC/+s/Lxn71/1
X-Received: by 2002:a05:620a:678:b0:76f:20df:f032 with SMTP id a24-20020a05620a067800b0076f20dff032mr18394743qkh.69.1697052455893;
        Wed, 11 Oct 2023 12:27:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697052455; cv=none;
        d=google.com; s=arc-20160816;
        b=W7nf9huIQPtM4eYxGfB5Vy9mQlhA9u6cGeOhPRFdrK5M3nSfTPugYz7SWhMqnur7/C
         fw2fmlYLHyYsBGASG8kMqe2ujxFPVlTfoviq5oPkWWFM3reqC3zd8b+I6kx2/b8jV57+
         IempJA9wI9Fwq+6zy7SIVeG8TPO5s4U1qjtTil+aLtqkyfLQfq/O6XYzSHsBtu9LWG1Z
         oLWSovravlAK+gtkV7aE4mhimRIsq4c+rJzuH/LFi2NOflgHV9ccFDjSQHx33Lm+NGgo
         eX7799/UZUyUxDkmUUJ3wOvtq02TMu28zD5PhXw0PWpkEzzs+TMLhf5TZ/YdOciPTsX2
         Ux+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:date:cc:to:from:subject
         :message-id:dkim-signature;
        bh=PfLUvlPDcYIq6Rr+JjHohX5nkEXtbBWzSCVhsLZKc+M=;
        fh=f5gCeCRWvSChPAhML+3hUT9Uq6Q8hPW6Ls4A1ml+3No=;
        b=gQzF6D2vioKBHiT4qYlCxZcDtOc3N90equLYiR3VJAKBi03mx7FxA03abvO4G/3Kzn
         BEAe7AV5tUKl+GbzUfsA54OGrKcGz2LwU9WuePhOY8vY6MgmS5V2eDy0lL/LICLcVNTS
         8IYdd1GuBmBdqJ9Cy4EFpksCdwcJkL2NYgCRl2S3L7fJoRlXsd8nVxqxxN5Wrk9766pl
         GOUtL/yD3oaRLQrFgudqVHN06s0hwhHgGQ/g2sZdb4j+iKzWYfe761iVItBSRzUda8YJ
         uC39Ot3u0XXId+ysV7p4hvq8XkpQ1Nb5req20+G4OthURrs8x9T8Pl+m9DCO++B4XKMV
         BVFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=JmpSd5oj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bi10-20020a05620a318a00b0077252673dddsi10179983qkb.516.2023.10.11.12.27.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Oct 2023 12:27:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=JmpSd5oj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qqerP-0005is-90; Wed, 11 Oct 2023 15:27:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <milesg@linux.vnet.ibm.com>)
 id 1qqerN-0005iM-L5; Wed, 11 Oct 2023 15:27:09 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <milesg@linux.vnet.ibm.com>)
 id 1qqerL-0004m9-RO; Wed, 11 Oct 2023 15:27:09 -0400
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39BJOo55009311; Wed, 11 Oct 2023 19:26:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=PfLUvlPDcYIq6Rr+JjHohX5nkEXtbBWzSCVhsLZKc+M=;
 b=JmpSd5ojBEO5sI05zPA2KwVeawF3DSXQWSrDjCg7+JLNnPDzLnN5LQvtlFpzhPOtkdoC
 vsiPkozbKShJ5LC4gQyzWXu0GbtCf0Auq9+XjdfGzT2p1q4q8uVwaF9hljJMAfUaSIZT
 Bq2GKooHiMo3EcMOc/pgv2dslB7OtX/lpt5gpTFJPdkNBBqyzDhvTzzQoBdp4B6pFuGn
 zxkzaW1PRgJW5UgnSZtFFI7LedWLduIjX4G3Cb+55713a9WLpunuQxVI6S5/cCcoosKH
 aypJq/SxGjD/7eZzGNtgMmnyyoqtQ6DE2rc3Ee3Ex77PrVNMZ0jlwE/47htWxMQ5E8kp DQ== 
Received: from ppma21.wdc07v.mail.ibm.com
 (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tp1ue82pa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Oct 2023 19:26:57 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 39BIvCov026364; Wed, 11 Oct 2023 19:26:56 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
 by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tkjnnje6n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Oct 2023 19:26:56 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com
 [10.241.53.103])
 by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 39BJQtwB19268350
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Oct 2023 19:26:55 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8E54E5805A;
 Wed, 11 Oct 2023 19:26:55 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 496BB58052;
 Wed, 11 Oct 2023 19:26:55 +0000 (GMT)
Received: from mamboa4.aus.stglabs.ibm.com (unknown [9.3.84.87])
 by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 11 Oct 2023 19:26:55 +0000 (GMT)
Message-ID: <e5badba4796c70f6097f443ef9dda71315a913a1.camel@linux.vnet.ibm.com>
Subject: Re: [PATCH] misc/pca9552: Fix inverted input status
From: Miles Glenn <milesg@linux.vnet.ibm.com>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, andrew@codeconstruct.com.au, Joel Stanley
 <joel@jms.id.au>
Date: Wed, 11 Oct 2023 14:26:55 -0500
In-Reply-To: <e5d37f40-fcf1-5843-ea66-d50fa2353424@kaod.org>
References: <20230927203221.3286895-1-milesg@linux.vnet.ibm.com>
 <e5d37f40-fcf1-5843-ea66-d50fa2353424@kaod.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: BxrFIIEJ2kVVqg1OGrUs5TvTbn7Ttcuc
X-Proofpoint-GUID: BxrFIIEJ2kVVqg1OGrUs5TvTbn7Ttcuc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-11_14,2023-10-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 impostorscore=0 mlxscore=0 phishscore=0 bulkscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310110171
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
X-TUID: Qko9l0HjH/Oe

On Wed, 2023-10-11 at 16:27 +0200, Cédric Le Goater wrote:
> On 9/27/23 22:32, Glenn Miles wrote:
> > The pca9552 INPUT0 and INPUT1 registers are supposed to
> > hold the logical values of the LED pins.  A logical 0
> > should be seen in the INPUT0/1 registers for a pin when
> > its corresponding LSn bits are set to 0, which is also
> > the state needed for turning on an LED in a typical
> > usage scenario.  Existing code was doing the opposite
> > and setting INPUT0/1 bit to a 1 when the LSn bit was
> > set to 0, so this commit fixes that.
> > 
> > Signed-off-by: Glenn Miles <milesg@linux.vnet.ibm.com>
> 
> Looks OK to me.
> 
> May be you could mention that the ON/OFF values are reversed on
> the pca953x family. This is good to know if one wants to model
> these devices one day.
> 

Yep, I will do that.

Thanks,

Glenn

> Reviewed-by: C޸dric Le Goater <clg@kaod.org>
> 
> Thanks,
> 
> C.
> 
> 
> > ---
> >   hw/misc/pca9552.c          | 13 +++++++++----
> >   tests/qtest/pca9552-test.c |  6 +++---
> >   2 files changed, 12 insertions(+), 7 deletions(-)
> > 
> > diff --git a/hw/misc/pca9552.c b/hw/misc/pca9552.c
> > index fff19e369a..ad811fb249 100644
> > --- a/hw/misc/pca9552.c
> > +++ b/hw/misc/pca9552.c
> > @@ -112,13 +112,18 @@ static void
> > pca955x_update_pin_input(PCA955xState *s)
> >   
> >           switch (config) {
> >           case PCA9552_LED_ON:
> > -            qemu_set_irq(s->gpio[i], 1);
> > -            s->regs[input_reg] |= 1 << input_shift;
> > -            break;
> > -        case PCA9552_LED_OFF:
> > +            /* Pin is set to 0V to turn on LED */
> >               qemu_set_irq(s->gpio[i], 0);
> >               s->regs[input_reg] &= ~(1 << input_shift);
> >               break;
> > +        case PCA9552_LED_OFF:
> > +            /*
> > +             * Pin is set to Hi-Z to turn off LED and
> > +             * pullup sets it to a logical 1.
> > +             */
> > +            qemu_set_irq(s->gpio[i], 1);
> > +            s->regs[input_reg] |= 1 << input_shift;
> > +            break;
> >           case PCA9552_LED_PWM0:
> >           case PCA9552_LED_PWM1:
> >               /* TODO */
> > diff --git a/tests/qtest/pca9552-test.c b/tests/qtest/pca9552-
> > test.c
> > index d80ed93cd3..ccca2b3d91 100644
> > --- a/tests/qtest/pca9552-test.c
> > +++ b/tests/qtest/pca9552-test.c
> > @@ -60,7 +60,7 @@ static void send_and_receive(void *obj, void
> > *data, QGuestAllocator *alloc)
> >       g_assert_cmphex(value, ==, 0x55);
> >   
> >       value = i2c_get8(i2cdev, PCA9552_INPUT0);
> > -    g_assert_cmphex(value, ==, 0x0);
> > +    g_assert_cmphex(value, ==, 0xFF);
> >   
> >       pca9552_init(i2cdev);
> >   
> > @@ -68,13 +68,13 @@ static void send_and_receive(void *obj, void
> > *data, QGuestAllocator *alloc)
> >       g_assert_cmphex(value, ==, 0x54);
> >   
> >       value = i2c_get8(i2cdev, PCA9552_INPUT0);
> > -    g_assert_cmphex(value, ==, 0x01);
> > +    g_assert_cmphex(value, ==, 0xFE);
> >   
> >       value = i2c_get8(i2cdev, PCA9552_LS3);
> >       g_assert_cmphex(value, ==, 0x54);
> >   
> >       value = i2c_get8(i2cdev, PCA9552_INPUT1);
> > -    g_assert_cmphex(value, ==, 0x10);
> > +    g_assert_cmphex(value, ==, 0xEF);
> >   }
> >   
> >   static void pca9552_register_nodes(void)

