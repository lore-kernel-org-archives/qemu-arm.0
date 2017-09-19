Received: by 10.223.172.38 with SMTP id v35csp4414856wrc;
        Mon, 18 Sep 2017 19:09:05 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QCo8i9xJ6O1qJTnTQrXK9GV7HnOkkbmyKTV+u969hbQoFNY8LMqjLJ9uCQHYiSyWPVApSdz
X-Received: by 10.200.22.188 with SMTP id r57mr41404788qtj.230.1505786945072;
        Mon, 18 Sep 2017 19:09:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505786945; cv=none;
        d=google.com; s=arc-20160816;
        b=P9/Xek1LUDCct1e/QRei4kNVKczePl2yJWWoEWkw1Ifz4BbMHJIFluXO9Ng1FSds24
         3JB9Qts5dKe9sVFvBQR27b6an5Amw5r8nEYk9K7cQ7TxvRe3PZkSLs9UO5uwkcpTDDEA
         +Ykl1AZ/b+pieg21pW1vfQvyIFOr5sgVS3zgFiGBqma3QSeh+FsbjQCLlHVSwNitMGBu
         XkCcAe/2s4E3T8Z9B99n/4IxMOkbl5h+gE/+aIt62iprChjDKkSgMLkVHebofYqsNgln
         kGOdQsLvpmYN7EpGg0GEMVXukb9K/uLKsP6oa4yzk65QHkub15JFLiWsVwqeC/zrP7E9
         EYDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:arc-authentication-results;
        bh=Fc/vDWzLfFxiLpgMImPEM6s3tNho2nhLfG6oS/g4Llw=;
        b=uZsMUXOaz4Z2kD64dXbwQ3f2gPLf9LZIdssafYuC14VjrUUxorJ+K1b6ACMygRGWFg
         vEgRjCh5CvUv57ki+Z1qfvXd92Rlx2boWl6NrSCRsaPCYqQ2atE3vCXpxU7WLKhV13ho
         go8OGfkRnvo0O/qf67XAhWPZ6V6LOa4vw9GUO3PcRIpkUQts/kYp5D3zTG52TzFKR9WR
         o/TAg3j5xOqFamfI02MWH8nAr+1+USYLeUZEFJjO/fqJNVlEnhVZhWHXkFnCn2tf+ykW
         uQ4GlXGeDPgOH9ejPQtxnqGlu9VMyeUoNe0LwLje6ohIme7vDv+o3c4697mLx5ziT+eT
         m3zQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 3si830644qtp.421.2017.09.18.19.09.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Sep 2017 19:09:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39690 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1du7yA-0002wb-Kz
	for alex.bennee@linaro.org; Mon, 18 Sep 2017 22:09:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60550)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1du7xv-0002vE-93
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 22:08:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1du7xq-0003Ql-Mx
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 22:08:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42054)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1du7xq-0003QA-GA; Mon, 18 Sep 2017 22:08:42 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 641E7710B9;
	Tue, 19 Sep 2017 02:08:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 641E7710B9
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=famz@redhat.com
Received: from localhost (ovpn-12-98.pek2.redhat.com [10.72.12.98])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2CD095D6A6;
	Tue, 19 Sep 2017 02:08:38 +0000 (UTC)
Date: Tue, 19 Sep 2017 10:08:37 +0800
From: Fam Zheng <famz@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Message-ID: <20170919020837.GA11534@lemon.lan>
References: <20170918221124.17159-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20170918221124.17159-1-f4bug@amsat.org>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 19 Sep 2017 02:08:41 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH] msf2: drop cpu_model to directly use cpu type
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8mNYwK46ftrL

On Mon, 09/18 19:11, Philippe Mathieu-Daud=E9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> ---
> after Igor comment:
> http://lists.nongnu.org/archive/html/qemu-devel/2017-09/msg04709.html
>=20
> Fam: I'm trying your patchew "apply over series" feature on these 2 ser=
ies,
>      hoping they get both applied before my patch:
>=20
> Based-on: 1505318697-77161-6-git-send-email-imammedo@redhat.com
> Based-on: 1505762601-27143-6-git-send-email-sundeep.lkml@gmail.com

Only one based-on will be picked up, so this doesn't work. Patchew basica=
lly
applies the series on top of something, where something is the result of =
a
previous applying. So it can be thought of a chain.

To support multiple patches, a different approach needs to be implemented=
.

Fam
