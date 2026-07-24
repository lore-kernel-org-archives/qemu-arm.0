Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB957C531FC
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Jul 2026 08:57:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wnBiB-0007Xw-Ge; Fri, 24 Jul 2026 04:56:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wnBiA-0007XZ-Fi
 for qemu-arm@nongnu.org; Fri, 24 Jul 2026 04:56:54 -0400
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wnBi8-0006Lp-84
 for qemu-arm@nongnu.org; Fri, 24 Jul 2026 04:56:54 -0400
Received: by mail-yx1-xb12f.google.com with SMTP id
 956f58d0204a3-6611669cd16so134842d50.0
 for <qemu-arm@nongnu.org>; Fri, 24 Jul 2026 01:56:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784883411; cv=none;
 d=google.com; s=arc-20260327;
 b=I3g2zw2vTM+crdLLl3lWnu++C2LwrQSRUiv+dWfwxaYUAIvBfB8y4lI7mMe2ovMoA8
 Ihleg5VVXzCxc3MIBPr78cmXteuRPpUaNckCSAWvI9LFxy4VkLpkxYcx+Pm6zlUZKreG
 c2fjjGR+5r+jQ3d5HSGQcoSjDfPxn/9rsHTBzPfEL0dj93j6AYp78N3LuWt5yR6Tcjvf
 FaQh+LBS3Tjjk1lEr4ll46FGIO8FLgzC7j8tWZxorriZ7D+6IeA3wagBb3X0dsyki9zX
 m9C1zIkGNzMgDo2j2U/aKPIa62qyoq3uPUMQzn8lwg9puqohutLqxhbSaQQ2GdsAxZrL
 2PFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=E9E6Y5fYCFx466ER0P+VAkHURzQzCjzaS5clb5a/W68=;
 fh=AS4hkQxVMAAPq61MKf8qeIUcJbE41qLDO0TJZvRUyhc=;
 b=BXBtTEXi/DXJ7/LY4Pz676fnQ8tAKvmnmtHi/dN+EzNsMiO5dGpRZM2RLn+jQbURt0
 3oV4abk8I16Wg2JzE17uHekAuQ5IjLleXgsvqMdewr+aQc5XYzx8oLnGMYe5eDUs9zRG
 aZVjZbc+GiUJZsMOthUZ7ZiXIhbxf/CfEm6priDTQVFaEC3A8fOWUS0oUUzkuxpjllNT
 81ej/Wyfnq/K0zSn/NHZ82YoazB+YOzB8e/i7WHrbe1bEUR4JvZ4Upn+qfmBreabwjMu
 Y8RYygDeozDjx5s73roY7MYHNfQ4YgOJUSkcVG/W+/nqTL3avteDv+ZnWjclGbOexBTM
 L0Ew==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784883411; x=1785488211; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=E9E6Y5fYCFx466ER0P+VAkHURzQzCjzaS5clb5a/W68=;
 b=c6dhgblg3ueqlSCXdJG3Kdxnv8FNfOezdON4vWF9C3UJIG7WwNdXPW6hSeE1E24n9Q
 wXfOIzfDlxhleLgat3SwlKsy3NjmylE6p/RI6xswnzF0tK3/tyULI7b7eASlRZtkQNbt
 BFDCFnnZJ3aYP5sMJgIncnrnsFqKP+RhJpaEoVdLz+PMdmjJ+W00KKHUAN08dUTxM3l/
 dOsaig7/3pfb9mU9NzCCteovg/EQI2hySMqPEsH8HYZYB6puS93xBhq5dkiGteAODEFn
 fJu1yt4Qpxhc+izdbdZyC9tZfDrCd9jpEhr0AbiA0K8B6jTm26EvYBQg2TvbuSvdOy3f
 CMaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784883411; x=1785488211;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=E9E6Y5fYCFx466ER0P+VAkHURzQzCjzaS5clb5a/W68=;
 b=qVLCf/UxHWMGGXI0FBMDfPTVDQDRglyCcjb9Ypf7h5Zg781mR5x8EW/juPHS7ygvlV
 yAXQH7hleyPwjJFKJ7oSVg9yjDOaC11QvmRhi5U4nwDl+wxWy9HHZb4bb2sEAH+IEwQf
 TgHyInTFYyt3ChVeT+UtZNcvRMWolBRnFnoi65wu1GVlGpfdIy9Y/n2z1aBA4XGb4fqQ
 OSKxV5Qe8wQDLDJnzOAQfNUnOB4ve2JdFJ6ltO37JcQF0b6ZFdwL3bylSAGbCjFbLS8n
 /nuoSAEX+995W2GLxZ0phZPp+GqGMuADPISrbRj7tck/2iguXdwqII4dYqy+KHIPOL3A
 OECQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqy6Gjya0Dt0XC2ih82zI1kxM7JmnFxXVS0BrfqbEmMkEuwKwkaF4jfZ8cWPocLwJ3PpkYucVnyqg==@nongnu.org
X-Gm-Message-State: AOJu0Yy5tQgkGLKCFDYWSLIDSAL8cKZ0aBnr1UVredeABbR8goVpBEcw
 pTph6zHbQYqEfxY7VfjhRjjtN+Isfw18Ce8ttcXqB5S+FeiMDcr8BM90i/NDT012SZAPXPtZIss
 ytDJU2zU5EWdNlrZJsMsCHzWcxqI7qSxWYk9JjNzLAA==
X-Gm-Gg: AR+sD11NLNwHk0OUWmZpc6+RcW0SMFmqObEWkbETl2xvZfNyyqB+F09snpvO6mDysjR
 pPTIePouDKHY3LoNU5KTjGJTZJjjA8jukDn4nMfnOaUBsT+gNsriN4EJNUDS6ySBGQOlTrNrEFk
 UyuB4tlm5OD27l/LpS9INJOjSvj7/85nF/hWX5sN5MBMRKYYcFdK9oEk0bJ44CrxYNDkyghg7uS
 HQLKUOw6GFn2NtEpFDLo1S+yZk05h/CPLM8A3Iuna03OwKKZxW1jmsYDcxw5OvuyVzzG0KcUDTi
 Q0RvkE2hD41gW11g88ooR0Z8tBxT/b3s4HjHgw+H5qQJHrBmfw2Jfud5
X-Received: by 2002:a53:cecc:0:b0:668:2628:5768 with SMTP id
 956f58d0204a3-668a4fb4fe6mr1310519d50.90.1784883410756; Fri, 24 Jul 2026
 01:56:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260723164357.1462-1-simonxhy0404@gmail.com>
In-Reply-To: <20260723164357.1462-1-simonxhy0404@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jul 2026 09:56:39 +0100
X-Gm-Features: AUfX_mwxWnY-oX2H2Z5AivLjEvdUVLYw43pzlkkxUkmzgedaFtLE5QfdlMQZ2hk
Message-ID: <CAFEAcA-3iJyD1mUw_jz=0aE10Hp4qkoMZTNeZ4zMQqusjyfOgw@mail.gmail.com>
Subject: Re: [PATCH] hw/misc/mps2-scc.c: fix scc_partno() and cfg7 write
To: Simon Xu <simonxhy0404@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, 23 Jul 2026 at 17:43, Simon Xu <simonxhy0404@gmail.com> wrote:
>
> Increase the extract32 length from 8 to 12. The Primary part number is
> defined as bits[15:4] by the "SSE-310 with M85 and U55 FPGA"
> documentation. For example for the mps3-an547, 0x547 is 12 bits but we
> only return 8 bits right now.
>
> Change the CFG7 write function to modify the correct variable.
>
> Signed-off-by: Simon Xu <simonxhy0404@gmail.com>
> ---
>  hw/misc/mps2-scc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/misc/mps2-scc.c b/hw/misc/mps2-scc.c
> index 7877b31479..554b504c72 100644
> --- a/hw/misc/mps2-scc.c
> +++ b/hw/misc/mps2-scc.c
> @@ -57,7 +57,7 @@ REG32(ID, 0xFFC)
>  static int scc_partno(MPS2SCC *s)
>  {
>      /* Return the partno field of the SCC_ID (0x524, 0x511, etc) */
> -    return extract32(s->id, 4, 8);
> +    return extract32(s->id, 4, 12);
>  }

Whoops, this is in "how did this ever work?" territory. I
guess most guests don't actually do enough with the
part-specific bits of the device to notice...

>
>  /* Is CFG_REG2 present? */
> @@ -299,7 +299,7 @@ static void mps2_scc_write(void *opaque, hwaddr offset, uint64_t value,
>              goto bad_offset;
>          }
>          /* AN536: Core 1 vector table base address */
> -        s->cfg6 = value;
> +        s->cfg7 = value;
>          break;


This is also an obvious cut-and-paste bug: writing to A_CFG7
should clearly write s->cfg7, not 6.

However, these are two separate unrelated bugs. Could you send
them as two separate patches, please? (You can put them in a
2-patch series with a cover letter.)

thanks
-- PMM

