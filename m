Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp2687427lfp;
        Wed, 20 Jul 2022 08:02:08 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s3Sm0LHjvgTof1s25zVj8td1FLDf1uY+WD/WA2tf2VUrX9QRqrYPQHzT+YjZ+86Q5b/Ol2
X-Received: by 2002:a05:620a:22fa:b0:6af:6c8c:32e8 with SMTP id p26-20020a05620a22fa00b006af6c8c32e8mr25362795qki.15.1658329328738;
        Wed, 20 Jul 2022 08:02:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658329328; cv=none;
        d=google.com; s=arc-20160816;
        b=mp4xBxIibM5EhwmkrcgfuLYoOAc25k+Ep/XYCGn9QH0NBDA5V68aAS3RqUU27bE7Pi
         MfNmfC8NCELewyeAqMIDhvJJhC8jLsh46z3Z7gVfPOTE8hPXRDVKLRHdmnB1wM/hToHQ
         C31dvbQP8g6QgH7XSZI7ekBGQwV31Xlth6pMq5yuX8Me1Qij2PHIDz4pza4PVwwdANdp
         5ucD24XOkcM5ck0u4lrwQ1JoWkoAo4XoeS0f/p8mC9Hb8CQfjzolXQhXQEir49qJ3HZq
         C0WGHv8dC+2aR5QKKumt48vNHvKoA93e+fDZwTZsimbABnmJ6MVl7X/6t8+fE4El6RhS
         gKvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:subject:from:references:cc:to
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=1arCLYwb2eDLWnAoD3w3EWOpYjUFPu5xujtmutryRO0=;
        b=fTkE1Iv4qN/msty81qrZZuBW/yxM5edWJTT20NzYSeasqnWYMSczombTtujFZ0Xkl7
         xmhC5Wg36cIzNELYME4ew9ngh2ODsRP+aUsZ+3VIZ1ZGMS8HAfnDjUBDDWBBbE76fVEQ
         i7BMBqn2uxVGm6VRX1aGaYws4nHrNrZOH/b5k1KWRzqDYppuEXcaUmbQ3n9mX7dqa1/F
         4a6chS2FRkIegURCLpaF00ulPpAIoHrpiPf7gFVA5BVPJxksZTxNUN5BspcJUeFkQjBT
         ffFjq4I2oqON3o94BzkMU34zsmEuZuKL2E0PsySTMYKMblN4cDPjDb12WeiHxuNPwdlW
         nszg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JpjjyDIe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c9-20020ac87d89000000b002f5b6d57d83si9652377qtd.24.2022.07.20.08.02.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Jul 2022 08:02:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JpjjyDIe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oEBDE-0003oQ-7O
	for alex.bennee@linaro.org; Wed, 20 Jul 2022 11:02:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oEBCl-0003iu-PD
 for qemu-arm@nongnu.org; Wed, 20 Jul 2022 11:01:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oEBCi-0001Bj-HM
 for qemu-arm@nongnu.org; Wed, 20 Jul 2022 11:01:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658329295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1arCLYwb2eDLWnAoD3w3EWOpYjUFPu5xujtmutryRO0=;
 b=JpjjyDIev+CvtUUv4Icqx/PBi3uCnU3byDz2A/2xYabP7XS0szTB4G3j3eISL2ZBEiUtL5
 HkuPeolDVnRcOqEH5Ij0JQ4C59orpDqMYKSI1F9pr+Kk5FBGaYv+SeXSC+XOCsdDdl/5Hp
 X4JDeVWNJSPF/9EwSj5goAhrJd8en1E=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-pV4Wjc79N9y6uPtURyZbeg-1; Wed, 20 Jul 2022 11:01:33 -0400
X-MC-Unique: pV4Wjc79N9y6uPtURyZbeg-1
Received: by mail-wm1-f70.google.com with SMTP id
 v67-20020a1cac46000000b003a2be9fa09cso8512485wme.3
 for <qemu-arm@nongnu.org>; Wed, 20 Jul 2022 08:01:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=1arCLYwb2eDLWnAoD3w3EWOpYjUFPu5xujtmutryRO0=;
 b=rf6g6c9uDgRUd27Uo1EWd/4TiZH7Wphcdzu8HsLXxd5Yo/xaXWjnTlzNCQNcpaO9ST
 CLQqMFWI+xMo9++H+WzFPLX6zIOZR/oSpPVIJzGahGxjZhJSMvXWXffvhUbIQTKsEyqV
 2ISEnO7jzXWIC8g0QNai79d1/LXVCadOTMbL7o60uuJV3RtQhqYWib2PmdBHV79x3Eh1
 FqafX1xUX1i7c26Gzh63U8mupPm7P9NxOdWpDXpvbuzJTD8jht3gutCgGrnsWuJfIALD
 8MqZQD99WoBj0XzS9Ua0/jI6/JV+uUg0fpHrIp4mWOiGhKcRJ8ZqmS9SkGPTizHNhxTc
 U9ew==
X-Gm-Message-State: AJIora9Ca1pjTl02n1g3LbZHg7ugsH+VShage2xmEmkeuVQyx9XPT1Zv
 e2OZJSd0MT38gXWhecc9KCuRSccndHTxsFW8F19AD9MngpKl8BSDS476RrfevahRUJ4zlzDJpVT
 bYe/XcfVt3GfS
X-Received: by 2002:a05:600c:a03:b0:39e:4f0c:938c with SMTP id
 z3-20020a05600c0a0300b0039e4f0c938cmr4236531wmp.145.1658329292511; 
 Wed, 20 Jul 2022 08:01:32 -0700 (PDT)
X-Received: by 2002:a05:600c:a03:b0:39e:4f0c:938c with SMTP id
 z3-20020a05600c0a0300b0039e4f0c938cmr4236468wmp.145.1658329292044; 
 Wed, 20 Jul 2022 08:01:32 -0700 (PDT)
Received: from [192.168.8.104] (tmo-096-80.customers.d1-online.com.
 [80.187.96.80]) by smtp.gmail.com with ESMTPSA id
 z3-20020a1cf403000000b003a0323463absm2617055wma.45.2022.07.20.08.01.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jul 2022 08:01:31 -0700 (PDT)
Message-ID: <103112d1-7a5f-6457-56ae-fed0d6a80646@redhat.com>
Date: Wed, 20 Jul 2022 17:01:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel <qemu-devel@nongnu.org>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 "qemu-ppc@nongnu.org list:PowerPC" <qemu-ppc@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Brad Smith <brad@comstyle.com>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>, qemu-s390x <qemu-s390x@nongnu.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>
References: <20220704064254.18187-1-thuth@redhat.com>
 <20220704064254.18187-2-thuth@redhat.com>
 <CAJSP0QUx8456jPp4=MOjRwZMPrBYgU1669HnEpC_+gDobhOiCQ@mail.gmail.com>
 <YsKvalrPIO96wWuP@redhat.com>
 <aacf7432-6f0b-b8f7-bdc4-116e3873543c@redhat.com>
 <YsLEz8Qj3QmaISxF@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 1/3] scripts/make-release: Do not include the edk2 sources
 in the tarball anymore
In-Reply-To: <YsLEz8Qj3QmaISxF@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m0WADadKwKI1

On 04/07/2022 12.45, Daniel P. Berrangé wrote:
> On Mon, Jul 04, 2022 at 11:37:11AM +0200, Thomas Huth wrote:
>> On 04/07/2022 11.14, Daniel P. Berrangé wrote:
>>> On Mon, Jul 04, 2022 at 08:26:34AM +0100, Stefan Hajnoczi wrote:
>>>> On Mon, 4 Jul 2022 at 07:45, Thomas Huth <thuth@redhat.com> wrote:
>> ...
>>>>> +cat > sources.txt <<EOF
>>>>> +The edk2 sources can be downloaded from:
>>>>> +
>>>>> +https://github.com/tianocore/edk2/archive/${edk2rev}.tar.gz
>>>>
>>>> Please use QEMU's edk2 mirror:
>>>> https://gitlab.com/qemu-project/edk2
>>>>
>>>> QEMU mirrors all dependencies so that even if upstream projects go
>>>> offline we can still rebuild all of QEMU from source.
>>>
>>> Note that the github/lab generated tarballs are not signed, while
>>> QEMU's release tarballs are gpg signed, so from that POV this would
>>> be a regression no matter which site we point to.
>>
>> Maybe we should point to the edk2 release page instead? I.e.:
>>
>>   https://github.com/tianocore/edk2/releases
>>
>> Anyway, it's IMHO certainly not *our* job to provide signed edk2 sources here.
>>
>>> Also it would need more guidance on what to actually do with the
>>> tarball, as if you merely unpack it into this dir, it won't work
>>> as it will be one level of dirs nesting too deep for QEMU's
>>> build scripts to work.
>>
>> I could add some wording how to use the edk2-build.sh script with a
>> downloaded edk2 tarball if that helps ... not sure whether it is really
>> required, though, we also don't provide instruction for building any other
>> firmware yet, as far as I know.
> 
> Well my thought is that currently you can do  'make -C roms efi' from
> the unpacked release tarball, and with this change, that no longer
> works. So we ought to explain what to do to get that working again.
> 
> This doesn't neccessarily means docs. It could just be 'make' prints
> out an error telling people what to do, or figure it out itself.
> 
> If we split off the entire of the 'roms' directory into a self-contained
> firmware-src tarball, the 'roms/Makefile' would still "just work".

Sorry for the late reply, I've been pondering about this for a while and was 
busy with other stuff...

So I think I tend to agree - if we still want to ship the edk2 (and skiboot) 
sources, it's likely best if we put all roms/* sources into a separate 
tarball. Maybe even split the roms folder into a separate git repository.

However, there's at least one minor obstacle: The sources of the s390-ccw 
bios (in pc-bios/s390-ccw) currently partly depend on the roms/SLOF sources 
to be available for the full build. So if we slice out the roms/SLOF stuff, 
we should likely move the s390-ccw bios also to same location...

I guess it's now too late for 7.1, so I'll postpone my further work on this 
to the 7.2 release cycle.

  Thomas

