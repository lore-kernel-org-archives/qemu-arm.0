Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp5781876wre;
        Thu, 31 May 2018 04:02:03 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIuPjeTMfpH2ZjDl3Jj6WBoL4DOsYXq6HFLg4zLlJROuy15IvRqfwaYIaGanVbpd4OPtc9x
X-Received: by 2002:a37:c08e:: with SMTP id v14-v6mr6001902qkv.23.1527764523321;
        Thu, 31 May 2018 04:02:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527764523; cv=none;
        d=google.com; s=arc-20160816;
        b=ecKkAtOKtEMzWQSSxCitIo/sTVqJoZuoIGZPbXJ1cpoD2JlpN80wzPVrDrlwwUW+7p
         xZeetmr3p4QfiPfLsOdOB/wYH5b9mJBo/Fg8kcI56WIFUFXQHz50ltcVzBk7a+ULECMB
         PWtTUhWAwcYeUyD9Pc7ssjUSBVLrImALNUYaC9eKOT0QLIYX1PKemWFjpxsSpNx/9j3W
         MmAjsi7V+tOa4qOHq7IJBiLIefA/HbMCl5q67Q4j73Bp6mCyXZUUrwoJzmNlLSklCfck
         hbbAqaFWsqHZymmAcWGGLaFs9eImX+RZpi7RgdlANPr34n14y9euCOk7u3s9Xnx1BLHD
         G32w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=8NAX21FOBfx4OOdBqUxUYcrrA8THKgimI+1M2MMpnrk=;
        b=t4X5ybENINhPRfUqeXypkFosBz5n8Bs6KLZA2fVOOvx4NmwnFb1fCuEtRWUtseXc3V
         s6kCV4jqkYTptqON8HyGvDmrWj/Ov/+D0mJj9SdLwlpd6GTVomSuHdOo/XVhBia7Ehgl
         zrzk4AZEOJtqnqri6RTdLR4XJ/2e1AzlEPcsRAarzeZd6VlamNQGFxc5nss+PqudkkIt
         K2sJDL/q6fAdW5TwjvIbhCWumITZpLiQPBHfi+WWiDNtNMCkeiYs/wBwF2jP8Pz7PNFj
         sXeGZkTwkGa/PQsYV2pUHjOGSDtIFaMt1wOWyJ9w/FV0wll+fBpbmdmLtbV7rUfVoW8n
         Diyw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u89-v6si1253517qvu.3.2018.05.31.04.02.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 May 2018 04:02:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43114 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fOLLG-00018o-SM
	for alex.bennee@linaro.org; Thu, 31 May 2018 07:02:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44792)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fOLL3-00017q-6A
	for qemu-arm@nongnu.org; Thu, 31 May 2018 07:01:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fOLKz-000836-8r
	for qemu-arm@nongnu.org; Thu, 31 May 2018 07:01:49 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:50860 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fOLKz-00082A-3K; Thu, 31 May 2018 07:01:45 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 691524023B91;
	Thu, 31 May 2018 11:01:44 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C52583B9C;
	Thu, 31 May 2018 11:01:43 +0000 (UTC)
To: Shannon Zhao <zhaoshenglong@huawei.com>, qemu-arm@nongnu.org
References: <1527736557-11084-1-git-send-email-zhaoshenglong@huawei.com>
	<1527736557-11084-2-git-send-email-zhaoshenglong@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <e7bb1cbd-7fad-5bd2-641c-885f0f473680@redhat.com>
Date: Thu, 31 May 2018 13:01:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1527736557-11084-2-git-send-email-zhaoshenglong@huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Thu, 31 May 2018 11:01:44 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Thu, 31 May 2018 11:01:44 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v5 1/2] arm_gicv3_kvm:
 kvm_dist_get/put_priority: skip the registers banked by GICR_IPRIORITYR
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
Cc: peter.maydell@linaro.org, qemu-stable@nongnu.org, qemu-devel@nongnu.org,
	shannon.zhaosl@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xcxBUFaxhRT6

Hi,

On 05/31/2018 05:15 AM, Shannon Zhao wrote:
> While for_each_dist_irq_reg loop starts from GIC_INTERNAL, it forgot to
> offset the date array and index. This will overlap the GICR registers
> value and leave the last GIC_INTERNAL irq's registers out of update.
> 
> Fixes: 367b9f527becdd20ddf116e17a3c0c2bbc486920
> Cc: qemu-stable@nongnu.org
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
> ---
>  hw/intc/arm_gicv3_kvm.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
> index 3536795..147e691 100644
> --- a/hw/intc/arm_gicv3_kvm.c
> +++ b/hw/intc/arm_gicv3_kvm.c
> @@ -135,7 +135,14 @@ static void kvm_dist_get_priority(GICv3State *s, uint32_t offset, uint8_t *bmp)
>      uint32_t reg, *field;
>      int irq;
>  
> -    field = (uint32_t *)bmp;
> +    /* For the KVM GICv3, affinity routing is always enabled, and the first 8
> +     * GICD_IPRIORITYR<n> registers are always RAZ/WI. The corresponding
> +     * functionality is replaced by GICR_IPRIORITYR<n>. It doesn't need to
> +     * sync them. So it needs to skip the field of GIC_INTERNAL irqs in bmp and
> +     * offset.
> +     */
> +    field = (uint32_t *)(bmp + GIC_INTERNAL);
> +    offset += (GIC_INTERNAL * 8) / 8;
>      for_each_dist_irq_reg(irq, s->num_irq, 8) {
>          kvm_gicd_access(s, offset, &reg, false);
>          *field = reg;
> @@ -149,7 +156,14 @@ static void kvm_dist_put_priority(GICv3State *s, uint32_t offset, uint8_t *bmp)
>      uint32_t reg, *field;
>      int irq;
>  
> -    field = (uint32_t *)bmp;
> +    /* For the KVM GICv3, affinity routing is always enabled, and the first 8
> +     * GICD_IPRIORITYR<n> registers are always RAZ/WI. The corresponding
> +     * functionality is replaced by GICR_IPRIORITYR<n>. It doesn't need to
> +     * sync them. So it needs to skip the field of GIC_INTERNAL irqs in bmp and
> +     * offset.
> +     */
> +    field = (uint32_t *)(bmp + GIC_INTERNAL);
> +    offset += (GIC_INTERNAL * 8) / 8;
>      for_each_dist_irq_reg(irq, s->num_irq, 8) {
>          reg = *field;
>          kvm_gicd_access(s, offset, &reg, true);
> 
