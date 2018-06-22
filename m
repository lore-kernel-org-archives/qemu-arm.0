Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1237247wrq;
        Fri, 22 Jun 2018 13:16:52 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJAHFOrublEb0yunq1eAy2fjiSxPsS7MuIhl7gJFkJF3/c8MoEBRIO2IR7ou0uKsfvOQIrM
X-Received: by 2002:a37:c394:: with SMTP id r20-v6mr2649353qkl.372.1529698612723;
        Fri, 22 Jun 2018 13:16:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529698612; cv=none;
        d=google.com; s=arc-20160816;
        b=PiwoKkEjakJkqIJlbIwpK1ND+IqKpCAGtZKQzUTRGRmcqvTZOlV9cICCN+SUUqs+dO
         dAfnVIGmobYBk5RzX2P5UX4NA2fFaspPiGgysPSCkxjm6Ft51PrrAcjpys8Oa1SI4DXS
         R2E9qZI9qznbIi6byzww8MpFIEwqxRJKNRxsT3n9Mck9n4KbNJXkj8e+aYv59zPY059w
         eIv8k6ULUsoLF1+sL1q/kHVebyG8N/LvB2+Q/ztYG9KygGXHloGf1P+WwKmCU3f39qGi
         Krq5MDHXS8Ztrj3soOnQc0e0HxbdwoitFU0eimgR6Di035+u+4O2l0BTMJ+iyPxR+hUW
         Pixw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=XN/MPsGmDKtKO+OHwPvyw+JxQakgAoSeV1Qo6hKMB7Q=;
        b=gLZd2cOvuYAoXzEFR5jOyxhvuZoKeIu8+3jFsYVaYO5rI+zgppFa5A6f5wKnNOH0hb
         FJ3ESIC1LhUYjAbm0zWf5YHh4K5rd84sBNHfv5nDmsazbL8xAIQ+ylgjDyE2MHdUdLE0
         NmcCt9/ItxMwHcfczAuyJ4Qy74pdolnQTcW5fLkIhvfqYhk599zm6gtK3ThzYjZRAOtS
         RHah+eU7I7U0GStFxiV/SbcLf7WNdSVsgEsDtQ/Wq7Gqletd/VPOHnewqQyo3edcgfuQ
         hBe1OOP0T/Ki2ivxXaCJuqK5FxXkZD4TngYzRN9ZQVmx5nMB7rU8EvPa+QppoMMo3dyv
         J7/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nYrRFhkN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j1-v6si1971152qtn.101.2018.06.22.13.16.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 13:16:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nYrRFhkN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36009 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWSUG-0005Br-2y
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 16:16:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51870)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWSU3-0005AT-7o
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 16:16:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWSU0-0005gs-3c
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 16:16:39 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:33224)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWSTz-0005gg-Vg; Fri, 22 Jun 2018 16:16:36 -0400
Received: by mail-qt0-x243.google.com with SMTP id l10-v6so7071364qtj.0;
	Fri, 22 Jun 2018 13:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=XN/MPsGmDKtKO+OHwPvyw+JxQakgAoSeV1Qo6hKMB7Q=;
	b=nYrRFhkN9fYbX6L5gJqxYvr7cG3YtZvIzLNQc0jDNM0IVEPBczu+tlT6zkP2Aj3cbl
	Wbs241MG85R1Jvgk7ziELD3Moe8hxSX0kcuJJeO4zpViit7H7HoVzwZ4oMMtLKv/KQ9q
	dN+uLqU1ggmzutzfa0qaFX9y3tCzea0BPs/PsZTu5OkR2KDSLUOHQhXH0ZawhTiwfbcu
	FkJ8KNeji325QooQS5qagFELQjS87zANvOR3vfDqbEUWq6XH0d37/rn2fbUQzyYoVU3I
	OfiJBVD/KMJfOKy8iF9aE/Hgix7OD7/FnLr5XkCLkRVB/B5Hz+n5iGOPxoUN1fkSuHGV
	ZbHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=XN/MPsGmDKtKO+OHwPvyw+JxQakgAoSeV1Qo6hKMB7Q=;
	b=VKiU/uQiLbpSSh7bjgBbW89mHLzW3poy/bCxoW5JrAMqbJxq526FE7w6hX3zms+ZIO
	Rgp9WHSESKXEHKBMXTlF+MvtgB6kneXOzL8aJfFAcrAGFkyClW2A6NEKQqPUXxQWsd1V
	OTP/xkAWc/s8LDv668TjFtS7LXCvk8QiF1H5bYpCbOy2N7Idjsdlpo9gJzez6n96//j+
	7t6s3erFF59JL7CQM/BYAEXFqY/E84+N72ePmeTb81ZZoYBKHojmaAGNZW+frFgiDXJL
	Iet1jjjpeiUZsOA2SfGqNp+Tjp8Sv5YXoNOMNnlGdwSL3R1e9OvsIfR1TitOETwUDzZn
	E51w==
X-Gm-Message-State: APt69E2mlINjpDp8w05fJ01E7vMKVVDvTP2eU7Slv/K9tTDz5UCMkvhm
	b5RdX5y6q/2rf5qPXNUd8JDZN2Nx
X-Received: by 2002:a0c:f8c2:: with SMTP id
	h2-v6mr2823760qvo.163.1529698595421; 
	Fri, 22 Jun 2018 13:16:35 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	e97-v6sm5494692qtb.78.2018.06.22.13.16.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jun 2018 13:16:34 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20180622134036.23182-1-f4bug@amsat.org>
	<20180622134036.23182-15-f4bug@amsat.org>
	<9e5b3eee-1335-9eae-709a-3f8d05729c03@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <49794564-eb8b-476e-6373-e70f814220ee@amsat.org>
Date: Fri, 22 Jun 2018 17:16:32 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <9e5b3eee-1335-9eae-709a-3f8d05729c03@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-arm] [PATCH v2 14/14] hw/arm/stellaris: Fix gptm_write()
 error message
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B3+fuCkzfoG6

On 06/22/2018 04:55 PM, Thomas Huth wrote:
> On 22.06.2018 15:40, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  hw/arm/stellaris.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
>> index d06e366402..42baa768b2 100644
>> --- a/hw/arm/stellaris.c
>> +++ b/hw/arm/stellaris.c
>> @@ -294,7 +294,7 @@ static void gptm_write(void *opaque, hwaddr offset,
>>          break;
>>      default:
>>          qemu_log_mask(LOG_GUEST_ERROR,
>> -                      "GPTM: read at bad offset 0x%x\n", (int)offset);
>> +                      "GPTM: write at bad offset 0x%x\n", (int)offset);
> 
> While you're at it, remove the cast and use HWADDR_PRIx ?

Sure.

Thanks for your review!
