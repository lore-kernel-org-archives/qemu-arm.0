Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp1062038njc;
        Fri, 15 Nov 2024 07:53:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWiViIvA4+S5Jb3gPoSOVdXy++9LNFHOjio69r/tZl8UJatKlsJ1MSaPUsbHXVwBRBtXQDcHFui6VandA==@linaro.org
X-Google-Smtp-Source: AGHT+IHg+8mweixmFgjj6h2j1mtMDoGzvUPesSn2nqhZsD8z6IaopqM5AVbnn8nRxizqN4hWglER
X-Received: by 2002:a05:620a:191b:b0:7a1:dcc6:fbc2 with SMTP id af79cd13be357-7b3622b6bc6mr406813885a.24.1731686017697;
        Fri, 15 Nov 2024 07:53:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731686017; cv=none;
        d=google.com; s=arc-20240605;
        b=clRUMYdp8qLadeAehrdTMlUMEklUc7ndnAy0j5mQHSMBhBuEH3gqGrlDiX7xflL16g
         ejsXDE384MXo9plZiElVN9ORxeS+Zf3GNUWecianEDk7+CvYPfQKI8vBMcfNP9RtvNM+
         G5UnUQxdxWpce8H7HuY5GLpgl9N4TvvL1cZGH1twH1kFKswqYm06db3VV8j6QScEX0A8
         rLWpcYXo2mOlwOM1XdOsMAY9SkenRTxhJ+WIGia0IATeGVSMm/z4WAtpXQj3ws9SVcjY
         G73bD/4o0laX3D5OGFB7qfiUA6iRMB2wOuqJrQL8WnUgcl/4+lhSbWP/YVhuoNnHCy3a
         8ziw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=0VA/50loi5NjMTMFGo2HwYtM5oSTSYJOri70PVWBGp4=;
        fh=cIfkY6i3FCYzhJF22XpqyDS83l5RbLjjhznG+/4tAGw=;
        b=VVKzI7f0+Ffsuf53XUIxSBcVDQm88y0YtYC0kSJQi4AsYVdjrgrjdUXexDcgPp8+9A
         z7i/8TciLa9gHjAQlZToHpLsTdxfJb/zLDptCDUTrXYEY3ywtutPm2VNIE/Vo5uZsb+k
         uprubKAXtqEgnZm0QHU3HwHzx5o5pzI0nKGloJLH2cYtk4FTCafWMj27FNYSFbEsrAA0
         2YGaqnfmajAQM2utR4d1io8pPDvifBvNOB64qZFnDB3X6qh2ArbiaEaxw3WrwAXO1B7G
         4K39JlR5zNw5vjlWhU7n8uKSUKmsfYU7XdrRalPWb6jjzGfiDfIZGht/AW9AXKMUBh5J
         OKSw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=G7nyEzJ3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b35ca63044si394410985a.396.2024.11.15.07.53.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Nov 2024 07:53:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=G7nyEzJ3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tBydK-0000j1-8q; Fri, 15 Nov 2024 10:53:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <roqueh@google.com>) id 1tBydI-0000id-1J
 for qemu-arm@nongnu.org; Fri, 15 Nov 2024 10:53:16 -0500
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <roqueh@google.com>) id 1tBydG-0001zH-GS
 for qemu-arm@nongnu.org; Fri, 15 Nov 2024 10:53:15 -0500
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-7180cc146d8so991037a34.0
 for <qemu-arm@nongnu.org>; Fri, 15 Nov 2024 07:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1731685993; x=1732290793; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0VA/50loi5NjMTMFGo2HwYtM5oSTSYJOri70PVWBGp4=;
 b=G7nyEzJ31JGR64iw5PY5qnUrOpqHxW4Y/8KTR2kWEXXwRLx3m6ZbwP2pDuZF276dAW
 s9bGpUcuQj3ertOvhzwpZzYgrultdiVf2MV7YwURLFXKDfHczwlkRHFuBKryV6lj5NAK
 U8Bmc0Ur3ucK3ouKHpMak/4Fkq4o6VkGyOni+lH9p19WYVW1u8Y9m7Qu5M7A+LULOhdC
 kIAnGJvgoHTvfSZiRJUstULIeWM5/OCeYseNbOWcPVl2xD3N8ckXflI3H9ObGGMRH1NZ
 SxJwIM4lWwNPmMiSfwDRxZOQeae8MPf5TSQsLtonhJGMDCOsQ9BMF92opCesc0+YlQZD
 IdHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731685993; x=1732290793;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0VA/50loi5NjMTMFGo2HwYtM5oSTSYJOri70PVWBGp4=;
 b=SCZDDkNBD77LGPUg1hwwMMBFP8iDs68f4vt7djT6SPdagbf6aMmann2Q4sIgnoxU9o
 5bD3bUS6g9zDdsudbunK18umoHFWiO6fq3FQhvm7/8ba6hOfzS7beNAmVndRWBWu+eFO
 fncUb8ye9Q5UxHqKByolb6PteUFqoWZNOOlAgkzyIj0OkGW9m3qMq9Xu7i96315k7lLr
 jxT0Bl72qbp0MYKpKUJPw5NYnoKTruzXNQs+I6NFzf8Q4H6yy91PWSgfmMIJ3l2CrL4T
 j1bgQfXe2jIuaUx2mKG8zVGdaJbbvJx7/CAnHS8ELlXM9Lzph7wSvd7dtUZpfARrjd+B
 v5rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhnHAlVm87bIP4lcPdnM49REg5+sZ9HBG5fZ49DUm0dQrCC12p9CF/+kBmCHsDdn/jhaCYZs84Tg==@nongnu.org
X-Gm-Message-State: AOJu0YwS3/YOIUaa8xads2R9oL6fS3bQVc7mrMI9dy2dEP/LXBXiRYgm
 aNdE5iksU4aU7XFA6Nq7Llu59ulxgdKRGW5mwUnL/j8KAWH3BYnpY0MhUfkyMUzh0S6C0UwwjfY
 lqsugqovOk0szqXiPdcE0NnYxijfMflU6VBME
X-Received: by 2002:a05:6830:600b:b0:715:3f20:bd47 with SMTP id
 46e09a7af769-71a778f800fmr3752797a34.6.1731685993126; Fri, 15 Nov 2024
 07:53:13 -0800 (PST)
MIME-Version: 1.0
References: <20241108191024.2931097-1-roqueh@google.com>
 <20241108191024.2931097-3-roqueh@google.com>
 <CAFEAcA8W2nfhmB8o3ECMwkj3_v7e0bz=Qxs=LCEui4LdBVHQNQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8W2nfhmB8o3ECMwkj3_v7e0bz=Qxs=LCEui4LdBVHQNQ@mail.gmail.com>
From: Roque Arcudia Hernandez <roqueh@google.com>
Date: Fri, 15 Nov 2024 07:53:01 -0800
Message-ID: <CAKbPEtZdiOKC1B5RQiPJuOmkFUkE6cWxerhA7TQ9tTEtrqATng@mail.gmail.com>
Subject: Re: [PATCH 2/3] tests/qtest/cmsdk-apb-watchdog-test: Parameterize
 tests
To: Peter Maydell <peter.maydell@linaro.org>
Cc: farosas@suse.de, lvivier@redhat.com, slongfield@google.com, 
 komlodi@google.com, pbonzini@redhat.com, venture@google.com, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=roqueh@google.com; helo=mail-ot1-x330.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: cmaHQ6AAHzh/

I'll edit the g_test_set_nonfatal_assertions in a separate patch
explaining the reasoning behind it in version 2.

On Thu, Nov 14, 2024 at 4:55=E2=80=AFAM Peter Maydell <peter.maydell@linaro=
.org> wrote:
>
> On Fri, 8 Nov 2024 at 19:10, Roque Arcudia Hernandez <roqueh@google.com> =
wrote:
> >
> > Currently the CMSDK APB watchdog tests target an specialized version
> > of the device (luminaris using the lm3s811evb machine) that prevents
> > the development of tests for the more generic device documented in:
> >
> > https://developer.arm.com/documentation/ddi0479/d/apb-components/apb-wa=
tchdog/programmers-model
> >
> > This patch allows the execution of the watchdog tests in an MPS2
> > machine (when applicable) which uses the generic version of the CMSDK
> > APB watchdog.
> >
> > Finally the rules for compiling the test have to change because it is
> > possible not to have CONFIG_STELLARIS (required for the lm3s811evb
> > machine) while still having CONFIG_CMSDK_APB_WATCHDOG and the test
> > will fail. Due to the addition of the MPS2 machine CONFIG_MPS2
> > becomes also a dependency for the test compilation.
> >
> > Signed-off-by: Roque Arcudia Hernandez <roqueh@google.com>
> > Reviewed-by: Stephen Longfield <slongfield@google.com>
>
>
> This refactoring mostly looks good.
>
> > @@ -116,16 +164,21 @@ int main(int argc, char **argv)
> >      int r;
> >
> >      g_test_init(&argc, &argv, NULL);
> > -
> > -    qtest_start("-machine lm3s811evb");
> > -
> > -    qtest_add_func("/cmsdk-apb-watchdog/watchdog", test_watchdog);
> > -    qtest_add_func("/cmsdk-apb-watchdog/watchdog_clock_change",
> > -                   test_clock_change);
> > +    g_test_set_nonfatal_assertions();
>
> But this addition of g_test_set_nonfatal_assertions() is
> not related to the refactoring and not mentioned in the
> commit message.
>
> thanks
> -- PMM
