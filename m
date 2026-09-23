Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A08C98304
	for <qemu-arm@archiver.kernel.org>; Wed, 23 Sep 2026 16:22:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x9PjY-0000si-S3; Wed, 23 Sep 2026 12:22:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1x9PjX-0000r8-EI
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 12:22:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1x9PjV-0004LY-UD
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 12:22:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790180529;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H4D47+Kf84D/M5AvyLwBNOHI4bu1uWl4MXTV5Y9W2XM=;
 b=d+DfsAJxL6u7jVIJ/YV0VM+gpv6bRb1BobKQga1d1GB3ybNAwKnXo89zWBwUk7iEUxz0KL
 pcO1mcxxDlJ/kNyV2asrEPoXb8HD0X7dmyx0U6f1EukOAEGn4Vsm2EFdUNzB2fUGJvw/tB
 xC4z8DZhqJImTBLQjyUg30KWgH1tUcQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-wJjwclpgORinMZNiaiNzqA-1; Wed, 23 Sep 2026 12:22:05 -0400
X-MC-Unique: wJjwclpgORinMZNiaiNzqA-1
X-Mimecast-MFC-AGG-ID: wJjwclpgORinMZNiaiNzqA_1790180525
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-49e6862e924so8234295e9.0
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 09:22:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790180524; x=1790785324;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=H4D47+Kf84D/M5AvyLwBNOHI4bu1uWl4MXTV5Y9W2XM=;
 b=HenlQye6CunqHDUX6gUVxgM6hJ+6mjAyxujFS2j8SQYtTDdg4u1977Ajikeu5R8T4m
 G2K9z1IkTSGy8S+nFnkb/dlWA9RZux9KSBQZQBr17g0jwGCEKstE+C5g7X0xccIWczIE
 Q43BgxOK+HBxdrfXe2vSP7uqYOqNC7bQfBgYzAxPZE90EEWBH+muyYLwky6WXfwjlxFJ
 sxiDxACfde5M4JYoX82AwNU2rT8o+2etcOdJuCR2mA+nCgbWjmdeZDBxYDMV7JuBPdgQ
 2hbRj2JacxAa1medSVE00toeG41/OGNyrbdLhoWhcxlTvv3lEalLzkUpKeQ7YzheUBgi
 NGgA==
X-Forwarded-Encrypted: i=1;
 AKwUvBw6uLgQxMorwxtJiPstuWl+I1+CqmugolUERtV4Uc+yiaXG3gcYJrYPFuoTVBZ0JqL5JxKP2IpaCg==@nongnu.org
X-Gm-Message-State: AFuF++nhOEG3k+RrgJ1rp8q/Yqqrhb+yxQpTb6rkGNhuiMdZ5jgaFCn3
 +uqRwJW663UUFEQPKh4w+KQQzLvlKuz2/fP5ImyRjuAPayvu0utjDPOfLM9AQfEnvRteCIq7KtS
 dhJ52pFnndwFmPUZgmajTIQSFixpw+Eezjonw8FO6bcXysQN9KXu7Rg==
X-Gm-Gg: AYBFou206FxCyg0dbY+wQV1YuYUX064FOw1qvik193d7cwfOYn/wjCqrPH86NfkCc4B
 NK9Fi15XK4nJ1dtdULxRL4uJ/i4rkerL0/F/wpbMoSYHvYu0BxftjCBVnciW0rnY5gFZ3GXul3X
 bLQMIxBX1bk97IbAZO9coW4mu1cl9QcqZioQXxs5XgZdbBEJX45sFdJYZ/FA98heVwWvZbCa/bl
 ZjyOxCRoGAWNDvAcegDSk+r//6/ewmJJKuk8veEyigw/fZSFd4YtT62mzOuo3uTcV71WKF87eJT
 HGCUK1tItV3J96Et4hGqEOtPjg04eHOzysarvwUJW3Cm1rPD8bOrHHj+GTKKSBrBy5fLtJTgqHV
 H8CSorH3LLVZRIAidjSxYlayl+5qOYuaGdCj2t3EB5ZY/AtBL
X-Received: by 2002:a05:600c:1f8c:b0:49c:fc6e:a3d2 with SMTP id
 5b1f17b1804b1-49fdf12f2b5mr49459745e9.17.1790180524562; 
 Wed, 23 Sep 2026 09:22:04 -0700 (PDT)
X-Received: by 2002:a05:600c:1f8c:b0:49c:fc6e:a3d2 with SMTP id
 5b1f17b1804b1-49fdf12f2b5mr49459355e9.17.1790180524146; 
 Wed, 23 Sep 2026 09:22:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fde18555bsm91240255e9.2.2026.09.23.09.22.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Sep 2026 09:22:03 -0700 (PDT)
Message-ID: <59aff568-9101-4f0a-ae62-61a32b8c1935@redhat.com>
Date: Wed, 23 Sep 2026 18:22:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 01/25] target/arm: expose SYSREG_ props for
 REVIDR_EL1 and AIDR_EL1
To: Khushit Shah <khushit.shah@nutanix.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvmarm@lists.linux.dev
Cc: cohuck@redhat.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com,
 gshan@redhat.com, skolothumtho@nvidia.com, sebott@redhat.com,
 armbru@redhat.com, philmd@linaro.org, yangjinqian1@huawei.com,
 shaju.abraham@nutanix.com, mark.caveayland@nutanix.com,
 ping@khushitshah.com, sandesh.patel@nutanix.com
References: <20260921123249.1708067-1-khushit.shah@nutanix.com>
 <20260921123249.1708067-2-khushit.shah@nutanix.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260921123249.1708067-2-khushit.shah@nutanix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NESN0v4jLc5-fSoJFCe5tg03Le0PEE8i__muSJAY3jE_1790180525
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_PASS=-0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Khushit,

On 9/21/26 2:32 PM, Khushit Shah wrote:
> REVIDR_EL1 and AIDR_EL1 are implementation-defined and have no named
> fields in Registers.json.
>
> Emit dummy VAL fields covering the full register for these registers
> in scripts/update-aarch64-cpu-sysreg-properties.py, then remove the
> special case for these in kvm_arm_expose_idreg_properties(), exposing
> them as SYSREG_ props.
>
> Signed-off-by: Khushit Shah <khushit.shah@nutanix.com>
> ---
>  scripts/update-aarch64-cpu-sysreg-properties.py |  9 +++++++++
>  target/arm/cpu-idregs.h.inc                     |  2 ++
>  target/arm/kvm.c                                | 10 +---------
>  3 files changed, 12 insertions(+), 9 deletions(-)
>
> diff --git a/scripts/update-aarch64-cpu-sysreg-properties.py b/scripts/update-aarch64-cpu-sysreg-properties.py
> index 0b4e4d3e0c..2269063408 100644
> --- a/scripts/update-aarch64-cpu-sysreg-properties.py
> +++ b/scripts/update-aarch64-cpu-sysreg-properties.py
> @@ -246,6 +246,15 @@ def generate_sysreg_properties_from_registers_json(id_reg_names, raw_json_path):
>          # Sort decreasing lsbs
>          sorted_fields = sorted(unique_fields.items(),
>                                 key=lambda x: x[1]['lsb'], reverse=True)
> +        if len(sorted_fields) == 0:
> +            # For cases like REVIDR_EL1, add a dummy field covering the
> +            # full register.
> +            sorted_fields.append(('VAL', {
though I think it is important the property name stays SYSREG_REVIDR_EL1
and not SYSREG_REVIDR_EL1_VAL so I guess we need either a property alias
or a special handling for those regs (better as alias were not really
meant for that purpose I think).

Eric
> +                'lsb': 0,
> +                'msb': 63,
> +                'width': 64,
> +                'enums': []
> +            }))
>  
>          for unique_key, bits in sorted_fields:
>              enums_list = bits.get('enums', [])
> diff --git a/target/arm/cpu-idregs.h.inc b/target/arm/cpu-idregs.h.inc
> index c7e93c48b7..bc52112430 100644
> --- a/target/arm/cpu-idregs.h.inc
> +++ b/target/arm/cpu-idregs.h.inc
> @@ -12,6 +12,7 @@
>  /* IDREG_END(REG) */
>  
>  IDREG_START(AIDR_EL1)
> +    IDREG_FIELD(AIDR_EL1, VAL, 0, 64)
>  IDREG_END(AIDR_EL1)
>  
>  IDREG_START(CLIDR_EL1)
> @@ -2438,6 +2439,7 @@ IDREG_START(MVFR2_EL1)
>  IDREG_END(MVFR2_EL1)
>  
>  IDREG_START(REVIDR_EL1)
> +    IDREG_FIELD(REVIDR_EL1, VAL, 0, 64)
>  IDREG_END(REVIDR_EL1)
>  
>  IDREG_START(SMIDR_EL1)
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index e3a0dc07de..8a823d0324 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -554,15 +554,7 @@ void kvm_arm_expose_idreg_properties(ARMCPU *cpu, ARM64SysReg *regs)
>          ARM64SysReg *sysregdesc = &regs[i];
>  
>          if (sysregdesc->writable_mask) {
> -            /*
> -             * special case REVIDR_EL1 and AIDR_EL1 which are writable but
> -             * do not expose named fields. They will need to be handled
> -             * separately
> -             */
> -            if (strcmp(sysregdesc->name, "REVIDR_EL1") &&
> -                strcmp(sysregdesc->name, "AIDR_EL1")) {
> -                decode_idreg_writemap(obj, sysregdesc);
> -            }
> +            decode_idreg_writemap(obj, sysregdesc);
>          }
>      }
>  }


