Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD5CCA0FE8
	for <qemu-arm@archiver.kernel.org>; Sun, 31 Aug 2025 16:39:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usl5I-0002fk-D2; Sun, 31 Aug 2025 12:39:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1usl5E-0002dS-9j
 for qemu-arm@nongnu.org; Sun, 31 Aug 2025 12:39:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1usl5A-0003Mq-RB
 for qemu-arm@nongnu.org; Sun, 31 Aug 2025 12:39:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756658348;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vEKB2Hf0GHU2Ey58FA2EDz6st9e67XJ43Om957L1qzk=;
 b=is8pcQPOeJGK5vaGIS7FHEN7mQAcK7gmiJz4fbeTmnXZ1Krb0YFogzvaXm+8Ko860SQlsD
 ORHG+HY+ndp1Ykde0qxkrfVkBWesNMVquWcmPR1Bj4juxyNskC9fxFkFEFadoMCrh65cT3
 q7dqLiemVEPDxMmBrd0mMoFW/XOm26U=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-303-k3xwtLVXMd6GkUAKcRsAAA-1; Sun, 31 Aug 2025 12:39:04 -0400
X-MC-Unique: k3xwtLVXMd6GkUAKcRsAAA-1
X-Mimecast-MFC-AGG-ID: k3xwtLVXMd6GkUAKcRsAAA_1756658343
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2445803f0cfso45867835ad.1
 for <qemu-arm@nongnu.org>; Sun, 31 Aug 2025 09:39:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756658343; x=1757263143;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:reply-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vEKB2Hf0GHU2Ey58FA2EDz6st9e67XJ43Om957L1qzk=;
 b=p9it8mk8MBpZx4E9TkcNoixtrsxIGYZx8bDLdEgKepypB44ptyzSQaMVHZtLhuwqb9
 T4rxLgV5GMRhnI4WTSvftMhzFtz/bWR7bGegyOQOniRi5f2R5KvJlGTLo8eolMwP2vZK
 RMiRKM8hexkJvpf9muVckGu3+HlsZB9UaISErWqQFlhfb/nebRa0HBjGKz07SRwuSS8C
 N1+pzVzEHzwV4+HowhLj8FegMfDQ2b24NhEAfjax8ffbR47I5DS7Vm8qXrcnXMX2ZFra
 VWFF/l9ZupBf8VyQ7YMoDtWA8AftsmAMuCtvQZZW0vm8NGeJiKlaSlkJweKNfqJncIee
 EKTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVh2yRhyWRGBtxuh/OM00xNSUoHq0LQtq2OlwWoNopJ+hYQO3PblneyyqWhiYuYY/VAXQmobMcv9A==@nongnu.org
X-Gm-Message-State: AOJu0Yw+KjKnCQONAJUBbVCLyoFUVT7zgj7rCZWJXtM/+f1OIxuFU0sf
 Z6zdmmB4bOKOIIx/6NqeKssiSFCqSIkZ8H5ZeMH1o95wz/0Ws1ENGZaILWPrF+L+VmELK5eKpHa
 7u1e1kySeeMQNzW8MUSUGrybaZ9NTp85E2qxKF93mOd9CgDaZLTTjvQ==
X-Gm-Gg: ASbGncskE6D2xA7HXWeNsMA6Wzn7GwCL+j1eU1mRE8w5ggX0Arc9i/j5AIm2Fj4FORj
 TeShFQhDfidzIBi/ydm4AdhVfYGdY///wcVqhCYW3yTxeOiykaFZsSD8WRd3wJFPn522R9viuhp
 S32J6yE3vZwQj/7VdYcKV0J1R2QHVCbPB7ML/2ZTmrtJXazlgezujiL08clnEQV+DeysmFCtnCM
 0oJU4DpVHMiPtUmc2q40eW10uS6RflktxZfhCaoMf3kHcREyaFQJXWJZpsc1OCZMDs4o6wC9E0b
 xB9nj98gH1du1gskF3LRl5ILGJdGPt244mo7opt/tfcjjjlyh1dC
X-Received: by 2002:a17:902:ea09:b0:248:f55d:447a with SMTP id
 d9443c01a7336-249448f9722mr78798685ad.3.1756658343304; 
 Sun, 31 Aug 2025 09:39:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNqyVbzYnMdNVm4v1GXUc4SZUeVh4701QEUq0tOczRw7My0QUSC/5ThV4qNiCClYnNpCEHEg==
X-Received: by 2002:a17:902:ea09:b0:248:f55d:447a with SMTP id
 d9443c01a7336-249448f9722mr78798235ad.3.1756658342849; 
 Sun, 31 Aug 2025 09:39:02 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.36.106.50])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24905da26a3sm80990755ad.88.2025.08.31.09.38.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Aug 2025 09:39:02 -0700 (PDT)
Date: Sun, 31 Aug 2025 22:08:48 +0530
From: Arun Menon <armenon@redhat.com>
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Cc: qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Fabiano Rosas <farosas@suse.de>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
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
Subject: Re: [PATCH v13 07/27] migration: push Error **errp into
 qemu_loadvm_state()
Message-ID: <aLR6mKJyVPZ4bqnZ@armenon-kvm.bengluru.csb>
References: <20250830-propagate_tpm_error-v13-0-a4e777b7eb2c@redhat.com>
 <20250830-propagate_tpm_error-v13-7-a4e777b7eb2c@redhat.com>
 <078e2ef1-fbfa-450a-a2ab-d1e77cc8e850@rsg.ci.i.u-tokyo.ac.jp>
 <aLRt_G-pOH1rwJbb@armenon-kvm.bengluru.csb>
 <017c40a6-3347-43e7-b7b7-9e2e2130d19e@rsg.ci.i.u-tokyo.ac.jp>
MIME-Version: 1.0
In-Reply-To: <017c40a6-3347-43e7-b7b7-9e2e2130d19e@rsg.ci.i.u-tokyo.ac.jp>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4b5tYzIqc6uzp2d5c7fBWbAUvjEux0ar919NSrXrBzc_1756658343
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armenon@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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

Hi,

On Mon, Sep 01, 2025 at 01:04:40AM +0900, Akihiko Odaki wrote:
> On 2025/09/01 0:45, Arun Menon wrote:
> > Hi Akihiko,
> > Thanks for the review.
> > 
> > On Sat, Aug 30, 2025 at 02:58:05PM +0900, Akihiko Odaki wrote:
> > > On 2025/08/30 5:01, Arun Menon wrote:
> > > > This is an incremental step in converting vmstate loading
> > > > code to report error via Error objects instead of directly
> > > > printing it to console/monitor.
> > > > It is ensured that qemu_loadvm_state() must report an error
> > > > in errp, in case of failure.
> > > > 
> > > > When postcopy live migration runs, the device states are loaded by
> > > > both the qemu coroutine process_incoming_migration_co() and the
> > > > postcopy_ram_listen_thread(). Therefore, it is important that the
> > > > coroutine also reports the error in case of failure, with
> > > > error_report_err(). Otherwise, the source qemu will not display
> > > > any errors before going into the postcopy pause state.
> > > > 
> > > > Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> > > > Reviewed-by: Fabiano Rosas <farosas@suse.de>
> > > > Signed-off-by: Arun Menon <armenon@redhat.com>
> > > > ---
> > > >    migration/migration.c |  9 +++++----
> > > >    migration/savevm.c    | 30 ++++++++++++++++++------------
> > > >    migration/savevm.h    |  2 +-
> > > >    3 files changed, 24 insertions(+), 17 deletions(-)
> > > > 
> > > > diff --git a/migration/migration.c b/migration/migration.c
> > > > index 10c216d25dec01f206eacad2edd24d21f00e614c..c6768d88f45c870c7fad9b9957300766ff69effc 100644
> > > > --- a/migration/migration.c
> > > > +++ b/migration/migration.c
> > > > @@ -881,7 +881,7 @@ process_incoming_migration_co(void *opaque)
> > > >                          MIGRATION_STATUS_ACTIVE);
> > > >        mis->loadvm_co = qemu_coroutine_self();
> > > > -    ret = qemu_loadvm_state(mis->from_src_file);
> > > > +    ret = qemu_loadvm_state(mis->from_src_file, &local_err);
> > > >        mis->loadvm_co = NULL;
> > > >        trace_vmstate_downtime_checkpoint("dst-precopy-loadvm-completed");
> > > > @@ -908,7 +908,8 @@ process_incoming_migration_co(void *opaque)
> > > >        }
> > > >        if (ret < 0) {
> > > > -        error_setg(&local_err, "load of migration failed: %s", strerror(-ret));
> > > > +        error_prepend(&local_err, "load of migration failed: %s: ",
> > > > +                      strerror(-ret));
> > > >            goto fail;
> > > >        }
> > > > @@ -924,13 +925,13 @@ fail:
> > > >        migrate_set_state(&mis->state, MIGRATION_STATUS_ACTIVE,
> > > >                          MIGRATION_STATUS_FAILED);
> > > >        migrate_set_error(s, local_err);
> > > > -    error_free(local_err);
> > > > +    error_report_err(local_err);
> > > 
> > > This is problematic because it results in duplicate error reports when
> > > !mis->exit_on_error; in that case the query-migrate QMP command reports the
> > > error and this error reporting is redundant.
> > 
> > If I comment this change, then all of the errors propagated up to now, using
> > error_setg() will not be reported. This is the place where it is finally reported,
> > when qemu_loadvm_state() fails. In other words, all the error_reports() we removed
> > from all the files, replacing them with error_setg(), will finally be reported here
> > using error_report_err().
> 
> My understanding of the code without these two changes is:
> - If the migrate-incoming QMP command is used with false as
>   exit-on-error, this function will not report the error but
>   the query-migrate QMP command will report the error.
> - Otherwise, this function reports the error.

With my limited experience in testing, I have a question,
So there are 2 scenarios,
1. running the virsh migrate command on the source host. Something like the following,
  virsh -c 'qemu:///system' migrate --live --verbose --domain guest-vm --desturi qemu+ssh://10.6.120.20/system
  OR for postcopy-ram,
  virsh migrate guest-vm --live qemu+ssh://10.6.120.20/system --verbose --postcopy --timeout 10 --timeout-postcopy

2. Using QMP commands, performing a migration from source to destination.
  Running something like the following on the destination:
  {
    "execute": "migrate-incoming",
    "arguments": {
      "uri": "tcp:127.0.0.1:7777",
      "exit-on-error": false
    }
  }
  {
    "execute": "migrate-incoming",
    "arguments": {
      "uri": "tcp:127.0.0.1:7777",
      "exit-on-error": false
    }
  }
  and the somthing like the following on source:
  {
    "execute": "migrate",
    "arguments": {
      "uri": "tcp:127.0.0.1:7777"
    }
  }
  {"execute" : "query-migrate"}

In 1, previously, the user used to get an error message on migration failure.
This was because there were error_report() calls in all of the files.
Now that they are replaced with error_setg() and the error is stored in errp,
we need to display that using error_report_err(). Hence I introduced an error_report_err()
call in the fail section.

In 2, we have 2 QMP sessions, one for the source and another for the destination.
The QMP command migrate will be issued on the source, and the errp will be set.
I did not understand the part where the message will be displayed because of the
error_report_err() call. I did not see such a message on failure scenario on both
the sessions.
If the user wants to check for errors, then the destination qemu will not exit 
(exit-on-error = false ) and we can retrieve it using {"execute" : "query-migrate"}

Aren't the 2 scenarios different by nature?

> 
> With these two changes, if the migrate-incoming QMP command is used with
> false as exit-on-error, this function will report the error *and* the
> query-migrate QMP command will report the error, resulting in duplicate
> reports.
> 
> > 
> > > 
> > > >        migration_incoming_state_destroy();
> > > >        if (mis->exit_on_error) {
> > > >            WITH_QEMU_LOCK_GUARD(&s->error_mutex) {
> > > > -            error_report_err(s->error);
> > > > +            error_free(s->error);
> > > 
> > > This change is problematic because s->error set somewhere else here will be
> > > ignored.
> > 
> > This is specific to the case when mis->exit_on_error is set.
> > since we did a migrate_set_error(s, local_err) before, we free the
> > error in s->error and set it to NULL, before an exit(EXIT_FAILURE)
> 
> It shouldn't just free the error but should print it or the error will be
> missed.
> 
> Regards,
> Akihiko Odaki
> 
Regards,
Arun Menon


