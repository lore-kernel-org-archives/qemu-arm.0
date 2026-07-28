Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F7BC54F4D
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 16:07:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wokL9-000363-Hf; Tue, 28 Jul 2026 12:07:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wokKx-00034k-O1
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 12:07:25 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wokKw-00005Q-9f
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 12:07:23 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66SEcafN3063153
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 16:07:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /kBddwE9A/q+32PbVmaRc7Bba85gNUy44J3/Qjrt1QM=; b=YwVMG4/+obgk6wBn
 Zlr4VBAMJ+AxJDavKZxYHtJnYrgVHqPHWkexBPymujUoOpXrX99j6gGyX7f+1OqC
 MUsLjxfdLvbJtOZ7GsfKpx32X9GF1OnC+91GP+EOrCyXi1Qq9QFmPc9QtSaQQXPn
 Rkj87HWTkhfa17WI7p0pxKUBlACNlCN2MGUT6fc9k3hegPP5bP3rvoRgfdwqFuni
 JDi/OVB7q8OafUVZw760diJJ7/X3LpPfL1rfqWgtED2nyt6QaxRgmtMHIagqxX3k
 OP+3iLfGQtDJ9EP/TdJazoUMVHyMyqHzMDEx5Nt/I9A28GPIxhlvW38oxtMmP/pA
 01J9pw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpuyg9fm6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 16:07:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-526da7e3c9dso122251cf.1
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 09:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1785254840; x=1785859640; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=/kBddwE9A/q+32PbVmaRc7Bba85gNUy44J3/Qjrt1QM=;
 b=HvdgMG+znJB+9OO3gcK1n2tR2LGJvWZU0EFVfXaie7+gYj8kYWTjXpMJeR4tKyXzL8
 P1ho+LkNfR17JDjMvNYTccDc8XD3sg2z1Uvylr5wSL1mLdMCAhRw/z574Y1Kqhu9OzIs
 38RnkDSX7GuluL6fbPP7CIBKODhr+DqPxKXmZ9dFg/WS9WHi1243CcVacW4YiVHfzHdy
 1YNw5DZKzC9rKvSZSpSswCkj5f8ByeEkHKRq3Yq32hu54G5PY52MdoPCi2vdJghe+BBS
 YClaK7RSjgf4YLEPkEPpRwE2N3chIZe7zgugjHCdcTYuFKb3zbDrXOeIJ9+97VyId0li
 4ihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785254840; x=1785859640;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/kBddwE9A/q+32PbVmaRc7Bba85gNUy44J3/Qjrt1QM=;
 b=MjMrCp0wbpxji/VEbbWagLjVPMUkLOdpli3odAm//aSu9ZoLImLTyT5raZ9TVs+aa/
 qi9U+QEYBVtDZzyzAEAnQ90At3nv2s8fnTveGezFbkIIxz87edL5R2w3PjkpsYVi1Jtn
 Je2B2qNl7eprc3nE5EVKrgdKbY3rUFRqClqRM4/AyTo7crK4ROnR+yFq5FY7DChk/Tzd
 +pxwDGUHoG/6mUxHA3thWCadeD41obV7hRJj1CNM+dycNwIwYRndHPCGzU/S1MXPYxex
 hEvKx8wCfDiEE/j0RiO/UEEbA9lp5BawrIYdFMpCAKQuO265kOPSiI3WJfj+f47Yq1AE
 zkPQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpjUHncixpyT8Wyc92nRQlYy4a5FjHDyiY0XIDlxM73TdmKWJbAuobbS+JQ8PkD5RNdlW5imC7HQw==@nongnu.org
X-Gm-Message-State: AOJu0YxEzXTtChzki9TdOO22+OE1iiItaLH/6Z27DnO4dZg91aaEbd8f
 L1/hWvHi2sJH0EfLV8oaVCJyROLxGksVLgE2EawoQrAjb7OH5x52euG1sQaCVSC+oiKzI44Xcd/
 WOxoT5iaonxjzL94nR36HS9O2NORcPYDL1dfrW7fSYJFZTSu8UC0kVF0=
X-Gm-Gg: AR+sD12+B45qOaKJeZ414BrxlZECAMUNd3Rtgw+9SGUbLSspzaouNLJnT0rd2B1eojW
 NY+RLenRZ6mReCBjnIgjKRD7k0X2aGzhWyVhUimyCtlbKJK+gMokSOiL9bs7vZ5FELbGfwrTDoN
 /zANRcGiuiETWMcofhiST6iwOQwti4SNZKF7uuZE1sfAxZrY+oXXCQHMHAOHBRPQ3rF5PavXOdd
 zpkGMvU+ELcu7gjbukBnd+bcdYWHzdhwVQFscSUwiuOGAhZFtaqTBXN8pOZHUcyBPFfTHIxXDzl
 1w0rR4fnspaKK9PAWwDxqmlnS5sgxVbxNPYzrja30Bg/VwqEFcRYZFzWEaFMhUQ/3RQFY10XlZ8
 BVSRBJWbmaJIpILlJA3S1vZhwbUjtSViFb6fBUbaRezUuTfAp3Rw=
X-Received: by 2002:ac8:574f:0:b0:528:601:301e with SMTP id
 d75a77b69052e-529d6feab6bmr26293621cf.26.1785254840092; 
 Tue, 28 Jul 2026 09:07:20 -0700 (PDT)
X-Received: by 2002:ac8:574f:0:b0:528:601:301e with SMTP id
 d75a77b69052e-529d6feab6bmr26292581cf.26.1785254839257; 
 Tue, 28 Jul 2026 09:07:19 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-496c45c297dsm85949285e9.7.2026.07.28.09.07.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 09:07:18 -0700 (PDT)
Message-ID: <fb08095d-b70b-4565-95dc-a328afc6b04f@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 18:07:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] system/memory: Use memmove() for directly
 accessible regions
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, peterx@redhat.com, mst@redhat.com,
 peter.maydell@linaro.org, richard.henderson@linaro.org,
 alex@shazbot.org, berrange@redhat.com, philmd@mailo.com,
 david@kernel.org, clg@redhat.com, pbonzini@redhat.com,
 phrdina@redhat.com, jugraham@redhat.com, liugang24219@sangfor.com.cn,
 dinghui@sangfor.com.cn, shan.gavin@gmail.com
References: <20260728031731.286666-1-gshan@redhat.com>
 <20260728031731.286666-2-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260728031731.286666-2-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: QNQk5CwzSBLCnqt6eKD2bMuMMqFCYuud
X-Proofpoint-ORIG-GUID: QNQk5CwzSBLCnqt6eKD2bMuMMqFCYuud
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDE0MyBTYWx0ZWRfX+/6uL2F/CrhS
 +ZyWPHdhkg4X3p2X7a0nERt3qqsZrVDE2qCEcXBpe5dn7WLIJhx6KE8MY1OltWBiBZrVRewrTl1
 eSMqFdif404PwN/uQpcCmugouiAQ/2hevrWJUzAIngGgMmIj3KvQEMXqUbRz6N11qSJdup1qDyi
 8S6MNjAhoKhVvnmDYj9v0BFvXaJbUGBI8XA3Gub8VnGOQWynkh0uYuMEMt+sNO2HqXa+d02gGYa
 rbIu4zZ/ULMuwye4Mty9sZfZhZt3Wy6CUqyv8VzmJttmnuGshUb8iQ9ERBw2/hTvm0EFnEXfyZF
 fVWqlf/e3N3J0HN2M5wXvdypdSZD+SHh5zMbRz6E+BlEagY6bnVPE4IWoaLzDpEIWS2E0oN/+oU
 rNMXWeaF5YmVBpt/hy1SLCtkNN9nuX+URXxqF1DxV1InBjEZMFw21WENw5P5VvUPbUZVShP6xUH
 iZqKsswkCiqFxUcAe7Q==
X-Authority-Analysis: v=2.4 cv=aoWCzyZV c=1 sm=1 tr=0 ts=6a68d3b8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=20KFwNOVAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDE0MyBTYWx0ZWRfX9wbvWyCa4EY2
 u3lYWDThnUmEXn409aGaOty4NHH1QL//ickw1oy4dt9MpbGon+OdA3vk5ropNcrk8tmOzccxReW
 SgqgDhGBiJW73P7EiO8lQfPqyDljJDI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280143
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

On 28/7/26 05:17, Gavin Shan wrote:
> Similar to what's done in commit 4a73aee88140 ("softmmu: Use memmove in
> flatview_write_continue"), there are more sites where the overlapping
> source and destination buffer are allowed for the directly accessible
> regions. Use memmove() in those sites, listed as below.
> 
>    hw/remote/vfio-user-obj.c::vfu_object_mr_rw
>    include/system/memory.h::address_space_read
>    system/physmem.c::flatview_read_continue_step
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Peter Xu <peterx@redhat.com>
> ---
>   hw/remote/vfio-user-obj.c | 4 ++--
>   include/system/memory.h   | 2 +-
>   system/physmem.c          | 2 +-
>   3 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

