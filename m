Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 560E9CCFA18
	for <qemu-arm@archiver.kernel.org>; Sat,  8 Nov 2025 10:50:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vHgWr-0000xG-FC; Sat, 08 Nov 2025 05:50:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vHgWn-0000tE-IP
 for qemu-arm@nongnu.org; Sat, 08 Nov 2025 05:50:43 -0500
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vHgWm-00086I-0L
 for qemu-arm@nongnu.org; Sat, 08 Nov 2025 05:50:41 -0500
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-63e393c49f1so1409708d50.0
 for <qemu-arm@nongnu.org>; Sat, 08 Nov 2025 02:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762599039; x=1763203839; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QaOJv3F4WfXiPMVAF7ScO2qntDffQNE5gJ1ppLtW/ak=;
 b=hBu4A4hYnJMWIWM9SbgVgInjGJJ3MhKISN5/51tLkbyFZp0dHa3tgiIaacMSAM2uFl
 zlSvO2932i1sCEbmejmbt6LlyjD5booovnTqWETOlrDYIeZZwHkrGw+1ksbLx999HBnU
 zGHMIEDM5XPJwttJoEUSMTAWsKN5nXe7Jtl8vA7jym/uYMbMXogSfM7mVgfz8RZSy/8E
 pfatxqqybDa3IBO+UV8hFxy2LSf2uP+A4VIXLenyweoMoTS+YfyA4tOS3oQV77acBXZO
 /EA0URLe8CLW8iMKS8GTouF5JChA1eZhfKMRqGK8YswVdn9jK4FwiScd0kRgv/gLYbNg
 aafw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762599039; x=1763203839;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QaOJv3F4WfXiPMVAF7ScO2qntDffQNE5gJ1ppLtW/ak=;
 b=dzviD44VIeg/dry7gN8hatIsjDVxbTphBTUu5St8RgG/bsYP2FDXuNX5RZFZ7aE8Cp
 uO7TtG2ZGUwwhrEDvfWD5/cLx/0qPmwdruvXTJyLFHRMNyxL/Vec+5GXKKjUDAV7nmAy
 O7kcKcTXxnpTzLN+Wp10sRJXg/V/FQNl0s+k15vacuIQ4tJGg7XcB2c4iH6GQ82tiPfc
 woQNAUFZCe+cBAzMxroJE9mrhGc+YafU4OM4lUlzKFTzARKEz62sW+gYowHirMAEiS1z
 3uvOEeIwaFsOa6RNtu1mUibrIEux7cTMpBld+rvgKrZfxCU2C2AxQ1eVbcnfnPITv2cD
 M4wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMR32xHbhbuINhhD0DudRSdvCKB46L0+NRlODElNcY00CgfzA5CLMp9DUylpZW9RQxOcuYyt2K3w==@nongnu.org
X-Gm-Message-State: AOJu0YzvtTMGchmEkgHV0Ka4DYBnNPQnBxCMJhIhv8G6nKozGeDb034o
 sHkd6qYmdtTUXCI4IpqqXIvX4X28Q/HFLEcdJm9S0vUAvFO8wFPplQEsPXFPaW/bKWtKbY8Iacv
 MG8EHbZWlMyGp8o0ok/5QCL4U9mc4c8gWJJsUReUZHA==
X-Gm-Gg: ASbGncsIgpSdlA/pZ31q59BvWlz/7AdhO2841Be6pAuZp/f7Xiyxo47xBZocm5IDrXn
 zjOokFlEozMK4iDL49JhUXr0kb00WF9mKrnzpAZR0Y+VOFISpMWLvAU94YS/mHin6D6OswA6zk/
 hAgMMXZBsS7CRWebOtBkxSa++7OsJJsZ+qrqxeNbbPbkIeQqgjVc4vwL2mpdjdFFCkD4Wb7OuOL
 dgMyVNoM0TYlQZoAs8fZa1HbTB52MqGe+ue5hoGpltpc4OFNSxwdGoMURcCdQ==
X-Google-Smtp-Source: AGHT+IErxe4tHk07vkEKbgyd+9hBu64SEsrWtu+Bfboy8iZWXu584NWh3wv3I9cJRpIB0i3zj5IvHfuENAvLAXUkMjU=
X-Received: by 2002:a53:acd0:0:20b0:63f:9897:f544 with SMTP id
 956f58d0204a3-640d453abbamr1322713d50.19.1762599038870; Sat, 08 Nov 2025
 02:50:38 -0800 (PST)
MIME-Version: 1.0
References: <20251104233742.2147367-1-nabihestefan@google.com>
 <TYPPR06MB820663370307D783EA2AF733FCC5A@TYPPR06MB8206.apcprd06.prod.outlook.com>
 <SEZPR06MB76199F82F5B0D106C85E3080F7C5A@SEZPR06MB7619.apcprd06.prod.outlook.com>
 <CA+QoejVLkP6g43PJYpJacqVcNB+VRkQwSa3HYQbA1zJxT1d9Cw@mail.gmail.com>
 <db898f19-da96-4ef1-97ef-b8226a8b4065@kaod.org>
In-Reply-To: <db898f19-da96-4ef1-97ef-b8226a8b4065@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 8 Nov 2025 10:50:27 +0000
X-Gm-Features: AWmQ_bnOpk4ABYBxdi0cpFQ7nQjw65vwTb7f0SpzMiXFgyYt6nTSDQa7NGJYsUg
Message-ID: <CAFEAcA_d=C5S++dpGzkibyEjcLDv=VyD27EgN2e+uCzYb1ufpw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/ast27x0: Fix typo in LTPI address
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Nabih Estefan <nabihestefan@google.com>,
 Kane Chen <kane_chen@aspeedtech.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, "leetroy@gmail.com" <leetroy@gmail.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb131.google.com
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

On Sat, 8 Nov 2025 at 07:36, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Hello,
>
> On 11/7/25 19:28, Nabih Estefan wrote:
> > Given that 10.2 is closed for features,
>
> We are in the soft freeze period :
>
>    https://wiki.qemu.org/Planning/10.2
>
> Features are still possible if reviewed.

Softfreeze means "no new features". The exception is
that if you got your feature into a pull request on the list
by the softfreeze date then it's still OK to go in even if the
pullreq didn't get applied before softfreeze or it needed
a v2 to fix some minor issue.

thanks
-- PMM

