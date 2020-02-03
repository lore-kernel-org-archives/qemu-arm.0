Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4050590lfp;
        Mon, 3 Feb 2020 07:02:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqyGUa0K504omv3t4aRZdRwQusjz+zbaPRY5HmtjTALSh7lESnT0yFsHBMve2oqr5hVuoSVC
X-Received: by 2002:a05:6214:209:: with SMTP id i9mr23153369qvt.54.1580742139491;
        Mon, 03 Feb 2020 07:02:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580742139; cv=none;
        d=google.com; s=arc-20160816;
        b=KxjH9u9zIp/qI4sBr/q0WfjeZEUMdmYUR8zro3mBoN9fnXvFTsRSixkwTyrBU9Sbna
         QV6vFq1SdwF0tklpsJ5a3uvQ5wVYVZtYVQtCGHf8UOkp5ar1/IQmZYgcePTyuF1Lpy9o
         /ZwxXM8kmo+V+S6q8q8kzCvyAr8D0yR/IzXIAoR2dLn1uNorgZTU3TjSE3UcEeBeItaU
         c6tjNKB9Zre5fLjn6rCu2pUDfT4POjJdXt1XIA/aep1rTkg8X3g7cHs4C6uV71GClrWI
         O0gxQOKqVJn0ItTnbc/EqWGqFSDM7FlxyB6TCFDuUt+fpsQ+Uyi52dqIIY9d8xeVqB93
         W4nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=f1tdHEbL0o7WKYp4BEXVNY/iTYjFAcPjYJ0lzwgsDes=;
        b=dIJWDF+rz6+ZKNgcQ/kI0I/4WmHVRDwH90t1JUI9IaK+c1zE4CNwcajfIx1hUdSpob
         7la5bw/tGc7eETV3lRrvpraiDskkEGN6XbULqAgE6IZQuK0jw4eI0kYY/PLgIF6KeNiP
         GXnKCOQJxjmuOst4QuZva9rbXmyDC4xkcRLmftG8iWWj7JWDmLCX0vJardEczAq+Xsg3
         wExtw6JdFwUw2C47iQeOoUAXz701fDrUACpyxulj2lbdMp5HymBvRKsh23s2bUH/Xfrs
         0MTpn/2q7ADvcHfuYmnpTxVuDr93eQ9DeRp5J1tMsU0/YQP+SWBn09s11EkxY4n6DFFl
         IhqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IgWMvPIb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w1si11129840qvh.182.2020.02.03.07.02.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Feb 2020 07:02:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IgWMvPIb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iydEw-0007j9-Pb
	for alex.bennee@linaro.org; Mon, 03 Feb 2020 10:02:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48665)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1iydEZ-0007HL-Lu
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 10:02:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1iydEY-00027d-JD
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 10:01:55 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:25959
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1iydEY-00027R-FS
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 10:01:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580742114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f1tdHEbL0o7WKYp4BEXVNY/iTYjFAcPjYJ0lzwgsDes=;
 b=IgWMvPIbOwBxGaC4RET9ew8V+b3MISr2yggPc9UjhnWn5u0ttvBvmrqiP2lGhkUhZb/ZQo
 TH2tuhthph8zCl8m7DJ1nozyOF1/nXwIY7Fr0wTo9lRCTx1wOc/gf0f6yUD/5i8z+7G4bg
 cMHHy8Ns0rvLeyXFiThMtaDNEA73h3Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-wL-26xFaPEa2XdlG68MuBw-1; Mon, 03 Feb 2020 10:01:52 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E4E11903CA9;
 Mon,  3 Feb 2020 15:01:50 +0000 (UTC)
Received: from [10.36.116.37] (ovpn-116-37.ams2.redhat.com [10.36.116.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C7BC60BE2;
 Mon,  3 Feb 2020 15:01:42 +0000 (UTC)
Subject: Re: [PATCH v13 06/10] virtio-iommu: Implement fault reporting
To: Peter Xu <peterx@redhat.com>
References: <20200125171955.12825-1-eric.auger@redhat.com>
 <20200125171955.12825-7-eric.auger@redhat.com>
 <20200203135503.GC155875@xz-x1>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <9797ddd6-f77f-c461-5584-fdfb3d90b92a@redhat.com>
Date: Mon, 3 Feb 2020 16:01:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200203135503.GC155875@xz-x1>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: wL-26xFaPEa2XdlG68MuBw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-TUID: Lx5pBwvY0hZl

Hi Peter,

On 2/3/20 2:55 PM, Peter Xu wrote:
> On Sat, Jan 25, 2020 at 06:19:51PM +0100, Eric Auger wrote:
> 
> [...]
> 
>> +static void virtio_iommu_report_fault(VirtIOIOMMU *viommu, uint8_t reason,
>> +                                      int flags, uint32_t endpoint,
>> +                                      uint64_t address)
>> +{
>> +    VirtIODevice *vdev = &viommu->parent_obj;
>> +    VirtQueue *vq = viommu->event_vq;
>> +    struct virtio_iommu_fault fault;
>> +    VirtQueueElement *elem;
>> +    size_t sz;
>> +
>> +    memset(&fault, 0, sizeof(fault));
>> +    fault.reason = reason;
>> +    fault.flags = cpu_to_le32(flags);
>> +    fault.endpoint = cpu_to_le32(endpoint);
>> +    fault.address = cpu_to_le64(address);
>> +
>> +    for (;;) {
>> +        elem = virtqueue_pop(vq, sizeof(VirtQueueElement));
>> +
>> +        if (!elem) {
>> +            error_report_once(
>> +                "no buffer available in event queue to report event");
>> +            return;
>> +        }
>> +
>> +        if (iov_size(elem->in_sg, elem->in_num) < sizeof(fault)) {
>> +            virtio_error(vdev, "error buffer of wrong size");
>> +            virtqueue_detach_element(vq, elem, 0);
>> +            g_free(elem);
>> +            return;
>> +        }
>> +        break;
> 
> This for loop is not needed any more?  Other than that:
hum yes indeed.
> 
> Reviewed-by: Peter Xu <peterx@redhat.com>

Thanks!

Eric
> 

