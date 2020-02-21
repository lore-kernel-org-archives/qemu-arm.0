Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1579805lfg;
        Fri, 21 Feb 2020 01:38:16 -0800 (PST)
X-Google-Smtp-Source: APXvYqy/IKLBv183cR6ofgfuR64Te82A5PhuEljIPFwlDFlVp68TUaZcNJ/Tbxv1TrMYlJ8bs8Uy
X-Received: by 2002:ad4:58b3:: with SMTP id ea19mr29745408qvb.80.1582277895920;
        Fri, 21 Feb 2020 01:38:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582277895; cv=none;
        d=google.com; s=arc-20160816;
        b=VWQ/e9N8P82Z5t9I4Rsb9MTbkxB+r8T6QAGSCorvthAPqdCd7u46QiG/o9lQIu9DdH
         URJivND8pf/sHTJh4xaGbs7ZwZPjhh4/BAml12MD94eLN8VLPm3OstvUuEbaBcOQq9k7
         ELG3OgENtyGOu3LYFfKj/HkTSn7+v8vlHgCB5z9FuvROFMXxWAaBEusWIC9fbubnsx9Z
         zgQA0PAAnoUxZ0gbY4uAQ5EcUEPVqT10gDDZiNyq0Us3anZsq2BkhJWNkmabVBVRc7uD
         tROpUgKJ9ZHYiu4Yl1Q+r0eQoMTZ/xxOO6gAEIr0UoYtF0YW8IQ5KGmKdI2IFP+zmb8J
         CujA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Majml2clhq6dP7RmdsC9KLuFlEqWFevxeckEcdp3v00=;
        b=Y1s2bEiNvkKWAgQm48b4xdphMc0diG2shBOS4l9fo25MO2DzeHx8TIDu/jdiDdhAiB
         l3B2ugEm9ep31gLfvKuL65TNtByLumgpGG36NCArpSPMY135CT1veXDg7vzZSZyoThsr
         nnfx88OXDIC9qfTeb/jv8lZQ+aS1cZJOklIYZ/yOhsbBAVSrds+zYiw+Ybl70rweZ18C
         67KMyd6ZS9zh8gatE7s5/LJKMqwiUVhdZ3yaVoKlQgMeCwcoCUzQ1W3qqLpJ4/v6hON/
         mXg81egq4DKVRFbZM9i+Y2k1TbgkxQDpSn7svMFrrX4YSd+rvYhpaSXPoFoS+bN3za/w
         lL+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=iSRP7T8Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o62si1089053qkd.65.2020.02.21.01.38.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Feb 2020 01:38:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=iSRP7T8Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j54lD-0008TC-Bx
	for alex.bennee@linaro.org; Fri, 21 Feb 2020 04:38:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55795)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j54l1-0008Sz-IO
 for qemu-arm@nongnu.org; Fri, 21 Feb 2020 04:38:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j54kz-0000Dk-KY
 for qemu-arm@nongnu.org; Fri, 21 Feb 2020 04:38:02 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:36884
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j54kz-0000CV-8Z
 for qemu-arm@nongnu.org; Fri, 21 Feb 2020 04:38:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582277880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Majml2clhq6dP7RmdsC9KLuFlEqWFevxeckEcdp3v00=;
 b=iSRP7T8ZIR48HLsRHf7jRRM/XdpuTA31uc0cfkdnqPoE6YWd3Y9+jPt4S0Meql4NVPd4He
 2t2iT2FomfusU5QjbZaz723R9hTxtUeDM/pnEMk+Q6HPaImGLtO2nBpwlIuhelq0umzXXn
 sCR/PVQxHuvOumPgcLrln/O8oxp6Gx0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-gypjdPAfOteFqs2mfxGIAg-1; Fri, 21 Feb 2020 04:37:54 -0500
Received: by mail-wr1-f69.google.com with SMTP id u18so765839wrn.11
 for <qemu-arm@nongnu.org>; Fri, 21 Feb 2020 01:37:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Majml2clhq6dP7RmdsC9KLuFlEqWFevxeckEcdp3v00=;
 b=brENh9geXw3nNlzTiamNfjaR9Jp/uDtjuqB5TfUjRfTSo66XfRsZc33+wShEPS0FkG
 YxtrmQsR/PJhSZYQeJU70sbikc9glAuZTWK2E9scIlHmL3+K04GJNlTM34vGydzl5RsM
 L/QP6eiBH0pr5a85QWEy4amMSq74Egmf2U2nf5SajBjpo4WacHEOWdHTj60kPIIIlRIR
 yQhoF8OJh2/pj7kEtWK68dgSFBdtuxfY+K1cm2Cm7V0e3e1GZGQJLUDxODZi+ZgsReoy
 jLGS/aQdsYQyLB0cdRsVO9nkAQhcE+fJ8L7W+zi9KUKMsURlq+yBqTlcRVORZel1+vKx
 coOQ==
X-Gm-Message-State: APjAAAX3KcuPA/pA2OctfGBlUFu3U26VMRvu1pcvPlfqvRnSAQaRNRQF
 Yvvare+Uw7vJSGkaynodRjlgsSX4aRl+7xY8KuyHB8uhlxNj22lyyC5PBmOIj7q+0axz9hvs+wo
 fX2gJEWwkNqHR
X-Received: by 2002:a7b:c93a:: with SMTP id h26mr2764371wml.83.1582277873432; 
 Fri, 21 Feb 2020 01:37:53 -0800 (PST)
X-Received: by 2002:a7b:c93a:: with SMTP id h26mr2764344wml.83.1582277873167; 
 Fri, 21 Feb 2020 01:37:53 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id r7sm1000635wmh.45.2020.02.21.01.37.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Feb 2020 01:37:52 -0800 (PST)
Subject: Re: [PATCH] hw/char/pl011: Enable TxFIFO and async transmission
To: qemu-devel@nongnu.org, gshan@redhat.com
References: <158226649422.712.7285415168506294704@a1bbccc8075a>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5d569175-55de-b182-a338-cc04ba9b0afd@redhat.com>
Date: Fri, 21 Feb 2020 10:37:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <158226649422.712.7285415168506294704@a1bbccc8075a>
Content-Language: en-US
X-MC-Unique: gypjdPAfOteFqs2mfxGIAg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: peter.maydell@linaro.org, Andrew Jones <drjones@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, maz@kernel.org, qemu-arm@nongnu.org,
 shan.gavin@gmail.com, marcandre.lureau@redhat.com, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BUyrB3xcB78h

Cc'ing Igor & Drew.

On 2/21/20 7:28 AM, no-reply@patchew.org wrote:
> Patchew URL: https://patchew.org/QEMU/20200221044908.266883-1-gshan@redhat.com/
 >
> === TEST SCRIPT BEGIN ===
> #!/bin/bash
> make docker-image-centos7 V=1 NETWORK=1
> time make docker-test-quick@centos7 SHOW_ENV=1 J=14 NETWORK=1
> === TEST SCRIPT END ===
[...]
   TEST    check-qtest-aarch64: tests/qtest/bios-tables-test
> **
> ERROR:/tmp/qemu-test/src/tests/qtest/acpi-utils.c:145:acpi_find_rsdp_address_uefi: code should not be reached
> ERROR - Bail out! ERROR:/tmp/qemu-test/src/tests/qtest/acpi-utils.c:145:acpi_find_rsdp_address_uefi: code should not be reached
> make: *** [check-qtest-aarch64] Error 1

The virt machine is not happy, busy-looping?

$ QTEST_QEMU_BINARY=aarch64-softmmu/qemu-system-aarch64 \
   tests/qtest/bios-tables-test
/aarch64/acpi/virt: ^C

