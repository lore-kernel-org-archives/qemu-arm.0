Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp409866njb;
        Thu, 5 Dec 2024 12:35:47 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVzizU5mFhOxiye1A5sLHGEZVoVAJtk9zABP1/ZF6Damc+b0ZCk5jZLeHAOqvMvircazq87jyqI5WXtjQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHY8C1pwrIlMTbRlU7SSmOKZSIHq6SYYQVL7eDjFsFBx1pRoKVNPwx0u6jZp6PXpVgp+NUY
X-Received: by 2002:a05:6102:1627:b0:4af:af15:c956 with SMTP id ada2fe7eead31-4afcaaeae52mr1369838137.23.1733430946936;
        Thu, 05 Dec 2024 12:35:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733430946; cv=none;
        d=google.com; s=arc-20240605;
        b=Lq/MvXOujhaT1ydCb/CrCZDw1mySRJY7d3P7IDjNt2MQRSq1o9PWCnFgQs3Zv4fe9w
         9UR3/fqRjURfWiZUKhsd+IDu5KwXBCRb/sXYyaj5NLftZUFYaVlQlph/e7rYujlz9eki
         iYSlsHQwtiW6qlHFLc/mkiUyWSI3AvIQl2xScDoD7IAPvtmqZxEPxrEASSp0hn1juF76
         tMdTLoqsFYTXy6e3DpROCim7mxxXXsmUoBXzREr0cWQe6rKP2888sj7hdqPsneDQSWqT
         tNhui/2qX+ffikW4EUY80XdFhIQ6DYuPXu3azJop/X5uXKGt11AShRHxvxfSqJ8JavBj
         ymKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ngFJNXWrJdFmHNW7rsyqfGqxlCebgMUTUKhB9LU40S4=;
        fh=eKbMGE8NQozFleMW+9rDALYeZDA1/1BH52gwmyDxu7E=;
        b=Z5Ao7AQukowj7/0lYxjlIltfYbe0Aj1x9OT2nFGmKlXXA1b/HEoEUUduRx2bJ8iLzG
         Iw0DegI/xwTRXftMvt16hJpFdSpZd4Lf0+bS22bmQcGEsawSb78BoxLxxfYvxG6rIMkr
         YyHuNg/TGETU1+ky59AW27U+sAADvhjcGzr8+zqvAAHslG+KmfPA/rKPSZ/IUufYAXGh
         Ey3wGFm+0mEDvMv6YUhF6ZoVr+P1Xdt6VKH1P7IeEoNEcAh2xiBLkANol6kieSAgbj2h
         dpeKzB3VhDidBVoS8CPP/BYCztokFHI5bXn5/xKVGx75zYffP0/uyd8+QKOf2HLwxQo3
         DBZw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RNkInXyQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4afbc79acabsi807387137.666.2024.12.05.12.35.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2024 12:35:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RNkInXyQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJIYo-0005sh-Lf; Thu, 05 Dec 2024 15:34:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJIYm-0005rq-SQ
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 15:34:52 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJIYl-0004ZU-1F
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 15:34:52 -0500
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5ceb03aadb1so1793115a12.0
 for <qemu-arm@nongnu.org>; Thu, 05 Dec 2024 12:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733430889; x=1734035689; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ngFJNXWrJdFmHNW7rsyqfGqxlCebgMUTUKhB9LU40S4=;
 b=RNkInXyQNp6PZD4LFPeC/r5TR3dif10E0K8RuW4CXet7e/HaVKGybkchcprQbDtKUA
 z4sb5319wa6G7xhf9AvfQASMNMGdxYKY7bBGJkIl02o8FmtSTABdYxH/nOJQGPzCgrfi
 bx1kQrpEqOfxQSmrGocmhT4PVFOUHZrVRft34ieq8zjYLawnFf4ia4xDNZBOL92TzWNp
 BXDptHRaHSHLlw0U7zV9Wq6UZ7ikQBMZdfpbjzSN8eEDJxv5Vnw1xeNgqXSMgsghck3g
 0hLDDLfI8OetYXcfNdf9EQ7wE845bgKH0b/JiA6URc05wg1XIQT20pjV46hHyznM3kEy
 FlqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733430889; x=1734035689;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ngFJNXWrJdFmHNW7rsyqfGqxlCebgMUTUKhB9LU40S4=;
 b=vonZKgpPCybLV4fFQJDKwWxvWuNPm2FE7helYvRGq7c7mPvTyvEewa+A8zpndvF4He
 T7Q2DMMmvN6CGIqVdhzBUYw5/Gmk7CBfRnh3vqIQ5aqr0CF9fqxAILlFF5d96i2v4TEn
 0oN4ZHjzpswiDeO0nleIehblyrnpVBA7DqnUWNnfOaIBo2VB/0xpX8P2WSeotUDWoPH/
 CT/2QVo3fYg9SX+C3Y5T86cQvNStygSByyo3K/cA+vGQVCBacCKGE32wQseV7uRIYcDh
 TjyKhlXY1Q2PZBIxmPS+sw/qcUOuYjGSD/qpxPYtv5rH20GYHbvqLCfDqq3L8SyAq2kJ
 ME6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLvp0oSd+gDrBLo88hdp3AdVKWn8RuRL9ciLyPaGSWxvOyWBJDYEJnZS25ls2N+Vcu4os6/07HHw==@nongnu.org
X-Gm-Message-State: AOJu0YxDwKhtv2LkNXOmszKYGCjJxKj/YIgUPAJ7MViHcCFauKsnRej7
 SmKKaUb7SFn5wi7o5DvCqJ3OOukhyU9joaFpWxxbNdZ+kvxQooGcO9t7Pci1gawByV0sgGQd6eY
 2cwmyDXfSy0ObXXvkuGnltZaBOsq/m0+iifPuPg==
X-Gm-Gg: ASbGncs7jAZWaVkCroZpPe6V7c6ynv/n/fMQoDYyoh3ioTbzvOFe2Z/xEi6Nj2ZI4sF
 uAdWXHCQaRjTIzcRu4sAS6k3OLjarSP+k
X-Received: by 2002:a05:6402:51cb:b0:5d0:b60a:2ff6 with SMTP id
 4fb4d7f45d1cf-5d3be71f26emr433489a12.22.1733430889173; Thu, 05 Dec 2024
 12:34:49 -0800 (PST)
MIME-Version: 1.0
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-20-richard.henderson@linaro.org>
In-Reply-To: <20241201150607.12812-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Dec 2024 20:34:38 +0000
Message-ID: <CAFEAcA_GoZpDOc8TgaGDTLmiTUOGXWPor=qzNkn+eRavarBgWw@mail.gmail.com>
Subject: Re: [PATCH 19/67] target/arm: Convert disas_cond_select to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
X-TUID: e1NlW6oDT8FD

On Sun, 1 Dec 2024 at 15:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This includes CSEL, CSINC, CSINV, CSNEG.  Remove disas_data_proc_reg,
> as these were the last insns decoded by that function.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
