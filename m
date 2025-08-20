Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D56F9CA0EDC
	for <qemu-arm@archiver.kernel.org>; Wed, 20 Aug 2025 17:33:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uomgJ-0002hx-LT; Wed, 20 Aug 2025 13:33:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1uomgH-0002gn-Nr
 for qemu-arm@nongnu.org; Wed, 20 Aug 2025 13:33:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1uomgG-0007af-4z
 for qemu-arm@nongnu.org; Wed, 20 Aug 2025 13:33:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755711179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r9tmTSvDG5RCXAJqz8A7YdByh9X6JaGfSYIaWm068Mk=;
 b=KydzLjgQUxntHOYyohbu0qq9R65tQbYpkDLo4Aqn00eqHKmQ/Ci26UN9qmx56ENVvMe8aT
 oDgxaBJoucb6icY9vOqZl3FTUlndnYO1V1spnru9dsKYgYD/xkSAArWMc0BVA9UVZ06rke
 PS2oIVqXufWAt/n2asvdnUxO5TqsT3o=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-308--igKAH2-NqCATaLs-PXYcg-1; Wed, 20 Aug 2025 13:32:57 -0400
X-MC-Unique: -igKAH2-NqCATaLs-PXYcg-1
X-Mimecast-MFC-AGG-ID: -igKAH2-NqCATaLs-PXYcg_1755711176
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2445823bc21so1934875ad.3
 for <qemu-arm@nongnu.org>; Wed, 20 Aug 2025 10:32:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755711176; x=1756315976;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r9tmTSvDG5RCXAJqz8A7YdByh9X6JaGfSYIaWm068Mk=;
 b=huiawDprtquhDGe0eg/+sOi9CVrekmv0IdSu5AByFdfvwRUBYj0PP7mkmcuojUmhTy
 CgKaovly8uJxerlyXF0yEkq0Amo2030HyVFp+nac7b4QNTpLC5H1gn7NWJpDX0mcmQCT
 PFGxfuN4DuGwOTdGQpQHvF6zzTzgjb0Z+0FCgm0Xk8UETZQjCXATxUG5juVamzHB5DZq
 SkOUrtUKX779VFQZsJYjybkhu3sUD88+F0NDjKcxKMTdm8p/6udR1IFv47teUi5jooEC
 KgoiMehb7LnkWLVjNI/BbnHQE4PqT/aJKZpRMgHVbQfGYFJpLEaZDiQCv28ukitdkYcu
 12Fw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3/xF7VeuHz/iiVaaRamATbm38c/8BhHMX+n1G8icTmJeBgMWuwpg9fC06WYmbEJqf8OTwW/oJlw==@nongnu.org
X-Gm-Message-State: AOJu0YyIwHt4qWX4c/RwO4L+wjbY7s1iFAhcyiGUlMg01Et7RAQ4M+af
 UYtZmZWfZ/gqG34vf9N840ZkJi14JQWMPhHjHlqrns2nrt4CGIA9KlfiTwUSG1Wt1BjLXb6fofI
 DNlqBdBWjLPyrqYtXp0GKSgR1J46zlFFAbveOa1bMGIZvVU9GTorvIA==
X-Gm-Gg: ASbGncv/RJ4W6owyzh7h/1G4406RndA0qAqVHN0vTEES8UuJYx2XubI6Ni5pkiHTuZV
 9C+El9Zu+d5bGUA6QzFcq7DDNg6uEwpZP2eDT3XipmC0J8rBqTdzZax4clvsx2sNw696NMeBVL+
 uQCGaUJSjvOAER06yYwOro2FQVkxvDCyF0efKTmxRkjmla/ijwEz4INMzKwZNcK7PJkF9tZRTf2
 OF5dGjExQCabI28bVxKGDUr+75J40s2VYuNgFb48B3sa68M0k06vSkAIqDSnm/m4Yqf1gvtLHgV
 IIHDxdAaecusBT4xWthykJeFAB0LEg0XsslMFtq++ENRd/IGT2eu
X-Received: by 2002:a17:902:ecce:b0:243:47:f61b with SMTP id
 d9443c01a7336-245ef239393mr50748645ad.45.1755711176421; 
 Wed, 20 Aug 2025 10:32:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrV6mxj+ID8UTsnQ8NHQ1Vs3DvG0ITN+Dqmvco+w/BCcn2+jla3h09SbksIBTY6hyh0lN5EA==
X-Received: by 2002:a17:902:ecce:b0:243:47:f61b with SMTP id
 d9443c01a7336-245ef239393mr50748075ad.45.1755711175987; 
 Wed, 20 Aug 2025 10:32:55 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.47.192.65])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-324e252f8c8sm2929136a91.11.2025.08.20.10.32.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 10:32:55 -0700 (PDT)
Date: Wed, 20 Aug 2025 23:02:40 +0530
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
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH v11 19/27] migration: push Error **errp into
 loadvm_handle_recv_bitmap()
Message-ID: <aKYGuGtWxnmWFgEd@armenon-kvm.bengluru.csb>
References: <20250813-propagate_tpm_error-v11-0-b470a374b42d@redhat.com>
 <20250813-propagate_tpm_error-v11-19-b470a374b42d@redhat.com>
 <87h5y8xt1z.fsf@suse.de>
MIME-Version: 1.0
In-Reply-To: <87h5y8xt1z.fsf@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SczfyzgkyS3UPkT_KhOKj33ddLxLlUA5q4z2TBjgjKc_1755711176
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

On Fri, Aug 15, 2025 at 04:51:04PM -0300, Fabiano Rosas wrote:
> Arun Menon <armenon@redhat.com> writes:
> 
> > This is an incremental step in converting vmstate loading
> > code to report error via Error objects instead of directly
> > printing it to console/monitor.
> > It is ensured that loadvm_handle_recv_bitmap() must report an error
> > in errp, in case of failure.
> >
> > Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> > Signed-off-by: Arun Menon <armenon@redhat.com>
> > ---
> >  migration/savevm.c | 21 ++++++++++-----------
> >  1 file changed, 10 insertions(+), 11 deletions(-)
> >
> > diff --git a/migration/savevm.c b/migration/savevm.c
> > index 9098c4bd3394d7b9ed77e20afbb26fd9c9be6550..a7aede1b3df9164e322e68f3889df7c4166876f5 100644
> > --- a/migration/savevm.c
> > +++ b/migration/savevm.c
> > @@ -2480,32 +2480,35 @@ static int loadvm_handle_cmd_packaged(MigrationIncomingState *mis, Error **errp)
> >   * len (1 byte) + ramblock_name (<255 bytes)
> >   */
> >  static int loadvm_handle_recv_bitmap(MigrationIncomingState *mis,
> > -                                     uint16_t len)
> > +                                     uint16_t len, Error **errp)
> >  {
> >      QEMUFile *file = mis->from_src_file;
> >      RAMBlock *rb;
> >      char block_name[256];
> >      size_t cnt;
> > +    int ret;
> >  
> >      cnt = qemu_get_counted_string(file, block_name);
> >      if (!cnt) {
> > -        error_report("%s: failed to read block name", __func__);
> > +        error_setg(errp, "failed to read block name: %s", block_name);
> 
> Could we not print the buffer that's just failed to be written? As a
> matter of principle =)
yes, we must not, its content will be empty. Thanks
> 
> >          return -EINVAL;
> >      }
> >  
> >      /* Validate before using the data */
> > -    if (qemu_file_get_error(file)) {
> > -        return qemu_file_get_error(file);
> > +    ret = qemu_file_get_error(file);
> > +    if (ret < 0) {
> > +        error_setg(errp, "migration stream has error: %d", ret);
> 
> I've been suggesting "stream error:", probably best to keep it uniform.
Sure, will do.
> 
> > +        return ret;
> >      }
> >  
> >      if (len != cnt + 1) {
> > -        error_report("%s: invalid payload length (%d)", __func__, len);
> > +        error_setg(errp, "invalid payload length (%d)", len);
> >          return -EINVAL;
> >      }
> >  
> >      rb = qemu_ram_block_by_name(block_name);
> >      if (!rb) {
> > -        error_report("%s: block '%s' not found", __func__, block_name);
> > +        error_setg(errp, "block '%s' not found", block_name);
> >          return -EINVAL;
> >      }
> >  
> > @@ -2642,11 +2645,7 @@ static int loadvm_process_command(QEMUFile *f, Error **errp)
> >          return 0;
> >  
> >      case MIG_CMD_RECV_BITMAP:
> > -        ret = loadvm_handle_recv_bitmap(mis, len);
> > -        if (ret < 0) {
> > -            error_setg(errp, "Failed to load device state command: %d", ret);
> > -        }
> > -        return ret;
> > +        return loadvm_handle_recv_bitmap(mis, len, errp);
> >  
> >      case MIG_CMD_ENABLE_COLO:
> >          ret = loadvm_process_enable_colo(mis);
> 

Regards,
Arun


