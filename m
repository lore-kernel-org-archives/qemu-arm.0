Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2547580ejc;
        Tue, 17 Jan 2023 09:03:42 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvog/exkp3SnCo7cNnYIcdmMIUkYK/tUvzUir5vzzBFmkqRTVWsCas6+aB+i0k5ZDrEXMoQ
X-Received: by 2002:a05:6214:5f87:b0:534:61a9:6f60 with SMTP id ls7-20020a0562145f8700b0053461a96f60mr5280332qvb.18.1673975022792;
        Tue, 17 Jan 2023 09:03:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673975022; cv=none;
        d=google.com; s=arc-20160816;
        b=mOUs61K1Ud7OxRNCCDGhZ8Bp1UkaY4WCfGGxy+7s4NUI2md3cNnU6pTcBBXmjDSjaL
         Bd9HhYga23TqEKJmWRlsKoLOH5a6uCpa4aytV0P79x2zWemg5miq9mZ0oWWzP4UBQt4F
         f/sJ0FHuycvrQIL3ZLehTrRlh9VO34LCtdkqbs/IYzSggZwC24W+kN2ZaLF3+pM2IAKe
         2Zcsy39cBeSuO7IsGb9Ny81zbNAG/LlbKgqurbFi6lcufvrz7qYzCKSQSL3c+bYoHUKa
         MtXQfv4s9hx3WdXCP5H/y1jYiLB50qzB7j85TrM5wcWvwaxN31xnV5iWgi8eE8I0nygI
         EIKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=K/9tMHDqLNn9i6Z4LYDE7RAQ8nBgObnUQsdbmyuualY=;
        b=eI8L/URLq738+wmeWSMU/lIxwvV8jfziHE+hbR3kduaGCDxk215EB/TuAl5/Tjz8j+
         ZcO4CFTvsnMLYqfka7MCmVc7ABaqH0I+MM3DTmCRkvOvfPOBSdUbtRElykTiqpbnHBVl
         AoCcypNK8/V55wuLEtsQPKgMkLJb0vCJUiGNaj6sGFw5bZ2flrelRhqAxlLhe7fm8aPV
         9euF4COYu/fZsRVvAqxzumfK1O5v2k9t7ySq1NPBp6ii0z13vPFSBuMhtucApbzlZa6h
         JNr1jywX/Bl/wRCu3uRWBNO/Pk6dmSZTNa4gcMCg/nAFF1MYSTq3aeb6nNVsNKnKt2wu
         Rb7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eDFUvZ2G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ke4-20020a056214300400b005317ca76d3asi18281099qvb.359.2023.01.17.09.03.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Jan 2023 09:03:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eDFUvZ2G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pHpN0-0003qS-UP; Tue, 17 Jan 2023 12:03:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pHpMp-0003dY-MI
 for qemu-arm@nongnu.org; Tue, 17 Jan 2023 12:03:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pHpMn-00034J-FB
 for qemu-arm@nongnu.org; Tue, 17 Jan 2023 12:03:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673974833;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K/9tMHDqLNn9i6Z4LYDE7RAQ8nBgObnUQsdbmyuualY=;
 b=eDFUvZ2G1ESIb9aooh+2+FUeSIRz8K9MUBC01s67cA/ECD5henaX/u1XMe1N6FVWkUuqXT
 FSWn5/TUu2RXHQAilyTz2bVHjajEadVHeecGZtT6Ly4VZHUrAN6bkHjNt06pkg420aq+uK
 sHtECu/+9/E5KcAmpz2al4SHuW844Ys=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-288-h3jaDZ3HPbulzq6zaZgaCA-1; Tue, 17 Jan 2023 12:00:15 -0500
X-MC-Unique: h3jaDZ3HPbulzq6zaZgaCA-1
Received: by mail-qk1-f200.google.com with SMTP id
 m3-20020a05620a24c300b006fee2294e97so23245384qkn.11
 for <qemu-arm@nongnu.org>; Tue, 17 Jan 2023 09:00:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K/9tMHDqLNn9i6Z4LYDE7RAQ8nBgObnUQsdbmyuualY=;
 b=YGLOpMqB86tYjezjqy1mFONvDDtwGUXcfyf5cLypr15gLX4qMKOc+lu+EBK6T1gerS
 XqcdwsbnvNEEZxg3U6G3YjJ43Kz9H1GR4zfj9iKBMEyXaVCVLslPNjN1W0M3OlZvztZE
 LmivNo41X3Br+wUixaT8GLznzoNyT2CxZv5PYU0LpGQ70WURjlNrstZSPqEyEyjcXBW1
 CyZZegh9wiAKd46rImDXHY/Obo+8HQqqsZT9w6CGHW1ZyyaVGvpHn1gXEhA+WYELRDOM
 dJdWj5NPLFrmP/Qe2kgdcGEumZV2yEl6owL5I4pt+kj/JPPDGc7ka5wfAtj/euQDHWn8
 ZNoQ==
X-Gm-Message-State: AFqh2kot7wnURMSpVWp3ByX0RR5BoqktDmwbNI63D8MUiyg7Y46ZE3YY
 td+rK74ds+2Tg+7MjknZ0WhDSYtzpW2IHwTHmePqUgG8K+wxx3FidGsflFUejYLHc3AmJbMtRLi
 eO5mJEN4Ss+QO
X-Received: by 2002:a0c:e8d0:0:b0:534:8a2d:a654 with SMTP id
 m16-20020a0ce8d0000000b005348a2da654mr5503364qvo.39.1673974809373; 
 Tue, 17 Jan 2023 09:00:09 -0800 (PST)
X-Received: by 2002:a0c:e8d0:0:b0:534:8a2d:a654 with SMTP id
 m16-20020a0ce8d0000000b005348a2da654mr5503345qvo.39.1673974809171; 
 Tue, 17 Jan 2023 09:00:09 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 r7-20020ae9d607000000b0070650f5ee2fsm5656855qkk.65.2023.01.17.09.00.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 09:00:08 -0800 (PST)
Message-ID: <1fe1dc81-f6bc-3da8-81c1-16dd248cc23d@redhat.com>
Date: Tue, 17 Jan 2023 18:00:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [RFC] 2-stage translation emulation support for SMMUv3 on TCG
To: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <b6a1427d-51b6-0daa-c4f1-b1e8ea145844@linux.microsoft.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <b6a1427d-51b6-0daa-c4f1-b1e8ea145844@linux.microsoft.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-TUID: 9t3qrnoy+m1y

Hi Evgeny,
On 1/16/23 16:37, Evgeny Iakovlev wrote:
> Hi!
>
>
> We are using qemu-tcg-aarch64 to run Hyper-V test and debug builds for
> arm. Besides some minor fixes that i have submitted over the last
> couple of weeks, one big compatibility item for us is SMMUv3 2-stage
> translations support. We can do fine without it right now, but having
> it would also allow us to test nested arm guests with SMMUv3, which is
> great.
>
>
> One idea we have floating around is implementing 2-stage translations
> in SMMUv3 in Qemu. We can't make a commitment yet, but before we
> consider it i think it would be wise to ask the community about it,
> specifically:
>
> * Do 2-stage translations sound like something qemu-arm would be keen
> on accepting? Are there any other use-cases for it besides an arguably
> wild corner case of nesting an EL2 hypervisor on software-emulated arm64?
Personally I don't have anything against. I guess we cannot prevent you
from adding a feature that is supported by the spec ;-) One concern I
have is the extra complexity it will bring to the device. At least I
would recommend you to try to isolate stage2 support at most from the
rest and make your utmost to keep the stage1 perf as close as possible
to what it is currently. Indeed the main "production" use case is S1
vSMMU with KVM acceleration. Currently in linux arm-smmuv3 driver, only
S1 is used. Out of curiosity how are the S2 and S1+S2 used with HyperV?

I am mostly involved in KVM accelerated use cases so I will let others
comment on potential use cases using S2.
>
> * Is there anyone already working on it as we speak maybe?
afaik I am not aware of anybody working on that at the moment
>
> * Were there any previous attempts to do this and if yes why they
> evidently didn't get through?
afaik there were no series sent publicly

Thanks

Eric
>
>
> Thanks!
>
>

