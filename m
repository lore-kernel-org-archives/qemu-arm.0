Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29DD8CDB479
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Jun 2026 13:54:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wckX7-0005ur-UY; Thu, 25 Jun 2026 09:54:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wckWx-0005u1-Ax
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 09:54:13 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wckWu-0004bQ-O4
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 09:54:11 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65P9jvdr2046649
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2026 13:54:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /WH7UshnOrfIRJDUf41OeTx4PaujKVXzQwq+AzFUQ1w=; b=Sia7T5HkxS7Nysi/
 vHzELYNgOcT1e3x7tfhbMVvXeoeNJpta65M2U1z/meA7P9O39uw2oVPRJAnS6glm
 JZsdIiIikb5eShuI3mlLY0M1eiCpE842+mjeY6My+fIXXg6EKftf7hxkWBbfZ7mi
 6J+4E/PnJUqirH4Pll/6W/s2d6k+YgdhrNf/OsNqxQPqDj7dnnfIZnxMMPWtC7YL
 KWDN8TvOhxsHso0dk7oH2QPpFlBwVGnNOybmqngB284G+DpgRIWb/+UQY6JfU2q6
 f7kMfjeeQysiPRKEA4jKwzdm5qFawcy+qrhofGtm1HO808rcxklla8TBXErTelGE
 K9jxHA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0uyqjbsh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2026 13:54:06 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id
 71dfb90a1353d-5bd742a407cso9194e0c.1
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2026 06:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782395646; x=1783000446; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/WH7UshnOrfIRJDUf41OeTx4PaujKVXzQwq+AzFUQ1w=;
 b=Qj9R9zyFD4I1Amcryykb5ihBjRoIFevChMQ9ndrrM2pqoyWdHIWipAK9GNH+ORpyNR
 G7jI7bEcvVtF7SuzbdpzAdhvyTKubDxNhYnxcaUni1WuIPpsg27m1XxqdxGWl77ukss8
 MH3rqsXOVgWIP+YyFAWiWM8yBpCkPI0qTLY+vcaD9KOb+IJsDYfjX2Z+LqBXGo8FmrIJ
 EjjmrYjYZzB/QCxSK7B0l7Prx1ddB0Oz4t3iUvH0KZZB8R5j5iED0oDJ09DahHabzUvS
 TFWoUK25UF9XhIz9WvQ97cKrFG9cvTvvKla2zhjUnujguqGOIhc9J5ucMfSAaqxadM9o
 ylAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782395646; x=1783000446;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/WH7UshnOrfIRJDUf41OeTx4PaujKVXzQwq+AzFUQ1w=;
 b=aSQrh5/1V+fRiOz5o8WDd7VeQWqUgL4P5YZ4xe2/wmTAKQ0lUHKhRdiyg+RmRIxv/M
 zAHlBqB02KsQK2rhUMCaNLo7B5jldqAj86FAiFKsV2H/GoxweQLkI8HFZDeust6iIMQP
 Qy8a1pfFnOipwhBWvd7OgXvRd5s7v5P4SML1v0SB6Sxsi/SCjpDnQitsLTYw2kxDdSrD
 K8+oaPAm6+Xc+bS7xmknJUg65bFcOF1Ue/2c4DMsEuH1hM6lzLQhJB4llNyEcxuXsXjz
 FRvn+ARd355UsjqkuH85+hEy+E+0/eWAHUL/D8U9/HmsFKd0xmPT1UYwbGgeCQLLW8m7
 4RGw==
X-Forwarded-Encrypted: i=1;
 AHgh+RoVXjlGZfmR0+3W1ODsBCclF7Vihrxq+BMlP3WBKv97hHvEABwftkRVvqcdlmZ0hNYFfJ3JdXbP2A==@nongnu.org
X-Gm-Message-State: AOJu0Yyl8HZLImLzekhi+5obUoeo2kj3tUcxIybn/oy6g6uIUNu1VyJj
 UbjfjPdwPsBSu/gdR7DGTFK7vnILipTLvDKZb1osMOW1Z2YVoC40UDUBGiiq5z2nY2LNmSWqL2w
 66+H5vzjWD6CBBv+x+GyeEJ7u7tlzxyzcL1o8lNG4lV/mfcDXaxqqObc=
X-Gm-Gg: AfdE7ckh+T+EuIA95EB78ESlDim1eKPiXUtPhQiqZSY4re9U3J6pXz8K9Z1tgUVGBnT
 Br7QjejY77Q2Geg6RFrWZ8VBmcZdCrVA5C+Olbivc8kG984mxR33r3Br0JFmJacHTIzdNWdVe4d
 NEMWK0BV7LGhIpTUb+HbRhNeRwDigI1I0tKFwRS0Dvu4p8dw2DRCv7NSIcHRGPK4YBxoiFeSRyW
 rUaraWPfBxj7PLYhwRNeSVlo5Q7aatSTPjuNxSgLJlnH+3yRkHyOTLa/8JZHtIasVOlk7FlhBjn
 Le6rXv8wsAICs5EO4XFvwlJ7wphCsa5slGSOHTonUbmwX3vhs0ycwTKuT0fe5gICCjUh9OYaWSA
 lHle0IqVGDuuq4Ndng+RQVe3JpNNCz9Ut34pf1wgkarYWtlyOqhcrVwDHu2AKGw==
X-Received: by 2002:a05:6122:469e:b0:575:36c4:8900 with SMTP id
 71dfb90a1353d-5bd69e5f0c2mr876610e0c.14.1782395646006; 
 Thu, 25 Jun 2026 06:54:06 -0700 (PDT)
X-Received: by 2002:a05:6122:469e:b0:575:36c4:8900 with SMTP id
 71dfb90a1353d-5bd69e5f0c2mr876599e0c.14.1782395645390; 
 Thu, 25 Jun 2026 06:54:05 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3999b1b1a7esm43572501fa.40.2026.06.25.06.54.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jun 2026 06:54:04 -0700 (PDT)
Message-ID: <2ff8fdda-02e7-4fff-bde9-ac38f14766b5@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 15:54:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] vfio/listener: Fix translated_addr for
 non-identity-mapped RAM sections
Content-Language: en-US
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Cc: Yi Liu <yi.l.liu@intel.com>,
 Giovannio Cabiddu <giovanni.cabiddu@intel.com>,
 Alex Williamson <alex@shazbot.org>,
 Zhenzhong Duan <zhenzhong.duan@intel.com>
References: <20260625134352.3122572-1-clg@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260625134352.3122572-1-clg@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: veOdG6kPXc6bl9jcgj_2u_dPplsrR-FF
X-Proofpoint-ORIG-GUID: veOdG6kPXc6bl9jcgj_2u_dPplsrR-FF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDExOSBTYWx0ZWRfXzqd5B1/nblVy
 an24lT0RYfnedafDy+WC6HyfjOqWZ9QjIu+dgu7MHs9rbyIen0MRtgJM7RODWdk41X7uvUyeMgq
 NhTHmWkdQ8lEzAey7NIkWN2fxSUHI6A=
X-Authority-Analysis: v=2.4 cv=EsLiaycA c=1 sm=1 tr=0 ts=6a3d32fe cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=QyXUC8HyAAAA:8 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=IzprnItKmiORxGrvkw4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDExOSBTYWx0ZWRfXwHerIZFPmHzR
 MJJNTP5JSAkIGNm5fzaDAXJyKY/SzD4Fuz6iH7iGF5myvwwOUVUL7LZN9yMdJVh9wClHQi/8sbv
 kNcoG5zY3ou1l5vpKZX3uFfLOEv/usWW/vvT2DLBbfVJ0zHe5Wa4PBP8d7sFy2Vu3aTQZffYLAc
 MCFKmv9GhNBbkARfc9eXqGXCZCMiJua2/Tm1jnGy3XPaPvn/xH6mM/9nOjIRObaAcVk8xzGzrLY
 3ojaWzz5SAN9aWKtfrp10WBAtvia1I2k6hx3Z+kwDIHvyGVNlAU0akl2lTl/j18Q6lS9Eg4+S87
 UPi5enqPTnUpoTlT5oY5kFgAjIf4t7l1m+TPJC4FoFBqnG8KVqDgFPOg6G51zoS7vSW9ZM6QYgJ
 yrJawXwecuSWQTXOnPfbqpuqXBwhosjYPze2I6gg0KMbm7Rq9qKPsxHLg/Q7KRvj6K8WE2vYBQf
 g8Qfb0olBi9hkwkrxqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250119
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 25/6/26 15:43, CÃ©dric Le Goater wrote:
> In vfio_listener_region_del(), when dirty tracking is active and a
> writable RAM section is deleted, a synthetic IOMMUTLBEntry is built to
> flush dirty pages. Setting translated_addr to the IOVA (GPA) is only
> correct for identity-mapped regions where GPA == ram_addr_t.
> 
> For RAM sections with GPA far above main RAM (e.g., nested VT-d interrupt
> remapping table at 58 TB), translated_addr is too large, causing a crash
> in physical_memory_set_dirty_lebitmap() when indexing beyond the allocated
> dirty memory blocks array :
> 
>    bitmap_set_atomic(map=NULL, start=1, nr=1)
>    physical_memory_set_dirty_range(start=0x380004040000, length=4096)
>    physical_memory_set_dirty_lebitmap(start=0x380004040000, pages=3)
>    vfio_container_query_dirty_bitmap(translated_addr=0x380004040000)
>    vfio_legacy_dma_unmap_one(iova=0x380004040000, size=12288)
>    vfio_listener_region_del()
> 
> Fix this by setting translated_addr to the ram_addr_t of the section, which
> is consistent with other vfio dirty tracking code:
> 
>    translated_addr = memory_region_get_ram_addr(section->mr) +
>                      section->offset_within_region;
> 
> Cc: Zhenzhong Duan <zhenzhong.duan@intel.com>
> Fixes: 6e360c06176c ("vfio/listener: Add missing dirty tracking in region_del")
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   hw/vfio/listener.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

