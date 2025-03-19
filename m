Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp178927njc;
        Wed, 19 Mar 2025 05:03:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXid8duB4a2pmdtxdoTj3I/S7qzyVigTJuhy0ilHWHsOsR9DYz8UIIiT1rbkdpAAvbgAc5YePaBaL4BFg==@linaro.org
X-Google-Smtp-Source: AGHT+IErIqxQzVBUf7XBqTjwii6PoMWwTKWgpYJjVnv8F0E4aFH9nZ5i4Foun1Y8Iy6Pnad4ipGV
X-Received: by 2002:a05:6102:3f53:b0:4c3:6544:c250 with SMTP id ada2fe7eead31-4c4ec85502cmr1340955137.23.1742385791635;
        Wed, 19 Mar 2025 05:03:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742385791; cv=none;
        d=google.com; s=arc-20240605;
        b=SDub2d2ENOEtujE0FSfzKmPOm9qBzJ99kmDwtHRDaOqySfgA9/pbOEqmfH6tXSdzXm
         j0tw1G2OzGExcculYVlvSeCUlPsa6lnvaiBEisOEwpjw35m2AlUvbMdyLkshD5JUi+uC
         8fF3Qev50diYFpNUnj2MjhwYR3Y8oWOhi9xyXTwERDbMqiScvqM6zLK1PQX8/1rvaqRc
         j2QT+RS5FKMjM9nmImVC7vXhnivg3EoaWZpD22LRSL6j9oNPvFU7GEf6hwXmDqpyuGuS
         gcQAyWm2mcf624d55fKJQP1kXA37c6x0NEW1Jh4nEgacvxVG2cEidm7gICTLI+bqYEDv
         r7Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Q989oy01J19ImCTcEz99g5ec4PTa7266Oa0rghaHGeg=;
        fh=6K1TPVQTmUY2KxLsWUS5/kqoKEcgbN9WKggbv2XSi5o=;
        b=GMZOQlDfalteFLWinvj8Ois/nLKmbhHuMVMwNTxnM+gr+6GxIcCRwK8/xQ5+vieEjJ
         K2dq37kyC4gE82peGiYVy7dEIzFpAMeilo48+/7TmTeQkfgj9RrZyds5ldCcuzHcZKPW
         q48rPkfsjYyRjMn/oD/sy5i19eBRtRkSl0WJS353cV9uDnJi+km2z/jKxdFCyvLDjXvh
         zTUCR6Kaq8ziVIpNzbgGctpz8ePng790zjnINC1MYNd8mfRFCuUtgXFm9JjxFhs5Hxiy
         fnnc18ZZH8a+9k5hGRzSya+4CmbMPDqqJ1AdC3eS7Hl7b+VsZb5equ25Dl+x3yh1cEHW
         9qbQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kKug6wd4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4c374ac2111si3401021137.404.2025.03.19.05.03.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Mar 2025 05:03:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kKug6wd4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tus8A-0007Hk-TH; Wed, 19 Mar 2025 08:02:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tus7o-0007DO-78
 for qemu-devel@nongnu.org; Wed, 19 Mar 2025 08:02:29 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tus7k-0002Xf-HT
 for qemu-devel@nongnu.org; Wed, 19 Mar 2025 08:02:18 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-39143200ddaso4276448f8f.1
 for <qemu-devel@nongnu.org>; Wed, 19 Mar 2025 05:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742385734; x=1742990534; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Q989oy01J19ImCTcEz99g5ec4PTa7266Oa0rghaHGeg=;
 b=kKug6wd4tpcXxpY0G6tzRQLPkd+wvZhEIAj7/l1N+/Qlrj0j/s7wkw4lygW+m3+JGN
 WGLPbf557LS8vxYxEhRGtyb4+15tPnfLHIT8j88QeMBjbk1aSRhUoYvodrWaco2vpa5P
 IZymw1J947LgW2qFrieye5kpNEAYy4GgXD/ftSiBXlkaTnZPwyDaKPKB/oQc4nbdptvj
 Jk6rInSUjIX179SbmI3L0wmbo9++7id3p1ACIe9qj9A7YE/RIZ8lpDldhBdYz8IxBbW2
 mC30eS+hFGm9BsZX89wac9odmerI78fWEU3Cv2CVgryDAlcIbZvkg5GzutCcks25gtKO
 yigg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742385734; x=1742990534;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q989oy01J19ImCTcEz99g5ec4PTa7266Oa0rghaHGeg=;
 b=tkgW8s6cpbFEGDVe0Bf87k5VzK2ZTjcTnVYFHg0RI8NMYvt/GVRdtHCCiDVhzTZhcY
 aNVjGSXbXc9hrDMeUjjukEAZC9LuIgVMwZOjcZasRo1PthhEms6IyKWhFkPmoaD6P37t
 qSCAtca+kq+76xzW9KERvOywgSQIN7kEUkqndwKnTSiC09LFLHIyI+7p2r8qCRaVQAiq
 JaCShNzluyDxT2DlZlLYA0GvoZbEOZFnAC05SwJ3nBmdUoBbX0L0g84FNPnOBNdwju6P
 jidTbS/5jE33dCcDz74wKQSe5GRi+QgqSWTlYQndSBS5MvQfxcrtvJie0bxUYeFxA2vx
 TxRQ==
X-Gm-Message-State: AOJu0YyFPKyiDbiELm9F0aJpYc6zW8+1hz50mQqKk3ZdilCrThPMJ0Kl
 v63rrQSToMWfIMKB++lWnOwlErk5pu4VEwR69zMA2JSmbZJuDns/FWFMXKTbf08=
X-Gm-Gg: ASbGncs5lITGGsYxDrEhVho4kOtU+UKoE12qUj0bPz4fO+B465iddIBxmHmyE+pXEUQ
 tDBaVM4T7xn/M1BPbHSUwHlh/hdIQONM5HuAQHAH538FXNXuzbY2t6D3OttnEjRwA+WYnNKQoa3
 GKVS4WFCJGag1/NtTv0xnyXVhwyeoKy5+Dy2XWhBLIAb6Ar00Slnl+jvQBfzTOJxe2kgaWFb4z8
 95s+obd/fUewUOzK80SM+IsJcsAPA0USk+FgS75hgqGo0IILqRA5PpPQtaFfM1IWokZlWeaabtR
 BIMiK/cxjNUs6rW89RVzaFOy8Sx0O258Y7K9PnoLGx5zw3MQHq06IOFebpROgd2TNVVoCTsPURb
 i5w1sSoI9TgxK
X-Received: by 2002:a5d:47a8:0:b0:391:22a9:4408 with SMTP id
 ffacd0b85a97d-399739bedcbmr2589310f8f.16.1742385734236; 
 Wed, 19 Mar 2025 05:02:14 -0700 (PDT)
Received: from [192.168.69.235] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f6befesm16730985e9.25.2025.03.19.05.02.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 05:02:13 -0700 (PDT)
Message-ID: <d301219c-8d06-4577-b688-52c225d488be@linaro.org>
Date: Wed, 19 Mar 2025 13:02:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 16/24] hw/uefi: add UEFI_VARS to Kconfig
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Bibo Mao <maobibo@loongson.cn>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
References: <20250304124815.591749-1-kraxel@redhat.com>
 <20250304124815.591749-17-kraxel@redhat.com> <Z9qqLUJ-1KTKyJzX@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <Z9qqLUJ-1KTKyJzX@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 0t6T52PU2l6k

On 19/3/25 12:27, Daniel P. Berrangé wrote:
> On Tue, Mar 04, 2025 at 01:48:04PM +0100, Gerd Hoffmann wrote:
>> Add UEFI_VARS config option, enable by default for x86_64 and aarch64.
>>
>> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>> Message-ID: <20250225163031.1409078-17-kraxel@redhat.com>
>> ---
>>   hw/Kconfig      | 1 +
>>   hw/uefi/Kconfig | 3 +++
>>   2 files changed, 4 insertions(+)
>>   create mode 100644 hw/uefi/Kconfig
>>
>> diff --git a/hw/Kconfig b/hw/Kconfig
>> index 1b4e9bb07f7d..c4dfe2e7af7c 100644
>> --- a/hw/Kconfig
>> +++ b/hw/Kconfig
>> @@ -37,6 +37,7 @@ source smbios/Kconfig
>>   source ssi/Kconfig
>>   source timer/Kconfig
>>   source tpm/Kconfig
>> +source uefi/Kconfig
>>   source ufs/Kconfig
>>   source usb/Kconfig
>>   source virtio/Kconfig
>> diff --git a/hw/uefi/Kconfig b/hw/uefi/Kconfig
>> new file mode 100644
>> index 000000000000..ca6c2bc46a96
>> --- /dev/null
>> +++ b/hw/uefi/Kconfig
>> @@ -0,0 +1,3 @@
>> +config UEFI_VARS
>> +	bool
>> +        default y if X86_64 || AARCH64
> 
> RSICV64 uses UEFI too,

and LoongArch IIRC.

> is something extra needed before it can be
> enabled there too, as it would be desirable to introduce it on all
> UEFI targets concurrently.
> 
> With regards,
> Daniel

