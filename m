Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp404708ejb;
        Thu, 16 Feb 2023 03:41:13 -0800 (PST)
X-Google-Smtp-Source: AK7set+TVqIVZB3NX8zGg/oejYlaAJzL6co26QLGzP3SX0LnRhfSpyJ+fDDZzGhTDnJc9b04SGp4
X-Received: by 2002:a17:906:5a6e:b0:8b1:3483:b825 with SMTP id my46-20020a1709065a6e00b008b13483b825mr5166257ejc.51.1676547673759;
        Thu, 16 Feb 2023 03:41:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676547673; cv=none;
        d=google.com; s=arc-20160816;
        b=OBI5gamxg5EPfmNYlSSJSQh84pawgyrPTkWj6BqkdPQMnLQAgBgMW5lcskMm40CXtu
         i/YODoUzvg9LDvnlT8sHzEI6T3W3LPTleXpZiszGSFCY8NMPF73+nURhl0jlBCQw1Lij
         ygwA2nUZLmZke4cO3HR8BoKYlPy1lhnhkFNutpn+ncOv5jI89ZnX/JKeyBD2y4lY4TsF
         W5ORaC+LCHlbGszCL0CyarX1dsc3ZupCmf6+kQ7oL5oCdtzoLDrEGRlHg8xyghdOzPW5
         h2eZ+qiBPrcY+qOAMXZCgLQ1bZ/ZUkqAqCxrW6K3gLShhv7Z/t438XrQph/dr0EGZNuq
         JDmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=HcDU0QdDBp6Yu8TjFSb3VmDDKlCY+rGLjdYpbDC/h1Q=;
        b=n/w81iCz/e6UqwjC9gRtDm8CcHRu0IoHKvRSGxtyKVwsHB2sZTTOn7GAcggAABEZbD
         o8irn8+Geplno6Z540GDq5sEauEj3VAqEVYeha1xD9KznAxTPtXT5VIAFa8uS1qKpYwS
         WMrpaYt2p23evZxmcNtAqafOT1PHNdwAXfzTm399EPtZKdCQpEechtTyLHBJAihKWGFq
         RyaziftnyhEfegfPnO89sNkS5EdePZ664h/pc7rBNqEzUHqiUSVjx6VRlvgYEgx7mg0H
         vqYmaCIkp2Mie/JPWBOwNIFh+pBT9EPZH08CDuEmgTavc5sxi8yx34lRauuvdd5o1aK3
         ep0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nWxQNRUA;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id v9-20020a17090610c900b008b103d47371si1586164ejv.858.2023.02.16.03.41.13;
        Thu, 16 Feb 2023 03:41:13 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nWxQNRUA;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229973AbjBPLlM (ORCPT <rfc822;mathieu.poirier@linaro.org>
        + 2 others); Thu, 16 Feb 2023 06:41:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229741AbjBPLlK (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 16 Feb 2023 06:41:10 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E2331ADD1
        for <kvm@vger.kernel.org>; Thu, 16 Feb 2023 03:41:05 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id v6-20020a17090ad58600b00229eec90a7fso6010110pju.0
        for <kvm@vger.kernel.org>; Thu, 16 Feb 2023 03:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HcDU0QdDBp6Yu8TjFSb3VmDDKlCY+rGLjdYpbDC/h1Q=;
        b=nWxQNRUADSRrTp10zKdldphEMLCx+zS3gH4e3q/aVxeOW/9OaGMeNWh07jHq14aRgw
         6sOvq6u+xvxPeYHta9pQxQjD9z+ZaCinL0defWRx2jpCywuC8oSqYgY61XMU01YM4MB8
         WvdHjFgFwEuIuP6OqPkaTE8SLmrmxXECj2GP01cLrZbWlpjQHYnJULMXuCX3WXDPJguJ
         OHCwk8eYJcwAE07fY1TDOalYtMstM9Dr+vx5d3RVSN4k8fSiD9GNZiSj1EyoWLPusyn8
         4mugDd95LDrs0Yl/hPko7nuC/0s4YIIKks6Rpxh4C5waGUazeafo0Kg6acx3uAEnLgS8
         wV6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HcDU0QdDBp6Yu8TjFSb3VmDDKlCY+rGLjdYpbDC/h1Q=;
        b=musBPQIEe0UdNsn39i0zyM1njvxYKHCISAx2Yu3cUR4+ByQ7fXD3KWCc1z492thB1M
         g7ar+IJiiedt1Jt7nw1i9M/6CBBylQjAdnGrCnwWHGel/iz8sLbwohWPchZyy8HeNfH7
         l/Kz3LnrX3HYRVwiUJ/uryKsDSPpF6G7PmizqTrAiXaotIwa3mff96GiqBNPnCwz5A6o
         5GJr2xmvjdu+2N+QrAhskSBOqyEma3S21T/HTlwzzVtqpbCCmPR0QB/SgRfPUUO/fAdn
         aZUuM9zwtxaWcrFEBU5A5bZcIc/KX1KB3P06xJn7bYZSh4HwsohqlYzHgcreZAL5KHQ6
         m2og==
X-Gm-Message-State: AO0yUKWLSDpjFACvEptl8MgdeFvyxe1o+25bAw6ri7ncjHeAh8imHtR0
        uJawMtrZTs0/w365zkQkVBPA2+NI0VkXWkuFT8K5mw==
X-Received: by 2002:a17:90b:5109:b0:233:dcb5:ee15 with SMTP id
 sc9-20020a17090b510900b00233dcb5ee15mr523032pjb.92.1676547664551; Thu, 16 Feb
 2023 03:41:04 -0800 (PST)
MIME-Version: 1.0
References: <20230203134433.31513-1-cohuck@redhat.com>
In-Reply-To: <20230203134433.31513-1-cohuck@redhat.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Thu, 16 Feb 2023 11:40:53 +0000
Message-ID: <CAFEAcA_QiVe=ZZ1VTVwUiGh6EL8F7qXT=3dnEb+xzUZORO_4Dw@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] arm: enable MTE for QEMU + kvm
To:     Cornelia Huck <cohuck@redhat.com>
Cc:     Thomas Huth <thuth@redhat.com>,
        Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
        qemu-devel@nongnu.org, kvm@vger.kernel.org,
        Eric Auger <eauger@redhat.com>,
        "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
        Juan Quintela <quintela@redhat.com>,
        Gavin Shan <gshan@redhat.com>,
        =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>,
        Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 8FgPIxDKj4R5

On Fri, 3 Feb 2023 at 13:44, Cornelia Huck <cohuck@redhat.com> wrote:
>
> Respin of my kvm mte series; tested via check + check-tcg and on FVP.

I've taken patch 1 into target-arm.next since it's a simple
cleanup.

thanks
-- PMM
