Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp693619lfc;
        Tue, 10 Mar 2020 05:31:27 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsSF0J6+LJvWniwFt4T+M92o13MaZ3BHMoIMrMeXBuT+PKJhbQInl8OOpnKUVNC6jMhyqmK
X-Received: by 2002:a37:6356:: with SMTP id x83mr19478576qkb.339.1583843487480;
        Tue, 10 Mar 2020 05:31:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583843487; cv=none;
        d=google.com; s=arc-20160816;
        b=B0KyYk4I3brqoj+6TK43YDPzva8P/e+QQUhTTyKxeN6aOBwIegnR0Et68+ByFcz9fD
         SMFq4x8zbe3yWzjRUSohWQjrlJRVTqcFEButzR0sqvSBjsHvtTuZONbUwXs5v12T84oW
         FnUSsTG05E0kycmkeSNINH539RoRNky61n/o3oxBurNihFNHiWHlwopZ/R1tEkojBjoY
         OonWZe/ZOLxmdHSXmn16/QqBy3iRUn81f+ZgTEDuIM1uUy95eALS1cPMYJjQ9/KtGELV
         lb098uYwgF7lbgnOoHG6gotmoEz37OmK8PkQQq5jnmFBnNmos6QogDWjhRVkteCwRU8i
         xpsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=xOwO2YXdH+QvHbL2qyd10FO3LzcScH2SAVUNvz7Za8Q=;
        b=UevgCuvYJQ6TESWo5Z94nNNIkFImvJb3T36CMbcOtmzwyNGaAt6yKKs6U28ChmuHhx
         LxkJTZhlJXPgA0y0Bs6/hCzoelR/z9qm+OH63O41Y/zG2O3SMenyN0RrDNgvLCLmo0aD
         jn1sPx1S+09aTM42Rr9T9lKS3NmnkHc/w6B0/qTKJktBrxUuPgVmmsEv4ks5lF3J9kdO
         L+yEa9Ehl7AlRXWWqvxnkcTxHB36L1AljiYJfJrPddDDsb/2fIcmfLg73wRjk0SEwaI2
         0fb3hoEOSqbGWa/CO8HQAzLepxo09BdF71zSCXnvQHuDTKwNgGQEciUVe2ChE0FZAk/6
         X+GQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fYjBXoaB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j2si8288925qka.21.2020.03.10.05.31.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Mar 2020 05:31:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fYjBXoaB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jBe2g-0004Pe-Uz
	for alex.bennee@linaro.org; Tue, 10 Mar 2020 08:31:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56684)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jBe2Q-0004MX-UK
 for qemu-arm@nongnu.org; Tue, 10 Mar 2020 08:31:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jBe2O-0002ZJ-PH
 for qemu-arm@nongnu.org; Tue, 10 Mar 2020 08:31:10 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:26916
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jBe2O-0002XT-Kw
 for qemu-arm@nongnu.org; Tue, 10 Mar 2020 08:31:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583843468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xOwO2YXdH+QvHbL2qyd10FO3LzcScH2SAVUNvz7Za8Q=;
 b=fYjBXoaB3gitYCJturjRZrXiJLpyl662DKaWO2kVwguhsw2ShSPBImzoXaotA+EIAr0FVb
 wR/7C5quwtwxJyP7ek5RXbq0YEdsm0Iv/K9ls0Xgkko5l20/9BQ60+t7eZ3Vn4Pb4AfLiJ
 sGZnOXHXQy0L9SpH2duJSF72c1kbAWM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-syMwE_7zMIaRmEQ7YTrAlg-1; Tue, 10 Mar 2020 08:31:04 -0400
X-MC-Unique: syMwE_7zMIaRmEQ7YTrAlg-1
Received: by mail-wm1-f69.google.com with SMTP id i16so319743wmd.9
 for <qemu-arm@nongnu.org>; Tue, 10 Mar 2020 05:31:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iMi2LQegoQJUKCWNKL2j3KU0cs10q1dTpEGC+G4E+5o=;
 b=CQaWjSEXeHogUxoxS3tLxkQdIu54Y2UPCuv/dK88m/qMS2/Mrt3w5aZR0sEugwRmEi
 GSTXlWLIlThF3RaG47SOIDfCiiWMha0H+/le4FgIo+xvTBwpG8EVnvnFH+MAT5sP+3RO
 +67Qva5d+nfvKo71M9pCSIbc7+QJ+5KZhh91Vd4IaFvtUIW8EIPPpY9Zcl3jW+X/0aGY
 SuKhe2gERKgZDqSEPR95HVBvq284JryQdaStebThp6msCLHYs8l0LHE5iW3OepIC7N+F
 I4AjsmSM5bJcKORzS1LBVpJXSiTZXPTa+Lew75X2WqkvFAj/RQNtfhRhfrduAdEJn1jG
 HB9A==
X-Gm-Message-State: ANhLgQ0tRDT802D9egEoU08dVEQtQh+IWPBzJC4k/7nz+OGajOAs0+gJ
 cnnP1vz8xWZecIxbRtn3mqWPQiH/vpD/zrLiYduaqumw2adXCznuym4OoK+ukjI+gDWbTUJAfhD
 ojgRDf6aZAbZl
X-Received: by 2002:a05:600c:350:: with SMTP id
 u16mr1964935wmd.168.1583843463456; 
 Tue, 10 Mar 2020 05:31:03 -0700 (PDT)
X-Received: by 2002:a05:600c:350:: with SMTP id
 u16mr1964886wmd.168.1583843463149; 
 Tue, 10 Mar 2020 05:31:03 -0700 (PDT)
Received: from [192.168.1.35] (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id w9sm28221874wrn.35.2020.03.10.05.31.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Mar 2020 05:31:02 -0700 (PDT)
Subject: Re: [PULL 00/33] Trivial branch patches
To: Kevin Wolf <kwolf@redhat.com>
References: <20200309150837.3193387-1-laurent@vivier.eu>
 <20200309151621-mutt-send-email-mst@kernel.org>
 <8db36062-b45d-6c2e-c7d8-98dd2b9db06f@redhat.com>
 <0bb2eac1-74ab-bee8-e8d0-bac542562cdd@vivier.eu>
 <20200310114548.GA6926@linux.fritz.box>
 <ced636a7-dbda-9247-5dd7-37e8c2ccabce@redhat.com>
 <20200310121300.GD6926@linux.fritz.box>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <76fb6e75-6c62-8dd4-e135-ac6c2bdc154d@redhat.com>
Date: Tue, 10 Mar 2020 13:31:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200310121300.GD6926@linux.fritz.box>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Helge Deller <deller@gmx.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Alistair Francis <alistair@alistair23.me>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YdU4yN2D9Vx/

On 3/10/20 1:13 PM, Kevin Wolf wrote:
> Am 10.03.2020 um 13:00 hat Philippe Mathieu-Daud=C3=A9 geschrieben:
>> On 3/10/20 12:45 PM, Kevin Wolf wrote:
>>> Am 10.03.2020 um 09:02 hat Laurent Vivier geschrieben:
>>>> Le 09/03/2020 =C3=A0 20:30, Philippe Mathieu-Daud=C3=A9 a =C3=A9crit=
=C2=A0:
>>>>> On 3/9/20 8:17 PM, Michael S. Tsirkin wrote:
>>>>>> On Mon, Mar 09, 2020 at 04:08:04PM +0100, Laurent Vivier wrote:
>>>>>>> The following changes since commit
>>>>>>> 7a5853cec479a448edae0fb2aaf4e2f78c9c774d:
>>>>>>>
>>>>>>>   =C2=A0=C2=A0 Merge remote-tracking branch 'remotes/mst/tags/for_u=
pstream' into
>>>>>>> staging (2020-03-09 10:32:53 +0000)
>>>>>>>
>>>>>>> are available in the Git repository at:
>>>>>>>
>>>>>>>   =C2=A0=C2=A0 git://github.com/vivier/qemu.git tags/trivial-branch=
-pull-request
>>>>>>>
>>>>>>> for you to fetch changes up to 916c92503bd5348a33e561db600d8894bde6=
36bb:
>>>>>>>
>>>>>>>   =C2=A0=C2=A0 monitor/hmp-cmds: Remove redundant statement in
>>>>>>> hmp_rocker_of_dpa_groups() (2020-03-09 15:59:31 +0100)
>>>>>>
>>>>>>
>>>>>> Could you avoid CC everyone involved on the whole PULL req?
>>>>>> I was involved in a patch or two and don't really need to see
>>>>>> the whole series. Just the cover and the relevant patches
>>>>>> would be enough - if I do want it there's always lore.
>>>>>
>>>>> I suppose Laurent used git-publish, which has this limitation.
>>>>>
>>>>
>>>> Yes, I use git publish and CC are automatically added.
>>>>
>>>> Philippe, you told me some time ago you have a patch to fix this
>>>> behaviour and only CC people on a patch base. Is it available?
>>
>> I guess you mean https://github.com/philmd/git-publish/commit/5bab6e2cc7=
7, I
>> haven't improved it but plan to spend time on it during my next holidays=
.
>>
>>> Actually, I don't think it's even necessary to CC anyone at all (except
>>> the relevant lists) for pull requests. These patches were already
>>> reviewed.
>>
>> Well as a contributor I find useful to get notified when patches are mer=
ged.
>=20
> Hm, I guess a matter of different preferences then.
>=20
>> I guess remember some time ago patchew (or another bot?) was sending a
>> notification on pull request merged, this was even more useful than Cc'i=
ng
>> ppl on pull-req. It is also helpful when you track someone else patch on=
 the
>> list.
>> Since most of the maintainers now include the patch RFC822 Message-Id, i=
t is
>> now easy for a bot to reply to patch taken from the last.
>=20
> I don't remember anything like this, but having an automatic reply to
> the email thread of each merged patch series might be a good idea.

It was patchew:=20
https://www.mail-archive.com/qemu-devel@nongnu.org/msg623861.html

   From: no-reply@patchew.org

   Subject: A patch has been merged in QEMU: $PatchSubject

   Congratulations, $PatchSubject was merged by the QEMU maintainers.

>=20
> Kevin
>=20
>=20

