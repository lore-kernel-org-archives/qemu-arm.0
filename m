Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1237120lff;
        Wed, 18 Dec 2019 11:37:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqwpPlkx8ydsFEtg/mB3whjSIruWB8YNXeDVr35N7k7b3nZp/SrQjiXvUCVEeYHZh3MnqY4z
X-Received: by 2002:a9d:7a88:: with SMTP id l8mr4543576otn.187.1576697835387;
        Wed, 18 Dec 2019 11:37:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576697835; cv=none;
        d=google.com; s=arc-20160816;
        b=vL1B4TwctRflCAdV/pyoadBQ4xiZtBvlvs5Fmd3piU9oEe/zllKcgziE9bYsT4LoWS
         UAQdsNQ6HtLjtAN7sADTcss16cTXhmGEunUxGc+dQngLcxKt0s5e3Rzh0VeZ+8wZaERx
         ndqcOX7ldjLcjHi0alQvSDrj1ZLQOCuLH2THbM07B5cc2bRHR3aZ2GBKhK5KfMjI/5ck
         I+ZlNNlzG6ohI983mGnVegxIoeHQgF7oG4cyjykd/o7pV6+1sIKXjoeoDjLpe509IDvF
         GGvULaz75ojaM6gI0kv0pPVO7kZLF6K/pqmnz0BMFtTY9uWTcui05TLb8Urmb0UZKNyl
         gqlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=VK5GlKScKbS+LVQgUi0a1RrhyXld8LpQu4ZIhT+sCNU=;
        b=wXaXJWiAo94/qnPIA4JseZMLoo5DGw8Tdx4cS3YGNP++C075tBcT2SUIWtdnxiWU93
         YC4XqeqPP9wXWvZ9bERXPQd7lcP+C0XHM/0uPRPpA/gkIFMJ4SQJrjDd5IEVvmEItyG0
         0pYAo2ITRduRPIHeSBzxFVHbUPGMpEdU+wRymtWVAHQw36j0VL0pl/aew8gApYncTkJQ
         Aa3r5aluX6WIMkKLKbiD3XVUYPxom1V5LIax0JpTSpONfCWkZtzljTVrp9igj5rOm3Gl
         lbSxOxYmxeNib/GeiYdMf0VVxK8u9t1U+vtVWzzvdzDp5uN7DtHsSXpoRd9LYWMx8eNA
         nUqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GcHqLelc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h28si2375222otg.63.2019.12.18.11.37.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Dec 2019 11:37:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GcHqLelc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ihf8E-0002G8-CD
	for alex.bennee@linaro.org; Wed, 18 Dec 2019 14:37:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36800)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1ihf6y-0001F7-09
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 14:35:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1ihf6w-00046j-PN
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 14:35:55 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:39610)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1ihf6w-000459-HH; Wed, 18 Dec 2019 14:35:54 -0500
Received: by mail-oi1-x244.google.com with SMTP id a67so1739415oib.6;
 Wed, 18 Dec 2019 11:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VK5GlKScKbS+LVQgUi0a1RrhyXld8LpQu4ZIhT+sCNU=;
 b=GcHqLelclak/OyqMf38yZqxV5ZiMqkKMutruD8DaF04uaoSjHPCNUV2AGeYFzx7A6b
 g3AGX2NBV1YTqljlNJ+WHHw+ovx1dg01hKfl5OlVI/ainIUZV3Qen0wGzLPvqCiXOVfJ
 KSR6fbVWjf+GSF18wfEh/YnclX2/NLrR+mHGfPw1favDLCKwekrI32nhxSCRw4NIW+o8
 EIDrYllbHbJcwtp70emV3nQIvrzpwehKinz3nbuJQsRiKV1O630MEJ/4nplsrl1HbINt
 idFseZ5JscYmRBrpaEzYxJ6tu3SK1hvaDhjUF2uztkGrLmV4n5Of7ghOnP/aLwHCtCEl
 8d/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VK5GlKScKbS+LVQgUi0a1RrhyXld8LpQu4ZIhT+sCNU=;
 b=D/ht3JyrkRoY4pP5UWir+AiS6bFg6MqLhrjydOY4WfElv00kQF/RYmGefn98HRaL5R
 8finnP9fVA05+gbEvJGBQ/hAXlhyyUAxtUZDrxQCMECKFcnnZpF+FdfV8PPaIef92IXk
 P/kUVu29nsN2m/PqIE20J6rgzoQg5F9IxJE3AktHXDkxIeECswB3N6z+w3xo7wX0fj4I
 pKU0GjjDEJxCx+4/4MHsAcAseo0RK+xoKxMjmxmPwmVYDpfzurA5dUkg8qe8KgETJT5T
 NMbzyFpisGm/rZ8JW6dhdESpG+loomjHZEvBvZs2Afkqndz+32pHWmEupTwWFlMvQp7r
 63rg==
X-Gm-Message-State: APjAAAU3UVhovvlFNfuCTv4WqWkPqFp0Q6em+U55Rno0kX+7wrpfhUV/
 to7X7e+EdF031gzZQl11pBe0iCRUS6QY/ucuGeg=
X-Received: by 2002:aca:1b08:: with SMTP id b8mr1236876oib.106.1576697753655; 
 Wed, 18 Dec 2019 11:35:53 -0800 (PST)
MIME-Version: 1.0
References: <20191218192526.13845-1-philmd@redhat.com>
 <20191218192526.13845-6-philmd@redhat.com>
In-Reply-To: <20191218192526.13845-6-philmd@redhat.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Wed, 18 Dec 2019 20:35:42 +0100
Message-ID: <CAL1e-=i19ETZwmB56WUo4E1YKzYsM0RW8Vd0xC_OVZ_N=xOKow@mail.gmail.com>
Subject: Re: [RFC PATCH v2 5/6] hw/net/imx_fec: Remove unuseful FALLTHROUGH
 comments
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Jason Wang <jasowang@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 "open list:Stellaris" <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dkNZ+5aYrHcW

On Wed, Dec 18, 2019 at 8:29 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> We don't need to explicit these obvious switch fall through
> comments. Stay consistent with the rest of the codebase.
>
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---

Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>

> Cc: Peter Chubb <peter.chubb@nicta.com.au>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: qemu-arm@nongnu.org
> ---
>  hw/net/imx_fec.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
> index c01ce4f078..5a83678f64 100644
> --- a/hw/net/imx_fec.c
> +++ b/hw/net/imx_fec.c
> @@ -901,8 +901,8 @@ static void imx_eth_write(void *opaque, hwaddr offset=
, uint64_t value,
>              s->regs[index] =3D 0;
>          }
>          break;
> -    case ENET_TDAR1:    /* FALLTHROUGH */
> -    case ENET_TDAR2:    /* FALLTHROUGH */
> +    case ENET_TDAR1:
> +    case ENET_TDAR2:
>          if (unlikely(single_tx_ring)) {
>              qemu_log_mask(LOG_GUEST_ERROR,
>                            "[%s]%s: trying to access TDAR2 or TDAR1\n",
> --
> 2.21.0
>
>
