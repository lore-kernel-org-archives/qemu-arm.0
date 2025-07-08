Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F01AC83F09
	for <qemu-arm@archiver.kernel.org>; Tue,  8 Jul 2025 20:47:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZFC0-0006uQ-Jn; Tue, 08 Jul 2025 16:45:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uZDiw-0000Xv-SV
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 15:12:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uZDis-00065v-97
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 15:11:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752001879;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NYadxeNHyeft4vuJmFk2+Tsydm/dqPzo99hMINpb82I=;
 b=Xa53QINUVAaY7yKMC6NM0R9O7+5gkz3YP93rJeJeePxdWnybbBNQqZFLEEDTJzbw9sAFYf
 OVKDEcU5gKt8BpX7lpx47MwrT9TCNS76ojufN3kDfVYjGlrMoZiqokFRed4/KLY2i90xGt
 +v+4IW8YzqNrzA57NBnaaDRQSqs2/OI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-488-WYJ5OBupP5GscNjSdGOiTw-1; Tue, 08 Jul 2025 11:58:12 -0400
X-MC-Unique: WYJ5OBupP5GscNjSdGOiTw-1
X-Mimecast-MFC-AGG-ID: WYJ5OBupP5GscNjSdGOiTw_1751990291
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3a4eb6fcd88so2867386f8f.1
 for <qemu-arm@nongnu.org>; Tue, 08 Jul 2025 08:58:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751990290; x=1752595090;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NYadxeNHyeft4vuJmFk2+Tsydm/dqPzo99hMINpb82I=;
 b=dVAjZGKxXt2eRR3Hlnl/OxPrLjkJlNeAhuih0/VqEfN31QePVhV3o7ltCDZ8a+T7oS
 IFf75uCb/FPAesG9mYzS7j8u9TAJSDFUYeTdSE5yQPCMP9zFG/TFzSgRXiU4mTSgvP6j
 s9zwZ63LzrDeMzG8Vyr6DN0cu16gQK2uISb/t1fysHO0mMtsOnGLZPHb7zKGYkKW8naE
 QesbNYC2cKp79v4jpK/AU+yaYt9SG6ZHULzqMCGPiJ3Q4ZRIeeR/oTiXghhQq5ZWqQAj
 knsmVKytzsbwMNtBfNjs52kHiHCTnW9dZIsaJiWRq2CFYfs/c8Vm6BxWO4FXv0fq71un
 y14w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUjYVYxmRw8SBJF4Td6yKjkfnJX3gOQrAz7Y4hJQ8e5q5mUfJ3sZ+jOwjkwyGdKHJyTc9rH+PAZQ==@nongnu.org
X-Gm-Message-State: AOJu0YzZ3CDzzcN1Us9xH52MyCZjHfAs/UlpZ/Xmap8Y8ID1UZx2/Ja8
 HfEEzjaPW2sLvgSv3EpzpPbijdkcVQQXlMsEctAYT1AoKWYNGvbfqDVv8CDq+G8BaZbXZaW+1kD
 sRXYeWlGR60cCmsoovBoc4rJ/JWiuUk827umKJCS1YB4Mgc2czKTgcrISPYIhXw==
X-Gm-Gg: ASbGncs+3JRItFofTk3lkZvBbsyukSVH52mSGK2RX6IZB6Oy7matmUi26EigqW5P5LX
 okKourUGoXnudmdZTxY/uJjIyhVhb59X0ZGVtc1izLngDi5C6XiB+qPKaFIKq5CBQXaBfQ4nxNp
 N/EVs70d401jtL7gMDa/VRyyEIpHPRA+H/nIjlcv43XGedOV4Ea5FEfLcH+N0q5M4uNvuK+W6i/
 VTa7sCzOY4wmEZVU/PJumttPqrfmbEhr16z0gW97PGo+92nYqbjXmm+zhIwkUyVZoOzQS4jE4xH
 uIjg+8FCUnQnvs52Kg+Rir0/JHSXxjcRRQYYRQRIacRbvAhdREnH/85QgUVyIarbWv4TYw==
X-Received: by 2002:adf:e19b:0:b0:3a4:cb4f:ac2a with SMTP id
 ffacd0b85a97d-3b4970110d9mr11589213f8f.21.1751990290081; 
 Tue, 08 Jul 2025 08:58:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETcHu6CEeeMdueEEZSQvTMD1QVOKBXPassNN6jhIRLrSSvV4Nc26FmmOeLp5VorEoAoAkvWw==
X-Received: by 2002:adf:e19b:0:b0:3a4:cb4f:ac2a with SMTP id
 ffacd0b85a97d-3b4970110d9mr11589186f8f.21.1751990289510; 
 Tue, 08 Jul 2025 08:58:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454cd3d2749sm26893205e9.25.2025.07.08.08.58.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 08:58:08 -0700 (PDT)
Message-ID: <60bb1600-b9ea-4fd6-8292-79f7a9b6d82c@redhat.com>
Date: Tue, 8 Jul 2025 17:58:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] hw/intc/arm_gicv3_kvm: Drop DPRINTF macro
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20250708115238.667050-1-peter.maydell@linaro.org>
 <20250708115238.667050-4-peter.maydell@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250708115238.667050-4-peter.maydell@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3IyjmfgnLBn3A73yosmLyPhK80_ZlRgZ5eCz4Subkik_1751990291
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 7/8/25 1:52 PM, Peter Maydell wrote:
> We don't generally like DPRINTF debug macros, preferring tracepoints.
> In this case the macro is used in only three places (reset, realize,
> and in the unlikely event the host kernel doesn't have GICv3 register
> access support). These don't seem worth converting to tracepoints,
> so simply delete the macro and its uses.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

> ---
> If anybody needs to debug this code they can add useful tracepoints
> at that point. I don't think these DPRINTFs will help at all.
> ---
>  hw/intc/arm_gicv3_kvm.c | 13 -------------
>  1 file changed, 13 deletions(-)
>
> diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
> index 8e34d08b415..e118c1b1f04 100644
> --- a/hw/intc/arm_gicv3_kvm.c
> +++ b/hw/intc/arm_gicv3_kvm.c
> @@ -34,14 +34,6 @@
>  #include "target/arm/cpregs.h"
>  
>  
> -#ifdef DEBUG_GICV3_KVM
> -#define DPRINTF(fmt, ...) \
> -    do { fprintf(stderr, "kvm_gicv3: " fmt, ## __VA_ARGS__); } while (0)
> -#else
> -#define DPRINTF(fmt, ...) \
> -    do { } while (0)
> -#endif
> -
>  #define TYPE_KVM_ARM_GICV3 "kvm-arm-gicv3"
>  typedef struct KVMARMGICv3Class KVMARMGICv3Class;
>  /* This is reusing the GICv3State typedef from ARM_GICV3_ITS_COMMON */
> @@ -721,14 +713,11 @@ static void kvm_arm_gicv3_reset_hold(Object *obj, ResetType type)
>      KVMARMGICv3Class *kgc = KVM_ARM_GICV3_GET_CLASS(s);
>      uint32_t reg;
>  
> -    DPRINTF("Reset\n");
> -
>      if (kgc->parent_phases.hold) {
>          kgc->parent_phases.hold(obj, type);
>      }
>  
>      if (s->migration_blocker) {
> -        DPRINTF("Cannot put kernel gic state, no kernel interface\n");
>          return;
>      }
>  
> @@ -807,8 +796,6 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
>      Error *local_err = NULL;
>      int i;
>  
> -    DPRINTF("kvm_arm_gicv3_realize\n");
> -
>      kgc->parent_realize(dev, &local_err);
>      if (local_err) {
>          error_propagate(errp, local_err);


