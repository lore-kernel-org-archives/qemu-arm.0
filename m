Received: by 2002:a17:907:76b5:b0:9a1:fa4e:495e with SMTP id jw21csp441932ejc;
        Fri, 1 Sep 2023 00:35:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjuku2voKYFwMaw8jZkdj6ylSwtuXdn3Zq43ajgQotxCMPj/GXvECvUe0nxxwoY4P6B518
X-Received: by 2002:a05:6a00:2312:b0:68a:49bc:e094 with SMTP id h18-20020a056a00231200b0068a49bce094mr2256227pfh.25.1693553754572;
        Fri, 01 Sep 2023 00:35:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693553754; cv=none;
        d=google.com; s=arc-20160816;
        b=U9liI729VspOeiql+StnBmYmqy9ZhaU4lhDYGOkNW85qGe/oMM1AhOxJ7rKuQwI3rj
         xElhjpb9nJOjTY8jqE3NmxOOtd5mtv3G0qWvrdt5L7+FO4M0gue61IHhelT7PjW1AGYU
         +q7jdHc83HKbz4KrRyHDepMJ6RriZmlTPZQUaUovCWXlPS01obgT5GjrrYAzS9/Dab1n
         Hw9SW+3ija7h8tQ92NMWtk0mi2H6S53GH25xTWEydExq49PmSuf6aLk6hRMrYxVFiJ/D
         SS9BzalPiHSu4N8k3tYItWy+AYBg5zTy7VgpQdpkEHqF2YJL/mGk0JZUVavAIw1VRdXx
         14cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:in-reply-to:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:dkim-signature:date;
        bh=uSTkpiBeyJOSrDyBqH5u+QE0xVO5xgn5RZNE7JKVcac=;
        fh=Np9y3epmhxH8ZlLvZu6f+TflFieSH50SDa7sDSCsMbs=;
        b=fDGCfVDnPiu+GySsLKRAMLAACYcdepURxZs8ds1PJoFmGlGS+vQ8qBUVlY77UA9FIy
         S0ClZePbuotmfp0Id4J5lvmI13NcDADyK4+vXApqCOQXkNTK7tgnT9WixnCjk6FVnGW8
         dDIRaEbmKjcajwOWoNNrTw4IidqYdod3oeSA5+8LJtGH/rCEh3Wtx5KlACukU8k+6LZB
         DTJmHcVOOESmfqi7ld9eTTk0htrxLWOisJZD1ztXs9qrtY47rMn7qoAwursUgx9OdzEw
         Xo71+T4F6SJ5CxbDd94BRadKA/aNx98kN8ByQSsFwIv93Xs5neJbNO1RZl6G+k/kwj2x
         4xNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.dev header.s=key1 header.b=YunA2qSY;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.dev
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id b30-20020a63931e000000b0056a6ea68141si2604309pge.59.2023.09.01.00.35.54;
        Fri, 01 Sep 2023 00:35:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.dev header.s=key1 header.b=YunA2qSY;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.dev
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238181AbjIAHfz (ORCPT <rfc822;mathieu.poirier@linaro.org>
        + 2 others); Fri, 1 Sep 2023 03:35:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234471AbjIAHfx (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 1 Sep 2023 03:35:53 -0400
Received: from out-235.mta0.migadu.com (out-235.mta0.migadu.com [91.218.175.235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1F7310D2
        for <kvm@vger.kernel.org>; Fri,  1 Sep 2023 00:35:50 -0700 (PDT)
Date:   Fri, 1 Sep 2023 09:35:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1693553749;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=uSTkpiBeyJOSrDyBqH5u+QE0xVO5xgn5RZNE7JKVcac=;
        b=YunA2qSYy4vcIkBJ5DQbT7RYLD/OWgVFsES3gy7S0S3TpjGK/GdAZrCZgktwl4SABbAmV4
        v8IwiGnGXpVDM/6UsvuPyoH+He74lAdYDdEYiIWvqsGO/7CEIAE9D5BfBWG1uCUjeyVAco
        dRtzNx/jHIO+Bak/lzkbHN1MJvP+T0A=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Andrew Jones <andrew.jones@linux.dev>
To:     Colton Lewis <coltonlewis@google.com>
Cc:     qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
        kvm@vger.kernel.org, qemu-trivial@nongnu.org
Subject: Re: [PATCH] arm64: Restore trapless ptimer access
Message-ID: <20230901-16232ff17690fc32a0feb5df@orel>
References: <20230831190052.129045-1-coltonlewis@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230831190052.129045-1-coltonlewis@google.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: wIma2JWIGi22

On Thu, Aug 31, 2023 at 07:00:52PM +0000, Colton Lewis wrote:
> Due to recent KVM changes, QEMU is setting a ptimer offset resulting
> in unintended trap and emulate access and a consequent performance
> hit. Filter out the PTIMER_CNT register to restore trapless ptimer
> access.
> 
> Quoting Andrew Jones:
> 
> Simply reading the CNT register and writing back the same value is
> enough to set an offset, since the timer will have certainly moved
> past whatever value was read by the time it's written.  QEMU
> frequently saves and restores all registers in the get-reg-list array,
> unless they've been explicitly filtered out (with Linux commit
> 680232a94c12, KVM_REG_ARM_PTIMER_CNT is now in the array). So, to
> restore trapless ptimer accesses, we need a QEMU patch to filter out
> the register.
> 
> See
> https://lore.kernel.org/kvmarm/gsntttsonus5.fsf@coltonlewis-kvm.c.googlers.com/T/#m0770023762a821db2a3f0dd0a7dc6aa54e0d0da9

The link can be shorter with

https://lore.kernel.org/all/20230823200408.1214332-1-coltonlewis@google.com/

> for additional context.
> 
> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>

Thanks for the testing and posting, Colton. Please add your s-o-b and a
Tested-by tag as well.

Thanks,
drew

> ---
>  target/arm/kvm64.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index 4d904a1d11..2dd46e0a99 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -672,6 +672,7 @@ typedef struct CPRegStateLevel {
>   */
>  static const CPRegStateLevel non_runtime_cpregs[] = {
>      { KVM_REG_ARM_TIMER_CNT, KVM_PUT_FULL_STATE },
> +    { KVM_REG_ARM_PTIMER_CNT, KVM_PUT_FULL_STATE },
>  };
>  
>  int kvm_arm_cpreg_level(uint64_t regidx)
> -- 
> 2.42.0.283.g2d96d420d3-goog
> 
