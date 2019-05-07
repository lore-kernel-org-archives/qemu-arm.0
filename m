Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp3535443wrh;
        Tue, 7 May 2019 04:52:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx2Q+2Gh5qiNZNEyomNVZpNSjjEsY4IMNigojV7w4a1ELbhFryJ/9uop7GbykFl+1Hj0K7F
X-Received: by 2002:adf:e911:: with SMTP id f17mr11770802wrm.105.1557229940032;
        Tue, 07 May 2019 04:52:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557229940; cv=none;
        d=google.com; s=arc-20160816;
        b=nkeqXWPNn7zb4pESPnNRT4b42RKKLTzQ5sBtoDuauSK1SUPVYGZADMowbNJDbQcuQ3
         5L45+NVYR8N6lqjM7q6CcfSfYX56kJR2xbmV1kWBaR3QyCcREfQkucipIROy5cv3E/Lt
         USg7l3ReFZrXlnm/ZIUyTuZajSiYnAvr4phgnNhuB3pFNRERwKSgcmePEWi1ylxSZsF0
         0mb+8YL32PJiD1uNqpTG2AQ33p+rHbl6NHX8bpuGNTsmvkSsdkT/nNJZJrcmMi0szzle
         3ZIpe5sFfSIAq9bI2aJcmp9whXzn47MGFS7a0VABFhjSxmv7uMJDMxRStEjzDK+VUHXL
         dYBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=/EBS7iRBKJaqM8lv7Uj3G99Ur4RgVkx+e/YAofFvGDM=;
        b=nwD2MDPgPUGXDF/mAmBP/aVmFJ6T1OIemLf3ZPOQdNdap8t+fJZ718axJA2enQvET/
         STCFpWx4+13oU4QFtCvewHCafIibPjoZxiDOv3FKka4LDWOeThiThKqssP8L+y9gUe8e
         0HsHSvUwoY7gPhMFsFTiXv9ZG3uIMDT22gj8i5nc3iWXNnyaY1UCbMAU1mdsOGftQjRV
         37ISgRPFGaEz3GetTYY8ggH2EiMYCs8a8yjnZnsz+yQ2Kr4knb36T0EvVmSeBLQfQUx+
         0ZNWQ8WwnZOlyPQNyBtZ4Heo/sjiNTHOL6nY37KBZgRs0vsvYvVkVnl2ROkDESzIvi8n
         SF9w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t24si8580894wmh.125.2019.05.07.04.52.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 May 2019 04:52:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:45122 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hNydv-0005ji-3t
	for alex.bennee@linaro.org; Tue, 07 May 2019 07:52:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43339)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hNydl-0005jY-HE
	for qemu-arm@nongnu.org; Tue, 07 May 2019 07:52:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hNydk-0007Gw-Az
	for qemu-arm@nongnu.org; Tue, 07 May 2019 07:52:09 -0400
Received: from mail-wm1-f41.google.com ([209.85.128.41]:55843)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hNydk-0007GJ-4c
	for qemu-arm@nongnu.org; Tue, 07 May 2019 07:52:08 -0400
Received: by mail-wm1-f41.google.com with SMTP id y2so19757434wmi.5
	for <qemu-arm@nongnu.org>; Tue, 07 May 2019 04:52:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=/EBS7iRBKJaqM8lv7Uj3G99Ur4RgVkx+e/YAofFvGDM=;
	b=bFbT71Tt6qw+0SnhaffpDMwxlQX1aodFZ6FgSQLxbeaSSYUPkSwA2QSXGFbW2zNfbF
	bEJ2hicdNq+EW0MNdEbN+1aaQRoZTF7rMkTSFNL0mT10RhvxfFA+BdHB7tqKqQt7upc7
	XLP1bAMaCCnNMRQCC7rj6MChFPQvdc31/CKXJuNx/ONGABjqL2lppb9Dr2mppD/TbqZH
	O3tAzEv8LqKKfWvS21iANJmu9xBqthxcW5ug+iRffPGhR9Zz7ehx7B4AOepUoMmb4h+6
	f/ISEp5OBUTtwnezNOPDC82eerYSKCrEoqPUd8YSlaI1WiGhpuTCQjp9sGEiZNvU6bD/
	leQA==
X-Gm-Message-State: APjAAAVIn9vHCA256H2vbi1iEjNaC21UT8xL2vHJEY3N+kzWj7suRysb
	q/ZwC0syXgENQheLGZrnX40ATA==
X-Received: by 2002:a1c:eb03:: with SMTP id j3mr21013661wmh.15.1557229926781; 
	Tue, 07 May 2019 04:52:06 -0700 (PDT)
Received: from [192.168.1.33] (193.red-88-21-103.staticip.rima-tde.net.
	[88.21.103.193]) by smtp.gmail.com with ESMTPSA id
	w14sm11619393wmi.2.2019.05.07.04.52.05
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 May 2019 04:52:06 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>
References: <20190505135714.11277-1-thuth@redhat.com>
	<CAFEAcA_utmcMFAmaGL5CJm4erBg2dZWZpdGvETRqVukOxrdpPg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <c304a9df-1b8e-8f15-1daf-6e916dca3743@redhat.com>
Date: Tue, 7 May 2019 13:52:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_utmcMFAmaGL5CJm4erBg2dZWZpdGvETRqVukOxrdpPg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.41
Subject: Re: [Qemu-arm] [Qemu-devel] [PULL 00/28] Kconfig for Arm machines
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2ehDAjbYAIMF

On 5/7/19 1:01 PM, Peter Maydell wrote:
> On Sun, 5 May 2019 at 14:57, Thomas Huth <thuth@redhat.com> wrote:
>>
>>  Hi Peter,
>>
>> the following changes since commit a6ae23831b05a11880b40f7d58e332c45a6b04f7:
>>
>>   Merge remote-tracking branch 'remotes/ehabkost/tags/python-next-pull-request' into staging (2019-05-03 15:26:09 +0100)
>>
>> are available in the Git repository at:
>>
>>   https://gitlab.com/huth/qemu.git tags/pull-request-2019-05-05
>>
>> for you to fetch changes up to 55e5578fabf744e62038f7357369a68e460fe205:
>>
>>   hw/arm: Remove hard-enablement of the remaining PCI devices (2019-05-03 17:06:20 +0200)
>>
>> ----------------------------------------------------------------
>> Kconfig settings for the Arm machines
>> ----------------------------------------------------------------
> 
> Hi Thomas. My test setup that does 'make clean' before the build
> failed in 'make check':
> 
> MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
> QTEST_QEMU_BINARY=i386-softmmu/qemu-system-i38
> 6 QTEST_QEMU_IMG=qemu-img tests/ahci-test -m=quick -k --tap <
> /dev/null | ./scripts/tap-driver.pl --test-name="a
> hci-test"
> qemu-system-i386: Unknown device 'ich9-ahci' for bus 'PCIE'
> Broken pipe
> /home/petmay01/linaro/qemu-for-merges/tests/libqtest.c:143:
> kill_qemu() detected QEMU death from signal 6 (Abort
> ed) (core dumped)
> Aborted (core dumped)
> ERROR - too few tests run (expected 74, got 0)
> /home/petmay01/linaro/qemu-for-merges/tests/Makefile.include:903:
> recipe for target 'check-qtest-i386' failed
> 
> (all the builds that are just incremental without the 'make clean'
> worked ok). Any idea what's happened here?

You found a bug in hw/i386/Kconfig :)

I noticed this while working on refactoring ICH9 for the Boston board,
but didn't expect the Q35 machine would suffer the same issue.

The quick fix is:

-- >8 --
diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
@@ -80,7 +80,7 @@ config Q35
     select PC_ACPI
     select PCI_EXPRESS_Q35
     select LPC_ICH9
-    select AHCI
+    select AHCI_ICH9
     select DIMM
     select SMBIOS
     select VMPORT
---

I'll send a patch.

Regards,

Phil.
