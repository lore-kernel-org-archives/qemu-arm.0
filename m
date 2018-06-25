Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp3804344wrq;
        Mon, 25 Jun 2018 06:20:19 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKG6ZpEVHMKMkS4LFxroYxN9SPFzBOxjnCnDQG3R0CgCBCKtUFeQ4HbopXdCKxT798g99RP
X-Received: by 2002:a37:4946:: with SMTP id w67-v6mr10976365qka.394.1529932819726;
        Mon, 25 Jun 2018 06:20:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529932819; cv=none;
        d=google.com; s=arc-20160816;
        b=o16FE4gLuqybr89F6RmwVPGEcZWOWAdj8lBrDdHPhgn9xOI6TKz2gvcyXQTIH7ItA7
         +dUJurABnq7fJwrpgO3+R/aEoYbHD55eaS2W8sE87XyO+dx4VSZBZETZB6cX9iWcOTZZ
         uaPimWvLgLzWurjpvnyN0r45GnQxxni7KPdcGTFIPL//Kw6SbEwmeKKMF5q0mUpT53C+
         KpoiugnWNZfxaPu+F4t7D8xspgmMbi76soy5WA6uOYncz/qz/+wHRp/FnbTXgdOqmCOV
         fzT9y10o7WeX5Sc54/bZrQAJZB8IVEkSBs9aSYHkbkzlDWbSMI76Flf2AbEVFPoy094+
         zMsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=+8CSZUYeCXcw1B8w4xUpTJo22rtL9bOkMP2z5pbZtI8=;
        b=CF/HZoDSGLzn7/g89ovF8auoJnkH9fFYMXvI3JUvb0iJv1gHZP2BtRb2gNP1nrO1rS
         x/c54vUxzg/doRJftgo1yQeOHDQ5K5Xfs++p0jfOnQeFmLx1ec7Hz4/OVPj9X9Y8GqMw
         kaMuutdpY45rwX6GnOXm1Xk1rfQaYsVKRUypxBZb1PtCh8HuYvP9NKD3y1toZezWECCC
         K84niubkfM8EbvHQ1Vc7hfPl2mmGdU0LVWXef4DQ8Duzjq5pKwSDbkqqYPhqOodCd1eF
         eZIgtCmCRCcasiVlETRWSNWr9RafrVmT3Ek0JVbo/rallE0Gygz66++YQKGI1apwKhBh
         Bc/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SEma1cNv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o10-v6si1035842qto.347.2018.06.25.06.20.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Jun 2018 06:20:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SEma1cNv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46859 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fXRPn-0005FA-0B
	for alex.bennee@linaro.org; Mon, 25 Jun 2018 09:20:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57266)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQyp-00008J-Md
	for qemu-devel@nongnu.org; Mon, 25 Jun 2018 08:52:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQyo-0002go-LN
	for qemu-devel@nongnu.org; Mon, 25 Jun 2018 08:52:27 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:38728)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQyc-0002ds-Iy; Mon, 25 Jun 2018 08:52:14 -0400
Received: by mail-qk0-x244.google.com with SMTP id y4-v6so7381453qka.5;
	Mon, 25 Jun 2018 05:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=+8CSZUYeCXcw1B8w4xUpTJo22rtL9bOkMP2z5pbZtI8=;
	b=SEma1cNvwoIpiVfmMzPm65aId82pj4vCJZQARzAxHqoE2Uv6s+b+QoCn8TDo3Bazpz
	eZlajNUqcDj92Ndo8ndyFvWEZqtuBb4msOI1EqGDlaoKGCJ2hddJJOxhhWY8Iy+SF4WS
	0Oy/w/r+dqeuf1QJMU7j/74+SW7Vhb773/xOlN6cioBp6RpMjjRWCKwTY9sGn2VkgrRm
	NASHt1wCKhZwcR5Rh9c0ToLeDBS2FxFpiHDAXus7G/sVzJr4a+AHiqO101HZsCJ5v7zp
	PtEI8P2Q6pSyKl8nUaTuJ9CjA13Ug87/CJ7iChBxtIlCzVVYJyNspByZ16YwlkPUQZpa
	WKxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=+8CSZUYeCXcw1B8w4xUpTJo22rtL9bOkMP2z5pbZtI8=;
	b=HRqcP7LjnfMb88rV7EI+lg7LbhhGFo1p0s/R1tm86KsA2En62orYhRBUD3nFhX52zn
	io02/RgFFtsk26bJTYgralCl0lf7bfPtbUtQ/dmDioQbJ/i9uy0ZcV9+4Qr1ENj6wJDg
	vRIrjHIWLNenXTuQqdWfsJmNvWOrZdhFAEzq4/48Yll74y67hKNJ7GKTeePoCx8sVDzb
	OM4D3wXx2TLfehdLiWzn0uCcISFsrKDND5j3d77gSxh8wQ81iOH5NJQGGZUuMUO9jE9d
	JTcC2k+dtUh4ljnQIZU5FahwxLwhCnzutn0S5STdCdRk3yqmL8G9zkPdfiMqb7S0FAyQ
	jjnw==
X-Gm-Message-State: APt69E0MN35Q/q8hf//FMgU9r6vQ5PyYrVUqQL6ie/KpRx+/RTVfBIBq
	FwsQrjMwLzIaVliBj110pZephy1nmQM=
X-Received: by 2002:a37:8fc3:: with SMTP id
	r186-v6mr10467566qkd.27.1529931133839; 
	Mon, 25 Jun 2018 05:52:13 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	f9-v6sm9254645qkb.43.2018.06.25.05.52.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Jun 2018 05:52:13 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>
References: <20180622134036.23182-1-f4bug@amsat.org>
	<20180622134036.23182-8-f4bug@amsat.org>
	<e98bac2c-ce0b-e226-3d96-004e46478f2f@redhat.com>
	<8256c2d4-722c-299f-e8e3-42c1a7f68e1d@amsat.org>
	<0bf443e6-fd49-9aaf-43fb-f171edf5fd38@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <57e04a05-442c-bd4a-2daa-1b690540c061@amsat.org>
Date: Mon, 25 Jun 2018 09:52:10 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <0bf443e6-fd49-9aaf-43fb-f171edf5fd38@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: Re: [Qemu-devel] [PATCH v2 07/14] hw/i2c/omap_i2c: Use
 qemu_log_mask(UNIMP) instead of fprintf
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SSkb0fjFW9lQ

On 06/25/2018 03:08 AM, Thomas Huth wrote:
> On 22.06.2018 22:10, Philippe Mathieu-Daudé wrote:
>> On 06/22/2018 04:38 PM, Thomas Huth wrote:
>>> On 22.06.2018 15:40, Philippe Mathieu-Daudé wrote:
>>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>> ---
>>>>  hw/i2c/omap_i2c.c | 20 ++++++++++++--------
>>>>  1 file changed, 12 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/hw/i2c/omap_i2c.c b/hw/i2c/omap_i2c.c
>>>> index 26e3e5ebf6..690876e43e 100644
>>>> --- a/hw/i2c/omap_i2c.c
>>>> +++ b/hw/i2c/omap_i2c.c
>>>> @@ -17,6 +17,7 @@
>>>>   * with this program; if not, see <http://www.gnu.org/licenses/>.
>>>>   */
>>>>  #include "qemu/osdep.h"
>>>> +#include "qemu/log.h"
>>>>  #include "hw/hw.h"
>>>>  #include "hw/i2c/i2c.h"
>>>>  #include "hw/arm/omap.h"
>>>> @@ -339,14 +340,15 @@ static void omap_i2c_write(void *opaque, hwaddr addr,
>>>>              }
>>>>              break;
>>>>          }
>>>> -        if ((value & (1 << 15)) && !(value & (1 << 10))) {	/* MST */
>>>> -            fprintf(stderr, "%s: I^2C slave mode not supported\n",
>>>> -                            __func__);
>>>> +        if ((value & (1 << 15)) && !(value & (1 << 10))) { /* MST */
>>>
>>> Please keep the white spaces before the comment if you don't change
>>> anything else.
>>
>> This is a <tab> and checkpatch complains...
>>
>> I can use 4 spaces for this tab. I tried to align with other tab-aligned
>> comments I didn't modify, but the result is messier. Thus a simple space.
> 
> Oh, sorry, I didn't notice that you've replaced a TAB here. I guess it's
> ok then. But why does checkpatch complain if it is just in the context
> of your modification? That's weird.

The first 2 contexts (MST and XA) are fine, however checkpatch complains
with the last one (ST_EN):

ERROR: code indent should never use tabs
#38: FILE: hw/i2c/omap_i2c.c:397:
+        if (value & (1 << 15)) {^I^I^I^I^I/* ST_EN */$

Since I replaced this one, I also did with the 2 previous.

Now I realize I can _not_ add the brackets so I don't have to update the
<tabs>:

         if (value & (1 << 15))^I^I^I^I^I/* ST_EN */
-            fprintf(stderr, "%s: System Test not supported\n", __func__);
+            qemu_log_mask(LOG_UNIMP,
+                          "%s: System Test not supported\n", __func__);
         break;

I think if it better to unify the code style when possible, but it is up
to you, if you prefer I can resend with tabs and no brackets.

Regards,

Phil.
