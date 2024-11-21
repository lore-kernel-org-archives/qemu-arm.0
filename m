Received: by 2002:a05:7022:213:b0:8f:43c:4b5e with SMTP id 19csp4345580dll;
        Thu, 21 Nov 2024 11:03:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHpe8Wr2mfvIHKrDH9M2Um16/hQK79OOrha4FEWLIc+aqCBY9ZsZxQjsqbVXDNtg+ymBNyd
X-Received: by 2002:a05:6214:c68:b0:6d4:2646:1094 with SMTP id 6a1803df08f44-6d450fe88admr4184106d6.2.1732215803281;
        Thu, 21 Nov 2024 11:03:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732215803; cv=none;
        d=google.com; s=arc-20240605;
        b=Cbv93+jiUH4baXjPKI47Unj00dE7DBYbuYXSm0S8iDu+B1VqvO4KgoWYfjI0aqt9rA
         NBw+4his0sa9YelMZkXz3RGNi4w/UZ/YPCpmPoJfMQW1LRSrN+Kcz0QheGI8k2Ifa3+i
         x26VQa7X7ELfXm1eVLZ2yq/mqrjrGIbJj7XL8iMbMWC6UCRY3hiUZAzehd/n9en30c77
         245TNqR/nUYpDeaUzB1eo0LTDoI2E/gz5Hs3dYcaue4MUwSjmkFuprciccHf1Hnp4qB7
         bQEGCX8MdYs/iKDJbD/GI3B1DfMJ9X002LSk+Le4rIT7ocvJ82JulBzEPXiGt8/iGRnN
         BzjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=aP1v1hQXZ39XefNc3OtxF2PCA/2zFy7aoMy3EmvieKk=;
        fh=wVPQWqTxHsMhgDFUYzS4WRCfPsDqkM1sZVnXLJCyo1A=;
        b=RSOYOmMMLqc3dxiCl1mSju4LIG9Y1jcpYv0K2/EiftPO20UaT/iNSQR7XIQcQXg6A3
         cD1NPIXD8vz+EiyYjFEyzVwFaD/auzij9foYMFK/8JNCkHbbyq67sG31mnaC/EvPlahr
         BYJcI6oQGfJALFLIOCkuUS7kMgvn2eSfI/5deRGBeByIn66LMvrnQZnPnwtd3WsdjrXD
         vWSVtKiGIOPZ0eqVX1m4TVsg89jEYuVMsHX0p/ji2YUPogiAtSh5Le09gVVtqWPF4KKl
         148ux8wHjEh9FY/JrwtluHCpMdEl/ETcjQDg6OiOwdADmjHDWTFSPf8piAVp/xpGvViO
         jnfg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XmSubXme;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d451a99b43si1369206d6.153.2024.11.21.11.03.23
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 11:03:23 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XmSubXme;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732215802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=aP1v1hQXZ39XefNc3OtxF2PCA/2zFy7aoMy3EmvieKk=;
	b=XmSubXmedSQ2imBmosJSFSbJi94dzji5TVMGS0zT9gK0N6OHKjY2H8achP27ks9p8B1iau
	B2sTeMSeNWRttITiinRlNyb3D28dWSDdlv+Uahqxn2yR4ElFrl6Jne/QEKHkisUN6KjVJA
	boLXV1EmWem/JbFe7ZOxt0mBlzpjp/g=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-318-b_sNW8b-ODeNeC_Kg0co8g-1; Thu, 21 Nov 2024 14:03:19 -0500
X-MC-Unique: b_sNW8b-ODeNeC_Kg0co8g-1
X-Mimecast-MFC-AGG-ID: b_sNW8b-ODeNeC_Kg0co8g
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5d01059bc97so491187a12.2
        for <alex.bennee@linaro.org>; Thu, 21 Nov 2024 11:03:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732215799; x=1732820599;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aP1v1hQXZ39XefNc3OtxF2PCA/2zFy7aoMy3EmvieKk=;
        b=kT1QOZ9p7oq8T1RfHKFKLxcrKDr/8YcRACmG16BTjpsNjRnIGLXszbql9yLE/k0FB5
         5Brt4vIm7x5DgK7milRx5AX0zgCfP/v+j6kkR2EVDkJpbdWo//CWCpXoHTRUQbZBxdAi
         ClsIb40Iqy6pnKCi2VVrv5rr2znOsmPF09lP9VbyMbmZA/7gIbFH4lSrwnsNXugAN48U
         68EfCy/ReIe2NpQVjmkA7Uf+310nPIDyhxreBykj11oPBv6/FTUkMt6ZLi5uSyJ6S2fb
         YSNFwWx10bVQ+njj68MmNYmLozUxiNWbaBodRSbr4Wba2p/udJryCQf17o8oOMUAqvQN
         W6Ow==
X-Gm-Message-State: AOJu0YymJzAVSnelhBgQu1OXsuHi1qQp+1JmDVq/7HOJj7Ju+9vDkNhc
	MYza6bYn5thtEWuGSh3miLxI7rUwpI4tdyFX2LwBpbIoxBwbsSHAawbV24fAHGXbLWCkxgwwSWM
	1+54j0woCMrAaEQGQWYdTelmjVIJaIJhDwRMf3dNk8t7sOy1cIXCyXEosU4S/B2cElOizNBu3JM
	MJdYVkfTlIXU+tG4W46RPhdRRRVFkWEzkXhQ==
X-Gm-Gg: ASbGnctsoXbFixd/geWHHcqIyTTU+1TEdYmeyr6xO+GvL6MSoARA0k6dECZXkQLMeOk
	JM4VYTsL6f6NtxipRWtQzA7MzrXulQ/64b7PJ8pzEP38iOMl5Y44dxdvhDflT1pp/5hfAnBLtwL
	BfT5wZ2xs6I4QnJGfxxhDublKVW86ZXkrVl/pmskRC2ykhZS94+IQvNEyZjcpsxWJ2/aoFtB2b7
	hdPhvjraL2hYIPfUhhXa2NskM9N+EejYyWJsksb4oTqiaS5DZApkptPNk7LQ8N3YdBsDptNHAl6
	OHc=
X-Received: by 2002:a17:906:18b2:b0:aa5:a22:8f5b with SMTP id a640c23a62f3a-aa50a2291camr22541166b.38.1732215798597;
        Thu, 21 Nov 2024 11:03:18 -0800 (PST)
X-Received: by 2002:a17:906:18b2:b0:aa5:a22:8f5b with SMTP id a640c23a62f3a-aa50a2291camr22533966b.38.1732215798121;
        Thu, 21 Nov 2024 11:03:18 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-42-51-70.web.vodafone.de. [109.42.51.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b2f4d94sm4553066b.63.2024.11.21.11.03.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Nov 2024 11:03:17 -0800 (PST)
Message-ID: <a2c76eb9-877c-4d71-a168-aa1ff82b2973@redhat.com>
Date: Thu, 21 Nov 2024 20:03:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/39] tests/functional: logs details of console
 interaction operations
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alexandre Iooss <erdnaxe@crans.org>, qemu-riscv@nongnu.org,
 Thomas Huth <huth@tuxfamily.org>, Bernhard Beschow <shentey@gmail.com>,
 Eric Farman <farman@linux.ibm.com>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-s390x@nongnu.org, Niek Linnenbank <nieklinnenbank@gmail.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-rust@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Markus Armbruster <armbru@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Ani Sinha <anisinha@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
 <20241121165806.476008-13-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241121165806.476008-13-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 98z1Puob3eDpF9SGoOld5LI5kol_ZIEJQqsOZiB2K2A_1732215799
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: sRfeZV0k75A3

On 21/11/2024 17.57, Alex Bennée wrote:
> From: Daniel P. Berrangé <berrange@redhat.com>
> 
> When functional tests go wrong, it will often be related to the console
> interaction wait state. By logging the messages that we're looking for,
> and data we're about to be sending, it'll be easier to diagnose where
> tests are getting stuck.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> Message-Id: <20241121154218.1423005-13-berrange@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/functional/qemu_test/cmd.py | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/tests/functional/qemu_test/cmd.py b/tests/functional/qemu_test/cmd.py
> index cbabb1ceed..98722a9cf6 100644
> --- a/tests/functional/qemu_test/cmd.py
> +++ b/tests/functional/qemu_test/cmd.py
> @@ -85,6 +85,9 @@ def _console_interaction(test, success_message, failure_message,
>           vm = test.vm
>       console = vm.console_file
>       console_logger = logging.getLogger('console')
> +    test.log.debug(
> +        f"Console interaction: success_msg='{success_message}' " +
> +        f"failure_msg='{failure_message}' send_string='{send_string}'")
>       while True:
>           if send_string:
>               vm.console_socket.sendall(send_string.encode())

Reviewed-by: Thomas Huth <thuth@redhat.com>
