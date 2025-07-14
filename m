Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC92C83F21
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Jul 2025 10:21:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ubGJU-0000Ag-Ax; Mon, 14 Jul 2025 06:21:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ubGHr-0007bR-JX
 for qemu-arm@nongnu.org; Mon, 14 Jul 2025 06:20:04 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ubGHo-0002vA-Dj
 for qemu-arm@nongnu.org; Mon, 14 Jul 2025 06:19:55 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-e81826d5b72so3427628276.3
 for <qemu-arm@nongnu.org>; Mon, 14 Jul 2025 03:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752488390; x=1753093190; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=v9jzWSjLXExFqqVpvpK2AkRoYqLYZiZEgR1f+vTFLuo=;
 b=CN/G77Z8ZTjJmGScrCp8pF/UTsgCeYwyxWNIfQfnTLDqQ3BRkHF3BshIZ7soWueeU6
 Cm1qlXz/z8j/8aK+o5WE9aW1CkKCWvFMxU3Gbtl+AnsRScvgbtoCmziMHx1OfHudDDAy
 7Xb6/JxvEo21qFsKyYpxYR8rqrlLKELe+V2DzMMtcUgB28MOQFm5OExoUC9Pc3Qozhwe
 IDEgXscKByZc7pSqJe9d/EC+ELixJJRIKNT6/6eEUBGZFJM+V0sk58twyNlHX9DztZXs
 XV9NOCTugwmzs9cslYwkyin9Zi8SP7Dlz3taa/GOJMB0oxUaAq1NJrlKWAIMH6UB2sSa
 f5zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752488390; x=1753093190;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v9jzWSjLXExFqqVpvpK2AkRoYqLYZiZEgR1f+vTFLuo=;
 b=Kqs0nwOIq8VxMWx7Cy5lEH0hM9Qj0jb6LmZSJyEDmG9ksEzpI7PrI909MOIBoGdSmU
 XPWgKidTowLxUMDu/k+YKW7gydP0eyaNIhCQRBHm+JVk7/Pbn2kG2KGtDeWI3V4lDzpU
 +rPPuTfmD8++grDpAl2qmJw78jV4Tu97A76qa1MMWoIaMvSe6/8WMGtf2FtpUlI0T3/U
 eRkjLFVIsZwwwZB4sHFeiSxM+hapJ36S08aHlO/APku1hZakWDVNKp7M6Nt3o2PwIikt
 gA1vTfNfZ02N4W/fX2z+iw/bjozsWXQp63heqlFbJPnt2pCSoCoSLp9L1HOaVUuLrSsc
 carQ==
X-Gm-Message-State: AOJu0Yw3ULITyRiJN2wNf/EnlxaHZGG1rf3Yo1y1VOEUbf5OJT/A5qA8
 sDm/+sGPcl0J19K2AZ5UKSaAtw86sNXswGFEjHKEy9FpPFyLxFUlW3wZ2qCzc/ch+R1ZWyEuH+l
 +9WFjrRci66V/msu9TAqyBbcbtL9kzZ2sIIAYsNmx2f6SD5at+6oA
X-Gm-Gg: ASbGncsXVC4bfn/sM0RRrpEJrHZmhTd1msFLM1UG6usqYRaeqElKa1NPi/oxORq2O+N
 10+prVIHfi9i4fY4nCqXPksSioKjiSQ/upZhv4Fu8BbD5rp47Bsm4ucZjUHrKtfWhVTfQyGtiji
 WSwDtu2v83Ov7iaAUaHZYd6jZy/NTEaB+Dt+ej0mKIie4CBpf++RgNLYB1sFyhPej9yvqDXeDHe
 IJnR6f+PLDefMvEy6g=
X-Google-Smtp-Source: AGHT+IHoiKpr1AdBA7V0x5qWUApLA4PVNHgItJYrnK1NPBWY66WVkoCK1i9vEkzT396Fmf+gKvYrmrZiLVtdEaoY61U=
X-Received: by 2002:a05:690c:4809:b0:70e:719e:743 with SMTP id
 00721157ae682-717d5e0ea36mr176197587b3.26.1752488390088; Mon, 14 Jul 2025
 03:19:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250713154719.4248-1-zenghui.yu@linux.dev>
In-Reply-To: <20250713154719.4248-1-zenghui.yu@linux.dev>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Jul 2025 11:19:38 +0100
X-Gm-Features: Ac12FXyREpceJQvZUqDKHaRfH2bJqlOUrrnuKpIm5TFeL2LvFUfNGE5_Ptg2Elg
Message-ID: <CAFEAcA8AS=X9QVFOVomFJB=bzsPdxxJS8O9e4rXYXVFb_5hhTw@mail.gmail.com>
Subject: Re: [PATCH] hvf: arm: Remove $pc from trace_hvf_data_abort()
To: Zenghui Yu <zenghui.yu@linux.dev>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, agraf@csgraf.de, 
 mads@ynddal.dk
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
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

On Sun, 13 Jul 2025 at 16:47, Zenghui Yu <zenghui.yu@linux.dev> wrote:
>
> We don't synchronize vcpu registers from the hardware accelerator (e.g., by
> cpu_synchronize_state()) in the Dabort handler, so env->pc points to the
> instruction which has nothing to do with the Dabort at all.
>
> And it doesn't seem to make much sense to log PC in every Dabort handler,
> let's just remove it from this trace event.



Applied to target-arm.next, thanks.

-- PMM

