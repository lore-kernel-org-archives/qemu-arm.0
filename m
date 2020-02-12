Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp6008495lfp;
        Tue, 11 Feb 2020 22:45:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqzRim/b6fG9YoUzC+hrMwsMFyccYzNRMUKbEFmRCMR8+lhQhOKQ2xHcVgNS4X2yKzMWcpkq
X-Received: by 2002:aed:3286:: with SMTP id z6mr5948332qtd.303.1581489902742;
        Tue, 11 Feb 2020 22:45:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581489902; cv=none;
        d=google.com; s=arc-20160816;
        b=Ao4PONzIKeQTXt42D67DQCUsgcEPjBchxnX5OWR5Q3LnXMWrl4Nz/cpo/JWU6YbOgU
         yX+pkebr0FCcms9Ad65pPtxVVFq6VXD9sqVaP01C8GxnTOYj6RgLcaCoYZXX9DbnoFAm
         6x22f4MGUv1WRz+qVH7wJcyLf3ur+8OVQ9Y9pL1sI6y7q7i9039u/gWkkJasaRLHAF4T
         FuQ0DiorT65K5ADpQ/h8bCRt0HVNa1n2nqpfIbkjo7WStumliN432q/KaaWGy28x+2RP
         msWVrwxtt/lOzK5+2To8ZzuQnAcYHGvefxBa2VEYZj7fWuAN66KB9c6J81J1kIY29qh/
         ivlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=SP2tr43GD7Z0njyeLAo5/HgyMhNxnZV6zWHZQp9QlQ0=;
        b=JIaDAuHqt4t5Ns6q9w1VOodHgWKM1qIouLPAseDzkCYSR114xHZ/nxCYabSbVGwuBf
         xJ+1seLT/gQiUIfDVVgkuJygUlYFtugG7QaKoj8c1ZyP6SDB6gt2IKNkzxH3uDVqD+xx
         IzEv2kaTnOxs993okfAZZSlGndnZbpiUHPUrPcT3RrWG9je16OwhWMftrQbr7xmN4G2e
         Ss+Eli8INf4RYSnXLdHQj5iGVxW2YiJHNUhdGUly8y0sEAKmGYEJQeyKFSXDs4Wg2N9r
         Rs175bRh1vGSNwrHqIXjWaIT0q4TgbR1RhD/JjzG2Hyt8k9hClfKw2NwJ8KgMNQPfsAj
         CBXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RXcd3nO0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o18si1606913qkh.26.2020.02.11.22.45.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2020 22:45:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RXcd3nO0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j1lle-0000oy-3q
	for alex.bennee@linaro.org; Wed, 12 Feb 2020 01:45:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49206)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j1llV-0000oG-P4
 for qemu-arm@nongnu.org; Wed, 12 Feb 2020 01:44:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j1llU-0000ey-7g
 for qemu-arm@nongnu.org; Wed, 12 Feb 2020 01:44:53 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:54743
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j1llU-0000ec-3z
 for qemu-arm@nongnu.org; Wed, 12 Feb 2020 01:44:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581489891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SP2tr43GD7Z0njyeLAo5/HgyMhNxnZV6zWHZQp9QlQ0=;
 b=RXcd3nO0Y8lGBp9fH6DRob2b4+HwV3JPnJ2SbSKaIe30X59fmW66ERHfI+mE0tRaOIF/XV
 Iyj2B+EJSFUmT6sNUbek4BOkNRI9kMI9bFuu3lmJ6sEawyK9FFNZXxcdpi6zOr3KiBDqwQ
 CjKJ92yjgXdivTNGePvtscDbPARsfdc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-zfF_xAQbO7eh_PreLx_SXQ-1; Wed, 12 Feb 2020 01:44:49 -0500
Received: by mail-wm1-f71.google.com with SMTP id p2so548833wma.3
 for <qemu-arm@nongnu.org>; Tue, 11 Feb 2020 22:44:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kOVI+lJFLQ8dlHW+nq+JRF8uhsb/x3I0u9zXjLprFcM=;
 b=SbiZ4DJL2OfbYK/lGKcAmeOfI/qNSe7Tk1HotA6YoaqdkqBHf46ADQOM4SbbWT081R
 Zrwuxl14eRuczjEYfpBG9axTgx2gqTOlrx+AALg2Re5n7KliBLkcm7jnTedueZVieBJi
 Bq1weM2BxtWORjWXn5WUHXd8kMuIjCzN+lwATdXpT8s9fHeU2Q1asEKXPM6ipet1zg60
 euek3tNpQJ6QwvaVHD049+0y4XLgbNN/Yc8LygchCKC93bFlc7LL1L9OkkW7GdKgNtTe
 Hufl12Sqyh71TczpIzrGcPnAI1gwIeuSlydVGX8E8ob49xM7EBW1fAs1TYnOl398nYih
 7RaA==
X-Gm-Message-State: APjAAAXMvIX/skWDiKXM4glPZNCacalvjh+ZFjDdII6fz9dABeg8SWXd
 zK77w4k/sAJ5ljl8YTkV3WnAASA6IigYjvzUO7CS4THvUkPBBX0TknKtc5qvaRFlQaJVT1JGOWY
 TJFDjEp9uWGQy
X-Received: by 2002:a1c:9dce:: with SMTP id g197mr10273874wme.23.1581489888394; 
 Tue, 11 Feb 2020 22:44:48 -0800 (PST)
X-Received: by 2002:a1c:9dce:: with SMTP id g197mr10273846wme.23.1581489888151; 
 Tue, 11 Feb 2020 22:44:48 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id g128sm6721489wme.47.2020.02.11.22.44.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2020 22:44:47 -0800 (PST)
Subject: Re: [PATCH 05/13] target/arm: Add and use FIELD definitions for
 ID_AA64DFR0_EL1
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200211173726.22541-1-peter.maydell@linaro.org>
 <20200211173726.22541-6-peter.maydell@linaro.org>
 <6a75d967-513d-93ef-b983-b8a35f78c2bf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b4390a82-2780-c639-ada3-6d317a7558aa@redhat.com>
Date: Wed, 12 Feb 2020 07:44:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <6a75d967-513d-93ef-b983-b8a35f78c2bf@linaro.org>
Content-Language: en-US
X-MC-Unique: zfF_xAQbO7eh_PreLx_SXQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Eric Auger <eric.auger@redhat.com>,
 Aaron Lindsay <aaron@os.amperecomputing.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KUY9pwOlH/2o

On 2/11/20 7:34 PM, Richard Henderson wrote:
> On 2/11/20 9:37 AM, Peter Maydell wrote:
>>       if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
>> -        assert(extract32(cpu->id_aa64dfr0, 12, 4) =3D=3D brps);
>> -        assert(extract32(cpu->id_aa64dfr0, 20, 4) =3D=3D wrps);
>> -        assert(extract32(cpu->id_aa64dfr0, 28, 4) =3D=3D ctx_cmps);
>> +        assert(FIELD_EX32(cpu->id_aa64dfr0, ID_AA64DFR0, BRPS) =3D=3D b=
rps);
>> +        assert(FIELD_EX32(cpu->id_aa64dfr0, ID_AA64DFR0, WRPS) =3D=3D w=
rps);
>> +        assert(FIELD_EX32(cpu->id_aa64dfr0, ID_AA64DFR0, CTX_CMPS) =3D=
=3D ctx_cmps);
>=20
> Should really be FIELD_EX64.  Otherwise,

Similarly to the other previous call, FIELD_DP64:

        cpu->id_aa64dfr0 =3D FIELD_DP32(cpu->id_aa64dfr0, ID_AA64DFR0,=20
PMUVER, 0);

So far the code is safe because the >31 bits macros aren't used:

   FIELD(ID_AA64DFR0, PMSVER, 32, 4)
   FIELD(ID_AA64DFR0, DOUBLELOCK, 36, 4)
   FIELD(ID_AA64DFR0, TRACEFILT, 40, 4)

But you are right, let's fix it now to avoid copy/pasting 32bit macros=20
and unpleasant debugging sessions.

>=20
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Using 64bit macros:
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

