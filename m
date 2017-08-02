Received: by 10.25.44.15 with SMTP id s15csp6123000lfs;
        Wed, 2 Aug 2017 06:10:43 -0700 (PDT)
X-Received: by 10.159.48.16 with SMTP id h16mr16624033uab.102.1501679443141;
        Wed, 02 Aug 2017 06:10:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501679443; cv=none;
        d=google.com; s=arc-20160816;
        b=JO0lfn7m92iEqt3eurnjeEU0JSNeV0zI3uMW05AYSAX2Mn+LEys+KL29EDwNnOwcuA
         wi50oIpgpR+uzZ6APnrPwzF/NM81cWEu4Trq0zqAk6hP0rOQ3mLmRY7MyapNifDkcIwS
         //Tp/appdvnH0HkkN6IUE7xnAaA3hqHMZwms+mP6mN/iNPntWJGiQ4XVJJSaZCsHiWUN
         xykb1wd3zBg7RN69lhXaS9Fb7Z6vYsyOhig6jQEnxIsLquFrcFYlxTnnWgI42V2FLelU
         VjArFhWfooaP8W0opQ6kEfp4zIIGY8Hj9s/bBzYv4sMMcMsBewx/+8PF294O8h9vartJ
         qVvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:arc-authentication-results;
        bh=N1siq1uKtUgH2hiMXVmVQ6A/k/M5b+eeEM7D/djmhxY=;
        b=XzoJ7SnabGmSYyrX+pcjr5lcVBq33EhKwY2HgLev6LfXfWHRDJA8NaZeWTM6bNSYuA
         NTmv9Hc5PlosUKq69Do7o0le9F9QJsJ+w5sBebSOFox35kLwcjJSjsAJMORW7jVmaJjs
         +Nwlzy04I1fN7JksnZILl5t56lr/wcVHWIsLUGWBu7CQHNqmLAvZotn8yUs+JWlAqGaM
         BMK7pKl3djFSnGGf4k3rk7xX1NZknoscy1bTYSjaay3Mx6ahCZxrmqdi+g5+N7UeyHyn
         SKilFt7CCWiXgHSXA/YBl3bdWrTb13gs0t5oVahRkhxTWvvrfzy+diIf0EjZcXG1zs+K
         PI/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id j3si13708726vki.1.2017.08.02.06.10.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Aug 2017 06:10:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47772 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dctQ8-0006tv-Co
	for alex.bennee@linaro.org; Wed, 02 Aug 2017 09:10:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33812)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dctQ2-0006tp-Vf
	for qemu-arm@nongnu.org; Wed, 02 Aug 2017 09:10:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dctPy-00083v-1A
	for qemu-arm@nongnu.org; Wed, 02 Aug 2017 09:10:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39300)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1dctPx-0007yb-Rg; Wed, 02 Aug 2017 09:10:29 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 383DF10E08;
	Wed,  2 Aug 2017 13:10:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 383DF10E08
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=ehabkost@redhat.com
Received: from localhost (ovpn-116-46.gru2.redhat.com [10.97.116.46])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C8A9A7F568;
	Wed,  2 Aug 2017 13:10:22 +0000 (UTC)
Date: Wed, 2 Aug 2017 10:10:21 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20170802131021.GF3108@localhost.localdomain>
References: <20170801230155.21083-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170801230155.21083-1-ehabkost@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.0 (2017-02-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 02 Aug 2017 13:10:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH] virtio: Mark virtio-device as
 non-user-creatable
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mB81Ahe9Q72g

On Tue, Aug 01, 2017 at 08:01:55PM -0300, Eduardo Habkost wrote:
> TYPE_VIRTIO_DEVICE devices are already not usable with -device
> and device_add, but they are reported as user-creatable on
> "-device help" and through monitor interfaces.
> 
> Mark them as not user-creatable to avoid confusing users, and to
> allow automated testing (e.g. scripts/device-crash-test) to skip
> them.
> 
> Before this patch, device-crash-test will try to test
> virtio-device devices with all machine-types:
> 
>   $ time ./scripts/device-crash-test -D virtio-device -v ./x86_64-softmmu/qemu-system-x86_64
>   [...]
>   INFO: Total: 1088 test cases
>   INFO: Skipped 408 test cases
> 
>   real    0m49.775s
> 
> After this patch, the script won't try to test virtio-device
> devices:
> 
>   $ time ./scripts/device-crash-test -D virtio-device -v ./x86_64-softmmu/qemu-system-x86_64
>   INFO: Total: 0 test cases
> 
>   real    0m0.092s
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
>  hw/virtio/virtio.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index 464947f..c4bdb94 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -2653,6 +2653,17 @@ static void virtio_device_class_init(ObjectClass *klass, void *data)
>      dc->unrealize = virtio_device_unrealize;
>      dc->bus_type = TYPE_VIRTIO_BUS;
>      dc->props = virtio_properties;
> +    /*
> +     * Reason:
> +     * - TYPE_VIRTIO_DEVICE devices are not visible to guests
> +     *   unless they are created and controlled by transport-specific
> +     *   devices (virtio-pci, virtio-mmio, and virtio-ccw).
> +     * - A TYPE_VIRTIO_BUS bus is never available for plugging
> +     *   using -device/device_add, as virtio-bus buses are
> +     *   created on the fly and immediately populated by the
> +     *   transport-specific devices' realize methods.
> +     */

Oops, I just found out that this is not true on virtio-mmio:
unused virtio-mmio-bus buses are available for plugging when
virtio-mmio devices are created.

So at least on arm, there are virtio-bus buses where
virtio-device devices can be plugged by users, and this patch is
incorrect.

> +    dc->user_creatable = false;
>      vdc->start_ioeventfd = virtio_device_start_ioeventfd_impl;
>      vdc->stop_ioeventfd = virtio_device_stop_ioeventfd_impl;
>  
> -- 
> 2.9.4
> 

-- 
Eduardo
