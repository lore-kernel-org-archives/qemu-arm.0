Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp72186nji;
        Thu, 11 Jul 2024 03:20:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVHTPcV1MmQBt0ldKXPmeBLe0lV2Se4PFRR6pfPgqqr24DoDZZW0W6cmTsVnzFrFFVqZJylFJwmGhC6z+OsvriV5qSzwEKI
X-Google-Smtp-Source: AGHT+IE9ztKYNZCITIAkbFfXPtLBX+CD3MZyGAnnYv5uts750APEORELz4dYYRd1arImN9/kZQHo
X-Received: by 2002:a05:622a:20d:b0:447:f285:926a with SMTP id d75a77b69052e-447faab5c42mr98350341cf.62.1720693235353;
        Thu, 11 Jul 2024 03:20:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720693235; cv=none;
        d=google.com; s=arc-20160816;
        b=tTFpMhyQdYVKyVbwE82KGjVon8NtuEP4HkMfTQC6SZDZ+d/3i5zQcA0ihLRlDtittj
         9DuFvqTjO5txI8szaudR+5htDi5Y+qIh078AwekK1YQDXU+PbN8fWsrKRcS976boBWlX
         4OmG9ikGGdDAIRJS6/ik4Tauh/pg3zFJBT/a0xqKY44Hc0PIfgRAnTeQVDOwUC932ex9
         XBbOS9izcL0JIbXoF4vO6egJYZBSeSdadvyLnNO9JbiUdo5OKttKmcUiQRWG0iRZ5Q81
         AI3c6/tnMYdkYXbCFcgI9DvBBWlceVYHtms8nGvLd7kwT/aDBoiQEyLVI6pFG2HLcWoo
         Oslw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=nq4823TG2sDpzsypw4Y2OeiLpK0wI9qQaXrKDfZOUPM=;
        fh=mCyjMy/xTXR7PZcb3ZGTGDnk+dDVBjpBxE/X8b242FM=;
        b=xk1Scn7vIxTkRI8LvWEQociXTJ9Q30fuEk+8tmRqehdthtJxizb2sERbHmJAY6pxlT
         Lqc7jRHcvPTdQJn3nIUyDCDHfBisLrR4k1oxmoklzRByEleDd+Pilho8b2eCpFktW/3z
         1eB056d2ervTiTzagot9WvwVoVASLOXbYIHj0CevylyEBKCwQbQCaQKKEBfDkPKxnPuL
         xel7jzD11xRXXwg7uacU4SZgOUlegyWYcsZDlTM1MyrhjBlk+EbBfY91+4iPNY9Q2TPc
         sxC8yYyMCvOVixkn76qCUukRwOzv4EGFZh0IKewJXR/ypbkiP0owfp4RDI4qDv3qbbW/
         jY9g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xVxh6JFa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-447f9bc4f47si75929271cf.482.2024.07.11.03.20.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jul 2024 03:20:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xVxh6JFa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRqu9-0001ml-LN; Thu, 11 Jul 2024 06:20:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sRqu7-0001js-Jq
 for qemu-arm@nongnu.org; Thu, 11 Jul 2024 06:19:59 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sRqu5-0006rv-Lc
 for qemu-arm@nongnu.org; Thu, 11 Jul 2024 06:19:59 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-58d24201934so1246683a12.0
 for <qemu-arm@nongnu.org>; Thu, 11 Jul 2024 03:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720693196; x=1721297996; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nq4823TG2sDpzsypw4Y2OeiLpK0wI9qQaXrKDfZOUPM=;
 b=xVxh6JFaPXOodNaNbOqDcv3AKasyUhlArHxlsT1JoWCvB/79SXELLiqli7T/4M2pIM
 jn+99RyZ4J/8KTpxTLVrhtnDTxOZogCBMCLj6jGOMqvHLuU5t+zXcLkLSm1TuSQugEr3
 /VJD4iGVHth1m+Kq89JoDG9/5lX9Z8itFX/v0o9pjtnre5UJsF0dA9+rMIJq5JABCD16
 WKQ8o96HLCkMRNd+pj3x15juc9k8M2FRYZlXsUvR/XSdUCRv8Vk2Fdz1BLwY4wDoEQ4a
 4ODv45g/3+3+8B6HAWrz/BAZQdxWlHValWbYFluxZy1XniOJHwjxcNGMFURjLTK7ys5T
 NclQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720693196; x=1721297996;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nq4823TG2sDpzsypw4Y2OeiLpK0wI9qQaXrKDfZOUPM=;
 b=UzonKe8aoFykpHlRCo3989Ol5+PJObbIuqcNWGyvmBukaSdmpbeI3EclrA5ZHOI0+y
 SmFcuOXlJT9YZ9v/frL38Q+hp+vTyTp0OTGo+GnBBVUUd8SvsHemRvXKZ3VkE8F8qsYB
 waKF1e3o7uclCpRq2f8qpYhTw53DSijn5VEgy6Excv966T+w/S1NJfYVqau6ktLvujej
 xke/ATOa3dPH6hpUXh33bWvYXrb6T+BxnBJm5cPuBeJfh12fIhKPsrQcKZJGWSNSC8OX
 7hxAmlsw3PWEjKRbK5qHnmCanMCL3+AvuUVFf/PRVFrCsr/zK3VWj8CHZzDYZOSfueHV
 qGZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWazZMtvb4XbK+qrFE9qlQtvm0Dv3j2Ok+n/SzU0YEaXCBlxCADGONJx9KFSY+QWw9wTsERc79bQj4r4Cpb5iKnqUpa
X-Gm-Message-State: AOJu0YxWdo7XkB5atpLc1aebNkQ4t6AnvJFJQtVP1FADavDJgM5gKjuY
 yVoM/knsYLIKCMVW6+nw8nK435iviFoTFzTvqiZEFXT8sh82uy3cNA1mIEk+EfU/ZmCKywqGI5z
 +lfNBk4GLAyUZphgg6+pBZianQ0u7XmEUKSfh8A==
X-Received: by 2002:aa7:d814:0:b0:57d:4409:4f48 with SMTP id
 4fb4d7f45d1cf-5980e530e85mr1750111a12.15.1720693196051; Thu, 11 Jul 2024
 03:19:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240710173512.424547-1-marcin.juszkiewicz@linaro.org>
In-Reply-To: <20240710173512.424547-1-marcin.juszkiewicz@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Jul 2024 11:19:44 +0100
Message-ID: <CAFEAcA-q8uUzHaF1KazB7uuhgpbtrTKdL153Btzwnz6pvuOPWA@mail.gmail.com>
Subject: Re: [PATCH 1/1] target/arm: calculate cache sizes properly
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
X-TUID: 8LE3n9YADDFq

On Wed, 10 Jul 2024 at 18:35, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
>
> Neoverse-V1 TRM says that NumSets are [27:13] not :32 like in code.

NumSets in fields [27:13] is the 32-bit CCSIDR_EL1 format
(i.e. what you have when FEAT_CCIDX is not implemented).
The make_ccsidr64() function provides the 64-bit CCSIDR_EL1
format (i.e. the one when FEAT_CCIDX is implemented).

I would suspect this is an accidental error in the Neoverse-V1
TRM -- if you have access to the real hardware and can dump
the CCSIDR_EL1 value I would expect you'll see it matches
what QEMU is implementing here (and that ID_AA64MMFR2_EL1.CCIDX
also says that FEAT_CCIDX is implemented). See also the comment
"The Neoverse-V1 r1p2 TRM lists 32-bit format CCSIDR_EL1 values"
in aarch64_neoverse_v1_initfn() where we document that we
don't trust what the TRM is saying here.

How did you run into this? Is there some guest software
which is assuming the old 32-bit format and not checking
ID_AA64MMFR2_EL1.CCIDX to see if it needs to use the new one?

thanks
-- PMM
