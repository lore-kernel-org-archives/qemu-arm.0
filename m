Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DDF2CAC592
	for <qemu-arm@archiver.kernel.org>; Wed, 17 Sep 2025 00:35:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uyg8W-0006vE-4d; Tue, 16 Sep 2025 20:35:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1uyg8V-0006ut-9C
 for qemu-arm@nongnu.org; Tue, 16 Sep 2025 20:35:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1uyg8S-0000Mz-UM
 for qemu-arm@nongnu.org; Tue, 16 Sep 2025 20:35:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758069298;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ymbpRq9YpNAUafcUiILnmT+oAT539RDZsES5l02Me5w=;
 b=cJVIV6ctflcGUHt8wWw+sZo05+hGPJlyM8+EKQVKZ1ONX1fTk+dGkSgXyc1SJDcmwjPCb8
 OXFAe7umi58wWYxOMbCCBm830yt4ub7v5ko9zGVOpnh0dTvMzYfacsZJl/9HhETg23GIxn
 cuW5FzALjrRFaOeI0EGsQ2bSZqHu/YE=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-rzfAtAIwMjWD71BLri8Q5Q-1; Tue, 16 Sep 2025 20:34:56 -0400
X-MC-Unique: rzfAtAIwMjWD71BLri8Q5Q-1
X-Mimecast-MFC-AGG-ID: rzfAtAIwMjWD71BLri8Q5Q_1758069296
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-32eae48beaaso941368a91.0
 for <qemu-arm@nongnu.org>; Tue, 16 Sep 2025 17:34:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758069295; x=1758674095;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:reply-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ymbpRq9YpNAUafcUiILnmT+oAT539RDZsES5l02Me5w=;
 b=pBmx2Ir9aP9kTrbEgAJ7rYEcCCRVvd2mARxvgI5sqJo7dLTzp+sQ3O+ehxJxkwTEQp
 4qF8JjDZX1i8MM2xJnjnBprv9TJnf/Wr3BsLrQlUrlUWzG2gekMVPdVglyGljkZpIK7R
 MausQXoYdFyqty7w+CgDozqEqKECT2FMcpghE6cFtR+++CriIG4uXATkNe5Tj3sNDkXv
 /QqwH0/PKZBIO8TukzfAbrJ9J8In5JoEn14eRF4dbKSvA7+LHrOPJQI859/NsfhDDmWS
 Bp7xyGvmzqB6qVq1gsrCPF//lJqqXsA+sfVR9lpK68x1Ble19vXNEJVn/ozDwD1WkIaJ
 di8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoQltmHFqRSBEywVBkjpDXUHZ+CuBfceChbgI7o6YBwjZX4k56joWZ50Y/W8rJzsvnq9vbEVaUkQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy21gphBk186GOyzSetyncsMhILWb2GeNIoekFiei9PAFuzfqs7
 Rogodekyo0a/m4U7xV5KMVGmXrPdirIBjaQC72x/GX5U2FhMtk7M+P+bTYKq3PsPI3IBa46KSlZ
 G+MLMnYnbpb7wRpLGO9vwSefaJFBpap4NxFccoQEJ4RLxJ7lCV22o9g==
X-Gm-Gg: ASbGncsHzs2jHGcy2KyFsHYsyAbYR4Horj2Z04fJJF7zYirsAArSsBUYdjEajASt1r0
 9y8y+yP5Nc3aD1vWMOQqZUqc16fNunWBvS/1os1Sm0FvLeHOS+1o3sH9c1bFmUQOZSJ6ycbKDBu
 aJJADx83pCqdo4AfMx5z447PTAQG73aBH9EGVDqSAlPDY+pjNrZ2m3HRGwgHOms4QxgnniqZl5f
 ybPfjfkiv0VhiN1J/AT0+XX+Ve4NpZkgKIH1sADxNFXP/dDgyzHAo6DduWBfPrXg5qNHRTr6cGV
 iK9zHBUsoRB/VZgbFpDqxbpN84OqG1knsz3eIF9izTxxeue9m68m
X-Received: by 2002:a17:90b:2787:b0:32e:d638:9e2b with SMTP id
 98e67ed59e1d1-32ee3ebd75bmr389972a91.12.1758069295557; 
 Tue, 16 Sep 2025 17:34:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6o6bRWHaSUzklC60Yu2PihAOY1hnrUbmCNUDLsdwAiJLJdkEP0DbmxDHMzSk6XG0X5RjwRw==
X-Received: by 2002:a17:90b:2787:b0:32e:d638:9e2b with SMTP id
 98e67ed59e1d1-32ee3ebd75bmr389923a91.12.1758069295093; 
 Tue, 16 Sep 2025 17:34:55 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.36.110.66])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-32ed26a3691sm760216a91.13.2025.09.16.17.34.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 17:34:54 -0700 (PDT)
Date: Wed, 17 Sep 2025 06:04:43 +0530
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
Message-ID: <aMoCIwzS7NWmTedG@armenon-kvm.bengluru.csb>
References: <20250830-propagate_tpm_error-v13-0-a4e777b7eb2c@redhat.com>
 <20250830-propagate_tpm_error-v13-7-a4e777b7eb2c@redhat.com>
 <078e2ef1-fbfa-450a-a2ab-d1e77cc8e850@rsg.ci.i.u-tokyo.ac.jp>
 <aLRt_G-pOH1rwJbb@armenon-kvm.bengluru.csb>
 <017c40a6-3347-43e7-b7b7-9e2e2130d19e@rsg.ci.i.u-tokyo.ac.jp>
 <aLR6mKJyVPZ4bqnZ@armenon-kvm.bengluru.csb>
 <6bee20a5-6f12-4b12-aab3-1a2019418611@rsg.ci.i.u-tokyo.ac.jp>
 <aLfklAy0qqetX8_K@armenon-kvm.bengluru.csb>
 <201bb795-57af-4614-8ef1-e5218108c13f@rsg.ci.i.u-tokyo.ac.jp>
MIME-Version: 1.0
In-Reply-To: <201bb795-57af-4614-8ef1-e5218108c13f@rsg.ci.i.u-tokyo.ac.jp>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7OUuGQu5Yr5Z6aJv5jxumR8mgG-2g6Zyg665x_veNBo_1758069296
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armenon@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.009,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: armenon@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Akihiko,

On Sat, Sep 06, 2025 at 05:22:31AM +0200, Akihiko Odaki wrote:
> On 2025/09/03 8:47, Arun Menon wrote:
> > Hi Akihiko,
> > 
> > It took some time to set up the machines; apologies for the delay in response.
> > 
> > On Mon, Sep 01, 2025 at 02:12:54AM +0900, Akihiko Odaki wrote:
> > > On 2025/09/01 1:38, Arun Menon wrote:
> > > > Hi,
> > > > 
> > > > On Mon, Sep 01, 2025 at 01:04:40AM +0900, Akihiko Odaki wrote:
> > > > > On 2025/09/01 0:45, Arun Menon wrote:
> > > > > > Hi Akihiko,
> > > > > > Thanks for the review.
> > > > > > 
> > > > > > On Sat, Aug 30, 2025 at 02:58:05PM +0900, Akihiko Odaki wrote:
> > > > > > > On 2025/08/30 5:01, Arun Menon wrote:
> > > > > > > > This is an incremental step in converting vmstate loading
> > > > > > > > code to report error via Error objects instead of directly
> > > > > > > > printing it to console/monitor.
> > > > > > > > It is ensured that qemu_loadvm_state() must report an error
> > > > > > > > in errp, in case of failure.
> > > > > > > > 
> > > > > > > > When postcopy live migration runs, the device states are loaded by
> > > > > > > > both the qemu coroutine process_incoming_migration_co() and the
> > > > > > > > postcopy_ram_listen_thread(). Therefore, it is important that the
> > > > > > > > coroutine also reports the error in case of failure, with
> > > > > > > > error_report_err(). Otherwise, the source qemu will not display
> > > > > > > > any errors before going into the postcopy pause state.
> > > > > > > > 
> > > > > > > > Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> > > > > > > > Reviewed-by: Fabiano Rosas <farosas@suse.de>
> > > > > > > > Signed-off-by: Arun Menon <armenon@redhat.com>
> > > > > > > > ---
> > > > > > > >      migration/migration.c |  9 +++++----
> > > > > > > >      migration/savevm.c    | 30 ++++++++++++++++++------------
> > > > > > > >      migration/savevm.h    |  2 +-
> > > > > > > >      3 files changed, 24 insertions(+), 17 deletions(-)
> > > > > > > > 
> > > > > > > > diff --git a/migration/migration.c b/migration/migration.c
> > > > > > > > index 10c216d25dec01f206eacad2edd24d21f00e614c..c6768d88f45c870c7fad9b9957300766ff69effc 100644
> > > > > > > > --- a/migration/migration.c
> > > > > > > > +++ b/migration/migration.c
> > > > > > > > @@ -881,7 +881,7 @@ process_incoming_migration_co(void *opaque)
> > > > > > > >                            MIGRATION_STATUS_ACTIVE);
> > > > > > > >          mis->loadvm_co = qemu_coroutine_self();
> > > > > > > > -    ret = qemu_loadvm_state(mis->from_src_file);
> > > > > > > > +    ret = qemu_loadvm_state(mis->from_src_file, &local_err);
> > > > > > > >          mis->loadvm_co = NULL;
> > > > > > > >          trace_vmstate_downtime_checkpoint("dst-precopy-loadvm-completed");
> > > > > > > > @@ -908,7 +908,8 @@ process_incoming_migration_co(void *opaque)
> > > > > > > >          }
> > > > > > > >          if (ret < 0) {
> > > > > > > > -        error_setg(&local_err, "load of migration failed: %s", strerror(-ret));
> > > > > > > > +        error_prepend(&local_err, "load of migration failed: %s: ",
> > > > > > > > +                      strerror(-ret));
> > > > > > > >              goto fail;
> > > > > > > >          }
> > > > > > > > @@ -924,13 +925,13 @@ fail:
> > > > > > > >          migrate_set_state(&mis->state, MIGRATION_STATUS_ACTIVE,
> > > > > > > >                            MIGRATION_STATUS_FAILED);
> > > > > > > >          migrate_set_error(s, local_err);
> > > > > > > > -    error_free(local_err);
> > > > > > > > +    error_report_err(local_err);
> > > > > > > 
> > > > > > > This is problematic because it results in duplicate error reports when
> > > > > > > !mis->exit_on_error; in that case the query-migrate QMP command reports the
> > > > > > > error and this error reporting is redundant.
> > > > > > 
> > > > > > If I comment this change, then all of the errors propagated up to now, using
> > > > > > error_setg() will not be reported. This is the place where it is finally reported,
> > > > > > when qemu_loadvm_state() fails. In other words, all the error_reports() we removed
> > > > > > from all the files, replacing them with error_setg(), will finally be reported here
> > > > > > using error_report_err().
> > > > > 
> > > > > My understanding of the code without these two changes is:
> > > > > - If the migrate-incoming QMP command is used with false as
> > > > >     exit-on-error, this function will not report the error but
> > > > >     the query-migrate QMP command will report the error.
> > > > > - Otherwise, this function reports the error.
> > > > 
> > > > With my limited experience in testing, I have a question,
> > > > So there are 2 scenarios,
> > > > 1. running the virsh migrate command on the source host. Something like the following,
> > > >     virsh -c 'qemu:///system' migrate --live --verbose --domain guest-vm --desturi qemu+ssh://10.6.120.20/system
> > > >     OR for postcopy-ram,
> > > >     virsh migrate guest-vm --live qemu+ssh://10.6.120.20/system --verbose --postcopy --timeout 10 --timeout-postcopy
> > > > 
> > > > 2. Using QMP commands, performing a migration from source to destination.
> > > >     Running something like the following on the destination:
> > > >     {
> > > >       "execute": "migrate-incoming",
> > > >       "arguments": {
> > > >         "uri": "tcp:127.0.0.1:7777",
> > > >         "exit-on-error": false
> > > >       }
> > > >     }
> > > >     {
> > > >       "execute": "migrate-incoming",
> > > >       "arguments": {
> > > >         "uri": "tcp:127.0.0.1:7777",
> > > >         "exit-on-error": false
> > > >       }
> > > >     }
> > > >     and the somthing like the following on source:
> > > >     {
> > > >       "execute": "migrate",
> > > >       "arguments": {
> > > >         "uri": "tcp:127.0.0.1:7777"
> > > >       }
> > > >     }
> > > >     {"execute" : "query-migrate"}
> > > > 
> > > > In 1, previously, the user used to get an error message on migration failure.
> > > > This was because there were error_report() calls in all of the files.
> > > > Now that they are replaced with error_setg() and the error is stored in errp,
> > > > we need to display that using error_report_err(). Hence I introduced an error_report_err()
> > > > call in the fail section.
> > > > 
> > > > In 2, we have 2 QMP sessions, one for the source and another for the destination.
> > > > The QMP command migrate will be issued on the source, and the errp will be set.
> > > > I did not understand the part where the message will be displayed because of the
> > > > error_report_err() call. I did not see such a message on failure scenario on both
> > > > the sessions.
> > > > If the user wants to check for errors, then the destination qemu will not exit
> > > > (exit-on-error = false ) and we can retrieve it using {"execute" : "query-migrate"}
> > > > 
> > > > Aren't the 2 scenarios different by nature?
> > > 
> > > In 1, doesn't libvirt query the error with query-migrate and print it?
> > 
> > Ideally it should find the the error, and print the whole thing. It does work
> > in the normal scenario. However, the postcopy scenario does not show the same result,
> > which is mentioned in the commit message.
> > 
> > > 
> > > In any case, it would be nice if you describe how libvirt interacts with
> > > QEMU in 1.
> > 
> > Please find below the difference in the command output at source, when we run a live migration
> > with postcopy enabled.
> > 
> > =========
> > With the current changes:
> > [root@dell-per750-42 qemu-priv]# virsh migrate-setspeed guest-vm 1
> > 
> > [root@dell-per750-42 build]# virsh migrate guest-vm --live qemu+ssh://10.6.120.9/system --verbose --postcopy --timeout 10 --timeout-postcopy
> > root@10.6.120.9's password:
> > Migration: [ 1.26 %]error: internal error: QEMU unexpectedly closed the monitor (vm='guest-vm'): 2025-09-03T06:19:15.076547Z qemu-system-x86_64: -accel kvm: warning: Number of SMP cpus requested (2) exceeds the recommended cpus supported by KVM (1)
> > 2025-09-03T06:19:15.076586Z qemu-system-x86_64: -accel kvm: warning: Number of hotpluggable cpus requested (2) exceeds the recommended cpus supported by KVM (1)
> > 2025-09-03T06:19:27.776715Z qemu-system-x86_64: load of migration failed: Input/output error: error while loading state for instance 0x0 of device 'tpm-emulator': post load hook failed for: tpm-emulator, version_id: 0, minimum_version: 0, ret: -5: tpm-emulator: Setting the stateblob (type 1) failed with a TPM error 0x21 decryption error
> > 
> > [root@dell-per750-42 build]#
> > 
> > =========
> > 
> > Without the current changes:
> > [root@dell-per750-42 qemu-priv]# virsh migrate-setspeed guest-vm 1
> > 
> > [root@dell-per750-42 qemu-priv]# virsh migrate guest-vm --live qemu+ssh://10.6.120.9/system --verbose --postcopy --timeout 10 --timeout-postcopy
> > root@10.6.120.9's password:
> > Migration: [ 1.28 %]error: internal error: QEMU unexpectedly closed the monitor (vm='guest-vm'): 2025-09-03T06:26:17.733786Z qemu-system-x86_64: -accel kvm: warning: Number of SMP cpus requested (2) exceeds the recommended cpus supported by KVM (1)
> > 2025-09-03T06:26:17.733830Z qemu-system-x86_64: -accel kvm: warning: Number of hotpluggable cpus requested (2) exceeds the recommended cpus supported by KVM (1)
> > 
> > [root@dell-per750-42 qemu-priv]#
> > 
> > =========
> > The original behavior was to print the error to the console regardless of whether the migration is normal or postcopy.
> 
> This was true for messages in qemu_loadvm_state(), but the message "load of
> migration failed" was printed or queried with query-migrate, not both. We
> should think of which behavior is more appropriate, and I think we should
> avoid duplicate reports.
> 
> > The source machine goes in to a paused state after this.
> 
> The output is informative. It implies the destination machine exited, and it
> makes sense to print error messages as it is done for
> mis->exit_on_error. I wonder if it is possible to detect the condition and
> treat it identically to mis->exit_on_error.

I see that we want to catch a specific scenario in postcopy ram migration
where the destination abruptly exits without a graceful shutdown,
thus failing to inform the source the reason for its failure through a
'query-migrate' even though 'exit-on-error' was set to false on the destination.

However, I am not sure how to reliably detect the specific error condition of
such a connection close that you have described. Given that this is a large
patch series already, could we keep the current change as is for now?
From what I can tell, the additional log message "load of migration failed"
is not a breaking change and will not cause a crash. We can develop a more
elegant solution to handle the issue of duplication in a separate patch.

> 
> Regards,
> Akihiko Odaki
> 

Regards,
Arun Menon


