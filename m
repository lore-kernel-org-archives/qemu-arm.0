Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp437891lfg;
        Fri, 5 Mar 2021 07:19:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyvWcWMZdEy0NQp7FYZXiUpsae2QH+LaGFpZfhRGoaX8R+Rp8qIBs6Ltdd208jZLkK74xZu
X-Received: by 2002:a9d:6c8b:: with SMTP id c11mr8645272otr.52.1614957569890;
        Fri, 05 Mar 2021 07:19:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614957569; cv=none;
        d=google.com; s=arc-20160816;
        b=Z6fGUc9injCFFcyLkenL8OW3RUdAIy5++8QeOltXMsdGcq7sqyb+tgVMOv5f0P9GVd
         sABAkuMo3kMw6WGlwkKuKsJi1g13JG5My0oFBncYLvIIll/oCRa/7s59VrdYBQgdMWZu
         7rZhoRbtfIM4XYYL8qN+AQO6WuoWXSkLCzcYlpD3t7mTga3XVT7DDXs0RyNxmq+yG+xI
         r+07y4VuZMpXyjMXEMe0flJs6pubWVc4wXi0EFNkq7jWzqHwje6JoQ6iWqcS3SewGIzS
         L3pZ0aVmODO+a706Yhajz1XgzANzaRmhgSAzFifZpDxeqfzpAL40fRPY3fY6coxvgnwZ
         oPXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=InawuL87Otlg8iB2a2gTtWLiA8QqZM30KWN700tepSY=;
        b=RuzoSmd19/kKLzO5pMGzIPQ6yG7R15en1uYjBnpNXc5r7IyxZbEbUvK2hODIJhjIO2
         e28Zq9DEJoEvuu1FSGm+Bx6zUYuNhp+wTdcLUchgGeMl3W5tLfn+uLT5xNuLHiNldWZk
         lpdjtB+UhTJLswnqQY3BUUpGtS9PIlED4p3q+9LesfPNzgGNCw3Eg+ZJ9QsPVbjCx3GF
         WlMc7qBlifvS5qzJUX3VuJ9eSnCNxSl8bijb/bo6lA7Flu1lC8Q7ADVSrflMbDRxtFSG
         rS9XQztIEYT0Kp27XPM13odJ3hT4g01ym+XAhtvps+A1P2OKvZxqvJm2S9X/1FB0cT8J
         sqQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EBbs485e;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l4si2596603oii.119.2021.03.05.07.19.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Mar 2021 07:19:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EBbs485e;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:32892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lICEj-0008Ar-3q
	for alex.bennee@linaro.org; Fri, 05 Mar 2021 10:19:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lIC1Q-0007w9-59
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:05:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lIC1L-0006PE-0A
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:05:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614956736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=InawuL87Otlg8iB2a2gTtWLiA8QqZM30KWN700tepSY=;
 b=EBbs485egsVU1hv/eIWJ956ju2jvmQB7jyxI6w8nVJZkpkjjim6efIvlt8jC8pRx5lJRsW
 wUiN1beYoeU4fpSFEK5nXN9kSKTH0bhIwjrdLlIGDTlRApfohsXCcp0Ah/2eb/vXUi9qsq
 zamtm3ZhJdiY0SEziDxngE8tQJATB34=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-jiU6uNPYNTmGvhBviyFMOQ-1; Fri, 05 Mar 2021 10:05:35 -0500
X-MC-Unique: jiU6uNPYNTmGvhBviyFMOQ-1
Received: by mail-ua1-f69.google.com with SMTP id r9so327615uan.9
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 07:05:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=InawuL87Otlg8iB2a2gTtWLiA8QqZM30KWN700tepSY=;
 b=KcJGzu23CDtlBmoaO3sxjqwM3bj2uxdOTai9EQGxrZPYk6E7mkih00ZmeDwF5SQ79j
 7Lx5Rg6WXdtzMlASAFALYRpO68GdnlToegS9zFGCV8H4YBoAERuXI+rjlhyc63uhaBfF
 wqnP7QM/Ag1qET91FQXbifMAiQi/hccLtAcr+sAKu0xsfr2CBfoC0OD8+43PEwZ3F9u1
 tM9OqI8vRAQDHGftJcDEbSLQHIieWuHfvi4xc912R+h01LtUhYjSny5NsBh2QtAp4BwN
 EfZ3E5mh0pYTspTbk6erl0RH8DTmbOUklCka1RtOZr6xEp16xUxXCBP5cxPeKwzgPReK
 Px9A==
X-Gm-Message-State: AOAM530pVU1VHZzIP841wbekPcxBVBAA3hHIxLkVDhCBu3JW68GyjGXg
 QX5hnY8jPqpVF8OIBckJDzdwXD9097s38yMQIJ2CuvIFPAKTVfEnvYaOiOnlmhreM30+peF283P
 mrqb1nOxqNnYFUVzPvAieLp3dCdrbfyU=
X-Received: by 2002:a67:fe93:: with SMTP id b19mr6649140vsr.1.1614956726923;
 Fri, 05 Mar 2021 07:05:26 -0800 (PST)
X-Received: by 2002:a67:fe93:: with SMTP id b19mr6648907vsr.1.1614956724741;
 Fri, 05 Mar 2021 07:05:24 -0800 (PST)
MIME-Version: 1.0
References: <20210304203540.41614-1-nieklinnenbank@gmail.com>
 <20210304203540.41614-5-nieklinnenbank@gmail.com>
In-Reply-To: <20210304203540.41614-5-nieklinnenbank@gmail.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 5 Mar 2021 12:04:58 -0300
Message-ID: <CAKJDGDawHKo0=q_psWrSOGVXvDf+QjjM20E29bdbogNfBTUsXg@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] tests/acceptance: update sunxi kernel from armbian
 to 5.10.16
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 b.galvani@gmail.com, qemu-arm@nongnu.org,
 Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>,
 Cleber Rosa Junior <crosa@redhat.com>,
 Philippe Mathieu Daude <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JFJ/JfTOoR47

On Thu, Mar 4, 2021 at 5:45 PM Niek Linnenbank <nieklinnenbank@gmail.com> wrote:
>
> The linux kernel 4.20.7 binary for sunxi has been removed from apt.armbian.com:
>
>   $ ARMBIAN_ARTIFACTS_CACHED=yes AVOCADO_ALLOW_LARGE_STORAGE=yes avocado --show=app,console run -t machine:orangepi-pc tests/acceptance/boot_linux_console.py
>   Fetching asset from tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi
>   ...
>   (1/6) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi:
>     CANCEL: Missing asset https://apt.armbian.com/pool/main/l/linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb (0.55 s)
>
> This commit updates the sunxi kernel to 5.10.16 for the acceptance
> tests of the orangepi-pc and cubieboard machines.
>
> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> ---
>  tests/acceptance/boot_linux_console.py | 40 +++++++++++++-------------
>  tests/acceptance/replay_kernel.py      |  8 +++---
>  2 files changed, 24 insertions(+), 24 deletions(-)
>

I think some devs will not like it, but, for me, it is fine as we
don't have the old kernel available anymore:

Reviewed-by: Willian Rampazzo <willianr@redhat.com>

