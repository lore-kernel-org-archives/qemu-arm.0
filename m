Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp6090979lfb;
        Thu, 10 Dec 2020 09:08:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw+7MrLAXHe9S7hj0PkxvS/mhSw7v0+zJCP/qv4IUAJmWFNezlmKXg+lyi9kv4e4cMXAMNX
X-Received: by 2002:a25:be89:: with SMTP id i9mr11480846ybk.35.1607620132483;
        Thu, 10 Dec 2020 09:08:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607620132; cv=none;
        d=google.com; s=arc-20160816;
        b=QtTiEwyCBGgTZXIyNNgV0RWjABFvdGJAItZSL4R39FtKVIV7Zr13+JjZF1gh9Bm1xx
         o9HdBbj12ka7Oc7troHxIJLDTiGmxJMojjyyZ0Q945VRqzBQm6ITBzWVfHQU45ikaXr7
         LEShHHEhp0HEXpM9HANvONUwbXLlQF2nh6VTg57LyFW6SvOGEREtxICQwXBxsPeQXpd7
         XfGmZeLlyA9iPX9/iAWqDWe8NMFiKQo0iX9OCiD7fj3EqKt+rnx2OBGU4E7t4utrQbnX
         chgdyUBd6CBPbP4d+oKtLSguAA/9rWt/xpXl5PNPg8fQ+QvFugDP3LsPGY794MuG8BI5
         dfgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=uk/W4SrdbhM8HJz81c2x1XeC5dGv7Mig+9zyU1Cpmg4=;
        b=wFnad26jZbR7pMRV1EOAmsasMgHFwjwfzpODujcezTKJkqmYGJQaBw/Gn5bUAfaJ0u
         0nyLEJXOewZ06uw2ro6b0lBAlnK/NCjBDbZKHKQYm3yDPOFd5gGhLQj34NZCx7sKmO2X
         USmPvOVu6N3vhtFP1HrueraBA0HS3Sxdbb7mGAxf1CH7XDImF06nowiV1VxpTDD+X6y3
         0TpHJ6wbFh5HoVflvjEges26DuUJox5gz4df1+TamB7igGzHc2vL5mINe/gRtj8gqVby
         1G7uUabcNanSklUzlSXyyKKVIJtBoc3gaZmnck8DfD8M64Yzo/suFdMxBltonK0VL86r
         l6Ng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="g6f/Fse9";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i70si5279879yba.276.2020.12.10.09.08.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Dec 2020 09:08:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="g6f/Fse9";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:33638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1knPQx-0001yn-QQ
	for alex.bennee@linaro.org; Thu, 10 Dec 2020 12:08:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1knOz4-0006RP-Dx; Thu, 10 Dec 2020 11:40:02 -0500
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:38843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1knOz2-0004Vj-FO; Thu, 10 Dec 2020 11:40:02 -0500
Received: by mail-io1-xd42.google.com with SMTP id y5so6156648iow.5;
 Thu, 10 Dec 2020 08:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uk/W4SrdbhM8HJz81c2x1XeC5dGv7Mig+9zyU1Cpmg4=;
 b=g6f/Fse9YjoR6vzgV3mdXzKqEX6k9SRPeJSkzXoITycYuPKWnqTx0CpgRBpZuexKZT
 wrdIC+D7TcGPh+yWQlrr2uUWZSn9AIAJ5Vzar22Ylkh/3hvAqyv29HdiWF/JmSQIwlPf
 n+ubc61Tma2git5He9q5GJnij96JZAJhJdLS3YXLp22/NaUbvMZO1BiPgxDNDN6Gx/s+
 LXHKCjV37c4HqlNuLe10ErzLKUhBEFvzXo1nVgX5oGpwJfIsTdrS1+9snNq5KPQMc0bY
 IuApv+8bkyMCjVqK1UG/PpE3WStvLnSbaxhPzrISU0F5EZzVhhZ0k59zI/2ZCTuQwDZ5
 pQqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uk/W4SrdbhM8HJz81c2x1XeC5dGv7Mig+9zyU1Cpmg4=;
 b=ajIhme2+M+L81PB9XLEz2mtT2Ea85lKWHGUrFre9y07+JQQe2CktV265n+yAyUyywL
 TeHv47iWLRdm5UNx9qObd+vRjoqoIc8s08uto09g5laVUWSNFXhvdz+GeHfEP1U9zuc6
 FAzBJRDXJMhLfESqed6vSo3fOw1VWwxG1b/1BSCPEDpB56nuMN4tmaCMr5aNw8EA+lx8
 c0JAv9CY5XCM+4w2do9TDXHpyKZfwhgUt23TR/90+Hj46VFxC1rxwkNfvw1XZTdfZJv4
 aNFiVK77esNH+j7cX8iaK3Vinw3RKkndbLeLlMONbLnsklwrogig66PCBXgA/Q2njU/A
 Zq5g==
X-Gm-Message-State: AOAM532og2szzxZB2nfwYNg2QEDkDVy6pQIUafb/ahWgvCuDZI7lu6Vb
 FgeJOPj1/etYCyPIbnduvGa4Jb2Obwg0c/JKqZ0=
X-Received: by 2002:a02:a419:: with SMTP id c25mr9467558jal.91.1607618398980; 
 Thu, 10 Dec 2020 08:39:58 -0800 (PST)
MIME-Version: 1.0
References: <20201210141610.884600-1-f4bug@amsat.org>
In-Reply-To: <20201210141610.884600-1-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 10 Dec 2020 08:39:32 -0800
Message-ID: <CAKmqyKN7OMipCzi-B+qNJb_J--ontKzpwX5J=rQ8zye3tmYePQ@mail.gmail.com>
Subject: Re: [RFC PATCH] hw/misc/zynq_slcr: Avoid #DIV/0! error
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d42;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd42.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Gaoning Pan <gaoning.pgn@antgroup.com>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Gaoning Pan <pgn@zju.edu.cn>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hE4pgQJqopQp

On Thu, Dec 10, 2020 at 6:27 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Malicious user can set the feedback divisor for the PLLs
> to zero, triggering a floating-point exception (SIGFPE).
>
> As the datasheet [*] is not clear how hardware behaves
> when these bits are zeroes, use the maximum divisor
> possible (128) to avoid the software FPE.
>
> [*] Zynq-7000 TRM, UG585 (v1.12.2)
>     B.28 System Level Control Registers (slcr)
>     -> "Register (slcr) ARM_PLL_CTRL"
>     25.10.4 PLLs
>     -> "Software-Controlled PLL Update"
>
> Fixes: 38867cb7ec9 ("hw/misc/zynq_slcr: add clock generation for uarts")
> Reported-by: Gaoning Pan <pgn@zju.edu.cn>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> Cc: Damien Hedde <damien.hedde@greensocs.com>
> Cc: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> Cc: Alistair Francis <alistair.francis@wdc.com>
> Cc: Gaoning Pan <gaoning.pgn@antgroup.com>
> Cc: Mauro Matteo Cascella <mcascell@redhat.com>
>
> Alternative is to threat that as PLL disabled and return 0...

I'm not sure which is better, but this patch now is better then before:

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/misc/zynq_slcr.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/hw/misc/zynq_slcr.c b/hw/misc/zynq_slcr.c
> index a2b28019e3c..66504a9d3ab 100644
> --- a/hw/misc/zynq_slcr.c
> +++ b/hw/misc/zynq_slcr.c
> @@ -217,6 +217,11 @@ static uint64_t zynq_slcr_compute_pll(uint64_t input=
, uint32_t ctrl_reg)
>          return 0;
>      }
>
> +    /* Consider zero feedback as maximum divide ratio possible */
> +    if (!mult) {
> +        mult =3D 1 << R_xxx_PLL_CTRL_PLL_FPDIV_LENGTH;
> +    }
> +
>      /* frequency multiplier -> period division */
>      return input / mult;
>  }
> --
> 2.26.2
>
>
