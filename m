Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp433440lfe;
        Mon, 16 Mar 2020 12:00:37 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsELMHfNFAWDPdBpjgXYKTbLFIaIIwTsaequpG8nWuepOHKFT/Y82kQm4dJ931g+VKRnO+T
X-Received: by 2002:a1c:f71a:: with SMTP id v26mr519539wmh.19.1584385237222;
        Mon, 16 Mar 2020 12:00:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584385237; cv=none;
        d=google.com; s=arc-20160816;
        b=RzXFYL5UWfXtIUD234ecIf/fsd7zb9n2C9mGEUhN2vmtFoGHdQ1uUZQbnz4F+GykYv
         VSn/MOu5L8rAdn0n8kjkCnNAXcYlgOf0YHgUe31zYJ12koU2fXLJu4g805JbEXAEXeBO
         StszCmoyMAgAQNGfIWJo2KuLgH2sM+2kt1U9PJ/0OwosqP6Q/fMk/o0ggxPcCyfCszGA
         2EfPIjCA0sO/9M4ro6KvFHMMSzESUrhJgroEh+1Uh7R6UArLoXqNiym1nmSmT5mqZ54N
         3V6p5QGyCka5TEPM8JE+av054SwIehh9SSEGtDuz7qqSqwc+l0x6V3K0wvr4HFhSPYF+
         2IDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=GTcwy5EcrKMKytC/WSeHnaZ/vMtgK6arLEK3I1pmChw=;
        b=HDu7SHTZkUUMiTYShdLVLNdWB4ECm0Mp0XYzwMWf68N0/RcD8zL2/MtFSGULxW4fQ7
         xtBRPauMHRs7MsSbnM8l6xLelxkzBAa7II6Mz2ivOCtuUSmX8i35tudHZRhXcMtQO8Cw
         F6f1G2/L/Pnvk23q2vDk8Hvb/e0DQnboTutVgIVv8t8Bq2q9hSp0+BSeYUbCt6HPXhWw
         65BZIf6R/aCK7JwaQtpvUWU51lfhEQXEdPQZyd5pzTtohhsoGX5RR2rhw0Fga1uJAINk
         eOC+PphhJV73TIt6CZea9nyUG2nro8fQszj1HH1EEBpSIrZmgsxHlLmIaD6T83Q9O/CL
         e0+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NN72+LGO;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com. [216.205.24.74])
        by mx.google.com with ESMTPS id w66si324009wmb.73.2020.03.16.12.00.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Mar 2020 12:00:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.74 as permitted sender) client-ip=216.205.24.74;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NN72+LGO;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584385236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GTcwy5EcrKMKytC/WSeHnaZ/vMtgK6arLEK3I1pmChw=;
	b=NN72+LGOf12SY1mZEprA6Gk+rRWNm8zwMfpXw+kttMMgB4leWh79lfgam3eYVAXvl7fARY
	eBW2BdbmzneTirkrLFlLnEP4trHRbCTJ5wHNj1KCZidmuDoxmjtcvuuthui2QcQ/KbgHsk
	bs9RQgxKDTRkXcYmWpf5Ju2+XkD4mio=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-kN9aNuOwNQ2B9Dg3dgeb6Q-1; Mon, 16 Mar 2020 15:00:29 -0400
X-MC-Unique: kN9aNuOwNQ2B9Dg3dgeb6Q-1
Received: by mail-ed1-f70.google.com with SMTP id u4so1077380edo.21
        for <alex.bennee@linaro.org>; Mon, 16 Mar 2020 12:00:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SBoLIS60m/R8vVlNjtCKtaSpPA1mtOn0IkBdkHi07aA=;
        b=A9bJxhFhs/e8LvRmUM4Le9RiTp3+C29dqdrj2dmQB1ukby08ZUeREsvKO2uTVX+30A
         ORok01f6q0Q7d3FRUaMlcBSUWQ4Lr4Mh/P4UuJfauM4ClXEr4ZWHnMZz33e3ZppDwaGY
         08v/vx79cHxhdmL7FrVxwqTVVHZ9+eEpjhm6jOaInNVny2bt9DGzE7szesodZSCV86Dv
         MU+mfcotFelz3aiv5PivtCaSvbgnvIkjZva6RloLy1x5g5UDiD7VxoCBvAVP9w0L8oge
         jV6oS55QW0xSvh/icRroPdeZiwsD4T/caUed2nH/q+C8oq2fIfeaYMLher6tvt0Q6P5Q
         eDZw==
X-Gm-Message-State: ANhLgQ3VyAL4EChksK9oecU4VQwrV/wsinggrlKJsJfaGP4QQ/q5SePW
	ZF3qTxznWQ12URqfJE5Q8MufZM7E3RqU50MC97gQ6sPc3ukuTJUYCZ1aL15sT3BOyMVueBfijwO
	3VE1QNQ79QLF/gD6A
X-Received: by 2002:a05:6402:180a:: with SMTP id g10mr1396193edy.352.1584385228628;
        Mon, 16 Mar 2020 12:00:28 -0700 (PDT)
X-Received: by 2002:a05:6402:180a:: with SMTP id g10mr1396167edy.352.1584385228380;
        Mon, 16 Mar 2020 12:00:28 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.34] (96.red-83-59-163.dynamicip.rima-tde.net. [83.59.163.96])
        by smtp.gmail.com with ESMTPSA id d9sm50792ejc.79.2020.03.16.12.00.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2020 12:00:27 -0700 (PDT)
Subject: Re: [PATCH v3 18/19] hw/arm: Do not build to 'virt' machine on Xen
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 kvm-devel <kvm@vger.kernel.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Fam Zheng <fam@euphon.net>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "open list:X86" <xen-devel@lists.xenproject.org>
References: <20200316160634.3386-1-philmd@redhat.com>
 <20200316160634.3386-19-philmd@redhat.com>
 <CAFEAcA_bXb_RZFxMSYJ8FAoAahAxrq3c0PBzidu+Z0iXTzZqFw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9a627400-c8bd-fcee-8cf8-9896c5b3760f@redhat.com>
Date: Mon, 16 Mar 2020 20:00:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_bXb_RZFxMSYJ8FAoAahAxrq3c0PBzidu+Z0iXTzZqFw@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: bTg2JdQ733gR

On 3/16/20 6:11 PM, Peter Maydell wrote:
> On Mon, 16 Mar 2020 at 16:08, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com> wrote:
>>
>> Xen on ARM does not use QEMU machines [*]. Disable the 'virt'
>> machine there to avoid odd errors such:
>>
>>      CC      i386-softmmu/hw/cpu/a15mpcore.o
>>    hw/cpu/a15mpcore.c:28:10: fatal error: kvm_arm.h: No such file or dir=
ectory
>>
>> [*] https://wiki.xenproject.org/wiki/Xen_ARM_with_Virtualization_Extensi=
ons#Use_of_qemu-system-i386_on_ARM
>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> ---
>> Cc: Stefano Stabellini <sstabellini@kernel.org>
>> Cc: Anthony Perard <anthony.perard@citrix.com>
>> Cc: Paul Durrant <paul@xen.org>
>> Cc: xen-devel@lists.xenproject.org
>> ---
>>   hw/arm/Kconfig | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
>> index 8e801cd15f..69a8e30125 100644
>> --- a/hw/arm/Kconfig
>> +++ b/hw/arm/Kconfig
>> @@ -1,5 +1,6 @@
>>   config ARM_VIRT
>>       bool
>> +    depends on !XEN
>>       default y if KVM
>>       imply PCI_DEVICES
>>       imply TEST_DEVICES
>> --
>=20
> This seems odd to me:
> (1) the error message you quote is for a15mpcore.c, not virt.c

This is the first device the virt board selects:

config ARM_VIRT
     bool
     imply PCI_DEVICES
     imply TEST_DEVICES
     imply VFIO_AMD_XGBE
     imply VFIO_PLATFORM
     imply VFIO_XGMAC
     imply TPM_TIS_SYSBUS
     select A15MPCORE
     ...

> (2) shouldn't this be prevented by something saying "don't build
> guest architecture X boards into Y-softmmu", rather than a specific
> flag for a specific arm board ?

Yes, agreed. This surgical change was quicker for my testing, but we=20
don't need this patch right now, so let's drop it.

>=20
> thanks
> -- PMM
>=20
