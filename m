Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C4ACCF2C4
	for <qemu-arm@archiver.kernel.org>; Sat, 17 Oct 2026 12:42:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xI3jL-0007wi-9q; Sat, 17 Oct 2026 08:41:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xI3jI-0007v7-FV
 for qemu-arm@nongnu.org; Sat, 17 Oct 2026 08:41:40 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xI3jH-00049R-21
 for qemu-arm@nongnu.org; Sat, 17 Oct 2026 08:41:40 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-8b0a921ee46so5917917b3.2
 for <qemu-arm@nongnu.org>; Sat, 17 Oct 2026 05:41:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792240898; cv=none;
 d=google.com; s=arc-20260327;
 b=Hu5pxY0EskHzlzhOVrzu1C25MNO5EwCi4osYLlwxtvUbE5/w1AdonpHIVkfbLQZoGM
 BzqbotjWCtZmwjparaTOjQGedzOJCLQPNQ1t94Y5zUYtLFAMrxu9TXybr7Kl5YKjmTS+
 Fs10PWA8K1Un/ZrcW8IyD97ZvMXM2MQxBgiW79KXyx5yj+mVciVGhsQ5t9ZimGsSq7AN
 Wv63PgRQCWqTKY7eBSvAOTDoG8l2/LEWyzdYcrue837pKUYae2l/eubTxMCbYdIXpWb2
 VueftzOnB492HgVAPnz3GsV8gr7NqEUqE0eulBE3wD4QenX8pz1hz8JA05JvgIyiT+id
 X5WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=NZdKfx+Etpoc3S2ApHYXl84B2+t+hA73P89U2cSWRX8=;
 fh=qkMOd6TBuKGr2U7R4CEyuRRF+5vozV9yS3xP2bWB9nQ=;
 b=kb4zImRjcnBFxcCcHFbChKuxJmF7zuUoGmMeUdFoHkw5YGq/wmMQzAFj/eSyezSV5Y
 zNW8qTzXSS5gaId+bEiD4gdQecNR0A2gS8YtDqbbfd+/+NCU4ntULzGbU5atJqli4xCE
 v0Ce9WiK6kCOmcE4uEeP+1QYU3nnW4XA1T94VRGRr5ySjuiqOxYRQJeFPenMeiea+Fhd
 qy5OuJUc/IXnY7D5kZVYmFOiwMxM6MvPIXSjGu75pzMAOiBJ+2IyymcRVIfAqtKIIIwc
 O2AjOWOc9EVLb22BQjh5nA9bycVjTaoHP4ituFYAfQ2DQ3qIFDgAmjfXXTUx2nfZEEjl
 3oXg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792240898; x=1792845698; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=NZdKfx+Etpoc3S2ApHYXl84B2+t+hA73P89U2cSWRX8=;
 b=PAIgGmvAAHLj+Ed/woaC4Geo5ttk93S9wFBEEwbNx2Pr8Qhcx+xpRGTjEqCEbQAcRa
 kQEMsy2yIdo21zOD5wcxL+h3xuXVEz6Y6ei/0S1o5P6x1g6vXEnGInn8Uq7TN98g6ShW
 VIg8sNn713/NtOSdrE2llCSoB86n90a3xCh8dbNbzMrs2i8IZxvFWIZ2vtgMdQu0JfpG
 /BUrld42IL1xhUK2qa1kX4g3NCLhsmFqTBmAbOucH3jm1wOpMX2rVgoS8F1G212vxy+U
 yQkDDG2fVCA7eNn5wAwz0EFk+L7stq+jOTFhJm7vD6SIEJQ1kpz22LW3hAAZsVT/OPhk
 7idw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792240898; x=1792845698;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=NZdKfx+Etpoc3S2ApHYXl84B2+t+hA73P89U2cSWRX8=;
 b=RrEf8YLa906pdKFN/fZHwFwpY29mKqPbQMWEQzbZ6YQ8r2fAemDh2zclkICmTkxOcB
 CDiPmDxQhSe1ZeCmByzqHzDLNVO6ZiX6zFPws9e6VFfKL1eVelTyWsMeZoN/1ZKHwWNw
 bKmY9XBNGEMbbRp7AZZ4/UgyIm3tApm/ndHFcLiPKrr3ey61FxQG9GjwWSUDQ0o37EoB
 pocn9erPDIoGkjsRipM6iEtm5sQziy4w4OpM9SkxItSsnXmZHPC6yOS+ldQSeU5+/OFP
 eLViRlllQwGAUBCt6p4iKAfGBgJKtv3FDqlCp463OAWNTnVim5O3qVTbIxf+PaoMdS3P
 e3aQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByhzNv2cj9YLQjdBG3o3WtIJqr7fOYwBNowFo4UNKPgKg2vb+Kul47XeOWrm/HBh7RfFCDposEaGg==@nongnu.org
X-Gm-Message-State: AFq9FYKPRut1ginY9wPPvi+i4ThiOEPJv/QXI8GTEXezIrXWYSs5lxFw
 qHLYhVcVTXIqXhHH67aI/2ecQ37iZTEnsqReGwu3yOFKU7PlUUqnbrSTtSIWGBYpG5Mq6ez1NfL
 FZ1T2CvVbobzggjqf4qsWFUca5mrSlYfD4OA2MTQxZw==
X-Gm-Gg: AYBFou2BGOsfKMGstosFE+mCIICuSVztLmx4YGv9eG5ogl4e3k9XO+lz8JEuzdMvwAm
 lWeYt02kppHiWhklsMTdfBj1btJJuOuSRja98s315DthAYzbfig//MYZsqGAs0K/xP1ghKrEVLv
 OE5Qa9rPY9e4Myaq4MQB8HsyQme0tF09+sSEaslBSPC51RZ9MHg85ZS35HZ4wInB9HlZWCHpS8m
 3sgBnrG13r/fSzwWamgxDr4Sb/oSZpHi9BKKmNgxCK9ZLArwLthbiN4WM67ci6AlS4Ao+/4vu2B
 /TYPw5D27izEyh9cgjCThSi8+3u+aLOcnYlFCLNIyN/VspIU8NvJ0ZFis7ka3AfjswHQeqSRadV
 bUPXF6llzh5dibAb5cnbORfA/g0cZybqoyYCgrajWpXVHJ1lHRCw=
X-Received: by 2002:a05:690c:f09:b0:873:5ddf:d872 with SMTP id
 00721157ae682-8b0f21f0f15mr8429097b3.61.1792240897814; Sat, 17 Oct 2026
 05:41:37 -0700 (PDT)
MIME-Version: 1.0
References: <20261015181122.60608-1-marcelomanzo@gmail.com>
 <20261015181122.60608-8-marcelomanzo@gmail.com>
In-Reply-To: <20261015181122.60608-8-marcelomanzo@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 17 Oct 2026 13:41:25 +0100
X-Gm-Features: AclHuK-9JkQz8yv7JvdeeFSMwQ_f9aBH7f9X99Kn4HPrQbFEf9TMiyT-muZEFzc
Message-ID: <CAFEAcA8xkU4UdTt3W=TsiaoziRxiJDucxDnJ1OAe7LaPXhmGzQ@mail.gmail.com>
Subject: Re: [PATCH v3 07/16] hw/net/bcm2838_genet: add GENET register
 structs, part 3/4
To: Marcelo Manzo <marcelomanzo@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Sergey Kambalin <serg.oker@gmail.com>,
 Sergey Kambalin <sergey.kambalin@auriga.com>, 
 Jason Wang <jasowangio@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 15 Oct 2026 at 19:11, Marcelo Manzo <marcelomanzo@gmail.com> wrote:
>
> From: Sergey Kambalin <serg.oker@gmail.com>
>
> Add the TDMA (transmit DMA ring/length-status) register layout and
> field accessors, and the PHY BMCR/BMSR MII register field
> definitions.
>
> Part of Sergey Kambalin's original Raspberry Pi 4B PCIe/GENET
> networking series (patchwork series 829638, posted to qemu-devel in
> 2024, never merged). Carried forward and completed by Marcelo Manzo.
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>
> ---
>  hw/net/bcm2838_genet.c         | 88 ++++++++++++++++++++++++++++++++++
>  include/hw/net/bcm2838_genet.h | 88 ++++++++++++++++++++++++++++++++++
>  2 files changed, 176 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

