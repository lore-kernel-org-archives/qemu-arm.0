Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44BC2CAC58E
	for <qemu-arm@archiver.kernel.org>; Thu, 11 Sep 2025 14:09:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uwhyj-0004Xk-2Y; Thu, 11 Sep 2025 10:08:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uwhyh-0004X8-Nb
 for qemu-arm@nongnu.org; Thu, 11 Sep 2025 10:08:47 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uwhyf-0007Ch-4T
 for qemu-arm@nongnu.org; Thu, 11 Sep 2025 10:08:47 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-71d60501806so5467527b3.2
 for <qemu-arm@nongnu.org>; Thu, 11 Sep 2025 07:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757599723; x=1758204523; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5nWBAMaFKxtgU0nhKGso914cbhhuX9CKx0pTbNZl86A=;
 b=nt0jzQEGP/JWckfQ8q9bT7LCjpmhDQf5N3jRi9wNwnUD/PZd38rQqobq1nu3jR/De8
 QTgPWHxgKZ+3tO6+MgHmWZw1qkFcXTcLXGfCqiiZvuVX9bRWriu/W7R4bXilkJZbk07k
 V9CPSVimawI8YL1tolImnzSnEGFAuFJaZgpptQIataRxQ67VuwXOp1xEw6TZaJe6AvYh
 4QIHwO05sRYz7++jbhlzkO7dwBnEmFsu3+xuBeeQC3++hMRTBHE+e+toZq1kgemYYpPZ
 krH8wscTChMt9hhTxVJydXGYsugM402XG85ClsjBlKx5W5qXXoDcQEOY+HPUpQGUpnYb
 RDBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757599723; x=1758204523;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5nWBAMaFKxtgU0nhKGso914cbhhuX9CKx0pTbNZl86A=;
 b=abo9Yp0IzSRbSUKte8YBTZR2Pxhe/+xwR0c8T4BU1U88YIetemzcFfzwZtsBor9BrF
 Ik48r3oX52zP031CW1/OqsMQK7RtCussloD69nWWeS7rRuRDtUKGVVcp9JWS+4INk+Ts
 3OUR4pRhek/hT1WZ+L4WRENt+ekHF//hs1GArMN6LLTxtAqhKsBB6sBTUf2jxyzOisf2
 dDMqMvJ7skBmKoxPNXgsmPVLFf0GVRtQ1yXrA35GUbTO3WQTVOqPcpkDMjvgW8fSFo4X
 sctWSMxA2GO0Ed08jgOH15QPW4NJXX+mXCCtbgoCLR2dsnj2IvVKjclq7XrXxBSE9E2J
 rB/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKrHqUbJ8fhVeSB/ArpGb57gOOwPxRgZZv37mIV6YWIiIpjgAS5Gv9siiiIUO7+Twzw3fBwkOA6A==@nongnu.org
X-Gm-Message-State: AOJu0Yx6+QeBP3pzTeb26IYAYXfCW/HdYaHOJsI/oPscBY6EOFizQvwc
 bY6UT4ViL5GZZQcfD87flrV/6mMO5OnAQbA7HWzSGPLr/L598lM8QRN0Xx1fBlu8kerfPJPiGx+
 CJxFVBWnl09jdJ0N58/mqU+GWr3BYsDMZYOcliHlHQQ==
X-Gm-Gg: ASbGncsDZphK9iLodenofuB820unVfEAnUZSuHh6VFlx6WRrL00dIO0LZLkNg80wk7y
 M2wuIgDFwUExf8Zt9HreN5vPs+utYRReUWiMp5IWoCB1lqw1YKqbeFpowzJEpErLazOczC8rf6k
 WH3KyueVLFITSgTp5d8RPHxofYPMqpgnsfondNtyQiJm2l598OqU2TAS16f9WrEq72auMGzSdnb
 Fme5w9RNg9i16qqBpU=
X-Google-Smtp-Source: AGHT+IGeVyjd75ZZWAwkwvwfI/3lm+uaWbDM65Jo3QRM2Ua2Wb6ZQ8cqGnk0xpqUQ7dD7Z5Ikaju+ofug03/xiFDtLc=
X-Received: by 2002:a05:690c:9207:b0:729:df2d:4a40 with SMTP id
 00721157ae682-729df3c9f38mr131012917b3.23.1757599722507; Thu, 11 Sep 2025
 07:08:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250822151614.187856-1-luc.michel@amd.com>
 <20250822151614.187856-24-luc.michel@amd.com>
In-Reply-To: <20250822151614.187856-24-luc.michel@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Sep 2025 15:08:31 +0100
X-Gm-Features: Ac12FXxyKHg_YPP53hGH2YgrVEOESVcrZA9G9BUpX3MkkAgce9baJaHTJIOq-g8
Message-ID: <CAFEAcA_1QZaHS6mE26jv3Qv9=h6zciA60AB31J7KwHAu1bwz-g@mail.gmail.com>
Subject: Re: [PATCH v4 23/47] hw/intc/arm_gicv3: Introduce a 'first-cpu-index'
 property
To: Luc Michel <luc.michel@amd.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Francisco Iglesias <francisco.iglesias@xilinx.com>, 
 Francisco Iglesias <francisco.iglesias@amd.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Alistair Francis <alistair@alistair23.me>,
 Frederic Konrad <frederic.konrad@amd.com>, 
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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

On Fri, 22 Aug 2025 at 16:17, Luc Michel <luc.michel@amd.com> wrote:
>
> From: Francisco Iglesias <francisco.iglesias@xilinx.com>
>
> Introduce a 'first-cpu-index' property for specifying the first QEMU CPU
> connected to the GICv3. This makes it possible to have multiple instances
> of the GICv3 connected to different CPU clusters.
>
> For KVM, mark this property has unsupported. It probably does not make
> much sense as it is intented to be used to model non-SMP systems.
>
> Signed-off-by: Luc Michel <luc.michel@amd.com>
> Signed-off-by: Francisco Iglesias <francisco.iglesias@amd.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

