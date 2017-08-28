Received: by 10.223.188.70 with SMTP id a6csp5132537wrh;
        Mon, 28 Aug 2017 16:20:39 -0700 (PDT)
X-Received: by 10.55.43.3 with SMTP id r3mr3248283qkh.1.1503962439655;
        Mon, 28 Aug 2017 16:20:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503962439; cv=none;
        d=google.com; s=arc-20160816;
        b=Cxs4K86bW/wyEGHr/Dfw87KujrFeFk84q+ExUMbssrl7tsIlfTVQUmhnV9lNegi04i
         EdVbrpuc5j2M2tP+eZjR9YeanpHV3REdLj84ytp9kmwA3fOiSomByFX7fzQEycg+IIvX
         Ez6dWihWbn09Ziq4tzkAVVNYtfSFMBBJTjoHZD1z35Jgf/mriN14LcwLpRCcz2yWffuz
         xMHQ9Zt38Wa9S3qzXbMCaxupio+YIhJ0bLHkkmf8XlxxhMO45g6Hroj3bFOIWF0HYeDA
         ESpLcOU8Kmk//NBJx8EXZKmHZLdcGtztMTsrcOd11Qr2+9EH1CS8feKK4IPlaCJcolPl
         IQOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=Vh480W7ez1NgdK6ZAdWM9TYGQ/IRW/8qyp3xuCoWMRA=;
        b=ZgZU5ty9v+RWpU+vuCJUCDzvnHpdGocbk/WHTIwl80/fdWDvh9sbbQvqMf1SEUtjpL
         3LgZz4KW2fB23NaSoRLu/fYKQiorBh3aOrQAkzUGk0PYz5rySEPV1xCEZ0Spyz+fPwXW
         0sEvCKOTYegeHk7sG824ufJ0b69n6fx24Z5yDjzJt2gynD9q6rAsjD2yURh5DmzcC2UJ
         /zGav9qhOfZCqtqV47yX4TAkp/Z3XbeHhJfEN8nZ5DT6PXm/DTmUFIOaINyYHwHnIFlq
         CwCPWWV5dmq0gXiVBltyB45sSCNYrn/rVa5Q86BjpaGqsM+fqZScXEKn2omldpe68uPh
         YiDg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x42si1428661qtk.253.2017.08.28.16.20.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Aug 2017 16:20:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41768 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dmTKf-0001Lw-8q
	for alex.bennee@linaro.org; Mon, 28 Aug 2017 19:20:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39341)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1dmTKc-0001Lr-0U
	for qemu-arm@nongnu.org; Mon, 28 Aug 2017 19:20:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1dmTKY-00077T-1Y
	for qemu-arm@nongnu.org; Mon, 28 Aug 2017 19:20:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36972)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jsnow@redhat.com>)
	id 1dmTKX-00076L-RR; Mon, 28 Aug 2017 19:20:29 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8F40E285B2;
	Mon, 28 Aug 2017 23:20:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 8F40E285B2
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=jsnow@redhat.com
Received: from [10.18.17.231] (dhcp-17-231.bos.redhat.com [10.18.17.231])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D4D395C588;
	Mon, 28 Aug 2017 23:20:27 +0000 (UTC)
To: Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org
References: <1503543783-17192-1-git-send-email-thuth@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <085793af-0342-c36e-53fd-e30eb23ef722@redhat.com>
Date: Mon, 28 Aug 2017 19:20:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1503543783-17192-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 28 Aug 2017 23:20:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-2.11] hw/ide/microdrive:
 Mark the dscm1xxxx device with user_creatable = false
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VwjVYF51H+4y



On 08/23/2017 11:03 PM, Thomas Huth wrote:
> QEMU currently aborts with an assertion message when the user is trying
> to remove a dscm1xxxx again:
> 
> $ aarch64-softmmu/qemu-system-aarch64 -S -M integratorcp -nographic
> QEMU 2.9.93 monitor - type 'help' for more information
> (qemu) device_add dscm1xxxx,id=xyz
> (qemu) device_del xyz
> **
> ERROR:qemu/qdev-monitor.c:872:qdev_unplug: assertion failed: (hotplug_ctrl)
> Aborted (core dumped)
> 
> Looks like this device has to be wired up in code and is not meant
> to be hot-pluggable, so let's mark it with user_creatable = false.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/ide/microdrive.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/hw/ide/microdrive.c b/hw/ide/microdrive.c
> index e3fd30e..17917c0 100644
> --- a/hw/ide/microdrive.c
> +++ b/hw/ide/microdrive.c
> @@ -575,12 +575,15 @@ PCMCIACardState *dscm1xxxx_init(DriveInfo *dinfo)
>  static void dscm1xxxx_class_init(ObjectClass *oc, void *data)
>  {
>      PCMCIACardClass *pcc = PCMCIA_CARD_CLASS(oc);
> +    DeviceClass *dc = DEVICE_CLASS(oc);
>  
>      pcc->cis = dscm1xxxx_cis;
>      pcc->cis_len = sizeof(dscm1xxxx_cis);
>  
>      pcc->attach = dscm1xxxx_attach;
>      pcc->detach = dscm1xxxx_detach;
> +    /* Reason: Needs to be wired-up in code, see dscm1xxxx_init() */
> +    dc->user_creatable = false;
>  }
>  
>  static const TypeInfo dscm1xxxx_type_info = {
> 

OK; I'll look into Paolo's suggestion as a further fix, but whether or
not we treat this property as a hint, it should be set anyway as you say.

Reviewed-by: John Snow <jsnow@redhat.com>

Thanks, applied to my IDE tree:

https://github.com/jnsnow/qemu/commits/ide
https://github.com/jnsnow/qemu.git

--js
