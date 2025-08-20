Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D22CA0EDC
	for <qemu-arm@archiver.kernel.org>; Wed, 20 Aug 2025 17:37:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uomjc-0005hg-AT; Wed, 20 Aug 2025 13:36:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1uomja-0005ep-SV
 for qemu-arm@nongnu.org; Wed, 20 Aug 2025 13:36:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1uomjZ-0008C5-7o
 for qemu-arm@nongnu.org; Wed, 20 Aug 2025 13:36:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755711384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uDows8f/8yyJvMd7MW0Iaj/M3rJNeiQTBtvdhcjCCq8=;
 b=FgkrAxmBrqB31wkbuBgPqQLO+CF0CaVBccMXITuQa/ogB6ETyxw/RYvhkIueCDsbtKcfdV
 RkX0SzNBVRsqhM2XNNlOeWXCgxv/2obqQUlzyakFUMQfkRnQSL4SGNDTPe8gif1JZkSnkP
 gWLSdgb3/oO3MhWb+I5uosD5NHEPaCM=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-ltqsD38PMtGQIVhaNSpFZA-1; Wed, 20 Aug 2025 13:36:23 -0400
X-MC-Unique: ltqsD38PMtGQIVhaNSpFZA-1
X-Mimecast-MFC-AGG-ID: ltqsD38PMtGQIVhaNSpFZA_1755711382
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b474d5ff588so28318a12.2
 for <qemu-arm@nongnu.org>; Wed, 20 Aug 2025 10:36:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755711382; x=1756316182;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uDows8f/8yyJvMd7MW0Iaj/M3rJNeiQTBtvdhcjCCq8=;
 b=YHnrOzIZs80AEH5P1WDdliZgdnbk/71Vv1D2h7svBP+QIQ0/DFLKELt/zMnvBVqJH1
 6fXQ3g8GmARXARAOzATZttC5vZSSf2WujxVBXtsNjKXhXdic9rQBspYTk/pNz0u1gL5B
 W7aqzxLiWcSW151J6hQcQf2Z+QmIouNlpl6NchcDsaq4vEY9Gkg2SqtP0u2hxk0V3AXW
 dB2u8i0BfkEyL83wCB8WCRjsaLcwoBJIYSPFBnt1CkyIy5WhvafC2EdTIOdxWeY2Q44n
 16yp3Io8EQS1TNR42T+/PhJGfA3lP30rbNQXTXVrLZNP5ldmyTfEA11xN0pEjlZwmQi8
 QJxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8ICQL2CbUMlDReIYxP6MzLi7AHAi3/67QlWM/ivjAKcnXUZazyt1uX/lcTHOG+KsSGNIAW4CRyw==@nongnu.org
X-Gm-Message-State: AOJu0YxBE6oJJZpratFL4m9ShpAz1UwTgaUWjtfJklGNQPUttOInohgM
 2FvWeAnj7OxroDxXt11jLORpyOes8MtoqM16SdKEB30DZysxCdeKy+m0EQlljlB/FWpKXadGimA
 +fudcQujW6q4YXTPv1qCP6qqQezJtN3jfT4ZYV3JaU3FoSSTLvPi+eg==
X-Gm-Gg: ASbGncuPJoQBZrnlGaEDH+T8lLnD9mglKjkYKkPC9ium1bDFN3xvJrkbcswxSXRIRRI
 Pd/fSC6HFbkSw+Z7UdO9xtudbgvCNsUf8t52b002Rv6Gq/9x3oNVOVksZ882iOs7q3OU7aXDU3I
 k49mXuUiIktlL2Pc3z9/3rw436pfe5VyOT4ddzsFGvGanFFSEpf3tUCGSUhff5dKE8uXLhbdIo7
 AvKAIV9KKaLkEirJbdPRmlmX0QncX/muMRKXmbOVGfXSJFBV5hELhIDt7sSoD7iVhdGr+ey76LL
 VYdPnWz1yKigguNfSfhAcMD8z7fb5OaI1cAtFIEIqWLFHXGk/4be
X-Received: by 2002:a05:6a21:6da6:b0:240:6dc:9162 with SMTP id
 adf61e73a8af0-2431b92264amr6015004637.40.1755711382004; 
 Wed, 20 Aug 2025 10:36:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBBYoA3qtaeKpqcTHUdpuHS7Lzle5P8pz0BwtcvtTc84c4XIb01BxQ7XIz9z8zTeWYuQywAQ==
X-Received: by 2002:a05:6a21:6da6:b0:240:6dc:9162 with SMTP id
 adf61e73a8af0-2431b92264amr6014944637.40.1755711381581; 
 Wed, 20 Aug 2025 10:36:21 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.47.192.65])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b4764003537sm2786943a12.25.2025.08.20.10.36.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 10:36:21 -0700 (PDT)
Date: Wed, 20 Aug 2025 23:06:09 +0530
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
Subject: Re: [PATCH v11 08/27] migration: push Error **errp into
 qemu_load_device_state()
Message-ID: <aKYHib2H4OXe2uSS@armenon-kvm.bengluru.csb>
References: <20250813-propagate_tpm_error-v11-0-b470a374b42d@redhat.com>
 <20250813-propagate_tpm_error-v11-8-b470a374b42d@redhat.com>
 <877bz4za1h.fsf@suse.de>
MIME-Version: 1.0
In-Reply-To: <877bz4za1h.fsf@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6SHqto7GwZLj82GOe58cbs6nzyg0Vzj92pjBzKIn3HY_1755711382
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

On Fri, Aug 15, 2025 at 03:58:50PM -0300, Fabiano Rosas wrote:
> Arun Menon <armenon@redhat.com> writes:
> 
> > This is an incremental step in converting vmstate loading
> > code to report error via Error objects instead of directly
> > printing it to console/monitor.
> > It is ensured that qemu_load_device_state() must report an error
> > in errp, in case of failure.
> >
> > Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> > Signed-off-by: Arun Menon <armenon@redhat.com>
> > ---
> >  migration/colo.c   | 4 ++--
> >  migration/savevm.c | 5 +++--
> >  migration/savevm.h | 2 +-
> >  3 files changed, 6 insertions(+), 5 deletions(-)
> >
> > diff --git a/migration/colo.c b/migration/colo.c
> > index e0f713c837f5da25d67afbd02ceb6c54024ca3af..0ba22ee76a13e313793f653f43a728e3c433bbc1 100644
> > --- a/migration/colo.c
> > +++ b/migration/colo.c
> > @@ -729,9 +729,9 @@ static void colo_incoming_process_checkpoint(MigrationIncomingState *mis,
> >      bql_lock();
> >      vmstate_loading = true;
> >      colo_flush_ram_cache();
> > -    ret = qemu_load_device_state(fb);
> > +    ret = qemu_load_device_state(fb, errp);
> >      if (ret < 0) {
> > -        error_setg(errp, "COLO: load device state failed");
> > +        error_prepend(errp, "COLO: load device state failed: ");
> 
> This will say: "COLO: load device state failed: Failed to load device
> state: %d"
> 
> Just remove it.
sure, will do.
> 
> >          vmstate_loading = false;
> >          bql_unlock();
> >          return;
> > diff --git a/migration/savevm.c b/migration/savevm.c
> > index 05dc392bdf4e19f340bc72bf66ba0543d56868a5..70e021597d884030c4a0dc2a7bc27d42a7371797 100644
> > --- a/migration/savevm.c
> > +++ b/migration/savevm.c
> > @@ -3263,15 +3263,16 @@ int qemu_loadvm_state(QEMUFile *f, Error **errp)
> >      return ret;
> >  }
> >  
> > -int qemu_load_device_state(QEMUFile *f)
> > +int qemu_load_device_state(QEMUFile *f, Error **errp)
> >  {
> > +    ERRP_GUARD();
> 
> Is this needed here?
Not needed. Will remove, as we are not using error_prepend()
> 
> >      MigrationIncomingState *mis = migration_incoming_get_current();
> >      int ret;
> >  
> >      /* Load QEMU_VM_SECTION_FULL section */
> >      ret = qemu_loadvm_state_main(f, mis);
> >      if (ret < 0) {
> > -        error_report("Failed to load device state: %d", ret);
> > +        error_setg(errp, "Failed to load device state: %d", ret);
> >          return ret;
> >      }
> >  
> > diff --git a/migration/savevm.h b/migration/savevm.h
> > index b80770b7461a60e2ad6ba5e24a7baeae73d90955..b12681839f0b1afa3255e45215d99c13a224b19f 100644
> > --- a/migration/savevm.h
> > +++ b/migration/savevm.h
> > @@ -67,7 +67,7 @@ int qemu_save_device_state(QEMUFile *f);
> >  int qemu_loadvm_state(QEMUFile *f, Error **errp);
> >  void qemu_loadvm_state_cleanup(MigrationIncomingState *mis);
> >  int qemu_loadvm_state_main(QEMUFile *f, MigrationIncomingState *mis);
> > -int qemu_load_device_state(QEMUFile *f);
> > +int qemu_load_device_state(QEMUFile *f, Error **errp);
> >  int qemu_loadvm_approve_switchover(void);
> >  int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
> >          bool in_postcopy);
> 

Regards,
Arun


