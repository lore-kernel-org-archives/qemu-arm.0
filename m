Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp336979lfb;
        Tue, 1 Dec 2020 08:55:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwFC29dGRqkwqdeMVmDmjTopcz6WgmzmPFMVMQy8j+CdijFf5J/+X9xyn51O97gl+s5BtZH
X-Received: by 2002:a25:c74b:: with SMTP id w72mr6463462ybe.117.1606841727378;
        Tue, 01 Dec 2020 08:55:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606841727; cv=none;
        d=google.com; s=arc-20160816;
        b=Hagruas2DzWSxALzAATVuzJ2/7R19Q3zvSQ9EqYKABKrI8NkMPwkmPqdWCxPfnKGfa
         b38w34J2lt2rxaZ4PzMKfp/C3XY4d7REQwzkzzn/ekSiwS1a5GsnPJDWXhkn71zuMXD4
         wsxhOCbxyNkTc1Pf8vbtPIxmn8gZE1iujgD5NrrLAEwHrL9yw3YRVFVG27kCJ/hS5SPA
         glvFsYPOmR6bQjOFQ8GShitjqbSuqQ+0wUZwHprY6D5S3mqd1kWLNpaLGzgxz3dqTzsi
         yIFj7rYWQTEzJzE5cTf3xU+/rP5F2/jp9qGbtl+Tu/StDRK+qA1RYnWtf68nmJ2qIN0G
         nkAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=4MhNtHsFpjh2tJ2+LBRPnUA2D90LN3eOzCbydpS8BNs=;
        b=GkCZ2/SVjF9xuEoHQpCtOzlIHAh7t1gIGNoxA6O+IaC/vwhACj6ErQb1UnBX2gVnvr
         r9otnCtXg16Y4+fvvskaD9Ztj5Llr+rq8mlDDqPDDzfJKU+YLY9SZ4CZcyWSOvqcX8d0
         Kf6BN6fiHj86GPBH5JMbge5IKWEHePnAts1rceGYPQ+Rkw1qQxBXR0+cKCRzAm5eG311
         aPAIAyZdXZsfo+lkUDcUC8PUnNkd/FqemnSxmOK4FE9uO33KjzPRhYHFFOA+lNF+g+jw
         wkrnW/+2IJxtwvuiv1/8Ka9xNCvQOVwIwhtlV7rvBU4R1OKs3WSM1lWao+Yfg+HWmcu5
         2HmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rFZ7nKMs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 140si325441ybf.135.2020.12.01.08.55.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Dec 2020 08:55:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rFZ7nKMs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kk8w2-0005do-Kl
	for alex.bennee@linaro.org; Tue, 01 Dec 2020 11:55:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk8vX-0005d8-GU
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 11:54:55 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:37309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk8vU-0004PD-MJ
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 11:54:55 -0500
Received: by mail-ej1-x636.google.com with SMTP id f9so5543013ejw.4
 for <qemu-arm@nongnu.org>; Tue, 01 Dec 2020 08:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4MhNtHsFpjh2tJ2+LBRPnUA2D90LN3eOzCbydpS8BNs=;
 b=rFZ7nKMsLYYtnMPH2zWeFtNZkUp8GtIFxAzpJ/gv7IFHj1iTXlANbgN4nmpKnsJIfB
 b8JWP/tyZ7dOMe0salB1dQik2tKbiAr9cNKiN8wTlg41RWqP8fsOmqzMZl5Tm1hhVDF5
 lUr7K1HMvPXrhwetHt/MfWIbqNOncFfThYwTqG32iY6026y8DD/B0jXvEnP2WbDkOHS5
 zGTjkcNTZfPayRvmYC/4O2GUHEAaxkc9KEbWIiFUkiXL1CcQ3qzKprvXMx3gQBS1o8t2
 N1kA/GZdwxnfUbeFTR50nOboxrRZiiPZOl0GYw4jhDjTd48b/dwFK/ykBnwLUNcv6NJu
 7bnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4MhNtHsFpjh2tJ2+LBRPnUA2D90LN3eOzCbydpS8BNs=;
 b=E1aeCQEp5PowExyTn7UXbBF0xBkFl+3lapZxn6BJ3tfmF86BB8+NHDZNDHJ2p+D25B
 kD3G8kPyWNfVptVlvKIpeMgIjNRf57wgoiaanrBe2TAtut31mDWrluSUbTwxCd/gS6Nc
 o40Gu7xZt3xgrKHO3apoTri0+NGGyj6rcLn+En47wU/A9Kvt0eAM6i3LP1JBErPVajxC
 SIYGZhQLf7Pcq0SWu8LOjO/x6aVCg0XfJgqwSQ7w18MeGvmLdIqKmGpCz9QcdD8w+WBA
 D35Y9K1AnivuxkuAbe/6eQGLAOO/BGQXDqQw5CU3wvke5VfND9C0s9wFU7zftYpLEWEa
 LE4w==
X-Gm-Message-State: AOAM532rT/nH11KaySOMB3M0Jpm3lagV8pESQxuOarY2nDeztDQ6+y+A
 /osPs4ymqYnia6oa9CmBkBnvrrUUcFi9X6t8KlkiLA==
X-Received: by 2002:a17:906:2741:: with SMTP id
 a1mr3873378ejd.85.1606841687404; 
 Tue, 01 Dec 2020 08:54:47 -0800 (PST)
MIME-Version: 1.0
References: <3333301.iIbC2pHGDl@basile.remlab.net>
In-Reply-To: <3333301.iIbC2pHGDl@basile.remlab.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Dec 2020 16:54:36 +0000
Message-ID: <CAFEAcA9J0t1UtrNqGxst7-9kCq_+M3+xA6-h+xo3x9Z6Ccc5bw@mail.gmail.com>
Subject: Re: [PATCHv3 00/17] ARMv8.4 Secure EL2
To: =?UTF-8?Q?R=C3=A9mi_Denis=2DCourmont?= <remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
X-TUID: iuyqBp1/pa4r

On Mon, 23 Nov 2020 at 08:02, R=C3=A9mi Denis-Courmont
<remi.denis.courmont@huawei.com> wrote:
>
> The following changes since commit 8cc30eb1400fc01f2b139cdd3dc524f8b84dbe=
07:
>
>   Merge remote-tracking branch 'remotes/mcayland/tags/qemu-sparc-20201122=
' into staging (2020-11-22 15:02:52 +0000)
>
> follow.
>
> Changes since version 2:
> - Don't set HPFAR.NS in AT instruction in NS state.
>

This series seems to break the 'make check-acceptance' tests. Specifically
the vexpress-a9 image fails to boot:
 (20/40) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_v=
expressa9:
INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred:
Timeout reached\nOriginal status: ERROR\n{'name':
'20-tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_vexpre=
ssa9',
'logdir': '/home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang/tes.=
..
(90.23 s)

The log shows the guest kernel booting partway and then hanging.

thanks
-- PMM
