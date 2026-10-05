Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A1ACA5FF0
	for <qemu-arm@archiver.kernel.org>; Mon,  5 Oct 2026 13:32:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDimp-0000M5-Re; Mon, 05 Oct 2026 09:31:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xDill-0008Th-G9
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 09:30:17 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xDili-0005aY-8E
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 09:30:17 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 695CFS8p1527712
 for <qemu-arm@nongnu.org>; Mon, 5 Oct 2026 13:30:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /iCgxSwi3RoPvij3TTorlI9rkpxXQmuhLqHpTg4Dmx8=; b=mWC55rueulo0cyec
 4DHpszLix4/EbA2Z0EiF4sqEFype7emqWTYRQylDT/227otnYQiXxSeKo8vhh4/n
 pBVA2/zSDvKYkZ6HI1TD+m5HHQCF1SdD25Z5Rv61xMFW5vVr0oxH8nODXq7wotUP
 8kAHBJhjMqrd8hG+Wliekw6YFsw8r2LAsYw8QKQ3dqpsZ8o5D9jYkn/MDVJK08PA
 5zoWWRSubhPyFCziXILClpx9wnt5/vMFGLD/eeYki2ZezcLzItmzcB3cyTN2izRA
 oHCYIDEu/pe3jPOH3rdC6TRgALil+PLrtHfOC49ERP0RvUGb0B4umAj58UfDA1gy
 xHe7zg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4a7drjw3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 05 Oct 2026 13:30:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93caa0ce0cdso191625285a.2
 for <qemu-arm@nongnu.org>; Mon, 05 Oct 2026 06:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791207012; x=1791811812; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=/iCgxSwi3RoPvij3TTorlI9rkpxXQmuhLqHpTg4Dmx8=;
 b=Bigu7sV4MfQI21tdQ8sOGLJ53NgKEoEWY58+1BNnhdxNRM/AHZ32hzWjzgI6ptzY3b
 L1wC6oNMk49Z09Ho6asBzBkrgVTkPE+W6fRjxLhiPPAVx8jDWl2Wqt4hMAhC/fwVW61F
 Z+yhU591UABNknKRXx8ggB/RVFYDdyrFJp2+oawCnCAgYa2Fldv3UMLvy9MeHbF0ab+v
 0n0nqlOP8mKgtCdK9K0giGOw0HPJDgeMS75xg3w+pxGr7BpSNXt1CfrJ6EypmvLO7QTV
 ZON4Nh3P5jrX85RCKudUcpLLDrPuc/CbzCyOa0DT9PXv3BsWu61bqxCrYQ7u8w3Q5dbp
 hZSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791207012; x=1791811812;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/iCgxSwi3RoPvij3TTorlI9rkpxXQmuhLqHpTg4Dmx8=;
 b=OQJQ7+qBQFcxaw0BFLfZRcvYdvK0iKCAR3SU2KpNayR6YDYwiZL6pV8q981lJnhT3K
 J7vxI64odfX1l+fW8YbfSfJcZOgJdzOSZRzgP3JIjyFJ+kqXq0WT+rMcUgiUDq2NG04b
 TJHliq228V4KKVKfdDBOUy1t4oK+y/qmPbuu9KyCBVHaKDhU20R9s+Bh8Akdnv6e530p
 acT9GdPAJXIGuPRNsL77UWt+FkJBMrpxZZV2H4Q+DDl7CaeqPtUSMCSgqgEp2cyZH8RX
 mTaXPr8zZXdanXaVNGJ50g/DBCsStyJPNVdubF6bO2J2wiaCjwu9V9Inuayy0zK5Kh52
 p3FA==
X-Forwarded-Encrypted: i=1;
 AKwUvBz0ZnUKrEQDXXjYe2UmGpZJjmHpY1MaDQjar4xi/AewCUfJXIyRkD3k2+acE7JUsaSLqIOeE9xUKA==@nongnu.org
X-Gm-Message-State: AFuF++kLdx1NEHK44D9X66R6gQXuS2KnGOq+Uy0yCCSekS5CWS+3bxyI
 31csQ4ecLwyxxjZyNNcCWq0seCqrhE7p+Hn4r9GkGXph2k+v+GjqspjiqwSs+FHWf4cpiciKD/D
 lLUP2JWIT8698CCmQZh8fL9n0DMhSy/LxfMen7Scp5RZySgDOKfNNo/E=
X-Gm-Gg: AYBFou2PeCoaWCWHO2r6bo9F6JNcFFUyKIUG25nEFvWXA2P0hvc0WTkPYhmXu89+dZK
 KD4BuU1QTgacOyVwWSzjP1sfyYVgWrtSwbMwE0wV3ODQ/+DIkpubu2AToJXFiu9l+awvKfDG/NG
 qRuIXuacPz/QokPRzDbesU8zOY33T9TGHKeDV4qNcrx9IK/bNrGa6dDztBluUCiNq+chIRg8lgC
 hXHoQkIM/4OccrovoxN2gWyliFH8jenvBARtD4kBxIo0OGCRhnHwwX48FT95McFSPtbEIilEtQa
 c03YVnBYV0DqmoKWA0XkOD3eTNgQIPzysEhEPoTefy4LH+l4UrtJO/EExMaShaJ1sTRxKPpx+YK
 qxHEG/xKMKrTJUyKqVHQTK36fS3OiZaciqQ==
X-Received: by 2002:a05:620a:6f93:20b0:93e:78b7:fa4e with SMTP id
 af79cd13be357-93e78b808d5mr219631785a.37.1791207011840; 
 Mon, 05 Oct 2026 06:30:11 -0700 (PDT)
X-Received: by 2002:a05:620a:6f93:20b0:93e:78b7:fa4e with SMTP id
 af79cd13be357-93e78b808d5mr219626385a.37.1791207011240; 
 Mon, 05 Oct 2026 06:30:11 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c622bb17esm3500119f8f.45.2026.10.05.06.30.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Oct 2026 06:30:10 -0700 (PDT)
Message-ID: <63427797-e8ed-4345-b8c7-469d20865165@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 15:30:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/28] hw/ide: mark ICH9 and ide-hd/ide-cd as secure
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 qemu-block@nongnu.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org
References: <20260911143627.2743803-1-berrange@redhat.com>
 <20260911143627.2743803-15-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260911143627.2743803-15-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA1MiBTYWx0ZWRfXwa0wAYvSPPTH
 QST9/aL66lFlOPddpaoaryq5iFiwFEkWXitZxgniZ6wwJh89f7RNrERn3gNXFgFpetX4BywRnjc
 qrCKtvBVolODCitT/FXaIsWXsFFF3L0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA1MiBTYWx0ZWRfX8EEk05nZNogV
 Hgde55LoCDMf5BcRCw/eNiJc2yxDUdPrsddZvyfvSd/R7P5vJONg+L2LCokjNymp6gArc0jU5Ij
 mvrbakPVDJ3CBoxS+wJR44ekoK0OSFTP3tD4q4miPrDsEk9iQjqgYvXx9ByH/Ds/CeCLPzrHyRR
 xAoT9Fr0w/bARrger9E6yw6WSRUuJPOHRGrwN9fWXpbKGcQqeszZpszvd+9PUyPElie1VqTsDuq
 jVYQHK352YKxxZzGzwJkia2VEJW0bfnp+SKSbq5xQ+/7yebeUBpYLcZJ+Utf0yeQTaPp6dDZNSA
 y6yYkJZk2cjzPkackmzp9TRdsZrY0GQSTeJkog0sWaBkYhaphTFvr9psrnfH+vvM3iR/0a3C+q/
 sdRZ7ePEJczccOxrRBuYXwVIE7EcEsU+lTFm7V6ilM7NLIjqzNh2+zWcgCdR3i9ZaT+iSKVD00/
 KJB4SOCC/zM/0vrZW7w==
X-Proofpoint-GUID: d3DyWOp_4jjHZ7MdB2KvuLENuCK2fkgw
X-Authority-Analysis: v=2.4 cv=SvwFe/O0 c=1 sm=1 tr=0 ts=6ac3a664 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=20KFwNOVAAAA:8 a=6wYS7wvJjY0OpNKrp4sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: d3DyWOp_4jjHZ7MdB2KvuLENuCK2fkgw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050052
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

On 11/9/26 16:36, Daniel P. BerrangÃ© wrote:
> These have a long history of usage in virtualization scenarios on
> x86, for OS which lack modern virtio drivers for storage, and thus
> must be considered secure.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   hw/ide/ich.c     | 1 +
>   hw/ide/ide-dev.c | 3 +++
>   hw/ide/piix.c    | 2 ++
>   3 files changed, 6 insertions(+)


> @@ -252,6 +254,7 @@ static const TypeInfo ide_device_type_info = {
>       .parent = TYPE_DEVICE,
>       .instance_size = sizeof(IDEDevice),
>       .abstract = true,
> +    .secure = true,

We shouldn't accept abstract secure device class IMO because it
will be to easy to merge new devices that ended secure and we do
not want to consider them. I'd go a step further and assert both
can not be set together.

>       .class_size = sizeof(IDEDeviceClass),
>       .class_init = ide_device_class_init,
>       .instance_init = ide_dev_instance_init,

