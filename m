Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp1431600lfq;
        Thu, 24 Feb 2022 19:36:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz7LaLMMu+ooRMt/X4unXa/j8dN9JPPIrW16hsDFbsCo1DRD4pyIc60wVfOL+Fbne9U3WJz
X-Received: by 2002:a17:906:53d2:b0:6ce:791a:31a0 with SMTP id p18-20020a17090653d200b006ce791a31a0mr4558187ejo.59.1645760206960;
        Thu, 24 Feb 2022 19:36:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645760206; cv=none;
        d=google.com; s=arc-20160816;
        b=ZbqUja0QIioGEvdvAOcRGINhi8I4FNjDjmyuC9LPVCrYRvVI+2xnRq+7VI7qU2FKra
         FyAtAv7WqbNsxWPg7wro66rD1BFNQddMm58n2/HUG6Fr8e80r0Ch6rJJNRKGAYRrPk5p
         KthtGjgVbzfWm377nMC3VOgYMmdPI96E+x6WOQDkXHPuDKp63tHU0NzpyWqqK1L27T67
         7/V9ba0k2OIUzqhkg+EvmsPJs5X76+rVyWJhPOMEHFDAfaPddES/08oTuz+hSySXgSTn
         mgJJeOV8PePCO0TxSDy25mR8fL0M/nNtFvPx9ZRgej3x9sbjPW8zm4iLK46BrCnB76ZM
         v5IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:in-reply-to:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:dkim-signature;
        bh=x9jeapprFa4Ot11+WrwuDjIQF4aWPgBZK6dfh3JGtlA=;
        b=UznOxLL93rionmXQvPxGUPlWo0FsFl76hnqb4558rxzBE/Ryu44Rz4Lrpfc4JPj95M
         J+w/FC/i19JD8tnoRVKbYIa+pMCcJAUIWKyoNzCtei3J0ZoU4yEEA4wMualMDurTtCHw
         VQ2I8z62uOItydIyompWU0T1PxVG9qEHHI6uAvc95kdCf5kqKMML4abSGx/VXqbHUVEs
         x5nI24gOJQO4FAYnu9EaIMdFkU5ykDRGrCGVF4In1mxfn29qa8rrSTif5PAkgxCi9wVX
         q03QZXahq3HsczchbbHM6k57OTZfp1rAFEottjUokc7cXoTcyFbwNcWIftnXayOh2zq1
         wRrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=drYROIeH;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id eb10-20020a0564020d0a00b00412a6ee095asi1224843edb.37.2022.02.24.19.36.46;
        Thu, 24 Feb 2022 19:36:46 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=drYROIeH;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236945AbiBYDhP (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 3 others); Thu, 24 Feb 2022 22:37:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236588AbiBYDhO (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 24 Feb 2022 22:37:14 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1844193E9
        for <kvm@vger.kernel.org>; Thu, 24 Feb 2022 19:36:41 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id q11so3664330pln.11
        for <kvm@vger.kernel.org>; Thu, 24 Feb 2022 19:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=x9jeapprFa4Ot11+WrwuDjIQF4aWPgBZK6dfh3JGtlA=;
        b=drYROIeHuUTxLgzFN+yTzzk8Yf365zr+d2chD+7xxOd75jmN94EZaygfq6K6UtQ734
         HerHGAaIXcF9E2EswWW05Td/hQDowfpRFVJ736TGjJPt3EvIVVLfkNgzJdO87XnUbDOo
         K4DmAyQqFdFPGs1XfejLum0Z826+l4ambf8P0/S+lhmi0mKFalT3UzJSnj7/ZVVo33c5
         TaJjenRVbRp6PyV4ujJbk5FumZUbCzhZKkEry1WAg1pIjRoNUhgTpaDdf0829qKJ1/+U
         wV9627M5tr8hflNhDuTpC+ghFfS/rTsglWUUgjQzEP0iMheIoAYMoR8E4vYx01tkDyzC
         i2bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=x9jeapprFa4Ot11+WrwuDjIQF4aWPgBZK6dfh3JGtlA=;
        b=uWxn+HPZMZdQRNXAAdktHX/mblqKCOIkvgaR/TddWYjfcB/CQtsAvFurtpp5/VFn64
         WAi3mxB9fS6FiLOYxlvjH1PEejXjHgf5yeVJreRq5SDu2MwBwl+ox+fO4M9ttqeCLeW7
         DGWTqs3yMd8G1r8eWBIKUJ5xACXs4qBe0HUxPqlytMiNrAWmUittnxnLT4wVV9prhgdl
         zjX4/F3gbAYZ61C6wdXVUSqE5S9NjuMeMgwAIzx8lV/7WNzQ0PbZlxTtSU6//343Mhvm
         +0MrFjdGkvpkHYpC8CHs6ZTe6kvIw49enIs7RVeClNQN4PkH1V2TppWsU0Ve7LLK0p4e
         FTbg==
X-Gm-Message-State: AOAM531XOfp2j94Gd6bkZm5U9ZodLgorurQVg50dC0VR7yTmABDmiiwk
        exXpkiF7Q8Hgk+y5ZyCRJAQ=
X-Received: by 2002:a17:90b:4f4b:b0:1b9:3798:85f8 with SMTP id pj11-20020a17090b4f4b00b001b9379885f8mr1241067pjb.139.1645760201295;
        Thu, 24 Feb 2022 19:36:41 -0800 (PST)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
        by smtp.gmail.com with ESMTPSA id d7-20020a056a0024c700b004bd03c5045asm967835pfv.138.2022.02.24.19.36.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Feb 2022 19:36:40 -0800 (PST)
Message-ID: <9223d640-3f50-1258-1bdb-e3ca5d635981@gmail.com>
Date:   Fri, 25 Feb 2022 12:36:40 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] target/arm: Support PSCI 1.1 and SMCCC 1.0
Content-Language: en-US
To:     Peter Maydell <peter.maydell@linaro.org>
Cc:     qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org,
        Paolo Bonzini <pbonzini@redhat.com>,
        Alexander Graf <agraf@csgraf.de>
References: <20220213035753.34577-1-akihiko.odaki@gmail.com>
 <CAFEAcA9eXpxC7R_qcDsBh4C9Aur5417kTzAhs4c7p2YRCFQUKQ@mail.gmail.com>
From:   Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <CAFEAcA9eXpxC7R_qcDsBh4C9Aur5417kTzAhs4c7p2YRCFQUKQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: JscYiYv2oPja

On 2022/02/24 21:53, Peter Maydell wrote:
> On Sun, 13 Feb 2022 at 03:58, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
>>
>> Support the latest PSCI on TCG and HVF. A 64-bit function called from
>> AArch32 now returns NOT_SUPPORTED, which is necessary to adhere to SMC
>> Calling Convention 1.0. It is still not compliant with SMCCC 1.3 since
>> they do not implement mandatory functions.
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
>> ---
> 
> Applied, thanks.
> 
> Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
> for any user-visible changes.
> 
> (I noticed while reviewing this that we report KVM's PSCI via
> the DTB as only 0.2 even if KVM's actually implementing better
> than that; I'll write a patch to clean that up.)
> 
> -- PMM

I don't have an account on https://wiki.qemu.org/ so can you create one? 
I'll update the changelog once I get access to the account.

Regards,
Akihiko Odaki
