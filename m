Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3152723wrt;
        Mon, 28 Jan 2019 03:13:52 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5NxpUs31oaMMcabieB2Adj3de5Ebf/HnOFTpxERgI2Hx/BbmyWueCM0rpm3HX9NlC5WtZG
X-Received: by 2002:adf:9123:: with SMTP id j32mr22361253wrj.122.1548674032411;
        Mon, 28 Jan 2019 03:13:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548674032; cv=none;
        d=google.com; s=arc-20160816;
        b=GsUPrIV29yV64PoSkk9lH1u70AgFxuq77WV0BM9hui17fYzGR9lTznOmNWdrPdAW6v
         /YXdwgsj23cU7pRlJ2x1mdpJkEPZOHAOUCJJz52yVQzEmGS2Wbk0tbtTeME+o8XXi04C
         ZrHsBzRrRKC9rkWWC0uQD6uOZxTr3M3FryxqVG7SbUJvtRvolTn21VcNo9c9gmFafagI
         4rOsOVz4QYnMGwjoAiQmvi61qLc+HUkc8i/o76l/+roRxnZZ7P4OVVEVEN6ZuP6GsP05
         aatytI2KmNMaZYaxh3Ylm7hhBAu/9Y/3l4YX7CKnl7rVVP2phBis1wsNxck+PURxqRUG
         VkdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=l4tenfaYhnUwlU6ZJ4c8+GdhStTt3X1eRvpanqxT3hg=;
        b=lDKStErMwLmnMtzH0+DvAhLkOe03QPnV9KBkkpID5ORdqtbLNoO4FP2Q8ImkC8S8YJ
         2A/kcsucwVNaUOeUvxQk1RuVc2KNMajsBCV1ocBAavJQBdS8zfrx6r+MD7uBMDgAR+DG
         rRDj+Wjs8/ubs3HoJQNfbF01pTLedDLenqCybrGiyggvCIGLiKA4F8Lac/XDohyu65on
         OoSZiow3SWArt7IeMzaqo9RgsyWU1wfui3SobNYDSyhcNnBKd6AWLnUtwioA9IvLT/ba
         eQkUeCQ8B4xRsrmm/N9WLXh+N1fDb9cmx+v3EgFc62i1I/LOo/6euRx75qxV7/TkIcCz
         wllw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i4si6320345wrn.60.2019.01.28.03.13.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Jan 2019 03:13:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:58031 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1go4rP-0000oj-FR
	for alex.bennee@linaro.org; Mon, 28 Jan 2019 06:13:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56865)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1go4ns-0006Qc-Gq
	for qemu-arm@nongnu.org; Mon, 28 Jan 2019 06:10:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1go4nr-0005hk-LF
	for qemu-arm@nongnu.org; Mon, 28 Jan 2019 06:10:12 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44677)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1go4nq-0005gz-Qy
	for qemu-arm@nongnu.org; Mon, 28 Jan 2019 06:10:10 -0500
Received: by mail-wr1-f67.google.com with SMTP id z5so17510163wrt.11
	for <qemu-arm@nongnu.org>; Mon, 28 Jan 2019 03:10:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=l4tenfaYhnUwlU6ZJ4c8+GdhStTt3X1eRvpanqxT3hg=;
	b=lR7K/75WWBZepVcD0q6PzR5CY2kppBK4b9DnrD4AleW0PB5ySs1PXvG84clbFQrH8z
	nqi88P5VK+83jCvxGN6FKPRdLlwrQJqMdAFVAcY7y4od71dpQRBfix5AHa1SeIRc7uQy
	5P8oCF40/SKeoftzjZqrjXad403It6Q9L87vG/z9tOoKT4VqienDf1F+ipFzH32gRMvo
	ShE59+JtpH/kpkBmLhlatwdHfSMJD2bET4aO5fB/3/UPYlLNCph5ffc/OgQmB+PyQkEr
	dOheD+LY3gghr6LxF6bZRs1wVRJpknLQXI1UKkVV11Q40wdMAWngYBxgsCqIFjTeAjV6
	GR6A==
X-Gm-Message-State: AJcUukcz4lCc/VbMb+7CdAUgkDMDg7X4Z4cob8D0GaBF+OH1XhIWZaYC
	wY24bEpRArk9x4fk+v1Es3JzBQ==
X-Received: by 2002:adf:93e2:: with SMTP id 89mr22052193wrp.129.1548673809372; 
	Mon, 28 Jan 2019 03:10:09 -0800 (PST)
Received: from [192.168.1.40] (110.red-83-51-161.dynamicip.rima-tde.net.
	[83.51.161.110]) by smtp.gmail.com with ESMTPSA id
	o8sm109679915wrx.15.2019.01.28.03.10.08
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jan 2019 03:10:08 -0800 (PST)
To: Thomas Huth <thuth@redhat.com>, kumar sourav <sourav.jb1988@gmail.com>,
	qemu-trivial@nongnu.org
References: <20190127101836.15451-1-sourav.jb1988@gmail.com>
	<33a499ed-6f6a-ccd2-a1f8-48646b6be6c9@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <05c9ef91-39d7-0579-b007-443748559007@redhat.com>
Date: Mon, 28 Jan 2019 12:10:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <33a499ed-6f6a-ccd2-a1f8-48646b6be6c9@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/input/lm832x: set device
 category of lm832x
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qSUlvdD1evTI

Hi Thomas,

On 1/28/19 9:37 AM, Thomas Huth wrote:
>  Hi,
> 
> On 2019-01-27 11:18, kumar sourav wrote:
>> Sets the category of lm832x as DEVICE_CATEGORY_INPUT
>> Devices should be assigned to one of DEVICE_CATEGORY_XXXX
>>
>> Signed-off-by: kumar sourav <sourav.jb1988@gmail.com>
>> ---
>>  hw/input/lm832x.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/hw/input/lm832x.c b/hw/input/lm832x.c
>> index cffbf586d4..07ae5e0aee 100644
>> --- a/hw/input/lm832x.c
>> +++ b/hw/input/lm832x.c
>> @@ -509,6 +509,7 @@ static void lm8323_class_init(ObjectClass *klass, void *data)
>>      k->recv = lm_i2c_rx;
>>      k->send = lm_i2c_tx;
>>      dc->vmsd = &vmstate_lm_kbd;
>> +    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
>>  }
> 
> This device already has DEVICE_CATEGORY_MISC set since it is derived
> from TYPE_I2C_SLAVE. If you now set another category bit here, the
> device shows up twice in the output of "-device help". That's not so nice.
> 
> I see multiple options here:
> 
> 1) Drop this patch since the device already has a category
> 
> 2) Make sure to clear_bit() the MISC category here again
> 
> 3) Remove the set_bit(DEVICE_CATEGORY_MISC, k->categories) in
>    hw/i2c/core.c - it does not make that much sense to set the
>    MISC category for an abstract parent class.
> 
> 4) Introduce a new DEVICE_CATEGORY_I2C which could be used
>    instead of the DEVICE_CATEGORY_MISC in hw/i2c/core.c
> 
> One of the last two options sound most appealing to me.

Can we go with 0/3/4 together? 0 being this patch:

  0) This devices inherited DEVICE_CATEGORY_I2C from his
     abstract parent, also select the DEVICE_CATEGORY_INPUT
     bit.
