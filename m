Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp1122882njc;
        Fri, 15 Nov 2024 09:21:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUr0q4Lsqcbo6bl4kX5YKyHok01175ZlnBOI+t7cUgZRWX5J/Hd/jDdq8S1nbNi6uffeVgL+UZQd1ju0w==@linaro.org
X-Google-Smtp-Source: AGHT+IHSuyDrHLs5ttduoAUX0dtn0pcTVUYfyN54kZ04snZ2WvScpcjmAQi47IUpQlW5CElZDIjt
X-Received: by 2002:a05:620a:24cb:b0:7af:cf3b:e95f with SMTP id af79cd13be357-7b3620206e5mr631055985a.30.1731691302323;
        Fri, 15 Nov 2024 09:21:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731691302; cv=none;
        d=google.com; s=arc-20240605;
        b=EvlysiklAqiartXGDCnVwCjEbYeodH4AmifEVgDcbU/EaMqlK/kda4jqvsP720fjvp
         679H+HRYALB7USuRXSwwAHKCLiUx8pjeBw5shQTZs/w+FUGT1H/zgkvNH3rgUcYvy+7F
         s1wl05l/OQ1NTC/Mhu1SyK8kNvX2qOpklaL3QQlj+1Liuw5JBtH0OOI665p7H3kON8SO
         TLfYWugmrAGC4olPv0zrE+nOENt4XivOuAE2JXLcGa1tgnGOJDGrM6HBDBK8IhXMnD3i
         VhfkMFTq52vvU25eXEI8Pau/4vvqrKp3q/GgvzWsUdbVYp9Wu0/tpNdKcK+HvbEb8bGN
         kwew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=LiWvHahej0WBsUn+pdMeCYQV8JXwtBnAYjBTpPrxFug=;
        fh=LP+/Bghh5F95soym7xL5jYZkqbF1zSuju1LQEgEpZ9g=;
        b=Nxv1t08abc9O3R11nnzr2+PNnYzXxiK//1YBlZycJplzMr+6j76ziyc6mpi/v/R9yO
         hGliwmGRHRMPJVQfsTzbeL+W6WCa5l0Cv40++54lepl7zhpFXjp4DThDyJA3bUUNZxJu
         6Jff4/S+Stikj6PVTVpRUO4Xzwm6Ga+KQkD7QvtWASWYNrJHrQS8jf7ZQSc1trzcGz2w
         +fFTBxeXbScPqI+R0JFXOMusgI7DXwl31/VMs+eK362+6ZW7MVoRoFN6/uOfw0Hb3yR6
         hk2VGzcgTj5eLND+uCXqTQhuRNH6kQWFywG+6tk9GX91CCElV3cTWHe3ZwjOitKqUAzg
         ABIw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=fAWrsCE2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b35cb070e4si386907285a.694.2024.11.15.09.21.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Nov 2024 09:21:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=fAWrsCE2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tC00f-0002Hg-UE; Fri, 15 Nov 2024 12:21:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <roqueh@google.com>) id 1tC00f-0002HR-2y
 for qemu-arm@nongnu.org; Fri, 15 Nov 2024 12:21:29 -0500
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <roqueh@google.com>) id 1tC00d-0000yU-Do
 for qemu-arm@nongnu.org; Fri, 15 Nov 2024 12:21:28 -0500
Received: by mail-qk1-x72e.google.com with SMTP id
 af79cd13be357-7b18da94ba9so172678585a.0
 for <qemu-arm@nongnu.org>; Fri, 15 Nov 2024 09:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1731691286; x=1732296086; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LiWvHahej0WBsUn+pdMeCYQV8JXwtBnAYjBTpPrxFug=;
 b=fAWrsCE2CyIuVhOfMZFBy76renILKvWZaS1caM7L9oKnPTiGZhhlHLrybDlhf1WlEC
 71ckomag81xRfKX84IJr21xw3vvvsMkWL65sypntI2rKryqGEAjG1eJj7TYsTQQNanzq
 MUsUOqP/CTfZwC6mCSpzfslBTkMLuStRG2poa4uyzUgXEa+COmK0fXAnQVv+ms1YdqoW
 a1JJ19xI8kPl08/A5cqeCBPTcaUOmGHsRdMlQWk1PI8/yJ5CP6j4VCtNSKixh5nBVvw8
 A9bq1ycg+mg6oEKihj/1WseAAfeVL+WDUWych0GEStwqo3PUY8Ato8zp9SOrH2il/YP3
 iOmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731691286; x=1732296086;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LiWvHahej0WBsUn+pdMeCYQV8JXwtBnAYjBTpPrxFug=;
 b=TTIUckEbkB4YpdlhYuIOt7wu9ctpNuvYqsl7Uzlg6fOP4Fff1cs7vH0pD04RP8bDq2
 QA+QpuceAGk8+iAmKYPLTkXj31iVZIJOpu3HGxVPZZZ4/SeXcTtvwV6yq7x50lODlx2Z
 b0aRI4N6FPyRP80OoRzLtslllg5nOWW7zNDmtIVwJdMgpPkAL/kDx6iHBgGh9H8JzioS
 qik97n+oc3DwA9v7rKmU9w+rBwuci3yzB3jI4tKsiw4KE3JErlzNIK8rV3uuIe2CzVdg
 7WmLAELkeGpXav2DiSZxTMl/48PBKWz7LBnqAtq6P2kbMFl/QNSioHDcRtmAxAvq2E93
 F7XQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1aol5js6Ho9TtRelxdrB0ZdDv3LozDtTJmTtxTmt1Sa9f9apXsiVpbEfktFTFz2b99XjmMvt+Fg==@nongnu.org
X-Gm-Message-State: AOJu0YzNjFaPiHEZqMjLAl++vvbibX1BuCPMkSn5LCAGfPmqMP3267+c
 mkb0getF+XWHQHQkveS/+2DqNwPFWiFNoR4ONYz5/qM0Ynpo3DEg+mQ5+rg1EOYr5i6+XdZgzwm
 5igtLYu7e9mLH+DsJVPVmff07tWh659mUN86V
X-Received: by 2002:a05:620a:19a9:b0:7ac:9b07:dbd3 with SMTP id
 af79cd13be357-7b35a464ec7mr1232809685a.5.1731691285926; Fri, 15 Nov 2024
 09:21:25 -0800 (PST)
MIME-Version: 1.0
References: <20241115160328.1650269-1-roqueh@google.com>
In-Reply-To: <20241115160328.1650269-1-roqueh@google.com>
From: Roque Arcudia Hernandez <roqueh@google.com>
Date: Fri, 15 Nov 2024 09:21:14 -0800
Message-ID: <CAKbPEtafvSf1ACPRQj2-eEGS_Son53rmyqZ_8vH8gx-uK4o78g@mail.gmail.com>
Subject: Re: [PATCH 0/5] Make WDOGCONTROL.INTEN the counter enable of the
 CMSDK APB Watchdog
To: peter.maydell@linaro.org, farosas@suse.de, lvivier@redhat.com, 
 slongfield@google.com, komlodi@google.com, pbonzini@redhat.com, 
 venture@google.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=roqueh@google.com; helo=mail-qk1-x72e.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: F/OyoNQ3fFxo

Hello,

I forgot to add the -v 2 to this patch series. This is the second
version after Peter's feedback. Shall I resend it again or is it fine
like this?

Thanks

Roque

On Fri, Nov 15, 2024 at 8:03=E2=80=AFAM Roque Arcudia Hernandez
<roqueh@google.com> wrote:
>
> The following patchset tries to address an issue where the watchdog
> counter was running as soon as the device is out of reset. This
> created a few problems with the firmware under test. It was pointed
> out that the firmware under test was already working on an emulator
> using the real RTL. Further review showed that the WDOGCONTROL.INTEN
> is also expected to be the counter enable as it is defined in this
> page from ARM:
>
> https://developer.arm.com/documentation/ddi0479/d/apb-components/apb-watc=
hdog/programmers-model?lang=3Den
>
>      |       | Enable the interrupt event, WDOGINT. Set to 1 to
>      |       | enable the counter and the interrupt, or to 0 to
>  [0] | INTEN | disable the counter and interrupt. Reloads the
>      |       | counter from the value in WDOGLOAD when the interrupt
>      |       | is enabled, after previously being disabled.
>
> The second half of the patch is focused on adding tests for this
> behavior. It was required to modify the test to be able to run some
> test cases in the MPS2 since the the stellaris machine had 2 issues:
>
>   - The stellaris machine did not run the counter out of reset
>     because of the way it is reset. The function
>     ssys_calculate_system_clock is not called until the reset phase
>     stellaris_sys_reset_hold which is after the watchdog executes its
>     reset, so the watchdog would not start the counter due to the
>     clock not being set up at the time of reset.
>
>   - The Stellaris machine uses a derived watchdog and not the
>     original CMSDK one which has a special behavior where it cannot
>     be stopped.
>
> The MPS2 machine on the other hand uses the standard CMSDK watchdog
> and could expose the problems we were dealing with.
>
> Roque Arcudia Hernandez (5):
>   hw/watchdog/cmsdk_apb_watchdog: Fix broken link
>   hw/watchdog/cmsdk_apb_watchdog: Fix INTEN issues
>   tests/qtest/cmsdk-apb-watchdog-test: Parameterize tests
>   tests/qtest/cmsdk-apb-watchdog-test: Don't abort on assertion failure
>   tests/qtest/cmsdk-apb-watchdog-test: Test INTEN as counter enable
>
>  hw/watchdog/cmsdk-apb-watchdog.c      |  38 ++-
>  tests/qtest/cmsdk-apb-watchdog-test.c | 328 +++++++++++++++++++++++---
>  tests/qtest/meson.build               |   3 +-
>  3 files changed, 329 insertions(+), 40 deletions(-)
>
> --
> 2.47.0.338.g60cca15819-goog
>
