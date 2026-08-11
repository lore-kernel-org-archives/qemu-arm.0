Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C0AC5B572
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Aug 2026 14:46:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wtnk2-0002Ld-1Q; Tue, 11 Aug 2026 10:46:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wtnjz-0002Ku-6j
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 10:46:07 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wtnjx-0003ZN-GN
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 10:46:06 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-7ff05e5d009so35447487b3.1
 for <qemu-arm@nongnu.org>; Tue, 11 Aug 2026 07:46:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786459564; cv=none;
 d=google.com; s=arc-20260327;
 b=Ucc2XLfAtiqE7UVSYmyyReX4ugzlbYKXXF+m9ufjGN1QkAY5WaLIVg+dfQc7rkOtuo
 PgeUy7EqlkW2npMRbSBJIjnc6fYA/S6fc49I6N9W/VRQksALqhSPCGG6OCTNzMzdCCaJ
 k2hnpnG9gGdLX+ZZPaJ/Tb8GHrlV22wZnxyZmjfze86V8zIT4zTwc95NSDPO7a2Se2PU
 wSsn7nyGIf40WMTO6iwFG4noQvyFRGpbu4rDY9DwN4W+OuwWXEgvoBekX2GE2iontHGU
 fGOY6qZjd62uvAY2p2Xew/P3Z43SBcBf8ymc0NWOy+K6AKRGxiNYANFAse91zQd7E/Gb
 vpxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=U363yjl95zUvpvGaT8oqi424jEa6U9SckoONTniyMnc=;
 fh=XkPztLzevn55zJjb7iTHoaxSg2NuiXLVUieJQtrpE3o=;
 b=CoZKo4e4TJZHfdg8WpLd39leV5yda3B+cPCPgPqrYJYUxH2nlFy3SATI+pB0klcBFs
 KmWy3UZ6K2vqzG794tqrLduvRrp4J80FFQWUUYGsdgjoxBz3EVdJAj6c6ynVakuHMMMm
 Rbxi1X91veXs9JoDbsVjk9sP4nSOMyU59VKF9ZsSGIOOjBrjxWH8ddcC95H1kF5nP605
 16PoqPfFnytwth1IpANYAYXvwRL+POL+zQIK+SsK3gLZkmxtVffS6MZGwQ9aQaW8FZay
 YBBTLcVG+ukEUD5kzoQMZksyySMwim5+wULdC8TGYR5U6dpyXUA60lRHzo9fx+cKhQhs
 a7MA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786459564; x=1787064364; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=U363yjl95zUvpvGaT8oqi424jEa6U9SckoONTniyMnc=;
 b=IalHogeE9RsTE99MmpCGzniC3uhG5K4vkZzPyXQLhn5FQ0RAPoeB1T5eEg7QM6KbXK
 +7pHMTVPs5llDkyaVqTXqnm+Zvbi3zH3xbsCIgfDnxYwoRRUJmTX+L2svNwLOylgLoKW
 slojcfeYFxOH0l8/a2F6wC4EnO5HqYTo0Zi4PfSsJRyn+H+xI3YwywDlSnsvIjkqPqZr
 tuG00+WFwFMaTBAVwCSe+O4+q/FvU6v8skuddjdZzcIK4ptApXMtmuN9355a4Un0BK4F
 qhclbd3a0Nziy1mh0NsjDVGM999utV0DEljy5LJH38DYpPHSo7i/A/Tz9Ss9b78MrsFj
 l9Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786459564; x=1787064364;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=U363yjl95zUvpvGaT8oqi424jEa6U9SckoONTniyMnc=;
 b=FeVf7tW7Ki2NjPZNy+0IUefMbKt6gRTW9hKpZviCG89371K9G0t4Qqbc0h/WcYh1d+
 czKeulrbEPliUOJdmvmL7eG3lV5tDr4Wx9VSF5VPPnVUxk9ZtOTdVhv3vwzIA1OA4G7s
 Bib9Hi8XXf7Youn7+1q29+mvLMp83hk9Ek/Bde+5RSWjr9y1116sCjJASDWhxwlXTEV1
 J+cHT0KmbAN1degXMWTNklrHzo20dp5mzrcBLpBgx7bXj2tkgsdsdfxieNgbjbHMh5q6
 i6kqAp2FlOi3B5ngLCPcm4dKk4GGEow0EG+Opin3IwWm9fufmEGrBbqISdL99/n/YNoo
 L9Xg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpOdQ8ha9zjw38eh5rz7y5dhHKefore21N6EUm6KrjZQiUV7aOUuePIDDx0XGHp59lTtKhl6O4rDQ==@nongnu.org
X-Gm-Message-State: AOJu0YxbDJD3lJHm8IzDbx6NrQqWQcGVpDvA7nMojF890vGf7g2JdEfb
 Qde/DJNA8JRo6BwfMaKvz/n7hws80tAQJe7IKTFlheTHGL7GIb/jI9nqbPur70s+uB0yLjSG1+8
 MB3Af+kpcfm56FB1tOCZQeMLdc631sAAf88JVLZ7d1w==
X-Gm-Gg: AR+sD10NSR6hfzsXa0TCpObytm/feC89e3jyI7DehAvAsy1VgROdDgjCitGXVTVfzhM
 bSyGU1wOsKrDYXza8S9CdaqXfhLwxv3KiXvRggNvRMetkYUGasRqVLD/lWqENI2IythLfspnGbD
 XpV5DJ5GxhvwH8f8fzfyjmS4pQTyD4Fl8JAsuWJQSitpLfzIjxW+6SZgALa5dMR/q3iMP9gJ+wV
 NCfvIhSPeFGbbl9P6no8AbEsvWKYqAD8a660JwHVx8ErMUC3QKo6rnv5MBVzQP7LPlsIzyYFGhc
 7OK9ysYnM1647PH4U6NQVZWsteL07NIezoU8VCOSkrANUWhpki61ZqJTYX0vW29ot18d35iaKvi
 6teQINQiRBDSYKjbD/6wXfHHmqSOdnXshPHekKprb
X-Received: by 2002:a05:690c:399:b0:81f:27f8:2de4 with SMTP id
 00721157ae682-8303d4d3d23mr5852507b3.8.1786459563424; Tue, 11 Aug 2026
 07:46:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260803193635.4153664-1-pmazzini@gmail.com>
In-Reply-To: <20260803193635.4153664-1-pmazzini@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Aug 2026 15:45:52 +0100
X-Gm-Features: AUfX_mzJDWbp3lU0a-Ayto9xlD3vtqLfKr1KfJ51dbm9AekNeJcS2ifw7Lz7GBg
Message-ID: <CAFEAcA8H0f6FjkQJJM=qp0CoXJCX1Ow81ac6v8V7xO-jpQzfEw@mail.gmail.com>
Subject: Re: [PATCH] hw/misc/imx6_ccm: add the i.MX6SLL variant
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: qemu-devel@nongnu.org, jcd@tribudubois.net, qemu-arm@nongnu.org
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

On Mon, 3 Aug 2026 at 20:36, Pablo Mazzini <pmazzini@gmail.com> wrote:
>
> The i.MX6SLL shares the i.MX6Q clock tree, but reports its own chip id
> in the ANATOP DIGPROG register and implements the PMU and XTALOSC24M
> registers that the i.MX6Q does not.
>
> Add TYPE_IMX6SLL_CCM as a subtype of TYPE_IMX6_CCM.  QOM runs the
> parent's instance_init first, so the subtype only has to override
> DIGPROG and widen the decoded ANALOG window to cover the extra
> registers; the i.MX6Q window is unchanged.

There's no user of this new type. We prefer patches adding new
devices to come in a patchset that includes support for whatever
their user is.

>
> DIGPROG is a hardwired chip identifier rather than a reset value, so
> move its default out of imx6_ccm_reset() and into imx6_ccm_init().
>
> The analog register array grows to cover the new registers.
>
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> ---
>  hw/misc/imx6_ccm.c         | 39 ++++++++++++++++++++++++++++++++++++--
>  include/hw/misc/imx6_ccm.h | 12 +++++++++++-
>  2 files changed, 48 insertions(+), 3 deletions(-)
>
> diff --git a/hw/misc/imx6_ccm.c b/hw/misc/imx6_ccm.c
> index 45fdd0d5a8..6f48de5954 100644
> --- a/hw/misc/imx6_ccm.c
> +++ b/hw/misc/imx6_ccm.c
> @@ -223,6 +223,14 @@ static const char *imx6_analog_reg_name(uint32_t reg)
>          return "PMU_MISC1_TOG";
>      case USB_ANALOG_DIGPROG:
>          return "USB_ANALOG_DIGPROG";
> +    case PMU_LOW_PWR_CTRL:
> +        return "PMU_LOW_PWR_CTRL";
> +    case XTALOSC24M_OSC_CONFIG0:
> +        return "XTALOSC24M_OSC_CONFIG0";
> +    case XTALOSC24M_OSC_CONFIG1:
> +        return "XTALOSC24M_OSC_CONFIG1";
> +    case XTALOSC24M_OSC_CONFIG2:
> +        return "XTALOSC24M_OSC_CONFIG2";
>      default:
>          snprintf(unknown, sizeof(unknown), "%u ?", reg);
>          return unknown;
> @@ -237,7 +245,7 @@ static const VMStateDescription vmstate_imx6_ccm = {
>      .minimum_version_id = 1,
>      .fields = (const VMStateField[]) {
>          VMSTATE_UINT32_ARRAY(ccm, IMX6CCMState, CCM_MAX),
> -        VMSTATE_UINT32_ARRAY(analog, IMX6CCMState, CCM_ANALOG_MAX),
> +        VMSTATE_UINT32_ARRAY(analog, IMX6CCMState, CCM_ANALOG_REGS),
>          VMSTATE_END_OF_LIST()
>      },
>  };

Adding new elements to a vmstate is a migration bump, and at
minimum needs the version ID numbers to be incremented.

In this case I would favour having the new register state
in a vmstate subsection so that we only migrate it for the new
device type, and the existing device's migration info doesn't change.

> @@ -474,7 +482,6 @@ static void imx6_ccm_reset(DeviceState *dev)
>      s->analog[USB_ANALOG_USB2_VBUS_DETECT] = 0x00000004;
>      s->analog[USB_ANALOG_USB2_CHRG_DETECT] = 0x00000000;
>      s->analog[USB_ANALOG_USB2_MISC] = 0x00000002;
> -    s->analog[USB_ANALOG_DIGPROG] = 0x00630000;
>
>      /* all PLLs need to be locked */
>      s->analog[CCM_ANALOG_PLL_ARM]   |= CCM_ANALOG_PLL_LOCK;
> @@ -763,6 +770,12 @@ static void imx6_ccm_init(Object *obj)
>      memory_region_add_subregion(&s->container, 0x4000, &s->ioanalog);
>
>      sysbus_init_mmio(sd, &s->container);
> +
> +    /*
> +     * DIGPROG is a hardwired chip identifier: it is not affected by reset.
> +     * Default to i.MX6Q; variants sharing this CCM override it below.
> +     */
> +    s->analog[USB_ANALOG_DIGPROG] = 0x00630000;
>  }
>
>  static void imx6_ccm_class_init(ObjectClass *klass, const void *data)
> @@ -777,6 +790,21 @@ static void imx6_ccm_class_init(ObjectClass *klass, const void *data)
>      ccm->get_clock_frequency = imx6_ccm_get_clock_frequency;
>  }
>
> +static void imx6sll_ccm_init(Object *obj)
> +{
> +    IMX6CCMState *s = IMX6_CCM(obj);
> +
> +    /*
> +     * Runs after imx6_ccm_init(), which installs the i.MX6Q default.  The
> +     * clock tree is the same; only the chip identifier differs:
> +     * MXC_CPU_IMX6SLL (0x67), revision 1.0.
> +     */
> +    s->analog[USB_ANALOG_DIGPROG] = 0x00670000;
> +
> +    /* Unlike the i.MX6Q, this one implements the PMU/XTALOSC24M registers. */
> +    memory_region_set_size(&s->ioanalog, CCM_ANALOG_REGS * sizeof(uint32_t));

memory_region_set_size() is really for MRs that dynamically change size,
not for fixing up a size that we could have got right in the first place.

I recommend that you add a class struct to the TYPE_IMX6_CCM, and give
that struct suitable fields that define how the subclasses differ (DIGPROG
reset value, whether XTALOSC24M registers are present, etc). In the class_init
function for each subclass you set those fields in the class struct. Then in
instance_init you can look at the class struct to see how big you should
make the MemoryRegion, and in reset you can look to see what reset value to
use, and so on.

hw/misc/npcm_gcr.c is an example of this approach.

thanks
-- PMM

