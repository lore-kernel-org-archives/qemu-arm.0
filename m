Received: by 2002:a17:906:6d0c:b0:9b2:89ee:1eb8 with SMTP id m12csp382718ejr;
        Tue, 10 Oct 2023 12:56:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8KJo4wX4fQZMWhzEsm5DOIGLag73yLTdG+oTLNOQB9jnQSmOdWHarf19oqDgw9+WS1g9u
X-Received: by 2002:a05:6102:6684:b0:457:5eb4:6966 with SMTP id gw4-20020a056102668400b004575eb46966mr10473349vsb.17.1696967817895;
        Tue, 10 Oct 2023 12:56:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696967817; cv=none;
        d=google.com; s=arc-20160816;
        b=07MKWIZzwm7FrO6+8b0GErq2iF2z4pIfek1NijuQamQxBcE+m+Xeu9cbL1Bi4yKzaj
         dd6/QPYUCfE7VZSO++2vFGUPYaX6jo7EGGU9misdbL0kdInFS/rMxByvax/+qMCCUt85
         6ixAhPp3wDAzt7noAwRLx+Z8grBojqiSLTwxWRao2mGJ9y99+SnZ6XMAwZ08+BNjjD5R
         kGUzBh7S+150SsZ7L+NVQIpvteTFFsJQMdEd8gAz+mDZ3LxWBAh0RWbo/U3ruMzKBscp
         NPV8TKvbctDS0htZ1PTgw27MT+fN5aQdFMkbS/dd+hZHF1kYxySVhQ1VwWTaMXgTYznZ
         /9Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:date:cc:to:from:subject
         :message-id:dkim-signature;
        bh=dfc5fjMRSfWyq2laKc//XFxGXr8RTLoVQIOco8l0+To=;
        fh=WLpaGbQF5y9kpF8If8kddU0pXKVo2YhyROEza53zWes=;
        b=Rk9fo6Qq+IzIECHQm/PAfWIk/jggIXDJb2r2GJJj1nRjP+hFn0h9wsVOHhPRMSatpS
         aAx60yTncM+SvbDumkU3W7aCjbVJKymd7AmW0w7SkGvBOlQvWi0sIb/UXoxQ3Q5DEGAo
         wcdirsyyz5oBOhozVHxd1rPOrb+GnhRjjj7wRJmE056cP1a00sqN6gysUaJHz+BHcF1v
         RQNHrezWjiakmm7t50EIWC7MulzliH+euvvbjVsOlMb2wvpBeD5ZamF3R6znlEnfS/WS
         XsstwQoQd6F0oGEjAXplNemOb8PKGaKBshqZE0LiQjtVxPp1JPOHNRHAfsZ7SbwUPJkH
         vL6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=pDF+puvP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v3-20020a05622a014300b004197f4977e9si8334591qtw.640.2023.10.10.12.56.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Oct 2023 12:56:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=pDF+puvP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qqIqP-0007VH-5M; Tue, 10 Oct 2023 15:56:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <milesg@linux.vnet.ibm.com>)
 id 1qqIqM-0007UL-VP; Tue, 10 Oct 2023 15:56:38 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <milesg@linux.vnet.ibm.com>)
 id 1qqIqL-0005KE-76; Tue, 10 Oct 2023 15:56:38 -0400
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39AJqshN013355; Tue, 10 Oct 2023 19:56:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=dfc5fjMRSfWyq2laKc//XFxGXr8RTLoVQIOco8l0+To=;
 b=pDF+puvPDSwY/r+9F32iMpXIs4pYSPQNylvQ1cBB+A4t8IB5g4+wi+hgeevSUPNtnN5c
 3sSgcwwll2K/tojsBq7Ef4Pmb3EPwX73/hUCkyDAQ223/b/2ZpXeWmibllseP3yH0V+5
 6FBPboELxi/4uw2jOZhb/SYu5lnR8yG/ghBWtZ78OaHc1+03peAAnanJkYzpSt3z+mEL
 Dl0Ca5jtK1RcQj9KMA0vj9zT1A2kc6RTtXdnhGIJQU49dHaHRfsHpqAhWFNg7L+hcaOB
 ff+v5Dy6ohe9O3v7VNdNCnfNjhBTFtFoTgrs524Knvvh6zJm9ZEHfMPAs3XnAz67fNY3 +Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tnd5d04kj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Oct 2023 19:56:19 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39AJsCNY019046;
 Tue, 10 Oct 2023 19:56:18 GMT
Received: from ppma11.dal12v.mail.ibm.com
 (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tnd5d04jg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Oct 2023 19:56:18 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
 by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 39AIJEvD023032; Tue, 10 Oct 2023 19:56:17 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
 by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tkmc1j66c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Oct 2023 19:56:17 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com
 [10.241.53.101])
 by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 39AJuGUg21037744
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Oct 2023 19:56:16 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 40C0858060;
 Tue, 10 Oct 2023 19:56:16 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0CF715805A;
 Tue, 10 Oct 2023 19:56:16 +0000 (GMT)
Received: from mamboa4.aus.stglabs.ibm.com (unknown [9.3.84.87])
 by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 10 Oct 2023 19:56:15 +0000 (GMT)
Message-ID: <1edb46238b58360d4e045cfff4d7c0b9c681a997.camel@linux.vnet.ibm.com>
Subject: Re: [PATCH v2] misc/pca9552: Fix for pca9552 not getting reset
From: Miles Glenn <milesg@linux.vnet.ibm.com>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clegoate@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 andrew@codeconstruct.com.au, Joel Stanley <joel@jms.id.au>
Date: Tue, 10 Oct 2023 14:56:15 -0500
In-Reply-To: <a448bd71-f0e1-0390-8d11-922698946015@redhat.com>
References: <20231005211046.3609577-1-milesg@linux.vnet.ibm.com>
 <a448bd71-f0e1-0390-8d11-922698946015@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: TobQDlLaFfFfotX4mi9XKGBZqNh4Ljmq
X-Proofpoint-ORIG-GUID: 54x7kzynpUFS8Phh0h84raFit7xCyQ_P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-10_16,2023-10-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 mlxlogscore=999 mlxscore=0 spamscore=0 adultscore=0
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2309180000 definitions=main-2310100154
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
X-TUID: ytT1d6tPRk5N

On Mon, 2023-10-09 at 23:06 +0200, Cédric Le Goater wrote:
> Hello Glenn,
> 
> On 10/5/23 23:10, Glenn Miles wrote:
> > Testing of the pca9552 device on the powernv platform
> > showed that the reset method was not being called when
> > an instance of the device was realized.  This was causing
> > the INPUT0/INPUT1 POR values to be incorrect.
> > 
> > Fixed by overriding the parent pca955x_realize method with a
> > new pca9552_realize method which first calls
> > the parent pca955x_realize method followed by the
> > pca9552_reset function.
> > 
> > Signed-off-by: Glenn Miles <milesg@linux.vnet.ibm.com>
> > ---
> >   hw/misc/pca9552.c | 8 +++++++-
> >   1 file changed, 7 insertions(+), 1 deletion(-)
> > 
> > diff --git a/hw/misc/pca9552.c b/hw/misc/pca9552.c
> > index fff19e369a..bc12dced7f 100644
> > --- a/hw/misc/pca9552.c
> > +++ b/hw/misc/pca9552.c
> > @@ -384,6 +384,12 @@ static void pca955x_realize(DeviceState *dev,
> > Error **errp)
> >       qdev_init_gpio_out(dev, s->gpio, k->pin_count);
> >   }
> >   
> > +static void pca9552_realize(DeviceState *dev, Error **errp)
> > +{
> > +    pca955x_realize(dev, errp);
> > +    pca9552_reset(dev);
> > +}
> 
> This looks wrong. You need both handlers, a realize and a reset.
> 
> Thanks,
> 
> C.
> 

Ok, sent version 3.

Thanks,

Glenn

> 
> > +
> >   static Property pca955x_properties[] = {
> >       DEFINE_PROP_STRING("description", PCA955xState, description),
> >       DEFINE_PROP_END_OF_LIST(),
> > @@ -416,7 +422,7 @@ static void pca9552_class_init(ObjectClass *oc,
> > void *data)
> >       DeviceClass *dc = DEVICE_CLASS(oc);
> >       PCA955xClass *pc = PCA955X_CLASS(oc);
> >   
> > -    dc->reset = pca9552_reset;
> > +    dc->realize = pca9552_realize;
> >       dc->vmsd = &pca9552_vmstate;
> >       pc->max_reg = PCA9552_LS3;
> >       pc->pin_count = 16;

