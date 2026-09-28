Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37940C9833E
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 10:40:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xB8lz-0007Tm-AK; Mon, 28 Sep 2026 06:39:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xB8lv-0007Rw-H8
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 06:39:47 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xB8lu-0004P2-11
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 06:39:47 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68S9MZNY806512
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 10:39:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TMqT+pNe1u8+gsjWsBdnfHCPm7gBPI7oINOv8dEYdgw=; b=JdZFHXD/o7tCUCX3
 tPQPJJNwufdJ3QfVGO1+TwStMcsC7gf0mXhh1sPlG91HMDqSFKMVS5fJ86QsqCk0
 Y6MoQvVi7QdGe5rwM5HeNckpTY6raDSQmCw5M7ue9p7EWi8XG3dQcNA6JqWPbg4e
 +b9Qtfkee43DrYozCQ/z2P3HRbCh0TeRexxSWBisWV4cOmuUklj5phr7h0Y8wGpv
 5eka29LPjKIJ1aetYryDOhflRaClotuQg1MGhJojPdID0GhRW99iTKMhsvXT0kec
 KI5dTdTIQS8a67ctbPh4lXG3kixTvuoNTNhoYP6MQqB5KkTqZBGhACgOfOJ1mdzh
 RXQ9Ow==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyk5mrw3e-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 10:39:44 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-90c8da50f4fso45144426d6.0
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 03:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790591984; x=1791196784; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=TMqT+pNe1u8+gsjWsBdnfHCPm7gBPI7oINOv8dEYdgw=;
 b=krCh+tpqGtZZEj2UJ2JQ+wQS1RyUoSh6ElUly9Iyfpm3nQaJhOXuR/xV50AKugkc0l
 SEl7iXzENnKrmDZ9Yv4XO2KP3NDsc5+8aYxn29za+G4vjgFthYTsJPXyAbgGe2pvZVZQ
 nQz28jzXU7zoyb7w3alNMBL7Jq9nyAY5c6wbcgwYfoRd2HZHj5DAxM7eSTeX4Hjf+I9H
 neuVxfG9EMDWvR63ApbKp4HT21R1iHYmJHMgxGHfa7A1ro65eTVreRAhX1+cIbE9YBCK
 05PSh2ssMGMGaMjaL/Mqf330ZLxEF5vNO84t1AYVXMqhPIhPVCdSV0Whn2eope/7qio8
 hEjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790591984; x=1791196784;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=TMqT+pNe1u8+gsjWsBdnfHCPm7gBPI7oINOv8dEYdgw=;
 b=droVaW4HTOUL9p5LjNp1CRNuQJMS5Xvh8BbHEqYZQtClU3mwFWs/S6HmtmgTIZuWcr
 qxOUM59d86h5pUwXVnzVEicOfQqRjaXkg0Kla55RqqftFmOkenm8RjhFR+sjrPBOPaeS
 pkdOSsu0wx6U6X0ps5yqfNs0rSaoKBT9aPfI7Z/Xi9uzEhKAa/UzPn85DzPviS14ZL37
 BWOx3G5f3sQwEBl/BNPeOwDjGlWhyRhBzYA/kEee6v2H85tlOwwWo/4Ha8oUtX2QSCk/
 iPi0pKSNWYVSkDLZLGIh8MNa0VVWGJdo9ucxHBmHJIMxcyw6IsIF3emAe63+gZKFGI8Y
 mK8A==
X-Forwarded-Encrypted: i=1;
 AKwUvByML5X703BrOcyaXnbn3VSug6A4vhWMoisB50CvJWwdMloTrUdNobr7ljujs8dI8fFcwkggW5OOTw==@nongnu.org
X-Gm-Message-State: AFuF++k5vlgF0ttwoDm4C+8Wnpb9qtrN2CVLF4CO6apEUdYnD7dBbcOC
 dajrRde3h4OC+Ub1S0mC1heqxLL8xM7nOSGSoN7UJXIddEVGfy0gUvqwRUO/L2KTXhOAM9Qmn+E
 X+lIlIdm2VrME8hROZjPIX0ugaeFNzXlQeEj+3iBSW5sbgc6+T1GI+Wo=
X-Gm-Gg: AYBFou3fsxcMGu9wUZlBqe9SM2VcFAd1tZ5+VIHoUS5si0BFbN2f/G4VIFRLm6p9rRM
 pQ96fohM8ZrJe5bsd6h4TUDG1NIZZNAx0uEtz7xq621z8zODPAAOl2UtoLFmsnwmwryFLyeqmos
 zz2OD4bv9KnJtwpLR7lOPlew3/qv1ybOl9M1NjCmeXq/Z24KB4HLfY22dLuejq9NYzu2vtbqDzJ
 LE3ii47dT6x+BM1PCta3ewra4l4zoVmIis6SvKHPf8dxmc4826x7oj9f/WAKbFmltLJP5MDise5
 QtWEIc3IWl13Y/BuspxHGV94PN7s9+xdzseIP45HRTLWw6lqWsBP6duJSdJwPKeSjRIqwtyj+55
 XWVjkctLkSSUDsgEm7srQZXm/lbSG0lDgNg==
X-Received: by 2002:a05:620a:2614:b0:93a:2bdc:cd57 with SMTP id
 af79cd13be357-93c43b7f72amr1961053685a.2.1790591983988; 
 Mon, 28 Sep 2026 03:39:43 -0700 (PDT)
X-Received: by 2002:a05:620a:2614:b0:93a:2bdc:cd57 with SMTP id
 af79cd13be357-93c43b7f72amr1961049785a.2.1790591983514; 
 Mon, 28 Sep 2026 03:39:43 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a001915fc2sm127462375e9.14.2026.09.28.03.39.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Sep 2026 03:39:42 -0700 (PDT)
Message-ID: <87e7c5ae-c78c-4a47-b9ba-9851ce5757d9@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 12:39:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 46/55] qapi: add query-targets
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, kvm@vger.kernel.org, Thomas Huth <thuth@redhat.com>
References: <20260926070057.1234-1-luoyonggang@gmail.com>
 <20260926070057.1234-47-luoyonggang@gmail.com> <aro93NuZBXYGbD33@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <aro93NuZBXYGbD33@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: hhkdkiVMPa-hx62XAUMz6AZjIFzElcsa
X-Proofpoint-GUID: hhkdkiVMPa-hx62XAUMz6AZjIFzElcsa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA0MiBTYWx0ZWRfXxBKHDO5f5nEy
 ak9XyouX8pXSyWqOn/LTFua1AAjb4Z6dhgRkJrwFbW1tMPAxQThgzWnvpK+APj/YWRcNUeEyer/
 cDMEN8Xj/1i2JKTBVfsPZJhKSgdjjJ7FU+KV/LZCNEQscaArUVdOpkG2H1aSZu1FKUCcv5oNJe8
 n52VTmXWtrLn/XfjgHXg3h4Coc7Vw5FF5IKJjVeaShU9/ejjW7WxB4g5RlX6i/enC4Nv58j1Ec6
 vf8BWIyluHg5sIKR86g2lg3jMDuVfGc7JlWmwYCxjUb/8p9sstgOyACUP1kGV46fyobkvPZAH6l
 FYTUeQxnFnBymJ6AI8nicJQYn2kzTkRilWv3nn6t/kJ6n1/3xIq8czO11IPGdDoo1QcvOsL4MrC
 KusXoPwCcj6X/d2xCs/AMYM0Q0meAcTchvZ3NPqnjbzGFpxW4dPlb7U6R+JFFoA59i7oc10PoGS
 XvEc8p/CBbAORtb8RBQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA0MiBTYWx0ZWRfX5ZeITqsgyLKb
 7DoIGLiWpVszOkKEMFQ3ucVOF7Fi3lnzeDNRCebc5baz3epho/gTtzfFlXoS/no7W/t9wHOzLk1
 1wbmQrPUNDmV/zSNeLF1K2VhStEy79I=
X-Authority-Analysis: v=2.4 cv=asYnmiZV c=1 sm=1 tr=0 ts=6aba43f0 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=KzZhQ3oIAa4MhOPPK_wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280042
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 28/9/26 12:13, Daniel P. BerrangÃ© wrote:
> On Sat, Sep 26, 2026 at 03:00:45PM +0800, Yonggang Luo wrote:
>> query-targets lists each linked target, including none, with its
>> arch, endianness, and the machines that target accepts.
>>
>> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
>> ---
>>   hw/core/machine-qmp-cmds.c | 30 ++++++++++++++++++++++++++++++
>>   qapi/machine.json          | 35 +++++++++++++++++++++++++++++++++++
>>   2 files changed, 65 insertions(+)
> 
> 
>> diff --git a/qapi/machine.json b/qapi/machine.json
>> index 6aaa2af709a..d8cdea6203e 100644
>> --- a/qapi/machine.json
>> +++ b/qapi/machine.json
>> @@ -307,6 +307,41 @@
>>   ##
>>   { 'command': 'query-target', 'returns': 'QemuTargetInfo' }
>>   
>> +##
>> +# @TargetMachines:
>> +#
>> +# One registered system target and the machines that can run on it.
>> +#
>> +# @arch: the target architecture
>> +#
>> +# @endianness: the target endianness
>> +#
>> +# @machines: machine type names, not aliases
>> +#
>> +# Since: 11.2
>> +##
>> +{ 'struct': 'TargetMachines',
>> +  'data': { 'arch': 'SysEmuTarget',
>> +            'endianness': 'EndianMode',
>> +            'machines': ['str'] } }
> 
> We already have  'QemuTargetInfo' struct which is used
> with 'query-target', that should also be used with the
> new 'query-targets' command.
> 
> We need to add the 'endianness' field to QemuTargetInfo.

Why do we want to expose endianness, and what endianness to
expose? Endianness is a runtime bit state of CPUs. Sometime
this bit is hardwired but that is an implementation detail.

See commit 0e2c5647d92 and surrounding for MicroBlaze for
example.

