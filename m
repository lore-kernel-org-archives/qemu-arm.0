Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp8198736wrx;
        Fri, 8 Mar 2019 02:30:18 -0800 (PST)
X-Google-Smtp-Source: APXvYqwTHqW8V0X7bKQFXiZpYR5p4/cb7C6+qYXf4CD6HZnyLC6nUVvvhhf0t54Mk46BjnF4uVqp
X-Received: by 2002:a81:6604:: with SMTP id a4mr14132686ywc.510.1552041018804;
        Fri, 08 Mar 2019 02:30:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552041018; cv=none;
        d=google.com; s=arc-20160816;
        b=r/GzcwvTjRL4NqkIuIJWAvH54qDl/Q89RrHdKQLWXH4Tpvvvj7ng3p5niPweCEy30r
         0SN9oZhqzjhaiwhm+Wpt5NbUtQ4z7zVI5APMt8AzAMLWc/T+Wj8Am6IIfepROD8xoYYm
         /8hSDIbN/MJ4YfDqos8JnJ5Wil8mLGmiKxcfbOfF2LdwB/QrJvF3bkCeDHoJurTHWLVe
         DNJypRY9qzk4aesrgCXaYB0ZpIWv6KSvkVXn1qFJWeKzKUz3gjz6PZOhFrFbmQA36LIr
         lo0IJjYrOXIt0qt7w1LvPAy/fFcMGQ8VhGZbJVsjvRDZIN0D36oDxSwCvf+zJepO7QQY
         NVJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from;
        bh=h1FGPTxxbrL93VIwjSZSTarSbRer3MqtGTHZZOl+O+4=;
        b=eEM5QTyxTT1FSTvDzYeUWTuBIt344tb12o2wBE09JPiy0z+yluz82Ft73PiLz9DxcW
         Bib63UGXoJGnchr8s91E8kBjOq+WkEmoBm0p7IlSVkz+vyGPh6N8uUyGMIUOmxmiv6+L
         cDpys9U+irIakha43VZsjurahCb9KUmk281Gg+qNZROnY4gNE2L0QTq0IOCnUY0NdN7O
         RKr+J5fNZq9R7//9PlGjjl6Zn9fa7Q6Dze5ir1+311kjygZGGir8f1DPpINwThXrAUMK
         5nCxcjlLyuEFbbYrC8fWhMZRYfSDfuYXcVIkE17AVD3yeTHjBIMI9RnlF8c3Fbr1p78F
         ORMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l77si4330562ywl.243.2019.03.08.02.30.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Mar 2019 02:30:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:40616 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2Cle-0005eJ-7W
	for alex.bennee@linaro.org; Fri, 08 Mar 2019 05:30:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54954)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1h2ClV-0005e4-Hx
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 05:30:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1h2ClU-0001Hv-L2
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 05:30:09 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43290)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1h2ClT-0001B8-IL; Fri, 08 Mar 2019 05:30:08 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0C5FE3003D2A;
	Fri,  8 Mar 2019 10:30:05 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-151.rdu2.redhat.com
	[10.10.120.151])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 03831608C3;
	Fri,  8 Mar 2019 10:29:52 +0000 (UTC)
From: Laszlo Ersek <lersek@redhat.com>
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
	<philmd@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
References: <20190308013222.12524-1-philmd@redhat.com>
	<20190308013222.12524-8-philmd@redhat.com>
	<5166477f-67db-cf41-cdc9-a459597be80e@redhat.com>
Message-ID: <390aa400-70ee-ac80-ba83-290875cca56c@redhat.com>
Date: Fri, 8 Mar 2019 11:29:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <5166477f-67db-cf41-cdc9-a459597be80e@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Fri, 08 Mar 2019 10:30:05 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 07/18] hw/nvram/fw_cfg: Add
 fw_cfg_common_unrealize()
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
X-TUID: wUEiOsuHOGA0

On 03/08/19 07:55, Thomas Huth wrote:
> On 08/03/2019 02.32, Philippe Mathieu-Daud=C3=A9 wrote:
>> Back in abe147e0ce4 when fw_cfg_add_file() was introduced, there
>> was no QOM design, object where not created and released at runtime.

s/object where/objects were/

>> Later 38f3adc34d finished the QOM conversion of the fw_cfg device,
>> adding the fw_cfg_common_realize() method.

(I'm not sure if 38f3adc34d "finished the QOM conversion", but that's
just my lack of QOM knowledge. Hopefully someone can confirm whether
this statement is accurate.)

>> The time has come to add the equivalent destructor and release the
>> memory allocated for 'files'.
>=20
> You should mention that the unrealize function is currently never calle=
d
> since the object never gets destroyed (AFAIK). But I hope we can fix
> that in the not so distant future, so:
>=20
> Reviewed-by: Thomas Huth <thuth@redhat.com>
>=20

How about we delay this patch until such time the function is actually
called?

This series is already huge, and quite divergent considering its goals.
(Please refer to the blurb.)

I don't mind this patch, but I think it should either belong to a
separate fw_cfg cleanup series (or "wave" if you like).

Or else, we should have a bug reported somewhere public, ensuring that
we eventually call the function introduced here. And then the commit
message should spell out -- as you say -- that the function is not
called yet, but it will be, because of <ticket-reference>.

Thanks
Laszlo
