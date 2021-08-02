Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp2009720lff;
        Mon, 2 Aug 2021 15:24:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIrxMyfBjluLSBdEZjUpVvkKy6IG9oEiyTWwdDSMVovMgJVEVKZuZQZBo1zAkT8P54I5XZ
X-Received: by 2002:a05:6602:584:: with SMTP id v4mr797866iox.181.1627943076692;
        Mon, 02 Aug 2021 15:24:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627943076; cv=none;
        d=google.com; s=arc-20160816;
        b=UnHEDH8FgeH/utktJhDScLJTmUj8NvWe9cZ+LRv/SWhTRAm16c4+x125fSEpL27RLo
         Ouy1f8xKS7JGpkeH3SiFQ83gaph8112JLMOR2eSYlYBWR0YYS1L7BNJ4HAELfdYDe35Z
         ZkwCz6dG4WSOYcW6kUos3TpSeA8kU1sJxpUx9nivgqUHwzLXTzq7ww0RYDX5PAn7Q3UY
         nLHI/0pwTnjoX7zpfxMRZ22BLHDRNRaDDmgDRyLxzrN/a2LmHdzbQGUqMaLkUexeeb7P
         jYJZWv389WhLDd7YqaPrn+6yvuOkr+K0d+qMclNHlyTJQ6i6donFoz7LNwri3MMdYGbj
         VQ8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=KFYDCifg/mbgVUn1ZvLLaKpJMS36pZOswFlSzWorrSk=;
        b=eHX8+8/MSZbkU6GhwT3iWHncRpqajTiTarJaM9vFN6Tzalw0PXUFj4T9IpvuKBoA+L
         3NHt8AF1ouDdLgK79AN0IAvCJjA2ydM5axx1yxlCZxOGUc+AajoTDslYhSTlh3s65n6J
         mdJ7/1UrjG/moFxuC/8S1L7OzsG99V6kkwpkK34sG8F7EfcdA9pDJ/8h/nyfLyZ9+0vd
         s7lfLwFOk3MBvKFmfz24f13A6GjpxERK1tEPcouzZEQXUSh5+/l2LBweuEFfAupAWCuA
         2CppFcg5NBUym0NYEc40St8hhFDXeB2xfcYg+nLNXwzuBEC/YB37ZanHRMP0QU237qNo
         8TJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rp53RfHM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n23si13374864ion.23.2021.08.02.15.24.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Aug 2021 15:24:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rp53RfHM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mAgMO-00074S-09
	for alex.bennee@linaro.org; Mon, 02 Aug 2021 18:24:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAgLs-000708-WF
 for qemu-arm@nongnu.org; Mon, 02 Aug 2021 18:24:05 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:44793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAgLr-0004MD-EG
 for qemu-arm@nongnu.org; Mon, 02 Aug 2021 18:24:04 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 e2-20020a17090a4a02b029016f3020d867so2048375pjh.3
 for <qemu-arm@nongnu.org>; Mon, 02 Aug 2021 15:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=KFYDCifg/mbgVUn1ZvLLaKpJMS36pZOswFlSzWorrSk=;
 b=Rp53RfHMXKHfrdIP9tDdS3zXxib6ou9F8o3KH8F3zCsXb7BEGKCwK1a28fB8Xu9LEO
 R1zsdlSKJ2ko2SEJivg8WmPEu22PNPQ62dgoOJ+llkZYkckd0RYywlLw+fd6dtaOnUFe
 kRy1AaHYt1RNDIrRFBySduHp7ATwI0KVEfyWo8cRtus2xJBKEcbL7VYN+mYz9LfxQwNu
 xaIBqKW2SvsiEEtkakEliAh+FruAifRpGacDfecBO2RXHfyFLEav5Avd/Sf96SzSWOIm
 XJDfi/iV5UpvYTtBT8kQGj7mzZsPmeetbXrFotiGiJmAqrQ2y9IqRXaYD5HypiIdHh7k
 T0SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KFYDCifg/mbgVUn1ZvLLaKpJMS36pZOswFlSzWorrSk=;
 b=lLBgqTAFnf/gG1ID0KzCAk9A389BVoUAJnvVnZ3lujnDUAC3La379i1i4HfW8GWeYZ
 d9hTHhweDzu1IB6U5d5FbTMfiv6Nl7GN30pLQG/HFQq1xPFd09HnlWE5Jvt8rqmT+PN5
 C2QwZ5RYi5E011a2D6Ssq6kmbXozKtGpkcp4iDM5oD7EbkDns9ZoyEKZjrr26akNYuAO
 99MJqOIERZde1BU6G4Fo6VLmovPr/tCk4eQJ21K0b1sqayrAvmVVuDcFtqfC6u31Y+3V
 6s1KZSQIpaY1jBAXcvgfP/jOVYxHEjUcRwWhZdEo8xCZsqUmRfGAi0vCLgqed15+X7Do
 CtSA==
X-Gm-Message-State: AOAM530bhsLcUDgL0GNy0jK4pALJFfdXUY+c5ef4ZAvK0NIZtcOU9UAI
 Nas2LhfI8PvV9o1niYTI9+9kPHAwRVv1kg==
X-Received: by 2002:a17:90a:1f4c:: with SMTP id
 y12mr18647056pjy.60.1627943042203; 
 Mon, 02 Aug 2021 15:24:02 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id s7sm12592754pfk.12.2021.08.02.15.24.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 15:24:01 -0700 (PDT)
Subject: Re: [PATCH 2/2] target/arm: Implement M-profile trapping on division
 by zero
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210730151636.17254-1-peter.maydell@linaro.org>
 <20210730151636.17254-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1dfb2e6a-bf57-8d0f-88c1-7fe88b4857ab@linaro.org>
Date: Mon, 2 Aug 2021 12:23:59 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210730151636.17254-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZULKERc24AKj

On 7/30/21 5:16 AM, Peter Maydell wrote:
> Unlike A-profile, for M-profile the UDIV and SDIV insns can be
> configured to raise an exception on division by zero, using the CCR
> DIV_0_TRP bit.
> 
> Implement support for setting this bit by making the helper functions
> raise the appropriate exception.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu.h       |  1 +
>   target/arm/helper.h    |  4 ++--
>   target/arm/helper.c    | 19 +++++++++++++++++--
>   target/arm/m_helper.c  |  4 ++++
>   target/arm/translate.c |  4 ++--
>   5 files changed, 26 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
