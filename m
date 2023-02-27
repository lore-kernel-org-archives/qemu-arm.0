Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4442694ejc;
        Mon, 27 Feb 2023 01:24:29 -0800 (PST)
X-Google-Smtp-Source: AK7set9R5a1CZkG7c6ozEJjgN8Sh2PddcNss2XBJSNhW77CAcx+qgsTYwp4X24ktrHcMexsYLXRj
X-Received: by 2002:ad4:5966:0:b0:572:636d:626a with SMTP id eq6-20020ad45966000000b00572636d626amr13783328qvb.25.1677489869014;
        Mon, 27 Feb 2023 01:24:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677489868; cv=none;
        d=google.com; s=arc-20160816;
        b=vorZ+4IjyJ8ZNupa79hWg+G7y/VQi/4+yF06rgryNdrtg7uNiCAUv6gL0fZ/I5DgKf
         BDmD7WUVEBsumBcRNnnSfC6b0W9yu+EcDNnQh3RcJj9epKo27eQWbGroLY8KXHrgiiGl
         gzqwPo9JnqCqkxxi6ao9RxWM3SX7gMKNxrC8bDTxP3AO0k6bwUJrXsEPI7TarTS+VbJ5
         0RDYOpcgeKReMkyCwT5+quy3LDRKXwnScgwpSRS5sOKaqhUGD40eUNnThKguP+D/hjsK
         ivwZT2bDV08xn9ctpMydadyWnaxevo+W+MlHLsjOZisrFBqGKqWga31RYKjstS2PzXrn
         5lxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=+2JYB7wd0C7G+C0fx/3D6OFcV0BKjr5AqgTZnhw2T7U=;
        b=tM7bT6PWJ0EUJ5+E5g8Adem4/yQPeVaenul4LP13VDepKxvJ8Wii85zLTLYpMXZ7xr
         sd1MWlkT9JaJT4wViAT86CgAWQ+IW4yQs404B1olzOgMPMSpIoLn6R/Hve5jmpUK++Cs
         r3ea956NibEeRynL22Bgl+mGNfiuO8SX6QNWFwqxbeGIoyLmpCt1bw7wgzs2V48levV0
         5PqIC/fP5ROcerh9wyJJ5ZCC9HG4mEVAJ5oFkfIx+yaI1b8D4tCMGtgK5bV77ZIspLMN
         /L7SK8+aP11RcXyX+sSsw4CujFTtgC3C1/hJX4zmYXvAOQVVbHetQk5oouk8spuntxEH
         Bkig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=AruuY7Mz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a19-20020a0ca993000000b0056ea8af4b2csi6329367qvb.303.2023.02.27.01.24.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 01:24:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=AruuY7Mz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWZk3-0000dE-9n; Mon, 27 Feb 2023 04:24:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1pWZjt-0000bV-63; Mon, 27 Feb 2023 04:24:09 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1pWZjr-0005dt-Ni; Mon, 27 Feb 2023 04:24:08 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 qa18-20020a17090b4fd200b0023750b675f5so9396104pjb.3; 
 Mon, 27 Feb 2023 01:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+2JYB7wd0C7G+C0fx/3D6OFcV0BKjr5AqgTZnhw2T7U=;
 b=AruuY7MzKLZky6suHUxEaAqsti3BypbPJMYKaKjTPjguhRQxp2H0nc7laoCmgam8YR
 03iTTnYBgtR+GitEupZyoCHdUYDmLfH5ruqZ7sZYxaVyQ8A6hinAJjQBUP/grgnKAU7M
 mpXqTgpIb/n0mbHwLTwQ09CK0dnsD0m7UOVn5K+jl1uFGPb5ywrbYVB+hzMnR5sF2rB8
 hX9l36lrQIWXDPkt1Be6OLve8f5s0mweEb0QJS1UxmuK4cMahoRypEqe/sA6PmRdNXaY
 E82WT4L9V7p8Xhga2+fuhM3rDzaYhWSCG1pgCDwLcGuMBgN+r9ZHc5iAK//rylQC21dk
 4YTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+2JYB7wd0C7G+C0fx/3D6OFcV0BKjr5AqgTZnhw2T7U=;
 b=KUtw/h8+N6vseCmA0xC+/lu3PPr3IHQeGC5pZl//8Ct8ZU4XRmqA/HusDW/BInT9hV
 9S74ymPHRArvB/WFc3onnCn6P5Cdg5LITwLGThXtbL2bTO3slxqJy5OASABBe5xjgqrv
 coFduUidHOPIZkSoKNTWr/PVrZALpRmZcdIHYk+07DoxZt34dY/82xhyIU7rAONhA+2Q
 qyBbm9f6cwuyTGDeOJnzmUN3tFEuloGYArewQYOdTDCW85uhzYqZvEaB/fjtIrMRqnln
 gvR2pgb1Oo4ifEi2yEQAScNtwWq4eHI+wXBiaNQNVacgQomtjdpiPrVMuuLNHVXuQCTf
 u5ig==
X-Gm-Message-State: AO0yUKXjZ4e6ppdoc6a1R1i4825DhcUtHCTYPnjIGhEG13y8gowFTTJs
 t4IJ1EsqZRKQ6KzNvztReCr/yh1Wk2Sr6zu3DIU=
X-Received: by 2002:a17:903:3307:b0:199:4a4f:9d2a with SMTP id
 jk7-20020a170903330700b001994a4f9d2amr5944050plb.13.1677489844990; Mon, 27
 Feb 2023 01:24:04 -0800 (PST)
MIME-Version: 1.0
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-65-richard.henderson@linaro.org>
In-Reply-To: <20230227054233.390271-65-richard.henderson@linaro.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 27 Feb 2023 01:23:53 -0800
Message-ID: <CAMo8Bf+fuAoqXgrZsUJj4tZ6dF5Xo8kJDgPP5p0aNWBia01bBA@mail.gmail.com>
Subject: Re: [PATCH 64/70] target/xtensa: Avoid tcg_const_i32 in translate_l32r
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, kbastian@mail.uni-paderborn.de, 
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com, 
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=0.999,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 4kGdZcS34jE4

On Sun, Feb 26, 2023 at 9:48=E2=80=AFPM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use addi on the addition side and tcg_constant_i32 on the other.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/xtensa/translate.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>

--=20
Thanks.
-- Max
