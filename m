Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp438085lfb;
        Thu, 9 Jun 2022 06:27:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVyXBekfTP/Y8lctfB9ELyCtDckb+deobalVVenO53g/VY8Kl10YlsU4U1HC4WI0HlJwR4
X-Received: by 2002:a05:620a:410:b0:6a6:abbe:2018 with SMTP id 16-20020a05620a041000b006a6abbe2018mr18581743qkp.645.1654781279675;
        Thu, 09 Jun 2022 06:27:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654781279; cv=none;
        d=google.com; s=arc-20160816;
        b=ooyVwI9HkZP5IHdhmV4Q45p3cZQukFuX7m8itG4hQFyP85Db3PHT/+kyaFudpwWNyX
         PV04isN0gSgQCHeK1v2K2GQiDCL5Mz5XNHv6oRObN5dCA1qTeLkK9XhtDvjBeuvmu+6P
         K1ojAkqmBHJ8On57mh9QZ3oN1xzICbeeBd0yNnldtuKPYNNFeWseX6JZMjaTCu/+P0Ge
         MAVskJ6r/RV+/KANINAAkR4fjOSPZd3MfHZs8XDi/gTyqoGQqPPMIjT9GDBqO5XW7Qzy
         qZCRNI9m+e7omGpg8NkN4glCP+o8gQzOty0N6NEFR3Bh9/HzYFq7tEdzkzIFU/STDloj
         4E0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=HpdV5U0nCe0xkk3ot25zi9m0siI2JbfGs1AvheXv80E=;
        b=jITz6ZHzSfPDzafZLFpobJwktGK2Qw4zjYJhsgfdJvlpaUmboJMG2sT9vY++7Pv06v
         xdTd/p/gJk65zpr05XdVSfYBSvGF1x0KeGRmy8V3sEMd1sVx/gbSAN/94WRBK2PKO+cm
         qaH05CIGOZMasW070rRSBvbx25ocxIldD3b5jO8TxO0wqi4+jBeQsJrQq5OmEzR26nOx
         SEazWs/eFF58/yv7WlKp7fiEEhL/OA7TN4cCjDrGVFAcVPYNfnhX4D9w8uSJjYkAYOBO
         OQEZuKQOWlQHuXiZXVaVf0JZ2YtjBe/F1tXqPROAB8LytinQrwsM7sbXbmxK+W1rUPWa
         18UQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j3z4WIc2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ey11-20020a0562140b6b00b0045a7a161743si13493677qvb.572.2022.06.09.06.27.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 06:27:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j3z4WIc2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzICd-000289-3V
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 09:27:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzG9X-0007zR-EU
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 07:16:46 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:36635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzG9U-00035f-Kf
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 07:16:38 -0400
Received: by mail-yb1-xb30.google.com with SMTP id k2so1843044ybj.3
 for <qemu-arm@nongnu.org>; Thu, 09 Jun 2022 04:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HpdV5U0nCe0xkk3ot25zi9m0siI2JbfGs1AvheXv80E=;
 b=j3z4WIc2U6ijqwlfg5WszNGfKsoUx/H/mq+Oziqf0/kBsKGhQVODdmZZgwG2k7/t4W
 PfL6vw+pphPVZBw+DKAQ7GByn5Hn/VuhDyNjD+hDod+ZLa/zQuZXpqTYzcG2AkeUiqkV
 zYp9YBlIb9J1520Iu5UEh7PTWRkNKv6BYz5Sx43EPJLA8QqtVKRG8yxvAiY/+HYowIsX
 tbEXfeugkvRzd5weOcgUSLuKsTXqRjo/fy0iLrBOsTVcPJkLpyuxJW1ZGZwKS0byaIN+
 KDX2iQXosDSh17y+K3rxo1AWgzvtztvPxkSJuH6qEsWLrQWqSyaKzoEZL3BLmPyXYzaH
 04+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HpdV5U0nCe0xkk3ot25zi9m0siI2JbfGs1AvheXv80E=;
 b=P6sfEr/ZDfxCGPdb+WhFMeb0uZ6xDHhCgdJIUJmCRtuGAKOA9zNX3fMXPr50wPuBFj
 zNdfZPnsqemhDog+Z6qPFkN92dcepvz2ZcvlbO9pP3eFslIpvGZCTsxKc5oMXy7Gbiam
 sWu3jDAl2WBrwgQ3Mpgn/RGNVImsLQpAxwW/KZWvY0kU+rIOzm9onmT0+tua6edxs9a8
 F8x+T6eLsNMWNRBmxj++ZSB4lZNv8Btu33mKfmEHog8YmDtaBgXb9cu8pn6yTiGlSmaU
 826Edualjb1ZozgQg7EGShdz3qEZhMbsq5S1w7rbbY+gK5u7+ZTaXJGQmTEhN/WEytXO
 iExw==
X-Gm-Message-State: AOAM532HBtE2G+8n0MTfDc+DlPLgffpHlb5Zw1OC1k0E1EaFQHXWVvRC
 5GOjG3oh6DOgmjeKIpMpOunTzXPfhtenWxP7VZGD1g==
X-Received: by 2002:a05:6902:728:b0:663:5591:aa2c with SMTP id
 l8-20020a056902072800b006635591aa2cmr24982968ybt.288.1654773395423; Thu, 09
 Jun 2022 04:16:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-44-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220522181836.864-44-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 12:16:24 +0100
Message-ID: <CAFEAcA_zDsbXXej0EU_HaNdodznd50ZjBnf+M2c9LD5QGBPhzw@mail.gmail.com>
Subject: Re: [PATCH 43/50] lasips2: add base property
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: VcgqNKqQKCI7

On Sun, 22 May 2022 at 19:20, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This is in preparation for handling vmstate_register() within the device.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/input/lasips2.c         | 17 ++++++++++++++++-
>  include/hw/input/lasips2.h |  1 +
>  2 files changed, 17 insertions(+), 1 deletion(-)


>  static const TypeInfo lasips2_info = {
>      .name          = TYPE_LASIPS2,
>      .parent        = TYPE_SYS_BUS_DEVICE,
>      .instance_init = lasips2_init,
> -    .instance_size = sizeof(LASIPS2State)
> +    .instance_size = sizeof(LASIPS2State),
> +    .class_init    = lasips2_class_init

If you put the trailing comma at the end of this last line, then
the next person who comes along to add a new line at the end of
the struct won't have to edit the preceding line to add the comma.

Anyway, as a code change this is fine, so
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
but as I note in review of patch 44 it would be better to
avoid vmstate_register(), in which case we don't need the property.

thanks
-- PMM
