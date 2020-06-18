Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1468031lfm;
        Thu, 18 Jun 2020 02:47:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzpcxZ9gimThDICOn62MKl2n+j8QL30OvmG7Nfl3LKylCO0Vm2pEUSsc75E5ndAdhVCnkC5
X-Received: by 2002:a25:8b0c:: with SMTP id i12mr4872342ybl.499.1592473671612;
        Thu, 18 Jun 2020 02:47:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592473671; cv=none;
        d=google.com; s=arc-20160816;
        b=VYdukdN8i4hfJ4F9CBY2UHyOqmZDiGVUCJkXypQ9NJfYkKEOISeJzTcd3lc1x6h3iR
         qS9+nx0SJJeVQYVM5ZnrAMBRxkGiYAB/pnM0SyRGVa9tbjHBDpM94biOnsOghBC8yrD+
         iSI2prjglsxegLKWxHOdztif0eXv94aG6/DyJPVMNLPj89q+nTWNSyz385GN7KQ5hJ3Y
         Hpw9W7N0cR96VTYFSOFSEYaZL+ANZRilOdTpJb0IqX835PMdgdJ3t7WgD72VjDDzVFH1
         vfSrwsAmr4QRsRlvcn+t/HjXluINXoSpJEzR2itfOWKNNolAhhz26rJUgEnHcf36KOET
         ZOnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CIucyMeJKaA+LsK2RwWRGVfv22Qaa0LNuHGmMQDCzjI=;
        b=cy5mqJ3pj6dfCU6NtQyIREUXmYTj1rSkRVCwOH5qFHXwysdVdjJ/Qh35e1hDT8bYlj
         85IAV4mNaeEQYQs2nqNjY+MieK/7zd8l8FMKCMc4v4ypgYPLqP+tofoHEo2rts23TZ9R
         6rkm7UscVCv2sNrACUKdzh9jur1P3+kL7vYN2uHMu7hc7TYqD9U8YwiBWNxarO5P4cgY
         0Ic5w5WB37g+v8cpaDLBx0FYJHV8HwZkQVocelzuyzWCKKb6S7ZGWgbJIzofERp3vR0z
         Fkcx42oJa/Gf82zS6GKclyJ0IvvVNoDjIMmvKTl5dCvfc2oZGSvPg3QYiLr57bRbskir
         GorA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MWCBdgb1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 187si2053670yba.204.2020.06.18.02.47.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jun 2020 02:47:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MWCBdgb1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlr9C-0007EX-S3
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 05:47:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlr8v-0007BK-B1
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 05:47:34 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:37178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlr8s-0006Lu-JM
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 05:47:33 -0400
Received: by mail-oi1-x244.google.com with SMTP id a3so4524791oid.4
 for <qemu-arm@nongnu.org>; Thu, 18 Jun 2020 02:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CIucyMeJKaA+LsK2RwWRGVfv22Qaa0LNuHGmMQDCzjI=;
 b=MWCBdgb1lAygK0HbArspSjsmeDe/TjFMSf8mP2pHZ6RC5NkfLHtdzJ0nxyqnVYJrTm
 aUH4GcggsPR3wOc31ejHVJ8TYeY18af/TOil0IssvG8IarIZG5jb9+8HkR6KLhLqlsZh
 AL4XniBa0WK6ajza0hNTYrkA/TWnuqvVBI04JVxL0uCZOMRVQ3f4n64Zn6H0vnu5ppgX
 vvJ/JQqovv/A5F2aRLGfL4v5Ly9GUfybqGI4Gert8U+yVpv8snjsIDuWeH/t3KWgkxin
 EMC7SR736ssAZvEGKXenttb5u6LPg82i4jh9i07GSP3iNRYT96Q1t6lOfK8tOQm8QQYK
 4J8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CIucyMeJKaA+LsK2RwWRGVfv22Qaa0LNuHGmMQDCzjI=;
 b=P1BuwxMJBlBDBANRwSpwv5ZtrNM2ylDcZuDJKplQVtyvvNmCEy2gZc+IdwdaK9XfT2
 uTcQL6po6g/Bn/6GrSAKqEYPC8xsGbCp+TFV39jzSOGD7GsnAGwzsfxI7ZObKe4RFAD/
 V5efz4/Cr6RvY5sDLCbe+HZdjbw6RYXaE21T475UFdRh5eKjOG8qO+TrYwL4l77iTNfT
 PcB5UU8+JKYHbCCUY0isg8w/bvWInLTJAMHBP+Ex21k1O6HzMEj5HS2WtkoJp54Lcm/T
 wtOvHdL/JTIsrfa8gv3Z4z47DK/7UdAfu1cJoWX6apyqdCHVbcZxq4SLV1Ht6mKLrArA
 T/xQ==
X-Gm-Message-State: AOAM5322lDVxq0zA6YPeWX3YhgDDAGG+VzHEFKn9Z4bPd8QN2KtWGX+h
 rMhlLItX8vHM12lpGtVXtL9neRQ9Esyc5sUhbbqavg==
X-Received: by 2002:aca:568c:: with SMTP id k134mr2061342oib.48.1592473648297; 
 Thu, 18 Jun 2020 02:47:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200616140803.25515-1-drjones@redhat.com>
In-Reply-To: <20200616140803.25515-1-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Jun 2020 10:47:17 +0100
Message-ID: <CAFEAcA9hpF6CSs=XGxopeVH0kLso5t6SbBar5cRy7Uk3wTxLXQ@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: Add 5.0 HW compat props
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x244.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Cornelia Huck <cohuck@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fMkYozKyyt5P

On Tue, 16 Jun 2020 at 15:08, Andrew Jones <drjones@redhat.com> wrote:
>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  hw/arm/virt.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index caceb1e4a05f..8b6e6aa7b138 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2375,6 +2375,7 @@ DEFINE_VIRT_MACHINE_AS_LATEST(5, 1)
>  static void virt_machine_5_0_options(MachineClass *mc)
>  {
>      virt_machine_5_1_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_5_0, hw_compat_5_0_len);
>  }
>  DEFINE_VIRT_MACHINE(5, 0)



Applied to target-arm.next, thanks.

-- PMM
