Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2776140lfg;
        Wed, 26 Feb 2020 00:44:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqwTNuCK0cbk0Ry4gtfw/roVfsZ1nyHsgqNFEc8rINp80a8mMvsS09Bph6g/4gGZU03tsFpX
X-Received: by 2002:ac8:2bcd:: with SMTP id n13mr3684271qtn.21.1582706676286;
        Wed, 26 Feb 2020 00:44:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582706676; cv=none;
        d=google.com; s=arc-20160816;
        b=sxQSKmNkwAZ8nEJ2EpIOYI6/Jr46OAxePcKmMGcTlFN2j3VZIdpbV7pPGym6C4Qujk
         tsBjIns59WoFUXXNNaRMNERgeeT+9Xn+qI8Z+tdNkJiKNHoUILQRhj+pFZkjAk10ANbq
         U5OVfhpv/pc6t0Ahl6kWK7rC/cssARvvZHpCZOQYoob9rv3WGstPQWKFRkf2NBm/ccJ7
         qNCPiba2bRfW690muMRvB+yeZ33AUovqHV+AjIAB3nKo3idtNho/TDPzrULa3Fmo7TsA
         buuCWdspb//zI2AN9MCMGDGTb231vyUx1W9sal464F68IpVze2+jfA5Do7jzeQFrpcCu
         F+ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=9vQNp8eqUbd3oSwY1ezPXCX9BKBX5nJ3UlO7fF0GtCM=;
        b=l35v2NrlF8letaHY9wcNsDdAzRUKbJhWBESKi3+0oJnN0MqnB2KNbF1vlTU7MvN490
         1U9tnRsWh83OnPdE3g2J/BGaouH7PXSeeoCNL6qMQ5FbvBulaNh7UaNyZ1pm++DAdjBl
         tomSYxXtFZBzg4vQoVdSHzVm+UjNUWXp3i5zcHmvRJeiMTUi8M25TtF/XYX2krqhMCYg
         Z/67cc+jlKqYprvFtEh51G47tqxZudzeyjIUzbAAy24VgdanPwD56S1ckf16ryE51eYg
         cN8lDkl8TbrsRoJ0JsB1BQ7mO7V2hHLsFlobQiUG4PfpVnyKUgL2o0TXFFSWFAeeFc8i
         9hLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ffQ6F32F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q5si757036qtr.355.2020.02.26.00.44.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2020 00:44:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ffQ6F32F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6sJ1-0006eA-O1
	for alex.bennee@linaro.org; Wed, 26 Feb 2020 03:44:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42558)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6sIu-0006dx-VG
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 03:44:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6sIt-0001f3-Uo
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 03:44:28 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:49464
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6sIt-0001bE-QH
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 03:44:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582706666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9vQNp8eqUbd3oSwY1ezPXCX9BKBX5nJ3UlO7fF0GtCM=;
 b=ffQ6F32FP84QWyCAjRG0HUBWSwnzIZUUd0OLoGFGYL6d7lA45Cn5reHvmGocmLqnOd9tO2
 unuN7kzbYCzUCY2G1AutRcHTLy0KcwRKBvbEPrD00wf5AnbFLH0c2xTDtaX6fQQNFQnU6/
 u6FIjNDc9pCwxwtxidTJwU46cAketc8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-vU_ddjF0NciHmuuPywMgEg-1; Wed, 26 Feb 2020 03:44:22 -0500
X-MC-Unique: vU_ddjF0NciHmuuPywMgEg-1
Received: by mail-wm1-f69.google.com with SMTP id f9so360167wmb.2
 for <qemu-arm@nongnu.org>; Wed, 26 Feb 2020 00:44:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9vQNp8eqUbd3oSwY1ezPXCX9BKBX5nJ3UlO7fF0GtCM=;
 b=GvGDTmLxCueWrKXp+K5aBM6+KR0wHNn8j5mDYrmUWYkTlJO+YuFaoOLNeK9QvxH0pu
 QPST4i8VWrGILZMaeKaYND1xl0QbBqYRaaVZp8fB0SDdCDMuN7EGvGj6y/g0fgRxLdw6
 7qvfNS0lRa3VOpDDmBbXOqbGHmaaYrawFnrFaDRemSIs6TSIgn+LX7JByZ96SRZR9hHy
 YsJ7PIF1Bucwj6RLnWZt25u+Fu9am8BExtmfZROLxJLmVTR3V8Sy2+s52yHxlvQ0IMpZ
 9kKNMjAEM5wyVO7MaP2Wq7a9/Igh+zdwC24YrdND0W1XEe+AFHO1ej6uR/Ke676z3eYt
 nulA==
X-Gm-Message-State: APjAAAWHtaxsiWU49be0/NZsSexXbwEtpcx+As6kUqHzpmYkxmfS4Aaf
 SgdV2N8J8+EsCQvJDSgLwvL21fMlUERzQJV4RYNK4/COoLoZTXT329UZ+OQ5aUAzfZ+CTGFwPLO
 KzPj5Feqf1XKu
X-Received: by 2002:a1c:b7c4:: with SMTP id h187mr4353101wmf.105.1582706661593; 
 Wed, 26 Feb 2020 00:44:21 -0800 (PST)
X-Received: by 2002:a1c:b7c4:: with SMTP id h187mr4353082wmf.105.1582706661322; 
 Wed, 26 Feb 2020 00:44:21 -0800 (PST)
Received: from [192.168.1.35] (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id h13sm2058742wml.45.2020.02.26.00.44.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2020 00:44:20 -0800 (PST)
Subject: Re: Sudden slowdown of ARM emulation in master
To: Peter Maydell <peter.maydell@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>
References: <CAPan3Wq-MVwcJQELP8n+g33CR7tsiGXQ698gA177nd2my9hWCw@mail.gmail.com>
 <CAFEAcA_azGqyzbxegpK8ch_bums6Wtd=U7cNxvM=bAJ-Ld2DDA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ffa87cab-e85c-c381-289a-fdf1ef07b45a@redhat.com>
Date: Wed, 26 Feb 2020 09:44:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_azGqyzbxegpK8ch_bums6Wtd=U7cNxvM=bAJ-Ld2DDA@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pe9RroxS+LGY

On 2/26/20 9:41 AM, Peter Maydell wrote:
> On Tue, 25 Feb 2020 at 23:08, Niek Linnenbank <nieklinnenbank@gmail.com> wrote:
> 
>> Just now I was working on some small fixes for the cubieboard machine and rebasing my Allwinner H3 branches.
>> While doing some testing, I noticed that suddenly the machines were much slower than before.
>> I only see this happening when I rebase to this commit:
>>     ca6155c0f2bd39b4b4162533be401c98bd960820 ("Merge tag 'patchew/20200219160953.13771-1-imammedo@redhat.com' of https://github.com/patchew-project/qemu into HEAD")
> 
> Yeah, I noticed a slowdown yesterday as well, but haven't tracked it down
> as yet. The first thing would be to do a git bisect to try to narrow
> down what commit caused it.

My guess: biggest chunk of memory is the DRAM, registered as "fast RAM" 
by QEMU, but the SoCs provide SRAM which is supposed to be faster. Not 
anymore with QEMU. And Linux try to use the SRAM when possible.

