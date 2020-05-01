Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp113187lfm;
        Thu, 30 Apr 2020 18:55:51 -0700 (PDT)
X-Google-Smtp-Source: APiQypKP6s4sftbyrYLV0wtSPhXPf5iOx/MN3c8g1F8PfV/dNLRU5faLd4+eMJ6wNWDVQjDkDtxk
X-Received: by 2002:a37:546:: with SMTP id 67mr1411119qkf.487.1588298151084;
        Thu, 30 Apr 2020 18:55:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588298151; cv=none;
        d=google.com; s=arc-20160816;
        b=mYAEd2kyWkYMD9pi6PpmQtP9krxhlcXRyRrh3h0ohVgv68nAPwntVov384WwNVR4Io
         5OprJjSUvsKe16AhyCaLbh4INV5sYx84GrBwW+q1dXPq7c66aR+U2bHd80xiA1Pohm9V
         ApwJ0Ly9tdQ4vh7aDD+oxB3hl4BNfHrTTjIq+RSgmJ5Df5jDEyCspTbigdSO3d4dF+3V
         bmlKeXoRXJ/E+ww2SU7trn5Vr1y4n97aYTClGEohCJ6vy6hUuwZJCq4kdIPMz1PyCBv8
         HVZES4k3rvkOJufxYJtjeK5OJOvYcK6fGf75DelZT3yMfly03aoTy4MntTVS8mgFfvuv
         omUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=g2I1azfbI5WiGRBzpvn83X0zELe2rRj3Vky+Ncm+dUI=;
        b=yxSju2BnmgXU+/6PlDoeQuOZbUInhdaPJxRxPNTo48OsYYcq2ve2EOTVJvPOsalgxU
         yzK/7Sq44tOIv3IYWv1lDIxsra/Uc8E83znjEqqBR1A3EXCaNDvBK8aMg1g8AbCu6AWA
         2tP8MGTp6guEuW4ApFFwjaXo1d7zbybLWlhib/j4Mvy6yVPQL7/iFa3iXLUE/V/h9U3W
         QmyrzkJS3R49J693ms+3r0vbTUQSBgewvwcH9brV2xcqeavA/KPJFSVX79AESAYj1nDf
         Q6fLdM1tt1c5Lc3qNOXLARZS3G2F92o5xAPABmg+3Hryg1o0D0fp35hTabdSp0KtYhOq
         xDJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="cUBJ/Jxn";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id v6si1001270qvr.145.2020.04.30.18.55.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 18:55:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="cUBJ/Jxn";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUKu6-0006Lb-G6
	for alex.bennee@linaro.org; Thu, 30 Apr 2020 21:55:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57172)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUKtx-0006Jn-9k
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 21:55:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUKtv-0003fW-QB
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 21:55:40 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:34006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jUKtu-0003TO-R5
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 21:55:39 -0400
Received: by mail-pj1-x1043.google.com with SMTP id h12so4223888pjz.1
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2020 18:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=g2I1azfbI5WiGRBzpvn83X0zELe2rRj3Vky+Ncm+dUI=;
 b=cUBJ/Jxng6lhC+IC//eI2KMQD8zeM6Z650Dhsg015mAAQH3XnQUc3WjsTBgOKPCfzv
 ujV3qgqOxXWIclZTeO0XVxutnz4kBTkeSKGo4PpDKinDg7hf/D/GHM0QLSfh/kHRAuOQ
 f58/eOQ5jmdQl695+8+8H4HvUMMy5+nA3WMfZ9tQ+SZW3ABQbJyn4TmdDCPKMMBkfLdB
 0OBfySFHf+FTI7uScVkCwxDKFcjI8keWYVxCM8+Kurm3Hx7cE7y7VSKBZomcyiZjiJB+
 aAvdNoREzi2zkWPk8OWDltbj5pD5bxCCjvsDv9lopiLt9xrtxEEc6eDTPFShUG0nsaXr
 4sIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=g2I1azfbI5WiGRBzpvn83X0zELe2rRj3Vky+Ncm+dUI=;
 b=BI6yT66BEEwYZ76NeBTvdjwVGSgDXe1g7IVjG0DW53cipNYmlWj5W0lzHBuCMXRxKX
 QaTtv2EgzhauGfqBEEn3GIz4bcXPM6qNRR96/uaValogFConM+H5OepGYem6UZiB2t4n
 QdZn5a/gr0/40hw7kvoxp0IJ6BrGjsUe8b+LU6cw8Re/sMKq2FwWRuMp96CFbhsQcYd4
 HpK2i1ULJWX0R6T2IY4xiOvcSo8ouMQ2A59aj0L28WSbqESjJ4cV4jgAU+UM3ATTZ175
 N3qSbooO/m5ulXELkOLh0n2nKbZhTku3E5IYpx9EsXAKX8gkGJ9SxWh8SXcCmB5Y5dce
 MbIQ==
X-Gm-Message-State: AGi0PuaiuyMwtOG47l8UW3SNzH2RG2aELL8UCRIcTVeyDlT8zUAYpW3T
 n6wLGyuC6Gnzs1wBrRlwsLlLwA==
X-Received: by 2002:a17:90b:3444:: with SMTP id
 lj4mr1905259pjb.37.1588298136677; 
 Thu, 30 Apr 2020 18:55:36 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id w125sm814368pgw.22.2020.04.30.18.55.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Apr 2020 18:55:36 -0700 (PDT)
Subject: Re: [PATCH 26/36] target/arm: Convert Neon VQSHL, VRSHL, VQRSHL
 3-reg-same insns to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200430181003.21682-1-peter.maydell@linaro.org>
 <20200430181003.21682-27-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b1d8a9ec-a1ef-47af-f07f-3761a51945f1@linaro.org>
Date: Thu, 30 Apr 2020 18:55:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430181003.21682-27-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gQIBzyS30j5r

On 4/30/20 11:09 AM, Peter Maydell wrote:
> +static bool do_3same_qs32(DisasContext *s, arg_3same *a, NeonGenTwoOpEnvFn *fn)
> +{
> +    /*
> +     * Saturating shift operations handled elementwise 32 bits at a
> +     * time which need to pass cpu_env to the helper and where the rn
> +     * and rm operands are reversed from the usual do_3same() order.
> +     */

Perhaps better to handle this as you did in "Convert Neon 64-bit element
3-reg-same insns", by adding a shim expander that adds env?

It would appear we can then merge

> +{
> +  VQSHL_S64_3s   1111 001 0 0 . .. .... .... 0100 . . . 1 .... @3same_64
> +  VQSHL_S_3s     1111 001 0 0 . .. .... .... 0100 . . . 1 .... @3same
> +}

back into a single pattern:

void gen_gvec_srshl(unsigned vece, uint32_t rd_ofs,
                    uint32_t rn_ofs, uint32_t rm_ofs,
                    uint32_t oprsz, uint32_t maxsz)
{
    static const GVecGen3 ops[4] = {
        { .fni4 = gen_helper_neon_rshl_s8 },
        { .fni4 = gen_helper_neon_rshl_s16 },
        { .fni4 = gen_helper_neon_rshl_s32 },
        { .fni8 = gen_helper_neon_rshl_s64 }
    };
    tcg_gen_gvec_3(rd_ofs, rn_ofs, rm_ofs,
                   oprsz, maxsz, &ops[vece]);
}

I'm not 100% sure how best to handle the swapped operands issue.  I don't think
we want to do it here in gen_gvec_srshl, because we don't have the same reverse
operand problem in the aarch64 encoding, and I'm looking forward to re-using
this generator function in aa64 and sve2.

Maybe it would be better to have

@3same     .... ... . . . size:2 .... .... .... . q:1 . . .... \
           &3same vm=%vm_dp vn=%vn_dp vd=%vd_dp
@3same_rev .... ... . . . size:2 .... .... .... . q:1 . . .... \
           &3same vn=%vm_dp vm=%vn_dp vd=%vd_dp

and swap the operands to "normal" during decode.

FWIW, over in sve.decode, I prepared for reversed operands from the start (to
handle things like SUBR), so the formats have the register names in order:
@rd_rn_rm vs @rd_rm_rn.


r~
