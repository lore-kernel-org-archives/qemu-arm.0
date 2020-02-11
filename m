Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5158411lfp;
        Tue, 11 Feb 2020 06:32:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqw2aF3XWn4hZoYs0U5rIhk028/GCw49rcjHghwLBQsb2x+Jd9XZiMk5lbzuCAST4XmUbYlA
X-Received: by 2002:a05:620a:6b8:: with SMTP id i24mr6611926qkh.9.1581431519991;
        Tue, 11 Feb 2020 06:31:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581431519; cv=none;
        d=google.com; s=arc-20160816;
        b=Ar9QGiI2drWnpRbZa2pIGJD56v2tV0DqhlzkYxsb+DGc408GMEYKqZc27GI/F4qRQz
         8Lv3efaPi5Cbq0flSKNPfSE6Qwx08ZJ3MTTAS5iGlMWpYdB+4VMFh4SL8Ylielp8rrSJ
         ZNSkmMZvbOfiQwRFiwmW4GRuoC972lFbkktVIXLrMcuV6d+AHyKh0mj1gX1V5r11O7T8
         tJfboz/ppIirhgpIYcxTt5t/Q+/b0AaazllaednnEG9AT1OWQ0Up38QQ8WAcukl4272C
         4ue02GVUvZg8aDm1s4pQiKlw3ncMB6McPR97xhOlGjF0u3kZhDNCRmFBUKrcFpX/88p0
         BHxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=aYM3Ml30UT8TtEI3JKpxGYwICUZViSJ5ZwIEfihbiaQ=;
        b=q0lUfs5PnI2/yF44Gx8Jmq4ed63fmuT+/F716o4Mt6BZozZkdVSQ+8hsiV2lZhdL5L
         9nVjNq3xhKdWgTJOu3gjXmP/q2eWskpvDjjCJLGVxmVgNJcos9Jz4TqvsiokZycAxR/Z
         ADnx5vCbcFEZI33Px1yvvfKvziWmseQundPKk4xpwlM02G/9Q4oaaM14shOL/vA/REJV
         AXUEl5/vvwXb09tTgoBZTOAmVvyRlYx1t8LvkZCHkbo12wLkf1NtTgaNq2u4SAbAnsN2
         GaPltFzMDr4oY86ACLMPbbtIT2u9OGp6WHoZaqP8k0CeQ+jo5qjiCKNyM1Z3Zg6Uvtoi
         KEmg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w5si2026371qvl.69.2020.02.11.06.31.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2020 06:31:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1]:50598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j1WZz-0005Nm-FM
	for alex.bennee@linaro.org; Tue, 11 Feb 2020 09:31:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51108)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanb@linux.ibm.com>) id 1j1WZ3-0004tj-8g
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 09:31:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanb@linux.ibm.com>) id 1j1WZ2-0005vv-AL
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 09:31:01 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:51438
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanb@linux.ibm.com>)
 id 1j1WYz-0005up-Up; Tue, 11 Feb 2020 09:30:58 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01BEO3jQ058128; Tue, 11 Feb 2020 09:30:55 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y1u1kb9t9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Feb 2020 09:30:55 -0500
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 01BEOAjf058827;
 Tue, 11 Feb 2020 09:30:55 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y1u1kb9sn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Feb 2020 09:30:55 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01BEU7U7028052;
 Tue, 11 Feb 2020 14:30:54 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma03dal.us.ibm.com with ESMTP id 2y1mm7d9ma-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Feb 2020 14:30:53 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01BEUrte54591824
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Feb 2020 14:30:53 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1003A28066;
 Tue, 11 Feb 2020 14:30:53 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 078F42805C;
 Tue, 11 Feb 2020 14:30:53 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 11 Feb 2020 14:30:52 +0000 (GMT)
Subject: Re: [RFC 1/2] tpm: Let the TPM TIS device be usable on ARM
To: Peter Maydell <peter.maydell@linaro.org>,
 Auger Eric <eric.auger@redhat.com>
References: <20200210131523.27540-1-eric.auger@redhat.com>
 <20200210131523.27540-2-eric.auger@redhat.com>
 <5cbd1960-6138-f4d0-948f-1983cb0f93b0@redhat.com>
 <e69f69c5-40f5-1fe5-f298-129324cc7055@redhat.com>
 <CAFEAcA_TJ5gDMRNK=O-iaqksYL_aQFu7repo7wKi7pGb-A9cYQ@mail.gmail.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <f54abc68-5727-b965-5217-68288b1a344a@linux.ibm.com>
Date: Tue, 11 Feb 2020 09:30:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_TJ5gDMRNK=O-iaqksYL_aQFu7repo7wKi7pGb-A9cYQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-11_04:2020-02-10,
 2020-02-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 impostorscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1011
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002110108
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-001b2d01.pphosted.com id 01BEO3jQ058128
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.158.5
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laszlo Ersek <lersek@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>, ardb@kernel.org,
 Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eFisUFyL3aVw

On 2/11/20 5:56 AM, Peter Maydell wrote:
> On Tue, 11 Feb 2020 at 08:35, Auger Eric <eric.auger@redhat.com> wrote:
>> Hi Philippe,
>>
>> On 2/11/20 9:25 AM, Philippe Mathieu-Daud=C3=A9 wrote:
>>> You don't need much to remove the RFC tag:
>>>
>>> - rename TYPE_TPM_TIS as TYPE_TPM_TIS_ISA
>>> - rename TPMState as TPMCommonState, add an abstract TYPE_TPM_TIS
>>> parent, let TYPE_TPM_TIS_ISA be a child
>>> - add TYPE_TPM_TIS_SYSBUS also child.
>> Yes I tried my luck without too much hopes ;-)
> There should be a few existing examples in the tree
> of devices that we provide in a sysbus and also
> an isa or pci flavour, that you can use as templates
> for how to structure the device.

block/fdc.c ?


 =C2=A0=C2=A0 Stefan


