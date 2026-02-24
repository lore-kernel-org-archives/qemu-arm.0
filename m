Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEAADF4BB65
	for <qemu-arm@archiver.kernel.org>; Tue, 24 Feb 2026 17:46:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuwUH-0002mi-BA; Tue, 24 Feb 2026 12:46:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuwUF-0002iJ-96
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 12:46:19 -0500
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuwUD-0005DH-SM
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 12:46:19 -0500
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-64ad019bb5eso5119571d50.1
 for <qemu-arm@nongnu.org>; Tue, 24 Feb 2026 09:46:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771955175; cv=none;
 d=google.com; s=arc-20240605;
 b=i+DezJPMcSvNshfSwcG8IZszMr1V3+SmJNkeiU4Ew7lMbaTPbFNohWn2qIOr7VXM56
 WHejO61RZ/JENd+JT4MVHh5IHxLKOualJGEfWGEN2xunh2KMJu1lsNEvhIravewgq6oD
 U+sL+PLwWzzWSMAH5CxeyZn+afG+Tu/YIeDQJt6A2T3s19ldNKzfR+Cz4GZ608sjIlbm
 6KBw4jcK3XN+CQttF826QqvoRdhRvVrGus8ieus45zQlpRf5raswPRj01IGCVO95T/7m
 EkAiTP7qDH5lPsWfI2GsIsDNb/BofgxfzT5JqfaYoo7ZxeSP9mHyeEGOMmZ3qzT8tFzx
 8znQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=CQE21tXGJCAHd9dP6vrG4T8bnEpBZFaF++JScfs5Kzg=;
 fh=pPR1WOJCs9p7FU5C0g2X8l2+YRKxlCyOCpOvGYDsc1g=;
 b=SLcvi7V/H0xrLIs9DoPfsCll4nS8FU0HK7850TjdcVsGC2SCsTARjD/GgOYb3WBMtr
 etPZviaKN0X2fbUVhH9E7vr1iYDyP5l+gIUAU93kZSE2X6/K8mT81ztCRzB2F9wODf2R
 bcVpZSlNZfEABiii1hjiBK84dZaCQDFt+i4vK+KG5JYRmz35fCbzH0gZQ8e5eMsvBi3v
 upnhIoIPv1iUSICoktJfulghHY+qmHcNS8GS/4d1kOnbwvm4tj/ss/w8EpwF7zY79Rw9
 o7xqPIsY0u63nG8iorlnkISMopIqlPxn0q187ehJr128kcInVZRqt/HwvDLVRQA3eZWG
 PdtA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771955175; x=1772559975; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CQE21tXGJCAHd9dP6vrG4T8bnEpBZFaF++JScfs5Kzg=;
 b=DqecAe+lshaaFxUv+/Xzm0ANv4MVmihxoLfFrHUBs++VA/SRXAcnJXeiJIuFYoEEI8
 KAbp3DDX5gxZcoS4r7SxgDhZFu1bNz8VuePD6jYHELnOSQmIfKx0Ynv6MfP+VIVrWPck
 xxWFjZ9sPXIuMh9jHAcv3p8rTIKObcYkqI2JlmM1Lwg4yuqP4pCVegzOoM5a33/zA6zL
 U77BRCMoWyvBFWKqnJ31fs9ZLxx5DRe+y02By41RjHapz+8j4ivZg2wsTnGNmsrz30J5
 XgHKe/BLyI0sDyeuz1gjTZb6NqL7rG9HrMWEh5ctbWXPDs1vDMgLOiSMZA7vMY3jkFD0
 W7rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771955175; x=1772559975;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CQE21tXGJCAHd9dP6vrG4T8bnEpBZFaF++JScfs5Kzg=;
 b=DFN+XGERjt73CikopjLPEWHDHGrCFdyMN7t/7MbQqGPDYtImg8bbRMxe6O0GOaVp2k
 6j7uIbqIasLy1rpZ3R4vKm92hD0XrWsrR97ah+hiU5H4JUcpbgtzL4ZgRK8bj1cJ6wpP
 Saqqd8oISGf5JuVikFU+ePEbS82qFCtiel8KCbuhMvTyT3GW4s3XDaO91Bnb8ZI1EFAK
 DKuGuLApzCjMWffn7fFY1hw9QnlzNxQPZncXsvnS3uGQ+9G32ZGkD5DJWTwDwt4/+/gw
 /YQ3G6TJE0vBntSFtN5y2Ob+DkUG0QzJ5sykvw40R4hlbYVdhK6E/zZ0885w4wnfsTrn
 b0TQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXU0j8CuA4ayf2RAeNH7wpK4iwaelIa6cMXzna2bBw45KoZiRPdGWASbsMHpUqtx9Q1VgEj2YrE4Q==@nongnu.org
X-Gm-Message-State: AOJu0YwPlYQbIowM3nclbcuamjOx+cq9Ok0sicH7J0niBOvE4npXJD0y
 S0Jt6TK3SYZysRyl1Ke3ee4AStroLI10ABhfoqXAnxH18veRg8gFkW+OT7t270WyYC7uKiuyqch
 F/HUwgL3I4U3BMV3Cury1SV7LylywwNQd4Ohp1dQ9bw==
X-Gm-Gg: ATEYQzyY/PhPq6Y08hdClWecWAKJlfHIXYdyQWuN15yF6jgZre+JstY/jhU8LWYc/EK
 ktOx8Xr2wMSct4qEZthgSSA/vcaJ/6HhCJwewicsJqvcfe2BUtRPAH1fu64Uzn9cxzbSNBB2p4l
 rvDGf+E3OxzBK1urNUFetoH36r0elmfYQ3csMewyySvdmvrHVSHZ6Lx7eIsfG9u/YLnXXBEWklQ
 XRmFMzQAeDqL8pNEbDXuXS1lN14cUAlkozdj2sWjcGs3mPqNio0ZdIKG4Saqa0RDQnb8nNAh+IS
 zEXT/1lcJHgOinF4wdAZg2DDTdmV48/g8Lniuu4gjg9HfteXsu8X3Om/9iNXwq/SdNY=
X-Received: by 2002:a05:690e:168d:b0:64a:e3dd:58d0 with SMTP id
 956f58d0204a3-64c786d10a1mr11130440d50.15.1771955175253; Tue, 24 Feb 2026
 09:46:15 -0800 (PST)
MIME-Version: 1.0
References: <20260219171810.602667-1-alex.bennee@linaro.org>
 <20260219171810.602667-14-alex.bennee@linaro.org>
In-Reply-To: <20260219171810.602667-14-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Feb 2026 17:46:04 +0000
X-Gm-Features: AaiRm50ItoAXOhS6svP9VdlVvft6M2sYrK1WnPTGpygYq2YRl9NltM5lvx0dZC0
Message-ID: <CAFEAcA-tdAfuAAsDuKBZOfAtNtsvdf44Z=vf9XvC_0tba9i43A@mail.gmail.com>
Subject: Re: [RFC PATCH v2 13/14] target/alpha: move cpu reset into a proper
 reset function
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Yoshinori Sato <yoshinori.sato@nifty.com>,
 qemu-arm@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>, Thomas Huth <huth@tuxfamily.org>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, 
 Aurelien Jarno <aurelien@aurel32.net>, Jim MacArthur <jim.macarthur@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Bastian Koppelmann <kbastian@rumtueddeln.de>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Aleksandar Rikalo <arikalo@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Zhao Liu <zhao1.liu@intel.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Yanan Wang <wangyanan55@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12c.google.com
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

On Thu, 19 Feb 2026 at 17:18, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Now the alpha clipper machine will execute a proper reset we can use
> the reset mechanisms to reset the CPU.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  target/alpha/cpu.h |  2 ++
>  target/alpha/cpu.c | 10 ++++++----
>  2 files changed, 8 insertions(+), 4 deletions(-)



> -static void alpha_cpu_initfn(Object *obj)
> +static void alpha_cpu_reset_exit(Object *obj, ResetType type)

This should be the 'hold' phase, not the 'exit' one.
(The general rule is that "most" stuff happens in 'hold';
'exit' and 'enter' are for special cases.)

thanks
-- PMM

