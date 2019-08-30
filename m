Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp39953wrs;
        Thu, 29 Aug 2019 18:27:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzBOxeH9Gy1reQANIdaXCVacKuU5Je6/f6OwIRwfItCUC6Uc37wztww2q/Knte4y5skg9Jg
X-Received: by 2002:a17:906:512:: with SMTP id j18mr10619275eja.28.1567128427533;
        Thu, 29 Aug 2019 18:27:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567128427; cv=none;
        d=google.com; s=arc-20160816;
        b=WXJ1OO1yac+5wGXCs2AqIB3C85DtwLuKZpDj6fsjdfcQMyhs39R9pzuGkCgP2OwuPA
         MfPEP4v/oHziFAoqXy4zOVuOwZJnVzZv7SlWu4iWmdCijjWQV03QxmuJYDGqG3wncHHZ
         sKC+oHLgHX0TaVFMj43DzMRg0szLJxF0xRIPUIrJuMIhnkdqZG9zpqKe39HP1H5NyAOW
         yGTvPQ78okMTt2RmSeX7gmZ84JsXTH35b9B+unZvG5r5jnE7M2ltMLhksg0Qii5FikIB
         CA/ov20MZ86x1ccmNx3d3JFnsq66CKg2uGsGHboIDEyp7+QQWyzKsIDNsLU6KKDdFhCy
         amXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=J8xs6JgARHOvC0h7SUc+Rl1pD46T03MbPQ7996XjJiU=;
        b=oM6kOrPdz287jCkW3QDPk71RikiuWDpKz/LbeZMEp7lbFILxaz+aTrDJXFzOKPGjGE
         NCaeCinM5a6FbSJJ8FG8C98aq/3qKuB8k5iVdgtyRY9IS/zzgWGpCVYBjp4KAVRd5Eky
         C0wefoOvfT7hpINfrV6Nvn4BE/dpG+9lsjYJPLyGzKisuDenXUvGKLUXnGgAvyIXqByT
         +gGIkuWlRExKLhc0i/fsplnD1y8qT487fHA0+wRYAjCptbuD1gTalFG1LGkyVxfIEPHZ
         S9Gx5phsx6LQ97z5qNM0DJHQpZxJYpbG3NQAuYWAs89oF4XnN4FN9EnTXt13EgsdJcXY
         ayQw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s1si2539623edd.112.2019.08.29.18.27.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Aug 2019 18:27:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i3Vgv-0001HV-EY
	for alex.bennee@linaro.org; Thu, 29 Aug 2019 21:27:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45879)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1i3VgU-0001HH-7s
 for qemu-arm@nongnu.org; Thu, 29 Aug 2019 21:26:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1i3VgQ-0001Ok-8a
 for qemu-arm@nongnu.org; Thu, 29 Aug 2019 21:26:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60590)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1i3VgP-00012a-VZ
 for qemu-arm@nongnu.org; Thu, 29 Aug 2019 21:26:34 -0400
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 33AD28831C
 for <qemu-arm@nongnu.org>; Fri, 30 Aug 2019 01:26:28 +0000 (UTC)
Received: by mail-pg1-f197.google.com with SMTP id k20so3002830pgg.15
 for <qemu-arm@nongnu.org>; Thu, 29 Aug 2019 18:26:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=J8xs6JgARHOvC0h7SUc+Rl1pD46T03MbPQ7996XjJiU=;
 b=UIe+SYeGaR7OS0t6MKZTVHKrTLCBPGgtQlcdaSyiC+fKP9Z4GdH1+/f59gKSDTLIwk
 hGCaxYAlQcXvJULOQM/Bv8ozqygyQsSfmG7IHKr6a/Xchp6A+jILz7XygqcklxZeuyG2
 PerwZ0Zy+tKGTnmB72imMcX8YWoUc9bVYPDWtevfVGL14wGeELFt2yi7WTmT+LVqc4yf
 Ue8+Vd7XmjQq7UlsTYJS/AH9eZUELaDshbdMNSgX0NbJ5wmhmxDg9qv/pfcB54QSEC3h
 N0/1pinpArL8ieNTQGXjQMsE8e5HQI5mpqLmObC1P8cPO/QKubA8NWLJvKZYnBMzeAMa
 O/sg==
X-Gm-Message-State: APjAAAU4ZWrqqZnZcRTtdBPa51ng/DspWHSybmEJzOcZ9mz8g6UI7svV
 a9Vz5jpIg8WWK37N4bspKmnDSGI5sa5GhMgsGiGnP+iXBo8sGIwfW+YSc4IQ8L5QOHbHgB0cvjr
 kFLrethP5WcL3
X-Received: by 2002:a63:7a06:: with SMTP id v6mr11074370pgc.115.1567128387615; 
 Thu, 29 Aug 2019 18:26:27 -0700 (PDT)
X-Received: by 2002:a63:7a06:: with SMTP id v6mr11074355pgc.115.1567128387242; 
 Thu, 29 Aug 2019 18:26:27 -0700 (PDT)
Received: from xz-x1 ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id 19sm3339072pjc.25.2019.08.29.18.26.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 18:26:26 -0700 (PDT)
Date: Fri, 30 Aug 2019 09:26:14 +0800
From: Peter Xu <peterx@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Message-ID: <20190830012614.GK8729@xz-x1>
References: <20190730172137.23114-1-eric.auger@redhat.com>
 <20190730172137.23114-4-eric.auger@redhat.com>
 <20190815135400.GC8463@xz-x1>
 <f6a3b750-8439-7934-565b-37e1001f84d4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f6a3b750-8439-7934-565b-37e1001f84d4@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH for-4.2 v10 03/15] virtio-iommu: Add skeleton
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
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, mst@redhat.com,
 tn@semihalf.com, qemu-devel@nongnu.org, alex.williamson@redhat.com,
 qemu-arm@nongnu.org, jean-philippe@linaro.org, bharat.bhushan@nxp.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J5xGh0htKEE7

On Thu, Aug 29, 2019 at 02:18:42PM +0200, Auger Eric wrote:
> Hi Peter,
> 
> First of all, please forgive me for the delay.
> On 8/15/19 3:54 PM, Peter Xu wrote:
> > On Tue, Jul 30, 2019 at 07:21:25PM +0200, Eric Auger wrote:
> >> +static void virtio_iommu_handle_command(VirtIODevice *vdev, VirtQueue *vq)
> >> +{
> >> +    VirtIOIOMMU *s = VIRTIO_IOMMU(vdev);
> >> +    struct virtio_iommu_req_head head;
> >> +    struct virtio_iommu_req_tail tail;
> > 
> > [1]
> > 
> >> +    VirtQueueElement *elem;
> >> +    unsigned int iov_cnt;
> >> +    struct iovec *iov;
> >> +    size_t sz;
> >> +
> >> +    for (;;) {
> >> +        elem = virtqueue_pop(vq, sizeof(VirtQueueElement));
> >> +        if (!elem) {
> >> +            return;
> >> +        }
> >> +
> >> +        if (iov_size(elem->in_sg, elem->in_num) < sizeof(tail) ||
> >> +            iov_size(elem->out_sg, elem->out_num) < sizeof(head)) {
> >> +            virtio_error(vdev, "virtio-iommu bad head/tail size");
> >> +            virtqueue_detach_element(vq, elem, 0);
> >> +            g_free(elem);
> >> +            break;
> >> +        }
> >> +
> >> +        iov_cnt = elem->out_num;
> >> +        iov = g_memdup(elem->out_sg, sizeof(struct iovec) * elem->out_num);
> > 
> > Could I ask why memdup is needed here?
> Indeed I don't think it is needed and besides iov is not freed!
> 
> I got inspired from hw/net/virtio-net.c. To be honest I don't get why
> the g_memdup is needed there either. The out_sg gets duplicated and
> commands work on the duplicated data and not in place.

Oh true, I found that it's because of calling of iov_discard_front().
Please have a look at 771b6ed37e3.  Though it seems to me that
virtio-iommu does not truncate iovs so it should not be needed.

> > 
> >> +        sz = iov_to_buf(iov, iov_cnt, 0, &head, sizeof(head));
> >> +        if (unlikely(sz != sizeof(head))) {
> >> +            tail.status = VIRTIO_IOMMU_S_DEVERR;
> > 
> > Do you need to zero the reserved bits to make sure it won't contain
> > garbage?  Same question to below uses of tail.
> yes. I initialized tail.
> > 
> >> +            goto out;
> >> +        }
> >> +        qemu_mutex_lock(&s->mutex);
> >> +        switch (head.type) {
> >> +        case VIRTIO_IOMMU_T_ATTACH:
> >> +            tail.status = virtio_iommu_handle_attach(s, iov, iov_cnt);
> >> +            break;
> >> +        case VIRTIO_IOMMU_T_DETACH:
> >> +            tail.status = virtio_iommu_handle_detach(s, iov, iov_cnt);
> >> +            break;
> >> +        case VIRTIO_IOMMU_T_MAP:
> >> +            tail.status = virtio_iommu_handle_map(s, iov, iov_cnt);
> >> +            break;
> >> +        case VIRTIO_IOMMU_T_UNMAP:
> >> +            tail.status = virtio_iommu_handle_unmap(s, iov, iov_cnt);
> >> +            break;
> >> +        default:
> >> +            tail.status = VIRTIO_IOMMU_S_UNSUPP;
> >> +        }
> >> +        qemu_mutex_unlock(&s->mutex);
> >> +
> >> +out:
> >> +        sz = iov_from_buf(elem->in_sg, elem->in_num, 0,
> >> +                          &tail, sizeof(tail));
> >> +        assert(sz == sizeof(tail));
> >> +
> >> +        virtqueue_push(vq, elem, sizeof(tail));
> > 
> > s/tail/head/ (though they are the same size)?
> That's unclear to me. Similarly when checking against virtio-net.c, the
> element is pushed back to the used ring and len is set to the size of
> the status with:
> 
> /*
>  * Control virtqueue data structures
>  *
>  * The control virtqueue expects a header in the first sg entry
>  * and an ack/status response in the last entry.  Data for the
>  * command goes in between.
>  */

I was referencing the balloon code when reading the patch, e.g.,
virtio_balloon_handle_output().  Though after I read more carefully I
see that other places are using it as you described.  Now I tend to
agree with you, because virtqueue_push() who calls
virtqueue_unmap_sg() used the len to unmap in_sg[] rather than
out_sg[].  So please ignore my previous comment.

(then I'm not sure whether the usage in the balloon code was correct
 now...)

> > 
> >> +        virtio_notify(vdev, vq);
> >> +        g_free(elem);
> >> +    }
> >> +}
> > 
> > [...]
> > 
> >> +static void virtio_iommu_set_features(VirtIODevice *vdev, uint64_t val)
> >> +{
> >> +    VirtIOIOMMU *dev = VIRTIO_IOMMU(vdev);
> >> +
> >> +    dev->acked_features = val;
> >> +    trace_virtio_iommu_set_features(dev->acked_features);
> >> +}
> >> +
> >> +static const VMStateDescription vmstate_virtio_iommu_device = {
> >> +    .name = "virtio-iommu-device",
> >> +    .unmigratable = 1,
> > 
> > Curious, is there explicit reason to not support migration from the
> > first version? :)
> The state is made of red black trees, lists. For the former there is no
> VMSTATE* ready. I am working on it but I think this should be handled
> separately

Fair enough.  Would you mind to add a similar comment above
unmigratable?

Thanks,

-- 
Peter Xu
