Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3284081lft;
        Mon, 4 Jul 2022 07:54:44 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vtpoaFC+9OGUaOiKkJPRHpIHfroFnLQDjGr6ypKPpgqllHDwYropRakIs5IabZag/J6ud0
X-Received: by 2002:a81:4bd7:0:b0:31c:91da:5a20 with SMTP id y206-20020a814bd7000000b0031c91da5a20mr8109446ywa.131.1656946484155;
        Mon, 04 Jul 2022 07:54:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656946484; cv=none;
        d=google.com; s=arc-20160816;
        b=r6L94K4Pv0Ngf1ocP/4rZpSRWOFi3G13O4q/uAtqSL/gjI1fJ7FiaNOH3dFc+ELRKA
         nI+wueg73pDvA86DsXI+UbJeJKQ0G87X3InSYlrTBIqBX/6Y1yzmN7qsi9c9GtSsScrv
         6Ybpdreo5oe/7vbt05jrm6TVAoDZYGfQ9SAR7zXlxFc7yBj/MPmsgnqgFaKz//U92KA9
         7tnEkomuvjNS1h+L8WZ5u6XK3hM5vwe7rWB0X98rR+NY0u5Hm6MyIMjFte6dI+aI8D6l
         bJGSaqVVetJ0woVwr0WguPnvgOFpyHWLS0dDu13He1IHwNr2S7P7tRtcgtJceYW9qca5
         R07A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=5v5L/YeDwfdpkj4LzyQbq+hQlaBO9PJsx7CUU6kb8OI=;
        b=rx2Q8XaPFhvaOHAV5xHFbowBtkS99Miu5LjmexUhTZt3wBWV99kslkbWAa0cIbf8YZ
         UzRkkfsPKcfclQnbW1Cw506VAx30rlHUUXC2W4QjqKIiPUHNiC3wCI7qxlBWkCft2E53
         /K8lErKyiHP7LFrCu7eSxJAVJgRnwVS3BzCfT+HSY3Erv90PUJPjSQ35bClQk8pmUrxS
         UtSx9gAzfgZOosxsmf7cbWJbBJZ/b/CKI/tZOQyV66yJ0+BkNqYZ0mIM1dOqYWhesXBZ
         MBGcjmpXL7Ulljdcy1ueo5du7jSgpojJqdE4dpXokkICc6TO3Zp7G5CcUILa0JyBSWCH
         +eAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cbRG08eR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u4-20020a0dd204000000b003187ff85348si41272651ywd.343.2022.07.04.07.54.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 07:54:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cbRG08eR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8NTH-0006kM-HL
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 10:54:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8NSv-0006eL-58
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 10:54:21 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:34575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8NSt-0003Ml-EH
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 10:54:20 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-31c86fe1dddso36841027b3.1
 for <qemu-arm@nongnu.org>; Mon, 04 Jul 2022 07:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5v5L/YeDwfdpkj4LzyQbq+hQlaBO9PJsx7CUU6kb8OI=;
 b=cbRG08eR2ZdN/ykgSKFYRMsSInRhLElcnSikzl3CWLAQfsDWRyWs6p/s7yZ4Xbyz5E
 hKRLOBKIm3MTeqa1a7TOhmEwFf7YdFW1QPCUfDGhIOyoQq7s3H3UdtE4P9iZHD8RiWrV
 1pzAusjtgnahskycc1aviLhjb1i/so88wqCTR/+xyCocEcS7aKvFPN/XDUhRhxXb4Tdg
 1IQw2OcYLgQ5GWvBaG699oqnl6dtvPwlLI8I1R1TxMMZJ1D4S6Eu5t6TV9+49HoYTHv0
 19AIkdKAKN0N4Fsqk5s8JZ1hVUQ1k/GetmQ6di9WucSHx8Xpdo6tp9nQO9+g8brpPonK
 NRGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5v5L/YeDwfdpkj4LzyQbq+hQlaBO9PJsx7CUU6kb8OI=;
 b=bs8jhVdvYGwTXYuCI0wrIKuiKoUOet4HUYSJlGEVnC9jDCTIdyJUTGxOXFCLsil81/
 uf2oMN8hrFeceVANfIquVS0lNsxYOycg7LdqNK3uOnJt+gxKVUxzQDzuUvbfUXj9xWg2
 jnIwvOxEa6kOIwO4sjKxyaJn8XuYgxDRkC3Iv5FZNmPhwlDey8bStf6uAlBN60zHs5PB
 SdUNJCyWITxYJ4hUkhPKwvfh7cOINQs2Y1HwfiLfTQ6ksCdq7C36NNwoojoSGG4nJ+3M
 +dOXD0bw1D2M6u7Di03CdHkDkisIWn5xM+VFzcHSCT/umOS51uDLJyhsoT47U27FZZ0p
 zs5Q==
X-Gm-Message-State: AJIora/0FLwHqlQsnnayXXLJXdHjcNbC8wekF0w5LPlsu2fY1ScBAN/T
 V5/IiDEOyGAG3U+3yNX95B25xVi/M0Q3ewXW+0pGQA==
X-Received: by 2002:a81:6a85:0:b0:31c:8624:b065 with SMTP id
 f127-20020a816a85000000b0031c8624b065mr11775538ywc.64.1656946457685; Mon, 04
 Jul 2022 07:54:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220703082419.770989-1-richard.henderson@linaro.org>
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 15:54:06 +0100
Message-ID: <CAFEAcA_5s3avpeHNO5cC0HS5Unq9QsCp9mTof4uqLJwE13h+pA@mail.gmail.com>
Subject: Re: [PATCH 00/62] target/arm: Implement FEAT_HAFDBS
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: q/PWUyJ+u1Nd

On Sun, 3 Jul 2022 at 09:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is a major reorg to arm page table walking.  While the result
> here is "merely" Hardware-assited Access Flag and Dirty Bit Setting
> (HAFDBS), the ultimate goal is the Realm Management Extension (RME).
> RME "recommends" that HAFDBS be implemented (I_CSLWZ).
>
> For HAFDBS, being able to find a host pointer for the ram that
> backs a given page table entry is required in order to perform the
> atomic update to that PTE.  The easiest way to find a host pointer
> is to use the existing softtlb mechanism.  Thus all of the page
> table walkers have been adjusted to take an mmu_idx that corresponds
> to the regime in which the page table is stored.  In some cases,
> this is a new "physical" mmu_idx that has a permanent 1-1 mapping.
>
> For RME, "physical" addresses also have page permissions, coming
> from the Root realm Granule Protection Table, which can be thought
> of as a third stage page table lookup.  So eventually the new
> Secure and Nonsecure physical mmu indexes will joined by
> Realm and Root physical mmu indexes, and all of them will take
> the new Granule Page Table into account.
>
> Previously, we had A-profile allocate separate mmu_idx for secure
> vs non-secure.  I've done away with that.  Now, I flush all mmu_idx
> when SCR_EL3.NS is changed.  I did not see how we could reasonably
> add 8 more mmu_idx for Realm.  Moreover, I had a look through ARM
> Trusted Firmware, at the code paths used to change between Secure
> and Nonsecure.  We wind up flushing all of these mmu_idx anyway while
> swapping the EL1+EL2 cpregs, so there is no gain at all in attempting
> to keep them live at the same time within qemu.

Is there no SMC/interrupt/etc at all which is handled as a "just do the
thing at EL3" without dropping down to secure EL2/EL1 ?

thanks
-- PMM
