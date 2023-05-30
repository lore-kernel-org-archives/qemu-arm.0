Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2257922ejb;
        Tue, 30 May 2023 08:27:25 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6ns2nnRd8ezsmuu/RK8/QPLmMpqqCN7cnwE0BdLznUUCGq/8Br/UBWR2KnJt19mg0MdLSQ
X-Received: by 2002:a05:620a:6412:b0:75b:23a0:d9ea with SMTP id pz18-20020a05620a641200b0075b23a0d9eamr2515151qkn.64.1685460444983;
        Tue, 30 May 2023 08:27:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685460444; cv=none;
        d=google.com; s=arc-20160816;
        b=ypmtNm6OutFHUEmSOHilBTUOJcM/8WhUQWD+JuVK6nq1Ze7TrhiwTm86c9a7Qvmahh
         mYEPn8FyXMVCFaevyWpD4o9XklPJ46oUtPxdTXzFRpT+/0S46CjZZA1CKuMjpdwYRd98
         rZpfDnZpVPbQWnQkvoaeL6eXVmoZqpZ/35JA5NjSMnZ7SOsasPX4kMYSd+Ocukvs8YpW
         fXE2QPbFq3QYdvZmZMC4ujpJlA7nLHzx2bRpJ0F6PARSVVgAK387+0RZxHIVwLPQqGOO
         uDntYaypqMIomqNC+dSpdvKi7plZEvuZnPR/9mkaGkWjQlbIQVFnZeY/hQKcTgG3HLNa
         hpqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=/gxDi1RsgSuoNmvm9nfhOkd5m/ryRRdkW+qkoPWFDO0=;
        b=UN8Hms/+yPQGVZlNIOmF2AirOwpZsoxhJNVBRzDLHZhphWBy77DbfG6OKECBeB/jXR
         cx7XaPRbuDLi638BKrPGTelymRR/0wRgt25p8NmvKZ3ZCeuTlv20aFhNH/zsvG7zxZPp
         k62ezKckWN57fgGstpLIBpizKjeCPrg7pmrBJkEe2CXoh8RtDLYsgpOQv5Ni4Trkq7Xp
         JKqLLcrAGztBxk8TBJKGb4YovgnexGlYdV+ZoM0IkwiVAuXqq+68SN6/Bw0IRAP1uQSr
         zykuQhiLLyocLjeDRlpcF9CL8Qv83B8fRcyT+mYb2BzxhWgXv9EN6hzSqNe1d3wYvmQc
         lAYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZwIBOLwZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c14-20020ae9e20e000000b0075c8054d88bsi6467447qkc.655.2023.05.30.08.27.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 08:27:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZwIBOLwZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q41Fm-0003Dm-Bb; Tue, 30 May 2023 11:27:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q41FU-0003BW-0p
 for qemu-arm@nongnu.org; Tue, 30 May 2023 11:27:04 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q41FQ-0001H1-Rd
 for qemu-arm@nongnu.org; Tue, 30 May 2023 11:26:58 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5147e441c33so8405466a12.0
 for <qemu-arm@nongnu.org>; Tue, 30 May 2023 08:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685460415; x=1688052415;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/gxDi1RsgSuoNmvm9nfhOkd5m/ryRRdkW+qkoPWFDO0=;
 b=ZwIBOLwZ4+rAU2GGWzNaS0IjZ+X0Jepyovpwh/yCtLJmEbbSHp4f1lwfhkQLmkfy+O
 wqM+XDYTYEgBqfgm5rj/SPmOerk3A3sU98KmSnefX0MVS5xQTfQnblgUvIahI+mT5Tv7
 x4vRXvmwt/puPp2PezioUrqrNSRctGAJJTlEA2yePBZCtcBWtMEQF1ZQendq3Jv9M1kc
 mhBjhskUwP0OJI4iyaE7EOlTOJvCjkdbygTqAV+VS5mJ8/kPH+jbt+BSTTiEVoWNiYbW
 t0OF8GKQptBrfEnOwL9VPcpX5LP8hKnH0y6EjckzqNyUpFxgTQne0GvN68/nOVxLWMJC
 gAUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685460415; x=1688052415;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/gxDi1RsgSuoNmvm9nfhOkd5m/ryRRdkW+qkoPWFDO0=;
 b=QMJrChAN1WkFRHogZ6f5AfhQmqtnW2e7I6X0wJw30wUzJ4lNYcqKX7nE3DE5VBrh2N
 5/txqLEHFH/AgxTYeODkMOtCR1vPKnFEsKmQb7cVWUsMC+rHgYftw4rHzrqAoajhiJb7
 LKOexNRstujGTqA6QSxei4quv+bABRVLaZw9tsy9ze36wfyG6wqBjjnahrBXgwxqc2hJ
 t0wTcqBFmINGeMDx+8Ie5nHw6BXGGrmmtxt4HFdTktoYY7ja53uSYl8e0JSuYQXWjzrm
 C17C5KdFllDnZUJYCe3wEvbodZKCpRwqnlbq+LCxJNHFdcI70R/TILatCgReEHZ87pdt
 3iOw==
X-Gm-Message-State: AC+VfDyPXkmBbDrmRsV3PtqxSiNmdKcAra11d5dfD8Iz4d/RToGmZPi2
 zEBSSaW0/Sdu2XpHaF1AZ4kQTgogP4rVVCPrjHYPiw==
X-Received: by 2002:a05:6402:26c3:b0:4ea:a9b0:a518 with SMTP id
 x3-20020a05640226c300b004eaa9b0a518mr3187511edd.17.1685460414788; Tue, 30 May
 2023 08:26:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230525232558.1758967-1-richard.henderson@linaro.org>
 <20230525232558.1758967-5-richard.henderson@linaro.org>
In-Reply-To: <20230525232558.1758967-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 May 2023 16:26:43 +0100
Message-ID: <CAFEAcA8tMZ6cYP7uzVwX2u8pThgT6TkgjcG-DfG1BFE_1RN3_g@mail.gmail.com>
Subject: Re: [PATCH v2 04/20] target/arm: Use tcg_gen_qemu_ld_i128 for LDXP
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qgIaWsKBHuAL

On Fri, 26 May 2023 at 00:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> While we don't require 16-byte atomicity here, using a single larger
> load simplifies the code, and makes it a closer match to STXP.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
