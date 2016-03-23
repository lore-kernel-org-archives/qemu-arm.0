Received: by 10.25.208.211 with SMTP id h202csp3323lfg;
        Wed, 23 Mar 2016 05:33:35 -0700 (PDT)
X-Received: by 10.141.28.202 with SMTP id f193mr3167936qhe.53.1458736415498;
        Wed, 23 Mar 2016 05:33:35 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p105si2008196qgp.1.2016.03.23.05.33.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Mar 2016 05:33:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43845 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aihyg-0000sW-Qv
	for alex.bennee@linaro.org; Wed, 23 Mar 2016 08:33:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54143)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aihye-0000rq-Lp
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 08:33:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aihya-0003sl-DJ
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 08:33:31 -0400
Received: from mail-lf0-x22d.google.com ([2a00:1450:4010:c07::22d]:34530)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1aihya-0003sV-6d; Wed, 23 Mar 2016 08:33:28 -0400
Received: by mail-lf0-x22d.google.com with SMTP id c62so6826690lfc.1;
	Wed, 23 Mar 2016 05:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=LSDsbyIety6tw7bsZHQjMeAlwGT2NCWRpnPoyUlOAVI=;
	b=eGx0OkTizGTGFhX2jj4JP7I0LYUe8hBlRteW1FWIDCVu/XdAqWkRxI9bRfKIetGGYr
	vmL12aZiIlpXomjtduphlNcJQZjWnExkHbbKbK6P65q3lwaIksDLpD62qObpZ7f0yu0n
	Dkzd3CHUrEWtt10lnCodTBrYHGNJ4mJJnZaos1TojmsLfj65Hb2Lygl6SchCQGi7z459
	5jISkH/s9V49vUP/KzyeeY7IwkCwPm2ZKrVA9S5kXyOB0+BEQ5DJq/NMWsHZzDDk4Nq6
	bpy8Lx/7mYbcMhhlJnWP68VRnPKmAkYZfwnMFpn7BGoJbhYD7swML0TbQACODg8XqgBK
	VgWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=LSDsbyIety6tw7bsZHQjMeAlwGT2NCWRpnPoyUlOAVI=;
	b=OTwqnTI2mi2bdLN9zdout7N9xnvKZHTG2HR5HqYDbZQ7Zf93CYOyUIrJ4HTs8mr/RU
	V9unp6KznIMaqmGTqDU3RU6chDPsPmJ+3YZo4E3k38WuYSft1s+wBSC05bNJSuzSJ/Tw
	XVGeknv6E5kWBCHMk7W11xMoCtDJ+L48LmjBCNM1xsvrKlMv15ik5U5WccmgFhlD7Ns7
	qbxs84Rz3wus3F/DuJQWLrlO1mn++y5asRWyW/8OVuXLstBYs/cTcviBbtcpV9Me41t1
	+sffZZqJHOkpKy33RTEtVaTehKmvm0279sGdON3JdTzRrNkQDZTSDs+rzmzAJOq8O5ZQ
	Xmzw==
X-Gm-Message-State: AD7BkJJ+le2Nn093JpK+2uamYLv4Kjk6FYMNJWdd17kk9VuhKj6jrcZc5DN9e6W1Ovig/g==
X-Received: by 10.25.79.14 with SMTP id d14mr1101991lfb.98.1458736407326;
	Wed, 23 Mar 2016 05:33:27 -0700 (PDT)
Received: from [192.168.0.65] (broadband-46-188-121-115.2com.net.
	[46.188.121.115])
	by smtp.gmail.com with ESMTPSA id m65sm385315lfm.13.2016.03.23.05.33.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Mar 2016 05:33:26 -0700 (PDT)
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <1458711153-15988-1-git-send-email-peterx@redhat.com>
	<1458711153-15988-5-git-send-email-peterx@redhat.com>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56F28D15.5070302@gmail.com>
Date: Wed, 23 Mar 2016 15:33:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1458711153-15988-5-git-send-email-peterx@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::22d
Cc: peter.maydell@linaro.org, drjones@redhat.com, libvir-list@redhat.com,
	armbru@redhat.com, mdroth@linux.vnet.ibm.com,
	abologna@redhat.com, qemu-arm@nongnu.org, eblake@redhat.com
Subject: Re: [Qemu-arm] [PATCH v6 4/4] arm: implement query-gic-capabilities
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: B9Eu+G6JE2Xm

On 23/03/16 08:32, Peter Xu wrote:
> diff --git a/target-arm/monitor.c b/target-arm/monitor.c
> index 254a9c9..4a2db59 100644
> --- a/target-arm/monitor.c
> +++ b/target-arm/monitor.c
> @@ -21,8 +21,66 @@
(snip)
>  GICCapabilityResult *qmp_query_gic_capabilities(Error **errp)
>  {
> -    return NULL;
> +    GICCapabilityResult *result = g_new0(GICCapabilityResult, 1);
> +    GICCapabilityList *head = NULL;
> +    GICCapability *v2 = gic_cap_new(2), *v3 = gic_cap_new(3);
> +
> +    v2->emulated = true;
> +    /* FIXME: we'd change to true after we get emulated GICv3. */

Maybewe'd better use'NOTE:' or 'TODO:' instead of 'FIXME:'?

> +    v3->emulated = false;
> +
> +#ifdef CONFIG_KVM
> +    {
> +        int fdarray[3];
> +
> +        if (!kvm_arm_create_scratch_host_vcpu(NULL, fdarray, NULL)) {
> +            goto out;
> +        }
> +
> +        /* Test KVM GICv2 */
> +        if (kvm_support_device(fdarray[1], KVM_DEV_TYPE_ARM_VGIC_V2)) {
> +            v2->kernel = true;
> +        }
> +
> +        /* Test KVM GICv3 */
> +        if (kvm_support_device(fdarray[1], KVM_DEV_TYPE_ARM_VGIC_V3)) {
> +            v3->kernel = true;
> +        }
> +
> +        kvm_arm_destroy_scratch_host_vcpu(fdarray);
> +out:
> +        ;
> +    }
> +#endif

Probably, it would be neater to put KVM part into a separate static
inline function.

Kind regards,
Sergey

> +
> +    head = gic_cap_list_add(head, v2);
> +    head = gic_cap_list_add(head, v3);
> +
> +    result->capabilities = head;
> +
> +    return result;
>  }

