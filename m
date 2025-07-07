Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7DC9C83F07
	for <qemu-arm@archiver.kernel.org>; Mon,  7 Jul 2025 13:55:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uYmJi-0001BA-P1; Mon, 07 Jul 2025 09:55:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uYlue-0005eI-Ba
 for qemu-arm@nongnu.org; Mon, 07 Jul 2025 09:29:49 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uYluZ-00031K-Hg
 for qemu-arm@nongnu.org; Mon, 07 Jul 2025 09:29:37 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-70f94fe1e40so43627957b3.1
 for <qemu-arm@nongnu.org>; Mon, 07 Jul 2025 06:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751894974; x=1752499774; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TYnMcPleIYNAkshJTZhrTCfgOjED3VmCaQJtjNszuTQ=;
 b=n8sZtd3LuVQWxsLezoy0L4QA6bZ6WDMfN+n+2rpH802jRs5Mjx+LU6kp2Llwi7tA53
 ohWnTVTlzlPZ5C6vWoQCe+5xmyVmctqIQGxAuqOvJNtw3uJUuAE2yk+mtN34kbq8lsSq
 huUevfup4n4Zz/nbPsnmYxirsPSz6Nwrq69c8urkyQzmA3n30msJU2hDOMtKg99gTWYs
 dno2iZrxYDBeD6iyy+pUJL++TqB4oSPE+E8voydxI7fAWEe17nztz+1hSNwGwbc33m5o
 +55AkMfZMJxl5UcZ4kzac5v/cT99lY/ojI6+PykKoUG0VDFIOJUtqTnQAsTpBERIlHvy
 IB7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751894974; x=1752499774;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TYnMcPleIYNAkshJTZhrTCfgOjED3VmCaQJtjNszuTQ=;
 b=Tj56XRmKhIUScO4YD/v+NLU3Nh/ow2/Jkb0ThbzgfqicaLUZZ/ExjsIQyvthdErHCv
 eFaykYHHyJIljkDgZfuCZvbGrVSg4byEGJZn4EZ8UqDIwrd+GG/i6mnUznUvvO3H4A38
 gOUWv1cGtkx79omzEdxEMm5rpjV/416fIs41/q9Q6+GV/Fkp/e+SGxAjALK+y5XFLGuS
 ZuH+YZouLvECGjWmuw8s4zy/TToBEvjPIFxveWO/RNjcuLXUMOrKwvIlWsQuJrRonEVl
 OUCJYV3m1jgvvCafIR+4apnVzWednk89x4/oAcOX16cYoLslUV9VD6JKK1GQ2DF8bLQl
 8L/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOwmJuv0tYWMQGNf39jISEqvfbgGRBo8RkL4Vy3tavquu7lHmWgNgURas7I40V+1F6s8Ae8EWyfw==@nongnu.org
X-Gm-Message-State: AOJu0YzcSQmWhIc1Hwqh+0gSUV/9Im0eaBnJO81+N6+c387XUF+s/A1Y
 9/zjCb/f70blHOPXV/SqFpO/Z0hBVyY0lxgcLCfMN6oCX1eRv3WMOxckem9C22CGOluKZz9lfUF
 trf3Kq/LmXe9/MFUVrrwV/lztvZMBNow/KCIf4EMopA==
X-Gm-Gg: ASbGncsRPPXcRfAwOO6AYpoYS3nEi4KUGSNHHvSu/AT0l5qw0P5c6qNkcSr6q29kWnL
 5+HHMBfWS/T25RzUvRbS2bJOsA6pJE8xUfg/3nvYgFchSJgr2L9jtQyZg8hD9z3o44QDurlwsI9
 iyX40mzFiGM2Xi9sDTTj/prZN35nJg36LJeDl2Jmv5IgjW
X-Google-Smtp-Source: AGHT+IHDSrZ19p9N/wYEnBvnzOuQ++DPQ26XnYlMUv0Gf03nDnidVAFP+U1UHR3jDFsRM69SAai7Txk3JPFbS9SCNfU=
X-Received: by 2002:a05:690c:4491:b0:70e:61b:afed with SMTP id
 00721157ae682-71667e2423emr159371187b3.7.1751894974319; Mon, 07 Jul 2025
 06:29:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250707131530.1141759-1-eric.auger@redhat.com>
 <20250707131530.1141759-5-eric.auger@redhat.com>
In-Reply-To: <20250707131530.1141759-5-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Jul 2025 14:29:23 +0100
X-Gm-Features: Ac12FXxoX9eHgJt5918SpI5ulGCGvE-uQ_KIvtF32w-Dus9nAWJ6HJhVz8fs8vQ
Message-ID: <CAFEAcA9VxC6CXK+iFFAyktuX1jsJ=znpamkvG5TuwowLxdWSsA@mail.gmail.com>
Subject: Re: [PATCH v8 4/4] hw/arm/virt: Allow virt extensions with KVM
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 miguel.luis@oracle.com, richard.henderson@linaro.org, maz@kernel.org, 
 gkulkarni@amperecomputing.com, gankulkarni@os.amperecomputing.com, 
 hi@alyssa.is
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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

On Mon, 7 Jul 2025 at 14:16, Eric Auger <eric.auger@redhat.com> wrote:
>
> From: Haibo Xu <haibo.xu@linaro.org>
>
> Up to now virt support on guest has been only supported with TCG.
> Now it becomes feasible to use it with KVM acceleration.
>
> Check neither in-kernel GICv3 nor aarch64=off is used along with KVM
> EL2.
>
> Also add a migration blocker in case KVM NV is set as some
> GIC registers are most probably not properly saved/restored:
> ICH_AP*R<n>_EL2, ICH_EISR_EL2, ICH_ELRSR_EL2, ICH_HCR_EL2,
> ICH_LR<n>_EL2, etc etc.


> +    if (vms->virt) {
> +        if (!(kvm_enabled() && kvm_arm_el2_supported()) &&
> +            !tcg_enabled() && !qtest_enabled()) {
> +            error_report("mach-virt: %s does not support providing "
> +                         "Virtualization extensions to the guest CPU",
> +                         current_accel_name());
> +            exit(1);
> +        }
> +        if (kvm_enabled()) {
> +            Error *kvm_nv_migration_blocker = NULL;
> +
> +            error_setg(&kvm_nv_migration_blocker,
> +                       "Live migration disabled due to KVM nested virt enabled");
> +            if (migrate_add_blocker(&kvm_nv_migration_blocker, NULL)) {
> +                error_free(kvm_nv_migration_blocker);
> +                return;
> +            }
> +        }
>      }

I think a better place to set the migration blocker is in
the GIC code itself (maybe in kvm_arm_gicv3_realize() ?) : we
want to disable migration for any setup with a GICv3 + KVM + EL2,
not just the virt board.

I also don't understand why we don't hit the assert
in gicv3_init_cpuif() that checks that if we're not TCG
or qtest accelerators then the CPU doesn't have EL2 or EL3.
It looks to me from reading the code that we ought to go
through that function in the KVM case.

The rest of the series looks OK to me.

thanks
-- PMM

