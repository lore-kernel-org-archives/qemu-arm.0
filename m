Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3207932lfq;
        Tue, 19 Jan 2021 02:44:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzEuR7neWuqYIKhYLbwvKPWLCkIXwNFIr1HncsAKrhpXqM67PObrxUf5Lqn9MXXpvrlHECX
X-Received: by 2002:a25:1654:: with SMTP id 81mr4695455ybw.508.1611053068177;
        Tue, 19 Jan 2021 02:44:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611053068; cv=none;
        d=google.com; s=arc-20160816;
        b=YlDXUBgZBSrmrAZyKkHMQAiM651o0w9d1VweKmEfkW9Sc1fJWUMLWb1LWN2+y26RnI
         zd/88XXHA1H9eg51f5tNgeGyLNJ1ArAbbAfPMkr8JbkNyi6y8jZ5/KWMH33CuiIXyBZv
         FoYkj8wSEm/Q1J7qlGkygNjZLe2Xwucm94rVii/eg/m/17GtTUeNK/24VUK5b+Uw8iaC
         jMxDC2gaBVqWoF3YYg8rKHQG5uTAwuZkHNF7jC48DsOznvCC3q22o1wDwd6/vJ4plV9s
         G75zYSnGwwYzqWyB2q+NQdN6o0/hXnYVS0hOgioKzrJD95OEFHWWy1BSBJeMKprxaaZh
         6Kng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8gG9Jn5dCRu1lhG22mrUIl619dTTmEhbS3v7B8ySK8Y=;
        b=Qg6IeYQnJGs1JT3KQsFiKSL+Sm0YaFJp+J8hJm/Ru6ztCOGSzZEp8xMIsBmc7YMcOJ
         XQ6iG5jr3I9CkyZHEPvyu5c2dR1niQQP8q6+1WK9zjENBydY/01wQ4EbO62p/1a5J/Co
         uDTFue9rZZDooEqBeyd32ySv0FPoQPqk313e1NOKGcFFM52SsG1GWFBCzyns57JAgCBv
         PDPwj0wr6hPxsb8n+oYBpAfalQ8lxnc+07GI38T995vjG5NGpVXpgnXu2uP8RTLbNz/Y
         wJvHKK20jWt7kRgNl7qScMFURIa0cD6dx9UWD+Z2amV+3lJAlFlj1W9bOSeoVm6Y2DyK
         UhGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=achFVkaO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s3si15882632ybc.211.2021.01.19.02.44.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Jan 2021 02:44:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=achFVkaO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l1oUt-0002ws-HQ
	for alex.bennee@linaro.org; Tue, 19 Jan 2021 05:44:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1oOR-0007IJ-Hn
 for qemu-arm@nongnu.org; Tue, 19 Jan 2021 05:37:47 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:36262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1oOO-00088D-T8
 for qemu-arm@nongnu.org; Tue, 19 Jan 2021 05:37:47 -0500
Received: by mail-ed1-x52a.google.com with SMTP id b2so20882311edm.3
 for <qemu-arm@nongnu.org>; Tue, 19 Jan 2021 02:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8gG9Jn5dCRu1lhG22mrUIl619dTTmEhbS3v7B8ySK8Y=;
 b=achFVkaOm+RT9nlHX4tjQWgesiHUJWtUk5PaGBvVU80F1BC10VyOHahCfZNLiBb84r
 2LF5hRKmIKecXULxLC+Qg/5L/pYfd3Tu7zhcP1/VEu7PM98osOMszPCnoIUT+YgtdNx4
 k7MliaDR4MSJRg44Ta5xFawmfupf+GP2naqLABKACz4P4qcKzLiHcl2cOCPwB/RXnDRQ
 +aIYDD9XzzFgyIPurt31I7HzuZX0fjyvAHHHmoNMAChMSa0CeZakPulz2nAzyoUCD6kn
 oh8x4+dh48Ex5zUC11+CSuhtZ60+9RUMT7IfucgneadFASh5wJwXMqQSeyvoGzS14SPF
 Lz0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8gG9Jn5dCRu1lhG22mrUIl619dTTmEhbS3v7B8ySK8Y=;
 b=rjodBknVmecGP2XERTWqWQJGWWAHv+PFU0JzUnowlXmMNYm+VjmvhkXXugD9LMKuiM
 cxFX66Y0YSXA89C/4UuPqpEX08+qts9JGrWx2CTA7VF3mnQwxrvMSYBROPHfta+AHmB5
 GLVnVxxCh5m0xuSyh9BpIIBGIVOh1YVU5DdhpjI1H4CUt/448P5n9OKt9YCXD8uyQ+W9
 Jq4F6zFtnXkBOfugQdmxcMlDlkrysJTqfDJOMMTHSNjpf49nSerwYQDHWsh9ZXUOL/zG
 lhu2OYVmOtxw++AlramyMmy+hU5SeIOgRu1+JlwUpa1gyE9i83WAi07sVHKCCcRsobJf
 RJhw==
X-Gm-Message-State: AOAM530l+Dxz/7BCsCTS1vaczmPEhupPu0VA1mZe+23v9FZxkoPEFwts
 guWqEKuWwkNc+YTOvefARXeMHtarAfbyWdlqHYIztg==
X-Received: by 2002:a05:6402:1a55:: with SMTP id
 bf21mr2963454edb.146.1611052663271; 
 Tue, 19 Jan 2021 02:37:43 -0800 (PST)
MIME-Version: 1.0
References: <20210111235740.462469-1-richard.henderson@linaro.org>
In-Reply-To: <20210111235740.462469-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 10:37:32 +0000
Message-ID: <CAFEAcA87rH4dHnDmRtr-VRDh0A7j+8kuiP5wNwPmJnnGz5LHvg@mail.gmail.com>
Subject: Re: [PATCH v7 0/3] target/arm: Implement an IMPDEF pauth algorithm
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Sfytyh97Tdwd

On Mon, 11 Jan 2021 at 23:57, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The architected pauth algorithm is quite slow without
> hardware support, and boot times for kernels that enable
> use of the feature have been significantly impacted.
>
> Version 7 changes:
>   * Fix rebase error (drjones).
>
> Version 6 changes:
>   * Rearrange xxhash64 (pmm).
>   * Add documentation (pmm).

Applied to target-arm.next, thanks.
I fixed a typo in the docs text in patch 2 and adjusted
the text to say "impdef algorithm used by QEMU" to clarify
that this is something of our own devising.

-- PMM
