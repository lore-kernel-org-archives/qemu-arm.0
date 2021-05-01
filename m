Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp822753lfg;
        Fri, 30 Apr 2021 23:49:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+Zzuplb/DMGgyOamH30bCLvEtw0F45IvkTDKwcQW37jiW++6e7q59TdPZr/i/20b7y7cB
X-Received: by 2002:a05:6e02:11a9:: with SMTP id 9mr7220498ilj.288.1619851768464;
        Fri, 30 Apr 2021 23:49:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619851768; cv=none;
        d=google.com; s=arc-20160816;
        b=MLej/7DGQrAFdPzkchWSBj32FJW+lbCD+6ThDLb9RkZ5Pk0xwo8/Xf0L+Mcz9AgPWP
         GWtn9HyqLGJsAhYuXE19yL01Rnutx67m5yUK/EajjA0ZnL9Wbr6nPdSgq4rNhsnuWMNl
         PJQHFCl/xrGml2LLkaTFcf+E2hVcj9RjLDO0A8ej+lxUR48tXPIoxnkjMfLKWG99hdBT
         g7HIPWQpXhExmhIGn6e9Ti83Ojif0B+tD7+SiOT0QqefXpWq/jBCChtCT9nqFMclR7/b
         sjc9xvj23t40PDP/CDvxU9560N+YiF+uqUTViTmn4+X88NqDVUiQ9I+cfyt7lRSrhyPV
         GLzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:to:from:dkim-signature;
        bh=GQuSgOqjT5t4JPI+VWrFwEnP/v1SuMcxBUNWicLdpUE=;
        b=qA4uag/cyN50D4RzmqsOKsodoqZ12hTyoOw8Z4u5geq0hkZbH2MvT5vzOB/YIwjRdj
         1LoTsGi5DUv8s5CyPuv0+e3p+wDQ501GE3VF5q1ARlpUQz/D57vksKTzKcjyjoswt5he
         9jdbNRwM98dwDKchKMcu4nb0FUytno2+Di7eCcEMwvQcPNpqKAPIMDSWlLXNafJ+mwIi
         cPln4Um5UfXFdlK7SmQ6hzVJdC0Maksj+8iYW8paYCFNH9DEB5GOj0XqPRKdmQX4sNYE
         iGgCpTpSNFl9EtRKlLdyyhqYRqAXRNwnj6odIqYK2sdHHSwViZHnm1kLzjtk5Gm18QvV
         QCNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gxdrsgTy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b14si249233ioz.76.2021.04.30.23.49.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 23:49:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gxdrsgTy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcjRP-0008Am-PO
	for alex.bennee@linaro.org; Sat, 01 May 2021 02:49:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lcjRH-0008AZ-HQ
 for qemu-arm@nongnu.org; Sat, 01 May 2021 02:49:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lcjRE-0001gk-M6
 for qemu-arm@nongnu.org; Sat, 01 May 2021 02:49:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619851755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GQuSgOqjT5t4JPI+VWrFwEnP/v1SuMcxBUNWicLdpUE=;
 b=gxdrsgTy82oKJfqymWF4BR75rXQNg3l7Lk81ISQ4JEHBI8oPVD65J3hLYjTEZYEpmAJbLF
 Y4Hs14e/Q+cKrA8E6bGTY6gPaqOQiUmgQLmio354N0VM8NfNcmI+8mD9rL18D+SXrv0QpE
 6Z7E0OPhh54rlR0BPXFb67aGlU00OKU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-W7NNr2tKPtKtf7YPCGDkWQ-1; Sat, 01 May 2021 02:49:12 -0400
X-MC-Unique: W7NNr2tKPtKtf7YPCGDkWQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 712B510066E5;
 Sat,  1 May 2021 06:49:11 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7873F2B0D2;
 Sat,  1 May 2021 06:49:07 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id F25AD113525D; Sat,  1 May 2021 08:49:05 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v4 10/12] qtest/qmp-cmd-test: Make test
 build-independent from accelerator
References: <20210415163304.4120052-1-philmd@redhat.com>
 <20210415163304.4120052-11-philmd@redhat.com>
 <87lf91ir1m.fsf@dusky.pond.sub.org>
 <1de6b3f8-7d7c-9280-4cd3-633a19dd9b8e@redhat.com>
 <874kfprzrw.fsf@dusky.pond.sub.org>
 <603c7934-ea16-baf8-9ae5-ab221db345c7@redhat.com>
 <87zgxgnvtv.fsf@dusky.pond.sub.org>
 <32bc66bc-1ccf-c146-52ac-83c7b4913930@redhat.com>
Date: Sat, 01 May 2021 08:49:05 +0200
In-Reply-To: <32bc66bc-1ccf-c146-52ac-83c7b4913930@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 30 Apr 2021 17:48:05
 +0200")
Message-ID: <87fsz7kkym.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel =?utf-8?Q?P=2EBerrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y7AMqLE1Ux+X

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 4/30/21 8:13 AM, Markus Armbruster wrote:
>> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>>> On 4/29/21 3:22 PM, Markus Armbruster wrote:
>>>> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>>>>>>> Now than we can probe if the TCG accelerator is available
>>>>>>> at runtime with a QMP command, do it once at the beginning
>>>>>>> and only register the tests we can run.
>>>>>>> We can then replace the #ifdef'ry by a runtime check.
>>>>>>>
>>>>>>> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
>>>>>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>>>>>>
>>>>>> Please read the last remark first.  The other ones are detail; feel =
free
>>>>>> to skip them until we're done with the last one.
>>>>>>
>>>>>>> ---
>>>>>>>  tests/qtest/qmp-cmd-test.c | 18 ++++++++++++++----
>>>>>>>  1 file changed, 14 insertions(+), 4 deletions(-)
>>>>>
>>>>>>> +    tcg_accel_available =3D qtest_has_accel("tcg");
>>>>>>> +
>>>>>>
>>>>>> When does tcg_accel_available differ from defined(CONFIG_TCG)?
>>>>>
>>>>> qtest_has_accel("tcg") is a runtime check, while defined(CONFIG_TCG)
>>>>> is build-time.
>>>>
>>>> Let me rephrase my question: under what conditions can the values of
>>>> qtest_has_accel("tcg") and defined(CONFIG_TCG) differ?
>>>
>>> They are currently the same, so this patch is a no-op. *But* it
>>> allows us to remove the global dependence on CONFIG_TCG in the
>>> Meson machinery (see the last commit in this series).
>>>
>>> Is that missing part of the commit description?
>>>
>>> "This will allow us to remove the global CONFIG_TCG dependency
>>> in our Meson machinery in a pair of commits."?
>>=20
>> Do you mean "in the next two commits"?
>
> Yes.
>
>> Please also note that the probing at run-time always gives the same
>> result as the compile-time check it replaces.
>>=20
>> I don't understand what exactly the conversion to probing enables and
>> how, but I believe I don't have to.
>
> This series is removing some limitations in qtests to help Claudio work:
>
> x86: https://www.mail-archive.com/qemu-devel@nongnu.org/msg793885.html
> arm: https://www.mail-archive.com/qemu-devel@nongnu.org/msg799328.html
> s390x: https://www.mail-archive.com/qemu-devel@nongnu.org/msg800254.html
>
> which allow building with different sets of accelerators (and more).
>
> Claudio/Paolo could better explain :)

Will this lead to different values of qtest_has_accel("tcg") and
defined(CONFIG_TCG) within a single build tree?

> What I like from feature tested at runtime is we can run qtests using
> older binaries, binaries built with different configure flags, or the
> binaries installed by the distribution.

Running with binaries build from a different HEAD seems unlikely to be
useful.  Any failures are just as likely to be caused bu the version
mismatch as by actual bugs.  Binaries for the same HEAD built for
another configuration can be made to work (this patch doesn't yet
suffice), but why should I care?

What I don't like is yet another moving part.

I'm not sure this is a good trade.  Quite possibly because I still don't
fully understand what we're trying to accomplish here :)

