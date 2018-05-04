Received: by 10.28.4.212 with SMTP id 203csp200186wme;
        Fri, 4 May 2018 09:13:47 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqIJSjDfvXTXf+zIIQwsAp+Csko7noP3jNPcmuujkgFEL15b4NkdxXEpXOAYTdWm7em0LKp
X-Received: by 10.55.71.3 with SMTP id u3mr22983679qka.317.1525450427346;
        Fri, 04 May 2018 09:13:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525450427; cv=none;
        d=google.com; s=arc-20160816;
        b=Yw2smF2mgIxeC8qHBDfWTRVwanYLEXOvctv1/yJLJu0cvv8KawTFFENgM6BAgI3iPQ
         4ZUVSOGyefm1aPMVWnX+UPNZbVuINyt4T/aqkjDLU00ayw6btcbO05pHgL7PiOKicXGb
         pfRQK2JBMRWmCq5E3aLg5pJP9fXI93hDAczbBYndZE8cyyEdnKUppBEHmbjRn1QRg6KO
         kb7p3xjjcUOJEBmnxqF3J3keb1q/D/SuKZbUZ1080urpVFkWRjqoJ87Co4LdAjwTYkdc
         e7AbuWqsMcTKd4ohoEPu0841w0vXAtbPZlPRrSKVtI+mTg25D0bRiZ52eicf8VkyX2E0
         /dHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=SDEqxjcMymEKUK49y9htwvesJu2nXMOaYP08+/vhjpA=;
        b=eXMwkqpHsqHR4pkrK4kE14lTgc+A0b+2bp39sMaSSIIV7+aCLVxNW6ahjJWxZYt/0Y
         +MkruuDvGOpzKgZ4nad1Fprc0Uga4Kp3QCZZf3d/AU+OIDvtKIZ2UvUYwvtw9z5Od/rg
         iapXWjfop6ClJQC0XhN71ZL+D0ZVBpXV/ZT1CoZOzWXUfmLE60LfC/Ds+7AJDyj/5MbU
         A8HzBAoF66O7/3HIYQgdvK7vnjqACFcpiJDAgHnjM8+kX+PUjVClMw+M59x3Ky1YKcb/
         3egVHiYQXvudhXPRCpFwlQLOTfcSgTtAucR2W6s2eJRwD4PI7VGV/9KkOhna00vRZtST
         8dOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fBcdJs01;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w10-v6si8879075qti.119.2018.05.04.09.13.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 May 2018 09:13:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fBcdJs01;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35138 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fEdL8-0005el-QL
	for alex.bennee@linaro.org; Fri, 04 May 2018 12:13:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56891)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fEdEA-0008JY-5G
	for qemu-devel@nongnu.org; Fri, 04 May 2018 12:06:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fEdE9-0004lP-DD
	for qemu-devel@nongnu.org; Fri, 04 May 2018 12:06:34 -0400
Received: from mail-ot0-x241.google.com ([2607:f8b0:4003:c0f::241]:43945)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fEdE9-0004l4-8X
	for qemu-devel@nongnu.org; Fri, 04 May 2018 12:06:33 -0400
Received: by mail-ot0-x241.google.com with SMTP id y10-v6so25021590otg.10
	for <qemu-devel@nongnu.org>; Fri, 04 May 2018 09:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SDEqxjcMymEKUK49y9htwvesJu2nXMOaYP08+/vhjpA=;
	b=fBcdJs01SQ+sKoDJmflwSdG8hpkm9oq5Oo8RgdgrbL2PCksKiiCz370Y8GLNWSA8NC
	nQJ2WBz/CzIXvsh7Ayas0B3p/osvc2ncA5A95935hH6KwjrtZj3cQ2wNW07UiVKpvZSD
	Ss7m/yADVO+SKZn1sjZHvVhkujCWDEstKCDGU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SDEqxjcMymEKUK49y9htwvesJu2nXMOaYP08+/vhjpA=;
	b=CjxpE7lBCfL8Km4mT83P9mvOJDrWy5cc32vCIGvmAiwNdMwzLVPMRRdt1jslp2e6jM
	dzEh4Chymu+y6vZfrgesbrrto3fWbmxCerThZYOB50/3f9yvVYLGcCCgQO6s4lH+4qC7
	YFcs03KilssNvQ3YcJXYDi47c17Fxs9rqMRM+9bRAJkMZkN9zNHFW8ROPo/N5i/Sc/IK
	HAWxMMsYCFjfh2F91KY/2Ozf77OyAYgyQRgNKsJXeJI8zwl1RbnAxzaAPwjk5tSikXtU
	tb+ePKB+3pYu5ykS5J4KpRE9Id98G2S6fTNQ5MPQZkzuCORdVhTqQPZV1rgZ+JHgOyT1
	eStg==
X-Gm-Message-State: ALQs6tBOHh7nfGT/hxJfIs/WBiFecXHGCkxrSdmztoFvHIgdov+0rBX3
	H8hTOZtOJxu/1Y28lb4jDhnpCViEHGZ4IndKNaUZ3A==
X-Received: by 2002:a9d:429c:: with SMTP id
	r28-v6mr18741852ote.126.1525449992529; 
	Fri, 04 May 2018 09:06:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP;
	Fri, 4 May 2018 09:06:12 -0700 (PDT)
In-Reply-To: <9cf54353-2e76-dcb0-04d7-b64c65d39b5f@linaro.org>
References: <20180427002651.28356-1-richard.henderson@linaro.org>
	<20180427002651.28356-9-richard.henderson@linaro.org>
	<CAFEAcA_ZaP8Wxe3P+5SKpmQxzJqOEQxnKcdh7StGytOi9iR0yg@mail.gmail.com>
	<9cf54353-2e76-dcb0-04d7-b64c65d39b5f@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 May 2018 17:06:12 +0100
Message-ID: <CAFEAcA8_S_eG3ouh2JE8tugfoWj_2EJPssqtbys_jeJp3D+AQQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::241
Subject: Re: [Qemu-devel] [PATCH 8/9] target/arm: Implement CAS and CASP
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O89QThVCaJ3B

On 3 May 2018 at 18:32, Richard Henderson <richard.henderson@linaro.org> wrote:
> On 05/03/2018 07:55 AM, Peter Maydell wrote:
>>> +        /* If compare equal, write back new data, else write back old data.  */
>>> +        tcg_gen_movcond_i64(TCG_COND_NE, c1, c2, zero, t1, d1);
>>> +        tcg_gen_movcond_i64(TCG_COND_NE, c2, c2, zero, t2, d2);
>>> +        tcg_gen_qemu_st_i64(c1, addr, memidx, MO_64 | s->be_data);
>>> +        tcg_gen_qemu_st_i64(c2, a2, memidx, MO_64 | s->be_data);
>>
>> I think this has the wrong behaviour if you do a CASP-with-mismatched-value
>> to read-only memory -- architecturally this should fail the comparison
>> and return the memory value in registers, it's not allowed to do a
>> memory write and take a data abort because the memory isn't writable.
>
> If this is true [...]

Fortunately it turns out that it is not true. In the pseudocode,
the CAS accesses are made with an acctype of either AccType_ORDEREDRW
or AccType_ATOMICRW, and when this gets down into the translation table
walk code AArch64.CheckPermission() handles those access types
specially and generates a permission fault on !r || !w, so will fault
the read part of the read-modify-write.

I wouldn't be too surprised if we get the ESR_ELx WnR bit wrong
for this (it is supposed to be "0 if a plain read would fault,
otherwise 1"), but let's not worry about that for now...

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
