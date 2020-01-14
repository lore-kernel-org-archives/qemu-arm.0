Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5236099lff;
        Tue, 14 Jan 2020 00:52:27 -0800 (PST)
X-Google-Smtp-Source: APXvYqy3zQHKBaZVu+emCql2pIEnXxz10FAwmsh94dIVsZlhBRefJjyba5bDPYbeeSZARqFrJWvI
X-Received: by 2002:ac8:21ec:: with SMTP id 41mr2718605qtz.242.1578991947487;
        Tue, 14 Jan 2020 00:52:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578991947; cv=none;
        d=google.com; s=arc-20160816;
        b=CFs0d7TmCqoi45xLl/7cPKDUKVJUKA+l5J5rwXffngqnsL0qQiwpVCixVBmt9mmeoU
         Li2XlrS3kpJqCyMoHEmFWBvpuS7ndiGhF086mJ5Y+ujJxGZE9dDyVgnNOYA1I8hcaKJf
         KlWYswxlGkB3jbaHyj92HbefSvkC0J3nfFVZnCg8ySFdd4gmhYAz0MBv6IqKNAPDtO6p
         9sYcLnJ3d8TNsps9+ltJnmoiJHrh22esZNfXIO2IIlR+qEVW66Twdzolksz+rO5atwnY
         G1nwrbk8Zgo2todS1DTkQO527v/DXbwdN2w/YbSODd+Mx8cqC/mVMZWSinZ0mBguDrEo
         euIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=KW6j/7/p9d/wFy990yfIHpRABNEtMDRdHbaaA/FwA8A=;
        b=n5pK5GyNzLp3yVCZD992mHSW8Ox9kWk4ewoaxoHfBqkO8Nyjh6DcvmIDvWmzE3XD4R
         A2oafE6iuyt37KHJG6NRyxzTzsRrQgWWcBCUTWboQZdR9FICgqIobsX/5ubwEBLQgFT1
         wDazflfxLBhBHeVWa3Xe4w9YfA4GVlp1MYFA7EpGRczrFN1Cn/Uhdq5r5VTO85h0Vw2o
         XDkO4qg2SWHYnKwwVC6DITgVPNq7oTWELh4c953fadQspQDiVJjwQvyMesoT9qvRJ/8D
         3KGoqTExwVQ6QGgBi6dD9ujg02W39qQB1nEwsPWYmUGp+J2PjRKznuXUhpB2Xj4Y3N35
         fCOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=E5HYTmDw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x20si7918224qtc.300.2020.01.14.00.52.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 00:52:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=E5HYTmDw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irHw2-0007px-MX
	for alex.bennee@linaro.org; Tue, 14 Jan 2020 03:52:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52336)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1irHvu-0007pi-Id
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 03:52:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1irHvt-0005Re-It
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 03:52:18 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:54449
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1irHvt-0005RW-Et
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 03:52:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578991936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KW6j/7/p9d/wFy990yfIHpRABNEtMDRdHbaaA/FwA8A=;
 b=E5HYTmDw0h1Xj2J1iWFihoIfBHjwO+bm5Pswhal9BHcMxUtJdU3q9riTRw5X57gTf3+pgE
 ETuLL2FRVmpxTPuhS6KXz0zMPCX8akTyLKKkfAXYIPaTWNVkZDbRzQqQmgdnfLEv707EuW
 cgNFlP3pcEKM9VNsN1kPzjxZOLxk+Ws=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-2nqhcLevOayN9BJ8Wrxxgw-1; Tue, 14 Jan 2020 03:52:09 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3232FDBA8;
 Tue, 14 Jan 2020 08:52:08 +0000 (UTC)
Received: from [10.36.117.108] (ovpn-117-108.ams2.redhat.com [10.36.117.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B65C980F57;
 Tue, 14 Jan 2020 08:52:00 +0000 (UTC)
Subject: Re: [PATCH v12 05/13] virtio-iommu: Endpoint and domains structs and
 helpers
To: Peter Xu <peterx@redhat.com>
References: <20200109144319.15912-1-eric.auger@redhat.com>
 <20200109144319.15912-6-eric.auger@redhat.com>
 <20200113202301.GD201624@xz-x1>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <51267d84-c805-a4a1-8084-b278721a5b3f@redhat.com>
Date: Tue, 14 Jan 2020 09:51:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200113202301.GD201624@xz-x1>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: 2nqhcLevOayN9BJ8Wrxxgw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, tnowicki@marvell.com,
 jean-philippe@linaro.org, quintela@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, bharatb.linux@gmail.com, qemu-arm@nongnu.org,
 mst@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d3mSDHAGkNVx

Hi Peter,

On 1/13/20 9:23 PM, Peter Xu wrote:
> On Thu, Jan 09, 2020 at 03:43:11PM +0100, Eric Auger wrote:
> 
> [...]
> 
>> +VirtIOIOMMUEndpoint *virtio_iommu_get_endpoint(VirtIOIOMMU *s, uint32_t ep_id);
>> +VirtIOIOMMUEndpoint *virtio_iommu_get_endpoint(VirtIOIOMMU *s, uint32_t ep_id)
> 
> Is the extra definition trying to workaround the compiler
> warning/error?

yes it does
> 
> I'm not sure whether it's only me who prefer this, but again I'd
> really perfer we move the function into the caller patch, add "static"
> as needed altogether, even if that patch can be big.

OK I will do that.
> 
>> +{
>> +    VirtIOIOMMUEndpoint *ep;
>> +
>> +    ep = g_tree_lookup(s->endpoints, GUINT_TO_POINTER(ep_id));
>> +    if (ep) {
>> +        return ep;
>> +    }
>> +    if (!virtio_iommu_mr(s, ep_id)) {
> 
> Could I ask when this will trigger?

This can happen when a device is attached to a domain and its RID does
not correspond to one of the devices protected by the iommu.

Thanks

Eric
> 
>> +        return NULL;
>> +    }
>> +    ep = g_malloc0(sizeof(*ep));
>> +    ep->id = ep_id;
>> +    trace_virtio_iommu_get_endpoint(ep_id);
>> +    g_tree_insert(s->endpoints, GUINT_TO_POINTER(ep_id), ep);
>> +    return ep;
>> +}
> 
> Thanks,
> 

