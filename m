Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp629293lfq;
        Thu, 1 Oct 2020 08:05:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyS3ObqAeXNo1DN6mGLk5BzAO5dY5xA46r6+m6Rs/zBiM4YjKCQYOtSMfOfv0V/iwHVzdkw
X-Received: by 2002:a25:b57:: with SMTP id 84mr11080222ybl.339.1601564712894;
        Thu, 01 Oct 2020 08:05:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601564712; cv=none;
        d=google.com; s=arc-20160816;
        b=GfUvJgIaTruKFyINnutqGXSjzjqm351hpv2aF7SvMmQJ3dG7faBOreP8YS1CjVDdpN
         CBYRRIbzXZGcM1X839N3yt3zTll8jTPH0JzeS46e/M85Rj87P9IFR7sHFW2vF0BT22/m
         Go96elbspl/fBrCl8V/TymKYLHhhiGvR5YQX5JP+IO1AkDcqC+E4BNSV4U9ufz2a2xFT
         OGKx1Vsru6Zxvv91T+IAgUbdepuUcsiZNcN9av8fFmPybK+Qt6aCEz7E3qjx5t7S55Vc
         8DVmWeSClGlZxvZWL7EGyW0HpSk3L7BzWMiTj8XmP8b0wn6iCk2EGRdw9n83wsMiiPDX
         9EUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=ozwahTrh0gYx3QGzy7JSLi5eTBpyC4YR/nZOoeypAXs=;
        b=RfTRJm+7mS1cUy/sYH5s3uNFPX0Rx+o40kpGemMgHFU0H019gFgUiFoLW/lP2drSgX
         KBn0OeWVDpsy3EHeNo7eVW1hkLggRrRyXk4ckuXWYph56GhV+gwL3P1sYOIk3+XJPJDT
         4BPuLLTn8fmnbTlPkLJrgNd6i1ZOtAOgWpei8qZt8SChKikBlDADZyyhPKczTRS0Vtxn
         FzO2ycIH2sI4EhBXZJt4BXSIKAFeSRK0C0V5p1sywB+oKMRJ449Zdr+J7UrEID3JBsPd
         vuRm6JnPCmMumzYKfv4xCcsbRa+4pSzo+tcDo15bFQVHMGluzpM+d3AdkEmlnCsfF8WV
         VOog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JpAZxOaf;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [63.128.21.124])
        by mx.google.com with ESMTPS id d30si4741528yba.309.2020.10.01.08.05.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Oct 2020 08:05:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) client-ip=63.128.21.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JpAZxOaf;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601564712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ozwahTrh0gYx3QGzy7JSLi5eTBpyC4YR/nZOoeypAXs=;
	b=JpAZxOafp8Q4tp9g/mUVLUcZgcw3I55F8nd3h54hz1mRpuDtV6uF7/DT2jEpU9yaKrE2jt
	7gYQiO0NDgsnealF8iUzSVMMhJGpby2zzmUzasrTfcyZcmX7Wv5621Z3GGm5BaDtzHgTlL
	uwU5FSDesdeT9TVayigFPB/HfbK6Ga0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-5BvN4Ml-MTiFOLFe2J_cpA-1; Thu, 01 Oct 2020 11:05:08 -0400
X-MC-Unique: 5BvN4Ml-MTiFOLFe2J_cpA-1
Received: by mail-wr1-f72.google.com with SMTP id b7so2177288wrn.6
        for <alex.bennee@linaro.org>; Thu, 01 Oct 2020 08:05:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ozwahTrh0gYx3QGzy7JSLi5eTBpyC4YR/nZOoeypAXs=;
        b=EDSqSVWJ2UqOxVsT2xki08tNb86CbBMpWofaTBPbW+m19jFZzhr034W1tDOoyvkkpF
         69iZvmzIwf7/85VqJ4GqK1gkiIhlgo6GgII+gj4d5yE5rIhwT+KH9QE2L9VHSw89TaqJ
         4aiV5saVIiUKF/a5CInFnduOyFyAgdqNA1sa2rQCmhZWcYBdp8v0vj4CzS8s1LnJn9Jr
         AUZHZNRQiL7dW+jqa98SFrlG+wPx8nJVp0J0xXGqyCtb+W3pt+3DaBhjtaEDcu2fydPt
         Hb8ftxMBAXA2a8AA/5MpwXQRDBfMIs5ekYgyTJ01HaahWe1QnISoBBToS+2Ap4ySiMex
         9/Gg==
X-Gm-Message-State: AOAM532nzvkAhBUHUluijr590Chnv1haj4s2bUXzbD3BMa5Ub8e/OU4a
	4ekXZvGJ/8b33tYAi/xZuX/kiAE8OQ458LjjAd+7c1ummR/0djZkb7KU88JGCUn01NmG62/b4sY
	5BgRlgA/hWp3PVLWZ
X-Received: by 2002:adf:81e6:: with SMTP id 93mr9525007wra.412.1601564707469;
        Thu, 01 Oct 2020 08:05:07 -0700 (PDT)
X-Received: by 2002:adf:81e6:: with SMTP id 93mr9524971wra.412.1601564707106;
        Thu, 01 Oct 2020 08:05:07 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (74.red-83-53-161.dynamicip.rima-tde.net. [83.53.161.74])
        by smtp.gmail.com with ESMTPSA id x16sm9856874wrq.62.2020.10.01.08.05.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2020 08:05:06 -0700 (PDT)
Subject: Re: [PATCH v3 17/19] hw/arm: Automatically select the 'virt' machine
 on KVM
To: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 kvm-devel <kvm@vger.kernel.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Fam Zheng <fam@euphon.net>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20200316160634.3386-1-philmd@redhat.com>
 <20200316160634.3386-18-philmd@redhat.com>
 <CAFEAcA-Rt__Du0TqqVFov4mNoBvC9hTt7t7e-3G45Eck4z94tQ@mail.gmail.com>
 <CAFEAcA-u53dVdv8EJdeeOWxw+SfPJueTq7M6g0vBF5XM2Go4zw@mail.gmail.com>
 <c7d07e18-57dd-7b55-f3dc-283c9d13e4b5@redhat.com>
 <8253ddd7-3149-17d9-1174-6474c4bde605@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <36629bed-9b32-01a0-fdc2-831b10e4bad9@redhat.com>
Date: Thu, 1 Oct 2020 17:05:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <8253ddd7-3149-17d9-1174-6474c4bde605@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: T7Oj8q/uGdxt

On 10/1/20 9:38 AM, Paolo Bonzini wrote:
> On 29/09/20 22:36, Philippe Mathieu-Daudé wrote:
>> Yes, the problem if I don't restrict to KVM, when
>> using the Xen accelerator odd things occur
>> (using configure --enable-xen --disable-tcg --disable-kvm):
>>
>> Compiling C object libqemu-i386-softmmu.fa.p/hw_cpu_a15mpcore.c.o
>> hw/cpu/a15mpcore.c:28:10: fatal error: kvm_arm.h: No such file or directory
>>
>> See
>> https://wiki.xenproject.org/wiki/Xen_ARM_with_Virtualization_Extensions#Use_of_qemu-system-i386_on_ARM
> 
> I don't understand.  Is Xen adding CONFIG_ARM_VIRT=y to
> default-configs/i386-softmmu.mak??

No, this is when using:

 config ARM_VIRT
     bool
+    default y

I had the understanding devices in hw/$BASEARCH would be only
included for $ARCH, but I was wrong, any arch kconfig-include
the devices of the other archs.

I tried the following diff which doesn't build because various
devices in *non*-archdep folders use arch-specific Kconfig values:

-- >8 --
diff --git a/meson.build b/meson.build
index 9ab5d514d7..cfe19d0007 100644
--- a/meson.build
+++ b/meson.build
@@ -575,6 +575,7 @@ foreach target : target_dirs
     if fs.is_file(target_kconfig)
       minikconf_input += [target_kconfig]
     endif
+    minikconf_input += 'hw' / config_target['TARGET_BASE_ARCH'] / 'Kconfig'
     config_devices_mak = configure_file(
       input: minikconf_input,
       output: config_devices_mak,
diff --git a/hw/Kconfig b/hw/Kconfig
index 4de1797ffd..64c120175a 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -41,29 +41,29 @@ source vfio/Kconfig
 source watchdog/Kconfig

 # arch Kconfig
-source arm/Kconfig
-source alpha/Kconfig
-source avr/Kconfig
-source cris/Kconfig
-source hppa/Kconfig
-source i386/Kconfig
-source lm32/Kconfig
-source m68k/Kconfig
-source microblaze/Kconfig
-source mips/Kconfig
-source moxie/Kconfig
-source nios2/Kconfig
-source openrisc/Kconfig
-source ppc/Kconfig
-source riscv/Kconfig
-source rx/Kconfig
-source s390x/Kconfig
-source sh4/Kconfig
-source sparc/Kconfig
-source sparc64/Kconfig
-source tricore/Kconfig
-source unicore32/Kconfig
-source xtensa/Kconfig

 # Symbols used by multiple targets
 config TEST_DEVICES
---

> 
> (By the way, there are duplicate Kconfig symbols between target/arm and
> hw/cpu, they could/should be removed from target/arm).

I'd rather define Kconfig entry where the model is, so in this case
keep them defined in hw/cpu/Kconfig and remove dup entries from
hw/arm/Kconfig (if Peter is OK with that).

> 
> Paolo
> 
