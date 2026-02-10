Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 094EFEA810A
	for <qemu-arm@archiver.kernel.org>; Tue, 10 Feb 2026 12:55:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vpnGo-0008Tj-Gx; Tue, 10 Feb 2026 07:55:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vpnGl-0008JQ-1W
 for qemu-arm@nongnu.org; Tue, 10 Feb 2026 07:55:08 -0500
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vpnGh-0001vP-TS
 for qemu-arm@nongnu.org; Tue, 10 Feb 2026 07:55:05 -0500
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-7927261a3acso42459377b3.0
 for <qemu-arm@nongnu.org>; Tue, 10 Feb 2026 04:55:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770728102; cv=none;
 d=google.com; s=arc-20240605;
 b=CKvbuyYBVbCKYRmyuGLS2VB/igBoq4aBpPvc4avxI81g4oaWbtxtsVzk1FhDSxSZPH
 xYJQzO4C1aSoIMaW2MYKdsN5fBctlfm9b8wVy5YnyogfD6sz5GQSGhX9Y5fdCkv96Jwa
 jiws6Lf431LZRkhTt6yBsbWeigrWunnIlQaaPNYSQYenJJI2/20tb1OadmJl5LmEXG2T
 vHS0EYpk3O5XSQ+k4dm9bK+0QqCAwrs3MXsP9nr4Sg1NIWYHUIkjBnMOFmP0qJh1dt+B
 RXP7Vh1TAagVDQ6mH4wcOOTim+nVaRKZvWy3BrvacsHY25S2rxWNSGLRM7PI0QRZf7t5
 vl5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=MxDu/SUqdsL8XdauFS4i4DsHwUTDrJAwAgHFeI9/lmE=;
 fh=Wby3iCv+NWN1unBRd4mbLZ0KVITNTsygEYwzTv4ka3I=;
 b=EEtX++SWTj5B7OwIJ1z2t1tpm364joo+wq5IctP8pACbjcAm2v1uArg+rNzoLoUfM3
 ww6wzHMnYQjt8lCCI1VC9nUaIUj5cNqIXplW6zdUxB8+bvqXDM2//nmAHsORoXrxlPNg
 hq8Dz3AIYatNNXHlgaEPBYMuxSHMJKrMGYBGcTfxhmePTf9J4CU981OXmf/HuuWV70pm
 KdGABGuGVG9XXLUbKuWHmkNrOeRZ9WOhUaGzq6fOsREa81Ebf2DXqBRmquhSbYKePBf3
 uMxkOhLSb30mVj8vlAb0vyLrOMt/Tj8UtGyumM71SOLTi479aXjDegTK1SpEsSvvmU5J
 qX+g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770728102; x=1771332902; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MxDu/SUqdsL8XdauFS4i4DsHwUTDrJAwAgHFeI9/lmE=;
 b=bavYFP32LKDzeiVz3wL4N7rL2e0hrWtgmaW/b5kLzfiVAfgNYbabQqePa7SqZwSR6/
 imhg6zH+N3z7cGR7yP30bo992u1SrrAPLepwyzttXZO+Bw2tSYJabyVdiT7Ahz8/fMRf
 x5NaDsWLNgAitp2rpmgJdKZQF0iMFbMAjjaslt3+xcICZkzkOhSa1D23D3stEk3GSNkX
 F45ixMfjdSb+RTR+SDnwveOjEElI/qu9147lYH5VRoTYTFxdLIdKc9Q6UNW5aIlhYm8s
 c9sAhT/bJycSh6+pjzNcxa0kcizJRFEDgTggipp94Slh3L/jqc/J7hrEI8DL1wIbNapr
 qeXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770728102; x=1771332902;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MxDu/SUqdsL8XdauFS4i4DsHwUTDrJAwAgHFeI9/lmE=;
 b=XG63SjIJL01lrYzXYGEX5KddDjg+5WqEVt6mh8HiIl+BrPNbl6RCc6t7x+Zp2tpigR
 bHUFpBo5o4MBsFEr2AxR+7LpEBMz0ztg0R31cIF6dURsufruoIOuogGO3SfwH7GQLjQV
 ptTPhnjlIBbLnLMCwuFa5eu6QHJVaHzqSCEFVXIDMqt9AKbYQotxSlFBHvoPORxye8bl
 92R5mTSogsjIp45GgT2RQnfegLFcy8BJrtDOt1UeJR0PCO2NT5udfz2g0CAoY6uJSLyA
 MqK6gf7bB6khrSF+RGJNvj0aywRVdQPJD0A38MuWzBnRM6yLgEho6HukJsRCR6zK8XpP
 WB9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCULyjC2N5/cfz+fj6SYFf4CG5KL2iXRYNMWLPtU/xhp6LCWIy/+4rZIH8+iA0BrBCmbZkGF9/Nllw==@nongnu.org
X-Gm-Message-State: AOJu0Ywrfa6Lm28kJoHzRI9jkJddxc9SkNMzH6UoFfQm4qPoatDBtDit
 6DUTLY/ZSuc1xH+xiCKQnw6SAws+y5PJKn7NYcoCLxFcKYvNb/ofs9V2/AoWZKHHBmka/WN1U+b
 BNpmETKd4R5uqcwkP+1IDS6worqqX6EGp9sBkq7IASw==
X-Gm-Gg: AZuq6aJe/wzqxWgVhLlZqjcc4uu9iQFXx6Ag1NQNU+OLS0oyQier7EYEj0ASRT1OJBC
 ICIK3dlgxfoeXKSVyyOF59b45ckilpAHqrLvp5hjnTPsmDWtfx9ptLF5BE7hKvH0PX9YowJUpwP
 bttg2t21pkUKWnLaXgOad2gnPj+EM4n+V8jUU4aTsrdrIoQNG4OEid/ICmFJsEyCqJ+Vqx1Zfqs
 6DDumPEdshYyLEnMrryn2ZEvLhLw6W+pWTkxkw/tV4v7SX5sUJXEiVSRCr179IUREJZ4/QiHq2M
 2xAHRfyUBmwWg3agHylMCwDiBK/FazyKpFosllK8MNhXZfn+O8jwFZ+GzuDDibXVSc6qSuWie0f
 K3w==
X-Received: by 2002:a05:690c:386:b0:78f:8503:7773 with SMTP id
 00721157ae682-7952aa746b9mr135064697b3.3.1770728102487; Tue, 10 Feb 2026
 04:55:02 -0800 (PST)
MIME-Version: 1.0
References: <20260205210231.888199-1-alex.bennee@linaro.org>
 <6cf4aa8f-5f1b-4145-88d3-da5abfa978ab@linaro.org>
In-Reply-To: <6cf4aa8f-5f1b-4145-88d3-da5abfa978ab@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Feb 2026 12:54:50 +0000
X-Gm-Features: AZwV_QgBciDobILLCboXiZnhQL0VfTJ8-uSNPgQF17sxCyxXtPvDLOxk-vI8Bfw
Message-ID: <CAFEAcA-g+tOP4=NK8hK3vJ-WT4+dYXbiciXBpeq_2Yr6SxfH3A@mail.gmail.com>
Subject: Re: [PATCH v3] target/arm: implement FEAT_E2H0
To: Richard Henderson <richard.henderson@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-devel@nongnu.org, Mohamed Mediouni <mohamed@unpredictable.fr>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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

On Tue, 10 Feb 2026 at 12:16, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/6/26 07:02, Alex Benn=C3=A9e wrote:
> > @@ -3817,10 +3821,15 @@ static void do_hcr_write(CPUARMState *env, uint=
64_t value, uint64_t valid_mask)
> >       /* Clear RES0 bits.  */
> >       value &=3D valid_mask;
> >
> > -    /* RW is RAO/WI if EL1 is AArch64 only */
> > -    if (arm_feature(env, ARM_FEATURE_AARCH64) &&
> > -        !cpu_isar_feature(aa64_aa32_el1, cpu)) {
> > -        value |=3D HCR_RW;
> > +    if (arm_feature(env, ARM_FEATURE_AARCH64)) {
> > +        /* RW is RAO/WI if EL1 is AArch64 only */
> > +        if (!cpu_isar_feature(aa64_aa32_el1, cpu)) {
> > +            value |=3D HCR_RW;
> > +        }
> > +        /* Strictly E2H is RES1 unless FEAT_E2H0 relaxes the requireme=
nt */
> > +        if (!cpu_isar_feature(aa64_e2h0, cpu)) {
> > +            value |=3D HCR_E2H;
> > +        }
> >       }
>
> Reset value of hcr_el2 should have E2H set too.
> I think you want something like cpacr_reset().

I wondered that when reviewing, but we already have an hcr_reset(),
which works by calling hcr_write() to ensure that we set the RES1
bits out of reset, so this new RES1 bit should be automatically
applied too.

-- PMM

