Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3255904lft;
        Mon, 4 Jul 2022 07:09:52 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tTwmsfUTn36qG2fYytoKyhG1zLyBvU2Nq7ed0uf/27ngAUAefYNLZA7v1sXgcqE9ER0IXr
X-Received: by 2002:a81:1182:0:b0:31c:4d18:d679 with SMTP id 124-20020a811182000000b0031c4d18d679mr24519870ywr.436.1656943792547;
        Mon, 04 Jul 2022 07:09:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656943792; cv=none;
        d=google.com; s=arc-20160816;
        b=W68RjJEgxe9uU31PtrH1BqGFiVcQxuLyzeef398kNb2YT1Nr0oZQdVUb0j1KRK9Zy/
         abRFWvEQiEgPwEZLXZkswCM+HhMsJnAFowMRju2T79ee2ZiIiiopnsq3AR5o3RWV8sf/
         ukOH3UBVcAGcRu8RhOAp8olXani9kzbNVeRzkgEXAEut83DrGFXRBYzgRYTGUMe4yfzt
         6AyecJWe1kXGCRf0rJJQQRzZgcd94DJ2TY3322kPUj30tbT/lnVQVGHAgLVI90N4ybG5
         b1cVnUc47Du85ajXVeF0jB/CMVDs2UOvcbPr+Q+HA6dVwtLUMNZB3BcRTJRU88RHEnjg
         gG9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=MIjezOnfrTZk/ziSdi+WN/bXftMyOb/aZmQlr68sVUk=;
        b=JQzgULcRbWWV/0UKEjyCJtUj7eVlkoGGkrPV7L0mVUWhW3Anf7X6xOCH8yB+OQvlHr
         hMjJk3JbOFIWsddI+a/xtlCu5PtW4nbKrkXf8kzbv8oF8Eanzr6kv0y+k3aceIiuZHkV
         ejQlqKB3sHeIxYqxKH1rXTR72rzcC/0dLrIxx82xCODIzF412JDBIRmnbjzDxMeSggKD
         Udziru48LaeNFOAAblejm3NCCxH3UIC/c94FVxdRy4Yuw1Uiq6Fonyy0PcunmcKG4tYd
         DgF/isgPjselUyi9GsXdh25Bbip389wMBQGkv2jQf2woSRsX22Hz/qTCj5Ss1wr/Ny4t
         ytug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BbaT6jL5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q5-20020a056902150500b0066cf4f8d6ddsi37434571ybu.382.2022.07.04.07.09.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 07:09:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BbaT6jL5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8Mlr-0000ka-Tj
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 10:09:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M7v-00083S-1S
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 09:28:35 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:40631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M7q-0003tF-JL
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 09:28:34 -0400
Received: by mail-yb1-xb35.google.com with SMTP id o2so11640580yba.7
 for <qemu-arm@nongnu.org>; Mon, 04 Jul 2022 06:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MIjezOnfrTZk/ziSdi+WN/bXftMyOb/aZmQlr68sVUk=;
 b=BbaT6jL5qREwMSlaZGrs+OZY7ibAynTgos/WMd1kaF+SptCJ3b+kXWNod3aqx/DlvV
 f4SDi16RV6wU+lAIDqtK/j/7hjT7QH+vYjhnQqqf/6/oDkrRNo+EG/WZhCd0y5WF2FxC
 +XUhZbs5C97hKmUI22g+TXDoDeHV/wGuyREmQ3Y+OEkJPP4ehGubWtfIfZUP5j5fLdVP
 kXdxoMbyDN0HFkWCdS/raHNO2MquWxBaPXc/pxkj0jkhAEEvuBLqs7LnfDWWMN1vTV1T
 qwuVhhZHEG3zJt407mJNG/ZmrC/1PJ1qAjWdeCFpzzYmbiOZq53m9RytugN2vyqt+Usi
 C+RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MIjezOnfrTZk/ziSdi+WN/bXftMyOb/aZmQlr68sVUk=;
 b=a3YXYE9QbyaDM+rTtdmqlnoUIzZNyyTcDYkLP2MGM6hPiEln5wehh5GvqZPv1lTe1i
 I862N6GAMv0zSCNIuLo/lHY7nmx66NGVGHP/cJh8RwjeT76/q/xw5XlhxI7SijJkM4Rq
 9l4YeKfifoL3urEjF9a7nLQIIZWMpgZtaH7ni/fd3BRSqiUMhs9BYHZ3b+Ns7C29uzXD
 7JUG0s/3xNpUxWATQoUSpcoigzShXSHmn3rRuwB5tNq8/mP77aIYb7gtikolNnN2KQlp
 r4EyAPZFF4fbQGKk8f4a10/4WlqKO50BpfLa6JeZW6y6VXWhVCVrm3nAcIx2YmszZsrv
 9eEw==
X-Gm-Message-State: AJIora+4ev8+iMNZ4D/O8Ri9TjBVBztzLRDbyNi3PIj0TGVvqxkWvuEj
 JXwfz0rHE1mqD5ZS1FpnbDxvfdel7Sv7HzoTC7D3Iw==
X-Received: by 2002:a05:6902:1183:b0:66e:4860:575d with SMTP id
 m3-20020a056902118300b0066e4860575dmr6199217ybu.479.1656941309289; Mon, 04
 Jul 2022 06:28:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-29-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-29-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:28:18 +0100
Message-ID: <CAFEAcA8FGWZGgvVYJ+4gPCmpsxNAhAsRFfJ8=WdU+E7_5ubUbQ@mail.gmail.com>
Subject: Re: [PATCH 28/40] lasips2: switch to using port-based IRQs
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: lcjlxHZwtIPn

On Wed, 29 Jun 2022 at 13:41, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Now we can implement port-based IRQs by wiring the PS2 device IRQs to the
> LASI2Port named input gpios rather than directly to the LASIPS2 device, and
> generate the LASIPS2 output IRQ from the int_status bitmap representing the
> individual port IRQs instead of the birq boolean.
>
> This enables us to remove the separate PS2 keyboard and PS2 mouse named input
> gpios from the LASIPS2 device and simplify the register implementation to
> drive the port IRQ using qemu_set_irq() rather than accessing the LASIPS2
> device IRQs directly. As a consequence the IRQ level logic in lasips2_set_irq()
> can also be simplified accordingly.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/input/lasips2.c         | 59 ++++++++++++--------------------------
>  include/hw/input/lasips2.h |  7 ++---
>  2 files changed, 20 insertions(+), 46 deletions(-)
>
> diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
> index 013d891af6..5ceb38c1af 100644
> --- a/hw/input/lasips2.c
> +++ b/hw/input/lasips2.c
> @@ -42,10 +42,8 @@ static const VMStateDescription vmstate_lasips2 = {
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT8(kbd_port.parent_obj.control, LASIPS2State),
>          VMSTATE_UINT8(kbd_port.parent_obj.id, LASIPS2State),
> -        VMSTATE_BOOL(kbd_port.parent_obj.birq, LASIPS2State),
>          VMSTATE_UINT8(mouse_port.parent_obj.control, LASIPS2State),
>          VMSTATE_UINT8(mouse_port.parent_obj.id, LASIPS2State),
> -        VMSTATE_BOOL(mouse_port.parent_obj.birq, LASIPS2State),
>          VMSTATE_END_OF_LIST()
>      }

You should bump the version number when you remove fields, so
that the error message on a mismatched-migration is clearer.


-- PMM
