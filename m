Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC46D10BA434
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 23:38:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w6Gl2-0002ji-Fv; Fri, 27 Mar 2026 19:38:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w6Gl0-0002jQ-Pd
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 19:38:26 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w6Gkz-0000Mr-7V
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 19:38:26 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-486ff3a0fc1so25030875e9.2
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 16:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774654704; x=1775259504; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/4C6T8Bvc84JSNJ9moUVxE6PYm+POpf05K2xJHhaPqg=;
 b=hczXWAvsrK/CAECOjxqWqUdxCosiMO6gM+/HIzURri47uwwO4uIlyrUBXE5i7AzT0V
 U+WolM5PL2Z94m9KfXl3kS+FhJ25rEAV2Vo9BocK9svdsW2VTr/XIAL/Fl0rno6eh2EZ
 Hol7LLESLZzf6YUTNFcRY5nN9p+7iCc0kXvOrpTgKXGRUItM/DRcj8NKHp7Q2GBA4w0A
 8Z2CbmZZxcmOiOp0hD/IfZlMvk8upWyub72lR6usDsw7MVyP1cPB2fjhYwVYstN+ntJe
 YXvETf2jkVfVBkzjxDLYiiFT/ahPIT3bCOlBhSriECINE0k8GYIr6QJ5svhWYSm1KrdO
 91dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774654704; x=1775259504;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/4C6T8Bvc84JSNJ9moUVxE6PYm+POpf05K2xJHhaPqg=;
 b=MxaJNXuQfmo+xN5KSZGQEHZCi5j5qmc+TvckAPtPX4MbuBT4qvXYy7z0N9BAYwPaw6
 VaIJgCvOuy2ffMVvmcnOuVhbVfjHk5py5bc0W6P0BexFUQruQ9VPcBx6OC6eHLok1H7+
 WmLx+AW5DX+L+ytQyySQK/U7xkpFo2ftmHG+HATT+YVDfTlMVhSHltw3PEBkSAVqOQ50
 q+Kcgob7bcZTk0uMgivBDioi8BSc2c2OPVKu+L61zjvO7CypCIXsKgpk61c2jKeh3RSk
 MhMDbiBrpI0OW0K9ca9ughu/RKY78BAWCfE2kHR+r8RZ00Z+iiKQrwcLYNDb2kZmK4Pt
 RpjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2rF7Ud4iCTxT46Bets5aX3XtZJAT6L1aSBYnPWO7CcMKLqXMN44hMHGdq5G7OM95E/OJZ3H1Y8w==@nongnu.org
X-Gm-Message-State: AOJu0YwxNr0I6eJy1Wmrg8qZXIPfK4eMLbZTfr+w+Y9hwVAYjGuwMs0U
 EajnGhMhMnm/VB4ZZnDl5CrME+kxDvIomwBtV7G+Kcor0TLzLnN5b4dr4DdnWrWcFCQ=
X-Gm-Gg: ATEYQzxD1cNG6cWaKgUVu5/zjum9eYhIvsaRNG7IsXGH18yQ/ohDiyrlqvbJsrf51aT
 wUqHC3TfzuvLIH3d+S/Q5H/dFXHj/u3yhCw+Gffw9CrwvS3PazwKiBPD6ruTzUarNu5H0+rUTYm
 p7FtVCIjQiXhU5cpaCMmC1JI1W+xF2Alp/IK0TwJ9us7CEZ4KPGyQtwCu6yoFEJuV6UJxBJ5lCL
 G4GcYn4yI8saCpKsGfU+alzeiglJyfjhzPof1D2nxfytb86p7bdLuERU7O1PUBJzBjV64ooFxZB
 8dK1aI0OaiqXaBbB2VROL2nOE3vOHvIbrUC0HN9VkAYuI5+2zR1lPYs3/lY8v+oRKzZyjnegrCd
 Y6QCWvs9WRhpCn2e8silzYFzdw/ucSGF78a4Mz94wNfHRvdphyfVFqAVx3FWpJ5QI3GzeFaiAVY
 cqQpAkmZd2HQ96tghCf1GPCh15fMaFY7JBdm7ic90d6E8/DyxKGu4oQiwAK4d43V5PosDJ0gjN
X-Received: by 2002:a05:600c:3f0a:b0:485:4eaf:eb54 with SMTP id
 5b1f17b1804b1-48727ec733dmr66913935e9.20.1774654703688; 
 Fri, 27 Mar 2026 16:38:23 -0700 (PDT)
Received: from [10.202.147.66] (147.149.216.82.rev.sfr.net. [82.216.149.147])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43cf1db08e6sm2981651f8f.0.2026.03.27.16.38.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Mar 2026 16:38:22 -0700 (PDT)
Message-ID: <262c9195-b189-4354-8c2b-a2ece3dcc801@linaro.org>
Date: Sat, 28 Mar 2026 00:38:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] hw/acpi/tpm: parameterize PPI base address in
 tpm_build_ppi_acpi
Content-Language: en-US
To: Mohammadfaiz Bawa <mbawa@redhat.com>, qemu-devel@nongnu.org
Cc: stefanb@linux.vnet.ibm.com, pierrick.bouvier@linaro.org,
 "Michael S . Tsirkin" <mst@redhat.com>, imammedo@redhat.com,
 anisinha@redhat.com, peter.maydell@linaro.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, mohamed@unpredictable.fr,
 Stefan Berger <stefanb@linux.ibm.com>
References: <20260327173209.148180-1-mbawa@redhat.com>
 <20260327173209.148180-3-mbawa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260327173209.148180-3-mbawa@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

On 27/3/26 18:32, Mohammadfaiz Bawa wrote:
> Add a ppi_base parameter to tpm_build_ppi_acpi() instead of
> hardcoding TPM_PPI_ADDR_BASE. This prepares for ARM64 support where
> PPI memory is dynamically allocated by the platform bus and the
> address is not known at compile time.
> 
> Update the x86 callers (ISA TIS and CRB) to pass TPM_PPI_ADDR_BASE
> explicitly. No behavioral change.
> 
> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
> Signed-off-by: Mohammadfaiz Bawa <mbawa@redhat.com>
> ---
>   hw/acpi/tpm.c         | 8 ++++----
>   hw/i386/acpi-build.c  | 2 +-
>   hw/tpm/tpm_tis_isa.c  | 2 +-
>   include/hw/acpi/tpm.h | 3 ++-
>   4 files changed, 8 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

