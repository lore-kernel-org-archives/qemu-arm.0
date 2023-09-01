Received: by 2002:a05:7022:e10:b0:69:9a19:fb41 with SMTP id dx16csp1162989dlb;
        Fri, 1 Sep 2023 12:23:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPbKdb8GunhkFk0WI28HY1JiZ6pyTYQwef013zZP2IvHOC02wT7Q6ld85GlSaPgS09Huxh
X-Received: by 2002:a50:ee15:0:b0:52b:d187:61c2 with SMTP id g21-20020a50ee15000000b0052bd18761c2mr2472578eds.29.1693596207430;
        Fri, 01 Sep 2023 12:23:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693596207; cv=none;
        d=google.com; s=arc-20160816;
        b=oUSGaVlKMEDObf7noQV314oXpCHIYN0/Ixe3v5bKWRDqOHwub1s0QSzjmCrxNa+gD7
         PjyKMGiszznWex+T9ACD818r1FkXxtNkaiuYXpcKP/7iptsO/nR3v5MFUJjDZ2TLeKNw
         Lv25snAOjO/EQRBkUlTjJnLoy5U7IEzwpSEvXqIBfYe5S11diRmhywTtZ+tt4KDzCPsj
         T/iVnwdLOd4HkozAZIPL8P49/YrDI7TqXSPs/gIXuFqtJRnTyNUoqp93izHoQU5FxooD
         vY3YtOh2AOzQdTKOghgTvpw3VX5Mz3IoLVHiZTmLaKOPyScgOstZPPKkXC277lFXR9pm
         dmgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:in-reply-to:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=Jk8eU1YUzlGph2kkfy1NgH1ax2sGgPgvKzoaDKemgb4=;
        fh=xbG7lXg1EnmYaPrY5E/uKTSdLqCSxKn7Y1kmT7J4cUo=;
        b=XTAX7RID3bM5YAXO8a2bgfNZZYwaKPfS4oNb1FDgnN80NrguGMvwf3OnefV99cywuQ
         ubXDidHQ4th25Fc/2Qacpzh65y/2vmviQ5r6itNhgg8Hz+fj3q6Uy0DKbDS35mqWdy8Y
         8Cryi06dE5bOAIswYEsTfzVWAfF4gF3ebviEJunwL1/GPiO1qeBkV9dLvCf07SoufKww
         3nJXZYW5Ul4AH44z2GzPzJaCqd26j0QX9YLZ+u6vfYejBVAI/WpqKcKdHycCNXDYLdIu
         D1hmOGq2UEYyNDZsLsiJbCPFr3CyAvIHh5YFvsTGXxDc+vvR2MffCJOwzABUR1cpoba3
         K6YQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20221208 header.b=Ot+3td20;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id s25-20020aa7d799000000b0052a46e12565si3051946edq.194.2023.09.01.12.23.27;
        Fri, 01 Sep 2023 12:23:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20221208 header.b=Ot+3td20;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243373AbjIATX1 (ORCPT <rfc822;mathieu.poirier@linaro.org>
        + 2 others); Fri, 1 Sep 2023 15:23:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbjIATX1 (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 1 Sep 2023 15:23:27 -0400
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 776FF10DF
        for <kvm@vger.kernel.org>; Fri,  1 Sep 2023 12:23:24 -0700 (PDT)
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-34b4b2608e3so7987875ab.3
        for <kvm@vger.kernel.org>; Fri, 01 Sep 2023 12:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693596204; x=1694201004; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Jk8eU1YUzlGph2kkfy1NgH1ax2sGgPgvKzoaDKemgb4=;
        b=Ot+3td20zRC5TQ5TGtiiXj8uJP35Gw26KIKOyw0DOG28VudLa7bkvPiOS6M1fzBP4y
         rbP+G3IOjE6U+uG/ILpLLh83pnvAdgcbBqGhAV7yd8QZLA10pR9761rOxnysP8CkC2do
         eji+iWIYYJzmwNPHGYglyKX2LJVSq482Lrlc+QUWJbEf2gShKnDdr2yFWiN/9DTEp0E3
         gw5moI419cugO/TF42WHrBB6LHjOSRQo8J+Xc6ysqmNid7eFaWwg6NXqstv7xw1NRbmR
         wvqNoJYGKofBERXWzRqlgCSzV9trKvezzWqin4zR2KLNwIeXNYowPs33Dzr7pNhGPCwk
         arIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693596204; x=1694201004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jk8eU1YUzlGph2kkfy1NgH1ax2sGgPgvKzoaDKemgb4=;
        b=flbBk2+FAYdU3CKJuiV14pT0ESHycjT61boFj/5YNnPqWGPuHVmz9Rp/JVSzxNBYIy
         kfHifFS1WP6KoPpXff0qWmH/SoUGTaxSCruoMbsaopvRMBb3JUTBMwxImoLK/Ppomzi5
         zFO4DDphV27TcjkOzlREkudnSkpfm6lHstJODYJwGCeVC4LlT+Oq04qbv5/WW9L5bWqN
         zOVbqul4QB48vnBF3Hgo/KRWlHkzNffbFGO9mvFCqMePbV5C7TnGjAlN+HCaJsSm2k1B
         +EqRAopyvvNhDx4NYJZ2XyWr9SI2zBdSqCFHTS+BXyunY/EOjiBg22ia/EzzHTRiNsue
         /r7g==
X-Gm-Message-State: AOJu0Yxt3soGNOwmNjA07V/rt6Yso6HgjQ8fDUBSmPe4d4MlrXe3g4yK
        fYLKrCTYS1E7RgF3BhBb5bdTXw==
X-Received: by 2002:a92:d284:0:b0:349:3c0:395d with SMTP id p4-20020a92d284000000b0034903c0395dmr3617488ilp.1.1693596203704;
        Fri, 01 Sep 2023 12:23:23 -0700 (PDT)
Received: from google.com (30.64.135.34.bc.googleusercontent.com. [34.135.64.30])
        by smtp.gmail.com with ESMTPSA id v12-20020a92d24c000000b00345d6e8ded4sm1252896ilg.25.2023.09.01.12.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 12:23:23 -0700 (PDT)
Date:   Fri, 1 Sep 2023 19:23:20 +0000
From:   Colton Lewis <coltonlewis@google.com>
To:     Andrew Jones <andrew.jones@linux.dev>
Cc:     qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
        kvm@vger.kernel.org, qemu-trivial@nongnu.org
Subject: Re: [PATCH] arm64: Restore trapless ptimer access
Message-ID: <ZPI6KNqGGTxxHhCh@google.com>
References: <20230831190052.129045-1-coltonlewis@google.com>
 <20230901-16232ff17690fc32a0feb5df@orel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230901-16232ff17690fc32a0feb5df@orel>
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 1aJTNX5E+3Mx

On Fri, Sep 01, 2023 at 09:35:47AM +0200, Andrew Jones wrote:
> On Thu, Aug 31, 2023 at 07:00:52PM +0000, Colton Lewis wrote:
> > Due to recent KVM changes, QEMU is setting a ptimer offset resulting
> > in unintended trap and emulate access and a consequent performance
> > hit. Filter out the PTIMER_CNT register to restore trapless ptimer
> > access.
> >
> > Quoting Andrew Jones:
> >
> > Simply reading the CNT register and writing back the same value is
> > enough to set an offset, since the timer will have certainly moved
> > past whatever value was read by the time it's written.  QEMU
> > frequently saves and restores all registers in the get-reg-list array,
> > unless they've been explicitly filtered out (with Linux commit
> > 680232a94c12, KVM_REG_ARM_PTIMER_CNT is now in the array). So, to
> > restore trapless ptimer accesses, we need a QEMU patch to filter out
> > the register.
> >
> > See
> > https://lore.kernel.org/kvmarm/gsntttsonus5.fsf@coltonlewis-kvm.c.googlers.com/T/#m0770023762a821db2a3f0dd0a7dc6aa54e0d0da9
>
> The link can be shorter with
>
> https://lore.kernel.org/all/20230823200408.1214332-1-coltonlewis@google.com/

I will keep that in mind next time.

> > for additional context.
> >
> > Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
>
> Thanks for the testing and posting, Colton. Please add your s-o-b and a
> Tested-by tag as well.

Assuming it is sufficient to add here instead of reposting the whole patch:

Signed-off-by: Colton Lewis <coltonlewis@google.com>
Tested-by: Colton Lewis <coltonlewis@google.com>

> > ---
> >  target/arm/kvm64.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> > index 4d904a1d11..2dd46e0a99 100644
> > --- a/target/arm/kvm64.c
> > +++ b/target/arm/kvm64.c
> > @@ -672,6 +672,7 @@ typedef struct CPRegStateLevel {
> >   */
> >  static const CPRegStateLevel non_runtime_cpregs[] = {
> >      { KVM_REG_ARM_TIMER_CNT, KVM_PUT_FULL_STATE },
> > +    { KVM_REG_ARM_PTIMER_CNT, KVM_PUT_FULL_STATE },
> >  };
> >
> >  int kvm_arm_cpreg_level(uint64_t regidx)
> > --
> > 2.42.0.283.g2d96d420d3-goog
> >
