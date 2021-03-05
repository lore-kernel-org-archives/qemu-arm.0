Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp403113lfg;
        Fri, 5 Mar 2021 06:39:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxC0n63JbxwyNrim5DrzL4u5ZwUGiIVqvwfMffHBlWWwAU8IbI6vm11v4bitF/EXZBMu3sr
X-Received: by 2002:a02:7410:: with SMTP id o16mr10327224jac.37.1614955153541;
        Fri, 05 Mar 2021 06:39:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614955153; cv=none;
        d=google.com; s=arc-20160816;
        b=eUXP2GaAlWx/o6qmiT8wWYUj6ylMh79YzMQK1fTj9XYbH/406yn34N698ptU1kHMMb
         xyc9HOoaAYfehpOySNgTox+hRN4l3IGqcb9Y/sv6CHycLsE/U7cNa+ZgnKOTic9PsaVP
         KLUJYziyKCEBC93g2qSndatVRvXGtAW/EFzQKOg2LT4QK96mnIsmLUSYmOen+lKysX8M
         dWyS73VTpDOAaX2Cjjruh939GToETZ8F3YDNohFWmlF2SoRSmY4M+NqkrMuZRL38MExw
         XlvhoyOrmSQILuUnxC4MWlpt8yZw0Skd0MIycqpqPhGhmO3jAOP/t2StOfNIabpcPkaD
         VBkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=8zaXYg+sUzoi1UNr67+F/l8Gy4fjxJVV/88AKDfy/2E=;
        b=bRfBcKtPR5Ni3vwdq0U96BfRQxNQAzXTVjPaTOtMlG8fvkse8s0UVYPBEFqA/8iwbS
         coBd/II+5Vf75haEffWoc+FS1SFCfgmBxmAcpqDrhwM+I8+wHLScI9bHivCBQkQOo0b3
         R2taGJN3qcc03NfsEzaz292RC5K+6ggT9NzJXDNw2DuAuCLrtpyvoO6yWlYIod9MxOLL
         HDarmCM4mr3wMJVPwrspeKmA/3ljqNR1QvX5qTOZBySj2l/Vw99Q/z6L1vVKzePOTaFz
         LDJ58jTfuMGjaDm6LPwLFq8/NyKjU9JFgqd9QYCYkRXHsOv12N39bnEAi33CT4blycJl
         Or5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zewmcyj7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d1si2282851ilv.94.2021.03.05.06.39.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Mar 2021 06:39:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zewmcyj7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lIBbk-0006aC-S4
	for alex.bennee@linaro.org; Fri, 05 Mar 2021 09:39:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIBbd-0006Zz-1j
 for qemu-arm@nongnu.org; Fri, 05 Mar 2021 09:39:05 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:39258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIBbb-0002hW-IE
 for qemu-arm@nongnu.org; Fri, 05 Mar 2021 09:39:04 -0500
Received: by mail-ed1-x535.google.com with SMTP id h10so2901708edl.6
 for <qemu-arm@nongnu.org>; Fri, 05 Mar 2021 06:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8zaXYg+sUzoi1UNr67+F/l8Gy4fjxJVV/88AKDfy/2E=;
 b=zewmcyj7CUUEd0M6+Xb3ZP7LWgaNYzrGV6wuj7QIeI9ALCYGS1FeHm1i6JpOkEZDA1
 8iz4gZopDzb7BBin29vOLw219g2OwSTEx2LogYnS0S7oVHpBjE2dV6WN5j6JOpQq1nof
 1lwQi42BG6g8HrjGWHgGxdBGHFnle7Fw/Q9iDjcUl5sSTBlKurBP244gPG3suIYHIdXh
 Ezfs7lTnpUEv2zj5LW8UvQvHug+fiQU4XpoeriDGwOtd1MxTry9qFm4CttEmsOJb1rZn
 LPxQf5BNz26FnGLnj8bRbcDdPTgCXUZyWMmAcT2NLvWPvBO249UoqUZiYZc6w8kerWcB
 gYIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8zaXYg+sUzoi1UNr67+F/l8Gy4fjxJVV/88AKDfy/2E=;
 b=lw/X1td8zQMGlOFPcJhpgtGv/pdYs5rJJmqYK3LqFIuZoW6nDtm+rlSORCnKSFWq9u
 HkU8iISgmh/VabS8TF1XIZM8rs+s/z1Ym4j52KZOxU1BxVyKOq9LU/aSbmkH+LofXR3Z
 FFZBe427w03VkdmxrSIIWRt1So/dILUfQwcIQKQC4dKrsxubNfqAvRFL+rdazcPsrLx0
 mVyulGTxaUXeYQd2rWxtbHmu9qsaNyp4SIsK+v3BX8ekUi+gwzqeoFcV/SUxuXREUnL1
 qwmhlI80+wO5q3HXkqmQFR31RwoDLG+KVKIGow33RY0gEimeS9/zq/l98/PTDP2iSrfG
 2q9g==
X-Gm-Message-State: AOAM531OMjKWiON+hlmV9KKN64T2joiGknHi3Ir+gsK+9EzXxW9Au62l
 611ZC0+G07p0ya4tlY/WmvxKln1mpf9uo7DmQ9wDH2DYiu8=
X-Received: by 2002:a05:6402:17e7:: with SMTP id
 t7mr9275816edy.44.1614955141720; 
 Fri, 05 Mar 2021 06:39:01 -0800 (PST)
MIME-Version: 1.0
References: <20210221222617.2579610-1-f4bug@amsat.org>
In-Reply-To: <20210221222617.2579610-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Mar 2021 14:38:46 +0000
Message-ID: <CAFEAcA9ZJA3hQq65Rg_bxty0_xcgqnErj41mOcfOtkw8uqFc9Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] target/arm: Restrict v7A TCG cpus to TCG accel
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7zt7oQmwm0+9

On Sun, 21 Feb 2021 at 22:26, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> KVM requires the target cpu to be at least ARMv8 architecture.
>
> Restrict the last ARMv7 CPUs (A-profile) to TCG.
>
> Series almost fully reviewed (missing review is trivial code style).
>
> Since v1: Only include patches which don't depends on  previous series
>
> Philippe Mathieu-Daud=C3=A9 (3):
>   target/arm: Restrict v8M IDAU to TCG
>   target/arm/cpu: Update coding style to make checkpatch.pl happy
>   target/arm: Restrict v7A TCG cpus to TCG accel

I've applied patches 1 and 2 to target-arm.next, but patch 3 doesn't
apply (maybe a conflict with something else I've already queued in
target-arm.next). Could you rebase patch 3 once I've sent out/merged the
next arm pullreq and resend, please?

thanks
-- PMM
