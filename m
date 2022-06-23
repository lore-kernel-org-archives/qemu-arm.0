Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2826767lft;
        Thu, 23 Jun 2022 03:13:56 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t/cjGsp1ovAkurtamTKbiZIU6d+KWGvWttVpRseEkof+Bi7War4DApy/lDRAo3XlqHsheS
X-Received: by 2002:a05:622a:409:b0:305:1e21:7c81 with SMTP id n9-20020a05622a040900b003051e217c81mr7091893qtx.655.1655979236811;
        Thu, 23 Jun 2022 03:13:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655979236; cv=none;
        d=google.com; s=arc-20160816;
        b=rkjSYyhmm6h2PgVmutQP1qpXi0VD5YnleYmj9uR5P3KIMY5rCO4mMB0COvQq3nPTz5
         TlkuqZOQhmFGm6VEzv7lxgNMOTMNAIAsGroJfNLTRe42QmXYCtGBe4WIg+YmkklNmJGo
         H825O6WL0Zn8BC6K4oCDfCoqtCn8JXziPd89nHPMjo1AcGw6NO/sBcpRPqm9QLvgLuxR
         KlD8CG143DlRKvTTe60FTfVXg5JHqKVxvWJ3Wrfi4cyxnr5Ln7mnpg2GEcm+Jvmt4Mt1
         WLm5Yj2eLXESPhSczwZIqcqkftEVjdLQZLO7/T/efzdqS4UENo5PS78YEcsf98xOAWAB
         4iSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=GP08PTu0ONM+UgapC4xwFQOe8C7WZnhuELMj1bD7rRE=;
        b=szCX/8pcozS3lxzOzcRBri3kPFgXv4Vn8FfAVzoU6UDM9XXdJ2mX1WkERLo6+Zoetu
         HK4CYkjpfAsROh7+NT6BQpgVu77/YQvPb6V24xWihZzzg8Sw7/8JBx0RHZmhvBjYMY4Q
         o2TjqSbkkDvYW/aS9pYe27V5OfIJ8Yn47zQXeT2g+QKS3d5Ligv5EzSy8wtwEB3R7lOG
         9EtHDvWbIeyqoFgxW4rV1nSPI0L+FnDr3C7OeU0pcY0TB8mwvf7zC1JT8U4GHaQ/XsD7
         eaSaEk39IgUwp5knEzTR2vtXNfoBOZPm+jlIYb9tIveYMWQXn/HvB39kdoiAtYkdCUIU
         0nYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sQEfLJdh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jp10-20020ad45f8a000000b0046aedb726c2si14345091qvb.272.2022.06.23.03.13.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jun 2022 03:13:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sQEfLJdh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4JqW-0007Wb-9a
	for alex.bennee@linaro.org; Thu, 23 Jun 2022 06:13:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4JpF-0007Sw-3N
 for qemu-arm@nongnu.org; Thu, 23 Jun 2022 06:12:37 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:40758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4JpD-0003VS-C7
 for qemu-arm@nongnu.org; Thu, 23 Jun 2022 06:12:36 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-317a66d62dfso128383987b3.7
 for <qemu-arm@nongnu.org>; Thu, 23 Jun 2022 03:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GP08PTu0ONM+UgapC4xwFQOe8C7WZnhuELMj1bD7rRE=;
 b=sQEfLJdh5I/U1AIrWFlb4kuCkHfLtbjzVFjmJoP//Qd5zJcxEBpqMrFk1KiKhCJIk0
 oQ1RxhLcAp5qdOhH0I+5otfwvFQMvBbqFG5NnMDwhaCzoSmDDTEUF5vo7+oYNivM/QzW
 ZbmBIqEL5Is1i4zcHGM4ceJnvMJMzamwhZY3/4BRgSBWi1HFaeEuqHLPh4kxV01qnErQ
 TY+Fy+Q6yIuLBfhVyum1aGESTi6e7b8D88sBZFG+LXh3LJOx4ywlow/430JzOzRMKQpF
 zLl6sW1yFyrge5YCZHH/fr21+w+MaWxF83+HoNiMzBGL7va5Gel1c9OcoUw9Udfgvkx+
 6AeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GP08PTu0ONM+UgapC4xwFQOe8C7WZnhuELMj1bD7rRE=;
 b=bjOm+P+ayNjlLblAgsBbF9kSBk37BaW/WXI85cwPS/zhhurPS9lEGbBlyAY1s1urFx
 jAfbDFRDIaNU12wxiD51AICPbryjtPlF10JCge5D6gk7mgQEfTTkswo1QOkvlAhbtFqu
 nNGkk4lkTF8eGnonZiDaEePPvjD9uXaslz1MC1cx/e3u0sJVXrcPpkI6KJcAjV6XyK2g
 7o/FUkBXLIj5LNsFGLp3Wsk/rh8bGpSMM4WRPNLZ8xrQ/coH6nPEqyPkkvcY0A7zDS96
 caBN+mbXQ5MGp8vzfPD7LsBzSawKybNyvQivNEvIOb/DgKesmgVJaXaATVh0aorOImI2
 YqeQ==
X-Gm-Message-State: AJIora8nZzuHMC5qQmDPzbIz3vZmtS9/vb0NfbyI3/3pgnR2LoY10Y3Z
 UWbOBT9IFjAFH/Nb9VAGN9YET0ahV1dwQFewrB5HvA==
X-Received: by 2002:a81:8486:0:b0:317:a4af:4e0a with SMTP id
 u128-20020a818486000000b00317a4af4e0amr9663470ywf.455.1655979154063; Thu, 23
 Jun 2022 03:12:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220620175235.60881-1-richard.henderson@linaro.org>
 <20220620175235.60881-24-richard.henderson@linaro.org>
 <CAFEAcA_f1dtuiTLuwZL+MTeNsJc1fiWUZmRzvZBHAFpbDzu4hg@mail.gmail.com>
 <a2848fea-8d1f-03eb-2168-3cf5c1eb2de0@linaro.org>
In-Reply-To: <a2848fea-8d1f-03eb-2168-3cf5c1eb2de0@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Jun 2022 11:12:23 +0100
Message-ID: <CAFEAcA_RyLCeVTtGKbo-1P0pisXJY7PwYvob9wJUfbFftAuWtQ@mail.gmail.com>
Subject: Re: [PATCH v3 23/51] target/arm: Implement SME RDSVL, ADDSVL, ADDSPL
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RCIcxXNS/Qso

On Wed, 22 Jun 2022 at 01:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/21/22 10:23, Peter Maydell wrote:
> >> +static bool trans_RDSVL(DisasContext *s, arg_RDSVL *a)
> >> +{
> >> +    if (!dc_isar_feature(aa64_sme, s)) {
> >> +        return false;
> >> +    }
> >> +    if (sme_enabled_check(s)) {
> >> +        TCGv_i64 reg = cpu_reg(s, a->rd);
> >> +        tcg_gen_movi_i64(reg, a->imm * s->svl);
> >> +    }
> >> +    return true;
> >> +}
> >
> > I think we should define functions that parallel the SVE
> > vec_full_reg_size() and pred_full_reg_size() rather than directly
> > looking at s->svl, for consistency with how we did the SVE code.
>
> I had actually been thinking of removing vec_full_reg_size, at least within SVE.
> However... done.  I've propagated the new predicates forward through the following patches
> as well.

I don't strongly care whether we use vec_full_reg_size() or
look at s->vl, as long as we do the same thing in both SVE
and SME.

I do think that it's worth wrapping up the '/ 8' in a
function that describes what it's doing, so the other
option I guess would be to use s->vl and s->svl directly
when we want the vector length, and have a function like

/* Predicates have 1 bit per byte in the vector */
static int veclen_to_predlen(int veclen)
{
    return veclen / 8;
}

and then use veclen_to_predlen(s->svl);
(Adjust function name, types, / 8 vs >> 3, to taste.)

thanks
-- PMM
