Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp1270356lfp;
        Mon, 18 Jul 2022 05:21:46 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1urc4G1/k0cgYeaceh7SZCztNiYvkgux8OXY8LJEKnrc87kU5lxNrP7DH25MMAxj3Iwbb2/
X-Received: by 2002:ac8:5fca:0:b0:31e:b661:7ae4 with SMTP id k10-20020ac85fca000000b0031eb6617ae4mr21298715qta.585.1658146906379;
        Mon, 18 Jul 2022 05:21:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658146906; cv=none;
        d=google.com; s=arc-20160816;
        b=hfJvL9rK/9cTv1gLiAslhQMCokicL2tVUhqEWlPA7y/SJzsU9RrEthBTmDZ9a4UZQo
         0q9ChLsDjxmjmatuEpHUGPV4YVaRcYXDAyQhVjJvN2n017nIZikyeXg1u1CdnyESxeLW
         dZIGeHLfSm2fo3Au5edbu9SwVkoxPJ22XZnKBcqbmgXTgVsaSgCg5Zpg0IhoP4hq+A/P
         BoiX4LsiyAQqVm0yvr2aIEHLWP5rJMT8nEMz4a10oW3nVEb4Ym8ka8eDJNAvpeWWOU/V
         zm5CEKh4kOvljemEx44xs9IMIxFjmCgL6TTsu10tK321JzGEObuqC3zQfV8hOAgf2dTq
         xpiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=D/ATF/zvlg5vv66t0f26MHW3v9HrM2ukGgWXMMJjQX8=;
        b=NuoHNLDU6oFvTjUdmnFbUvMPtlXFaMaJjPN5FcgE3ZyJe33iZm2WQdjir0L6ZpLH6U
         WTtukRjeb2+Jx/r8CKFej8oDhXHV6Pdbfk22qgGnyi/iyA/8rcUurhqdMMsjARR7/NLa
         ueKQuNYsiJP+eCBJinJTE/XKHLFpK60vf7piH1ZfZfo+W7uo/Cbrog3RbGXEbZ0B4a5r
         Qv0OoVPErzSbklAlf8ZedtD6XdYMZPULiEdlI4vW7DI5jn4fZeNG5ntEOjurXKvuFpbT
         Rn6w1QZjBtYGaWUlx6WZpyK00B1Euj9S70aWgpfRM0XhaDPaEj6KjzIboAqJIdZLQTEE
         1LXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vVbKYmSo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t14-20020a05622a180e00b0031ee925f28bsi2103692qtc.150.2022.07.18.05.21.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Jul 2022 05:21:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vVbKYmSo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oDPkv-00059V-PQ
	for alex.bennee@linaro.org; Mon, 18 Jul 2022 08:21:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDPjA-0003mO-DC
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 08:19:56 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:42756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDPj8-00021w-9z
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 08:19:56 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id c131so19706372ybf.9
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 05:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D/ATF/zvlg5vv66t0f26MHW3v9HrM2ukGgWXMMJjQX8=;
 b=vVbKYmSoXJrXwv3qplKi2YZ3+FP3d5ezE5EMeifisXrKueQiG/htPLbZzg5bz0ExGv
 OSIzuul/wcubf9cXX6h1cz6+vLqT0Cg9FF+3nPP4d9s40WJyRCNfHRWzN1Gn67KXppY7
 /F/+sbckZmrzNXWq3W5rdj0PO83ykHoDT+7cHyrdc5sIVGz/0riKSvhihxVQmlXtxJSR
 rlXt2X7SaQDKkWsdLc1xg/VzqOlXjk8I5kDdi50k6KIf5vxuzzbKWklSj+olpzXz5ap/
 ukXxKE1g5379c4tcWDdrxhjP58MJP8O8gAcpbBHRoLG68H/E+JrNvRuGtE3NBHmYwmwW
 1GZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D/ATF/zvlg5vv66t0f26MHW3v9HrM2ukGgWXMMJjQX8=;
 b=ZY6y4nWxufUl/qcmMM/ige5DiKMyPI0wUfRDkzrcCYk8XD+Gi0W3M7/OQ0rl7uuvDY
 tofXLznvsxlzy0o7lyaHPWUF+QjZqxRf3LP58eojlVJRMy6Q/HPL7RNIAQCZpE27Xr2J
 0daGWDXxbpajF3T3at5bHHfExKdxqHUiG+h8prqn1it1i3eKcn60BvUjaIH2RMrpPyGG
 yB8w9TS7efjvFJAeLcKIFakASC0SuxpaVVp0P4FhfFDHeozxW7h8B86rF9SX3lDXA6PE
 mqR1ZPO7vbJG1wbW3CiLH0xj/52Zvgjv+Mv26QOUSROTL8VhcNLze3utkdC8pOrOqKwX
 GsDA==
X-Gm-Message-State: AJIora8gS2PLbfZVF20dlaQyaWKQpJFhokOatizuB/pOwsrGHLGLK8n5
 jE4Bkr9bxBDIn4kB65te6viZlDracOIn+rvSVw5gSw==
X-Received: by 2002:a25:bfc7:0:b0:66f:563c:d2e7 with SMTP id
 q7-20020a25bfc7000000b0066f563cd2e7mr26094227ybm.288.1658146793153; Mon, 18
 Jul 2022 05:19:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220708154700.18682-1-richard.henderson@linaro.org>
In-Reply-To: <20220708154700.18682-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Jul 2022 13:19:42 +0100
Message-ID: <CAFEAcA9aEdjxZvUjVUb0bM5MYOcjBwzSyDwa2bOmZ8MoWuCCbw@mail.gmail.com>
Subject: Re: [RISU PATCH v4 00/29] risu cleanups and improvements
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Eh1zurr+cYys

On Fri, 8 Jul 2022 at 16:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> If you can imagine, v3 was back in 2020:
> https://lore.kernel.org/qemu-devel/20200522023440.26261-1-richard.henderson@linaro.org/
>
> I've refreshed that, not that risu has changed much in that time,
> and then also added support for SME to aarch64, i.e. SVCR and ZA
> storage are now present in the reginfo, and compared.
>
> I include a small test case, which allows one to see that ZA
> storage is being handled properly.  When run with
>
>   ./risu --test-sve=1 --test-za=1 --master -t test_sme_aarch64.{out,bin}
>   ./risu --fulldump -t test_sme_aarch64.out
>
> one can see the 16x16 bytes filled with row major then
> column major indexes.

I've applied patches 1-22 to risu upstream git, and left
review comments/reviewed-by tags on the rest.

thanks
-- PMM
