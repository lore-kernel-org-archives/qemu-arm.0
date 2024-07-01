Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1182833njm;
        Sun, 30 Jun 2024 23:50:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVZZ9OO71qN7xpPk7qqZQNLImays5gdmPNa4+bwdFLz3CNPzGcBvCmEPQPodJ3tltgjPyfOSHxKv8luPLhJ2F8Y+30gBATK
X-Google-Smtp-Source: AGHT+IEW56w+VfxVs0xHbuuAEACSJscnsAK9hpIBkSEoYPK5yuvk2/0ngeDpfHOHz+deJW/Gsgl/
X-Received: by 2002:a05:6214:dc4:b0:6b5:2de3:32b0 with SMTP id 6a1803df08f44-6b5a53fecb6mr133576846d6.7.1719816635464;
        Sun, 30 Jun 2024 23:50:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719816635; cv=none;
        d=google.com; s=arc-20160816;
        b=UrqnEbY8nriaijU2lS4E1vHicQvcaOUuLhXSWs0B81pwgRwF9LhquuviLt+ffOoPee
         FVQrzTr+Cipz7V3ZEUOX/W4hObLTm1RtOhI2kpCkrOrh77mK6u4ZvPgMD1eAx2GJfONT
         /RT73siV2dXS6VCo5tJhQSYbzGTZCn2Sz52IdXjO7bxzywWv3vsmY3cYElfWbTK0M+at
         C0mbFnhEeUcciNdvAXnkIgvgBdvDAmENAwJ0f9qK+cPev6egl6Zc5n2x2ZIUKRuOE/Io
         vUxfsVWjaQwBCbxYUIBNbQ7Rwyk/kSfYyhehKZh3zQcZ+VH1QXGSNpQqkyl56lOkaqm4
         ZK2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:content-language:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=aLFY5bTO8hv207XcrxqvpaVU3KIVeCAECo1Unqifq+s=;
        fh=4COGkts5aClAxOmH7/YxcEBzHrRsli/eWPGnbfFbliU=;
        b=NcvzN1ojmURnkJeeO3CYL/P6ZUcw064GBKsn1O22TIvGUSn8VQ2I7wVkfKAxzVgUgk
         khgOvJ0Lhffj0Tgzn32anCjGqQH3kSlyh6nejhOIlEzFBUrASN78nka2xCRH9+pp0ivn
         /YVlv0CXXLHb9yJB+jhRM3yCLKx7r2rcftdBff1QFjIReG3s/JofdeDrE1sbX7knDReH
         RHkXppjarwJkx1s07kA6YHuUa5IR0MNZPNBtKForhc8XzzRR7E9mNwEUuCkAInB+S3xd
         4ULXAO47FbTT1fhqQSc+8QewZG5L+DBDemHYDPOetCM91fgVThXLX8FLnihWhpUG+drN
         v8sw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M5h528g9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b59e60b0fcsi74438506d6.511.2024.06.30.23.50.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 30 Jun 2024 23:50:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M5h528g9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sOArb-0006qM-31; Mon, 01 Jul 2024 02:50:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1sOArW-0006pJ-K4
 for qemu-arm@nongnu.org; Mon, 01 Jul 2024 02:50:09 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1sOArG-0000Kn-G1
 for qemu-arm@nongnu.org; Mon, 01 Jul 2024 02:50:06 -0400
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a6fd513f18bso280539966b.3
 for <qemu-arm@nongnu.org>; Sun, 30 Jun 2024 23:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719816588; x=1720421388; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=aLFY5bTO8hv207XcrxqvpaVU3KIVeCAECo1Unqifq+s=;
 b=M5h528g9k0dV0aoW2r3907h05b1iEF73QzzTnm4R9zZIyeGJTZW6PnKLZ9nI2M4/fQ
 krAMypE9PzYFCEP2JGJ2a37n/iXelQ5b6vBdGWUeeppKdgXi2HE1i/8EFe+UY+6PX65X
 0n3CaQScTl8ZWK5layMlRXTBILpRGynkEJPoCTVw/1myOErLwYvklmlDV7yev72Bg0K8
 VbdV3c+otvOO217CIats9cXfuMraHTeYgSJfSS8zvqO76J203KZoO0SBSoso4ytQc/f+
 +eQV0lL/PVNolh0werBKnybTDPpe30XVix4ZuN4nyLHxdXwGAVWi4OgFzJLcqTtFPwRV
 D+ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719816588; x=1720421388;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aLFY5bTO8hv207XcrxqvpaVU3KIVeCAECo1Unqifq+s=;
 b=rZlKkzciAhhaQJL52UMgND8RoP28KNJIC73CaQiz0jJZEji5UUV7q0akcpy5x4Mx3s
 YWD7qTYnk1KbilnMmLyfmLwfFwL9lNWrGzndjc25uNJbnqxGeJfccotI6q3VQRUAreJR
 jYUUPKxE5TlHHAzrS+vHfYEGhd5nnG//ziXo/JiZi99skLrVeatK8+mrvHqbLOTP+KT5
 xu2YwSFx2VMfmbd2gRK/V3sahpjgA0589mOvMNoOdvuky3JdCxl77J+pQgoZS5ei14nI
 9wWA3mVcQUi2GC/bnI1OOe9BfCUIk/6mDpnf0+CGXepiSroIVeleQ7liwB4nqTmq40RL
 a96g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdhahiFgQZzyIoDj2uxqZl2qCqXMtvHrbyQJFeLvcvXecyfrf2aAJvZYa/rMz0CWroAP7joheqwSJlDddK/S2ZzxC4
X-Gm-Message-State: AOJu0YxhluKY1wQ5e/wCUPOaxj55pJBtwKtuVMg6PgVmLm3s3SzFXI2Z
 nJon1V3OgHLED5MK/T27hDHNEn4fsbwAhis5v6sKV3lcCevbyrZxdEmJRFDlAkY=
X-Received: by 2002:a17:906:db0b:b0:a6f:e819:da9c with SMTP id
 a640c23a62f3a-a751444dab8mr380195766b.43.1719816587964; 
 Sun, 30 Jun 2024 23:49:47 -0700 (PDT)
Received: from [192.168.200.106] (83.8.74.165.ipv4.supernova.orange.pl.
 [83.8.74.165]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72aafb3c2esm304873366b.91.2024.06.30.23.49.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jun 2024 23:49:47 -0700 (PDT)
Message-ID: <ca463afe-486f-4590-acb5-a61265cbbd37@linaro.org>
Date: Mon, 1 Jul 2024 08:49:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] tests/avocado: update firmware for sbsa-ref
To: Ard Biesheuvel <ardb@kernel.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Ard Biesheuvel <ardb+tianocore@kernel.org>,
 Rebecca Cran <rebecca@bsdio.com>
References: <20240620-b4-new-firmware-v3-0-29a3a2f1be1e@linaro.org>
 <20240620-b4-new-firmware-v3-1-29a3a2f1be1e@linaro.org>
 <CAMj1kXGb9xVQ5E3oK_QX+3hKkMfCoA9jF5jkEeG6Eq9+zbHPHA@mail.gmail.com>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Content-Language: pl-PL, en-GB, en-HK
Organization: Linaro
In-Reply-To: <CAMj1kXGb9xVQ5E3oK_QX+3hKkMfCoA9jF5jkEeG6Eq9+zbHPHA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: cl2AbAoXOOFN

W dniu 30.06.2024 o 16:37, Ard Biesheuvel pisze:
> On Thu, 20 Jun 2024 at 12:20, Marcin Juszkiewicz
> <marcin.juszkiewicz@linaro.org> wrote:
>>
>> Update firmware to have graphics card memory fix from EDK2 commit
>> c1d1910be6e04a8b1a73090cf2881fb698947a6e:
>>
>>      OvmfPkg/QemuVideoDxe: add feature PCD to remap framebuffer W/C
>>
>>      Some platforms (such as SBSA-QEMU on recent builds of the emulator) only
>>      tolerate misaligned accesses to normal memory, and raise alignment
>>      faults on such accesses to device memory, which is the default for PCIe
>>      MMIO BARs.
>>
>>      When emulating a PCIe graphics controller, the framebuffer is typically
>>      exposed via a MMIO BAR, while the disposition of the region is closer to
>>      memory (no side effects on reads or writes, except for the changing
>>      picture on the screen; direct random access to any pixel in the image).
>>
>>      In order to permit the use of such controllers on platforms that only
>>      tolerate these types of accesses for normal memory, it is necessary to
>>      remap the memory. Use the DXE services to set the desired capabilities
>>      and attributes.
>>
>>      Hide this behavior under a feature PCD so only platforms that really
>>      need it can enable it. (OVMF on x86 has no need for this)
>>
>> With this fix enabled we can boot sbsa-ref with more than one cpu core.
>>
> 
> This requires an explanation: what does the number of CPU cores have
> to do with the memory attributes used for the framebuffer?

I have no idea. Older firmware was hanging on several systems but was 
passing in QEMU tests. After closer looking I noticed that Avocado tests 
run with "-smp 1" and pass.

Checked failing system with "-smp 1" and it worked. In meantime you have 
fixed problem in EDK2.

So yes, updating firmware may look like hiding a bug. Which I do not 
know how to track (I can build and test QEMU, but going into its 
internals is something I never done).

