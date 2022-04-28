Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp1710834lfu;
        Thu, 28 Apr 2022 06:01:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDnxZ9Zri3p0fXdXjJldPZAfjeTiMZcc+C6DuVI7Fua+3jYWK7x5zFkkCXxY4K8l600orH
X-Received: by 2002:a05:6102:215b:b0:32c:d9fa:f570 with SMTP id h27-20020a056102215b00b0032cd9faf570mr5886766vsg.54.1651150885187;
        Thu, 28 Apr 2022 06:01:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651150885; cv=none;
        d=google.com; s=arc-20160816;
        b=RWFSEPDtAxCxEJx8Q7TY6Xc4BrTqyFa0EHgRJOhVl+YAo54KjOU0MUJn+UPV7moBjv
         VDZdS1Zkmmd5H1UeJaCOeU+TD4bUAZ0AQ7rb8aPn+yXGuOk+s4wpf/cQ7YnIBibHKd0u
         JbzUjFMT160jMyvcbIyQ27MfBRk4Av0lVF5mI/kS9DOEOWNmcg1uqshwecra7akN6Px/
         0Y4tlh0M919WrabTxzYLhns6lo7yLAc8Gs3jayDdoP1z0pqJBXyR9Ifwb9T01y8oLUdM
         hS+72HjZDcg/yDicVyJQ1U/UJbxRLhSAm7I2deijWFGXzicyEc8Cx/Ek+TDKRoVTzhql
         HpLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jRq2wBEpPNcqdkumVMkeg6cjECg35N5fx2Uzmbr9rLo=;
        b=AM9Ah6AxELRJwHK70FVPR5szSrda41LGikZHz8dPdZLBM+WrJ2UBQO01sm/5+FHGue
         kfkSVYqu2xu1X0TSSGTBGaT2aHL+Cdztf53NCp5V12/tItAAPM7jyhu8Q3Od5VFcM15T
         CYkVa9vdD3qYn3og/lBGCUk+UTuQJ7nLGgNzzafjx5RQiigZ8ACC8gJ/oOxNGDVtLOix
         I8bqnNk3m9tUixsGFupP6H4hDtulRAShOu9Uz+uXSEBRYsIBLUXqvCeYQpJjzCSK+T+3
         lPE27rwBIKpBllfnUhM3NAiPrFOnmq+kiFRP7V0dWfpPLzwRHcOv+SIRFSghxTPi4z+S
         BGnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Cgtq+3dK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f27-20020a67d89b000000b0032cd8192c4bsi389852vsj.486.2022.04.28.06.01.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Apr 2022 06:01:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Cgtq+3dK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nk3ls-00011m-Id
	for alex.bennee@linaro.org; Thu, 28 Apr 2022 09:01:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk3jc-0007zt-Fo
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 08:59:04 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:47046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk3ja-0002gg-UI
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 08:59:04 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id i38so8803308ybj.13
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 05:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jRq2wBEpPNcqdkumVMkeg6cjECg35N5fx2Uzmbr9rLo=;
 b=Cgtq+3dKt8U1KJfYHjzErgQdjdCRhkwyBk7vh/+Bg/LEf40GqZ+aZNM/MrunQ5ZeX8
 sXTZpZvLS09Go2f4W55LjAQuRrmOEw/eyZT2KNaLCnsO8UPpSKrMxR6VXFRC7UXchR53
 edVmaZ+T5T4TDhGMqixV1BEsaTi2thZSlCrSqiOap60aqmPIJ3TzLoGpUBIL2d/eeHWS
 0/gXI1ptEJOXaRqgfODdHVr+of8icYtKu8hfP391EapQugSkTZ2ClUm1Gw03lrI+fBUU
 4LwFhz/XMIkFEa3ID+zz54hIj2QFbAdjoh75nSPX2GH7lQAsXLCcIVkiB2AMAIrOc05Z
 Gm2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jRq2wBEpPNcqdkumVMkeg6cjECg35N5fx2Uzmbr9rLo=;
 b=cgTzfL6wbsPvX5s8oSxzsHkr63EnCqGN9LsgAwll8ny70YD+X/Wa4eCCTHxsNCnlF4
 udw+dm0O2Rm9pP+BbdDQSFoGYYf0OXAL2dSKmmU+cJnUj6itftARADnPZ6xvoF/lLXsM
 4mOeWcIXjyBMuro4SbJLcGIbI5QYhiSRoykTdp9HwbA5HdyQDOstoR6FNicvk7BxSCfK
 2ADwsF/vuemqVOq56oJOYMxpPxoRm20oKYjPjfqZvo0yRfPo/ov0rKeNuXPfoddRtiqT
 m6J09exg5OFkeYsyrQCY164921PgW45QU7weA7nLpoNJWg5hXu56D8x+11nHDAPFafq+
 b0Ng==
X-Gm-Message-State: AOAM530nAPyz9Ed5r3mw5awRq2UePdPQbnqtdMLYRYliQ6dGDSpLrChF
 9wLDMEC3Qqwg2BaFfu2UZITh0XfnxTAL+QqrwFB3skPi1/4=
X-Received: by 2002:a25:2fc2:0:b0:647:dcee:b2dd with SMTP id
 v185-20020a252fc2000000b00647dceeb2ddmr24187751ybv.288.1651150741818; Thu, 28
 Apr 2022 05:59:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220427111543.124620-1-jean-philippe@linaro.org>
In-Reply-To: <20220427111543.124620-1-jean-philippe@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 13:58:50 +0100
Message-ID: <CAFEAcA-ipGkitCW_5oFeuzj1e1LYOKvU-MoU8xJgdXx1bfta3w@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/arm/smmuv3: Cache event fault record
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: eric.auger@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1Z5H4uwbQyxU

On Wed, 27 Apr 2022 at 12:17, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> The Record bit in the Context Descriptor tells the SMMU to report fault
> events to the event queue. Since we don't cache the Record bit at the
> moment, access faults from a cached Context Descriptor are never
> reported. Store the Record bit in the cached SMMUTransCfg.
>
> Fixes: 9bde7f0674fe ("hw/arm/smmuv3: Implement translate callback")
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

Applied patches 1 and 2 to target-arm.next, thanks.

For the future, if you send a multi-patch patchset could you
make sure you always send it under a cover letter? Some of our
tooling gets confused if the cover letter is missing (it doesn't
show up in patchew, for example).

thanks
-- PMM
