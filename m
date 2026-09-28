Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A639DCA5FA2
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 19:11:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBGlS-00010y-W7; Mon, 28 Sep 2026 15:11:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBGlO-0000zv-Aj
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 15:11:48 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBGlJ-0001nJ-6G
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 15:11:46 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68SHwUvv1941044
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 19:11:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 noXi+LkqsQh0kWWpkaXUVI5QBYODwErkMjSelrhWYLY=; b=h2DV2rw6RQ7RdiPo
 4EIItDp4xDn3k47JoY0cFKL3BxBg8kqK2Vl4HkE/8YvVZ7zcqiwOAwy5jCyjSRsc
 rY0R9xfu9/377T0xRF/uGJicRkv72Kl6YOsyyaqpuE6QoP3TQzRMSktz5FVMHz5k
 aU6Xb6rvmLthopPr548M035o9H8Qjhjc6+wer8DOu7Ruxse6aq4NSxPwzoQQXpkq
 4VGMMxDFO9wgpn1H73xO8kTgJeBQ4mU6tECKfhhjsg615YUHzs9JWnBPgno9YhHI
 4uVF1ZJlTLhBiDusE407PeRg8HVovuzlqmdpm7QWemjmdjPXJdRr+u91GLVSpXnB
 +C9EJQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyk5mtytc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 19:11:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93c673116e3so389143985a.1
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 12:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790622698; x=1791227498; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=noXi+LkqsQh0kWWpkaXUVI5QBYODwErkMjSelrhWYLY=;
 b=Rt0Z+MXRK4bM6wxxR/AMFXvN0yvBQii0lUycPb2Z1jKwupJuO7hZtYgzdVe4dKsMcF
 g4dcFboqZXgX9tRSxj6xCSugiOFDLvj5Y5H6kS8v7RQwdnqxOk1isTN0keLRzVN+9ZZr
 Zpbs92XDhh+2i+BnmRG0unoETbQ4Q0h4Oj8lMjoBZQIdI/SPqvb1zMEDNGLDyOW/pnrW
 6CHX5xtgc2JltxjmaLchkWs6d1lyG32khBHnn/SEqSol9G5q1BsMu+d6rmW2n0AV5Qg0
 EVTuoZT2+VyPsux5IKEfNk+ir6BumgiWgnhRWsQRHyOJZyHmAwsTkZ9kYgwtYy4IbnCs
 /vrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790622698; x=1791227498;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=noXi+LkqsQh0kWWpkaXUVI5QBYODwErkMjSelrhWYLY=;
 b=kC2Iq47OmeLBXfBbTHlXKdQjdphdCVkgOnXmyvNn7JAl7BuxnplKH7osnKhEN1aaQR
 Hv86z5WoQeQlo9TEo12jCyrF69A9p8Ckw/8WRZkRr8/jgaCuHUyVEQrJswU8FGDhFXAO
 kTLUo+3mMsRSwKzEzYWLSWvOuLMljAb6kE8jIRDizbFJzyvFZcQ6xUfrVtLbA7kX4pyl
 INDmImwHmaT/CDRyMr+881xvJYgeeCSpA4JkN2L9Uj+kyrOYvOtqxTzkhUUosepaDHIE
 NStjvdtFA3qvR8Rb7lcWYjyiOweI+neIkTLlr0tm5F4JTRuCuk3ftvYXv+D+b4CbVfyH
 1v+A==
X-Forwarded-Encrypted: i=1;
 AKwUvBwACHRdWqIjvJMTRi/KRi9/w0bmY84B//VEVRw59MOL3EG4Z1FpEEta3v94+g+0H9j3S4MaZvtqMw==@nongnu.org
X-Gm-Message-State: AFuF++ksScYXprYH0F2fq49PX4NzoQTAWCF7hvFe0r4a+jNujtHRQKOi
 Lu9XSJlgfzipwGs3m8bY1NuCsvXb3yL9Tx3fjKmf2vz70FbgVw11oNBCDrQ041kOtNL2VfzE/sC
 mNtIg+Ooxyh2Si0L1o8I+U1apNFRC7kwOFFujYq9odNvpuxf7hl0GUG8=
X-Gm-Gg: AYBFou2g3NGupvwn15OIiUllr06hcLtte8X9zh3r+2htIPrRefaPHjU3Yqnlv7G5owp
 ihpS2/TL40e7MQCftoD4Fdl2V9uQdJS4RCc0WmEGXDLcKhuCgIYXp80/IOlaEn4PlV4NYliZ0pG
 ED3ogKtjt0F0JVkmpeFPeV8t06mfP8E1BWMQ69xyOBzbScsS6XTezIQ5n5V3BkIxl5Uune45Iw4
 eRnZ2WLROdTNghNz/4b1hK3mLWDgvSM1PB1MdbfPUEELSOrLEzv1knc4bn2lqsqkB09rcq5jVXd
 mFNLsRHoWMRrJCi35GCFbd+QXdueGZaAbnNYmQHX4ATFgQpcNEpFX0m9PXC4HF8tkmS2mxe24qd
 jJ94VZtvOs0LVD7rO0vIZAgc8pg0YTWskIQ==
X-Received: by 2002:a05:620a:4492:b0:939:2c5c:7977 with SMTP id
 af79cd13be357-93c43c75a3emr2262496985a.20.1790622698083; 
 Mon, 28 Sep 2026 12:11:38 -0700 (PDT)
X-Received: by 2002:a05:620a:4492:b0:939:2c5c:7977 with SMTP id
 af79cd13be357-93c43c75a3emr2262490385a.20.1790622697476; 
 Mon, 28 Sep 2026 12:11:37 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48aecf40a8dsm4822929f8f.18.2026.09.28.12.11.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Sep 2026 12:11:36 -0700 (PDT)
Message-ID: <1f46d3a3-1275-4ae0-be07-717c643cf0ae@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 21:11:35 +0200
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
 <CAE2XoE8Fp8w4m0WBjEXF3LceFXUqKDcXhdSmhCThgkAM3wRVaQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <CAE2XoE8Fp8w4m0WBjEXF3LceFXUqKDcXhdSmhCThgkAM3wRVaQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: C2FVYxWQ1M96E0XAYgu-UGQ4kuAISfVo
X-Proofpoint-GUID: C2FVYxWQ1M96E0XAYgu-UGQ4kuAISfVo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA3NiBTYWx0ZWRfX/Z4qiWNsQteQ
 hTJpnWDayjxER5N/oz7GAeRRh+CRmKay+rQj7NXg3bGKJ+xFzPdTLnxEkYRhRBnhe8B2FcNP2RJ
 UGZvUS55J4hwHhbQuc85l2ufGrmxdvAVcdR7KzVoXWDvfBn275muG36KN9u3x2Vw3jQXzN21vUI
 DshIdwLlUckPZmbgoP8ofZSPZSFdW26pPyah1qtcWzAzeyNeDNiy+9d6+pMsZnJGFe3fG5srQjG
 LZ+Snp5mTEZjZdpyeN+qBGf21jvWiYKZOse50DjY1ytTNW5+t69eMujVkv0FGX+F9XzfL6VAqwx
 Aji1eaJOX4BT71L5TllWb29w3pQmF6zDGXCGpRP4kRf3jrMH7H119JNCq5veWiCXc07je8liPXJ
 SigHwGmYnnoG7ztEGXvuNwtEFn1bjaeTy9+lSk3R9mWdEUnC3kcNwD6vYzyfWeoQnG5+GzpNvOH
 +zBsMBwSgr8iHXro5Gw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA3NiBTYWx0ZWRfX5PRakSU0RM38
 7+5+P5EGy2w4iydi1K/J1+XPXcrbU43Nan1SwayV30RCGDtX0kvSaJHzB8WKeamnigWzVp6bhdx
 DqVdOuTD+d31M/LNrPwECNqQylTD50E=
X-Authority-Analysis: v=2.4 cv=asYnmiZV c=1 sm=1 tr=0 ts=6ababbea cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=p0WdMEafAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=kO6CZMfuzHV47rAn5AgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280076
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

On 28/9/26 20:34, Yonggang Luo wrote:
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
>>
>> See commit 0e2c5647d92 and surrounding for MicroBlaze for
>> example.
> 
> Please take a look at
> https://gitlab.com/lygstate-qemu/qemu/-/pipelines/2890507627
> 
> I do not have clue to fixes it properly

What are you asking here? I'm seeing failures on targets supporting
dual endianness. I can not try to help you until I understand what
your goal is (I asked it multiple times but you don't reply explaining).


