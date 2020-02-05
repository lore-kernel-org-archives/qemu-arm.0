Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp390159lfp;
        Wed, 5 Feb 2020 09:47:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqx+BDg+v7DZITJDRKEv+fOah87Sj5y9XjZJo4oQzqKFsNkOIkdA87PoP6snWP+nWzyKfG4h
X-Received: by 2002:a37:9f57:: with SMTP id i84mr34454779qke.29.1580924820477;
        Wed, 05 Feb 2020 09:47:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580924820; cv=none;
        d=google.com; s=arc-20160816;
        b=TLq+tFTXZLFLTBkhv9fX1+FQuHJHS/XlL2WAkJay9GGWnWbqnlCrw4DMyKAfiRz8KF
         zB6laiQoS3NlJgQ/NfaWa39OLOgcKHMkcBJrM/dDJDxpl0AVeaeOsAoCOcdyGd178A0G
         9WgVLV3fizaCeLSbaOHr4rpPmj6liN7BjyeFVPU0b63loBSBPGhSV0fvPgMN6pvZf712
         RpY8thd5cJ7xDz+Xfbj+A4tnd9MXaq2WOuLqR0q9Q2F8bv8WiuBhIQcAPha9z63LWjf7
         jpd7MqrNs2XVlE/xl2AkPBgOf4iHnD15kJjhBWzFJvvjNRGnQcfJT7wnU4HCyMbkxhPI
         JC/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=cpZVDW56FIWkvRLgqqNwJwiwLtYQMm/ibYzvKJ3dCJw=;
        b=qr4r4zNvEyg8ETQufM0mXR6vHYqNnUnn/neKNuzJEapcWdU00Nx6espdyIexDoEU16
         gOMohs+Q6k7epRqQJ7Q7K6iC8JND4fPI1x2xrAEG7ptaRcRYbLWi0Vg+fjy5UMQRN2GN
         KaYEQLsXXzf++f+3Z/n3Rbu/Yu6UpjA1vxOO0MdPvyc+0HbuV79l6dyT0cQY0FJn9ZQe
         i1HBJMtPsyoPjj+lZyxDAyqrmp3HYOHS1/zKFnxNWzQnGqHjJtBHsKxSfPiVB1E/ttee
         yPtBWgzvrlDpCmBvYWjwvgxJzxtNP2eOvVoX/cZmiR6K/tfMQHcO8td6ozaYeJTpP4G7
         I8jQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N4QuHY0F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v7si247337qkv.272.2020.02.05.09.47.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Feb 2020 09:47:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N4QuHY0F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izOlP-0004jm-Tr
	for alex.bennee@linaro.org; Wed, 05 Feb 2020 12:46:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54444)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1izOlA-0004eo-TN
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 12:46:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1izOl8-0003p0-Fy
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 12:46:43 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:49774
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1izOl8-0003ld-5x
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 12:46:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580924799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=cpZVDW56FIWkvRLgqqNwJwiwLtYQMm/ibYzvKJ3dCJw=;
 b=N4QuHY0FFefwlxNJg76zIy6q+6pcpEluYn1CK3PB3GAgVQlsVc/z1xBbW7Fj7RrqsB+0V9
 fRzpyfh+jB6iqbiZccprtfJTgf08+lJCbrQMgwDjg37NO8T+51QwRfw3M5ocBvRQWfIg7q
 FFoYHcaTgbEyysFdZVAbLUujR+b4eV8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-68-oQENjGqPPBSfb_aF0ZKf8w-1; Wed, 05 Feb 2020 12:46:36 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A4DF800D54;
 Wed,  5 Feb 2020 17:46:35 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-186.ams2.redhat.com [10.36.116.186])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0751460BF7;
 Wed,  5 Feb 2020 17:46:25 +0000 (UTC)
Subject: Re: [PATCH for-5.0 3/4] Remove the core bluetooth code
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20191120091014.16883-1-thuth@redhat.com>
 <20191120091014.16883-4-thuth@redhat.com>
 <7a775153-f18d-e766-1d8f-33607f5fa05b@amsat.org>
 <2396dfd4-6c85-d17a-b358-bd058c757f14@redhat.com>
 <CAAdtpL7vPCQ8k91nvBWc_NLrmhu6OPVprUSL8uzi_v6HMiSrnw@mail.gmail.com>
 <CAL1e-=gd-ymYd3_cods8BAtwbQeJFodmnmsNo-gLx381rXHKxQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <9c1f04bd-a0e7-6fbc-68d7-fd5babf1e8d0@redhat.com>
Date: Wed, 5 Feb 2020 18:46:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAL1e-=gd-ymYd3_cods8BAtwbQeJFodmnmsNo-gLx381rXHKxQ@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: oQENjGqPPBSfb_aF0ZKf8w-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Peter Maydell <peter.maydell@linaro.org>, libvir-list@redhat.com,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5Nzq36bMwlMk

On 05/02/2020 18.40, Aleksandar Markovic wrote:
> On Sat, Feb 1, 2020 at 7:53 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>>
>> On Sat, Feb 1, 2020 at 7:51 PM Thomas Huth <thuth@redhat.com> wrote:
>>> On 01/02/2020 17.09, Philippe Mathieu-Daud=C3=A9 wrote:
[...]
>>>>> index 6099be1d84..ecce4ada2d 100755
>>>>> --- a/configure
>>>>> +++ b/configure
>>>>> @@ -349,7 +349,6 @@ unset target_list_exclude
>>>>>  # Distributions want to ensure that several features are compiled in=
, and it
>>>>>  # is impossible without a --enable-foo that exits if a feature is no=
t found.
>>>>>
>>>>> -bluez=3D""
>>>>>  brlapi=3D""
>>>>>  curl=3D""
>>>>>  curses=3D""
>>>>> @@ -1151,10 +1150,6 @@ for opt do
>>>>>    ;;
>>>>>    --enable-brlapi) brlapi=3D"yes"
>>>>>    ;;
>>>>> -  --disable-bluez) bluez=3D"no"
>>>>> -  ;;
>>>>> -  --enable-bluez) bluez=3D"yes"
>>>>> -  ;;
>>>>
>>>> Now than I'm bisecting over this commit, I realize removing this
>>>> option was not a good idea, we should have done like commit
>>>> cb6414dfec8 or 315d3184525:
>>>>
>>>>   @@ -886,10 +885,6 @@ for opt do
>>>>   -  --disable-uuid) uuid=3D"no"
>>>>   -  ;;
>>>>   -  --enable-uuid) uuid=3D"yes"
>>>>   -  ;;
>>>>   ...
>>>>   +  --enable-uuid|--disable-uuid)
>>>>   +      echo "$0: $opt is obsolete, UUID support is always built" >&2
>>>>   +  ;;
>>>
>>> Looks trivial ... so if it bugs you, just send a patch?
>>
>> I thought about it but this won't fix much, it is too late now.
>>
>> I simply wanted to share this bugged me so we try to avoid doing the
>> same mistake again.
>>
>=20
> I vote for addition of a change similar to what Philippe described.

Feel free to send a patch if it bugs you.

> Furthermore, it looks to me the correct way would be to now do full
> deprecation of --enable-bluez and --disable-bluez. This means adding
> this to documentation (not related to bluetooth devices support), not
> only a change in "configure". This also means that only after two next
> full cycles these options could be removed.
>=20
> True, this could have been done together with bluetooth devices
> support deprecation (and in that case we could have deleted these
> options right away), but it wasn't. Users don't have a crystal ball to
> know that we assumed that --enable-bluez and --disable-bluez were part
> of bluetooth devices support, and could rightfully complain about an
> abrupt elimination of a compile time option.

I disagree. If you don't know that "bluez" is about bluetooth, then you
should likely not use these options anyway.

 Thomas

