Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp3717828lfb;
        Mon, 18 May 2020 22:46:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhd/Fsq/VaiRvMa9qsqqPrf8wcDg1MOTrY0UwumOKGTfeKAv7cb6h6QeQuZ1N3nb/L42la
X-Received: by 2002:a0c:d981:: with SMTP id y1mr18575234qvj.64.1589867165452;
        Mon, 18 May 2020 22:46:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589867165; cv=none;
        d=google.com; s=arc-20160816;
        b=I8fQcqPPxd8Hf2sPzDf5VzhW4PvAz+PrzcIa9OOSXjU5kec/hq+Q7OMiLBcUzF+7Go
         VGNQ7xH9G6c8x89rxjRxZ3+iFHBc4c/i2+81HDd0+utnJVySHiujLWgMScM0YYzuLL8a
         rYlCSLRG3B6x0n9+rkpZNBTW7iQCOWbto4L4Vo8wJrEX8ZNbUH+czAw3XxEzTRZD4bJq
         I00yei/WLKDGKfKFj5Z1Qa+NoAVs2ozf8/6xrNWHQbC2SBX8TawQm2cm5mBh7NR+Puav
         qjF0pGgusvMO1qJFkqjBKs9xs0CrxbgTRMtyg+0wLk0nhyDsd2QlQI4mBcvrTrM0dQmi
         HFhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:to:from:dkim-signature;
        bh=CzO2EM9qxFbSXo9ndV3QOhZLTKiQsvjgzbRwusLWFvM=;
        b=gCX3b5/Drf06FlygA7lreOcyEzTho3r7QAVOjVIDONHEjq1HQMpPCOix5xjybSjIko
         ahuOv2EM8NR4BKtyHoQS9mH1jTMarfu2cKX9YszytgdbcDWEWLpLwOB8uf9dtSVzu8Pc
         TtbGGJNMwh6BNMF+J5898lLG5smQrqNBtubYCXJSZq0rSqWjsPzgROvfAcUrdOVpOeym
         /mdb79DpMS02uDeOLR7EHJkiduxJTQ+F4VZH6j9Rk0TGKratA4QxG6dbuBiKj7v+IMF8
         CxyTF4k4GJv3I3FnjmwCNldDFigORDDe1p9whevgaxTD3UlV7xeVWrrQ+Y9AJDnW8fy+
         UOjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XSAFbehE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j196si6555096qke.127.2020.05.18.22.46.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 May 2020 22:46:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XSAFbehE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jav4m-0002UR-S5
	for alex.bennee@linaro.org; Tue, 19 May 2020 01:46:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jav4e-0002Tx-94
 for qemu-arm@nongnu.org; Tue, 19 May 2020 01:45:56 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:27918
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jav4c-0003Bl-T3
 for qemu-arm@nongnu.org; Tue, 19 May 2020 01:45:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589867154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CzO2EM9qxFbSXo9ndV3QOhZLTKiQsvjgzbRwusLWFvM=;
 b=XSAFbehEgkFjsH+tVzbU9ficHlICHqX339H4+LXvvospv6rKJ8Vj+DlJjm+HFQlzB9vCjk
 9sgX91vUSPlD1/C4hxZ6DNaWsM4S8cHtKarwXAYvn6OgjfF1nscNP22UZ79+cQRkoZ4ft1
 jpp8yy6lvO7qSoXrMOYzxu0Qfrh4jBs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-iePTPCzhO_mBPwjnsnJ5Tg-1; Tue, 19 May 2020 01:45:47 -0400
X-MC-Unique: iePTPCzhO_mBPwjnsnJ5Tg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 108E5107ACCA;
 Tue, 19 May 2020 05:45:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-32.ams2.redhat.com
 [10.36.112.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D2411649D6;
 Tue, 19 May 2020 05:45:45 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5376211358BC; Tue, 19 May 2020 07:45:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: "Andrew Jeffery" <andrew@aj.id.au>
Subject: Re: [PATCH 04/24] aspeed: Don't create unwanted "ftgmac100",
 "aspeed-mmi" devices
References: <20200518050408.4579-1-armbru@redhat.com>
 <20200518050408.4579-5-armbru@redhat.com>
 <9fc4a6e2-fa90-ba62-91cf-e22eb3ef4cdc@kaod.org>
 <eb1b203d-44ba-4b89-b96b-4e7bf993ac67@www.fastmail.com>
Date: Tue, 19 May 2020 07:45:44 +0200
In-Reply-To: <eb1b203d-44ba-4b89-b96b-4e7bf993ac67@www.fastmail.com> (Andrew
 Jeffery's message of "Tue, 19 May 2020 09:50:34 +0930")
Message-ID: <87v9ks5vg7.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
 Eduardo Habkost <ehabkost@redhat.com>, Cameron Esfahani
 via <qemu-devel@nongnu.org>, qemu-arm@nongnu.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lAvzn8bdgz9p

"Andrew Jeffery" <andrew@aj.id.au> writes:

> On Mon, 18 May 2020, at 21:49, C=C3=A9dric Le Goater wrote:
>> On 5/18/20 7:03 AM, Markus Armbruster wrote:
>> > These devices are optional, and controlled by @nb_nics.
>> > aspeed_soc_ast2600_init() and aspeed_soc_init() create the maximum
>> > supported number.  aspeed_soc_ast2600_realize() and
>> > aspeed_soc_realize() realize only the wanted number.  Works, although
>> > it can leave unrealized devices hanging around in the QOM composition
>> > tree.  Affects machines ast2500-evb, ast2600-evb, palmetto-bmc,
>> > romulus-bmc, swift-bmc, tacoma-bmc, and witherspoon-bmc.
>> >=20
>> > Make the init functions create only the wanted ones.  Visible in "info
>> > qom-tree"; here's the change for ast2600-evb:
>> >=20
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
>> >=20
>> > I'm not sure creating @nb_nics devices makes sense.  How many does the
>> > physical chip provide?
>>=20
>> The AST2400, AST2500 SoC have 2 macs and the AST2600 has 4. Each machine
>> define the one it uses, generally MAC0 but the tacoma board uses MAC3.
>>=20
>> Shouldn't the model reflect the real address space independently from
>> the NIC backends defined on the command line ? =20
>
> That's my feeling too, though I'm not sure what to make of the unrealised=
 devices
> in the QOM tree. Does it matter? It hasn't bothered me.

Depending on what the initialization code does, unrealized devices can
be anything from a little wasted memory to open bear trap.  I don't
really expect the latter extreme in the code, as I expect bear traps to
quickly catch the developer that set them.

I guess the unrealized devices cleaned up in this patch did no actual
harm.

Still, it's an unhealthy state, and that's why I clean it up.  "[PATCH
24/24] qdev: Assert onboard devices all get realized properly" should
ensure we stay clean.

