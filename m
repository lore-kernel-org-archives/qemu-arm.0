Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3793892lfm;
        Tue, 30 Jun 2020 02:49:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwENwRzOffKT+YaVpszi3uHN1HS/i3X4f/srGZXEdtGHcu4+/YOZwg6TiuM/mJPnYM1U9NZ
X-Received: by 2002:a25:ca0d:: with SMTP id a13mr10829018ybg.52.1593510540356;
        Tue, 30 Jun 2020 02:49:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593510540; cv=none;
        d=google.com; s=arc-20160816;
        b=cujFJ7aSss8jUDpppNrcZ9gheP6QApfwf4q55iSrneBFZBpWr6iq0ezrPGjGPA8NeH
         Vef/JuknBIRj8Thn56woDOyNbtoVUBWIuR+4UYXDYSOpVqRFnDQNI87W3TemR/14nuQs
         TfYcfOR0wfJ3A9Xr0MOOQXDJiToKgYxkwK7CG+V3K+vJZV45ur7S+RZ5JttD+yHhYaxp
         uR8Qmgu2Gykir228PGy82P8W93+x0NGHjJMDC/J3qCkYRyQ0sleUXaGYJ6XvAYJ7P++7
         1TOMa5EYL7fC3oHXJwgpu84pwLPofamtc5D+wqZzl2Pu2BKes3bkUIUSW/NUZA18uVUV
         liLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:to:from:dkim-signature;
        bh=5shugc/0Pw5KRRK2mAOwr6B4D5oaAihLEKPTgQLlG+0=;
        b=xw8wYV+fVBeeXNB4D2vYJFFiZ5S8faT4Fr9qkemJJkG+1DkYOApXPqxU5cs+eyS4bS
         +NWnh8fwYiMF7g6tpJERTrB2rHkKx/EqnqwXdZ9/Ca6dzRPot/1T3U+e3uWbPP4GNuJQ
         Aex8jfj10Jb6a9egWw5+3vDQ+YCXxYtDSM1L7kWTYDMde61Zhi6+ujvwp27Wev95/lJF
         Y/HCedWxDdZW2D3BnnFo/f0GyaY94nj54nYZewY2Ib9DjpAcJejBjS18zNGcRDPRwqj4
         /ShWb1tA5YQA7sWePMYR4kWh3wDOrW1OaFtl7RCkJ9oUG39ehaLRRAImT2Y6dWiIy5/j
         +bKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LhvSE6Ro;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d205si2270908ybh.435.2020.06.30.02.49.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jun 2020 02:49:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LhvSE6Ro;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jqCst-0001ZV-NU
	for alex.bennee@linaro.org; Tue, 30 Jun 2020 05:48:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jqCsk-0001Yo-Vw
 for qemu-arm@nongnu.org; Tue, 30 Jun 2020 05:48:51 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:43022
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jqCsj-0002FR-Go
 for qemu-arm@nongnu.org; Tue, 30 Jun 2020 05:48:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593510528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5shugc/0Pw5KRRK2mAOwr6B4D5oaAihLEKPTgQLlG+0=;
 b=LhvSE6Ro9XOButxxEoG0kOv9f5weRfZwZoi5zLD5KzLwVu2w1wtPmmCXAzcpwIcpVJzqzP
 I2skmNaMl7fsPR7iQ3J6qfk2MV9sp8gnfLs0gwcgZjhFeVYbZZJ6gXdSScJq878LyL9GBw
 1RLvjppnC01pdNmtkfOdMBh2chCmWTU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-2jyt7VLUMmy18v2-hDG1ig-1; Tue, 30 Jun 2020 05:48:46 -0400
X-MC-Unique: 2jyt7VLUMmy18v2-hDG1ig-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1DB5107ACCD;
 Tue, 30 Jun 2020 09:48:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8650EB3A61;
 Tue, 30 Jun 2020 09:48:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1402811384A6; Tue, 30 Jun 2020 11:48:43 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 4/5] hw/i2c: Rename i2c_create_slave() as
 i2c_slave_create_simple()
References: <20200629173821.22037-1-f4bug@amsat.org>
 <20200629173821.22037-5-f4bug@amsat.org>
Date: Tue, 30 Jun 2020 11:48:43 +0200
In-Reply-To: <20200629173821.22037-5-f4bug@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 29 Jun 2020 19:38:20
 +0200")
Message-ID: <87eepwhojo.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/30 03:55:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 Corey Minyard <cminyard@mvista.com>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Jan Kiszka <jan.kiszka@web.de>, David Gibson <david@gibson.dropbear.id.au>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7gxFPnUlLG4Y

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> We use "create_simple" names for functions that allocate, initialize,
> configure and realize device objects: pci_create_simple(),
> isa_create_simple(), usb_create_simple(). For consistency, rename
> i2c_create_slave() as i2c_slave_create_simple(). Since we have
> to update all the callers, also let it return a I2CSlave object.
>
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Markus Armbruster <armbru@redhat.com>

