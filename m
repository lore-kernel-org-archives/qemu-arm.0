Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp557623ejn;
        Fri, 14 Oct 2022 10:57:16 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5fkvYvySaGxLsHfGXrf4bTGLDRcmtGTs7njIITFvsoWAXNEsImoBrJDCig9P3XdMSnHydl
X-Received: by 2002:a05:620a:410e:b0:6ee:b96b:a831 with SMTP id j14-20020a05620a410e00b006eeb96ba831mr4765612qko.734.1665770236579;
        Fri, 14 Oct 2022 10:57:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665770236; cv=none;
        d=google.com; s=arc-20160816;
        b=Xr4e0KlIOLZ5KPMNlMGCfk86c8u0ppurtWwc0Aaz3ala2mWA5JbZkUPAEaW55fDv4S
         CDptnKtnQaos5NwxzXIBjsWt9cGfMBsQC0N80mJD4qqQ9Q8gOs6CFJsW9HV+fJhdYsTf
         xjHHeSEfTN/+ctSXkpOs3ScG/Gm5cKUfetkh2LVPMwMTGGLA9jU/TpySDUHG4blxImqK
         Lm/tdTUTsBg1nmrivRe1ri0pSbqmMw7U3A90D+k9nq93V1vvxrOzRoPaxic+4Gd9PYH0
         4+JBA5ABEmtmVa1d1bNB22Ke0OC20V7IECf1pInglmeCGdmvU8K7kDUAlJFJt3CJOqej
         izpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=5wT05a1DBUiMB3HdHpeJC+U3IJgoa+a7RGGIrRcmhPU=;
        b=xh2EiR0swCr1wSX72wFRqjByeU5hCxMWLhVLJ7s6qu3FmucybbGVHgnKIaj3QgXSJL
         pZaHmyuLXyoTaNNaeRraLtw358bICJsfBfgHlfhgh1Xrk3sXT5MtRdpBmTK1QZifxRsA
         +hYJQHbssu/F8uS0zzG70OaJCC2z4T73A/eOfoDyOGUQPfx2UWpHy5vCgmzk7YowB9Ab
         +0omkYlp/rS+xpp3fQb9jDWpbOM3CnAEJHQHRahV5JhETLhOk09VlZaHMUAXzh/u/MXY
         TS4KecesXlTdg2wDR1eIqRZh+jnzuyTLztWttaSpGea5/dLWKTzfKNq0F72N8G7VYP0z
         t6hg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H3QtdDnE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d15-20020ac847cf000000b003985c033002si1741171qtr.227.2022.10.14.10.57.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Oct 2022 10:57:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H3QtdDnE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ojOvr-0007WJ-3X
	for alex.bennee@linaro.org; Fri, 14 Oct 2022 13:57:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ojOsW-0003Ru-VC
 for qemu-arm@nongnu.org; Fri, 14 Oct 2022 13:53:48 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:47048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ojOsU-0001oV-7k
 for qemu-arm@nongnu.org; Fri, 14 Oct 2022 13:53:48 -0400
Received: by mail-pg1-x536.google.com with SMTP id 78so4913488pgb.13
 for <qemu-arm@nongnu.org>; Fri, 14 Oct 2022 10:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5wT05a1DBUiMB3HdHpeJC+U3IJgoa+a7RGGIrRcmhPU=;
 b=H3QtdDnEb6L+wnwm4pOWsPKKwTX4Ivvy3joaPV/M+fAzDIwHxbt30Uy/EKh/b8fnNP
 mqgQj1eZ+BYyreRuQ2qjRBMOAVxUM2CpPDoqa6jK/QfVjWhfWvJSz8SeUhhZiqo3WHdK
 P6/jsUsfJBsriW5nSf45Sqsx4q1vYsADOznMlw205cXIOtc3djRTMGnyi+zGK/Fa0BgD
 fHvlRSLm5ulsgeTB04A5T94kMswkdN3Nxp/xWRE5dKhyfAO+79bCvBdQkeI7zUtQXpDt
 mGdiSA/fsh9HSXo1BG3tpV25U7qJaonkHLYbSJtexFDAC2aWt8Oz1/chOuFUnAbGD5cD
 s9xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5wT05a1DBUiMB3HdHpeJC+U3IJgoa+a7RGGIrRcmhPU=;
 b=uIWeV1sjDG4U10/CF5WfEAJUoT/7t5WU+lz+sO9JL8o3+NmTLjjzlF7Lt+O5mfB+Q0
 sR+UXSMSjMXO+L5kidQZgVBPpR3mPk98k5Od4wgYaqAVXP2yjDzHMI/AQznD1sfcXCB9
 IzQXXdCgLE67C/aWEXwE8IksguBUgcs7/AyBGpbEPjPKOGddjhoL0wwwYDQigzhB67fs
 YYtd2379JGl28nXaQ55zgcITLWV3S8gMkBjHotQdHPhl7SDcXMZPAzVqk2fdfH3j6n4b
 0ChS7hSBNxVsyKeAl9wUX3w85KWYJf4xWEgn0pEWX80qUNqDpSp7KBb5FbW4AtlH3Mva
 321g==
X-Gm-Message-State: ACrzQf32sg/rBbcYohMovQ02aOp3DezJUvX1kRv1YeBkNSPnSs3FcIEQ
 UajP1f60Q3hKT4mXUR1vSvARlSZ40jPdtT6QNhpxjA==
X-Received: by 2002:a05:6a00:1595:b0:563:8fb6:ae53 with SMTP id
 u21-20020a056a00159500b005638fb6ae53mr6270215pfk.51.1665770024568; Fri, 14
 Oct 2022 10:53:44 -0700 (PDT)
MIME-Version: 1.0
References: <20221006033846.1178422-1-richard.henderson@linaro.org>
 <20221006033846.1178422-9-richard.henderson@linaro.org>
In-Reply-To: <20221006033846.1178422-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Oct 2022 18:53:33 +0100
Message-ID: <CAFEAcA8zy2J06hZVt2ULJmbhQzDKRKrKBX9KaKLVHJhuudZQnA@mail.gmail.com>
Subject: Re: [PATCH v6 8/9] target/arm: Introduce gen_pc_plus_diff for aarch32
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: urHyiNC/2ul1

On Thu, 6 Oct 2022 at 04:55, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> @@ -296,7 +301,8 @@ TCGv_i32 add_reg_for_lit(DisasContext *s, int reg, in=
t ofs)
>      TCGv_i32 tmp =3D tcg_temp_new_i32();
>
>      if (reg =3D=3D 15) {
> -        tcg_gen_movi_i32(tmp, (read_pc(s) & ~3) + ofs);
> +        /* This difference computes a page offset so ok for TARGET_TB_PC=
REL. */
> +        gen_pc_plus_diff(s, tmp, (read_pc(s) & ~3) - s->pc_curr + ofs);
>      } else {
>          tcg_gen_addi_i32(tmp, cpu_R[reg], ofs);
>      }

This is still doing the pc - pc thing -- I guess my comment on v5
crossed in the mail with your v6 repost.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
