Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA4F9C5B572
	for <qemu-arm@archiver.kernel.org>; Mon, 17 Aug 2026 15:50:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wvzb6-0002KZ-BX; Mon, 17 Aug 2026 11:50:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wvzb1-0002Gk-Ra
 for qemu-arm@nongnu.org; Mon, 17 Aug 2026 11:49:57 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wvzb0-0003mo-9a
 for qemu-arm@nongnu.org; Mon, 17 Aug 2026 11:49:55 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-81ff017d420so605097b3.0
 for <qemu-arm@nongnu.org>; Mon, 17 Aug 2026 08:49:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786981793; cv=none;
 d=google.com; s=arc-20260327;
 b=AgIfaN05F6+kxTBQtijM2xv8Zqm5Do/fk/khv/BMJFUTRkM86qIXPc3KYu+rfy2X6V
 P1agdlv5HmxvSd62pUAacmBOiI3ch5q900Oqbzr0mLZhW6NWg+K6nrtOQnQEWz2B2GEU
 GVlXhaoWvmaCFBPBlo77NW8eJQ7+GJEcjI76U9SoH6y1fV5cozgkOQg8BygZL1cKGmZn
 By6AazLTa/Hseu+N24fzIsAugxS6IZVtrwC98XaR66oHWyhrjxm0OkXuFNb6++FQuirF
 AoqAejL/2tOdZj49KqrC4GuoPWWZG6KvcMO2SFuwRjHImubcwBBX3Y0h23NFf8maZyFl
 ijjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=C7N0DHQYtLhmp6Pbc2ndzyTZyPyaRkhh70v7F2iqE8c=;
 fh=yJNrzD6Cu+znb2FPxcHIHF7URTbDM53y4nryivWS+4A=;
 b=g5H1ODeZF80ph8UY8XIx7tMJeLE4wzR5XKR4LTSZv867bkhvADODihWIRy0B/UwDYz
 2cu9Y0Lv4DZceH6CN6spEJJTfovtuMszkHoCd0eMY0g620auRehVSSF8epGia1Y0eLdr
 99MnPc7FjtWPO6kbky1HKq7uz6pQhbgVN0GykHO3dSP7t3v5C+Jp63vrGn1kki2pMErB
 sXTMajRTo3m+dI3WgOQB51wo41HIfcgA3K77d0QAn0Zh8ZdyqvZX1ANd1ISXr/Ap5qx2
 gE9wauiq3ZewAM+0bGsHbPS8kfO33WD6s5Z+RKVjv48GTbhWTPPDYE+Cem1VfmiZvpRB
 94sA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786981793; x=1787586593; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=C7N0DHQYtLhmp6Pbc2ndzyTZyPyaRkhh70v7F2iqE8c=;
 b=QFLyTHchiUsr4TtiSRmRJfDFFnEe5qJlfYc5ZZT8gOtlFl0FjQbtDLVoqrGXfyTE5E
 bG5NFjJPARa024U5ysiKgwuCzJT1wDXjPoMecMvw3CEQNta9l//0Gj0jgbEzd8KtWe0p
 KBtvrjMNacl11mlDjT6La9qQECYS+tidK411eDX3yGjoRGQlnwZHqSZskx9HiZMoQ3P+
 toqSgW44LeV9bXJWPUT4TX8br1JARIss00evLqaLQ56ky+aYZ5+gMVPQVlgHdXa8ghjc
 QjdOMVT34/40dyyyIFv3xBhe+eRjSpe4RhfF/i4IIhS74D+EbXBhfA1a4wN7wlzYYuiY
 tWcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786981793; x=1787586593;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=C7N0DHQYtLhmp6Pbc2ndzyTZyPyaRkhh70v7F2iqE8c=;
 b=gYzjrnTZJPF25Fdg8KAWdPBelbs8TGkeOSC/wioXDmjCJu1ab5tBj0lmGNkU89sp8F
 R7M6iOeARSkSq/YZ/LWcWPW7lm02eKBcgZZWwNc0axPs+9cqV3UyTDbe7m/ftPaL/D20
 y+sRelShzcCVpy8e4axekiEbc4RslKL8I60mZxuvgr0zanjhokeZoXDcs3ezvlugxY2a
 i72WF0vgj07+n/3GB6ZfxcHWFOyVykDbqzVnF4CyQ55HirtDAbd/t5u3MZ8S6JJibU3B
 aUxrI00y1KZigXc7VUSiYFUP1ggC72L75XtQLUeVmdfMmE+GxQ7G7UiORgC0K7O+vKOA
 gU2g==
X-Forwarded-Encrypted: i=1;
 AHgh+RoD0M94EkeI+8/r0QkkZxVtDjzzvOyIYD+xYPL4jHdQaCX/kwLX+txs//ZCWnewChNhiU2M9vkaFw==@nongnu.org
X-Gm-Message-State: AOJu0YwuBqJUtFZM4nLKQPdPTxPmNl8YQE89V37qPRU3OapIsHHss6iY
 Q0Hvff+NbPDLiVbmLBtxpO1IJuPDIgSYheI9j1SJl28zpt6tU7n7noHjF3+0+L+L76F7Q3EHdBm
 hm8xERXdSfR9fQna9GKK2fELhpuqznXPkXtJuXoNAsDia3YkZU/qm2fM=
X-Gm-Gg: AR+sD10QDQAH3fULeVr/Y0KCx0yIIZtvhhwIaito2z5i7UEjLY33LsgnrZSL3nBw6vN
 e4NsbG4FcGynIZ23trP3rD5vDAAfe6ZOVrPgBxhMuv2WPLIWGqbQF+d/W1gFLEq1XKrjex9d4CL
 N9u2nA0VGA0guuBiPlybsilbcCapaJcCkGpEbT90EMPnjiCSyRauDuaFFjnW5pk/9Pij/IGTVsN
 T1LGzE/I7Xax1+QKdnrw4CagxElYqL1gGz+ZDiv843WdXPCUbyWLnpZVaZzqCl2xzngr+wkqV6P
 n+gWOdcMr8e+lIulBTjckew3ibfowYO5DzOfd2Mzp3GSkU4F4TK8LI4j1plEc81edKgpB36oDXT
 zS7U6C0iTLlQ0GyJQP5VjKdHfLHPc
X-Received: by 2002:a05:690c:305:b0:826:8d02:8e97 with SMTP id
 00721157ae682-841a31b2f24mr403517b3.11.1786981792837; Mon, 17 Aug 2026
 08:49:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260805153005.9989-1-simonxhy0404@gmail.com>
 <20260805153005.9989-10-simonxhy0404@gmail.com>
In-Reply-To: <20260805153005.9989-10-simonxhy0404@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Aug 2026 16:49:41 +0100
X-Gm-Features: AcwNN1UPDX8c8zIKI_GBY-qn0KykqbMkHgLTURlPE9vtJVI9nniVJdZhpm-WqnM
Message-ID: <CAFEAcA8rTw8VtRrcOxs4ihqFLwCKeQUMar3HE7ijGsC9bZf5Qw@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] hw/misc/mps2-fpgaio.c: add GPIOALT2 register
To: Simon Xu <simonxhy0404@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Owen Giles <owen.giles@hpe.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Robert Elliott <elliott@hpe.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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

On Wed, 5 Aug 2026 at 16:30, Simon Xu <simonxhy0404@gmail.com> wrote:
>
> Add GPIOALT2 register for new an555 board.
> Implement register access as RW with LOG_UNIMP for writes.
> Add "has-gpioalt2" property to make each board configurable.
>
> Reviewed-by: Owen Giles <owen.giles@hpe.com>
> Reviewed-by: Robert Elliott <elliott@hpe.com>
> Signed-off-by: Simon Xu <simonxhy0404@gmail.com>

This patch should go in the series before the one where we add
the an555 board, so that all the features it's supposed to have
are implemented before we expose it to users.

>  static void mps2_fpgaio_class_init(ObjectClass *klass, const void *data)
> diff --git a/include/hw/misc/mps2-fpgaio.h b/include/hw/misc/mps2-fpgaio.h
> index edd9f23121..7512686616 100644
> --- a/include/hw/misc/mps2-fpgaio.h
> +++ b/include/hw/misc/mps2-fpgaio.h
> @@ -40,11 +40,13 @@ struct MPS2FPGAIO {
>      uint32_t num_leds;
>      bool has_switches;
>      bool has_dbgctrl;
> +    bool has_gpioalt2;
>
>      uint32_t led0;
>      uint32_t prescale;
>      uint32_t misc;
>      uint32_t dbgctrl;
> +    uint32_t gpioalt2;

We need to migrate this new device state. To do that we'll have to
add a new vmstate subsection to the mps2_fpgaio_vmstate. If
you look at iotkit-sysctl.c you can see an example of how this
is done: you add a new .subsections to the vmstate, which
contains &mps2_fpgaio_gpioalt2_vmstate, plus a NULL terminator.
That new mps2_fpgaio_gpioalt2_vmstate should look like this:

static const VMStateDescription mps2_fpgaio_gpioalt2_vmstate = {
    .name = "mps2-fpgaio/gpioalt2",
    .version_id = 1,
    .minimum_version_id = 1,
    .needed = needed_gpioalt2,
    .fields = (const VMStateField[]) {
        VMSTATE_UINT32(gpioalt2, MPS2FPGAIO),
        VMSTATE_END_OF_LIST()
    }
};

The needed_gpioalt2 function should return true if has_gpioalt2.
(It gets passed the MPS2FPGAIO* as a void*, so you need to
cast it to the right type with the QOM macro.)

thanks
-- PMM

