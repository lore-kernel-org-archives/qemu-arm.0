Received: by 10.25.150.194 with SMTP id y185csp1392044lfd;
        Fri, 11 Nov 2016 07:27:05 -0800 (PST)
X-Received: by 10.194.93.101 with SMTP id ct5mr9587560wjb.11.1478878025182;
        Fri, 11 Nov 2016 07:27:05 -0800 (PST)
Return-Path: <andre.przywara@arm.com>
Received: from cam-admin0.cambridge.arm.com (cam-admin0.cambridge.arm.com. [217.140.96.50])
        by mx.google.com with ESMTP id i72si11468261wmg.98.2016.11.11.07.27.04;
        Fri, 11 Nov 2016 07:27:05 -0800 (PST)
Received-SPF: pass (google.com: domain of andre.przywara@arm.com designates 217.140.96.50 as permitted sender) client-ip=217.140.96.50;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of andre.przywara@arm.com designates 217.140.96.50 as permitted sender) smtp.mailfrom=andre.przywara@arm.com
Received: from [192.168.67.35] ([10.1.207.46])
	by cam-admin0.cambridge.arm.com (8.12.6/8.12.6) with ESMTP id uABFR3Wr029235;
	Fri, 11 Nov 2016 15:27:03 GMT
Subject: Re: [kvm-unit-tests PATCH v5 03/11] arm/arm64: smp: support more than
 8 cpus
To: Andrew Jones <drjones@redhat.com>, kvm@vger.kernel.org,
   kvmarm@lists.cs.columbia.edu, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <1478798481-25030-1-git-send-email-drjones@redhat.com>
 <1478798481-25030-4-git-send-email-drjones@redhat.com>
Cc: pbonzini@redhat.com, peter.maydell@linaro.org, alex.bennee@linaro.org,
   marc.zyngier@arm.com, eric.auger@redhat.com, christoffer.dall@linaro.org
From: Andre Przywara <andre.przywara@arm.com>
Organization: ARM Ltd.
Message-ID: <caf9e57a-a8f7-8595-2004-3be0d3224ce6@arm.com>
Date: Fri, 11 Nov 2016 15:27:38 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1478798481-25030-4-git-send-email-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: VngPC5EucAkW

Hi,

On 10/11/16 17:21, Andrew Jones wrote:
> By adding support for launching with gicv3 we can break the 8 vcpu
> limit. This patch adds support to smp code and also selects the
> vgic model corresponding to the host. The vgic model may also be
> manually selected by adding e.g. -machine gic-version=3 to
> extra_params.
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> 
> ---
> v5: left cpus a u32 for now. Changing to u64 requires a change to
>     devicetree. Will do it later. [Andre]

Given that we address this in the future:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

