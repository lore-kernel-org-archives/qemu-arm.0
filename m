Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3499013lfq;
        Tue, 19 Jan 2021 09:10:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxHkRBp8Kyq9Da8JkL/Kw9ddTVnPwDqMXCqFZCSKXktIxEJmkusltlM8WIzv4Y6avHf8UGc
X-Received: by 2002:a25:190b:: with SMTP id 11mr6829233ybz.236.1611076203475;
        Tue, 19 Jan 2021 09:10:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611076203; cv=none;
        d=google.com; s=arc-20160816;
        b=kZuwwYNkmFwD8vJum1AJAJ1nqLHrUUPHnBx5M5qoB4I+csOTx3Uey/aSFIGINFN8oG
         lJQ7a6c284FfhYKvR0/f/XMvhP6CXFdCdtUteL5b48G3T2hoCQA1SZYAem16m58CF/pZ
         o8mzim8mDaWhStysxmdpvfib4YQp05e38fbgCbecCac3HBAWa/gBClCIpq4by/7qq4Jr
         HVXTVwU8XnzC3JbDSzidBAlraDcruOYqxmjM4hmmHcK92qcbqKREcEXukRvr+Fd283ww
         JlC3ZFFPJ/pGZUei670lTsUK4drIodtyY7tBSRXGPYSZOc+U8N4YeAetG9VxEsJNSLYW
         O0ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nYcrjI7Zodna8WKQcC7mBl2yfQhUtgvneKR3bEJRrCY=;
        b=ocxHe1w0YpNvByZU9Nz9nVTIVhJiNngyFVPT5Q3m2cfU5VdqeNRR9/4/0a09WKBLQU
         84VLifnNKczRWYmpo/PrqICDDZtMg45KrjiYCrJ76yvV0aoz0xytqdBndgKs0pi2TegG
         e2UAJwWLxJJkg3iIQkGmd3qLTZH2fY3WyBEf85T8vhxJpijPf46eagrZTPk17agCVvm4
         kbFL14xyFhA62Oj/kdut47CCPbC/EynELpsugBKt64uCxS3aMZvI0HnU0RpF8u7Eln+c
         /uO8VpvxFo+IwQ7g462HXmQbHmof7LOP9BJraY+jvRHywnV+Ig5YkVPkKDayyoNAzXs4
         tZ4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tL158EHd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o82si15718107ybg.183.2021.01.19.09.10.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Jan 2021 09:10:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tL158EHd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l1uW2-0006qN-RJ
	for alex.bennee@linaro.org; Tue, 19 Jan 2021 12:10:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1uQN-0001wK-F2
 for qemu-arm@nongnu.org; Tue, 19 Jan 2021 12:04:11 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:41201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1uQK-0003WU-TW
 for qemu-arm@nongnu.org; Tue, 19 Jan 2021 12:04:11 -0500
Received: by mail-ej1-x62c.google.com with SMTP id g12so29543025ejf.8
 for <qemu-arm@nongnu.org>; Tue, 19 Jan 2021 09:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nYcrjI7Zodna8WKQcC7mBl2yfQhUtgvneKR3bEJRrCY=;
 b=tL158EHd5uPPZVDUf//PyoQwapEB3TME6Ea+mtUE6slXW735PNjSpuYd7AFeMtWpqx
 SB1BlSx8Tl1o6mSR5ZBN5J0O+RqvGUf2gHSDjgxznuH/20KhZHkZ5EOOvS8HtrEhgkd1
 YRG71bw5E5aUejf8q0S846a8g4iqyEIZu22u92/phWX3i8ByAgwqocqD3WzXEntxPx4q
 41beMzR+r4/uo0z/IaXrSNvhOm/8Mhex7i8qXRNz+cschU676CU3u0yCtaDAOXYeNJG1
 TTDSivK2EBMqPBFXLAE55k90VWt9Lpa1+VulguzqRzda12wl42q1Nz5OFbIYttDsqPWh
 EYNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nYcrjI7Zodna8WKQcC7mBl2yfQhUtgvneKR3bEJRrCY=;
 b=krgLhLoltTJc6RxSKRyn/GlDDCACmY0EOkJFD7ebtX20Vz4NfNeKthkT3qF51tzC2a
 OMqrrW+5iIAAkr9pG8njT2tQO59getSvDCjWjysVJHu1cg7KYgf+lsTaW8qaGimvc+/B
 MzyQMeSQvT+RN7ZvkyX53C6ZPL9lrtEMeioaGb8lydjN3js86roDQrbrfT5blRL5XMpJ
 yi0SCl6NTuwvHa6DuSxSxL5KRu1xWfCbmlmVRQ9TLoUQQOBj0DHbapioIe6ROQbRFoHB
 Ndq3Rh/NvIFcsGgp8YzY34plffJwyBAdj+DQjE+M1mASZUPqV0HEnPhlidg1k7y6MR6k
 iqpw==
X-Gm-Message-State: AOAM533ycMMHB7806YPRb/43RJ6GgmkSgVBo+ICrMCfZO56aIVoifI+k
 gB/nAAYL2IHtLZsjAl8qXCfB27OB4bF1vAH6N/MpZQ==
X-Received: by 2002:a17:906:2747:: with SMTP id
 a7mr3702048ejd.250.1611075844753; 
 Tue, 19 Jan 2021 09:04:04 -0800 (PST)
MIME-Version: 1.0
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
 <20210115224645.1196742-11-richard.henderson@linaro.org>
In-Reply-To: <20210115224645.1196742-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 17:03:53 +0000
Message-ID: <CAFEAcA_O6FMNCLZ=rzEkehbrnwmyF3X_qgFYSNobi=EqKL5-WQ@mail.gmail.com>
Subject: Re: [PATCH v3 10/21] linux-user: Fix guest_addr_valid vs reserved_va
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VlnIwGc9KOg7

On Fri, 15 Jan 2021 at 22:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We must always use GUEST_ADDR_MAX, because even 32-bit hosts can
> use -R <reserved_va> to restrict the memory address of the guest.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/cpu_ldst.h | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
> index 4e6ef3d542..e62f4fba00 100644
> --- a/include/exec/cpu_ldst.h
> +++ b/include/exec/cpu_ldst.h
> @@ -72,11 +72,10 @@ typedef uint64_t abi_ptr;
>  /* All direct uses of g2h and h2g need to go away for usermode softmmu.  */
>  #define g2h(x) ((void *)((uintptr_t)(abi_ptr)(x) + guest_base))
>
> -#if HOST_LONG_BITS <= TARGET_VIRT_ADDR_SPACE_BITS
> -#define guest_addr_valid(x) (1)
> -#else
> -#define guest_addr_valid(x) ((x) <= GUEST_ADDR_MAX)
> -#endif
> +static inline bool guest_addr_valid(abi_ulong x)
> +{
> +    return x <= GUEST_ADDR_MAX;
> +}

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Looking back at patch 9 -- if we always check against
GUEST_ADDR_MAX here, should we also do that for h2g_valid(),
or are the two uses different ?
(The v2->v3 changes list for patch 9 suggests we may have
had this discussion previously, but I forget the details...)

thanks
-- PMM
