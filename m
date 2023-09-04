Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp1287952ejb;
        Mon, 4 Sep 2023 05:05:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwzZm0a0RkISgLVM/BUjQF1oZpWae+mkjyKcQVE3/toYFaV9ka0PM85eJYqr2k6CvyMRQ+
X-Received: by 2002:aa7:dd0b:0:b0:52a:1d9c:83ff with SMTP id i11-20020aa7dd0b000000b0052a1d9c83ffmr7180849edv.1.1693829144779;
        Mon, 04 Sep 2023 05:05:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693829144; cv=none;
        d=google.com; s=arc-20160816;
        b=puceaL7eyoKNWweiVTfbS2V1WiH7aw3QnO3CQkhQwoMp2QFNSzgtPLqpWUyPNmTA+C
         r/0ndgDjlTmR83tqkKZkEe5W1r5FDpfAU8h7fhmhIRvj61KRlwTWRoc4ZeuxFfatrt9b
         6bRkGcObUcmUxP0g2K0X8dYB55vKdu/T/XcnWJaswrXJgs/d92LsPIbewmlaNBfjfcuS
         ba96Y1u9Wb88ZR4koXG7tyguzvQaaAuI9hM8sFa6aBM1VOV2tbuup7AVRsXTjQubVZkL
         W/3jg4DkOPoSlEVOPVf98l7X0rRZPgnOMCQ8euzm37Xf1O4sMjrcABCfHLPVrNtDEZYr
         P/4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:in-reply-to:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:dkim-signature:dkim-signature;
        bh=FGJUU8gdlJybZdYkpSEXd58MdQ8uDH1Q2xZeNXeFrGo=;
        fh=oa1+UTzeg1fZjmfQN+tMxC8nT61AehSUJArFuMa7EKc=;
        b=09h8tYZySK5jjCq/2Fvo2dpesndj6hyXqkU0rZ4GerG7FsYJo8j4mvMYVnYc5CLC4R
         xSChDoyVCeZi80GuMiB/mM06HZlLss54x5VeAj3Yt7div0uC81Ey1RNG046nkJXL2frs
         3+nk0BAj7NfS5uctgzTNfgmNm6LukgH/LDW8fRx4Ggxgrp48SBElDlQygRDAUh/1p3U0
         r6CxMgPx1H2lkZ8by3cNVup3EztPnbY8eNc8BfgVppI1/iOoMXy/qXgrdZnLFt/vCReF
         8xWinaRKvYA++Q6zb3CEUKQFwvQ1OCjZ+Q78zeXyMxpmCDdnBuu+RNiF63hXWqcW+KvD
         gbYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=W1jxotF1;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=w9qH7ap3;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id n8-20020aa7c448000000b005256d6fdb23si6273342edr.58.2023.09.04.05.05.44;
        Mon, 04 Sep 2023 05:05:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=W1jxotF1;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=w9qH7ap3;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351265AbjIDMFq (ORCPT <rfc822;mathieu.poirier@linaro.org>
        + 2 others); Mon, 4 Sep 2023 08:05:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232660AbjIDMFp (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 4 Sep 2023 08:05:45 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23E371B8
        for <kvm@vger.kernel.org>; Mon,  4 Sep 2023 05:05:42 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 48BAA1F38C;
        Mon,  4 Sep 2023 12:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1693829140; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FGJUU8gdlJybZdYkpSEXd58MdQ8uDH1Q2xZeNXeFrGo=;
        b=W1jxotF1ycwULr6IPPx8xQfaa2/LCFY9dGRXxPPjGCkIuJ9Gjz6vx4pv0PFE//66SnZ8dh
        VZ8enF96RAfvbMEmpKgH7aPUyteZS8eN0yyFMEi08sLSIeV0pT2AAnwS9BMnVt8bGT90bh
        t1773TgL/L6rr9hdjAR/PhdbgNc2990=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1693829140;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FGJUU8gdlJybZdYkpSEXd58MdQ8uDH1Q2xZeNXeFrGo=;
        b=w9qH7ap3igwA8BgpKla8tS277AQ8hFQro2OtYZMHYM7SKYFIVJTMeBDA8Wb8hqrdimzd1p
        0a2LhsMWRCKtQWDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EF88613425;
        Mon,  4 Sep 2023 12:05:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id kbHGOBPI9WTqXAAAMHmgww
        (envelope-from <cfontana@suse.de>); Mon, 04 Sep 2023 12:05:39 +0000
Message-ID: <b05c5619-4f88-0aae-9162-ea90188d5b9c@suse.de>
Date:   Mon, 4 Sep 2023 14:05:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] arm64: Restore trapless ptimer access
Content-Language: en-US
To:     Andrew Jones <ajones@ventanamicro.com>
Cc:     Colton Lewis <coltonlewis@google.com>,
        Andrew Jones <andrew.jones@linux.dev>, qemu-devel@nongnu.org,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
        kvm@vger.kernel.org, qemu-trivial@nongnu.org,
        Marc Zyngier <maz@kernel.org>
References: <20230831190052.129045-1-coltonlewis@google.com>
 <20230901-16232ff17690fc32a0feb5df@orel> <ZPI6KNqGGTxxHhCh@google.com>
 <cfee780b-27ab-8a49-9d42-72fd2a425a17@suse.de>
 <20230904-2587500eb2b77ed6c92143e2@orel>
From:   Claudio Fontana <cfontana@suse.de>
In-Reply-To: <20230904-2587500eb2b77ed6c92143e2@orel>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: a5lBcqPWEV6+

On 9/4/23 13:07, Andrew Jones wrote:
> On Mon, Sep 04, 2023 at 10:18:05AM +0200, Claudio Fontana wrote:
>> Hi,
>>
>> I think this discussion from ~2015 could potentially be be historically relevant for context,
>> at the time we had the problem with CNTVOFF IIRC so KVM_REG_ARM_TIMER_CNT being read and rewritten causing time warps in the guest:
>>
>> https://patchwork.kernel.org/project/linux-arm-kernel/patch/1435157697-28579-1-git-send-email-marc.zyngier@arm.com/
>>
>> I could not remember or find if/where the problem was fixed in the end in QEMU,
> 
> It's most likely commit 4b7a6bf402bd ("target-arm: kvm: Differentiate
> registers based on write-back levels")

Indeed, thanks!

C

> Thanks,
> drew
> 
>>
>> Ciao,
>>
>> Claudio
>>
>> On 9/1/23 21:23, Colton Lewis wrote:
>>> On Fri, Sep 01, 2023 at 09:35:47AM +0200, Andrew Jones wrote:
>>>> On Thu, Aug 31, 2023 at 07:00:52PM +0000, Colton Lewis wrote:
>>>>> Due to recent KVM changes, QEMU is setting a ptimer offset resulting
>>>>> in unintended trap and emulate access and a consequent performance
>>>>> hit. Filter out the PTIMER_CNT register to restore trapless ptimer
>>>>> access.
>>>>>
>>>>> Quoting Andrew Jones:
>>>>>
>>>>> Simply reading the CNT register and writing back the same value is
>>>>> enough to set an offset, since the timer will have certainly moved
>>>>> past whatever value was read by the time it's written.  QEMU
>>>>> frequently saves and restores all registers in the get-reg-list array,
>>>>> unless they've been explicitly filtered out (with Linux commit
>>>>> 680232a94c12, KVM_REG_ARM_PTIMER_CNT is now in the array). So, to
>>>>> restore trapless ptimer accesses, we need a QEMU patch to filter out
>>>>> the register.
>>>>>
>>>>> See
>>>>> https://lore.kernel.org/kvmarm/gsntttsonus5.fsf@coltonlewis-kvm.c.googlers.com/T/#m0770023762a821db2a3f0dd0a7dc6aa54e0d0da9
>>>>
>>>> The link can be shorter with
>>>>
>>>> https://lore.kernel.org/all/20230823200408.1214332-1-coltonlewis@google.com/
>>>
>>> I will keep that in mind next time.
>>>
>>>>> for additional context.
>>>>>
>>>>> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
>>>>
>>>> Thanks for the testing and posting, Colton. Please add your s-o-b and a
>>>> Tested-by tag as well.
>>>
>>> Assuming it is sufficient to add here instead of reposting the whole patch:
>>>
>>> Signed-off-by: Colton Lewis <coltonlewis@google.com>
>>> Tested-by: Colton Lewis <coltonlewis@google.com>
>>>
>>>>> ---
>>>>>  target/arm/kvm64.c | 1 +
>>>>>  1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
>>>>> index 4d904a1d11..2dd46e0a99 100644
>>>>> --- a/target/arm/kvm64.c
>>>>> +++ b/target/arm/kvm64.c
>>>>> @@ -672,6 +672,7 @@ typedef struct CPRegStateLevel {
>>>>>   */
>>>>>  static const CPRegStateLevel non_runtime_cpregs[] = {
>>>>>      { KVM_REG_ARM_TIMER_CNT, KVM_PUT_FULL_STATE },
>>>>> +    { KVM_REG_ARM_PTIMER_CNT, KVM_PUT_FULL_STATE },
>>>>>  };
>>>>>
>>>>>  int kvm_arm_cpreg_level(uint64_t regidx)
>>>>> --
>>>>> 2.42.0.283.g2d96d420d3-goog
>>>>>
>>>
>>
