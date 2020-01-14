Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5458974lff;
        Tue, 14 Jan 2020 04:44:28 -0800 (PST)
X-Google-Smtp-Source: APXvYqwIoaCYkd56ao08jxfvMC2ItKdKi3vgE/xNyGiucogB1/690b/dNYGoP29TOPWk3RG5D1c8
X-Received: by 2002:a05:6402:155a:: with SMTP id p26mr23973401edx.222.1579005868321;
        Tue, 14 Jan 2020 04:44:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579005868; cv=none;
        d=google.com; s=arc-20160816;
        b=nQMKttWhkXYz4C42Jd5Pkc8qQoyPr/gxgQUm2CjzOFGa0lfOPYg7TGMAZICtIOMmLn
         lM1rep/nTFpb8opJt/wj0HcE6B6b45azvSardGICAe8hCv+mCElk6XGq6/jjC8+JUP6G
         EO+tMe3Z1xU3lunAoMRfAlEbX3NBL4FTukZnK+IPP1LFIK3Pyz730SDlu0q8Vq/ptT+4
         SfgOHCZ4k/7NOBsibN0gObfbvcmL9hOEnYaxTTjwWE6NH9P6ddTrOZD3Pue8SAsAWjkf
         nW5rnGNLeNhU1oL4hjzaXrHtDfuP31hkaues6ag2B5txP6wTTTz+o7raZzSOIqmU+4BB
         xjvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:to:from:dkim-signature;
        bh=sdycyemKwuH60As/BZ3RJPBSOGIqFFa69ljALC/tr/A=;
        b=urD5ulB+As5JtyY+ABSvQVKymsYcUsDnqc9ePnW6dFuvjNny7bZ7K90oznfMDtIPQQ
         llPddx3u0yQbGT1Z+9tqbTlQDtIYZviEvocrEnffgtAVnLZEVTQRf8IS0I6Qz0cMLu26
         T6zA3zXhvG9Ljn3ycp6+UnPzJbC4sXvcnP8Ko/Hqn2iTxWvzBeUEPQ4qMHxVXPM/GAU1
         FkQtNVvPF5pbI7odXU5cXSpC33im77//GWdgAN5TMxNSzvfHX3CaaW5sSWygcF5wmjvx
         TeHHlbJDKMhpqjhyYDcgj0j36xA3iQEXDTvyDTNyYbDG0YwwaBInshDWIiSBmiGt6FKf
         iCug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ofe7jMsE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h2si10609824edf.118.2020.01.14.04.44.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 04:44:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ofe7jMsE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irLYZ-0001cI-8H
	for alex.bennee@linaro.org; Tue, 14 Jan 2020 07:44:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38474)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1irLYQ-0001b4-RJ
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 07:44:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1irLYN-00072l-78
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 07:44:18 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:35310
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1irLYN-00072T-3F
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 07:44:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579005854;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sdycyemKwuH60As/BZ3RJPBSOGIqFFa69ljALC/tr/A=;
 b=Ofe7jMsEucmkSFgl6H/u3gESZwiEXRzW8VQ22p8mQLIqRBSj0Yf7l1Mc3DCDTWTYCeV2x3
 NOzIkOSsUV3OxIDKZD8yRg00sMOMjGpM3f2Rovi/Kx3dHTzDt6kseYn8bTX2mKdlq49nXl
 Db+080EeeJaP15dSFunUyzT9WFWREO4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-32jOC6NJML2zDGTryCy32g-1; Tue, 14 Jan 2020 07:44:13 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 31D9219057A6;
 Tue, 14 Jan 2020 12:44:11 +0000 (UTC)
Received: from redhat.com (unknown [10.36.118.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A8E5E19C5B;
 Tue, 14 Jan 2020 12:44:05 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PULL 00/30] Migration pull patches (3rd try)
In-Reply-To: <20200114113926.3556-1-quintela@redhat.com> (Juan Quintela's
 message of "Tue, 14 Jan 2020 12:38:56 +0100")
References: <20200114113926.3556-1-quintela@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Tue, 14 Jan 2020 13:44:03 +0100
Message-ID: <87a76qdx7w.fsf@secure.laptop>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 32jOC6NJML2zDGTryCy32g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Reply-To: quintela@redhat.com
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Corey Minyard <cminyard@mvista.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Richard Henderson <rth@twiddle.net>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2Vt+PPWWNMDZ

Juan Quintela <quintela@redhat.com> wrote:
> The following changes since commit 3c8a6575985b1652b45bfa670b5e1907d642cf=
a0:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/usb-20200113-pull-req=
uest' into staging (2020-01-13 14:19:57 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/juanquintela/qemu.git tags/migration-pull-pull-reque=
st
>
> for you to fetch changes up to c3ff7ba64b1bb484a0b6339165627a196045a8c1:
>
>   multifd: Allocate uint64_t instead of ram_addr_t (2020-01-14 12:28:07 +=
0100)
>
> ----------------------------------------------------------------
> Migration pull request (take 3)
>
> Fix (yet more) places where ram_addr_t is not 64 bits.
>
> ----------------------------------------------------------------

Nack

Reordering to make git bisect happy

