Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97449606A31A
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Oct 2026 13:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hYUrqfnt
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMQXl-0001Pv-9u; Thu, 29 Oct 2026 09:51:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xMQXX-0001Ob-VM
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 09:51:37 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xMQXV-0002h1-DY
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 09:51:34 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-8b125371596so5770997b3.0
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 06:51:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793281892; cv=none;
 d=google.com; s=arc-20260327;
 b=rUKKCEKdtORXSRtdDROJ6xk6GGJ2lScGqkODW2TXh10LGDxhhyv0PEPP+u/B0qZPnz
 VqepNQwW10sV1+GnYvSx6t85UdDWgPzihnTtCIAGkV5R1LGhPxKQsye6D3px8EZKynow
 Jd8dqNds6E2lfhEDpp/4OW/Vrwb/mdBZcDUWUVSPTxwrc0LR3towk/kSLAml/EUnLI5y
 jiy4klCCkC4cSykcoueb9Z+IMp5Fm+EN/qRp0NZH9KaaixKqN221SyJKNtFg+tFoN9+c
 CYGlXUW9F8WChguVC9m9fEWmeCUwbt8+CFWrHzJQWT91d+BsQL2WHt+3p6g10DA7NqwC
 gzNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=CIkXcxf8+PJyHV4D3teiTigQGSh14bpq+BCbZy3Omd8=;
 fh=r666LIv9G/nO7ITEBX3kKErnuspSyKcBO9Vkq4q45gY=;
 b=L6J14JNgrLFO+7Pd/uWpWHa5Ox1BDj59Q9ipwfLO8xlOpO/2Y9+BWV7HN8InIOU4Fd
 pGWoR+Id5irQ0UJRDwh3IVrkQQhG7rhUOJJ1JaFomRqNli87doeaS/PzuPjnQT/4btev
 ywoQMrPI7IX37OzLslDCxbxOKj4D/rkhB06i2O9bCCiMNYPWU/zim0QujKxw80l49EFL
 3d6hkPIhvecVgO1kzz6iFnBWPUa42E0AGd5wncwN1E6NODtHuCFcZBDaTj7aKr9h4Z79
 TBsyra/mktJJCunyXaSqHYMlx9OVFxAliJjVgYDrfJldtpCjQP/x9Axq5V8nas6xgqnk
 1ofw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793281892; x=1793886692; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=CIkXcxf8+PJyHV4D3teiTigQGSh14bpq+BCbZy3Omd8=;
 b=hYUrqfntoIuB7b5dmMTl3pR3xIXJmHaY3j1j3MdfAv9XAQkAEG241JmbqWiahNl9fX
 Li9yFnvLgefaVNVaQFwwrJI+KfpHHXTkhdltXfjzX6rsH7mpOLENLJTML7bER1PvRgtF
 Yj0DuJ+p8ntj0vX+gsYtLNvkWJKEHapb/4kfnq5FLrRFx4+uXkssMTdJhK8/EYtU830U
 9eOGg1/NIgJD3EeB/DXPH3kn9iv6Vt9wi1bxDe0buHtbvwq0GTUHzyl/E4FnKhWdbc+b
 4GrF2YZXTuwsCGZo6WegZeiQ0e6VGroV8rIBrkpeo6vkQMbhprH86RGfjuwrk+RzhL9J
 WMLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793281892; x=1793886692;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=CIkXcxf8+PJyHV4D3teiTigQGSh14bpq+BCbZy3Omd8=;
 b=Xl0LU8KLS6GPDZJAGvWR2iMIDPiMma1jGldJZ4UqkqCj9DGitAm2FSKkUg3zHF5OKL
 yRsrmjZ9KUbViatw4TO0cS02zX9zJggdcRxkn7/7ZkfClfmtvPKQ0q+jEyH1xljYlLA4
 tCthEMBN5ftKpuuWWaM68r3N39XAcIUUjCFqFLlT+xVE/X86SWod8jO0Kh4a3UpKGrFJ
 b++hVO2N327PBjSzolcxCxCvaRNxDEmsnxFvzIDQfACdBpUx2lpnCBObuH5NM3tZCkqp
 bm2fUNYzE0oFTh7REb48W9e9KBsesdAS8BjZrHhb5H5LAfTaKgWEfddCpJheQf/kJBwr
 jcVQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzgeaDkSJ8vPLnKlqjeCxS2zpYl7JwVBivhV9v32CKJhm/Rbvc8cPRv1lMrNDqG3YZaXUUz/8Pdrw==@nongnu.org
X-Gm-Message-State: AFq9FYLr/HnnOWrC9Edq3fZcCOuehqY4PB0XO8btQ7xkfthfl9ojWfvQ
 /hrWru/QOBYy64NYOnyu8ph0s/SsS6UMUb7WtFLD36aMJY+H95BcM0lZDox1aBrRCCwEA9f1la5
 L3Nyi+s8jCj32dIG+FtwvJmZOnQm/TIG41NstkeX7iQ==
X-Gm-Gg: AYBFou2jDYHoKstvJ4VKVjkhV4//pGUQLj7oP643slFO4Z5qXBmJkaKJDWQ4UfkMjxQ
 YJvtZx4muLIQ2E1APE7zzUf3bhIUzAXtgxqITkBIc4Xkd5V/YOwDjzvrwGSVQkypmVXvLp4PizM
 Y0wsVvjs4W+m6njiaO+ytyBkoGEtDldlGkk9ibZKLfqCFAFIa0sjaIseCqdXflxmF4SIMLyXPTW
 runSZQ5wW9IW+E8IqSkCFERpgqKVsUZxLAU5qWD7A03y5kv3SacezcLP0xRRVTYpDFZIQkf2H6w
 AERRrBpn5T+0w1oTjP1aU6dDZRw71Ls6rfaWjyLyNyOEscYa0pr8kIUQv7t+wcYEtM8ekjGu6sW
 ZDIZkAhTkXT1Boya2phbEkEzdBowYP+4Q+BG/dEGB0lL+6T9CSBckPIOgC8VAficVoZICGsho1t
 O5NRAPzEKSvVuJUYGGbDaY
X-Received: by 2002:a05:690c:c3c6:b0:8b0:9e7c:7b11 with SMTP id
 00721157ae682-8b1c68a8d2amr14447187b3.32.1793281891721; Thu, 29 Oct 2026
 06:51:31 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027120135.53048-1-mohamed@unpredictable.fr>
 <20261027120135.53048-2-mohamed@unpredictable.fr>
In-Reply-To: <20261027120135.53048-2-mohamed@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Oct 2026 13:51:20 +0000
X-Gm-Features: AclHuK8t0COkBkibOwBlpJpUCqipNaBjsqh4sKLnlVPeRXXlKZ_LkjWiX_6JckA
Message-ID: <CAFEAcA8uU2VowVTKhawOYHMChFqKfwxdjY06D5Usgj5yP9aosw@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] hvf: arm: save/restore SME state only when SME on
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, Alexander Graf <agraf@csgraf.de>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 27 Oct 2026 at 12:01, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
>
> When SME is disabled as part of the CPU configuration, do not restore SME state.
>
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>  target/arm/hvf/hvf.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

