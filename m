Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91AE60A2611
	for <qemu-arm@archiver.kernel.org>; Fri, 30 Oct 2026 10:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LIh30+rn
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMjz4-0006iI-QD; Fri, 30 Oct 2026 06:37:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xMjz2-0006gd-DY
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 06:37:16 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xMjz1-0006ma-0s
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 06:37:16 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-8b0dba37a7fso4868897b3.0
 for <qemu-arm@nongnu.org>; Fri, 30 Oct 2026 03:37:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793356634; cv=none;
 d=google.com; s=arc-20260327;
 b=OjqXETfBpzHsDhh96aFbB4P8EC5M74LRwDSnIpdB/bqozzlMuTDyZnNWpZvJl6zqP0
 tDVaL6/xw4gxA9L7iGx8hsPQFBzWJke0swY5OaAIHvuMYccevdPx02nI+VNCEFt31IEC
 bo2GnMOssXGE+MK+RJ0Cki8GxR3nTMJftjdE5rSGzkjQYGKD2Bg1hEAM9AfBdFxZq+Ik
 uzerjrYVgqgOWTiM6jVQmTRHeFm7wYSVqFOTZOsNwV0GwBJbQEYUIRoBgCD5kJMpeITn
 hbNB2V/3w9R4xMeUPS4jTcpC+wy/FWMrG5F1cS3OGsHhLxJPSA5aAWrbG1okMpzl5eYG
 yYUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=DSvv5DYNLX5eXq0aNrVBTRfpLWIbkD/Q13mszp4qvSo=;
 fh=jtPqYPxrqE/Rt4N1qF7XA0PTh82y+N9gvujyJ+PnT3Q=;
 b=RbTuOzAhWCkXvgUaVqxw1N1DjrxCnIin1ozhOMZLASNYbuC1JtD0ZYf4Ws6CsU99FE
 VU3qNpWy3Kt74E5IL1k5FZcvdz7vfB4k48HCXY/io2lnvXo3d8WotaosDYqpcUquByr9
 rbkkhLCnuoPRK8Ne8YvXFj/t8e4fRgzjbqQtJPJojQpT4v3Plckn0nFGgwy3HhbirTyq
 xJ+OiIR9PCqVggi5FTXyME+PrxBl1Th6sr3MyWa4zofVL3fe7hbX937VlD9WLG5Gff7r
 JdyNuUeF9h+Hyh0DdkpzgvAe5h9DIyBDv/iP0npccp9UbsXUMYUdtI14FEOwQuVbqtBz
 JIFg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793356634; x=1793961434; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=DSvv5DYNLX5eXq0aNrVBTRfpLWIbkD/Q13mszp4qvSo=;
 b=LIh30+rnMc2InCmeiHLqxYbBfk7klqCkxyP3ev30fOsarbppHoScPCdwXVh0kM0Yzh
 F50p1tsEY+mx1tn24V5itssep8YIYmz6Juy5BxdDAukHLC1+LQThFePHVw6ZGH81ndUy
 QVoqkIvW+gzE3d8FbPdxurCj/Y3xSaJhQxefqzBQgaMqf05muOcMsQvKqMC4Gf0K1S2f
 wuXsjy5YXTjRpFM3ML2b9jKH7dTaiO0S0PMSDjiLZJvhGaNnw7/e3qyamfrGflrr6OsA
 SfOx7DMhm5Rw1BRxKDMdeG0mh75WKLWSHVGnMQdMuh9aPCMrTeSkv8TwdQhMLpkDl+2y
 70MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793356634; x=1793961434;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=DSvv5DYNLX5eXq0aNrVBTRfpLWIbkD/Q13mszp4qvSo=;
 b=ya5Q/EohemyBd9mefdl1rSqQQ1t1twP1dpbjDyjVVAtw775Rn1DWa37vNe+zwu4g0e
 vpcu/qBhQp7VHZqkTrMffwVY9nWnIQcSTbfYrOB13XZSJ4jFGAPjan7ZuT0kXsYNOHCC
 v7qiosxcTxjHmt20ggweuQe9uDE572qR77PdY1YKaVM7QP3U71xnriFMS7i2UJYrx8Wc
 DuEq6YRN6BkB6xlY09Y51xzfduukV6N7lRObXTodP7NM6o5e0fMt6wUH7SNMrfd4XKoA
 Nb5FFDbG5j28AvFKzUQZAk4taNGSY3qAdmaJzdJAsZn5k/0VN8vyhW47DJLl+Tebuaes
 Ovlg==
X-Forwarded-Encrypted: i=1;
 AKwUvByl6EBGvIaI9QAEY23au+QJ9cmvXA+oytj7r+/+olTE6crK3cKhw4qZWir0F4WrXxuPPU1lVPIbag==@nongnu.org
X-Gm-Message-State: AFq9FYJdY8GuNz7u/caEhu9milzUNFALzyLEpUM8FOEFik5qUJnOuBUN
 kjIxzbvw+XwUaib+f9JwRSLmGqcW6H5jRFn+C5438P9C/A9J6KmOtt0iNDiLg8cNA9cCak8+AMA
 TTTzCCvdKTvYDJLjywujriPmjQa9oawHq0Lbl2ZpAgw==
X-Gm-Gg: AYBFou37j4wjBa2e7qdjMdO4YG/xDtOLSUkRqMf1iREaILM56RhA2+Rwk2gN2cheUQX
 sJj1ahQIuu5F4FkSwEZwj31mK7KeGuTlE40DWGESaH+I8aJYuLeapgmMlOH3bwc4pJqeI/Ao+OA
 xJyolK83F0vtIRLDGfLONZUlmlYUUaflkqnlPqIqBqaybQMBrNg6hloa0B3Lt6/Jzi2ZeJpIZnC
 oxj7xbubTYsLJgnhkmxQJ9iHMISucwwO4G0yvoTNYUD+mHQysCc/MEBiWx5T8q1Zp+jiBiJOnJT
 b7Lk4VjIVNVhxuTDSZRIOGRrdL6U4CE1ryKRLHLPiQU0OIBqkegP02UCf/erkFNpbuQw8MZXRcz
 5+0xUVh1QuyWu2G8X9gDfrrNU7gnlqn4QeXroadNpPN+SNKPfcJnyXAXX7sEEErLdPJsiQ9X6r/
 EQ5yCL05wxyGDU2I+iewOmlxrmhV7wTk13u/2OxkSGOeQ=
X-Received: by 2002:a05:690c:6612:b0:8b1:368b:391f with SMTP id
 00721157ae682-8b2b67c08f1mr10761567b3.61.1793356633505; Fri, 30 Oct 2026
 03:37:13 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030072956.402425-1-eric.auger@redhat.com>
 <20261030072956.402425-11-eric.auger@redhat.com>
In-Reply-To: <20261030072956.402425-11-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Oct 2026 10:37:01 +0000
X-Gm-Features: AclHuK-wXxJkaGcuhuFPzduFoH5z441AXeGtKwHLY2uGWjmgyKdaehNKKFRjwuI
Message-ID: <CAFEAcA8teCWU1F3_xw9biUNPiSaEU66U1qMvfCFF5+e8OhaCpA@mail.gmail.com>
Subject: Re: [PATCH v3 for-11.2 10/10] target/arm/kvm: Pass an error handle to
 kvm_arm_create_scratch_host_vcpu
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 shaju.abraham@nutanix.com, khushit.shah@nutanix.com, 
 richard.henderson@linaro.org, pbonzini@redhat.com, skolothumtho@nvidia.com, 
 philmd@oss.qualcomm.com, 7746591750@163.com, maobibo@loongson.cn, 
 harshpb@linux.ibm.com, amachhiw@linux.ibm.com, 
 daniel.barboza@oss.qualcomm.com, milesg@linux.ibm.com, farman@linux.ibm.com, 
 cohuck@redhat.com, alireza.sanaee@huawei.com, armbru@redhat.com, 
 mbawa@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 30 Oct 2026 at 07:31, Eric Auger <eric.auger@redhat.com> wrote:
>
> This allows to report a precise error message if any error occurs.
>
> In arm_gic_cap_kvm_probe() call path we just pass a NULL error handle
> because we don't care about the failure, reverting to emulated
> versions.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

> @@ -527,15 +537,14 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>  void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
>  {
>      CPUARMState *env = &cpu->env;
> -    static bool probe_ok;
> +    static Error *probe_err;

I'm not a fan of this static variable. I'd prefer if we put the Error*
into the ARMHostCPUFeatures struct.

-- PMM

