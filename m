Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2359844lfm;
        Thu, 30 Apr 2020 13:56:29 -0700 (PDT)
X-Google-Smtp-Source: APiQypIpIvxE2yvUZvYO+4WXcHmNP/S1PvQ/do0D4QApVp0rpt0YI5pKWMQGn8A7et6gSpW5yotK
X-Received: by 2002:ac8:164e:: with SMTP id x14mr449404qtk.196.1588280189239;
        Thu, 30 Apr 2020 13:56:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588280189; cv=none;
        d=google.com; s=arc-20160816;
        b=igY69DZP48oiMVI+5BYoa3y0CEqLmuRY/ApPadqwUuYtCFLAu9+w5M/YWJkADBJyGO
         taE6Kn4IdCMfhCr6bAXeVnPj7Gmtmtz8tQ2+nR3eehad3V1hboDInzbW5LjeL++/2Tm3
         WBIo0+Atb9GnjBqQLB1u86TqnjA/6p0vfgPIRXnt4QxPTsY1MqjaIJp+dcVa7RJKaLTb
         NEnTS9nTNFqleV9q0k8+5ogXvVWCOhw+EzQqgRtubQOJtYhmT2mTnnjHNmyjcEBLeHwa
         AbCusVsQ0iLjsVSDCq1td8e1cmTDQd1Z1GKAuhfwylD1k6DkNEexKqMHkR++XgDXBVCb
         ze3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=r3pia5pLAp5t5+qZDXgrLBjQhTafThCii8XgzCKJyHg=;
        b=fR56hTXKQ3D9D1OJSLzXY2E07WDt+03HC2b9aDNK8zH/WSGiQ9jKgItcj1rTzN2rFK
         jUQcEpjyLAlbvs1ihzwNxIEYhh1u/QC2geQ0xxZeEHbwWjGfHv2NEkb5gvZ/sL5kb5lQ
         I704HmE4WLPdQ8Y52AM0O9OPQYobcU1zBFjnr5bx4KNUiCCU/kBBfWWPPzYqqLQ+x8lE
         lPtwPw0KO6nTfHuLXya/ykydKPSJXVsFZpF2fp5NKlcXqIKQKCpWI/MZDpCzm5G8UtPC
         +bFEzDFEKuHMOZRBtokxcpZIbGlT88+65Bf5W5DAZ8bImvjpOXHHzAX6gdhLDeWJKGMi
         XOCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JWDVh0PK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id o16si513020qtk.370.2020.04.30.13.56.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 13:56:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JWDVh0PK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUGEO-0002Mb-GO
	for alex.bennee@linaro.org; Thu, 30 Apr 2020 16:56:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46546)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUGCN-0008TN-Ul
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 16:54:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUGCK-0002GC-5N
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 16:54:23 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:38518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jUGCI-0002BL-40
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 16:54:19 -0400
Received: by mail-pf1-x441.google.com with SMTP id y25so481536pfn.5
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2020 13:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=r3pia5pLAp5t5+qZDXgrLBjQhTafThCii8XgzCKJyHg=;
 b=JWDVh0PKCi7WFxr/q50mOH/U14/09vFOWngA67p7f1kyUdYK+YH1/ncnxR8o60fmwJ
 4DIVurvRhyBNej8w+2WsVBtUfS81vD6x5PAZYuSHQDZSNQc9WbDvNHYdcQxEmEKrG6Oc
 hsXhMHnVUOCMcwsfm7yxJgcDuLQA8TK0X2Lg6rirtKvwsJDkWMgiBQ5pQyzAmFcRLkrw
 UiVMNZasOX1MxTW5a+UosyQyJGiKZ6rXA/dxpr6QU5YtgNes/P36A/+uZR8Lt/8rvbHU
 1Y1AZibxT4xYe4zfdm+GlK6qX+Y1+siZ8h8RhxqmGiHmdwNpD7+Ce6zDfTuzvt3dGu1M
 K0eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r3pia5pLAp5t5+qZDXgrLBjQhTafThCii8XgzCKJyHg=;
 b=TkKKyBdolT3amNqFa24Ue1qMd5lcyZeoY22ZUZVP7tuwXKKa8hwy0DxOpgOHQFLs4+
 AirjSeKBs/xHOjAJPL7M16zB01GBQReA6g7yyeI6Ds7QL1DRAAF1hB8lFwwJ9AV0ZADO
 6UjR2WPgx4fC3DoF3z2KjB232xxNkpXvJH+JyX0KUR3tszLBspHUfE0pGa91rBagB6y0
 KUhoIFPIlVf3crLoOWC/xGhcFiQ8qOjmDaKkuzq+J9uEQXWthAtiZs2WAMPcfDJilcfa
 e2KHj1u288AzcXmJH0xmyLb23YV2yyqW3Fcv5wodMBlAAo1+htVIiS1f1RqY4hrPCdwS
 C3oQ==
X-Gm-Message-State: AGi0PuZEoi3vCqH8FPsbbEh8w2urairwngwhpLQ+F5UXytgyO88CDaTI
 9Pb9ngKYyET8v5XHB2ZXXUQQgw==
X-Received: by 2002:aa7:96e8:: with SMTP id i8mr656812pfq.222.1588280054411;
 Thu, 30 Apr 2020 13:54:14 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id a129sm577660pfb.102.2020.04.30.13.54.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Apr 2020 13:54:13 -0700 (PDT)
Subject: Re: [PATCH 23/36] target/arm: Convert Neon 64-bit element 3-reg-same
 insns
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200430181003.21682-1-peter.maydell@linaro.org>
 <20200430181003.21682-24-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <366a2e79-d963-bfdc-fcc6-2a63026fa1db@linaro.org>
Date: Thu, 30 Apr 2020 13:54:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430181003.21682-24-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::441
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
X-TUID: Q9C0kgT1Qk8T

On 4/30/20 11:09 AM, Peter Maydell wrote:
> +
> +    rn = tcg_temp_new_i64();
> +    rm = tcg_temp_new_i64();
> +    rd = tcg_temp_new_i64();
> +
> +    for (pass = 0; pass < (a->q ? 2 : 1); pass++) {
> +        neon_load_reg64(rn, a->vn + pass);
> +        neon_load_reg64(rm, a->vm + pass);
> +        fn(rd, rm, rn);
> +        neon_store_reg64(rd, a->vd + pass);
> +    }
> +
> +    tcg_temp_free_i64(rn);
> +    tcg_temp_free_i64(rm);
> +    tcg_temp_free_i64(rd);
> +
> +    return true;
> +}
> +
> +#define DO_3SAME_64(INSN, FUNC)                                         \
> +    static bool trans_##INSN##_3s(DisasContext *s, arg_3same *a)        \
> +    {                                                                   \
> +        return do_3same_64(s, a, FUNC);                                 \
> +    }

You can morph this into the gvec interface like so:

#define DO_3SAME_64(INSN, FUNC) \
    static void gen_##INSN##_3s(unsigned vece, uint32_t rd_ofs,
                                uint32_t rn_ofs, uint32_t rm_ofs,
                                uint32_t oprsz, uint32_t maxsz)
    {
        static const GVecGen3 op = { .fni8 = FUNC };
        tcg_gen_gvec_3(rd_ofs, rn_ofs, rm_ofs,
                       oprsz, maxsz, &op);
    }
    DO_3SAME(INSN, gen_##INSN##_3s)

The .fni8 function tells gvec that we have a helper that processes the
operation in 8 byte chunks.  It will handle the pass loop for you.

There's also a .fni4 member, for those neon helpers that operate on 4-byte
quantities, fwiw.


r~
