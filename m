Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp661504ejf;
        Thu, 11 Aug 2022 10:37:59 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5wUY4WhqZ+Nyq3FaVIoSXC9cvh7t6TF0oa1o6QPlXcLwxCFpUe9To2i7lTI+nfQzglesk/
X-Received: by 2002:a05:6214:29e7:b0:476:c87f:1a89 with SMTP id jv7-20020a05621429e700b00476c87f1a89mr26261qvb.32.1660239478971;
        Thu, 11 Aug 2022 10:37:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660239478; cv=none;
        d=google.com; s=arc-20160816;
        b=Cyd5YXj/xrt2tP6D2ywHS5fme81AlKiOmtM1Q+VYD2SLS8dHqtmGC1U8z941kmb4d7
         nFSG5ActyE2YJ2lcsZi7AEkkCijPmr46/2Q0lbRVpi4QJgAyM5Tf4HOAr0tRDgstChEg
         /aE9sZMwSQ50epoFkmHi+qnrrL+PlNschcKBZLRJCVheN9R7cC1BKq/AGEJb37DriCiv
         s3igPWpfpb0dn5/tYmSp3Kq/SdswH9jlnU1KQrqf/u/MOb62zofAmkn6WGRGBM4iED0e
         cT2uaaoQC1tpgb7uo2vVcaZ+B/ERWkLtsO3abkTqy93ZSCYUk6CNnwpwcn6HP/mZfJyk
         zMUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m5hafQZhWqwKswUWjWDDb0unhg0fAft7hPrBVTQuvu0=;
        b=Yg5b94lIEIvpuniEj5XTLeI6UACjAqJ8Wf1w7iIQM+TzgcXzzVdI6Cll3AUpNCNFyd
         UpywozvbXWREITlQ9QclQXI0FQjx6M1Qdh9CIijGvgfk1laYkQizAb5ZIBnTg5WMaPx3
         QSpth610fQaMVo2OJa7m0MSAngvu3wF49ay6MO7b9kKD4xayObyosrwUmrJU46eSyWhU
         sIiC3hGHNGG4ROPbC5LC3jq6R2stPQSq9uB31v+eoNIlubSb8b9w8e6LP+hxauzDCfb3
         emJ2A0dn8wcosFot2JhLzV9n4vA4oMpu1fP/46Tee4QWtD+kkixEgTKjPh8CtA5UaL/r
         PX5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZPeTXA6S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 68-20020aed30ca000000b0031ef6692fd9si51550qtf.277.2022.08.11.10.37.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Aug 2022 10:37:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZPeTXA6S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oMC86-0001de-DV
	for alex.bennee@linaro.org; Thu, 11 Aug 2022 13:37:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMBwr-0001dQ-5M
 for qemu-arm@nongnu.org; Thu, 11 Aug 2022 13:26:23 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e]:37418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMBwp-0002YK-Le
 for qemu-arm@nongnu.org; Thu, 11 Aug 2022 13:26:20 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-32194238c77so179839867b3.4
 for <qemu-arm@nongnu.org>; Thu, 11 Aug 2022 10:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc; bh=m5hafQZhWqwKswUWjWDDb0unhg0fAft7hPrBVTQuvu0=;
 b=ZPeTXA6S5Pj/1T30QyKvGSki5fUbZJXr3pmV8m+e3/ljREjvNUoYth8T1Aso9ySvAU
 p8bNwAz1FcARlhNYHeIj/HirY3/wU4abOq7J9EY8pkUYzuiVCCiUDGi9RLqeZw5DolpT
 nlBH/G3Klll4QaKPJaDq1pmr62Gl1NsBn9kHKZ7upQX6ST39HaBpwWkzYpb1ZIe7AKUR
 7GODCL33PB9jjhC8tEC7yxROkYJ7ilat7V+UHVdm9h0mDmu7WVHpvWUoM+681kSLrUjZ
 pAVotpzceql7Ve0N1rFBGJBT0Ov6fgXHdR1bGgI80A8GQxuXbt6t7YvfZEEtpBi37cIY
 p4Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc;
 bh=m5hafQZhWqwKswUWjWDDb0unhg0fAft7hPrBVTQuvu0=;
 b=gTRx7CEZ/L6UPf+zfUZ/JmGVR2MOUPaOyqzm+bkPvTBrx746Pme9QuQRSDerJ+LM0j
 23zOMbyWiy2BxINwTl5xLjEa1QnyeD3vm3QAdczE8FJ2L+P2po142JjxK2acGZ8/4fN/
 d1VRcTZ6sKm5zT6Kh3mhP21OlwmUK45fg0voWLCYM1piMWN7DqZYhfK7YfQcnE7KqATI
 fdFY1JNkDOkSqr3GPTET1JlDFoJ94Uu7bk8oUecSuo7ZfZdBw7jpJWH86Uk6yGaZ2YZa
 BbBXLdK6h+vPUmaGmUoDhiTicxO7T6LbrjFOU86gfdbha3oYKoNt1wzx/Qrl2D49wv7b
 JzIQ==
X-Gm-Message-State: ACgBeo36SPNXEXbH+ZWHszcOnOHv9ctACv8QfqP0x/LbqOMMqrLtrrYN
 UPypUZsgIUwN6FRtGv5IR06mDLKShQAQ0PAddSVuMtZl0zM=
X-Received: by 2002:a81:9942:0:b0:326:5dab:8915 with SMTP id
 q63-20020a819942000000b003265dab8915mr280918ywg.10.1660238777663; Thu, 11 Aug
 2022 10:26:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220811171619.1154755-1-peter.maydell@linaro.org>
 <20220811171619.1154755-11-peter.maydell@linaro.org>
In-Reply-To: <20220811171619.1154755-11-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Aug 2022 18:26:06 +0100
Message-ID: <CAFEAcA-FTaf1FKYgmaoocaDGdozx3hr3xvQ7zRhUDPacvhxr6A@mail.gmail.com>
Subject: Re: [PATCH 10/10] target/arm: Report FEAT_PMUv3p5 for TCG '-cpu max'
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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
X-TUID: JrIs8EoLtX2N

On Thu, 11 Aug 2022 at 18:16, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Update the ID registers for TCG's '-cpu max' to report a FEAT_PMUv3p5
> compliant PMU.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Oops, forgot the docs update:

--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -52,6 +52,7 @@ the following architecture extensions:
 - FEAT_PMULL (PMULL, PMULL2 instructions)
 - FEAT_PMUv3p1 (PMU Extensions v3.1)
 - FEAT_PMUv3p4 (PMU Extensions v3.4)
+- FEAT_PMUv3p5 (PMU Extensions v3.5)
 - FEAT_RAS (Reliability, availability, and serviceability)
 - FEAT_RASv1p1 (RAS Extension v1.1)
 - FEAT_RDM (Advanced SIMD rounding double multiply accumulate instructions)


thanks
-- PMM
