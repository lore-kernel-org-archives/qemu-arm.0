Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp3676413lfb;
        Mon, 18 May 2020 21:34:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz76YL1wUIzs7bYv9hW4F6Xxh6z8mD+RWKxy/irKPpoVqqF52Zq/vBYhdBF3ArTHOkFDZgb
X-Received: by 2002:a05:620a:22f7:: with SMTP id p23mr18127242qki.261.1589862890146;
        Mon, 18 May 2020 21:34:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589862890; cv=none;
        d=google.com; s=arc-20160816;
        b=hlzuTAyS/k5HyjUGYhTgbpeNiDVY2qqUj8pnu4q737Us6SQEdT2N7WC6HfIgCdlyxF
         ETSz5vcMcZhEqWuCxXFf1qv69sWbtHa7Fs6lEtuk/XYdGnFLsVEJZmPnr/cBtJUjvRPJ
         4ntcw0bybIF7oFKX65n0f2jp8itrElXdpI/2bl8MVF2xb8ZsMoAYP225+vAYXR3tvL5f
         yBxASxB8VoWFseIeO4IrxW/9wSvUav9gQr5qdxJ+3Z7bDNPDocH3Ou0J3jr1r2VQQJiI
         IgtT1ZJcv0kdYtQPMK6xs4jHreFNJW7iB3Fvum4f8hwFgmbnvmA2JjVZHsKvp61F5bAl
         SotQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:to:from:dkim-signature;
        bh=DfnN/w0SbYD3vSZtzIfW4lXKbb9M26zh5YzR9hzaFVI=;
        b=C0fiWPMewJ6vdoiDbyJurnZ8pN2Yrvhn+s2xrARFTy4ppCF24doM1XXMYOqWiBWF0x
         WW4GwMY69bI90oa2a2osY4UiSxgzenOF3GKOMcWwMsBdkSRrbmoTSZC8FScQSF2bSIMs
         /dZDrUgeHHfq4dIFenlxPKlIEGgNHrSp+5Pk96jjZ7DesEz+SW6Jh86Q0QN9qNslunS1
         WcsJniFgxEwTG+wH1OURE+t4CPPZ4LLq7Ahx4gV8qPh0V8mwT5V02t8JeFy22aH5bbIP
         3xczRomU5AMV+jwbrezQelRqsGOl5RG7dwb1BK7RP8zOho5vqDPlczeKCzxY+8MglgcJ
         2RSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=DUYLY3i7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cz3si6681061qvb.208.2020.05.18.21.34.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 May 2020 21:34:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=DUYLY3i7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jatxp-0004bR-J0
	for alex.bennee@linaro.org; Tue, 19 May 2020 00:34:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jatxh-0004YY-Vp
 for qemu-arm@nongnu.org; Tue, 19 May 2020 00:34:41 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:20003
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jatxg-0002j4-Mj
 for qemu-arm@nongnu.org; Tue, 19 May 2020 00:34:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589862879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DfnN/w0SbYD3vSZtzIfW4lXKbb9M26zh5YzR9hzaFVI=;
 b=DUYLY3i7xLvNVCxAP8VPCCWm2Ti3VCpScwcMCEjaNGwilXaQCRy2F4CCLCdvgBT8UMKftu
 GoTX3QvMJl3mHAzL2W4Sx/Y7by3PXNiLTeSQZuMv8p+ys9S6pHvSyyLr2Dh+qVM2Nehd0d
 /gnJgmxQMd7qb1X64ji/XI5WRW+FE6A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-m6FuIhfxMOmghIZJQdusCw-1; Tue, 19 May 2020 00:34:31 -0400
X-MC-Unique: m6FuIhfxMOmghIZJQdusCw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B63A6A0BD7;
 Tue, 19 May 2020 04:34:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-32.ams2.redhat.com
 [10.36.112.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A0F5E19C4F;
 Tue, 19 May 2020 04:34:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2FD6311358BC; Tue, 19 May 2020 06:34:19 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v3 0/3] various: Remove unnecessary casts
References: <20200512070020.22782-1-f4bug@amsat.org>
 <871rnlsps6.fsf@dusky.pond.sub.org>
 <8791b385-8493-f81d-5ee3-cca5b8559c27@redhat.com>
 <87imgt9ycp.fsf@dusky.pond.sub.org>
 <2f4607cf-90a9-ca9a-4ef6-a8358631cdf0@kaod.org>
Date: Tue, 19 May 2020 06:34:19 +0200
In-Reply-To: <2f4607cf-90a9-ca9a-4ef6-a8358631cdf0@kaod.org>
 (=?utf-8?Q?=22C=C3=A9dric?= Le
 Goater"'s message of "Mon, 18 May 2020 15:21:52 +0200")
Message-ID: <87k1187dbo.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Paul Durrant <paul@xen.org>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 David Hildenbrand <david@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, Richard Henderson <rth@twiddle.net>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Corey Minyard <minyard@acm.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +Hix83VRiunG

C=C3=A9dric Le Goater <clg@kaod.org> writes:

> On 5/18/20 3:17 PM, Markus Armbruster wrote:
>> Paolo Bonzini <pbonzini@redhat.com> writes:
>>=20
>>> On 15/05/20 07:58, Markus Armbruster wrote:
>>>> Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:
>>>>
>>>>> Remove unnecessary casts using coccinelle scripts.
>>>>>
>>>>> The CPU()/OBJECT() patches don't introduce logical change,
>>>>> The DEVICE() one removes various OBJECT_CHECK() calls.
>>>> Queued, thanks!
>>>>
>>>> Managing expecations: I'm not a QOM maintainer, I don't want to become
>>>> one, and I don't normally queue QOM patches :)
>>>>
>>>
>>> I want to be again a QOM maintainer, but it's not the best time for me
>>> to be one.  So thanks for picking up my slack.
>>=20
>> You're welcome :)
>
> Could you help me getting this patch merged ? :)
>
> http://patchwork.ozlabs.org/project/qemu-devel/patch/20200404153340.16486=
1-1-clg@kaod.org/

I have more QOM patches in the pipe, and I may well post another QOM
pull request while Paolo is busy with other stuff.  I'll consider
including other QOM patches then.  Non-trivial ones need an R-by from
Paolo, Daniel or Eduardo.

