Received: by 2002:ac2:593b:0:0:0:0:0 with SMTP id v27csp1240404lfi;
        Fri, 2 Jul 2021 04:05:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhvIdGcdEdDnTaYHsqSIfni/i6NBFOgv28w/IbQDpp7bPgFx5VWDtMB85HUVMguykLeQGb
X-Received: by 2002:a17:907:1b1b:: with SMTP id mp27mr4645113ejc.538.1625223916862;
        Fri, 02 Jul 2021 04:05:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625223916; cv=none;
        d=google.com; s=arc-20160816;
        b=mF85+4m18Akk7N7zhdLeSHk7ATAjKt/XRj4tEE/ELHrZF+B27gl/8ml3YigHU0Vvui
         Ec/4aZWnHqUYc0VS1DSL0bDX66/FmrQCCBET4YD4uGKLVoi9ogGuAKd/1kWq9XytaJlS
         x8EPqe2aRvOGSqhMLWvWUu0kcAd7ZzjT5Yu4RiO2VcSkgtTr98o2+LtUEBG4WoAL/pZI
         ohytx66k69tKttwsOPylRGQ6SW+8IHztY2OVT4c8ElV13DZbdJC7Mil1HzzMdtfyyGyE
         Rbz1mLTHJ8gOu+U3UnjV67esqW3hduaRAMYC16ljWmRUijlFBoD4WFeCBzUTW+DfvkIt
         EYxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=3UpXLrUcUVHsR+PTTArmLpUrfX2es6cKF/X/Qy81ie0=;
        b=CRBN7nPhQVmjc1jqnmTzc8A1nV1aav6b6WFFxsawFqah7Ymt58G94v01XfRE0RpPPw
         UKpkvBIf9ZOEyvo6HUP0fCE476Rt3vOYRuJkKQiTQBFkXYRBUVKS4JtfqQ1usdGT/nox
         mRGYxd9dVHA2o81G9sLd8ZZaIUucVz6wsNoMxSJSaIFYAT8FYeqYZOzshhq5NDz8mHFD
         Szhfdh3IWQ96ihIAANNC2+dbzXsW4lQbxJK0oqh0SEk1ws4y/ZxieU1Kdj7x1HvsVl6n
         cLHgZVU73fYn4wPKKMpXE5k1KzQ+IIsjYA9XOC3olYprrvTWXneAzA/rarT1SIkL+Zqg
         9L7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=E3gTZ1e7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t15si3775655ejx.409.2021.07.02.04.05.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Jul 2021 04:05:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=E3gTZ1e7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lzGyx-0001X9-9F
	for alex.bennee@linaro.org; Fri, 02 Jul 2021 07:05:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzGwS-00076w-GG; Fri, 02 Jul 2021 07:02:42 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:41504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzGwQ-0006yo-Is; Fri, 02 Jul 2021 07:02:39 -0400
Received: by mail-wr1-x431.google.com with SMTP id u8so11943989wrq.8;
 Fri, 02 Jul 2021 04:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3UpXLrUcUVHsR+PTTArmLpUrfX2es6cKF/X/Qy81ie0=;
 b=E3gTZ1e7VqKQXHUF6yOctkqOkQcV7RMxjKlfcTBQWPgVdcFv90yQ5BX2aRxPkczh6y
 c5ujGtd4vcElaHDzQlysiX6ObMb/vKKXsAKiPcYLpZ+GuTr7u7RZ2DZxHqyLrQOfnSyd
 yom6aj3/VTmPBxogkgiRTynD4fS3Q+qI/il3H9lpiiWNrfE+4Jzj3t2TXB/i94+qkAtU
 H7l3S1yO6Gs/ur1hml+cRyQsgx24cuObiPiTXki1RbWRcW00815WbTkVn6ES4shEqPjb
 i+6AJcp3esxSY81gOMSNiPKmkCz2aHDY4iegGb1negPs9wGWNrL+pG4m2Lc9zoQ2gb7s
 nkbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3UpXLrUcUVHsR+PTTArmLpUrfX2es6cKF/X/Qy81ie0=;
 b=Yt0tqxub4KJTXMuLg8W3D8SA4Qch4TguR529hhExxgLrfNMH58xwZ+KrEr2ZTHxP0w
 OYP0JEXexSM3Ko8nxowZwxAjGvSb3t4nJ/Dn4/GmTaYTThg5EMf+mu1m/S0kAkkSrqSx
 f7Ux8UE8PTjyQgNLgQZbDPBssoRJNrANB+8u5PNkxPJzSpc4zP2iFFEZeZfEZmOH2dOb
 6T9WwEOVZ76sPVsdj7Ch80eiYZl4GgLTBVdfzAwiIz/jFaTAg5JRqBokBFqsmVCK8s9g
 KKbeFsBmHfQ0ArwJ1dNWmFrgGZSYHt5VkWFtpKi8NJq/rjH6HYX03ssf71jY8MXYW/qK
 975g==
X-Gm-Message-State: AOAM532YzfbbpF9uKUDy6wD6AoGRF+n7bMw/CrsgmRePnTBLTQoQyhSt
 7NiihFCEhCSFCf5EzCkwEsu1b/nHfaMZwNBI
X-Received: by 2002:a5d:64c3:: with SMTP id f3mr5186479wri.10.1625223756741;
 Fri, 02 Jul 2021 04:02:36 -0700 (PDT)
Received: from [192.168.11.95] (pop.92-184-108-94.mobile.abo.orange.fr.
 [92.184.108.94])
 by smtp.gmail.com with ESMTPSA id m18sm2697657wmq.45.2021.07.02.04.02.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jul 2021 04:02:36 -0700 (PDT)
Subject: Re: [PATCH 03/11] hw/gpio/pl061: Clean up read/write offset handling
 logic
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210702104018.19881-1-peter.maydell@linaro.org>
 <20210702104018.19881-4-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <52e5cb6e-1be5-cc73-5aab-790c5b9b80bb@amsat.org>
Date: Fri, 2 Jul 2021 13:02:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210702104018.19881-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Maxim Uvarov <maxim.uvarov@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: D3LI+cDoF7hK

Hi Peter,

On 7/2/21 12:40 PM, Peter Maydell wrote:
> Currently the pl061_read() and pl061_write() functions handle offsets
> using a combination of three if() statements and a switch().  Clean
> this up to use just a switch, using case ranges.
> 
> This requires that instead of catching accesses to the luminary-only
> registers on a stock PL061 via a check on s->rsvd_start we use
> an "is this luminary?" check in the cases for each luminary-only
> register.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/gpio/pl061.c | 106 ++++++++++++++++++++++++++++++++++++------------
>  1 file changed, 81 insertions(+), 25 deletions(-)
> 
> diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c
> index a6ace88895d..0f5d12e6d5a 100644
> --- a/hw/gpio/pl061.c
> +++ b/hw/gpio/pl061.c
> @@ -55,7 +55,6 @@ struct PL061State {
>      qemu_irq irq;
>      qemu_irq out[N_GPIOS];
>      const unsigned char *id;
> -    uint32_t rsvd_start; /* reserved area: [rsvd_start, 0xfcc] */
>  };
>  
>  static const VMStateDescription vmstate_pl061 = {
> @@ -151,16 +150,9 @@ static uint64_t pl061_read(void *opaque, hwaddr offset,
>  {
>      PL061State *s = (PL061State *)opaque;
>  
> -    if (offset < 0x400) {
> -        return s->data & (offset >> 2);
> -    }
> -    if (offset >= s->rsvd_start && offset <= 0xfcc) {
> -        goto err_out;
> -    }
> -    if (offset >= 0xfd0 && offset < 0x1000) {
> -        return s->id[(offset - 0xfd0) >> 2];
> -    }
>      switch (offset) {
> +    case 0x0 ... 0x3fc: /* Data */
> +        return s->data & (offset >> 2);

Don't we need to set pl061_ops.impl.min/max_access_size = 4
to keep the same logic?
