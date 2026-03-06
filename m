Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82BEAF0181A
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Mar 2026 09:48:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyRn2-0001OD-IR; Fri, 06 Mar 2026 04:48:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vyRn1-0001Nd-9C
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 04:48:11 -0500
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vyRmz-0004da-Ob
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 04:48:11 -0500
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-64937edbc9eso8535685d50.2
 for <qemu-arm@nongnu.org>; Fri, 06 Mar 2026 01:48:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772790488; cv=none;
 d=google.com; s=arc-20240605;
 b=PvG85ZgDMqjGrBrC9WXMU8QF+qYi5NVrULbDe3aGRL23OElijgqSJ4vmcxPof+90dE
 zfxVfS+q+n/xg9rkcgNWeohtlhodxdETswQhXanop4HOFp/ic8pO4Hp3HiBBk1Pf8GRb
 P6HM2tZjKgGF20sTsqqC4NlH44ZsIW/NPFC2LMFah5iZQEz1uhuKd7nDhTB4LprgsaNe
 iep+OlYTGDWm/ikbjP2PGv1KA+LRET3dfFiAXeUhmVJlXBZOHxSHEc/tshIzfOWrlN/6
 N07OjyTfePFURRA48dYDYtKYe7aKbjNy/G5OEmpDcxFsXFuwujdbV+p9t7fBdxThV86p
 OnvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=1aqSBlqDr1uj9MQOZACHT1mU2eY2ox33fOiMTA41tp4=;
 fh=4fOEb8B2GjvfdcEnVR3l7hLaVN6XvIJu+2VPpK1hWzE=;
 b=WvhPHHwbPR1q3FVU5zcvOcWyAJ3PMsnSTfzW9etTwz+fx5Mvricmabdt5i3fFv7RU2
 oYYLnq4weaGPHfZ+T38rGUYPQyth4cAN26WsQnvyIoHfZOkKIUwSZe/LGXGAG5KEvxuD
 bcN36ICp35BZ98lflDGU9ErbZZ34MnT82/hkqtfqVRX0pt+EhtL7vObYjHYf299Eumv8
 4l8f4OgkIQLjQZON2/yhj/xuYs1UoSwFRmHeySo9yLzO+Hz/4nIucSZH0Pr5AGgIUEel
 FUrPuVrDZHdRMh5bNv7/S3m+bhGnaWx/jUrJBOCgHnNOCSVo+BHUqqjfNl+UwH6Gfjrl
 Tn9Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772790488; x=1773395288; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1aqSBlqDr1uj9MQOZACHT1mU2eY2ox33fOiMTA41tp4=;
 b=TJVsUefQiCNVqkDEO2IqDjRZeVcRsL5IO0L1vLjOSa/SgHiYdgRVlGfsy3AtToYmL+
 fcSZo4mbNfT1/Cdpxiw8jYPgeOibLXShDB6QnpYTlkoB6eU+Az2wMs08orrordJKjyjd
 eMV0OtDNkVxdAJ81FYMUYZph3WYHjM7+EnYJvWzRHcTtRG4SsWuhXvKYIvXg3rc2ceTo
 wNJEP/Y8A5BldvRODTTUqDvDIh8XsZ0F4CWIpjwyhFh9WyhWftEdZMetvxciyjEr6kVr
 VFGrcSOYDy53ypAIpmqbmPInlqusdXFnWbvy05Cw6O4K31y6aY3V5Uk0K1nd694iswCP
 upHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772790488; x=1773395288;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1aqSBlqDr1uj9MQOZACHT1mU2eY2ox33fOiMTA41tp4=;
 b=XCE3GzeXtJBDz9xBHS07JrSNmIIFKGEFU455V486FNhw+urxma9Nku09wik1x9q1bX
 qAG0cYNrIoBphb1T6TcMu4rdJ2y0FHixXfblhbbJRRAlYjOFTvK2hgB58TvIUY7XhMHk
 xGCK5tZ/5vOa9EgSlMaHC0F1sxt66s6qXxaOrZC++OdEWhCXOKL8Qif2CZsJsEos3ALB
 WHTcwPAceXOvfqbzi2kWNH86xu5scpvsT5gQYw+wF0Ktzhii4u8MyvEPdEQFytT60T45
 aqaVH6AkmeAo4Tn5zIX8DtHyf6YTg8R9T8sWtk7otF72uW+3IpmLD8RjXVy6Wls2+egQ
 SOwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMltxL9NoC3X9QzbZuvx3eP1OyJh+jRtxBgoAGYHjh3/lSTQMpjRFTyZ+k+ta51a5JAM90vq40uQ==@nongnu.org
X-Gm-Message-State: AOJu0YxMoWLLYURUy3VjjJz613b2PwR+Mx7K2/u6DE+tDrCEZVTKdJIH
 yQ4pwLK22ear8W8mt8q+N9J5ioCHtTJYhZ04E2DA8s+jQ01dmH8M9qkqgl14a70BgnijFjJuWKM
 U5J3QBhbnmpFt7LlY3JGNLqGB2AnvHfzsSLjgj6cRFA==
X-Gm-Gg: ATEYQzxBc3aiQdsQ3sYVcBAyPtt2uISx/Aaty3OILTRuymZesPdKa8/9fbRyVCTHuFJ
 l/2ei4yU7haf4mDkh98DG2bMTQW4wNMUxU8wOCQsrq524LZnVQBu6CdNAJu18K0Ey9JaY3RlxoN
 ytQuubRR6rufGwaFiDpldttfvwUGK1N1QPXDVmh4ijNFvkUDe/vKk3LAwCE3SJjj09nN5BnAhCd
 I3/ZFR9oiA2MgYlbMHujm6bYedkd518vcXS+yYUiUN0aiDcHXGXwFMcXHcmrHiCY0PnEM9u5sZ/
 YPohVGvdnw85bbFOjhPMD78Cno62QpoPRhInKZr9QbVtMUbmpAufWo+Osif4XWYL20s=
X-Received: by 2002:a05:690e:1286:b0:64a:d541:bc3d with SMTP id
 956f58d0204a3-64d141271f3mr1292041d50.25.1772790488328; Fri, 06 Mar 2026
 01:48:08 -0800 (PST)
MIME-Version: 1.0
References: <20260303-sme2-hvf-v6-0-b473702d8287@linaro.org>
 <20260303-sme2-hvf-v6-1-b473702d8287@linaro.org>
 <CAFEAcA8zTkc4pyHQKoDkTMhGPLQmxBaJS3bZiGRrPgux3rDLzw@mail.gmail.com>
 <CAAjaMXbXdrW9N1xLMPxL9OmjLqti6A3rqAmYipu6OkdBY8JPNQ@mail.gmail.com>
In-Reply-To: <CAAjaMXbXdrW9N1xLMPxL9OmjLqti6A3rqAmYipu6OkdBY8JPNQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Mar 2026 09:47:57 +0000
X-Gm-Features: AaiRm52PxOMDhyEx1vSCa8UvcQppyNGVohLxbT9VnoVhUVsuDEV-s0Cny4-vA7Q
Message-ID: <CAFEAcA_MuZH8d=Z=NfrNQ78k+Kv9mSx+=DLLt8AxZeEjccN8yw@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] hvf/arm: handle FEAT_SME2 migration
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?Q?Phil_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Alexander Graf <agraf@csgraf.de>, Mads Ynddal <mads@ynddal.dk>,
 qemu-arm@nongnu.org, Mohamed Mediouni <mohamed@unpredictable.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb132.google.com
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

On Fri, 6 Mar 2026 at 09:31, Manos Pitsidianakis
<manos.pitsidianakis@linaro.org> wrote:
>
> On Fri, Mar 6, 2026 at 11:19=E2=80=AFAM Peter Maydell <peter.maydell@lina=
ro.org> wrote:
> > Mohamed points out that this breaks the build when compiling
> > with GCC (which I hadn't noticed because I happen to do my testing
> > of target-arm with clang on Linux these days):
>
> Oops. same here, I was using clang.

> > typedef uint8_t hv_sme_zt0_uchar64_t;
> >
> > Could somebody confirm that that works OK on the relevant macos
> > configurations ?
>
> I think this works. Do you want me to send a new revision?

If you can test it for the macos configs I can just make the change
locally. I have:

+/*
+ * The system version of this type declares it with
+ *    __attribute__((ext_vector_type(64)))
+ * However, that is clang specific and not supported by GCC.
+ * Since these headers are only here for the case where the system
+ * headers do not provide these types (including both older macos
+ * and non-macos hosts), we don't need to make the type match
+ * exactly, so we declare it as a plain uint8_t.
+ */
+typedef uint8_t hv_sme_zt0_uchar64_t;

While you're retesting, could you also look at / test patches
17 and 18 in Mohamed's series
https://lore.kernel.org/qemu-devel/20260306083113.74177-18-mohamed@unpredic=
table.fr/T/#m2d1e3dfbfa5aecd41af6c0aa9e3b574a72c6f04d

?

They look to me like bugfixes that we should be squashing/including
in the "enable SME2 for hvf" handling.

thanks
-- PMM

