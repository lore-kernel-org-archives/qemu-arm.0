Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A81C79F99
	for <qemu-arm@archiver.kernel.org>; Mon,  7 Sep 2026 10:14:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x3WM7-0005XG-0C; Mon, 07 Sep 2026 06:13:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1x3WM5-0005WA-Vz
 for qemu-arm@nongnu.org; Mon, 07 Sep 2026 06:13:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1x3WM2-0000nk-Pm
 for qemu-arm@nongnu.org; Mon, 07 Sep 2026 06:13:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1788776013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N+jdEf5W70qK0a7enGXVMjZkE6k9WDNDbLDEOIRWJ+w=;
 b=Z7lH3wfGVqKh6IC82HVNYf3AzYG6vqTZXwYfWbRTPwpaUwqSwafiGbrIhQpSlnOhiW7XWW
 Vui70oAF7E9tgGCKIzmne4ReeDo6X7uTQfztOAQxIUfRbviPOawANxl3tLJClXMtxOtbws
 gpRz6eb/SDPFWY7gxogH7cVpFrQuQCQ=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-85-brqUKNKnO5Kxbyh1QvcC6w-1; Mon, 07 Sep 2026 06:13:31 -0400
X-MC-Unique: brqUKNKnO5Kxbyh1QvcC6w-1
X-Mimecast-MFC-AGG-ID: brqUKNKnO5Kxbyh1QvcC6w_1788776011
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-398d292eac1so7365889a91.1
 for <qemu-arm@nongnu.org>; Mon, 07 Sep 2026 03:13:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788776011; x=1789380811;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=N+jdEf5W70qK0a7enGXVMjZkE6k9WDNDbLDEOIRWJ+w=;
 b=ko+tXSkYbxrm1adm6EZv/vUzAP9WbwGib/x4e0bsdAQNaIXK+90QMmMKM6olQgVlZa
 YvOUK48cpmKtQCBieixVdgimNC6uR/qlpmBaOjHKvcGlTyLO/ab8UHv45pPc5vuVstjs
 yBilqZ9PJAg6f1qQgNmVzTPRP3acO+Fl73k8dJ7nZi2vNHWtxzvVsKv0qrpIXZqsdcrm
 UI5ApVcGSYTncVDj+SWNcpUGql8OeSofx4/oHbv06+60q9u1CONcsM+0cdnwmWvtyem7
 juC+Uxw3PazASKlF43FX3fuMVdEhCMjC3w65Ii9WIijY32M9QYEALYJJCPbYyXDv/lMD
 5Wdg==
X-Forwarded-Encrypted: i=1;
 AKwUvByzkLCBBQllbv1H47eSUvQPItBE8LnuTxijIHUwxa6K2HXuR+VDzdNnQTUa/V82of1ob8DDf25Txg==@nongnu.org
X-Gm-Message-State: AFuF++mfkq9Zqx2HUGtV+DBXvnweOmBDr3Qi5rVumhiafpf1+YxmnSFn
 ylEndCpwXRblW49koyY9Tn7h7GETZgFz0+WpEBxenCrNrAXl4v63As1lqLKaSmFuaxj4xSNylxB
 A9jHpEI1my0V7F3Tu920+rni4IQXaxqNY32xcSA9LAw9X97VCHtil/YvuURFGa1U/TiDo1ze6ng
 aUNX0HXTXRAMoiVh6GKUl08MsW2rOF
X-Gm-Gg: AYBFou0RKixR2z3LEwbePJrH07o580aSCwOPSX3reWHxyRq+AA35G1VdzrX6nVx+IJ+
 HpUIfR319DPgg1qTm/n3KiVeB0//zXE5i1Iahvt7zvN9MZ8JZJoqRhsBuZAYdhX8ZA/hmKEriSB
 NhPZcW15Vz13LI+h/qtPwq6SFH9h3cqY03Igq3uecqcHv0HVpyQMKsoo78+P2Z3Kt1mnoRm+7N1
 9uIrD+aJuC6zz7+FBl773CF0Hu+K7qPPMOv4L/gtk9WNTX8Dgsz9FCwJT82ni3HUMcGAGJyehvM
 og==
X-Received: by 2002:a17:90a:d004:b0:398:c9be:cca8 with SMTP id
 98e67ed59e1d1-39b2609f363mr38629068a91.2.1788776010651; 
 Mon, 07 Sep 2026 03:13:30 -0700 (PDT)
X-Received: by 2002:a17:90a:d004:b0:398:c9be:cca8 with SMTP id
 98e67ed59e1d1-39b2609f363mr38629025a91.2.1788776010233; Mon, 07 Sep 2026
 03:13:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260906-nohmp-v1-0-daee96491c43@redhat.com>
 <20260906-nohmp-v1-4-daee96491c43@redhat.com>
 <ap6JAy9jaHzDakvw@redhat.com>
In-Reply-To: <ap6JAy9jaHzDakvw@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 7 Sep 2026 14:13:18 +0400
X-Gm-Features: AcwNN1WiHN_rDHAQsBoIZSnMVHrZPN1Ey_MeeGxzZkqyXVr4rf4a-vdzLS_JjKA
Message-ID: <CAMxuvaxhMVUNWssTp+MBfWSS9CowUipoRNbemHioz6Rf5M55EQ@mail.gmail.com>
Subject: Re: [PATCH 4/9] tests/qtest: add qtest_qmp_job_wait()
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>, 
 "Denis V. Lunev" <den@openvz.org>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <th.huth+qemu@posteo.eu>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org, 
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Eric Farman <farman@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>, 
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org, 
 Glenn Miles <milesg@linux.ibm.com>, qemu-ppc@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xsU7NokUFYJWGhlUNEi72OYzqez-KFIupzdOMsLamMw_1788776011
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.01, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi

On Mon, Sep 7, 2026 at 1:51=E2=80=AFPM Daniel P. Berrang=C3=A9 <berrange@re=
dhat.com> wrote:
>
> On Sun, Sep 06, 2026 at 12:42:35PM +0400, Marc-Andr=C3=A9 Lureau wrote:
> > Add a helper to wait for job conclusion, used in next changes.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  tests/qtest/libqtest.c | 37 +++++++++++++++++++++++++++++++++++++
> >  tests/qtest/libqtest.h | 11 +++++++++++
> >  2 files changed, 48 insertions(+)
> >
> > diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> > index 28bb72bfaecf..370f79a3b6fb 100644
> > --- a/tests/qtest/libqtest.c
> > +++ b/tests/qtest/libqtest.c
> > @@ -984,6 +984,43 @@ void qtest_qmp_eventwait(QTestState *s, const char=
 *event)
> >      qobject_unref(response);
> >  }
> >
> > +void qtest_qmp_job_wait(QTestState *s, const char *job_id)
> > +{
> > +    QDict *response, *data, *error;
> > +    QList *jobs;
> > +    const QListEntry *entry;
> > +
> > +    for (;;) {
> > +        response =3D qtest_qmp_eventwait_ref(s, "JOB_STATUS_CHANGE");
> > +        data =3D qdict_get_qdict(response, "data");
> > +        if (!strcmp(qdict_get_str(data, "id"), job_id) &&
> > +            !strcmp(qdict_get_str(data, "status"), "concluded")) {
>
>
>
> > +            qobject_unref(response);
> > +            break;
> > +        }
> > +        qobject_unref(response);
> > +    }
> > +
> > +    response =3D qtest_qmp(s, "{ 'execute': 'query-jobs' }");
> > +    g_assert(qdict_haskey(response, "return"));
> > +    jobs =3D qobject_to(QList, qdict_get(response, "return"));
> > +    g_assert(jobs);
> > +    QLIST_FOREACH_ENTRY(jobs, entry) {
> > +        QDict *job =3D qobject_to(QDict, qlist_entry_obj(entry));
> > +        if (!strcmp(qdict_get_str(job, "id"), job_id)) {
> > +            g_assert_null(qdict_get_try_str(job, "error"));
>
> If "job" did contain "error", then wouldn't we have hit
> a SEGV in the qdict_get_str() call due to missing 'id'
> field.

query-jobs returns [JobInfo], where "id" is mandary and "error" optional.

>
> IOW, we should likely validate this is NOT an error
> response first.

that's g_assert(qdict_haskey(response, "return"))

>
>
> > +            break;
> > +        }
> > +    }
> > +    qobject_unref(response);
> > +
> > +    response =3D qtest_qmp(s,
> > +        "{ 'execute': 'job-dismiss', 'arguments': { 'id': %s } }", job=
_id);
> > +    error =3D qdict_get_qdict(response, "error");
> > +    g_assert_null(error);
> > +    qobject_unref(response);
> > +}
> > +
>
> With regards,
> Daniel
> --
> |: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
> |: https://libvirt.org          ~~          https://entangle-photo.org :|
> |: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|
>


