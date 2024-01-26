Received: by 2002:a17:906:ca92:b0:a35:2c0b:b7b4 with SMTP id js18csp143626ejb;
        Fri, 26 Jan 2024 15:16:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHV1tfjPR36MdJgsvSAkM8oWOP2JYcceyA2DyNu5fq+pU4Y4B8K9W+18qtgpnTYEb6whHuk
X-Received: by 2002:a05:6214:5188:b0:67c:cd09:9b93 with SMTP id kl8-20020a056214518800b0067ccd099b93mr569678qvb.7.1706310981808;
        Fri, 26 Jan 2024 15:16:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706310981; cv=none;
        d=google.com; s=arc-20160816;
        b=q5cUcEZTIzF3ASXQbhtDYoX9GZZqK/fBw1T7U9gDA/h1L+yAy4cujy5zbY2D4bLdMP
         b3+8iuyUJgPiWkGMiDrT6acQ+GliX8n6/GIsX2dIJFJmIlNAF7r5vGT81A3GqdabZnOA
         Y0q/evgMdEpkCTNICSSTrISi0GUpSMQggBKVDe+m4GB45W78zyX1wIa7ucNTPuRiJbvM
         0e2Di20F5mdNmU8RdQFXQYhSqcayioleWTkcFz/rc3PuF/37a7fkSszSy03rvk1VgkF7
         XY1wt2qt7GBpPyKOHo1P04Wx2pnJWGqWNBgxXe4OSpO7u5viujCCZIr/jjzytTa9tzWy
         bHUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:date:message-id:dkim-signature;
        bh=eOvxwSN/SVrEo+IEGwBUEI/BCgilTtCiarYyr6qAPb0=;
        fh=X1V20o1Upe38NPTXL69Ln2uu6pxCE36GtmX4DJF0ejA=;
        b=fhg8WSQr6B6Wz7pz7h7Bk20SengxHHICUmN+y1dyLreZB8LA23aPHZkazvitLk4xBe
         y6AX95Q39CDSTvnvS4OwGwFyznW9g0geqfnFMPgbJN9VZdKvYYf8tj15B4ZL4tZd6dhe
         vWckrtLV7mlmKeYgN3ryBPdo4jl5cNVFe/XvllKVBmKJpNacB8+wNxTgOWNfaNpVUkGA
         +5ziHNL2lj7NB1wZrkemXgjyYFQb4iMt+6TGimFpPbPJ9dIpy7MuX30AvXVFM5durtMl
         /X/m/PuBS7zGTZId2Wiw9lVBXEqLQ4HLCTWuFRDlygI2RgUP6IqfglN949qUS+iNf1Tb
         q/iQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=OrlYSMX0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 8-20020a05621420e800b006864677cd84si2348050qvk.608.2024.01.26.15.16.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jan 2024 15:16:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=OrlYSMX0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rTVQS-0001g8-NS; Fri, 26 Jan 2024 18:15:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1rTVQP-0001bw-DL; Fri, 26 Jan 2024 18:15:53 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1rTVQN-000653-J7; Fri, 26 Jan 2024 18:15:53 -0500
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 40QL7sk3021241; Fri, 26 Jan 2024 23:15:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=eOvxwSN/SVrEo+IEGwBUEI/BCgilTtCiarYyr6qAPb0=;
 b=OrlYSMX0BBY3ir7BAcXVM8YsZkAdFxhhpRtCMOCxqdNZLhGiBgz+e0zYa24MWQ5Bdh/5
 Cxx0hEJQ+yMLke0Ddk/6zzeURwNIpkglXnfsxB5zFpteTjzsPh0fq+l2P+lvGrB5yMZe
 txW8By5M0H/0fA2AWt+ELL89HyVDZoGfho9RyxAvw+LaGfcu2+kdKA9HX2MMarF9RM1T
 S6mPbBa1EDdtqtVtHnavN0eNm4xrpuRLgW2IHha5plT9EeW0gZsW/xHO66bTfpy2igHn
 Ck09YBoBavUx0Z1Oa0FFZBYfaF9P80KYcyw2NNJXbm/qFGGamQwRQsqaKWX523G/ZpIG LA== 
Received: from ppma22.wdc07v.mail.ibm.com
 (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vvmcj2u0y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 23:15:47 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 40QMWbZf010860; Fri, 26 Jan 2024 23:15:47 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
 by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3vrrw0e2r7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 23:15:47 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com
 [10.39.53.232])
 by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 40QNFklG23593472
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Jan 2024 23:15:46 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E979058043;
 Fri, 26 Jan 2024 23:15:45 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 56FD058059;
 Fri, 26 Jan 2024 23:15:45 +0000 (GMT)
Received: from [9.61.133.146] (unknown [9.61.133.146])
 by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 26 Jan 2024 23:15:45 +0000 (GMT)
Message-ID: <92a01f6a-b86a-4312-9a98-4dad7c18c01a@linux.ibm.com>
Date: Fri, 26 Jan 2024 17:15:44 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 00/17] aspeed queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20240126133217.996306-1-clg@kaod.org>
 <CAFEAcA8Q66Qw7spMOcBju0v-=C=x10hz1rwPWxjCzYWhdkX8Ww@mail.gmail.com>
 <1ab62ecc-7e3e-4c84-96e9-040193d9b35b@kaod.org>
Content-Language: en-US
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <1ab62ecc-7e3e-4c84-96e9-040193d9b35b@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mYHp0WtNXu9J50B9p5ksHWSBLXqjYJ50
X-Proofpoint-ORIG-GUID: mYHp0WtNXu9J50B9p5ksHWSBLXqjYJ50
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=802 clxscore=1015 mlxscore=0
 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401260171
Received-SPF: pass client-ip=148.163.158.5; envelope-from=ninad@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: GINv9yLe0NBb

Hello Cedric,

Sure, Let me check.


On 1/26/24 10:48, Cédric Le Goater wrote:
> On 1/26/24 16:56, Peter Maydell wrote:
>> On Fri, 26 Jan 2024 at 13:33, Cédric Le Goater <clg@kaod.org> wrote:
>>>
>>> The following changes since commit 
>>> e029fe22caad9b75c7ab69bd4e84853c11fb71e0:
>>>
>>>    Merge tag 'pull-qapi-2024-01-26' of 
>>> https://repo.or.cz/qemu/armbru into staging (2024-01-26 10:21:27 +0000)
>>>
>>> are available in the Git repository at:
>>>
>>>    https://github.com/legoater/qemu/ tags/pull-aspeed-20240126
>>>
>>> for you to fetch changes up to 
>>> b40769f4b49d15485ffaaa7acade3e3593ee6daa:
>>>
>>>    hw/fsi: Update MAINTAINER list (2024-01-26 14:22:08 +0100)
>>>
>>> ----------------------------------------------------------------
>>> aspeed queue:
>>>
>>> * Update of buildroot images to 2023.11 (6.6.3 kernel)
>>> * Check of the valid CPU type supported by aspeed machines
>>> * Simplified models for the IBM's FSI bus and the Aspeed
>>>    controller bridge
>>>
>>> ----------------------------------------------------------------
>>
>> Looks like you have an endianness bug, either in the device
>> or in the test. From the s390 runner:
>>
>> https://gitlab.com/qemu-project/qemu/-/jobs/6029422595
>>
>> 232/847 qemu:qtest+qtest-arm / qtest-arm/aspeed-fsi-test ERROR 0.38s
>> killed by signal 6 SIGABRT
>>>>> PYTHON=/home/gitlab-runner/builds/-LCfcJ2T/0/qemu-project/qemu/build/pyvenv/bin/python3 
>>>>> QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon 
>>>>> QTEST_QEMU_BINARY=./qemu-system-arm 
>>>>> G_TEST_DBUS_DAEMON=/home/gitlab-runner/builds/-LCfcJ2T/0/qemu-project/qemu/tests/dbus-vmstate-daemon.sh 
>>>>> MALLOC_PERTURB_=82 QTEST_QEMU_IMG=./qemu-img 
>>>>> /home/gitlab-runner/builds/-LCfcJ2T/0/qemu-project/qemu/build/tests/qtest/aspeed-fsi-test 
>>>>> --tap -k
>> ――――――――――――――――――――――――――――――――――――― ✀ 
>> ―――――――――――――――――――――――――――――――――――――
>> stderr:
>> **
>> ERROR:../tests/qtest/aspeed-fsi-test.c:152:test_fsi0_getcfam_addr0:
>> assertion failed (curval == 0x152d02c0): (3221368085 == 355271360)
>> (test program exited with status code -6)
>>
>> where 3221368085 is 0xC0022D15, and 355271360 is 0x152D02C0...
>
>
> drat. Indeed. I didn't check BE ... Sorry about that.
>
> Ninad,
>
> Some changes are required in fsi_aspeed_apb2opb_write().
>
> Could you please rework the address space accesses to use
> address_space_*_le() routines instead of address_space_rw() ?
> This will be less concise.
>
> To check, you can use a PPC64 debian (big-endian) on a PPC64
> KVM guest or PowerVM LPAR, or a s390x LPAR.
>
>
> Thanks,
>
> C.
>
