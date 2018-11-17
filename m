Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp628348wrw;
        Sat, 17 Nov 2018 08:10:18 -0800 (PST)
X-Google-Smtp-Source: AJdET5cUdRQ6o7IZXGbYsBHfahVwRKqc8wT9zyQ9mOdO9OsXcWcKQZcvdD3083JTEm0Jszo7H/qO
X-Received: by 2002:ac8:53c6:: with SMTP id c6mr14852510qtq.278.1542471017926;
        Sat, 17 Nov 2018 08:10:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542471017; cv=none;
        d=google.com; s=arc-20160816;
        b=LX2ugx8Qb5L1vKP3IUTg/dBumoqnkx6s2GqlTLSwd7YoN8LBXhBWl7hGj3bpVwai/U
         /W1kKaRT/NmeGg0sAoQrjeAZecObgx8i/iAgh9lsrLsEg38bshhW73WI/D/xMfFNO9q4
         wacxcOls8fY95lbfs4RxleiTZCyLhpQbRz4RKb0OED86sQ6/Bkr0YhqINCMOHvQG2rEH
         b+COvHzuim5M/ZHwJ8T6Q7ecDL5qMYDZMVSV2FsN/5m8kfTHg/Ru5O70CtaslYGJiE5m
         9UZC/kw31TL/0UvnvbsZwPtc+K/UD3Xu/4sXV1FrccZFQ678swbrudYscYSwgUt5Jepp
         yX4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=h1wZVVYfr7CXMXc37HITVU4QbqL7Tt/pQ+DnDfrCR2g=;
        b=v/jf75670StKGiu0w3or/Tw93Q9mTqVBYnAd/REcS5dfsYVEy8QMrHtJ6hQ8nYVU+k
         rGg92bcXb4bClZciS3Q2qsYuB64jVsv+dWRDhojys+B/hIXPh+0C0PijPhYh+jRFFW3e
         cV/wuWbKGwTQkpQ0/5GnUGtC5cKQ8BVwgzbmorEkqe/GIQE0qtzTE+Si5+gW3TBfRtgW
         8/kVx7PiI6BqLhoIj/Jl1npaAQdf+iwBJTaACjVPTY4me/Buh61ubUdeXBc0fVaLkSBi
         wJn9QD/zEhTWVXZVv+oz1Km4Kjta+aYItmlp/3k+gVLcMpzIS90IlCp93vTeVkgbLzQ5
         5a9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 9si1841495qkv.15.2018.11.17.08.10.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Nov 2018 08:10:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49757 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gO3An-0006e7-E7
	for alex.bennee@linaro.org; Sat, 17 Nov 2018 11:10:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47671)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gO3Ae-0006c6-UW
	for qemu-arm@nongnu.org; Sat, 17 Nov 2018 11:10:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gO3Ac-000888-BY
	for qemu-arm@nongnu.org; Sat, 17 Nov 2018 11:10:08 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35632)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gO3Ac-00087a-6K; Sat, 17 Nov 2018 11:10:06 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3640A3082126;
	Sat, 17 Nov 2018 16:10:04 +0000 (UTC)
Received: from [10.36.116.180] (ovpn-116-180.ams2.redhat.com [10.36.116.180])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 26404831BB;
	Sat, 17 Nov 2018 16:10:01 +0000 (UTC)
To: Peng Hao <peng.hao2@zte.com.cn>, peter.maydell@linaro.org
References: <1542482566-91660-1-git-send-email-peng.hao2@zte.com.cn>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <5fb48e39-d91b-6750-975b-ea58575ade92@redhat.com>
Date: Sat, 17 Nov 2018 17:10:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <1542482566-91660-1-git-send-email-peng.hao2@zte.com.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Sat, 17 Nov 2018 16:10:04 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/sysbus-fdt: fix assert
 in match function
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
X-TUID: YvNxjiUo9DHQ

Hi Peng,

On 11/17/18 8:22 PM, Peng Hao wrote:
> In match function it should not call OBJECK_CHECK. When there is
> a mismatch, we should continue to match rather than assert().

Normally this issue should have been fixed by
e9ac8e84f0  "hw/arm/sysbus-fdt: Only call match_fn callback if the type
matches". Please can you confirm?

Thanks

Eric
> 
> Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
> ---
>  hw/arm/sysbus-fdt.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
> index 0e24c80..41b962d 100644
> --- a/hw/arm/sysbus-fdt.c
> +++ b/hw/arm/sysbus-fdt.c
> @@ -419,10 +419,15 @@ static int add_amd_xgbe_fdt_node(SysBusDevice *sbdev, void *opaque)
>  static bool vfio_platform_match(SysBusDevice *sbdev,
>                                  const BindingEntry *entry)
>  {
> -    VFIOPlatformDevice *vdev = VFIO_PLATFORM_DEVICE(sbdev);
> +    VFIOPlatformDevice *vdev;
>      const char *compat;
>      unsigned int n;
>  
> +    vdev = (VFIOPlatformDevice *) object_dynamic_cast(OBJECT(sbdev),
> +                                                TYPE_VFIO_PLATFORM);
> +    if (!vdev)
> +        return false;
> +
>      for (n = vdev->num_compat, compat = vdev->compat; n > 0;
>           n--, compat += strlen(compat) + 1) {
>          if (!strcmp(entry->compat, compat)) {
> 
