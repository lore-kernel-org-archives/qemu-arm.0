Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp3711420lfb;
        Mon, 18 May 2020 22:36:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMZWhGxGD7F+pCQnNHVG05s2RxcMFbRdg7sPpK+F9zpzD4nX1OnjKTG9kwzR4kSB2AceC4
X-Received: by 2002:ac8:23e3:: with SMTP id r32mr20397455qtr.268.1589866560840;
        Mon, 18 May 2020 22:36:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589866560; cv=none;
        d=google.com; s=arc-20160816;
        b=AM/PLuHrdfhDDTKhCPF++WvtjJ74CLwHCG1ZaUjkTsqaqTzqltbHgF4TlrGWadKhN7
         PpVKjOkRUyLvVe95clyZddEb+x9zMjyhFpNWsNTglHMnViXPW178pFxYO3fynyBItcui
         zen8MftRmLcr/ZvKRr7MCDe5ePf4lDlqK8iCm4/8aKW6LmD4XqvfNmia/NFrJm9Ke8Lv
         8o9Cnt8AVPNT7zJJZfs0HMf6Tl7eZvIm0LxRbRFgqTuw4z3Y3KeQXKHMCi6JSk7h2Wtr
         4FDCIh0r1XRDcBPs0jhcXzEts5T1HBn86pjNnXGuuv/a0+lzGvNmKi69wIsv6IvkNwXe
         WJTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:to:from:dkim-signature;
        bh=yl/NdjkSERlFIYKD5YMww9oWB5JG0yKSHH2b5ZfW8Is=;
        b=0PSz1HBzoPcCOt5HS2kwb54b1eHzKQaa2ik5Kbdb/BKP/1u63MQfBkC+4Xcp38zzUC
         6crf65ytZZgrfRUoYv9qcOX9yO+gtGJ/yslMq2aXw7SFuzj4JQFtdDkCRZql8FwUHD3c
         BUGgl41z9+vrDb1iE7Dg/Y2eg7wOMExh/JWTyDKlWNH9uNf6KQuow/8W9j/OIl+4w11k
         Yp/y06fHGDal9aBUWJlT/2+sUfEWAaMN9Wa/QnHUpRD/xxNKRz3eMLzdGCVmlSE0gayX
         450f+Q0Kbb+R/+4yKLJZ4XE/0LPPOJ0ZMNMcDliElKlDY+J91cLNzjPlyaUpmm/OC8MI
         8aZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=e+M5VTTz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m13si5373787qti.63.2020.05.18.22.36.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 May 2020 22:36:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=e+M5VTTz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jauv2-0006Co-AV
	for alex.bennee@linaro.org; Tue, 19 May 2020 01:36:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jauut-0006Cb-QG
 for qemu-arm@nongnu.org; Tue, 19 May 2020 01:35:51 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:43720
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jauus-0000J8-11
 for qemu-arm@nongnu.org; Tue, 19 May 2020 01:35:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589866548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yl/NdjkSERlFIYKD5YMww9oWB5JG0yKSHH2b5ZfW8Is=;
 b=e+M5VTTz2XwKCydh/MHfFeoAyOWsSNDnCj/oOPLOJuI5fGNcyvlDpLvbiExs3eAbpVZgL4
 unc/EnBmuODO/p2s9+If4ZDyX6Bm/X8R+YJ3DQJ0lwsrwTPKfpu0jEr8ci7mzOW9MRrEUD
 kW+BckDldpoxeqZpS8usRmD42rVKdTo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-cV8aZ-Y9PwqbVFlLH6Dq2Q-1; Tue, 19 May 2020 01:35:46 -0400
X-MC-Unique: cV8aZ-Y9PwqbVFlLH6Dq2Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9E08107ACCA;
 Tue, 19 May 2020 05:35:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-32.ams2.redhat.com
 [10.36.112.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 529AE10013D9;
 Tue, 19 May 2020 05:35:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BBC6211358BC; Tue, 19 May 2020 07:35:42 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 04/24] aspeed: Don't create unwanted "ftgmac100",
 "aspeed-mmi" devices
References: <20200518050408.4579-1-armbru@redhat.com>
 <20200518050408.4579-5-armbru@redhat.com>
 <9fc4a6e2-fa90-ba62-91cf-e22eb3ef4cdc@kaod.org>
 <CACPK8XcxVrA3E-c=jkszXd2Z6PMLO=tWDF60DTu-E3cyUdXD2A@mail.gmail.com>
Date: Tue, 19 May 2020 07:35:42 +0200
In-Reply-To: <CACPK8XcxVrA3E-c=jkszXd2Z6PMLO=tWDF60DTu-E3cyUdXD2A@mail.gmail.com>
 (Joel Stanley's message of "Tue, 19 May 2020 00:38:51 +0000")
Message-ID: <87zha45vwx.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/19 00:34:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, berrange@redhat.com,
 Eduardo Habkost <ehabkost@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: alFqKNs8wIDI

Joel Stanley <joel@jms.id.au> writes:

> On Mon, 18 May 2020 at 12:19, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>>
>> On 5/18/20 7:03 AM, Markus Armbruster wrote:
>> > These devices are optional, and controlled by @nb_nics.
>> > aspeed_soc_ast2600_init() and aspeed_soc_init() create the maximum
>> > supported number.  aspeed_soc_ast2600_realize() and
>> > aspeed_soc_realize() realize only the wanted number.  Works, although
>> > it can leave unrealized devices hanging around in the QOM composition
>> > tree.  Affects machines ast2500-evb, ast2600-evb, palmetto-bmc,
>> > romulus-bmc, swift-bmc, tacoma-bmc, and witherspoon-bmc.
>> >
>> > Make the init functions create only the wanted ones.  Visible in "info
>> > qom-tree"; here's the change for ast2600-evb:
>> >
>> >      /machine (ast2600-evb-machine)
>> >        [...]
>> >        /soc (ast2600-a1)
>> >          [...]
>> >          /ftgmac100[0] (ftgmac100)
>> >            /ftgmac100[0] (qemu:memory-region)
>> >     -    /ftgmac100[1] (ftgmac100)
>> >     -    /ftgmac100[2] (ftgmac100)
>> >     -    /ftgmac100[3] (ftgmac100)
>> >          /gpio (aspeed.gpio-ast2600)
>> >          [...]
>> >          /mii[0] (aspeed-mmi)
>> >            /aspeed-mmi[0] (qemu:memory-region)
>> >     -    /mii[1] (aspeed-mmi)
>> >     -    /mii[2] (aspeed-mmi)
>> >     -    /mii[3] (aspeed-mmi)
>> >          /rtc (aspeed.rtc)
>> >
>> > I'm not sure creating @nb_nics devices makes sense.  How many does the
>> > physical chip provide?
>>
>> The AST2400, AST2500 SoC have 2 macs and the AST2600 has 4. Each machine
>> define the one it uses, generally MAC0 but the tacoma board uses MAC3.
>>
>> Shouldn't the model reflect the real address space independently from
>> the NIC backends defined on the command line ?
>
> Agreed, the MAC hardware is present in all instances of the AST2600,
> so they should be present in qemu. Only some boards wire up a network
> device to the other side.

I guess an unwired NIC behaves as if no cable was plugged into the
external connector ("no carrier").

We can model that.

> It would be advantageous for us to be able to specify which device is
> being connected to on the command line. Currently we do this by
> connecting all devices up to the one we care about which is an ugly
> workaround.

We use -nic to configure onboard NICs.

The configuration gets deposited in nd_table[] for board code to pick
up.

Boards use nd_table[0] for their first NIC, nd_table[1] for the second,
and so forth.  How they order their NICs is part of their stable user
interface.

To leave a NIC unplugged, use -nice none.  Example: -nic none -nic user
leaves the first NIC unplugged, and plugs the second one using a user
network backend.

Say the board contains a SoC that provides four NICs, but the board
wires up only the last one.  Then board code should use nd_table[0] for
that last one.

I don't remember whether network device frontends can work without a
backend, or need a null backend.  If the latter, then board code needs
to supply such null backends.

>> How should we proceed in such cases ?

Model the physical hardware as faithfully as we can.

Follow-up patches welcome!

