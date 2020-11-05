Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp317615lfb;
        Thu, 5 Nov 2020 02:51:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwIH8bbLKvyCp6Eqt6LNrSlsUUw34hyt7KciqYSUO7Q0ZLuFFNN+nAoYUAxWo2fWJbhnYxm
X-Received: by 2002:a25:c083:: with SMTP id c125mr2393840ybf.519.1604573464009;
        Thu, 05 Nov 2020 02:51:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604573464; cv=none;
        d=google.com; s=arc-20160816;
        b=wD5WVg6G7PldQc2Ny07kd4s/s8j9CshIW3RfDtNzdsiuaKw039n9LKc0zwF56kiky4
         qjnLsOqG2Uh8tAe4VT+8WIVviRTg7kERybD7m2229yrlvHmkpsCaVevZdk1ELpEiR2F1
         DOy6th06KlchIgfyMJS3czTmoqk2RV9E7YyxChqgyD4PQJ3Co+jJlCqFiVc2oCUJeD6Y
         ZiSQ2BK1mdQMIAPJjUzkGtInxDvcmZEvaNh72AXqp8eK7KqiW/6A4Q/QNfFrttpQGJpN
         SWWWyjtuWrhW4vwnHDJXSG48nYxPIyPd4nYyd+bSbFciztsQFmV8oPzmg/xxjhVfF5Ra
         wm5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jidUG1TIwHLkgOI5v4Opg1/zfgLn3xKiRUJad+V5ByU=;
        b=GgmDjiOtKOoYy4BPGaGzeHVVn1Dx1nx4d2uBPs9KPpDScfj2X7/GC+ivxk9GDOkGPV
         f3wtsc5DqqHVQMdIcWSRp+KfzOEgDADmODjWtEZnn+qV1WQte7cIXDXFBpaRxSRkGa+8
         /45UUIw8VpwIHFtH+UEaHok8uGvdK3prn2krG2rTFKmVkolhnmH2+nX/kOzSpKto9v05
         +PbFQfJz9c6NX2GYVk7gnNSpWhesXzqAwULp6OF1HtFD8oj3IfvE/c3sKzVgDBVekD0R
         n85EXK9Sa9BAiqqAKENA9OVQ6l2iTgmwYF95dCq4yYvv+mFV51nJ9CeRQ3bem7CEYitj
         p+lw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kTgA12BC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g1si227012ybo.466.2020.11.05.02.51.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Nov 2020 02:51:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kTgA12BC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kacr9-0003MV-CZ
	for alex.bennee@linaro.org; Thu, 05 Nov 2020 05:51:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kacqm-0003Lk-HO
 for qemu-devel@nongnu.org; Thu, 05 Nov 2020 05:50:40 -0500
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:40316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kacqj-0003Q3-Mr
 for qemu-devel@nongnu.org; Thu, 05 Nov 2020 05:50:40 -0500
Received: by mail-ed1-x541.google.com with SMTP id p93so1024599edd.7
 for <qemu-devel@nongnu.org>; Thu, 05 Nov 2020 02:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jidUG1TIwHLkgOI5v4Opg1/zfgLn3xKiRUJad+V5ByU=;
 b=kTgA12BCbqqLg4l3Z3hYoxOlUUDuAT4D1xw5YupHai15X1UbCDhkzn5JokQQ76ARzs
 /PXREkKp2pZ55o2WO8/KDWlTKTjI1eemgpmvK4e0k1mt6yRwOUuOrKTWdCpwRO32athg
 m20dd63VFd6gr25NuNxMJ8dUaowWoc6+6x8RLLufz8ylpVCun5N6hPg+1qZhWJZIoaZs
 xvqjx8aStirobB4HRncAHYVykmlGiVDdXVO6ozjrQLAjCuUHOGxWMmqpGnakGqw/SGtR
 /p8n9/BQ2n4a7P4qgYk5IS/I21k3eNzu3GMDHGgbFIoUiz0eS1Lyco3L22IhC5cLEUhy
 8v4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jidUG1TIwHLkgOI5v4Opg1/zfgLn3xKiRUJad+V5ByU=;
 b=NKmhEeLFKMDkjYq/NmbJeHHs9zT8DNtfgrsJ9atvOu2B4vqU+HB5lYADWJa8/8PKya
 6et75YRhBkyLKuYHcVnD/J0QMqcOnifZCy8J6AiGlDYJt8Q/NapMHrNGsu8vRBd5C2c3
 fcYrgK4ZImZrxcXPbyXImR/9DO4iH0p5zi//oPydrAujvdaFtUv/agrdZVWtjjOrgSL/
 I9xi4TpoJmhFj8ml0zFkaTA8R2hxdfyrd2JRvnjVEY/+N/jzCVNbdZen3yOdwe0ur3n7
 6ROGRHL8JHCTtrLQAbcGQW2lTVzc3TgSJCNjPAvQ/isPwdDg8k13yIeLgA+AxwgbLACf
 YTnw==
X-Gm-Message-State: AOAM530f1j8YJIGiGWoOiFrHJW8lUdpoQflcDCwHrBu37IpiUNZtogHV
 epeIGrpO5d1/qZdKnOe7M7VsL05/dwSp57s/+De2+g==
X-Received: by 2002:a50:fa92:: with SMTP id w18mr1828296edr.44.1604573430322; 
 Thu, 05 Nov 2020 02:50:30 -0800 (PST)
MIME-Version: 1.0
References: <20201028085918.14580-1-maxim.uvarov@linaro.org>
 <CAFEAcA8_1w=4qdE_AJxUP-uPoFL=Fsg9hy62Lw7bLDjKzL9Vvg@mail.gmail.com>
 <20201029111939.GI1664@vanye> <20201102135327.wgltgvk2olqvamyp@xora-monster>
 <CAD8XO3Z9eKVrxu=B9rbKSzZgTXwiBOo81cr3L28=z5hQFx+_Rw@mail.gmail.com>
In-Reply-To: <CAD8XO3Z9eKVrxu=B9rbKSzZgTXwiBOo81cr3L28=z5hQFx+_Rw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Nov 2020 10:50:19 +0000
Message-ID: <CAFEAcA_SfG1QzVFQ3N4_XpkZ7W2HHvGadoa8pSu1+pgq4sW_EQ@mail.gmail.com>
Subject: Re: [RFC PATCH] hw/arm/virt: use sbsa-ec for reboot and poweroff in
 secure mode
To: Maxim Uvarov <maxim.uvarov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Graeme Gregory <graeme@nuviainc.com>,
 =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 tf-a@lists.trustedfirmware.org, qemu-arm <qemu-arm@nongnu.org>,
 ard.biesheuvel@arm.com, Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uXX9oWS63yQH

On Thu, 5 Nov 2020 at 07:48, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
> Thanks. Is there anything I need to do with this RFC patch or it can
> be accepted as is?

It sounds to me like the input from the sbsa-ref maintainers
is that they plan to do a lot with sbsa-ec that we would
not work in virt. So it would be better to take the
"add a secure pl061 whose pins are wired up to reset/shutdown"
approach instead.

thanks
-- PMM
