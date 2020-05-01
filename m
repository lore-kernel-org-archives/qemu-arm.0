Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp201513lfm;
        Thu, 30 Apr 2020 20:57:39 -0700 (PDT)
X-Google-Smtp-Source: APiQypIXgKtm6hNR7naXaHwfo+gFzEy3iFSJP74LJGM0qxrx2Oh8jOhleWUyhxKiEeZQ6ElGCa6T
X-Received: by 2002:a37:78c1:: with SMTP id t184mr1717143qkc.213.1588305458922;
        Thu, 30 Apr 2020 20:57:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588305458; cv=none;
        d=google.com; s=arc-20160816;
        b=0v9tivCC8iANlspRq2OSEcfgGyHECLtmNUaNL0j/7b/qACQq6THCpUNV0GzMyf02F/
         nwDSp8m0XBJTxI9ft1b+oWj1l40FUoixK1vc/gVJRJ87ddOVUa2L68dDf2T1daZr4TEq
         IUJbGodHlsgP21SFwnU6mcxAYjZ09oJX8Tf4TA13Sl+nc0T6Lv+AIMQ1tNgyWl3OXJyS
         rzXQkJKumGGhlnA69R5D203CCfjZ9jkubQAtJ28cgMt+zp3XBr2jWxPj3p1aeZO/KRak
         qiZ9wtmCqMsPcCXlZdNcpgs1ulPhOqaUIEbSvzEqXZku+AUnovGwygX6qtYk/kSDhTKg
         DhBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=lONhPFJce+pXiX1zaQi741ujfZSuxX6lJAZkIMjg54g=;
        b=WLEASzAMynEZed6rKN15T26UpY/51pDbvhJyQwF4ZPxjzpzegx5bx5toqsC+A1B/hw
         qkK6Iw6GApAC1ZKTV2XYpLzObHt2i6mClbpFRD2pV19zfHztPLlMP+/bnygfjAACFO9M
         i1E4oC5KPRNnLYC9Cflj0vNB2hdQOm3+2rJN5Z3Bl07u8c03UvZyJJKm40l1EjclKMmW
         dQHJA34Pj71az1/XjmRmwuEA3pCJCG2COG9G+2QUJK1qrWKucbJpOG7SToirxZAT31s/
         lG6eHRev/dEEU4Xs5YfxIK4/SDrg5wkfzWqBk5wPh7CIN8i6UWCVKGz70h8xgAdMR/nL
         1y8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jvE14luE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id i1si1065261qvs.28.2020.04.30.20.57.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 20:57:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jvE14luE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUMny-0006Sp-An
	for alex.bennee@linaro.org; Thu, 30 Apr 2020 23:57:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36336)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUMnq-0006SV-MZ
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 23:57:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUMnq-0000dU-1F
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 23:57:30 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:55956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jUMnp-0000bD-Fl
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 23:57:29 -0400
Received: by mail-pj1-x1044.google.com with SMTP id a32so1866846pje.5
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2020 20:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=lONhPFJce+pXiX1zaQi741ujfZSuxX6lJAZkIMjg54g=;
 b=jvE14luE05q4l2cqgXhQMxY/+WJlfilh6Q+/nFWt6hmyGpCjVSFXAW4NT3R4dr3hMZ
 HAVRZ+RNPHtK8GSrCP61EY9Ftk/BsoCyt+b/dtrmEXX4GI48dKYT2jbtmP5QMBdHthLm
 lrpG3CHjyo9ZfX8236Y/PkP/e2Txt3EpwAZRIFwdQ16nScpAFVP5CzPebhkFj45qq7bi
 fDaW2vlQWKoTE1V4qp12DqItAuSAEH/MJnnFaQ4yPkAtjpJSmo4VZkm3BeI9EEv7Gqnp
 1VKc6vhXt47en3R33SicMSEWpqZA3KiK/HJhfKw2yvxraEYU9yCQ49TOSwRbxQLtEkgQ
 Z9nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lONhPFJce+pXiX1zaQi741ujfZSuxX6lJAZkIMjg54g=;
 b=mC7g5p7IYoJhoqi86VGOYPzCwmdNC/HVjdTQ/j8zmbuvZQqeOz23fH6weus0+uYsRZ
 ZZYL4ivvuycPC+NYTkAYqvMIW95y1I7BskB8+4m1BPz+O4JeTEDphrwiuh5ELjBzK9W4
 s7Aoh9pOqW4k+xFLAameQNmRViGbFdjjuoDrtBX7hQQUgNcwNPvqVh+fPtIbdGCks1zF
 DXarSiBFZ93lWU6C3mxixIqQr7wd3tBblWosOTOFSVCRrRq25GYPPzdag0i0LogPjKA5
 sklEkkvPmX6P6vyqm0uup6pV2XB13kmX+LF+hqSHG/nb2ErPDTB4yMB+idZPj/tRjrST
 okgw==
X-Gm-Message-State: AGi0PuYXsDxoj0R2EIDqZ+lLzht342zcp4pTUEuayBeX07uYxkXn5T/M
 CVIG9wuyr1aHE8v5NuapwybHlQ==
X-Received: by 2002:a17:90a:f197:: with SMTP id
 bv23mr2351321pjb.3.1588305447620; 
 Thu, 30 Apr 2020 20:57:27 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id d124sm1025045pfa.98.2020.04.30.20.57.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Apr 2020 20:57:27 -0700 (PDT)
Subject: Re: [PATCH 31/36] target/arm: Convert Neon VADD, VSUB, VABD
 3-reg-same insns to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200430181003.21682-1-peter.maydell@linaro.org>
 <20200430181003.21682-32-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <434ccdb4-1037-be3d-1477-b9bf1bf2f804@linaro.org>
Date: Thu, 30 Apr 2020 20:57:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430181003.21682-32-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::1044
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
X-TUID: nuEn9DTRRs5E

On 4/30/20 11:09 AM, Peter Maydell wrote:
> +    TCGv_ptr fpstatus = get_fpstatus_ptr(1);
> +    for (pass = 0; pass < (a->q ? 4 : 2); pass++) {
> +        tmp = neon_load_reg(a->vn, pass);
> +        tmp2 = neon_load_reg(a->vm, pass);
> +        fn(tmp, tmp, tmp2, fpstatus);
> +        tcg_temp_free_i32(tmp2);
> +        neon_store_reg(a->vd, pass, tmp);
> +    }
> +    tcg_temp_free_ptr(fpstatus);
> +    return true;
> +}
> +
> +/*
> + * For all the functions using this macro, size == 1 means fp16,
> + * which is an architecture extension we don't implement yet.
> + */
> +#define DO_3S_FP(INSN,FUNC)                                         \
> +    static bool trans_##INSN##_fp_3s(DisasContext *s, arg_3same *a) \
> +    {                                                               \
> +        if (a->size != 0) {                                         \
> +            /* TODO fp16 support */                                 \
> +            return false;                                           \
> +        }                                                           \
> +        return do_3same_fp(s, a, FUNC);                             \
> +    }

We already have helper_gvec_fadd_s and helper_fsub_s to handle the whole vector
with one call.  Use with tcg_gen_gvec_3_ptr, with the status pointer as the 4th
argument.

Interestingly, I can't find the current use of this helper.  I must have been
starting on that translation but got stopped?  There's no current full-vector
helper for abd_f32, but it would take very few lines to add it.


r~
