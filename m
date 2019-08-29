Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp2510792wrs;
        Thu, 29 Aug 2019 11:08:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzGbyWhhoHB0FlP+jHFBzvDL+u3i4/N2vIhT2s3qmK0lF7LyfZXVij4HnVtd+6TZGI2sRYd
X-Received: by 2002:a37:4747:: with SMTP id u68mr11095444qka.42.1567102128030;
        Thu, 29 Aug 2019 11:08:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567102128; cv=none;
        d=google.com; s=arc-20160816;
        b=vz9Wbqi7DAg6UINGr2x3qQYxYeqdiVijvD/Qv2cLYG6BYUo7InMfeYBHAJBlRwCznT
         hRDHKKDi2nBbTQgevdnAEOUZjye1CHDrybyBEOp9m2ijP6izpfg3i7czpWnfH3+WbhIn
         9quEYtQ3AbEZeh0A1jC1Aiph7T3y6AnOW7FRX2/jh84zmyibn1X9qMUJxoVADGdpWrbW
         /70ahyWqZtMDW46WxlVb+6gmaGCz++OJUpGtMRCyonqA47XZOMWzqgBEHyUMrKIjibKo
         l3Sijncc/SImLsinFvZWCXbvUq/oPMK1oGUqclMoak0RXoA0MvKglkqdeuh7sSrBExKx
         ybjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=JFkn3g9EbQpUTQ/XM6I/GbGVsFxWo54PCOfXn6qCWqY=;
        b=zwiEQiyXI9dxvHakd0pNtJyq9UoRXQRraYO+TJDoEDAVC4naTsIer4eBZB+S/0FAjc
         1MvR5cqKNl7YCOrqSlKFwVC4jZQ3AavTAQMKU8OYpWMMziwGtoj3xqQi++Gw1aaE4V7k
         gZqXiFnIqBOPUc+Tdla8wfRzX6WPRdbQZPK9AYBq0xiSWB3b2NM2SHMSD8EUMLFZDyx5
         TQ+/ncDC7FmF2SKl0hem8Xlx987XyIC5Sp+JczVta9O2JkRqRZKuPdfyhDvZTUjRS43R
         BOGQ/lB3WgymJk9E7gpg0Nw8uCFmTu5dh57boYeYPnjaEgZa36GGimximqXd8JX91zcC
         YsaA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o20si2439494qvc.24.2019.08.29.11.08.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Aug 2019 11:08:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i3Oql-0001x8-Fs
	for alex.bennee@linaro.org; Thu, 29 Aug 2019 14:08:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41742)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1i3OqC-0001TU-GP
 for qemu-arm@nongnu.org; Thu, 29 Aug 2019 14:08:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1i3OqB-0000lx-62
 for qemu-arm@nongnu.org; Thu, 29 Aug 2019 14:08:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37422)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1i3OqA-0000lF-VG
 for qemu-arm@nongnu.org; Thu, 29 Aug 2019 14:08:11 -0400
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 159ABC053B34
 for <qemu-arm@nongnu.org>; Thu, 29 Aug 2019 18:08:10 +0000 (UTC)
Received: by mail-wr1-f71.google.com with SMTP id k15so2496041wrw.18
 for <qemu-arm@nongnu.org>; Thu, 29 Aug 2019 11:08:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CQWLlOCEAXNM1XHQS+wuXw28cMfRqTy0sIlKvCp7+aE=;
 b=UROk+NrKEMf68HakW4DtA7JZ7FYfud7oVjIPaJkbqHu6CQpZVCRsPDevCMcXQIhAwL
 NBRYxuf0IhfeXhxyqLtugUjva6BDb2/O9lM+cXnM97gZJv3R4RWrqdUgfKVEZP74Q/+S
 5C3spc8jbnnWbhxo7oqeYoxcZ4w+Wq++LelR6AjGLiFhuxxYRqZ57Pah1sSzipNokj4W
 SaYtN8cGuVM7LRYwhxhq27xjAM5tW72O06CESDqVBtN8r+cWoK6chuwaL2mP/IbCl7jg
 A9GOuZ3HeDdkqcBvQiSV/+2X5JOTPm2/FrtgLlcIEBz823nzCIT/rac62MToZjpg3r9J
 IgqA==
X-Gm-Message-State: APjAAAW0oVYhJ+gCEZ8yQR15iiyHH7qX3FpL9JIvTWgk8DEwQT9Yav/+
 SIB1n7JSYmOhbqcBed1UFGI2hzhrSUIn2u8Bh8h71RmUqJooWoocf0f7zmaSx9jbkld6DxGmwqq
 wcMvaZCS/uhXk
X-Received: by 2002:a7b:cb11:: with SMTP id u17mr13012161wmj.17.1567102088895; 
 Thu, 29 Aug 2019 11:08:08 -0700 (PDT)
X-Received: by 2002:a7b:cb11:: with SMTP id u17mr13012138wmj.17.1567102088692; 
 Thu, 29 Aug 2019 11:08:08 -0700 (PDT)
Received: from [192.168.1.41] (251.red-88-10-102.dynamicip.rima-tde.net.
 [88.10.102.251])
 by smtp.gmail.com with ESMTPSA id j17sm2207525wru.24.2019.08.29.11.08.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Aug 2019 11:08:07 -0700 (PDT)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20190823135811.13883-1-philmd@redhat.com>
 <20190823135811.13883-4-philmd@redhat.com>
 <402a2532-a61a-18cc-2153-73a0447bad7d@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <26cc14fa-977b-edea-8879-22c84dc01c96@redhat.com>
Date: Thu, 29 Aug 2019 20:08:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <402a2532-a61a-18cc-2153-73a0447bad7d@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 3/4] RFC target/arm: Do not
 build pre-ARMv7 cpus when using KVM
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bvVSneAArgoW

On 8/23/19 7:12 PM, Richard Henderson wrote:
> On 8/23/19 6:58 AM, Philippe Mathieu-Daud=C3=A9 wrote:
>> A KVM-only build won't be able to run pre-ARMv7 cpus, disable them.
>>
>> If KVM is not enabled, they are enabled by default.
>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> ---
>> Sadly this does not work with --enable-tcg --enable-kvm dual config.
>> ---
>=20
> Huh?  --enable-kvm does not imply --disable-tcg.

That would have made my life easier ;)

>> +config ARM_V4
>> +    default y
>> +    depends on !KVM
>> +    bool
>=20
> This should surely be "depends on TCG".

I restricted this to KVM because this is the only one I know and got
confirmation by Peter. I don't know about other accelerators but I'll
happily take your suggestion!

Thanks,

Phil.
