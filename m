Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp9555613wrx;
        Sat, 9 Mar 2019 06:57:55 -0800 (PST)
X-Google-Smtp-Source: APXvYqyzPIRRx2qSs0msv7kYNffpA7sLhkfYeM/wcdkeyqG25b86tAqwxqD65PGYoUHGCZ03hh6/
X-Received: by 2002:a25:56d5:: with SMTP id k204mr11776529ybb.216.1552143475416;
        Sat, 09 Mar 2019 06:57:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552143475; cv=none;
        d=google.com; s=arc-20160816;
        b=KkHS/mCgpPx+4yMoEqSK9KPLS2hvCrGUvVW6l2N2kVrpsSp3YYsggSUFYDdhscxNfI
         3MHd7fbRlVnetRAAtxu/MIQv4+6C54uD+YG8TmAca7Ps9zkw5bQbXd4Rlw4D/dwyPW+q
         ZXWe0kr32GjyPmAYgnDXsUx8mAb8TRJLRojR2zzU8xknK8V3T3f5dJmuD6zthZMcSTUB
         aiSMCEZTqR1OhXovDWM0GUmWwHVwCevr0f84IlzNGy2wlE1kIq6ycwv8swClXu8zf1ew
         yZc5m5IVsaLQbY2Aj65ZHwVfgAgOORyba7g1PB2C//iRGof5p6jD5E2curHfuvlUygP9
         WJBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to;
        bh=uUtt/XjNZp5PY4EwSpEOOgUksjtwIr+usKgmmnedfIM=;
        b=qY3CcreB9vh/sIi35hGrdI3vbLFqgctfnF+h6bkfQSOgUpIgOnOd8bm9MEhYwH3Yv9
         qoJzrnNx5zxDQXRa9uyOqLWu5b7g5Cyp2DGMtVAmqT3W1HUM39dRkFPEttGT8IFMsYjN
         5Gfe7NUA2q7iPKdZUQbWnjBUHiaSZxG5PYYOPp2HOpgfrk0BttY66kQ8L4vCJNrLcFup
         afmam/SSWc8OIuh/sM/bjxJ3g6efXclz8uRI0ObIe37BwFGzvwIC9VWU9x/O28CrVi6n
         Cb9IaTaNwXuEDwqKHSp1PVYJYsAfsa415/Rb65xbZe391EHRPN+cWeYuVhirwrouq6BT
         lvPw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j139si308764ywg.370.2019.03.09.06.57.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 09 Mar 2019 06:57:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:60008 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2dQA-0003UA-Sv
	for alex.bennee@linaro.org; Sat, 09 Mar 2019 09:57:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53960)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h2dOl-0002Ut-7J
	for qemu-arm@nongnu.org; Sat, 09 Mar 2019 09:56:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h2dOk-0007QV-BB
	for qemu-arm@nongnu.org; Sat, 09 Mar 2019 09:56:27 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:33915)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1h2dOg-0007NF-MJ; Sat, 09 Mar 2019 09:56:22 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
	1N5VPg-1gzhXt1dE2-016xL0; Sat, 09 Mar 2019 15:53:55 +0100
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
	<philmd@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-devel@nongnu.org
References: <20190308013222.12524-1-philmd@redhat.com>
	<20190308013222.12524-7-philmd@redhat.com>
	<37ef3c6b-e99e-859e-2324-9c59ff6bc1f8@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <596ed94c-5121-06d5-e3e4-b4270bdf660b@vivier.eu>
Date: Sat, 9 Mar 2019 15:53:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <37ef3c6b-e99e-859e-2324-9c59ff6bc1f8@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:3LFYYRldEB4QLremQC0nMhuIaGgAWbUcm1dao5lWFxQFin3Kf2V
	E63KCAUr0O8dl0GN8Am5A6ymAMGRvQoSkeM6LXa/oLFQDr2MyCLvsj8ywXGd3gE2ByxoF2a
	0Zw1aVX1bdTrmpO6ra9UtirZZ1OWAwIAX7Jqix5jPP5oh1AA4LVhC/onSND1JZ6HOPuVSA/
	JlA4CsZdvQjbTQoBsoW9g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UGKXZ/BBkdU=:/DPjl3oPjHv3Z+g2f/OflL
	WX4otcfpYVyss5kvaf9bl5SxQYDK4hbWX2jjoSnFpCHre+kq02X9j2mOFA23z2D9Mb1ZB2ve/
	H8tQd7N44dDUFrLCwfRkXsAWtoBrAZKDQHk/0XKOzvOj76VIaJu1+zG129MB7ZeCejwUnAsyT
	d4EqRSNZXzOw2mVURx2KKLo2wV7MJjMaqwsFoVgjFVb4Z40t8DN5rqw0eDnIb4KCWhNVwdaUA
	T6qReFqUEs2p58oMILWrreDriAMvlTYj0ie4zV/dmI+YRDED+ndtgXM4WvRTxOG+yq+olyzxI
	cT02rBAUWoo7IOg8rcNbXTscLy+SbxAwxLjHiV0KvYr/Bus/cu+mKLFI3hMChmKTciaQPSjGh
	0T+9iji5Pl/m6UnJi1yP22xrc0i3cPTKRK+ZjpamtFGkHX2F/EfX9qbdvkZUpBPXJQMfSzZ2u
	XQPYFPHK9X7EnGdLswduELGYOEUJydcRNA30uG3jDG4FpQwsvbddg6qbG6dxJi1gNZTPAVwGN
	V9VSHqP7ZGBoRCEyJ+MR4aC3hfI3E2YaOilHjIdHuZJymGbzY6Kw09jgYXqG0EW44ImCUlYLs
	v55z1f5VIBz4h+co9io3aIGGYr45eey+KqqyASjYfAzuMgD8nlNqZH0Ns72eMnRL6M9xllUj+
	wFbVM2bm/a+k1HAaB1bx8VgSZcK+KAVaIYP67TfnFSypH/oX31Zg5Ub514HsJiEnT+dxtfa7C
	vO9F6a9Um7+U7D7srg39ACxYiDKSGCXCgr7zjtfX8dQYlqoad3c2LurxHR0=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.24
Subject: Re: [Qemu-arm] [Qemu-trivial] [PATCH v2 06/18] hw/nvram/fw_cfg:
 Remove the unnecessary boot_splash_filedata_size
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
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Markus Armbruster <armbru@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Eric Blake <eblake@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iTYs7wki+219

On 08/03/2019 07:49, Thomas Huth wrote:
> On 08/03/2019 02.32, Philippe Mathieu-Daudé wrote:
>> The 'boot_splash_filedata_size' was introduced as a global variable
>> in 3d3b8303c6f. This variable is used as a 'size' argument to the
>> fw_cfg_add_file(). This function has an interface contract with his
>> 'data' argument, but there is no such contract for 'size' (this is
>> not a referenced pointer).  We can simply remove it.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  hw/nvram/fw_cfg.c       | 5 ++---
>>  include/sysemu/sysemu.h | 1 -
>>  vl.c                    | 1 -
>>  3 files changed, 2 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
>> index 8eb76a382c..b2dc0a80cb 100644
>> --- a/hw/nvram/fw_cfg.c
>> +++ b/hw/nvram/fw_cfg.c
>> @@ -217,15 +217,14 @@ static void fw_cfg_bootsplash(FWCfgState *s)
>>          }
>>          g_free(boot_splash_filedata);
>>          boot_splash_filedata = (uint8_t *)file_data;
>> -        boot_splash_filedata_size = file_size;
>>  
>>          /* insert data */
>>          if (file_type == JPG_FILE) {
>>              fw_cfg_add_file(s, "bootsplash.jpg",
>> -                    boot_splash_filedata, boot_splash_filedata_size);
>> +                            boot_splash_filedata, file_size);
>>          } else {
>>              fw_cfg_add_file(s, "bootsplash.bmp",
>> -                    boot_splash_filedata, boot_splash_filedata_size);
>> +                            boot_splash_filedata, file_size);
>>          }
>>          g_free(filename);
>>      }
>> diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
>> index 89604a8328..6065d9e420 100644
>> --- a/include/sysemu/sysemu.h
>> +++ b/include/sysemu/sysemu.h
>> @@ -110,7 +110,6 @@ extern int old_param;
>>  extern int boot_menu;
>>  extern bool boot_strict;
>>  extern uint8_t *boot_splash_filedata;
>> -extern size_t boot_splash_filedata_size;
>>  extern bool enable_mlock;
>>  extern bool enable_cpu_pm;
>>  extern QEMUClockType rtc_clock;
>> diff --git a/vl.c b/vl.c
>> index 4c5cc0d8ad..fad6fec38c 100644
>> --- a/vl.c
>> +++ b/vl.c
>> @@ -188,7 +188,6 @@ const char *prom_envs[MAX_PROM_ENVS];
>>  int boot_menu;
>>  bool boot_strict;
>>  uint8_t *boot_splash_filedata;
>> -size_t boot_splash_filedata_size;
>>  bool wakeup_suspend_enabled;
>>  
>>  int icount_align_option;
>>
> 
> Nice, one global variable less!
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 

Applied to my trivial-patches branch.

Thanks,
Laurent
