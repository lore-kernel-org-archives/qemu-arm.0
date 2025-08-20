Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09395CA0EDC
	for <qemu-arm@archiver.kernel.org>; Wed, 20 Aug 2025 17:32:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uomfO-0001qu-79; Wed, 20 Aug 2025 13:32:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1uomfM-0001px-EL
 for qemu-arm@nongnu.org; Wed, 20 Aug 2025 13:32:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1uomfK-0007WO-Ac
 for qemu-arm@nongnu.org; Wed, 20 Aug 2025 13:32:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755711121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=odTUsm2RYSzpfgsMilD/aFaIy6QHNGfEabJRUNHXaSE=;
 b=bqw2NXl7Xrom6oyFX+zO2bb5exx+7Sx7GZmsCRbwGOeG7FKr4/O8+w1dRYCSWKQDSbfJed
 p6rtWX1rnfQMiCUn/RUipGRjCC6cO22kIf64R5fetESnmR6TZ4+SIAzNFAouhzZs8kiKuj
 H7n7TpUz2xM8k7Wm2G7EYxhkkioETpc=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-227-ze4O2xE_PdK4O-KHZ6unfA-1; Wed, 20 Aug 2025 13:31:58 -0400
X-MC-Unique: ze4O2xE_PdK4O-KHZ6unfA-1
X-Mimecast-MFC-AGG-ID: ze4O2xE_PdK4O-KHZ6unfA_1755711117
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-244582c20e7so797345ad.3
 for <qemu-arm@nongnu.org>; Wed, 20 Aug 2025 10:31:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755711117; x=1756315917;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=odTUsm2RYSzpfgsMilD/aFaIy6QHNGfEabJRUNHXaSE=;
 b=ZAkNNoaTbWzZmHPGFP+YzT/KZ9Lo6iS4d80CcYHDqy1czPSsEnlLjARbOsb+i1jrh5
 d/MQZ0Ep1uLbmw1gqnb9BGoBzldl7niF0PIO/y4+RHE2d8mHwdJMjPIch5y2yoH3UycQ
 fThYCtdeQz3K5aJ7eqL5NhiWqVNIdkvZ6lLjyBKv4aalAwDJAx/k5B0iXTfvjdnCd4Ao
 vxEiY4dFqUCO8YKGMwNSzxmju73+/FIqWfV4PCIt3B+cUovqo/KtVqeI5bVBbRQrfX8Q
 KRm5J4VFovu6kaHk+vf6ewaFI25zDwaPniR/VhJQsgx+K/hpt0qGtrO+I7s+S0kuRfcY
 qYPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWJzHit8AiJSAJaXViW7sS68bhpW1EBJtCa3WEwS8oWMXYNN5jdiU5uJYOgy0iQF1jtgZ4cgKgjA==@nongnu.org
X-Gm-Message-State: AOJu0YxtbcVhUOar+pzpp5hfggIXQnPGEmhVHfzuYoGOlYnvs/JRNNhP
 xybLuc/CAqqZNprg9KF2gVxVzBKG2K1zS4qqzpEEN76o/cGWOzGmNSFXvQfQtpdtelhf5LPHZVP
 gk6L/Qdp+kmu5H3wJ3ZHwVG7JO6L/08vDG7AfTxaxLL+kSugCbZ4trA==
X-Gm-Gg: ASbGncvqi1pt1YKvT5Ry4Gtbg2yI5jJLrKWNJ+uZiTToYBm6Tfkf6wrJJfhxpY8uxKI
 1gClbEv1ClD32xnNyZnv/336wU0T8FWUGxCgT1i9uvac/JSdRR2wIC2U3U62EyHdnuN9LegeFM8
 pAWS3/JJgPMCkFmObh4KhxSqdVh6ZgwrCjB3HJYVfP4OEMzYVbd7RcH+5rtwzYClESWRb+eHd4/
 uO7ziov4Y2mKMPw3Cgv3svueY3/oYCFFVwFO1FVLQuidcsroBGnlX8Akcnz0kfTbzGqpPk3fhZH
 7V+NicJrU9DTKWyto/LT1YNinv8IE6eH0nGVAETaPJ2RfseTT4Kt
X-Received: by 2002:a17:903:2292:b0:23f:fa79:15d0 with SMTP id
 d9443c01a7336-245ef26b330mr49219925ad.46.1755711117264; 
 Wed, 20 Aug 2025 10:31:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdYFhY0qUfIfb7zBtRu4U9auGENCqFxjTF0DaX8hZZ3U1VM77C8eB/7kiH8z8UA2hkTfHmwA==
X-Received: by 2002:a17:903:2292:b0:23f:fa79:15d0 with SMTP id
 d9443c01a7336-245ef26b330mr49219655ad.46.1755711116834; 
 Wed, 20 Aug 2025 10:31:56 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.47.192.65])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-324e2625749sm2871059a91.14.2025.08.20.10.31.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 10:31:56 -0700 (PDT)
Date: Wed, 20 Aug 2025 23:01:43 +0530
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
Subject: Re: [PATCH v11 04/27] migration: push Error **errp into vmstate_load()
Message-ID: <aKYGf-vD0L5uFcmg@armenon-kvm.bengluru.csb>
References: <20250813-propagate_tpm_error-v11-0-b470a374b42d@redhat.com>
 <20250813-propagate_tpm_error-v11-4-b470a374b42d@redhat.com>
 <87ikiozge3.fsf@suse.de>
MIME-Version: 1.0
In-Reply-To: <87ikiozge3.fsf@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qr_QfZ9p2DvLOLeSz3gBKGUWIRHCXJgD8sAW6NlCmX4_1755711117
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armenon@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Fabiano,
Thanks for the review.

On Fri, Aug 15, 2025 at 01:41:40PM -0300, Fabiano Rosas wrote:
> Arun Menon <armenon@redhat.com> writes:
> 
> > This is an incremental step in converting vmstate loading
> > code to report error via Error objects instead of directly
> > printing it to console/monitor.
> > It is ensured that vmstate_load() must report an error
> > in errp, in case of failure.
> >
> > Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> > Signed-off-by: Arun Menon <armenon@redhat.com>
> > ---
> >  migration/savevm.c | 20 +++++++++++++++-----
> >  1 file changed, 15 insertions(+), 5 deletions(-)
> >
> > diff --git a/migration/savevm.c b/migration/savevm.c
> > index 0c445a957fc99f826e6753ed3795bcdd51f1e3f5..7f79461844105bf672314c3325caee9cdb654c27 100644
> > --- a/migration/savevm.c
> > +++ b/migration/savevm.c
> > @@ -963,14 +963,20 @@ void vmstate_unregister(VMStateIf *obj, const VMStateDescription *vmsd,
> >      }
> >  }
> >  
> > -static int vmstate_load(QEMUFile *f, SaveStateEntry *se)
> > +static int vmstate_load(QEMUFile *f, SaveStateEntry *se, Error **errp)
> >  {
> > +    int ret;
> >      trace_vmstate_load(se->idstr, se->vmsd ? se->vmsd->name : "(old)");
> >      if (!se->vmsd) {         /* Old style */
> > -        return se->ops->load_state(f, se->opaque, se->load_version_id);
> > +        ret = se->ops->load_state(f, se->opaque, se->load_version_id);
> > +        if (ret < 0) {
> > +            error_setg(errp, "Failed to load VM version_id: %d, ret: %d",
> 
> "VM" is ambiguous. I'd use "vmstate".
Sure, will do this.
> 
> > +                       se->load_version_id, ret);
> > +        }
> > +        return ret;
> >      }
> >      return vmstate_load_state(f, se->vmsd, se->opaque, se->load_version_id,
> > -                              &error_fatal);
> > +                              errp);
> >  }
> >  
> >  static void vmstate_save_old_style(QEMUFile *f, SaveStateEntry *se,
> > @@ -2692,6 +2698,7 @@ qemu_loadvm_section_start_full(QEMUFile *f, uint8_t type)
> >      SaveStateEntry *se;
> >      char idstr[256];
> >      int ret;
> > +    Error *local_err = NULL;
> >  
> >      /* Read section start */
> >      section_id = qemu_get_be32(f);
> > @@ -2741,10 +2748,11 @@ qemu_loadvm_section_start_full(QEMUFile *f, uint8_t type)
> >          start_ts = qemu_clock_get_us(QEMU_CLOCK_REALTIME);
> >      }
> >  
> > -    ret = vmstate_load(f, se);
> > +    ret = vmstate_load(f, se, &local_err);
> >      if (ret < 0) {
> >          error_report("error while loading state for instance 0x%"PRIx32" of"
> >                       " device '%s'", instance_id, idstr);
> > +        warn_report_err(local_err);
> 
> I was about to ask why you're using a warning here, but I see you remove
> it futher in the series. That's fine, but this kind of thing should be
> mentioned in the commit message, otherwise it gets confusing to review.
Sure, I will add it in the commit message.
> 
> >          return ret;
> >      }
> >  
> > @@ -2769,6 +2777,7 @@ qemu_loadvm_section_part_end(QEMUFile *f, uint8_t type)
> >      uint32_t section_id;
> >      SaveStateEntry *se;
> >      int ret;
> > +    Error *local_err = NULL;
> >  
> >      section_id = qemu_get_be32(f);
> >  
> > @@ -2794,10 +2803,11 @@ qemu_loadvm_section_part_end(QEMUFile *f, uint8_t type)
> >          start_ts = qemu_clock_get_us(QEMU_CLOCK_REALTIME);
> >      }
> >  
> > -    ret = vmstate_load(f, se);
> > +    ret = vmstate_load(f, se, &local_err);
> >      if (ret < 0) {
> >          error_report("error while loading state section id %d(%s)",
> >                       section_id, se->idstr);
> > +        warn_report_err(local_err);
> >          return ret;
> >      }
> 
Regards,
Arun Menon


