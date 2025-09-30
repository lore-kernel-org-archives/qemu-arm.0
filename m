Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB18CAC5B9
	for <qemu-arm@archiver.kernel.org>; Tue, 30 Sep 2025 04:31:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3S0j-0004BB-CK; Tue, 30 Sep 2025 00:30:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1v3S0b-00049c-5e
 for qemu-arm@nongnu.org; Tue, 30 Sep 2025 00:30:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1v3S0Q-00059M-Hn
 for qemu-arm@nongnu.org; Tue, 30 Sep 2025 00:30:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759206623;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=+LqonD0/HCiXJZZoK2MbnvXOiV77+i2qyKMAxOY8H1s=;
 b=SKCfG/VWW//kNzhXDYKrKt6cdxNvtSchcjNjaMTWTM2or1gc+gRjnOiar9BDGrnd/oP1eJ
 yvyTtqv3x75rU42S3gN5I+xP+Bo4Y6oLFCR5jvylY/bcboSp+nQXOjCst7FhJsIP6B8gvQ
 36fz1UXXUFkatSWqUeFyndiKuRLd0sE=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-604-iqXmfibMMniPOVIKi8QmOw-1; Tue, 30 Sep 2025 00:30:14 -0400
X-MC-Unique: iqXmfibMMniPOVIKi8QmOw-1
X-Mimecast-MFC-AGG-ID: iqXmfibMMniPOVIKi8QmOw_1759206614
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-25d21fddb85so100047085ad.1
 for <qemu-arm@nongnu.org>; Mon, 29 Sep 2025 21:30:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759206613; x=1759811413;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+LqonD0/HCiXJZZoK2MbnvXOiV77+i2qyKMAxOY8H1s=;
 b=l91qZ+qxkyRbvYMn6UFct9sw4USrs5DwRV0mZohH1I9bP7W4O8xFf3CN1G3BsVUWEJ
 /lFvJaFvum87tY49XgyKeKwCvx18J0ZDAeP5S2JEPfAS+d3iv3poa+8vz7mG0JoDGgmT
 Q555AOoQfnkEQgpnLveATAK9gQi3+D4Tc+oWRB2ba5YiDtnC9A0tpSd9juEu1xsJ1vkI
 VQ2M/W5oJu9Xz36NQONi0of+lLBzxHbRfJ42G0321KjLFuJOPvWg2Yn9KuluZl5EHYXR
 Ro0NmKgARYDES95XI/i19/r+rXLiLbEISpo6Ek27TIX3pJ3tiHCjs18vieKMrJecHU3y
 HVCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKN3rJOy97wXCVrGuf1oDGdEv0CgRT6XrhG/AKtxzBm4m7p27/NfiTRYGBOWHwXb9wBiJhVpTsuQ==@nongnu.org
X-Gm-Message-State: AOJu0YyFm+aa2yWZJQRSbyzsktjcRcTwekuy0+PGXfyyhvOE+/vKrOte
 bJQIpLSLNTcwNAJ5t/mVbRPUlOszBMYgYal/ZimSac1lyxT0+RbNxc9MVX4s6stM0iFQ3iqLKVw
 peIoOnjf8DN2PL1R2W1Xr4Kq7xvhWaVG9WpxINs5w/r9YK7eyP4kzoQ==
X-Gm-Gg: ASbGncte3nilBbv6NmmZApHJwm10xMrXiUzNOFDs4etHvXD5r2ppNoddeWiIap/fF3a
 wsZFw8EaTn44bdosOmpV46fq9HOKDzUt3zFiXNgyCFD05+CerDBeSQn2blY+OqthW2iVtPZxjPn
 ksg68wonzwguXW1NKmX9cQ8jz5GlRxKbfFCnIRNz+cQhNDZFPZazxhAL5mLc+bu/C8ifrMIEnnH
 i+YRvalV0jN57e9MCeAjHNhjkGOKWM+zLPAjmVQBigokoGUavAsowjA58b7lf5G9zbGPX35B6D+
 6QKgtX+2IK6NrVdD6x6mac5eQNukRfE1wrC9K3fxMeGkwGqod0hpmSkQXw==
X-Received: by 2002:a17:903:1987:b0:262:cd8c:bfa8 with SMTP id
 d9443c01a7336-27ed4a30d0amr201455075ad.34.1759206613481; 
 Mon, 29 Sep 2025 21:30:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETph3GxRYCkEA5q0TWxFeBpKgDD3bfp0ZO3Qs4HitCeSiE81rRNd9iKRLyxPJv/KD46yZfVQ==
X-Received: by 2002:a17:903:1987:b0:262:cd8c:bfa8 with SMTP id
 d9443c01a7336-27ed4a30d0amr201454595ad.34.1759206613053; 
 Mon, 29 Sep 2025 21:30:13 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.36.108.92])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed6ab74fasm143945025ad.132.2025.09.29.21.30.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 21:30:12 -0700 (PDT)
Date: Tue, 30 Sep 2025 09:59:59 +0530
From: Arun Menon <armenon@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Fabiano Rosas <farosas@suse.de>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 Hailiang Zhang <zhanghailiang@xfusion.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: Re: [PATCH v14 25/27] migration: Rename post_save() to
 cleanup_save() and make it void
Message-ID: <aNtcxyvGLYVRhbuk@armenon-kvm.bengluru.csb>
References: <20250918-propagate_tpm_error-v14-0-36f11a6fb9d3@redhat.com>
 <20250918-propagate_tpm_error-v14-25-36f11a6fb9d3@redhat.com>
 <aNrVBYf4FP82ZTha@x1.local>
MIME-Version: 1.0
In-Reply-To: <aNrVBYf4FP82ZTha@x1.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UUO0Ka3ou20OK40-nHA1Z6_qDx1yoVC48GEuQReYMo8_1759206614
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armenon@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.513,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: armenon@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Peter,

On Mon, Sep 29, 2025 at 02:50:45PM -0400, Peter Xu wrote:
> On Thu, Sep 18, 2025 at 08:53:42PM +0530, Arun Menon wrote:
> > The post_save() function call is responsible for cleaning up resources
> > after the device state has been saved.
> > Currently it is infallible, and does not return an error.
> > 
> > It is called regardless of whether there is a preceding error from
> > save or subsection save. That is, save and post_save() together are
> > considered to be an atomic logical operation.
> > 
> > It should not be confused as a counterpart of the post_load() function
> > because post_load() does some sanity checks and returns an error if it
> > fails. This commit, therefore, renames post_save() to cleanup_save()
> > and makes it a void function.
> > 
> > Reviewed-by: Fabiano Rosas <farosas@suse.de>
> > Suggested-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
> > Signed-off-by: Arun Menon <armenon@redhat.com>
> 
> I'll need to drop this one patch because it breaks Rust.  Please feel free
> to send it separately or just leave post_save() as-is for now.

Thank you for the review. I see it now.
I used the --enable-rust flag to change my configuration.
I have removed the patch and resent the series (v15)

> 
> PS: IMHO post_save() is still a good name to me, pairing well with
> pre_save() and all *_load*() functions too.  Dropping the retval should
> already imply it cannot fail with/without a name change (and also because
> modules can do more than "cleanups" in post_save()..).

Yes, for now I have kept things as is because we do not essentially need
to do something to the existing post_save() call; the dropping of return value can
be looked into in a future patch. Thank you.

> 
> -- 
> Peter Xu
> 

Regards,
Arun Menon


