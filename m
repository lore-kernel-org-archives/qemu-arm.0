Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp4631912lfk;
        Tue, 30 Nov 2021 02:03:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxf8tEPTT6PK1eSoTMhxRgTansvuRbO72B1qGEjjwWvHNiMmBKsXv0ipPtUZA3z+4kpXpY3
X-Received: by 2002:a05:620a:1f0:: with SMTP id x16mr37012793qkn.775.1638266627268;
        Tue, 30 Nov 2021 02:03:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1638266627; cv=none;
        d=google.com; s=arc-20160816;
        b=XXQus3eKosMjy3y5+ISzY1w8/Ffla8G0vkmSQknYOIanWdKjyJ6G27mTWuWoEb44v+
         pRMfaVPcULgTshjfHGxICwZDPah0jzr32V9V9LC1GAX6qLd0bfHJaVZN/2+ZYNXz4dNc
         Nf0gJYoqJVMRE6A98o7Mcyx/CcpbDPnD+R/W8lH/CMr7YjZclf0hKrypUGaoj8QuRahD
         f6o8UpXvs1PSaRcYR/tZa8Ypz1An3UVJXZTGPw/IGn6Nf17fA17y9Xdeb79mGXvsSmLv
         fNfTkgbeV76MRUNcE/MjfO2CciZXA1CauIHLZcQxRFHfnMqfZGr9W8DEmpAPMJjmg2gG
         Sx8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:to:from:dkim-signature;
        bh=ZwvtwR4xWzS8/LDAeHkmonCqfQZgTdavVQWq7EjJG04=;
        b=skleZDMdUXmGW01b6NQLNAkopRC/DqW1p3NJxpRJQsFXHustzChF23/ifogFCmsBoW
         EcowwHZAZJzcV7LFDYrR7IIUg6LZJgLMBz3TdO3/VUe73i2GkB50XG9bkcY8uEbLSoOG
         OmD1Wtzg6Crp7IMPa7F4qHZqV6kjvXaSJ8JIUanpe1Tj0FLH7+BMozCi49ltEJg5BybI
         mPHsc1Ypt/lODdCXCqo+xr7z4oQ2gFdT1wUmOvks/Mmgcf0zJe4q7o/HoxWWRpiKUeJG
         XGbHWFQu4Ih68WQ/pQzKNXQWi3J+/8iN05GesC3k0BeerUUTVYCnpG0PUB9SyNp+m6hy
         8d6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=M20q6m2B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h17si17364097qtx.634.2021.11.30.02.03.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Nov 2021 02:03:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=M20q6m2B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mrzzG-0004r5-LQ
	for alex.bennee@linaro.org; Tue, 30 Nov 2021 05:03:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mrzz3-0004qr-8z
 for qemu-arm@nongnu.org; Tue, 30 Nov 2021 05:03:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mrzz0-0004iD-VI
 for qemu-arm@nongnu.org; Tue, 30 Nov 2021 05:03:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638266609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZwvtwR4xWzS8/LDAeHkmonCqfQZgTdavVQWq7EjJG04=;
 b=M20q6m2B8z8UiKxI9nE2z+6ACng961PxRddjSoT70fPk0TmMjrk+mMISYVxpKxcXkcsfVu
 tnb7kBGP0FDoc1eXMvKB8r9NgWJ4q+jrne+idbHVGkChw4tzgavDAlhvGpwxfRvlbEjU3b
 gRxY9tjTDE5eAwRCaL1PtfvcGU1uNts=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-208-eX2lhVSNNM-eVh-eIZ0l7w-1; Tue, 30 Nov 2021 05:03:27 -0500
X-MC-Unique: eX2lhVSNNM-eVh-eIZ0l7w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18DE0101F7A1;
 Tue, 30 Nov 2021 10:03:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AE4014EE1D;
 Tue, 30 Nov 2021 10:02:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A8EEE113865F; Tue, 30 Nov 2021 11:02:47 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-7.0 0/4] qemu-common.h include cleanup
References: <20211129200510.1233037-1-peter.maydell@linaro.org>
 <CAFEAcA_ognVQ=7-pE+MDwkJCtcD0FfzPL0Vnb7vTgzbVSpnrLA@mail.gmail.com>
Date: Tue, 30 Nov 2021 11:02:47 +0100
In-Reply-To: <CAFEAcA_ognVQ=7-pE+MDwkJCtcD0FfzPL0Vnb7vTgzbVSpnrLA@mail.gmail.com>
 (Peter Maydell's message of "Mon, 29 Nov 2021 20:48:08 +0000")
Message-ID: <87sfvenepk.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>, Sergio Lopez <slp@redhat.com>,
 qemu-devel@nongnu.org, Taylor Simpson <tsimpson@quicinc.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B8qyKLBJDPH4

Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 29 Nov 2021 at 20:05, Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>>
>> qemu-common.h has a comment at the top:
>>
>>  * This file is supposed to be included only by .c files. No header file=
 should
>>  * depend on qemu-common.h, as this would easily lead to circular header
>>  * dependencies.
>
> As a side note, that comment was added back in 2012 when qemu-common.h
> was bigger, included other headers, and did some of the work we currently
> use osdep.h for. As it stands today qemu-common.h includes no other
> files so it isn't a source of possible circular dependencies -- it's
> just a grab-bag of miscellaneous prototypes that in an ideal world
> would be in more focused individual headers[*]. So there's an argument
> for deleting this comment...

First, thank you for this cleanup series.

The comment is from commit 04509ad939a:

    qemu-common.h: Comment about usage rules
   =20
    Every time we make a tiny change on a header file, we often find
    circular header dependency problems. To avoid this nightmare, we need t=
o
    stop including qemu-common.h from other headers, and we should graduall=
y
    move the declarations from the catch-all qemu-common.h header to their
    specific headers.
   =20
    This simply adds a comment documenting the rules about qemu-common.h,
    hoping that people will see it before including qemu-common.h from othe=
r
    header files, and before adding more declarations to qemu-common.h.
   =20
    Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
    Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>

You're right: we've since moved all #include out of qemu-common.h, so
the risk of circular header dependency is gone, and the comment's claim
"this would easily lead to circular header dependencies" is no longer
correct.

In my opinion, including qemu-common.h in a header is a bad idea
regardless.  Headers should include the headers they need to make them
self-contained, and no more, because more risks slower compiles, in
particular frequent recompiles of pretty much everything.  Previously
discussed at

    https://lists.gnu.org/archive/html/qemu-devel/2019-05/msg06291.html
    Message-ID: <877eac82il.fsf@dusky.pond.sub.org>

Nothing in qemu-common.h should be required to make another header
self-contained.

This is likely the case for other headers as well, which don't carry a
comment forbidding inclusion into headers.  You could argue that
qemu-common.h should not carry one, either.  I can accept that.  I'm not
attached to the comment.  I am interested in keeping unwanted #include
in headers under control.

> [*] A cleanup that would be nice, and I'm about to send out a patchset
> that splits out the rtc related functions; but the grab-bag at the
> bottom of osdep.h is probably higher priority because that header
> gets pulled in by an order of magnitude more C files.

By all "normal" ones, in fact.

