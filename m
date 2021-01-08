Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp744329lfq;
        Fri, 8 Jan 2021 11:03:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzCXUpkpFY8lAFTsz0QP+oCei11/jHLaMgcXEGeR9PoCfOf6JCORSWa9IyEKV1PFPMrmojL
X-Received: by 2002:a25:6dd5:: with SMTP id i204mr7693018ybc.78.1610132628293;
        Fri, 08 Jan 2021 11:03:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610132628; cv=none;
        d=google.com; s=arc-20160816;
        b=JkuFrhnksl//h+GAUMVYVuHwvF44JMaaVmT/M34EjaNCd31tHUIFPZRhkGXaFC9n9l
         opM9WyByeW6g4/1x6/wCIDMQdyR3pKTqijHAoQ7XAM14XYJLX6sykFQJ/uttuqMYHaOl
         fOaBRKx53oeMevaTeNSt5THc7V5JJYaWl/E/QpJdlzTM7CAt0ulkV+umd/U/UOLYXOlO
         wTM6dlBo5lgC0+stxVK75ekjsTcs1McGEHHcU5ISU61PeWn8WN3x1JK2lPK6XFrD9YQr
         CcZkh/XhzH1VLF8js59cmfpWTeBv5ayN53Rte9x0Xc6wn9/d7o/56SFzuor4qzvCP+kE
         1ceg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:cc:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:to
         :subject:message-id:date:in-reply-to:references:mime-version
         :dkim-signature;
        bh=jx3HgjgoqCryCu5BbtY+fpsMLc9rC/RAHqSiOqhmIhk=;
        b=SP+gIjQ3EmwznlTsjQOXnSpGje6lT2Krnff+WweTRur+16cEBdM3Bhn93B2A1NI2An
         OZMryEPLPGg5PHo33NU5BTwe1FcwL+CGdaZiODr+N9PPRtth+lbmFHgbJ240JJHWW3bZ
         HwLq6YketjDhaMkDJ7s/TYTqS3l6QNduMLDbeK/XuUqhHf3f2jcUhLg0LjVWdbXSt2Jr
         h7xVgCyB5iaURfKyR3KMrwpoV+6e7+s06Or9jMbjZ9pf8fwSEFl5csbSvjL7XPrtUmsk
         Q9pGa486/PlnkoOd0GypdWhzTdmo9AMSbHG7dwXJ2nIuO6Jj1lmzh6s4F+UFKYDmFidl
         LuGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=GeCm1Fvo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d2si10211755ybr.377.2021.01.08.11.03.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jan 2021 11:03:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=GeCm1Fvo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:42372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxx35-0007Jr-Lm
	for alex.bennee@linaro.org; Fri, 08 Jan 2021 14:03:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1kxx2h-0007Ja-UY
 for qemu-arm@nongnu.org; Fri, 08 Jan 2021 14:03:25 -0500
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:38666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1kxx2e-00051b-CT
 for qemu-arm@nongnu.org; Fri, 08 Jan 2021 14:03:23 -0500
Received: by mail-lf1-x129.google.com with SMTP id h205so25400219lfd.5
 for <qemu-arm@nongnu.org>; Fri, 08 Jan 2021 11:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jx3HgjgoqCryCu5BbtY+fpsMLc9rC/RAHqSiOqhmIhk=;
 b=GeCm1FvoAGZ84OyAJv6cUaw0iqlfVIYninQPjsPFenu5Mfehe//ZuBr27pJSEaJ7DB
 dT/C+0j2rhtqlFM9SlablSxyTTAcjnIk/oJDiAMU5w52VQWCoUPRWpaDbaf9r5ho3yRg
 wr0/JLxClf+EnLRHdt2/jdOPmm1ssaEqh7VPv0wM1xlebRN3WqdA+9LVwlwlf7qUzCl7
 iKErh6dg5RSFzulg44wtf/+euyR4gOqBTYIChsKcbsRq0vqX/CulKsrNVznffNomxE2l
 evWGFJrhwluCMeN8EtkA/DMxckrXVq18I2rMewYIE9rIGqVcyuFFXvxAXRIrrixZdhyS
 XuJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jx3HgjgoqCryCu5BbtY+fpsMLc9rC/RAHqSiOqhmIhk=;
 b=R7VTCcJ6sd6/lN2k3WxlTpRJH9IZyK1eEt0dUNoqmkJBc4IX92QOF8boAWN2PvBR8M
 JQJs2EyFm7CeR12YPziVq8BepnDTdC24SVeTvNn5WMNV05jRu9PrZ9/IpgfD6FeWHhLr
 BqNOOPoMKf2ULh8/EiGaEKvUyCi3fJMiyApfWTdKw09G1DUh0qw2OmdBSzwR9tFFfJXI
 Wxy058+ppMJAucMnPl6crxi3aPmxbMk8KxkijDWvh7tKGc5ix7UFSCwcDSlU/9zJhWr0
 UrLofzohYn67B86hSWWZ0rC3XSokMrmYmbpWzM6g1Gids+sBSuzxEKpkNtQVJN2o7l9/
 mNQg==
X-Gm-Message-State: AOAM530jOdzn9DkEr19NYhmf/Fbs2qvemTQBcP7j0ENo4wAaaFMkXM3w
 1mN2dhtppBz0x+jzGSy4Tlqc0jtsOD2p8jzSTlTL6g==
X-Received: by 2002:a2e:9b4f:: with SMTP id o15mr1933981ljj.393.1610132598044; 
 Fri, 08 Jan 2021 11:03:18 -0800 (PST)
MIME-Version: 1.0
References: <20210108185154.8108-1-leif@nuviainc.com>
 <20210108185154.8108-4-leif@nuviainc.com>
In-Reply-To: <20210108185154.8108-4-leif@nuviainc.com>
Date: Fri, 8 Jan 2021 11:03:06 -0800
Message-ID: <CAGcCb11BFE-LaYdOw0N7STyL+n20GZr6bNz5C0z44JtLS8KMKg@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] target/arm: make ARMCPU.ctr 64-bit
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: multipart/alternative; boundary="0000000000008c909e05b86835e9"
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=wuhaotsh@google.com; helo=mail-lf1-x129.google.com
X-Spam_score_int: -179
X-Spam_score: -18.0
X-Spam_bar: ------------------
X-Spam_report: (-18.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to: Hao Wu <wuhaotsh@google.com>
From: Hao Wu via <qemu-arm@nongnu.org>
X-TUID: r6IXfrFUAwFs

--0000000000008c909e05b86835e9
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 8, 2021 at 10:54 AM Leif Lindholm <leif@nuviainc.com> wrote:

> When FEAT_MTE is implemented, the AArch64 view of CTR_EL0 adds the
> TminLine field in bits [37:32].
> Extend the ctr field to be able to hold this context.
>
> Signed-off-by: Leif Lindholm <leif@nuviainc.com>
>
Reviewed-by: Hao Wu <wuhaotsh@google.com>

> ---
>  target/arm/cpu.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index fadd1a47df..063228de2a 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -931,7 +931,7 @@ struct ARMCPU {
>      uint64_t midr;
>      uint32_t revidr;
>      uint32_t reset_fpsid;
> -    uint32_t ctr;
> +    uint64_t ctr;
>      uint32_t reset_sctlr;
>      uint64_t pmceid0;
>      uint64_t pmceid1;
> --
> 2.20.1
>
>
>

--0000000000008c909e05b86835e9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 8, 2021 at 10:54 AM Leif =
Lindholm &lt;<a href=3D"mailto:leif@nuviainc.com">leif@nuviainc.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">When FEA=
T_MTE is implemented, the AArch64 view of CTR_EL0 adds the<br>
TminLine field in bits [37:32].<br>
Extend the ctr field to be able to hold this context.<br>
<br>
Signed-off-by: Leif Lindholm &lt;<a href=3D"mailto:leif@nuviainc.com" targe=
t=3D"_blank">leif@nuviainc.com</a>&gt;<br></blockquote><div>Reviewed-by: Ha=
o Wu &lt;<a href=3D"mailto:wuhaotsh@google.com">wuhaotsh@google.com</a>&gt;=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0target/arm/cpu.h | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/target/arm/cpu.h b/target/arm/cpu.h<br>
index fadd1a47df..063228de2a 100644<br>
--- a/target/arm/cpu.h<br>
+++ b/target/arm/cpu.h<br>
@@ -931,7 +931,7 @@ struct ARMCPU {<br>
=C2=A0 =C2=A0 =C2=A0uint64_t midr;<br>
=C2=A0 =C2=A0 =C2=A0uint32_t revidr;<br>
=C2=A0 =C2=A0 =C2=A0uint32_t reset_fpsid;<br>
-=C2=A0 =C2=A0 uint32_t ctr;<br>
+=C2=A0 =C2=A0 uint64_t ctr;<br>
=C2=A0 =C2=A0 =C2=A0uint32_t reset_sctlr;<br>
=C2=A0 =C2=A0 =C2=A0uint64_t pmceid0;<br>
=C2=A0 =C2=A0 =C2=A0uint64_t pmceid1;<br>
-- <br>
2.20.1<br>
<br>
<br>
</blockquote></div></div>

--0000000000008c909e05b86835e9--
