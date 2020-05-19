Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp3969658lfb;
        Tue, 19 May 2020 05:07:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwn0xQYGJBDGx6Zs1ZLHnJFN03YgNf6XUhIemBX9w2dhY6QNHSWFtHrEYUUaOqRhquinXfe
X-Received: by 2002:ac8:19ce:: with SMTP id s14mr14628570qtk.202.1589890055663;
        Tue, 19 May 2020 05:07:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589890055; cv=none;
        d=google.com; s=arc-20160816;
        b=odBOb9jUPrQfp+mIc1YSsbN1hD2W6npqlBDqjWvc8ln9k2A1gvwV0tdemd0Ko8eA7j
         FJ5MZ8MccMctE+AKIm7iLhY8R+AO8iWVNT2iWR4BUSX/CM4Uf6LTVypmgKT8VI1kuuQJ
         akwgDxRzN5YbXj+lLDrpAWwiVjr1f5Nj24ak8GM0wO3hWa4+8HyupxtW7scv5jn52vMc
         kpR5coV88w1NHBuAj5+wsLXsrsDSJ76+FAYw+Ysu9lMI97t86ysYrZ+9kTKRm82etmpD
         llzyfioBo/ebsIrqhIenvzgcvQSFEFbm/6FWrJktMfTQGPr/sIu30b93Clv7+9pwworg
         aZTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:in-reply-to:date:references:subject:to:from
         :dkim-signature;
        bh=1yixPAmz5zUZC7JmB18g9+vNTk7riD6tfYch1kgwzfk=;
        b=xegarVW4lxwBzWBv07BRhzdcimYEzdWadk2p9Tyc+s52/ZRzhB99O+mRkSFz8cf8vl
         5KupmFz6VWbaIhQ+Hchp2ah2+4dTDxHnbkIuX1ETmiG+8d2cFt+o3Ec3WLlIHi2Qpqcg
         3Y61fnjd97kPya4UhB9tMAE01irr7vTB7iOByXPZlOISaheF4Zn7Xf1cSNxNGZV2G/mN
         WXgR2gOOUcftFh4g0QjIr9+b5lT3ypRtiuPMXLozUePJxWQTqaCxQ9Rc69gWIDEqgx5U
         yNAQAHUUnlYyoe1PiWo7ob//hLqp/ZLPNPZp1gbIeb6iK/ErUpAH7EyO2vZr1JLBQHx9
         B6hA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=b2QGYbkT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m36si7395244qtb.162.2020.05.19.05.07.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 May 2020 05:07:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=b2QGYbkT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jb11z-0003M4-0a
	for alex.bennee@linaro.org; Tue, 19 May 2020 08:07:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jb11r-0003LQ-Kf
 for qemu-arm@nongnu.org; Tue, 19 May 2020 08:07:27 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:34932
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jb11q-0006ff-EC
 for qemu-arm@nongnu.org; Tue, 19 May 2020 08:07:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589890045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1yixPAmz5zUZC7JmB18g9+vNTk7riD6tfYch1kgwzfk=;
 b=b2QGYbkT2vwm8lJxTI2V3vJ2xsgx16K5jaPqly1ZhPv5WvejVO3rxd47lpc4pnSxbbw2wD
 lY7fUZejvLo+eeOZ8riDN2gLQ3uq7S6r6OnPRqDHoO0D00W9mZYukRv7jeWe82UBguoflo
 AXIeIQLANVuFEFyziSslLCxHy/z13rg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-iTOyIywwM4it_aaskxbC5w-1; Tue, 19 May 2020 08:07:21 -0400
X-MC-Unique: iTOyIywwM4it_aaskxbC5w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AABA315C5C;
 Tue, 19 May 2020 12:07:14 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-32.ams2.redhat.com
 [10.36.112.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BFE6752FB4;
 Tue, 19 May 2020 12:07:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EC7FB11358BC; Tue, 19 May 2020 14:07:02 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 02/24] display/xlnx_dp: Fix to realize "i2c-ddc" and
 "aux-to-i2c-bridge"
References: <20200518050408.4579-1-armbru@redhat.com>
 <20200518050408.4579-3-armbru@redhat.com>
 <d6b1e66a-23be-e38f-1140-9b45618741e7@adacore.com>
 <878sho7bor.fsf@dusky.pond.sub.org>
 <CAFEAcA9tVM7RhgUyjOAfc18Ti=Z_yk-BhL7r070aqkxsPPBwcg@mail.gmail.com>
Date: Tue, 19 May 2020 14:07:02 +0200
In-Reply-To: <CAFEAcA9tVM7RhgUyjOAfc18Ti=Z_yk-BhL7r070aqkxsPPBwcg@mail.gmail.com>
 (Peter Maydell's message of "Tue, 19 May 2020 10:48:24 +0100")
Message-ID: <87blmk2knt.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/18 23:19:13
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Fred Konrad <konrad@adacore.com>,
 KONRAD Frederic <fred.konrad@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yDfuh1xf1tiV

Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 19 May 2020 at 06:09, Markus Armbruster <armbru@redhat.com> wrote:
>> I figure the "device becomes real only on realize" thing is actually
>> more myth than thing.
>
> It's not a myth, it's an API guarantee thing. If you don't realize
> the device you create before you use it then you're in the world of
> unspecified behaviour, and anything could happen: maybe it works,
> maybe it doesn't, maybe it works today and breaks tomorrow.

It's a myth in the sense "we want it to be that way, but it often
ain't" :)

Of course your right in that it is also a case of "use the interface the
specified way, or else".

