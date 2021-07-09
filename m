Received: by 2002:ac2:5fca:0:0:0:0:0 with SMTP id q10csp833714lfg;
        Fri, 9 Jul 2021 09:06:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfzuI6zd21CMTRDB1ArD10EKUiF1B561WFoVG3+bzFwO/R0ODjBvP1HEUgSz3AZf176PmH
X-Received: by 2002:a5d:4564:: with SMTP id a4mr43947116wrc.409.1625846791936;
        Fri, 09 Jul 2021 09:06:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625846791; cv=none;
        d=google.com; s=arc-20160816;
        b=xALqtbp4B6nistgJeImubQLDjCVYv8j1LjMRpvjzXN3ovdTVFr/cqIGDMGOumMEcQK
         ffejLFqDFPJ8klChhoQed8xBYWk71CRqEyirXqItgjhLYjZo4ge6R5D++Arfm3opcANs
         /8BtM8CXjviJo6mldN1bbAm8QdtpgrqxAiXgVxlpfJH6gbA4tGhHXIZwrdEnqDpwr4ed
         zwc/wzOUaqahXZ2aSowZX71t7DpIHlNRxVqpO9vdRqihj8bPjKxUFkwhkgPnjRtAizkA
         YN+zTIdBBARhFK0woNJhwEWCNfLPjFk62SWuODDNBoPDr4IfoilJYQzYd0Ovy1QhYzVB
         VWcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=EfT2SJUWjhkS8bxd3FqIF9SBpf7PDgkYON/s9oEhEHo=;
        b=QMbQ27t+sHs6qMsfMyqLMfzD1Tt2YCP7f+p9UvP3AF98PAourLgQqfinXW6+E3qmV6
         r3Bhnxru/g2TUpTYkG+i8dvEWPInJ57LKkFvHWcdZlVghY7JHkgNkh5T8kZ2m3WePFnR
         FwhPsiB51BOVfPTad1EybOchtzXs+KOHOfUjmwqy9+AIMu3M/LTMWRFo58FiFIvChX1I
         hwzc4N5aenLYkcjJOaaFzywLFWzTCMA+9uhqhiOsh9AjVLgJZzMDzV9BoacAAC16gLZ3
         MrWQDrf9C9ajD49H9WnQjNMnQqh4kxA8GwcXV42tBft1u4hVYcgGE3T8S/2muzJX3KWI
         EVPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sWre3QUx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a8si7487482ejx.571.2021.07.09.09.06.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Jul 2021 09:06:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sWre3QUx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m1t1K-0001ZB-W5
	for alex.bennee@linaro.org; Fri, 09 Jul 2021 12:06:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1sw9-0007do-JO
 for qemu-arm@nongnu.org; Fri, 09 Jul 2021 12:01:09 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:34798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1sw6-0005Je-RC
 for qemu-arm@nongnu.org; Fri, 09 Jul 2021 12:01:09 -0400
Received: by mail-ed1-x52b.google.com with SMTP id l2so14562501edt.1
 for <qemu-arm@nongnu.org>; Fri, 09 Jul 2021 09:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EfT2SJUWjhkS8bxd3FqIF9SBpf7PDgkYON/s9oEhEHo=;
 b=sWre3QUx4JnKEIfxhlzGXx6lt/1ZRxPfTtEg78FHIK2/6oBw57Mo2vt1ZXTFEM4puS
 5wigvOaVraQp3/aBcuhd/OidRNdnHRN3qwiGq/EgGXDDbvfZOHigI5n6yv8xwEysABfD
 EYWA7crFTGODUZRuLytjBluNzl3NcDN92GDyf98/oghicHK0fF8v1JsYrWOvWohPIWWX
 gImgbonZ+U/mDS5EY9QwR4XRWjnbzvpze4ZtaphSaH4mxbqPoEBX7fKSX7abWXjnMyYY
 34Px9vSetfa59eirQuAht2cMWzswpvzVUSzINoHtJY2idgWQfBPxbdnmew3kwVv1ebrp
 g0yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EfT2SJUWjhkS8bxd3FqIF9SBpf7PDgkYON/s9oEhEHo=;
 b=FsL/bA7IBU/9MrDs5mZIv0TDAQ3Pd2U9vKj8D7l+V9WpOyh/+rqJ6Gcs0I0FckyThL
 9Upezmicz7QbntKqwisjmyGMYATnnnm63fVn9hRD4z52zEimBelxyxxTdlV39BJpI+6X
 E6B/AvqB9vQwXLQHTiQYA0JUL6OD+hYA/dkGcZ5gfyTsgnH9LwDI3/thODIgaMoC/Lpj
 UPKWTb1rfktBVCM4qM2Fwe+GH6HQ0RlA+1dEJCODr/D0K81+jfc8eA6HcBO04nY1vSsx
 8XiZ2XBZPsnAwYSyHVUZHQ8469xVlWwXSAVZ5tu2fo6KGB6x5DVg3nnZ6y7iDxouPhx9
 2fsQ==
X-Gm-Message-State: AOAM531YIHAoKPFMsOCKC+Wzh4LDmalu73DzRCdIOHzJPnhsLOEWsnBe
 LxRbBqoSNX+S/sz/ZAz/yUi0lKFrPy1hnSpB9EtfYQ==
X-Received: by 2002:a05:6402:1e8e:: with SMTP id
 f14mr34679771edf.52.1625846464589; 
 Fri, 09 Jul 2021 09:01:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210708145514.1751773-1-f4bug@amsat.org>
 <CAFEAcA_ukc+t_BYddOSv7EF6O1qoVHGGj6sA5uumUgt0VMS_pA@mail.gmail.com>
In-Reply-To: <CAFEAcA_ukc+t_BYddOSv7EF6O1qoVHGGj6sA5uumUgt0VMS_pA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 9 Jul 2021 17:00:25 +0100
Message-ID: <CAFEAcA8PLvMUEzyu=sN4bn4mU30w1aajU+T+i__5jnB0QMZnqg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] hw/arm/raspi: Remove deprecated raspi2/raspi3
 aliases
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mISrx5x5zGEp

On Fri, 9 Jul 2021 at 16:33, Peter Maydell <peter.maydell@linaro.org> wrote=
:
>
> On Thu, 8 Jul 2021 at 15:55, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
> >
> > Since v1:
> > - renamed tests (Peter)
> >
> > Philippe Mathieu-Daud=C3=A9 (2):
> >   tests: Remove uses of deprecated raspi2/raspi3 machine names
> >   hw/arm/raspi: Remove deprecated raspi2/raspi3 aliases
>
>
>
> Applied to target-arm.next, thanks.

I found that this seems to break 'make check':

 (09/52) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_r=
aspi2_initrd:
ERROR: Could not perform graceful shutdown (40.38 s)

Dropped from target-arm.next.

thanks
-- PMM
