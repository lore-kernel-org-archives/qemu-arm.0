Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp8251179wrx;
        Fri, 8 Mar 2019 03:26:28 -0800 (PST)
X-Google-Smtp-Source: APXvYqxCZlkI2+9PFx+hivOHHB0jY/zvv7tJNHLWy7iAp5hylG3V0i8SL2VO9uSy+xIz15SnQeKX
X-Received: by 2002:a25:57c2:: with SMTP id l185mr15373298ybb.161.1552044388669;
        Fri, 08 Mar 2019 03:26:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552044388; cv=none;
        d=google.com; s=arc-20160816;
        b=KFOzU9CmYpxujNlzmqsUT5+NUlRVQ/3oozNDVyMVFhA25MjoMtXFnXUGOGSVITkMZd
         gK9VbKOHUN+76JmUSdkX7FwB3HIhcsgUgOdZ48JgcbGvAkqU16pXbcIO0EImn2GdrlI2
         pwFjEEcQZXYVJu02iWGfQWn8oYXegY0Zpxo6f7JYHgxveKtXRXbV3CCSt8lRIgpEDF9e
         Cj5AYjJOrIXJ3awmCIs0cqALyFIgxCN6CIjcc1RsPHHr3s4H6P8NIkRyp5QSuXsPBwIQ
         HfB+cvB7DNv2F2ljhW2vvdYmmPov3t4qNYx3TkUBTe2AAy3yNKHcRAPotBCcfVs8DMNf
         w2qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=UgsZfiEoC9Srt0gdl3/WH0qxU4u+nUDcihGnsWnrMNw=;
        b=aKLyTocjUdPMuPdWs4xX7JKo0o+QO6Gb5XXqLcglJnAPNzXzXwTbqkhqMvREen2Vb0
         RbYESdOK+7JbfCBWYHjEsRXI4DuUuileX5ETUJauV0Kngf8Km//PpRkzgJGuOdPZFVu1
         A38Tn5QPBxHA5U6RxK/Y2ZO5O9fHjPrmbABNIHcN/ISTaDAI0jyz1bdKtJKeTz00mBMe
         NouePMr4COtxq4T34mT61AEcB+YHurLBypGGYZh4gJk4WoojLcfuKJHZWhtgimeXf3wB
         gfxWGOaTXsaW4Ra4uSVQ9DjMvksuURxTKtVp+7AJL9xjeIPKEu1CWQwpe2YQAFvd1aN2
         2Hvg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a81si4356168ywh.438.2019.03.08.03.26.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Mar 2019 03:26:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41264 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2De0-0001Ql-60
	for alex.bennee@linaro.org; Fri, 08 Mar 2019 06:26:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36672)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1h2Ddr-0001QR-R3
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 06:26:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1h2Ddo-0002WQ-V7
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 06:26:18 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56906)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1h2Ddm-000241-Us; Fri, 08 Mar 2019 06:26:16 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3C67F30D78B8;
	Fri,  8 Mar 2019 11:26:13 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-151.rdu2.redhat.com
	[10.10.120.151])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6F58F60BE5;
	Fri,  8 Mar 2019 11:25:57 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-devel@nongnu.org
References: <20190308013222.12524-1-philmd@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <a085f88a-0f09-464f-af30-ec4048146cee@redhat.com>
Date: Fri, 8 Mar 2019 12:25:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190308013222.12524-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Fri, 08 Mar 2019 11:26:13 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 00/18] fw_cfg: reduce memleaks,
 add QMP/HMP info + edk2_add_host_crypto_policy
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>, Eric Blake <eblake@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rHyl78zq2L+i

On 03/08/19 02:32, Philippe Mathieu-Daud=C3=A9 wrote:
> Hi,
>=20
> This series consists of:
> - trivial cleanups, add trace events (was in v1)
> - add QMP/HMP commands to display the list of fw_cfg entries (reworked =
from v1)
> - add unrealize() method and deallocate various buffers (new in v2)
> - add fw_cfg_add_file_from_host (was in v1)
> - add edk2_add_host_crypto_policy (new in v2)
>=20
> Since v1:
> - Addressed Michael and Laszlo comments.
>=20
> Please review,
>=20
> Phil.
>=20
> v1: https://lists.gnu.org/archive/html/qemu-devel/2018-12/msg01598.html

I'm completely exhausted after reviewing 13 QEMU patches this morning,
so I'll stop after "PATCH v2 12/18" in this series.

Please split the patch set into multiple, better focused waves (the
summary at the top is an indication of what each wave should concern
itself with).

Thanks,
Laszlo
