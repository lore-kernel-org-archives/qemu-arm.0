Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017E1606A319
	for <qemu-arm@archiver.kernel.org>; Tue, 20 Oct 2026 01:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MaGsS5c7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BQiuWGq9
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xIyIY-0003Wf-CH; Mon, 19 Oct 2026 21:05:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xIyIO-0003Vi-Oy
 for qemu-arm@nongnu.org; Mon, 19 Oct 2026 21:05:42 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xIyIK-0007Pl-PN
 for qemu-arm@nongnu.org; Mon, 19 Oct 2026 21:05:39 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69K0tE612877818
 for <qemu-arm@nongnu.org>; Tue, 20 Oct 2026 01:05:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3D1D1GLXZSKE+y+P/ov8lUFrEMUIB5IdaIT86yjVn/Y=; b=MaGsS5c73TgnYKEx
 K/zESxpgvGq9XzPFjR2ThdELYIoeJcpqyURzzsFmBe808co5rE+LdYZeJoo+njf+
 TUlSjC7lIA12HFmjfztSIamfVz3A1gW9JhO0JKWek+3XF5fuPyTZVHo4Hb0jlbHx
 5NVW5e6zuALX0IrNQUp3BjwrIxd0D0LhMZt+NfgXqp84By9C/5UevQfCXpxFosEG
 be5mpC8//hpxkxgQfff3xsoUqkmGuyx+XEEFVe96cp9Hc4OrQGRbeF1PC0uYRLxq
 CO1zM3mX6Bw6Hlhuf78ELanbijDY6BphgVBUejStOErMUReSbhpBMSkUpyyLHyc+
 FhTIAQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5pr861-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 20 Oct 2026 01:05:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-934956beec8so582122985a.0
 for <qemu-arm@nongnu.org>; Mon, 19 Oct 2026 18:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792458333; x=1793063133; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=3D1D1GLXZSKE+y+P/ov8lUFrEMUIB5IdaIT86yjVn/Y=;
 b=BQiuWGq9MheWsKVinicNLFKRl0Y5WjWH/0KUhBG+VMhtdmGK315h2JLF7EPQE8mkzy
 WBVLiRRc5cwgZeva1YewYs+Zv/4xdAqDvx42m+l3Whs+mkwbaBg7nx2uZJ326+8ttF/X
 JTgqKk6Kf79hV3dyrCgoTgGeMqfZD8qKuvTGeozPEhIFCjN8wUhss8Zm4kciCslONrTo
 Wm0O4lR7PKDWYWoyXM/k78P5DUVNR2y204NsfR4/hzaCgBFjI2TKjVdRu+729stHJ6UX
 7INKKpTSAGkR0cSgS89wE8nPJpnsiyUikHY+XLiEmw+vN+IKnxOvbOXQN3ZSXh22HNC9
 dJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792458333; x=1793063133;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=3D1D1GLXZSKE+y+P/ov8lUFrEMUIB5IdaIT86yjVn/Y=;
 b=euOts5RC46ZFUfcU5xE1ZQxOLJq0J7S57+JEnfDwShKcw0Qxw/l38ztEfbCwHo9Sv9
 /qQpjJHkIoBJwszQbil2Ag2e72fTqqg/1ZlCfzPeZWqMTTRMpPYJTPr4rHpQ01tFmH4t
 ktyGyeJfZoX85fiXkrf/nPwQyUp2dOPeWigNYukWxZw0/T8sLOHMvwo0hFwo4staSVq/
 Szw93C4DkAVtDC9RRsktFfJpQ3oPWtJ5Wlcpz8FIE72Xp/z3i4FoSmwAiFvBny3AdzpR
 paURpfFNBi/Q5JSk4a7dfmfoNI5Hb55XAbSCHiLB/WVHBVbfo1AuUhWZRR4FeBiATDAD
 dNwQ==
X-Gm-Message-State: AFq9FYIanSbhxXmcvaUFB2cs9gpkD1ss6di/2GZii22faMW5kmwxZghq
 ULeVrBrm97ZNBEPiVAK9fIh/B6Cau5H1uE8Q19zvrfYt7kD/918e8fFGOqAhPjPy64eIyYP45V5
 /ouAyeVs8ACByWltZbX0IofDQASDuNUHVG7NdUqBmZ95vZ2NpJjDJ/yc=
X-Gm-Gg: AYBFou3nBf4oOxxk+odwVJwnrj6phXZkJdko0fPv1hrMXrVWWWd0RN6ciLwubdcBaDM
 26PJV7Rc9L6Tu+jpPZAbDR7oYlCmyHXeid20Q7wSB2ykGX2AJor/SO+yUfENy6ryHN/49pvbz4t
 y+mv5xIwcaTPYcyBmqxo3VbI7s1DUOjgy+eQGjA/yNNoDUXB/XPd39Zbs1E1eN39RdnhHHvsuu8
 YbIVIcAqhyz1esQQ+RNOuspYA9ejVes1q9hOs3XL8DsJjexIuh0BqZqpe3AjvVFOYTp3mvr9YHb
 VKu6ws3m+lGeCVrRsWalkPbveNofgV3Cvh1oaaSclyshRRX2Z6ahY3xT4NtQj72//DzWyhkFkd4
 INTWzmyYn/8veQpBNztuLdQ==
X-Received: by 2002:a05:620a:2609:b0:93e:f5bd:7e13 with SMTP id
 af79cd13be357-93f29d8e1f4mr1602156385a.64.1792458332575; 
 Mon, 19 Oct 2026 18:05:32 -0700 (PDT)
X-Received: by 2002:a05:620a:2609:b0:93e:f5bd:7e13 with SMTP id
 af79cd13be357-93f29d8e1f4mr1602152685a.64.1792458332051; 
 Mon, 19 Oct 2026 18:05:32 -0700 (PDT)
Received: from [10.251.42.127] ([212.136.9.21])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e1d818c59sm2538259f8f.30.2026.10.19.18.05.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Oct 2026 18:05:31 -0700 (PDT)
Message-ID: <de908487-9d6b-48bf-b2ae-3b645d0bec36@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 03:05:28 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 16/32] hw/pci-host/aspeed: Add AST2600 PCIe config space
 and host bridge
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-s390x@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Marcelo Manzo <marcelomanzo@gmail.com>
References: <20250929165230.797471-1-clg@redhat.com>
 <20250929165230.797471-17-clg@redhat.com>
 <CAFEAcA8OKABUH8S_F4HrWLKDC9XYqWGxD5_xMAPOPmc614u4UA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAFEAcA8OKABUH8S_F4HrWLKDC9XYqWGxD5_xMAPOPmc614u4UA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DrrDa2/+ c=1 sm=1 tr=0 ts=6ad6be5d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=/bviTfK1dmy+WGcHzWQ0gg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=20KFwNOVAAAA:8 a=V2NxCb60AAAA:8 a=pGLkceISAAAA:8 a=pMHeIudtPmcNLvVDoDMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=3L6qF29SlnrayQqPM2jZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAwNCBTYWx0ZWRfXwm+RthgHsPXy
 DmKZ56chl4zJmf6YWi4/AMhZQCaDPBgx16hAyqJuH5gyARlyfd0872ZTMaj0jsWKdprv9iLM2D2
 vNYDJcf+crEDyc6BpsHpBlp5qvmUvYllGu01glopW0IMKRhL6V4U/pYDF/OecHblBVAsvs82OFO
 tJ+ZzVnh3RkXDtnEFR2xYIb9YuowcIuJazj+dIOg6yyrNKrUk+0JgLNXCW6GzVv/dJlDT7a+f1z
 aHydb6pA3ayN6Cm89izuJFa09E+CZxzeczKgoxf55whJppcV7lPYt+gj5XbNQEvPbFMojx7jDaU
 7aqf9m8meA7WE6V/DQC28lw9S5oaKurBGV+M0k9U9J73Eegu7scAn0k4OoOShSixmco1K9doSYn
 rXVupl9Ux2nrgZiUuJlx2Js58ek4qjs4Z9MlODSogzv+A0aaofbczz9/tg+Fkbnk2fyGq9xn0zn
 OVlFWZPYSq4/fylixbQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAwNCBTYWx0ZWRfX7Z0e9FFPuCkp
 PAltUNjP4KP8RSjlxRSEu42nvBLcA03ug+IGQ+Hf06RA09sDcivx0WMa7yhwzqoYXW3dCf6ronu
 y6m/E56Y2C2V+BGb9Yto8uOm15ApUW4=
X-Proofpoint-GUID: qfQWldduwi_1mBph2h8ZByAUumVvtojH
X-Proofpoint-ORIG-GUID: qfQWldduwi_1mBph2h8ZByAUumVvtojH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200004
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On 2026-10-17 17:44, Peter Maydell wrote:
> On Mon, 29 Sept 2025 at 17:54, Cédric Le Goater <clg@redhat.com> wrote:
>>
>> From: Jamin Lin <jamin_lin@aspeedtech.com>
>>
>> Introduce PCIe config and host bridge model for the AST2600 platform.
> 
>> +static void aspeed_pcie_rc_class_init(ObjectClass *klass, const void *data)
>> +{
>> +    PCIHostBridgeClass *hc = PCI_HOST_BRIDGE_CLASS(klass);
>> +    DeviceClass *dc = DEVICE_CLASS(klass);
>> +
>> +    dc->desc = "ASPEED PCIe RC";
>> +    dc->realize = aspeed_pcie_rc_realize;
>> +    dc->fw_name = "pci";
>> +    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
>> +
>> +    hc->root_bus_path = aspeed_pcie_rc_root_bus_path;
>> +    device_class_set_props(dc, aspeed_pcie_rc_props);
>> +
>> +    msi_nonbroken = true;
> 
> This sets the msi_nonbroken global in the class init, which
> is run for every type compiled into QEMU at startup. That means
> it's effectively forcing it to 'true' for every machine type,
> whether it's aspeed or not.

TYPE_S390_PCI_HOST_BRIDGE seems to do that since 2015 in commit
8cba80c3a0 ("s390: Add PCI bus support"); why isn't it an issue there?

   1652:static void s390_pcihost_class_init(ObjectClass *klass, ...)
   1653-{
   1654-    DeviceClass *dc = DEVICE_CLASS(klass);
   1655-    HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(klass);
   1656-
   1657-    device_class_set_legacy_reset(dc, s390_pcihost_reset);
   1658-    dc->realize = s390_pcihost_realize;
   1659-    dc->unrealize = s390_pcihost_unrealize;
   1660-    hc->pre_plug = s390_pcihost_pre_plug;
   1661-    hc->plug = s390_pcihost_plug;
   1662-    hc->unplug_request = s390_pcihost_unplug_request;
   1663-    hc->unplug = s390_pcihost_unplug;
   1664-    msi_nonbroken = true;

            ^^^^^^^^^^^^^^^^^^^^

   1665-    device_class_set_props(dc, phb_props);
   1666-}

   1668=static const TypeInfo s390_pcihost_info = {
   1669-    .name          = TYPE_S390_PCI_HOST_BRIDGE,
   1670-    .parent        = TYPE_PCI_HOST_BRIDGE,
   1671-    .instance_size = sizeof(S390pciState),
   1672:    .class_init    = s390_pcihost_class_init,
   1673-    .interfaces = (const InterfaceInfo[]) {
   1674-        { TYPE_HOTPLUG_HANDLER },
   1675-        { }
   1676-    }
   1677-};

> You're supposed to set this in your 'realize' method, so
> it only takes effect if your interrupt controller/PCI controller/etc
> is actually being used.
> 
> Reported-by: Marcelo Manzo <marcelomanzo@gmail.com>
> 
> thanks
> -- PMM


