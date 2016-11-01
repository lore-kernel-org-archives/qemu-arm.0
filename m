Received: by 10.80.166.35 with SMTP id d32csp724093edc;
        Tue, 1 Nov 2016 08:43:19 -0700 (PDT)
X-Received: by 10.55.161.21 with SMTP id k21mr17395198qke.149.1478014999005;
        Tue, 01 Nov 2016 08:43:19 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d5si4407730qkb.75.2016.11.01.08.43.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Nov 2016 08:43:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48770 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c1bDa-0000tH-DF
	for alex.bennee@linaro.org; Tue, 01 Nov 2016 11:43:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53155)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1c1bCr-0000rY-1K
	for qemu-devel@nongnu.org; Tue, 01 Nov 2016 11:42:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1c1bCq-0000rL-1b
	for qemu-devel@nongnu.org; Tue, 01 Nov 2016 11:42:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43082)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1c1bCi-0000os-IF; Tue, 01 Nov 2016 11:42:24 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D21DE81129;
	Tue,  1 Nov 2016 15:42:22 +0000 (UTC)
Received: from localhost.localdomain (vpn1-5-44.ams2.redhat.com [10.36.5.44])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id uA1FgKWS028288
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 1 Nov 2016 11:42:21 -0400
To: Stefan Weil <sw@weilnetz.de>, QEMU Developer <qemu-devel@nongnu.org>
References: <20161101152819.18906-1-sw@weilnetz.de>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <84814d67-535b-eb8a-9545-eb515aba8930@redhat.com>
Date: Tue, 1 Nov 2016 16:42:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <20161101152819.18906-1-sw@weilnetz.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 01 Nov 2016 15:42:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] hw/intc/arm_gicv3_its: Fix typo in member
 names of GICv3ITSState
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Pavel Fedin <p.fedin@samsung.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WfVidZy0Jf1a

Hi Stefan,

On 01/11/2016 16:28, Stefan Weil wrote:
> translater -> translator (found by codespell)

Actually GITS_TRANSLATER is the terminology used for this register in
the ARM GIC architecture specification (IHI0069B).

Thanks

Eric
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  hw/intc/arm_gicv3_its_kvm.c            | 10 +++++-----
>  include/hw/intc/arm_gicv3_its_common.h |  4 ++--
>  2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
> index fc246e0..c3e074d 100644
> --- a/hw/intc/arm_gicv3_its_kvm.c
> +++ b/hw/intc/arm_gicv3_its_kvm.c
> @@ -33,18 +33,18 @@ static int kvm_its_send_msi(GICv3ITSState *s, uint32_t value, uint16_t devid)
>  {
>      struct kvm_msi msi;
>  
> -    if (unlikely(!s->translater_gpa_known)) {
> +    if (unlikely(!s->translator_gpa_known)) {
>          MemoryRegion *mr = &s->iomem_its_translation;
>          MemoryRegionSection mrs;
>  
>          mrs = memory_region_find(mr, 0, 1);
>          memory_region_unref(mrs.mr);
> -        s->gits_translater_gpa = mrs.offset_within_address_space + 0x40;
> -        s->translater_gpa_known = true;
> +        s->gits_translator_gpa = mrs.offset_within_address_space + 0x40;
> +        s->translator_gpa_known = true;
>      }
>  
> -    msi.address_lo = extract64(s->gits_translater_gpa, 0, 32);
> -    msi.address_hi = extract64(s->gits_translater_gpa, 32, 32);
> +    msi.address_lo = extract64(s->gits_translator_gpa, 0, 32);
> +    msi.address_hi = extract64(s->gits_translator_gpa, 32, 32);
>      msi.data = le32_to_cpu(value);
>      msi.flags = KVM_MSI_VALID_DEVID;
>      msi.devid = devid;
> diff --git a/include/hw/intc/arm_gicv3_its_common.h b/include/hw/intc/arm_gicv3_its_common.h
> index 1ba1894..00aa04d 100644
> --- a/include/hw/intc/arm_gicv3_its_common.h
> +++ b/include/hw/intc/arm_gicv3_its_common.h
> @@ -38,8 +38,8 @@ struct GICv3ITSState {
>      GICv3State *gicv3;
>  
>      int dev_fd; /* kvm device fd if backed by kvm vgic support */
> -    uint64_t gits_translater_gpa;
> -    bool translater_gpa_known;
> +    uint64_t gits_translator_gpa;
> +    bool translator_gpa_known;
>  
>      /* Registers */
>      uint32_t ctlr;
> 
