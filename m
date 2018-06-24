Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2436080wrq;
        Sat, 23 Jun 2018 20:48:28 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJdh8M9s1CEJVUcDsi1bQmS4TK4kdI/sdBDJtOl9SxgJZsM2pT1qymm4QMqDyhpgKiJyZbG
X-Received: by 2002:a37:c0c5:: with SMTP id v66-v6mr6648949qkv.194.1529812108461;
        Sat, 23 Jun 2018 20:48:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529812108; cv=none;
        d=google.com; s=arc-20160816;
        b=KI+Xi3bmlGVE7qhYSJz6PWIgaRAtj/6dcqNPQWJpIQKFahxaVQ9ypIk11u7Exxmpm4
         Um7DgfwLbJaeoFpKbqP/+fYxaPiGmCrxhnOfaLq5LZCWsRTs4M2XIEUtCFBUPtta8dXF
         I0jVN9qYrD9mYiOp45iOLEbF72kg2OHao0Pso0Lz+DA2Z8qHrqyVcIWoxyoSRUt0+F0D
         eiynO6WIxrDjg6iv6wxMeEeTx/csBa04FHreuImyMECllvzlwbIOA/IdgO6dr3kyCxE/
         3BndY8+nXiyzUG4HcjnEwcb/OLrBeZ/lkRcuNNQLY8miXanhxrX6O0BOmpCB7bEvXm5M
         DsqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=TX+yElUHbY+spdZhZ2xvqLIlnTVwVXWCSO08CRuzfWs=;
        b=utetfzgp2lzEk0ay/bxFK3gGzRzU3imAalesmRmxtJcYJYCbmHlG3/3lPTALe0BOQg
         EyUEfrBiXu8/fz+M6h3n5UXVaaDt3yBFllqDQdKGw9CdGJCybEfM+oRPQ5ZlftJ52uMw
         fLnz9j/CeOSWqbTDtvEBQGnTOiiv+gSnPlfRZKnOAbHSfHZcof0TOX8P3N9fQW+GEjzR
         6LmyRt+Rkex0wETih0L06tnXJypWz+sDjzDTydRCPhYlj7dM2/469qNAhW7ER2SdO7E3
         KRNZb7AgTpH03QylSwlYSIMcvhz5o65TNHtKvO7O7SZtWUNEhi4S0cK43y5//M/qbNZJ
         3Jlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cZZmF6CE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 61-v6si100604qtf.322.2018.06.23.20.48.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 23 Jun 2018 20:48:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cZZmF6CE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40436 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWw0p-00089E-Un
	for alex.bennee@linaro.org; Sat, 23 Jun 2018 23:48:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39781)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWw0i-000889-54
	for qemu-arm@nongnu.org; Sat, 23 Jun 2018 23:48:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWw0h-0004Bs-Gw
	for qemu-arm@nongnu.org; Sat, 23 Jun 2018 23:48:20 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:46727)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWw0a-0004A3-9S; Sat, 23 Jun 2018 23:48:12 -0400
Received: by mail-qt0-x244.google.com with SMTP id h5-v6so9305167qtm.13;
	Sat, 23 Jun 2018 20:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=TX+yElUHbY+spdZhZ2xvqLIlnTVwVXWCSO08CRuzfWs=;
	b=cZZmF6CEDtmyAIqMu38GMyvuajLTZaUYNPtl0gUocSQ5YgpWR0dolUMhHJLjLIWVVF
	/FJ0dd8L6LXG6XRAp0Ih15iH0psmioQsQB6ou7JM4gQtwF0mf4ZLsY9sZD/tMxrPClee
	VmpcEzowat+XEv/mauLfiL2vHZmWLgwmcu4lP45Q9dmeuoG/veeQN89is3NjprqwvBHp
	OLTYue6hXc9FziFtiT7GmifiE6rf+r7MPiXkIkIiur7Ho4g/D9lL/7U7lsyHF6SE55vM
	1b4PERG16X0yL7nQSuaKYyCy5HStVbBhvCHEndZIp/utJ1WYvkmJk7gT9wp+g322L2XE
	k8uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=TX+yElUHbY+spdZhZ2xvqLIlnTVwVXWCSO08CRuzfWs=;
	b=WzDsMwTprTwrgDGUhdeSARihi344YfnBXPv7f8qN0Vld6YKPa3LY2g0UVr7uayxAzp
	hWl5BlmLlX1YpvOHK0i/uO1v3yajcMF2VlKfeIbHY1vhbSpPOkaRpVOPuGB7wL08m67v
	/Tb6JsU5mMDQH3BLGKXP9mMuVQDEs1B0F8g8DYWTmc/6+hQIgLUiTuSFV7LsB5R0z4hH
	PRk3kYCxZ/+sFDZBI4x3XPpV79ZGMzCBLzDEr8TFJEM5C+ChCF1QPxCC4UJ99b+t14pS
	ziD7rKj6ke6MFYxn5wmGB1FTxbD6FOGF5G27fIlnTHFb8E6V6mdwswWXW5gKtC6r6b0P
	vKOA==
X-Gm-Message-State: APt69E0Lwi91a6rhWhu7cXxMfHcrDiyYJg3oViP9Sa9eiLvv/7S3Zem1
	AD2gZ8fDHfqy+w4nbPQQJE4=
X-Received: by 2002:a0c:d026:: with SMTP id
	u35-v6mr6509100qvg.210.1529812091674; 
	Sat, 23 Jun 2018 20:48:11 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	i4-v6sm1868213qtp.44.2018.06.23.20.48.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 23 Jun 2018 20:48:10 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>
References: <20180622134036.23182-1-f4bug@amsat.org>
	<20180622134036.23182-2-f4bug@amsat.org>
	<ceca80d5-7619-4afa-ce82-5870d7a235ad@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <3362ea05-5936-422e-5e67-dbe95207b93a@amsat.org>
Date: Sun, 24 Jun 2018 00:48:07 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <ceca80d5-7619-4afa-ce82-5870d7a235ad@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-arm] [PATCH v2 01/14] hw/input/pckbd: Use
 qemu_log_mask(GUEST_ERROR) instead of fprintf
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
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OAsB0IPsU0ih

On 06/22/2018 04:24 PM, Thomas Huth wrote:
> On 22.06.2018 15:40, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  hw/input/pckbd.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
>> index f33e3fc63d..26aeac2326 100644
>> --- a/hw/input/pckbd.c
>> +++ b/hw/input/pckbd.c
>> @@ -22,6 +22,7 @@
>>   * THE SOFTWARE.
>>   */
>>  #include "qemu/osdep.h"
>> +#include "qemu/log.h"
>>  #include "hw/hw.h"
>>  #include "hw/isa/isa.h"
>>  #include "hw/i386/pc.h"
>> @@ -308,7 +309,8 @@ static void kbd_write_command(void *opaque, hwaddr addr,
>>          /* ignore that */
>>          break;
>>      default:
>> -        fprintf(stderr, "qemu: unsupported keyboard cmd=0x%02x\n", (int)val);
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "unsupported keyboard cmd=0x%02lx\n", val);
> 
> Sorry for not spotting it in v1 already, but val is a uint64_t value, so
> you need PRIx64 as format string here, otherwise you'll get an error
> with 32-bit compilers.

Good catch.

Our last CI tested 32-bit arch is MXE Win32.
