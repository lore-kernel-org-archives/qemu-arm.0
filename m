Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9082D6B072
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Jan 2026 15:29:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vlTxJ-0000mb-Uh; Thu, 29 Jan 2026 10:29:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vlTxI-0000ls-OD
 for qemu-arm@nongnu.org; Thu, 29 Jan 2026 10:29:12 -0500
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vlTxH-0006JX-8u
 for qemu-arm@nongnu.org; Thu, 29 Jan 2026 10:29:12 -0500
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-7944693b824so11789977b3.3
 for <qemu-arm@nongnu.org>; Thu, 29 Jan 2026 07:29:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769700550; cv=none;
 d=google.com; s=arc-20240605;
 b=TVoxgejKURgBx4dI8tD4s+DLhfbrNjWch9OKLKOePtbFzhy5z20p0WvQhoQgKzjKZT
 T4iKmX0x9XNk/oy9yEDfgauZY+00Hg8O7hACn1KAGvzclWvG8dyNHZJbExY51MrPjXJ8
 P6o9HFNF901vhtvO8vvgYVfKNpotLFoO89mrnJeYEGNNRTOMBR++oZmDVYOilcF7u2bO
 xGjp0lmS8g1tJuH6DPcUt4/e7ZW5oSx2QIyUhVEe0hIWVrFdOkiuZh5/NbzrpeV1kelq
 z5vB76XE4ZZLjbVk9ofiM6MG2MNQRc1w2913KSH/Sky3pbDs83yURjIfeWRWUpIGB98Q
 djXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=ZBA5Zu9U5fRJlrNmY/yMVMhQUF0W+nyt4RfDpHFCs7A=;
 fh=2JyooDBrL9KNo5azF3EwtM8DvO2dAYKr2r1nFQfLUdk=;
 b=ZCmCXS61s3qT/WFyR0QNvgTiSLtdE/Nib6g/CY5sIKE0Wk54b6Cldhckl+Oi4gR399
 jsJCTYSnGu+iYK6cv3bnR1nZE50AgVj51u7MW/9m8kbePR60zShtDG45wx2t8Pv7xDV3
 hrxm2BXljoqApL7MYGzarU3+Yg6r+eauIKRsW4Q/44N0wm4FL5MmFw4WNk5MOtHbgzyB
 us1RYFxxUnV+bt9QbYaxZOB9AowFM5zVht6eXP7Yh4KuvdG0GFHfn14vHY+v8ozXbxXy
 sgVPPVhWWwCFt0qM2wvceSl++OT3LidjOf2k+S6QxlHOxT2aRZ7YtUWVu2EisfKeGvtT
 diXw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769700550; x=1770305350; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZBA5Zu9U5fRJlrNmY/yMVMhQUF0W+nyt4RfDpHFCs7A=;
 b=igjMDoYIbz7Hb7WkY9QC69pyJ4DirzmKFQStIi0Ri1WS6FIYeDax81+7VfUfsLpsey
 elXw9XFDYNQ7im1nHyfSDr+h/jj0GmDxw45GQCrykAt4ioB3TSYoaCa2ksj9eBvS5fUI
 8gWQqX7qRU6Ck8d2/iHzB0CVCxKBwPHZ5eOLWhx5P4T7MIweOm2lyy4p5DUmoxqntLoo
 lRljcxJ+fLinKuWk+JCGc4C+sHincrei1pAiimoUKi6VlUfWLZqqB1xIcj+IDwMGWhI0
 ZHKF+8r55VIxrZb002xRhRc7mvctlZQdqefu2pTA9z7HO2EVvzDpqs2YBqO42JTQdDqm
 OXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769700550; x=1770305350;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZBA5Zu9U5fRJlrNmY/yMVMhQUF0W+nyt4RfDpHFCs7A=;
 b=QkSRNz7boSHVE1VjsCAzcdnrwbc33QxIY7bRZhGtvRi82Pd/ZmHRn2P/9uQxVSmlag
 18Wg0qS51donJafJv+RbIyaWHWKgB5nDbp2Cc2UgK6ou65NGQtWjfjd1lNGtB4aPisrR
 zvkTMPon8flL1FbcHtUvJvsTbiguf/DMFYmEupqA4IAbYXMnKY2jXr939LVAqO0z8d/a
 l50oL6YiVVoEzjfISyn42H190Qa0xHeiGNZ1e6usBm1ATDgCp273J6j0idoasSMkGsV4
 KD8KPyR2r+JKL6cZAIzCsRjcBIy2jEWagBHMu93ifXEkyNsHV2gKgCNLFvfHeoPj0MHb
 we6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXN3+eQkP895KFUZfLOYwVkQ87DARQk+zVuDTAjU9KyXe7JID+o5Cv8fGGgmhTVIklKKuTxY8qLIw==@nongnu.org
X-Gm-Message-State: AOJu0YxJHSNgwdNH4cmOEhgC6ecpFbJYBMObXR6/R7bWRCLl4DDZLOOZ
 PdQ3mfI70Ehoo1KcXroERZm7nBcVyeEoD/nUQgkTcuAIpYRopbgWBx6n73IMwbRPDo7cQUOKL98
 GhYFfqnaUkxENekB4rRwRITi5LqhJpbJ1Q3Imqqzuog==
X-Gm-Gg: AZuq6aJx3Uy+uiS8dejLHGw8Mf8F0FJaGtHz1luqYYk+rVkq5JfjLntY3qDpi2dsEcG
 0U1zJJHx+OXJQLdDzcxKMx0hnkqOr5s4alSNULgibAXB6vgHesrBV3SDg/0yv5YYLr9Pehwrwu1
 QU/4zUwyDdci+hf66K8g38UGkisZx16HA7QgKDvfB+5qwpYrqLKdbHoJ+X5kYkLet6ZXleVoMSZ
 cHkD032xdLZKLq1NTh4+ATp3NUt/IkVkgZZGBI5LhizM1Grr5zs2IVhGXVSFuxPP3J8BYASyM0Q
 vBJI
X-Received: by 2002:a05:690c:e3ee:b0:794:6fed:9596 with SMTP id
 00721157ae682-7947ac00e59mr73402977b3.39.1769700549808; Thu, 29 Jan 2026
 07:29:09 -0800 (PST)
MIME-Version: 1.0
References: <20260127182805.73212-1-mohamed@unpredictable.fr>
 <20260127182805.73212-14-mohamed@unpredictable.fr>
In-Reply-To: <20260127182805.73212-14-mohamed@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Jan 2026 15:28:58 +0000
X-Gm-Features: AZwV_QiK43RPHfA6TW6CJMG6ld34ywvsRw2H7j_blG9KQWHBXtk6j-uDJe-_3Uc
Message-ID: <CAFEAcA_+o2BRGPjk=++2pkZpN62yPKRhy4sx+7kSvXcee5ofqg@mail.gmail.com>
Subject: Re: [PATCH v18 13/22] whpx: interrupt controller support
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, Zhao Liu <zhao1.liu@intel.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 qemu-arm@nongnu.org, Ani Sinha <anisinha@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Yanan Wang <wangyanan55@huawei.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Pedro Barbuda <pbarbuda@microsoft.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Shannon Zhao <shannon.zhaosl@gmail.com>, Igor Mammedov <imammedo@redhat.com>, 
 Cameron Esfahani <dirty@apple.com>, Alexander Graf <agraf@csgraf.de>,
 Eduardo Habkost <eduardo@habkost.net>, 
 Phil Dennis-Jordan <phil@philjordan.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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

On Tue, 27 Jan 2026 at 18:29, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
>
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>



> @@ -2143,6 +2146,9 @@ static void finalize_msi_controller(VirtMachineState *vms)
>          }
>      }
>      if (vms->msi_controller == VIRT_MSI_CTRL_AUTO) {
> +        if (whpx_enabled() && whpx_irqchip_in_kernel()) {
> +            vms->msi_controller = VIRT_MSI_CTRL_GICV2M;
> +        }

This looks like it ought to be an "else if" or some other
construct so we don't fall through into the logic below --
if we've decided we definitely want a GICV2M we can stop
making decisions about how to set vms->msi_controller.

>          if (vms->gic_version == VIRT_GIC_VERSION_2) {
>              vms->msi_controller = VIRT_MSI_CTRL_GICV2M;
>          }

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

