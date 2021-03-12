Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1196348lfg;
        Fri, 12 Mar 2021 04:45:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx1XblAygfgiPc5xX/bkcX/yWDM8Xu3zMWTK39iI/0mtN3Ns5LTrYt++lm0V+/c+j4aS7Xi
X-Received: by 2002:a05:6638:1914:: with SMTP id p20mr8124335jal.92.1615553099965;
        Fri, 12 Mar 2021 04:44:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615553099; cv=none;
        d=google.com; s=arc-20160816;
        b=zdlQrq7e7urobjcFRAGyZ3wXW1a1QLb2QMqnH2Y8qhXlsImfyQz4+AZV9F5G2n6QdF
         TqbJjpwh/hc87X0odZY7NdE0rK+UnxgS6D3YEthpNgpx1+aEZG1Wi86iYzxFPz5Za1Xa
         bBdMCZ5cLlVonk6nECp1XPJ6M5Hu7MXRu1Xpq8osuKslm5ZU/uzwaAM0wpUmU/yAcCxG
         6ujq0CE4bESqQflGgQGE9NNF8E/TOVexsNn+FRZJaLDql2NTQ+eai1wJEB1aL1aljHzp
         oabZ2oYyzcQmn8lNLCPQjML7De7Pko3y92vVWTpIQlCo4C4Lu3EAH4nHsbFiZVHvLVVV
         GnUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=95jfuNOZfztYyEUpdxbTtvXx7P4QjryGzam85CUFeQU=;
        b=rUlZXJ0fv6/l0ywKVVhXKb9ym3Tm2zIrqLQjQ90+xgIvPgQuUKSPFCM/t47KSt6vuO
         EFjPp0tqg+UXgABqDSyO+jN5hxQTDrGjwxVV7eX9eRiS+i9ANu4R3v3kc46TZi36mVWZ
         1dyDCdwetC9yUVqrywuwoEIXLjzNgaaAqaBRwVvH3WyFLRkZ/sIIRldMD32UBS9heijW
         Ss3vemo43fqQQ+adyHaslLYwvHUE9mKU1kiJkvHMpn10TRlJw/LUom3bv3HWuh7bYEMu
         Vrk4n+FDhJzY+a0qjpPZEpTlJUlhJzq/y3nsA2p2nAbQ8+GNXceWNVJ16SZ/DVUmtlmR
         TVmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=inbwutkD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s13si5741526ilu.57.2021.03.12.04.44.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Mar 2021 04:44:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=inbwutkD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lKhA3-0004YE-7y
	for alex.bennee@linaro.org; Fri, 12 Mar 2021 07:44:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKh9b-0004WV-Qx
 for qemu-arm@nongnu.org; Fri, 12 Mar 2021 07:44:31 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:36111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKh9Z-0003qE-53
 for qemu-arm@nongnu.org; Fri, 12 Mar 2021 07:44:31 -0500
Received: by mail-ej1-x632.google.com with SMTP id e19so53191724ejt.3
 for <qemu-arm@nongnu.org>; Fri, 12 Mar 2021 04:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=95jfuNOZfztYyEUpdxbTtvXx7P4QjryGzam85CUFeQU=;
 b=inbwutkD+Uv3IFqxwT3oH/0lLTR1ao1VFFDU4riNU2UjkIxXaBdhMKwLsbXeNFE07v
 BEGXSInhpuwm2Xqi5+11ewNtRPoIXxCfAnhT8ZP+YHzFmYJTHIWkXWSkKqkZ+Z4hyDt8
 DJBhTTLgCwdEh2fqn+7F0HSOThuwjVPrgzKjTL8bKijskh4zLshYWL8R4rT38aoC0nW1
 ze1FAvNS1wlUjtNTOARMPsHpopgJVf2elCGdJOy2m2xQlfcJTCMwcl4FMnbGqrPybcTO
 EhRKFbnJh72fcW1TssVMoiUM5HGCNBDXMZNHy/4K3ZSw11gxGq1ppkOBPZMrNirvW2qT
 qoBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=95jfuNOZfztYyEUpdxbTtvXx7P4QjryGzam85CUFeQU=;
 b=nJzypnppPyi9Y5CZzwlmvrVuZ4x7NXHl3JouU0l9fzjwJXIJ8tMOn2KCkeFxXcRXqD
 TgBzOOBftfuLhx0rfgyp+GkOtECxV8QTm2KCiG7YVZJqtVb4OrTTbQhOjv6mM2Zs7kuB
 t2Pzgd3gNkuTn2O+ZLc+7E1lqIDvUZfO+3EXmHgzsmlMA+cKBynWMlxL6kpQ4cbL0KZ4
 1CsXTRLB1cgQQu/KAUU84n16pMfVqgoeO17ArORhJ346/lBRHTUuymKlKdQbP5uUK7AY
 tDx1J1UT+q+nWHPeK3+oofdcZ+quo5PsasNkroX2ky5+/RWRWUHJmXMpzLfZTnC8F/54
 FDSg==
X-Gm-Message-State: AOAM530sGUQJgB7XENOre8CT0YhRnEriGFaAmjhAXTr9d988s/ddVyMp
 6l98AMO1GE+icPnM+LCwLFNK2qv71y77tJyHowD3mA==
X-Received: by 2002:a17:907:10ce:: with SMTP id
 rv14mr8474230ejb.56.1615553065995; 
 Fri, 12 Mar 2021 04:44:25 -0800 (PST)
MIME-Version: 1.0
References: <20210312001845.1562670-1-f4bug@amsat.org>
In-Reply-To: <20210312001845.1562670-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Mar 2021 12:44:07 +0000
Message-ID: <CAFEAcA8FsxO01NQntu8XVQb2w-0Scjpxv2Lxg-p=dKsNvc_9Vw@mail.gmail.com>
Subject: Re: [PATCH] hw/timer/sse-timer: Propagate eventual error in
 sse_timer_realize()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: K+fv0fWn4loH

On Fri, 12 Mar 2021 at 00:18, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> If the SSECounter link is absent, we set an error message
> in sse_timer_realize() but forgot to propagate this error.
> Add the missing 'return'.
>
> Fixes: CID 1450755 (Null pointer dereferences)
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/timer/sse-timer.c | 1 +
>  1 file changed, 1 insertion(+)



Applied to target-arm.next, thanks.

-- PMM
