Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E0E5C83F27
	for <qemu-arm@archiver.kernel.org>; Tue, 22 Jul 2025 16:57:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ueGJ3-0001fe-9C; Tue, 22 Jul 2025 12:57:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1ueFc6-0001lh-Cg
 for qemu-arm@nongnu.org; Tue, 22 Jul 2025 12:13:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1ueFc1-0001dT-Jc
 for qemu-arm@nongnu.org; Tue, 22 Jul 2025 12:13:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1753200783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l4x3D/i4GIz6o492rp7lytt11dFe77FgBTZxGlV4fUg=;
 b=D18DQ30Gp5V2Gi0+Qenxv3h9YYodDKCK8pP8AtiM+/GfdK2+I6OgnoBhlhIdTyy8F4HoQi
 hV9JBaVnCQhVWS9ytXkx3iBtDEOKrZYYnhtNxq9UA89Rn2oO9i+JTcgFVNNyjzBmX17cdK
 x0ScBurbhREwzPbEv0Grv+TCwJpxCd0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-152-9QxeUb1gNE-6-pewajAAXg-1; Tue, 22 Jul 2025 12:11:05 -0400
X-MC-Unique: 9QxeUb1gNE-6-pewajAAXg-1
X-Mimecast-MFC-AGG-ID: 9QxeUb1gNE-6-pewajAAXg_1753200664
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-45639e6a320so29333285e9.3
 for <qemu-arm@nongnu.org>; Tue, 22 Jul 2025 09:11:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753200664; x=1753805464;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l4x3D/i4GIz6o492rp7lytt11dFe77FgBTZxGlV4fUg=;
 b=xQAoIvpfAhcgU2qZTW0surTX2ofvJOQL3IlA0mw41LE0WUSogLny47vWOLAzHJLcbu
 X8gEI0nZg+huFbVZakdQkZ2fpVv2n8+jZS8WrKX8pArGsHMsw5r3IAg0EbbJ1HZU+jq+
 4Wj5eB99L8ZnNKOsikFBYd2DLjk5a5xBAiIXR6YLQksgu8NL/WoGGtqPaPrjwTfYZbB4
 0oz7udNh6uRK/qWvLJkg4AF8a98gU4Em+CJzBnTxHQsny8Vf2Kp5SKY3NRQp2IzTwX9a
 X0l94oVb6XRbomFOD8+1iL7y1cAtvQwAFyThXAWrKpmJu5wgizeyxJtTrfDBDlSRVi3N
 As6Q==
X-Gm-Message-State: AOJu0YzMJFLnDTSB4jHSdHRiMz7foDtMHKeMyn2WkcstGt1z4IGi7zre
 Ku8d5aQkwDJlvnhFRT/cuDjRaxwdTqlnXrV2JeISKRzgUkXAHVQEvFStgEj/4fKkZ9fpSdGHHek
 d82QfUkZzVerngeu/1WuFlpN8CGnqNtje/jwTFjFN3k0P4/Wv40N5TQ==
X-Gm-Gg: ASbGncsyI19hXqAYpp82WNtMOzURumovx5bBCEiUYU+HgmelZjaYhl4BRuOPCE9g1Wn
 lGTf9aznmcvPIWKzHDh1XaVBwb9huP7Mx+9SdvpHgnZHkt2VUn+BdA6x0Gbtca50u0grLrJembB
 X3aPyYKx6qQOYwp/OFOlaLBgEbVfl2sOQP59xETau4js/ezqdOJo5ojCB2p9fm730RtKVsvwr3S
 0jrNTJ9oDIt6NocmzhAtWfC8e7UM5CxJ2KB0GgdYmy2kVfx7IghLck9AH617dEy+7Zyq96rvQ1g
 OfnvTsA5tlyHfyarocUEMYs4hJpQOOydUwaxEikmC3rYwvjFf3vSQ//d6Z8WyvyKREvCmMV4bzH
 6gAgkZRUarLb7
X-Received: by 2002:a5d:6f0e:0:b0:3a6:d92d:9f7c with SMTP id
 ffacd0b85a97d-3b60e4c5212mr22421824f8f.9.1753200664283; 
 Tue, 22 Jul 2025 09:11:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCHXaFJIN6wZg9she9zBMcbIAxjluYAG5+RDzJu/soPI3BPkblYjBQVwzQ5OQHCDZNtibTYg==
X-Received: by 2002:a5d:6f0e:0:b0:3a6:d92d:9f7c with SMTP id
 ffacd0b85a97d-3b60e4c5212mr22421797f8f.9.1753200663812; 
 Tue, 22 Jul 2025 09:11:03 -0700 (PDT)
Received: from rh (p200300f6af1bce00e6fe5f11c0a7f4a1.dip0.t-ipconnect.de.
 [2003:f6:af1b:ce00:e6fe:5f11:c0a7:f4a1])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b61ca4d807sm14005725f8f.73.2025.07.22.09.11.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 09:11:03 -0700 (PDT)
Date: Tue, 22 Jul 2025 18:11:02 +0200 (CEST)
From: Sebastian Ott <sebott@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH RFC] arm/kvm: report registers we failed to set
In-Reply-To: <20250721161932.548668-1-cohuck@redhat.com>
Message-ID: <b1f7bb67-070f-da38-369b-51ed1962fd2d@redhat.com>
References: <20250721161932.548668-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3pgMb-vpHfqF75stOjgwbHa2uDlhHNhAU_YEVscAz5U_1753200664
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII; format=flowed
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.633,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On Mon, 21 Jul 2025, Cornelia Huck wrote:
> If we fail migration because of a mismatch of some registers between
> source and destination, the error message is not very informative:
>
> qemu-system-aarch64: error while loading state for instance 0x0 ofdevice 'cpu'
> qemu-system-aarch64: Failed to put registers after init: Invalid argument
>
> At least try to give the user a hint which registers had a problem,
> even if they cannot really do anything about it right now.
>
> Sample output:
>
> Could not set register op0:3 op1:0 crn:0 crm:0 op2:0 to c00fac31 (is 413fd0c1)
>
> We could be even more helpful once we support writable ID registers,
> at which point the user might actually be able to configure something
> that is migratable.

That message will be even more helpful once we have the stuff in place
to actually print a reg name here (and be able to change the values for
the guest) - but I agree this would already be a great improvement over
the current message!

>
> Suggested-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>
> Notes:
> - This currently prints the list of failing registers for every call to
>  write_list_to_kvmstate(), in particular for every cpu -- we might want
>  to reduce that.
> - If the macros aren't too ugly (or we manage to improve them), there
>  might be other places where they could be useful.
>
> ---
> target/arm/kvm.c | 53 ++++++++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 53 insertions(+)
>
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 667234485547..ac6502e0c78f 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -900,6 +900,24 @@ bool write_kvmstate_to_list(ARMCPU *cpu)
>     return ok;
> }
>
> +/* pretty-print a KVM register */
> +#define CP_REG_ARM64_SYSREG_OP(_reg, _op)                       \
> +    ((uint8_t)((_reg & CP_REG_ARM64_SYSREG_ ## _op ## _MASK) >> \
> +               CP_REG_ARM64_SYSREG_ ## _op ## _SHIFT))
> +
> +#define PRI_CP_REG_ARM64_SYSREG(_reg)                    \
> +    ({                                                   \
> +        char _out[32];                                   \
> +        snprintf(_out, sizeof(_out),                     \
> +                 "op0:%d op1:%d crn:%d crm:%d op2:%d",   \
> +                 CP_REG_ARM64_SYSREG_OP(_reg, OP0),      \
> +                 CP_REG_ARM64_SYSREG_OP(_reg, OP1),      \
> +                 CP_REG_ARM64_SYSREG_OP(_reg, CRN),      \
> +                 CP_REG_ARM64_SYSREG_OP(_reg, CRM),      \
> +                 CP_REG_ARM64_SYSREG_OP(_reg, OP2));     \
> +        _out;                                            \
> +    })

Gcc correctly complains about a dangling pointer here.

Sebastian


