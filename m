Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp3115929wme;
        Sun, 13 May 2018 07:44:57 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrgBEyOCubvCzyeiuz6euo55U8wu83giiz76PvaoXHNjoRgIRZ7OQZ46Zmb6txdeMr39tox
X-Received: by 2002:ac8:7159:: with SMTP id h25-v6mr5416984qtp.206.1526222697137;
        Sun, 13 May 2018 07:44:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526222697; cv=none;
        d=google.com; s=arc-20160816;
        b=GXiYU6tBLQ5376AADTRhWNZLp47+m3XjsWGNuHmpoyTPd9lGzjprCzkb9jia4FBjBQ
         E4wXqMDXMgrX2lI/rFBpa/qda19xYF3r65lw5zTpmUQ1kykXhba6ZArGnJ8LEOQ7eLNA
         komJgU69djGVheRXMWpYpyi9JSM6jn4v6zdEmQ++MEXX3Vs0QDzMqlMcuyd3Qe5ZQCXR
         CqNxqCBVPj6ZJHIkYGdaWnLLWecLRJYW1U5So/PuxPaA+TUmuSbQI+M21slMTQmI/aqu
         +welS6affHruZ/Cp4hCTNN0GQmSdlrKC27BU4AZON4YCu/kVa6kqB/bDqgHdDS8rMQ4w
         BprA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=dQekUTKSTW3TDpNmRn11J2E/kaL7mRBgRxfuLFN7TAg=;
        b=oF6neg8bBdRjqr4W2/AIf3vHXpc5iLE76gGWAH7hj53V2Vxaz5eF0EIHQtacRSiQqM
         1DasZ4Pm22gpTbLsM9vCwC6zPKvbPuDJAT2d0nfiSmsauQebRAZQb/Q9RKJGBAmdDe05
         vmpeX80PcytuUiuYutVsUpY0qusYikA5bj3mmpiZDUHDWruOm4q2pcJqmdQ+sJB115Q2
         00dKj7sm+EYQG4UVlu4FoLreuSCDgirJQE0pWDgI+waRi40rX/pg01WX96i3MQuoCqeL
         oqhUfHHE6VHtQIlB+Q6kMVFvLizMpmYmXY1Z1KmF4Xs4vkraTughr9HaXGPhfXnzw8I1
         tjlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IN2XwlTf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l66-v6si901559qke.257.2018.05.13.07.44.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 13 May 2018 07:44:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IN2XwlTf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44503 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fHsF6-000713-Ld
	for alex.bennee@linaro.org; Sun, 13 May 2018 10:44:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55703)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fHsEu-0006sO-GL
	for qemu-arm@nongnu.org; Sun, 13 May 2018 10:44:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fHsEt-0000Xt-BH
	for qemu-arm@nongnu.org; Sun, 13 May 2018 10:44:44 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:41962)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fHsEt-0000Xb-5G
	for qemu-arm@nongnu.org; Sun, 13 May 2018 10:44:43 -0400
Received: by mail-oi0-x241.google.com with SMTP id 11-v6so8555333ois.8
	for <qemu-arm@nongnu.org>; Sun, 13 May 2018 07:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dQekUTKSTW3TDpNmRn11J2E/kaL7mRBgRxfuLFN7TAg=;
	b=IN2XwlTfZPncn4apUtk+wV0KUv4qByRwOBRpKBFa2+KzakQf+tgy56Tyy9mGni79KT
	XT9w3HN2IN1T2fuZdkpLApISSx2KXSkKfiJ+z/PMO6zJDenyThn8f4WIcuUTAQ0suBni
	SGJ3LCw5lhbEZwzc90OtQoO5IiD1/dk8McuRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dQekUTKSTW3TDpNmRn11J2E/kaL7mRBgRxfuLFN7TAg=;
	b=uOBDW8OIgrjNsMP2kifk61tgFS+uNS2Hk8FGQq496BqfBi93gId8m1YU2KxvcycBTg
	3EdOczEBNJ8Z77Rs5I4JQhDifEq/LcDbtBPnlB/150YB6M9hUnel1BXTR2w26PlLSgCC
	16k9LsZ9GusTRpMDtyIy7/5Qr4P587/3VgCSWCJuobqD1w/8Z5R79wraVBhXhvfxQUo3
	9AL3gDjeM+wRIGpaW4+YnCzzRwMImNA7HENDvPot4YQ4arRzuF9/nfGI+h0Z/0ZIAANi
	JCNstbNZVLvU3Mk2kjTO9TFGrIWSlsy+Too9FTOzAzXyn+aoOEz1RaiJodjjJbVyuD+a
	rfXg==
X-Gm-Message-State: ALKqPwcc1v1o/vDG89tlwTaBx3tt9FE7xyVNZKQQr/ZWZmVpMx/n4mDM
	NPEV7VknlRfGM9rmpma3wOfh9N1/P/EyW/+3J0y0Ew==
X-Received: by 2002:aca:538b:: with SMTP id
	h133-v6mr4347484oib.252.1526222682295; 
	Sun, 13 May 2018 07:44:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Sun, 13 May 2018 07:44:21
	-0700 (PDT)
In-Reply-To: <cc3f26a7-a8b7-35a8-9ffa-c5940c9c1927@weilnetz.de>
References: <20180513090613.27960-1-sw@weilnetz.de>
	<cc3f26a7-a8b7-35a8-9ffa-c5940c9c1927@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 13 May 2018 15:44:21 +0100
Message-ID: <CAFEAcA9amm4vv5aGR-Aj8=iGKACS78Sb-J9kU2YH-UTbeT6sdA@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [PATCH] disas/libvixl: Fix VIXL_FALLTHROUGH macro
 for QEMU
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developer <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z+ca1vOLjvFs

On 13 May 2018 at 10:57, Stefan Weil <sw@weilnetz.de> wrote:
> Am 13.05.2018 um 11:06 schrieb Stefan Weil:
>> It now prevents compiler warnings (enabled with -Wimplicit-fallthrough=
>> or -Wextra) as intended.
>>
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> ---
>>
>> I suggest to add and use a similar macro QEMU_FALLTHROUGH()
>> for the rest of the code and can provide a patch if that's
>> fine for everyone.
>>
>> Regards
>> Stefan
>>
>>  disas/libvixl/vixl/globals.h | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/disas/libvixl/vixl/globals.h b/disas/libvixl/vixl/globals.h
>> index 61dc9f7f7e..33c4231d91 100644
>> --- a/disas/libvixl/vixl/globals.h
>> +++ b/disas/libvixl/vixl/globals.h
>> @@ -112,6 +112,8 @@ inline void USE(T1, T2, T3, T4) {}
>>  // C++11(201103L).
>>  #if __has_warning("-Wimplicit-fallthrough") && __cplusplus >= 201103L
>>    #define VIXL_FALLTHROUGH() [[clang::fallthrough]] //NOLINT
>> +#elif defined(__GNUC__)
>> +  #define VIXL_FALLTHROUGH() __attribute__((fallthrough))
>>  #else
>>    #define VIXL_FALLTHROUGH() do {} while (0)
>>  #endif
>
>
> Even with the above patch, disas/libvixl raises a compiler warning for a
> fall through case. The patch below fixes that warning, but I am not sure
> whether a fall through is correct there.

This sort of question is probably best asked of upstream
VIXL, rather than here...

thanks
-- PMM
