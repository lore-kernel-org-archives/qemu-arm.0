Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1559590lfj;
        Tue, 3 May 2022 10:14:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3Ry0nc2rIEqIbpoDoQakKuPHKkNsog/7MKEJHi+fCDvCedBocFpKfNI1bKnwb0SAyNrqU
X-Received: by 2002:a05:622a:313:b0:2f3:ae50:bea9 with SMTP id q19-20020a05622a031300b002f3ae50bea9mr3594985qtw.276.1651598095646;
        Tue, 03 May 2022 10:14:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651598095; cv=none;
        d=google.com; s=arc-20160816;
        b=gWhNFtIMD8YZwgEF18X2xMJOIbaZYC8qkz+/fx8yeJ6rnMNDr1Ym8Y7j+krXtqGQbf
         KGMVAp+XW69k/ofpVfgj8XsSE5CZCY7naU07dYQWdH5y9ZGaBkWQlTZMLW9+KXgC/W1c
         SPNDFttTeXJ0NfsxpIp4udgSDgb01j3m1n1N13caLHsgBlDiZfJsjonTLHBNAeHH/eTN
         4gs2EBeZp54nPflwj0bGHsCYWySxGBZiDfgWh6cz0pSc/qajcIpLKe4MS23m7JVKOR/+
         ezJUCVmQEFLzc9iyTotJOJCtbykBKaMiQaBqKaYL+5IAJ/ii900lvKITeh0Y+hQJ0ya7
         E18g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Di4++87vTIuoqn0UMYKPw81uIUC7asGtUA11QiITcVI=;
        b=TacAjzAisotGJ7b2GU98vW+0RbFmTCrfArP0Dz9WKbcOs20NleYQLbpCwOcaEZ59xJ
         j2vesggW1MDPATeThE+KyzJv0orNqpf+P248wnMuc8MetY8NSf1YCAIwcCAv91TGKOmg
         PBXBU0bnjLvMWMtkDNV4pUs9hAS1DqLXREgYW4OWv0yIPSsRR7zBKWpfa3GbjzzUpzXt
         MRdAwWbqq7oKyTV1P42yP+Wrhn+UjFnY724+hnHBL7CaXRDwFTn56EXg+4ygrk/ryb1F
         JfmCktMttfUC8zjPs/vvvDJizukRmKSt99P9wtmyoW9Qsb1TSUxMejeFXy5QtOmoU374
         UjQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sPSHQOTh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 2-20020a05621420c200b0045ab037dd21si164096qve.51.2022.05.03.10.14.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 May 2022 10:14:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sPSHQOTh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nlw6w-0006pa-3d
	for alex.bennee@linaro.org; Tue, 03 May 2022 13:14:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nlw5b-0004TN-7g
 for qemu-arm@nongnu.org; Tue, 03 May 2022 13:13:31 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130]:43454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nlw5Z-0004nx-QB
 for qemu-arm@nongnu.org; Tue, 03 May 2022 13:13:30 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2ec42eae76bso187001467b3.10
 for <qemu-arm@nongnu.org>; Tue, 03 May 2022 10:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Di4++87vTIuoqn0UMYKPw81uIUC7asGtUA11QiITcVI=;
 b=sPSHQOThpplkZHcxWkUEWuoCq9ro0MH+1dnV/GX7Po1iMp/sUTvEV3vEV6M+ALKkKq
 ZaX/VEdAX2LSI1sx48uPlHshXJkDn7vPwL92xf7OKGER8NRCMXnOjq3DKfELLjV76SjI
 s50B5yQ1/BNQCDSS/uo72Cx0XXW/g2d6YlosMPftGNuc8GOYuiX2vi+wxvgi8d5ajfBC
 rHzRiL1LO+pEzBv891wKP5m+9+TFM120rfsCO1IcMfrQggSptX9NgznbKRGGjoP+1mVI
 zIVHeD+f7mwAsubd14qi+D1L4zdvFiHjTOxyA2FQyOPDr9m5jGMkmBHs9HMoNN1ZDigL
 u6Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Di4++87vTIuoqn0UMYKPw81uIUC7asGtUA11QiITcVI=;
 b=bqNMDorUEtsDgwZK3z6hdDj22tQ9K3t7APRY76N4rgCgE76ykYDYkDgTQooScQi1c9
 ndQ5WYcR5HQ2io9Cj+zkJ1GRGe/W7B6cFeUWewDC3/0Q+41+/oiEShSAyLhQTPHdGPzB
 2b2I6IRgXA46WsNppM25138tkREhKFU26kJkrsfeFjHtHsdBcu+wufXLfjWsnzFB63fT
 rsuPqvaXWUT7glJBWy26NSEfXaDRZj1rCUabwFO+d8dXwmydTabtnReZizFmT1QKAenA
 VE0YDAopkJaqBih3qlyY1O9tmjUchtwMEgJJaYjd9ufKll4I7vt6FDoyGLxdDCOQ0dB5
 HhUQ==
X-Gm-Message-State: AOAM531rExr/wCQ5VnWjvC67dN3sJuJmvxz0huNGGZN6YAMqOR7eVsCr
 LIK1Ax8cnKctmInbDN1KXk/J9tlqeIwVdJVLlgWb63EugRE=
X-Received: by 2002:a81:ac57:0:b0:2f1:99ec:91a2 with SMTP id
 z23-20020a81ac57000000b002f199ec91a2mr16071236ywj.329.1651598008887; Tue, 03
 May 2022 10:13:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220501055028.646596-1-richard.henderson@linaro.org>
 <20220501055028.646596-22-richard.henderson@linaro.org>
In-Reply-To: <20220501055028.646596-22-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 May 2022 18:13:17 +0100
Message-ID: <CAFEAcA9_c8dSv=MxF_TDX0jRZJixm2sAoZ=QbBGWf_SqszH1Aw@mail.gmail.com>
Subject: Re: [PATCH v4 21/45] target/arm: Drop EL3 no EL2 fallbacks
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: hukyOZYMsWxT

On Sun, 1 May 2022 at 07:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Drop el3_no_el2_cp_reginfo, el3_no_el2_v8_cp_reginfo,
> and the local vpidr_regs definition, and rely on the
> squasing to ARM_CP_CONST while registering.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 158 ++++----------------------------------------
>  1 file changed, 13 insertions(+), 145 deletions(-)

The vpidr bits will probably change here, so I'll skip
reviewing this until v5.

thanks
-- PMM
