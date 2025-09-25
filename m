Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFDA3CAC5B1
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Sep 2025 14:52:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1nKH-0003uu-8X; Thu, 25 Sep 2025 10:52:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v1nKF-0003ug-3L
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 10:52:03 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v1nK4-0003XS-B4
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 10:52:01 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-71d6083cc69so14093087b3.2
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 07:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758811907; x=1759416707; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tOhxutFSrLyTPx0FAFjDtq4+50looaQ2sNQSQjEOdHI=;
 b=PQEkSRcqAwM+KrMHs3jpeCXyByJ1ClPEkDCFV3fdjKe3xHc2qMJN64nX/hZ+24OaB7
 gbjhhIKOfTsBtjAzloZQPoqXDA4JTrVEduJ6kaoGuIrRS7t61Rt0uKs4BQBBWqqwVyqD
 Ff+DO2BYlNMM2dcS5kNG391Rr8UUHDxsGEhazdeyLWu0b9jyNDtVqrTAsCJ8aKZnX5/p
 fujVu8j/eYvGl1oDEznhGB8SFdGD9Xd9hmJwoFpxgFxU7GdxeuDneKKF0HXPax0ZA3Cl
 NCJmOytA6Q3NQPyAT9UnsdScLefNX8bf1zao5AY8quX/EfKgCMG2/rANmIpHidCOa/Bo
 v9qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758811907; x=1759416707;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tOhxutFSrLyTPx0FAFjDtq4+50looaQ2sNQSQjEOdHI=;
 b=nNXdCq3Spc0uDDDSz9ZuzV8aioXoCrQomJLaJc9VguROc9yVze8i9THdMrBhu9ut3P
 H0D6adZAnruCbryRm9aM/fXPCZG0RxSzP9Ded55B+ifLo0CE8fsGaihIKJkqq6y01RJk
 vzuAuNQNjt+qtMT5BXO1xgtefL4r+fZUaghp7AwvyFhAp/6waLkK/3T9yZ6jP11r690M
 lKWkHyE2Mg8H0TSusSyF8zrH9BgdjvZ8fgZn2WjAe3NYX8y+z/aG4LrZpA/MqAeZQ8k1
 HCV+Lp9nVo7zPMo+himCfE2OLdnnuG9SGmMQCRCkBh6C86n9CoYJ9ycZx+VPoZO31080
 pF8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEJeFcT3UeLE7QORvY3QvFAOOU9fI6IdTmTi5lpxZo15OQRDxD+yJiKuKW7rzOvr3tzLAHUMnvpQ==@nongnu.org
X-Gm-Message-State: AOJu0YyE750Wlgkh2lYb8vPhN3mN+fGPomFTgGW+aT/vfNonUVXKom6t
 pHCkpG++E7NZq7Z4jXFAhQ9ohn7b6qQewAP7gvhu2T4HnBNAw7I4gaGaURdMxCZUeIHXPlTn6SW
 0oDdJHzBaExU7YQYo5HVLKEHxynn12WzNSFj3F8xgVSj2zO3LR+4o
X-Gm-Gg: ASbGncsN96KFCEDFd687X+PrLRfFTOeSgLoorVAop2x1eR9al/gY/Dr8qGeEt9zOyDp
 c+qg9AcOPcXbXVsB3he1t2vqVDyTmfkRoMSyFN06ZsB2IBA4tKFg1HRegvmL9SRkPwBINQUUQ2i
 lDVy52Y/NgrmdQ7WTtK1aPyop1gpaEqC+7/DWKEFhA1erJQBJYdIyz0Iy8VgDS8wJ57xEHXS4oD
 E53mC4q
X-Google-Smtp-Source: AGHT+IFzzsnkjmt21TzrxrnBhRuDoYbYcJVSJrFeN5w81vntuylwyCFZBWB85rTzv4m4O7b4onfKyC5aNhteVH2ymdc=
X-Received: by 2002:a05:6902:1547:b0:e9d:6a31:d514 with SMTP id
 3f1490d57ef6-eb458cd6e2amr1142756276.44.1758811907064; Thu, 25 Sep 2025
 07:51:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250916142238.664316-1-richard.henderson@linaro.org>
 <20250916142238.664316-25-richard.henderson@linaro.org>
 <63a29a08-67ea-449f-954b-f62abbc39346@linaro.org>
In-Reply-To: <63a29a08-67ea-449f-954b-f62abbc39346@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Sep 2025 15:51:35 +0100
X-Gm-Features: AS18NWCk_ct5HIdPxC0D3Wx8xIbZP6PhiXRbS1LA_Z9oCpTdSedyxm3Vd90C848
Message-ID: <CAFEAcA86ruJ9R8OFCXd1LHhNffyNNC_N92oXunm6UgBh6yyYDQ@mail.gmail.com>
Subject: Re: [PATCH v2 24/36] target/arm: Add key parameter to
 add_cpreg_to_hashtable
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Thu, 25 Sept 2025 at 12:07, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.o=
rg> wrote:
>
> On 16/9/25 16:22, Richard Henderson wrote:
> > Hoist the computation of key into the caller, where
> > state is a known constant.

> > @@ -7587,18 +7582,22 @@ static void add_cpreg_to_hashtable_aa64(ARMCPU =
*cpu, const ARMCPRegInfo *r,
> >            */
> >           ARMCPRegInfo nxs_ri =3D *r;
> >           g_autofree char *name =3D g_strdup_printf("%sNXS", r->name);
> > +        uint32_t nxs_key;
> >
> >           assert(nxs_ri.crn < 0xf);
> >           nxs_ri.crn++;
> > +        nxs_key =3D key + (1 << CP_REG_ARM64_SYSREG_CRN_SHIFT);
>
> This is new but not mentioned. While the CRN bit is know to be 0,
> we usually use '|' to set a bit, not '+'. Preferably using '|':

I thought so too at first glance -- but what we're doing here
is adding one to crn (there's a comment in this function that's
just outside the context of the diff that explains this).
Since crn is both in the reginfo field and also encoded into
the key, we need to increment both the crn and the bitfield
inside the key. As it happens, at the moment all the regdefs
with ARM_CP_ADD_TLBI_NXS have crn =3D=3D 8 and so whether we add
or OR makes no difference, but conceptually the addition is
correct.

I have added a comment
 /* Also increment the CRN field inside the key value */
to hopefully make it a bit clearer that we're doing an
increment operation here.

thanks
-- PMM

