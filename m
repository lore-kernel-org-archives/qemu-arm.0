Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E24ACD5BB1
	for <qemu-arm@archiver.kernel.org>; Tue, 26 May 2026 14:51:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wRt80-0000A1-LT; Tue, 26 May 2026 10:51:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1wRt7y-00007s-HB
 for qemu-arm@nongnu.org; Tue, 26 May 2026 10:51:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1wRt7v-0002gh-LZ
 for qemu-arm@nongnu.org; Tue, 26 May 2026 10:51:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779807086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vNB5dRuBQUkYWcL2tTZPtjic1AfVAuz4/Sce5KoR+pE=;
 b=WfFnH3h9tPBTXdhrjWIXRG23hSjtgMKnaVTX4nlqG1hz7uVTNPWmAXE+JEkAAfNT7g6vk6
 ROWhh4AKB7u7P9d99fNAli1h+LEiY8yrXDzrh33AHtY1mjWQl6qMQABebjb3kSPTyeC9SV
 qozB+T/ibd4dmTAZggGmTkxM8YmBNiQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592-ET9h0YyKM4CZgEO3kmkWeA-1; Tue, 26 May 2026 10:51:25 -0400
X-MC-Unique: ET9h0YyKM4CZgEO3kmkWeA-1
X-Mimecast-MFC-AGG-ID: ET9h0YyKM4CZgEO3kmkWeA_1779807084
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-49050c44bcdso42465375e9.3
 for <qemu-arm@nongnu.org>; Tue, 26 May 2026 07:51:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779807084; x=1780411884;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vNB5dRuBQUkYWcL2tTZPtjic1AfVAuz4/Sce5KoR+pE=;
 b=h+vMw05mxTggY7dfn+9DQZbyxrSFitV5+HfytSP6ZnPKMZsudwfDlEgk69o8QeUkbv
 bQ96ex7wj0IcKcyEucpvTSQRpY2nzYYnhZyULBcEAm1nI8QDONPoP+mXuZDRAJ3HQU8Y
 1FdpgMrVh3OmKmEBPnmUuC5SBty3gWg1uhI3/m3SNozwNlICHRZYErKzu95NjHuk1LG4
 ETQCo0HamKgHA3PNUcEYtG0ejUQZpOV0xXNC6Ge7RDlO2gczC7YOQUkanwTaeu2cGsFB
 idXAkvLQpG/tg66HPus5ZwWoggLiK5XPWUyLR/6nZ4e8QqGnXnRtijO3BL6R1l3vnD+y
 D71A==
X-Forwarded-Encrypted: i=1;
 AFNElJ9X3uoNOPAlTnKhyxqf2SQcaaPn5rDJ3A9IKXjhSZu8y4qz9qAStVBzOro1hcT1RW7vHtKv+y5KKA==@nongnu.org
X-Gm-Message-State: AOJu0YwoBwbBDFlaKnvJ7OplcbU3SUIfnA8EPNvDiyxTZqcmIsViRhC0
 h5n8ircnE0C2Fkc9X0O0fjhp5RGH1wsk5oQ9eMX8I9ByzPs/utFgQmxJZx9GY4yjmeB0zIHmYol
 pHsy5cWPL1WhgI6ZjpzamfMidIcALkzRkPEOhK8AVlvchfHLnUxloSw==
X-Gm-Gg: Acq92OFA9LXpD9CwcUJnuR38A4fNgLnhfLQ2OoutN4IxPQ3ZMtb3vDc1MKairJEnfbz
 DyhSH1LtR4dMQFp743l5spDMoRv3qWd3bH25pk3hMMSW4thgLXcet/rvoxGGjLEV11OXyLXwA59
 fD+wHa/9+Ua3yqckgKn2yMrbyXVwlVaFuRFIpuXsSI0Ewo5y76r8CkwRfh6tomM9NSqI5H3Z2lU
 +wInVDjxBREg6DT8uGeSP6lp4BqXcxoO+mNH7Mzs1iQggYsRA8KFsBm3lw99s/rWLJzziOvI3gD
 QNPszT7/7qz49GQ7gXOTsSls9YQtXH8sTFfYRJvq3PUemCX9gRVpyv460xWWmA7fp7FpnVbc/cy
 tvzmu/hCszjNFidt27UJYByRXwb5Ews+cICpsZtFz3RlGaaTcC+gJH+dY452Tc8uwpR4rsfg=
X-Received: by 2002:a05:600c:628f:b0:490:5057:f602 with SMTP id
 5b1f17b1804b1-49050580d79mr260088525e9.17.1779807083738; 
 Tue, 26 May 2026 07:51:23 -0700 (PDT)
X-Received: by 2002:a05:600c:628f:b0:490:5057:f602 with SMTP id
 5b1f17b1804b1-49050580d79mr260087825e9.17.1779807083231; 
 Tue, 26 May 2026 07:51:23 -0700 (PDT)
Received: from rh (p200300f6af2a6100f239e076bbd76784.dip0.t-ipconnect.de.
 [2003:f6:af2a:6100:f239:e076:bbd7:6784])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490454a0cd5sm406863615e9.10.2026.05.26.07.51.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 07:51:22 -0700 (PDT)
Date: Tue, 26 May 2026 16:51:21 +0200 (CEST)
From: Sebastian Ott <sebott@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 kvmarm@lists.linux.dev, peter.maydell@linaro.org, 
 shaju.abraham@nutanix.com, khushit.shah@nutanix.com, 
 yangjinqian1@huawei.com, cohuck@redhat.com, richard.henderson@linaro.org, 
 skolothumtho@nvidia.com, philmd@linaro.org, maz@kernel.org, 
 oliver.upton@linux.dev, pbonzini@redhat.com, armbru@redhat.com, 
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com
Subject: Re: [PATCH v5 16/18] target/arm/cpu: Expose writable ID reg field
 properties on the kvm host vcpu model
In-Reply-To: <20260519132905.145643-17-eric.auger@redhat.com>
Message-ID: <26485473-c1bb-4dee-ff9c-429d9ecc7305@redhat.com>
References: <20260519132905.145643-1-eric.auger@redhat.com>
 <20260519132905.145643-17-eric.auger@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jxlUiZPE3zRBYGBN28mLLhDDTGOIuKT4NRXEwWqMgM4_1779807084
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; format=flowed; charset=US-ASCII
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, 19 May 2026, Eric Auger wrote:
> If the host supports KVM_CAP_ARM_SUPPORTED_REG_MASK_RANGES and
> KVM_ARM_GET_REG_WRITABLE_MASKS ioctl successfully retrieved the mask
> of writable fields for all ID regs, expose uint64 SYSREG properties
> for all the writable ID reg fields exposed by the host kernel which
> can be matched in target/arm/cpu-idregs.h.inc.
>
> Properties are named  SYSREG_<REG>_<FIELD> with REG and FIELD
> being those used ARCHMRS Registers.json.
>
> When such properties are set, they override the default field value
> retrieved from the host and reinjected into KVM. Then the actual value
> being applied at KVM depends on the register, ie. it can be sanitized.
> In case the field value is rejected by KVM, the vpcu init fails.
>
> Anyway there is a first attempt to write back this value into KVM.
>
> Then legacy CPU options (virtualization, secure, ...) can still
> override the previous value. So low level IDREG field properties
> apply before the legacy ones.
>
> An example of invocation is:
> -cpu host,SYSREG_ID_AA64MMFR0_EL1_ECV=0x0
> which sets ECV field of ID_AA64MMFR0_EL1 to 0 (enhanced counter
> virtualization).
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>

Reviewed-by: Sebastian Ott <sebott@redhat.com>


