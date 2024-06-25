Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp661033njc;
        Tue, 25 Jun 2024 05:41:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWv4chn5N96TaOAcROGhd1t2EyySW+lp9abUS5DzlNSTAsh8GWr9ZntpaHCGCbua70TVnaD23nGwbY99o27kaC6drg2RZ5V
X-Google-Smtp-Source: AGHT+IHhdsx3a1IXJBAi6SeFtAOPU6FFr4H8zWo9zmGmzvyAa9W9kvmRtQJYiuSu72k4/OKW0vOU
X-Received: by 2002:a05:6808:10d5:b0:3d5:1eba:10c2 with SMTP id 5614622812f47-3d545964353mr7050903b6e.14.1719319311030;
        Tue, 25 Jun 2024 05:41:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719319310; cv=none;
        d=google.com; s=arc-20160816;
        b=iCHVH5x2n2Q2ksPd6XFAN/FAGLoQnqrSu3US/TNHKJdRxbZdgQkaAKaDClX+FlURFv
         uZ/Etvwa8JN+a9Uu16e5aa/uzlZG9AoEpaGLj7DjLJxaBGlXWE4B7PVewI4nFSfp2DhB
         OGjTubmHWNr5M3GQId3WAsz2aLOkOU9ZFt3jNf2Boec/+CcBS1qEPZ1DgUKRX7pV0kOq
         oL2t+6E4J4ewfHSUmm0JMf5No/TEaeO5QdoqHyaQKXHj5za8L3IbFBr0aC1pUBKWhYux
         TLZKCQE3/A9VKTg1ggJU69PFG+dGErfoBOa7mrUwZaCNaSR0dI/Be7Ey897mYuTVuQMZ
         A5ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=an578M1o0anMqg3zDMMjG/0T37Slq+ZkcPhwGoD8HFE=;
        fh=e5rKffNbozilmZkNmvBASXMNskuh0wFXfed6RRsACJk=;
        b=BCwVSvlf1+tPjIcw/3V966qboJwNNDYT2iiggyN7iGjmJs84CWQuuJEVCHtjal0k3+
         G7uJhGZKXjRWBzewTnwL9Qh0L+MiJxMUb2nhhxBlcYE+tGrIW+3jiS/6uvWxyvxJ6iQ5
         TBVvVyJ/zf8CTpHM7M9oKKk7tdn5wVdgB8c+uiDejqpTkBdgPwD8WIJ4Yj/oKDNCUUax
         wx7XkyuFcr7/6xnxhP7B5NkdoJi6TYT0zsZKaZnOHT9V162d1akis8/UXld9q6MFY+A1
         J76ciC5fctU7tK72r7WWU8Mt2sX+WYTT+L/PzIKhbf2Lc/mvK5cKEiyKGj1R0JzWVGpu
         nJiw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WUN6sEif;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79bce942d75si1059634585a.641.2024.06.25.05.41.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2024 05:41:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WUN6sEif;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sM5UV-0005i0-Jc; Tue, 25 Jun 2024 08:41:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sM5UU-0005hP-CP
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 08:41:42 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sM5US-0002eT-Nf
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 08:41:42 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a724958f118so322896566b.0
 for <qemu-arm@nongnu.org>; Tue, 25 Jun 2024 05:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719319299; x=1719924099; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=an578M1o0anMqg3zDMMjG/0T37Slq+ZkcPhwGoD8HFE=;
 b=WUN6sEifSJrdHGAYRKxunO/5AkTFeP0NHWFy58gMwfnUioFV3BEAbmRN9Q3BlbE8Ba
 BI+ZHFg+J1YLL/Yx/HZJsJvCgRVbPpv9TWaMF7Xy5w6vn1V3tcbvjCjmrrm1Zhdyb0Bf
 iaKs4684Qiif7e9/5Y6NX+NTMh+GZnzg2hFACRI6gt81kfpSbYNgAe5v6NGs8iyFCyY6
 D4nl1l/YJIBBGC2cPguxd1P9km1JUA4RR0S4Ocg0geaoxdQhD3zv55ibBm3fWc64LcBl
 2W8HfwvcHcbFHbMbfu5M+qM6fjJe+xLdPl8J0MJ90cUE0743Q5IPtUPFAloscH4eHn15
 XLaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719319299; x=1719924099;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=an578M1o0anMqg3zDMMjG/0T37Slq+ZkcPhwGoD8HFE=;
 b=kj8Z0ur/iYoByUXSK1lQBXXFnUbW7OcT5w1T0O9JXROjLpim1yBNPGrrRPvC9mu0DN
 fKkaG2sikIvZAUIbXVSgwa6ngoSco5R4zvw7LpjKH6CG3/wm8RphPBz8iDQeJ1JYjL9i
 Jab22LekmX2FbBSC7YKnvcsurDQ+xHgo9meQwAGdzxDf2/4VDBOQe8CzjvDM0HONh3UT
 7fQDQib+JSYxSnbSWtT79k6B2LOr+oB6HTrQzj7jnOlEdbjpAVGmJwGstLQs5fvf5r30
 hHVsPofUdrPc1tHyNIG5UUEragPxWTinDMGlUYw315Omb+qyBpFP8eloOY+hQjJvOo3O
 Syew==
X-Forwarded-Encrypted: i=1;
 AJvYcCWe5JYCuyLERXhN6RbzdIyij7GQqENDEgbCzrbHY1NmQFCK6R715Ga0daY8VTBD6sg+FtnBzY1N6oYd8Z7N0/auHIBD
X-Gm-Message-State: AOJu0YyhN0vj104x2T+m5bpffsAqWq/jOzbkq/YelW6ccfkx8ruGx8d+
 WHdpdVw4MuCgPynIn7cs7nMG/zAY31pYZl8NfTckP3PDfgQR5d+M3U+2sCmCzOCZgLWR7uCfZpb
 Tx52BFroG4VqjzAoi2Gz9/reISVmEl5n/fFaogFBtl85dex2j
X-Received: by 2002:a17:907:100a:b0:a6f:77bb:1719 with SMTP id
 a640c23a62f3a-a7242cdb14dmr509963366b.47.1719319299141; Tue, 25 Jun 2024
 05:41:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240625050810.1475643-1-richard.henderson@linaro.org>
 <20240625050810.1475643-14-richard.henderson@linaro.org>
In-Reply-To: <20240625050810.1475643-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Jun 2024 13:41:27 +0100
Message-ID: <CAFEAcA9aij1SbdEQkR9=UhJO2uz1u90881FwC8KHLYuLFto5AQ@mail.gmail.com>
Subject: Re: [PATCH 13/13] target/arm: Delete dead code from disas_simd_indexed
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
X-TUID: Npi9Rhadihd9

On Tue, 25 Jun 2024 at 06:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The last insns in this block, MLA and MLS, were converted
> with f80701cb44d, and this code should have been removed then.

"MLA, MLS, SQDMULH, SQRDMULH, were converted with f80701cb44d
and f80701cb44d33", I think, since there's still code for
all four of those insns that we're deleting here ?


> -            switch (16 * u + opcode) {
> -            case 0x10: /* MLA */
> -            case 0x14: /* MLS */
> -            {
> -                static NeonGenTwoOpFn * const fns[2][2] = {
> -                    { gen_helper_neon_add_u16, gen_helper_neon_sub_u16 },
> -                    { tcg_gen_add_i32, tcg_gen_sub_i32 },
> -                };
> -                NeonGenTwoOpFn *genfn;
> -                bool is_sub = opcode == 0x4;
> -
> -                if (size == 1) {
> -                    gen_helper_neon_mul_u16(tcg_res, tcg_op, tcg_idx);
> -                } else {
> -                    tcg_gen_mul_i32(tcg_res, tcg_op, tcg_idx);
> -                }
> -                if (opcode == 0x8) {
> -                    break;
> -                }
> -                read_vec_element_i32(s, tcg_op, rd, pass, MO_32);
> -                genfn = fns[size - 1][is_sub];
> -                genfn(tcg_res, tcg_op, tcg_res);
> -                break;
> -            }
> -            case 0x0c: /* SQDMULH */
> -                if (size == 1) {
> -                    gen_helper_neon_qdmulh_s16(tcg_res, tcg_env,
> -                                               tcg_op, tcg_idx);
> -                } else {
> -                    gen_helper_neon_qdmulh_s32(tcg_res, tcg_env,
> -                                               tcg_op, tcg_idx);
> -                }
> -                break;
> -            case 0x0d: /* SQRDMULH */
> -                if (size == 1) {
> -                    gen_helper_neon_qrdmulh_s16(tcg_res, tcg_env,
> -                                                tcg_op, tcg_idx);
> -                } else {
> -                    gen_helper_neon_qrdmulh_s32(tcg_res, tcg_env,
> -                                                tcg_op, tcg_idx);
> -                }
> -                break;

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
