Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B6E1C44522
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Jan 2026 12:19:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1viXBI-0006oj-PW; Wed, 21 Jan 2026 07:19:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1viXBD-0006bO-By
 for qemu-arm@nongnu.org; Wed, 21 Jan 2026 07:19:23 -0500
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1viXBB-00083m-C9
 for qemu-arm@nongnu.org; Wed, 21 Jan 2026 07:19:23 -0500
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-79028cb7f92so54405797b3.2
 for <qemu-arm@nongnu.org>; Wed, 21 Jan 2026 04:19:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768997958; cv=none;
 d=google.com; s=arc-20240605;
 b=PfLcmKb13Rh9iyaJpwz4qeWgauB2uLo+U/ha8QHrXareH/LISmtUs5qjQE2QHNuZWI
 dPYkP1v6zm1Qz4vugW/ZWKyb+NRF7MyxX36LPjiPWO2zbG4hZ1+8Figel7hB+qEKiV8n
 FT7DGIwfjDrKjSUybaLAT+IcD1RDCbgzF5pe+Q4jMQMhm/GCKKO3c4Tu06oMZXpSmCHf
 MoE+Dmcq701l9qgX4zDrqMs7UqSaF8WUaKSzneP4lQxiUuh7ogC8a3TlEn7DS3gB2jAn
 AbqTplqepFlF1ZLkEJYUGcgKp0WWTneFD/9pVB5Xk1L57O9lDON3QjehTWXCK1Kocuqk
 G7tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=rwKudhattcDNX64qLHnU3YBSiYoKLw0335vDY7IZh8U=;
 fh=YwInBnaifaq3SVR7/z/BcAPDlvEkJAOSa8bfzQyt5P4=;
 b=QZFMbVJOedlSjcvOdu3Z62S07LMsyb28X8aBkjMX5WFd1vyZpNLZasYCJYJCedbCaE
 OXxH+cqwi72y02zh3Vy595nvbep+CJIEBK2IpNfMqPNLAALXwb8Bq4ALwwsMSXDoDo67
 W0/SkZSJ/MSobygm1s7cNyVBU9AfaVSgZ53SEHSK2+iCsFQJpfhhun5HHuEBNVcE03S+
 npL2ed2VVDccKrtQZBXgZKAmjEXDpug1z1T6Hj3K8w9wEbLtckCLwN68nMQHyCX0wGP8
 ix6dGyPMbdgfB+lgsZNgfx3y722Sblgs7Hjg42nY+XpE/BB5DIeghJ86AdA2WKYc7ZyX
 JXLg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768997958; x=1769602758; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rwKudhattcDNX64qLHnU3YBSiYoKLw0335vDY7IZh8U=;
 b=eL0N3lZQtaDxXtyYvmCcL9ycqHD6rBVhAwmQT29ArNtEBPZkWeAb5S1IDNAvDicelN
 qKj75Hp/hnhxKJWysQldR6mHkYJlWkDANpSC8S6GXNCPwRQXRX794y4MmVX3bdzcFUXq
 p4H7Nxuc36CKxyBe+hf0c1FtNtVOic9rj/xMxKxGcAmAd4T8anI9AQ3ZhNfJHrtN4/t9
 CQha2VBTwKBdIUYdQiocG1CdSl+1ZpK5YOI7jApIoHmbhBUl5wgZ/Ax1rQSBxZ+WFE+0
 KP7yFCtQdVScmHSIu4dYZB/ACT89SkqWxyq5oD1D9H7D1Ex90sOZAUDQTWZuHOvR1qTG
 a8EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768997958; x=1769602758;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rwKudhattcDNX64qLHnU3YBSiYoKLw0335vDY7IZh8U=;
 b=TGMYCCYPtwXPMRUsBUrYEK8t+QFKCDrayQxzHNHwDtwVnij60Jkv15qfhKvdZ4oq+Q
 bCF2Ol9SRKsD9kuYyRtxT6vrAhF/hCoLlnykQVtn8boe5l8wDLaFIfgms/09vZI6nZLW
 hX8K7BXgt9mMkN6WP+3G7qkO0k1bcrQcRyOJgqLGm3EMymPdCcvnGIXoL/Ajkyz1r2N4
 fZMfBjyWebRNI8G6RXclp+QMiMqbFyvWbQ9DmcqwA6bUgys758pbpbxzfvLWTlxPRMPm
 n1q9Gx7QwWvWMNc90GSqgcqDcjzgzj0WpO+2DSi020+gxdMoz5UYmgo/2i43aDEPxdoO
 Dphw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWo12+CGfWKix24SeGMcxSXShZVRtcNeQCcgsaNlJAn9GiSuEMRWp020GO19vaOKdmmKtjtr8y9Tw==@nongnu.org
X-Gm-Message-State: AOJu0YwZIU+A8UXlqmb7k2Zom+Fc7a5CRVESPnwTlyM5eIaNl3DxLVEv
 J0xUyLkuN28V/AkWjoNFbiCn+1+OI1VFyx27Stahbz4U26M0rRfKWZfzG6OuZ0CGH0rC2VSXL2/
 QNlGlf8vR/qmPBgGD20llIqXCR5oHCRQu/A0i1FzYVQ==
X-Gm-Gg: AZuq6aJpL/4pcYnOjhTdt2y4K6RHwy8tLYp5RGkqKJeM1z6cHXvdJdX19W39KstcIEC
 wzKMCUq0kwgVI5dSJI8SrSsVLFH0vV3e+6A2FB33D7wzBUqZEhUWqm1KgfvGwtlI7vJuM1zzNz2
 UsFycpbsg9XpDQrsd4MuMft7rmaIEs7xKL/flTGon6prDEwh+FY2MCttS+eRJS4Fxll1qtnba3g
 /UEdWABY5G6GZk9JHCQTjlzY35FzWkggQEWGCqy83kvaxSeCIoEURLlhhxPvHz3GDI/9QZgiSbg
 4QmO
X-Received: by 2002:a05:690c:c511:b0:794:216b:d0d9 with SMTP id
 00721157ae682-794216bd7b2mr6730557b3.67.1768997958170; Wed, 21 Jan 2026
 04:19:18 -0800 (PST)
MIME-Version: 1.0
References: <20260116135235.38092-1-mohamed@unpredictable.fr>
 <20260116135235.38092-5-mohamed@unpredictable.fr>
 <CAFEAcA-3P6i_w3b7SaFTn4Zmwnot5vpDs89y+zpjcJ=-mEnP5w@mail.gmail.com>
 <8158CEFE-8EA2-40A4-970E-01B30BACC019@unpredictable.fr>
 <CAFEAcA9JC1HRboZ=722dsT7a4nDQNF_ECjLK+z84T5MJisfppg@mail.gmail.com>
 <2FD2C3C6-8FBA-4833-B890-5E81637BE7EE@unpredictable.fr>
 <CAFEAcA-MAsQpaaUx0dJHRHjUJ6bEWwnf58VZN965Npmi7_kHXQ@mail.gmail.com>
 <FF6F91A9-9A09-48B1-8857-FF213C9A4644@unpredictable.fr>
In-Reply-To: <FF6F91A9-9A09-48B1-8857-FF213C9A4644@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 21 Jan 2026 12:19:06 +0000
X-Gm-Features: AZwV_QgTuDx4byO6bnZnRe-P6azQ6W87MYvn-4-JiCvrmH45roX39mHRSwLQR5c
Message-ID: <CAFEAcA9FMiNZXgRP8OZgvAyPJXfBphXXs4eB1kBZtDgqYDTYUQ@mail.gmail.com>
Subject: Re: [PATCH v16 04/26] hw/arm: virt: add GICv2m for the case when ITS
 is not available
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Pedro Barbuda <pbarbuda@microsoft.com>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, 
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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

On Wed, 21 Jan 2026 at 12:00, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
>
>
>
> > On 21. Jan 2026, at 12:33, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > which I think means we do need
> > the its option to be an on/off/auto one
>
> Hello,
>
> Would this be ok instead?
>
> typedef enum VirtMSIControllerType {
> VIRT_MSI_CTRL_NONE,
> /* This value is overriden at runtime.*/
> VIRT_MSI_CTRL_AUTO,
> /* Legacy option: its=off provides a GICv2m when using GICv2.*/
> VIRT_MSI_LEGACY_OPT_ITS_OFF,
> VIRT_MSI_CTRL_GICV2M,
> VIRT_MSI_CTRL_ITS,
> } VirtMSIControllerType;
>
> Combined with:
>
> static void finalize_msi_controller(VirtMachineState *vms)
> {
> if (vms->msi_controller == VIRT_MSI_LEGACY_OPT_ITS_OFF) {
> if (vms->gic_version == 2) {
> vms->msi_controller = VIRT_MSI_CTRL_GICV2M;
> }
> else {
> vms->msi_controller = VIRT_MSI_CTRL_NONE;
> }
> }

Is this with the idea that the its option get/set
functions would set msi_controller (to ITS_OFF or ITS) ?

thanks
-- PMM

