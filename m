Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp216134lfe;
        Tue, 17 Mar 2020 19:32:06 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsi63cj3Mha2HEb0MLJ3W4YGj8NUKU1ylLqqFStlixrIL0PlC8CQqWHJ1N+ksJQtLCA7Qpa
X-Received: by 2002:a37:6388:: with SMTP id x130mr1974437qkb.429.1584498726631;
        Tue, 17 Mar 2020 19:32:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584498726; cv=none;
        d=google.com; s=arc-20160816;
        b=YcZ+3NG++cDc/1i/CL5bygpYb/ocUlop0ww8jXIJbGCm1kNz/tJi3W0yIyEvigvAwL
         RzQfdVpm88GVQi49L9Dq3LSDFbw8MhtUFNiE1bTKV/SHPu1xdQ4G+x285Uxw1OMq0//v
         OJ3x+qMZLHZ5kqTH/2hdGe8CPVcNoZAiG9y+PjmI3Muzu/tZZw3G0YiTxbGSKA/Y/5IY
         6VwA6SZYAxFOXvP51lkJIltoLCoRWsfRRlJBLyuvFM2Ad5+VHoRqPPUuSWXqtX/xhFG9
         m4lGFJHLkRU/qYMO0S6m0TpXkRDNVfOHP/SdLTF9DwWMgDbSY7199Shzx8980FfcmQvH
         a2uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=d1yz3fGlh9xc1RnOSW7axmCUv4BC6vv7Mz7Bz5QMcG4=;
        b=MiWk4unS+AnkmNOg+0DT1gQdOJQsiRSPgJ9dZv4mOOh4qfFqbM+WhsLqyOXNPzeNj6
         kz51nakpVhuVL/E6BU5h0DTjCkQxl6n93/pVxzbbdY3t+aDkB0Iga8AXQqphDhi2hwSS
         a+b04hyYKHcDVXvwsvFrZ11marq/pE507/TuASLV0oXkeJXS8pzReEys0yYFphGPnzG5
         JUOsm4d04Ti2rURTBbqufbG+H0rOG7AL7lCsoRCG09vGMRSnJtUHooAq6kMMhrg3N4fr
         G11iwaWojyB4pGmUmUMJWB0dtpTGlVGfazdxHoFitKoRClbzOHYoULczkv88x4BhVjrb
         4VHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FhW33DG4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ew4si2866784qvb.162.2020.03.17.19.32.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Mar 2020 19:32:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FhW33DG4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jEOV4-00081x-1d
	for alex.bennee@linaro.org; Tue, 17 Mar 2020 22:32:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56459)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jasowang@redhat.com>) id 1jEOUv-0007zi-Em
 for qemu-arm@nongnu.org; Tue, 17 Mar 2020 22:31:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jasowang@redhat.com>) id 1jEOUu-0001gC-JG
 for qemu-arm@nongnu.org; Tue, 17 Mar 2020 22:31:57 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:28297)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jasowang@redhat.com>) id 1jEOUu-0001Tb-F1
 for qemu-arm@nongnu.org; Tue, 17 Mar 2020 22:31:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584498714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d1yz3fGlh9xc1RnOSW7axmCUv4BC6vv7Mz7Bz5QMcG4=;
 b=FhW33DG4BVOxvwhD335CJE7165rkaUKFCL1BrAWxTx6yAFZ1pqlOHEyCMGkPQIYYzSSOHe
 gxbnQA5C5lK6VLWXPvicrTU4CD2shMWhclblxZGiO3IhODp2SV/FRmUklDk94lnMLP7I1W
 mLXHTaJdTOgY6pbHdWWHt8m2A5CHRuU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-DrmtmbOFNLqyLvINA1HaDA-1; Tue, 17 Mar 2020 22:31:51 -0400
X-MC-Unique: DrmtmbOFNLqyLvINA1HaDA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03FD18017CC;
 Wed, 18 Mar 2020 02:31:49 +0000 (UTC)
Received: from [10.72.13.166] (ovpn-13-166.pek2.redhat.com [10.72.13.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5792A1001DC2;
 Wed, 18 Mar 2020 02:31:39 +0000 (UTC)
Subject: Re: [PATCH 0/6] hw/net: Make Net/CanBus can_receive() handlers return
 a boolean
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200305175651.4563-1-philmd@redhat.com>
 <74bab3ca-fd8c-5c27-0376-2c3728cb18e4@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <5e28cb8b-6f80-cec9-6915-1806573f7583@redhat.com>
Date: Wed, 18 Mar 2020 10:31:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <74bab3ca-fd8c-5c27-0376-2c3728cb18e4@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Joel Stanley <joel@jms.id.au>,
 David Gibson <david@gibson.dropbear.id.au>,
 Peter Chubb <peter.chubb@nicta.com.au>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AtBdlm9ysWnx


On 2020/3/17 =E4=B8=8B=E5=8D=886:47, Philippe Mathieu-Daud=C3=A9 wrote:
> Ping?
>
> This series is fully reviewed.=20


Sorry for the delay.

Applied.

Thanks


