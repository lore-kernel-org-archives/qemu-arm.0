Received: by 2002:a17:906:3750:b0:a44:3ba0:e9d1 with SMTP id e16csp408723ejc;
        Tue, 5 Mar 2024 08:46:55 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXArN4DJKrRHIpwkT7sM/fiaWGycXUVpchQuP+eJJHMtMN2Pkgm0MbsmiMWvfDlN8SBi3ZLBl175JCD0t44T6DvQtF8ek67
X-Google-Smtp-Source: AGHT+IHOBt4vqN+AMmZa6j3P4/KrAk5rm1MvOIGmFMzMOs4VaBjVzSUxmAt+1j9uzLT3p5GG8Upu
X-Received: by 2002:a05:6808:198a:b0:3c2:eb7:ce6d with SMTP id bj10-20020a056808198a00b003c20eb7ce6dmr2989417oib.40.1709657214887;
        Tue, 05 Mar 2024 08:46:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709657214; cv=none;
        d=google.com; s=arc-20160816;
        b=O0/1UWQe9oohzY3v9vbzhXwO2rtYwMbA2BD1Zxm4EWSERVbssY4wAQ0HW9jB4RxlLd
         hbb0KkSmjS6WPEHt0+Pj8OIO04i3q3IdQTsPZ2OJox/zfHalWQ4d81oFvBBi9qC9TRaY
         lJhYsIkErRFxfAK/aMzV/N3eNVv6Fal3kfe9XozroImNz+Uvf/31f6DiwrMGmz62vdwy
         Up57uCSPoD1dlB+Aw0MEbzMhXJlSP4RdueYTXsaytp3gt/S4MresvT1jbOr6i5wkN61Z
         Mw/dTLCBu7HFoWC923BukBHlGBN8I3gdx0XJetdA/QiWRNmJTGkddBnqw3a8+3Yi4Jt8
         DO6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=7vJDaJYIc9kHreCaL1G9cmXattiAUJSOOZuWUD8PMjQ=;
        fh=nxJ3xnYi9kpMNZI+/aZ5Yfcl35eKtrb2pBRudq1VMbU=;
        b=I5T3TwqzsKUI/ARclczIzivWoz8UvLKFjDWTAk0bB8WR2qc7Ayr2sBiYcLWiqsgrAI
         HL3ySX9MHdhtbSEBkQwRrTXrv28ivrct6paW4XzdzJsaLYyfrZWdPE4vSD7JcaRVnodw
         ZO6lK8RhLQewsFrLxOaq0pYVRBWXTBQ9+i+BhR4QKObpHdnW86WJ2EP1lDxLDdU6ZBIM
         3zHU9F8G2MJbh3Q+T4u2j6WmqTjCXgCLIWgcLU4oYm5LkPBgtc0Q4XjeGBKgNzO+h2NJ
         5SQzGYLngZjfgTnXdVC1iuRUZYkgNMhGKoDzVD9NVoEeSs9hogGtUghHqEfL9m61aNts
         L+Cw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MNN49r2Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o12-20020ac85a4c000000b0042efc3fcb28si2626613qta.58.2024.03.05.08.46.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Mar 2024 08:46:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MNN49r2Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhXwB-0004TH-OB; Tue, 05 Mar 2024 11:46:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rhXw2-0004LQ-UH
 for qemu-arm@nongnu.org; Tue, 05 Mar 2024 11:46:35 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rhXw1-0001dm-Af
 for qemu-arm@nongnu.org; Tue, 05 Mar 2024 11:46:34 -0500
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-56694fdec74so6539628a12.1
 for <qemu-arm@nongnu.org>; Tue, 05 Mar 2024 08:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709657191; x=1710261991; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7vJDaJYIc9kHreCaL1G9cmXattiAUJSOOZuWUD8PMjQ=;
 b=MNN49r2Z1qClHyALQWOzm/tQWtVyWebzNwnb1vQiwoFRcB6i+5N4kjQf0VPRI3lefv
 cZrqmNtGWlKc7PVOxabKIZsx6Sd6iRoYOkvM4UopHgnu6qF/iCBMwun2hOnK1Ic7EjU+
 18zQIpSIAUOt0dOD0l36RGED2ELmVrw2IDwuniQgXmnRsb25kxzCDT4c0W5mT4rozUdv
 oUJmEgaiogUBXQvYF0NhygkIpEpdRS1fTq1nB1WVGYvMO0KA6QYen2oCcqbmfyRAdsgx
 bIleiNtcndAsaxWZ1ky0XIVuSbLBZCsvBTxbRd/DxMaPabAx43iRU5+CWwcjvxKW2K1Z
 ekww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709657191; x=1710261991;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7vJDaJYIc9kHreCaL1G9cmXattiAUJSOOZuWUD8PMjQ=;
 b=TUuKKxeL15CxuCVD4bP4/poYbQlmBJ8r6GGt6Xobzdf8B3D3DqLlGM13nZag5eD5PD
 ZSyxKZ/45t/ElKju8XSvOBvijihv3dGjdbYxROOHFJi5tD9eXZcrdgQFds7E1j/U/iku
 wtmXRHi38C3WiKH3LOFIymhRVyXnqffTztB2rUO5JvAL6KYDlyjK3y434HVZxqBWzAQ0
 ouNKe/GzMKaWNMGd9IrVk1lpHt7BGYiCgoSiSWMOG19G5sT7tEA2/FJHtSB4J+VyD4d7
 YZBJnwHT6z9Sys7CegmiRjxaD2AT9hEnT/yaO8oVY//hvJbduTfYDh6atMtQYGk5b3IU
 iI1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCULNf6/2HwoDlbDFHh4XoXVItVpuat/qG2swQJrzkmov0Kf4pK/X0m7vsS4hrBEYWFe9arQkZTeiJKRS7sq2nXgNvkK
X-Gm-Message-State: AOJu0Yy5/MOLLfz5tt+LnOmHptUgd8LALeDKxUkftwSGjP3zNtzR9dbM
 xV5aCgmIBgdlCWxCmNYgMp/KqAc68E94tzDyB6viYc/WHnLTqWNcUa7vkI2cKr1kICkMQoqQvoM
 mUNYqBolivM9rxg9vV7wYnYkmx3tE7zRKPL1oNg==
X-Received: by 2002:a05:6402:22a6:b0:566:fc25:5627 with SMTP id
 cx6-20020a05640222a600b00566fc255627mr6174293edb.41.1709657191367; Tue, 05
 Mar 2024 08:46:31 -0800 (PST)
MIME-Version: 1.0
References: <20240209160039.677865-1-eric.auger@redhat.com>
 <20240209160039.677865-3-eric.auger@redhat.com>
In-Reply-To: <20240209160039.677865-3-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Mar 2024 16:46:19 +0000
Message-ID: <CAFEAcA-yLbwPyUxQy2s0CGwcE1z04WQd+EX0xmrvhUepfPR5ZQ@mail.gmail.com>
Subject: Re: [RFC v2 2/5] hw/arm: Allow setting KVM vGIC maintenance IRQ
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 miguel.luis@oracle.com, haibo.xu@linaro.org, richard.henderson@linaro.org, 
 maz@kernel.org, gkulkarni@amperecomputing.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: kA2y1S7SrW7v

On Fri, 9 Feb 2024 at 16:00, Eric Auger <eric.auger@redhat.com> wrote:
>
> From: Haibo Xu <haibo.xu@linaro.org>
>
> Allow virt arm machine to set the intid for the KVM GIC maintenance
> interrupt.
>
> Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
> Signed-off-by: Miguel Luis <miguel.luis@oracle.com>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>
> ---
> v1 -> v2:
> - [Miguel] replaced the has_virt_extensions by the maintenance irq
>   intid property. [Eric] restored kvm_device_check_attr and
>   kvm_device_access standard usage and conditionally call those
>   if the prop is set

This seems reasonable, but it's not the same way we opted to
handle telling the kernel the IRQ number for the PMU interrupt
(where we use kvm_arm_pmu_set_irq()). I guess we have to do
it this way because it's a device attr so we need to set it
in gic realize, though?

By the way, does the kernel automatically complain and fail
if we try to enable nested-virt with a GICv2 or with a
userspace GIC, or do we need to catch and produce error
messages for those (invalid) combinations ourselves?

thanks
-- PMM
