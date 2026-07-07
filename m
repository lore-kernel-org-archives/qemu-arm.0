Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DA4AC43458
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Jul 2026 12:57:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wh5MR-0002bU-FV; Tue, 07 Jul 2026 08:57:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wh5MP-0002Jr-Lk
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 08:57:13 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wh5MM-0005mr-Gi
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 08:57:13 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 667C9LKK3740880
 for <qemu-arm@nongnu.org>; Tue, 7 Jul 2026 12:56:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VvvmWmJavYq8dXZ4FtN4gEOQFPlK04M49xezDDlyUu8=; b=KPUnIpFQYALdmXd1
 Bj222OOBUfWLGRJGGDVY/gTN0CsAwzrTpq0QutQVL6AfAt5AePCJ2MNg/koet0hu
 1hSwS1X3yux1HlcKXourAMGDCSrT+1OgMhWc5toknWrf0rrq9DTNy26En9VHEt6J
 Pa2V6zjA8o33q5zkUUgPsucXJHvamHZfnA2KrTRS6Zw2uKjRqutulBLfXJn0O5ZG
 iUSCIPR2mgwlx3I1ehTUGMnc17TySWNLNZ88s7LvmUDlx/hVC6KYAEVQWAaOJYnu
 L5VuFIVWKnZdsN+x0WQKgTmPutYpW1EoF4puhlt4NoxK8tSghRUxBPAG6laH2iOF
 6J2LJQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8v9a9hbj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 07 Jul 2026 12:56:58 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c20762d21so50857441cf.0
 for <qemu-arm@nongnu.org>; Tue, 07 Jul 2026 05:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783429018; x=1784033818; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=VvvmWmJavYq8dXZ4FtN4gEOQFPlK04M49xezDDlyUu8=;
 b=ad4AuPyjfIa9T3mPyNIfBm3xicA4SkF+zO8EeFhK6iPIusMjJlmAgXyErodPd4jgWH
 UUJJ+OIOcFprONIjeEp6dBfIbkpFbgMJXElB85g9WQ5vUWLFoGOfw5L6yMxO+Xh7vNC8
 7f01+hpmpxvNjUkaq4KJahs2d1w2NMDDvHSGe9Hs4UfbUKMTh2e6dACA/JYBnZjJhQlL
 cdM31iXjzy5UsBNkMESntPOkAusWm6I770UguzbK5HGS9PdlPtYl6QNlwogXBDTY6ULb
 EJXBZ7X7ZpWN8t+8q+svsUaG9r2qFWUlgvc8vfW7eXbGq0VwDjWaxk1dPGKKTxbsm7tp
 mnXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783429018; x=1784033818;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=VvvmWmJavYq8dXZ4FtN4gEOQFPlK04M49xezDDlyUu8=;
 b=J81tuNrBNw+1M6vMBVIjD1rkPrNz8e7hhl1KeN/ycx6akI7OIXodsMQLW1TN/PF3CS
 +XCc5TkUKWpeA7ytLz4EhlLiSXB73xK6icHqtu5/614k8cW92W6fxvvFxKkrTSyXbGto
 +zuy9ih5VotBKGE/x6r1yJzXmUJxbcqQj8oQ1QJMRR0OfLkae89HbpdLKjp6qTbzP2oW
 aOkIEOuVPT/dNY3jVaEan9wAnXBqwCeMHee515nch7webt7Y4pJLlfef8Gi6GrnVL6Pw
 IdbJWSvUARWC6R6Vni/OEJPNBWHRv1fF3dmJpRCwHeF7EHRi/sAaSF/sBIBgtJi/K3/V
 v5Iw==
X-Forwarded-Encrypted: i=1;
 AHgh+RoIV4/PDAwIXCkjR8rv6rsEgSsT24wReXuBiZ9iSSBIo6AnuySmArMXmHXNDgweAeeRQONNxMbDwA==@nongnu.org
X-Gm-Message-State: AOJu0YwIJShiFxO2/b2W5yipkOmgllBsxg0KfcmhWxG4v0Vbf1SVHwLJ
 1Qn0JTEc7m5gvo3L14QxQEOw59locZ2+fQTCbGn+v/neIGSpVJe5xjBFmusKZ5nJDkk1NGE7qnM
 TsALb2fddFKUZw5qpyS0Rm1ce+kqLpTP+A4/UAsrXg0xeSlivpbBUg0I=
X-Gm-Gg: AfdE7cmEozzRnOblfgT5EmI8yqGdZPYmi8xEbQbzTG+PoNf4v3Y1HgapfHaqu2LO5Cf
 zkrNzhc5Ems2poo5VJOUQYD2uET6rBh6uMjbLXmguuedZK5bAQ77G1AmJ8mf0a2EJEj4X+2h3rx
 sOGiGbjL/C73Ox/TyUJ8Qm09wnsekN1N4pDgZ9Oo9xoj5P7GiTATHfRvXDW0hN5/uoIrK04g01D
 5FkdMKzDQ7tx3fNpDr120Xy1mHz337d25WzNiWJxsuAXIH1ylaDC8QL2bnPMAPniEApD0N8xZW1
 do977w2+edjClyUf/b1Kc/vucuH+VNyFbFPKhJSEmShpya0CKe4ZSz/5tqJFnPMKugvVXWTzeLI
 VbpjnMcBPtowhUZH0GzlRm6ukV6TmlEtNQpNJ98IvshbGOYP285dLqwVv518hKw==
X-Received: by 2002:a05:622a:3c8:b0:519:5238:96dd with SMTP id
 d75a77b69052e-51c748534a9mr53450641cf.41.1783429017518; 
 Tue, 07 Jul 2026 05:56:57 -0700 (PDT)
X-Received: by 2002:a05:622a:3c8:b0:519:5238:96dd with SMTP id
 d75a77b69052e-51c748534a9mr53450311cf.41.1783429017069; 
 Tue, 07 Jul 2026 05:56:57 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493e0ebf593sm57427285e9.0.2026.07.07.05.56.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2026 05:56:56 -0700 (PDT)
Message-ID: <acbdbbe7-c89f-4d42-91f7-b06af4b57483@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 14:56:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] hw/arm/fsl-imx8mp: Add inital FlexCAN support
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-arm@nongnu.org, Matyas Bobek <matyas.bobek@gmail.com>,
 Vikram Garhwal <vikram.garhwal@bytedance.com>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>, Paolo Bonzini
 <pbonzini@redhat.com>,
 Jason Wang <jasowangio@gmail.com>, Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Jason Wang <jasowang@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Francisco Iglesias <francisco.iglesias@amd.com>
References: <20260702184038.178196-1-shentey@gmail.com>
 <519f6e43-5273-4426-b673-71cff44daffa@oss.qualcomm.com>
 <CAFEAcA8aR6GPZWDphbTgPhVf3G=eoNrAFdb9QcLCGh9hdavkAA@mail.gmail.com>
 <f0b42f48-2d4b-4f9d-8a3d-3abc1da411f0@oss.qualcomm.com>
 <CAFEAcA-phDL-y21=mO2yJ=eCPFL9krMBheKyDeep5Ar6K2-wrA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <CAFEAcA-phDL-y21=mO2yJ=eCPFL9krMBheKyDeep5Ar6K2-wrA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1VxDTCojoyxqufs4Z-OLGydafpnp4ocX
X-Proofpoint-ORIG-GUID: 1VxDTCojoyxqufs4Z-OLGydafpnp4ocX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEyNCBTYWx0ZWRfX9jPj0zuBcAMX
 Vvk6q4Z9Q/Y0Rk8dS1Mq/KIUms7HBj4lVhWBYhltcEotyre1AWrLUPeOfcCnz8xpP/n8XI+3XbL
 HE/2NKJPj4Nr0XSMyZJsJ9nr4EcIpjU=
X-Authority-Analysis: v=2.4 cv=b9yCJNGx c=1 sm=1 tr=0 ts=6a4cf79a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=06FarZrhUi9qU8SU98MA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEyNCBTYWx0ZWRfX0tNu1z9JuPeh
 z/6QDazUAx1cvCqlfvdpwYuWCnZ0SG08QnMNg8v54gUqMqJ5UQ3Pprmd9TqPTCZ3F0ucfrifR7C
 bvD9n04DyuKOAtSKO8wvApY2tnARGRxgWIRJYq6dw+PyonUk9xt2DUv4jkQG6KKUDNWXRTB2CFD
 snm+NvdI7FbxEEg7SsMNsUckittYdNhmO3n/Vnk8QjAj4FqtETK/vrVuy147UsZqcHIwTfy4Kb/
 9p4pLmmQ+2LuUTxr4oG2dKXWx7cVbt0v3FkckIC0gil5MP+5LtNQJ7zxYDFuWhOUJognv8XpXFH
 j/QYxNVB0IDDhC+YDQ7QoIPZHqrvlPU4FnwxAVh5HsmhmJ4LqQeqTfm9+n9e29VZT2mrgGNZW/C
 EaX41eTtxjRqr3RPQoqVBsTjs8RliXncYk10/XSlqZlWV9RNct1ndOGuBAFFQGqjc3X+XKaY3nj
 FxWgXTzNdsLL8DUAlrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070124
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

On 7/7/26 14:47, Peter Maydell wrote:
> On Tue, 7 Jul 2026 at 13:30, Philippe Mathieu-Daudé
> <philmd@oss.qualcomm.com> wrote:
>>
>> On 7/7/26 12:43, Peter Maydell wrote:
>>> On Mon, 6 Jul 2026 at 14:25, Philippe Mathieu-Daudé
>>> <philmd@oss.qualcomm.com> wrote:
>>>>
>>>> On 2/7/26 20:40, Bernhard Beschow wrote:
>>>>> Now that FlexCAN emulation has landed in master, let's add it to imx8mp-evk as
>>>>> well. While the real i.MX8M Plus supports CAN FD which isn't emulated yet, the
>>>>> non-FD mode works well under Linux: It is possible to use `cangen` and `candump`
>>>>> either way on the host and on the guest, as described in
>>>>> docs/system/devices/can.rst.
>>>>>
>>>>> This series consists of five patches where the first four are preparations.
>>>>> The last patch integrates FlexCAN into the i.MX8M Plus SoC and EVK board. The
>>>>> first preparation addresses the review comment from [1], and could be applied
>>>>> independently.
>>>>>
>>>>> It would be nice if this series could make it into 11.1.
>>>>>
>>>>> Testing done:
>>>>> * Start imx8mp-evk and run `cangen can0` there. Observe on the host that
>>>>> `candump vcan0` prints the traffic.
>>>>> * `make check`
>>>>>
>>>>> v2:
>>>>> Thanks for the very helpful and super quick review, Phil! Here we go:
>>>>> * Add patch "hw/net/can/flexcan: Wire clock control module via link property"
>>>>> * Have separate MemoryRegionOps for 32 and 64 bit
>>>>>
>>>>> [1] https://lore.kernel.org/qemu-devel/77d5891c-de12-467e-8746-02fe43121e3e@oss.qualcomm.com/
>>>>> ---
>>>>> base-commit: a59157f98f0b69b0bbdb26bc15fbc4d6c8060799
>>>>>
>>>>> Bernhard Beschow (5):
>>>>>      hw/net/can/flexcan: Wire clock control module via link property
>>>>>      hw/net/can/flexcan: Subclass TYPE_CAN_FLEXCAN
>>>>>      hw/arm/imx8mp-evk: Open code DEFINE_MACHINE_AARCH64
>>>>>      hw/arm/imx8mp-evk: Introduce FslImx8mpEvkState
>>>>>      hw/arm: Add basic FlexCAN3 support to TYPE_FSL_IMX8MP and imx8mp-evk
>>>>
>>>> Peter, you just sent your (IIUC) last target-arm PR. I'm about
>>>> to post my hw-misc one, do you mind if you take this series which
>>>> is fully reviewed/tested?
>>>
>>> As you note, I've already sent the last target-arm PR for pre-freeze
>>> yesterday; I'm not going to do another one. So from my POV this
>>> has just missed the deadline and will have to wait for 11.2.
>>
>> Err, I meant "do you mind if [I] take" ... :/
> 
> Sure, if they've been reviewed and you're happy with them you can do that.

Thanks!


