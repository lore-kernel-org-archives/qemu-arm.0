Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2355303lfy;
        Thu, 30 Jul 2020 01:44:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwuNgBq5OZggavyVPbYc2tQMD/jBEYt/d4u7jzx2h2QRPZ+bBiUU9YAWY3N8UtmkWHCztFp
X-Received: by 2002:a25:61c7:: with SMTP id v190mr2661438ybb.168.1596098689981;
        Thu, 30 Jul 2020 01:44:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596098689; cv=none;
        d=google.com; s=arc-20160816;
        b=SG10kxFHZgtG3hUzan+bRLWHMDUKodgQzsinK6ioEzcyJoUAjsUG7gSiLCO4wR0QuR
         SWHl9iJ6klsAQ+W14qsG7CWEEHvTJYw0oVm7JrH2LSBB0E0OHZ7JIfMZZ1rvnyRdvlN1
         LMvtBOKvn6j4QQJoCf/MzYpGAe0jOUg/8b8eSmjw6zi3T9HKJTiw3EuUt7nfgck3hVTL
         qYnO3CoLn43NMQ+phWrFPzU7esl1Oh0oBAQUIQ1RpfttNLTO8xeTHPQtyfMUD6hkkZQ3
         qrKsYKX8n9XA/xCDcP6syvorecKS0grH1pdBePzFrxeFxjmyO13I9jWd0PD+YWA31Z3t
         Do1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Mk3XdEBa9UC5cwSV0q0gojpp0/4NYI0IrnvAqfNaKDQ=;
        b=ByiZVyPN6gsat1eOzR2Y78O2g3p07L66/I9eYsr/DUNLRStwVbY0nk0nmZloLffOqG
         JageIfTOyLqhWHz7Hgk5jRCNXAAKtq8ARg7K8zWAOhfpTpQGPkhyiPTYWt5HSzmrGzK8
         SLSe0ZWEUFSmhEFYScLdb09swDXudO25rUvVI0yJ/1pD//lzne+y/kGv37evU1TIXmx2
         F4aP7JWOCGSUkRDMBgtrqM5OY+GNsVvgRsO4c4qFTQ+vNZOhdqd384i6mrXfcuvBorjV
         S5RULmbLzxdHeollZ7iJ0G/NayZH1tQ7f6adz0UEpbRMTU2/qAFXxmrw3DMCnzpz0c7a
         FXQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="i/ekReEC";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k124si4283657ybk.371.2020.07.30.01.44.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jul 2020 01:44:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="i/ekReEC";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k14BF-0006kO-D9
	for alex.bennee@linaro.org; Thu, 30 Jul 2020 04:44:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k14B7-0006jZ-S6
 for qemu-arm@nongnu.org; Thu, 30 Jul 2020 04:44:41 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:36971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k14B6-0008RQ-28
 for qemu-arm@nongnu.org; Thu, 30 Jul 2020 04:44:41 -0400
Received: by mail-oi1-x241.google.com with SMTP id e6so2913641oii.4
 for <qemu-arm@nongnu.org>; Thu, 30 Jul 2020 01:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Mk3XdEBa9UC5cwSV0q0gojpp0/4NYI0IrnvAqfNaKDQ=;
 b=i/ekReECz4IKe77bsIi7croPi+I6TLyVBu7nG3Kil+mfu8vmAMVvzCO0w87pwQpdLs
 87+YpU+r6kmHHFVpUhoPhkC/WSeiIn6gr10dmSBk/cz3KtiwDqzS0RVnaqKxyP7uASbG
 T8ZkcRg6ALzS/QGzsKgmUdHLHcDxUs9SMC4c+oS0d/lt3bdJnwv6hT8sQMOtF1Wz61z6
 mNdP7ovN1bDwAQkCA3s3cv/cXZCKGN95Ml8nDIlY8tc87NtU/xagOwNL+X2kfm2E+ut+
 b8vRbNgsvs63kSCWRCSdJ4snz/Qla2x/fa/gWR8PMK793jvQDT+TyR1VvZfv0j450v2J
 wBng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Mk3XdEBa9UC5cwSV0q0gojpp0/4NYI0IrnvAqfNaKDQ=;
 b=mqkK/u6CbEsvPZYT2kRfBqke7Xy90v7GjErPuQjj8iCLXo16vYtwH2/Wu9WrLORAe+
 RJphcGE/o5tlQL1pfoJm4HCOwe/m/dJD58Q2s+YwycPJ3TR6GRLV36cdlmsjtS8tcZ+z
 66oG4qby1VdE/NuMCFyf+nGLvCDi8JBaU+6u+azuTJ26vgoZpjDOk3lgR0TK9YYIUK23
 8tRj6Mp8np0iOwQiQwABQRAofBJ4oEABLlyruD6wm1qRLMIPe2u2E73lt9sev2/Qq7xk
 gct9ANmP2WXH5UODIuAvFMCUBGbNhJdPkwYCn9OIP+KATLClhUOIwB5SdwKszK5V8Fqf
 VVCg==
X-Gm-Message-State: AOAM5329CzJ92CKdu4MJdEgngjiJP/BmkKtyDF+tcwtrxiazeMPu+zSV
 /19Z77qNgsxB/gJGA4jZJ3Kq47gRiu2a8X0vA513pA==
X-Received: by 2002:aca:48d8:: with SMTP id v207mr3869003oia.48.1596098678301; 
 Thu, 30 Jul 2020 01:44:38 -0700 (PDT)
MIME-Version: 1.0
References: <1596074182-4920-1-git-send-email-likaige@loongson.cn>
 <1596074182-4920-2-git-send-email-likaige@loongson.cn>
In-Reply-To: <1596074182-4920-2-git-send-email-likaige@loongson.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Jul 2020 09:44:27 +0100
Message-ID: <CAFEAcA_ZgrkcpwYZD-stZGDDjhTgMOSLx--9KHPnxfbKz58s7g@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/arm: Fix compile error.
To: Kaige Li <likaige@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x241.google.com
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vMutdeNf4l64

On Thu, 30 Jul 2020 at 02:56, Kaige Li <likaige@loongson.cn> wrote:
>
> When I compile qemu with such as:
>
> git clone https://git.qemu.org/git/qemu.git
> cd qemu
> git submodule init
> git submodule update --recursive
> ./configure
> make
>
> There is error log:
>
> /home/LiKaige/qemu/target/arm/translate-a64.c: In function =E2=80=98disas=
_ldst=E2=80=99:
> /home/LiKaige/qemu/target/arm/translate-a64.c:3392:5: error: =E2=80=98fn=
=E2=80=99 may be used uninitialized in this function [-Werror=3Dmaybe-unini=
tialized]
>      fn(cpu_reg(s, rt), clean_addr, tcg_rs, get_mem_index(s),
>      ^
> /home/LiKaige/qemu/target/arm/translate-a64.c:3318:22: note: =E2=80=98fn=
=E2=80=99 was declared here
>      AtomicThreeOpFn *fn;
>                       ^
> cc1: all warnings being treated as errors
>
> So, add an initiallization value for fn to fix this.
>
> Signed-off-by: Kaige Li <likaige@loongson.cn>

What compiler version is this ?

> ---
>  target/arm/translate-a64.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 8c07649..910a91f 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -3315,7 +3315,7 @@ static void disas_ldst_atomic(DisasContext *s, uint=
32_t insn,
>      bool r =3D extract32(insn, 22, 1);
>      bool a =3D extract32(insn, 23, 1);
>      TCGv_i64 tcg_rs, clean_addr;
> -    AtomicThreeOpFn *fn;
> +    AtomicThreeOpFn *fn =3D tcg_gen_atomic_fetch_add_i64;

NULL would be a better choice for a "this is never actually used"
initialiser.

thanks
-- PMM
