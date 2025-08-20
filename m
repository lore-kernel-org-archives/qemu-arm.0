Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D301CA0EE4
	for <qemu-arm@archiver.kernel.org>; Wed, 20 Aug 2025 17:44:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uomr4-0000vG-Qr; Wed, 20 Aug 2025 13:44:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1uomr3-0000uB-Ey
 for qemu-arm@nongnu.org; Wed, 20 Aug 2025 13:44:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1uomr1-0000ov-3i
 for qemu-arm@nongnu.org; Wed, 20 Aug 2025 13:44:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755711845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/+iYXfPIW+FY/zM0HFsDQ8sKnnEi5yiuW7pv++9LYFs=;
 b=g1u0GntxNyX4b5q+0b7Ql5fbQq/Gpe3j9eR4BIFX1ZZYib1YACFYKKnMepc1WA2Ddw3/K/
 lJ5VHztsdYmmHuOryFnEmiXiHjV+kJwJ7qDCwf472Y4zHuyqxYVQON/ZxnRzHR45VqqziA
 kc4kL+ngGGY70M5WAdPlhO7cOGDNsr0=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-364-dYcua6jrPLK6SPm_ePO-rg-1; Wed, 20 Aug 2025 13:44:04 -0400
X-MC-Unique: dYcua6jrPLK6SPm_ePO-rg-1
X-Mimecast-MFC-AGG-ID: dYcua6jrPLK6SPm_ePO-rg_1755711844
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-76e8ae86ab3so198107b3a.1
 for <qemu-arm@nongnu.org>; Wed, 20 Aug 2025 10:44:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755711844; x=1756316644;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/+iYXfPIW+FY/zM0HFsDQ8sKnnEi5yiuW7pv++9LYFs=;
 b=DKFPj1KjwyVq8Dqf5NnT86o0mDxdrx5Fjof1qtvRUzRbXJuj2H/o/13PyFgGz9HvO+
 8lz6PQ/pde8le4Tf+Jf7x3rvXpiCZ0UVYTfw1AHJVpHkmlv6nc2K7BX9T80SZDCGa7Dq
 vYmKgMmEn0DLft4fZOW4o2RZlD6hYEF3WyU1olt2NshvR9YbrCIkMwvntfZi0Ai2mEPu
 Zs9UEmfgZhBjlT+vL0JaYGMxLnTQkA3TnVVuS2kOOB3sIG+uRx78sNQvmUA3mrqi+YLm
 mCe6av58RXcZHa7+uBDA0BTL0Y/F5G4eDVyPMgGZH1hhXhYp5XCxRVTtekFD3HJtlwPl
 A2uA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiAn82GQux8juP6vIQRa/ZEkVAYu75mM7uP99fa+zoOiQU4I9hj7hlVSg6ckg9Q+UweAnE5NmS+A==@nongnu.org
X-Gm-Message-State: AOJu0Yz7f8bxQ5GLl98xEA3YhOk6EpLyw5couktVOLZA+6D4WDPf+8hd
 PzH+u/aZC76aqlklJcxfF+foNchO2tmMansQDjFBDuYj0i8eZHgHtYzuee8YVezlxmeLNSE/zdc
 NqZy00MA71ZDgdEWucugTzqvFn/1CFY8yox1sFdMpouLjFkDpZsnlsA==
X-Gm-Gg: ASbGnctHONVusxvU2olSa9upjw7zRsBHkEZH5i91/v0O7q0/jXuB5c61MhQCW0axbC7
 F6uHKa+CL0oXAfQWd6H2XY4rl7Gnyyo9tkkyrODNyIPfn0vFFggwMaVEwMeyFqjk8YwRQfpinUQ
 JZ2BwYrOh7dHnbPubj/iEKnarqba73lkDEHY1feHPXpWAnzh5RYKPVgpzJSaHYb1WLZb/4bTsxZ
 exyDEgoOokKzaLbtRm8YUOiNq/tjBKeVdkk+CPFHPlb4VDvvDgqdYGZJfg+TjX4hiHUqWMHvhvG
 jS6t0tL0WW856cLCJStOZmfBS9TPvQEhM67ANXA+3OyAdlIEgUhW
X-Received: by 2002:a05:6a00:1746:b0:742:a77b:8c3 with SMTP id
 d2e1a72fcca58-76e8db7e415mr5111076b3a.4.1755711843463; 
 Wed, 20 Aug 2025 10:44:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfSOk/4h/qiDrvNQD0GxxJokFoTpe99AQUabDFkyKxGxjh4ccq/iUuDrqIJEq0DwEvv8Oatw==
X-Received: by 2002:a05:6a00:1746:b0:742:a77b:8c3 with SMTP id
 d2e1a72fcca58-76e8db7e415mr5111020b3a.4.1755711842937; 
 Wed, 20 Aug 2025 10:44:02 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.47.192.65])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76e7d13f357sm5962169b3a.45.2025.08.20.10.43.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 10:44:02 -0700 (PDT)
Date: Wed, 20 Aug 2025 23:13:49 +0530
From: Arun Menon <armenon@redhat.com>
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
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
Subject: Re: [PATCH v11 01/27] migration: push Error **errp into
 vmstate_subsection_load()
Message-ID: <aKYJVUpelrLkWc1t@armenon-kvm.bengluru.csb>
References: <20250813-propagate_tpm_error-v11-0-b470a374b42d@redhat.com>
 <20250813-propagate_tpm_error-v11-1-b470a374b42d@redhat.com>
 <87qzxczltd.fsf@suse.de> <87349sxscs.fsf@suse.de>
MIME-Version: 1.0
In-Reply-To: <87349sxscs.fsf@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WpTKxP5NfLgxBQs6pl_xIAsytZwtJINAR9wenBdl-w8_1755711844
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armenon@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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

Hi Fabiano,
Thanks for the review.

On Fri, Aug 15, 2025 at 05:06:11PM -0300, Fabiano Rosas wrote:
> Fabiano Rosas <farosas@suse.de> writes:
> 
> > Arun Menon <armenon@redhat.com> writes:
> >
> >> This is an incremental step in converting vmstate loading
> >> code to report error via Error objects instead of directly
> >> printing it to console/monitor.
> >> It is ensured that vmstate_subsection_load() must report an error
> >> in errp, in case of failure.
> >>
> >> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> >> Signed-off-by: Arun Menon <armenon@redhat.com>
> >> ---
> >>  migration/vmstate.c | 11 ++++++++---
> >>  1 file changed, 8 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/migration/vmstate.c b/migration/vmstate.c
> >> index 5feaa3244d259874f03048326b2497e7db32e47c..6108c7fe283a5013ce42ea9987723c489aef26a2 100644
> >> --- a/migration/vmstate.c
> >> +++ b/migration/vmstate.c
> >> @@ -25,7 +25,7 @@ static int vmstate_subsection_save(QEMUFile *f, const VMStateDescription *vmsd,
> >>                                     void *opaque, JSONWriter *vmdesc,
> >>                                     Error **errp);
> >>  static int vmstate_subsection_load(QEMUFile *f, const VMStateDescription *vmsd,
> >> -                                   void *opaque);
> >> +                                   void *opaque, Error **errp);
> >>  
> >>  /* Whether this field should exist for either save or load the VM? */
> >>  static bool
> >> @@ -225,7 +225,7 @@ int vmstate_load_state(QEMUFile *f, const VMStateDescription *vmsd,
> >>          field++;
> >>      }
> >>      assert(field->flags == VMS_END);
> >> -    ret = vmstate_subsection_load(f, vmsd, opaque);
> >> +    ret = vmstate_subsection_load(f, vmsd, opaque, &error_fatal);
> >>      if (ret != 0) {
> >>          qemu_file_set_error(f, ret);
> >>          return ret;
> >
> > This is now unreachable, no?
It is.
> >
> 
> Also, this temporary &error_fatal here and throughout the series will
> break bisect badly, won't it? Imagine we have a bug in the code past
> this point (once the future patch from this series removes the
> &error_fatal), now every time this commit shows up in bisect, it will
> abort earlier.
> 
> I get that having error_fatal here helps ensure the series is correct,
> but maybe we should do without it.
That is a valid point.
I think, we can pass local_err and then report it using
warn_report_err() whenever there are operations past the function call.
If we are calling the function in the return statement, then we can pass
error_fatal. If that is ok, I shall amend the series to pass local_err and
temporarily report it.
> 
> Do others have an opinion here?
> 
> >> @@ -566,7 +566,7 @@ vmstate_get_subsection(const VMStateDescription * const *sub,
> >>  }
> >>  
> >>  static int vmstate_subsection_load(QEMUFile *f, const VMStateDescription *vmsd,
> >> -                                   void *opaque)
> >> +                                   void *opaque, Error **errp)
> >>  {
> >>      trace_vmstate_subsection_load(vmsd->name);
> >>  
> >> @@ -598,6 +598,8 @@ static int vmstate_subsection_load(QEMUFile *f, const VMStateDescription *vmsd,
> >>          sub_vmsd = vmstate_get_subsection(vmsd->subsections, idstr);
> >>          if (sub_vmsd == NULL) {
> >>              trace_vmstate_subsection_load_bad(vmsd->name, idstr, "(lookup)");
> >> +            error_setg(errp, "VM subsection '%s' in '%s' does not exist",
> >> +                       idstr, vmsd->name);
> >>              return -ENOENT;
> >>          }
> >>          qemu_file_skip(f, 1); /* subsection */
> >> @@ -608,6 +610,9 @@ static int vmstate_subsection_load(QEMUFile *f, const VMStateDescription *vmsd,
> >>          ret = vmstate_load_state(f, sub_vmsd, opaque, version_id);
> >>          if (ret) {
> >>              trace_vmstate_subsection_load_bad(vmsd->name, idstr, "(child)");
> >> +            error_setg(errp,
> >> +                       "Loading VM subsection '%s' in '%s' failed: %d",
> >> +                       idstr, vmsd->name, ret);
> >>              return ret;
> >>          }
> >>      }
> 
Regards,
Arun


