Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1315497lfp;
        Tue, 21 Jan 2020 02:50:06 -0800 (PST)
X-Google-Smtp-Source: APXvYqwwKao/A3FpdGPHmxieBGRLuulu1BvfDyxOWPcNBSp21H+RTI4q5SaHvr6fDxeT+2YbxNgl
X-Received: by 2002:ac8:5395:: with SMTP id x21mr3753305qtp.64.1579603806635;
        Tue, 21 Jan 2020 02:50:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579603806; cv=none;
        d=google.com; s=arc-20160816;
        b=o4SMrfih85IDtBLqhnAVHX44pRE38z92IGNXgV4ur9Kr/Q7VuJr6fw+xIxJ9uFTh1/
         sFLdrINFdeCpVOM7F5Edw3AgE9F+8VIKJZo2ni3WcSkHnVmKf1bNBmcnK+14izRPyg6J
         GsFkeSuBYiBLACu1Wfu9ibYMBGOaFxI42OLKzCYA6bJXZann1EJ7wpc9J+Ba3mPKddzb
         +bTvmS7AbTTfhvJP+Jmga44iPKqAhxq33lH8q7SjxzJ1lLirnWnoh7RaxgfzFWm5joEb
         l+8sNneppta4oxACJ9BKgOnJc+GSEiz7RfRVr/d83dc8T8b4hlTiQckzi5+uqWkCt69Y
         l4ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=FSa46ZYyGmie/bVkHIG0X5JHtwyUvx9RKZ7BbDRX9ZM=;
        b=l/h5PijEn0f+fsfMK4whZVEMcIYuQMvePGsapM3ZZGsV/aCnEz6yp/FVYC3uZpr9zz
         UkKbft6Tk4lJq7WQf50C0ngiOgyLi9UwhPDBfapRIiNymy/keHbk46jx1HnRKfwPwfA/
         5D6k+xyojGxXO9AT5f13J4ANecWUdywfRviOtvoiE1xj0qPSaevkZyCUHgPimV8HIWg5
         E+hYp7keY3dAfPs96SspdB3ETo3CJkaV00kgsACc83amHVyTK1gAeU/dM0KeeHcJmkJU
         OJ3NGuYs4rnBjQYK1kplEeAqGpQTRAx86eD1dksNp1PJSXxS1uvpT7qDalwC6+WZbrup
         b5vQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VATGgSvU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b17si22035387qka.261.2020.01.21.02.50.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jan 2020 02:50:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VATGgSvU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1itr6j-0006X0-L5
	for alex.bennee@linaro.org; Tue, 21 Jan 2020 05:50:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37822)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1itr6N-0006UG-AP
 for qemu-arm@nongnu.org; Tue, 21 Jan 2020 05:49:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1itr6M-0000sg-38
 for qemu-arm@nongnu.org; Tue, 21 Jan 2020 05:49:43 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:32179
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1itr6M-0000sS-09
 for qemu-arm@nongnu.org; Tue, 21 Jan 2020 05:49:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579603781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FSa46ZYyGmie/bVkHIG0X5JHtwyUvx9RKZ7BbDRX9ZM=;
 b=VATGgSvUERnbqgDSttLSq+kB548setE6/ZHfwNCIF5rcPATRQr+34O/yxxtdqOOcCfvlUY
 LjBtaZw1Vq9PaqavIZ8TzF0bLob9hSTGleA1c2N+UG/90QPdodfSr5ZUIlWzls4f/SpMh3
 +5fSPkJLPh/azoE7s7gOVoZwgvLjh7Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-67-w-sv1FULNf2jS5_dMAWU7w-1; Tue, 21 Jan 2020 05:49:38 -0500
Received: by mail-wm1-f70.google.com with SMTP id t16so460179wmt.4
 for <qemu-arm@nongnu.org>; Tue, 21 Jan 2020 02:49:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IDMnGMJ6Cs/whFH4XpRx3WeUmxqpk22bAwxooOpZMug=;
 b=km77+Ga/dNFq9oo3eOMWrcE4wNF6vGmCDbuKPq5IFI7iN5HpDnOJRvvx+ELVsDiiz8
 TI1/NT05P/Ltg04SlHFdi8VptQjS6+54tdL0hgzQhDXigMUDHGuoo/vTqacxDAq7F/hA
 cuoCG2fmg6cVUunHR9Q+eMrxfluUnC3+w0ZBK2VY06AxwS+xFEDnZPn8SYNbFZYuB0ra
 oikwdpC65tIz/3S0Lw+iO8n+u1+keSxpYjxS6g/ewTBhh1taTS52jv8JucaYABogFntQ
 aqEDECIAuVTYtF8e09cX4gi3W5DaZTjI5sFrbibf/7riHwr3rODKNA0xMqDuClizRprZ
 +tcg==
X-Gm-Message-State: APjAAAUk3c/F1lMs/N2kHsg9/0/5yLkNA22u/CxECdfbAzhmohcJo5HD
 eCdW5ytsallUn1Huqj+wD16c533lyUY9yIxifdd9h2sd/BO/uGTnV16V7+ewtEARi1R9lY1fiFX
 cZPplRo/0xJir
X-Received: by 2002:a1c:23d7:: with SMTP id j206mr3830839wmj.39.1579603777205; 
 Tue, 21 Jan 2020 02:49:37 -0800 (PST)
X-Received: by 2002:a1c:23d7:: with SMTP id j206mr3830811wmj.39.1579603776906; 
 Tue, 21 Jan 2020 02:49:36 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:b509:fc01:ee8a:ca8a?
 ([2001:b07:6468:f312:b509:fc01:ee8a:ca8a])
 by smtp.gmail.com with ESMTPSA id k7sm3243589wmi.19.2020.01.21.02.49.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2020 02:49:36 -0800 (PST)
Subject: Re: [PATCH 0/6] Fix more GCC9 -O3 warnings
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Chubb, Peter (Data61, Kensington NSW)" <Peter.Chubb@data61.csiro.au>
References: <20191217173252.4672-1-philmd@redhat.com>
 <84fthiaahd.wl-Peter.Chubb@data61.csiro.au>
 <87a77q9njk.fsf@dusky.pond.sub.org>
 <97c34bbd-79d2-070e-a35e-4fdf68b2e291@redhat.com>
 <db49a831-df35-c209-5db5-0631a5ef2497@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <12b8431d-3d29-cdbe-b952-eac23c35be0a@redhat.com>
Date: Tue, 21 Jan 2020 11:49:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <db49a831-df35-c209-5db5-0631a5ef2497@redhat.com>
Content-Language: en-US
X-MC-Unique: w-sv1FULNf2jS5_dMAWU7w-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Hannes Reinecke <hare@suse.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>, Gerd Hoffmann <kraxel@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N5cWTkMG0FqS

On 20/01/20 20:02, Philippe Mathieu-Daud=C3=A9 wrote:
> Hi Paolo,
>=20
> On 1/18/20 8:24 PM, Paolo Bonzini wrote:
>> On 18/12/19 07:05, Markus Armbruster wrote:
>>> "Chubb, Peter (Data61, Kensington NSW)" <Peter.Chubb@data61.csiro.au>
>>> writes:
>>>
>>>>>>>>> "Philippe" =3D=3D Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>=
 writes:
>>>>
>>>> Philippe> Fix some trivial warnings when building with -O3.
>>>>
>>>> For compatibility with lint and other older checkers, it'd be good
>>>> to keep
>>>> this as /* FALLTHROUGH */ (which gcc should accept according to its
>>>> manual).
>>>
>>> We have hundreds of /* fall through */ comments already.
>>>
>>>> Fixing the comments' placement is a different matter, and should be
>>>> done.=C2=A0 Seems to me that until gcc started warning for this, noone=
 had
>>>> actually run a checker, and the comments were just for human info.
>>>>
>>>> Peter C
>>>
>>
>> Queued, thanks.
>=20
> Thanks, but I sent a v2 (20191218192526.13845-1-philmd@redhat.com) with:
>=20
> - addressed Thomas and Aleksandar comments
> - dropped 'hw/scsi/megasas: Silent GCC9 duplicated-cond warning'
> - dropped 'qemu-io-cmds: Silent GCC9 format-overflow warning'
>=20
> See:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg666280.html
>=20
> Can you queue it instead?

Yes, I replaced it.

Paolo

