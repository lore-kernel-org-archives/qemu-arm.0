Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1189629lfq;
        Thu, 8 Oct 2020 03:02:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAILgV9ZXxe95rR11svC29CNK9WGg+T1Wb7ASdgHhN6IWrdpgF2PXGRSJG6zSQtb0/wHHy
X-Received: by 2002:a25:1c41:: with SMTP id c62mr10314714ybc.60.1602151350378;
        Thu, 08 Oct 2020 03:02:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602151350; cv=none;
        d=google.com; s=arc-20160816;
        b=P+VtE9nxY79c4Xn2+uStovIcv8ggxSk/acaByNPrifo0wxqu40DST4F4SOmQJkJIUn
         DK5PJtQ2OwNW9XTlxdKA3jXAnb27Vrd2nLc1VlH9x3rvpcOgvTUpGM19+AYE1VE2vJdb
         ekHFM05/Q6vdOAEGLRFV12bT5eO/Ju7CsPe/+Z9zQK5F+q106pimR+J4X0Yxlw0RmFzT
         STis/3KWz060JbUDyhlxh9ISeGDKXf8xCYz/d7+td86Vtgnc4luh2rnYzA4nPkae+CBw
         OG6iiEVseljm4qCgCppIWIkS4tJ/whQF9eYXHzfWzw5kpCh4cR6on1FP1+rXHlQMJFzI
         VTOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eloJToFC63NRjpwM8VbhiW+S7qE4fG6bP32gqbRdD+k=;
        b=SVQbvvZbqPltqA43UgobZA+m6FUI1IXU7vkuouWiE2hCx0oG8dlqjfCsNY1F3pnM1u
         m1iCskutvnkbgmGvlKgrI10hNhMQuGjzjosO2590BCQXAgaGoolShMEhaSdM3z38gGdp
         cT4N2W9XvneVofkKL1PQ1aHrZIhylS3ZNMBGA4epXrG4Ks+L1DVr4SC4mtQMiolxmjFr
         xDUVB+Yn4XrTk2SvUQo7P2S/jWdwx2hL4JE+iNIi2Zibq+yT38wyyfmHDToX7SMLhLRs
         xGFnynu5Ytl0wDHgFJL/bwM2VdMvYWlAutum76tUL7s4gCnCVwgk3E+6hnaR0Lbiyv9F
         B2PA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QnK0u8W+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x2si4181637ybe.447.2020.10.08.03.02.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Oct 2020 03:02:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QnK0u8W+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kQSkn-0003m4-P9
	for alex.bennee@linaro.org; Thu, 08 Oct 2020 06:02:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kQSjY-00039i-Nv
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 06:01:12 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:40621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kQSjV-0001Vc-N3
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 06:01:12 -0400
Received: by mail-ej1-x62d.google.com with SMTP id p15so7223864ejm.7
 for <qemu-devel@nongnu.org>; Thu, 08 Oct 2020 03:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eloJToFC63NRjpwM8VbhiW+S7qE4fG6bP32gqbRdD+k=;
 b=QnK0u8W+wVMbGRCeazs2dDyNdOlbNEzt8uirEZsCt5ypeiw/supPdgEebDQ0A7m2Ri
 EmCEDXKJbcdFadyNZdPk7pNAVxARHckeoW5eEjZePyhICgpo6DPjcSxEh/2Dq7O0H4tu
 CH6vcR7saT5SWbvzvZBXxLNpAYxWDb5pl+74UTJvBVmqRqS1pXkb8OovFkODyNGXj5nj
 Oe9rpXZencEiyGRLIChDA9LuGCCZe0hcuzrHY7s1gX+we3kbIYXFNSYvGKNCWhpGP3qD
 xr6ra93x8kQ2d6xOU9kQpzxPIX48dZmVnvAPoD7IcJfXdFLap3zN19sWX9e682t1PMx4
 M8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eloJToFC63NRjpwM8VbhiW+S7qE4fG6bP32gqbRdD+k=;
 b=cj58nzFnXkYE3/1f3fbCzlM1fhpODQcH1dmQSPoO7/AMmKF1YPuiaie6vUE6GbhNrd
 ADKrezoBBJ8a2i0iMK5+S3Q5F10bvvf2+gaE2jKMU5+zEowMJEI3pd+7DtgnzOiXLTgV
 S2fOEg5Ny2/68bS7IU7PrIV8awbhpXnaOs52MYmbfBng5HCVVw9SWq6aowi9LAM0IHEp
 c0CshMVn3Glxhu7csl1nd4zhcXfkECvxCqDwVwNif3mzU7vEpGvS1QD8iy9s9GEwd8eK
 wsg/dVLSTbI2Rl5/JhVVdWX7D8Kt6zveCidI0RaPiohLeOvrtD1yqfPHyYw8h6GXlncX
 xFjw==
X-Gm-Message-State: AOAM532zC7he4kLd8eNC2++xzeYIA4MJqaTjmnR+0Lzk/2pG8AFqqcYf
 +UazcUU22l5MtZyOv9A/bm6deLD8LopGJiP0TRWEqg==
X-Received: by 2002:a17:907:4365:: with SMTP id
 nd5mr8128802ejb.56.1602151265968; 
 Thu, 08 Oct 2020 03:01:05 -0700 (PDT)
MIME-Version: 1.0
References: <20201006220647.GR7303@habkost.net>
 <CAFEAcA_se7jErv9AFM2D7UdDMurB9Lb6W9aAXD6648spQ6idKg@mail.gmail.com>
 <87mu0xyrtn.fsf@dusky.pond.sub.org>
In-Reply-To: <87mu0xyrtn.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Oct 2020 11:00:54 +0100
Message-ID: <CAFEAcA_txULmHTGipXp=7PW9gkM-JFf=5WT9h=BNKKpLcr+uEQ@mail.gmail.com>
Subject: Re: Purpose of QOM properties registered at realize time?
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iEYFM5fjdpx3

On Thu, 8 Oct 2020 at 10:45, Markus Armbruster <armbru@redhat.com> wrote:
> In real hardware, the number of GPIOs and such is fixed.

That depends on your point of view. Often this kind of
parameter is configurable in the hardware also, as a
parameter to the RTL, so different boards/SoCs using the
same device may vary in how they choose to configure it.

thanks
-- PMM
