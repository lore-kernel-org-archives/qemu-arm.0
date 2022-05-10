Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp4305169lfj;
        Tue, 10 May 2022 05:26:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhuMD4qOQcuqZcVSAN2en+fF8EpZNeL6CU7rwwpMC3Bzz0ppG3QRXY6PwUI8AZ8+vNoiTR
X-Received: by 2002:a37:a7c1:0:b0:69f:b85f:b2e2 with SMTP id q184-20020a37a7c1000000b0069fb85fb2e2mr14626015qke.251.1652185567135;
        Tue, 10 May 2022 05:26:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652185567; cv=none;
        d=google.com; s=arc-20160816;
        b=uq3mcNM86gXmwhFpVdpYPVTnBqE1qHwLsV7IbYh1oTPgSTSDhUk6tXQVTL5BkNPmRo
         uJj+j08PoGoDv33Udym+BVdc93/pMT4OJeOCSanWPKHSIVLwBNw8XOlyuKosOilVH+EP
         sfMQxLP8YKkfJxJvnItLUc68DXdwEkWFMIb7ZooP5Xh4V2s1tS3RM+aO0eajQTK5T0/x
         w3GHTxgny0WRM9OU9YrvNMaXowQqHjYZdNDunITBY973kEgsIGZHJIiHdTdk5Z42KukW
         dsSirh6L9GS8YuNIgmoRBk7SrcgAAIh7+rvJP9tvsk7Hg+0Rj4V7nds3Tl/ETB684Oco
         VW3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=5OfL9fo80UfutDJ+0HQ+RALohbyp2jbzVcIE45PfgKU=;
        b=JOiwaOV8eDUpUbq1nJ4Qrk5DJ64dmXd6VQ+Ya84ZT4IPVc9Wx2K+WqNj6ojkWeHQBl
         1gF+FinjTKzNIrrJCWgWDsVvLgH8MsOsaQLWU1xQKk3bf2sdtKN2sx7XNyG0ajoelpUX
         PbI6OJryw6nOs87TmeM0qHYsGapwSHEFBKvb79XszjNb96DHzBIAXTyDi6yA3OxpsBGi
         UsA6wwQbmviXbDwFPZiFvrmg1+1L/YlmlEjh1WpTDqTLwg3hxGz0xQdY77l0C/NiYsYP
         rD6g21+FJc8DGoyV5ZIuwunOkhq3AZmI7SDHiX19gky6Zhujy2ZKlASaQg4G22CHyEk0
         zkLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n1SZU0U2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o83-20020a37a556000000b0069fd3adb4dcsi8543526qke.169.2022.05.10.05.26.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 May 2022 05:26:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n1SZU0U2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1noOwI-0004vM-LE
	for alex.bennee@linaro.org; Tue, 10 May 2022 08:26:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1noOvp-0004sS-6A
 for qemu-arm@nongnu.org; Tue, 10 May 2022 08:25:37 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:43647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1noOvm-00073Q-5f
 for qemu-arm@nongnu.org; Tue, 10 May 2022 08:25:36 -0400
Received: by mail-yb1-xb33.google.com with SMTP id g28so30337642ybj.10
 for <qemu-arm@nongnu.org>; Tue, 10 May 2022 05:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5OfL9fo80UfutDJ+0HQ+RALohbyp2jbzVcIE45PfgKU=;
 b=n1SZU0U2Hj4naumZm9HIo0Ea0jW7VFWsvZXL2vNgCe6CMmwkg08D/VMsG7dj22bYi+
 fFQhztBuONEF6AByZaor9i+raogpcCWAk9nh3ICCdi8GyVmrF8IBcLp7jzpLeYQ6qD05
 4PicRWRf9ukf9pKzvUgAZ7GIFzjfeg4/PL7Pfg8uRLtXeBjBpw4NKi3pKMBQ7eztKIEA
 C1Lghy9L36rKdPyV+QI5d0eXY0U4ZT8oWlmv1ogzerghNBTgxFyDrYGAQ+2qQVh9DINN
 Nb5uqiWd/pzAgKCZgQZ8lAdvIdXkokflObzfV/kwbG4sWAbEMaZp3TsgkTiIY6oav+Fe
 Gecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5OfL9fo80UfutDJ+0HQ+RALohbyp2jbzVcIE45PfgKU=;
 b=MU+CFpTQrGCVdQZlVoN9/L3dOum9spl1+Ozb1Ql6QVh/yk3hQNz5FHKT0Y7ginNDYf
 SiiepjXzK9FHkhdM9KjZ01gvWPiklFFKTgH0og5Irz2AKS1R1dmFMTTHJYIRXyT05YFb
 kpIJdh7F88bbYb7Mp/OUZrZXeepUGGuHjpYIGmxTT9gZllY7RArbyGA0tXhB/3jotELW
 06lycF52/83fURYqrD7cYlLMR2NlivgXFy4CQ3+OGm6yCEhx80NNlad683CHmZ1yPRYi
 8ZBOjJhi3OfvmvY3vfwUdPs9xGICjqD7FX8X7zabSpvcXSkGU0/BAxf199l/KUm8/YXG
 i82w==
X-Gm-Message-State: AOAM533iWWD5+Ny7upGfDMWOqVs0o0nKcAVXn6qxsKoeEudqX8EYMJde
 i4o/0fPF7wbwsdHfX2aRciv/xaRY1Mpl+M7fxa8XVA==
X-Received: by 2002:a25:6f85:0:b0:64a:8b67:d3b2 with SMTP id
 k127-20020a256f85000000b0064a8b67d3b2mr16100180ybc.85.1652185533241; Tue, 10
 May 2022 05:25:33 -0700 (PDT)
MIME-Version: 1.0
References: <87sfpqaey7.fsf@linux.ibm.com>
 <2ab9e2b3-5dba-4e18-ed2e-6063a2716f4c@ilande.co.uk>
 <87ilql9xww.fsf@linux.ibm.com>
 <ef8256fb-6e99-5f37-d5c5-67f9af4302b0@ilande.co.uk>
 <472e45e8-319b-ad48-3afa-0dfa74e6ad20@redhat.com>
 <877d6tzs2e.fsf@pond.sub.org>
 <32e5877d-ba45-ac63-d24e-1f9f8676c6bb@redhat.com>
 <CAFEAcA8Ff45KeuQm-v8MwXX_i+P51uF-ovpQvtGD3hx1bi3A9g@mail.gmail.com>
 <Ynou3EnxfSmrzGT0@work-vm> <d1b04636-b1db-d13e-36b3-d45fb8cf9ad0@redhat.com>
 <20220510122056.l6deselsfipofnct@sirius.home.kraxel.org>
In-Reply-To: <20220510122056.l6deselsfipofnct@sirius.home.kraxel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 May 2022 13:25:21 +0100
Message-ID: <CAFEAcA9FLSZzmMuvuUikq+2tPTQJhbqHzL125One2_DVpCjUvA@mail.gmail.com>
Subject: Re: QEMU 32-bit vs. 64-bit binaries
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm <qemu-arm@nongnu.org>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fabiano Rosas <farosas@linux.ibm.com>, 
 muriloo@linux.ibm.com, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, mopsfelder@gmail.com,
 qemu-ppc@nongnu.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 qemu-RISC-V <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +zPylctf7pJU

On Tue, 10 May 2022 at 13:21, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > I'm not very familiar with KVM on ARM - but is it possible to use KVM there
> > with an arbitrary machine? If that's the case, a user might want to use KVM
> > on their 64-bit host to run a 32-bit guest machine, and then you need to
> > keep the 32-bit machines in the -aarch64 binary.
>
> 32-bit guest is 'qemu-system-aarch64 -machine virt -cpu host,aarch64=off'
> (and a aarch64 CPU which actually supports the armv7 instructions).

It's still armv8 even when it's 32-bit :-) The requirement is AArch32
support at EL1. (Some hardware has AArch32 support at EL0 only,
ie userspace but not kernel, which obviously isn't enough for 32-bit
KVM guests.)

-- PMM
