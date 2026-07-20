Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E92C44515
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Jul 2026 09:13:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wlk3f-0001H5-EV; Mon, 20 Jul 2026 05:13:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wlk3d-0001GA-Ge
 for qemu-arm@nongnu.org; Mon, 20 Jul 2026 05:13:05 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wlk3b-0006qX-TV
 for qemu-arm@nongnu.org; Mon, 20 Jul 2026 05:13:05 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66K6RVUK1420176
 for <qemu-arm@nongnu.org>; Mon, 20 Jul 2026 09:13:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jCbbPKJjOip/jxzsUlYPPWRKmJ4stYrRdsFnRWltmIU=; b=JGuETMjGVOKg4TFH
 srgBE3BVppl80U56aHW6c5uecZc1WxspLEdQGvPwgMcnDJh4xvyUG+FlcdY1Vefn
 rKeuZ6YIZZprLtCuTXd6IXNgecQzqQ6/yb6FNPDvRE3/FLkk7R8Idclcnj15UEKg
 mkqD/xmjwzcZZ2Jnp1vF6pxYnFclm0KnpS/A7MLxT/H4OeyEiQxt5qNe7+IXeKfO
 srfazGyYIo0Tjqh7OSieddx7+L59OCs/TNe7C9O5rJ4wW8O3KIHrMCHYtuheAOXM
 C0FvIW8BIlLpnuEHD5eKO8cMszMwpDejAvHmoxx2pGlqHjX6QrDb2p/i6jnHlHc0
 UfBgog==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2s7wgsv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 20 Jul 2026 09:13:01 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-8efe7db1c42so182992816d6.3
 for <qemu-arm@nongnu.org>; Mon, 20 Jul 2026 02:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784538781; x=1785143581; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=jCbbPKJjOip/jxzsUlYPPWRKmJ4stYrRdsFnRWltmIU=;
 b=UsCGPr3pF4DdZrHJoOxNIUuo9A77UAWIZVATa19WMKmNPZdXRxxPYpsc2nlBjd5OdL
 mgsbJbeW26bYD3Kk7+DZQtqgXicJ77LxhDLLBcYxpGxePXM8SSVTWUmGX02wl8W17Y/B
 oBz25uOWtUOpkAom+xI+atLreudYF866EtqldheWkg4VKVtPm1LYmPMuSzUt0og3Ll+6
 q4XIn9o44+fJ7MK2WkvIK+9ieupnNuqehNTXqRIQNSgedk0NcLVhWqUT/7a9SriZ1otQ
 Clb6kXS6SisJYYjg45UW7KwyqklUC5SeVLydEpMgSoh+Z8fCoGRD4HFTovF9jVZpx2bQ
 5j9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784538781; x=1785143581;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=jCbbPKJjOip/jxzsUlYPPWRKmJ4stYrRdsFnRWltmIU=;
 b=P9hoJrXC2SXC+wynXI3xPu7xvbJds7sUOdxkuQ+cQUh7k/LKbzG2Z42DagHBfVkIP8
 Hzu1msd/VXFeJZS0Ahw50Gsnlwke8Vk7mMKrwOhIwDYSwMDwJ9B7c8Y/oGIUPW7ZdApj
 e/gZ/Pdudv8Vh9vxylXuGcIGMjG6FrLeLaQAj3DWybDHeCWHkN9xqaGzIRMi6DkmvXUZ
 QQjuyfh6acVJ623cNb6JKUxOqtv/4qbN5ECjF4Fag72qqLpPTFC/NHmC7OmXrk28RSeq
 zMIOmmf6J/Irw7z6dXw/QmEMyHx4+Sb7wVgFRq5C2Er38ivr55HPMYYrKXO1vjsfEQIF
 Z1ag==
X-Forwarded-Encrypted: i=1;
 AHgh+RpVZUOx9ZL+aWP+3+sTyuF61BMsViaU85jAm9citgC0CVb3EInTZI6K5kbbW5yORe4Rfuk8T6UUPA==@nongnu.org
X-Gm-Message-State: AOJu0YxhX5YZ6G5UF3+MzHKdIB7IS9pHeAUBIZ88sNxk9/sxvEzZz4IX
 So64bwbeG8SYKrN/8sfYqhqez3MJgE61HWBTAJEM8NmBM7uA7qAy2qClmvFpWrGvrbCJr3L8v5G
 1XsqMN+S3nIRWufwyVWRcv8fYCa/dOFYcOHIH6JqEdKOeMKXNi7yJk/8=
X-Gm-Gg: AfdE7cnvjafrKm2SXad5x+wEmHvsf6gh1/Pc1NsPI/N0ICtlnvGLXozmIOnH82p/Xvo
 2l08xBJFT3RM+6r+FmMw0ujWO0Hz93T+ocjzm3UnbZUpPKTKVOlAO3+S3ZpAbJYQNCXT/WN235C
 8J6PD9rJTBfs/CeX34mXczQfhhBARtmItMGdzDyCDI7ps1vFUDaZuhsuGDgarOag9RhxnzkBw7v
 wpHvB1W/6Unk6gSePoTvfzGoA7J5u/OFCxAZNYyzdRddd2Ks2z2qizXvyQLER9KjpIIrD9/TVlK
 fzmQOHJostgXNb5TW/+3ep/M43kTWFP46229ULjuX+zIGxnfHe9wpBpQH54Y3OsvjRJqAe5nqkd
 IPvJOAN8ifoAmfpvtFiFiAej8BkmOnhH23LTbMYLOU1zplbNjnMA=
X-Received: by 2002:ac8:7d52:0:b0:519:dfd7:70cd with SMTP id
 d75a77b69052e-5213e082527mr125466261cf.49.1784538778765; 
 Mon, 20 Jul 2026 02:12:58 -0700 (PDT)
X-Received: by 2002:ac8:7d52:0:b0:519:dfd7:70cd with SMTP id
 d75a77b69052e-5213e082527mr125466121cf.49.1784538778347; 
 Mon, 20 Jul 2026 02:12:58 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49563eee22esm2802415e9.1.2026.07.20.02.12.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2026 02:12:56 -0700 (PDT)
Message-ID: <9c2ad22a-e768-4a07-85a2-01ce1fc14368@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 11:12:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] system/memory: Use qemu_ram_{copy, move}() in ram
 device region accessors
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 peterx@redhat.com, alex@shazbot.org, richard.henderson@linaro.org,
 berrange@redhat.com, philmd@mailo.com, david@kernel.org,
 clg@redhat.com, pbonzini@redhat.com, phrdina@redhat.com,
 jugraham@redhat.com, liugang24219@sangfor.com.cn,
 dinghui@sangfor.com.cn, shan.gavin@gmail.com,
 qemu-s390x <qemu-s390x@nongnu.org>
References: <20260625091334-mutt-send-email-mst@kernel.org>
 <CAFEAcA8xK+t3-prEphtkq-o9UY2mgS6cowhs880GOaxL9dKSGw@mail.gmail.com>
 <20260625101817-mutt-send-email-mst@kernel.org>
 <CAFEAcA8-Un+Q1yBDqLWCLPRwtgTA_VhJqGobgZChrFhAeVfG8A@mail.gmail.com>
 <20260625123119-mutt-send-email-mst@kernel.org>
 <CAFEAcA8UjtXgmPC27fOKMwbaWs2piwGYudtwCNWQHuu3E_7A-A@mail.gmail.com>
 <5faf04b9-d596-4a1d-9fe3-5e9ad5f0a99a@redhat.com>
 <73f79841-8cc7-4ca6-8f6b-fb97b53a6fe8@redhat.com>
 <20260717091756-mutt-send-email-mst@kernel.org>
 <CAFEAcA-O6Z4JrVV0DL_tta6khRyUta_Zz5mJt6OszaW1mu0o6Q@mail.gmail.com>
 <20260717095407-mutt-send-email-mst@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260717095407-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEwMiBTYWx0ZWRfXyWZOMaT3wX3m
 KjV6UDlNBjdK8ga2lH6UtSzRMODUNdTkB6OlFpXpsKXSG526c9XRYQ03VFJcidwDpo6DEOBLT/f
 d1fVSHk38D5+jginQt9zMKoQJ5e0VpGK1P5H/zhukVRQldJ7pn4p4brMgTWr8XuVKG9B4bMCvRx
 taXWoLuxo/LZHwVlIIrJnWaQe1LJELLI7Q9We8SDV69DIlqUb6zmCciHG4aFRGjaFvyIS0O0MX3
 W8Ska+vsTf4npl9Frg6mCCf5hBsm9cRlemZsAbIHfD4EYnOmiKRlBgB60JHhCB1OeirT3W4qCoc
 nTyx5N8IcCmb2DVyB0q7WeClVPGBjZCdddYiw43ev2szFIfNFiouTbJluCcx/TuE0QQcSpO30tH
 mQE8ftpYTd6zyI/Gg21tO4KDizJWtREjxfcWy+3m4o+HlD9Qq5eg4UWoxxhe6i6n3CaJg0Ai3Z+
 mO8h9sx8g8u3jPS04Rw==
X-Authority-Analysis: v=2.4 cv=eKsjSnp1 c=1 sm=1 tr=0 ts=6a5de69d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=20KFwNOVAAAA:8 a=vOaL0qSEioxi9lXWA_sA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: 11OX_Tx_RQnNqt18esoDBtkhToPwYTHg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEwMiBTYWx0ZWRfX2/o10EZrn3kX
 2Cu+DlgFdmW3C+YMOc+lQAESC9gG1fmci2T9OgokaWEetAkAroFJQ5wrqpjCJcpixBdPo8WmKOv
 7XfauOeTU8oEM2vk4qjDj4zrZK4AIlI=
X-Proofpoint-GUID: 11OX_Tx_RQnNqt18esoDBtkhToPwYTHg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200102
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 17/7/26 15:55, Michael S. Tsirkin wrote:
> On Fri, Jul 17, 2026 at 02:49:53PM +0100, Peter Maydell wrote:
>> On Fri, 17 Jul 2026 at 14:24, Michael S. Tsirkin <mst@redhat.com> wrote:
>>>
>>> On Thu, Jul 09, 2026 at 07:52:12PM +1000, Gavin Shan wrote:
>>>> Hi Michael and Peter,
>>
>>>>
>>>> Could you help to confirm if the conclusion is to have unified qemu_ram_{copy, move}()
>>>> for all architectures? In qemu_ram_{copy, move}(), the fixed sized accesses like
>>>> 1/2/4/8 bytes are handled by __builtin_{memcpy, memmove}() and fall back to
>>>> memcpy/memmove() for other sized accesses. It's basically what was proposed by
>>>> Michael :-)
>>>
>>> No. __builtin_ and  memcpy/memmove are same on modern linuxes.
>>>
>>> I'd say as a 1st step, on x86 hosts we can do a fixed size
>>> memmove for 1/2/4/8, on other hosts
>>> *aligned* 1/2/4/8 bytes can do
>>>   __atomic_store ... __ATOMIC_RELAXED
>>> and the rest can hobble along on memmove
>>> and hope for the best.
>>
>> I don't think we should be doing something that's x86-host specific,
>> as I've mentioned previously.
>>
>> -- PMM
> 
> Shrug. Of course we already have arch specific code in asm.
> But we can make the unaligned 1/2/4/8 for x86 host a separate
> optimization on top. They are unlikely to be common.

Note we have include/qemu/host-pci-mmio.h with s390x specific
optimizations in util/s390x_pci_mmio.c ...

