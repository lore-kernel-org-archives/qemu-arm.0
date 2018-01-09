Received: by 10.28.173.206 with SMTP id w197csp3892357wme;
        Tue, 9 Jan 2018 08:39:30 -0800 (PST)
X-Google-Smtp-Source: ACJfBouhvnavxIvqqgAFgMVsqgojX8oYFdBsuzZL+85G6XxL/2uaiblQltCkv6zAGxaU7a+EXGkj
X-Received: by 10.37.248.29 with SMTP id u29mr7010730ybd.341.1515515970473;
        Tue, 09 Jan 2018 08:39:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515515970; cv=none;
        d=google.com; s=arc-20160816;
        b=lXdgn1jrw9CtsH5XIS0zWbevZ8UgypbHoqSO5TF+xmi2XRVGaFqyCsaermnEQCly3n
         NAqcJa+cpD6W3d7MyXb68iMKBQOK9pDPF8Hr0Tax6810lUwfP1lkk07IFbg/MYaLOjpo
         9gSH7BVB/nMgRwwHLJgmwGIU9Y1ihCWQr2k3cJtvijXt9POiNy4p+QjVA2fWzyV68fC4
         8h+16UaUO5SfVvVJ6ClRMOvUKSX4vVzxURb0botddO7t16zi7uZOGjngk/2g5nUiHKWW
         iYlQBsaqLlhY+HtVDE9vMXk6KQvidCQctiD6BaEXcOyqbBY2ij7rVqjnMjL728TO70k2
         BoCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=DuzHeOu8iGD6YjvMvAwO72i1MQJfX1ahjcXPBaJn5os=;
        b=T+gTVHlkl8ZggPOsDU/oYIsUPLORbD+ssHdhfbqekR8KQxUKpE0LbQPRZ6mS0BDZVs
         AeRDm0sf5OerSvQssZ0s+uo+WGo3JDEebROpY9d0M0QWbolZkqftNK/fOzINoEZEQ8XO
         XrFACwL7T9q/usE7q8jGLcF68/ji4BYcMKE/cmT5kQJ0nEA25f5axxkdQucDhaTigwuy
         f0f+f3/yXbep+IcID5SVX3+SMS+Ncgrau9tuptG8Nfv+V5UwE3k5iYUpgSwEIB3uMoMw
         5+PgU2v7S2Egz1IDOryQSxxYc5wmsRpVdPztNI7aqWBk4YipB2NF9u0nsqF3Rv3Gmh+9
         wfNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iBO+vkJ3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id k3si253129ybb.292.2018.01.09.08.39.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 Jan 2018 08:39:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iBO+vkJ3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33189 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYwvx-0007kH-U5
	for alex.bennee@linaro.org; Tue, 09 Jan 2018 11:39:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37014)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYwvS-0007hi-B8
	for qemu-devel@nongnu.org; Tue, 09 Jan 2018 11:38:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYwvR-0003cF-8m
	for qemu-devel@nongnu.org; Tue, 09 Jan 2018 11:38:58 -0500
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:40966)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYwvL-0003XH-Jd; Tue, 09 Jan 2018 11:38:51 -0500
Received: by mail-qt0-x243.google.com with SMTP id i40so18527405qti.8;
	Tue, 09 Jan 2018 08:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=DuzHeOu8iGD6YjvMvAwO72i1MQJfX1ahjcXPBaJn5os=;
	b=iBO+vkJ3WAhwGgWBoaOoHXdHL5s/KRYx9r1IWeHl5Ii/pmitD/jMH4CpchnPZCYr/5
	1jbDcwwXB+nrhXexVdpV4ULTs1V9OqE/TJDSy9G1zWFWCLFHSH68drkVBTDRriesqIWA
	QYnvlYmB1MF8xEdnYEbhALYxVnlWmxWYtc9PK8IRp8ZLP+pfCT6pjV7erzoTWg+EKqa5
	XI9TBu/uPXH6739tmvtzT1JiSAEpxbGYiAeHvnajdd7+mzsy4IdPD4sAfKt877cmlSp5
	E9O6agGFeD4O9H+d+UocRjn0MNCqvhcGacHSnZ6Nz28KjPhkjCLT/B3AiYWCFVjOrNB4
	+qDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=DuzHeOu8iGD6YjvMvAwO72i1MQJfX1ahjcXPBaJn5os=;
	b=az3vttcPr+xPIMW9CIIKRbjWz49F3hk8ZHz0EnGfx2lmSUeD/BZGzV+ftZH+lWFYWL
	hE7zq9zNOREkPN2S8q0Am6bIv/mhqH/a33Yc/6y+3loEq8+WpTxmSWkKWmU9AgnZr5YD
	97roxpTvxl2+QkDpV17CeoqwO2bGYgyTO/IsosJ0CHDk5wZbFDTaTi3o5lxTETPYoJGJ
	Cg18Tl28YpJ09pQS2y/WekA4MhlNwrXgKffjVpYSgx7sVZtaLkXDXLotR8PGb68QpMzT
	B1nn/q35u2ImLQF+Hpy1Bk8btu2rfPfxyNasHxGf6tNMtdw0p8e9AxiReNBnjtqEyBHF
	+RwA==
X-Gm-Message-State: AKwxytftRSx3HUo6t5JQZ45EN2+IB81mcQ4sQ4ED+FSGsFaGpFUarKyr
	DgPyxc8cRzG7oOzYNTE5d/xNHW5eYng=
X-Received: by 10.200.35.78 with SMTP id b14mr23261394qtb.260.1515515930772;
	Tue, 09 Jan 2018 08:38:50 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id
	e63sm9521366qkb.46.2018.01.09.08.38.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Jan 2018 08:38:50 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1515506513-31961-1-git-send-email-peter.maydell@linaro.org>
	<1515506513-31961-4-git-send-email-peter.maydell@linaro.org>
	<12647bf7-eb9f-889a-76e0-32fb1f799160@amsat.org>
	<CAFEAcA9Gd6qLqFfrmzj4w69=SozWyP8D5mbGSaGEvw0BhwnyjA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <bd8da759-6e40-7fbe-3c1e-a400d9e84d5c@amsat.org>
Date: Tue, 9 Jan 2018 13:38:47 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9Gd6qLqFfrmzj4w69=SozWyP8D5mbGSaGEvw0BhwnyjA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 3/4] hw/sd/ssi-sd: Reset SD card
 on controller reset
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
Cc: qemu-stable <qemu-stable@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2f76mrPb8e6M


On 01/09/2018 01:28 PM, Peter Maydell wrote:
> On 9 January 2018 at 16:25, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> Hi Peter,
>>
>> On 01/09/2018 11:01 AM, Peter Maydell wrote:
>>> Since ssi-sd is still using the legacy SD card API, the SD
>>> card created by sd_init() is not plugged into any bus. This
>>> means that the controller has to reset it manually.
>>>
>>> Failing to do this mostly didn't affect the guest since the
>>> guest typically does a programmed SD card reset as part of
>>> its SD controller driver initialization, but meant that
>>> migration failed because it's only in sd_reset() that we
>>> set up the wpgrps_size field.
>>>
>>> In the case of sd-ssi, we have to implement an entire
>>> reset function since there wasn't one previously, and
>>> that requires a QOM cast macro that got omitted when this
>>> device was QOMified.
>>>
>>> Cc: qemu-stable@nongnu.org
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>> ---
>>>  hw/sd/ssi-sd.c | 24 +++++++++++++++++++++++-
>>>  1 file changed, 23 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
>>> index 24001dc..30d2a87 100644
>>> --- a/hw/sd/ssi-sd.c
>>> +++ b/hw/sd/ssi-sd.c
>>> @@ -50,6 +50,9 @@ typedef struct {
>>>      SDState *sd;
>>>  } ssi_sd_state;
>>>
>>> +#define TYPE_SSI_SD "ssi-sd"
>>> +#define SSI_SD(obj) OBJECT_CHECK(ssi_sd_state, (obj), TYPE_SSI_SD)
>>> +
>>>  /* State word bits.  */
>>>  #define SSI_SDR_LOCKED          0x0001
>>>  #define SSI_SDR_WP_ERASE        0x0002
>>> @@ -251,6 +254,24 @@ static void ssi_sd_realize(SSISlave *d, Error **errp)
>>>      }
>>>  }
>>>
>>> +static void ssi_sd_reset(DeviceState *dev)
>>> +{
>>> +    ssi_sd_state *s = SSI_SD(dev);
>>> +
>>> +    s->mode = SSI_SD_CMD;

And we can now drop the assignation in realize()

>>> +    s->cmd = 0;
>>
>> Not necessary/useful since s->mode = SSI_SD_CMD.
>>
>>> +    memset(s->cmdarg, 0, sizeof(s->cmdarg));
>>> +    memset(s->response, 0, sizeof(s->response));
>>
>> This might be cleaner to move it in ssi_sd_transfer() case SSI_SD_CMD.
>>
>>> +    s->arglen = 0;
>>
>> Not necessary/useful since s->mode = SSI_SD_CMD.
>>
>>> +    s->response_pos = 0;
>>
>> This might be safer to move this in ssi_sd_transfer() case SSI_SD_CMD.
>>
>>> +    s->stopping = 0;
>>
>> This might be cleaner to move it in ssi_sd_transfer() entry "Special
>> case else s->stopping = 0;"
> 
> I felt it was easier to reason about both (a) whether the reset
> function was correct and (b) what the state of the device might
> be at any point if the reset function just cleared everything
> back to the state it's in when the device is freshly created.

Got it!
