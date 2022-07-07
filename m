Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp5343497lft;
        Thu, 7 Jul 2022 02:26:57 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tIxe3RmKJquY1Nt/olelGi5kdlrcPtFhwasZWjsmPb0CQbb133sNLvJ01L5gcnupHN1emn
X-Received: by 2002:a25:b391:0:b0:66d:7229:1fc9 with SMTP id m17-20020a25b391000000b0066d72291fc9mr48296084ybj.130.1657186017052;
        Thu, 07 Jul 2022 02:26:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657186017; cv=none;
        d=google.com; s=arc-20160816;
        b=G3xfcC1ISkjPnxQnq3hGkF7aLclloFd7JT+HWMPUzNeP11Ae8qAmPyC40r/wI174/v
         mhTFCC8JbEACcA8LQCqYiDXOvLC6cEuCcm6lnjtakwaYIzus5IKn+BQUNIUNkxnnR+0v
         ZeY+eIZ/vNp4F5fY89MOipLjluDFrghv6zRPEuD605BeJmwuBFNa6dlJDYOxHUxAviKt
         IDc9UvwmiFIFViydvomhOkLYiCv20v04ZQh2R8/O/oy3g6OlikXyAMFu0qBZBj0FDWiP
         0emmrI8dZeDLzuoT0BEuF7MEsq5SCVgV/qKUXyL1g/cWuT4C2g8q3MPcrvPzoXsUyV4R
         /IyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=FR96ywLjuc8gIbRvoUSmpk6lWdcfOKT9JZI41FTyfnc=;
        b=VBysRJBGSvwWPligaBOM6vLfNdPLDMS/YJ1ZFC/a+TBDt1a930AElxjLvKXh1m4feu
         DqKVPxBWPrBxO9sp9YxRkYoEPxJpaB/+LGA7ViR+jKl6vKxcMID4l7m5SeBZ4+EaHSJA
         8yOsg+sACAPYj9rDyPSku7Ga0Mr3qTRdMaBrQ3pIA8YO2kRmNdsaZ3kkNEgWoKglCHiR
         LLdDNv43AwFJadJP6iUje03whvGXDflgNsckQqxMW9/woF3cxTBl1KFKczK5xbc3eJVf
         Wsj5QU86Y1f1T8OWwBIeboYMIP7ye2wJYZ+aP81sgMnQECMcJB/7CDNRrIj/W7FBljeQ
         vNbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bq9eB13W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z7-20020a25a107000000b0066c8ab49113si53903753ybh.179.2022.07.07.02.26.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Jul 2022 02:26:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bq9eB13W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o9Nmi-0001gQ-DD
	for alex.bennee@linaro.org; Thu, 07 Jul 2022 05:26:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o9NmW-0001g4-Mo
 for qemu-arm@nongnu.org; Thu, 07 Jul 2022 05:26:44 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:40487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o9NmU-0005ZI-TE
 for qemu-arm@nongnu.org; Thu, 07 Jul 2022 05:26:44 -0400
Received: by mail-yb1-xb31.google.com with SMTP id p129so1749857yba.7
 for <qemu-arm@nongnu.org>; Thu, 07 Jul 2022 02:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FR96ywLjuc8gIbRvoUSmpk6lWdcfOKT9JZI41FTyfnc=;
 b=bq9eB13WHLj3XHxbOpykiV8Pzie8Y/MJh+o+iWq5VYkCtiaUltMT5lGmWIh5Xrxfrt
 hqixt7/+cFL0kSXcYOa4Y/f1SmU9SgRsJS8zVggiFZSk98kpqCKRMCNGjUhtt9pvJQ3A
 vvxLggGRHSKnNi9Je/YlVkYjzMG3qvyuH6nNY25uoP0+9mLEE5agi56fyh3I+1KEZ/eQ
 IyYOw/RXoVUNwtSJvzEpzrwFKgG5M5Dr93jtzXbGKz5wj7pS7qXApyFHdBBhaXRVTYzU
 oKuvvYziGM8k1wzgi/sX71Kw552xO6GnZqQ2561NvK0x1viSAW3cIZte4xa2lFqrtB3l
 YGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FR96ywLjuc8gIbRvoUSmpk6lWdcfOKT9JZI41FTyfnc=;
 b=j92btdHkz2NiI4Doxdegr1Jgo+ife2h6AD3P3+oBNjM1MB5LulI54l3byh4qV2sB0g
 Y5ZAWOFGYnZEFmgmDSU4d15Sl9Jx+r0HKFBlODQy/wY+KiwWvhHXSicbpEwBy5cM5jG8
 FP3LqhEkdi+M7FndT1Uv9MOrkQq4jv8E5km+abCYB3QvvVX5p4swWXIUtHy7DoWFm7sx
 qfDdmftc5qVQhXzKIxA/5Q21YECQ5PQsLF5SUCMY0YTAOf7GqSNWDFSsjxxkBFgFwPS7
 TuwDm29ENU4tDS4VErcVPhHEeqD/MbPvugIlS148m4ON3n2RZGjXXEtrwqZ64JK57Zp6
 KNLg==
X-Gm-Message-State: AJIora8CB3o89luGYYfVMi624or+VZ5/sk0WotiRsal+ds9ngPQ7WgSW
 STbSkhPgmr7q3EbcfZHXz3DMhTbW51e68vxW+xG56A==
X-Received: by 2002:a25:d381:0:b0:66e:2943:1c9d with SMTP id
 e123-20020a25d381000000b0066e29431c9dmr29176294ybf.67.1657186001400; Thu, 07
 Jul 2022 02:26:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
 <20220706082411.1664825-25-richard.henderson@linaro.org>
In-Reply-To: <20220706082411.1664825-25-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jul 2022 10:26:03 +0100
Message-ID: <CAFEAcA_sFow6=OEFr_49O_+621O_m3n=SGpZoPbnRjTQ_N-CXw@mail.gmail.com>
Subject: Re: [PATCH v5 24/45] target/arm: Implement FMOPA, FMOPS (non-widening)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
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
X-TUID: tm7Du8KxDbbU

On Wed, 6 Jul 2022 at 10:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> +
> +void HELPER(sme_fmopa_s)(void *vza, void *vzn, void *vzm, void *vpn,
> +                         void *vpm, void *vst, uint32_t desc)
> +{
> +    intptr_t row, col, oprsz = simd_maxsz(desc);
> +    uint32_t neg = simd_data(desc) << 31;
> +    uint16_t *pn = vpn, *pm = vpm;
> +    float_status fpst = *(float_status *)vst;

This could use a comment mentioning that we take a copy of the float_status
because this operation does not update the cumulative fp exception status.

> +
> +    set_default_nan_mode(true, &fpst);
> +
> +    for (row = 0; row < oprsz; ) {
> +        uint16_t pa = pn[H2(row >> 4)];
> +        do {
> +            if (pa & 1) {
> +                void *vza_row = vza + tile_vslice_offset(row);
> +                uint32_t n = *(uint32_t *)(vzn + row) ^ neg;
> +
> +                for (col = 0; col < oprsz; ) {
> +                    uint16_t pb = pm[H2(col >> 4)];
> +                    do {
> +                        if (pb & 1) {
> +                            uint32_t *a = vza_row + col;
> +                            uint32_t *m = vzm + col;

All these accesses to uint32_t elements are missing some kind
of H macro somewhere, I think ?


> +                            *a = float32_muladd(n, *m, *a, 0, vst);
> +                        }
> +                        col += 4;
> +                        pb >>= 4;
> +                    } while (col & 15);
> +                }
> +            }
> +            row += 4;
> +            pa >>= 4;
> +        } while (row & 15);
> +    }
> +}

thanks
-- PMM
