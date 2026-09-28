Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92158CA5FA2
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 11:34:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xB9dA-0006xV-HQ; Mon, 28 Sep 2026 07:34:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xB9d9-0006xA-8r
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 07:34:47 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xB9d7-0002AV-Iz
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 07:34:46 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68SBAMUF1839660
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 11:34:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sRMgH205JmlJ6dUdUN3XjqTRDQ/KTrIRidMWmDxPQUY=; b=cj7mBMJuZe/ct2+7
 y90isdE9iPoNRZb6McaGw8Qi5IPPuoHcJFASgqAzPEDKzTD5twy7w6SpGIwnv/Eb
 8YCatnh5A3Yz7dktDuY0VfhrB/baD5KkALVypegIgzgAsQ4uSiW6cB5PdPmG6fOx
 u0JpRKiegGqSKIHNDgmeycXDtYWOKQXZbnDtNmBs8BkricKT4t9ezB5QlBLzfst4
 AiGq8bG9JgC1jKIv3ig92CtronvA9FRkACMLZgX14o4LYjTR7Mu2p3CrEk3vUnkx
 1pfdspoBEjcbzWO6HaCEl0uT36XqChUYo8E/TxiF7FvPisA9k2JH3lPsvmPUEofY
 hMtSpw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynb6gger-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 11:34:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93c77c0d96eso114080185a.3
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 04:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790595283; x=1791200083; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=sRMgH205JmlJ6dUdUN3XjqTRDQ/KTrIRidMWmDxPQUY=;
 b=R1nYzhfZRoi+AAxfxeRCiIN/ym7W57tkkKcsVx4sDootAccIgog3XiT8/HSSNiOQKn
 WOdotenzzg2+sjYMsW7QuA5M4pivTD0BA1MODduJ3StBQhPgp7+YWds35MhzaeXOqop6
 2kFygj5ymQda6i9BzSOBMMGf08pXJNCRnhrKCZMVL6ZHbTAtWO4CdRiH/UXfV25/bdPm
 o753W8NURwKgyU1nkyRWnQ3FNQSqH0bB7UVPg5o4O4pMAd1mwb1qsR3FljcTJGkSo0xm
 QqvI2czP3SsNu8968IPAtO4n2YgmlTMpM92cbJqQVJo/wwCB0lsAe93uXNMY5P4+O9ZS
 AN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790595283; x=1791200083;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=sRMgH205JmlJ6dUdUN3XjqTRDQ/KTrIRidMWmDxPQUY=;
 b=J6F7PZjaTBOUYDxlhZeOKTkEXiJ1BYB7sv6UUJ7ygwCFebJddOw0MN/Y1SgZbekvV1
 KwMVXDcoa/GS0kwAeGZV+RIUIm4EkbioLuJotWOyrZoCfTXB1CekmsuwaZoAkIaFfXlN
 qgJKppWKMQa4W1232tmg+Oa1DiC4NPqIT1Yw2NwSX21WMGMQQfMFVQXhzqKlssb8qsVs
 nhtMp74QfeclkW9YyGKeFxvy8bjXfSdAfS3Wy/HcgR4zLKd83tT5Ygxz9467O2+AEjYY
 600G6TcUDOTJ9bBERSFQao5bOWkL7X/FzcQBfSPIYK0rXHTyMa09hD26cGk+PvHk0wBb
 ERxA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzLpcQravzMWqiMddbwQoD8m84i/U4B7PpRwPDleIP0T0VKEwIoBDQHRC7on3J6rDI3pwkUzmnSaA==@nongnu.org
X-Gm-Message-State: AFuF++m8NiZPMLySRk+O9anNMC9TeF897PgPwySUm8OMBLtTEqiy9Kei
 eRsY3vlQvnYuCD3D4e8WACaGFto2XT3W95ISOorkwB3kWE27qNlW9TG8fZcTxTnqksWpE5jipPH
 v8c5vCQ52bDzlkv9awCNaU6BR6MklVibJfYS3FBxnqrhze+8aiwO3NAQ=
X-Gm-Gg: AYBFou3g74EUIR6/F6bK71gtBFvmNNkA/JSnDxY/5yjEQdZjhKaSYdk8WHkthGq8pn9
 kb4M8FOtLRfuZxHEhOtClaP3QBnugOAX/T6fWWlWMmDJ735+mn9+RQcsKckcsJEMQiwtw2nogy+
 qyZCHKR8V17NyWRXq31AWH2EXKMAHulz39awrWJxlxaIg134QEG1NmWH+22O/2vjWRkW3hrIlgJ
 H3nPxjeVdWnGv/cAXy8XBWWCI4heQmAEGsKvajlGVsVhF+y08SzKfjC6pV4YxPzAPcCBFMhIlnV
 M81SzWQzb7FWjoZTtSeSds82Zw9IibXLegFPtPGLRdv0wnIDczvi0HeR3bD9qX+dSwmxrYOcA7U
 0dvKkc4sa7ojhDi1M04DNUvJecRHn+3E6bQ==
X-Received: by 2002:a05:620a:2954:b0:936:df48:d507 with SMTP id
 af79cd13be357-93c43baceeamr1894036985a.18.1790595283209; 
 Mon, 28 Sep 2026 04:34:43 -0700 (PDT)
X-Received: by 2002:a05:620a:2954:b0:936:df48:d507 with SMTP id
 af79cd13be357-93c43baceeamr1894030085a.18.1790595282523; 
 Mon, 28 Sep 2026 04:34:42 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a001778312sm315502635e9.8.2026.09.28.04.34.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Sep 2026 04:34:41 -0700 (PDT)
Message-ID: <a4b7056e-1651-4167-86e0-e7eaa3941d02@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 13:34:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 46/55] qapi: add query-targets
Content-Language: en-US
To: luoyonggang@gmail.com
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
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
 <87e7c5ae-c78c-4a47-b9ba-9851ce5757d9@oss.qualcomm.com>
 <CAE2XoE9qsZZ+AnfGQ797SQj5yXP8SDOZyxYoKP=oh57UPFqq0Q@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <CAE2XoE9qsZZ+AnfGQ797SQj5yXP8SDOZyxYoKP=oh57UPFqq0Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA0NiBTYWx0ZWRfX79eg3lnPSxrg
 IW4C/g7ZiXmka5gL4IXu3C61LdnkFgnjagmHi2U9GcY4qEJfiCgU8xkkvhxdxJHr++FP9ImMYoX
 ug76St8tsxPCWWPKIxvN9AEqak357FXzVqJlCqOgwLnXlpPuZmBdIjRpXPl9jLRpqbsPNobFyCi
 Ij/OmfbCp3vUmdivuHjsQo4o4vsr5lSF/dfNfAbR+9x0z1ovp0DCEsZaUARTEUKeQz2Heb+YSNn
 tXbOJOG3b8c+v+vWou8DYirVvcIhDuC4exFdSzMF8OAIByD8emnpqE9IU3luyZ79q6NVMIIFLSE
 NW3WHJkaLY/gAuvx1AHwIM+JDQF1TTrBXlnERT2O1itkzaGsM2EszH/LoI/RlD5dYutRUUgu5cQ
 raDdSCT6Z/Yd5ZbTmsYnvxSlDnv570FG+c0RPA4u8yJK7opMsco44qq0wwkro78CYu/c8B8x07s
 dNxPql1HIuUB6waGtdQ==
X-Authority-Analysis: v=2.4 cv=K+e3jCWI c=1 sm=1 tr=0 ts=6aba50d4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=DzeirrpXcSkLjWCSE7AA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA0NiBTYWx0ZWRfXyM+FU1KyQuf9
 vM8PYkABLDCa8MsPo0IwFbgdRjoMjoKJ+6wiV6Gd54oH2jcDvZqaEqjsxiFR1ViXmIfQEWGI3Oc
 cbwwFiK0QqIoggb4G2gbQimKwVaeiTM=
X-Proofpoint-ORIG-GUID: jwbSfLuYop4KbcczSPIPF0H6dpkHo_Rj
X-Proofpoint-GUID: jwbSfLuYop4KbcczSPIPF0H6dpkHo_Rj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280046
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

On 28/9/26 12:51, Yonggang Luo wrote:
> On Mon, Sep 28, 2026 at 6:39 PM Philippe Mathieu-Daudé <
> philmd@oss.qualcomm.com> wrote:
>>
>> On 28/9/26 12:13, Daniel P. BerrangÃ© wrote:
>>> On Sat, Sep 26, 2026 at 03:00:45PM +0800, Yonggang Luo wrote:
>>>> query-targets lists each linked target, including none, with its
>>>> arch, endianness, and the machines that target accepts.
>>>>
>>>> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
>>>> ---
>>>>    hw/core/machine-qmp-cmds.c | 30 ++++++++++++++++++++++++++++++
>>>>    qapi/machine.json          | 35 +++++++++++++++++++++++++++++++++++
>>>>    2 files changed, 65 insertions(+)
>>>
>>>
>>>> diff --git a/qapi/machine.json b/qapi/machine.json
>>>> index 6aaa2af709a..d8cdea6203e 100644
>>>> --- a/qapi/machine.json
>>>> +++ b/qapi/machine.json
>>>> @@ -307,6 +307,41 @@
>>>>    ##
>>>>    { 'command': 'query-target', 'returns': 'QemuTargetInfo' }
>>>>
>>>> +##
>>>> +# @TargetMachines:
>>>> +#
>>>> +# One registered system target and the machines that can run on it.
>>>> +#
>>>> +# @arch: the target architecture
>>>> +#
>>>> +# @endianness: the target endianness
>>>> +#
>>>> +# @machines: machine type names, not aliases
>>>> +#
>>>> +# Since: 11.2
>>>> +##
>>>> +{ 'struct': 'TargetMachines',
>>>> +  'data': { 'arch': 'SysEmuTarget',
>>>> +            'endianness': 'EndianMode',
>>>> +            'machines': ['str'] } }
>>>
>>> We already have  'QemuTargetInfo' struct which is used
>>> with 'query-target', that should also be used with the
>>> new 'query-targets' command.
>>>
>>> We need to add the 'endianness' field to QemuTargetInfo.
>>
>> Why do we want to expose endianness, and what endianness to
>> expose? Endianness is a runtime bit state of CPUs. Sometime
>> this bit is hardwired but that is an implementation detail.
> 
> For some targets it's, but for some targets it's not. for example
> 
> mips-softmmu.mak
> mipsel-softmmu.mak
> mips64el-softmmu.mak
> mips64-softmmu.mak
> 
> 
> mips64el-softmmu.mak
> mips64-softmmu.mak
> only differ the endianless
If you look at git / mailing list history you'll see I spent more
than a year unifying QEMU endianness. It was too much work for a
single person so we decided to reduce the scope to ARM + MicroBlaze
for single binary and we got MicroBlaze unified. We don't want
an endianness-specific single binary. I'm not sure what you are
trying to build, you didn't clearly explained what is your goal here.

You can find series unifying endianness for MIPS, not merged because
more things need to be addressed and not the priority.

