Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp1018976lfk;
        Thu, 18 Nov 2021 10:23:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyjohumvCPHRrxTpXvpYBUMhWHeBqc9wSQ9ORN8YlO4f3AXlztlaukd8ArM8orQ3KaACUlk
X-Received: by 2002:ab0:3ca0:: with SMTP id a32mr40282615uax.63.1637259794072;
        Thu, 18 Nov 2021 10:23:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637259794; cv=none;
        d=google.com; s=arc-20160816;
        b=xAO/h+CE5BXXp01hk9YslSda3Vro997ACPyE0+cs0z/l800TKwMaMDyr93rrnkPUH3
         tPjAtNNXuP4oAuPHnfm0QPJu9u2bHqKtXNLjlrc1jcA8Jlj1p9GGYYYqFQsa0OK61wk2
         qHNj0FHORs0t7mTsrH5A2nZuG7trTAhzQVrsdcNrgSY1vJen+VKgJLHSk2GjWUSK+e6W
         3UDqwnzS3Grzr0qBsTXfOhuZAvUojJIeQMLi5cCvcBBp82kk3BZUTerL7rBks5cD/8kU
         U45DZofSaNCWPWt3/zs89qsOU7kIr503cKNA3N6cET63WS/bBQjMIaNxvQd7lYfSn+PH
         lDTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=Uc7tlbpGjcGPyHrIgQttRXzytVC0cG3aEhjel0h+BGk=;
        b=iXL0EQVbD/wO+u9ngpAEPT+5iwKY9r07zLPMzyaBp8c+bMK5vR/4Nqfrdrk+ENHy0k
         y0Fx77xd5py0zGpEeglZuYXaVe5ajs/0sk5NrsH/jgM+A6acgOU3ljX153QOqzFTjkWF
         pcR2FY8iBtqKaGAzJl25PWOj2voS+8MES9vnE/iNkoThHgrTGluCCw8gVSNo4io1gtGc
         tfliy5Xkzi0mE2iZu+DX2LjXMOvDM8nvBTaZFGQ8L/4sa9NzfpydLzbDbUeXsUlyWJck
         whh0tShhkWRIP+9RTT20LebKIKFJoUAt7A248vlpPyWIw4ziWQGXVxsbWt7/0i6eVZQh
         /GPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cl1+cXLF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q188si1226323vkg.87.2021.11.18.10.23.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Nov 2021 10:23:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cl1+cXLF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mnm41-0006Li-Dd
	for alex.bennee@linaro.org; Thu, 18 Nov 2021 13:23:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnm3O-0006Go-Tj
 for qemu-arm@nongnu.org; Thu, 18 Nov 2021 13:22:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnm3L-0006yH-VD
 for qemu-arm@nongnu.org; Thu, 18 Nov 2021 13:22:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637259751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uc7tlbpGjcGPyHrIgQttRXzytVC0cG3aEhjel0h+BGk=;
 b=cl1+cXLFRnxypqpyOS4YmiSIMcPiauujz0pHw8h6CTl03YKScfTNsT0nXUDWJklQrNSckh
 3tGYiirA4Ru7ZCqNWK8T9iwc9G9J6nE1bQHdloSSXphfpQ2G1YYTW6cyxFPqCgm+7FnOQz
 YNbstX5cW5P3WpE+6OviMNCy7sogoQk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-310-sgZLzifROj-NEzqPAyuAKA-1; Thu, 18 Nov 2021 13:22:28 -0500
X-MC-Unique: sgZLzifROj-NEzqPAyuAKA-1
Received: by mail-wm1-f70.google.com with SMTP id
 v62-20020a1cac41000000b0033719a1a714so2944705wme.6
 for <qemu-arm@nongnu.org>; Thu, 18 Nov 2021 10:22:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Uc7tlbpGjcGPyHrIgQttRXzytVC0cG3aEhjel0h+BGk=;
 b=bqCt3vZEimf/rJyzMYUIJTefwectvl5PRQbAQNNbKWNLylei8DkxaPrFw9DMrt1yio
 /fHlbhmZgP555+RAM1eqTd3jIsiO38KpgzVTwZh4HIP35Q84PcnUGcl8btlIHC15crzJ
 GMo5+PfBZaHMpPNP6Rdj5iEA6x+n89hANxTZB5BiN/6VHZDVqrjOK1MO+Cz/6qcpAlEg
 2FYuxyMGqx8LHUwjooWRME4FAE2ov18yc0fwfc1J0Jc8f6EFSptr8IZis5WnrKWdzgms
 jAqtjxJZ2MWitM5m6bl9Ge2SfsiVDeKxUCd8yAZYjFNqO+wDeAoyE8ygvuQgjZLb9ojc
 cwvQ==
X-Gm-Message-State: AOAM531Z1kpvCQ28bxXhf1jXSCQ1279ncBuAybiz/6STcldcTVdLewoN
 Xjl6kW3nieJkL7BBtFWCZD9QbyPCkxYP/hzPZOvYkk3iz50U6i9BYGwsiNwBBHKHp4qpyMIoEK9
 FuALxPVWiSzIv
X-Received: by 2002:adf:cd8c:: with SMTP id q12mr33736141wrj.144.1637259746993; 
 Thu, 18 Nov 2021 10:22:26 -0800 (PST)
X-Received: by 2002:adf:cd8c:: with SMTP id q12mr33736107wrj.144.1637259746784; 
 Thu, 18 Nov 2021 10:22:26 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id b11sm9579744wmj.35.2021.11.18.10.22.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Nov 2021 10:22:26 -0800 (PST)
Message-ID: <cc814308-5ace-9398-3de4-70467deee183@redhat.com>
Date: Thu, 18 Nov 2021 19:22:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH-for-6.2?] docs: Render binary names as monospaced text
To: Eric Blake <eblake@redhat.com>
References: <20211118144317.4106651-1-philmd@redhat.com>
 <20211118154606.6mt73we5obw6pvav@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211118154606.6mt73we5obw6pvav@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.084, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, John G Johnson <john.g.johnson@oracle.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-devel@nongnu.org,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, virtio-fs@redhat.com,
 Hanna Reitz <hreitz@redhat.com>, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u+2xIO5pL/3M

On 11/18/21 16:46, Eric Blake wrote:
> On Thu, Nov 18, 2021 at 03:43:17PM +0100, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
> 
>> +++ b/docs/about/removed-features.rst
>> @@ -658,8 +658,8 @@ enforce that any failure to open the backing image (including if the
>>  backing file is missing or an incorrect format was specified) is an
>>  error when ``-u`` is not used.
>>  
>> -qemu-img amend to adjust backing file (removed in 6.1)
>> -''''''''''''''''''''''''''''''''''''''''''''''''''''''
>> +``qemu-img`` amend to adjust backing file (removed in 6.1)
>> +''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> 
> Why quote just qemu-img here,
> 
>>  
>>  The use of ``qemu-img amend`` to modify the name or format of a qcow2
> 
> when the context is obvious that it is the 'qemu-img amend' subcommand?

Because I was not careful enough :)

>>  backing image was never fully documented or tested, and interferes
>> @@ -670,8 +670,8 @@ backing chain should be performed with ``qemu-img rebase -u`` either
>>  before or after the remaining changes being performed by amend, as
>>  appropriate.
>>  
>> -qemu-img backing file without format (removed in 6.1)
>> -'''''''''''''''''''''''''''''''''''''''''''''''''''''
>> +``qemu-img`` backing file without format (removed in 6.1)
>> +'''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> 
> This one makes sense, though, as "backing" is not a qemu-img subcommand.
> 
>>  
>>  The use of ``qemu-img create``, ``qemu-img rebase``, or ``qemu-img
>>  convert`` to create or modify an image that depends on a backing file
>> diff --git a/docs/devel/build-system.rst b/docs/devel/build-system.rst
>> index 7a83f5fc0db..431caba7aa0 100644
>> --- a/docs/devel/build-system.rst
>> +++ b/docs/tools/qemu-nbd.rst
>> @@ -38,7 +38,7 @@ driver options if ``--image-opts`` is specified.
>>    supported. The common object types that it makes sense to define are the
>>    ``secret`` object, which is used to supply passwords and/or encryption
>>    keys, and the ``tls-creds`` object, which is used to supply TLS
>> -  credentials for the qemu-nbd server or client.
>> +  credentials for the ``qemu-nbd`` server or client.
>>  
>>  .. option:: -p, --port=PORT
>>  
>> @@ -238,7 +238,7 @@ daemon:
>>  Expose the guest-visible contents of a qcow2 file via a block device
>>  /dev/nbd0 (and possibly creating /dev/nbd0p1 and friends for
>>  partitions found within), then disconnect the device when done.
>> -Access to bind qemu-nbd to an /dev/nbd device generally requires root
>> +Access to bind ``qemu-nbd`` to an /dev/nbd device generally requires root
> 
> As long as you're touching this line, s/an/a/.

OK.

>>  privileges, and may also require the execution of ``modprobe nbd``
>>  to enable the kernel NBD client module.  *CAUTION*: Do not use
>>  this method to mount filesystems from an untrusted guest image - a
> 
> Overall looks like a nice changeset.
> 

