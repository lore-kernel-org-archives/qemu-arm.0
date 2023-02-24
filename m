Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1765754ejc;
        Fri, 24 Feb 2023 05:18:59 -0800 (PST)
X-Google-Smtp-Source: AK7set/BMHBQk4SprQbNpvr+tDc1FH7HLzfoJi8sA22dVtbA7CQOiMRVsGw2gjQKfcpRIH+VH3w+
X-Received: by 2002:ac8:7f89:0:b0:3a8:20fd:7111 with SMTP id z9-20020ac87f89000000b003a820fd7111mr10725030qtj.39.1677244739148;
        Fri, 24 Feb 2023 05:18:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677244739; cv=none;
        d=google.com; s=arc-20160816;
        b=OgJhgI4nvxK3Md0elyM5wyEz7D+PrijGAOx72+0byCFXaDfx/hgGFfsLZUn21cV3m7
         0/fg7OUHm6aj+FuV5aeI5QtxP9tiH/0AjEyfRrDqxub0Dv6kNm0gmnXTEbalf8tLAVIl
         s2WywDNk+Px5dDhqn/WUBTxBhZW+AJTCwPOjWHufYTSOnMYs3RJfcvlvxgOk3x+aIU7o
         xgGHFkF8roDNwZKOuSGCigDaIUdArk/cZ9GKoA1TpruVuvcGQIfSrBaW0+OPW7oTQwy4
         C51/HSRdXsBT9jpRFgQcHy1YzxiCzDTF9kMzwyfPy+kzzNfe5FaAt86Z+JX4C2G6DITp
         28kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=a7mOScT118HWLdKvbSEDKSYtPbUv8rfQOUTAQbxJi3g=;
        b=bYAb0WICEtIXFZnqP/RvfAhQ6oqLvyZsaEQeXtFbmj04AZjQCyxCIkpgPGAijD+kWD
         WF2hqpTtl/hqbPyUYWi635keKqo/MeXwj798lhqIzf9KBkGjOO8SAkd6Wo0ZdCrvpJWI
         p03HxoiuNcaZsH2z4DSPvYdRAfj+ARhiJT+w33yCnWDHp8tRbjz76AkPRYsVMG6jDF3C
         1fcYzmbanEdh3ODJyCERRTPHw0i0h72h7of26KJbivlxo4sg4jfguj5oLh6nx1vJuTto
         FWrRs9jLAO6JKJTvdtJJI+C/W1R8C6kL7aibgFPFGVeoGy9mq9dXVcfEORuK3rAVnRo2
         Uopg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SStqIpit;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e2-20020a05620a014200b0073127725a87si391837qkn.526.2023.02.24.05.18.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Feb 2023 05:18:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SStqIpit;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVXyH-0000uT-1L; Fri, 24 Feb 2023 08:18:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVXyF-0000u9-NS
 for qemu-arm@nongnu.org; Fri, 24 Feb 2023 08:18:43 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVXyE-0002kA-3F
 for qemu-arm@nongnu.org; Fri, 24 Feb 2023 08:18:43 -0500
Received: by mail-pg1-x529.google.com with SMTP id 16so114770pge.11
 for <qemu-arm@nongnu.org>; Fri, 24 Feb 2023 05:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=a7mOScT118HWLdKvbSEDKSYtPbUv8rfQOUTAQbxJi3g=;
 b=SStqIpitRnQ+LlJV2COnPCHd9Igd/K3gDJX11eF92WMq2j6iS8XwsvMPwuuwlaYQ7h
 F110dNuQJHDwQXwAifnnxV7IotFOoBBhrdcPpRUJD2BqQkIxSKn2moS9S5+rybczyKnW
 XzuJuMT1zNDSNXz3jCuFCIV1m0Qp1e1gC1rawjL/m4C0fl0f3TRnY0RlboImNjb4Q4DO
 3sl6ZVjCsjtO/fWrxxihE/S1xl1QKPEiM6QvvBz6bOaUyquPcClmqT4+G9t5DEJnDwvJ
 ABhbsPbz1V/beYNrCJMlINd5RiJKLts+4gRHV0a6PqDu8UZwOeJLb5iZmmYXsNpaNa2M
 uCSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a7mOScT118HWLdKvbSEDKSYtPbUv8rfQOUTAQbxJi3g=;
 b=I0zJrcDp05xV3J2uu5Rs/rySAUIQm1fTZ9mYLwjKpG69+o6SrOis/UkX4cCqpeDcvA
 JPgJ9EHQXe39Mb+HDhfj1Q4OJ3nU+Xe5JVinfZ/n5l8kdJqiyCYggY4dAaRfsb0OQfnb
 YvnWAjltzwPp13ISFpF0fcf+/EhT+LFqWdFjEF4c9MAWBWaUIMgfOrLp9GA9Iu0JiGIm
 FX5PrBAu74gxhgCvIduTBHNIUtr+fuIn2X3482Eajs5xN+UWx1OhODAE/W0O1nFoWbRQ
 CMfsV7E1h+FLGFTuyq4rFB6UZtdGZmvkC7AxNmJlmpL8argodPdJUrYdloUUrFiTahqe
 biaQ==
X-Gm-Message-State: AO0yUKVZEmIkx6c9vrF9m7KCeXdplHFTdMGys/qK2P7bFjqmOiVU4nC0
 Nbs6w5jVnUNIGSNcjXxQX7xCZe3xiw2QbWQaSkMrmR+VzYc5ww==
X-Received: by 2002:a63:7555:0:b0:4fd:4602:1b9a with SMTP id
 f21-20020a637555000000b004fd46021b9amr3048315pgn.9.1677244720616; Fri, 24 Feb
 2023 05:18:40 -0800 (PST)
MIME-Version: 1.0
References: <20230222023336.915045-1-richard.henderson@linaro.org>
 <20230222023336.915045-14-richard.henderson@linaro.org>
In-Reply-To: <20230222023336.915045-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Feb 2023 13:18:29 +0000
Message-ID: <CAFEAcA8FrgfPm4K7es0TxZ_294D17ZO2FiKukfAqS8Sa+2f5OQ@mail.gmail.com>
Subject: Re: [PATCH v3 13/25] target/arm: Remove __attribute__((nonnull)) from
 ptw.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x529.google.com
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
X-TUID: ltcDp2Bpj5zt

On Wed, 22 Feb 2023 at 02:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This was added in 7e98e21c098 as part of a reorg in which
> one of the argument had been legally NULL, and this caught
> actual instances.  Now that the reorg is complete, this
> serves little purpose.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
