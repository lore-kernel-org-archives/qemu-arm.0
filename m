Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp2573230njc;
        Mon, 18 Nov 2024 05:21:15 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCURFf467eZTKyaqWsuFHu5jwMal2WM6f+BjIm/qMe1uUEx0xbf0w58+FJJAq4QvBl7jNK61I9cGlGD+tQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEXnxpkK46UcqFAzwcBlHyxTkCbwNpHFctvnKhhoI6QJcre+gCRAWESHdwLfVL/Bv4KmQjf
X-Received: by 2002:a05:622a:298f:b0:463:16e:c5d2 with SMTP id d75a77b69052e-46363de1fcbmr165948221cf.11.1731936075082;
        Mon, 18 Nov 2024 05:21:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731936075; cv=none;
        d=google.com; s=arc-20240605;
        b=GqA0LmRcP7mFk+H5jpQOOQS1HAKQ03699luAraNeqs7SVxFnBZ39tQrqXNxomUVxde
         0SPwxCSjbdVvLhzL+ydp5qD0F+FVNGhO5G4Wwzb0U+qRe5Uk+yE2cro+g+gg5vCmTAHZ
         4m0rGThd4sjJXoJp1hkkGVQj+SSA+z7KkCPrnmJgw/fa3DWwd86mtAOEP3seeIDnQkuz
         DMi/w9ETtx7lHBrwP5OMVKm88fjrLnSSahkksqQZ+shlUl+t6kvWSPXOieEg585OLQqB
         SqzDgKEG+4eM0DgDXYsF4odZvbMMx7D010R0XrWbVPqM4yZB+b3sQlX+ulkEX+DqsKqy
         A7jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ZZRL82nACjZeHEn3zTfFNgDHsmHEaxj0UkIBt/Rf+rU=;
        fh=GKtMJkZEQSP3TcLyc0grEzMd7PUjXGgwfc97H7lAsls=;
        b=fLwcuZEv56JNAQbIq09PcNakMKvuZ6V4oqKSfJBWb3EeBjh371fa9t7LGG8BpH4QUt
         IG0LZ2H28L12koDnjia7cpDc2l4CNMxT3DsxtTp7ccI4Gxj04dIzaFIUO/BaPyyybnQB
         Acbu8Zn7bBnqcD1fgf4jz1rwHyZmHcrBbV/+oBlb+gE009iBLS4lcmWYPwwDtUn7F98r
         LAlmoUrvK5qQHQaJTZfdSSlEXaQ8hmrkLpznhp8TQuNGJsG6trB2QQqkdDw+P+jdr2Jh
         zx9wDb6wwrnS4T5wtMDTcTlsvvZ8xIm0GnX5Ih6G3bbw0mRQ0ZWeMD9eGS2XmXklgfCv
         gvCw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fn0STWrt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4635aaedafbsi116426121cf.406.2024.11.18.05.21.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Nov 2024 05:21:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fn0STWrt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tD1gf-0004mp-Q1; Mon, 18 Nov 2024 08:21:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tD1ge-0004mX-6y
 for qemu-arm@nongnu.org; Mon, 18 Nov 2024 08:21:04 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tD1gc-0002Gi-9d
 for qemu-arm@nongnu.org; Mon, 18 Nov 2024 08:21:03 -0500
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5cfd3a7e377so463533a12.2
 for <qemu-arm@nongnu.org>; Mon, 18 Nov 2024 05:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731936060; x=1732540860; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZZRL82nACjZeHEn3zTfFNgDHsmHEaxj0UkIBt/Rf+rU=;
 b=fn0STWrtVHoR+aBmi4Sd6z4kyPQ5LYejqcDJ9tsGwDIXe4XI2evWl5kzagm+VR3JYS
 LtlwBGXyNxt85QBntsOfayHVyMRX3P4dEc8SWuQAixypSfWEy99f/N1KQaYoSGqAZBZM
 Y573gyMQ6/VRO3zGfI7Tng1hIcbLjr+mnb5enPpYIgKfeAqAbXUSXjsAiblesuq1Vk8A
 1nUVmyvjbMfKp8N7xys9TEa9CvTnOdW9OYhuT6/e1B88RDb1CPXwc4mrqqdEwhCtEIOl
 y++dSVDg1xKZqvBjWw802bDWh+KEtpGIOXCY7reVgqsXudbDzo4w2Unxuwf9H1SreFUG
 KGWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731936060; x=1732540860;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZZRL82nACjZeHEn3zTfFNgDHsmHEaxj0UkIBt/Rf+rU=;
 b=X3d+ie+QJkCdimST5JMCuMwEgjgC3InEBiW6uTmfHJz80yzpgzzCQsYVSN+6oXrf0g
 9wO4mMqZBW4t/enx4SvsI+KQsPpGHcDEZNcyGwO+6Gvw1e7dMqwktv/tev9ZwQHaifwG
 q78u8V6p/JU1Xs99P16/K7D5Tl5kOFecmvy6RVQcj0uTJOJCBP23h5kME7iJg0OfC5bq
 DarohQzug/NXEYs7ITcvY+I2lAYB9QPTcoQ01KjG8A0KboYUtF/oK6OKS1y3YEpv8hXK
 x0GivAbVQxUEt68hZgzRHpGMauBEWGjeV4z5Yr+WcL5TqvYzYFva5VXxX2t6PFlkHpyk
 GrCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXStz4kc+20PT2TYJPQ8+QTKteTl347UIBHoOf+srLLXEPBl9iZUqQFVwXttOvwxtsY+m9OjPZoQg==@nongnu.org
X-Gm-Message-State: AOJu0YxiLp41AVOzxkcwCko83hprIYstuFJ6tHheO8zVUT9fXxSQV0uq
 ILW/yMZAD+tgR+WIFhb6IcU2iDIwZ6TzCarBnVx4euFL5Hrb5NwZnq1JM79/NKCZjICZl+hyi8u
 sK+s2ywBOVmHl/d7wN0gNboOMP8uDNC4PCbgLEA==
X-Received: by 2002:a05:6402:d06:b0:5c9:59e6:e908 with SMTP id
 4fb4d7f45d1cf-5cf8fc14246mr9277984a12.6.1731936060436; Mon, 18 Nov 2024
 05:21:00 -0800 (PST)
MIME-Version: 1.0
References: <20241115160328.1650269-1-roqueh@google.com>
In-Reply-To: <20241115160328.1650269-1-roqueh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Nov 2024 13:20:49 +0000
Message-ID: <CAFEAcA9-pusQVN7k8PkUvLvzpxvNEyRuK-A2iS_a_5W_WwNPMQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] Make WDOGCONTROL.INTEN the counter enable of the
 CMSDK APB Watchdog
To: Roque Arcudia Hernandez <roqueh@google.com>
Cc: farosas@suse.de, lvivier@redhat.com, slongfield@google.com, 
 komlodi@google.com, pbonzini@redhat.com, venture@google.com, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: sgbxsa0wOsBS

On Fri, 15 Nov 2024 at 16:03, Roque Arcudia Hernandez <roqueh@google.com> wrote:
>
> The following patchset tries to address an issue where the watchdog
> counter was running as soon as the device is out of reset. This
> created a few problems with the firmware under test. It was pointed
> out that the firmware under test was already working on an emulator
> using the real RTL. Further review showed that the WDOGCONTROL.INTEN
> is also expected to be the counter enable as it is defined in this
> page from ARM:
>
> https://developer.arm.com/documentation/ddi0479/d/apb-components/apb-watchdog/programmers-model?lang=en
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

Applied to target-arm.next for 9.2, thanks.

-- PMM
