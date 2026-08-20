Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD80C5DF81
	for <qemu-arm@archiver.kernel.org>; Thu, 20 Aug 2026 22:23:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wxBAX-0002tn-R3; Thu, 20 Aug 2026 18:23:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wxBAW-0002s7-AF
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 18:23:28 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wxBAU-0002V6-Tf
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 18:23:28 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67KK86oQ4031149
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 22:23:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 e460GvWzSXUhTDft5mbQbZR/FHWVg/lDMMLAVt8Hsh8=; b=a4zQN1uDDtoBDhGm
 oF0k+rtX3DMr/Bf9UzOA8gWdRdV5lCCvTf4wY7ax5sMX/VgAO41D6FlR8xgAhF0Z
 MKeJOYL5CVlzCa/h6S5dfQBJC2viyjLGOBZXNOiPYb1sD79Haq5oBUdQlfkG3yxb
 UVOb1NNizyKXtZktg805KQpZkRxSPMXth8e0KUiqf6n/si9A9tQGmgGLx5YDT+f2
 L09zAWipIqwp9uubEZTSa4Ods/BUkTdDwuqMDxDYB64QLWKuIvVykcgsXHg/V5b9
 nLL8FJ6nEf7ZnH8xSWp8AEpPLMqaOwEmEbOjJT4/eOz/2gVbUJhl150TZpCepDLY
 uTvxBg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xbvbfsx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 22:23:25 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-38f283baf1fso404624a91.3
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 15:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787264605; x=1787869405; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=e460GvWzSXUhTDft5mbQbZR/FHWVg/lDMMLAVt8Hsh8=;
 b=IL/lGEtEgk0oh6BmsLQ6zk653/fM9jcpj1eL0ltXmUlXqO+dA6aKzFPBxH8y+oA9vv
 +aHbL48PIbHi36QNIUupW9+yD8nxeb5orGOShyV1tB/j2xxKBYYHQ3B1oAmqsjUpu1wn
 cam6CgzOWm7IcaFv56ujfIt3AtlVAHkMR4Qw/YaZE/ocjBHIENgwhQalq0oiwmB7jPCw
 qIHbqVzPQeWqO0tv2TH5X4wHIOtLsCT4CdRNDhiMAjhjWLC0D7+5ztT9g5HTR7RVwkIF
 DHFxIkShFsXiO9U/Aa/l21yXFKYQF8YoWYOUThVQhwthzc2rr80EeegmY8W4lRmEcMXB
 AEgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787264605; x=1787869405;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=e460GvWzSXUhTDft5mbQbZR/FHWVg/lDMMLAVt8Hsh8=;
 b=OH54Diq5S02t7ZAZN4EN8UPXZRLBDtNiDR/SI2t8RSV6Zn3Rd+fBHVvxu4MX5zR8Bn
 JXhTfIwhluPAaD9plVV2fQI8eFCcKZ60Zy8mdehmltWNY/tJLqh9+GRoGQljf5JCFGU1
 fnmt4Vg1Y6azRgw2kAl7gIgnI5rzJmBTaBKIKa2KS2OwLUiLYJBHY/cr/h5j15a5QmzG
 u9r8TUsrZzhOC5eOcYMgKTOftUKoYk14PNQYd+w0O2deG9WIHrqhT2rlrT4ILgx/hf3L
 Pr14sESgvEPbDhd5yA5BElf7L3Tw2fQK9DERbYZQp2VLZ7X+kb4eTWcqgRPJQiLI14DG
 sOlQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrDVRBHbgL3xqN91GguJRKDsoOcXDd+YkXH3Xa3ASfEnGjhmkssr88t7XBgtjr5zWcI8zkiSsTZww==@nongnu.org
X-Gm-Message-State: AOJu0YzqHLIU0NVLlTws/piFH+CluEP8aPakmWfiAvPpf4gxVZITxnEu
 6JQ9zzmVq8OQgP00IFZqLgbHqObAPRRD3p8wvervvhVNC8DRoGkVcDrR3y2bSQovHWeW8wsDqGv
 g5zVD9t4zzSyRr8+BCvOErfPFGDQnNJm8HhkftjReGeU+7eK1J1q27o4=
X-Gm-Gg: AR+sD113Uvqs5Z46T5oIyPqH/j30KRQDt7nxWoBN2PVB70U9Ip5m8QFeKxaFNfcDw3D
 aIfIMsdHJ9cI+ECj6ttJKqpRtqRuSnSrdNlVxA4D9NKD3ldxj9OdpmR9OU7JEdicppJNfl6k6du
 +KXRXtqKvsxIudarmp7T87i4EA5f7gmjAcfd8TQEh6ZuKeRxYGJnO18Wox+QP3vlWDdEJZ+QnYQ
 j7KerW9aMu5aETyO6jRx0967DDNPK71ed1fXgLXx6geVL78l+d2S9EqWQShdJBeEFmAliOUA8QI
 E9FYWYFAi+H9ozGfk55+M807bVwxdE5jLuqp0ZutIAS+v+Zan5HhlgdQlh9ZIHdr1lZakgK/+9r
 LUl5Q7olqq3+LSoLxHglzWY0t6TLzn7nU06p3bQws4+rd7nhKTPoeN5r4uy3saS2ivd87
X-Received: by 2002:a05:6a20:394a:b0:3c3:9df0:2d66 with SMTP id
 adf61e73a8af0-3cd2fe31c5amr2747364637.6.1787264605051; 
 Thu, 20 Aug 2026 15:23:25 -0700 (PDT)
X-Received: by 2002:a05:6a20:394a:b0:3c3:9df0:2d66 with SMTP id
 adf61e73a8af0-3cd2fe31c5amr2747305637.6.1787264604651; 
 Thu, 20 Aug 2026 15:23:24 -0700 (PDT)
Received: from [192.168.1.199] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-327bef77fc0sm36588912eec.8.2026.08.20.15.23.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2026 15:23:24 -0700 (PDT)
Message-ID: <82cb8274-7195-4402-86dc-0dd0ad9050ff@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 15:23:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v5 25/28] hw/arm/smmuv3: Reject IOMMU notifiers for non-NS
 devices
To: Tao Tang <tangtao1634@phytium.com.cn>, Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Mostafa Saleh <smostafa@google.com>,
 Chao Liu <chao.liu@processmission.com>,
 Jim MacArthur <jim.macarthur@linaro.org>
References: <20260813161515.2788900-1-tangtao1634@phytium.com.cn>
 <20260813162624.2809349-4-tangtao1634@phytium.com.cn>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260813162624.2809349-4-tangtao1634@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AMKAkK6n c=1 sm=1 tr=0 ts=6a877e5e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=fgrLqfBXAAAA:8 a=EUspDBNiAAAA:8 a=vGvm3RNWxNDA6kgmdf4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=_Ge82aPy-h_wFa7gWU4u:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE2NiBTYWx0ZWRfX1NGtZeInhTDu
 +aRjPb/KWqOkyNUSRzbbfs1/s+quxPY1C9iblC3zBxPvIQHDn5x849vNwgfV0Ovov+QkxW+V+Iu
 cUmjCODQz+dVuhDpOddYgfxAydxC6wEa6enjPvV27JoP1gsNM0bfA/lOe8wDpu6R2zTS0ZNYL4f
 Z4nTFh1fgx/bZE3uno0+gr084rzKc3C6BrDGFbYT1fVxfRQCU+eSIrYzrcqq1e21qEUokRxbO3d
 WdYB63EFonxYxg3oQfMxD7xyMrvQ3pdHOzyogyPMl4xJSsEoRsz5YbHqzrwxkEzL1jDpoUrL+e2
 /RycdgJiLSvydTYGj54Bt1xHeM3bLWD1DwVvP9t8XINw8GiJLjv99oTc6l2nqWv60RV39AIMpKV
 IB3ffKVq0+0QYU54SwpBd1D7qqYVBcxJ220gdjmrbMpxEe0NFf7v+rVspDZLD8AAZ3TD3TJUUHV
 rUyoy8cj5l6i1vWHRLg==
X-Proofpoint-GUID: dt55EdxFf2gS0_mO6C0KxduH9tCml9uH
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE2NiBTYWx0ZWRfX+lku79GkXQdD
 ds4byTt8AILl00m59UWhRYFgBHPvmDOKiSzrC6oiNZeOWkdmwwEZuocizKznheDY33s7IORA/FC
 8aEu64GVk0Faeh/OLMG9WTuM7Ra/6ho=
X-Proofpoint-ORIG-GUID: dt55EdxFf2gS0_mO6C0KxduH9tCml9uH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200166
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
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

On 8/13/2026 9:26 AM, Tao Tang wrote:
> VFIO and vhost IOMMU notifiers currently support only the Non-secure
> system-memory path. Reject notifier registration for non-NS devices
> instead of allowing an unsupported configuration.
> 
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> ---
>  hw/arm/smmuv3.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

