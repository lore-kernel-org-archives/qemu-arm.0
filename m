Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp8667724wrx;
        Fri, 8 Mar 2019 10:07:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqziYgALBCAEPfXgi+kem9cjZOxSV2Ui1hEpB8EjX85sDfPloGCVPVecF4vt/QFfpni/PAw9
X-Received: by 2002:a25:5906:: with SMTP id n6mr16054345ybb.412.1552068474801;
        Fri, 08 Mar 2019 10:07:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552068474; cv=none;
        d=google.com; s=arc-20160816;
        b=oFhN31NhsZdDc9hlTwFJUJ/krEOoI1/7VATNrlUc5E453WnDHOXyQ8UYOdCVl7pZVc
         4A6NP1YLdX5JGlCEf33n713k150rrwywOIW05dCIP5Tx6rqtSz61dW6DhU/DiYSp2iro
         sFH2w+ubgjOeD8VMU//bIUg8Um9j0qXo9bo2kKA6FsKfxyAROXL8hVQdXYj1X+yUfFAo
         xa5S1tGGHQr4ckrnrU0alh3attu7LJ4zDOW2QHmt5TRhTC7OZMZg3M7CXDNf+eVVMf4E
         YZMoCwgE1CUsBvOCPJjJsLWLO3gPW/wlU7mxFB1JCBCMBN7DyL1IDQ7KFBGlYnmNU7/p
         2GgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=SIO4EtvKP79qbO07hmJtCLL8AOy6PpvWuWQ7BXZVSII=;
        b=s59VgAxNcgZd2uUp6Vo7p9nu0xT8GAdEiBFBFEbq7xBJOLiIIUoboUQuabDAKfYNiJ
         ZhN2+Oj0jY0VS0qa++9Nt18XTinAwhdzTlaK8ycAcehz+6szkHCW2qTgWAapJRbLyhmY
         ZvXJJjP3uTWUPX2oGtw7CZJ8QvDpLTMX5XAhfm04puM54mRcND9fuSkPRi9MtY7HgrYQ
         roXNDMZPNfCY4WqcTt3rkg41i+kxT8rchKENISr6p38FSmUH57vq6TVaPPCeawZFmPHw
         lKkMj+LA66MNUTEkiOBNNvWFWFvRjU6O401mAODDqgx1MVj4wlMhIgK9NkZdnPSOyG3m
         4SUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 126si4978366ybe.430.2019.03.08.10.07.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Mar 2019 10:07:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:47937 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2JuU-0005CN-5r
	for alex.bennee@linaro.org; Fri, 08 Mar 2019 13:07:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46633)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h2JuF-0005BR-4Z
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 13:07:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h2JuD-00058p-3u
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 13:07:39 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:54383)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1h2JuB-0004zQ-7m
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 13:07:37 -0500
Received: by mail-wm1-f67.google.com with SMTP id f3so13477458wmj.4
	for <qemu-arm@nongnu.org>; Fri, 08 Mar 2019 10:07:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=SIO4EtvKP79qbO07hmJtCLL8AOy6PpvWuWQ7BXZVSII=;
	b=IQ6D12IuPyOPFyKAzl/nJVkjk5StZvOxVoXd0qGvhEHtw5YzWVaFGqxqU4KJqIu5x8
	dk8sz6IFwzVpoWtfKhnta8uUKLlrkHp9XN47M7IroHzREV/olBv9bJSrc+w3OCZFd3sN
	DfKwf0G/29Ehkh3go1G3XWvOXf5U3lN4dKxCOQ1Arg5fMa34FUFuAe9DDzrtv3lbDbXq
	wh/rOSIG3/Qf5tHwI7OiD8HF7PTyuWsCoGPY8ppcxisexDqZ+MP7Cro6dQ3m5kPMKr0x
	31jtJ5bqwZneabs1RviMnh8k8hybO+jQ2mVEzrmIy8Q6Ws9sh5StqeWPhoT2LT4E7ntQ
	/nMg==
X-Gm-Message-State: APjAAAUOOmV6barvVjSYp44G2mncWoX1uBwHSEU1iAyJYCHP4ewGrndb
	123ae0zD+yaS11FVIIruFYEy2A==
X-Received: by 2002:a1c:9dcc:: with SMTP id g195mr10499246wme.9.1552068450550; 
	Fri, 08 Mar 2019 10:07:30 -0800 (PST)
Received: from [192.168.1.40] (43.red-88-25-181.staticip.rima-tde.net.
	[88.25.181.43]) by smtp.gmail.com with ESMTPSA id
	a20sm4465663wmb.17.2019.03.08.10.07.28
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Mar 2019 10:07:29 -0800 (PST)
To: Eric Blake <eblake@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-devel@nongnu.org
References: <20190308013222.12524-1-philmd@redhat.com>
	<20190308013222.12524-14-philmd@redhat.com>
	<0e007e09-cf54-312b-9563-59f3994209bf@redhat.com>
	<40319ac6-4545-4e7b-0339-8229727355e3@redhat.com>
	<a3c759a5-73df-f481-ba21-48ece92f1185@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <9f1cdb48-3262-de5e-a500-1dfb3d6372e5@redhat.com>
Date: Fri, 8 Mar 2019 19:07:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <a3c759a5-73df-f481-ba21-48ece92f1185@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-arm] [PATCH v2 13/18] hw/nvram/fw_cfg: Add QMP 'info
 fw_cfg' command
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: D8YvkmQffl8a

On 3/8/19 6:31 PM, Eric Blake wrote:
> On 3/8/19 5:08 AM, Philippe Mathieu-Daudé wrote:
> 
>>>> {
>>>>     "return": [
>>>>         {
>>>>             "architecture_specific": false,
>>>>             "key": 0,
>>>>             "writeable": false,
>>>>             "size": 4,
>>>>             "keyname": "signature"
>>>
>>> You could return a base64-encoded representation of the field (we do
>>> that in other interfaces where raw binary can't be passed reliably over
>>> JSON).  For 4 bytes, that makes sense,
>>>
>>>
>>>>         {
>>>>             "architecture_specific": true,
>>>>             "key": 3,
>>>>             "writeable": false,
>>>>             "size": 324,
>>>>             "keyname": "e820_tables"
>>>
>>> for 324 bytes, it gets a bit long. Still, may be worth it for the added
>>> debug visibility.
>>
>> Until you see values in the next patch...:
>>
>> $ (echo info fw_cfg; echo q) | qemu-system-x86_64 -S -monitor stdio
>> Selector  Well-Known Key  Pathname ArchSpec Perm   Size Order Hex Data
>> [...]
>>  0x0019   file_dir                           RO    2052       0000000b..
>>  0x0022   file: etc/acpi/tables              RO  131072  130  46414353..
> 
> Yeah, that's a no-go.
>>
>> What about using a 512B limit on this QMP answer?
> 
> Seems reasonable. Either omit the field when its size exceeds the limit,
> or use the field to give a truncated version (where the size field still
> shows the full length, either way).

OK.

>>>> +# @path: If the key is a 'file', the named file path.
>>>> +# @order: If the key is a 'file', the named file order.
>>>> +#
>>>> +# Since 4.0
>>>> +##
>>>> +{ 'struct': 'FirmwareConfigurationItem',
>>>> +  'data': { 'key': 'uint16',
>>>> +            '*keyname': 'str',
>>>> +            'architecture_specific': 'bool',
>>>> +            'writeable': 'bool',
>>>> +            '*data': 'str',
>>>> +            'size': 'int',
>>>> +            '*path': 'str',
>>>> +            '*order': 'int' } }
>>>
>>> Is it worth making 'keyname' an enum type, and turning this into a flat
>>> union where 'path' and 'order' appear on the branch associated with
>>> 'file', and where all other well-known keynames have smaller branches?
>>
>> I have no idea about that, I will have a look at QMP flat unions.
> 
> Markus can help if you get stuck on what it might look like. But by now,
> there are several examples in .qapi files to copy from (look for
> 'discriminator').

OK.

>>
>>>> +
>>>> +
>>>> +##
>>>> +# @query-fw_cfg-items:
>>>
>>> That looks weird to mix - and _. Any reason we can't just go with
>>> query-firmware-config?
>>
>> Way better! I'll use query-firmware-config-items.
> 
> Do we need the -items suffix? Also, is there a chance that we might ever
> want to extend the command to return more information that is global to
> firmware-config rather than per-item?

Laszlo suggested it could be useful to ask for a specific item (with the
full data encoded?).

>>>> +{ 'command': 'query-fw_cfg-items', 'returns': ['FirmwareConfigurationItem']}
> 
> As written, this results in:
> 
> { "return": [ { ... }, { ... } ] }
> 
> but if you add a layer of nesting, you could have easier extensions:
> 
> { "return": { "global": {}, "items": [ { ... }, { ... } ] } }
> 

Oh I guess I got it, I'll try it.

Thanks!

Phil.
