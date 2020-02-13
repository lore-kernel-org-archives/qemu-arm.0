Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp658906lfp;
        Thu, 13 Feb 2020 06:16:14 -0800 (PST)
X-Google-Smtp-Source: APXvYqwyjKgAh3+bDn7VYaAY2KTGgLg+57T2f1IsJf8tpe9KxjPS20PfBSlhXOCD0wWzyihgaaZ5
X-Received: by 2002:ad4:57c7:: with SMTP id y7mr11298242qvx.174.1581603374368;
        Thu, 13 Feb 2020 06:16:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581603374; cv=none;
        d=google.com; s=arc-20160816;
        b=V6/DCj/8xG60WRnFKP3BcbAuqzL7fugn7wO999h6jsZ2sXNFSQa0i2ykEBQ+xYxvct
         rj8AzjC/u+u7GEmD4jORx3cSYDPuZR2+aCL9KHIVnV78+YziFKApXhMXkM9G65FbKTmc
         90fkCK83dn7mRrVTZEvf0xhI3WnDiKp+jgPRFeK0D8u1NW5jnOkYxbF9r2ScS6m+g2wj
         UunHlq/VgWI/SVC28YEbtZGvpJI9vdiNVXGDoSz+R2UPe+oasdUb1ytEvmgkU+N1GMJd
         r4mg+lWYm86A6VXI72roypJsvBUFv2fNJhlQgoc1Hd7NzhUt0SaXE2+WttpXwWX3C1Lu
         +4yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=1KIyTd1KNufXatXvynb29Zy6em2ZrIr5HGYCIBXf7/Q=;
        b=nDqRX06ay09dx6OE3IKakKkM2H2qtKPq/CjI7mUz9xgVa7X/D707nDH8goVd28V0Fk
         W1O4Hex9MWklxJcayVS4NhKE8seZ+g2B4zS+8CEu4SwUZj+GuVJPZp+cn0ICLyTfLflI
         JuCwHSy0GCh6ahYSi8BlgLxACSofI01FGQTfjR1gzTXrejz5MpRikK9MP+V5X3KEORjo
         lpYdo173MN2XAysTTdInwxOlyF0St4JQntw96CJfqHGg5vmgIgqcR/zoU8MR50a8pEk3
         gYghl/DgX2CdOPTpgYTLLz8xlGXZjm6V8LoO3+6YdoXr2Fs0dsoL8k6bh3NYLUSaos8o
         KBiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="SK/pDUVr";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n8si1191047qtr.208.2020.02.13.06.16.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Feb 2020 06:16:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="SK/pDUVr";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2FHp-0001ay-NU
	for alex.bennee@linaro.org; Thu, 13 Feb 2020 09:16:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55313)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j2FHf-0001aj-O4
 for qemu-arm@nongnu.org; Thu, 13 Feb 2020 09:16:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j2FHe-0000oJ-4Q
 for qemu-arm@nongnu.org; Thu, 13 Feb 2020 09:16:03 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:39590
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j2FHe-0000me-1B
 for qemu-arm@nongnu.org; Thu, 13 Feb 2020 09:16:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581603361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1KIyTd1KNufXatXvynb29Zy6em2ZrIr5HGYCIBXf7/Q=;
 b=SK/pDUVrcVK3mnAG9suGYWipUH1lSWPUghnstf2NiYVPHNl9XLPl/LwnHBjQ4mV/e1r1IL
 mIl/gGed1C9NF3CwMRqSRytXdz9ES0NoBsqO2hH/J7O2EWCteEEMkDUxxY+ka/+mglygb4
 ++/U1BxpyNI5i3aYD2Wqh6B+W+Mjl3A=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-HhMaZAnjM8K6g4M4a29Kpw-1; Thu, 13 Feb 2020 09:15:58 -0500
Received: by mail-wm1-f69.google.com with SMTP id y7so2391871wmd.4
 for <qemu-arm@nongnu.org>; Thu, 13 Feb 2020 06:15:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=M7EQH5112ZLgoZmp0GZhZ+qjnFhTzRPphsDLuND2OfY=;
 b=g2Mm/q2yBrF5yko6EuaVRHnH3NH17YNA7Ec3+P2EtFAukxHTAJ128Y+NdwxNWVfsU7
 1E/v5bEt8lCBw6EGntUwKlpwbHuIEXLolk/gKko5k6RFaRFa5+0R422HpaBMbFNvFdEI
 xge0EAOgZF+lLxq3VZDD6+HlsyLDsI4cgr3dO/GKMEDwm/pUfa7FkRVt5J4aKG9diXAB
 oGXygaT0UUim8BwIR+8/Cm49Nd4b7KUXq+X3YKOo/Y8I0R4DQjxBng+NCgyQi9PzDb8h
 3h5b+EymT8/wTWYnpZlnCuuQ4wWNbdyiSj58A3y06NB7ZP/7DDH45AcL+ribkC/F/f7k
 EeKQ==
X-Gm-Message-State: APjAAAVAQHSmSm1mdjgcuoOCCscbGQsoK0250nAjylniFsisniakTNQO
 Bqzktti0N2BZUyUSNwDYyA03VVtHLd8Rvjqg6uHvXK6bwXL3zvLnwGGTha7BArtFe6VeMCu/zNZ
 lisO3uB/qozZi
X-Received: by 2002:a5d:5403:: with SMTP id g3mr23120258wrv.302.1581603356719; 
 Thu, 13 Feb 2020 06:15:56 -0800 (PST)
X-Received: by 2002:a5d:5403:: with SMTP id g3mr23120232wrv.302.1581603356480; 
 Thu, 13 Feb 2020 06:15:56 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id x21sm2956931wmi.30.2020.02.13.06.15.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2020 06:15:55 -0800 (PST)
Subject: Re: [PATCH v3 12/13] hw/arm/raspi: Use a unique
 raspi_machine_class_init() method
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Igor Mammedov <imammedo@redhat.com>
References: <20200208165645.15657-1-f4bug@amsat.org>
 <20200208165645.15657-13-f4bug@amsat.org>
 <CAFEAcA8e4NqwKPM6qx=vKm6NOz__=S90trhUuhaSNe_yJ8GeXg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0d72fad3-3eef-66ff-2162-f0c07ba01ff2@redhat.com>
Date: Thu, 13 Feb 2020 15:15:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8e4NqwKPM6qx=vKm6NOz__=S90trhUuhaSNe_yJ8GeXg@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: HhMaZAnjM8K6g4M4a29Kpw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Joaquin de Andres <me@xcancerberox.com.ar>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Esteban Bosse <estebanbosse@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +WMEY9auFLhd

On 2/13/20 2:59 PM, Peter Maydell wrote:
> On Sat, 8 Feb 2020 at 16:57, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>>
>> With the exception of the ignore_memory_transaction_failures
>> flag set for the raspi2, both machine_class_init() methods
>> are now identical. Merge them to keep a unique method.
>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> ---
>>   hw/arm/raspi.c | 31 ++++++-------------------------
>>   1 file changed, 6 insertions(+), 25 deletions(-)
>>
>> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
>> index 0537fc0a2d..bee6ca0a08 100644
>> --- a/hw/arm/raspi.c
>> +++ b/hw/arm/raspi.c
>> @@ -294,7 +294,7 @@ static void raspi_machine_init(MachineState *machine=
)
>>       setup_boot(machine, version, machine->ram_size - vcram_size);
>>   }
>>
>> -static void raspi2_machine_class_init(ObjectClass *oc, void *data)
>> +static void raspi_machine_class_init(ObjectClass *oc, void *data)
>>   {
>>       MachineClass *mc =3D MACHINE_CLASS(oc);
>>       RaspiMachineClass *rmc =3D RASPI_MACHINE_CLASS(oc);
>> @@ -311,41 +311,22 @@ static void raspi2_machine_class_init(ObjectClass =
*oc, void *data)
>>       mc->min_cpus =3D BCM283X_NCPUS;
>>       mc->default_cpus =3D BCM283X_NCPUS;
>>       mc->default_ram_size =3D board_ram_size(board_rev);
>> -    mc->ignore_memory_transaction_failures =3D true;
>> +    if (board_version(board_rev) =3D=3D 2) {
>> +        mc->ignore_memory_transaction_failures =3D true;
>> +    }
>>   };
>=20
> This isn't really the correct condition here. What we want is:
>   * for the board named 'raspi2' which was introduced before
>     we added the transaction-failure support to Arm CPU emulation,
>     disable signaling transaction failures
>   * for any other board, leave it enabled (whether that new
>     board is BCM2836 based or anything else)
>=20
> (This kind of follows on from my remark on patch 3: we should
> be suspicious of anything that's conditional on board_version();
> it should probably be testing something else.)
>=20
> The natural way to implement this is to have the .class_data
> be a pointer to a struct which is in an array and defines
> relevant per-class stuff, the same way we do in
> bcm2836_register_types(). That way the struct can indicate
> both the board revision number and also "is this a legacy
> board that needs transaction-failures disabled?".

IIUC Igor insists explaining that he doesn't accept anymore a=20
".class_data pointer to a struct which is in an array and defines=20
relevant per-class stuff" and we should not use this pattern anymore.

> The other approach here, as discussed on IRC, is that if
> we're confident we really have all the devices in the SoC
> either present or stubbed out with unimplemented-device
> then we could disable ignore_memory_transaction_failures
> for raspi2. (The flag is only there because I didn't want
> to try to do the auditing and fielding of potential bug
> reports if I changed the behaviour of a bunch of our
> existing not-very-maintained board models: the real
> correct behaviour in almost all cases would be to allow
> transaction failures and just make sure we have stub devices
> as needed.)

Yes, the plan is to add all the unimplemented peripherals (patches=20
ready, but out of scope of this series) and remove this flag.

> That said, this does give the right answer for our current boards,
> so I'm ok with taking this series if you want to address this
> in a followup patch.

If you are OK, I prefer to address this in a later series than delaying=20
this one more longer.

Thanks!

