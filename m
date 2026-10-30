Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A3D606A32D
	for <qemu-arm@archiver.kernel.org>; Fri, 30 Oct 2026 13:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=u181vLHX
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMmak-0002pa-2j; Fri, 30 Oct 2026 09:24:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xMmai-0002pD-Ox
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 09:24:20 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xMmah-0006Rm-Ak
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 09:24:20 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-8b05bf699easo6609847b3.2
 for <qemu-arm@nongnu.org>; Fri, 30 Oct 2026 06:24:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793366658; cv=none;
 d=google.com; s=arc-20260327;
 b=nsFGcYPGdz8HsWP98VK+ysgCARfOtUUVMhsy/Bt+97pG/JiKWrawfdpfMW2jnmcxD8
 MAcupXRZkinMSXNq0KbIcxTsyPCJiaDjVLAyKTLmrYmwGOGEoG8Aqn4YtNaSSY+2vdRa
 m1dHZQZ4/nXTavK2U1S9byoGNTTT2sSTXaBqHRz3tMFVJa/A4TkUMOvubX3IxKgeU+wo
 /ozboGTSyg7YjXsfqzp3RZXHjUNAWfs1buaK0SOIH9byrLC85mq5PvHdt0yVAU3sNv3y
 SbF9ajN3WbjUzLV5vV3cJHl5yPojZBeDaeZyf0im0ce76QyCzx/2z7jVPxawdXprCz0z
 2mWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Zh0klMc/byD8klEQMo1lKnHHSoxDXyOKSTywb5KwxHQ=;
 fh=sBLAxFJidJkbH9fMmg0tcEUV7nsUd7ESjaX+mdcQ65g=;
 b=It7oSp7LLyJVmFtpY28CvGE3x85xCWnY8KKKUFXGTqV+rVtQRY12c8JWZNe9Xxh9qT
 P5JmvbnK2zrTk3NhlfUf2eZ0CL0HxSmBabb82L2GiDLrQHkn/sqUV6qzGiPOgl2hFSdM
 2JPsiq2Ostot4ZKJx+fNcZhBLhSMHalkvRO0NDZM2095PQeRXJvxqgwaxk1mrZ4TgHrx
 ZhtJszAmwlb7padr932u6Mt4nFsD8di/KGAIV5hdfCosA9gph/dKobKy6tsDz9MHqieG
 cJwDJiPNuC7QEncZOBomutmD1FUFgZ6uFI/vtvYlo3hdkt8GAhkgfKQdJiEg9xkKHlvs
 j5/g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793366658; x=1793971458; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Zh0klMc/byD8klEQMo1lKnHHSoxDXyOKSTywb5KwxHQ=;
 b=u181vLHXoo32IofuC5SU/6fLjxxmc6Rp4BBA3rdq/fUAgmd+E3GSTu2eqPw5HhVGTF
 5kVfeSKnXd/F8c/gPzfgWJXKOiWgCoDIlzSk7XZYjQCWwscPTs8TYhEPoZsFwFAApByc
 RHe42wV9jsdwqxiHKsU+837upNxlJUf0RfyQ1qZK4KjQ5fowve91KqDfFbyXJv5kEnfV
 k/aEmGUeWknPZ/4yR1RqKx6AOKOus0tUO5w7PrnHFoPilTf4qWVuCr8SI/e0KHffgKKe
 fSVf4tcinNsFX3PXxj+jWMz5VcTXJQQFUYRZeEmQsUBmJTnozEN/D2e4iiADBWkLvN+v
 4tfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793366658; x=1793971458;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Zh0klMc/byD8klEQMo1lKnHHSoxDXyOKSTywb5KwxHQ=;
 b=oZo6onFhhrlYCxiq8BhoJ2MneQA1GrvDgUZHegKSM808dw8982ncX1AuiLwgE54fxD
 /7ae4khdo6tCGU96lopjbClnYb+q+B4kU0F4zFvMSZBFlOvQzmQwnA3aV5MO1cQu7yV9
 ob9NNVSMQgQE1O7zBPKGd7YbCZV5zv73+p1EvP1YP2P3tmaz1L7xXDr308e4FOPpibDm
 epH5vcbq/pMiMQ08cC+/djQKNKGSytRJ3W8Z99Igz5Y//DS6Yv/cyhxPhsDI8ALAA5EZ
 eM/1PcAMWAUh5pmyTZYoKe8Ls4eZ0xaLLz86pOyLMXSFykCgtnJtCuMxtyIAuoV6m1gW
 hOCg==
X-Forwarded-Encrypted: i=1;
 AKwUvBy45lSOdXcrS0XJz7ST0F7d/vGxPWxzvlUh9aC/gE+VwS8Fu9ZlT91CPRMI0Sj3SEHTNhZGi0bHMQ==@nongnu.org
X-Gm-Message-State: AFq9FYL1Eieb6q+UeZcjFH3NaKMoXusVs+Gb0GSQPtjUJtXN5PNFiW0D
 ehFcNg+WZX/gUXDSq0wAL7L+weNc0PtOsT1pwzbUY7ZusALTfH3T4VpjSPz7RvSg4qvzW2PttNE
 d19OMncPXH+OTuh98qsquCZN17YbO4w1vj5YW8T4oPw==
X-Gm-Gg: AYBFou2oy9slyJAUXpybgDiZcj6J2YWWUm7gfa3ZqOAPJcUMqzU6WN4F63i5is4eS/D
 3TlkujoEycPw+UGuaGPR8tShHYYHckeTe9L+4LEkILQhkkGYvV/+QtK7frizrLB0I0/Ck+F6wEB
 G9b1/MhNPT4iTn3AYlTBMEY9pLrNdIkz5WDbIMWV9lU0Pl0GDkqah5VQWFbK91dxNlfzKP5t4u+
 tbkvqAt3i6BRPmh1HeuO2/OIG3yqd85FZ+Wmr/b9o7tRMTXpOYDzrdI7qh2pdN5KtZv7Beaa3HZ
 QB1FkqIINKGSVtS5ag75XcKWE5wGtjM31IXE4k9QRRUIHoCa1ho2c0Z4JtTWSAYVifdqjCAahAS
 BRpM2/KsuK3HUzcDm5gqlKxji6SfSGylmI3AHCuVFzvKKKjQgO+rUJpqSzRZmKMATUmaUzRlfb/
 0tqh4e5EU8lfXOn4G3frIO
X-Received: by 2002:a05:690c:f8a:b0:8ae:88fb:3e12 with SMTP id
 00721157ae682-8b2b67babf9mr14041797b3.61.1793366657834; Fri, 30 Oct 2026
 06:24:17 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030131406.461599-1-eric.auger@redhat.com>
 <20261030131406.461599-10-eric.auger@redhat.com>
In-Reply-To: <20261030131406.461599-10-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Oct 2026 13:24:06 +0000
X-Gm-Features: AclHuK_NhxH9SQYIqT84fpZntkgUpapM4hWVMvLS1XY2v76ZMswonXdxEnMxK7s
Message-ID: <CAFEAcA9ceuoQOq5EMys1Z9V6CJZkgUB2UuVoBhac+fy_5sc3JA@mail.gmail.com>
Subject: Re: [PATCH v4 for-11.2 09/10] target/arm: Directly store cpu probe
 failure error
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 30 Oct 2026 at 13:15, Eric Auger <eric.auger@redhat.com> wrote:
>
> In case *_arm_host_cpu_features() fails, we currently
> record that state in cpu->host_cpu_probe_failed to later
> report the error on realize().
>
> Replace the boolean by an error handle to allow
> more relevant error reports.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

