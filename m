Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp239742lff;
        Sat, 18 Jan 2020 01:06:41 -0800 (PST)
X-Google-Smtp-Source: APXvYqyYYBa2Na61K9uL+sUeur30nS7toCc+p8kG2nURdry1pYGBkBbF1A3s4Gmo2BvhvOA17M1p
X-Received: by 2002:a17:906:4d43:: with SMTP id b3mr11397657ejv.109.1579338401490;
        Sat, 18 Jan 2020 01:06:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579338401; cv=none;
        d=google.com; s=arc-20160816;
        b=zsLZH7MRCIzYQCfHclki6K2Ct/fgrur8JCY18AyBu8HvV2bhib9QdHU9OLVkntIKu/
         1vBgRHUT+98TtX7Zoo8wwjMsAMdMJ7Hnl6X02bqub3P/k1/tdjgqxR8e3EA83ObIjdE3
         Be4M7XzoxY1ak1nSvYTK5qbHHBHo2ksGXVjXLgpssLpv4HNoAPoohOKMLzWyF9NMdByJ
         K/9aSWrKSbXnr5rJ47VBSp3XjNq34cFdRe6tpAVz9quyNvqX23VdYIkSn7FI7nYP6yi1
         TU432bcRrUQEzG5C4W5GZAPR7pSlahxQZHuS8btkCmLtxLuyxMZ976sfV0eFxyM2sKGw
         Af6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=P9grBksCdiZbl/XMAPOh0nj+GwsDnMnJJzNB9IiKqeM=;
        b=e8BYNsFqpp3x8fROmXXVJ8DjfvgBcdeljdG4sA/pHdU7Nov9rAPuv/F9z0vjZ99T7Y
         LkqV99CUWvgp9E39Um4JXKVjoTZk/cv5Ay+2KNVJH8YNX5iAUoiipb6R5j8USTHHZL6t
         nw2mvALHCxoNnUbLCtnpg+w6LetIXvUJuY0QrBuJ42v7Wu2rHrs/nQKRxWahLjRA1qJ1
         /6q3C8abvl0WZebSBjW+aKKBOpzDfrLmc8yskBd8oKBd9Zy7OWtk/fCQyCZ70PSL6OF8
         1NlCFuhfmu6RJMDxb14UN6rbRwIN2j0Y6bpCD8Byg2uhKf3uUQk+eienKP3RpydQjcYF
         m/sg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AOsNvZ0y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s9si18734235ejd.276.2020.01.18.01.06.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 18 Jan 2020 01:06:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AOsNvZ0y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1isk40-00054C-8W
	for alex.bennee@linaro.org; Sat, 18 Jan 2020 04:06:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42295)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1isk3q-00053v-OI
 for qemu-arm@nongnu.org; Sat, 18 Jan 2020 04:06:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1isk3o-0002bb-Sz
 for qemu-arm@nongnu.org; Sat, 18 Jan 2020 04:06:29 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:24528
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1isk3o-0002af-Oz
 for qemu-arm@nongnu.org; Sat, 18 Jan 2020 04:06:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579338387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P9grBksCdiZbl/XMAPOh0nj+GwsDnMnJJzNB9IiKqeM=;
 b=AOsNvZ0ykDkeP5mYtE25bqoBliV10EEpFNbKkLhQG9dUMJnA017ODl8yEfzmvqt7+zmvYT
 0k3vdv1NdstR8QhaU+lXF2EaCImkSGRE+W9+0dXKdBwqlBOtMsqtHVO8qssNl5aiE2iz4i
 9ExM4q6Js2Bu4FyuumUQSmHCgBbl5+M=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-gvxKVg5HP7yYtLJh3f93fg-1; Sat, 18 Jan 2020 04:06:26 -0500
Received: by mail-wm1-f70.google.com with SMTP id h130so2833779wme.7
 for <qemu-arm@nongnu.org>; Sat, 18 Jan 2020 01:06:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GcT0DegigFwiZ69V42qbjHs3PQy1tdSqLiTo7CzqPGk=;
 b=egOGeCsQ6E8oylkvjDCCdNL8IqSk636kHVXGc9vlJI58Mn57Y0Q7XSliQmYQIakF9Z
 odwN7ceg3TZQpa9M2N1ldOAS7z4DxQGyTlIHR7OGKOqH6FoBen5FR4vkhksijdiFSWMH
 bXw9DMUISD/G2ZpmWaJOQDJ62PSitGFyjw4/qdM9mKj8gEljIWNmslIxoX7yo0cWbHR6
 lPiTt4Ybhet8/5n+VWFsFSYwEbjkF0cMxjl36ZK56DSZlYulKwPfPKS2mOmeioLndKAc
 wwqQjoZvicR8BSAiDvddlzoDIlK/T34ES5VK5FEyG7CeTdTOToX/ss9c79X4XKaGdCfv
 rjlw==
X-Gm-Message-State: APjAAAWPJs96qtaPJtFGHWMUrLINfsUERWFCf4vxBAiLnZMoaiz0eeL+
 BsOFJer7PFQezy/f1vJG3GuQyNHKCwgB4xgGkGB73y4gWEId06qvNcsziSOkqDOJB5MLxF/Sm7o
 BAWjMg8/Cnf98
X-Received: by 2002:adf:f604:: with SMTP id t4mr7020019wrp.33.1579338385056;
 Sat, 18 Jan 2020 01:06:25 -0800 (PST)
X-Received: by 2002:adf:f604:: with SMTP id t4mr7019991wrp.33.1579338384773;
 Sat, 18 Jan 2020 01:06:24 -0800 (PST)
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id h2sm38466419wrv.66.2020.01.18.01.06.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Jan 2020 01:06:23 -0800 (PST)
Subject: Re: [PATCH v3 06/17] hw/arm/allwinner: add CPU Configuration module
To: Niek Linnenbank <nieklinnenbank@gmail.com>
References: <20200108200020.4745-1-nieklinnenbank@gmail.com>
 <20200108200020.4745-7-nieklinnenbank@gmail.com>
 <8bbf88b2-867a-c95d-a3ae-e819f7dd08ac@redhat.com>
 <CAPan3Wo3Li4XZJqHhhk5fnY_PnzGZ8YwUwCud8Ge4Z_+BOwW1w@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5760dae5-f7cc-5736-7275-e6461f985dbd@redhat.com>
Date: Sat, 18 Jan 2020 10:06:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAPan3Wo3Li4XZJqHhhk5fnY_PnzGZ8YwUwCud8Ge4Z_+BOwW1w@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: gvxKVg5HP7yYtLJh3f93fg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GNfqeghGxGzK

On 1/15/20 12:04 AM, Niek Linnenbank wrote:
> On Tue, Jan 14, 2020 at 12:14 AM Philippe Mathieu-Daud=C3=A9=20
> <philmd@redhat.com <mailto:philmd@redhat.com>> wrote:
>=20
>     On 1/8/20 9:00 PM, Niek Linnenbank wrote:
>      > Various Allwinner System on Chip designs contain multiple processo=
rs
>      > that can be configured and reset using the generic CPU Configurati=
on
>      > module interface. This commit adds support for the Allwinner CPU
>      > configuration interface which emulates the following features:
>      >
>      >=C2=A0 =C2=A0* CPU reset
>      >=C2=A0 =C2=A0* CPU status
>      >=C2=A0 =C2=A0* Shared 64-bit timer
>      >
[...]
>      > +=C2=A0 =C2=A0 case REG_CPU0_CTRL:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0/* CPU#0 Control */
>      > +=C2=A0 =C2=A0 case REG_CPU1_CTRL:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0/* CPU#1 Control */
>      > +=C2=A0 =C2=A0 case REG_CPU2_CTRL:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0/* CPU#2 Control */
>      > +=C2=A0 =C2=A0 case REG_CPU3_CTRL:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0/* CPU#3 Control */
>      > +=C2=A0 =C2=A0 case REG_CPU0_STATUS:=C2=A0 =C2=A0 =C2=A0 =C2=A0/* =
CPU#0 Status */
>      > +=C2=A0 =C2=A0 case REG_CPU1_STATUS:=C2=A0 =C2=A0 =C2=A0 =C2=A0/* =
CPU#1 Status */
>      > +=C2=A0 =C2=A0 case REG_CPU2_STATUS:=C2=A0 =C2=A0 =C2=A0 =C2=A0/* =
CPU#2 Status */
>      > +=C2=A0 =C2=A0 case REG_CPU3_STATUS:=C2=A0 =C2=A0 =C2=A0 =C2=A0/* =
CPU#3 Status */
>      > +=C2=A0 =C2=A0 case REG_CLK_GATING:=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* =
CPU Clock Gating */
>      > +=C2=A0 =C2=A0 case REG_GEN_CTRL:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* General Control */
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s->gen_ctrl =3D val;
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>      > +=C2=A0 =C2=A0 case REG_SUPER_STANDBY:=C2=A0 =C2=A0 =C2=A0/* Super=
 Standby Flag */
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s->super_standby =3D val;
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>      > +=C2=A0 =C2=A0 case REG_ENTRY_ADDR:=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* =
Reset Entry Address */
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s->entry_addr =3D val;
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>      > +=C2=A0 =C2=A0 case REG_DBG_EXTERN:=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* =
Debug External */
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>      > +=C2=A0 =C2=A0 case REG_CNT64_CTRL:=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* =
64-bit Counter Control */
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s->counter_ctrl =3D val;
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>      > +=C2=A0 =C2=A0 case REG_CNT64_LOW:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0/* 64-bit Counter Low */
>      > +=C2=A0 =C2=A0 case REG_CNT64_HIGH:=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* =
64-bit Counter High */
>=20
>     You forgot to set these. Maybe you can add a int64_t cnt64_diff, set =
it
>     here to the difference with qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL), an=
d
>     in the read() function return cnt64_diff +
>     qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL).
>=20
> OK I'll need to look into that. Currently this timer is not used by=20
> Linux, NetBSD or U-Boot as far
> as I know. But since it is there, it should be correct indeed.

You might reduce this patch by simply using LOG_UNIMP for these=20
registers. Than add the patch when you find some use.

We are more confident when reviewing code when we have a way to test it :)

