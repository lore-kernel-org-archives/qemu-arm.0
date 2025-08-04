Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58FE7C87FCB
	for <qemu-arm@archiver.kernel.org>; Mon,  4 Aug 2025 22:16:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uj3Ta-0004Vi-Iv; Mon, 04 Aug 2025 18:16:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uj3TP-0004HQ-Jg
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 18:16:04 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uj3TN-0005EZ-MR
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 18:16:03 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-76bc5e68e26so4920561b3a.0
 for <qemu-arm@nongnu.org>; Mon, 04 Aug 2025 15:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754345760; x=1754950560; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FZdfH+6Sxbu1bsMX4Kvr/l+nPMXRzMZXajPSIE2P9lQ=;
 b=RNSipVs9gDUw81mJ2Yyyo53t2sNXvF/6+tYbuwwXepY8dqkkk0pOgT/5ZEmWdzjcvO
 W2CgDENjRLX5XXdd7CAX/JD0f866EfsjqgmX0flzf9vdz5uljRd/DO6T2Rsetjv4ScsS
 +U0krzKaSjIADk2oJBq3PjxVs6/WhSmBIPrKOyIXm7UfJK8KiW4vcT8V+s9cglJvJYIb
 fhberkoalJqFNPRYKbaPQ4i6GEZkodr09j5lCoLEp82V670Af+cmDR8Za5eOTLlFD9iM
 YFOF1KRx5e25yhz357XOtRr4mNKvrSAUY/i6BiAazhP6Lvju1DJGwIqxTvDNHo5FARzp
 G+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754345760; x=1754950560;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FZdfH+6Sxbu1bsMX4Kvr/l+nPMXRzMZXajPSIE2P9lQ=;
 b=mdzeh5/hg1AotbtKhk6i70GDSKkUGFifsjyjCr5eshlvrJ9HFJR+wRaKBZSuia/Ywt
 C+sWHfg+wmdT4sDeU62LTOlZ5QH3WiGd7Nir37lMZd6RDXS9GHhEfzJN45skPidRchsy
 fAhIx2rwvIWyOBmqY+/JZYCNx+yBD6mlTgcN1JfxEsJX+k6pcaztMseTRytejHgzc4n/
 yokXBXN7QmhhrbTezVGUq9PpXTkmZ6ECIaiTv87VOa5+cY6GZGZbwaBYh0PuD7B1Jl/p
 JLwkR7nwvcqRHVTkbfXO0tugUhAhBl8MWAkgTicEnjX9iogdnWdRsxkHkIEiUAfXIyoT
 FhGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7i9ODMvbk1dY5uU1BB/yaD1oJKh3TN3+8Ga42RZw4mjB3Tg11pWFAxViXaOfD57T5+Xkd4z/veQ==@nongnu.org
X-Gm-Message-State: AOJu0YwGso5gdTuFaNt0DF8N2tyHLzmi2peVPbu550GQmLp1IyGLGKGO
 2SgppJ+niyigySvITl6/fZNHej9Ozom7ux5seuZ2LcR6pRxygmj7dgqsKajC1fF0g2k=
X-Gm-Gg: ASbGnct6oUGhcK3mMEs3dh/T1Pb8QwzSpEWymnXCbVycT08tUnlRN1RwtWCmHuEM1sA
 g6O3eehu4b2PD5h0UUgdZYTdL6/3EbMd+SqhwwEVIb9hfOFn9nXvLDloQSui7ot5mC3ouoQzEUF
 tf8veW2heuNpG5koOGVNSIDKz5kRqjAqd4bPZh3zlojrIBQ2jmgURoDYYYGX1AE2tYhUoCX9pSO
 5smbIfkIRg6SuLM8KMJa3mLDyK4ObZo/8PtpKSM9XQtZ6i+L7abCrFwm14rLY/XQi7m2zp+8HRr
 W2+cS8B6baVIWskLf0gukVuEnb5SwtxP1hUy5oKld5ZixsgNPwN5tudLTuC5qcp/BHlNEzC7HMz
 iDGXIvN1NN1PgECs4+loJzrpNyz2TMXXwFGY=
X-Google-Smtp-Source: AGHT+IFaeXXs0iqjcnaWnO4u4TXN+BXliP4Ucck6C04BwFxe5lAqbB5KkIvvc18PtYNUgm6I9+KWuQ==
X-Received: by 2002:a05:6a20:9389:b0:240:1a3a:d7ec with SMTP id
 adf61e73a8af0-2401a3ada6emr3676216637.4.1754345759646; 
 Mon, 04 Aug 2025 15:15:59 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bcce6f474sm11261399b3a.4.2025.08.04.15.15.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 15:15:59 -0700 (PDT)
Message-ID: <8fc78a75-dbde-47c5-b382-34d90b034052@linaro.org>
Date: Mon, 4 Aug 2025 15:15:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/17] whpx: add arm64 support
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>, Ani Sinha <anisinha@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Roman Bolshakov
 <rbolshakov@ddn.com>, Igor Mammedov <imammedo@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Mads Ynddal <mads@ynddal.dk>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Zhao Liu <zhao1.liu@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
References: <20250804142326.72947-1-mohamed@unpredictable.fr>
 <20250804142326.72947-10-mohamed@unpredictable.fr>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250804142326.72947-10-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x433.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 8/4/25 7:23 AM, Mohamed Mediouni wrote:
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   accel/whpx/whpx-common.c    |   1 +
>   meson.build                 |  21 +-
>   target/arm/meson.build      |   1 +
>   target/arm/whpx/meson.build |   3 +
>   target/arm/whpx/whpx-all.c  | 845 ++++++++++++++++++++++++++++++++++++
>   5 files changed, 864 insertions(+), 7 deletions(-)
>   create mode 100644 target/arm/whpx/meson.build
>   create mode 100644 target/arm/whpx/whpx-all.c
> 

...

> +        case WHvRunVpExitReasonCanceled:
> +            cpu->exception_index = EXCP_INTERRUPT;
> +            ret = 1;
> +            break;
> +        case WHvRunVpExitReasonArm64Reset:
> +            if (vcpu->exit_ctx.Arm64Reset.ResetType == WHvArm64ResetTypePowerOff) {
> +                qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
> +            } else if (vcpu->exit_ctx.Arm64Reset.ResetType == WHvArm64ResetTypeReboot) {
> +                qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
> +            } else {
> +                abort();

Just a nit about style: would be better to use a switch (as this is a 
propert enum), and g_assert_not_reached() for default case..

---------------

The rest of the code is pretty clear and straightforward, congrats.

For other reviewers, most of the constants and functions used can be 
found here:
https://github.com/MicrosoftDocs/Virtualization-Documentation/blob/main/virtualization/api/hypervisor-platform/headers/WinHvPlatformDefs.h

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

Thanks,
Pierrick

