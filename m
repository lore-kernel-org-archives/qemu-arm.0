Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp3946892lfm;
        Mon, 13 Apr 2020 09:09:35 -0700 (PDT)
X-Google-Smtp-Source: APiQypKTp+wra7a0B3LE+PcAvcMn39i6eBoQsL+SIshP+DTL/6wq5eiioD+zc7I0sd1Kr5O6llpR
X-Received: by 2002:a0c:9aee:: with SMTP id k46mr16546501qvf.7.1586794175178;
        Mon, 13 Apr 2020 09:09:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586794175; cv=none;
        d=google.com; s=arc-20160816;
        b=KCuigUG76awky+98rjQXR5p/2Rs3u/V/Qq15Fx0kydUJwWJ+E9E2CozvEDNdRv/WlZ
         nCNBxw+RosfHcqlkVnGUWmfw1XMplb30lafGmf8+s5rhur7B5cqPUgz4aGWxxL1lyLwk
         q+6CiThiTW1fGgrHFWbj5rprA2X/msEtuKIKze1U1qkkpQ24I2iF8TxvPe4uejxEi1hC
         B2jvRcVJ0kKvinjOHpChdSBhoZ+hIw8AEmQUoXMTXb1CBwukheUSGhKPf35FkuW8WF5C
         htOm8YXQ6HZVdYausHv7LupngImdCPrul/4ljp3PyS4bS/wpEU64jd9FNgKIrrm/YxCM
         RLWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6zzYFmntnypYkZL8T/VhiKG1nc4HF35zN8ul5ipSsiQ=;
        b=AEOYpN+n9Frp+nUKNiSkU+gD5qNLsOAdZhA/wFIG77XiN42xJUFKfkvumso+VwnkxP
         9mFqo2kt1bgJVnLJfjx+RB9GPU8IR9+oIAfeF/kL6hNFR0iFxbjzU69ZbdqcCUvIYs5l
         mguNv/FDqTQWu4mNBeCBsT2cVAQI4c2wwTsmJPA/QHaI06IeX03r2Gs2haiLBJ2gvuJP
         iYsWQgB6ywnE1yU6pHUAVlD4JPv/vAt7TlPbQZUkmPzhdB8Zzf2zWRfLgJNoJNGMcJT+
         aBaLGLGup/iKy9fb90j0hUzODmE3z1v0ysJaTfn6lH+mDCt1jZmx38GPW87hlgiANQss
         /UvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gmuAY6sO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f1si6654193qkg.142.2020.04.13.09.09.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Apr 2020 09:09:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gmuAY6sO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jO1eQ-0005ou-MV
	for alex.bennee@linaro.org; Mon, 13 Apr 2020 12:09:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59276)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent.desnogues@gmail.com>) id 1jO1eI-0005jd-A5
 for qemu-arm@nongnu.org; Mon, 13 Apr 2020 12:09:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent.desnogues@gmail.com>) id 1jO1eH-0005f1-Cw
 for qemu-arm@nongnu.org; Mon, 13 Apr 2020 12:09:26 -0400
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:45328)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent.desnogues@gmail.com>)
 id 1jO1eF-0005dT-Di; Mon, 13 Apr 2020 12:09:23 -0400
Received: by mail-io1-xd43.google.com with SMTP id i19so9814525ioh.12;
 Mon, 13 Apr 2020 09:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6zzYFmntnypYkZL8T/VhiKG1nc4HF35zN8ul5ipSsiQ=;
 b=gmuAY6sOFARZwsD5xGK6yQ1qKibzfPITzJ14I4YMcs8zY0+KSATmFxVSF+Vg/WUxr9
 ZCLJwgGknIwHZ4MSDbqAtpGxkg8M5w916LZ4aCLbWgdib+jqCTYVH+lsR8fUfMaxf3BH
 qq+o5krAETEWtaV17KLV2m0PLjQxQOqKU37FXKqEGR89a9m/0NClXMrequaWiIUUIpYe
 yZyDx9QoPzIBulaW92fBgGpbiMfM10NeKbCs3tiwgpv4bts6t8A5tqE8dqaNNjMNpjLj
 LnyiU6H7iVjulBMcG4qUcylsmAAFMmU2cWIlBE5EY/OOkAz1JgcaDgNa5IuNFm1/n5Jw
 kG1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6zzYFmntnypYkZL8T/VhiKG1nc4HF35zN8ul5ipSsiQ=;
 b=QdCmE7DCyioU6q7xhbmnrnOfXM4XVap5zKRAaqPjmxlMWkatoj7qBHRED9LF/cqw4r
 2F9YnLWLI+vQjxkzImfbGo4e0fwiWktIu+9N6IK0a01b6hIV6TJzTE6d5t/HWhyM3tbO
 GldzHBYTfwQQXy8oJvv3GAGRwCbl2LmIf1EoJZh5W4GWF/xEX4ELbWX2bryMNXdX+Pvf
 dOMKG22QOfUUNPTawAlx1xrI1s40oQQpvYoG1+Xcx4xyoX++Y9bmBzQWKLTeGB9hK3qx
 m2dV/+8mgaF4R+SpvEZXg2XGZZd5AeJmL+bT9bvW+pu+iX+HYMfwX8OUl3YaXO5DrwFp
 T2aA==
X-Gm-Message-State: AGi0PubaAbOkFVokltXb9Ows8Sj6mmcMJa6PboM4lpZMqh7KWgFeB7zq
 boBZKZ9nw2dYhToQRzJqYUTh5R7nONcY9+XL5OE=
X-Received: by 2002:a5e:9b13:: with SMTP id j19mr16937896iok.86.1586794162572; 
 Mon, 13 Apr 2020 09:09:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200326230838.31112-1-richard.henderson@linaro.org>
 <20200326230838.31112-12-richard.henderson@linaro.org>
In-Reply-To: <20200326230838.31112-12-richard.henderson@linaro.org>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Mon, 13 Apr 2020 18:09:18 +0200
Message-ID: <CABoDooNLXi7TOJ7nBDiyMAZi4BvC6nyD-oD5FWgXY2t4bxtkfQ@mail.gmail.com>
Subject: Re: [PATCH 11/31] target/arm: Implement SVE2 integer add/subtract long
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d43
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
Cc: rajav@quicinc.com, qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, apazos@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fuQAo9dqjH9I

On Fri, Mar 27, 2020 at 12:09 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
[...]
> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
> index bee00eaa44..7d7a59f620 100644
> --- a/target/arm/sve_helper.c
> +++ b/target/arm/sve_helper.c
> @@ -1088,6 +1088,49 @@ DO_ZZW(sve_lsl_zzw_s, uint32_t, uint64_t, H1_4, DO_LSL)
>  #undef DO_ZPZ
>  #undef DO_ZPZ_D
>
> +/*
> + * Three-operand expander, unpredicated, in which the two inputs are
> + * selected from the top or bottom half of the wide column.
> + */
> +#define DO_ZZZ_TB(NAME, TYPE, TYPEN, OP) \
> +void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc) \
> +{                                                              \
> +    intptr_t i, opr_sz = simd_oprsz(desc);                     \
> +    int sel1 = (simd_data(desc) & 1) * sizeof(TYPE);           \
> +    int sel2 = (simd_data(desc) & 2) * (sizeof(TYPE) / 2);     \
> +    for (i = 0; i < opr_sz; i += sizeof(TYPE)) {               \
> +        TYPE nn = (TYPEN)(*(TYPE *)(vn + i) >> sel1);          \
> +        TYPE mm = (TYPEN)(*(TYPE *)(vm + i) >> sel2);          \
> +        *(TYPE *)(vd + i) = OP(nn, mm);                        \
> +    }                                                          \
> +}

For sel1/sel2 the multiplicand should be the number of bits in TYPEN.

Laurent
