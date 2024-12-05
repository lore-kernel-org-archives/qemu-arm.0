Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp304197njb;
        Thu, 5 Dec 2024 09:39:01 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW5QNpAJT4ftm+KLDtrM5RQFkrJpJum7Ebc0LqPqMpayRGXtc18MpcXEXnr57v1nSgwX3blpkbS4hdnZA==@linaro.org
X-Google-Smtp-Source: AGHT+IGrFNWHZvkfe/zh3mUEDfNXoK8b1AMVKgluwL9ka5JUlp4H+eN4Q6mtkX5xYiA/5QXCfliT
X-Received: by 2002:a05:620a:4415:b0:7b6:5e31:b815 with SMTP id af79cd13be357-7b6bcb52f43mr4866885a.50.1733420341586;
        Thu, 05 Dec 2024 09:39:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733420341; cv=none;
        d=google.com; s=arc-20240605;
        b=L5iRwWqt+U5P4a5Kc+ARTtmi/yqSnhV3qaibXlfdvORy6hqgy0Uwp+olGkNP413uxl
         u9lDsiiw+QkjgNcO2pogSguh2j8f7i/goMP5Gp0igSJcIX1r26Q7gizk+vDqrgGNn30p
         tIE2vUAx2AtWDb5pKFDeOckcPrXXFMPfYoeyqSX670GrZLf/8DEkcdqkmN53siZcu3FF
         T6tG5OU8nXE0roDGZj2evprMn7ONi1OWoDpcBoZx3GjQ/lMxjx55vNYY24QRm17IfJ4z
         oxJqKlnNQc7W8JMPQbskDLjfQGE7QVDmXiq54s3IyIB7R9FMmg9wGc9miwQBylXh6R/5
         3QyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=UgBO6gIx37t5U4S0qID2wzdu9LiHMxmtrvX8Yn3pXRU=;
        fh=O0IOk+8IjhVIf1DFhAjYwR16P0T6k2F1yDVHDYkRD94=;
        b=B3/24w/CDJdsX7xFxTIOWLHbFvlmzu1/Idauh8qd82RnKmOPOmszZGpECTBDqAmW+I
         wBmaRlpKVYKLKcjaluMd993zZuINnvnv9pfxC6ylL8jcIhlZCb0FgrkVRyPCMXHs0Efx
         D0Jknz8DcKXvRp9Z5Ln5u6pw2FmB8bG+y4g18yxdHM2BdgalYyd0qQ2AM0cPyt9wlRnN
         ey2HOmixh6x+K8b4QxNL2UDwiwtj7EbRFDRdNA7T2eaIzP9KQvQEnks67ZWMTHvttmB3
         X3e/N78fCF9+JY1YKAeN3ISCcBjFKS5VVjxn9+YbDJwYEVTCAs7E0TGZKL4RhO2TvNFQ
         Z0Kg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v+inU2Kh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6b5a5c441si210582685a.179.2024.12.05.09.39.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2024 09:39:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v+inU2Kh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJFoL-00071B-FV; Thu, 05 Dec 2024 12:38:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJFoJ-00070R-DF
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 12:38:43 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJFoH-0004Q1-Ul
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 12:38:43 -0500
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-385df53e559so959657f8f.3
 for <qemu-arm@nongnu.org>; Thu, 05 Dec 2024 09:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733420320; x=1734025120; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UgBO6gIx37t5U4S0qID2wzdu9LiHMxmtrvX8Yn3pXRU=;
 b=v+inU2KhoPU1bFV+CV+JO/i8LObsFuHZ63XgRzk6UaM+Vgcnal1+EZGf6cDMY+KOD+
 soGnprv+jsS8FdMyGGNqsE18jlMNblu0e/p3usfCKy1a2/BR4cDkq24wtHwzZa/clGqw
 dd03Slo3dLn76lADqRgIXDR0uM5kYmcj/VbSAEbnjCjk4DMpAzr0ROLTodA0Adrxhe9b
 JfBia6K+PEtTPx8jBsCjk4nNBqdHhWlD8TdyPTs2TaD/kCulVIT89RvIXVtFGk8Bcj0Y
 ETLalMMJAR/f/NvMwjQbl+AxbeEXmMBmDerIeYXMirVu6+dr9LJ94GLQppPqoXmKGFoY
 bCCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733420320; x=1734025120;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UgBO6gIx37t5U4S0qID2wzdu9LiHMxmtrvX8Yn3pXRU=;
 b=MYuszC1krtoXJmAUNdeLSyQcg/u+lUqPilucCyzTuNOfn1QEQb2bcX2oOn1C1vHtEL
 4Th+HZUrguJGh8cv5GIG8dHsmZ7GNsJrMxRxXa257VRaEg/1mBlM0q7InsQz8eUpMLUi
 Mb+EtbBjPReVV9dvTJB2OUcXHt3Vh3YfTYOvcqjiftW8CGiV02chpQVpa9RzlPu76EQX
 SgmWivtJWQHxVzgvIM0Z+a1q/fhdkfY2CGaEHGmW+ZoqKOfJBDgwGTG+ccuV/P8XfyiZ
 VSk3SATSjldBOjeN8R0GacSEdII2p9+tI0Y/REbQ8cFtdqtpyq1kJbdt6Gsok/6eTK01
 r2Gg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfx9EQ6HQwiA10QFN+soG354SfLcQJ7Za2OBm8p6xDEUsVDBABAxZ40HIMf34c/yBq9iSfRxB8EA==@nongnu.org
X-Gm-Message-State: AOJu0YxdaIkmy/OCyHFkP9sBK1zaz5bgKuDPVMgNCoAxIveR0VbjYSfv
 BZW9KtaLaJ8tCzR1Mq0ionsbSa38xYrWYVPRVyviq5T6lauTQ97uqnURw8S8euJvanRcnw3WrIL
 MhBIccAAST6Uk33YCHIRAFIGC6MZQ2sgySjzfIQ==
X-Gm-Gg: ASbGncu6Un4/BAL4PxHHfIwgf77AZLhPp4xsipGpaAXaPBJOqwyOqlpq0FAA30UzgeX
 Soc1igSRjBdO8mdsmtpAWddI1v7iX5g5v
X-Received: by 2002:a05:6000:2809:b0:385:f07b:93d6 with SMTP id
 ffacd0b85a97d-385fd423ac5mr6461433f8f.45.1733420320136; Thu, 05 Dec 2024
 09:38:40 -0800 (PST)
MIME-Version: 1.0
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-12-richard.henderson@linaro.org>
In-Reply-To: <20241201150607.12812-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Dec 2024 17:38:28 +0000
Message-ID: <CAFEAcA9ukDtrBsiKaDqMfEv7RVSYAYVf=GqU6sML-J6k6W0npQ@mail.gmail.com>
Subject: Re: [PATCH 11/67] target/arm: Convert disas_logic_reg to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: l+3Rx73xgEVJ

On Sun, 1 Dec 2024 at 15:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This includes AND, BIC, ORR, ORN, EOR, EON, ANDS, BICS (shifted reg).
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
