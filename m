Received: by 10.25.0.6 with SMTP id 6csp827204lfa;
        Sat, 13 May 2017 15:53:12 -0700 (PDT)
X-Received: by 10.55.59.139 with SMTP id i133mr9272141qka.248.1494715992681;
        Sat, 13 May 2017 15:53:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494715992; cv=none;
        d=google.com; s=arc-20160816;
        b=kMBBFoAJWpSf53FlfSZya7CeqP51xcZ1tP8C0mRx9PXH7FtdY5x3JJ6S/u0WlHbhAB
         aw4qdJuBgBrAG1gy5KiUHLJRvJGm9Jw0i/GnCcl4GFz/N3bfUkVN1iJnJw1bn3+uegAb
         zhe+nkeyoVbbjd8Wh7/5GBfPcwVv59/sh2/aF2fgzSUZ/fo5/vqPe5KjSswMYOBEqqD4
         BX49XBNR9LYV46HCXWMj/FKDSM6wtInQI3xSiKWRXNecrQ8qpLSuqIwtPEJUaXCeD+3Y
         Iyoq9EcQWKPGbccRbQXQwGZ2xHeS7rwXvZm09zSSBvg7fDyit4G1zt9H8ZTX9FLv2Nk4
         RSvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=j3Co+HmKOO7S9Xft1ZaftgVxQNiwxig14A86CS65Qlk=;
        b=KoJZhZ6Cwqi6gSUNz67fEAVxo5zfkv5+7b1nGybBI35bfFf4Lr7wj4lNcK+MDQzM84
         Ett1BzlY6/eUNdHaAyQ0dbhEW8P8+6eAQjQUpGPU/yYZrI/xbakDcnaLsNeSYU+i3vab
         oIFxNRC38zemwUnIaff/OWLEMbNo77vWfSNvrCW7pcOZ67t7DGRYlUK9vv6oWkbxF/gl
         rZ8RcpoSZL8bRCCzuB6eo4N+5huqBD3agWG1MtY6Zrg+z5jhM8ADhAJl7G/3htO0p9Ce
         4IA2TgdCjPvdmpnYnFHI69JzXUSGVKqmXV9/6cTVoRdjZP9vVvc6UHA3wG3E/kYfX0jH
         ErRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s17si7127423qta.320.2017.05.13.15.53.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 13 May 2017 15:53:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59049 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d9fuP-0000jk-T4
	for alex.bennee@linaro.org; Sat, 13 May 2017 18:53:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39683)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d9fuJ-0000ia-7u
	for qemu-arm@nongnu.org; Sat, 13 May 2017 18:53:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d9fuI-00023R-Ah
	for qemu-arm@nongnu.org; Sat, 13 May 2017 18:53:03 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:36183)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d9fuD-0001rj-LC; Sat, 13 May 2017 18:52:57 -0400
Received: by mail-qt0-x243.google.com with SMTP id j13so11168195qta.3;
	Sat, 13 May 2017 15:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=j3Co+HmKOO7S9Xft1ZaftgVxQNiwxig14A86CS65Qlk=;
	b=OwgrRvwu/BWOJrCGdE/J+D91WLKZ7BVeHoIWU0CQAdr1BLtEFNYki3Wlhe3uBxXb36
	ujD/AsH8XXXHY8vyCkJmLuDph4WBn1R4H+JKWNf4HeHGtv3lnHMnlOnmh+HlcaOJtdJI
	lq/tljwHEYot2hbCBNDggaDfgCsGatGblndLEbRyPggmTGpJ3b4nPd25RUGOonjr2EIO
	rAFsHOogZLQI6Igo/5SASntSdRiRgU3FSfQLK8XmqzMSvpTMi52iOkm6/njaCH49JyG7
	0xNdcm4T5StdXW0Uz8aQRpQV6meyWNkOudqueiHbbrtt1SbkNRo2Ot67rjiPEvYsoBsA
	wyTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=j3Co+HmKOO7S9Xft1ZaftgVxQNiwxig14A86CS65Qlk=;
	b=ndLL5gMhJxxVHvrz5dUyZdEjI76q9MsyF/027Jt6CkRZb2fY/2aql3dOEBaMoe67cC
	nJE4HijT1vj5XoiWaV8/0hwe9hB6yAEGd0HS9oWvzD/D2TYVxY5tRs6XtT4TPZdkkaVg
	XStqO8C2dkd6sE+1bLjQslPoiBCyV6igNcvIfd6wzfN88dYpSX2I1CxgL86Zu+Vld/CT
	+YV/6h0lVFjfa5WbElR+cSGlKApIhrwB+2Ve11L/5Gnug+exLZ6c2a63wE+vBMFsk7Xu
	izZ2H6qb+JC3vLWvGhQzshTpM8ue6ZaKmE+RvNOPYor0jxLxWJr8zJu6ecKlKtSozs6y
	8rlw==
X-Gm-Message-State: AODbwcC7cRTZKb+ucgM4gGQXySDvnRxUUub9M3OCm3ZaRFf7I7fTNO5f
	kCkNOZnm8mR6kw==
X-Received: by 10.200.55.184 with SMTP id d53mr9773278qtc.94.1494715976941;
	Sat, 13 May 2017 15:52:56 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id d5sm5026147qkf.4.2017.05.13.15.52.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 13 May 2017 15:52:55 -0700 (PDT)
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <1493122030-32191-1-git-send-email-peter.maydell@linaro.org>
	<1493122030-32191-9-git-send-email-peter.maydell@linaro.org>
	<CAKmqyKPTXPZUkWsTzTV7rZ02QNAC2j9h_1eWqNs67KHM1Jkgrw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <cd57310d-a047-00b7-c8fb-76faa4ba5f8f@amsat.org>
Date: Sat, 13 May 2017 19:52:52 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKPTXPZUkWsTzTV7rZ02QNAC2j9h_1eWqNs67KHM1Jkgrw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 08/13] armv7m: Improve "-d mmu"
 tracing for PMSAv7 MPU
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FtdOKI3mvFUd

On 05/03/2017 06:30 PM, Alistair Francis wrote:
> On Tue, Apr 25, 2017 at 5:07 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> From: Michael Davidsaver <mdavidsaver@gmail.com>
>>
>> Improve the "-d mmu" tracing for the PMSAv7 MPU translation
>> process as an aid in debugging guest MPU configurations:
>>  * fix a missing newline for a guest-error log
>>  * report the region number with guest-error or unimp
>>    logs of bad region register values
>>  * add a log message for the overall result of the lookup
>>  * print "0x" prefix for hex values
>>
>> Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
>> [PMM: a little tidyup, report region number in all messages
>>  rather than just one]
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> Thanks,
>
> Alistair
>
>> ---
>>  target/arm/helper.c | 39 +++++++++++++++++++++++++++------------
>>  1 file changed, 27 insertions(+), 12 deletions(-)
>>
>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>> index 5c044d0..9e1ed1c 100644
>> --- a/target/arm/helper.c
>> +++ b/target/arm/helper.c
>> @@ -8169,16 +8169,18 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
>>              }
>>
>>              if (!rsize) {
>> -                qemu_log_mask(LOG_GUEST_ERROR, "DRSR.Rsize field can not be 0");
>> +                qemu_log_mask(LOG_GUEST_ERROR,
>> +                              "DRSR[%d]: Rsize field cannot be 0\n", n);
>>                  continue;
>>              }
>>              rsize++;
>>              rmask = (1ull << rsize) - 1;
>>
>>              if (base & rmask) {
>> -                qemu_log_mask(LOG_GUEST_ERROR, "DRBAR %" PRIx32 " misaligned "
>> -                              "to DRSR region size, mask = %" PRIx32,
>> -                              base, rmask);
>> +                qemu_log_mask(LOG_GUEST_ERROR,
>> +                              "DRBAR[%d]: 0x%" PRIx32 " misaligned "
>> +                              "to DRSR region size, mask = 0x%" PRIx32 "\n",
>> +                              n, base, rmask);
>>                  continue;
>>              }
>>
>> @@ -8215,9 +8217,10 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
>>                  }
>>              }
>>              if (rsize < TARGET_PAGE_BITS) {
>> -                qemu_log_mask(LOG_UNIMP, "No support for MPU (sub)region"
>> +                qemu_log_mask(LOG_UNIMP,
>> +                              "DRSR[%d]: No support for MPU (sub)region "
>>                                "alignment of %" PRIu32 " bits. Minimum is %d\n",
>> -                              rsize, TARGET_PAGE_BITS);
>> +                              n, rsize, TARGET_PAGE_BITS);
>>                  continue;
>>              }
>>              if (srdis) {
>> @@ -8251,8 +8254,8 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
>>                      break;
>>                  default:
>>                      qemu_log_mask(LOG_GUEST_ERROR,
>> -                                  "Bad value for AP bits in DRACR %"
>> -                                  PRIx32 "\n", ap);
>> +                                  "DRACR[%d]: Bad value for AP bits: 0x%"
>> +                                  PRIx32 "\n", n, ap);
>>                  }
>>              } else { /* Priv. mode AP bits decoding */
>>                  switch (ap) {
>> @@ -8269,8 +8272,8 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
>>                      break;
>>                  default:
>>                      qemu_log_mask(LOG_GUEST_ERROR,
>> -                                  "Bad value for AP bits in DRACR %"
>> -                                  PRIx32 "\n", ap);
>> +                                  "DRACR[%d]: Bad value for AP bits: 0x%"
>> +                                  PRIx32 "\n", n, ap);
>>                  }
>>              }
>>
>> @@ -8448,9 +8451,21 @@ static bool get_phys_addr(CPUARMState *env, target_ulong address,
>>       */
>>      if (arm_feature(env, ARM_FEATURE_PMSA) &&
>>          arm_feature(env, ARM_FEATURE_V7)) {
>> +        bool ret;
>>          *page_size = TARGET_PAGE_SIZE;
>> -        return get_phys_addr_pmsav7(env, address, access_type, mmu_idx,
>> -                                    phys_ptr, prot, fsr);
>> +        ret = get_phys_addr_pmsav7(env, address, access_type, mmu_idx,
>> +                                   phys_ptr, prot, fsr);
>> +        qemu_log_mask(CPU_LOG_MMU, "PMSAv7 MPU lookup for %s at 0x%08" PRIx32
>> +                      " mmu_idx %u -> %s (prot %c%c%c)\n",
>> +                      access_type == 1 ? "reading" :
>> +                      (access_type == 2 ? "writing" : "execute"),
>> +                      (uint32_t)address, mmu_idx,
>> +                      ret ? "Miss" : "Hit",
>> +                      *prot & PAGE_READ ? 'r' : '-',
>> +                      *prot & PAGE_WRITE ? 'w' : '-',
>> +                      *prot & PAGE_EXEC ? 'x' : '-');
>> +
>> +        return ret;
>>      }
>>
>>      if (regime_translation_disabled(env, mmu_idx)) {
>> --
>> 2.7.4
>>
>>
>
