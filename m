Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3486111lfy;
        Tue, 25 Aug 2020 07:28:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvy14Yup6EvqodIHDipplGejNjR6r25IUd7x6HYsIQ9wRLu1MuoFNJhRTVxJMaCi4GlyoS
X-Received: by 2002:a25:b8d:: with SMTP id 135mr12957946ybl.481.1598365686278;
        Tue, 25 Aug 2020 07:28:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598365686; cv=none;
        d=google.com; s=arc-20160816;
        b=f1MsX6C6dcKqJQ+nmD5HReyN7tQlS8YoULDPH2oGQbXlFOdvGl86X84D3EXm3uTKYa
         yVLdTwlO0V//1znYWdVKXtihFN3MFpkR68HabwIPX0C3uo6oC6owxBvK9tqwUy7EPxhZ
         NvkP/UgfPZ6keHhK/E9jAC5RDJZzTMGxDoBD35n/Q3gfyFWcAEgFg3thybRkpTdkSNxf
         Ib4h5tsg+OhjYLPsfzZtgz9lDDZN4v1tDJjG73B2+2KyTy4Mj9ZNr/NwUW/0feeKeHtc
         5JLJDEzvh93RC82F08XElVttIuo0yYM9MO2ikISLqbybborUFcIj1EVpzTE0fb4mrq6s
         b23g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RSlLk5173LzdfvNMUnQXkt30g+jXcjnZZ0DWYEE/Je4=;
        b=QRSGxPbmDKZORHiRQL/wWXDVD19TEccB7Q72/qE6CtIvU87Iks1n56iJ/KcmGxC/EO
         v5Dq2p/P7VQF7ym3+dNCmGp5GOKJphBRMp7qQPY3dyWiEy+rvPYUkYZDjC9qm4U8HmTc
         cNmAzlhLuLcfYIYKGs9qQHaMW73KTw+jh4zX31bqKgYzZ6PzIH3cFG5DxwDeEAV5FQBn
         UE7rc3ekdue31ldcFIvrVl4AgeJBTi1KGgKzrCQhUkPSU7+U1tSBHUcWBJIeRIPTwLgX
         cc3MoNhpOY/2uRRtVzfBgSUFf7HkYNNuIhAl5OJe41HanJtPxwJp1YXthrBCOkBtO6xq
         0LkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="NMKQ/xTu";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f5si14359416ybj.412.2020.08.25.07.28.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Aug 2020 07:28:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="NMKQ/xTu";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAZvh-0003DB-J2
	for alex.bennee@linaro.org; Tue, 25 Aug 2020 10:28:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kAZvZ-0003Cw-Gq
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 10:27:57 -0400
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:34437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kAZvX-0004O9-P7
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 10:27:57 -0400
Received: by mail-ej1-x642.google.com with SMTP id d26so6713193ejr.1
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2020 07:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RSlLk5173LzdfvNMUnQXkt30g+jXcjnZZ0DWYEE/Je4=;
 b=NMKQ/xTum4gUKSsGytuZBEN/SHR4ScoxmFVYlXkYXPmenUa4xkeMCZ48PDRgwBFzQ8
 +F71RxFw1Efl1KABtK/yeT2iB/+h/RVToiasOgkpaCWNf2e2CvqfQxY6ms6dq7az2GdX
 4ld5vmuIQZM6JFfqOfCY7bnCsN7xnbDhLI4ZJZcIZ5ZEh2/WCjl0BtsdziD/OtqGZXlN
 4CUuDlA609+zc1R0bGKwhqJM28Poo1TDDpHXogR3o7aExnHJnMTUFcymMQyvxFewnYO8
 ubGfz8tL/TwfD9vk1kxi90qx/nhyLLhOjf6K5nHY97poUy+oFuPd+wm8J64wyCVmiatK
 9SeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RSlLk5173LzdfvNMUnQXkt30g+jXcjnZZ0DWYEE/Je4=;
 b=lUyhIqF7CQ6KGZ6jXcShNP/hwAOWA5iDHTtDeUwHNwWX2mIufZiDIzzxOm2nAJEMGg
 3Rhvm7A2cNsD+pZgF6d59zEI9+UC2iOHGSunPoQ1VoHRTACsgNhDld2+Q+tjBma/iBzM
 rHA47fMOg5l5dH2ug4nxHI6V0bOP/hiu5eZlKlzsY6v8M3aBxTUKfywlenqS6nIWVYxL
 2tGXQmPFManv8IkvNq3xGWGmKNOZCVCyJ2cboBN+8G4s7krHeFVtVOIcGaQaqvzlcd0R
 CKhbxd1lJZKfJei9NT31w+6n3V6auZtzDLu0ehlyEWpSP1EkhRqbjiMk2ic1E0aof17j
 J6Ng==
X-Gm-Message-State: AOAM5331QXq4RmzAQQqD1ZlQJ/JYnmn1mG/BmKGoxI0FYtMDNl3ymTEc
 mQKjTwonMZB1D0A/j6StW74dgkVD5Vw6YZJm5JTGXw==
X-Received: by 2002:a17:906:2b0b:: with SMTP id
 a11mr1205617ejg.250.1598365674050; 
 Tue, 25 Aug 2020 07:27:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200805091640.11134-1-drjones@redhat.com>
 <20200805091640.11134-5-drjones@redhat.com>
In-Reply-To: <20200805091640.11134-5-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Aug 2020 15:27:42 +0100
Message-ID: <CAFEAcA_nUKUYdqWOJHZreOUwi8VZi2j+zMaKbY+0DOm3QGb=8Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] hw/arm/virt: Move kvm pmu setup to
 virt_cpu_post_init
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
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
X-TUID: BwoSEi2A9daV

On Wed, 5 Aug 2020 at 10:16, Andrew Jones <drjones@redhat.com> wrote:
>
> Move the KVM PMU setup part of fdt_add_pmu_nodes() to
> virt_cpu_post_init(), which is a more appropriate location. Now
> fdt_add_pmu_nodes() is also named more appropriately, because it
> no longer does anything but fdt node creation.
>
> No functional change intended.
>
> Signed-off-by: Andrew Jones <drjones@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
