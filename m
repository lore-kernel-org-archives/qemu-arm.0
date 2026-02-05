Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95401EC1E86
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Feb 2026 10:17:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vnwQF-0001za-Rp; Thu, 05 Feb 2026 05:17:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vnwQC-0001yd-C2
 for qemu-arm@nongnu.org; Thu, 05 Feb 2026 05:17:12 -0500
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vnwQA-0006wD-GK
 for qemu-arm@nongnu.org; Thu, 05 Feb 2026 05:17:12 -0500
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-794f701a3e6so7296587b3.2
 for <qemu-arm@nongnu.org>; Thu, 05 Feb 2026 02:17:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770286629; cv=none;
 d=google.com; s=arc-20240605;
 b=FipaXR6AAHDKRY4U+C0fCCgfyXgkPuHPPSOumS1PqzGI77pQicv9i+rZ6hwNw5d+Zf
 fzcgbR6zSbTMchvbHLSi7ULWpbBkCf/PQ0DB2iQMQN+u59JPpsmGYQi6j5c9OIhF0VQl
 3zODzl185qxiY6rizr1cNsLi6DsCTekv32BFXTC/IICOFvrl6zw6YIzZt74KRg99rlMo
 UYSpHAVB4AcJI8JYqkuIkqAcsJtqbG3TFV3rXv6Yjj733Fw2dZPxV4cxsvNOIN4eXnp8
 aqzf0d9D2ABR+Kya8i1jceZnNxP8Lf1qBP2pwJn1wyBEvP22e/FZcC7p8/XfRDcyIKj3
 VCRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Yh/gwoMoCd3XaIwuvwmcawbcsXQYz4dh6o/53HMIhHQ=;
 fh=ayFvV27R3JG6Yk8F2Kt+/9MOK5yHCINe6Zu6jCJ3Xek=;
 b=TMCB9Wl4tBAODlUVBTcyCziKpEC2AlwaMExGMX51BVqinhUhnx5/YurbsRFxMsl3R7
 yc1BkkhJ4s3O1hAC1iQe7DdkyXAw+WaqDA5+Xc2JE2c4MASzpPBypRWx/xHlNi23TTsF
 7WX7Xa1Co5b2VY5WEfhp/y/rrMLqid1GGKHn2HzFYdk0/fyKdKtnlW3q4JF6XhwOMrO3
 qn45td30nsZwtjUycvos8MSQjG46SazDFtTLXXUjQSOXIIuZsEZVx7r4NoPw3ajVWXde
 Tqh91sBXcPLvoNsrufpuahFLAA4UKq8CBzDEi9OGVgCvPj9dNvlODnSJnGKhvRXQb5yo
 HpcA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770286629; x=1770891429; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Yh/gwoMoCd3XaIwuvwmcawbcsXQYz4dh6o/53HMIhHQ=;
 b=FChT1P7MgUyE8wGGZ7WC2afwQbFb3WMr8YMAdbaCsg8Nax4kiqSUzypU+oNELKC9lE
 M42XqdgIQIZlbdUc+Lsk3e6RHqSi4t1Ip02+BaDAhjMn+mVlpjxkjrGUovYfKtwyenDm
 Y2ZzUI842x10w7hovZNGdm0uTU7N9Vb1ixIP/3ZUNCXTTyJRwXw5yf3N4q65ZmAvWnC9
 QGNlNbcmQIqVXPcqj+Z88Vx6UwsuyN11P+lTD70SKT8cB56wx+/z2ey1+pkuDhSsbkQw
 1t3pC1udAq2XmkFr7WY9jSDDYjte6QB1cBgPFc6BIYj0GI1HLbhUezEbgBoxu+HBQfrS
 keGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770286629; x=1770891429;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yh/gwoMoCd3XaIwuvwmcawbcsXQYz4dh6o/53HMIhHQ=;
 b=OLr59LhjT1GTgnjSdInbo/12GCD7MMEGJw8dLvxQqiwisF6C1VsXrwnaBrWdd9kJu1
 XsRQZH1PAXYB4vq/0zaWeRa5ZdgLJF2Pkd0Fy0jBKtNmhRc8cX0AVDfnZ2T+exzaD3eh
 oie4pAuDorb92iw/uxENfVMfTk5abu5PMwEufk5HTDERNgeuyW5f3El1iSe8+v4VDmK2
 F/dHKI2E0kpjoX0H7HbgcWV6UZQfUE6USVhF6tn8iEYRCQquRw2pyprSFqjktayDxHmw
 UoAMA5QgHmIeN4wIPG1avwTSxFkJLRuIuOYheKJBvbf1HT8qUgT8LQXRdoZPmhLfo2mq
 pePQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWnqqsWts9XbtKg3OwmiikT/AVVNZyLL0E1B1ovSaap9nMzcQOWGOzThwChFaFMmDTHSV7A8YeRQ==@nongnu.org
X-Gm-Message-State: AOJu0YzG+EH0LKRBdevdzqrne38LNSO/Xr/GoyrNJQN+9J77k9FGyiJw
 AUvQnGMlBe3gPIXRQSczINk2/sG0Uo2/w4yxux1UCPZxzfVF1xHYeG/xi/knbKsiDqPC2p9xikO
 6T7iRXt48QNz7dcvwUV6EI5B/z1qlTMK6t904wEzNmQ==
X-Gm-Gg: AZuq6aLp7b6jKEafjFSDWUmd5vcIq2FIG3/grUHJCjLTd4Rgm7M1nLH+MgLFxtr6/T1
 Wq6zR2LXMRyxbsKG093Vh7Vdujc6A2kk93T3Cw+7hRur4EY0aDjVG/rTPJePwr7qCwI5iJ1dZZf
 xKQRFXQ7DfvKAYyqV2PEjrvSZKWQg4rWaGqvwN7+7296/QnDSKIa4zGLbqpmK4qLd63wmtAqYTL
 EZ6hyRAtEPmsRckNBQ2GmQmHtPUKxNudWmNFpi655/ZbbcG/DFhXTCbWJnUQzRC7jZ0tQ==
X-Received: by 2002:a05:690c:f87:b0:794:3068:255a with SMTP id
 00721157ae682-794fe75d83dmr59373397b3.40.1770286629193; Thu, 05 Feb 2026
 02:17:09 -0800 (PST)
MIME-Version: 1.0
References: <20260129192009.14707-1-mohamed@unpredictable.fr>
 <20260129192009.14707-5-mohamed@unpredictable.fr>
In-Reply-To: <20260129192009.14707-5-mohamed@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Feb 2026 10:16:57 +0000
X-Gm-Features: AZwV_QifK9yOEmRQj0syBe6nYY0HaAlpeSiFq02Hp70EZ9QTg1OYsSnybQpK8ig
Message-ID: <CAFEAcA97TVmWM9WJuPLxXqS=1cqLNQk4r5x3YAm0Xwx+E+HESg@mail.gmail.com>
Subject: Re: [PATCH v19 04/22] hw: arm: virt: rework MSI-X configuration
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Phil Dennis-Jordan <phil@philjordan.eu>, 
 Shannon Zhao <shannon.zhaosl@gmail.com>, Zhao Liu <zhao1.liu@intel.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Igor Mammedov <imammedo@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Cameron Esfahani <dirty@apple.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-arm@nongnu.org, Alexander Graf <agraf@csgraf.de>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Pedro Barbuda <pbarbuda@microsoft.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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

On Thu, 29 Jan 2026 at 19:20, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
>
> Introduce a -M msi= argument to be able to control MSI-X support independently
> from ITS, as part of supporting GICv3 + GICv2m platforms.
>
> Remove vms->its as it's no longer needed after that change.
>
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

