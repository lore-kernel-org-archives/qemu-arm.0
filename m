Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp3809560wrh;
        Mon, 29 Apr 2019 11:19:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwnO3QMUZ2PCIen6yoru1tPN21yiwaOuNEfAP302b26v4jimYT6rNRjwuuliDN/MItVCC9X
X-Received: by 2002:a1c:2090:: with SMTP id g138mr257547wmg.117.1556561996848;
        Mon, 29 Apr 2019 11:19:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556561996; cv=none;
        d=google.com; s=arc-20160816;
        b=Xett/xzZYN3Qv+Dlt1CKjAVkN6pLUUvyhrm3ANPpqrY4jCAoTv4Wg9DDFRrl69yoJc
         81mZnburg8tOoXS+knli6mv/htEhn+MyRM7Hm6hsGjqqPezbO0HSEhTIflaVOb/u9cdS
         D/Wtlr+dbw9ISUQiFtRWeun/bIf7wZeDkjkit+G3J2/S58Wk3h1VdKsHBRluwFmRnoEQ
         JF7E6YDhpHzLQFgC2V/LftYdmxQqstsiLCGJ1ub3jPoq2VwgEVidfcep/ovvalC/jJNf
         YYnUYXLr44BkDRwK91iYWuUebke+NFpdYRliS11oXJjvDFApncGgzqsfZ6rx/J42fDi7
         v6YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=b8JrVvmhx3q26IahqjD6E/5G69SfIzP3Kim3EOowCVU=;
        b=U8alS5y4kmuk0v+x43Zx5E9vwcmq2Re0T+zLH0b/Zm7hi1DqCiZt2OJD+sDNMvKwxZ
         pyCZ7UgWnqGlhRYNsy6xBiWYCSksAIBY84Z70xJU9xX5XUWyrSZaeNF4Kv7gY4k148lr
         lqkqxipoLXqMwxih63XdbqSVt/65ATzww2T3Wk8CobRlwjRsHEMrSi2KSD3/LZCwfras
         Cvl4XPmxjG5I3ChAiBoUTCsPFHqHdrgRNs96KVhVtRIGU9ileDtvpExNiR+SkeN4OJlh
         e+TGsqvzBUvTc4MtjqCJ+G0l+6TPVYJ1RVbPa9LpVC6b2Pk0eHNMU/xjO34Rzva2coDR
         fYCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j14si136073wme.178.2019.04.29.11.19.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Apr 2019 11:19:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:33423 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hLAsd-0006UE-Ca
	for alex.bennee@linaro.org; Mon, 29 Apr 2019 14:19:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51985)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hLAsO-0006TZ-Fo
	for qemu-arm@nongnu.org; Mon, 29 Apr 2019 14:19:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hLAsN-000177-KW
	for qemu-arm@nongnu.org; Mon, 29 Apr 2019 14:19:40 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41733)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hLAsN-00016t-7n
	for qemu-arm@nongnu.org; Mon, 29 Apr 2019 14:19:39 -0400
Received: by mail-wr1-f66.google.com with SMTP id c12so17412415wrt.8
	for <qemu-arm@nongnu.org>; Mon, 29 Apr 2019 11:19:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=b8JrVvmhx3q26IahqjD6E/5G69SfIzP3Kim3EOowCVU=;
	b=m9UWVywijBdOdjmLIxuYofYVQWmI0MsPD3RycavIz/IPHSeoli+ptHXoo3OMs1/cW7
	Fi8UF8/ki28W1YSAeAn2ZM3+7VriyUZZhoUWbLsFM/oIRiLIoVm4aNa6TG5tFCILz+PP
	3w9HYe91wdI/3qpVZQEFiNGKYgy2/y3AubCmiz/oBhcOGrncXdmOEtlanJia6dcCJ+Xa
	2zBn+ZvtEk9AdJmsfjJB6s7fkR/6yRoJpYjawqUxDNo0mWS1jywMVZRibzo/LfNy0TzT
	0XccLkGPhe4IAFTcLOm4NO4nbzk+NSFj78oQrCaDM658R4MVQ99HR5XscZvOpcnJ0c11
	Gxiw==
X-Gm-Message-State: APjAAAVKy2xfgV9yWXtIriIu3FFa8rFkwMgJkD0WaMOBizrMlAA8xGeo
	qDRQs/8HRTGe03vHFpQQmfcElA==
X-Received: by 2002:adf:b64e:: with SMTP id i14mr19509426wre.72.1556561978272; 
	Mon, 29 Apr 2019 11:19:38 -0700 (PDT)
Received: from [192.168.1.33] (193.red-88-21-103.staticip.rima-tde.net.
	[88.21.103.193]) by smtp.gmail.com with ESMTPSA id
	e6sm25705557wrc.96.2019.04.29.11.19.37
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Apr 2019 11:19:37 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190412165416.7977-1-philmd@redhat.com>
	<CAFEAcA90Pv=zEqaonGV=c022T=CYMo11nkqNwBnGgocESnBNmA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <f56687f4-434e-0e6d-77a8-fec6c33c9a62@redhat.com>
Date: Mon, 29 Apr 2019 20:19:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA90Pv=zEqaonGV=c022T=CYMo11nkqNwBnGgocESnBNmA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-arm] [PATCH v3 00/12] hw: Remove "hw/devices.h"
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
Cc: Thomas Huth <thuth@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>,
	Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +gYlUq4rrV0B

On 4/29/19 6:51 PM, Peter Maydell wrote:
> On Fri, 12 Apr 2019 at 17:55, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> Hi,
>>
>> As his first comment describes itself, the "hw/devices.h" contains
>> declarations for "Devices that have nowhere better to go."
>> This series remove it, creating new headers for devices covered there.
>> MAINTAINERS is updated.
>> I also included 2 cleanups while working on this, in "qemu/typedefs.h"
>> and "hw/net/ne2000-isa.h" header guard.
>>
>> v3:
>> - rebased
>> - added 2 patches suggested by Markus
>> - addressed Markus review comments
>> - added Markus's R-b
> 
> Since these are almost all arm devices I'll take this via the
> target-arm tree (I'm going to make a pullreq later today).

Thanks Peter!
