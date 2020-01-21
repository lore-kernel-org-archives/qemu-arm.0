Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1481252lfp;
        Tue, 21 Jan 2020 05:33:53 -0800 (PST)
X-Google-Smtp-Source: APXvYqxO6ohB2S/NJiinr6bhf4N+k1tb6lqQR0VpOSQNE2IvNwBR73SNVgjDVQYDv/TRc7kTY9XF
X-Received: by 2002:a05:6214:6f0:: with SMTP id bk16mr4851115qvb.23.1579613632850;
        Tue, 21 Jan 2020 05:33:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579613632; cv=none;
        d=google.com; s=arc-20160816;
        b=ClJ8vNsBw+T9etzkxvifzhad3BgAufgLb82fvc+TtQZ2/QRYNwiE9JlPyHt/Q9Swpk
         Rq/JwmfSVSZjddWywQ82CoaZazOCyGRafd7CnH98yx13B8EnVBpUbRzweng02yQTCgZK
         uevETaM1WUBauDxrLyrlS78N5zSswgo9M1NzbVLAUj0F+Sv1mSLYzIZLIBW7nY5fFFUU
         ksekk5zgJRmO28RxtkmCeu7BGsCPT4iM9LHViokyPX6G6KrIieYLKe3QeUAkEzqR5DpX
         HNJ9XrzTfZVq3xAkr6FfLd1fbAcPmSCTDOk6iDjZx4HVfYcQppuhBK4p9lng/qbKYlSo
         O3hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:to:from:dkim-signature;
        bh=cA8lwlkG/wvH17sR9oaAHe7pnVPQ3ttOFdMo7rL4+rc=;
        b=i3ggJ415C0naImvgF4PqMNenFh9diyh29/+OCwU13ReE4AAimfFJIsaspiLHJ3Zj3u
         KIgP2yUtSij/kHEVf865av0PSYqQZzZSPMBosTTvcAJUeaaOLkrxwaOkTSeUVLA9IZPC
         wr7yBgAdQZPRL0lq5hdNuSz6Ek6jUUSQ4zFRM1QGx/vIIAgBTP1lbEs6oKRxRZOqszAe
         EjRPVJ0M6eznFfhLw13yBT0xm811aVA6zpEfxlezMsjxi6gluLXCxFxSLBHfn9vDfh+a
         S5nO471fvb4jO4Q/x0H8ZvmSoTyiy1Rbx0t92k44NURns5cvvpEkehnFlPp8nfmhkrZ+
         w/dQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=L946UYZg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w8si22768027qkf.351.2020.01.21.05.33.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jan 2020 05:33:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=L946UYZg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ittfD-0004Aa-BF
	for alex.bennee@linaro.org; Tue, 21 Jan 2020 08:33:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54944)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1itswu-0003n4-Ft
 for qemu-arm@nongnu.org; Tue, 21 Jan 2020 07:48:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1itswq-0005Ia-Nd
 for qemu-arm@nongnu.org; Tue, 21 Jan 2020 07:48:04 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:41849
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1itswm-0005Fd-Li
 for qemu-arm@nongnu.org; Tue, 21 Jan 2020 07:47:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579610874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cA8lwlkG/wvH17sR9oaAHe7pnVPQ3ttOFdMo7rL4+rc=;
 b=L946UYZgtqoOYREhN8uNrc6vSmzr26woza1wAQH7LgiCtXLT9H94ignK8I+b9sb01E1aW9
 LN8aJOYi8eJ8OBdQNr/7XzJDMouobuDVudMz9moEwh4nfk11HWsonBEH+GE9dNi/iZVGQa
 JMU8sOJnEt+Jt1UtO8hORyFyJr/jaao=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-JU11Mu9UPOKep-jxUp3rrw-1; Tue, 21 Jan 2020 07:47:49 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57A50190D341;
 Tue, 21 Jan 2020 12:47:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-131.ams2.redhat.com
 [10.36.116.131])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 61D1E86423;
 Tue, 21 Jan 2020 12:47:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 13D3F1138600; Tue, 21 Jan 2020 13:47:42 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 00/10] Cleanups around the 'current_machine' global
 variable
References: <20200121110349.25842-1-philmd@redhat.com>
Date: Tue, 21 Jan 2020 13:47:42 +0100
In-Reply-To: <20200121110349.25842-1-philmd@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 21 Jan 2020 12:03:39
 +0100")
Message-ID: <87ftg9dlht.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: JU11Mu9UPOKep-jxUp3rrw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Like Xu <like.xu@linux.intel.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7NKXlWyIlBnN

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> v1 was "Replace current_machine by qdev_get_machine()":
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg669611.html
>
> But Markus objected, see:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg670122.html
> and older discussion:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg611338.html
>
> This series salvage patches from v1, and add other trivial cleanups.
>
> Can the ARM/PPC/S390 patches could go via their own tree, and the
> rest via Paolo's 'misc' tree?
>
> Supersedes: <20200109152133.23649-1-philmd@redhat.com>

Separating off uncontroversial patches is always a good idea.  These all
look okay to me on first glance, with one minor remark on PATCH 7.  I
think you got or are likely to get competent review for all of them.  If
you need me to have a closer look, just ask.

Thanks!

