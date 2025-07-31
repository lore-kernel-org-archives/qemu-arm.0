Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC23C87FCA
	for <qemu-arm@archiver.kernel.org>; Thu, 31 Jul 2025 18:58:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhYTj-0000qw-LZ; Thu, 31 Jul 2025 14:58:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uhWdP-0003X1-I9
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 13:00:03 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uhWdN-00084A-2f
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 13:00:02 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-70a57a8ffc3so7167657b3.0
 for <qemu-arm@nongnu.org>; Thu, 31 Jul 2025 10:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753981200; x=1754586000; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=I/QdUExyxeoIn3Ie7jtOvGkz9OaEB1WD4HVsvBIJL6c=;
 b=vKmOvicfqemAiuGchsqTJlDntB6+6KNZuw6J1/R6oFKabzK44W/IcCbEu4+b5MQQJi
 bmgfVy95tk+sWOti75MiqaZlMov/vBMzqhjFuNkUWZ7wiW+FUHgmSXg+y/+RwPgE43y8
 dDDJLbmGa65+uluTcOxrOt31KCNZhgVIDA8BiahPFn/R0VkIIs+uZPl1LmkQqyxh0GYZ
 VQBOENLcqtUBOtu3txPMVOFg4k5LWdjRAL8nnyYfaNorkGGWJOw/uSzTAqLSDUEdJz1o
 SA4P/BIyj9J8Ecw4HMp+MrxHnqSj7jmcjI/L0GK1eXqdHSBfOoCbUX4hX7Wo2CIGTZVz
 oliw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753981200; x=1754586000;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I/QdUExyxeoIn3Ie7jtOvGkz9OaEB1WD4HVsvBIJL6c=;
 b=mJTXEWoxIs4ODjpR6nw1EUlswM9JCAmWg3bNR7xkZ35nfcmpqhVexmutMBSJ0vLJoV
 vy3uDxakAb6i6WsTlOTtzNsmIUhD6UAA+z+Y2Ge5PsqU65wjBL76CZdEaMiYubTxTBGE
 UJwxABrAGaO/syqPG4I31RrV9scKLOyEuIyCQVCq/VCC7tguelzT9lyqtVvvv2i1nNJu
 TNobOh1VPVPbPwqIBacaHA1xb1x3I4ue8iViu6siJBT78jrOfcJG3085uFSrRsNfH+oG
 8+aqjiRyBOxKQhJAmMXTb8DhQYBbSZOZncJTEBwtTzxUWm6uDv3URRtwyIyDpgDaV5u8
 +Qrw==
X-Gm-Message-State: AOJu0YyaNOfOZ8lf6IbH1IFZl+cYlMrBQClirXWLT6DjdImPJmyVVXtR
 0YeoNkFnKUoc9x2eMv0dxxo81uxcHGPV9cRzZ+xjO3FMxkoF01VNPD66LQcVDNQivRqvlDugzqL
 1LByKi5xfSdVPPkHDy+R5ofxKex7NLEB66xn7zQg+Kg==
X-Gm-Gg: ASbGncsc2CsOg6/U+VqDxFQCKlsImhpY98djprUsrB6dNUiNnNvZoSJ925ZtaQK6Ju7
 9Z49CvsdQAJz5SaWzAmU7utdfHWpT3sicW80Oy4vkdlGzRoazNHLjzAMzfbBGJOtU0GJ5DctKoO
 xEPEWv/ExI6S4Z7p+nfpdwdT/QiJCOr7Ili/BF3GmAhWPt9qRCF61bbI/7rjtPV62RuUlORZelR
 NKNN3jCK/LykpEfPMI=
X-Google-Smtp-Source: AGHT+IEHeCi154ufw8n/JziqK5XigPSaPokLE2oYkC8ZJofg5wIbQm/SV2srA35RF+QA0lLRVyK5gHjMT5bMIMuN+Rg=
X-Received: by 2002:a05:690c:6e04:b0:712:d54e:2209 with SMTP id
 00721157ae682-71a46574fe7mr106734067b3.14.1753981199605; Thu, 31 Jul 2025
 09:59:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250729161650.43758-1-zenghui.yu@linux.dev>
 <20250729161650.43758-3-zenghui.yu@linux.dev>
In-Reply-To: <20250729161650.43758-3-zenghui.yu@linux.dev>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 Jul 2025 17:59:48 +0100
X-Gm-Features: Ac12FXzfWvpsNFEbAGpVtqbT0mFTyZWcgVM6W8aO7oR0WgJBzaM2UJx7cYzV5WE
Message-ID: <CAFEAcA_xS6fy+rWt5g_uAgG0nBwEGFts1GZfqSLF0T668WLuiw@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/intc/arm_gicv3_kvm: Write all 1's to clear
 enable/active
To: Zenghui Yu <zenghui.yu@linux.dev>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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

On Tue, 29 Jul 2025 at 17:17, Zenghui Yu <zenghui.yu@linux.dev> wrote:
>
> Writing 0 to GICD_IC{ENABLE,ACTIVE}R architecturally has no effect on
> interrupt status (all writes are simply ignored by KVM) and doesn't comply
> with the intention of "first write to the clear-reg to clear all bits".
>
> Write all 1's to actually clear the enable/active status.
>
> Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>
> ---
>  hw/intc/arm_gicv3_kvm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
> index f798a6e28c..6166283cd1 100644
> --- a/hw/intc/arm_gicv3_kvm.c
> +++ b/hw/intc/arm_gicv3_kvm.c
> @@ -295,7 +295,7 @@ static void kvm_dist_putbmp(GICv3State *s, uint32_t offset,
>           * the 1 bits.
>           */
>          if (clroffset != 0) {
> -            reg = 0;
> +            reg = ~0;
>              kvm_gicd_access(s, clroffset, &reg, true);
>              clroffset += 4;
>          }

I guess given what the kernel has implemented that this
is the correct change, so on that basis
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

I don't understand what the kernel ABI is trying to do here,
though...

My expectation for user access for all these registers
where there's a "set" and a "clear" register pair would
be that they behave the same way. But looking at the
implementation, GICD_ICPENDR seems to be implemented
as "reads zero, writes ignored", whereas GICD_ICACTIVER
implements the "write-1-to-clear" semantics.

This seems to match what is documented, but I don't
understand why we implemented and documented that:
https://docs.kernel.org/virt/kvm/devices/arm-vgic-v3.html
rather than a more straightforward "for userspace, you
can just read and write the state".

thanks
-- PMM

