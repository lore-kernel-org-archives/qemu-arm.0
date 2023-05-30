Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2247018ejb;
        Tue, 30 May 2023 08:11:34 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4Qbg1xPvVLJ57pxWJ2N5GQZG4+6eC3synsmlm9mHfBFkulvXraub9kAJiafCy+VySGkI5k
X-Received: by 2002:a05:622a:1a85:b0:3f8:365:7aa3 with SMTP id s5-20020a05622a1a8500b003f803657aa3mr2718170qtc.3.1685459494600;
        Tue, 30 May 2023 08:11:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685459494; cv=none;
        d=google.com; s=arc-20160816;
        b=RCOu+WIKDvLRVjWDYv4gO0I6eNVb7X0CDIqxrgfOuZwv3cIGykIWWDnLjH5E7ai9rv
         AZ56Dr0EIxck3DC8mUpxKFTJWfWg+3Oe2DUlvqhliyqmyVfF++1gjOCcAA9luYVne9h5
         /OehkhY6IT//RT8os0q1Ow7m4bbWD3tSJgKjRGiF/IjibzYU3gRZn2Iw8lcaE9VTHsvy
         /ngxwOG0IWxIDrvxAJJYwfvl7r2RpHk3sx0cKPAa8T+D06P9oqn8VoXc199zxTErhbCu
         OHknpNzmj0+4X7pcqnK1P+uM9ZobamJcbwu1MFPN0v/erodBhDk0ZN6TxEpaDSU4TZGq
         9MdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=pgqSrsE6WKBGhIyN31uqtjp1Dlf7zxgJ52vhXZmBtsY=;
        b=WYDknxXD+8xEinQdLtUuifz8dYtQLsB48HGYw7jFqvEcN7+Wfo5CTFPmrIJ8LLwhsy
         SojycBQcvkMC8awHuRP5WIy5pebz80HA8bRtMkP+kzJfuV8OVCsesXGxlyPx9I3ef1bB
         NWblUUrDwc15ZOVEuiM+cHATt60i8wF0mmC1IU4ArwsG5FkYQGcVixi5A7ir1Si9ag7O
         kIhfZw65aKcmIsJ75DOoYmhr6AKTme9q+S2oBy9R3qAzeB/uIO2tODH1BQoZeMJuUk11
         2hrO0gQQWfylqv2GyEnx0wtyu+dWGMTg4cGJy/azWetY0q+/OioGvGeCbTSPv9SYdUcu
         DoVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xODxqIyg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v22-20020a05622a015600b003f3940c6a77si6524774qtw.10.2023.05.30.08.11.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 08:11:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xODxqIyg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q410S-0001lv-7R; Tue, 30 May 2023 11:11:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q410Q-0001kY-JL
 for qemu-arm@nongnu.org; Tue, 30 May 2023 11:11:26 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q410M-0005Gh-Lq
 for qemu-arm@nongnu.org; Tue, 30 May 2023 11:11:25 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-510d6b939bfso8273319a12.0
 for <qemu-arm@nongnu.org>; Tue, 30 May 2023 08:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685459481; x=1688051481;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pgqSrsE6WKBGhIyN31uqtjp1Dlf7zxgJ52vhXZmBtsY=;
 b=xODxqIyg0seQVT4nv1pMsiqN6j5/WK+Y0wNXor9cDC+6HKNzLcSLNt+o8CXRpIBedY
 b5DEwfp0KGQh8jqhyEEJhz5jfB2XfpMwF1nbbSOAz5IBFpCm7Spe0McvC0vff2+ypDoS
 km4z2eBS/MmzuLlwYnPbQAo8AicazAHa6ah/yEbO+2MR02fj/moCdH21CUm5hMSNMZp2
 q+7VK0wnWS46bkKavY+NdTTVZKy5TaLD+CFDFoUPUb/NjMbm7Ss0tcWy7FkFwKnlHkOw
 TuV/HOSRi7aCEdipAHNr7b9Bibi5q1L3VfGsYQU1B3XLYGgcm3EIalKmfXLcPcGU5ZFT
 hqYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685459481; x=1688051481;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pgqSrsE6WKBGhIyN31uqtjp1Dlf7zxgJ52vhXZmBtsY=;
 b=FV17pUy1A9CM0V1IDo5ZDGobT3//Gcs6KdZfo1ribzZWxlN/B6C4t0t8xwcvWo2pkg
 ufW5F4o5cGYnOFaxUIsfEyNRmIbf6ZL9EF5ssQJ/dSFzNnIbWkbnej6Jh55NHp5jAK/o
 7UR3+KGeNxiDEGMNwwwOdVTV9yQnaLfvQg3RzfdR3saBkhDGCckkY2ow174DMfojxeyv
 G/mPSqKT+KBBG73UrALvmcIALJag38OUxsnLhtCA2QOos9LD/Gi6E9UBzt29dtYk692M
 AUI3D7CrszGYaoVGsBr3kml8shMEVWTnLfvdxTbKbspvIXyIBFWJBOs5MHnLmhNOQw7w
 4bIQ==
X-Gm-Message-State: AC+VfDy7ojTvP9AZAPwp7qdEUKRmvMETuaEqeIlPb7sb4ej+um+9WJCu
 wvs5fy2TyGAw6W+31q2eb8KDTqJW4ZaCwDgXRJfxpQ==
X-Received: by 2002:aa7:cfd8:0:b0:510:f8d7:1f4e with SMTP id
 r24-20020aa7cfd8000000b00510f8d71f4emr1899162edy.3.1685459480851; Tue, 30 May
 2023 08:11:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230525232558.1758967-1-richard.henderson@linaro.org>
 <20230525232558.1758967-2-richard.henderson@linaro.org>
 <dbb368d0-839c-ad09-01de-09b1a62416af@linaro.org>
 <87zg5r1kxx.fsf@secure.mitica>
 <8f315f7c-2778-855a-0879-f928f9ca8054@linaro.org>
In-Reply-To: <8f315f7c-2778-855a-0879-f928f9ca8054@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 May 2023 16:11:09 +0100
Message-ID: <CAFEAcA8XnaEjh+BhfnfOEqXtEHXGxF-9iC83o8jNH65vhg5R6A@mail.gmail.com>
Subject: Re: [PATCH v2 01/20] target/arm: Add commentary for
 CPUARMState.exclusive_high
To: Richard Henderson <richard.henderson@linaro.org>
Cc: quintela@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /Pj8EWvOCAs5

On Fri, 26 May 2023 at 15:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 5/26/23 02:49, Juan Quintela wrote:
> > Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:
> >> Hi,
> >>
> >> On 26/5/23 01:25, Richard Henderson wrote:
> >>> Document the meaning of exclusive_high in a big-endian context,
> >>> and why we can't change it now.
> >>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >>> ---
> >>>    target/arm/cpu.h | 7 +++++++
> >>>    1 file changed, 7 insertions(+)
> >>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> >>> index d469a2637b..4e16eab82e 100644
> >>> --- a/target/arm/cpu.h
> >>> +++ b/target/arm/cpu.h
> >>> @@ -677,8 +677,15 @@ typedef struct CPUArchState {
> >>>            uint64_t zcr_el[4];   /* ZCR_EL[1-3] */
> >>>            uint64_t smcr_el[4];  /* SMCR_EL[1-3] */
> >>>        } vfp;
> >>> +
> >>>        uint64_t exclusive_addr;
> >>>        uint64_t exclusive_val;
> >>> +    /*
> >>> +     * Contains the 'val' for the second 64-bit register of LDXP, wh=
ich comes
> >>> +     * from the higher address, not the high part of a complete 128-=
bit value.
> >>> +     * This is perhaps confusingly named, but the name is now baked =
into the
> >>> +     * migration format.
> >>> +     */
> >>>        uint64_t exclusive_high;
> >>
> >> Can't we rename the field if we add the old name to check_fields_match=
()
> >> in scripts/vmstate-static-checker.py?

> It's not worth any effort to rename.  Just needed documentation.

Yeah; the important point here is "we can't trivially switch
to recording the exclusive value as 'high:low' of a guest
128 bit value" -- it has to remain "value from low address,
value from high address". Really what is baked into the
migration format is that the semantics of the two fields
are from-low-addr and from-high-addr.

If you replace this:

> >>> +     * This is perhaps confusingly named, but the name is now baked =
into the
> >>> +     * migration format.

with:
 * In some ways it might be more convenient to record the
 * exclusive value as the low and high halves of a 128 bit
 * data value, but the current semantics of these fields are
 * baked into the migration format.

then:

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
