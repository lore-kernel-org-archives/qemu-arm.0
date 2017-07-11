Received: by 10.25.44.15 with SMTP id s15csp5146608lfs;
        Tue, 11 Jul 2017 10:41:00 -0700 (PDT)
X-Received: by 10.55.3.148 with SMTP id 142mr1307296qkd.127.1499794860464;
        Tue, 11 Jul 2017 10:41:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499794860; cv=none;
        d=google.com; s=arc-20160816;
        b=UIATlUpZmhFu0OnTlBY/PNYLWVZju2dQU7ZVmfqSz6qjRyFlHIERAavY3480DtX8Xu
         fn7OoM82/4mJ328tOw7Tp/M2CT8S9YAJc03zAx2IZoIfMb7AJhfAI5/CpuhkGTyDKF9Y
         2s1iiM3ac50/Byzwxc8raN/ts6Wr9Yu4L2PERSFcbLWhkJdmbECRdG2Ait3I5NDWzAKd
         q4DLzzXBH/DNhRATGf5Oc/E96kTpFuakbjdODttAf7KLpp98v45/qT9j5AUGQI12HbXG
         wWK2l1unTJKPoM64PyIOVVM9Tji13LRpINsBqu1ZHo1n0f41XockCRejTGbAZKTI3y0v
         V+ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=bwxnIO2Vknwy9S8mcjLhF2CeEZWw2hBO3isaFtiX8gA=;
        b=EnV1bsf8d/pz4bEnCbQUvAGzi+xkzqneCyymEVO6kKVRzTQwICs3IdqdMsb1jfVC3+
         Gy+UEKNDLgyUZl1jKF5eYwGP+8V18IW2L3oOBTcQGToQKtm93oI1I0qMWCVqroMcs2L+
         jeymMWYYT9YF2QscSHmo1gD/70ON8X7aFc+fBRf3Z9jrzvej0vs62ato1hzcr+jy+GCQ
         BbDBtm85Vrz3EnzO/ZAISYygA2IfXPDlSUMySCsfFx0Tp3Y6sR3lebhcqNuNbmGd77qT
         YeUmvqpe4zdymE5taoQN7KP/iENLC58t4ACJFl/VB+W13YVnZlDkh2SL67JX+W/kT7C6
         LhxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.b=D6yZbeTU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id v75si457281qkl.144.2017.07.11.10.40.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Jul 2017 10:41:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.b=D6yZbeTU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47967 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dUz9d-0000xo-P6
	for alex.bennee@linaro.org; Tue, 11 Jul 2017 13:40:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44488)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dUyvI-0004I3-FX
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 13:26:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dUyvH-0006TG-Np
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 13:26:08 -0400
Received: from mail-wr0-x232.google.com ([2a00:1450:400c:c0c::232]:34719)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dUyvH-0006SO-GK
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 13:26:07 -0400
Received: by mail-wr0-x232.google.com with SMTP id 77so8323068wrb.1
	for <qemu-arm@nongnu.org>; Tue, 11 Jul 2017 10:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=bwxnIO2Vknwy9S8mcjLhF2CeEZWw2hBO3isaFtiX8gA=;
	b=D6yZbeTUZ7JWBNepFUYwZHCRrO/CfIm6Ca3Mosd24KMF86/MGLQwQnkGEffWJ2qaCC
	wNGjW3k33Wd69tG/Rad4eoPPjO2/UDBaLjVTv4KcS1/YviHyyMhrL0zWfDViKzSeA0VG
	nSr0KuywYTJ5+dEqHycveG3GmJ0U9/lMbc/bQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=bwxnIO2Vknwy9S8mcjLhF2CeEZWw2hBO3isaFtiX8gA=;
	b=sGX2xLWdvW6bXQ2+dfQSMT5VSViGHjvvtijl3J09XZ8lYUjbuX+IYJ9oTf3Nr/V5cY
	9jBJbBmR/4S60riNpKMcjzPdG9zCHkY5XMWJ3Ahpo5VyHAZpcs7yDdJEgP1q/bN8nOPY
	7eAmb8NJfLBViEFpybw9Rd2B2qUwc7wpg36Qr6RQq+pYLoWbSmP23nXciQ20dTKMida/
	DvIZKQ4TNW1/CFzg+1y8y1NmSjHWXpV3vKMJ8DOzTTV4yd/v14Q9JJZLyIgH7h8XH91J
	uRuDc/DaGtWUXE6U5G2n31JPaoQzR06yGBu6Fby37ctJJxdIJN5W8yUusG/ZQSz6Zwim
	T3DA==
X-Gm-Message-State: AIVw111usVKpyi9bcKQTW8SMSqNwroUuO9wpZ0f/l7JeamwL4k0FzIxW
	XVyoJZBePOKgi/MbSVOgoAZCJrsu8Udb
X-Received: by 10.223.133.239 with SMTP id 44mr568125wru.177.1499793966400;
	Tue, 11 Jul 2017 10:26:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Tue, 11 Jul 2017 10:25:45 -0700 (PDT)
In-Reply-To: <1158652012.49603326.1499793308542.JavaMail.zimbra@redhat.com>
References: <1499788408-10096-1-git-send-email-peter.maydell@linaro.org>
	<1499788408-10096-3-git-send-email-peter.maydell@linaro.org>
	<1158652012.49603326.1499793308542.JavaMail.zimbra@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Jul 2017 18:25:45 +0100
Message-ID: <CAFEAcA8ud++Mpp5s_myOx1=CQYak1gQfs0tfhjn8Hd5EvxjXVQ@mail.gmail.com>
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::232
Subject: Re: [Qemu-arm] [PATCH 2/3] qdev: support properties which don't set
 a default value
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
Cc: Markus Armbruster <armbru@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TUuiDk48+xfG

On 11 July 2017 at 18:15, Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.c=
om> wrote:
>> @@ -793,7 +793,7 @@ void qdev_property_add_static(DeviceState *dev, Prop=
erty
>> *prop,
>>                                      prop->info->description,
>>                                      &error_abort);
>>
>> -    if (prop->info->set_default_value) {
>> +    if (prop->set_default) {
>
> Not sure if it's worth to have an assert(prop->info->set_default_value), =
probably not necessary.
>
>>          prop->info->set_default_value(obj, prop);

Yes, we'll just segfault on the NULL pointer immediately anyway.
I tend to the view that assertions are for turning obscure
and delayed failures into clearer and more immediate
failures, and in this case the failure is already pretty
clear and immediate.

thanks
-- PMM
