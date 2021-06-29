Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp4981837lfg;
        Tue, 29 Jun 2021 07:13:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEB3bYzr9206KTdhrl5MR/lOr/65HYmaLzp6n5GtpB2+539uE+iZ+Pu8nY6qXMDBXrfiE1
X-Received: by 2002:aa7:c644:: with SMTP id z4mr40082323edr.204.1624976032362;
        Tue, 29 Jun 2021 07:13:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624976032; cv=none;
        d=google.com; s=arc-20160816;
        b=vser8QTTcjisOA4i4hG+jmNsUle57EiYLa0TnY+wFeLyxuIjoXdK6fNBqMnmTJzz/+
         RQR8kpOmhPttjgx3eqvW5SDFrc/E98b/31wVplkQHdHN0UKC+CGtR2598rYrh+CoAddz
         nLMxXIaILo6oGVx7dSuKQKNl8eGUsS/bM+hiwmR2c3wXcapuUoKzEsJggKds74ZqpWPQ
         6zuEIRM3ayaJAt+viDpfytI+SlQbRKmdx85NLLNfG/1C+uwW6qajflLsEPkb+zLXBvQq
         E1uBOuE1k4uohwwEWji4IGltswKw4OyW0Bzk3CC1JwMnIT60kJW8k/+s4+9Ra7+gsfB/
         P62Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U23s4Uw9PlUsV5e98fwkaGZ6va+z9IaOkmeGXZIadXU=;
        b=FWstGQe1EVm19R6CafE4oS0RJRehpF90IXelDOFaCoy8rIMY5fstxDAoCgOEXIKa7A
         ZOisHggVmnOhA8Epr4Ao2SIVIvHziBpxgm/7Xz51fc/+nmxL6CaW69cpfor0p9hP9Ffu
         kQo1gwtPGsDvxpDE7rxGw6slm5Z7i9FkJS8tFJvSMy+VzafGNcFh9O+/14pb31lN5LRK
         DvvviPMqQrwc/HeNTLdf/dRuuOmDAXrLVs76RhXXKLmGkkaxGiOP/NBlO1iTy4ir1JX1
         6Vg3hc1iN0VuCLddJI3Musg/wWFSiCXYzIb5qumXdC0U/Xi7FR5utLWelM3aQGQ9HWSc
         JCcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xZ1lps7R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 18si17634094ejj.568.2021.06.29.07.13.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Jun 2021 07:13:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xZ1lps7R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lyEUp-0004Jr-GB
	for alex.bennee@linaro.org; Tue, 29 Jun 2021 10:13:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyEUc-0004JI-8X
 for qemu-arm@nongnu.org; Tue, 29 Jun 2021 10:13:38 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:42884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyEUa-0007s2-PF
 for qemu-arm@nongnu.org; Tue, 29 Jun 2021 10:13:37 -0400
Received: by mail-ed1-x534.google.com with SMTP id n25so4986699edw.9
 for <qemu-arm@nongnu.org>; Tue, 29 Jun 2021 07:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U23s4Uw9PlUsV5e98fwkaGZ6va+z9IaOkmeGXZIadXU=;
 b=xZ1lps7RKcUCR0dFVThMH/0y6XbtH1y/AIV6tGI6Q9D3gRxNEIlVlUCF1hIKc3olH1
 E5M8wTQjU9pXEhsPS0KOJeZJUOB9xqUIKpvO7AtlpBNOvGxceJ1nzUqmn64quOigTgCM
 9H1ZriWHyvl0z5+lTdncdEcdor6XkZ6kD2ZAgHRXrc2pkrXW/E1iq/QltoDIYG8NvGzv
 rFSQqcA/oTnJoZdDtnFn06kya2QvhtvcMesDA553ejwNQ2sEROJZi9UjVy/RGk+sMzgb
 guwiWGRde48LVgxqN3On3n8anUluVxSEE89Kc8iirZK/zEzXfkkCjyMIh9K5DTkXC8g4
 xe8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U23s4Uw9PlUsV5e98fwkaGZ6va+z9IaOkmeGXZIadXU=;
 b=MZFqlZCeF3pCh2NejFtbyh9lskf9ssokCC3ZMsQPzuKOF2PbxJsXHp4OMYqJznsjx2
 CisYX9RaUNIuvQXCeylOe6kmkdOsywVo6bTQtNd03UsqNBP94cvKS+AB7ucbUj9knw1d
 wGCsv85shA9n7Rs1TLug3ld5yc+IZGDDGJM41FMdlJzkgtvvp4EMW7U13SituLBbBn6E
 ZHfD3jVzTExlAUi4voy/MVFTVIS6xL9ri6Jj4j+S5etM6Rx2Z9+JM2+8AoJU9NJoLGmt
 xg2PPc+RfWNmVmpTTI63Ao5ddgSSK+MLcgR6BiHwJF2OvXx7jhEq1vvCowJm3cQm6rbf
 prtw==
X-Gm-Message-State: AOAM532ORkaPZBgKMXWM4fy13rzNGCP/3Za/PTd392q6Bo5OcwHLPaka
 mJSQcdHNrZhZRE1UcWCLRqYhrDZ/EbvaWoNiPgu72w==
X-Received: by 2002:a50:fd0a:: with SMTP id i10mr40217647eds.251.1624976015249; 
 Tue, 29 Jun 2021 07:13:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210629081551.14133-1-hnick@vmware.com>
In-Reply-To: <20210629081551.14133-1-hnick@vmware.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Jun 2021 15:12:58 +0100
Message-ID: <CAFEAcA_E3p=jKU6xBDoRCez_Uau9dGAgekuUpawcLh98hU1N=Q@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Correct the encoding of MDCCSR_EL0
To: Nick Hudson <hnick@vmware.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Mohannad Ismail <imohannad@vmware.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SjzJANxzZ3el

On Tue, 29 Jun 2021 at 14:03, Nick Hudson <hnick@vmware.com> wrote:
>
> Signed-off-by: Nick Hudson <hnick@vmware.com>
> ---
>  target/arm/helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index a66c1f0b9e..7267af7924 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6330,7 +6330,7 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
>       * We don't implement the configurable EL0 access.
>       */
>      { .name = "MDCCSR_EL0", .state = ARM_CP_STATE_BOTH,
> -      .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 1, .opc2 = 0,
> +      .cp = 14, .opc0 = 2, .opc1 = 3, .crn = 0, .crm = 1, .opc2 = 0,
>        .type = ARM_CP_ALIAS,
>        .access = PL1_R, .accessfn = access_tda,
>        .fieldoffset = offsetof(CPUARMState, cp15.mdscr_el1), },
> --
> 2.31.1

Is this just a repost of the same version you sent previously, or am
I missing something ?

thanks
-- PMM
