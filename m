Received: by 2002:a17:906:bfc6:b0:9a1:fa4e:495e with SMTP id us6csp402828ejb;
        Fri, 8 Sep 2023 06:00:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHu9UKpVTfcVgmUjHSvDt30G06sy19baCXlQ4FtGH1UmP2eP70h9fFYc4AhPfD8C+bki9hJ
X-Received: by 2002:a17:90a:9113:b0:268:dad:2fdc with SMTP id k19-20020a17090a911300b002680dad2fdcmr2592228pjo.21.1694178046129;
        Fri, 08 Sep 2023 06:00:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694178046; cv=none;
        d=google.com; s=arc-20160816;
        b=KX91fLzTuZ07mBzISHk9bEHizCCEAYGv2k7+Z+uJ+YPxB16YpcLGLDoW9EsZVv2fW4
         NhkGD8Ehd/zYCihFXv68tbTc43N7BbSMamw8e10AXc6ncsV+lNx8BsxOaFjS9oWvFYH/
         CKKkxJIg2hWjH+BoEWVcU0HDPFz+fGXnbELTf3g+3vNTS3tfgDelCGX39H1QCo9dogWR
         R8roWxxz3/9GeyBdow6CydFOLYTcWnwn5sPnmbftV4Yu42moxxWdWmZSRhKhja9dmsTL
         ZECUoWAFNf/rZ6iuor57lkGnAn0hLCpWcoMhdrcxmu7ugh76lzV5xuAZhyVZpmTpU6ZU
         rLrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=vyqE/4f+pcS0/D+aGnrXy0k/CeoXT9vuXK8tKhXEawE=;
        fh=nqKT1eFtgM416bmAtwYklyfXwbGjStUXMHhI2BqlToA=;
        b=hI3Fl2Xl/9hpqmySjP0zubYvN4Yo6C4TLA6+OY3/ShK8NlQlWDbpWjt1A96iL5Mvdv
         AzIegHqFzsOBVgvOkKSaPcDvWgRc9ncSevblS/ytwiLPuq/xli5MUce8qIqb7HXx6OG3
         67L/Nkbq9vcjSGdArkInrLIDaRtd2F1NvS8wm5wus+H9af5eikf7hxm4WVRzP60Ca3gd
         e8kjJLcawu0pNa6iTPT61ZMQkVcTWrmOmJbUj9EgArauRaqg60vcPJtCNLyd/inZh/Q5
         snxA3tJl2GjCeilp4USJcHZvc+BzmSr2UyRMPtnD4CofO0NnWYCuSV0ICxECRSkCFOJc
         6mpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mKlX0iJl;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id t70-20020a638149000000b00563477c3519si1376271pgd.488.2023.09.08.06.00.45;
        Fri, 08 Sep 2023 06:00:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mKlX0iJl;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241666AbjIHNAs (ORCPT <rfc822;mathieu.poirier@linaro.org>
        + 2 others); Fri, 8 Sep 2023 09:00:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232859AbjIHNAr (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 8 Sep 2023 09:00:47 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CEBA19B5
        for <kvm@vger.kernel.org>; Fri,  8 Sep 2023 06:00:43 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-31dca134c83so1915053f8f.3
        for <kvm@vger.kernel.org>; Fri, 08 Sep 2023 06:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694178042; x=1694782842; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vyqE/4f+pcS0/D+aGnrXy0k/CeoXT9vuXK8tKhXEawE=;
        b=mKlX0iJlRLIn+wSL4xYyrDzcNP3vQEqcxCqDqJFGSUs8YXAYJ5oAHpE+EnKjn0GUBv
         3qrrt2xQL6jJZuxQuiYgQW6Lw2VF4QUgKsVTNejBzMznZjTM+x/LRNEG+17zN5tHgnG6
         MBTnCPwPbkldip5ZTSrd8PbL05dr/LP4oqOAgQqYJgM4Lu7ia45kziOnOChXaTITTRZo
         OODjZeclQg7V5ANC7CUuFsT5UTKQOvNPjRWJp9w0NxutbM9x/xXfUNwE3Q/nM6xfSRii
         NEradDalDhm18mpcf3S95/4nkyeAvfk8L6xXPFwznzgpOSjL+MrhV3P8uCHn1Soo9nmV
         roOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694178042; x=1694782842;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vyqE/4f+pcS0/D+aGnrXy0k/CeoXT9vuXK8tKhXEawE=;
        b=wWhdZ1TGM0vmTj/a2HFXapISxvhrNVm/xmiooShcJt1fQ6gVXxwI+K6e/xGbqxPqOU
         u8F+7OR+tzialR8ekub4O1yTtVoXCON2Ls6t2KV845+Qe+Y0FN1+SoVK3QNKarbvyCGF
         TNurFH7Vg3VViH688i4nf8Is3mU4oAH/9VK0OssC4KjM2sNbff0nNFa1EaaQxkIFgow0
         VK1WonoM5nte5SebD49jDmJ5H57hpA9UrYgGG79TRXdcKHYA252wUer8FxhzN+F4o7fN
         O4ZrNPd+WDlJiT2rIW1NFlHvAvEKp5C1wPQv3L3rgysEfytmiZ2aF5XSUF/btDFmB+e9
         X1/w==
X-Gm-Message-State: AOJu0Yz8bvKy6I9Y6sr2exmdFvRsFMcv9KXLpxJHcN4n+ctUTO3oL6jD
        5+frtZ0zYG+kaDU+Dzb8krtsl/SbXpBMjozfgOEDQA==
X-Received: by 2002:a5d:4b83:0:b0:313:dee2:e052 with SMTP id
 b3-20020a5d4b83000000b00313dee2e052mr2020172wrt.26.1694178041770; Fri, 08 Sep
 2023 06:00:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230831190052.129045-1-coltonlewis@google.com>
In-Reply-To: <20230831190052.129045-1-coltonlewis@google.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Fri, 8 Sep 2023 14:00:30 +0100
Message-ID: <CAFEAcA9x9OwCEd5s+q-Sk6mY2LcdmVv=9bCMtF_Ah7d5BmvMUg@mail.gmail.com>
Subject: Re: [PATCH] arm64: Restore trapless ptimer access
To:     Colton Lewis <coltonlewis@google.com>
Cc:     qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
        qemu-arm@nongnu.org, kvm@vger.kernel.org,
        Andrew Jones <andrew.jones@linux.dev>, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: BiueBn6IO9TH

On Thu, 31 Aug 2023 at 20:01, Colton Lewis <coltonlewis@google.com> wrote:
>
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
> for additional context.
>
> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> ---



Applied to target-arm.next, thanks.

-- PMM
