Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp402668ejq;
        Tue, 16 May 2023 06:14:55 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7w5KVUGLzKoDEbHYRkDbsCyTpUdV/ZAZX3LcKuEtDUt0VNvUvUouJXrCaL3QoPBQYCIu4f
X-Received: by 2002:a05:6214:1246:b0:616:5755:ca68 with SMTP id r6-20020a056214124600b006165755ca68mr72732122qvv.25.1684242894975;
        Tue, 16 May 2023 06:14:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684242894; cv=none;
        d=google.com; s=arc-20160816;
        b=ob5+g4lAwEBsmLD12nMAWf9M0fM74xLrPmNSwEGtNwp8U2muiQLVqeQSpf/F10sMRR
         rBqRMUHepCO3xvOuwlzybqi6YvmX2Fuet7yVn9shDPCHoJjX49Efzq1YR9itlEpRS6YY
         xN4iAuuHaw9MCR0QVg1hjrSUZ/RkPGLh+SJUDxgWh1FvxCu+cq6boFSLkaNkayI/bo20
         31H7CRuYyoaseiqxsQvL5ZEiLl38XfHFIKtwQCZJJmv1s2lcPCdMGRBjjVy6MUqTyk4h
         XyFrqQ3nbW8Z3ViZcC6bQluV4lyHbPFI65wnkqDrIFBBTktuHYQjfOTqa5Zxdso8sVl6
         jp+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=FsqO1Ug+oKZLntYhBasWO/KhtaZ522+IYFfRo50Gft0=;
        b=wLreYefwEj4kuYExE/MwjkTVaQBQna3D8N0k/5oX/jinIdlDDBYJpb2nKL2zKj1wgx
         0hK1MewXRjH9IpzIHTvf6JJUt7CwMKM/nx6djBQFWhEUl44rv2FP0bGHf1mnOufabKf/
         mDBA3KevVzMlhUgfl6sXT8U6hBtXuAYgiJcshkWQN5dJkWBI0sxhxHfMep9Hizc8lY2G
         SY53iQC5u9mh3C/dv/QcAv0D+KhiI9FcDHgTjXI4p7ywEyySyauL7PeZy+zkRA2KEYlU
         y0jqC2wZ++nisTpi0TdhzbjddvdYk8bDnO5asem56G88QTDcDdQz45Npqs1/aJJmbKDR
         4Ocw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r5fc7XlI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jr4-20020a0562142a8400b005ef78009016si11419599qvb.261.2023.05.16.06.14.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 May 2023 06:14:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r5fc7XlI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyuVK-0005C7-2C; Tue, 16 May 2023 09:14:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pyuVI-0005Br-BW
 for qemu-devel@nongnu.org; Tue, 16 May 2023 09:14:12 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pyuVG-0004XE-Gf
 for qemu-devel@nongnu.org; Tue, 16 May 2023 09:14:12 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-50bc4bc2880so21542511a12.2
 for <qemu-devel@nongnu.org>; Tue, 16 May 2023 06:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684242848; x=1686834848;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FsqO1Ug+oKZLntYhBasWO/KhtaZ522+IYFfRo50Gft0=;
 b=r5fc7XlIj9J/ackm1DXeWYVChiQNwIZ6fBrYaJaYc2MvHn51dltX76m7+rAZ9mlpb5
 9ZHI8EidtBxVKgCs7+sj8d9BsEtpuLjuvOquvzMWE9M+Xxt+4E5Pe2Dv1N6Wlol46IC0
 sg39/omSxkJj4xC1PHViBiurnkgMlFj7T++YxeXfpQucacZqWPcNhpzlSRyJVF0YyoSd
 qrfVQSWFgixG0bF32XM05hopNzT0GfqMlBTDBI6V6DXRIdXtZQWh1h42FqomEPp2yWJI
 t7DKDjES92lY3sFF9NlPCNCsqzIL02so6c+rhd6ri/kux6NoOwCyVoQ16wyZ/HzOSxSp
 y8Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684242848; x=1686834848;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FsqO1Ug+oKZLntYhBasWO/KhtaZ522+IYFfRo50Gft0=;
 b=PiYVj6JQdFIwE0SA1L59MrGrmuPbrKnxpoanc1RTxaOTzx1rPuH/32sXDa09Hztye9
 5EAOCXvzQsYiD5KhREBru56V+MBTh1UxBr4zqbQvbsVYuXgzIlxp8xRkaMK8qLw9wsH8
 bOseUGNNFuoBshuNObuXKS3uPOn86el4R1yHKxxvX/oPj9EZYtes1Xp+qQs6uaIdi7g5
 JoWQV6UdXUGJB7s5IloXuV7PLmOvby1M9ObueMmd9wCZvktBw5grTbHRbzlgv1C7Jjj0
 wIK5H7MMkb3QhjvPFzLA35Vika/WYnULTwE3chc0tXR/2OOg8006WjSD9y3lnLvspVYL
 HJXA==
X-Gm-Message-State: AC+VfDwRDsDxAs0W1ZEs+2Iv2O6Vy7uSY9C0T3sXyUVGj/dzx+KmRsZs
 TfG4n4VE3cC08Ug3H+hSFUFx//YmPlycfOKR8e5Epw==
X-Received: by 2002:a17:907:2687:b0:94e:16d:4bf1 with SMTP id
 bn7-20020a170907268700b0094e016d4bf1mr30903976ejc.66.1684242848057; Tue, 16
 May 2023 06:14:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230515143313.734053-1-richard.henderson@linaro.org>
 <20230515143313.734053-3-richard.henderson@linaro.org>
In-Reply-To: <20230515143313.734053-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 May 2023 14:13:57 +0100
Message-ID: <CAFEAcA8SxOVhPC+Y5saHKDWmBpOYZ2Ujcn3yHxoauw-jhhj3qg@mail.gmail.com>
Subject: Re: [PATCH v5 02/54] accel/tcg: Honor atomicity of loads
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: JmxpLNjDCXob

On Mon, 15 May 2023 at 15:35, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Create ldst_atomicity.c.inc.
>
> Not required for user-only code loads, because we've ensured that
> the page is read-only before beginning to translate code.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v5: Dropped r-b because of MO_ATOM_* reorg
> ---

> +/**
> + * load_atomic16:
> + * @pv: host address
> + *
> + * Atomically load 16 aligned bytes from @pv.
> + */
> +static inline Int128 load_atomic16(void *pv)
> +{
> +#ifdef CONFIG_ATOMIC128
> +    __uint128_t *p = __builtin_assume_aligned(pv, 16);
> +    Int128Alias r;
> +
> +    r.u = qatomic_read__nocheck(p);
> +    return r.s;
> +#else
> +    qemu_build_not_reached();
> +#endif
> +}

Something that I remembered: Are we OK with this potentially barfing
if you try it on read-only memory? AIUI some compilers (clang,
gcc is thinking about it) will emit a cmpxchg or a load/store
exclusive loop inline for 128 bit atomic loads.

(eg https://godbolt.org/z/GaGKhT4f9 is not for the exact builtin
that qatomic_read__nocheck() boils down to but does show the
compiler will do this.)

-- PMM
