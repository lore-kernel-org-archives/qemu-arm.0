Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5377864lff;
        Tue, 14 Jan 2020 03:23:41 -0800 (PST)
X-Google-Smtp-Source: APXvYqwxRmD5eBnShRNJUkI2jy8qiw0Kv9SVS9865B3/gkjhfxru3oFLUwxF94Z7Fzfu8KRuYnnx
X-Received: by 2002:a05:6402:1558:: with SMTP id p24mr23476490edx.120.1579001021598;
        Tue, 14 Jan 2020 03:23:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579001021; cv=none;
        d=google.com; s=arc-20160816;
        b=GAxrcVgOFyciRkvO8KqXOhWBhRp9Cgxlt9Tsqt/jQyW5seWbvxxOj5eOlu/mpGTlcH
         md/ldWAQB4A8qXaRCqRYYpcHgYdoC2X60VgapjW36R62iyjIIT6tjoRC1oTYM/RcYV3q
         jthoyhRsfgKbF7JnTdA2ZIsGHcWZCWrd2ro0NwW9wbwLaaxR46AGLyhfb71pvpcPNLaL
         qsktLri1kyAab90svQeG8ktRfQAgdswrLpj5aJNCAOkjpm2s5XykRHVauQZlmDM/fqId
         aKZ4m8xnzeXOfTnzr9Sl41Bzv6KO1C5+KS04Zs016QRJPLrbCeT+pBej+vm8kbEyMRIy
         D2jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:to:from:dkim-signature;
        bh=95rfsn43b8vdT617lWevePZoP33VYujDwqJf7PGBIeE=;
        b=kqbRtSg6VXWOerk5U+AulJzYndMLFoJw+AqVt+5Bq5h8uDTgihRq21lnKf9Ib6MuEN
         d4zrOVop0Poly/9B7QkOhSKw3cRenke0qLuRLFF+bI7ubl26Yg4JUYzEXWf4q+wu4ggn
         VUZXtScwyhVVsnGgE2Q2c3qViF1JrwjRfT4TIhkYD8KxsHVsbMAfVZ0BrZyn3oBYbSP8
         sm3/NNKniCvDOTUSXM1FKMmal6O0ZODwXCWVCpBhnFjKjbyfX68IlONFPtM6kEa6iL6j
         /Jo/Z8vdX9sU7bVWtuC0lZgIHaqMM6PLxss7vJdz4b3LWWtZF7pHkNbTltjvc00VRwKa
         St6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=D7zibmtb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n12si9464359eju.163.2020.01.14.03.23.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 03:23:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=D7zibmtb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irKIO-0001i5-JM
	for alex.bennee@linaro.org; Tue, 14 Jan 2020 06:23:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51941)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1irKHE-0008IK-9S
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 06:22:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1irKHA-0005Hh-VW
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 06:22:26 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:55984
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1irKHA-0005H6-Cd
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 06:22:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579000942;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=95rfsn43b8vdT617lWevePZoP33VYujDwqJf7PGBIeE=;
 b=D7zibmtbdx2UkLXeRZkYjsNBfJ+Pll6swNoWIPSVDKm03F64qCgU5G34yzy/o8ldb/YLhJ
 Ik6HgttUjKG6NJ0jF9O3jHqg10phHERLnwa+BhW/NOpPHB2z1PeT3YRMhzgW7MA1Ny5BnB
 Cz5naGBkR3G54Gowjoze6fwWHspD6Qg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-CyDF3rQBN6ue5S9zSccwig-1; Tue, 14 Jan 2020 06:22:20 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E03B51800D48;
 Tue, 14 Jan 2020 11:22:18 +0000 (UTC)
Received: from redhat.com (unknown [10.36.118.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 638815DA76;
 Tue, 14 Jan 2020 11:22:12 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/29] Migration pull patches (second try)
In-Reply-To: <CAFEAcA-7aLrp4n9gtD=0MzmMDpzNyJCUpOmY2XPxNOun5MKeGA@mail.gmail.com>
 (Peter Maydell's message of "Tue, 14 Jan 2020 11:15:03 +0000")
References: <20200114092606.1761-1-quintela@redhat.com>
 <CAFEAcA-7aLrp4n9gtD=0MzmMDpzNyJCUpOmY2XPxNOun5MKeGA@mail.gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Tue, 14 Jan 2020 12:22:10 +0100
Message-ID: <875zhewae5.fsf@secure.laptop>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: CyDF3rQBN6ue5S9zSccwig-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Laurent Vivier <lvivier@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 Thomas Huth <thuth@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Jason Wang <jasowang@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Richard Henderson <rth@twiddle.net>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W3Y+gAA+OXiM

Peter Maydell <peter.maydell@linaro.org> wrote:
> On Tue, 14 Jan 2020 at 09:26, Juan Quintela <quintela@redhat.com> wrote:
>>
>> The following changes since commit 3c8a6575985b1652b45bfa670b5e1907d642c=
fa0:
>>
>>   Merge remote-tracking branch
>> 'remotes/kraxel/tags/usb-20200113-pull-request' into staging
>> (2020-01-13 14:19:57 +0000)
>>
>> are available in the Git repository at:
>>
>>   https://github.com/juanquintela/qemu.git tags/migration-pull-pull-requ=
est
>>
>> for you to fetch changes up to 4eafab585c091050b5ae63130f46fe46ac919c3a:
>>
>>   migration: Support QLIST migration (2020-01-14 10:17:12 +0100)
>>
>> ----------------------------------------------------------------
>> Migration pull request
>> - updated QList patch
>> - initialize local msg variable
>>
>> ----------------------------------------------------------------
>
> Still fails on hosts where ram_addr_t is 32 bits.
> Looks like you still haven't got the fix for the problem
> Dan pointed out where multifd_save_setup() is using the
> wrong type when it calculates p->packetlen to allocate the
> data structure.

Ouch.  Then there is "yet" another different problem. I fixed the one
that daniel pointed.

Working there.

