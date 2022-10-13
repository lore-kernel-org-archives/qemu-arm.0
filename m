Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp886399ejn;
        Thu, 13 Oct 2022 14:39:22 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM77V2UIeQcEAjWH7w9zArCY5vEvdCeeQiRLG6GWrZ6+M/lXWnWzCWd37jZrVVOs3S/ILXf3
X-Received: by 2002:ae9:e895:0:b0:6ee:74f7:d0e6 with SMTP id a143-20020ae9e895000000b006ee74f7d0e6mr1629234qkg.398.1665697162582;
        Thu, 13 Oct 2022 14:39:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665697162; cv=none;
        d=google.com; s=arc-20160816;
        b=lhT/ARycpBKf7fapJVIlNYFaDDMCpHVC70j8GAR5s8jOhqH5IHPV3Yab6NGk39eS3I
         RUYuFJarxJq1V2R4W4NL3hD0p07VNDnDa2dW7FH0cAeoW1pAOANo/ahzTy+r6KPNF3eJ
         vAUxodkP2aQo+OoR80GUYjVJa3hQae5vrBT/V1NAqqnkzMY7DaRxNAcug7TcYmVLaKza
         YPysHvqMXevdP4lLL3d7W1wDs8z81UspwN9j+RX1yH23QpUVADWB9iCXpnJkRf6zVmrW
         RLhxGnJebxpWfKQvoSOZ+fguilxgsXLE5I4XC9AGv5i0YdMSwPTBuEhjvsIU96xVTQ10
         CwfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ZVty32Eta7qbqugjeIYRFIZcE5wSHvhcmMJ40gLvtQQ=;
        b=sxiv9XiqxLlq9hGpNTh1NBhiBwJauC0p7z5DXpeCKv0gWb4rkWEEWtlEEvHFo7J0Hj
         yblW2rYRO6We7HMmraFXc7VX8okCWfDM31ywRC9fW4BDxP5ZXVcNDr3OqW6JQn9cEfEx
         2+NyuNcZ/TjwSKClGzKQdYBhY9doDp1HSjSatsFJoyS5mKeeh+hi1yFg+I7kDTkmvhnw
         U3kR2UOMgK8AsGTZvT6f45R/unpn9xaTciqpvtW77ifDON+QH5IXeeGAgJz8RcPsYMQS
         83vtVezKWUk3X1JohmwKA7eHTJjIy7oNDrUE/KU3xSZqbdB15NJSi4ZTDqsqn9UFnsHi
         Qm3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="I47/oIQ+";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 14-20020a0562140cce00b004b179766502si576342qvx.566.2022.10.13.14.39.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Oct 2022 14:39:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="I47/oIQ+";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1]:56446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oj5vG-0008IQ-3y
	for alex.bennee@linaro.org; Thu, 13 Oct 2022 17:39:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robh+dt@kernel.org>)
 id 1oj5jj-00052w-H3; Thu, 13 Oct 2022 17:27:27 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:57042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robh+dt@kernel.org>)
 id 1oj5jh-0002ad-HW; Thu, 13 Oct 2022 17:27:27 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 72254617AB;
 Thu, 13 Oct 2022 21:27:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D20F0C433D7;
 Thu, 13 Oct 2022 21:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665696436;
 bh=ZVty32Eta7qbqugjeIYRFIZcE5wSHvhcmMJ40gLvtQQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=I47/oIQ+iarLkwpW4HKwbb6079Tsl3ncfE/nv76YidVOY+oOgJvk2idDgQL59oqNm
 cvNrghBCUduUqf+M/BzbWTWHm4fWqRfi/pv4TQ1l8ZDbLQmaF9xdef1b2H1ka93agS
 vJ+AxT68df+f3Iv/3pPs3tBVxrn/fl007C1o6gLgq2tZryeXRfON5mxC77Z31s6GU2
 d+q1EppaYnyBF/JAuZiQd8DGcKR5r1KzJprwG4NL+OT3gLHFEXGjQvoYO1T0cI/dI4
 2lB5eCxWQXH579fGagwIjGu4HjdtoZ3BBovRjOh5OLzgrzHVki1bTJ6NrgEjazssQ3
 hcWGkoe3BsQFQ==
Received: by mail-vk1-f174.google.com with SMTP id b81so1428058vkf.1;
 Thu, 13 Oct 2022 14:27:16 -0700 (PDT)
X-Gm-Message-State: ACrzQf35ptMDG/jxmiL7IYIK9WXiqv8V6u0mcRa6kGRixWSCe7GcviWL
 43waVWNluNd2Bol8zFngezeEr6BK2vOMe+QgPw==
X-Received: by 2002:a1f:3d4c:0:b0:3aa:feb8:3ec6 with SMTP id
 k73-20020a1f3d4c000000b003aafeb83ec6mr1235295vka.26.1665696435808; Thu, 13
 Oct 2022 14:27:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220927100347.176606-1-jean-philippe@linaro.org>
 <20220927100347.176606-9-jean-philippe@linaro.org>
 <CAFEAcA8uuzcHS3B3VY=J38gSrZUhnaTDKq1ei0rwtJtoG843bA@mail.gmail.com>
In-Reply-To: <CAFEAcA8uuzcHS3B3VY=J38gSrZUhnaTDKq1ei0rwtJtoG843bA@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 13 Oct 2022 16:27:06 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKvXZ6J_H8zhsAkvpAyZvymVbxk1X-3JMV44-9yn7z+1w@mail.gmail.com>
Message-ID: <CAL_JsqKvXZ6J_H8zhsAkvpAyZvymVbxk1X-3JMV44-9yn7z+1w@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] hw/arm/virt: Fix devicetree warnings about node
 names
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=139.178.84.217; envelope-from=robh+dt@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 13 Oct 2022 17:38:54 -0400
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
X-TUID: Q66imeIBxJma

On Tue, Sep 27, 2022 at 6:28 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 27 Sept 2022 at 11:12, Jean-Philippe Brucker
> <jean-philippe@linaro.org> wrote:
> >
> > The devicetree specification requires that nodes use a generic name
> > where appropriate. Fix the corresponding dt-validate warnings:
>
> Either:
> (1) guests are looking for devices in the DT by node name. In that
> case we can't change the node names without breaking them

Using node names is generally wrong unless the node name to use is
defined and that's the only way to identify them (e.g. /chosen).

> Or:
> (2) guest look for nodes by compatibility, in which case why
> do we care what the exact format of the node name is?

The spec[1] has defined standard class node names going back to 2008.
That covered all the names here except for 'iommu' and those names
date back to the 1990s. Obviously, there has been no checking of them
or many things for a long time, but now we can check much more than
reviews ever could we have a huge technical debt. The main reason on
care on these is just consistency.

Rob

[1] https://elinux.org/images/c/cf/Power_ePAPR_APPROVED_v1.1.pdf
