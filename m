Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3776762ejc;
        Tue, 24 Jan 2023 08:12:49 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtGdPeje23HFWCLJUlHVggO7niOo37tfZmaiDlnfJptEakqX6fu092QjjN5RhAzg54cV6US
X-Received: by 2002:a05:6402:28ca:b0:49c:96f9:417e with SMTP id ef10-20020a05640228ca00b0049c96f9417emr29499250edb.2.1674576769274;
        Tue, 24 Jan 2023 08:12:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674576769; cv=none;
        d=google.com; s=arc-20160816;
        b=LgU6j7JxzrT462+6EKqcLh5O/7y62AOoxh4o13bmP+ocQPZQG2OeW2k6v20FXOZQC9
         D2DIIG+JwZvkTnp59JCKuyK4PJlZz0Rl2jxVGzDmXSNwzXr4D1sHTUHW6atxj3zaUIG4
         2GZBjF/muC+Q4sWi+3pvcxw8H5SGEWdN38LotHvgkoWH+L1/9bePzKwzHa+7nK3jb506
         zaFYeEiNzOOgTkCY+MDPb6oo17VKSjusol9rZcbAXCZR4cvXSwrgwirNLtjfxbhmq0yE
         qmym2Zerfu73DD3UTnA68gFKcrzSvfoQpA+xHsI6/U5+HfdvCalIXXly2MeLq8C7cCN2
         C0+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=d/92yOfPC4quQ0Hjjdafz7RrLaQ9Cr/2dayimzGP+m4=;
        b=Pi/3r3FBQMoXnNSziHWMTvEDPcHX5k7RQn03cUJomqhTz26rKadJ+f86M6p1yCb6aR
         JZEeTDBcGdWVcypT0oV3WQtwMQNdNjhwuWzcBMMivAhZuGTjMDggUofBgraUNIONgvKY
         9GDN8+qRui4P7vJRjwqkIiPRXO77cEWOLdy1ws/AKn4agTX0N9nHSgnZQXBbxajBG7Ig
         dTKN3fX5YFXF3mGH/+UzEWwfTYntgVMdAIfxMSPHsp5hbXqT7eOlPISkQBNvsmLhTQ50
         +F7suub7fjgsCpg4xllasisIa54vDJm5Abo/n7SQXqTmscMg1k4IuAbO3bX3qASqb4Rd
         Dg8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VV5GTAwE;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id c90-20020a509fe3000000b0047039339346si3568324edf.550.2023.01.24.08.12.49;
        Tue, 24 Jan 2023 08:12:49 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VV5GTAwE;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234126AbjAXQMr (ORCPT <rfc822;mathieu.poirier@linaro.org>
        + 3 others); Tue, 24 Jan 2023 11:12:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234194AbjAXQMq (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 24 Jan 2023 11:12:46 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2882961A7
        for <kvm@vger.kernel.org>; Tue, 24 Jan 2023 08:12:45 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id 207so11518571pfv.5
        for <kvm@vger.kernel.org>; Tue, 24 Jan 2023 08:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d/92yOfPC4quQ0Hjjdafz7RrLaQ9Cr/2dayimzGP+m4=;
        b=VV5GTAwEo16SgQUcigaADg3meFOjdJphHrDViP2i4CJXrOKWBOOOGNJCRN9qYNaWN3
         lOrzL0IM2mws4V6s+8ltVdnLSauZINhBMpMI/XbqHqiDkWgi9BMu+7/uqjt32J0ZdcBx
         jhZL+Yq3Bw7W7hSoaLZSbO2OaQqKyueYDNQXixH9NntCMq+vp/D6RLg96o1Bfc1cbgCX
         4xr+e98LGI0k1xbvzM7dmBXPtM5EEHP/mxV8AyM2WJoz3bRpZSIkd3sj6ztRqxcVHHmB
         cAjSOk1NdtjCFbbzSD2GM8SREq8Djd7h/8V6aTopsqjA5fCQUm4MlFNPreQLR58j2HQt
         /2WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d/92yOfPC4quQ0Hjjdafz7RrLaQ9Cr/2dayimzGP+m4=;
        b=7GPQP3HQnmP2EZ+PF29fwjEh97WVp0dwfqsTfDZWJQOunQNTxkSSkFXQ9GlbLPsqAx
         KzdAQSV4XbbjXC1L2+a+BAFjBnWeRKtTiOep6OTrw6gvXwXjjIJjzaQFIHpAX08fZ+mx
         TmauIHIsuF9TQB9S143syqafwsfa+uDip+XCqLfDXIHNqlonYxKi+KnKG6GTUCL2Kx5W
         SxZrqr/boZ4pFZP4E5TlnZ5QMDw9cEGVheulfqOQCaoXdWbfKVUCbjle+NPiFs90wb5q
         Qz1HKvESX7NmXFRScdhHa2BQmmo49VlyN21IY70RTX59pY8lFS/zIur+3++TPJGJkghR
         UwWw==
X-Gm-Message-State: AFqh2kqCsjV2LaBZClZoHKOd9sVOqMs7HkocvWc32WjQfdOpyKxAKH0l
        ChncY+gK2RgxujmXFYjutJLjE3Dh8BvKCz3gCqRz1g==
X-Received: by 2002:a62:61c4:0:b0:58b:e9af:948b with SMTP id
 v187-20020a6261c4000000b0058be9af948bmr3194053pfb.26.1674576764642; Tue, 24
 Jan 2023 08:12:44 -0800 (PST)
MIME-Version: 1.0
References: <20221201103312.70720-1-akihiko.odaki@daynix.com>
In-Reply-To: <20221201103312.70720-1-akihiko.odaki@daynix.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Tue, 24 Jan 2023 16:12:33 +0000
Message-ID: <CAFEAcA9sj838rCyPrxAOncXKmdOftZeM16rKiXB5ww7dSYY0tA@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Propagate errno when writing list
To:     Akihiko Odaki <akihiko.odaki@daynix.com>
Cc:     qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org,
        Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: by0ywFYiilGb

On Thu, 1 Dec 2022 at 10:33, Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>
> Before this change, write_kvmstate_to_list() and
> write_list_to_kvmstate() tolerated even if it failed to access some
> register, and returned a bool indicating whether one of the register
> accesses failed. However, it does not make sen not to fail early as the
> the callers check the returned value and fail early anyway.
>
> So let write_kvmstate_to_list() and write_list_to_kvmstate() fail early
> too. This will allow to propagate errno to the callers and log it if
> appropriate.

(Sorry this one didn't get reviewed earlier.)

I agree that all the callers of these functions check for
failure, so there's no major benefit from doing the
don't-fail-early logic. But is there a reason why we should
actively make this change?

In particular, these functions form part of a family with the
similar write_cpustate_to_list() and write_list_to_cpustate(),
and it's inconsistent to have the kvmstate ones return
negative-errno while the cpustate ones still return bool.
For the cpustate ones we *do* rely in some places on
the "don't fail early" behaviour. The kvmstate ones do the
same thing I think mostly for consistency.

So unless there's a specific reason why changing these
functions improves behaviour as seen by users, I think
I favour retaining the consistency.

thanks
-- PMM
