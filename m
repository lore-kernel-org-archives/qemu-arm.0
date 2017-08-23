Received: by 10.223.188.70 with SMTP id a6csp984238wrh;
        Wed, 23 Aug 2017 10:21:31 -0700 (PDT)
X-Received: by 10.200.11.76 with SMTP id m12mr4400815qti.235.1503508891733;
        Wed, 23 Aug 2017 10:21:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503508891; cv=none;
        d=google.com; s=arc-20160816;
        b=mDr+mQS3ldV3YhxGRfd3VSYVTZcZyFA5yqkoouxEaQTIoBmj0HxlwakP8gG1wz3sHw
         rkXtWH7U8NeOur0T+gEWUUqxGoBlXB3e8oNYTazessRZffTJ/gaV6OfwX/gb9mTx6eZ7
         /tKbQfkQJ2T6NQwni7aLfmmxreyepOg7bRTSuFDpw35K1cQV+fQPwyFNQo6xXATCuGAf
         MWkp34OuNWfi0EO4OFQ4/WjjFQwL5i39NHjSmZbJ4V0yRmohHyQ8JwwwoRTtbk7uepN/
         82PHqS9p1BdjkVwchpr4IXMF/awrqNVauUqp+v+Qh1oWzruOTkYtRqezVyU21PV9q49s
         mmwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:arc-authentication-results;
        bh=imFfqKZV/0pagWNqQ64Ju63E8Toc7rTTjQd4nTSoWKU=;
        b=RhgXil/eXygxr6XZ7vj5YVMrX52iWqKt20CJtOWPMpprApu2zRU/i55DcHJPYTfcYP
         suAhIdjFnpKQ6MBXJ9fHpF+8IucHNMGdpaBHlrrQt4p0wrohyb+vbw03O0lVnCBq+tRe
         uM7bIDiTfqaqCCrL/+jL7QnWPYkKrRBxZwMUrikQQ+69MNCg8kCHCjZ6NfNJ2H0LsnaA
         TsEJZUzJ2lNos7tqeHhrFuF9dRCd5me7NYIKmLdJ92HJr18jFgeskMc5c75ZkcoKyQXO
         U7MEjJlCYs3lpaD5ipJni/Tc9ICL3YoYS1MQpCryW49fBNvRhYEIz1VwmwOTz8eazitj
         VHmw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t54si1877518qtj.30.2017.08.23.10.21.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Aug 2017 10:21:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44931 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dkZLN-0003IG-F1
	for alex.bennee@linaro.org; Wed, 23 Aug 2017 13:21:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59973)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dkZLK-0003Hn-LP
	for qemu-arm@nongnu.org; Wed, 23 Aug 2017 13:21:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dkZLF-00008p-Mu
	for qemu-arm@nongnu.org; Wed, 23 Aug 2017 13:21:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57642)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1dkZLF-000089-GD; Wed, 23 Aug 2017 13:21:21 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7D91E806C0;
	Wed, 23 Aug 2017 17:21:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 7D91E806C0
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=ehabkost@redhat.com
Received: from localhost (ovpn-116-4.gru2.redhat.com [10.97.116.4])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 56E558260F;
	Wed, 23 Aug 2017 17:21:19 +0000 (UTC)
Date: Wed, 23 Aug 2017 14:21:18 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20170823172118.GQ19998@localhost.localdomain>
References: <1503416789-32080-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1503416789-32080-1-git-send-email-thuth@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.0 (2017-02-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 23 Aug 2017 17:21:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH] hw/arm/allwinner-a10: Mark the allwinner-a10
 device with user_creatable = false
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
Cc: Beniamino Galvani <b.galvani@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: biO2CN0eO3o5

On Tue, Aug 22, 2017 at 05:46:29PM +0200, Thomas Huth wrote:
> QEMU currently exits unexpectedly when the user accidentially
> tries to do something like this:
> 
> $ aarch64-softmmu/qemu-system-aarch64 -S -M integratorcp -nographic
> QEMU 2.9.93 monitor - type 'help' for more information
> (qemu) device_add allwinner-a10
> Unsupported NIC model: smc91c111
> 
> Exiting just due to a "device_add" should not happen. Looking closer
> at the the realize and instance_init function of this device also
> reveals that it is using serial_hds and nd_table directly there, so
> this device is clearly not creatable by the user and should be marked
> accordingly.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/arm/allwinner-a10.c    | 2 ++
>  scripts/device-crash-test | 1 -
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
> index f62a9a3..43a3f01 100644
> --- a/hw/arm/allwinner-a10.c
> +++ b/hw/arm/allwinner-a10.c
> @@ -118,6 +118,8 @@ static void aw_a10_class_init(ObjectClass *oc, void *data)
>      DeviceClass *dc = DEVICE_CLASS(oc);
>  
>      dc->realize = aw_a10_realize;
> +    /* Reason: Uses serial_hds in realize and nd_table in instance_init */
> +    dc->user_creatable = false;

I assume this patch will be replaced by one changing TYPE_DEVICE
to default to user_creatable=false, based on the replies to the
hw/misc/auxbus.c patch?


>  }
>  
>  static const TypeInfo aw_a10_type_info = {
> diff --git a/scripts/device-crash-test b/scripts/device-crash-test
> index 8eb2d02..74aee68 100755
> --- a/scripts/device-crash-test
> +++ b/scripts/device-crash-test
> @@ -187,7 +187,6 @@ ERROR_WHITELIST = [
>      {'log':r"Device [\w.,-]+ can not be dynamically instantiated"},
>      {'log':r"Platform Bus: Can not fit MMIO region of size "},
>      # other more specific errors we will ignore:
> -    {'device':'allwinner-a10', 'log':"Unsupported NIC model:"},
>      {'device':'.*-spapr-cpu-core', 'log':r"CPU core type should be"},
>      {'log':r"MSI(-X)? is not supported by interrupt controller"},
>      {'log':r"pxb-pcie? devices cannot reside on a PCIe? bus"},
> -- 
> 1.8.3.1
> 

-- 
Eduardo
