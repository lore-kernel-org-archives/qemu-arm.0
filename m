Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp1794514njb;
        Mon, 10 Feb 2025 00:36:16 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWmGe6lD2Z6GGPApeJ+obHl0OgtbhIAYfWrdqzVnQ4w41UixrXNZ3s2Fgp3izZL+c8CCcwE3mlcPG3new==@linaro.org
X-Google-Smtp-Source: AGHT+IEXojMfZtyrNC94npsnt+e5c5IWvNAHpSR3rUqWfBXhZuEw1GX16DqPebfqD9cinaqXFA7D
X-Received: by 2002:ac8:5f0b:0:b0:467:7295:b75f with SMTP id d75a77b69052e-47167bcec59mr184169541cf.38.1739176576329;
        Mon, 10 Feb 2025 00:36:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739176576; cv=none;
        d=google.com; s=arc-20240605;
        b=EYkTQaRBUa9APecnkn0zKYQ3hkqcd4mv2pshw/D5S1VGdK+vB77oQ92SJ7ocBi9xF0
         a536nMyY6a7nfyktDjHBdxwGmV8EqodHF5eHqJZT5lJMt2qVkoNN8TMOBQA6MRqj9qNG
         FCQrH/EUslsAgfd128e6zA7HPD4DnE1tn1JiG1zmutgCeZMdILCu41+Wj/GLhgtN0a20
         hWCiqdt5phoo1VXH9TcyJM/riMA0TWXfyjAILOCljn79xS2G7swiANvpev0phD0HBMGD
         SNNCzMn2ywTA3r0ukTl0MrGjOTJAC8Nsq1m+XkBVzzvZarXkTAdf74TqVP8aE3aL3Npu
         riiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Z0Yf4vUrtTQeJBsgoxiejCdM1aG3EmufqlPIvbidQ14=;
        fh=KJiqoqwL+lFMztVgGG16oXeyVkHdPtB70godqANZNa0=;
        b=Mwsb2F48vDR+Wc8WMzKk+NMIOcZGi5j5RxhulAAJ0uJhL43jFvagLd4XDWtptxZtEN
         a9k+zy/+3zi42SD4qc2rnJJCKhxnp+UlCygR/CWOhkMo1NjOQvcYFnzPG5Y76dNUOAor
         dSsA1EdHHfRfXNDD7eNCkqiiLkEkz/bc5M6K6+gKo0Y+fXGvaoQaoPXB1PE/pSJ2E3uS
         N0lSbQvZRocvB592n9ALTlJF3R4G+JCtqYoVltO0sv2jDjU6T/DdQ0jor3FfGYfkb8gm
         FwpqUfEhIjXEGufK27e3Jsua4Qo/YS43D+9e3oRH/hgdiXBzdsl7IJOndMaV3I5Dbrga
         FJmA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cESY0NAx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47183a68eacsi36053611cf.461.2025.02.10.00.36.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2025 00:36:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cESY0NAx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1thPH0-0007eZ-So; Mon, 10 Feb 2025 03:36:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1thPGy-0007dw-GC
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 03:36:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1thPGw-0002zI-2s
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 03:36:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739176563;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z0Yf4vUrtTQeJBsgoxiejCdM1aG3EmufqlPIvbidQ14=;
 b=cESY0NAxfUq1TVDswq/cNyIvh17LT546WOj1p9SFxGfJ7s0s3QuZqmlgmqKGmMLKFlbaJu
 6+N6YTVjHZv0YEycjz3VGh1FF9mU2yDWwlp9Zr0NANtWmrzzIYFI5PCEVDNITADsRm611E
 0l8LSizwJiGTEghzK7ZbV2/CbmBCpqU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-98-q1Y11JW9PgeUjvZgSzQVAQ-1; Mon, 10 Feb 2025 03:35:57 -0500
X-MC-Unique: q1Y11JW9PgeUjvZgSzQVAQ-1
X-Mimecast-MFC-AGG-ID: q1Y11JW9PgeUjvZgSzQVAQ
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4361eb83f46so30529175e9.3
 for <qemu-arm@nongnu.org>; Mon, 10 Feb 2025 00:35:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739176556; x=1739781356;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z0Yf4vUrtTQeJBsgoxiejCdM1aG3EmufqlPIvbidQ14=;
 b=nfRDSIr5w68aCKKf4elsqr97Qk10LJ0ViD7yTLO/TQ/f1/TcoTK4Yvh4wdEg6xj8Xs
 hM94oY6lmFo06FzsbOb2cf3enXnJ5Vasm7QDGlXx2vHCTH+UWIf7F7AFDaCHOGzSntK+
 DnhzR9k6tNPwhMF8Ngkbeb9zh7IYS3GVFHPrLFiLMBLk4VolfvpmOKWDnXf/tna86qyL
 nEnIcuqoFv9bZgsTzcYusYfNlo4ljeXfRvV90RCW09xhFAQqasC7Pt27bvEfAcfChx4l
 38whX6UN1v/XAWPDk9uRKrMmchemEL2FgSKO9fs/+vuOCe7DarI5Y03FCZ5cvwuXUC53
 v5rA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWta6TcbDqFnpbuvMGQzzc6UFJoo4eYsGA4bTrs1kFIaucP5FcQItWbOe2dnKefT4p1kwn/f7PvA==@nongnu.org
X-Gm-Message-State: AOJu0YyCTlsT68+YDYH5NQbcbG8QA8NbFsVdp8Esur60GHh3F/k/hB7s
 PVYHFqs+gWDrHj9Y7MCSAc6hBkgHfD06acWSvYgoSupWMzXYiGoU/B+H7XfZNvKjVVffL9MOl9+
 QqkCN4khi2ImaSA3GexFctlir4AeBhe98I+rt+wnza8GdA+aKtw==
X-Gm-Gg: ASbGncuqVBWxY/nJGxe0qQZfsIuMHCUTqWHs2WNk4r7uudh094bYy8DGwqtw5Mt7IgV
 IkykYgHIl5GSIGpNjZOTOl7rK1VntPLm5941jJnVZBf66tLnDeMNxpaAFog0Kkcd/mNV7kVRlRQ
 QvBJ1bGkfSiHu/Shg80TaITVkT+cZu0SsXF7JH2daOkKer0x9tG3IgFv5gLviQSUtJcAo//nLpW
 X25vhmBv+F6YGSDafKSEUAPVtyxnr5XngCdRCmXr1ouIHL024XTbf2HpfEsey8A9sV/fG+a8D4o
 LQz/XmHX5V8A6O7DTViMnA/W2s6LMBT1fJj7JqGT35zmfFNSBX/U
X-Received: by 2002:a05:600c:3b9c:b0:436:ed33:1535 with SMTP id
 5b1f17b1804b1-43924991f68mr103303215e9.12.1739176556247; 
 Mon, 10 Feb 2025 00:35:56 -0800 (PST)
X-Received: by 2002:a05:600c:3b9c:b0:436:ed33:1535 with SMTP id
 5b1f17b1804b1-43924991f68mr103302845e9.12.1739176555839; 
 Mon, 10 Feb 2025 00:35:55 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439429c0790sm30383195e9.2.2025.02.10.00.35.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 00:35:54 -0800 (PST)
Message-ID: <3db2e0a7-0f38-4c6a-a9a4-d44e0c6af436@redhat.com>
Date: Mon, 10 Feb 2025 09:35:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] hw/arm/smmuv3: Move reset to exit phase
To: Peter Xu <peterx@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 mst@redhat.com, jasowang@redhat.com, imammedo@redhat.com,
 alex.williamson@redhat.com, clg@redhat.com, philmd@linaro.org,
 zhenzhong.duan@intel.com, ddutile@redhat.com
References: <20250206142307.921070-1-eric.auger@redhat.com>
 <20250206142307.921070-5-eric.auger@redhat.com>
 <CAFEAcA_LgrBRbafVQ0vLGPd8xG=wsLjWnKTJ2JSEREYUqgRQBQ@mail.gmail.com>
 <7102d470-ac72-4c02-b8bc-20f1379a4843@redhat.com>
 <CAFEAcA-XK5GwT0b_Ff-8fYnWcDgzaE-0Ei-YqDoXv-aXFGNXUQ@mail.gmail.com>
 <Z6ZHTStx_S9ALdxt@x1.local>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <Z6ZHTStx_S9ALdxt@x1.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AZy8Bu3epb6ckepsdT60eNUFkXi16XbDldyvZkS98mQ_1739176556
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.405,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: EtyGxwpdkFET

Hi Peter,


On 2/7/25 6:47 PM, Peter Xu wrote:
> On Fri, Feb 07, 2025 at 04:58:39PM +0000, Peter Maydell wrote:
>> (I wonder if we ought to suggest quiescing outstanding
>> DMA in the enter phase? But it's probably easier to fix
>> the iommus like this series does than try to get every
>> dma-capable pci device to do something different.)
> I wonder if we should provide some generic helper to register vIOMMU reset
> callbacks, so that we'll be sure any vIOMMU model impl that will register
> at exit() phase only, and do nothing during the initial two phases.  Then
> we can put some rich comment on that helper on why.
As discussed with Cédric, I think it shall think about having eventually
a base class for vIOMMU. Maybe this is something we can handle
afterwards though.
>
> Looks like it means the qemu reset model in the future can be a combination
> of device tree (which resets depth-first) and the three phases model.  We
> will start to use different approach to solve different problems.
>
> Maybe after we settle our mind, we should update the reset document,
> e.g. for device emulation developers, we need to be clear on where to
> quiesce the DMAs, and it must not happen at exit().  Both all devices and
> all iommu impls need to follow the rules to make it work like the plan.
The 3 phase documentation already states that you shouldn't do anything
in enter phase that can have side-effect on other devices. However I
agree we can add another example besides the qemu_irq line one.

Eric
>
> Thanks,
>

