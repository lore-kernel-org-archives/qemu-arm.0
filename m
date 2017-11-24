Received: by 10.223.159.82 with SMTP id f18csp2113919wrg;
        Fri, 24 Nov 2017 05:41:48 -0800 (PST)
X-Google-Smtp-Source: AGs4zMaGZHFmeqDC+8h5Jo0+Lk6/25FORWFE0o5s/Up9D7WStiBb12ELXuS4jeBqZFzwrw3nP3Ro
X-Received: by 10.37.86.10 with SMTP id k10mr14272266ybb.65.1511530908594;
        Fri, 24 Nov 2017 05:41:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511530908; cv=none;
        d=google.com; s=arc-20160816;
        b=cHuyfedeCNgY7jzBhqnd/zRkMDXc46uWs1rbeATZUx8nbOnV+TryBhAlPlSexesymW
         cfZfaNinHWxAB5VP2i8hBSUwkf7/+oNpfXFMCX+mtczn5z5UyFchd8n1ArXdjTgz9KKY
         JmIsw4Piy24DqsajpquHVhxm+Uw5S5JDSxU+Q/aWLROFZ90v22lzurvUcgONpfLdcHse
         1uJujVHxADfkSEklsMxvGFS6YRD2pUk12LgAgGTn1QVnjs2LHGIM5sdOpcMmFJdKz9Z9
         9BvU2bRLLDEhGX8nHuc7kme5cYb/lALc3t1aBjWro5iJuKVOKmYkas7yh5CIrplOIKlj
         aPsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=EUk2R8RPB1VUp/i3xXE6EuWvgoLmQyCTRKDG3+wFaQQ=;
        b=tsS8hDfYSMwyT2bY+oCVWNlgIeI/KV54i7ipjdUHnWNvcpagVtJ/q3t2DHwc/u97fg
         ddlvX6+qy2v66D7ifR7SAZccTuRHGfmM5hwBJYybFyqsf8sSV0UVRTXGQ7tWzTX9BNlP
         9ObInfp2KtKtWG95JPXdEnUzj+BGe//Gy7WzucxvsSGMEKy9cfHFGd3QRNSeIjYq76dU
         HB9OnNWPH8hAZKcfXeEEqnVc1w90BwT5j4kZn2HuLk9pT2TK2pNVuTSfHdC89EItVkjp
         sWVMU9VrSg/Fday4E9LB5dXJs/yGJhb2WIPo8oZjAe1gd+J/ztXOKdS/+kaoV1Uirr/F
         H5Mg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=F8d1OGtE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r196si2739144ywe.581.2017.11.24.05.41.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Nov 2017 05:41:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=F8d1OGtE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49347 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eIEEm-0000xN-1w
	for alex.bennee@linaro.org; Fri, 24 Nov 2017 08:41:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48705)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eIEEU-0000ub-Qs
	for qemu-arm@nongnu.org; Fri, 24 Nov 2017 08:41:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eIEEU-0001EX-1E
	for qemu-arm@nongnu.org; Fri, 24 Nov 2017 08:41:30 -0500
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:36593)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eIEET-0001E3-SN
	for qemu-arm@nongnu.org; Fri, 24 Nov 2017 08:41:29 -0500
Received: by mail-ot0-x242.google.com with SMTP id t79so18815246ota.3
	for <qemu-arm@nongnu.org>; Fri, 24 Nov 2017 05:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EUk2R8RPB1VUp/i3xXE6EuWvgoLmQyCTRKDG3+wFaQQ=;
	b=F8d1OGtEnYo9xlyRPauaY0V0UkFBO3svRYuAsuTAcrIXO2Eg5K7R8MbXHUN01qGw9a
	29Q2PQ0QtH8y+gGPWqgjK+KEiMP+JK5YS599I1x9zhyyA1Aem3WJF6/ObusPujJvLiLI
	+SHCv4y4YzDp9D6blbJVBxckjYBIcCd6ECTLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EUk2R8RPB1VUp/i3xXE6EuWvgoLmQyCTRKDG3+wFaQQ=;
	b=fXVWJ1ufCabZcEFpFrtwjUk8ymyp7gAcPty0icWjQQgmS1wF6sxd7C095FVuHsl4g2
	IBs8jRorcSV37UlNcnN2JdsOJaDWAAob2zcXT5791brFxncwP38uWCvfx+5NNUDEB4BQ
	ztP+jcMqmPdxh9nEVwpar5YBoCnig0jokuSBW09gGNzz5EmYjsxuNyis2wuBGkZ1TyxA
	JiytZT1Sp1IWxpKquolAqX7kOZzqPBo29p8XGnVKcezd90SGsN/L3Go0okniQhPZ46No
	TWQ8uvUlxgnQRJZZZeFzpcRctpUQ/UzdQiRLl9kyWXSv1JyBMQbH+yBt2kOlBnHYPhO2
	NHYA==
X-Gm-Message-State: AJaThX6HM4+0lED4bUPK6KYFjFDlEADjGVnjGnDQ76rI9+Oh9Wk3X/Hl
	swKETzfDPiEMlJSGEnPY53R0OSA9CktrVNdp0AzV2g==
X-Received: by 10.157.37.173 with SMTP id q42mr18827462ota.116.1511530889222; 
	Fri, 24 Nov 2017 05:41:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Fri, 24 Nov 2017 05:41:08 -0800 (PST)
In-Reply-To: <1511530238-18318-2-git-send-email-eric.auger@redhat.com>
References: <1511530238-18318-1-git-send-email-eric.auger@redhat.com>
	<1511530238-18318-2-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Nov 2017 13:41:08 +0000
Message-ID: <CAFEAcA_54_CVmkNM=4ufFJzYT5hWhgcfjt6wGFsuVBJnnC0+4Q@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
Subject: Re: [Qemu-arm] [PATCH v4 1/4] hw/intc/arm_gicv3_its: Don't call
 post_load on reset
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
Cc: Andrew Jones <drjones@redhat.com>, Vijay Kilari <vijay.kilari@gmail.com>,
	Juan Quintela <quintela@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, wu.wubin@huawei.com,
	wanghaibin.wang@huawei.com, Christoffer Dall <christoffer.dall@linaro.org>,
	eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eNdu0Y34OWma

On 24 November 2017 at 13:30, Eric Auger <eric.auger@redhat.com> wrote:
> From the very beginning, post_load() was called from common
> reset. This is not standard and obliged to discriminate the
> reset case from the restore case using the iidr value.
>
> Let's get rid of that call.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/intc/arm_gicv3_its_common.c | 2 --
>  hw/intc/arm_gicv3_its_kvm.c    | 4 ----
>  2 files changed, 6 deletions(-)
>
> diff --git a/hw/intc/arm_gicv3_its_common.c b/hw/intc/arm_gicv3_its_common.c
> index f2cce59..2bd2f0f 100644
> --- a/hw/intc/arm_gicv3_its_common.c
> +++ b/hw/intc/arm_gicv3_its_common.c
> @@ -131,8 +131,6 @@ static void gicv3_its_common_reset(DeviceState *dev)
>      s->creadr = 0;
>      s->iidr = 0;
>      memset(&s->baser, 0, sizeof(s->baser));
> -
> -    gicv3_its_post_load(s, 0);
>  }
>
>  static void gicv3_its_common_class_init(ObjectClass *klass, void *data)
> diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
> index 6fb45df..b1b322b 100644
> --- a/hw/intc/arm_gicv3_its_kvm.c
> +++ b/hw/intc/arm_gicv3_its_kvm.c
> @@ -155,10 +155,6 @@ static void kvm_arm_its_post_load(GICv3ITSState *s)
>  {
>      int i;
>
> -    if (!s->iidr) {
> -        return;
> -    }
> -
>      kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
>                        GITS_IIDR, &s->iidr, true, &error_abort);
>
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
