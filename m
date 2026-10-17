Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F125CCF2C4
	for <qemu-arm@archiver.kernel.org>; Sat, 17 Oct 2026 13:13:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xI4Dp-0005oI-48; Sat, 17 Oct 2026 09:13:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xI4Dn-0005o3-JA
 for qemu-arm@nongnu.org; Sat, 17 Oct 2026 09:13:11 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xI4Dk-0006wU-7N
 for qemu-arm@nongnu.org; Sat, 17 Oct 2026 09:13:09 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-8b0d63f60bcso5802827b3.3
 for <qemu-arm@nongnu.org>; Sat, 17 Oct 2026 06:13:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792242787; cv=none;
 d=google.com; s=arc-20260327;
 b=epW7f8eHhvqyE7y7/6shQ7jvPv6tlcJCVJffHQkpChxE6Vb5o++Rs2mAcs7fussoCj
 PV7ZjRXNPWWXf8N44LKmOoQas4UgnV6HYUGQCeHoDCyJaTYJj5zQC6VGAjn5/ELBYG7V
 dPA3+pXvdbg5rb8qMVjOJTsmAC0wV0NKnSjUg74IMXKvnzRpWvZ4PbI4EU4+hVDAgnJ4
 LJF5YrB68ezN3muXwBmbsUTeW4GfVPpc6Qf/cCo3egOI9Wocyrn7VdwSpt+ajaJ9/qDG
 PKjBZ/0cnQrC6HNs6BQsRGecGY4c4ngDtSTtaXREaMFJzUyGpJUDgOwsmmxwWL6gA1b8
 mdBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=KiH9lCN80VTfNm8iRgopCmf+VLX6kHS52Kc2gPJrrXI=;
 fh=0A7VoBDyscqyUMIW2T/p8buePGLbnJ8hFuo/Bu4GaAQ=;
 b=sHO50CKIPwPD0d/JOaXBkRXbR/DtHq588NWDuWNegCYGIEkTdbI7MAcwmHB2osdUMu
 DfirUC3eSFwM93nMEEh5TIzTeGJeVBVeMKWu3vGmTfuCmLxpdWpfo9C6GW4famRs0Z7R
 8DKYb/e50OaphxnNPZrVOK2OYx55PJke+1dH9kT8uLyB+Lh98jcrjOz2qsAEO7OQPKfS
 GNRTUE6HeP3ddcoCZJd0oW67IDSt6LrP6LOraiGwP6l9rgr8RA8HV/qcQthdbhSe1R4h
 kXUefWqX0o0LLVf28j7BrHY3OcOyJnT0jSbVGs29TDKcJAO2bfUD1w737Q8ZiUE2RMbQ
 BrDA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792242787; x=1792847587; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=KiH9lCN80VTfNm8iRgopCmf+VLX6kHS52Kc2gPJrrXI=;
 b=n9VWJROeqk7Pgo5G0Axc2bTaAwIJUkuTFt7wnE/3KP0jAkhXd/MmpQo3/2yEaXqKD1
 GQtYLT6gQv3F42f/NPRgpWMNyHmtfLo++mSiYMI0iie+hjJqMGowTdw5cKFqJVMOcM9a
 8PKCnpVSdMavw4i+U8td0gdHHwwC54mhdBQMbLzuZsyD0yf6DgtCpZOWFkfqQWA0uozv
 bhxniF5byU+sFb/YzGCksK8OPb8v2r72LcR4Wk1FRPE5PDcdiETzHi70njYo0QIwXnE/
 zaX0wI8zjBg9QwaTSIapudOIJ2jlv8WfuibTtcabyQUDSCAbGJ6yXCSPfLU7pDTYe/lo
 y5zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792242787; x=1792847587;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=KiH9lCN80VTfNm8iRgopCmf+VLX6kHS52Kc2gPJrrXI=;
 b=qyh7tHdX0j87FgWbl2ZTcQbZz15Tc8ehrII7/Sbvd/cOJoUBThE7Ny64NEyrVXoIKd
 sjSL1qfI1gNmbyMxYyJj8u5WXaYFFgqMTizx1DE3mqKhhlk9YrgBUCZK4aNM/W6O/ssb
 V99GXmJe5qxDP+mf6fi+xBGuXWlrISCNNlQ7ZyFnXe8sg3XTKVrYxxbauOTNnsgetK+u
 YxTBIqfNIYJKuLoQy8icDGXmxi2rUjROJURiF3UV7wfLjHqf+eX1Xe+qOd3k0TPv3vIg
 t8lXCPNMFl6PxNk/VafH2Ax7BYpnA1wspb8I6cAVwWKpJsmqBWCwXbp641A0oZhqkZvX
 qN+Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBzy4McC5lR6cRZxU3JMJKizKSdih2NgOi70mKO4+QvgNHz6+Br/U30xHCpnSJ0waNDY9tRvqJIZ/w==@nongnu.org
X-Gm-Message-State: AFq9FYIXvacde9syb1DwNEYeYLD6ZKuudywjX1It5Qa+c+j8h7QqQdi6
 Z7Dd8nrm8IDli/sc58+Gn9g4TGmKqFyI8LYUISrSqWp9q/x0290LcbHhEGpIu7D8zmqqRewgXtZ
 +ssJSKo6KJKKv0qrgtNSz8veCZNV0+OCKrXvfvXMruw==
X-Gm-Gg: AYBFou0/K7rsNrOCkoumagxq+C3gpi6kGuio4gS4QGaG9sb+RWx7NXSErolW1sH/7ML
 MnxoAIRNZl580h0Lrm40ttahJ8sy386hWbRk3X85HfN61hIGvRdzMRp56rT4FvDAseT3dmk0npU
 7K3lPz1Fn5TkOxdgUyvuuyBNvMV1a5ysOB9Xhq5ZpVRVDPRUS/josy7yumjvaC8HJq81WuBgWQN
 EOzaTdFwrFmaQrxGzIpqlORcuRhjhU/jznLE1SfUUWWj9mQLw9WuyEUg1aGduMh2M1T5qvfRy0T
 CcUfqoTnHqqqRUhLxpozxDXYCirzuq4bEcLEsWylkjVOYJjIWAi8nsIo7Yuqe6K42/RS5HyqAW6
 hmzEYEF5Q5xwU86dUIL2dqvgqh0EuJEnmsvc41ic=
X-Received: by 2002:a05:690c:a0ce:b0:8b0:dd35:7b9b with SMTP id
 00721157ae682-8b0f222e104mr7761717b3.67.1792242786578; Sat, 17 Oct 2026
 06:13:06 -0700 (PDT)
MIME-Version: 1.0
References: <20261015181122.60608-1-marcelomanzo@gmail.com>
 <20261015181122.60608-17-marcelomanzo@gmail.com>
In-Reply-To: <20261015181122.60608-17-marcelomanzo@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 17 Oct 2026 14:12:54 +0100
X-Gm-Features: AclHuK_9VqJFOLR9L-ked9MBiuBAPGh6za91QteeWgHb04ED9396j7sWa9Wq5DM
Message-ID: <CAFEAcA9n+Y+nWZwNukc92iT2vg+x_5uEWieDrcziaD7oCoeXNg@mail.gmail.com>
Subject: Re: [PATCH v3 16/16] tests/functional/aarch64: add raspi4b GENET
 networking test
To: Marcelo Manzo <marcelomanzo@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
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

On Thu, 15 Oct 2026 at 19:11, Marcelo Manzo <marcelomanzo@gmail.com> wrote:
>
> Add test_arm_raspi4_genet, exercising the raspi4b GENET controller
> end to end: boot with a -nic bcm2838-genet device attached, confirm
> the guest driver probes it ("GENET 5.0 EPHY" in the kernel log),
> reach a shell, and confirm the link actually comes up
> ("ip link show eth0" reports LOWER_UP) rather than just that the
> device exists.
>
> Verified locally against this series with the exact kernel/initrd
> assets this file already pins (raspberrypi-kernel_1.20230106-1 /
> groeck linux-build-test rootfs). The link only comes up because the
> MDIO patch handles the PHY autonegotiation-restart request (BMCR
> ANRESTART) correctly; without that the link never comes up and this
> test would hang at the "ip link show eth0" step, so it also serves
> as a regression test for it.
>
> Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>
> ---
>  tests/functional/aarch64/test_raspi4.py | 30 +++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/tests/functional/aarch64/test_raspi4.py b/tests/functional/aarch64/test_raspi4.py
> index bacecbbe9c..f703fc69ae 100755
> --- a/tests/functional/aarch64/test_raspi4.py
> +++ b/tests/functional/aarch64/test_raspi4.py
> @@ -109,5 +109,35 @@ def test_arm_raspi4_initrd(self):
>          #self.vm.wait()
>
>
> +    def test_arm_raspi4_genet(self):

I think you need

        self.require_netdev('user')

here, to skip the test on builds which were configured without
the usermode networking backend.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

