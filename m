Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp5218068lfm;
        Tue, 14 Apr 2020 10:10:09 -0700 (PDT)
X-Google-Smtp-Source: APiQypIJ1z9KGmQEij061gZHvrOMRMNBom1BIy6Xd8gjIObhlyaRik31AaRPwBLMUEtLrwop2PA4
X-Received: by 2002:ac8:6903:: with SMTP id e3mr17102250qtr.109.1586884208868;
        Tue, 14 Apr 2020 10:10:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586884208; cv=none;
        d=google.com; s=arc-20160816;
        b=gZuQ2whV73BR/f/r+bUMU880UQ0GOR54TGELxl01DJnCiMsV6/werGlucNIH4gzV6Y
         5TMzX1QdlEjU4PabudH9O+ZsMJpNkucLZrSwL8UNuN2j4iZvkvegBt8uuNM3KTjQYcxi
         Hq/rKKsqRXZTtks5O4KL+S4+NQpG2+7SOTwOtAsc+/7IBcDdZrNRQ6Pyy7R5VY9VwYKR
         Jfx3jSIWDUhL52Fwk70HBN29IbWcAq5qipZrM8JU3A0EgDl0eCAIHA+fvA4vZy/x9BPf
         oQ6RIsUzAM/j7NVUeNquDRXjSI67FGb5fqZkjaBNQIEsCMgIYiVs78Qxd7eY2njfBcRU
         uGcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=6zBODJds4+fSTJpYuEtmzFzjzEaKbjVXEFHVqO+Gaqo=;
        b=tHwJMQM6QrRYq0Qj1J8KREOzyrlUDE9eRtaNM1VYd9/XoM+5GtsuYgB0VbluI8/fJI
         rK7Ky7KBs7WtQZcya34f/8gpOWRpcjCzlmwJmtSKWO7HEcdX/j0BbKHaikHg77Zq/I4x
         A5ZUvvVlSk/RmY9iOp7avNRO4MPhNabflp7gTdrd3RqSkemFeItPfSCIKTQWQ5UGETFT
         B91GnlbU86nfZpUpkdgfBPSq8LcG2g16WFDmDI8m52/fScf+j30ABmN2T9osR+FDOPvZ
         ah/EFMw1qWiWwZut9fM/Kk2cBtht448smQUQk9pBSYdPjhRXVpdRE9gwKrTNQd4QUuvw
         0oNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HlGtoP8h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q18si8391575qtn.163.2020.04.14.10.10.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Apr 2020 10:10:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HlGtoP8h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jOP4Z-0004m5-36
	for alex.bennee@linaro.org; Tue, 14 Apr 2020 13:10:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41353)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jOOzV-0003qX-Mh
 for qemu-arm@nongnu.org; Tue, 14 Apr 2020 13:04:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jOOzU-0005HB-AC
 for qemu-arm@nongnu.org; Tue, 14 Apr 2020 13:04:53 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:34377)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jOMql-00047W-UG
 for qemu-arm@nongnu.org; Tue, 14 Apr 2020 10:47:44 -0400
Received: by mail-pg1-x542.google.com with SMTP id i3so2077532pgk.1
 for <qemu-arm@nongnu.org>; Tue, 14 Apr 2020 07:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6zBODJds4+fSTJpYuEtmzFzjzEaKbjVXEFHVqO+Gaqo=;
 b=HlGtoP8hEKRc1QZED6Q1w6frytsbMTjixH+IopFibt8RgaC1filGd/sKRKAJcZEq1D
 QKmGMitNsZdKOVQuh6pbp6bwGJsk2uRbMqj3+k6tNWR4orp06j91jH+lp8voFltpFZ6e
 6WAQc86PX+L9bqBq9ZZ/DNSP/lQXwvrwPnvNv9/gfca4YDpkVQwLH77HV4GI/J4irgcX
 IhMd9F8CNwwSvimZtUaqq5s7pUOkTeYnsZuD477WAViKyTHWOB3Gl7nOxE83GvbutVqq
 fXVU5AVIq4edWDIYjY0BNmWzEZ5MozOU478ERX23ecAmyAkknPkxpOlcf3cfauMmiGRp
 Q/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6zBODJds4+fSTJpYuEtmzFzjzEaKbjVXEFHVqO+Gaqo=;
 b=HAWgrwYBWBiVIea+i9CQeoUxbbpd1pkrf6bWIOpJWE435jlwI+KsSfPnhxgThYMEvL
 1g2+58zh2DaHD6lCFx+VuQzVUj5/nbcBAbihFRPejT2vjINaN+jNfu6eYISwbEMnzkRy
 STiM28kk/YaIIsK3qrBbOD+mn+PV5NHXx2xvDLqT4VwKIbebBiYNk1SO8e5+MKX/+HjB
 dHLwv8uBST2DnD7pw6SfMhNXLugh+Izk9/pH8K6VxT6Qr5J2QAJF9DCEdwuUDhXNvTV6
 NIOasAElr9peaJ4xNYGgq7KFLCAmy1n1m72qn/tpOrMKsHBxXKT/x3GVS/m7anmgPBJf
 fcRQ==
X-Gm-Message-State: AGi0PuYzZTQ7YmW5h/w9K8XAilUzFd8S3i+rEJZlBNPnRC9VCLnjCr4w
 rP8fAdvUmLHrDa0vw88kOljgaQ==
X-Received: by 2002:a62:e414:: with SMTP id r20mr22767777pfh.96.1586875662596; 
 Tue, 14 Apr 2020 07:47:42 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id r28sm5007678pfg.186.2020.04.14.07.47.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Apr 2020 07:47:41 -0700 (PDT)
Subject: Re: [PATCH RFC] target/arm: Implement SVE2 MATCH, NMATCH
To: Stephen Long <steplong@quicinc.com>, qemu-devel@nongnu.org
References: <20200413234224.12005-1-steplong@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <895cd38f-f957-5328-6b61-c6f2b0d02788@linaro.org>
Date: Tue, 14 Apr 2020 07:47:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200413234224.12005-1-steplong@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
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
Cc: apazos@quicinc.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xr5OOhhzzMhU

On 4/13/20 4:42 PM, Stephen Long wrote:
> +#define DO_ZPZZ_CHAR_MATCH(NAME, TYPE, H, EQUALS)                            \
> +void HELPER(NAME)(void *vd, void *vn, void *vm, void *vg, uint32_t desc)     \
> +{                                                                            \
> +    intptr_t i, opr_sz = simd_oprsz(desc);                                   \
> +    for (i = 0; i < opr_sz; i += sizeof(TYPE)) {                             \
> +        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));                      \
> +        uint16_t *pd = (uint16_t *)(vd + H1_2(i >> 3));                      \
> +        *pd = (*pd & ~1) | ((0 & EQUALS) | (1 & !EQUALS));                   \
> +        if (pg & 1) {                                                        \

The important error here is that the predicate is not always the low bit.  When
operating on bytes, every bit of the predicate is significant.  When operating
on halfwords, every even bit of the predicate is significant.  In addition,
when operating on halfwords, every odd bit of the result predicate must be zero.

Which is why, generally, I have constructed the output predicate as we go.
See, for instance, DO_CMP_PPZZ.

> +            TYPE nn = *(TYPE *)(vn + H(i));                                  \
> +            for (intptr_t j = 0; j < 16; j += sizeof(TYPE)) {                \
> +                TYPE mm = *(TYPE *)(vm + H(i * 16 + j));                     \

mm needs to start at the beginning of the segment, which in this case is (i &
-16).  You don't need the elements of mm in any particular order (all of them
are significant), so you can drop the use of H() here.

Therefore the indexing for mm should be vm + (i & -16) + j.

> +                bool eq = nn == mm;                                          \
> +                if ((eq && EQUALS) || (!eq && !EQUALS)) {                    \
> +                    *pd = (*pd & ~1) | ((1 & EQUALS) | (0 & !EQUALS));       \
> +                }                                                            \

It might be handy to split out the inner loop to a helper function, as, while
the basic loop is ok, there are tricks that can improve it, so that we're
comparing 8 bytes at a time.


> +static bool do_sve2_zpzz_char_match(DisasContext *s, arg_rprr_esz *a,
> +                                    gen_helper_gvec_4 *fn)
> +{
> +    if (!dc_isar_feature(aa64_sve2, s)) {
> +        return false;
> +    }
> +    if (fn == NULL) {
> +        return false;
> +    }
> +    if (sve_access_check(s)) {
> +        unsigned vsz = vec_full_reg_size(s);
> +        unsigned psz = pred_full_reg_size(s);
> +        int dofs = pred_full_reg_offset(s, a->rd);
> +        int nofs = vec_full_reg_offset(s, a->rn);
> +        int mofs = vec_full_reg_offset(s, a->rm);
> +        int gofs = pred_full_reg_offset(s, a->pg);
> +
> +        /* Save a copy if the destination overwrites the guarding predicate */
> +        int tofs = gofs;
> +        if (a->rd == a->pg) {
> +            tofs = offsetof(CPUARMState, vfp.preg_tmp);
> +            tcg_gen_gvec_mov(0, tofs, gofs, psz, psz);
> +        }
> +
> +        tcg_gen_gvec_4_ool(dofs, nofs, mofs, gofs, vsz, vsz, 0, fn);
> +        do_predtest(s, dofs, tofs, psz / 8);

You can avoid the copy and the predtest by using the iter_predtest_* functions
and returning the flags result directly from the helper.  Again, see DO_CMP_PPZZ.


r~
