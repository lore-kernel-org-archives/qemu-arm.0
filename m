Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp250282lfg;
        Fri, 5 Mar 2021 03:23:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwV26rRJKgG/+heHLAkeb5i7VfFNjZm/Z4IUl1RTY/RSHysUdDmCxs9ObO6Bg2PAuEeqDHu
X-Received: by 2002:a05:622a:115:: with SMTP id u21mr8208164qtw.35.1614943384003;
        Fri, 05 Mar 2021 03:23:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614943384; cv=none;
        d=google.com; s=arc-20160816;
        b=ZsTSvZse3ZYL80KsHxOsOxeISgkn9AkOUPOHG2brL20mFFjOLeM9OGdMqdK/2UD4A9
         +Hi69QVVER3NMFyMJJ2ZAbiZ0jxw/NdF4kXt3TXCunPJZMNZkFEO/EF7ffVwoGTAZ4AG
         iOl/4G36Y13k2IBSMWJE9Mh5TRTsFKiYNc9y8Ko1VHO/zRKM/odcXn/hVp2jPfVJ7gZX
         KWx+L2OFwau8B7sfvCGz31XYOqMfS96BdlPQlvuaMB7iauMTfp0GRcc1Aes3JBhHQODN
         A+IxyQVIFpUUOhE9yaYD7DFKVS4qaK/M0Ga+xGUku9QioUFUUJoAV715ayBugPfp9jaZ
         Pbng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8qyOVIxrlhAAZUUomRZiOSz30DPevvY82WCeucYNLzE=;
        b=EBHKDdFTSl4KV6Y93U6oByNAer/diyKuARaxa9iKVb32FHS9B7SFbh+9/UhgNQHH0G
         L1+nFGCXK1bXlh3+PyeiCR7IGJLo+u0xIUPJy9Wt5ab2O3H/QPg9ggUgsmD2BXj4UEFu
         ULhpqEyRXKRMn1vB4kWuYRR8s2bQdmE94lfhBC4EOUswFADqvycXomcrmOheSSl3ZfeP
         nrigeo3HF0+4p+GB2xhDgj8zmnfO60z3KaJkZ102+isrZv4/WKYlZpZCIqz8eGXfQelz
         sI57QGQ9oJsYznlgFjKtITUghbyyWH6srX2WbeIgVUDNOtiUC8dm8PKvOFkZZ8LM0DY2
         SREw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IS+2VCG1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j7si1406354qtq.150.2021.03.05.03.23.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Mar 2021 03:23:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IS+2VCG1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lI8Xv-0004yL-4g
	for alex.bennee@linaro.org; Fri, 05 Mar 2021 06:23:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lI8Xa-0004y7-SX
 for qemu-arm@nongnu.org; Fri, 05 Mar 2021 06:22:43 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:38475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lI8XZ-0004qY-IW
 for qemu-arm@nongnu.org; Fri, 05 Mar 2021 06:22:42 -0500
Received: by mail-ed1-x52e.google.com with SMTP id m9so2066225edd.5
 for <qemu-arm@nongnu.org>; Fri, 05 Mar 2021 03:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8qyOVIxrlhAAZUUomRZiOSz30DPevvY82WCeucYNLzE=;
 b=IS+2VCG1/eQCa7O8BlCgLX5YTRgYN6Lp4CVVSKfmGs7JaDF0UrTiVai4yy/l/IwdiY
 IBBoDci5O4FdKnE1wllTKJfFdEYIm18iaHVIYIcWYoJJ8MJGlBxTmgAzU6CUAP77L/Vr
 NucV2peQOUa1A5sxrC4jaNtCsVmL37EuIIzluuCz7SOw02VJWxsAxeJj772JoMNvuJMN
 xgp8xf/TnmTO/DRaNDJMcOoxbZjze7QtwTQW3hUev3qmnBb3+KK9yxXFuSqoXbR/+JY8
 KosmOF7dSdLcyH9IaR5UeAGlpPbHJaY4OqbNhH9EMd1LBXYp5u5hthhTUX3/J0T/9r0e
 +Hqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8qyOVIxrlhAAZUUomRZiOSz30DPevvY82WCeucYNLzE=;
 b=QDupjNiShoBK5ISmohUZmzWdqZ6ek5yOwIBRENV82vexxtwaR3wQykEMh8v+1gjmIh
 CvWUndQUF69h7MyNECCHxHTeFugk3/qfz7pCX1NcLHIDJQK89i6cp5AVoGsccVmlX1kt
 3Wq0P8ePZ3fEZ+qLxvYYDSiZoe+cMTGuNWRkIGOrcEB9XlIH5QD9U18WG6AO0TLwl4is
 rt965ojVKHUcaJ5/o6/PliKJA7dMH34l2tloRFsQa3pxJI/42s7dI/7WjFZcQ8mw8n+t
 n4fyBBrK43di1VMObdQS2LEz/fe15I4cmFpEcX0urosZVFLr/KwQimDKnxKbHa7ePNEk
 g1gQ==
X-Gm-Message-State: AOAM5304GAGIV1sxiMcezBYBQ/n/ej64AS36fXjKWUhLnY3ooNysurT+
 InNr/EpKMAbSDHU/vtvPXwQVG/uZUG7MPD+RQVRowZw7YSI=
X-Received: by 2002:aa7:c804:: with SMTP id a4mr8460140edt.251.1614943360064; 
 Fri, 05 Mar 2021 03:22:40 -0800 (PST)
MIME-Version: 1.0
References: <20210216224543.16142-1-rebecca@nuviainc.com>
In-Reply-To: <20210216224543.16142-1-rebecca@nuviainc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Mar 2021 11:22:24 +0000
Message-ID: <CAFEAcA8CfHe6NaaSF5S2cz=SkKOQoSOjsdMVqDUbM0D7R_EXfw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] target/arm: Add support for FEAT_SSBS
To: Rebecca Cran <rebecca@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h10/rdoqi4IO

On Tue, 16 Feb 2021 at 22:45, Rebecca Cran <rebecca@nuviainc.com> wrote:
>
>
> Add support for FEAT_SSBS, Speculative Store Bypass Safe. SSBS is an
> optional feature in ARMv8.0 and is mandatory in ARMv8.5.
>
> Changes from v1 to v2:
>
> o Removed changes to cpsr_write_from_spsr_elx and cpsr_read_for_spsr_elx.
> o Moved the SSBS case in translate-a64.c above DIT to keep the numbers in
>   order.
> o Moved the check for SCTLR_DSSBS_32 in take_aarch32_exception.
>


Applied to target-arm.next, thanks.

-- PMM
