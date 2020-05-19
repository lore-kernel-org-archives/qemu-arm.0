Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp3698532lfb;
        Mon, 18 May 2020 22:14:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9wHOZ5RhPEIexiIkYjDxfgokUb4+g3nzrK4TjDfbhFauHQcRxFCgx2+UnGSyhMXn8xmCP
X-Received: by 2002:a37:8d3:: with SMTP id 202mr19204017qki.237.1589865246565;
        Mon, 18 May 2020 22:14:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589865246; cv=none;
        d=google.com; s=arc-20160816;
        b=C8HpxtwXJ6ocEMKbZlY5eg23EQX7cM3hbL8rHHWzmZvJfUNKRHlJcHem057T+EjLPe
         amOze/kVBzsfNdCPv6Cxd/MqZWcHftx3YNOVo9i7nyvcfxEc4SwINfVhj3Lj/uEV/SLK
         TwKPP4admFvJQOVxYlGPbE9gm6ogD5jj2Thy3gqymFMaIPbotgrufIp+K3daRTPAQoFb
         0ZbSQPRuSKynh5SSOXy84oscXxgz3BkBe47rMckomX8MnPszBlWZMP7sSaxK2ep2kg4X
         lZWTt80G71Vop3vfNx/RGRZ2a2OcZi0PSck4alI2H5opGNpdUAaZA4oHYh97WNPCLH4G
         QmHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:to:from:dkim-signature;
        bh=gc2aEoEwK0SLaDM49APUx9YHyoxSRb9uaD95iOfgtuc=;
        b=VGiEKVU7vFVdb+MZyU8Yy2p03pLGWI1uGw2cxmapwnrfTyY88UsDvS91Vy5XgfaPTy
         ai2bVKKDN83cZRHsBdwz2YazuzIgG6ajVUdZ8fO2rJweZWn1AyKJq4jOdFcbk0FbjAmw
         aioMqS9UIaZfOLz1COhZ2oRyGonbeX62JFPPkp/jjTGT5ij5UDflH41DLbDqSy1BB+Mv
         ku1fq6IOho+zozvbd13uJbYJq8yo88YbGqOnJVzrgPGChIphBp3xbz/VQUit/o1M1z3f
         E4n+ZyNUXsC/yOI6oNhIBO/+IYnb+cXGkctGqS3GBD1f+m80rEuw2mAMy0xzj2LMS7Oe
         0knQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Oe+/OZj3";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r18si8482185qtf.152.2020.05.18.22.14.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 May 2020 22:14:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Oe+/OZj3";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jauZp-0000F7-W2
	for alex.bennee@linaro.org; Tue, 19 May 2020 01:14:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jauZk-0000F0-6H
 for qemu-arm@nongnu.org; Tue, 19 May 2020 01:14:00 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:25595
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jauZi-0003qo-Mt
 for qemu-arm@nongnu.org; Tue, 19 May 2020 01:13:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589865237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gc2aEoEwK0SLaDM49APUx9YHyoxSRb9uaD95iOfgtuc=;
 b=Oe+/OZj3bQ426AAYGz4Ht6nR7zusSYCxqhPONOJ4TGgQAXoJ56RnZ+NAlurCgIkBZDR7rx
 epJ8OJSAmSsjjlOH+D66+QlHLm0g7DhxhPrAuKKxCR4uuezlUcLPgwlGD1reVCFej08qPF
 BXVNaiM3eWtUKVld6jmCGqfG3468xm4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-k8qi7efcP1-S2Hp0swyDjw-1; Tue, 19 May 2020 01:13:53 -0400
X-MC-Unique: k8qi7efcP1-S2Hp0swyDjw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8F56107ACCA;
 Tue, 19 May 2020 05:13:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-32.ams2.redhat.com
 [10.36.112.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 578096EA20;
 Tue, 19 May 2020 05:13:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DAA8D11358BC; Tue, 19 May 2020 07:13:50 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 02/24] display/xlnx_dp: Fix to realize "i2c-ddc" and
 "aux-to-i2c-bridge"
References: <20200518050408.4579-1-armbru@redhat.com>
 <20200518050408.4579-3-armbru@redhat.com>
 <CAFEAcA-FKUHyG=bgJqPG49WZDXV8JGQqqZXOw49C8_h9mYS5iA@mail.gmail.com>
 <8daeec76-0851-54a3-d84b-67a6019eef85@redhat.com>
Date: Tue, 19 May 2020 07:13:50 +0200
In-Reply-To: <8daeec76-0851-54a3-d84b-67a6019eef85@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 18 May 2020 13:13:05
 +0200")
Message-ID: <874ksc7bht.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/19 00:34:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 KONRAD Frederic <fred.konrad@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dTK1meGlrpCF

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 5/18/20 12:30 PM, Peter Maydell wrote:
>> On Mon, 18 May 2020 at 06:04, Markus Armbruster <armbru@redhat.com> wrot=
e:
>>>
>>> xlnx_dp_init() creates these two devices, but they're never realized.
>>> Affects machine xlnx-zcu102.
>>>
>>> I wonder how this ever worked.  If the "device becomes real only on
>>> realize" thing actually works, then we've always been missing these
>>> two devices, yet nobody noticed.
>>
>> It depends entirely on the implementation of the device.
>> If it happens to do nothing in the realize method that
>> matters

Also in the realize methods of supertypes.

>>         (eg i2c-ddc has no realize method and does the limited
>> amount of initialization it needs in instance_init) then the
>> device will (by lucky accident) work just fine.

Yes.

>> We should really ideally have an assert() in the DeviceClass
>> reset that the device was realized, so we can keep this kind
>> of bug out of the codebase. (Last time I looked it wasn't obvious
>> exactly where to put the assert now that we have both legacy-reset
>> and three-phase-reset, unfortunately.)
>
> Your wish came true in the last patch of this series! #24:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg704239.html

Not exactly what Peter asked for, but hopefully close enough for
practical purposes.

