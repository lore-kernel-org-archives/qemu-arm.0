Received: by 2002:a17:906:70a:b0:9d0:bf65:29fa with SMTP id y10csp413809ejb;
        Tue, 31 Oct 2023 09:42:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFF4j1HnMUcjk5ItoSp3vD0XmXLxm19vz1a6zJZpfpiL9LnwA9dtxWR71wTrGshWFMjVvja
X-Received: by 2002:a05:622a:1494:b0:41e:303c:59e4 with SMTP id t20-20020a05622a149400b0041e303c59e4mr16839662qtx.47.1698770577953;
        Tue, 31 Oct 2023 09:42:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698770577; cv=none;
        d=google.com; s=arc-20160816;
        b=GiJheduixtBkkXHdnPssjybCvFvUbI4GLt9THXox+LOYqiPiSYunKyyhNNUTJQWs4L
         FBJMWBg8fwSrML/jE4XkHAbmyklswyZoWIK9BCGbacLndbftJ+bT6lJyHuH01g3EhqXM
         8vM2xERXeOWJ4LxqQGIIjAA1cs4nfg/7bk/JaUOBXqXTdpkuRaCUQaTkDUO/DpKEToys
         4YXpXXOmOImJGXZC6yETmLHRL/17Pqa3lt2ZtIyrQ79J2Z7gFVAMVQAMTq1hCMT3PC7o
         kRcTLEPuGUJTVIB5ouifhi9wlUfECseO0DvaRmnyRinj7fKt0WKui1szV+E6FQElPFFa
         Sm0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=6q1DKFuXqdbFiP4EZ7qBXO6yMoSDoF9p9mJu63+CwC4=;
        fh=6h0AC/6RTcjvJ69BUCK4qEpNF9rhYGPKZYZMUGKmfwA=;
        b=gPShk7C4LEsqZvTP46ZdMBmOh2/dTnxZdfqaInipKqi0yZS6GqWShPEFiCUURwXuPj
         hMeasxFCcvFrokS+RH3XepcZg9n+JY0RYS8j+J6sjCzvaX6CNphdXn0Wgtg0730A5DqJ
         iPBOj5h2tWbArn0TSu9NZPgyWOKFJaf+CHEx3gBzj4cDf/7njCOAyOsxhCHLFBkM0vWb
         jiJY9AJper/XKC2o63iBsLbF2ZD28r8EeB+fp3OvF8AWgBwOXvElR/wMI7Ntoum6w/wC
         Nt6UwVOF7cKHF/Wy+vOlJeXT1EXesoiZthj2gs+DT7A3aR1mcAaLxc1q8Ihn5+PmVKXP
         VZBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fKki4Hr2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z9-20020ac87f89000000b0041819b16cf3si1411104qtj.27.2023.10.31.09.42.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Oct 2023 09:42:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fKki4Hr2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qxrpL-0000N7-MD; Tue, 31 Oct 2023 12:42:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1qxrpK-0000Mf-MP
 for qemu-arm@nongnu.org; Tue, 31 Oct 2023 12:42:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1qxrpJ-0006ao-35
 for qemu-arm@nongnu.org; Tue, 31 Oct 2023 12:42:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698770568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6q1DKFuXqdbFiP4EZ7qBXO6yMoSDoF9p9mJu63+CwC4=;
 b=fKki4Hr2auBDAXxz330xDPbC8M8SbMtUDeX/cPf7dhLD3/8HUCiFRkZR2KVTQjItBaROsn
 Z9rRdHXyLHD9js0rtlODJr14u4Dg599ABgnkqEPVoepEWz9V5BC6JBBUu2QGynLtc4nAlR
 8WAgNtsv+u9lpsDUSx11NGrjuzUXXas=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-47-aVbB29EIMUKRF6w7pDIAWw-1; Tue, 31 Oct 2023 12:42:46 -0400
X-MC-Unique: aVbB29EIMUKRF6w7pDIAWw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 036DC811E7B;
 Tue, 31 Oct 2023 16:42:46 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.218])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C561A1121306;
 Tue, 31 Oct 2023 16:42:38 +0000 (UTC)
Date: Tue, 31 Oct 2023 17:42:37 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
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
Message-ID: <ZUEufXxY8xXdZj9z@redhat.com>
References: <20231017140150.44995-1-philmd@linaro.org>
 <20231017140150.44995-5-philmd@linaro.org>
 <ZUD+hMTWf9DidzDb@redhat.com> <20231031134856.GL7636@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231031134856.GL7636@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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
X-TUID: I6khfvML4OZm

Am 31.10.2023 um 14:48 hat Richard W.M. Jones geschrieben:
> On Tue, Oct 31, 2023 at 02:17:56PM +0100, Kevin Wolf wrote:
> > Am 17.10.2023 um 16:01 hat Philippe Mathieu-Daudé geschrieben:
> > > Access QOM parent with the proper QOM VIRTIO_SCSI_COMMON() macro.
> > > 
> > > Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> > > ---
> > >  hw/scsi/virtio-scsi.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
> > > index 45b95ea070..fa53f0902c 100644
> > > --- a/hw/scsi/virtio-scsi.c
> > > +++ b/hw/scsi/virtio-scsi.c
> > > @@ -761,7 +761,7 @@ static void virtio_scsi_fail_cmd_req(VirtIOSCSIReq *req)
> > >  
> > >  static int virtio_scsi_handle_cmd_req_prepare(VirtIOSCSI *s, VirtIOSCSIReq *req)
> > >  {
> > > -    VirtIOSCSICommon *vs = &s->parent_obj;
> > > +    VirtIOSCSICommon *vs = VIRTIO_SCSI_COMMON(s);
> > >      SCSIDevice *d;
> > >      int rc;
> > 
> > Why is a dynamic cast more "proper" than a static type-safe access, even
> > more so in a hot I/O path?
> > 
> > Rich Jones posted a flamegraph the other day that surprised me because
> > object_class_dynamic_class_assert() and object_dynamic_cast_assert()
> > were shown to be a big part of scsi_req_new(). In the overall
> > performance, it's probably dwarved by other issues, but unnecessary
> > little things can add up, too.
> 
> I think Kevin is referring to one of these flamegraphs:
> 
>   http://oirase.annexia.org/tmp/2023-kvm-build-on-device.svg
>   http://oirase.annexia.org/tmp/2023-kvm-build.svg
> 
> Here's a zoom showing scsi_req_new (hopefully this URL is stable ...):
> 
>   http://oirase.annexia.org/tmp/2023-kvm-build-on-device.svg?s=scsi_req_new&x=512.9&y=501

Oh, this one (kvm-build-on-device) doesn't even show the object cast.
I was looking at kvm-build, it seems, where both the class and the
object cast are visible:

http://oirase.annexia.org/tmp/2023-kvm-build.svg?s=scsi_req_new&x=455.4&y=533

Kevin

