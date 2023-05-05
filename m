Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp413316ejq;
        Fri, 5 May 2023 06:20:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6zuosrNFZajbG+fS8ssQfs0ILpZxrK4PJtYKPuJFUEOr0VNjiR14blLsEMx1yxt9LUYyPo
X-Received: by 2002:a05:622a:15c9:b0:3f1:ab96:aad6 with SMTP id d9-20020a05622a15c900b003f1ab96aad6mr2343370qty.60.1683292835321;
        Fri, 05 May 2023 06:20:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683292835; cv=none;
        d=google.com; s=arc-20160816;
        b=gZBla5C8hoxghGNpVOBmRav6h7DxjG3P5KhVxc2yQOAN31HwnE3njVZ7uItlVwIpPH
         /JROhcALrndhOHeAeiMWa6pVd8YiKgqGsYYZSNBKLfRLicoZFzdxIXDDBI3Iq9Xzo1NB
         /EkWsOUSxPo0+tCWAXeggEu87/tp+Yvu7n8CS0sEuvOwo/7gcPJBWyke/K7l7FJ/DL8B
         BnuNFS8BMCpkXs7LDTi6b6fVbg8tvoYHa+OhiyJPXQDNnv6ynCJ+lHrEkszZy9J0dAeD
         GoHGC6J4t2wfVddzhbFXcu9N7IU6WHbLsUq66Ku3fJdumNz8xdKi0YqQXQRnwOhh16iQ
         ycfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=LDhxxob13J5LDXuJmJ4rGo5aOOPgz7GkTyzqGqv6rhA=;
        b=oMsNTFjycs7+MzYfYHno7kiHmxZbKi7UrzrBu5ofbFmdaqU72eIRoBBPCUU0RArtmL
         Z9xo/VV9HHlm5+Xb2JxcdJkIfJHTrBpznTifi5/vSpLruxM471hXJBySwQsY6h7Z8zqH
         h9t8mZuG6EbYNuC+QqJ88iZZZZfLPle7tAsBctRtdfYxfomPXQ2OjS5xqlxUPo3KzSGe
         Mgflseegfz9zOR/Y92JxiGLBXU8/s0nshVYJ7opBESXZppTqss6ZAN+xrX5W5Ud8i4ux
         s9nGV/z/it3OBQO3/7UkkgSiFgdipHsEfnL7I5LacnPmHgubylIMXBRtR144Qn/SzVUn
         hqiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s1PK+yHT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t19-20020a05622a149300b003f0a4a29f15si550618qtx.382.2023.05.05.06.20.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 May 2023 06:20:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s1PK+yHT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1puvMO-0003Hp-RW; Fri, 05 May 2023 09:20:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvMN-0003Fz-Cn
 for qemu-arm@nongnu.org; Fri, 05 May 2023 09:20:31 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvMK-0006ya-5x
 for qemu-arm@nongnu.org; Fri, 05 May 2023 09:20:30 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-50bc040c7b8so2711856a12.2
 for <qemu-arm@nongnu.org>; Fri, 05 May 2023 06:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683292825; x=1685884825;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LDhxxob13J5LDXuJmJ4rGo5aOOPgz7GkTyzqGqv6rhA=;
 b=s1PK+yHTQyxNNbUHYRWSK8gYReQC953q+qaZVToizJbyHdjWoG6m+NXPDm7uEQ1VDq
 8OUAAxUdSPf3WeX4tXlqz3lHTVvEYM93GPGOTWlw+0bkZDrKYXg/rJ6Dvm8Kv5X+jHef
 dtLtfxoge45PTzeEuH7WWUPz3+V/MndhdIwOEHmKYUriDKSMsS8InN/t9EfFg+wR9cbE
 IjpeiCdDZm+JHs197h/9adhzhSac37okZHgOj0fGqwwneppgjLPPWhK85QlCuOkaTwO5
 tLckwiTn0AybKsdKCXmToQ/Fmec5JGD7jUUBzP6xOrLUAI2zXeklxwGlkg7cg7fgnsS/
 SL4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683292825; x=1685884825;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LDhxxob13J5LDXuJmJ4rGo5aOOPgz7GkTyzqGqv6rhA=;
 b=lL/O2uH7smEid6fa8HHO6FroNY4MnjBFW/KR+47s/dPo1BLsICGkcR2ED8PN4PpnlK
 en0ZbzN9zMlR4sit00K3ID/TAn34KGa4TdiCe/f9oLTZmlXF8MWKPqfxVJGjHeSGyuAI
 37y0wftafbmTBUrLrdZwBh9yw1s2JcG+ZSvYbLt1R7Iq8B3wnAuguIeybP5tMvT1/AO7
 Xxq7cBFYtms4qU9XYvi3wk0OqK1GwUaMBXLDU6Br6r9wRPbTZtjkRPyeTCCzaHDQ2frY
 in6sU9WjSVDdBQeNszA9+r+nGmoERHGrrUdTpYTn9MXhzVocKY0x91L263Ueb6ng6gln
 LuWQ==
X-Gm-Message-State: AC+VfDwwci+qiRMTmBLJpL86NVq9ifP9EmenxyVAt0dUL2cFKi7//H5E
 ASqEeNPEvMX/B0bKNQ52pX9LwxoujVE+D257FT1YAQ==
X-Received: by 2002:aa7:d6cf:0:b0:508:3f08:ea0f with SMTP id
 x15-20020aa7d6cf000000b005083f08ea0fmr1422307edr.28.1683292825486; Fri, 05
 May 2023 06:20:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-51-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-51-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 14:20:14 +0100
Message-ID: <CAFEAcA8zaPE2T=5=9ga9xdLfUG=jWAC9tt0GJdFiNx2sqSGV+g@mail.gmail.com>
Subject: Re: [PATCH v4 50/57] tcg/s390x: Use atom_and_align_for_opc
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: z0BLNBuIftxJ

On Wed, 3 May 2023 at 08:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/s390x/tcg-target.c.inc | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
