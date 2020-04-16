Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1369911lfm;
        Wed, 15 Apr 2020 21:43:08 -0700 (PDT)
X-Google-Smtp-Source: APiQypJwIRjfBZXNBADLSKeyMt2V1gdn1340XU/5UzzcN6T0cSFWQBpIb9sLtd30nxebYwJXHe4h
X-Received: by 2002:ac8:1cf:: with SMTP id b15mr19327453qtg.389.1587012188257;
        Wed, 15 Apr 2020 21:43:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587012188; cv=none;
        d=google.com; s=arc-20160816;
        b=Sr+l0Ju8j468dYRHKHOo1um2IAn38zZjO3RjafO/dp4/wtCIds/FyCD99Ze01pAgYg
         L2LTK41bOK2PEjSwCs8yyhnjx+fX7cXKG7Wa7IU/KQBpNRZGhateBXYP0wVBQVuEcLJB
         KuPtsgbh771YPfDYUVdcvi7+6NRQeloAw2Uc8iWouT0zSlCHKPws3OcwQSgDMOY02mz1
         gTMdBRiEV5Wvb9kuLXaXMFvZIscKO98vCEzs3reSaGQjGc+bP4NXSRDnoM9a4qKh8h/D
         JDl/cx8GbMJ/zF1juRtz0jpp0N+cbdUSklp3xbdZCz0/PsDNa+Jx1RY2IKLnVmnedkB3
         8uhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=jFVN1Wp427ZYbguIcMyVTf/NpzQB6iKlqCd1bbX5ME4=;
        b=PncX+cKn5B+ZsqzcfuirYLIw7UIZqo8QFcvQfVQ52ScuFMxjXB5whP91GHEDXAbfAw
         xRwTcHoH3Hw6i8FicVb4T6FQwE6a8VRlCii0P0xB+89T6mDYHGMie4z1uckeQG76xs7I
         ypqxu6JCJUPBacVf0kpZguR0rZQ6RujmH9lzavZMjvx1Mq2pT3psZsCiNj6VfWV3rwhm
         PDACtNP3qPf+fpubRmHrupZk/bG1Z1zHnzxRsnRv80Lig2axW3HYyaa7uu30tRcx//2y
         2tIomLCqHt0h671pFifT75Y4/imvVV2bpidXvY4mbCmonmjuCnb3FFt7nrXQ9NKH/iEV
         HFiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BNasLt21;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p5si3921897qti.245.2020.04.15.21.43.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Apr 2020 21:43:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BNasLt21;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jOwMl-00065k-Nm
	for alex.bennee@linaro.org; Thu, 16 Apr 2020 00:43:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51632)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jOwMe-00065C-3L
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 00:43:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jOwMc-00053o-ME
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 00:42:59 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:53036)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jOwMc-00051y-Ey
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 00:42:58 -0400
Received: by mail-pj1-x1043.google.com with SMTP id ng8so834051pjb.2
 for <qemu-arm@nongnu.org>; Wed, 15 Apr 2020 21:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jFVN1Wp427ZYbguIcMyVTf/NpzQB6iKlqCd1bbX5ME4=;
 b=BNasLt21KAenDohSuccIEC3baLcROeUsFB8N+K5aguK4GIR/wmqnfNTdWHFAHmkXd9
 s4Sn5zkDQ9JwSpGuU37fvdUslnqELX08WQHX+ynw1c0XjC/IwiccEwa/FcCmsGR7Bb1F
 4fAhaQjsU3+mATMdB4cvSCH02h4YhgfDbnvlKLZPLzichiiKv87l7pzFXA1itC5FAcpT
 zv758EfPCHS5h5lY+jUCtdYSAnhXx+xHfY/ipJtGyNH0D04f1Az01WoM4JhKmDtVnS5y
 gZ/nLPl/DjeL5tAMV1Q9qMCIISeVI6GC6nLXIgVV4KLrITcQQ6f9/0cweJ9fX68s+CwC
 e+hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jFVN1Wp427ZYbguIcMyVTf/NpzQB6iKlqCd1bbX5ME4=;
 b=VTm9JgqSOBF6+k33nfWcKRClq2b2hNy+zAp1eUhhh4DtNp84mNMFvTUFuxxzgBHxGz
 lB7tD3A+EkRZE0kDuX/Y45gut4tv9mJB2GO295rtCZSwpgI8JBatRuP0HCxIrlAMV52S
 ix89BW0WzueYeuK2+F2da5J/9FUgzdIAo0Wf2dZOKlJjKiFLylhF84l48yr2yeUNsCBI
 hB+wBFWRUvL8Q5fIx2WJ1XSXhe1/URicTyPqzcr7ciKa/3VsJyabZ0MoMqN5oK6YNvAh
 orVOlh+zqffU82UcDbaghzRwvdOsXRF6cG49cuO/qTuqUNfTZ7ez6v0R0x2dt4YGOjmA
 omvw==
X-Gm-Message-State: AGi0Pua8042ST8WpNQMymCYdNd096zok2I8AxkRF8ahDFIw2iuiUTAqo
 anDc3/HkO9ik2rtiqgyD7n3Y9w==
X-Received: by 2002:a17:902:820f:: with SMTP id
 x15mr8209449pln.180.1587012176584; 
 Wed, 15 Apr 2020 21:42:56 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id a138sm1865417pfd.32.2020.04.15.21.42.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Apr 2020 21:42:55 -0700 (PDT)
Subject: Re: [PATCH RFC v2] target/arm: Implement SVE2 HISTCNT, HISTSEG
To: Stephen Long <steplong@quicinc.com>, qemu-devel@nongnu.org
References: <20200415190708.16914-1-steplong@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9390d7ed-b4ff-e284-0114-ba70ed16ff2c@linaro.org>
Date: Wed, 15 Apr 2020 21:42:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200415190708.16914-1-steplong@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1043
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
Cc: qemu-arm@nongnu.org, apazos@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 27FHzdUA/T+6

On 4/15/20 12:07 PM, Stephen Long wrote:
> +++ b/target/arm/sve.decode
> @@ -147,6 +147,7 @@
>                  &rprrr_esz rn=%reg_movprfx
>  @rdn_pg_rm_ra   ........ esz:2 . ra:5  ... pg:3 rm:5 rd:5 \
>                  &rprrr_esz rn=%reg_movprfx
> +@rd5_pg_rn_rm   ........ esz:2 . rm:5 ... pg:3 rn:5 rd:5       &rprr_esz

To retain the pattern this should drop the 5; there's no existing rd_pg_rn_rm
with which to conflict.


> +++ b/target/arm/sve_helper.c
> @@ -7016,3 +7016,68 @@ DO_PPZZ_MATCH(sve2_nmatch_ppzz_b, MO_8, true)
>  DO_PPZZ_MATCH(sve2_nmatch_ppzz_h, MO_16, true)
>  
>  #undef DO_PPZZ_MATCH
> +
> +#define DO_HISTCNT(NAME, TYPE, H)                                            \
> +void HELPER(NAME)(void *vd, void *vn, void *vm, void *vg, uint32_t desc)     \
> +{                                                                            \
> +    intptr_t i, j;                                                           \
> +    intptr_t opr_sz = simd_oprsz(desc) / 8;                                  \

Divide by sizeof(TYPE).

> +    TYPE *d = vd, *n = vn, *m = vm;                                          \
> +    uint8_t *pg = vg;                                                        \
> +    for (i = 0; i < opr_sz; ++i) {                                           \
> +        TYPE count = 0;                                                      \
> +        uint8_t pred = pg[H1(i)] >> ((i & 1) * 4);                           \

The indexing isn't correct.

You've got a mix of uint32_t and uint64_t here.
Indeed, it's probably simpler to not try to do both functions with a macro, but
just split them.

For uint64_t,

    uint8_t pred = pg[H1(i)];

for uint32_t,

    uint8_t pred = pg[H1(i >> 1)] >> ((i & 1) * 4);

or when i is in units of bytes instead of elements,

    uint8_t pred = pg[H1(i >> 3)] >> (i & 7);

> +        if (pred & 1) {                                                      \
> +            TYPE nn = n[H(i)];                                               \
> +            for (j = 0; j <= i; ++j) {                                       \
> +                uint8_t pred = pg[H1(j)] >> ((j & 1) * 4);                   \
> +                if (pred & 1 && nn == m[H(j)]) {                             \
> +                    ++count;                                                 \
> +                }                                                            \
> +            }                                                                \
> +        }                                                                    \
> +        d[H(i)] = count;                                                     \
> +    }                                                                        \
> +}
> +
> +DO_HISTCNT(sve2_histcnt_s, uint32_t, H1_2)

H4 for uint32_t when indexing by elements or H1_4 when indexing by bytes.

> +DO_HISTCNT(sve2_histcnt_d, uint64_t,     )
> +
> +#undef DO_HISTCNT
> +
> +static inline uint8_t get_count(uint8_t n, uint64_t m)
> +{
> +    int i;
> +    uint8_t count = 0;
> +
> +    for (i = 0; i < 64; i += 8) {
> +        if (n == extract64(m, i, 8)) {
> +            ++count;
> +        }
> +    }
> +    return count;
> +}

This can use the same logic as do_match2, except that you use ctpop64 at the
end to count the bits instead of turning into a boolean.

> +
> +void HELPER(sve2_histseg)(void *vd, void *vn, void *vm, uint32_t desc)
> +{
> +    intptr_t i, j;
> +    intptr_t opr_sz = simd_oprsz(desc);
> +    uint64_t *m = vm;
> +
> +    for (i = 0; i < opr_sz; i += 8) {
> +        uint64_t n = *(uint64_t *)(vn + i);
> +        uint64_t out = 0;
> +
> +        for (j = 0; j < 64; j += 8) {
> +            uint64_t m0 = *m;
> +            uint64_t m1 = *(m + 1);

The m values need to be loaded from the segment, just like MATCH.

> +
> +            uint8_t count = get_count(n >> j, m0) + get_count(n >> j, m1);
> +            out |= count << j;
> +
> +            m += 2;
You're adding 2 uint64_t per input byte, which is going to run well past the
end of the input vector.

> +static bool trans_HISTCNT(DisasContext *s, arg_rprr_esz *a)
> +{
> +    if (a->esz > 1) {
> +        return false;
> +    }

ESZ must be 2 or 3, not 0 or 1.  Note near the top:

    if size == '0x' then UNDEFINED;

thus only size == '1x' is valid, and thus size<0> does in fact select 2 vs 3
for S and D.

Missing the sve2 check.

> +    static gen_helper_gvec_4 * const fns[2] = {
> +        gen_helper_sve2_histcnt_s, gen_helper_sve2_histcnt_d
> +    };
> +    return do_zpzz_ool(s, a, fns[a->esz]);
> +}


r~
