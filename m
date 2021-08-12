Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp197335lff;
        Thu, 12 Aug 2021 02:45:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRLdvR1WssJnFPCYT6bPMGVVsA3Kq8v4i0ythp1zYJaZWLVSlBfDK1eBg3r0GCEGoRfxEw
X-Received: by 2002:a6b:440d:: with SMTP id r13mr2372240ioa.1.1628761547710;
        Thu, 12 Aug 2021 02:45:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628761547; cv=none;
        d=google.com; s=arc-20160816;
        b=T2zzD65CKK/Kl9I10NthljY7ac0WAbVl2gX+vEHOvDVYMQhbn68cec208DB9sb6cnz
         gqe6YRBra9Ayn6rsUXJFneprMtGZ79VCyNSx/IT7h7ENBLMcTFwNPy16M+9pAnNyeBWz
         UM6BR8xp9db0ylkzxfkNVl1TDnnRT8s75s6AtS6nIIaO3Z9cF6Uvr/NdNe3d3My4PCSM
         3vtNAccM3gogY7cCd6TijtDJmsQClFE3paz2TlIiRoQjAjDFgzoDMYJEGwnLV1n1+LFi
         TXSU6PtlSWdilFOUddm4ahwyoPKozfsA8jytyaoO/v7hva80gtsgyL7RW6AhWU0TiPmn
         XX0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B1ya+lOPAftXHg70ZivKItvcqHOrmRz+N0DNnsBV42Y=;
        b=GZL/0M1ihlAuqeQ8R/1NvOXLLkdo+xgmfACvAUma354hEwswctXwov9jjKKI52bb7D
         USLJf9xOAf9YhSP1FahNUrtRfCfS6Ko4R9opiEGGDbQs0EEBE4PVZ7pefWTUatsU9vzg
         G+vTsEluMq9MJcSE1SObZlvqAI2yCgUGnxbbMG6/76Qt1ZrecpMFICIxKqj/PaVLYwji
         9X9kRugNSMHU0LwWzNQMkbRay+U4RCTYwPsuUFp8xdFU0beqwyKqy9bV/nBzDhzJ1+x9
         Z4Sao0qmwbuATfGk+u42T0/55eTPQMONk1EFq+mjUr6cP7TbFse7+3BDuvPvPRFDsC+9
         /AIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HZ58bwOQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u6si2654465jao.99.2021.08.12.02.45.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Aug 2021 02:45:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HZ58bwOQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mE7HX-0004yx-0N
	for alex.bennee@linaro.org; Thu, 12 Aug 2021 05:45:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE7Fl-0002Eu-KI
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 05:43:57 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:44744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE7Fk-0007Oq-7r
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 05:43:57 -0400
Received: by mail-ed1-x52a.google.com with SMTP id z11so8672459edb.11
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 02:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B1ya+lOPAftXHg70ZivKItvcqHOrmRz+N0DNnsBV42Y=;
 b=HZ58bwOQC0nM1t0M4kT3Eb++nhiGZZJyJRo6kNf/PxF1XwQm5/BpLlOf1I12iEidna
 LUAf3A8pnQCTxGWS8Xze7XO1C30ozf0EfhO2nTxBxQnmUrO/PhKfYFEiSi3WA2aaElwi
 4BcLtv5DWXqYOD8j9IB05KFqkJyaS2x0Aj8lC0S1uffKLhqj52f+jgCg/dFxodskKuAk
 F9SrVGCE+/0rjSmeYUc4tJe6/x95wtYy3HlqHJfRbI06SBCJoCzpq9sBTKwY9luzweM7
 HO4Xao3q35wj7Oevg/sKK7dzOxcNNyyB0ilPCE89VSNXRlQAHCbxDEIyrdxTdEmF9Yk4
 5SYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B1ya+lOPAftXHg70ZivKItvcqHOrmRz+N0DNnsBV42Y=;
 b=ZTZm6Hb2aUaG8wOXtMs65ovjnJcLRRltPRQlD17x18AGnW2BOi4H2Fbuc4woAN/qwr
 JRMd7VcocQ3MVoiZc28TmgDO7ba0UH2eMGzTZNL93Nbvlc3EkJnK8OCxTraqW7DtZNM9
 bnuOPzUs/dph+vxBqm0e2CeN0ukatrZ3B2DZKJzf0uJMGRJBJ0zUUp3X9HyLeDdgBB/z
 vSVd77TEV3Yxe3OEdAydK+df7QNQ1ufzrXrTq0iy5PH90QgT5NmgEWnOqjXeZUB9w951
 aDRU1yrP67dXJ0Gn14x206QX4z21H5+OcpF31DkqVSBZh32JGyDEovSDUrAjLY6BrWS6
 zEqA==
X-Gm-Message-State: AOAM533iCdML3yqkvgoN8H1NRgq4FtdCW4gDc7dUsZkVyeZgLPcHD2px
 73TikoeA4FmDSeE1aP8nBqaF8FzXsg4YKeKpnDsC9w==
X-Received: by 2002:aa7:c4cd:: with SMTP id p13mr2587975edr.251.1628761434841; 
 Thu, 12 Aug 2021 02:43:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210729111512.16541-1-peter.maydell@linaro.org>
 <20210729111512.16541-8-peter.maydell@linaro.org>
 <cf01ab07-f7c8-c2f3-9cd2-1a17dab62a8a@linaro.org>
In-Reply-To: <cf01ab07-f7c8-c2f3-9cd2-1a17dab62a8a@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Aug 2021 10:43:09 +0100
Message-ID: <CAFEAcA8iWyH49ijCRZ4boWs7HqejG6Hyh0rAZ+n9gXgA4kOKyA@mail.gmail.com>
Subject: Re: [PATCH for-6.2 07/53] target/arm: Fix MVE 48-bit SQRSHRL for
 small right shifts
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BmxNHZD6tozY

On Fri, 30 Jul 2021 at 20:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
> I'll note two things:
>
> (1) The val == extval check could be sunk to the end of the function and shared with the
> left shift,
>
> (2) sat will never be unset, as #48 is encoded as sat=1 in the insn.

True; I'm kind of aiming for parity with the other sqrshl utility routines,
which is why the unused no-saturation code is in there.

-- PMM
