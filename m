Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp65574lfp;
        Fri, 15 Jul 2022 01:46:39 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sMj0tW5c2QVNTrR+H7f9KkbC674uwwihgsED0FfUxpd+LgrUkvrInXd9hO8DxSBYCOzUlu
X-Received: by 2002:ac8:5c48:0:b0:31e:e01a:4d31 with SMTP id j8-20020ac85c48000000b0031ee01a4d31mr125813qtj.9.1657874799528;
        Fri, 15 Jul 2022 01:46:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657874799; cv=none;
        d=google.com; s=arc-20160816;
        b=esR4IRGXAhVI1ruBsNxvOXDd0Pr2MaJpCooVO5zuaCZYBY6iIDVUIFKzgBztLNQSJo
         RfW7twFMZ0LC+DryNpybRhHqWXmWX8T7Qe5jnmo3P/DsEsu0icT3F3rFOSKNQsxnUYOF
         tWbPri+CKfJcIccm+Qf9cosZ/p7G3GdVMVmAM4+ATXooSNtXxwwmMUI+5kADaX3No8yh
         Xdqw7Lfa/Vl7EKJUGbVhPlEXvzmfEXLT34GXPS9IQbgAGHabetE1554vHTXiI6FTqmvh
         hZ7DhlZBuMHxc9apI0toVENvAEmS38Gk0oPqvZ/9mWzr4+o/Rzy+/N5oVIBuR8ko3q/Z
         +eIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:user-agent:references:organization
         :in-reply-to:subject:cc:to:from:dkim-signature;
        bh=eI1fXUzFEQ+XYj91lrwoikq4KMb1NAuge66KD8K3VLQ=;
        b=W9uNgr/UgN4dx1SPE/lMzq6lUlCjm44g0PAabi2wdeiJpUriOC/ByJsTeppAiRoow7
         BbxuTLRNNd4Z1SdgvBW5RP3VXV2apZT6qWE88WRLFHr4CQ1tY/6OjHHOiVbmRw/2pfrm
         yE6JwFZdGlMNeL3UUHJ21XZQVFHQOeWezITIt6tup9z9b67ZBFSbztakGJIA0rudl6gF
         aRmxawCXcST+jCj3vQwLJQz9pivZ3516rW5FYcm3/m3qyMOK/WH6wMmYw6V8H0A1cFh1
         e6T0NuXz68i85rD2+mE2XiaBzFLXhpVVrQVRcUq3WHq6I0MJXkeB8S1cjzZL3dUHcmli
         u0FA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GDURlCls;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fw11-20020a05622a4a8b00b0031eaafe8366si2262259qtb.250.2022.07.15.01.46.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Jul 2022 01:46:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GDURlCls;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oCGy6-0003vu-Ii
	for alex.bennee@linaro.org; Fri, 15 Jul 2022 04:46:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oCGxd-0003rk-CZ
 for qemu-arm@nongnu.org; Fri, 15 Jul 2022 04:46:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oCGxa-0004w2-Hk
 for qemu-arm@nongnu.org; Fri, 15 Jul 2022 04:46:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657874766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eI1fXUzFEQ+XYj91lrwoikq4KMb1NAuge66KD8K3VLQ=;
 b=GDURlClsCWWWfyCxmGAIBMy7w6sTI0dizk82GVk63bhHSk0DrssRBvetP71L5huJjeC740
 x9Xq6VoPOy5/eO/3EoLwXzkBo+5hbTwfJsIGu5UBSoDc9ejx4EFhA7XPLK445J4+h9JXpx
 53Iyk6d6RoQRm/vN11yZcMcGk6wOJ/A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-VCBVE7-DNkK6W57u_512Gg-1; Fri, 15 Jul 2022 04:46:00 -0400
X-MC-Unique: VCBVE7-DNkK6W57u_512Gg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 632B3811E80;
 Fri, 15 Jul 2022 08:46:00 +0000 (UTC)
Received: from localhost (dhcp-192-213.str.redhat.com [10.33.192.213])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 279DE141511A;
 Fri, 15 Jul 2022 08:46:00 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, David Hildenbrand <david@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>
Subject: Re: [PATCH 0/3] target: RFC: display deprecation note for '-cpu help'
In-Reply-To: <20220714150735.1835166-1-berrange@redhat.com>
Organization: Red Hat GmbH
References: <20220714150735.1835166-1-berrange@redhat.com>
User-Agent: Notmuch/0.36 (https://notmuchmail.org)
Date: Fri, 15 Jul 2022 10:45:59 +0200
Message-ID: <87pmi63gs8.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N9dLNVXoMR2u

On Thu, Jul 14 2022, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> When querying '-cpu help' there is no presentation of fact that a
> CPU may be deprecated. The user just has to try it and see if they
> get a depecation message at runtime.  The QMP command for querying
> CPUs report a deprecation bool flag, but not the explanatory
> reason.
>
> The Icelake-Client CPU (removed in 6df39f5e583ca0f67bd934d1327f9ead2e3bd4=
9c)
> handled this by modifying the '.notes' section to add the word
> 'deprecated':
>
>             {
>                 .version =3D 2,
>                 .note =3D "no TSX, deprecated",
>                 .alias =3D "Icelake-Client-noTSX",
>                 .props =3D (PropValue[]) {
>                     { "hle", "off" },
>                     { "rtm", "off" },
>                     { /* end of list */ }
>                 },
>             },
>
> This relies on the person deprecating the CPU to remember to do this,
> and is redundant when this info is already expressed in the
> '.deprecation_note' field.
>
> This short series suggests just modifying the '-cpu help'
> formatter so that it displays the full deprecation message
>
> eg
>
> $ qemu-system-x86_64 -cpu help:
> Available CPUs:
> x86 486                   (alias configured by machine type) (deprecated:=
 use at least 'Nehalem' / 'Opteron_G4', or 'host' / 'max')
>
> I wonder if this is too verbose, and we should just do a
> concise flag like approach, similar to QMP:
>
> $ qemu-system-x86_64 -cpu help:
> Available CPUs:
> x86 486                   (alias configured by machine type) (deprecated)
>
> leaving the full message to be displayed at runtime ? I'm slightly
> inclined to the simpler more concise output.

The good thing about the longer output is that the user gets the full
information right from the start, and does not need to dig around and
figure out why it is deprecated, and what to use instead. That said, if
we have very verbose deprecation notes, the output may get a bit
cluttered. I think I slightly prefer the verbose output.

>
> This series touched x86_64, s390x, and aarch64 because that's all I
> personally needed from a downstream POV, but any & all of the targets
> would benefit from this. They have each implemneted the '-cpu help'
> logic independantly though, and unifying that code is not entirely
> straightforward.

It seems that any arch that does not use a very simple output has chosen
a different format...

