Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp1528978wrs;
        Wed, 13 Mar 2019 04:25:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwLbVOILTdAKcI93yTKvF6VJxGLunKc28i1qEv7GmSaAthtArBEo3av8W9ZwnGLgd9uhjfv
X-Received: by 2002:a25:73d3:: with SMTP id o202mr36144502ybc.1.1552476329482;
        Wed, 13 Mar 2019 04:25:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552476329; cv=none;
        d=google.com; s=arc-20160816;
        b=WUhK1FS/xWhVYfScInj0X55cb6vl+F7M9QwQYj/3Vp4KeAi7YbCGVNnVPP9zLf2L7e
         pJ1aGry8ayeGJK7H6ZP7aZTpvois5hm8bmA9i/qrLXBzLCoqQ8yirVD9SCo9dyK/1WFM
         sOvP15hK8ZKjEAm86dXca5UQvlkiyRshRQ+41+K6HvsDMssq6SnjdvE9bRh/k/K8bra9
         gFTWMB2sm4q+fCX8/se1UYyjkPqwNpHCOgwKHA2/mj2wSmHfk85uDzStJQc24Is7APyd
         NxEPhGgg5X1eC+Obyp80v9ArvbSbNlP3Xncj0qXfxUvMHhs0KyNPpilcCGBihCLmJJdt
         3aLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=VfuiJtZqSdlxDKq6dPSmyein3HpHUmDiCDrIFggn8N4=;
        b=a3RcAffXm6xr0AWueEqs5SnAh3PLXtjeyxGxRMDueVXeC1GsGli49Ka4rUPs9RzDZL
         LlW5xjOg1It9JK9PvpMqHvjhf4frAKrDFKXulwMzrtjsb3ELKYV34JOFKueWqAoJKRk6
         0+6dM6fDuaFHMyH7nG6xCQuw9oaztotrsXi00MuHyycvZBmPrWBBejBkwIYpjDY3WmeN
         G1BeFDZXfcWrMzr1n0r5N5onb7j3WReIZZ4xRlc8+/5ojwk4ilHS1+NWb62arcPlfVPk
         ZDkev5xGi1upInCUBGPB3m7ZGomBL0dDkIDEEXzDoq5N2rGVQuqa2Mx1f9WadyzUbpFq
         I07Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v66si289164ybc.283.2019.03.13.04.25.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Mar 2019 04:25:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:42535 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h420m-0003zw-Ug
	for alex.bennee@linaro.org; Wed, 13 Mar 2019 07:25:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47237)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h420d-0003zl-Dk
	for qemu-arm@nongnu.org; Wed, 13 Mar 2019 07:25:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h420c-0007GU-HD
	for qemu-arm@nongnu.org; Wed, 13 Mar 2019 07:25:19 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44594)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1h420c-0007G4-Ay
	for qemu-arm@nongnu.org; Wed, 13 Mar 2019 07:25:18 -0400
Received: by mail-wr1-f65.google.com with SMTP id w2so1536145wrt.11
	for <qemu-arm@nongnu.org>; Wed, 13 Mar 2019 04:25:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=VfuiJtZqSdlxDKq6dPSmyein3HpHUmDiCDrIFggn8N4=;
	b=U6EAf1n22EUjh+Qpp5gFx4dXjCDfKj7Ak+HCSySW7a1TRjc4tJCuMmYheEjj9MKiRR
	jTr8IV1l6CXjQs4tBY2v4lrcDzM7rAfiQ088e2jBEk1uAcR050bHmFr+W2JhbiUHf6oY
	D42HqWQaJiiWSaKsiyQep9PrKCUxhp9LsFpmWOcXN//yCWkQ3lPF1LVl2o7xTsL4spKa
	RjO8/Pq4s5FX2dKmWdt2wFVp41oJGWFOEzjNwQ93onmbseXqM3LCQ9Ywl1OjVqCpruNb
	jkX3cjlGRP9B0k8LZFjXv21lcgTsh/o+KYd/wwUSa2Sy9a4x+tJv5j9hBbq0gjJIHx3j
	jlcQ==
X-Gm-Message-State: APjAAAWLrO5Y1Dk2S616lN6y7QnVcGwkpNaL66d1RtOluXi/Y6g8bNgh
	unx89ngMDSpZ2OUravI3d6Qx7g==
X-Received: by 2002:a5d:680d:: with SMTP id w13mr25881119wru.196.1552476317144;
	Wed, 13 Mar 2019 04:25:17 -0700 (PDT)
Received: from [10.32.224.47] (red-hat-inc.vlan560.asr1.mad1.gblx.net.
	[159.63.51.90]) by smtp.gmail.com with ESMTPSA id
	m189sm1742628wmf.7.2019.03.13.04.25.15
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Mar 2019 04:25:16 -0700 (PDT)
To: Laszlo Ersek <lersek@redhat.com>, qemu-devel@nongnu.org
References: <20190312225632.29777-1-philmd@redhat.com>
	<d0bba5e7-b144-9050-3339-08a55bd4c108@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <4198665d-a83f-be04-25a1-c8f9a5e4acb8@redhat.com>
Date: Wed, 13 Mar 2019 12:25:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <d0bba5e7-b144-9050-3339-08a55bd4c108@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-arm] [PATCH v4 0/4] fw_cfg: Add
 edk2_add_host_crypto_policy()
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
	"Daniel P . Berrange" <berrange@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dTFxZ1O1kw6q

On 3/13/19 11:44 AM, Laszlo Ersek wrote:
> On 03/12/19 23:56, Philippe Mathieu-Daudé wrote:
>> Hi,
>>
>> This series consists of:
>> - add fw_cfg_add_file_from_host()
>> - add edk2_add_host_crypto_policy() and the Edk2Crypto object
>>
>> The Edk2Crypto object is used to hold configuration values specific
>> to EDK2.
>>
>> The edk2_add_host_crypto_policy() function loads crypto policies
>> from the host, and register them as fw_cfg named file items.
>>
>> So far only the 'https' policy is supported.
>>
>> A usercase example is the 'HTTPS Boof' feature of OVMF [*].
>>
>> Usage example:
>>
>> $ qemu-system-x86_64 \
>>     --object edk2_crypto,id=https,\
>>         ciphers=/etc/crypto-policies/back-ends/openssl.config,\
>>         cacerts=/etc/pki/ca-trust/extracted/edk2/cacerts.bin
>>
>> (On Fedora these files are provided by the ca-certificates and
>> crypto-policies packages).
>>
>> [*]: https://github.com/tianocore/edk2/blob/master/OvmfPkg/README
>>
>> Since v3:
>> - Addressed Markus' comments (do not care about heap)
>> Since v2:
>> - Split of
>> Since v1:
>> - Addressed Michael and Laszlo comments.
>>
>> Please review,
> 
> sorry about seeing this just now. My email load has been extreme, and
> the only way I can deal with it is a *strict* FIFO approach. It gives me
> unparalleled throughput [*] and acceptable latency, but it does cause me
> to respond to out-of-date emails on occasion.
> 
> [*] "unparalleled" not by other people, but by other workflows I could
> choose
> 
> Nevertheless I think my comments under v3 apply just the same here.

Yes, I'll work on v5 based on your v3 comments.

Thanks!

Phil.
