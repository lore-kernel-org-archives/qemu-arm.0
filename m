Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75733CA600D
	for <qemu-arm@archiver.kernel.org>; Thu,  8 Oct 2026 15:59:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xEqWV-0008UQ-D7; Thu, 08 Oct 2026 11:59:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xEqWT-0008UH-SJ
 for qemu-arm@nongnu.org; Thu, 08 Oct 2026 11:59:09 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xEqWQ-0003Bd-SG
 for qemu-arm@nongnu.org; Thu, 08 Oct 2026 11:59:09 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 698EVSUw2801222
 for <qemu-arm@nongnu.org>; Thu, 8 Oct 2026 15:59:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LJKWCwj2Cjhss1wxdbYOVWFcTLGM9gKeaGl9Inqx3GQ=; b=FEw6NgMVUP4QRGN2
 yqNBnGkRFOXV+fJhx6IZtl+Meu6aK+SnHsZoejYrQs27PmJp6sWJ6DAKFMrnD9q2
 hssukO5OEa5wGSlGCQocc7KIX7gH7kMO9R1nJuFxScgO27wB2D2kyETOjIxBlblK
 9e6XbJeDJ6kzE4PbKLCeJ9wEEi4WFrYdCVTJ7WlJpVnJCU+X2Qgv5loQRnt7odeu
 JfFu01wDwJs1LYZvyAxTjXEm80+g60/oUZPJoTNKvGcPNoQ+1lYQFsxCDuyGElXI
 s9rnEzO83QhrQPnhtbZU1QFg7ZhWDE5LklFSqgq2ePy4bIQsUwmNKtwKGvp++AGm
 PFTboA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3kq1w-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 08 Oct 2026 15:59:03 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-30bcb065bfdso10408085eec.0
 for <qemu-arm@nongnu.org>; Thu, 08 Oct 2026 08:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791475142; x=1792079942; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=LJKWCwj2Cjhss1wxdbYOVWFcTLGM9gKeaGl9Inqx3GQ=;
 b=kYPhUWD6GjWNUgp+rAxiJVjFGjHoNGwU4DJ5AcHykYWi5NP/l7B4oVI5Og82NOIvtZ
 j2vLtbOj6BhqNQ70Pk7fjvZKGAvR5vSOCu8KG2jIsPW9qXf+cxKAHZOReKNpzjsGC60H
 nJ8AEd5KBIx6k9zysbQmU2s4XrajkcLijb2px+5zKAsJRcQ8ceJUIltq0dGo+MaoVBQi
 P6mUtMoa9Xg1oYmf7iNlgqGgTl862RtVV616u0iUR9CsvHJE/5t58X07bbmaPd5TvB22
 0KRMKn1q/Jm8iOH2Ps3PH0hJ+ftFEHijsRLmAMh+ldlKkiAlr1H48Rg/LzkZydOl8qWe
 0r+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791475142; x=1792079942;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=LJKWCwj2Cjhss1wxdbYOVWFcTLGM9gKeaGl9Inqx3GQ=;
 b=UAiPz8g2raPUFHocVW/TFdhinZfkAOZ436tx20YlQfmi2D7Vt0rMOoilXKvBw76OOu
 uVufJ6VxHQ9Vh4Qq6ZAUr1aF1vU8/KGs9NNsQ8GQoZ9SdAMCkeIcTQY1vV4NvghZL6ts
 L6e/3PaFr8bxs8FJlHJ1uB+dsJzMPyks1pcoQIxVa6Ia5Nzgwh2NU2tg12ek1oVh3lQg
 M/vFeTUv5nlmeTK8OYLsYtail98a1Gk1N6wd/6sfQ5NdRK3mGfbf3uxRSRl82PGS6ATJ
 ZuzrBpZ7dfmZjWTUrUEJKLSpJ/qukgdo+XEM6p013F/ejlVyLuKWQPBNLp7gtehdHaNQ
 P7AA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzROfqQo4YWknAt0lHGU/yfbveUOc07ftzjTU+8xr2ijP//bn4mvJfbHwr70xicUmk2231ISq29lQ==@nongnu.org
X-Gm-Message-State: AFq9FYJXNfFhq+p6mI4T6TNbn8tzAxgsrsyjZipuYxgMER8zokzVEbAG
 VtKqiSc6fcFwy9Qo//7Gvw9nHKakFVfWocq6b1vmgIx5b7wsmyUznx/h0wg4gYHQrjySfNMnFvE
 4HFi9C9kWdva0estGUf87Lndv/mdYuTXU+aL5e7Y0lAjlqPldgFsRwvs=
X-Gm-Gg: AYBFou0PbHzyVm2cQ59wl0QsG7Q5RaljPkNroJ26x9tCpDTgUN6i1tnGf/o+hqRxZ8h
 u+Jri0culDZzbpAyfL/ES0IB6rWkkzOl364rjJ3EKeEahwaLQmPE8HUjTjduMoV5dctjUqSfD0q
 dJfwGS1xgxRmUhgeXtyvyU0EBgQfX/0VBfe6+kOzLY1ckq2GZG0SDu78TE+IAn57i85k2DhKULe
 VelU2ZHvYdQZBgVH0/8mZNrGm9rElQ21gMgxLUcrGvlRH9K9ce+GBszRK0oit0cXRe9SP7tSs6y
 QkpwcaFiQ1HtxGU9iycODJis/P+Pu91Mxz2bltPs+UnT6VLhCe56bYFFdQvqf61hewESre/NwXV
 xFhgF0CyxKOMAq6pAIwLbkU+kS7imM2rmv8K6bHEQJImm45zdcDv+13mrYt2YWAz1a5m1sA==
X-Received: by 2002:a05:7301:3d0e:b0:351:5112:ec4b with SMTP id
 5a478bee46e88-3515da5dc10mr6655953eec.2.1791475141955; 
 Thu, 08 Oct 2026 08:59:01 -0700 (PDT)
X-Received: by 2002:a05:7301:3d0e:b0:351:5112:ec4b with SMTP id
 5a478bee46e88-3515da5dc10mr6655905eec.2.1791475141191; 
 Thu, 08 Oct 2026 08:59:01 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3515af90521sm29050543eec.19.2026.10.08.08.58.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Oct 2026 08:59:00 -0700 (PDT)
Message-ID: <34ad2c3e-fa4b-47dc-a81e-38c7f561d2e9@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 08:58:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] qom: pass TargetInfo to is_available for later use
To: luoyonggang@gmail.com
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Laurent Vivier <lvivier@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 John Snow <jsnow@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Stafford Horne <shorne@gmail.com>, qemu-arm@nongnu.org,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@oss.qualcomm.com>, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, Steven Lee <steven_lee@aspeedtech.com>,
 Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>
References: <20261007115253.328-1-luoyonggang@gmail.com>
 <20261007115253.328-9-luoyonggang@gmail.com>
 <7fc0d377-a994-41f4-aa98-7ed56db11447@oss.qualcomm.com>
 <CAE2XoE8K+3e8h6H9NrPk1WWMmJfG807bN_Kh5qje-5pKWUUg5w@mail.gmail.com>
 <b2d89a92-0197-4873-b4ea-75bb21c0d0ae@oss.qualcomm.com>
 <CAE2XoE-qDvOUG2+1yTTvBUyBLxoxCPPy464KQVLgSFx+tuQ2XQ@mail.gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAE2XoE-qDvOUG2+1yTTvBUyBLxoxCPPy464KQVLgSFx+tuQ2XQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA2MyBTYWx0ZWRfXyYaHePTZ/KCj
 C/FQSPzJ6L+TXegizMXx73KpeHEX8b0Q9aWNg+4svmoX0FiKcjqwKuUJkiYILZeqOzmtZ0+PknC
 I0zv5TL7fzImab7uhc+LVB4KMTEv+ac=
X-Proofpoint-ORIG-GUID: KcA5GS-2drma5shU1A1dk7k2P8iMyor8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA2MyBTYWx0ZWRfX7CSQZula4p1Y
 L8DxYtpdN6cuv3GoXgAWS3MRj4kZcsH+ocvnHeW4yO91jeoEeBicXEG9a0awi4rvWD5KZeIK5v8
 SNf93czT3QvzUcjyfV8UBtW/JSilgmzLqAhbvGnUnEs/YR9rdf6VIxwMQCuKcbCuZoZBTf16ZqM
 aCky5bxloD5rziIxuSpNrsmdq/UB4BB6waQVorHL6KOp0ukUVEm22cO9UErzuIMREQdwFQmyqCh
 aanjQzG7GQsUBiord7FiaUrvkG4Ac9oJ6ZPR5G8WYQvAjLXUyKhWKkYNH9KS14aPHSmtC1p3ZQW
 whqGlXFuiNHC0saIYzhfv6pzZLHSGQnTzf0mZzAUKNtxiePgOdc1vcg3LOYTTx+gu6aZ6IJOtxE
 VKfRdLp055WSO2Vd30zkQpw52v3pRXkBCjc5a06SSq9uyqTA9D9KI08Cao3uzxzCbwmb9NNlh/X
 CRWA01NvtJDfKEpcH+A==
X-Authority-Analysis: v=2.4 cv=IIuXmQvG c=1 sm=1 tr=0 ts=6ac7bdc7 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=p0WdMEafAAAA:8 a=xOZJixWyuWTxZ7Atf4oA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: KcA5GS-2drma5shU1A1dk7k2P8iMyor8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_05,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080063
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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

On 10/7/2026 7:08 PM, Yonggang Luo wrote:
>> So, based on all the previous conversations, we agreed to have a
>> qemu-system binary with all the QOM types available (for all targets).
>>
>> I personally think that if we go this way, we should not have any
>> -target option, and even less a -target none option.
>>
>> The current is_available() approach was made with filtering per target
>> in mind, which predates where things are now. So, it's a good time to
>> reevaluate how to do it.
>>
>> This leaves us with (at least) two options:
>> - keep the callback and add TargetInfo parameter (what is done here)
>> - remove is_available, and adopt a more declarative approach
>>
>> How about we (re)-explore the second one?
> 
> Indeed, I am doing
> 
> - preserve is_available(TargetInfo*), and adopt a more declarative approach
> 
> /* Generated by scripts/gen-target-info.py. Do not edit. */
> 

...

>     {
>         .name = TYPE_TARGET_BASE_ARM_MACHINE,
>         .parent = TYPE_MACHINE,
>         .abstract = true,
>         .is_available = target_is_base_arm,
>     },

>     {
>         .name = TYPE_TARGET_AARCH64_MACHINE,
>         .parent = TYPE_TARGET_BASE_ARM_MACHINE,
>         .abstract = true,
>         .is_available = target_is_aarch64,
>     },
>     {
>         .name = TYPE_TARGET_ARM_MACHINE,
>         .parent = TYPE_TARGET_BASE_ARM_MACHINE,
>         .abstract = true,
>         .is_available = target_is_arm,
>     },

...

> Other than these base machines, other machines are children of these
> base machines.
> 
> See these changes
> https://gitlab.com/lygstate-qemu/qemu/-/commit/c71da20c2483cdf577fd2a5548a80ca1e5099676
> https://gitlab.com/lygstate-qemu/qemu/-/commit/252b8763fd74ec57f5762bf9c57e19d8d9e5a146
> https://gitlab.com/lygstate-qemu/qemu/-/commit/252b8763fd74ec57f5762bf9c57e19d8d9e5a146
> https://gitlab.com/lygstate-qemu/qemu/-/commit/252b8763fd74ec57f5762bf9c57e19d8d9e5a146
> For ARM:
> https://gitlab.com/lygstate-qemu/qemu/-/commit/c42d5eb333fd3a7cab899c8df95375dfc79aba40
> 
> These base machine type is auto-generated in this MR.
> You can see at the branch
> https://gitlab.com/lygstate-qemu/qemu/-/commits/single-binary-arm-riscv?ref_type=heads
> 
> And the inherit is done by commits
> qom: inherit is_available and filter after MODULE_INIT_QOM:
> https://gitlab.com/lygstate-qemu/qemu/-/commit/cb66474a36e03b4353c2f525ce7821f2af779ea1
> qom: register late types through module_call_init_fn:
> https://gitlab.com/lygstate-qemu/qemu/-/commit/ba6a3d3fb6e4bfe35d88d3845abf7b0ec8fbc337
> module: add before/after hooks and module_call_init_fn:
> https://gitlab.com/lygstate-qemu/qemu/-/commit/86c635f45e283b6d0f714a1a3a9d9521b17d5152
> 
> And the gitlab-ci is already passed
> 
>

The hierarchy based approach (we considered that also at the time) has a
big caveat: a QOM type can only have one parent. There is no multi
inheritance in our model.

You can easily merge arm and aarch64 under a base_arm parent. However,
you can't express:
- this machine is available for target X and Y (x-remote, nitro, null)

That's why we chose interfaces based tagging 1.5 years ago, because they
allow multi inheritance in some ways.

>>
>> It's what we did in the past
>> (https://gitlab.com/qemu-project/qemu/-/commit/5de9216064d32eaac125dac4de1878486c16d73e),
> 
> Somewhat alike except I do not introduce many interface types. Just
> base machine types.
> 
>> and that I removed recently, in favor of is_available.
>> My rationale was that it was incomplete, since we needed to filter types
>> per config also, and not only target.
>> Now that direction is to not filter anything, filter per config is
>> unneeded, and switching back to declarative instead of callback makes
>> total sense. Using interfaces like we did has its own issues, and I
>> would not like to see this coming back.
>>
>> I'll do one very concrete proposal:
>>
>> ```
>> How about letting machines (and machines only first), have a new field
>> 'targets', being a uint32_t mask with an array of EMU_TARGET?
>> machine->targets = EMU_TARGET_X | EMU_TARGET_Y;
>>

For now, it's the best I can think of. I tried having an array of
EMU_TARGET but declaring it was a verbose mess.
The arch mask, that you or Daniel sugggested at some point IIRC, is the
best compromise here: it's compact and readable.

> 
> From my experience at
> https://gitlab.com/lygstate-qemu/qemu/-/tree/combined-binary-multi-targets?ref_type=heads
> this is not enough, we still needs is_avaible, because for those
> machines that binding to
> KVM/WHPX and other accels, we need to use target_kconfig to handle
> them. That's why I choose to use a unified
> is_avaible(TargetInfo*).
>

Given our base assumption to expose all types, why should we care about
kvm/whpx? If we don't have a proper message when user select a wrong
machine/cpu type, we can simply add one.

> This new field only works if is_availbe still be a member of TypeInfo.
> machine->targets are not generic. Indeed CPU and ACCEL(kvm/whpx/hyp)
> types also need filtering.
>

Yes, so CPU can have the same target field. Since we won't filter
devices, I don't see a need to have this in object.c. Also, it can
completely replace the existing is_available mechanic.

Also, in multi-target.c test, we can add a new test to ensure all
machines and all cpus that belongs to this binary have targets set.
This allows to leave the rest of architectures as they are for now, and
force to add this when we'll integrate them.

Regards,
Pierrick

