Received: by 10.28.71.155 with SMTP id m27csp1868960wmi;
        Thu, 12 Apr 2018 05:50:41 -0700 (PDT)
X-Google-Smtp-Source: AIpwx48uP2iFFRTs8xPPMggHAzoGkx5Qw48e6Dg1rWJZFtIfOl6dOC88Z7u2DPh0q5TIpkLHnpaz
X-Received: by 10.55.159.204 with SMTP id i195mr1011431qke.188.1523537441436;
        Thu, 12 Apr 2018 05:50:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523537441; cv=none;
        d=google.com; s=arc-20160816;
        b=HDuii+20qKus/W+ghgLbyYRwurLVWBooBcbDgZCoINixqyNLF+IIyHRWBHmU1uz8GP
         evV77Czd/qdFflkIP88h46umHXukcPjW0okC/8zz6087pnl1l0lm8v2cYBarGReQwQI3
         KHpuRhjsejHWqxBOR+RkqZTZbH28oXfKjSv+qAJNFKtkeS2hZw4ud03CIv/udlbNZcGq
         0stgyUhgifL2KjBXJ9EuzDV2U1pwWoBCa0hRCZ/Wo4kMxFJU8YcEeZ0B3QR9aqNG0St8
         htBSZ18kbuX0tVALelnAloXWsbHbCbyyNDAWgE2ZSNzpzgb/VHLnL1usVx/rmEOK5gME
         ILTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=VHv9HmsWt/80//kwXZVhzwwg3fAwIwPL17IU/w340hA=;
        b=F+pNh/GUhuBX52Xaex32NB1rzcCA0QSFjsrMhK0UCKK1nKrVVrp/FrTKP8fhG2UjKc
         Gb6dA2aXtT+6Q6BlNZynqM+uTakxdtUpTroKfsocPy+NNy3VooafdSHrzPbqAzmvvUsi
         ijjT0IKy3BLrxsJjv+G09TrrX0AYMGlWJHv8wZsuJMLEck/Cf9f4PhbU6vIAWu55HlsD
         sHoXUUja9QpOa6MO/WV4yLryTgbnORafQ+lFYbqtUsR7EBvIcL1MU1kLCsAatLnKyQmU
         VAlWSNBqXoQT8M5zZ44ZUfTZ3z60kharIZY2fuXNThuiEn+qOvmNYN3W3/zT4kxVlL9l
         MMbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fBx/u0Ug;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h7si3998629qkb.485.2018.04.12.05.50.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Apr 2018 05:50:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fBx/u0Ug;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37209 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f6bgW-0003wM-Re
	for alex.bennee@linaro.org; Thu, 12 Apr 2018 08:50:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48752)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <geert.uytterhoeven@gmail.com>) id 1f6bgH-0003ty-Py
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 08:50:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <geert.uytterhoeven@gmail.com>) id 1f6bgG-0005c4-GK
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 08:50:25 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:33432)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <geert.uytterhoeven@gmail.com>)
	id 1f6bgG-0005bb-C0; Thu, 12 Apr 2018 08:50:24 -0400
Received: by mail-qk0-x244.google.com with SMTP id d206so5847691qkb.0;
	Thu, 12 Apr 2018 05:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=VHv9HmsWt/80//kwXZVhzwwg3fAwIwPL17IU/w340hA=;
	b=fBx/u0UgTA6TUBm5qSo6AJetOKgBLPTKJdVue2rTZO/Z3qMB+ExZoCc3yq2tbAzU3c
	gUgWlNzOUdxeFKbygHAVw5cR4cd66/xqXaX1Lat3XSabV4YRG4Tx1Kz+lnDBLbA08UiE
	eOxdAGHGLCXm1uK9ThYVx4582pPEpe2x4swJhnvEc4VMtzTJTpi4LJs/I6JCAu+b9e++
	Z+ofK1EKLeBQvMFYEULO5cGI3rUBj7ymgzqn2iCj8IXhc8GRRf3zhfNJb3b9D8dTUxIz
	oxh8zSGvUeptbOVOoUWFuEVF022cTCzHhZNx1eA/vNei+UbPGtw23PBBAYo2CT8Hw6e/
	03ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=VHv9HmsWt/80//kwXZVhzwwg3fAwIwPL17IU/w340hA=;
	b=slRMMU3fvLkONwNeY/DWAEt89e4K9hzxhG/dV+iTi9ThChQgNMa7+G13XyKP+ROx6t
	bidd7VEeb1pgay1X+svgU5AvbfF60TMpKeMWPRzzRr417Dl5ZrIG7WUY/6ZyD7U/EPWL
	HjdaOBrKPvG+7wJUilQZ1ADmPgDXLNXEFY4wA2A79UksaDLixfokUYWenLF2mX9YPQ71
	4THt9xeIVoDOMZwuBnMrZUjID6SQZ5TgteoFYSx60g3L6wpJ1YhwTNvTxHNWVJG3myby
	T6X4UdLMeCm7wy8IFa0LAiL7kzZHFvWBThMLXgtwE+5GkOdE9q3II7CreWTEe5KZTS81
	MACA==
X-Gm-Message-State: ALQs6tC7Mc872QTnud+oDsb6CG4uOGVpZjlBn9f9+neQbJYtAPG4Livk
	2M48vPD9+AzEIOsZj1JsVUla/XX2AfKVDG/FJxw=
X-Received: by 10.55.127.70 with SMTP id a67mr1007211qkd.328.1523537423397;
	Thu, 12 Apr 2018 05:50:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.23.67 with HTTP; Thu, 12 Apr 2018 05:50:22 -0700 (PDT)
In-Reply-To: <3ee22637-a0a9-306a-4e6d-14295d4bcb27@redhat.com>
References: <1518189456-2873-1-git-send-email-geert+renesas@glider.be>
	<1518189456-2873-4-git-send-email-geert+renesas@glider.be>
	<3ee22637-a0a9-306a-4e6d-14295d4bcb27@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Apr 2018 14:50:22 +0200
X-Google-Sender-Auth: ElyuCNcO4SDeUlw1cTYgpIXJIqY
Message-ID: <CAMuHMdUKLg2S-cySkN1_6esgt7ZEjqRwxHdB73i6+f9MaGjh6Q@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: Re: [Qemu-arm] [PATCH/RFC 3/5] hw/arm/virt: Allow dynamic sysbus
 devices again
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Arnd Bergmann <arnd@arndb.de>, Magnus Damm <magnus.damm@gmail.com>,
	Alexander Graf <agraf@suse.de>, QEMU Developers <qemu-devel@nongnu.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Xiao Feng Ren <renxiaof@linux.vnet.ibm.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xN0fDvn8Ke5k

Hi Eric,

On Wed, Feb 14, 2018 at 11:37 AM, Auger Eric <eric.auger@redhat.com> wrote:
> On 09/02/18 16:17, Geert Uytterhoeven wrote:
>> Allow the instantation of generic dynamic sysbus devices again, without
>> the need to create a new device-specific vfio type.
>>
>> This is a partial revert of commit  6f2062b9758ebc64 ("hw/arm/virt:
>> Allow only supported dynamic sysbus devices").
>>
>> Not-Yet-Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>>  hw/arm/virt.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index b334c82edae9fb1f..fa83784fc08ed076 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -1596,6 +1596,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>>      mc->max_cpus = 255;
>>      machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_CALXEDA_XGMAC);
>>      machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_AMD_XGBE);
>> +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_SYS_BUS_DEVICE);
> Couldn't you limit that to TYPE_VFIO_PLATFORM instead?

Yep, that works. Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
