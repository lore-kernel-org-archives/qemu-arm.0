Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0244CD98F2
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Jun 2026 14:59:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1waECl-0004Qn-4R; Thu, 18 Jun 2026 10:58:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1waECj-0004QC-O1
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 10:58:53 -0400
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1waECi-0001Mr-8b
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 10:58:53 -0400
Received: by mail-yx1-xb12d.google.com with SMTP id
 956f58d0204a3-662e7fed068so517839d50.0
 for <qemu-arm@nongnu.org>; Thu, 18 Jun 2026 07:58:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781794731; cv=none;
 d=google.com; s=arc-20240605;
 b=TXTmCJU76HpL1uga2N2jvtaLTNZzUZAg856m51I3LVGKO0YBl1xW+wA9ty7YoeUTCw
 vxhzwYyb6WXAsPDfDjh2ejC5qXGwumXiCwc4UjtkuyAIF1msTeDwD+G5uwTL130iUaAa
 5ki6Cm5dWAtHYLiJkl88kGU4FNXQOaJ97HOsDWq8KUGkGDsR5pe08KRYIHb3qHqwMzjO
 Hf8wO/WwqCzIO6PXmoNccFHZOi2bco58jqZzjLy5PvCeXzgLklWEaSAI0PaVVhoZiDyc
 9YQk0e4Dem94AifwSPKGfAZor/MBEZ5sNuvRQrphdNiMntovj/0HKEfMnI95oPbaQjMR
 42jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=tUPIscPmndmx5i525GhyoosCIvCSVXyRVhSDHgGvlUg=;
 fh=KgvV5cCn82ffxtCQlh2UZxVvXgvULRIeKj9IeVaQSl4=;
 b=W6+1wAsE2cE6QSuO5wEwBtpt2sRy4gVpPMn/91AFkWNITcFGBON6KDLUw9TT5NSdFs
 oku7gi8lFFM6qU6hfzPVvY0/Ofvf6eFOJWuzGOCqGwderiwgOXkpS1vn/tgsTQ7pgGQQ
 I0+z3Cz2lper8dMXLswfvj26zorLeJkfvDxhaJD6o46m/BXc2pS8Jy80xvHKZrpTyyaD
 H59WzYCjWbWMRW3MhdsQCS4Tj1cgBhmWvX676wSPk5wat1z23C7L0wVxxOtyy2imaa/h
 vnniQFe/7gPxIoElwc0NEE7mQmVA+y+gQMGyw3zm3+snaFZSpXO7zTVf3NaluIR6jmyq
 dVXg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781794731; x=1782399531; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tUPIscPmndmx5i525GhyoosCIvCSVXyRVhSDHgGvlUg=;
 b=hfzxlS6KG5KQ4TkbN9cgQwJhQHXckX1MSVN0LAD5AS/xfoorsTItScABG82xdJ+/Dt
 0Pf3bgSqx10oAOf0MFY20FCYKsmXJ02NYrAAiH8URIVNRTqhcjnCkjPvs0YsXTG9G9Zv
 DPu+gGF4PVpI0zCEri00GH5h5INU0+e61uGhdAkC7TTNJQv7+XWMUDovczt0TmYb5ZoA
 tiXBWLwFjCQfdrtGseZnotZscmGtgYSFtoHKxSFVSeJQlVXfWIE3/nLl/R8m4iYHXrkJ
 OzrGRp4Iwu9vBqInpGTuAO7F2BJYw1sjzMNGY8dbKJ+DkzX7+Zr86a9MG8SoOibSV9/N
 uPTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781794731; x=1782399531;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tUPIscPmndmx5i525GhyoosCIvCSVXyRVhSDHgGvlUg=;
 b=oX0XfRtlddkPkZCv6Yo0Q5Rrp3zEGIw5yhPzPSyKVEIlT7oSLIQKPHkf7ri0i2e9ws
 te5tqWDmgBBON8MPfdmoUZS0+nKQR003pWwg5XbdvLSfwyMCPD47YAHaCbisMgD09yer
 Fj+wpyz/y2nkhe0G2k7MxbfzPXZ9VVSDEbP2SmfAJ5RqLuUpAX2M2Ja/U63xhRIEiSPG
 XPQ3E+hPBqd7ABjtbiy5mtVfPlujXu/9nM/DsHvHVaYHFF5XdpECawTFtYT790GUbfar
 a74XdUpTKyQG0VCzDc0oLvj0UzHoz9CdbpfUcVSAq+6ficXJcwqxQslAtkt3GWz3bNay
 +WyQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8WFT1mhZFUdbdtPgyiSfVoG+1nKIn4DVFSfk/22cWIBUez3x6yU2SzQ7GhOCmb6U4UTSJ/VcbGUQ==@nongnu.org
X-Gm-Message-State: AOJu0YygsFXu116kp86ItohM9b61Oek+hDogw3HPQjR+ttM4Tr3stzuy
 MwKGB1P9/MLJ5MeO28PwML7bp54BdFXy0ouLWNaB28Z8FNupvy7ZM/Hq/ItUU5OXmGBlk8yxt7t
 RRUgxUqDZGL5bW7x9Wg8BvqtnDJX37G77HbKKjiwkHg==
X-Gm-Gg: AfdE7cmqgrmBaOyGpcESPxhz0x6b5sXSJv7CTuge2kS/MgapN2VfA/LHztDAcvgL1yM
 MEvML8N3vsx61MjE7VYARabqVxa+bEAyP0EXf6ymIY77hC5hEXtzmNRLwKrAfvOdIHAgxlNKuFO
 24mAalXUVx1A6bzXp+HN9p72BZ07z366VpAPj3JLTH4KufLe3awxZx+1xsoh7SDqrPGmT7Rt9s9
 lwT25c6jFFWB33no78nsk9kB8BPQLEX4klLKyh6Uh4SeLkJsgnE5PBzeLPwZZ7qnpVIF8SJgNOx
 Vzs13njpFQYS/ROqu4Q4ntRDmQ9JOgpEn080iXNVqIEehx4BWu2rEaKn
X-Received: by 2002:a53:c091:0:b0:662:bd61:f818 with SMTP id
 956f58d0204a3-662cbd2263bmr6648189d50.52.1781794730707; Thu, 18 Jun 2026
 07:58:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260303092532.2410177-1-imammedo@redhat.com>
 <20260303092532.2410177-8-imammedo@redhat.com>
In-Reply-To: <20260303092532.2410177-8-imammedo@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Jun 2026 15:58:38 +0100
X-Gm-Features: AVVi8CePXzKJX-IjgBl9ocCe6xzRqZ5o2_2oIUuWx0lOKwgI1zZN8DzP69qeu6E
Message-ID: <CAFEAcA_KjOEBduVcop_T6-aH_DKy_4=QwTKa04kvKR51S79UQw@mail.gmail.com>
Subject: Re: [PATCH v2 07/21] arm: sbsa_gwdt: fixup default "clock-frequency"
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, anisinha@redhat.com, 
 pbonzini@redhat.com, shannon.zhaosl@gmail.com, philmd@linaro.org, 
 zhao1.liu@intel.com, rad@semihalf.com, leif.lindholm@oss.qualcomm.com, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12d.google.com
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

On Tue, 3 Mar 2026 at 09:26, Igor Mammedov <imammedo@redhat.com> wrote:
>
> Comment about keeping legacy freq, is wrong to begin with
> (should be 62.5MHz), but that value also doesn't make
> sense anymore as the watchdog is used only by un-versioned
> SBSA board and the later has hard-coded it to 1GHz.
>
> Other potential user (arm/virt) also has system clock at 1GHz.

It's not quite that simple. We use the back-compat 62.5MHz:

   *  - for QEMU CPU types added before we standardized on 1GHz
   *  - for versioned machine types with a version of 9.0 or earlier

sbsa-ref sets the same 1GHz frequency on both the wdt device
and also on the CPU objects it creates (because it doesn't have
to care about back-compat, so we were able to update it).
The virt board doesn't set the cpu cntfrq property, so it gets
62.5MHz in the above situations.

Changing the default value here is fine, though.

(I haven't checked whether the subsequent patches in this
set make sure that when the virt board creates a watchdog
that it sets the clock-frequency here to match what the
CPU is is using.)

-- PMM

