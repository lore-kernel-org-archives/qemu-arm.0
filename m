Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp1869275ejc;
        Mon, 13 Nov 2023 23:41:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFbO3R7NkEsXDHb0TljrWvDmiHDGpOCIktsp5FUJ2C5wzkl9W5VD0AASlotMpi0yxCk9kOM
X-Received: by 2002:ac8:5c82:0:b0:417:8d08:958d with SMTP id r2-20020ac85c82000000b004178d08958dmr2153649qta.2.1699947715171;
        Mon, 13 Nov 2023 23:41:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699947715; cv=none;
        d=google.com; s=arc-20160816;
        b=n4yBuYY49VuAJgi1bwd40tWe1/JJLC5ONKjIgRkudizqnm54detfTmIwXKNG1WOl3d
         b6nog+BDHr+JCbre9OpxbMO9QT+M3Ctt/MbCAYhYKEaUsxFN1cA6P3whKtvRrSWuGHGn
         WFjeFZh3Mo2YiJdnxZniXKep9D+aIEZdPLjGT2strdkbJfH0ILD2SAQ9Q0N5Yih/ikDu
         TUiyi729SyXpC8+Tv8imxxso423+IZznuDrTJtSmsU12BjrPmhN3vv9bumKzBVVc0XIJ
         uMJSFw6ffuoYad/R4OPq3xF1W051jCfHSjWezRjRWFiW337H6NEKj7b3d+GVKshiDKJH
         F2mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:dkim-signature;
        bh=Pxv+suxA3oUCmSzu9uwUR1hp/Rq/pOC9iQKwd+ETz0I=;
        fh=UOfelcJrjhN+wBZ4UPGC6WPCRZUo9Wbk4xASY5JeK3k=;
        b=er3DKfAAsdZcsqY6naOroQ8W/OG4Li2OxFea7UJu7EN5iRPjWa/6kmEww4tVXM6YvA
         g+SiV2Mp3t1bEjga7kFl/yusZw4RbWOt7njAB43pZMSkEjuVVFbwW/xnq+1CUJfFnP8X
         pTEsqSyPFN9mceDvY6cGoGCGwvMlceB2jaJHBp4p8y8MoouGYDeMFFU+7d/S8kH0je6R
         w4BI5UGGDUnxoRkh1Xn5s2WaWm3O+G70FzIEIR8uT60GO2RwpPs4FMN0vpjU/cmT4ZDq
         ZuQSx/b8wu3ie1u6ydvamg+bSejwy8dCRV9XXSmj6t4+WIsvfv/dpAb4fddo0s0h9+Rq
         sqEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cICs8Fp0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w9-20020a05622a134900b0041953bee755si6300443qtk.441.2023.11.13.23.41.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Nov 2023 23:41:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cICs8Fp0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r2o3K-0005mH-Mi; Tue, 14 Nov 2023 02:41:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1r2o3I-0005lf-SF
 for qemu-arm@nongnu.org; Tue, 14 Nov 2023 02:41:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1r2o3F-0003cd-Sp
 for qemu-arm@nongnu.org; Tue, 14 Nov 2023 02:41:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699947696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pxv+suxA3oUCmSzu9uwUR1hp/Rq/pOC9iQKwd+ETz0I=;
 b=cICs8Fp0toY4R25nBO9g9NLoPBxsex4ha11T/Cpyey/mljI7XqNFVdqDkGfMjXV7Kc+w6M
 xNQcQJjuWjO5PzbISdDV+zak2mcbStiBjw3179uSmDM5J3lxFy7aLaui249TMJKcOXA5t0
 au+3wrppWugUOx0kCzJB7DgMwDz9AiM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-679-2QzQBraTMwu7vF5JbGO-2A-1; Tue, 14 Nov 2023 02:41:32 -0500
X-MC-Unique: 2QzQBraTMwu7vF5JbGO-2A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 10EB2811002;
 Tue, 14 Nov 2023 07:41:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C1D1A502E;
 Tue, 14 Nov 2023 07:41:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C82C721E6A1F; Tue, 14 Nov 2023 08:41:30 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  thuth@redhat.com,  alistair@alistair23.me,
 edgar.iglesias@gmail.com,  peter.maydell@linaro.org,
 francisco.iglesias@amd.com,  qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH 0/2] Replace anti-social QOM type names (again)
References: <20231113134344.1195478-1-armbru@redhat.com>
 <ZVIo3FsmwpfHzsh8@redhat.com>
Date: Tue, 14 Nov 2023 08:41:30 +0100
In-Reply-To: <ZVIo3FsmwpfHzsh8@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Mon, 13 Nov 2023 13:47:08 +0000")
Message-ID: <87y1f0hjdh.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 1BWopzTOfhMV

Cc: the other QOM maintainers

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Mon, Nov 13, 2023 at 02:43:42PM +0100, Markus Armbruster wrote:
>> We got rid of QOM type names containing ',' in 6.0, but some have
>> crept back in.  Replace them just like we did in 6.0.
>
> It is practical to add
>
>    assert(strchr(name, ',') =3D=3D NULL)
>
> to some place in QOM to stop them coming back yet again ?

This adds a naming rule to QOM.  Right now, QOM has none whatsoever,
which I've long called out as a mistake.

I'm all for correcting that mistake, but I'd go further than just
outlawing ','.

Discussed in more depth here:

>> Cover letter of 6.0's replacement:
>> https://lore.kernel.org/qemu-devel/20210304140229.575481-1-armbru@redhat=
.com/

Let me copy the text for convenience.

QAPI has naming rules.  docs/devel/qapi-code-gen.txt:

    =3D=3D=3D Naming rules and reserved names =3D=3D=3D

    All names must begin with a letter, and contain only ASCII letters,
    digits, hyphen, and underscore.  There are two exceptions: enum values
    may start with a digit, and names that are downstream extensions (see
    section Downstream extensions) start with underscore.

    [More on reserved names, upper vs. lower case, '-' vs. '_'...]

The generator enforces the rules.

Naming rules help in at least three ways:

1. They help with keeping names in interfaces consistent and
   predictable.

2. They make avoiding collisions with the users' names in the
   generator simpler.

3. They enable quote-less, evolvable syntax.

   For instance, keyval_parse() syntax consists of names, values, and
   special characters ',', '=3D', '.'

   Since names cannot contain special characters, there is no need for
   quoting[*].  Simple.

   Values are unrestricted, but only ',' is special there.  We quote
   it by doubling.

   Together, we get exactly the same quoting as in QemuOpts.  This is
   a feature.

   If we ever decice to extend key syntax, we have plenty of special
   characters to choose from.  This is also a feature.

   Both features rely on naming rules.

QOM has no naming rules whatsoever.  Actual names aren't nearly as bad
as they could be.  Still, there are plenty of "funny" names.  This may
become a problem when we

* Switch from QemuOpts to keyval_parse()

  Compared to QemuOpts, keyval_parse() restricts *keys*, but not
  *values*.

  "Funny" type names occuring as values are no worse than before:
  quoting issues, described below.

  Type names occuring in keys must be valid QAPI names.  Should be
  avoidable.

* QAPIfy (the compile-time static parts of) QOM

  QOM type names become QAPI enum values.  They must conform to QAPI
  enum naming rules.

[...]

One more thing on relaxing QAPI naming rules.  QAPI names get mapped
to (parts of) C identifiers.  These mappings are not injective.  The
basic mapping is simple: replace characters other than letters and
digits by '_'.

This means names distinct QAPI names can clash in C.  Fairly harmless
when the only "other" characters are '-' and '_'.  The more "others" we
permit, the more likely confusing clashes become.  Not a show stopper,
"merely" an issue of ergonomics.

