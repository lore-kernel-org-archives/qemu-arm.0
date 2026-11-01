Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D999E606A324
	for <qemu-arm@archiver.kernel.org>; Sun,  1 Nov 2026 13:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n+RbxwUY
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xNVSm-0005AO-Td; Sun, 01 Nov 2026 08:19:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xNVSh-000591-Vy
 for qemu-arm@nongnu.org; Sun, 01 Nov 2026 08:19:04 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xNVSg-0001Em-8j
 for qemu-arm@nongnu.org; Sun, 01 Nov 2026 08:19:03 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4a4d7ae1ae9so19543345e9.1
 for <qemu-arm@nongnu.org>; Sun, 01 Nov 2026 05:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793539140; x=1794143940; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id
 :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ksHhiQCiUnxbhloByktUJ8gXU9lR2HIKf8kgi+Hc+8M=;
 b=n+RbxwUYTh2tPLP6nbmK2655EFfJJD63fHgjYns3AukMgjczmG1COu1kgh8NHpX6Gs
 /2iRP/35+PngarZYH3m7qVdolI++QGL6X+mTiy+QRDQHVsLpCB+s2h0Hk4tYAUKlq2a/
 Ebk4yGF1i4zJNU8IEHlztS6CWIgxiSu6yERPUPC686hNUjTEVj3Al5LaDDptiq6dy1IG
 V1rnri7xGZR8luOfT5ToVNIbGDEPRBbcdQUGWO82p1YDSd1OqJJh+5kN7q53iwtFrLI6
 PpIMhDuBSqh+jpVudhiJpOpbPVNiCKcG3xZXICZL0bwd9aaqzy2IjI+qNj8qo7HQC9Yg
 U5Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793539140; x=1794143940;
 h=content-transfer-encoding:content-type:mime-version:message-id
 :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ksHhiQCiUnxbhloByktUJ8gXU9lR2HIKf8kgi+Hc+8M=;
 b=CmHrbixLtT005DNPqEpBT+XsuIvLGSoTKKYulKhoMz1SUxxgMeWvY+aE+oq23h7Vvy
 e9zUUfaPQK4kaywG2vzVmJAk+y20YNFl813C5gebKWkfzvE9c3d6+7nlqUZAlw8cPC/A
 2QIFEoS7FK6dM6PlYXIGIisY1lF2v4GJbgjGPEyycwtYm5V4TBf7zOkQQc5cQ5aBOl8s
 Yr47rkhYm61jRIMN819we3TOEGyE3A/FhyHie59aAwG7NyJXOMOzd6cz7vzQ66kdPJ50
 mqA30jPhuMVKdeg+4IVxBNjypbftxc37Ua2FnKLarwupFKqitQgBJfJjMWMnKIsJzYAu
 o9NQ==
X-Gm-Message-State: AFq9FYLuyuyi3JBdsuu+llS9TZF5QjQrqliPt8Szi++Y7lUxtJO3PJgs
 cT1DsGWlW5AUTyui2aO7Ha9/bMVcBivu6ng0y71BGXLIYKG/j5HKl9h8
X-Gm-Gg: AYBFou1DkDcEcYvPPXCvutJY5KelD/jSLo0zsZl0K7cgF7NE0aSH3W5F+24AMujL7eI
 4/tb81xiFFomofkWeTqpswCxi4C9/l0XvOoP1oA5XYkEwlePxVQtnGfCaxc/nfnhkWOxAyOS8++
 Or/+aFrE3rN5ysGH6nPBscNdu9iGoB+HL2rlFtAFTqjv8I28jXH8tswdHUAAXjc1ZVlsg3e+zM2
 LeAauU5YW1eSB88zL3GaGgjZ+aRCFlxQrOSfzXvn9PIhFQDi5o0P9dvGilyhbDAQFwStWgyIF7s
 xKm2nIc9+Ihte1ZAE1+xEJ1Caxu87J6IVssOYnZkj6vkN9AmxmPwNpvWfP3cS6hPnBvBbEMQAna
 bm6lF2qCZvFzBkN5Wloi89qvMac1ZvOBlmTSp+Wz/CMiV7UMma73oK9s3m4GJ7cgoKv4uoiRzRg
 bw6jCuvW8AOXmG6f9dm9LetHqSi7TD0zZA16p3LVwPvpWeeOcSF44nyQJ3oBzxlG9eNM8Wn0d2N
 kKwnNcwvUrBJbV+ZMxZeZ4SSu/czB+UToOrKfXgUg9uFMn3F0lZKaWES6KzUIiiWWax+HZ+OGKi
 auc1fT2WH5IgagL7xQlVuZjViuAy5MA4Rb/KbFwdTUnoOa0VStcSYeDYDIQ1GGAS1L7FJkrCeBG
 E8oJrWQqJsBito1M=
X-Received: by 2002:a05:600c:1909:b0:4a5:26b8:4507 with SMTP id
 5b1f17b1804b1-4ac18b7dff9mr164059855e9.21.1793539140029; 
 Sun, 01 Nov 2026 05:19:00 -0800 (PST)
Received: from ehlo.thunderbird.net
 (dynamic-077-013-241-109.77.13.pool.telefonica.de. [77.13.241.109])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71bab1a8sm14207266f8f.57.2026.11.01.05.18.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Nov 2026 05:18:58 -0800 (PST)
Date: Sun, 01 Nov 2026 13:18:58 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Gaurav Sharma <gaurav.sharma_7@nxp.com>, qemu-devel@nongnu.org
CC: qemu-arm@nongnu.org, pbonzini@redhat.com, peter.maydell@linaro.org,
 pierrick.bouvier@oss.qualcomm.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCHv4_03/11=5D_tests/functiona?=
 =?US-ASCII?Q?l=3A_Fix_i=2EMX8MP_EVK_SMP_configuration?=
In-Reply-To: <20261007101105.3917771-4-gaurav.sharma_7@nxp.com>
References: <20261007101105.3917771-1-gaurav.sharma_7@nxp.com>
 <20261007101105.3917771-4-gaurav.sharma_7@nxp.com>
Message-ID: <AE3F9CD0-3F2F-4BF9-BD20-427E15706EA4@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



Am 7=2E Oktober 2026 10:10:57 UTC schrieb Gaurav Sharma <gaurav=2Esharma_7=
@nxp=2Ecom>:
>Remove the explicit '-smp 4' argument from the functional test=2E
>The SMP CPU count is now fixed internally via mc->default_cpus and
>no longer needs to be specified by the caller=2E
>
>Signed-off-by: Gaurav Sharma <gaurav=2Esharma_7@nxp=2Ecom>
>---
> tests/functional/aarch64/test_imx8mp_evk=2Epy | 1 -
> 1 file changed, 1 deletion(-)
>
>diff --git a/tests/functional/aarch64/test_imx8mp_evk=2Epy b/tests/functi=
onal/aarch64/test_imx8mp_evk=2Epy
>index 99ddcdef83=2E=2E6046c573d5 100755
>--- a/tests/functional/aarch64/test_imx8mp_evk=2Epy
>+++ b/tests/functional/aarch64/test_imx8mp_evk=2Epy
>@@ -53,7 +53,6 @@ def test_aarch64_imx8mp_evk_usdhc(self):
>         self=2Eset_machine('imx8mp-evk')
>         self=2Evm=2Eset_console(console_index=3D1)
>         self=2Evm=2Eadd_args('-m', '2G',
>-                         '-smp', '4',

The -m and -smp parameters are both removed in current master=2E However, =
this patch is not obsolete: It should contain the smp hardcoding to 4 which=
 is still mixed into patch "[PATCHv4 11/11] hw/arm: Enable Cortex-M7 AMP bo=
ot on i=2EMX8MP"=2E

Best regards,
Bernhard

>                          '-kernel', self=2Ekernel_path,
>                          '-initrd', self=2Einitrd_path,
>                          '-dtb', self=2Edtb_path,

