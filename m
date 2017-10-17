Received: by 10.223.197.9 with SMTP id q9csp4699411wrf;
        Tue, 17 Oct 2017 08:06:55 -0700 (PDT)
X-Received: by 10.176.87.89 with SMTP id t25mr10074738uac.76.1508252815560;
        Tue, 17 Oct 2017 08:06:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508252815; cv=none;
        d=google.com; s=arc-20160816;
        b=xLF91W0KzSdIUwu725ZeJW95tDYZ2BoB719w1uGvcVFbbTmjLpZub1h8UC9X5R3YMz
         DcSju7J+5KPTnpKU6s3v+2V5cLK0JdJjcXdaXXOJ5WDoV/ZiT/g6huBs6QPVu6DrjPZe
         V6ZsBOb98jWz3N692CaGTHkI/Le27mBRWRUfB4tzUmYs+RAIjQ+3Gz253LKyTORgpRjT
         bKBhHP46upQmgyimHRlH8la2RLsq4sowDJRyRf+F8Fzw1TWnO66z3AkjZimQenrYvzb7
         VEwHlLvr0mMIpNxm6t1p5JC80x8X+5xVaOmlx/lvrfMkSVC04PuiOid1kTZpwJXD9EmW
         eseQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=lN2lEjDZss7xAlsjpd1UUswubnK4k4JglL4hG13o+i8=;
        b=0+jLqcUOYQewDSt5EHKlSdLULN0dx1GESWcYm5ruLZ3xKjMtXKH5PMXeohfLXZyYTm
         /HFKjeYCRQu9cYQCzu5pDtUUzy6dnr9ctDMEFhcQ6bofT96lJe4BXIifSveFUuykc5q3
         E1B9t97T8xkon+pv7j4yCzfx4Llt8z+nC9n4MQo6BUcxg6uqAZHw+DloaNQiWHQYHavQ
         ijRXqWwF1D9Dra2W00nclq5AGl5pZzx6LDheDCxlzwE+TGQm3sVR1/NpY55q/4GuVxy5
         hzs/YHmK973eZaTTkAXuK0/H/kSK1klzBw0AAJZ8VopmNJhqxllcHK9uC2uzUuenIjS6
         J6aA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=V6qYJldi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t65si2285450vkg.129.2017.10.17.08.06.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Oct 2017 08:06:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=V6qYJldi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39983 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e4TSH-0006Cl-9g
	for alex.bennee@linaro.org; Tue, 17 Oct 2017 11:06:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46161)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <linuc.decode@gmail.com>) id 1e4TS1-0006CN-NF
	for qemu-arm@nongnu.org; Tue, 17 Oct 2017 11:06:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <linuc.decode@gmail.com>) id 1e4TRv-0004L8-Sq
	for qemu-arm@nongnu.org; Tue, 17 Oct 2017 11:06:37 -0400
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:50072)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <linuc.decode@gmail.com>)
	id 1e4TRv-0004Jz-Jc; Tue, 17 Oct 2017 11:06:31 -0400
Received: by mail-pg0-x242.google.com with SMTP id g6so1639088pgn.6;
	Tue, 17 Oct 2017 08:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=lN2lEjDZss7xAlsjpd1UUswubnK4k4JglL4hG13o+i8=;
	b=V6qYJldiVGjw+3WF+SdErpikKv/Gm+thls2VCBC+0rHBFpTseWU/Q3AO6CLgivhVn1
	XvHcAUDLcaSG0mSp0ZBn/ISZ/FbPnzKqxg5YHccBUL4jf1242s6DNS3i5OC7RT5Yq+YY
	04rI6BOTjgTvCvymFWEbJlpg3RiY/z/3bwl65HcWaA8MeQZ2eEzHxmDNzxJByIuEriWU
	ygfZmZF+Z6YD/KfAPlTK8z+j1ubjgmeSV3NWCh1yAEpuAeao1AwD6/dHEpqUKKrdBtDe
	Buhgt603SA+9fpW4IbQ+bx3f1qre3UJtfOpUwim2g110KnznQwZbBpBj8+KHqABI+qgN
	Tp4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=lN2lEjDZss7xAlsjpd1UUswubnK4k4JglL4hG13o+i8=;
	b=ALalSVukfhsCAqyw0LOpXdX63q8x41itLNzkzGKaS4UdVaP7zcw3DtQ3WrlxcKY6kr
	cO1/blQt+6GVfN2seudom+T4C51gIRAsExW4SuddpwFXvCRkTmdM8lS6bVLX5yudIkL1
	/12mJ0zDvoa1kk4IMpJ4V/W3/vm/X7vSdcDxVh+2x00tf/WFEA+tUiNfULG1R/GZzBpw
	tRuSEd1LUh9ynk/n5+4fueuXm1JeKtu0vIJqeg8oeI76MLkkIS/1fTfDog1NMMbAB7Hk
	VtGS9jN6LMTNpcTbYhl1EG5FIBtnKxRDV3ZIZq09lj19TGhbtKNFiIXNOoW17jxBIGtx
	oeqg==
X-Gm-Message-State: AMCzsaWNJ1bRGhbSC7x6nYB3vmVXfscRGAfY3i3u5oJp3aMCI7QXQwjI
	82lE/ewC3yub45UZv16+7qc=
X-Google-Smtp-Source: AOwi7QC63zRFQDii/NxrrX/Zi3I+9tlVLxHcQN+BdyCrqf5xKCqK+npHhIV7wctpTqtKXR2fpoTxXA==
X-Received: by 10.159.229.136 with SMTP id az8mr10534730plb.423.1508252789085; 
	Tue, 17 Oct 2017 08:06:29 -0700 (PDT)
Received: from virtx40 ([111.93.218.67]) by smtp.gmail.com with ESMTPSA id
	j6sm21217932pfk.159.2017.10.17.08.06.22
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Tue, 17 Oct 2017 08:06:28 -0700 (PDT)
Date: Tue, 17 Oct 2017 20:36:18 +0530
From: Linu Cherian <linuc.decode@gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20171017150618.GA6575@virtx40>
References: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
	<1504286483-23327-20-git-send-email-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1504286483-23327-20-git-send-email-eric.auger@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::242
Subject: Re: [Qemu-arm] [PATCH v7 19/20] hw/arm/smmuv3: [not for upstream]
 add SMMU_CMD_TLBI_NH_VA_AM handling
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com, tcain@qti.qualcomm.com,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	mohun106@gmail.com, jean-philippe.brucker@arm.com,
	tn@semihalf.com, bharat.bhushan@nxp.com, mst@redhat.com,
	will.deacon@arm.com, qemu-devel@nongnu.org, peterx@redhat.com,
	alex.williamson@redhat.com, qemu-arm@nongnu.org,
	christoffer.dall@linaro.org, linu.cherian@cavium.com,
	wtownsen@redhat.com, robin.murphy@arm.com,
	prem.mallappa@gmail.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: y3dczQTRcsAJ

Hi Eric,

On Fri Sep 01, 2017 at 07:21:22PM +0200, Eric Auger wrote:
> SMMUV3 does not support any IOVA range TLBI command:
> SMMU_CMD_TLBI_NH_VA invalidates TLB entries by page.
> That's an issue when running DPDK on guest. DPDK uses
> hugepages but each time a hugepage is mapped on guest side,
> a storm of SMMU_CMD_TLBI_NH_VA commands get sent by the
> guest smmuv3 driver and trapped by QEMU for VFIO replay.
> 
> Let's get prepared to handle implementation defined commands,
> SMMU_CMD_TLBI_NH_VA_VM, which invalidate a range of IOVAs.
> 
> Upon this command, we notify the whole range in one host.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/arm/smmuv3-internal.h |  1 +
>  hw/arm/smmuv3.c          | 13 +++++++++++++
>  hw/arm/trace-events      |  1 +
>  3 files changed, 15 insertions(+)
> 
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index f9f95ae..e70cf76 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -289,6 +289,7 @@ enum {
>      SMMU_CMD_RESUME          = 0x44,
>      SMMU_CMD_STALL_TERM,
>      SMMU_CMD_SYNC,          /* 0x46 */
> +    SMMU_CMD_TLBI_NH_VA_AM   = 0x8F, /* VIOMMU Impl Defined */
>  };
>  
>  static const char *cmd_stringify[] = {
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 9c8640f..55dc80b 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -880,6 +880,19 @@ static int smmuv3_cmdq_consume(SMMUV3State *s)
>              smmuv3_replay_iova_range(&s->smmu_state, addr, size);
>              break;
>          }
> +        case SMMU_CMD_TLBI_NH_VA_AM:
> +        {
> +            int asid = extract32(cmd.word[1], 16, 16);
> +            int am = extract32(cmd.word[1], 0, 16);
> +            uint64_t low = extract32(cmd.word[2], 12, 20);
> +            uint64_t high = cmd.word[3];
> +            uint64_t addr = high << 32 | (low << 12);
> +            size_t size = am << 12;
> 


While testing dpdk, observed that there are map requests coming to 
arm smmuv3 driver with size greater than 256M. Since the current 
code supports only 256M( 16 + 12 bits), had to abuse the asid field
to pass the extra bits for address mask to get things working.

diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
index 04e2d75..51b1d07 100644
--- a/drivers/iommu/arm-smmu-v3.c
+++ b/drivers/iommu/arm-smmu-v3.c
@@ -1418,7 +1418,10 @@ static void arm_smmu_tlb_inv_range_nosync(unsigned long iova, size_t size,
                if (smmu->options & ARM_SMMU_OPT_TLBI_ON_MAP) {
                        cmd.opcode      = CMDQ_OP_TLBI_NH_VA_AM;
                        cmd.tlbi.am   = size >> 12;
+                       cmd.tlbi.asid = size >> 28;
                        granule = size;


On Qemu side,

  if (cfg.disabled || cfg.bypassed) {
@@ -884,12 +899,15 @@ static int smmuv3_cmdq_consume(SMMUV3State *s)
         case SMMU_CMD_TLBI_NH_VA_AM:
         {
             int asid = extract32(cmd.word[1], 16, 16);
             int am = extract32(cmd.word[1], 0, 16);
             uint64_t low = extract32(cmd.word[2], 12, 20);
             uint64_t high = cmd.word[3];
             uint64_t addr = high << 32 | (low << 12);
             size_t size = am << 12;
 
+           am = am | asid << 16;
+           size = am << 12;        
+



+
> +            trace_smmuv3_cmdq_tlbi_nh_va_am(asid, am, addr, size);
> +            smmuv3_replay_iova_range(&s->smmu_state, addr, size);
> +            break;
> +        }
>          case SMMU_CMD_TLBI_NH_VAA:
>          case SMMU_CMD_TLBI_EL3_ALL:
>          case SMMU_CMD_TLBI_EL3_VA:
> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
> index 15f84d6..fba33ac 100644
> --- a/hw/arm/trace-events
> +++ b/hw/arm/trace-events
> @@ -26,6 +26,7 @@ smmuv3_cmdq_opcode(const char *opcode) "<--- %s"
>  smmuv3_cmdq_cfgi_ste(int streamid) "     |_ streamid =%d"
>  smmuv3_cmdq_cfgi_ste_range(int start, int end) "     |_ start=0x%d - end=0x%d"
>  smmuv3_cmdq_tlbi_nh_va(int asid, int vmid, uint64_t addr) "     |_ asid =%d vmid =%d addr=0x%"PRIx64
> +smmuv3_cmdq_tlbi_nh_va_am(int asid, int am, size_t size, uint64_t addr) "     |_ asid =%d am =%d size=0x%lx addr=0x%"PRIx64
>  smmuv3_cmdq_consume_out(uint8_t prod_wrap, uint32_t prod, uint8_t cons_wrap, uint32_t cons) "prod_wrap:%d, prod:0x%x cons_wrap:%d cons:0x%x"
>  smmuv3_update(bool is_empty, uint32_t prod, uint32_t cons, uint8_t prod_wrap, uint8_t cons_wrap) "q empty:%d prod:%d cons:%d p.wrap:%d p.cons:%d"
>  smmuv3_update_check_cmd(int error) "cmdq not enabled or error :0x%x"
> -- 
> 2.5.5
> 
> 

-- 
Linu cherian
