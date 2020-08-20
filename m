Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1034988lfy;
        Wed, 19 Aug 2020 21:45:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxosrIeHu+L6etcrw02CL7rjEGBy5wtK/+fx0VMqPeBVMmyWqpkHBBY8sRQzd+02lbq4KX0
X-Received: by 2002:a25:d347:: with SMTP id e68mr2548153ybf.123.1597898731878;
        Wed, 19 Aug 2020 21:45:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597898731; cv=none;
        d=google.com; s=arc-20160816;
        b=iIqXTiYt5+2xox3XiltXRnbOulOOQblI+85ZTgU0TEVsyfOjtmLi8KBwAkJD2Xv0xr
         HvHqUYf0VCnFtbMd4zffEUemSrVsCNjVE64SDBvWV7HlzGf2dKLB3JHMxn4utDZ8+Pvd
         nWo7CIcFdxJL+Yxr/p0dQjFRpDE19dtaFJvs7eKgD7+oDHSQx967vkCVKMSVy8sEcVLn
         gi4tt8zRafnHFWedZ9B80e/bJjZGtC4mwXqFOnYDLaEdOpCJOGMuROlv4eVlBBzd+EUb
         deksfHB5cEdOG0u4YjWtj20eDHUHaQkbSvfK9yjYzeXFFVLyAizbMYL5XbIACVn75OW3
         MYRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature:dkim-signature;
        bh=x/7QWkat+dHcEwhV5TCv/1SSXzigP5mWp2DI/g4ACyg=;
        b=zbg8qIfWhGuLYGcG0UOkyni6lHyodesEJA9SH69D3KQR2BjjMaC44h+U57dBwLzkiP
         JKdHxGxxQWIRNA6G7uIxWusOY/fbpYjGypVp+/zfHAekyp2in0+HGNovXYykZdXYfIrs
         b2aIVOVBz0DgevavwDFNMFHoioshpTvUa4hPIrIK6xZeBVjV///DOdXLqP+2Q6l+tzF6
         dLRxvE/16HqZb0oU+cbtZy9bMhKJzeN4kAmUVinV8PO7LvBcpKFMXUjOpNkbC/vFiDpk
         dPNd+jfSudopMnQmYrhNPNhmQbwzs/7wuhJtUHfDufApQFY5nFY1ElNHuPz0hcpHMgwo
         M7Tw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@nyu.edu header.s=20180315 header.b=1XZsAB1x;
       dkim=pass header.i=@nyu-edu.20150623.gappssmtp.com header.s=20150623 header.b=m5tVuY04;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nyu.edu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a3si1054043ybk.33.2020.08.19.21.45.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Aug 2020 21:45:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@nyu.edu header.s=20180315 header.b=1XZsAB1x;
       dkim=pass header.i=@nyu-edu.20150623.gappssmtp.com header.s=20150623 header.b=m5tVuY04;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nyu.edu
Received: from localhost ([::1]:58416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k8cSB-0007qb-9d
	for alex.bennee@linaro.org; Thu, 20 Aug 2020 00:45:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yf1334@nyu.edu>) id 1k8Ziz-00023p-4q
 for qemu-arm@nongnu.org; Wed, 19 Aug 2020 21:50:41 -0400
Received: from mx0a-00256a01.pphosted.com ([148.163.150.240]:43750
 helo=mx0b-00256a01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yf1334@nyu.edu>) id 1k8Zix-0004jG-IL
 for qemu-arm@nongnu.org; Wed, 19 Aug 2020 21:50:40 -0400
Received: from pps.filterd (m0094546.ppops.net [127.0.0.1])
 by mx0b-00256a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07K1n2NS159755
 for <qemu-arm@nongnu.org>; Wed, 19 Aug 2020 21:50:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nyu.edu;
 h=mime-version : from :
 date : message-id : subject : to : content-type; s=20180315;
 bh=x/7QWkat+dHcEwhV5TCv/1SSXzigP5mWp2DI/g4ACyg=;
 b=1XZsAB1xfUbbCiZtWuNqGlQYqVuwFgiXOUsH4kM4wWkZeR7kle/H02jopOzFwGZvhYks
 XUjuRg7/IPBb11mvkl85q/p/9fZfDdiptdy1mNydzr9Qpxshjsdv+/5ppdVtZb7cybgC
 HD9GNlF2OcbZf4tY2bFsWM/CUhg5yYgfr3PoSicXQI5sOC5huLUbQvyHBSER+z7M9jrJ
 uOwlEeU9PHcjqE0qr0wwoyW9tlxJFQbdoDzm0hzY5xnEbW/Bc0vCUv2iu9Q44e8XaCOh
 zwN9clF5tNPFRWVQNnzIc2SYq37lJ/F6G0sUJedLmDONC7Aa0334i8czuizvNO7Xv87s BA== 
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72])
 by mx0b-00256a01.pphosted.com with ESMTP id 3304kfk01r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 19 Aug 2020 21:50:37 -0400
Received: by mail-oo1-f72.google.com with SMTP id a5so338918ooj.6
 for <qemu-arm@nongnu.org>; Wed, 19 Aug 2020 18:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nyu-edu.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=x/7QWkat+dHcEwhV5TCv/1SSXzigP5mWp2DI/g4ACyg=;
 b=m5tVuY04qvLYGxdkyTDyUt4A1KVl6TzufNrZFjzbvHU1Ml+2YsSDIWMoPiSt8wifOs
 J7t6KhpR9S8xhaHJyLpt/glESMoPekovQ+l6/qYt8l00kt4YaQnAEKh0/cSred/l2aVJ
 xOv10gA86ol7TbjtaLyoFCdiEdRWLnvlWYTggdioDxUKZg0AVJ+XJkpC7QeBrzBfiz63
 2Ns8lKzzoN0zjpVgCK2/cBfwCU14l3YgXfJU/WRsJbfU31hPY2Rbt65iBe4UM8ks7LtR
 g0FNQrcAmWVf6/tjIeUR4HxwlMsgRvRwfsubzaG4ziCBj+u/oO0kdfNxTChDfSockgov
 spZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=x/7QWkat+dHcEwhV5TCv/1SSXzigP5mWp2DI/g4ACyg=;
 b=QdU9CbBCILbUFw2Ccoe7Rc+NPAXXlADZX1RBp2jl1rsk1jGj8EavHhQwM8Vz0DxoM9
 W12u4eIR5845FPTnINLA9RO6vlnic/gMBEooRnFOq1pESDBc6G9FxoInXaP5wkWhEu7o
 mjqmp/MEiwYaIeAHn/A2PBRpg+CZftP5WpdiOHGzL26wLnvemOxPGSVN6FdZhshLZRFW
 aImbZ5eJQauVbXZYNk9nuSYJFDkn0ngbotpaVcaS8Mm8c0qklwQptUyf08fXbcdyiRE8
 fxLVax+K5b68BLkrtvCzqBP/nDpg/G/Ys47ACv5Dy3jD2zBry3QlvzwNZlGmiiHbeoqa
 mDqA==
X-Gm-Message-State: AOAM53079kPPtt7GO44AIax/dr+785xZyMNg5qdCDf1CumuMUoiazYr3
 7Z5CZFJuoD0ry7SN7z1YFXu/2n8Ag/+3FCV76wu8qYZLCQlOnEBJM8HN5ahzGC5yKDRn7K+DI4k
 Px2ORi5Fr+RkqVBSnueg5qc25bhU=
X-Received: by 2002:a05:6830:4a6:: with SMTP id
 l6mr528065otd.229.1597888236607; 
 Wed, 19 Aug 2020 18:50:36 -0700 (PDT)
X-Received: by 2002:a05:6830:4a6:: with SMTP id
 l6mr528062otd.229.1597888236405; 
 Wed, 19 Aug 2020 18:50:36 -0700 (PDT)
MIME-Version: 1.0
From: Yutong Feng <yf1334@nyu.edu>
Date: Thu, 20 Aug 2020 09:50:25 +0800
Message-ID: <CABtOTBCqHdJFg6+1k+mec1Cb9RM3YFqQzMfKLKXP==H=_zNSjw@mail.gmail.com>
Subject: About QEMU FOR LS1046
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000b8d62e05ad4558f7"
X-Orig-IP: 209.85.161.72
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=3 mlxscore=0
 mlxlogscore=232 clxscore=1031 priorityscore=1501 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008200012
Received-SPF: softfail client-ip=148.163.150.240; envelope-from=yf1334@nyu.edu;
 helo=mx0b-00256a01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 21:49:21
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 20 Aug 2020 00:45:19 -0400
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zvphecwSBKPp

--000000000000b8d62e05ad4558f7
Content-Type: text/plain; charset="UTF-8"

Hello,I'm a college student from NYC and my project needs to use NXP LS1046
or ls1043 for research.
To avoid risks, our group decided to test on QEMU before we make purchase
for boards.
I found on google that Yocto can help me to build an image which can be
simulated on QEMU.
So is that possible? And how to operate?

Best regards,
Chris

--000000000000b8d62e05ad4558f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><span style=3D"color:rgb(0,0,0);font-fami=
ly:-webkit-standard;font-size:medium">Hello,I&#39;m a college student from =
NYC and my project needs to use NXP LS1046 or ls1043 for research.</span><d=
iv style=3D"color:rgb(0,0,0)">To avoid risks, our group decided to test on =
QEMU before we make purchase for boards.</div><div style=3D"color:rgb(0,0,0=
)">I found on google that Yocto can help me to build an image which can be =
simulated on QEMU.</div><div style=3D"color:rgb(0,0,0)">So is that possible=
? And how to operate?</div><div style=3D"color:rgb(0,0,0)"><br></div><div s=
tyle=3D"color:rgb(0,0,0)">Best regards,</div><div style=3D"color:rgb(0,0,0)=
">Chris</div></div></div>

--000000000000b8d62e05ad4558f7--
