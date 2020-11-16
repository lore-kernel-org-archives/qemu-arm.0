Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3719579lfb;
        Mon, 16 Nov 2020 05:49:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz4FPk7OJgZVeUBNSzZ276KsotgkSEPwPOG+lKTfy/cj/OslteOlHdzMlQC8CgVWW1BeXt5
X-Received: by 2002:a25:cc91:: with SMTP id l139mr21484525ybf.507.1605534565281;
        Mon, 16 Nov 2020 05:49:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605534565; cv=none;
        d=google.com; s=arc-20160816;
        b=D8q0WKIGf+7wWfuBWc0Gj3B+MsOdzwkhuLwT2u9XBhG7mkUb61eK41ooM21zMs6Pqg
         XZh8RmK2lSABVdsjvtzQtWz4KBQF45VIKgVpPgCo/sNSv/A0JbWmZf30y5/qlFsQCVIQ
         tnrgtdy5bCOMZw0ns0KJTpiJTnDLhm6EG8NBw3e0cynsjep5YlwUV7L6BXdIQPflh7S9
         66POg4c/Kcb3aocGUS8GwtgOH7Q7Y7KAwpiv2YxfTvRVCM4foOb9SmZLNm1U2oGhuNUj
         KWAyQ5+NMbxXaxsI/FJJ0pldQKq+v4wlGhJMvseItSR9D8nR5lYYS8OtFFw8+bcHJHuz
         +NTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:to:from:dkim-signature;
        bh=49PhNiZ7Nd1J6t6WmxiZfDwF3CuxzJGfM8UJQpZdmO8=;
        b=DqwW3+C+dB8sQAZEk3Vp8QV8EdR3QB1bfy2UxsXBDE3tp2bevVNG/HxzuWKiQdVjNF
         FHhDwAODc8VSU6n/Whjs4FTSu/QmHtK6Io7rOaSZEaNzyDx53Aq4eC+CL2rg3ZfK6e45
         SD+rLpvZRJPIKHzExJQ/yaUKW4z2pwZxSYis+lGUS9iWkgxKW3npfBOY01psRlXxKOa2
         PhSxWJkrflyZgH68sSENG/jaW7bmojdYB4Fqc2KA+dDYvAVU+3xn3ja/B7gph5PMWgy7
         caoAEajpIIhnOOlWzpu+i5QbqCEO7uEEhBp2X8riFTm5tKyAG3gr9iaFhT4vMj/TqjMR
         E6kw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PNJUyK0T;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p197si5969961ybc.189.2020.11.16.05.49.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Nov 2020 05:49:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PNJUyK0T;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1keesm-0008K4-Lg
	for alex.bennee@linaro.org; Mon, 16 Nov 2020 08:49:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1keesE-0008Ia-8X
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 08:48:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1keesA-0007e3-Kl
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 08:48:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605534525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=49PhNiZ7Nd1J6t6WmxiZfDwF3CuxzJGfM8UJQpZdmO8=;
 b=PNJUyK0TOiQA0btj7PA2lmVuKR5A3EhQiAEgIv0H23g0VEepp8HlzzLg087wJ9sdNrSG3x
 Yrh4p0kuU+s6JawsycKWKUm7N6ndCy2GCFJW4aM1gLVzwnDXhwzHQDwWg0XBIcdj2Cd5+m
 BGv1nrf1wUu60Pp9LkXsTVkLwRmlUFI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-5aOgbiSkNZ-xjLw7pZ2weQ-1; Mon, 16 Nov 2020 08:48:41 -0500
X-MC-Unique: 5aOgbiSkNZ-xjLw7pZ2weQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02940CE650;
 Mon, 16 Nov 2020 13:48:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BAD5A176BB;
 Mon, 16 Nov 2020 13:48:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3D6B211358BA; Mon, 16 Nov 2020 14:48:26 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH 0/5] ARM: reduce the memory consumed when mapping
 UEFI flash images
References: <20201116104216.439650-1-david.edmondson@oracle.com>
 <3da830b6-8200-6df9-9ba3-1f51bf887c4e@redhat.com>
Date: Mon, 16 Nov 2020 14:48:26 +0100
In-Reply-To: <3da830b6-8200-6df9-9ba3-1f51bf887c4e@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 16 Nov 2020 12:39:46
 +0100")
Message-ID: <87a6vhxvit.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 04:46:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NmhOTAFcGCHA

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Hi David,
>
> On 11/16/20 11:42 AM, David Edmondson wrote:
>> Currently ARM UEFI images are typically built as 2MB/768kB flash
>> images for code and variables respectively. These images are both then
>> padded out to 64MB before being loaded by QEMU.
>>=20
>> Because the images are 64MB each, QEMU allocates 128MB of memory to
>> read them, and then proceeds to read all 128MB from disk (dirtying the
>> memory). Of this 128MB less than 3MB is useful - the rest is zero
>> padding.
>
> 2 years ago I commented the same problem, and suggested to access the
> underlying storage by "block", as this is a "block storage".
>
> Back then the response was "do not try to fix something that works".
> This is why we choose the big hammer "do not accept image size not
> matching device size" way.
>
> While your series seems to help, it only postpone the same
> implementation problem. If what you want is use the least memory
> required, I still believe accessing the device by block is the
> best approach.

"Do not try to fix something that works" is hard to disagree with.
However, at least some users seem to disagree with "this works".  Enough
to overcome the resistance to change?

