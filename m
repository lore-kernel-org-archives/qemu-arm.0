Received: by 2002:ac9:4144:0:0:0:0:0 with SMTP id u4csp602451ocg;
        Fri, 7 Oct 2022 09:44:13 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4U/Af92tyHzFTjNzp57S4YsJaRnQP3PVRfD2FeYedOuGA4ut7b/jF1nExK0bTTqRTR4WpG
X-Received: by 2002:a05:620a:4543:b0:6e3:8848:dc34 with SMTP id u3-20020a05620a454300b006e38848dc34mr4415842qkp.24.1665161053586;
        Fri, 07 Oct 2022 09:44:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665161053; cv=none;
        d=google.com; s=arc-20160816;
        b=selx5tXM+xB03K/L21krhBIlAgQ88bPT03P0TSQ4Eid1+Lb0IaAT64f5BpJzYGKvPH
         N+OTLODLxcolZlzMncMvDO0YxCh0+mgPT7EqpuV0D1mA43Rlg41MRlPxrDE8/TbYQxEX
         zQV4OG+3GRqE87Sto7dWbW4bsCch3gubFfnUWjisdT6J/tXM9oiVaIdD2K6fbUlt1DxM
         UMgMJQ8FUvkxec8A7aeIifLxGinxtN1oLRzJMwN600bmFDeGUZve4U9yn570OJsNffbg
         1VopKEBsTkFJWsbpSh7BMpNom6zlZ8wEikaS3YybB0QWiCSyQd95FDEcLdmxZoBhDzUL
         INXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=+ri1G7IfXRxdaHvDMSxkIiJevumRXLIgBs+arnlyrTU=;
        b=s7tadCdmPNDboww1t3T2NpapWsK9amqassdCBVpWNMg7yVJ8h+2ldAILpeJ9Z0BnBX
         A3usuWEVbGCgzfF6ASq7N8NisDusiYOQvZ0UndB7LbWw+HRl4awipf1Oy8ysgfVHXrHG
         9g2yphiXXHPsVoFNujZakJ6rTzE3wioOlzRvyxc7JAr/iRLPodbut60lX9tV3gCTvdvr
         eqWf/+spoyG107sh81pNCAVL0uqWzf3eax72trJsBkEcrr6tKjgzIP7WndBgNuXjkHal
         mafw9+f11n0un1kkY7t8bY8XiQmF/eHmi7BsjF3Ov5FtdcKig8uVDGnm+9BfA1nINPxP
         Ln3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mIS7SeNK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q186-20020ae9dcc3000000b006b95ea313e7si1047780qkf.181.2022.10.07.09.44.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Oct 2022 09:44:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mIS7SeNK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogqSL-00045c-75
	for alex.bennee@linaro.org; Fri, 07 Oct 2022 12:44:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogq8d-0002CH-An
 for qemu-arm@nongnu.org; Fri, 07 Oct 2022 12:23:51 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:42880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogq8Z-0007zF-GW
 for qemu-arm@nongnu.org; Fri, 07 Oct 2022 12:23:50 -0400
Received: by mail-pf1-x431.google.com with SMTP id i3so5311898pfk.9
 for <qemu-arm@nongnu.org>; Fri, 07 Oct 2022 09:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+ri1G7IfXRxdaHvDMSxkIiJevumRXLIgBs+arnlyrTU=;
 b=mIS7SeNKwZtWmI61nwZMF96UsQN2UC+GaKukKKv2YxstS1IgHSAx7WTxs7u69s9MbL
 n8V5w3T79g5XKfwFWeVGcV0VZNF9S61D83Q51/IkzoUuGOFiDUUTsnsfib/kNKDVueNv
 f2PZSaDSOjlnKgYqHmZT0uMlg8anyNeAbdqiJVGEb3bVrvU8QtpI7jQKz2/zBorozCf2
 W5kmjnqI3MlSVAn6zIAPBqLgPDKjiKPwkoPwjxdVvoRz1MRSvNtPOMWpxvze+uN26cyQ
 JKPPRena/IxNTS0qSUDXQ8Kifa7xb2YdDBMqIET3EhikDx4aV6LUoAaI3Ovb8XqRh4LD
 K3ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+ri1G7IfXRxdaHvDMSxkIiJevumRXLIgBs+arnlyrTU=;
 b=w75rbnd67WYnplbFggrzMV4N3Z8WpqhTDe6GNncerwUo6dFqYjABakrIWIZbSUgwMM
 Felcwzs6GcgCc081PssP+wy42y78qUXTjaYAzYom+ZxjEsxftf/a/2jXwdGNIIFBhk4r
 /d4CBQVQwC2mUPJDjRRkRbV9o3A1fZljVHGG7A2/McZpk7O1VjZuwwIat6Dv8KrAw6Vq
 SijcroxQrvJ8o1VkE6qTL+Imlsx4wEeYZ5FNdU3amg9kR6Wz7Fy+umQlIpZZt0u7mgBS
 2Eg4D8TWaw1iR5pvmCoslgV7XNs4IJGOo6Y+ZQXVnQcKRniBS+DhWFKxKammO+3hudCu
 mSTA==
X-Gm-Message-State: ACrzQf1p58mXfR2yrJJOwW+f7DrH7cRDb0jqWvUTF9lMhRvDRz8Na6Kf
 T9Men4H3xBsNZTNmScMne/J71zU05hYxi/bAIBENhw==
X-Received: by 2002:a05:6a00:181f:b0:562:8e02:ec29 with SMTP id
 y31-20020a056a00181f00b005628e02ec29mr6183131pfa.3.1665159825431; Fri, 07 Oct
 2022 09:23:45 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-33-richard.henderson@linaro.org>
 <CAFEAcA94XFJ1d0Trn08cMvxnDCxd+SGwJuG1ZQZaUb9g_FZg_Q@mail.gmail.com>
 <21eab094-34a5-6e02-6bf4-3ac4c70955dd@linaro.org>
 <CAFEAcA8Tg2Vmy2B0a_QcF9wYMHsQUY8HhEOXhmhTF6qO_3RGtw@mail.gmail.com>
 <404f0bc8-c1cf-bc30-0df8-2a33a28d2219@linaro.org>
In-Reply-To: <404f0bc8-c1cf-bc30-0df8-2a33a28d2219@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Oct 2022 17:23:33 +0100
Message-ID: <CAFEAcA9gJWkOQEHwX0TbLcwFUqncNhktwncJFQr1S+Gp5P+11w@mail.gmail.com>
Subject: Re: [PATCH v3 32/42] target/arm: Extract HA and HD in
 aa64_va_parameters
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: QXyaIHTGqNeH

On Fri, 7 Oct 2022 at 17:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 10/7/22 09:11, Peter Maydell wrote:
> > On Fri, 7 Oct 2022 at 16:37, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> On 10/7/22 02:24, Peter Maydell wrote:
> >>>> +        .ha = ha,
> >>>> +        .hd = ha & hd,
> >>>
> >>> This is a bitwise operation on two bools, should be && ?
> >>
> >> Bitwise works fine, but I can use boolean if you like.
> >>
> >> I'd be surprised (and filing a missed optimization bug) if the compiler treated these two
> >> operations differently in this case (simple bool operands with no side effects).
> >
> > The different treatment I would expect would be that in the '&'
> > case it warns you about using a bitwise operation on a boolean :-)
>
> Oh, well, no compiler should ever do that, because bool implicitly converts to int for any
> arithmetic, just like char.

Yeah, but -Wbool-operation is there to catch bugs where the bitwise
operation was unintended and the wrong behaviour.

-- PMM
