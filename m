Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp815707lfq;
        Thu, 24 Feb 2022 02:19:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz/54ptvgqhpi0xZVNxtg0ct5dwQVovvlpUxxaeaVRT0YZ7rzYrZwTXSPZglgn4gU+gQ0M4
X-Received: by 2002:a37:6413:0:b0:60d:d60a:1368 with SMTP id y19-20020a376413000000b0060dd60a1368mr1106286qkb.181.1645697971372;
        Thu, 24 Feb 2022 02:19:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645697971; cv=none;
        d=google.com; s=arc-20160816;
        b=Z+d0a4M6vBdnau6d0StZjW319oT2UB9/mzZZ6xM7ehPYCTSVkgPrxOyE90MvArMUdw
         3U1/vc6YutIeXCFuvKwTxHHmJMPz8FJt2G2EjaNsted+aecezgx0G7cTUwGeUbkuoZdv
         sdzR1MO3p2JbS/xMhFjMStmOxkzxYwJM9IIn+Nt2oC4KuaXbhXZaHHNxIkPemTD2QXE/
         qJZFT5Slh/nhW19E71ZZTfCgTp17CkQLLH8QcHCGCv2WIrSLkvELM71U3VEwoyJSiaqQ
         DkbBQREjITETKy0kV7Ac1PP7jkbdsY2z+OKtiogoMQCSOcUqTw2PlgwCsseQvT6E52NS
         p2Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UJYn3pOS3/msclUqYjE7wllJeGnng9iJtqC8LQBqdh8=;
        b=eEII0gtWIvmSj4v0NFvWK6ozKaFS1gL0UW8DyFgx0GEU9zdfezX9/BSeLk+kKSzAB+
         eHMmdvgOxfYa4tQqkt2jqaWRCG1S0BliPjp9JGbH+KxHhC6c//FrtY1FVMTu0ejVRY7n
         14dZrhZ/ulmYChlxAlyGz+iqrqVN5XCxJJ9PYyLw7ZodW9c2sL4O9E9TJ8T5KiELYZvc
         T5S4jkRsp+YmOzOPC5IByF1FK+zbk0H1VkUrEEAZ9nWJBMhSyWvma0RuIzM2Tskqb/bh
         V17di5U+5hTYpajmPN1RiJEsid4zds5vbG37IoL7SAmSFh3Xtwa3k98DMuQqDV6KfafI
         tNrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bX2Ss4Vu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ay27si1129704qtb.83.2022.02.24.02.19.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Feb 2022 02:19:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bX2Ss4Vu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nNBDe-0002SR-Re
	for alex.bennee@linaro.org; Thu, 24 Feb 2022 05:19:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNBCu-0002Qb-0V
 for qemu-arm@nongnu.org; Thu, 24 Feb 2022 05:18:44 -0500
Received: from [2607:f8b0:4864:20::112c] (port=36861
 helo=mail-yw1-x112c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNBCs-0000Sc-FW
 for qemu-arm@nongnu.org; Thu, 24 Feb 2022 05:18:43 -0500
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-2d310db3812so19367247b3.3
 for <qemu-arm@nongnu.org>; Thu, 24 Feb 2022 02:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UJYn3pOS3/msclUqYjE7wllJeGnng9iJtqC8LQBqdh8=;
 b=bX2Ss4VuUKVOd7qYN562iGgZgjDx7ySUxSeyMapX9qUZAYobMrX1+E4oYNodLskz6U
 mgTlwLqYQgy3o4UNHdyYKX/bhYab36Ce5VXJNAqksH11JvR+4ZSS+/K6lgc+R3p5lEiu
 x4E0ByuSXQooA+JcCM1qo5xujvAPuwttefRuGHQDPMfxU7o1SAbISP9NmZComaTHKtY0
 Q5QadHf1mDR2DxkTLsA6sydjdQvNBry3G674s9x1mTpn6b18S0DPy0fI0UzSqDWjIxcB
 TT1mYySZQSt0c733VC7Rs0rnnBHhxZjdKOnC2ATStE9h/QFJi9Gsu8iccYa/9Sc1IXvp
 HNUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UJYn3pOS3/msclUqYjE7wllJeGnng9iJtqC8LQBqdh8=;
 b=aDFBXN5gzyfEvWubX+5hI++KvZYRKGzSvZaWpS6SioUl5klNrUy19mrKNoNVvhj+Af
 OK7Q+mUW0AX1M/ZpqvCkzZuJD7EzLKIAn7Hw8TL2j/lHCbOn+1jWxmNHo/Eflx5X7xk5
 BegtO3/3MZq3asTWdSdPy2oI8q8bE/NuaghbXE37JS2dr6lL/sGnUsdRLcJ7CppCuwdf
 pv/K82bQj/UzRGFPYyQNBW6dHzTooW82KAsRPjr1GbqdaIxNYvJKJjfZ9PK/ZlGLOfV8
 YeuGdaQS0PJmj0Pn0NVbQJ1JQhWHwgX0ujXu3iXksj3S1Z+Ec2yJX2kOxgxnAMhv4njj
 ckIA==
X-Gm-Message-State: AOAM533ROvhd/P7lIywlIkNY/rhusUWBtxEuEhMiKljohSoGNS4TMB3D
 zb/HOwk+pGv2RJV3viQ8Uf7skR0+W7b5EAeZZnkWYQ==
X-Received: by 2002:a0d:f603:0:b0:2d1:57e5:234 with SMTP id
 g3-20020a0df603000000b002d157e50234mr1707535ywf.469.1645697921500; Thu, 24
 Feb 2022 02:18:41 -0800 (PST)
MIME-Version: 1.0
References: <20220210210227.3203883-1-jimmy.brisson@linaro.org>
In-Reply-To: <20220210210227.3203883-1-jimmy.brisson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Feb 2022 10:18:30 +0000
Message-ID: <CAFEAcA8YSWNzwBS0eCkMD933O3QGT5XejGKXZYkfyeWc8M_vVg@mail.gmail.com>
Subject: Re: [PATCH] mps3-an547: Add missing user ahb interfaces
To: Jimmy Brisson <jimmy.brisson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: "open list:MPS2" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1a6WU3wLimas

On Thu, 10 Feb 2022 at 21:02, Jimmy Brisson <jimmy.brisson@linaro.org> wrote:
>
> With these interfaces missing, TFM would delegate peripherals 0, 1,
> 2, 3 and 8, and qemu would ignore the delegation of interface 8, as
> it thought interface 4 was eth & USB.
>
> This patch corrects this behavior and allows TFM to delegate the
> eth & USB peripheral to NS mode.
>
> Signed-off-by: Jimmy Brisson <jimmy.brisson@linaro.org>
> ---
>  hw/arm/mps2-tz.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
> index f40e854dec..e287ad4d06 100644
> --- a/hw/arm/mps2-tz.c
> +++ b/hw/arm/mps2-tz.c
> @@ -1078,6 +1078,10 @@ static void mps2tz_common_init(MachineState *machine)
>                  { "gpio1", make_unimp_dev, &mms->gpio[1], 0x41101000, 0x1000 },
>                  { "gpio2", make_unimp_dev, &mms->gpio[2], 0x41102000, 0x1000 },
>                  { "gpio3", make_unimp_dev, &mms->gpio[3], 0x41103000, 0x1000 },
> +                { /* port 4 USER AHB interface 0 */ },
> +                { /* port 5 USER AHB interface 1 */ },
> +                { /* port 6 USER AHB interface 2 */ },
> +                { /* port 7 USER AHB interface 3 */ },
>                  { "eth-usb", make_eth_usb, NULL, 0x41400000, 0x200000, { 49 } },
>              },

Yes; we implemented this against the revision B of the AN547
AppNote, which had an error in the relevant table. Revision C
of the AppNote corrects the docs to follow the FPGA image behaviour,
which is to have eth-usb on port 8. (I sent a patch the other day
that updates the URL in this source file to point to the latest
pdf rather than the old rev B.)

Applied to target-arm.next, thanks.

-- PMM
