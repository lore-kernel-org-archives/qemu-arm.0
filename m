Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp483082lfq;
        Thu, 7 Jan 2021 09:40:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxac3qLpRFk0oCT0WNtEtzlR+0VSrzJ8gbW/9qdJ9aBvH1sEFLynPjl3U1cPYg8XNMLr64F
X-Received: by 2002:a5b:b0f:: with SMTP id z15mr14709230ybp.296.1610041224649;
        Thu, 07 Jan 2021 09:40:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610041224; cv=none;
        d=google.com; s=arc-20160816;
        b=MHDneybRwbaaBxjPSESGpd441TZz74WKgLbiv5b9H9o7MIoC5WWjKLZ70IJ8fiRS2R
         WABMUxlN8SFBH/fYR/h8mannTZl4c+7KjkNAEoWDmdlRGGLQ6RJYZd32zTY0Z1V1DB1T
         cxZM3wXvYk4zRYzcLYeb0OXx5ZDhNgmp/DsY1SJ8iRg/gKJ1Waqk6/yhEe4kZf16ncVt
         qcOUOp/BwjhGfpUMnfwcyEbpq/2TrCETgRVD8noUYkmHprA0ZJ9887EGhGgptg31fzhP
         Mc9N+Kv4evI0hKL/KB8ssDvQ3YJLh4+gAjGgYaEepb7ICdbm44W5r/eZYCFRFp92gu1z
         377Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XPChYwI2dOSROoKMEYFCOyPjg7Jz24QfoucKZSkYR58=;
        b=z/PrUFHM/EblvFow627TTr2TlEzV/WUSVsEKWz4zSKq1fGW6D8pyNisyBDrlowDYGG
         m5pOo9FpSa6KykQeqNnhS8P0Q21C37DZRt3RuWHMhCV91ZpN1dTd4JodDCl7h2U4pzlo
         1wa/OK//ERum5KmBMNhPBH0FCvxYUb5PiodrirTcS1Rbay6bKQvCAL1ICTZYetEqoFLK
         5uONb2YI2B2spCEj41gxsE713re1357b3v4fA05SbCKEvjmLKR6K0wSOhPFi/U8vQpum
         L+gmfONEj6N6EniFWFxzsRiZtsf7O/lyb9cl8CYP1baXfT9voAOQ8DvAWQm7XAb6Qxv3
         tz0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zXk+IbqQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e131si6312390ybc.460.2021.01.07.09.40.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Jan 2021 09:40:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zXk+IbqQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxZGk-00046y-Qz
	for alex.bennee@linaro.org; Thu, 07 Jan 2021 12:40:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxZ7f-0004km-0x
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 12:30:55 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:41399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxZ7c-0008CK-R4
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 12:30:54 -0500
Received: by mail-ej1-x62f.google.com with SMTP id ce23so10771689ejb.8
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 09:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XPChYwI2dOSROoKMEYFCOyPjg7Jz24QfoucKZSkYR58=;
 b=zXk+IbqQym10C69em1Men+EwdhaFXg9CcRB9ZDedUJpkKS20XYRatjdskcXWeM3Mg2
 CI24LFm6xxM3OqaJsotud3MWeRVhGn/kYH68fIZp5LOIdN+t2F5jVryBn9OPZIIFGz2p
 6xdZgxuUVy2jwwNoR/ROUiGWpoSWUmgsx1rM/VQkUnPTrUHHfmdZi0kAxv7Gm1yst5SE
 +rUbxlEpNYGAr7EcHgNJDj9Wrdj7lJMZh7+mYTXXd3bYaTmJLWsxDkimLRc4f/NgPAbj
 rvYhc6y7AzcTw64ztcRQh7wXzKxQnl5S/BboFSGM5b3jn2lPilCvkfmQZgsAoeXK3OML
 QGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XPChYwI2dOSROoKMEYFCOyPjg7Jz24QfoucKZSkYR58=;
 b=gUg8RRfT8znWBYmL//6eFRxZOjJyUKVwo+Qhyo5Sq70wpc+OLShG2i5OKae8boASmR
 I+KTr3WckLfgNcnvTiX2dxI+cpQiaQWGPIk95VIpijv6SPsoRNtMSqg0MtRJQUv9tI3R
 pHGyu8sICCPImtAb3O8dFH7iornWuKirTdfLm1oANVk6crqmvnIhEmZ1FoAxSpFH9UWe
 R2ppuMen/WAWsnM/bhxebVqWSJv96x90o1vSxGgCY4mzoiTtEwFBBCiYm8ZyXoxJ0H/2
 Ex2q07Z70kM+edv+oTHHKvs07GDfCPRIV2F63F/uiOgFcffLENEMrN+R8vNK8NRkWme9
 b63g==
X-Gm-Message-State: AOAM533Ocrsu90u+Jnm9mvL0uYOvui6yrTHQQcU7N4SKpkzvtsuq/+FE
 exKLZq3BlcMt8f7q0eYc28MffjQCvJso2Xr/TAj7uA==
X-Received: by 2002:a17:906:31d2:: with SMTP id
 f18mr6978905ejf.407.1610040649107; 
 Thu, 07 Jan 2021 09:30:49 -0800 (PST)
MIME-Version: 1.0
References: <20201208180118.157911-1-richard.henderson@linaro.org>
 <20201208180118.157911-19-richard.henderson@linaro.org>
In-Reply-To: <20201208180118.157911-19-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 17:30:37 +0000
Message-ID: <CAFEAcA_YZRZXjfH-dY9x7zJkkeDOfpdTbqwH1QZxb1EhOzA7Ew@mail.gmail.com>
Subject: Re: [PATCH v2 18/24] target/arm: Use finalize_memop for aa64 fpr
 load/store
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XaEPA7KS1hr7

On Tue, 8 Dec 2020 at 18:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> For 128-bit load/store, use 16-byte alignment.  This
> requires that we perform the two operations in the
> correct order so that we generate the alignment fault
> before modifying memory.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
