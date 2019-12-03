Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp1237002lfc;
        Tue, 3 Dec 2019 01:09:11 -0800 (PST)
X-Google-Smtp-Source: APXvYqxSiZP6NNKjVy+by5TI6/uzV8A1ORsvwSHZe7dsn1dQSjNnukvpSqoSeBOmleZkqR/O/J7+
X-Received: by 2002:a05:620a:1102:: with SMTP id o2mr4011919qkk.278.1575364151138;
        Tue, 03 Dec 2019 01:09:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575364151; cv=none;
        d=google.com; s=arc-20160816;
        b=NA730W4v255p0xnbWbXbPRNHHqTOJfUSoIss1B+ix6B/JKkGbnRh4GDElrWyD4le/w
         fYmnj+L72yWg0ONlKx6qfcrxj+U1e6db6cKI2aM9eu0cIcbueiHrwxZ4Jq2hvQAJjstl
         3nYKfrVFyjnOz47gf7bRtPPOteeTJ2f8jrzteQ+DKWLCzSlCXfJYV5v7Iyhvm1MDMpav
         ceSySoq0NDsGTqxjrSZapWqZgNx6mV4leB5PkbcJEpXzBu69quU5xS+fbzPB5FtkgYjY
         uNjh2yEQMqbtQevyBG+17nERb7211HwS3pl7pizWm89U6MoOkilZcpAz/JclxGQbBZrM
         f2dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=J9wA7CJmUNjsbOGNQtUhipGAMwMyhN4/fwSlPUTcVls=;
        b=dsqYpdMI7I1BBgBCrR2fSQYxARbdbVIkqqdZilXe7P0CYusLmvz1qPIv14DB81ViqT
         9dm/MMr2TayyaREYbTsj8F4olOq9LxwYF1cUnnj9xT6EHkFvknGKexrD4mfeQHy4LBfB
         57Vppa8qXljzlbXW7o5JG/VynwQGAhyqTiqkVXDA+ERKfJVbyv0MuKY1jwP/l9WX6ay+
         dtAm+mdEFMA+QvbGj2gO2zjRLT6rcw4VdiKSkQW9eXCNcZKHP2xg9nQDI6jb9g0NvcKC
         IIFD47C3Tj3RtBFJ3xYNnxZhIzhhaNPpGcJkfof0Q7FxzLcknYdysCxZVWCs7Vd74cEO
         uK3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FIdIbjAu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k8si1564904qke.360.2019.12.03.01.09.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2019 01:09:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FIdIbjAu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ic4B9-0001hv-Ke
	for alex.bennee@linaro.org; Tue, 03 Dec 2019 04:09:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43599)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ic44x-0007Te-2d
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 04:02:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ic44u-0007yb-N8
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 04:02:41 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:46292
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ic44u-0007tO-F5
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 04:02:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575363758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J9wA7CJmUNjsbOGNQtUhipGAMwMyhN4/fwSlPUTcVls=;
 b=FIdIbjAuRMFctRy64tQa/RNiEkyr5HtFwSL5XHyY+4d2Uv6T+twmt2WXtmJLwz8N3727tV
 mpE6//z1ZRl3Z21tkoFtPqvrrPvCZUoF4mG3E/r+J8re55yHcuGz6E8msY1Y9bCqHt9Hye
 GmkLd0ciAcyRevtM9KK4pVr4DB8u8/U=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-114-MwXGp6JZPy2NHjyS4PBOPw-1; Tue, 03 Dec 2019 04:02:37 -0500
Received: by mail-wr1-f72.google.com with SMTP id r2so1427960wrp.7
 for <qemu-arm@nongnu.org>; Tue, 03 Dec 2019 01:02:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=J9wA7CJmUNjsbOGNQtUhipGAMwMyhN4/fwSlPUTcVls=;
 b=h2y8VoaoYvZ7gs9+ErpefwY7JjEpSg97BSfT/Vgz6g6QGW7cZ2p/CPc6y67kgfCIXX
 4MqRxavwGhAJUgObJ11Vt9dqAPk6zgcHATVVOWAFE/6eZpoAcYHxpKQfizOITGaoaY5u
 vtHqTojwm3hbaknSrJi9Zhi73XxzdpU38IxioQdzGoj3ZWDu0rlQd9O35EqvEQgC55Nz
 Bhhm0Dtj1BVDDKcWjM6k3D1vPNoYriQqY9Afg6JVaCcrwEtn2uWEUHC+NVJffkCwB0t3
 2O6OQOMQzskxihKmBfZkf8IQp04PkThOCZjbMBsOsmNTeAXTEpU0ed4LVCFQ3WYuXk0S
 jLMw==
X-Gm-Message-State: APjAAAXJFnn8fvV72i87/5yPXSvIk4GyBPM+oLq+tO+cjTA9yKR4PNMQ
 LKtUUseX5H5rTa2+buNUVv+nIgInAo5H42VdzngYsJhkeT/JGeXFyPNVYvEcmHzdyS3LKpONYeu
 I+XNjdJrBMszp
X-Received: by 2002:a05:600c:218c:: with SMTP id
 e12mr33279571wme.30.1575363756269; 
 Tue, 03 Dec 2019 01:02:36 -0800 (PST)
X-Received: by 2002:a05:600c:218c:: with SMTP id
 e12mr33279542wme.30.1575363755985; 
 Tue, 03 Dec 2019 01:02:35 -0800 (PST)
Received: from [192.168.1.35] (182.red-88-21-103.staticip.rima-tde.net.
 [88.21.103.182])
 by smtp.gmail.com with ESMTPSA id i16sm2193619wmb.36.2019.12.03.01.02.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Dec 2019 01:02:35 -0800 (PST)
Subject: Re: [PATCH 00/10] Add Allwinner H3 SoC and Orange Pi PC Machine
To: Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-devel@nongnu.org
References: <20191202210947.3603-1-nieklinnenbank@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1de57227-8124-4d11-d996-9faf67b3e4f3@redhat.com>
Date: Tue, 3 Dec 2019 10:02:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191202210947.3603-1-nieklinnenbank@gmail.com>
Content-Language: en-US
X-MC-Unique: MwXGp6JZPy2NHjyS4PBOPw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Niccol=c3=b2_Izzo?= <izzoniccolo@gmail.com>, b.galvani@gmail.com,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UcM6vKQh2SQs

On 12/2/19 10:09 PM, Niek Linnenbank wrote:
> Dear QEMU developers,
> 
> Hereby I would like to contribute the following set of patches to QEMU
> which add support for the Allwinner H3 System on Chip and the
> Orange Pi PC machine. The following features and devices are supported:
> 
>   * SMP (Quad Core Cortex A7)
>   * Generic Interrupt Controller configuration
>   * SRAM mappings
>   * Timer device (re-used from Allwinner A10)
>   * UART
>   * SD/MMC storage controller
>   * EMAC ethernet connectivity
>   * USB 2.0 interfaces
>   * Clock Control Unit
>   * System Control module
>   * Security Identifier device
> 
> Functionality related to graphical output such as HDMI, GPU,
> Display Engine and audio are not included.

I'd love to see the OpenRISC AR100 core instantiated in this SoC.

Your contribution makes another good example of multi-arch/single-binary 
QEMU (here 4x ARM + 1x OpenRISC).

