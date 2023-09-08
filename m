Received: by 2002:a17:906:bfc6:b0:9a1:fa4e:495e with SMTP id us6csp300444ejb;
        Fri, 8 Sep 2023 02:45:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOvM6WjSPOj0pLvIf5yi2kGxpBSfSRuyeatV+cPnhJZo2RP4SAUv+6eFPiQw4SEUYBKigv
X-Received: by 2002:a17:902:cec2:b0:1bf:557c:5a2c with SMTP id d2-20020a170902cec200b001bf557c5a2cmr2495698plg.44.1694166333417;
        Fri, 08 Sep 2023 02:45:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694166333; cv=none;
        d=google.com; s=arc-20160816;
        b=eporNvxlEUX39ZjNd790tiwlva0SOJa8c5irgZaFC+uVsTI3pO6+0NeTu/zMxar+Pj
         kNBT/NtpscBSuVkyI31sxzRhYl1X/vvNsPYvt8QfXAITWqDBcs2tR9aNGRDWqigPdKxf
         4UIRc8Igsix+wGAoxuovUH0zsd+0gSfu7V7SPsZG459F70IE9YOs3h5Xfv5Qxl8i5r56
         XBEt1a/RI6DMvDThgnFECOlQtLnWi8gcHKqk+COs58iMIkVX/4cWX4lnod1P9DlMnS2t
         KhyyCUGGHm43NYr6gTsZdfeIq3pyXhDdajhaaDV6dTsfjKiaQr/IWH+sHh2yYPODnRbQ
         JkQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=xfuX/wtvWACG6RTooNCOtf7/3iq0sILbAKOhnwnHpbI=;
        fh=yKYXT6AL55I/w7Y0M5/wl4Xu2VGccbwv3Anqi9qWdcU=;
        b=iJA2dlJ6e4uetArSCCwT9IKYOrjCOMSMR9/6j2janyM3feMgVcceYfGp5xsFpf3DTp
         HyzK7BnUCzgRRwc461g+oGkK52JmFuFJqi5rwrMgWgeV9I2l5EsqRau4TnKG5kOFCrnY
         0u6eoubyWHqQShJXd74DNb7/Nz8EE4MCjI5082wqJmEw2JE22DzM1QZiacNkFQCfqcd9
         2jzJ4PNUlUhu61jpYANMTKJ4rodGM1lH78xjxgdzLkvQmYD56n08a5Lsvgt3pst6fpXc
         D4QkjOGl48s5rRT5WafdybzewkC0SPmPZP9b4pidiRAoczxpAVoKMzDmHAfmfEhpCSfi
         BL7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VNw5as5X;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id f1-20020a170902684100b001b8922e82e3si1317161pln.297.2023.09.08.02.45.33;
        Fri, 08 Sep 2023 02:45:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VNw5as5X;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241115AbjIHJpf (ORCPT <rfc822;mathieu.poirier@linaro.org>
        + 2 others); Fri, 8 Sep 2023 05:45:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231779AbjIHJpf (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 8 Sep 2023 05:45:35 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 069DF19A8
        for <kvm@vger.kernel.org>; Fri,  8 Sep 2023 02:45:31 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-52683b68c2fso2551475a12.0
        for <kvm@vger.kernel.org>; Fri, 08 Sep 2023 02:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694166329; x=1694771129; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xfuX/wtvWACG6RTooNCOtf7/3iq0sILbAKOhnwnHpbI=;
        b=VNw5as5XutkttoVcqb6cAMQ16kOYb+vOWc1zreD/RGob8QFTWVslmZOd/lQDdwc12W
         th5jGsnuceshnh5QSvWullNnPRQoIi4WCNEKPS0WH1f4JcRUlWMFMRfpxHRWWmcMFEJT
         8vWDS4myITnTAflxakBw6L55GGvYjJGnSHiBMWnqPoyuwPqVo52KQg+DL3h6hgibWxgF
         PLdlG4B21w8jxd2BBl0QFchNDOSWFZsjgmkbM8t4WI8ps+WqS9yuWXvIlU5u0OpGg61K
         wH3bgasokCF6duFnwLLn3d9v+qeeogKRewEtlzvpycgMqm7TE6YiqqBJBkPsJtNvwzt+
         qrPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694166329; x=1694771129;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xfuX/wtvWACG6RTooNCOtf7/3iq0sILbAKOhnwnHpbI=;
        b=QowpFPyP7bCfQ9RngqzYxEF9LEF+9goZ5Rh5bqbbyDchxO7jnT1TKbnN+qn/2chjpk
         /Oxz5MaGJSw3YhMKRXtNn7hUH/W2Haur/4g4u0DYqOeDHm5wrwZmQOHJRD4eQg4+OWvV
         5q3JUQ1TS6RQ05iTEt1IcQ5eGBaPX9AZ4q+iIOO72nq7eMQaxpVLAHUtUYG2I86aXdKF
         syX11PRXnhLWfga0e6qN+GZuZJnVQdOb5TYQb5Gtb8aYPs92fyrULoMBH+GlYxBGoaAx
         F5lMYXg/V2kSeyHKL7g6mSpBZFwpXtM8Tl0k1EZLS3kv81Hm0Jq29I9CZWbvSQPlyhMG
         RRNg==
X-Gm-Message-State: AOJu0Yy3nU5uNeIuDRF9gklv7n6qtjzUxA/gKOMsF+Y7V0SE7quNeJmq
        yiob51DxccVZiEc/HQEErJsYvfschLHa2ghOtU9MPw==
X-Received: by 2002:a05:6402:2023:b0:523:aef9:3b7b with SMTP id
 ay3-20020a056402202300b00523aef93b7bmr1490001edb.4.1694166329551; Fri, 08 Sep
 2023 02:45:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230831190052.129045-1-coltonlewis@google.com> <7d3615d0-d501-a28c-eebc-b3f7a599fc23@tls.msk.ru>
In-Reply-To: <7d3615d0-d501-a28c-eebc-b3f7a599fc23@tls.msk.ru>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Fri, 8 Sep 2023 10:45:18 +0100
Message-ID: <CAFEAcA-9kGf2SDs9Yp5K-AgqV-41G9YQL6OVzfke6eHNBFt7CA@mail.gmail.com>
Subject: Re: [PATCH] arm64: Restore trapless ptimer access
To:     Michael Tokarev <mjt@tls.msk.ru>
Cc:     Colton Lewis <coltonlewis@google.com>, qemu-devel@nongnu.org,
        Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
        kvm@vger.kernel.org, Andrew Jones <andrew.jones@linux.dev>,
        qemu-trivial@nongnu.org, qemu-stable <qemu-stable@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: W89H5AAwIzHB

On Thu, 7 Sept 2023 at 20:31, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> 31.08.2023 22:00, Colton Lewis wrote:
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
> > for additional context.
> >
> > Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> > ---
> >   target/arm/kvm64.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> > index 4d904a1d11..2dd46e0a99 100644
> > --- a/target/arm/kvm64.c
> > +++ b/target/arm/kvm64.c
> > @@ -672,6 +672,7 @@ typedef struct CPRegStateLevel {
> >    */
> >   static const CPRegStateLevel non_runtime_cpregs[] = {
> >       { KVM_REG_ARM_TIMER_CNT, KVM_PUT_FULL_STATE },
> > +    { KVM_REG_ARM_PTIMER_CNT, KVM_PUT_FULL_STATE },
> >   };
> >
> >   int kvm_arm_cpreg_level(uint64_t regidx)
>
> While this patch itself is one-liner and trivial and all, I'd rather
> not apply this to the trivial-patches tree, - it requires a little
> bit more than trivial expertise in this area.
>
> So basically, ping for qemu-arm@ ? :)

It is on my to-review/apply queue, yes.

thanks
-- PMM
