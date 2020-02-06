Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1389709lfp;
        Thu, 6 Feb 2020 04:41:11 -0800 (PST)
X-Google-Smtp-Source: APXvYqyIWCe5ESJq7cH1zMWuGoMQUWKIBkxK/nMHtVtOjvQkMdWY4GEDlVM6XG+YWwi7pNKbkc0+
X-Received: by 2002:aed:3e13:: with SMTP id l19mr2349008qtf.103.1580992870911;
        Thu, 06 Feb 2020 04:41:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580992870; cv=none;
        d=google.com; s=arc-20160816;
        b=DkV5W53PKlaJVCl59hP9uoqQf+nTkukjRiTrJEeilXILEHNXUo9zweGqML4X7Sxq88
         36/v+EFHnYb5Za+gkl69vxjUc1r+70Plc+6U0tg9Z29z5RQ5PJU5BdxIywSL/RAHCuVm
         kSEv7q2nP/KmDyBeeKge+0Y29sn4kHGA5iAxRdAVHD4xwW/I5JbXCpThPV1FRMbKclDe
         g2J+zYWI1YFvPx5qWmeMJ4f4GpDIegVol4EX+IRQ16Sqsrq6fbEvyhf9R3MSZ46QDPvT
         gH2dGq90OfRXrtSO5Rj6LFGdxORDQmkSAw8mRo9e+R7iIz++HMGUSIJv7BUwuwrR+EK1
         VDtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=FgaO1qcylEw1Ratw4Gx0lE+m4ReViIem7CxGHMx+5Is=;
        b=fdemjRdv5px4AtUdgMjOij520GfeQN5vgoukGH3arkmwyBnx26UOoiBvaPd9FL8fmU
         vHb/qaM00jsXQr9MZL9lNb3WweccRE8Kph6gnTiHenMX8/aIPi+ADEV7oWFWuACtCSq0
         mVqGa6CCAnxgCwxfK21xSaNHMDIek16P8crzXkDgo6CePzvdGySFe7HAVK/IAyLzG1D0
         bPjduRGz+ZjvYwipcbRh16Pf3GOQyJKud93FbIllzg5QxAU2Aje7IOl4rmRqZUwnnWDX
         otGekqRayZQdFdxovtq30XgKdSSSoaUTJ1NB5qA7cAaQWEPtJb804xSVOy3NiTYMOZjA
         8RdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fgOHSvNr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z24si1444077qtn.325.2020.02.06.04.41.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2020 04:41:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fgOHSvNr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izgT0-0001ob-AD
	for alex.bennee@linaro.org; Thu, 06 Feb 2020 07:41:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51396)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1izgSp-0001l6-Vj
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 07:41:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1izgSp-0003oO-05
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 07:40:59 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:25426
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>) id 1izgSo-0003l0-Rv
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 07:40:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580992857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FgaO1qcylEw1Ratw4Gx0lE+m4ReViIem7CxGHMx+5Is=;
 b=fgOHSvNrozd/opNMmwGlEvC2ARH5gIS7RtCGuU4UkbVtqyhPbA6/ugLGbLO54cKoTGJlsH
 Y0RQETCRimp6KT6mAA1KPrYI+NqC9EnKhOkLfMXcWXStA6N7rJeHzRfH/rXljJdwkd6Mk/
 FhDPQBnbhlXqxhniPGFjNjNovg/glkQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-xIfokgDOPf-flTG8rjaTmg-1; Thu, 06 Feb 2020 07:40:56 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7C261081FA3;
 Thu,  6 Feb 2020 12:40:54 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BCB5C5C1D8;
 Thu,  6 Feb 2020 12:40:50 +0000 (UTC)
Date: Thu, 6 Feb 2020 13:40:47 +0100
From: Andrew Jones <drjones@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH v2 5/5] target/arm/cpu: Add the kvm-no-adjvtime CPU
 property
Message-ID: <20200206124047.o4sy52jgbkqeravd@kamzik.brq.redhat.com>
References: <20191212173320.11610-1-drjones@redhat.com>
 <20191212173320.11610-6-drjones@redhat.com>
 <CAP+75-Vt3apV8i64oFTC6pAATXkrE1g+tVskr_3ohBHtZ1LNdQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP+75-Vt3apV8i64oFTC6pAATXkrE1g+tVskr_3ohBHtZ1LNdQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: xIfokgDOPf-flTG8rjaTmg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Peter Maydell <peter.maydell@linaro.org>, bijan.mottahedeh@oracle.com,
 Marc Zyngier <maz@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 guoheyi@huawei.com, msys.mizuma@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yfcm/EPtaktu

On Thu, Feb 06, 2020 at 01:08:53PM +0100, Philippe Mathieu-Daud=E9 wrote:
...
> > +/* KVM VCPU properties should be prefixed with "kvm-". */
> > +void kvm_arm_add_vcpu_properties(Object *obj)
> > +{
> > +    if (!kvm_enabled()) {
>=20
> This can't happen, right? Can we turn that into an assertion, or
> remove the check?

You're right. An assert would be more appropriate. Will you send a patch?

Thanks,
drew

