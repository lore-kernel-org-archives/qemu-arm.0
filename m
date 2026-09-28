Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B775CA5FA1
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 18:05:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBFjU-00064N-85; Mon, 28 Sep 2026 14:05:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xBFjC-00062E-B9
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 14:05:32 -0400
Received: from mail-yx2-x0e.google.com ([2607:f8b0:4864:41::e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xBFjA-0003Y5-IT
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 14:05:26 -0400
Received: by mail-yx2-x0e.google.com with SMTP id
 956f58d0204a3-672c2880f58so3192593d50.3
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 11:05:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790618723; cv=none;
 d=google.com; s=arc-20260327;
 b=P9CUin7usyJm2ykGxcfHKG6zdzYzKVuA1xt4yI4CuqE6o2OqZkyAiMwFvLvtTUftSW
 BZ29ofAJNCjCePpX8C5kxXmzPd3K/bbODqkrlPg2283VdL9KrN44LE1VXu/t4QvyES5d
 XqnNV3h/GIsxhHAtvBN7S2KNZCTEBymGRN6sFt6/6/pv1yb7IXL3GCEeL34J2dHi1rza
 zchKNIrhVsdqskQu/RoJCkec86CDW9W8FgqTkbrbtrtRz9sF8LySvtzDLlRsB+ytI4Gv
 4UDQqSn0gC3Q0HfXcIaayy0NrnTmA/M1dIuIeiD3BqkSVt3bz4ddbAoLFQ2fK9jtxSdU
 6Ihg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=wAHj7yB6+hyjeccZw1OjSROT0wPZuQBNT+jUXfK3d40=;
 fh=p6foASWR+NtxjVZUi614K084Hj3ByKwU1vYcspuQfAU=;
 b=Ju46iBx8jg8DDBJQ2sT3EaXiWaVe419dZBJcPDbZ0VkACq4nqLn/BNqz2LCU36VKIF
 WBzKx0QLIj+1XxbOrNmmKUt7XzKlY/q9hZUFXtRMO3VtNQE6hnvga9gzt9fQgZiCpRdR
 gWyf4IsaovrgKeVxvhZyIBrHe552UiUtKT6c+Yr4MsvjZKTC4ILMdBw8vcyy+C2eOGcs
 yoyvVjHk4xOhOJ4C2JjQZyPMmec7FJwe72VX/F28tsMcr6Cb9OFhlw965yYM+Q+xftPz
 pAB0ammnoE2pBwN97Yo+g/qhDLoScs8GWQ4DZnOw43nIf/wQ0Adej29b6KKa1ltUr35y
 9euA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790618723; x=1791223523; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=wAHj7yB6+hyjeccZw1OjSROT0wPZuQBNT+jUXfK3d40=;
 b=OgvOxJaagpUv6BYSeT3bXGw5xGbgBYm1ENMEOxyEXOcM+QwZzwlwRhkOd1RsMSoBLz
 2rY5wmmBopal6f4RmGSPE4Z0ntnnvNW+PqUct/bGhuM872O2/TVWBGr4T6DMDQdNoBCU
 2whlS8yNHOX/xEimseogOczGRnakBl0E9J5RsNutFG45rB/GBM6jvVxoNHUwrZGgfBjW
 wgvvw0qxUuiMspUDc+WAbtnFQLtbEO2mJzxhSfUzs3IrudmguAKhWnZpDyvDk+BF+PwC
 nrjfwDN8uPOGRUoLfN9vVlHGEXlgBfQ0bsJkm5IXvxzn3bhIv0nI1JJgE/iqN1O7nh2x
 rmpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790618723; x=1791223523;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=wAHj7yB6+hyjeccZw1OjSROT0wPZuQBNT+jUXfK3d40=;
 b=R30glkHGiU0mzgESUqG5jLwU8BPENUOWdaYy3tLUFVrqkokbVjt4gOeCdO2EKAnSIf
 F4dbyF+mEvPsB5xeVT2u6jJDcJ8f1jDcyM3tAsaYewh6M+vzT6/Bbcmts+IqsZw+3SWU
 oIlikwWD+478txVFXm+noCfRrZe4S7T0F+5yicjPlWdFEKg6fEjlFIuTzekwrVZnqel+
 UPBwM7PHPCkIEDObsi0VmYAZy9YLY0is1BbtKaepRc0nbK9KfbPeInQdDcZ8M7WsOq/C
 4E5wb64kvsEEVKe2RrypWqVdHjfNPGRxv9Sf6eXUwFiJ/pzWki95wR+Tfgra8AEX8g7j
 /4Mw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxeUdwJ6EkJeikg3/XjCRpRR81B3pbboR/wZOpK4k0KMWq/cL3XERzR70BcIi52mHXyzQGtJ3eEPQ==@nongnu.org
X-Gm-Message-State: AFq9FYL8hfZPxjr219h8t6juXfCmxU8M/sxOtYh2l9oprHKbMrkiyehT
 2mBFKV4k9fTbckZQUrxOBl1nxIv2yDogbuqQFUV+WTZQsKJndUsHLjbnC1l0ox0OvgZSG6phktR
 CbHGU/SLfqm3DHwmHqXslPnRZAV7tKXCfbAdINtd8yw==
X-Gm-Gg: AYBFou2EPmRf3v8AgDHyhQec2PEX/f88vuYcqTPapX9fc+pbiKOLhRcLiJjHf30nDvK
 FXOBcuDUOTNsbfGKHD/DVz44/G+u3cDBmXpGlE80HrYzfUqBTj8RzjbE658Pb0jUu39Fd87I153
 Nf48Zje2iIHpeEQylYViHs1aRpUaKh9C6hkoFaMWtkiKHVDnZ6nqmpzqwm6GPseG1r6g1CFbWz4
 I2HSddIeLMzL5+y6OY9CWX7zPNUzc2txNps7ccjcrno3Xx7ySI5Vhz05gYXz/5S8iJ3HK8wjUhy
 N4YXHAU769bYRLOaT+wU0cW229Lcd12tLWLCOyhHmkjTKABLEAKY2BCEn+96i3XD3aFVBTSl1dw
 X0GSJ4SdF/yx2eaoVy+glej5cC6i1PcM4/P7QKvsX
X-Received: by 2002:a05:690e:810:20b0:671:541e:2bc7 with SMTP id
 956f58d0204a3-672ed42dc03mr4063259d50.58.1790618722901; Mon, 28 Sep 2026
 11:05:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260921214710.29422-1-shentey@gmail.com>
 <20260921214710.29422-5-shentey@gmail.com>
In-Reply-To: <20260921214710.29422-5-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Sep 2026 19:05:11 +0100
X-Gm-Features: AclHuK-3d4xy9LTRK37sGYmfoU7UgCiFS38yARawsolNfdcvG6jtyI9B4aN-0RE
Message-ID: <CAFEAcA_+nmV0WvoD0OCExmJ7sQdY2T3dvd7ZipbkNuj-RuZQug@mail.gmail.com>
Subject: Re: [PATCH 04/42] hw/arm/mcimx7d-sabre: Ignore memory transaction
 failures
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Phil Dennis-Jordan <phil@philjordan.eu>, 
 Alistair Francis <alistair@alistair23.me>, Alexander Graf <agraf@csgraf.de>, 
 Jason Wang <jasowangio@gmail.com>, qemu-arm@nongnu.org, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:41::e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx2-x0e.google.com
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

On Mon, 21 Sept 2026 at 22:47, Bernhard Beschow <shentey@gmail.com> wrote:
>
> When using mcimx7d-sabre with newer Linux versions such as 7.0, the
> machine fails to boot. This happens due to memory transaction failures
> since the address space is not fully covered with unimp devices. Fix
> booting by ignoring memory transaction failures in the machine.
>
> cc: qemu-stable
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/arm/mcimx7d-sabre.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/arm/mcimx7d-sabre.c b/hw/arm/mcimx7d-sabre.c
> index 65fdb19c06..8d223fca6c 100644
> --- a/hw/arm/mcimx7d-sabre.c
> +++ b/hw/arm/mcimx7d-sabre.c
> @@ -83,6 +83,7 @@ static void mcimx7d_sabre_machine_init(MachineClass *mc)
>      mc->max_cpus = FSL_IMX7_NUM_CPUS;
>      mc->default_ram_id = "mcimx7d-sabre.ram";
>      mc->auto_create_sdcard = true;
> +    mc->ignore_memory_transaction_failures = true;
>  }

This flag is in QEMU strictly to allow us to preserve
backwards compatibility of behaviour with the older QEMU
versions which pre-dated the suport of transaction failures
(and where therefore we expected that if we just enabled it
globally that we'd break previously-working user setups
because we were missing some devices). It should not be
newly set for any board model that isn't already setting it
(and in an ideal world we would eliminate it from all those
old board models, except that's a lot of work for mostly
ancient hardly used machine types).

Instead the fix here is to identify which devices we need
to provide as at least unimplemented-device stubs, and add
them to the board/SoC.

thanks
-- PMM

