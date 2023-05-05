Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp412776ejq;
        Fri, 5 May 2023 06:19:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7zg/dd9fqxIfWrkSwJQmEzdvo258e/56Wi31Eyh4gNYSwpP0Vi5Yo95uy1y5vTh0S1v7zZ
X-Received: by 2002:a05:622a:295:b0:3f1:9848:817a with SMTP id z21-20020a05622a029500b003f19848817amr2446425qtw.1.1683292786278;
        Fri, 05 May 2023 06:19:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683292786; cv=none;
        d=google.com; s=arc-20160816;
        b=z/Fa0+eIxKX41muDAQ/kYYBBpNsjSJ6DTw18N7o6xBkL4svaWe8MW0bTpNbiB/U6lJ
         Y30BsuSy4g2ayjhPEOdMXjB/GoZS9IHLeOh3gO1ApobvbijMJbgp5K8FT8q60Mr05GzC
         JDu/TMMRJgHlVcVbmYmvp2RnsDPiDffXJmJ38aT08Eyi11uhbQ/oUAvyOxTE/SwK2kD1
         NkfmYBi3S6++Xk1ChmSgPA/ovIy4L5uHr2SSx/l+AErP/EDKeQRdhyhkUYpMQ88/NOKd
         DOfUT9Yk8/9aELSt/lRgVhoUvXu8Ce1eMYpHhopIE6TMoCUaLQwjjjt1w7TYmH3JfvLd
         lBTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=IWhwwDCtf+VduCmmkFbrok/9YoNQdtaI1hIhqRrOGL8=;
        b=fJ7xgWq00mv18OUKx0oozowy1wcDFwf+9GwnUNYwTh18XurbocQgwfiGF8nCUAMz5Q
         DRrGvuM4g9nsDus8VBZ0/I6SwSoES/bagERO3NrYbqIc6hZx8nLePGBXjkit/G/YRNut
         W7xLL4eFtYdyRgioGmUHeKgMSj+RX75MHGwbx8UlH43xbEeafKMDvRYBN97200tsMTU0
         AmA0QaSN/xxcfNN38RnU7BScUgGhduho+oicCos1rHNof64BWqwmUQgcYSQgO78ffWre
         QeDq3t7j67+4eo57no4q6AHJflr2wszfp95F4OvDf7zsGLXWP1kaFWZ5dvYOx+wnx1/j
         JWow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mWlq+eY+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l11-20020a05622a050b00b003eca94bc4d4si534638qtx.715.2023.05.05.06.19.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 May 2023 06:19:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mWlq+eY+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1puvLb-0002O9-Lm; Fri, 05 May 2023 09:19:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvLa-0002Mi-2d
 for qemu-arm@nongnu.org; Fri, 05 May 2023 09:19:42 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvLY-0006YA-AQ
 for qemu-arm@nongnu.org; Fri, 05 May 2023 09:19:41 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-50b9ef67f35so3171562a12.2
 for <qemu-arm@nongnu.org>; Fri, 05 May 2023 06:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683292779; x=1685884779;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IWhwwDCtf+VduCmmkFbrok/9YoNQdtaI1hIhqRrOGL8=;
 b=mWlq+eY+fiBn3jk1dItTl7M9TBZXz8oMpH3djM5UzGeb0PmrrXma+asnjS1PSlmian
 zegEozo8MadHSWWFbzJTLE60ZE2r531oc1mXOBFhKycbpodo9OX2xYGPpjbXPzRCBL6v
 aGDY6nN7xPCaM9B1lr8o7viaaIMbcC++xewl351ijOuaeX7ICWMcAbVrQ/8N3IP7AxNl
 ew0SeKP5gGlKyUNDpAODVOmYzxfmRCOHEpvMn9LqiE8f3Hv4mo5TLB2TztwxknbHJ7kU
 3uahKXvPt/8Am+wUHdL8H4GeO9bB575oiV0jAIJIePim1MvHhlx5LIAukJlg5hHI9zVT
 7IhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683292779; x=1685884779;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IWhwwDCtf+VduCmmkFbrok/9YoNQdtaI1hIhqRrOGL8=;
 b=kKPpy6i+t5S+u+CavvKnzkGSA6a9Bw0M92NQMhvCn3LvJUir5ZZ24cEREYJMTAs4aw
 ph28cI7uQpeaz3bSApypuBX2VyHE0R1U+fsDUInPJI4g38bDhi/U2lsezWI6rQyIgUvp
 no21qlrUGcCsaKxNVyujiPXU3B5xOQHDZokcllRnmr/FYoCkvUfY98W4ZBi/Qa2S0cqK
 Ng0RREvPtgwJme4mYyuy4tsVRCqnmMnJku00UUkaQSwCGfrFLPZgtT6g6iU3Wqqv8N0I
 Z0ApuuEfPMX02nClFwH8kGNWuIwMiwULyyRJNVDPnPV8WNPoK+1NCnORNw3THMGNZYU/
 f8GQ==
X-Gm-Message-State: AC+VfDxbCMBpYkQ+W7AuYA1A0LAK1o4V5YkTZKYXzMJWR6iY/hrPga0D
 pM0a7X2FVv51BlsJ+x0DZ0MOn6ZDKty5LjKtEgN3Nw==
X-Received: by 2002:a05:6402:2145:b0:50b:f999:9dee with SMTP id
 bq5-20020a056402214500b0050bf9999deemr1473774edb.8.1683292779001; Fri, 05 May
 2023 06:19:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-50-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-50-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 14:19:28 +0100
Message-ID: <CAFEAcA9PQ2YpJLZsJZoZ516r3XCsii2zeRi+OPgGc_OOwNu1qA@mail.gmail.com>
Subject: Re: [PATCH v4 49/57] tcg/riscv: Use atom_and_align_for_opc
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: nGDG0kmyc227

On Wed, 3 May 2023 at 08:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/riscv/tcg-target.c.inc | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> index 37870c89fc..4dd33c73e8 100644
> --- a/tcg/riscv/tcg-target.c.inc
> +++ b/tcg/riscv/tcg-target.c.inc
> @@ -910,8 +910,12 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, TCGReg *pbase,
>  {
>      TCGLabelQemuLdst *ldst = NULL;
>      MemOp opc = get_memop(oi);
> -    unsigned a_bits = get_alignment_bits(opc);
> -    unsigned a_mask = (1u << a_bits) - 1;
> +    MemOp a_bits, atom_a, atom_u;
> +    unsigned a_mask;
> +
> +    a_bits = atom_and_align_for_opc(s, &atom_a, &atom_u, opc,
> +                                    MO_ATOM_IFALIGN, false);
> +    a_mask = (1u << a_bits) - 1;
>
>  #ifdef CONFIG_SOFTMMU
>      unsigned s_bits = opc & MO_SIZE;

Same remark as for ppc.

-- PMM
