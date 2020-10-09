Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2534291lfq;
        Fri, 9 Oct 2020 11:47:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx02vYS6d/z4xZRRtfiia1DzHJdft4N016QmbkZclP7c2lCM98sMFPFvtPdoTrCCj9WfYIK
X-Received: by 2002:a25:d6c4:: with SMTP id n187mr20687528ybg.191.1602269266405;
        Fri, 09 Oct 2020 11:47:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602269266; cv=none;
        d=google.com; s=arc-20160816;
        b=Hl1YSmVnmbzOwxXM5T92NM+cSvZYdAWp6lzh323siiu9I7O7e5eaiRhJmqEUc69TgQ
         vSwgHhh14EeHT0NGELLVzVNd7EFZQPmYVeYHdz80DdN5QKIKi3Q7H9puDqk9F+yKIbGH
         NiXNBjnSsrbcxNc21+2poKrHsrUTUMceDgx+DY9amO+JkxOQJSgiy8t7IWBmlkr3RZFG
         r3Ii2MB4DqNy3641+Y6+bEsUQsu/aLgjYXJEu+5ShbePdckPD6ACqIoxl74GdHbzaWi2
         bx4FsytdPOhW1oxB0ebYJO6V06ULAniusQ7bNI4Ue6jqwQaFgWdZL0Ky3Lt1xjDAtAPx
         Q7bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b5rbtordpKE2zr2krOgen1nzVjrL0DFjDKxYoYC+96g=;
        b=MpFNcLGfNh3OKpYZJvS0OMAzmkbfEElq7akiHIlMhz9DoI3ysEvQ2BI0tfyn3EOTmq
         FGqbb14AYiIamFBi3IlBXb8o6A97FaSVRXfpsBEw/zHJ63lj7STgGXw/eCTPiTVk+UjR
         stjN+DxdTHqN1AMz/u76bwznm3N+YpOx+VwwYLJdJlXEcvdm2skt1cLxuvl6YWudOMQ2
         xGmu8+che7fkDx/CcWDz+rryz0+XKlk4IwjMJ1TY+iYnsnwXbNfQ8hgRPKlVlf8tIJPV
         pIw6efPoIrhLtb3BDRk+jIuQrUYJwHaJCT79hrjvGQzFqaEOdcUwg+GxijLcsvJE8DId
         s+yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yd7ff15n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 199si7443742ybe.114.2020.10.09.11.47.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Oct 2020 11:47:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yd7ff15n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kQxQf-0001pj-It
	for alex.bennee@linaro.org; Fri, 09 Oct 2020 14:47:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kQxQT-0001pD-Js
 for qemu-arm@nongnu.org; Fri, 09 Oct 2020 14:47:33 -0400
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:35321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kQxQQ-0005Pd-N5
 for qemu-arm@nongnu.org; Fri, 09 Oct 2020 14:47:33 -0400
Received: by mail-ed1-x541.google.com with SMTP id cq12so10428792edb.2
 for <qemu-arm@nongnu.org>; Fri, 09 Oct 2020 11:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b5rbtordpKE2zr2krOgen1nzVjrL0DFjDKxYoYC+96g=;
 b=Yd7ff15nSUpatZCasGoG8iEQNDKfn1FxBfbFo0673OJrx4Pk7WVpZ/aKmzSGv+jzbh
 uSRgkxd0y5Um3l+8X+H9VPwgr2ewdkzSmQsOa46BMqQJB0liRCAfQXAow19pfmRZTs2P
 v0GrNzvI7a5OHi/17DyCLM2alA36ZRAINdIdMsGBdZY7y1Z8a6IIAmAlbusM6dIG3rUW
 zRDXZVriYkcgE0cRLJO8wEjTmd2Ffatlze4M3PiYx3PjnEOyssr3VfTtiNeamo2VPmue
 Wa1mjuabM56asdIu31W69y9f6gYiGmnfZSjX2qq9mjqOcLwdPHj1sz3eHNUWfnq1cHB8
 5U3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b5rbtordpKE2zr2krOgen1nzVjrL0DFjDKxYoYC+96g=;
 b=JT+RuR/epP3l8XiYAM9dRZbGR1gdiEOQ8FvJ/k+IWVvjUiKShBYCnyf3iIKXYz3iXY
 CLBmDIu29v4HaRdcrrcxqDKhFL4ASZFu2EMx2T6MqE/4bdNULVP5sqCGvWsMyes9mq3Q
 1oohg++rGQ7ndcIJR1fbQEouT/jZuW8kP5B3XVNG/cTp7LdYenG1CGkxAPDYheX8iIyD
 X+Boo7sA/CPPR5vB+NiZ//vtUWdxGqgLLwY4LJqgjLWnHalbYmODrfO2dzQfZcniJSPy
 3v9wQl3asblobhfT8rSOhI1QGa5BCLnuMywaMVwLGScjDRPuKDuM06Wh7kzalYLQLHjy
 mAwQ==
X-Gm-Message-State: AOAM532q71NPQccQBnzZvqGOV3VUM3a2Lu9pzkIj9jzm5YBJBrrfE8xs
 2nffbh41ZZA2OO/Akhk6fS4uDqvnbMiM5nFitXI4CQ==
X-Received: by 2002:a50:e68a:: with SMTP id z10mr655256edm.100.1602269248993; 
 Fri, 09 Oct 2020 11:47:28 -0700 (PDT)
MIME-Version: 1.0
References: <20201009144712.11187-1-peter.maydell@linaro.org>
 <9b6bcfac-922d-675c-d7b4-35491a3efe60@linaro.org>
In-Reply-To: <9b6bcfac-922d-675c-d7b4-35491a3efe60@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 9 Oct 2020 19:47:17 +0100
Message-ID: <CAFEAcA_TZQOFtQn=MhvaF7wvXCgQLHfhpekHb29kb-p8VgWfYA@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix SMLAD incorrect setting of Q bit
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-TUID: dnBhBd6Jl/LZ

On Fri, 9 Oct 2020 at 18:57, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 10/9/20 9:47 AM, Peter Maydell wrote:
> > +        /*
> > +         * t1 is the low half of the result which goes into Rd.
> > +         * We have overflow and must set Q if the high half (t2)
> > +         * is different from the sign-extension of t1.
> > +         */
> > +        t3 = tcg_temp_new_i32();
> > +        tcg_gen_sari_i32(t3, t1, 31);
> > +        qf = load_cpu_field(QF);
> > +        one = tcg_const_i32(1);
> > +        tcg_gen_movcond_i32(TCG_COND_NE, qf, t2, t3, one, qf);
> > +        store_cpu_field(qf, QF);
>
> This works, however, QF is not restricted to {0,1}.

I'm not sure if you mean "this code doesn't maintain that
invariant" or "there is no such invariant". If the former,
the declaration of the field in cpu.h disagrees:
    uint32_t QF; /* 0 or 1 */

If the latter, I think the code does preserve the invariant.
Either we set QF to 'one', or we write back the value it had
to start with (which must have been {0,1}, but we don't really
care, because we don't want to touch it.)

> Perhaps this is simpler?
>
>         qf = load_cpu_field(QF);
>         /* t1 is the low half; extract the sign bit */
>         tcg_gen_shri_i32(t3, t1, 31);
>         /* t2 is the high half; must be 0 or -1,
>            and the extension of the sign bit.  adding them
>            must equal 0 (0 + 0 = 0; -1 + 1 = 0). */
>         tcg_gen_add_i32(t3, t3, t2);
>         /* Any non-zero result sets QF */
>         tcg_gen_or_i32(qf, qf, t3);
>         store_cpu_field(qf, QF);

This looks like it can write something to QF that isn't 0 or 1.

thanks
-- PMM
