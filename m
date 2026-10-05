Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84074CA5FCE
	for <qemu-arm@archiver.kernel.org>; Mon,  5 Oct 2026 09:19:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDeqL-0007JY-Is; Mon, 05 Oct 2026 05:18:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xDeq9-0007IT-Vd
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 05:18:34 -0400
Received: from mail-yx2-x2b.google.com ([2607:f8b0:4864:41::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xDeq8-00040t-5l
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 05:18:33 -0400
Received: by mail-yx2-x2b.google.com with SMTP id
 00721157ae682-8af5397f0a0so2068867b3.3
 for <qemu-arm@nongnu.org>; Mon, 05 Oct 2026 02:18:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791191911; cv=none;
 d=google.com; s=arc-20260327;
 b=XoGqXbs9nnVpIRyooDpLHebKinMliBkMoFdzdR8aA7eK0VKbI2WO9S5jOX6fVaN6Nj
 owWdrpziY47CXwezg9kTVmxVOCDYoIub4GmJivZ/sxdyYlUekVY615lce5eLn8x1FjPK
 WFNC8FCuJQ12v5avNWrboxuH/kZ5SRiutdpdZjDqSEtTcnRdNn+vKakSb5/jprCe80BJ
 9w8uekkGAggQuVRcRZaTtY0LBfLxvOKyO4vs1H+PamXk4UcotAo6CMEqRgwBessjBwB0
 Uxc8wig878VuQO/d2oVFUm+9Zb/Pkx2sq+i66iGmGEAkJ31erLI5s7kMK4NlohWylbzn
 XZKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=UpwCXd6XmIrFOY9h2iXrcSniKBp6sSDaPVEm6KEbgrs=;
 fh=kpAEcpMhbsM2zrHTRhgmRtwqSGjEPS0wXfdyQE1flPU=;
 b=ePkoB+p9mzd9LEdOyS8isUpaQHEVQd3XPSUFN/FV+X/7PCo/g4wAgF59VxbSoSV55F
 haFqe8tm3v1Hgsw49zwUjigNpPnno5lvPxGURWqM8RJw+TzhXjwfoQ6CAsrvXYYWlqQX
 rGXilUiH6Sh6LPeNHyoq1Fyixj9BhbFANGegs3/Q/zgV9fiBNe6x9YVkoSpVx6z0bG1+
 ovzRyJ5Hf9VYLQZjgOXEpR1xU2HzzfEEGZbIe+RS1ae4NqhvdmaYmZS3rco7uaXkT+9T
 J3I/py+B5msc+PS4T2+UoEN1VmpFiYWQy76wvo2wTFLg0wfCSm2l4YGowmSg1769x39g
 KgnQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791191911; x=1791796711; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=UpwCXd6XmIrFOY9h2iXrcSniKBp6sSDaPVEm6KEbgrs=;
 b=aBLOCo6cagd7n8Kwja07rD/IRSkNI4YEJeM/ehtrZvOfJNFOKHQiXgTGIlVH+nTO5l
 xE/DXTk9IkrNY01hX4FbYhHQFBWze2NjQyTgvD+y86UOmz63/OrhDBEPczNNF8IzCtsz
 OyrxofoKrBmcAhwNN3O/0YkHPjQxXbcyNzJPHkQp9hNnC8bY4xhyYMaU9g0RKQxg89pZ
 fyTLTM/JnFDWZI8Q5BB7AyYfFzDMp07nYz59NNofVh99KhUNXxC+lsq+G6eKj7iTjqK2
 94j6IBR+A4Cu+nCwLsvbtuaZGp9gO0IDxk7usj1Yr4r/JuyQeqH2aP2SSo21+cYnccJZ
 buSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791191911; x=1791796711;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=UpwCXd6XmIrFOY9h2iXrcSniKBp6sSDaPVEm6KEbgrs=;
 b=TDWZ7Tnvwg+UOrxcTEKgicFL8Ls9kiLZ1rEJPHuBV0AMSRSdwc8X/A+G6kXsO27JE8
 aUUu5H+JNHmUI226o8opGPIkKpX+0izJvE20YzYa3B8gZaTcBIgM1XFM+bfxxnjOqQZ9
 7UF90/bdAaOoiwWiM/hnaVvO32YYhjoMlEM8u7e2L9WGJ+93wmNqWQIrn5arzioQud/V
 rlqxvBJ3O72WHB0mGaQ1WJ9KHH39WmrFs/gKkO7DOyFmqM+SpbWfOwAZZ7K3sKPLd4hS
 4FzhJGKwhhpNpAm8uts8x8dTZijAV0UGlNe1D1y683ynWBTXkdT8L7aMJTVr1HNDocuK
 TXZg==
X-Forwarded-Encrypted: i=1;
 AKwUvBy3tkGgQEwT71CWQgFX2VfMHcKXo5/dAm/Yk1GVIlQMjrKBgSL9XtbXKsdTPe/KjdnVrd2VzNycWw==@nongnu.org
X-Gm-Message-State: AFq9FYIPYOw4h7Df/njd2A9DHu6kyfhWz1B/acZTO740tSTO/m8O5s+a
 z6ISWy/LXcC+vi+uTZcPSxesK6EUOBGZkR+hMimfKKE8ZWc3WpBujUq2Z2sVPSRABUcJgr9pp8J
 zV4ckPu9Er1RBIQfhWu1GCkpjKLJzzKq1O6hzoR92Wg==
X-Gm-Gg: AYBFou2Ni0GjgGJDDh0r0oAPK8+v5DVMDpoUc4bbK+xOv4I4IH8ux6zaJWRjpHTG9pw
 nszb1pSeZE3Pu8nWtrz4AO5lcxkNQtJOQ2OD3KZz1tVzNZtwUSkdbOiNo/FXU3UP1wcDBcnLM1B
 YW/bt7qIZifEonllf5m0HtUmrq5GnLt10L9kghrdMPWdtPWPAu/N/ftS/27z6uN+8PefApXQgbb
 qcpaemozN5a8Tq5rI9Or9yNghcimiJzaAqQfaq4MYIODperc2wNiONDhM0xWFNM8Qweuao5TUFY
 A5FC0/TxlcfnvIWAQO7inNkSvbzCtkZkxNMZFmqohsV2b4SCYhrIWfXRs3mSFKsWrB5fzafsGI6
 pTUCtaUtaXWSw/Or7Ooy1QJhQMRZGL2JcLOPzlL8=
X-Received: by 2002:a05:690c:ed6:b0:8ae:81e8:a719 with SMTP id
 00721157ae682-8ae81e8ae1amr26929087b3.62.1791191910673; Mon, 05 Oct 2026
 02:18:30 -0700 (PDT)
MIME-Version: 1.0
References: <20261004-issue-4560-v1-0-ccbef537cbeb@redhat.com>
 <20261004-issue-4560-v1-32-ccbef537cbeb@redhat.com>
In-Reply-To: <20261004-issue-4560-v1-32-ccbef537cbeb@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Oct 2026 10:18:18 +0100
X-Gm-Features: AclHuK-WKMjyk8tdK8S9BZgf3HecTb4v29EwNrraYxBflF4Uz8__xqWN0v7he8w
Message-ID: <CAFEAcA_piHxiTAqzHmvFW4JY01kHFnh9cUg9qiLe5om=8xBg4Q@mail.gmail.com>
Subject: Re: [PATCH 32/63] hw/char/exynos4210_uart: enforce 32-bit MMIO access
 size
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org, Pavee Hui <phui@google.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:41::2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx2-x2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Sun, 4 Oct 2026 at 11:25, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> Set .impl min/max_access_size to 4 bytes so the memory subsystem
> synthesizes sub-word guest accesses into 32-bit handler calls. The
> read/write handlers ignore the size parameter and always operate on full
> 32-bit register values, so without this QEMU would not extract the
> correct byte or halfword from the result.
>
> Reported-by: Pavee Hui <phui@google.com>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  hw/char/exynos4210_uart.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/hw/char/exynos4210_uart.c b/hw/char/exynos4210_uart.c
> index 7240ff7b5c24..8774d4bb43d7 100644
> --- a/hw/char/exynos4210_uart.c
> +++ b/hw/char/exynos4210_uart.c
> @@ -506,6 +506,10 @@ static const MemoryRegionOps exynos4210_uart_ops =3D=
 {
>          .max_access_size =3D 4,
>          .unaligned =3D false
>      },
> +    .impl =3D {
> +        .min_access_size =3D 4,
> +        .max_access_size =3D 4,
> +    },
>  };

This needs to come with more than just this as a commit message
and change. What is a test case / situation that failed here?
What does the data sheet say? Etc.

thanks
-- PMM

