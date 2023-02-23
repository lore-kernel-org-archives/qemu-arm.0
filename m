Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp835373ejc;
        Thu, 23 Feb 2023 07:36:31 -0800 (PST)
X-Google-Smtp-Source: AK7set8Nytvm5sqUD/f47pCIGJ8W3oCCWUF4CJnx35nroQgOm6P20tksrNBnkVcLJLYSLfRQVN6W
X-Received: by 2002:a05:6214:1d29:b0:56f:8ef:693 with SMTP id f9-20020a0562141d2900b0056f08ef0693mr22828438qvd.0.1677166591336;
        Thu, 23 Feb 2023 07:36:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677166591; cv=none;
        d=google.com; s=arc-20160816;
        b=RkU6Rg5YCI+0MLH9uqvtwrsNA2Cj3OA40fjXm6D5VqYQ0RR735L/NiaoAXwd75/6Wg
         u4ZfyBtc2Wwod+OK9b5/wyBa+8YU2b/jl9yF00iA1Ll4gFI9OTszCOzKo1ieTF0nHwJL
         lECFLJ8sTcSOUyi0xljcjeSiHQJX+np3+6AY4ql2Swlm/67kMyduX7sWZslc9aikF5uS
         hf0/p54UMPpuuILthri8NYsmIdJl3TTW7nCb9xn5UzPMqkAxHYCtO9qXs7M/Iyw2Ze6t
         y4C6zPdhrKjmTuXi8ZcFYrogrcDMilH3Y/IziDWgd9THTMBOQoBxDRI1DFKccgsGNXW8
         IPjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=U3XzP3A8AiLMZXAzhfDpQlQrnTjGqg2c8phMA6lgpgE=;
        b=GzmEoWS2oHsbs1oI5Q+0D9lEnAkHDhttNtxeeeSS2TfL0V+1wGrsTaIfqnngusa77y
         lit+ldMryD2qbRjpqwaWTxm5MzZmvRuTPCbKco55sXThtSz+o2ura1qgxicoBIOuKGx5
         +GCwUTvGRm5GgvUTzw+btN2T610le9j5BexFzOEcerr43Wd+h6ypA62JOzT9h90oeInY
         nMkmzKw9bWKkFzZ73ahnoLNFE3T43VoIuWapBadd8DVau9QGOMY4MUZ9JC3D+UE0GD3i
         BkNY9q1ebrI+iTgEs0nQBqHLUZuZRdnTZi9DpmRXlrJItzSSH5b73WJBmg8t1dm8UQxO
         Kg/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M8KbplJv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j20-20020a05620a289400b0073ba4ffd7bdsi5755088qkp.580.2023.02.23.07.36.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 07:36:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M8KbplJv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVDdr-0005xF-U9; Thu, 23 Feb 2023 10:36:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVDdq-0005vD-R7
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:36:18 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVDdp-0006Ji-B7
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:36:18 -0500
Received: by mail-pj1-x102b.google.com with SMTP id u10so13409315pjc.5
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 07:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=U3XzP3A8AiLMZXAzhfDpQlQrnTjGqg2c8phMA6lgpgE=;
 b=M8KbplJvYBJTA/1oxJUlx7wDmxZ9A+52rSX4isyieq9OTqPOm6MRpT4MFUIeKVqMFO
 1J2pNjEJj39BgzgNoMWuS3lD/KPC/iXLt+WJ3zeIVTCM5mH+XA1OzVtXNjJ6SJ9Go/Y9
 NW+BCI2QodXZMyTiFF0KirG4iTGPQjFvvyVKT3ON7PibK0h9Y6vGjUd1Y59DnjsMBQkH
 yQWimnYikCLY7Y/ylBO8iA6h44dAUOMQu1N2uvUAzhTCIkS1OTlZmQPcUTm4SnCua2RI
 BZF/kxqSI+M5uqf+8uLkJ+fsfhA8wkCFSZi1g0uDlz/cBwlsAn35/DRUerkqT5CyqKEL
 UO0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U3XzP3A8AiLMZXAzhfDpQlQrnTjGqg2c8phMA6lgpgE=;
 b=YHqchgSvWenT6Oz0uMhRkdbchH9D8/6ydERH95tbgib0Ya5yYzaw4It+LSBvI4JNiW
 Rsbey1oZeg50rPyP4Q9C/0Iblh0yD4lpeVJUp95wzOTZ5ExGN9qXM+P0yHF57WidDxvo
 reY+CRM+QgRwFq9l+JANvfiStVgEqilc8tMEuBrOYw0CIKK6T7PcsVDKodMqlVdcsRzg
 OsrytGpRrLpceEbY6GeKiAe8LwrNl6T5Z9GVdfAfsWIkC7IgJ9vFKU/iyagPpdvN6o8Q
 Y/oEDUhTQu9EQpeSaRkpn49RQ8P6tLni5d1k/JINywharw2ywQaupgyBhGzrvlm7ybOs
 8JkA==
X-Gm-Message-State: AO0yUKU9F2LCgqFQw+TGkvYX1IbYsg+qx52fq+NaGGdhW/iPtlwn0Rrs
 WZiUQRaSOhsYS0BwAJ4XbWd6oPj0ZnJgmP6iVQImew==
X-Received: by 2002:a17:903:4285:b0:198:dd3d:59 with SMTP id
 ju5-20020a170903428500b00198dd3d0059mr1852222plb.13.1677166575800; Thu, 23
 Feb 2023 07:36:15 -0800 (PST)
MIME-Version: 1.0
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
 <20230216030854.1212208-6-richard.henderson@linaro.org>
In-Reply-To: <20230216030854.1212208-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Feb 2023 15:36:04 +0000
Message-ID: <CAFEAcA_mMyNS+BfvMw1QXphcU=iZ3sKxDOn0L0Bt6+ONKvmKpA@mail.gmail.com>
Subject: Re: [PATCH v1 05/19] target/arm: Use tcg_gen_qemu_{ld, st}_i128 in
 gen_sve_{ld, st}r
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: LYnbPMT2KCf1

On Thu, 16 Feb 2023 at 03:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Round len_align to 16 instead of 8, handling an odd 8-byte as part
> of the tail.  Use MO_ATOM_NONE to indicate that all of these memory
> ops have only byte atomicity.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
