Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E158EE3691
	for <qemu-arm@archiver.kernel.org>; Thu, 12 Feb 2026 14:54:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vqXyE-0001bz-Uz; Thu, 12 Feb 2026 09:47:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vqXy2-0001E5-Oa
 for qemu-arm@nongnu.org; Thu, 12 Feb 2026 09:46:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vqXxl-0007dS-UF
 for qemu-arm@nongnu.org; Thu, 12 Feb 2026 09:46:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770907597;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/R6tb149s2l7xGGa+oOLe18sITBXQfTR4Ufb7OLpAFk=;
 b=DP53g8Oi8mJhL/kULedjmEhOEBMR9hpXnzDQHkJgDFF6kNRo5ZWawP13n4euGuz1liB68u
 w4meC6351AsIgpDw09wVdtBverjX1P0jMCg8LLdlWObI3UEcoG2l4HyDtIezzhN82JWFPr
 6UyKUhzb8xmGABQhe+SHJYvWQ4EIwYs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-90-iR9m7aXfNkGn2LGQWnjtJg-1; Thu, 12 Feb 2026 09:46:34 -0500
X-MC-Unique: iR9m7aXfNkGn2LGQWnjtJg-1
X-Mimecast-MFC-AGG-ID: iR9m7aXfNkGn2LGQWnjtJg_1770907593
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4803b4e3b9eso64171535e9.3
 for <qemu-arm@nongnu.org>; Thu, 12 Feb 2026 06:46:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770907593; x=1771512393;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/R6tb149s2l7xGGa+oOLe18sITBXQfTR4Ufb7OLpAFk=;
 b=C8Pzajkrgj4VyZ2pNfm/Q6j1kcLgIel6C36QsJLsZpSRg4kwU1/wV1j1FSrSr8nR2q
 e0MBkSYgW991ONyfe0HAz7sYYqEqy9/9o7YqQkyp5EnSPRNvrs95ExDQOwKEjkqsFNtV
 cEQJ5JkDQLZhWa/TqDOu7ss/yp9aB6efHbyh012D3zSzorRyxMuFc8/enSH9C5QvMiyg
 FKO5QY3hocsyDbveFsv5vCqAf2j1fngKua0t84vg9hgAPsLWuqr8WGuKPYGw/RWCmawo
 b8vRicekG/t+0JKrmgpqeF3PtWShnWsZVxi5406B+HpeCf0mPvfHzq5xY1XuEo3gTZIh
 z7Fg==
X-Gm-Message-State: AOJu0YyWnkFb0vP9KLmGqxZ63/8AuvW7Eq+zO4eK4tNMvF2NFTKed0ac
 gVrKmfxJXdzbbu+l4+FPRL4dpnsP8dEo91WFy0DoA0LzMXg1KJHkNEMtt7LQJzSKceDNjWQcUQj
 EVPTs6zHkEYlx7X4TeD8jfkBp9Ep0EHKIpUuRpMsePYtpmGykCPsmiA==
X-Gm-Gg: AZuq6aK/8EbKggml7MjcUHtSl3NMR/cd+6Rgz7nUbksMoad/qsvvuEXck0BJ6at5Ubf
 X9mlqioxg2F1BMKHaNNpW0jZ/FklM25bHM/UzGtz37NKWQu1/0OyjJv8F3tw6ToiK6ZRz1ofmDd
 RNiLaWOjslvyIKBVPiprBbHekTPcz78PD2P7xkAiJEjkBliIANCLN2BaG+5o8mKlgF5c9i9xnox
 r5JT/OIJ6saK/dqyISALCAbb7ytQZ2yR4WKYf+KLN1l/LeW15VDBBVMVqek5ViUWxImNFxd6uPP
 ktGXAyljsFoqVjZHPCMVBLsc4Uo2/nJX7V/BlKb3LFZeLg0RkrW/hWAds5Wpy2R5tbRcaqTqA5W
 l++75reAbEzYOujnPXCJgu33UEBMZynWPfYrGrRPO9pNcBbDvRctR3/pzhoQTrGtAvlwXKQ==
X-Received: by 2002:a05:600c:348f:b0:480:1dc6:2686 with SMTP id
 5b1f17b1804b1-483656c571fmr48741625e9.13.1770907592841; 
 Thu, 12 Feb 2026 06:46:32 -0800 (PST)
X-Received: by 2002:a05:600c:348f:b0:480:1dc6:2686 with SMTP id
 5b1f17b1804b1-483656c571fmr48741155e9.13.1770907592352; 
 Thu, 12 Feb 2026 06:46:32 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43783e5c635sm13350787f8f.37.2026.02.12.06.46.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Feb 2026 06:46:31 -0800 (PST)
Message-ID: <7ddafa8d-5510-4202-827e-9c0dc186c5e2@redhat.com>
Date: Thu, 12 Feb 2026 15:46:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/24] hw/arm/smmuv3-accel: Introduce CMDQV ops
 interface
To: Nicolin Chen <nicolinc@nvidia.com>,
 Shameer Kolothum Thodi <skolothumtho@nvidia.com>
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "clg@redhat.com" <clg@redhat.com>, "alex@shazbot.org" <alex@shazbot.org>,
 Nathan Chen <nathanc@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 Jiandi An <jan@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>,
 "zhenzhong.duan@intel.com" <zhenzhong.duan@intel.com>,
 Krishnakant Jaju <kjaju@nvidia.com>
References: <20260206144823.80655-1-skolothumtho@nvidia.com>
 <20260206144823.80655-6-skolothumtho@nvidia.com>
 <aYo4n4N3dW1OLzTk@Asurada-Nvidia>
 <CH3PR12MB75483C2BA4EDC24CA0F78A4CAB62A@CH3PR12MB7548.namprd12.prod.outlook.com>
 <aYtozzSV4UYOjJcK@Asurada-Nvidia>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <aYtozzSV4UYOjJcK@Asurada-Nvidia>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CLJ6hx1Fs_jlzUT__5aT69AKxJ3sgANHZhqol4C_HwQ_1770907593
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 2/10/26 6:20 PM, Nicolin Chen wrote:
> On Tue, Feb 10, 2026 at 12:46:01AM -0800, Shameer Kolothum Thodi wrote:
>>> On Fri, Feb 06, 2026 at 02:48:04PM +0000, Shameer Kolothum wrote:
>>>> CMDQ-Virtualization (CMDQV) is a hardware extension to SMMUv3 that
>>> enables
>>>> virtualization of multiple command queues (VCMDQs).
>>> Let's mention "NVIDIA", noting it's a non-standard extension.
>> The idea of this ops based callback is to make it more generic and not
>> NVIDIA specific to start with. This leaves room in case ARM introduces
>> a standardised version of something similar in the future, or if another
>> vendor provides a similar extension.
> That might be a different naming which we have no idea about yet :-/
>
>>>> +    void (*reset)(SMMUv3State *s);
>>>> +} SMMUv3AccelCmdqvOps;
>>> Overall, an ops structure feels unnecessary to me. Maybe init and
>>> reset are somewhat plausible. But nobody else would reuse this ops
>>> structure that is exclusive to Tegra241CMDQV?
>> That's true for now, as there is only one implementation today. If this
>> abstraction feels over engineered at this stage, we can simplify or defer
>> it (and fall back to calling the tegra241-specific functions directly, as in
>> the RFC) and revisit once there is a clearer need.
>>
>> I'm open to suggestions, and let's wait to hear from others as well.
> Well, I'll vote for adding that when someday there is second CMDQV.
> There are only a couple of CMDQ-V functions required to export for
> SMMUv3 code to call at this moment, which isn't so bad.
>
> Having and naming a structure exclusively for NVIDIA CMDQ-V doesn't
> make a lot of sense to me. And if we really want an abstraction ops
> maybe "secondary_cmdq" in the kernel driver could be a good choice?
As mentionned earlier mu syggestion was mainly to address specialization
with known implementations: accel smmu with vcmdq versus without. And i
think we already have some implementation override in that matter.

Eric
>
> Nicolin
>


