Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1378167wrd;
        Sat, 18 Aug 2018 08:47:35 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPz8bTWveqRaQtiQ3LCMo6MMkeH4sKJNUHwENjM1849AIcuFfvb5Lv8Irv6ahGR3VOMkxAhR
X-Received: by 2002:a0c:ad58:: with SMTP id v24-v6mr35457731qvc.75.1534607255858;
        Sat, 18 Aug 2018 08:47:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534607255; cv=none;
        d=google.com; s=arc-20160816;
        b=gcqEXBBJhE6AKNCJhlA+xfCtInjIvSr5OgI8UDlPpRI/29/EgSx9jQF0HhOSjivRUl
         WLFjwBRhoZY/Nxb+0cREcsNM1U52TYt0eXuOM743sW6lM2/l20oXZti18xoh4wCQR3WO
         0nYa5bzkcbjAbc1wQPXyxTp0hkVncQBQlClwMF1vD7hSIOjXBD4DUYFm4vYQBETHnEiM
         t/rKIS7q/imdw8cEJoqOAW3y9UebGOzx2rwhKBVJkhihfPMa8TurC6HD1fBW7poFFhVl
         fnQxIqVS6DilmjtE+sarzjpJoNSf7c8RnJKnMwm7rlalrYcXTQgEAA65hUTKOD/RAnR+
         JgGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=QQO5C/4MRZyA8FQdw1YevvMD2zJ/lBN1g1UbHDQqinU=;
        b=nCk+jO2nA2J7V9XmegbV+uvSsoSkokioOCAokz2tbIImwUFUcmFLDru+JhItTNH6br
         zcx3VHdu6Qq9wDRxRwVIqQMcVTGkELOGQYFQImLVTog3MR5t+Zeo1YwJW9kCkBc5V/Cc
         DZZix2PzXiJuEKwjrPpK4xzQW/flxMZYdA3NKQnaR6VUosPgcGcOswrS+po1z5Tmo2je
         N4Zv521SODrETJCO327ToxI6CoWndhP5LRwa+cQ6J/jC2Qg8lik6Vay6bXwgBvkYMwc2
         MxM4Rx4qIDaPOUKejbWBLZ/7yrBAMbQ8zA7b/y0t7GQ0k0oSd7GPMIqpLbos+ixycTn2
         OLnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=k93YQ3dS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k58-v6si3948975qtc.318.2018.08.18.08.47.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 18 Aug 2018 08:47:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=k93YQ3dS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39467 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fr3Rv-0001FU-AV
	for alex.bennee@linaro.org; Sat, 18 Aug 2018 11:47:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36672)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fr3Rb-00017i-4x
	for qemu-arm@nongnu.org; Sat, 18 Aug 2018 11:47:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fr3Nb-0006uH-9N
	for qemu-arm@nongnu.org; Sat, 18 Aug 2018 11:43:07 -0400
Received: from mail-ua1-x941.google.com ([2607:f8b0:4864:20::941]:44072)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fr3NW-0006qA-A2; Sat, 18 Aug 2018 11:43:02 -0400
Received: by mail-ua1-x941.google.com with SMTP id k25-v6so7437664uao.11;
	Sat, 18 Aug 2018 08:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=QQO5C/4MRZyA8FQdw1YevvMD2zJ/lBN1g1UbHDQqinU=;
	b=k93YQ3dSQPniQo5gKb6HGn4NZYOteLkJ0CLbERc6GLvDMXFBpfDf69CYsrg8vdsdj4
	JZDhicWO5xSjPVk6oCBoSQI1iVyJsu8/11PdC4dMpVGZwPsVP4qOxMWQ2Ou4QDTweJyo
	wuwMgZmfst4IpvcADkgE8iIq4DcCfOUovUkX704VUusu8ls3TOoyfIC2mrAx1sdeyt7M
	YPI/NxImHD+engEE9DuX4LB8zwPz7EHLNO7nlE9bWq1qSeCfZa93ErDKcpAt+Kn/8Vgu
	iDqmFoKznJ30lQ6S0YXUOz8E8aa2Hu8sBTDgjWIY/rLe71GJvxzi0BKkjauRIdv8ZVPk
	7jqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=QQO5C/4MRZyA8FQdw1YevvMD2zJ/lBN1g1UbHDQqinU=;
	b=JWLvblLXL3U7eR44XcY36BONKMs615VAQdToygIQ9xxsDf+0o1qVdwSJ3QEl1nIBb8
	/MuRjWFME9pa7luOVZTrpeZcwWpfIncQmNG1YPKeqJ/6jLJY+Gl5aelwFEiaMFiv+8F4
	/GNrYZylA/gTRosa25O/Y1y4dZnmpwTA774uU6h1Qzmo85eKwbN4jJBh33y6luSPU7hX
	Gjq0hWPzHtn6zNn0pCWdGq47rXjyjec3HEc51OnaLaNU83PZHoRSfftyaa6XC0pYEArd
	t1CkQB/E0KfKTiSqy4jVwUIHD1uM3iYI5mboDhU+qiGh+gvz+df9ua9VOU2zNpePatmN
	xQdA==
X-Gm-Message-State: AOUpUlHN+MPFbXVNrmv9tmt9qp+3prvqAybcKp4Ex8mETGiUtHSEWW33
	+TCoiPVnQYCUSTT34MD2onI=
X-Received: by 2002:ab0:2602:: with SMTP id
	c2-v6mr20000159uao.127.1534606981789; 
	Sat, 18 Aug 2018 08:43:01 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	e185-v6sm1876129vkd.15.2018.08.18.08.42.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Aug 2018 08:43:01 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180809130115.28951-1-peter.maydell@linaro.org>
	<20180809130115.28951-9-peter.maydell@linaro.org>
	<3fbb1f6d-8615-f540-d902-67ea9026777b@amsat.org>
	<CAFEAcA9_76xjs6cb223q0zCQyi3n67_-f8Ga+2yYRvXM73dk9Q@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Autocrypt: addr=f4bug@amsat.org; prefer-encrypt=mutual; keydata=
	mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
	u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
	HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
	YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
	ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
	dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
	ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
	Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
	HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
	Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
	YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQI+BBMBAgAoBQI3aGSw
	AhsPBQkmUJgABgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRDj4yws3q3A3nS+EACxKosO
	3DZdwdVPXLVvSAA5y3Ohr2ByWN06RlVEkKWkOxm0lQ96LxBOZ03mDC+He/36DHaP+fujPBTz
	XjTXygWWZUtk0flDWR1w0a4yhX/JHfL5yloMZrxifCwouf2Sv9Yd6D46pzMeGsq8aCvbZYSf
	lDi3KXsVHc+jbmRwxtzJxz7366dsTC1tOJmjVSxc8bE55pHnPFOT1KKM9fxGWZFYx0UqAL/1
	NkrOKP5eXdJ51EhQa5pjivJw6dQlfWMQURG4o4e2+aLe4TkS2FI0r6nTgmoDmTT74u35NzZW
	Q3xjqcfqUX52+0drwlta22guNDbcJ4J+/I6FBF1C7CoSysBiIrldZQ6cJZ19st3jb7NHAoNk
	DcUt5I3gt4EpaiijWEEYAhw1/NSagm9bfn9veBqzVHNQrz76NZMiy2kP2vAxKOvo1XVlcEl0
	8MQ+IAUvYcLvU6yHRB4da7ts+ufqriNI5WBpvoLPRRa0wFDTj0nX/CfWFX9UkTwHA6/SWlhE
	hHau4xrpzFENwF5UDFtMkleo/u5Ipv7q8wYNs5JBpSXGmm4oSV9BbW0gp28D8fY4GGv1+6Dz
	BNDeuIdPf2NX0X55uyphpB0J4d70uNszAWXr7VqGOBbGrHcNHeT62BvoRd8bUQhaEyiJwOyC
	Ny4YIWW+I8W2wXkW+vSrZfEro2GZjQ==
Message-ID: <b226de86-f209-24b8-84ee-a262b4558705@amsat.org>
Date: Sat, 18 Aug 2018 12:42:56 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9_76xjs6cb223q0zCQyi3n67_-f8Ga+2yYRvXM73dk9Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::941
Subject: Re: [Qemu-arm] [PATCH 08/16] hw/misc/iotkit-secctl: Wire up
 registers for controlling MSCs
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: K/1TQ4fEt9ps

On 08/18/2018 07:05 AM, Peter Maydell wrote:
> On 18 August 2018 at 01:37, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> On 08/09/2018 10:01 AM, Peter Maydell wrote:
>>> The IoTKit does not have any Master Security Contollers itself,
>>> but it does provide registers in the secure privilege control
>>> block which allow control of MSCs in the external system.
>>> Add support for these registers.
>>>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>> ---
> 
>>>      case A_SECMSCINTEN:
>>> -        qemu_log_mask(LOG_UNIMP,
>>> -                      "IoTKit SecCtl S block write: "
>>> -                      "unimplemented offset 0x%x\n", offset);
>>
>> Maybe:
>>
>>            if (value & ~0xffff) {
>>                GUEST_ERROR(...)
>>            }
> 
> We don't generally bother to log writes of raz bits as errors.

Yes I know, and this shouldn't make sens for an well publicly documented
device/board as this IoT Kit.

But you would be surprised by some proprietary firmwares or libraries
provided by some companies...
I have been surprised modeling the Hercules TMS570 series from TI, they
provide a datasheet with the register/bits for the embedded Flash
(F021), and a library/API to access this flash, however when I ran
firmwares linked with their flash library I noticed they access
undocumented bits to restrict^H^H^H^H^configure their flash, and I had
to model those undocumented bits to allow the firmware to continue
further and boot.

So not needed for this model, but it may be sometime useful ;)

Regards,

Phil.
