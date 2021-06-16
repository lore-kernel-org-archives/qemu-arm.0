Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp631752lff;
        Wed, 16 Jun 2021 12:15:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjeVGYa7wrn8pi+pwgVqtnrMFgEwZaVKfijovH90g4S6YR+gKwWr7ycOvphOIvnD6/zXmR
X-Received: by 2002:a05:600c:21d1:: with SMTP id x17mr548306wmj.167.1623870926117;
        Wed, 16 Jun 2021 12:15:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623870926; cv=none;
        d=google.com; s=arc-20160816;
        b=zhTFEJqdtylNhr+R4gIhVOwugNb5f2MyrRG5NsfXrkIDuIXIkJZe8UjqvkAe1Wh9ix
         JqgT4Ky3J4PyLNZSPVpnaL0UBnGbBV89PZLYyiG7HcmjnzPHMtml501gE2TyNjuNlhOZ
         TopKlwG/I1a49DbeMhSH5g7vxJ55q6LOudXK1oWZiMQvGKhQiR53ImI2K8i/rDMRvzi7
         vLsPNiHWQxaq1GZjih+wIprOwWf2WclUKXFXGhj1BK0SXKO4R5v7iAp8Qv3pa+a7zXk6
         IGoq3nnanmPCvC25vgldz49RO5wTAQngCyVxT3f8sVEAjdIGvo5T5g0Zk9Ijq3PGCAGX
         RRgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=ATh12DGf3i1forOs8VBMp5LPyeOz4NLGeOwRoZijAJE=;
        b=lJymX3LBYJeSbCnndvrquGE1Vp3AhBN+Ignvr6V6TtfVArr53DfnjHcZzIZB3nhwCW
         gM1xSnZIewFXdrn3DmfvEJmwGx9Mq/jGgyKbsmjhnxpTzp2sONpq6uXp+WJws4ch0AEw
         mcUtjJjhigTXkMBMch3XqJs2jg6bz4HySUe7rlwXDbb7IK0UuNlZpSWteery0l6T1EGX
         9nlj1AXE5wzH84hZYLnd/tOAwqGaOVveFmYP6F8VNqy81sBDXTSqMjW8N8767485yrv3
         pMcLScfBr+KEnW+Uu2xVV2n5khJh6tMhGb8lD/tt4VzOBGqmFxGi/yE/CCGbi7CbfE+M
         MqgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=ae+E7ycS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n7si3516029wrq.31.2021.06.16.12.15.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Jun 2021 12:15:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=ae+E7ycS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltb0X-0004Ho-9a
	for alex.bennee@linaro.org; Wed, 16 Jun 2021 15:15:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1ltb0D-0004HJ-GG
 for qemu-arm@nongnu.org; Wed, 16 Jun 2021 15:15:05 -0400
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29]:34694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1ltb0A-0008P2-8h
 for qemu-arm@nongnu.org; Wed, 16 Jun 2021 15:15:04 -0400
Received: by mail-oo1-xc29.google.com with SMTP id
 i8-20020a4aa1080000b0290201edd785e7so971664ool.1
 for <qemu-arm@nongnu.org>; Wed, 16 Jun 2021 12:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mvista-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ATh12DGf3i1forOs8VBMp5LPyeOz4NLGeOwRoZijAJE=;
 b=ae+E7ycSsAH0O33MaGhUO84Yb2FTDdAjgOzsrMxHvbskBln5gYNjLNgYx1uTBcSR/y
 S6WQApQKKVOoImwbseBo/h5W/59yJoGhuXvXi+Pyw2fuRk1yYF5K39natSp3bmgkO4bN
 4W0mxU862x8MxYbG+O60bngZJrAC4Sy1qKmjK2iJg+mxkvAuno88IdPgzEdmCANqsgCu
 7IQPa00Dx7t417PYkSQIMDMkU6OOexkvDxGvgbpjAW5yKYYSxoJ7dvpX2AC/vEmDGCr4
 zFDKnsvDzSg1f/fMppg2n9aVI8+rJvIdP0l/m7BGE+/7FwG9Bc4wJQTshgCFK5YYCECW
 icmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=ATh12DGf3i1forOs8VBMp5LPyeOz4NLGeOwRoZijAJE=;
 b=GXER0QDIBTXu/bw0OvgF+PUWUrR+gnmYE8l1ErHuaw+Twauvu8IFAlVtCMeulK+6oj
 FLaaBBGNewEmZM6Rw7tvlAnoVUYJHSMHrOZqsctneb2TznUFgWoN3kvexDh7D+hzCyx5
 gTN4FxcLbYefBq5Lwa7vWhhdloSDZzODD22gVXiezqe6ysN9Eg0D+W/UgHCJL2YXtdoQ
 u+vx3MA1R4u5y55MMcN0vKfrl0mh2Y+VQJzLpbLSxmnY5NnZb0GR14pxGQIq0BW4MCIn
 O2TL9ZL1zZDdcoKNykUhswZW/tgVcfzolinqPc0M4J94NPQeFaRi1nAL3ca1/aFJosq1
 p1og==
X-Gm-Message-State: AOAM532hoWvt4MeFjGIp7hyEIQLi69CoSr/UvNuJtHgQMlDNb8V8fyL1
 S3N1iuWnawc9NTihYprVx098yQ==
X-Received: by 2002:a4a:952b:: with SMTP id m40mr1253460ooi.69.1623870898725; 
 Wed, 16 Jun 2021 12:14:58 -0700 (PDT)
Received: from minyard.net ([2001:470:b8f6:1b:ede8:ade8:da1:e1cc])
 by smtp.gmail.com with ESMTPSA id l7sm702502otu.76.2021.06.16.12.14.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 12:14:58 -0700 (PDT)
Date: Wed, 16 Jun 2021 14:14:56 -0500
From: Corey Minyard <cminyard@mvista.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v3 04/13] hw/display/sm501: Replace i2c_send_recv() by
 i2c_recv() & i2c_send()
Message-ID: <20210616191456.GE11196@minyard.net>
References: <20210616161418.2514095-1-f4bug@amsat.org>
 <20210616161418.2514095-5-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210616161418.2514095-5-f4bug@amsat.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::c29;
 envelope-from=cminyard@mvista.com; helo=mail-oo1-xc29.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: cminyard@mvista.com
Cc: "Signed-off-by : Frederic Konrad" <frederic.konrad@adacore.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y440XKkQU66r

On Wed, Jun 16, 2021 at 06:14:09PM +0200, Philippe Mathieu-Daudé wrote:
> Instead of using the confuse i2c_send_recv(), rewrite to directly
> call i2c_recv() & i2c_send(), resulting in code easire to review.
                                                  ^easier



> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/display/sm501.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/display/sm501.c b/hw/display/sm501.c
> index f276276f7f1..569661a0746 100644
> --- a/hw/display/sm501.c
> +++ b/hw/display/sm501.c
> @@ -1033,17 +1033,18 @@ static void sm501_i2c_write(void *opaque, hwaddr addr, uint64_t value,
>      case SM501_I2C_CONTROL:
>          if (value & SM501_I2C_CONTROL_ENABLE) {
>              if (value & SM501_I2C_CONTROL_START) {
> +                bool is_recv = s->i2c_addr & 1;
>                  int res = i2c_start_transfer(s->i2c_bus,
>                                               s->i2c_addr >> 1,
> -                                             s->i2c_addr & 1);
> +                                             is_recv);
>                  if (res) {
>                      s->i2c_status |= SM501_I2C_STATUS_ERROR;
>                  } else {
>                      int i;
>                      for (i = 0; i <= s->i2c_byte_count; i++) {
> -                        res = i2c_send_recv(s->i2c_bus, &s->i2c_data[i],
> -                                            !(s->i2c_addr & 1));
> -                        if (res) {
> +                        if (is_recv) {
> +                            s->i2c_data[i] = i2c_recv(s->i2c_bus);
> +                        } else if (i2c_send(s->i2c_bus, s->i2c_data[i]) < 0) {
>                              s->i2c_status |= SM501_I2C_STATUS_ERROR;
>                              return;
>                          }
> -- 
> 2.31.1
> 
