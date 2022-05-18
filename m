Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp235382lfh;
        Wed, 18 May 2022 00:32:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwi6WOSUIV6wicTlHtG6+xIp8sEiI+terFhOC8rJ8+lZcTVQIdbhLWO2PATEBvv25ejmwDu
X-Received: by 2002:ac8:5982:0:b0:2f3:b838:cdda with SMTP id e2-20020ac85982000000b002f3b838cddamr22830349qte.119.1652859143877;
        Wed, 18 May 2022 00:32:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652859143; cv=none;
        d=google.com; s=arc-20160816;
        b=LsmC/6xYPkWRWyM0rU5WnGQuBm0JNLdgfqHC1sWL+9KDCnxqyqbbxySama+gu9bNns
         s5PB3wkVNBFSLSESA/1bhilUjgRIPB2Tv0ODxpaNPYxzCxebPJajIg1M76kupMKTMHUA
         q5lSU1bPVuaOrVzSPDrBjiT45BYwHZ2jQ1CWNkzRFaKQbez35OgiuZh8SFsn+wLH1pEx
         tKK9UhT9Rn0aO+Qu7oM5/U7NPyEb7vknOhN1df94TMD6r6OpxayUtfkjlZCtyAvdyUpR
         j9VeB3dyzS4pg+oRnbRkyzFP3KD0oqsnLjlhIft6m6ELKamnSitVpDTA+2nlYahn5LSf
         0DeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:dkim-signature;
        bh=nG4yATrqnYqilm8hyRGpGI8AKiQ9P9la4p2SFy4Q9Go=;
        b=TiMWrb3/ctEG7DqjihH5ZSlNEHeOXgp+tN7DX5jo04Bk9qq1dDe4w5EAONQ0/gT9QV
         G8M9cl3FzcW5AED0OJeLc7utVAR5839R6gDZhgVrFZQ39r53hAFycY9bTiQM/ZUvvFnC
         Iv9m6As8wOfvBZ+ax3BQ5Fvh6cDcV9M4BO5+yvMjfrXit6miZDM9LEmkqThgUkct7lzb
         xrjuV3bt1pjG30lTy2exUZOPQNXLewERaoIvBuCMlhCU18GcJ5E/z0qkuc1QQh5O/gZt
         JfMbqtC2xx9THamnm8idEe4JPQEw3XU72RhfxwHWrROkUL1HNpqZguIZDp55CvsfJZdY
         mDlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=iSbI9j9F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m6-20020a05620a290600b0069fcdd98d13si859177qkp.705.2022.05.18.00.32.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 May 2022 00:32:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=iSbI9j9F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1]:60834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nrEAR-0003Ul-By
	for alex.bennee@linaro.org; Wed, 18 May 2022 03:32:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rashmica@linux.ibm.com>)
 id 1nrE9Z-0003Sy-5d; Wed, 18 May 2022 03:31:29 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:60574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rashmica@linux.ibm.com>)
 id 1nrE9X-00076d-El; Wed, 18 May 2022 03:31:28 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24I7FOBk006079;
 Wed, 18 May 2022 07:31:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=nG4yATrqnYqilm8hyRGpGI8AKiQ9P9la4p2SFy4Q9Go=;
 b=iSbI9j9F6UB7y0gKDYFxhEi8WajN0CtD2jRoYMMeUQln869dOFJ9VFxUvPXGGx+BwOCv
 bfhM9G5Hrj8jFLDmGBvylny1IVSZ9twqPQIr3Z5Fv8cJE/GUrgOzZYI4d1L+1eucFKYP
 EQe2M+yPWN9/hBsHvDV+kcxq9qU3ShZQ+by1RGlBnP5dQFJJOBUI+r6RYhm/Au6H94MX
 T2S6nwicr+/7QhTJ83RiX5p5vZutALOhIgEpwD5nNOm89LFt6uVZG47rCHYyjpgZ7N/E
 kn4pJH9U4eZHIxyJ/T36jIJ3Eqyf3k76wgxIpOImAk0RejFa7QHcnGs2MuZxwfE74q/J 1w== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g4v8j89pb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 May 2022 07:31:18 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24I7IMZr003113;
 Wed, 18 May 2022 07:31:17 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma05fra.de.ibm.com with ESMTP id 3g4j3ggg54-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 May 2022 07:31:16 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24I7VElY42140014
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 May 2022 07:31:14 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8439EA4060;
 Wed, 18 May 2022 07:31:14 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2BAC3A4054;
 Wed, 18 May 2022 07:31:14 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 18 May 2022 07:31:14 +0000 (GMT)
Received: from [9.43.194.236] (unknown [9.43.194.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 8830C60306;
 Wed, 18 May 2022 17:31:08 +1000 (AEST)
Message-ID: <09776fe6d855338ace01e57dc780c107b8f635bf.camel@linux.ibm.com>
Subject: Re: [PATCH] hw/gpio/aspeed_gpio: Fix QOM pin property
From: Rashmica Gupta <rashmica@linux.ibm.com>
To: Peter Delevoryas <pdel@fb.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, clg@kaod.org, andrew@aj.id.au
Date: Wed, 18 May 2022 17:31:05 +1000
In-Reply-To: <20220502080827.244815-1-pdel@fb.com>
References: <20220502080827.244815-1-pdel@fb.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: R27sTud5ZmKu7pKE7M85kK8QJJWHIVzE
X-Proofpoint-ORIG-GUID: R27sTud5ZmKu7pKE7M85kK8QJJWHIVzE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-18_02,2022-05-17_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 priorityscore=1501 spamscore=0 adultscore=0 mlxscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 mlxlogscore=640 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2205180036
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=rashmica@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: cqUbvaWzywyg

On Mon, 2022-05-02 at 01:08 -0700, Peter Delevoryas wrote:
> I was setting gpioV4-7 to "1110" using the QOM pin property handler
> and
> noticed that lowering gpioV7 was inadvertently lowering gpioV4-6 too.
> 
>     (qemu) qom-set /machine/soc/gpio gpioV4 true
>     (qemu) qom-set /machine/soc/gpio gpioV5 true
>     (qemu) qom-set /machine/soc/gpio gpioV6 true
>     (qemu) qom-get /machine/soc/gpio gpioV4
>     true
>     (qemu) qom-set /machine/soc/gpio gpioV7 false
>     (qemu) qom-get /machine/soc/gpio gpioV4
>     false
> 
> An expression in aspeed_gpio_set_pin_level was using a logical NOT
> operator instead of a bitwise NOT operator:
> 
>     value &= !pin_mask;
> 
> The original author probably intended to make a bitwise NOT
> expression
> "~", but mistakenly used a logical NOT operator "!" instead. Some
> programming languages like Rust use "!" for both purposes.
> 
> Fixes: 4b7f956862dc ("hw/gpio: Add basic Aspeed GPIO model for
> AST2400 and
> AST2500")
> Signed-off-by: Peter Delevoryas <pdel@fb.com>


Oops! Thanks for catching this. The tests look good.


