Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4087465lfm;
        Tue, 23 Jun 2020 06:28:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxChwtrs4ScrBXD67Y4ph2ybtVVrVPT7Yy2YkeswmQoOFSeSFtC4kOa3pBbh6eMENJc3evb
X-Received: by 2002:a25:90b:: with SMTP id 11mr33577038ybj.479.1592918936351;
        Tue, 23 Jun 2020 06:28:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592918936; cv=none;
        d=google.com; s=arc-20160816;
        b=b8ZYoB9pKpTLXXpko8+NXryXtUNUfIYcC9vvUn6IxDEF6MuiC56vEk+W9sbFY7dcB3
         bnfpMKLJDaYTsA59s6JXoRuQwPqtz6G4lIPsY2k0TmCbWpBkkvDJNPybvF6AboduV2y+
         jJKHbMZxNLDKjpjak+sNuQaQTRKJQdC4ERckxXgXVqSFJdRpwxwnjUuF08gHoNm9OnCF
         WDFU9NyO7LrBlCJD//bjwdDFWLW+8kbFdn2wvB8m0jOs37f9ubDLd3fXTAO8a4gFfKDZ
         0GfWuc7iQbjOnczAiVFWP2spMjdurytoECWNF4WkjOEOjIcSt6tQBuB0rL3TYuu0RF3s
         Dxqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:to:from:dkim-signature;
        bh=RGQWqgWoOQlufCkCqFDIDGfscfu9THnVrjZrrs/v3wQ=;
        b=nid22Kkezr9CrNnBrDSkjnJ0AvT7Tiy1OEirz9+csc+NcmOtQtjutXLuQFl3sSkHWY
         0IBNlkZM8G+4XKQ1CtG/RU1j9dHev/Ny2vZbknzRczdITqgi6ngVtxLg/pyiutd2Crlh
         7dCnBV2EdPzYeNy+cfgu22Jd4XIVtZ0T1ZZLU+81EMUHEcBg4vsI64Y0ptrr1vOrUSBv
         U3yxJzag42Qo4Hm+85l8S2zjcKfNBhMlKwb3STSM5fmbg/9lUOuWa/5xuDpzBP11TbKP
         3oK5fCzSRItMwyE6iqOln4MOzhLMIKmQS4S24tLup3ql0nvH4EkyYMRzssqdLQjuZEZE
         CgDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fdXQlDaD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k6si24268479ybt.52.2020.06.23.06.28.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jun 2020 06:28:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fdXQlDaD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jniyt-0003GC-Nv
	for alex.bennee@linaro.org; Tue, 23 Jun 2020 09:28:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jniyk-0003Fu-8E
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 09:28:46 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:27908
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jniyh-00054j-1G
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 09:28:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592918921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RGQWqgWoOQlufCkCqFDIDGfscfu9THnVrjZrrs/v3wQ=;
 b=fdXQlDaDjWC21puX7qv3X9n+dMp0bsrEpeTnFSvcT+3Crn6TtsUd67OnF6kqO+t498I6hM
 jjw7bmSbMYRaJtr3MWYHWEubpPpEikcHYVZBWWs6m554zzHLzOJOvzNGKwP+nzpr4UqMdA
 YOFiHQFsuYG4aMXO21oEmxzfdzdr/wY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-gReocY9CNRGHVeZ0AGwQpg-1; Tue, 23 Jun 2020 09:28:39 -0400
X-MC-Unique: gReocY9CNRGHVeZ0AGwQpg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3131805EE3;
 Tue, 23 Jun 2020 13:28:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A005219934;
 Tue, 23 Jun 2020 13:28:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 157E2113846D; Tue, 23 Jun 2020 15:28:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v5 1/9] hw/i2c/core: Add i2c_try_create_slave() and
 i2c_realize_and_unref()
References: <20200622183428.12255-1-f4bug@amsat.org>
 <20200622183428.12255-2-f4bug@amsat.org>
 <875zbimcs6.fsf@dusky.pond.sub.org>
 <fbecc71b-3f1d-0c6f-83eb-e10b408c85e2@amsat.org>
Date: Tue, 23 Jun 2020 15:28:32 +0200
In-Reply-To: <fbecc71b-3f1d-0c6f-83eb-e10b408c85e2@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 23 Jun 2020 13:04:07
 +0200")
Message-ID: <87wo3xhpxb.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/23 01:53:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Corey Minyard <cminyard@mvista.com>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KGUf6Y184hKF

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> On 6/23/20 10:01 AM, Markus Armbruster wrote:
[...]
>> Ideally with my naming suggestions considered:
>> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>
> If you don't mind, as this series is already fully reviewed,
> I'll correct/improve on top of it.

Up to you!

