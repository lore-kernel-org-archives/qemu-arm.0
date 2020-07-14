Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4053491lfm;
        Tue, 14 Jul 2020 02:17:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynIAOddqgBUT7ZBgR9y1M7CeozM7WcZJMbykRnmwahX8DJhOqXKUbQ3F2uUFBI5rM1hUhY
X-Received: by 2002:a25:8e0b:: with SMTP id p11mr6880936ybl.20.1594718227476;
        Tue, 14 Jul 2020 02:17:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594718227; cv=none;
        d=google.com; s=arc-20160816;
        b=Sx8t4XxeRLfWBlU5ZKPPgUPZI37KzWD0gtMy7sTTIyAVukVCk0RgyNuI6nC7p15ILF
         J7+qUEzC6CSESsgc3qNAFP5CTitIj5FvljmL/i/91IYiuHROhfXvSupl0No6ZMuW4pFO
         GpSJPGY3ooe5/lY9AOIP2JEvAWa2ck7Fy+/YK/mVWCyYJkGuO4/zeUHWbAXseO2eyJBP
         0PJmganQtECHlKeCBtTfWxwea/awaj1KGQzY5AG9ebbTaYYZmyDGx5/w3zUs0kyI7sPG
         JFbiw3A3WL35W1sNJ2h6nHHVmT6V4+IURjPT2YAVJXt48Q2e7l9tt21auwlIuMh/x6Cu
         fwLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:to:from:dkim-signature;
        bh=oayqO/MMk57qVjUEFtglnMcOxakjJJRUN6A4iwy//8o=;
        b=kGjaJoeEKNSi88Lr/UIH6yacK6j3FS1PxOyrKvw1mtYjdd9pnp/sznWWStaB+4pgWf
         d35oWsQXsiMMhug3sATJmkze5qOuspMP5awDgebd2+vUGW7Qml9OQ7ob9vlcnnnda/8z
         FpGaTlV1co2SfXolVhRDXw4Cu8Ct6+jSpWgKguCtsTdIf0/ippUwbx3uLX37XYit+uQo
         VuxhBKW/xpQmKjPOyYyRPLlesbx+UB3/h8DFsE/8evbKBbNVK5H1WjSr4D0uPlx+QXpa
         Y7IJEuV/qGSdHiEniTliwfz6KerZr3hceCuKiFVDuUrupulbCx/aTgilyRn7cdVKfaCR
         HsZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZUXB8x12;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n128si10420002yba.396.2020.07.14.02.17.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jul 2020 02:17:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZUXB8x12;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jvH3i-0002SM-TB
	for alex.bennee@linaro.org; Tue, 14 Jul 2020 05:17:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jvH3b-0002Rb-J3
 for qemu-arm@nongnu.org; Tue, 14 Jul 2020 05:16:59 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:47569
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jvH3Z-0007UE-R1
 for qemu-arm@nongnu.org; Tue, 14 Jul 2020 05:16:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594718217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oayqO/MMk57qVjUEFtglnMcOxakjJJRUN6A4iwy//8o=;
 b=ZUXB8x129FMcdvY19h6RGuA9aZEF2oh+6U++UzGHP58CIs+Bu9PTlDseBSA1wr1fTLtiDL
 aGpQmm1bUKau0LF2Ega5lNOxuUgTlRa/0yDgml32e+EVMg1slT1Ykjl4FJCPbd0OKVCuWB
 wZRWLGU+L8O+ZB0IVzI37emX6UEEgk4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-L5HS5biONiqyci8PHAiyTw-1; Tue, 14 Jul 2020 05:16:53 -0400
X-MC-Unique: L5HS5biONiqyci8PHAiyTw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E5FF1091;
 Tue, 14 Jul 2020 09:16:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C93772E44;
 Tue, 14 Jul 2020 09:16:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B84C11267F16; Tue, 14 Jul 2020 11:16:49 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Havard Skinnemoen <hskinnemoen@google.com>
Subject: Re: [PATCH v5 10/11] hw/arm: Wire up BMC boot flash for npcm750-evb
 and quanta-gsj
References: <20200709003608.3834629-1-hskinnemoen@google.com>
 <20200709003608.3834629-11-hskinnemoen@google.com>
 <109d52ed-65bf-0fcc-98f1-47b7a6671d0b@kaod.org>
 <CAFQmdRZcygskP3iwss01-Jz67yjAP_JENXjWM2Bp8U=DRzxR0Q@mail.gmail.com>
Date: Tue, 14 Jul 2020 11:16:49 +0200
In-Reply-To: <CAFQmdRZcygskP3iwss01-Jz67yjAP_JENXjWM2Bp8U=DRzxR0Q@mail.gmail.com>
 (Havard Skinnemoen's message of "Mon, 13 Jul 2020 19:56:55 -0700")
Message-ID: <875zaq78xq.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 CS20 KFTing <kfting@nuvoton.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OofSA95BRzR/

Havard Skinnemoen <hskinnemoen@google.com> writes:

> On Mon, Jul 13, 2020 at 7:57 AM C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
>>
>> On 7/9/20 2:36 AM, Havard Skinnemoen wrote:
>> > This allows these NPCM7xx-based boards to boot from a flash image, e.g=
.
>> > one built with OpenBMC. For example like this:
>> >
>> > IMAGE=3D${OPENBMC}/build/tmp/deploy/images/gsj/image-bmc
>> > qemu-system-arm -machine quanta-gsj -nographic \
>> >       -bios ~/qemu/bootrom/npcm7xx_bootrom.bin \
>> >       -drive file=3D${IMAGE},if=3Dmtd,bus=3D0,unit=3D0,format=3Draw,sn=
apshot=3Don
>> >
>> > Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
>> > Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
>>
>> May be we don't need to create the flash object if dinfo is NULL.
>
> It's soldered on the board, so you can't really boot the board without
> it. But if you think it's better to remove it altogether if we don't
> have an image to load into it, I can do that.

If a device is a fixed part of the physical board, it should be a fixed
part of the virtual board, too.

[...]

