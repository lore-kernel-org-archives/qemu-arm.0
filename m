Received: by 2002:a17:906:70a:b0:9d0:bf65:29fa with SMTP id y10csp293872ejb;
        Tue, 31 Oct 2023 06:49:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8k8Bb/kI4Voe4AhZr7ER2+cURZ7QHqFPO5yZ5mUfmq5TJC2jnY7AIl9ipCkjo7GtvmErV
X-Received: by 2002:a05:620a:318a:b0:778:e431:3ef1 with SMTP id bi10-20020a05620a318a00b00778e4313ef1mr4148846qkb.32.1698760188154;
        Tue, 31 Oct 2023 06:49:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698760188; cv=none;
        d=google.com; s=arc-20160816;
        b=bOOZ3as7o3X80WN0BxWQNRcYH46/a6A7cos7DFePLJE+TGE/e56UtbC0i0SMJhL1z2
         nEM8wDduP5bNu0mWq+JV73mKxKDyMFNv57dbtAsvivWBZ2U6qLKmA+OZZJtQiI+Gp284
         p7Cfn9F9C8BsxDlbmNhA6aCOpXia5chkIGj9LteRkJTvcIt3T4Bws9rPM0B7yyfg9/vK
         kUNzmSMSlGebd8tTtg0Z/UFIkuDGNgrbtCv8o+9S3VfQCQrjmqdDNADPBSmiGb/xgKkh
         gXQcy35amsSQSpL7z/siwEMWDqZf78KEsIeMect5rMf5j1nYBBYcp+KQsXvmlUT9NIci
         +N1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=4i99DJfkgIhPzdJU4QRsZ/OkV6XLN9AK7OBs5pamFbU=;
        fh=Nusx70EtXMF8gdYoOVgP9eW+eKnIcoALoVz0NeuRzzg=;
        b=rRXoDMI/SadNeltATjW4jXd6WMKG5/PfNQhHOvGe4SR5ZwGVMn6q80/68BkV386uz0
         Xhe/cU0n6uS2l6d/6/D+XIiAZsLBVko8eoeBPXx/nmjvXof1uYUY5F3vmxwZuvfkR6ve
         Hsn6gyjXdLeNoLq/EWG/46kw6LVxttuPd3N7FD426XnCxpkcZ7qHnfLmGzM1aMYAEJnz
         HSHMTE2NKYT92iAeHrHAAq1l/FlHLO/wj50C7hdtYN1qVYV37Y0/b7Fti4b6QF3IkhuG
         JBbZm6VAaX2ClxddCf6VK+RBgK7V282RC1G5tyqmHAP768iks/WH0Gf9fy4zpCef2FvH
         BHpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EzJ1raad;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f22-20020a05620a12f600b0076daad4ad3csi1085284qkl.32.2023.10.31.06.49.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Oct 2023 06:49:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EzJ1raad;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qxp7P-0005WP-2f; Tue, 31 Oct 2023 09:49:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1qxp7N-0005Vq-Ts
 for qemu-arm@nongnu.org; Tue, 31 Oct 2023 09:49:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1qxp7L-0007HF-Eg
 for qemu-arm@nongnu.org; Tue, 31 Oct 2023 09:49:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698760152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4i99DJfkgIhPzdJU4QRsZ/OkV6XLN9AK7OBs5pamFbU=;
 b=EzJ1raadnI4ll1bzTDbVk0iGRvZ+umqX9fPNCUNqiZkrzcqvtfLV3UBQXOROJNGjK+5dTo
 UXZ7W/13ZzsGMHuaMnkLbnbvKSTBdBSxOTIZxavsdvgwVdJw5Kc6mtoIVGJ6Tl3wRcF5lk
 yZJOCPnKqdlyvYAbhCQWZduipaGzPAQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-413-1HIB55WCPUu5qomvxRt-kA-1; Tue, 31 Oct 2023 09:48:58 -0400
X-MC-Unique: 1HIB55WCPUu5qomvxRt-kA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA9B2104456A;
 Tue, 31 Oct 2023 13:48:57 +0000 (UTC)
Received: from localhost (unknown [10.42.28.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6FB651121308;
 Tue, 31 Oct 2023 13:48:57 +0000 (UTC)
Date: Tue, 31 Oct 2023 13:48:56 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-block@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 4/7] hw/scsi/virtio-scsi: Use VIRTIO_SCSI_COMMON() macro
Message-ID: <20231031134856.GL7636@redhat.com>
References: <20231017140150.44995-1-philmd@linaro.org>
 <20231017140150.44995-5-philmd@linaro.org>
 <ZUD+hMTWf9DidzDb@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZUD+hMTWf9DidzDb@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.481,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: RjREuMdf/9VR

On Tue, Oct 31, 2023 at 02:17:56PM +0100, Kevin Wolf wrote:
> Am 17.10.2023 um 16:01 hat Philippe Mathieu-Daudé geschrieben:
> > Access QOM parent with the proper QOM VIRTIO_SCSI_COMMON() macro.
> > 
> > Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> > ---
> >  hw/scsi/virtio-scsi.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
> > index 45b95ea070..fa53f0902c 100644
> > --- a/hw/scsi/virtio-scsi.c
> > +++ b/hw/scsi/virtio-scsi.c
> > @@ -761,7 +761,7 @@ static void virtio_scsi_fail_cmd_req(VirtIOSCSIReq *req)
> >  
> >  static int virtio_scsi_handle_cmd_req_prepare(VirtIOSCSI *s, VirtIOSCSIReq *req)
> >  {
> > -    VirtIOSCSICommon *vs = &s->parent_obj;
> > +    VirtIOSCSICommon *vs = VIRTIO_SCSI_COMMON(s);
> >      SCSIDevice *d;
> >      int rc;
> 
> Why is a dynamic cast more "proper" than a static type-safe access, even
> more so in a hot I/O path?
> 
> Rich Jones posted a flamegraph the other day that surprised me because
> object_class_dynamic_class_assert() and object_dynamic_cast_assert()
> were shown to be a big part of scsi_req_new(). In the overall
> performance, it's probably dwarved by other issues, but unnecessary
> little things can add up, too.

I think Kevin is referring to one of these flamegraphs:

  http://oirase.annexia.org/tmp/2023-kvm-build-on-device.svg
  http://oirase.annexia.org/tmp/2023-kvm-build.svg

Here's a zoom showing scsi_req_new (hopefully this URL is stable ...):

  http://oirase.annexia.org/tmp/2023-kvm-build-on-device.svg?s=scsi_req_new&x=512.9&y=501

Note that qemu has been compiled with QOM cast debug.  This is the
default for Fedora (not RHEL) because we'd like to get early detection
of bugs from Fedora users.

There was another patch recently where a simple change saved about 5%
of total runtime in RISC-V TCG guests (admittedly a much more hot path
than this one).

  https://lists.nongnu.org/archive/html/qemu-devel/2023-10/msg02388.html

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
Fedora Windows cross-compiler. Compile Windows programs, test, and
build Windows installers. Over 100 libraries supported.
http://fedoraproject.org/wiki/MinGW

