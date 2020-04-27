Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp4128033lfm;
        Mon, 27 Apr 2020 06:43:02 -0700 (PDT)
X-Google-Smtp-Source: APiQypJfnuWcumH7wLunnY/K8D5yZ9cjjF2pDfYNJ6yFvM0xgR98lsJpLn8QGGG9qijBXz4CuXKw
X-Received: by 2002:aed:3fab:: with SMTP id s40mr23751023qth.140.1587994982754;
        Mon, 27 Apr 2020 06:43:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587994982; cv=none;
        d=google.com; s=arc-20160816;
        b=ap67CXPpjdTyVfJknM/7eNSwXAv0kUDlcDId10TpMVJShekCalPhAW4uSX2lhV6LGQ
         XRBXukWq7GfVfRCdTryFYqf7vXRV0+A7FmNc5EgTqq2anb2eUffpWw17aSZf7/xODSgS
         L+kc0SRmEXsJOD76h6iNFNq9sa2nGAeH5JVkq8Cd52MQcyXz723AZ7ff/ka4zmB8E4Tt
         WZeyu1SJHNKVsDeJexKMARMz25xTq6IZA15/q07GyXGBAuWGMc9k+exn0g6NhJZzK6ni
         juRQpc3LobVYH8iApW3u+jObLQI7Y5UHuSQ1F1xZyrdj90ZZxzSDMY0VZ552NImw2sEY
         1tiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=XvSeiVVqd/sEGBLUnoY8BbRMj946cbQIXsGMLNMCtEk=;
        b=wKGGK04rDGxdsL991zPZnZqklAZeZ0JRK7QODB4TgQkYByIpvN1qxC7lg66KEvnQ03
         5i7AFGvynEj+0M21yDcHYnGMPapVVqCFAYNzRQzznTibD9oOzY6Q9dCfttmFN9tWiuaV
         fGPs98rhdtYNCkKY9czGlvGm37ZerA6tM989ezkkms1CQydsgHBrEASHs/3nMkcvRAwR
         mugVW4Nrdjm2NOiPSyNcsCogKgIcLzlx4uteZRzlZTX9cWIg8Wngo3bTJ9+bIYy5Oktd
         2LlNOoQqIpA2rdgGNR8zQ1D2J2Oo2z5VX6GP6O0jML01OojSGWX8HVSt+eZJvvVBMAiq
         2WgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KJYUDaus;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h12si8275738qtq.169.2020.04.27.06.43.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Apr 2020 06:43:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KJYUDaus;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jT42I-0003lO-33
	for alex.bennee@linaro.org; Mon, 27 Apr 2020 09:43:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47606)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jT420-0003k3-EI
 for qemu-arm@nongnu.org; Mon, 27 Apr 2020 09:42:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jT41w-0002k1-BU
 for qemu-arm@nongnu.org; Mon, 27 Apr 2020 09:42:44 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:38390
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jT41v-0002jj-VG
 for qemu-arm@nongnu.org; Mon, 27 Apr 2020 09:42:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587994959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XvSeiVVqd/sEGBLUnoY8BbRMj946cbQIXsGMLNMCtEk=;
 b=KJYUDauskoVGonYefI/XF7anwhI7y9/ZTMkkbPjVlDETIZ9I+DnD7D0CbJPgb5UzBd0rmA
 JBdiOLUlZGXJV0PvGh8k/TsXu0HhcaTRo1zdfgwTa27s/MpsqlQZQzMcX83l1UZoKHAVVB
 UMUyhWzavXotkPSbSprV01kkbAVHOIM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-jTva26VCMIa6IbKjHm5O2g-1; Mon, 27 Apr 2020 09:42:33 -0400
X-MC-Unique: jTva26VCMIa6IbKjHm5O2g-1
Received: by mail-wm1-f69.google.com with SMTP id s12so6893901wmj.6
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2020 06:42:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UtByCpDNwUVBuGQ4R+gmfYaCRFf2axRfzhr30hDKwJw=;
 b=BDgTmgKv4Yzpf2xX7Cqbmb+FY6RINExnRWUt0kNvzc5owZGFKoC9xWNCUNma8pvLjQ
 SelHqtmmrRC9wDANV3XoQSGctQ5lDdTYsP+Gir5cS6wYbiy129xWx80Olg+WhFHniAAm
 Vp3E2OJje4KGFVq90AFzjrLQrwTB3VNQz2Udkx71AcyuNYxJB6foF5GhW8vT+tC7BxMD
 MOAjlNYXnn5zJIwg7hiLKsVupfu8ANxJg3F0uBNEGpzkk8ewXdtPsTBSH6FPTpw/8S3B
 nlTP5y5H1Ob+MX7OT43flOufZztORJp37vd8U52AOHqHLlNlsiiIJRwXEPPrlBA3JAu8
 HLjg==
X-Gm-Message-State: AGi0Pub+AcizIclPbyKGilbKCv4BThGBTyzwNcd/hByn9ttuEulft+pX
 v1BWvp8rNn57f0xLcBq0P0APNhB+y/rjHnIxFBsn4ULCs1WgZnLOeyegcBPTCdPPIEbAyd0ReZo
 i7A/oPB2uCzC0
X-Received: by 2002:adf:fecd:: with SMTP id q13mr29088909wrs.12.1587994951747; 
 Mon, 27 Apr 2020 06:42:31 -0700 (PDT)
X-Received: by 2002:adf:fecd:: with SMTP id q13mr29088890wrs.12.1587994951535; 
 Mon, 27 Apr 2020 06:42:31 -0700 (PDT)
Received: from [192.168.1.39] (137.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.137])
 by smtp.gmail.com with ESMTPSA id 19sm15483634wmo.3.2020.04.27.06.42.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2020 06:42:30 -0700 (PDT)
Subject: Re: [PATCH v2 0/5] target/arm: Restrict TCG cpus to TCG accel
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200423073358.27155-1-philmd@redhat.com>
 <CAFEAcA8j7y2VbM1U0Df-TEjS6Kh-iBGXA8Vg1ZrD5Ff6=WthjA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <25cbb189-19d2-5514-306f-51d176b61c39@redhat.com>
Date: Mon, 27 Apr 2020 15:42:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8j7y2VbM1U0Df-TEjS6Kh-iBGXA8Vg1ZrD5Ff6=WthjA@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/27 01:12:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3FHE3CFo2Sff

On 4/27/20 3:04 PM, Peter Maydell wrote:
> On Thu, 23 Apr 2020 at 08:34, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com> wrote:
>>
>> These are the uncontroversial patches from "Support disabling
>> TCG on ARM (part 2)"
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg689168.html
>>
>> The other patches are blocked by the "accel: Allow targets to
>> use Kconfig" series:
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg689024.html
>>
>> All patches reviewed.
>>
>> Since v1:
>> - Dropped 'Make set_feature() available for other files' patch
>>    which fails to build with KVM only, see:
>> https://lists.gnu.org/archive/html/qemu-devel/2020-04/msg03843.html
>>
>> Many thanks to Richard Henderson for his patience!
>>
>> Regards,
>>
>> Phil.
>>
>> Philippe Mathieu-Daud=C3=A9 (4):
>>    target/arm: Restric the Address Translate write operation to TCG acce=
l
>>    target/arm/cpu: Use ARRAY_SIZE() to iterate over ARMCPUInfo[]
>>    target/arm/cpu: Update coding style to make checkpatch.pl happy
>>    target/arm: Restrict TCG cpus to TCG accel
>>
>> Thomas Huth (1):
>>    target/arm: Make cpu_register() available for other files
>=20
>=20
> Patch 5 doesn't compile, because it moves code out from
> cpu.c to cpu_tcg.c, where it no longer has access to the
> file-local set_feature() function:
>=20
>    CC      arm-softmmu/target/arm/cpu_tcg.o
> /home/petmay01/linaro/qemu-from-laptop/qemu/target/arm/cpu_tcg.c:47:5:
> error: implicit declaration of function 'set_feature' is invalid in
> C99
>        [-Werror,-Wimplicit-function-declaration]
>      set_feature(&cpu->env, ARM_FEATURE_V5);
>      ^
> [etc]

*Sigh* sorry for that, I'm still unsure what's the cleaner change to=20
deal with the different set_feature() KVM prototype:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg697523.html

>=20
> I've applied patches 1-4 to target-arm.next.

Thanks for this!

>=20
>=20
> thanks
> -- PMM
>=20

