Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp477695lfp;
        Wed, 5 Feb 2020 11:13:35 -0800 (PST)
X-Google-Smtp-Source: APXvYqxNNYc7IRNcTubUnXW7BiL8rWOp0du7y+B9YYFaQTCt4wb2XqXwa476P62tMMt3HfB3YXYs
X-Received: by 2002:ac8:340c:: with SMTP id u12mr34615022qtb.257.1580930015099;
        Wed, 05 Feb 2020 11:13:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580930015; cv=none;
        d=google.com; s=arc-20160816;
        b=FRe3SzKtGLF8mwLSt/5ApzeFX1Tliwic5TNZPIQI/L+lZbqXHkGWUw2VqCaKrGvNSa
         MDfl8+re0Lin+qEpTCcNkJI6E1zt4HtXYadZ5c/exkHR83BpMpE98KH7A2axTIrKwouV
         cb+ir6mbMgb0zpXJB9jkpIKbLlpy5zqH8ex3wHjn3lbdqk8lIJPnnj+Dblvzqukie6Cq
         P/iomjfBhXgMX8xZnhc4K6MAmQ+hmpdr2gxmFwN5eah5tYwFNOlfBUtLA1RXp8X5Rlwv
         ETHNUuZhBYGNZHxCLC3kxKnoUSX8UBHHh2IRZ8zOu4gF11HBXty8yAU0cgOTqzix2zBt
         CJVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:dkim-signature;
        bh=yTIyRlHSro7zUF/ki3mXbJaQaoeJCNT7pAeMjShe0vg=;
        b=DsDODxA/Xj0lO+6/wAFqGz/Jm0zkl76miLxQTD+LOOiwWS+sWHfqUiO81Dkk/Pe5Is
         THCeYFinVGZNsDr3U7od/A1YWY7+U7qhjdQrAbqYFh9Ocq4KlnakAZzmT5C2tdDrGzsE
         HRlV3ciO16EM8Tf+RvlEDFpiuYR2J0X/jlD62HoAjtrZVHqyKj0YqLILKI4orUDuw4Yy
         HZxE/rcvFxc/SDOEgAit/H8txrY8OZVKuL1TsGJfRj6KTbXEHcT2GkMlcU3uSSBi3Doj
         ZemBxzjBUp2eeyLe618uMLlxrAtJDSQAESK4ceVXtBgOdXJlPmJiELel6MA9KjA32tYc
         VtCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZTxoO5XQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k19si261898qtj.64.2020.02.05.11.13.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Feb 2020 11:13:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZTxoO5XQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:55288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izQ7C-0007cp-Fo
	for alex.bennee@linaro.org; Wed, 05 Feb 2020 14:13:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47978)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1izQ73-0007cV-VS
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 14:13:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1izQ71-0005xQ-Hh
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 14:13:25 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:55089)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1izQ70-0005mg-SV; Wed, 05 Feb 2020 14:13:23 -0500
Received: by mail-wm1-x341.google.com with SMTP id g1so3687538wmh.4;
 Wed, 05 Feb 2020 11:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yTIyRlHSro7zUF/ki3mXbJaQaoeJCNT7pAeMjShe0vg=;
 b=ZTxoO5XQetWPMBh0E385GeSKQyW/ucjCG9M//rJ9ETQsc0zRYYV+gsh/rEnu2BY/C2
 dKzbHaHQ6Si4nWjFCt1TOIcaW0lA4FWEv+DYwPhShs9GOC2jy8UY1tvCFUBJNqLHVl2h
 O+jBDqcsWD39/Dt6DcXWvXPbD0Zp7720D+shC4fZadtpm0YsVH1uFqNzl7iC/DDQUR/v
 SMkon8Fk4Ao6PMUTIP7zdk39gRxdZizqMYWIYvbys7A4vGxsBv7LOTAzzkgSC620GmVV
 54d8sfTMe5edTprVyfFyIhMHBhsorVCK7m8y8Y+57BOYswYJe2IPuvctGHEiCY8R4tEL
 Q8Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=yTIyRlHSro7zUF/ki3mXbJaQaoeJCNT7pAeMjShe0vg=;
 b=cys1FEZo6IJ49abhBgGMNT9tlBXIPk1HgMG6u7nlZBSyfzNIKWDzXVpGgIWS5zcpvL
 fZm2zlb4fnjRWDvvdqg0GGCqbtzQlRY7dA5A/8kc8gPWpVXwUwT14o+A53RPWWM5ariL
 a7WDlgPyjAmeFS/iV5//WyGtlQKDOGSOiWQbnXfp3KTwtivAqQRs59il8C8SFs4q8t74
 63hGbotP2nz4tcsyxpasIUPucJ3XBLBdzuDCz01ogdfNheK3FjaBrm7REPhE0VOdbUVI
 mMvf3Ga6vYldX2TJDnR1FfPQurR86hSXSBjQBhK30hPiYQJQ4EaOIuTDHkKg4zqJokkT
 Bo1Q==
X-Gm-Message-State: APjAAAUV0gOtxfb9wcl/+fe4MfiMGQwaoY9cBTdDnUKhlDFC65Cop4WQ
 hqi/+vPIxDr4JmG9c1yQzOo=
X-Received: by 2002:a7b:cd14:: with SMTP id f20mr7147062wmj.43.1580930001565; 
 Wed, 05 Feb 2020 11:13:21 -0800 (PST)
Received: from [192.168.1.35] (162.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.162])
 by smtp.gmail.com with ESMTPSA id q130sm698917wme.19.2020.02.05.11.13.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2020 11:13:20 -0800 (PST)
Subject: Re: [PATCH for-5.0 3/4] Remove the core bluetooth code
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Aleksandar Markovic <aleksandar.m.mail@gmail.com>
References: <20191120091014.16883-1-thuth@redhat.com>
 <20191120091014.16883-4-thuth@redhat.com>
 <7a775153-f18d-e766-1d8f-33607f5fa05b@amsat.org>
 <2396dfd4-6c85-d17a-b358-bd058c757f14@redhat.com>
 <CAAdtpL7vPCQ8k91nvBWc_NLrmhu6OPVprUSL8uzi_v6HMiSrnw@mail.gmail.com>
 <CAL1e-=gd-ymYd3_cods8BAtwbQeJFodmnmsNo-gLx381rXHKxQ@mail.gmail.com>
 <20200205175115.GT2221087@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Autocrypt: addr=f4bug@amsat.org; keydata=
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
 YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQJVBBMBCAA/AhsPBgsJ
 CAcDAgYVCAIJCgsEFgIDAQIeAQIXgBYhBPqr514SkXIh3P1rsuPjLCzercDeBQJd660aBQks
 klzgAAoJEOPjLCzercDe2iMP+gMG2dUf+qHz2uG8nTBGMjgK0aEJrKVPodFA+iedQ5Kp3BMo
 jrTg3/DG1HMYdcvQu/NFLYwamUfUasyor1k+3dB23hY09O4xOsYJBWdilkBGsJTKErUmkUO2
 3J/kawosvYtJJSHUpw3N6mwz/iWnjkT8BPp7fFXSujV63aZWZINueTbK7Y8skFHI0zpype9s
 loU8xc4JBrieGccy3n4E/kogGrTG5jcMTNHZ106DsQkhFnjhWETp6g9xOKrzZQbETeRBOe4P
 sRsY9YSG2Sj+ZqmZePvO8LyzGRjYU7T6Z80S1xV0lH6KTMvq7vvz5rd92f3pL4YrXq+e//HZ
 JsiLen8LH/FRhTsWRgBtNYkOsd5F9NvfJtSM0qbX32cSXMAStDVnS4U+H2vCVCWnfNug2TdY
 7v4NtdpaCi4CBBa3ZtqYVOU05IoLnlx0miKTBMqmI05kpgX98pi2QUPJBYi/+yNu3fjjcuS9
 K5WmpNFTNi6yiBbNjJA5E2qUKbIT/RwQFQvhrxBUcRCuK4x/5uOZrysjFvhtR8YGm08h+8vS
 n0JCnJD5aBhiVdkohEFAz7e5YNrAg6kOA5IVRHB44lTBOatLqz7ntwdGD0rteKuHaUuXpTYy
 CRqCVAKqFJtxhvJvaX0vLS1Z2dwtDwhjfIdgPiKEGOgCNGH7R8l+aaM4OPOd
Message-ID: <3585192d-a0c1-4116-bec9-4816d498ca3d@amsat.org>
Date: Wed, 5 Feb 2020 20:13:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200205175115.GT2221087@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 libvir-list@redhat.com,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ny7s9dln7+lK

On 2/5/20 6:51 PM, Daniel P. Berrangé wrote:
> On Wed, Feb 05, 2020 at 06:40:31PM +0100, Aleksandar Markovic wrote:
>> On Sat, Feb 1, 2020 at 7:53 PM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>>
>>>>>> @@ -1151,10 +1150,6 @@ for opt do
>>>>>>    ;;
>>>>>>    --enable-brlapi) brlapi="yes"
>>>>>>    ;;
>>>>>> -  --disable-bluez) bluez="no"
>>>>>> -  ;;
>>>>>> -  --enable-bluez) bluez="yes"
>>>>>> -  ;;
>>>>>
>>>>> Now than I'm bisecting over this commit, I realize removing this
>>>>> option was not a good idea, we should have done like commit
>>>>> cb6414dfec8 or 315d3184525:
>>>>>
>>>>>   @@ -886,10 +885,6 @@ for opt do
>>>>>   -  --disable-uuid) uuid="no"
>>>>>   -  ;;
>>>>>   -  --enable-uuid) uuid="yes"
>>>>>   -  ;;
>>>>>   ...
>>>>>   +  --enable-uuid|--disable-uuid)
>>>>>   +      echo "$0: $opt is obsolete, UUID support is always built" >&2
>>>>>   +  ;;
>>>>
>>>> Looks trivial ... so if it bugs you, just send a patch?
>>>
>>> I thought about it but this won't fix much, it is too late now.
>>>
>>> I simply wanted to share this bugged me so we try to avoid doing the
>>> same mistake again.
>>>
>>
>> I vote for addition of a change similar to what Philippe described.
>>
>> Furthermore, it looks to me the correct way would be to now do full
>> deprecation of --enable-bluez and --disable-bluez. This means adding
>> this to documentation (not related to bluetooth devices support), not
>> only a change in "configure". This also means that only after two next
>> full cycles these options could be removed.
>>
>> True, this could have been done together with bluetooth devices
>> support deprecation (and in that case we could have deleted these
>> options right away), but it wasn't. Users don't have a crystal ball to
>> know that we assumed that --enable-bluez and --disable-bluez were part
>> of bluetooth devices support, and could rightfully complain about an
>> abrupt elimination of a compile time option.
> 
> The deprecation policy is primarily intended for notifying of changes
> to QEMU's stable interfaces ( CLI, HMP, QMP) which affect behaviour
> and usage of QEMU at runtime & are liable to break apps managing
> QEMU.
> 
> Changes to build time options have no strong reason to be subjected to
> the deprecation process. If we remove an option at build time the effect
> is noticed immediately and the solution is straightforward (stop passing
> the option). We have added / removed configure options at will with little
> negative feedback historically. We'll have far biggest changes coming to
> the build system in future too, with the introduction of meson.

I understand your point when looking forward (when distribution upgrade,
it is easy to adapt).
However this is still an issue when looking backward when running
bisection to find regressions.

> I don't think we want to constrain & complicate our work in modernizing
> the build system by declaring that any changes to it must go through
> deprecation.
> 
> Regards,
> Daniel
> 
