Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1029735lfc;
        Wed, 26 Aug 2020 12:36:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMF263h8Vafi0gy42dePPJXx/kFudqvDBIb+DN5s7PO0gbSQcxeXeVIlvTHtzmQG3IrB5g
X-Received: by 2002:a25:c6c7:: with SMTP id k190mr22183064ybf.166.1598470593584;
        Wed, 26 Aug 2020 12:36:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598470593; cv=none;
        d=google.com; s=arc-20160816;
        b=OI21l/M8vZZrlnlbT3oZwQwmeuX4dPjbp1pcTv2l07273QYdoV2TMJD04HXr/I/b6H
         IUYfH4k9OuK/UCceKrZGSUp93aLJZ7Boo3kl0paJGyogruLcJqgajrGPW6tpYkdG9rgQ
         eWBF1QpwOEygyqPKaTytKPX4c3cxUYLkn7KWTQMdq7aw2/4T2DUg23wgwlqUj3QbGiUb
         z/H9Rg/5Da5ZVS4Vq907hylIfQ7EpxTQSJYnKTH3NB88E5x90G8mD9WW7T1YpjSNdhrG
         V5Ejj5yLrQEuJnSk06kfvgYcIYItup+qh9KnWetj+4cyOOBU4+KOOHF07U3EUQav1f/W
         T1qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AzSIttkuRPeIHlpJlGefUgU+fioPk+GRw4KlyI8Q9Sg=;
        b=Go+2k8kV/iDvdR15O3oCnsmBokQLKQ5PD5MTP6HAvCTplzb7CptmlOyNUjeH7tZO5b
         GiZ0cZLTIUCBMsvDkQMl5mtjD95HdL423F4zakXFzwcV0fTUhQ/cylhfvPVex3eJLDlh
         KR9+YQnUSSjAXGo5at4b6GxGul0kXxFCX2dXufVZsDTFpCiIW8r6ns8UICn/uVaU0ZD7
         H2UUIEcEiUwpoVFvkZLxfMCR6wMBr3R8R7kyZO4Up2FFNuStZ6w8IJEiUuYy51bIxvg9
         KdsJinmtOG4aW16Q4cawqqXveKEJ6sWtVKgLjItlhyO/txXWXMShMz4OKhBZ6bkHRcXW
         mqsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iwqXNzke;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o81si18737ybc.465.2020.08.26.12.36.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Aug 2020 12:36:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iwqXNzke;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:37256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kB1Dk-0001F1-UZ
	for alex.bennee@linaro.org; Wed, 26 Aug 2020 15:36:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kB1Dd-0001EM-4S; Wed, 26 Aug 2020 15:36:25 -0400
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141]:42883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kB1Db-0007qC-IH; Wed, 26 Aug 2020 15:36:24 -0400
Received: by mail-il1-x141.google.com with SMTP id t13so2822761ile.9;
 Wed, 26 Aug 2020 12:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AzSIttkuRPeIHlpJlGefUgU+fioPk+GRw4KlyI8Q9Sg=;
 b=iwqXNzke9h955624DayAmXC3DM2ErlT3++u7RHtnDGevwntuh+r76cL7u1RdvOtKrO
 Z1e0+VzzsgDJ3DiNdZ7UPuHEheVC4avq52hkgMKXijhQMhH0FjYmfOhKy6GJu8tIb5Eu
 mVFhTZSdE3wk23KEmDqcp0msQOaCzNHEU4Tlb06yHGpj6ULRFfg+JxYMWXrKJdxQ4tLU
 Dks6lAd9xVItMmNOD7z+q/JGnEMng5H8HqtALdxe4l2MGswN2kEUFsZhnRyqKcl8Tehi
 mZn1cZeQpbTRpe4Jumn3/zcYxLbruRsUe7NS6AbQo2KysjYWnHe5aG68TFfQALAhy+nE
 8XGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AzSIttkuRPeIHlpJlGefUgU+fioPk+GRw4KlyI8Q9Sg=;
 b=Zw7WN9J1DBhJVr/Jtxg1MfcumPDO+MKp3ziKRMKki09TpFMpGaTUUCQ3/L+tAQBGVz
 NoIUVUl9UU/Nr8gLaMdVxyMmARvzV8L4XBG4r+2Sgsi6IwMZZbrpPT1FNHg1Yg+tYJha
 SgNhsDGnYd2bcwTgrB/mNPkOHpFxYJLlMzOj01xLdcYjrZd+2O/IQYA8pMuyiKKw59Nv
 4gBZppMtDONiWA7mcO1QyNoQ6Kit010kBvsG9pYuwcY4TCjO85Z6Y39pV1ns01Rf0VEQ
 HCpjeeXqOVjiCsiTN0sNW6wn/9M0d+IrQLy821F99Tp3apWopZsWsT4mgyuzy9WcG7lm
 w3fg==
X-Gm-Message-State: AOAM533lAp/BIr5Ijd7ASxpah/tm9vAhkLePmZK1zpojFshT8W5cPbgQ
 xOy0Ip1lhQxf3FEo+EKaJsNKfJo8QJXLbGgV9sA=
X-Received: by 2002:a92:c7d4:: with SMTP id g20mr14760623ilk.40.1598470581921; 
 Wed, 26 Aug 2020 12:36:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200826184334.4120620-1-ehabkost@redhat.com>
 <20200826184334.4120620-6-ehabkost@redhat.com>
In-Reply-To: <20200826184334.4120620-6-ehabkost@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 26 Aug 2020 12:25:36 -0700
Message-ID: <CAKmqyKPNo3h9NY6QsFnpXDrK5tZTJDjAyDMugqPZEeeYfL9B2A@mail.gmail.com>
Subject: Re: [PATCH 5/8] xlnx-zcu102: Use TYPE_ZCU102_MACHINE constant
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::141;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x141.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mwQZkxRn3C1J

On Wed, Aug 26, 2020 at 11:47 AM Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> This will make future conversion to use OBJECT_DECLARE* easier.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Cc: Alistair Francis <alistair@alistair23.me>
> Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-devel@nongnu.org
> ---
>  hw/arm/xlnx-zcu102.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
> index 5997262459..672d9d4bd1 100644
> --- a/hw/arm/xlnx-zcu102.c
> +++ b/hw/arm/xlnx-zcu102.c
> @@ -238,7 +238,7 @@ static void xlnx_zcu102_machine_class_init(ObjectClass *oc, void *data)
>  }
>
>  static const TypeInfo xlnx_zcu102_machine_init_typeinfo = {
> -    .name       = MACHINE_TYPE_NAME("xlnx-zcu102"),
> +    .name       = TYPE_ZCU102_MACHINE,
>      .parent     = TYPE_MACHINE,
>      .class_init = xlnx_zcu102_machine_class_init,
>      .instance_init = xlnx_zcu102_machine_instance_init,
> --
> 2.26.2
>
>
