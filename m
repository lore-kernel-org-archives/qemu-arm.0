Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90736CAC5B9
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Sep 2025 18:51:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3Ixj-000082-8O; Mon, 29 Sep 2025 14:51:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1v3Ixh-00005v-PF
 for qemu-arm@nongnu.org; Mon, 29 Sep 2025 14:51:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1v3Ixb-0008Vi-NU
 for qemu-arm@nongnu.org; Mon, 29 Sep 2025 14:51:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759171854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c2T46oBtKfdonChCzSmqbGwDPEoRXX3pq98lv4JkfMw=;
 b=EdVoD8iaRur7cCJ9dHOBo+hvDnzgr4AACFNYUYtKuVbmP5W8ryQAgKC50jZ1PGmiH/s0vn
 gAQhX1XzzEliAij9NUPqaY7fGYOb7UuopXpw62EE+u50MkAN3kH0HsL+qiNLPPJ8n4GpGX
 3oC1JNH4QeU57N1Q8aCchJkd3o4Mnwo=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-6bedUScTPg-XC-6BWsADVw-1; Mon, 29 Sep 2025 14:50:49 -0400
X-MC-Unique: 6bedUScTPg-XC-6BWsADVw-1
X-Mimecast-MFC-AGG-ID: 6bedUScTPg-XC-6BWsADVw_1759171849
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-78e5b6f1296so89195596d6.2
 for <qemu-arm@nongnu.org>; Mon, 29 Sep 2025 11:50:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759171849; x=1759776649;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c2T46oBtKfdonChCzSmqbGwDPEoRXX3pq98lv4JkfMw=;
 b=RrhAOROa6HPukzhP3vjA6caGELEbQwYp0K0l8nirXS5x1hqzg2AdGI2//VtIcIP3Mj
 xtERp6yGWL6v9IJ2P86Q2vnqahUm9Rcgo9HhyIUMvqnCESTWIlgQkEm4e7eBr99e0lPP
 n53ygtCIjiBbNLHfikzTtD5RFIIrzPeOmCg1wZui///jG7HxEMnPAHspPONyasrYQGwt
 AwQEtgjY274S7OhAE0HSYFQBHhJjrnR7UzZh9VLnXQH0wRoZ48LRrWomfI2OZPAbvILr
 WrAI3KpnUIleIraVzAETYOzKM2Nmqztv07HuxYp1NViJvnR7YQEjFsKTqK3Vdr6K4O/B
 1m3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCViPY0IrzDdtcxvHZlg367tOFVBa/SbYxm0VYFdmFKr9whcQgFRM6g4QsIFfSLH0B6drcV0NS8AxA==@nongnu.org
X-Gm-Message-State: AOJu0Yw0iFEFuhIoqxOIRpSD5lP5ZfLJCx+zvlYnpYValG5Y4lQz9qOG
 qgsye/n+WePVf2nwXGjpcCA51ig3wbPa6RW9zogInlGZPQW25aGQ7F7EZUpLE8uLhpPGQ8In5Se
 lIwVbueEYZMDR6s4KFLbXC+mvy+1Rt4zTI9NbNaTCmQNHIK//KsAHaA==
X-Gm-Gg: ASbGncvVO53cZ2GlpSzM7bCqJ115xDqGS3oPrf68M5W6K139auB5a9dmTyuUyyZUj2I
 ViWDsSXe/imHTw/BvN+uKXTTMgQ0kXvedZ7jcSLPe70c5rBHUcs1nCvsWMjY10bY9sVvfL9dMJb
 OvRPWkpSqtzvXOIJgxBYNzHaZ0u1NGAxAXrTwB31xPN7pHxF/E9W9xrjxuGlrMv8/nVzD0YF9zx
 EdAwPGtJfjHMTbL4IG0nfiie4edh74Lkurh3f4bQWUGhW/r95/jIsZ445VKzP03h1gPWpnwMJKz
 26/DmsrsedG8oO6HYkKtWyIh8i69gQGX
X-Received: by 2002:a05:6214:20c5:b0:815:7c28:99c3 with SMTP id
 6a1803df08f44-8157c289b1cmr185138406d6.9.1759171848682; 
 Mon, 29 Sep 2025 11:50:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXRWNmzKkgguzyUsmPfW6xZjVwL/QhFNZfy1Pyaq3MOWCwma/mrX2zAe+d/TJyBZbb32+cvw==
X-Received: by 2002:a05:6214:20c5:b0:815:7c28:99c3 with SMTP id
 6a1803df08f44-8157c289b1cmr185137776d6.9.1759171848150; 
 Mon, 29 Sep 2025 11:50:48 -0700 (PDT)
Received: from x1.local ([142.188.210.50]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8013c742a14sm81236526d6.22.2025.09.29.11.50.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 11:50:47 -0700 (PDT)
Date: Mon, 29 Sep 2025 14:50:45 -0400
From: Peter Xu <peterx@redhat.com>
To: Arun Menon <armenon@redhat.com>
Cc: qemu-devel@nongnu.org, Fabiano Rosas <farosas@suse.de>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
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
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 Hailiang Zhang <zhanghailiang@xfusion.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: Re: [PATCH v14 25/27] migration: Rename post_save() to
 cleanup_save() and make it void
Message-ID: <aNrVBYf4FP82ZTha@x1.local>
References: <20250918-propagate_tpm_error-v14-0-36f11a6fb9d3@redhat.com>
 <20250918-propagate_tpm_error-v14-25-36f11a6fb9d3@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20250918-propagate_tpm_error-v14-25-36f11a6fb9d3@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: m4pfMtFe2lMJIegvhtwCnOXyPeVkwFsdE6LkBj4ArzU_1759171849
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.513,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, Sep 18, 2025 at 08:53:42PM +0530, Arun Menon wrote:
> The post_save() function call is responsible for cleaning up resources
> after the device state has been saved.
> Currently it is infallible, and does not return an error.
> 
> It is called regardless of whether there is a preceding error from
> save or subsection save. That is, save and post_save() together are
> considered to be an atomic logical operation.
> 
> It should not be confused as a counterpart of the post_load() function
> because post_load() does some sanity checks and returns an error if it
> fails. This commit, therefore, renames post_save() to cleanup_save()
> and makes it a void function.
> 
> Reviewed-by: Fabiano Rosas <farosas@suse.de>
> Suggested-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
> Signed-off-by: Arun Menon <armenon@redhat.com>

I'll need to drop this one patch because it breaks Rust.  Please feel free
to send it separately or just leave post_save() as-is for now.

PS: IMHO post_save() is still a good name to me, pairing well with
pre_save() and all *_load*() functions too.  Dropping the retval should
already imply it cannot fail with/without a name change (and also because
modules can do more than "cleanups" in post_save()..).

-- 
Peter Xu


