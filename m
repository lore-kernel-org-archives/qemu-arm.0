Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp312712lfm;
        Tue, 14 Jul 2020 09:21:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8k6muCdt+5vxRqovkrTdzczInVL2ekBLHffShi4AxhuURz3/Pg2TsV+QvIM/B8Ea1hVGz
X-Received: by 2002:a25:2393:: with SMTP id j141mr9040309ybj.409.1594743700637;
        Tue, 14 Jul 2020 09:21:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594743700; cv=none;
        d=google.com; s=arc-20160816;
        b=tvxalfWlqgiUC+XST6ixaXUoccMUaBKdY/pAVInvwjCS3dU/gQwc2g7LXja9QD/S2m
         oNdiuud0PRFdtyDUG6I+efqq5exxYEKhE2KI5wkQr4LAPRbeb8DsE0YV8Cff+KtWp0Gf
         Mb0itgFuuvWjJJv+LI+fOciOM80nc2zF2OXIOj0DE3PTLTsIu/y5reeBEAKwUIjK58GU
         Pj3SYAtIWVhGt0+LT/TycgOpVstggjKzRKuNyKjX7EySSqiwZab3aKJr+2+LFhFwdKiY
         d5xjzrjaQuZv3bODyIuzHDNLHs1GJS7dGh2z9LBfCaL9Ffy2/qA4usTnL7a1DkxOtcIM
         EXPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:to:from:dkim-signature;
        bh=H0kPA79x0wOMtZ3aeA5Itqsz0d6s2cVU+k0Xf3RqAEg=;
        b=UxEGlDThGrBGkNFPhvLagBB8Il300qiVRVTquDsQSxZwB7lvKe/nnengHxtlGfVUVr
         jPy5AAzXy6AFP1YCW0Dm0KDFafgRBmldfsShuf3pI+3Vl3VixCTgQ7pHtF8sL5vZiLV1
         8gqBlMjA4IJa5H1EJaFFbdWnjwtTGmpsYd5P43kVUEFpKw735ebYNsKoZVqwQstrwUzF
         ImI+Y1xDUowOG5LTHWzA5YY7YE+X19J0dOrMDs3Zu4vbHtMgVp8PDpIqi/jG1lV33faT
         a1sA6KYux1Xu2+aGk2TWj+wlmvrDZXfAIOG8qWMaPEw42LGghHkoyfenn7StD3hCg1lu
         ah6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=N9kE10j8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f128si17988528ybf.34.2020.07.14.09.21.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jul 2020 09:21:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=N9kE10j8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jvNga-0006nO-15
	for alex.bennee@linaro.org; Tue, 14 Jul 2020 12:21:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jvNgP-0006m9-NY
 for qemu-arm@nongnu.org; Tue, 14 Jul 2020 12:21:29 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:53025
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jvNgO-0002A7-9U
 for qemu-arm@nongnu.org; Tue, 14 Jul 2020 12:21:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594743687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H0kPA79x0wOMtZ3aeA5Itqsz0d6s2cVU+k0Xf3RqAEg=;
 b=N9kE10j8pyRKN8f80GJ2qlzK6LFZBdratWYQu81Bc2wZQkgvTo9ftVh7ZkTUlmIatXpPKL
 cC7MTS5u/D1K2q/EZUdz5+C+0mZXEzQCP935hnz72/wGqBSTe0bXLBjXPOOnZiTMeVh6qE
 +gySuik/LlV8+iqnRDHzRSRD8bodA0c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-DPsIgitBNxu_AVJB4OADSg-1; Tue, 14 Jul 2020 12:21:23 -0400
X-MC-Unique: DPsIgitBNxu_AVJB4OADSg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 142381940920;
 Tue, 14 Jul 2020 16:21:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A8DFE5C1B2;
 Tue, 14 Jul 2020 16:21:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 357BA105A45D; Tue, 14 Jul 2020 18:21:20 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v5 10/11] hw/arm: Wire up BMC boot flash for npcm750-evb
 and quanta-gsj
References: <20200709003608.3834629-1-hskinnemoen@google.com>
 <20200709003608.3834629-11-hskinnemoen@google.com>
 <109d52ed-65bf-0fcc-98f1-47b7a6671d0b@kaod.org>
 <CAFQmdRZcygskP3iwss01-Jz67yjAP_JENXjWM2Bp8U=DRzxR0Q@mail.gmail.com>
 <875zaq78xq.fsf@dusky.pond.sub.org>
 <19733456-a672-595d-e721-e0ef26d7f665@amsat.org>
Date: Tue, 14 Jul 2020 18:21:20 +0200
In-Reply-To: <19733456-a672-595d-e721-e0ef26d7f665@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 14 Jul 2020 13:29:02
 +0200")
Message-ID: <87v9iq2hkv.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/14 01:42:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Qemu-block <qemu-block@nongnu.org>, Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dLRzr3I0Hvcz

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> + qemu-block experts.
>
> On 7/14/20 11:16 AM, Markus Armbruster wrote:
>> Havard Skinnemoen <hskinnemoen@google.com> writes:
>>=20
>>> On Mon, Jul 13, 2020 at 7:57 AM C=C3=A9dric Le Goater <clg@kaod.org> wr=
ote:
>>>>
>>>> On 7/9/20 2:36 AM, Havard Skinnemoen wrote:
>>>>> This allows these NPCM7xx-based boards to boot from a flash image, e.=
g.
>>>>> one built with OpenBMC. For example like this:
>>>>>
>>>>> IMAGE=3D${OPENBMC}/build/tmp/deploy/images/gsj/image-bmc
>>>>> qemu-system-arm -machine quanta-gsj -nographic \
>>>>>       -bios ~/qemu/bootrom/npcm7xx_bootrom.bin \
>>>>>       -drive file=3D${IMAGE},if=3Dmtd,bus=3D0,unit=3D0,format=3Draw,s=
napshot=3Don
>>>>>
>>>>> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
>>>>> Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
>>>>
>>>> May be we don't need to create the flash object if dinfo is NULL.
>>>
>>> It's soldered on the board, so you can't really boot the board without
>>> it. But if you think it's better to remove it altogether if we don't
>>> have an image to load into it, I can do that.
>>=20
>> If a device is a fixed part of the physical board, it should be a fixed
>> part of the virtual board, too.
>
> We agree so far but ... how to do it?
>
> I never used this API, does that makes sense?
>
>     if (!dinfo) {
>         QemuOpts *opts;
>
>         opts =3D qemu_opts_create(NULL, "spi-flash", 1, &error_abort);
>         qdict_put_str(opts, "format", "null-co");
>         qdict_put_int(opts, BLOCK_OPT_SIZE, 64 * MiB);
>         qdict_put_bool(opts, NULL_OPT_ZEROES, false); // XXX
>
>         dinfo =3D drive_new(opts, IF_MTD, &error_abort);
>         qemu_opts_del(opts);
>     }

I believe existing code special-cases "no backend" instead of making one
up.

Example: pflash_cfi0?.c

If ->blk is non-null, we read its contents into the memory buffer and
write updates back, else we leave it blank and don't write updates back.

Making one up could be more elegant.  To find out, you have to try.

We make up a few default drives (i.e. drives the user doesn't specify):
floppy, CD-ROM and SD card.  Ancient part of the user interface, uses
DriveInfo.  I doubt we should create more of them.

I believe block backends we make up for internal use should stay away
from DriveInfo.  Kevin, what do you think?  How would you make up a
null-co block backend for a device's internal use?

> We should probably add a public helper for that.

If we decide we want to make up backends, then yes, we should do that in
a helper, not in each device.

> 'XXX' because NOR flashes erase content is when hardware bit
> is set, so it would be more useful to return -1/0xff... rather
> than zeroes.

