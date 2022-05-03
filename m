Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1547360lfj;
        Tue, 3 May 2022 09:59:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjf9owTMvyy94LJkPsT7soXEiKe0lQmj+sTyW9Y3N8rMRjcYCHvLkJrZ7KGASZ7BS+Vq2Z
X-Received: by 2002:a05:6214:1c8f:b0:443:8505:14b3 with SMTP id ib15-20020a0562141c8f00b00443850514b3mr14701692qvb.7.1651597178773;
        Tue, 03 May 2022 09:59:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651597178; cv=none;
        d=google.com; s=arc-20160816;
        b=x0pMdfbAV3pYi2kqFp13Hhk2wtn3u3P0zquKj0cKlFzYFnYVHHFiHaMo/WeEjrnlYy
         0IBYnj82icE0Xgv+XgakCSctintbNlkbTVCTw3rEUUA6nmW+DX3m7nIxDQipP2RMbZ6/
         1zU4Ryj0eGv0v7pcgi72vKeQPF3PSTRDJFt+WHy2qb1FbWJpI1WLcIqWdbbLoqCv3ySS
         MkHjRgrc/QkZ5WUL0Pdwf2YW01NZQrSqpgoiv64xkTke3OrH2M2ya+tyCeL2kasNgeHb
         GMHWHLxKPTz4Ppe2bQ9Bb2ClPi/hdlEDdg5VAbwX36q9FFVCV8s2NGlKGrFH1I4ar5un
         3j4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Pvcki9gbSp7dgo7wEfYEoiTaZ8GHqrRi7fV1yBSPdOs=;
        b=hC/+kU6Skm31L/a+KPKQpBbptaTNi0SazQ5l8uVhb67EoT9tswcKy35mx1opmV2HFr
         iKtMicbvDSZ3zK3w/XUNErztoJ/LgmTvdVbrUCFpGzBj8PkqAPYT1fzaF//u6qTS2B4T
         xValX1ilKuI/t+VGfgOPjn56XgHJIF5kukYGWc2yTrIKe8vq9dMDPc9DiJcnorBgJOFr
         5A9/v/zu0Nyb0lI7nsXP8/HFyGXPj2ovmXVhEOmdkyhoWmVkj0+ja12OW5oc5O4sKovQ
         NMw05NPDFyGpurKU8+9ochzlH4Xii3SujudKN3l90AHPx4fxve3oL96/hqop/D8WvEWk
         ru0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zgnLlRNz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h16-20020ac85850000000b002f202844accsi246009qth.679.2022.05.03.09.59.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 May 2022 09:59:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zgnLlRNz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nlvsA-0006l7-7a
	for alex.bennee@linaro.org; Tue, 03 May 2022 12:59:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nlvr4-0006Bq-Tf
 for qemu-arm@nongnu.org; Tue, 03 May 2022 12:58:30 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:34997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nlvr3-0008CJ-Es
 for qemu-arm@nongnu.org; Tue, 03 May 2022 12:58:30 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-2f7c57ee6feso186697547b3.2
 for <qemu-arm@nongnu.org>; Tue, 03 May 2022 09:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Pvcki9gbSp7dgo7wEfYEoiTaZ8GHqrRi7fV1yBSPdOs=;
 b=zgnLlRNzSwjNT+8GfyRw0tQCXRP9SRWAfXI/rFPS7kipMtyj41NzLIXfyVVGJ+QZfP
 f6DbwjtqXUVFvba4DN+XpVmpl14Aczn6hMkV8GQEqKxgxQOnZvNRVl7pgdfnRD6ZBXOi
 /FyfH3G+3CQ0RcRq2qjuQRL/Hy5Lq/jpvv9EpaOeXTC7x6MJrU0DSVwxj/Yy4+fSLTgg
 b+daVlBnCelhJmluOH0cIcgUaGlnqDiMPX5eT/1Bw1/7suUeqZtI7AWr1od7Vbbb+nt4
 qT2iP+RTZNFlr8XAY6nVmx30mnus/BfcaUtxI03K6CtrVV/j8C+GoetAqbUmWSWDYMy0
 PbbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Pvcki9gbSp7dgo7wEfYEoiTaZ8GHqrRi7fV1yBSPdOs=;
 b=4HyCE4+PXNNltwvU63qt49g4om5+PFMbzB5YxLau0xpvHPujsJWbGGmgkh7sAUHLlr
 qFFxOWfA5y3hBFnsEUaij54a3a9IqMUn1a3mfl5GSt8+w6LfW1pwblocy1+5pbzMnnRm
 SEKxIwrlIRabEmIVHTvHAQxJ/Gfckx0lG3VXsLgeTjgmBMYym7UkooWljDs01g7sRRaA
 5nXfLXd8t6PUmQ7y3TCwkrfnuR+trg8sHPbyTFyhaPGd+MtR3CJVDxOOy06Rh1mauU7C
 htduGEwwOgh/gePW2fZkRpCgaVpdtlXJmjbWFU2TbRN30dIobKR4Ysex9HALyUsciKx1
 gt0A==
X-Gm-Message-State: AOAM532JemJNOQ36/Hi0lhuBcReXiblluVfqIrXoUUosTNV15u+HhitG
 wUKUqD5X0uPM9XLVrPT1rrIsV4FIgkrKmSHZewzKLg==
X-Received: by 2002:a81:ac57:0:b0:2f1:99ec:91a2 with SMTP id
 z23-20020a81ac57000000b002f199ec91a2mr16004659ywj.329.1651597108225; Tue, 03
 May 2022 09:58:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220501055028.646596-1-richard.henderson@linaro.org>
 <20220501055028.646596-35-richard.henderson@linaro.org>
In-Reply-To: <20220501055028.646596-35-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 May 2022 17:58:17 +0100
Message-ID: <CAFEAcA8T-v=Z=nJDUofSG+2wg+YcrQTFfBJOVgs14PApxTEvLA@mail.gmail.com>
Subject: Re: [PATCH v4 34/45] target/arm: Add minimal RAS registers
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U3RXo0+g2EOR

On Sun, 1 May 2022 at 08:15, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Add only the system registers required to implement zero error
> records.  This means we need to save state for ERRSELR, but all
> values are out of range, so none of the indexed error record
> registers need be implemented.
>
> Add the EL2 registers required for injecting virtual SError.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
