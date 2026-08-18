Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D067C5DF7D
	for <qemu-arm@archiver.kernel.org>; Tue, 18 Aug 2026 10:20:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wwGuy-0006oV-5C; Tue, 18 Aug 2026 06:19:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wwGuw-0006nm-MY
 for qemu-arm@nongnu.org; Tue, 18 Aug 2026 06:19:38 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wwGuv-0003ke-3r
 for qemu-arm@nongnu.org; Tue, 18 Aug 2026 06:19:38 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-8200b55dc47so60884197b3.3
 for <qemu-arm@nongnu.org>; Tue, 18 Aug 2026 03:19:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787048375; cv=none;
 d=google.com; s=arc-20260327;
 b=OipmlbgHZSMHpemw3yvAZ3sVH7e1mKneBou2URuTFoNv8tj5TPWf4Nde70VPiUUGD2
 hz+adK+H3ltloibLdKysCA21+0HUs+J4O6+I4HVXfvAerm8trlqVhTecjQSrtKJyZ53L
 YqMeo9LVEW655kd97OraJkbW4rb7lMwr9jIf3KdOUYJxcI/0Kdq3O/qTPzsAusr9FcbI
 U8siTyReYiGi6aA9gwKW+4LC3ST/f98/QZRtVh1cLIEA9YjQ88eQqSeFXYkDQQ/Ipd6y
 U80e18JzxnZQHYVOPkgiaNBrARg4K2TSV34ZIiSSmMi4XK1qUu/hlC10YQ5Li40hDFeb
 LDMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=jrBsedDKpDRNYYCsmyo3Aev8UbFtnGnTfQEJ0D2UY1o=;
 fh=5TRfSRb1jrN1E9pQmhY2NE8NxEgHlVrQUiXfjysvAtI=;
 b=EEKSknNRNWtZcv0N2h1lkHlxU2b67DdYx86ZuCtNIbHAFvMtDijKGYys3sGsifa2PS
 2zY9Xl9eV4YyHfjXiNV2fw5ZG3H6fCrxBHNcTXjfQK1hB1GiOqQgZ1TSX9ry4lwsBwng
 Pg1bCMa4oVcuxm884tzCdZkhEwrKI2yoAof511gHxWeJStuJadiKwTT9KYxXsVI+M2Zx
 NUHK0NBcqg6/9uF67EJ0F0vC0pRU3t0KkZhMfq/k0GPZA+1iQzgi/HypiRT0p28p7s1S
 K4omMgkueKsjlLLvj6/3wf01uaS30FsXmp9nSSFDxk1B5dWNvabHsGMyxszBv7C8YzKa
 qWHw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787048375; x=1787653175; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=jrBsedDKpDRNYYCsmyo3Aev8UbFtnGnTfQEJ0D2UY1o=;
 b=mVV+9uaZ0zRM2IwVgq3xEfFpnlIRZr0/K+UT3Oi475EJkFiRWCoughJ395c4sB3OGC
 exTkbzrfPaMdX05pyHjjFLcPlRydJXs2+SS4zfJoib9Nt0m3D0BWYl+5XccLescAlmZM
 pA9VLueHf1Twx2p+Y0pwMEJboXJfcTzxQyW1Oq/HplsRBGAg3Abi2rXmqEO8/OePnyxP
 eiXIb8ZX5WHcDZDb7xikx/7kPhlAyjgRyonGk7OSs0Q/6nhzQulPRfQekpac51Ki9wfZ
 4qyjvJHXKP+RT7L7jiU2iOfunJnMFOjhDtEuFOaK0Bx+/qXd1OAXTdHdoTr7e8RiM2Vb
 yB/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787048375; x=1787653175;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=jrBsedDKpDRNYYCsmyo3Aev8UbFtnGnTfQEJ0D2UY1o=;
 b=r7T8CLwUZTY/CQGRDVgJKK3CO627uc2zuMhfkRIi1N2EjsTWeKfaCRBnMMCvQCT0Tf
 a+zFpH9SKKA0d+mM/NoWz0jwWVC3f52GJXZiI6IpYhQoxCfgIReBRDJXY77eOLrcFLMr
 0YZr3QJ4WH0wuUXv6sgVCI7IA8IlL7qvIupmEc26LmTNqCU2TT2M8kvsFXAaZ+NkDCLs
 paiUd9OoZSGQ9pE55MUs9s8pPV1ZdTZVgcwptwlruX6CZLCa0Lk38/Q9SW7iS/KR9Cxs
 D1Fw5ShTIwrOhWUHoyYUKVezt8SKg192dHHZUrUjxUZR3+Sg6RLnjZibHPtpbivEKKxx
 NAJg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpUGbHeKCtvLB5aaK/Rmimwg7vLU4+AlndJ/+Zu0QmKUDcd8cvDkvRhjzNA1poF15qa/TH81ZdOBg==@nongnu.org
X-Gm-Message-State: AOJu0Yxo6VOaF+aG4EIcWX74aVWSqP+pAS25qdGVhOYcaw/MN9cHg+KB
 ZT7gcRKxfVvyP3SsGoPBsqdMq9q0IlBYkdx2Up3zEnFUSCmmhVEPS2F9VlYOLpjTJS6b8zAT+EB
 EUXsFlGl1H+AfJva92L0Qlq+6j/3iGPTkbSYIyENi+w==
X-Gm-Gg: AR+sD12T80ymGuQQOf5k8xR0N0QWrag0m0cKRNKO9n1HIA36EZsAso15fypX8Y9p0l+
 jt55k4olwr5AHa8i6f+nw84gA7AD8V001P1GhSkpm58yWbcYrVvqAO416Dm5ToFwbfegLfM9Wtw
 CnLtGTGBO87GwgnMeI/Jj0fegd3fYB47qFrw4WiNMfKKJ9Ti0xI+T0Gani4tP0LNj9gKQZUphwf
 8pglr8+jeJ0yhXK3hv/9ZftvDA+O4WxcFJdF5Cr8+4u2ja+1URI4Ulch+n8KkB5F0g5aG6vyIMa
 KEsuQh2R0ONP7O/v7uB7aFffinaOTtGhTWMy1NToQzgRFRMYm5KmRZK7RZOdIrtmNTJtmBpljQz
 kkSbBM4IoTtKT4m1dSNCW28DCHw0VeEPuksFlUDA=
X-Received: by 2002:a05:690c:a642:b0:830:90bf:9755 with SMTP id
 00721157ae682-8370c651a66mr79085407b3.4.1787048375423; Tue, 18 Aug 2026
 03:19:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260811191540.79882-1-richard.henderson@linaro.org>
 <20260811191540.79882-3-richard.henderson@linaro.org>
 <CAFEAcA98oxLs-w1PNuoM9mArit=toTCTucD5xOmN29Rbk6XBTQ@mail.gmail.com>
 <c931ce6c-1146-4bd7-8769-02e98ede0f82@linaro.org>
 <CAFEAcA91Gc7-n2SBvA-+vF2PemB6gqWFKKsoS9EPZ4Ks+N7awg@mail.gmail.com>
In-Reply-To: <CAFEAcA91Gc7-n2SBvA-+vF2PemB6gqWFKKsoS9EPZ4Ks+N7awg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Aug 2026 11:19:23 +0100
X-Gm-Features: AcwNN1XmBpty47ZunpgMfqGRsKbiWACOikpCho56Wg57R9AkpvvArMe1rQEksjc
Message-ID: <CAFEAcA8S-shexayOeP=jY-p0izYLvsdmLdFg8qfMVt4xRkC8Ew@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] target/arm: Fix SVE2 WHILEWR/WHILERW zero diff
 boundary case
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, yang.yanjun1@sanechips.com.cn, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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

On Tue, 18 Aug 2026 at 10:29, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 17 Aug 2026 at 23:34, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > On 8/17/26 09:37, Peter Maydell wrote:
> > >> +    tcg_gen_addi_i64(diff, diff, -1);
> > >> +    tcg_gen_umin_i64(diff, diff, tcg_constant_i64((vsz >> a->esz) - 1));
> > >> +
> > >> +    /*
> > >> +     * Since we're bounded, pass as a 32-bit type.
> > >> +     * Sink the diff += 1 from above into the 32-bit type.
> > >
> > > Is it worth doing that? Hosts are all 64-bits now, and surely there's
> > > not going to be a perf or codesize difference between "add 1"
> > > on a 32-bit type vs a 64-bit type ?
> > Technically one byte difference on x86_64.
> > But we could drop the whole truncation thing it you like.
>
> I think mostly my feeling was that since the rearrangement of the
> umin() expressions above was already quite complicated, moving
> the last part of that down into the truncate-to-32-bits was
> adding extra complexity on top. Just doing the subtract-one in
> 64 bits and keeping the truncate would be fine, as then the
> two steps aren't interleaved with each other.

...but thinking more about it I don't think it's worth respinning
the series just for this, so I've added it to target-arm.next
(with some cc:stable tags).

-- PMM

