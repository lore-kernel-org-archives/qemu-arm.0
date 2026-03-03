Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE40EC1432
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Mar 2026 11:25:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxNrz-0005CR-VB; Tue, 03 Mar 2026 06:24:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vxNrx-00059v-VC
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 06:24:54 -0500
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vxNrr-0005tv-Vd
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 06:24:51 -0500
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-64c9a398bc7so5270228d50.2
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2026 03:24:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772537082; cv=none;
 d=google.com; s=arc-20240605;
 b=lr3ruE/Ug/xhDpLckdmUhYVCA0sFhu5UfOxTj8KNu6xSlSNaIcn08PgZQoROsduXih
 dcKAPHu1rwtIxy61lRGJCSB2ZB0W3Lbb0tuCWKJZcQFVw6rnDnKC0dGjIQWOOu9v6Nh7
 3ifP/kzPR4U2NbeN8Jfz9u7DCI5eP37z/QFEs6dr6ggDV3emBJDyRdVNb+KvRdLAQNij
 RqOHg6eg9GZk56zNxZ84i/m9dKuDB1HSqCoV+3Rute5xwC1EBPoykpB6iOE26dQHIl+T
 YOgojSelLYHPxXMBVGQvd8twQhzm3mXrlmmnH/EU2L9irvspr2gAra+XLTq4ls24MEvK
 rp7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=zhG3lYnK8prcsi7F0qfSX28vrAi9TRvqJXR8s+2eSKI=;
 fh=rxG5dnsxnPevRysxN0vqvLVC/so/YmLInIsYTOZElhI=;
 b=iAlEN1aJEBZeY6OCuY3eZvd4QzTrSxE8WphCl7l4k0ZSP5vjsbbP24XjQF7HhkVA9o
 OXcGggubwQWKuH/3BiroXLxa6QAeeRzL/9dtb3zLAFZLE8lTIdFIAbWFUOohtj+KaIV/
 rIWbik5QUcgIiz1+bv/aBa1S7ofuTKOJlKxqg7PhAEtIe9fg9+9RUPNMdFls0ELuXrG3
 y+LimrNI8yxnQkbkKE7lydGZOWiVDzde55EkZu864Z+WGLugDeJYQuZi75/BwY4KQvoK
 q9K9WLJUPUREhJsHQIfkkM1NLsU8rGV0l2ceGDdJQu7bFFPChywLAR+y3oD4K6Iaufsq
 ZZUw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772537082; x=1773141882; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zhG3lYnK8prcsi7F0qfSX28vrAi9TRvqJXR8s+2eSKI=;
 b=XT+A1tx7tzFraN+5lWuejEuAgAQI1joo82zgs1vm3vbAeAVWMEimmVY0NYL2Ribzl+
 tonqEIJTel7og1w+MfplTC3IqAGNRyqULF7ZTmD/MiC8O8fn1HQ12t5S+E0vO9EzIOxg
 WK/xVfWss6WxrUY2/wcrGXQM4zmMPUtxtMMAmbOhhpE4jT8AeVB3O45VEbEebfBlX/rI
 0eJes7eUAoaojSaaOtprJlA86uBn5My2Xo7mJQ3JEiy/NXzWDvPGpsK0FeguH5t3et8J
 6xuLLSHFnY3rkDS5AJyL2EinidojMuVg/SdFm51M/dkPc8noW/U4jf7K3JLYBM+tX6Ke
 hZ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772537082; x=1773141882;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zhG3lYnK8prcsi7F0qfSX28vrAi9TRvqJXR8s+2eSKI=;
 b=fcBddvPn57HDo2C7e3U3SslhndjuPBGfakY1sTYpjCmRzFMK3BySjgm51p3ZJGoBmA
 PAXeYWaIvLko344eGu9hMRIoFECNEIB1JJ3aj8GN5myw3+r6r1GtYjYJZT+j2xkVIlYr
 DGr6EJEnPuiuPj74FO8lt2RLt3r1na+my91tFtehe/8Dm5xx2wLzD4s8AEjLKcJYELZ5
 84sWNPS8ADINQqujqeAgPLkFuFJWlyMVt0FP1rfln4YNV2SU7BTm9ByrEpLD3fAaThbF
 g9yJKapAREu4viZGIkUfG8krzUwZxiofOCtA113vVei1Z9aXcICCX42FIrKaONu5TLJ7
 VydA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxbRdDCJ94YlbyOd7SMwPRZKrWghdIXbQ//hqftbCHQioGiiS5TdonPgPBfwBkI6iIcx9BtpblXA==@nongnu.org
X-Gm-Message-State: AOJu0YzOzV6MmJgt6bPIOmxUNKCNiLTYFk7spgvFejfsBRdLQJNLeTUN
 O4AlpD7cEdAVdg4SJqs8ZVlvu3USC9UXVBdR6LMopdUbOI06EGPzboxHLNH+7ILlOCTmAIBuFCC
 yr5YbKhViwxSOoNeCY4BaihAUM48l3w7leYKFz97Wfw==
X-Gm-Gg: ATEYQzw+9Vgp8TlhYdQG0L9nFQQpZv3Cgb/8DGtCKoPm/FtNO65iUttjV4re0oOt546
 kSasuIKRb+VTym11rPqxzJJ85EN8+XVxUe1nrlsuBdfzYk/mKymkp6LSXOUsVUwLMY0BlZJSikm
 Qfw73VraiDE4B1dXG1Dj7+QRF0VArHxto5Af0Yokk1PW7zezMG/p5KiwKxG6dh/cOs7qkPx13Ru
 zyhtFc1loJ0FFs6gp1chzusODgagrHzLkjdWwAzwCXEmPINyE4SXglpiNX33ENGTDLyVSB7nho/
 gWuq3f6odJJdRogrt0C/XxDkDq1CLskJ/9Et0ixC865BkeCmeMRJV1Tp8MpGnOQpYYY=
X-Received: by 2002:a53:ee50:0:b0:64c:9fd7:676a with SMTP id
 956f58d0204a3-64cc232ff88mr9551234d50.83.1772537081841; Tue, 03 Mar 2026
 03:24:41 -0800 (PST)
MIME-Version: 1.0
References: <20260302220254.1166849-1-shentey@gmail.com>
 <20260302220254.1166849-3-shentey@gmail.com>
In-Reply-To: <20260302220254.1166849-3-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Mar 2026 11:24:30 +0000
X-Gm-Features: AaiRm53LIb7RBQx4Dg__eBLCxG62Y9LFnIFLhHGYRErqmRo5b5dg2rPrrxBWhHE
Message-ID: <CAFEAcA_fPRxPdcGtTKG1Pj7rw5XeSK+mnrnh9oK5Xhou=LoVNQ@mail.gmail.com>
Subject: Re: [PATCH 02/12] hw/char/serial: Remove explicit cast from void
 pointer
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Helge Deller <deller@gmx.de>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Troy Lee <leetroy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb133.google.com
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

On Mon, 2 Mar 2026 at 22:03, Bernhard Beschow <shentey@gmail.com> wrote:
>
> A void pointer asks for being casted, so C allows for omitting the
> explicit cast. Take advantage of that.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

