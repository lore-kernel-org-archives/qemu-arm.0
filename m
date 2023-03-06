Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4596487ejc;
        Mon, 6 Mar 2023 04:37:41 -0800 (PST)
X-Google-Smtp-Source: AK7set8lp4QuuME+TqxHfn192uxpsXj2AFE42WLEEqYZqgN8f9jvfcl0DKbM5zxrxQ9AaSGzZW1s
X-Received: by 2002:a05:622a:18c:b0:3bf:a760:cb5 with SMTP id s12-20020a05622a018c00b003bfa7600cb5mr18520618qtw.4.1678106261612;
        Mon, 06 Mar 2023 04:37:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678106261; cv=none;
        d=google.com; s=arc-20160816;
        b=YynbBZPVPMKzPHRFrgjHa/2KY7x4vUB/48Y7PTRgq19ABuf0MBnSaX9Hk4SZc5gCQL
         MSB+HQO9PjuVOiu/bUnAh3/k27hADcfRGyw3n7624+84uv38GuHCDGpB5wcUozFDYozT
         wQP3BWu6wbsEOyEp19j2PN33TU0hZKMZ3d41OMJjYqUbDM+2Y/d2evm0Zk5udoME+53T
         usnv+fRUkLp2kLCJ2OgAfnmZROt8xkp4vVxr52J7UCcEok1Q5sodaJ8Av4f8RVQI9HWM
         Hg/3KP2FdyR98JeQaj4WIsOtDExi2yRbeLHlrfK8Y8fLR3ktErHIeaSmgQkz/8Qhdxy9
         eUfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=0VRxSNypHOH0Bluy3jMq6gcyyg4Fi5FYQQHSGnySsR4=;
        b=ub8+YFYTHtQe+sb4YxI6r8DCxK+Wkp6EHGPpZTIEsPAL4Tjfou4ue3hB1YDAkCdMT4
         +wGch/FRCNcTGJe8VL5DDOi6lwVvvRvKjAk+3hyZX/iXLa4frCMTLvhvfDEVvlHu6fmS
         v91qb7F3Jnnk54wXN4PwE16cIEv/jJodiEiP1lKSH/AXqLx3KnKSMepFGm67P4nTfqkW
         sdi9UbZifW2wOWx6e6MF7kwQb7xfkP/QR4TfaKbi6Qo1Ob+skNHxQ1JgTuknwVs+J2B2
         49kD2vmX9u5M36/nsBu/BVLqKgHu94M8SKR9YQjhLG5GejxLMC39zAWjUNRvXf0TiqgI
         3jjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uITNMdsN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s21-20020a05620a29d500b0071fc0e709c7si7499610qkp.84.2023.03.06.04.37.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Mar 2023 04:37:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uITNMdsN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pZA4F-0007ju-FY; Mon, 06 Mar 2023 07:35:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZA49-0007WH-I9
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 07:35:47 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZA48-0004W9-0o
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 07:35:45 -0500
Received: by mail-pg1-x529.google.com with SMTP id 16so5396437pge.11
 for <qemu-arm@nongnu.org>; Mon, 06 Mar 2023 04:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678106142;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0VRxSNypHOH0Bluy3jMq6gcyyg4Fi5FYQQHSGnySsR4=;
 b=uITNMdsNO4EsyY8muVsB2z14c1EQhdYaOxIeETIDWs/IOPQAxhrJblQWyYycSSaW4j
 xhBu83e1WUH+nrhpKxnb6PM80AZM1Ni/4TYfyzSZreMmcc3CR3aQ0MVL9h1eA0JpEGsH
 P2ug9whj/isSKJMZ2gB2G3zKNjpq7bjwKtcOwnlKeZlDSYOGsQQUMBnsSYU2dUqayDts
 KfoRKet3Dnb+6cfrtnexUmoi5w1lraYMztdL3dF22HQm3ja7XXD7rzmc66SSobDTFD/1
 wcLwcKVTQnF+Ux8gO5ncDlzgo1RiZ8/EHrnDhlw9Cubb3L+EEdt78Gp3XrnkEj2hhpgq
 JMvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678106142;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0VRxSNypHOH0Bluy3jMq6gcyyg4Fi5FYQQHSGnySsR4=;
 b=mMmMlTfY1SqLD3arGn3W8xVogL3Go1+Vx7Xm+3MYHtKc0+S0jdsGLbi8upjBOb7QlE
 VMIn8t39Q5HTaY/eEVVpNnmXGrTG9lCvDHaKrRrCUNmUn6baSDSxJxRqYX3bELLJv9zQ
 m2Hw95gZZhznCXjQaj4SGbvswRhP9jwQaVaICRKvcZtyu29S0lxRet1t2ESitMMA0FVe
 Z5/QG8F+3kKDFb69iO+FsBKJpB3A3e7PDrn2MSrgAjEOsVH/IhslNfONCf3VpWJw4TWT
 FkSTeeq6eALo2ZmAlefEo3HuBFYxEPXnNjNZ1eljOy60ycD3qfC9DHAAcDhyTS6mW03k
 6WLQ==
X-Gm-Message-State: AO0yUKUmt+qzuNW6d78RViaKxPnicumQ65rtuGF8VaGWbjL8mK8aaK/u
 ED7uOA+dShkY+KgyEN4YaEv21WnCCY+nD8vgcEVsjQ==
X-Received: by 2002:a63:8c17:0:b0:503:7be0:ea51 with SMTP id
 m23-20020a638c17000000b005037be0ea51mr3674862pgd.9.1678106142565; Mon, 06 Mar
 2023 04:35:42 -0800 (PST)
MIME-Version: 1.0
References: <20230228003713.861168-1-richard.henderson@linaro.org>
 <20230228003713.861168-2-richard.henderson@linaro.org>
In-Reply-To: <20230228003713.861168-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Mar 2023 12:35:31 +0000
Message-ID: <CAFEAcA84LMWr3qjHuE7YWnWfFUXqMs18PB5qnf6kfALejt4-=g@mail.gmail.com>
Subject: Re: [PATCH 1/3] target/arm: Avoid splitting Zregs across lines in dump
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /CXw/5Kqbilm

On Tue, 28 Feb 2023 at 00:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Allow the line length to extend to 548 columns.  While annoyingly wide,
> it's still less confusing than the continuations we print.  Also, the
> default VL used by Linux (and max for A64FX) uses only 140 columns.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.c | 36 ++++++++++++++----------------------

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
