Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp4693648wrw;
        Tue, 13 Nov 2018 10:15:43 -0800 (PST)
X-Google-Smtp-Source: AJdET5cArNu3rj7aqz4DCEAb0p4obzAVOXQXklv/TLZdfO8mmn/x1kIjrWKMoj6H+WL6etUE94wh
X-Received: by 2002:a37:6005:: with SMTP id u5mr5008678qkb.219.1542132942974;
        Tue, 13 Nov 2018 10:15:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542132942; cv=none;
        d=google.com; s=arc-20160816;
        b=AR7vOd/zod/FBtD0J430MwoQTXdDdoSh/L/xUPJqKUUw/+MIPlVG9BEY+ErNQKe0TZ
         h7BPPURTGZ9x6C+zyz5QMpUe25xST9Wh4WSMGX70NspUfp2wmhhA4Gbrbb322Ur2ZMqf
         IkeyjO9jwi1aDo/mSvh3z6wOVLER1/9zOGzrwkEmqCinIQ5GenjgyjhHAAuODXqpssYC
         E1zUC6k7DkTDWrjLlzrXqzGjtTRVwo4Qv1TExexnmnCJNNqMif/ZqHJeMElY5Bsr5xbF
         DXO9SXWAbssBXfPt1DPxTbtaFjXE2+cByNsDkljcPwG7iKYO0hknLr0ZpMbf5XofLtE7
         975Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=GTuAjL4jCYxfkc4phOsj4ZEzYDVctqKTHfhrmWRELPo=;
        b=MkHX4dR/E/O3yqtYSLp6n0CL86qhHemlwwiVcC72bMOoe/4mTMH8u+dsDYl5qSt5m+
         Y6NSbnutyqHn3V/w8bi3a12nV2EouuigelDZ3MAbln+zeko0Rfxv2JnGJiLuuK7lQpO1
         M9aS1c2DNaOiitcg6/J07g7daFIqWxhSfMyTpk0m0rWg57qokMuPAtCYwBXk3LkFEGnN
         csr0gPNGrrjeAURTtgaG+ZcwfToKIVJ1uzWqTtyqggnBr1bJ1hd92o63BkZGkfYXO1Y4
         w1RR24DrjPJtgCW5QEY8CkFcylwwk6DdmLmt85ers8ruODOmUT+krfClFmfgOkgJNK6C
         RrEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KZQ+QN6N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n20si13881791qvh.47.2018.11.13.10.15.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Nov 2018 10:15:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KZQ+QN6N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55553 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMdDy-0003WK-9s
	for alex.bennee@linaro.org; Tue, 13 Nov 2018 13:15:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57904)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gMdDh-0003DO-PZ
	for qemu-arm@nongnu.org; Tue, 13 Nov 2018 13:15:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gMd6q-0005av-IH
	for qemu-arm@nongnu.org; Tue, 13 Nov 2018 13:08:21 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:35087)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gMd6q-0005aO-2S
	for qemu-arm@nongnu.org; Tue, 13 Nov 2018 13:08:20 -0500
Received: by mail-oi1-x241.google.com with SMTP id v198-v6so11172812oif.2
	for <qemu-arm@nongnu.org>; Tue, 13 Nov 2018 10:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=GTuAjL4jCYxfkc4phOsj4ZEzYDVctqKTHfhrmWRELPo=;
	b=KZQ+QN6Nc5yfo4wy9ku10qA4znE2Oan3gxwaSMEiiceF0ulPyPOQ6OnP2Xt3QDgmhe
	Iv/ONr2qvGaWHbydWOFCtou5YsFTqLVn1KGMxRopD/JPe/Tn645N0rowajMRzce6B75y
	uaD58CqoIvjfwgYIRhWar3wfo3k2HVsD+9fYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=GTuAjL4jCYxfkc4phOsj4ZEzYDVctqKTHfhrmWRELPo=;
	b=X38s+ozH2ouEJHty+X/6ZR8AKM00Hiw+rIpneVIc7MT1DtH1z472eB7N5wA/d2KyUB
	OJTne+HOz3+sI4vev3LpiDIsIv5faaA6/AskhjD/Zer4GN/89hBoh/tERgNRA0OlkudW
	IS/sDi0sWQnaTqRsqsdq9ci/cl11v4luzfhhfQaWuKBfgSQ4XW10brluDyF+187evCoA
	Yx9WiSEUV6asB/lTB8i+yxshQrwRM19/+Imvlmu7sTz3Cn6mr7+7RiTVEd3C3bSZ/dvg
	doD1BGA/vM4nr7xXKXL83vDFDYvCu2cexL7wA3WaC9nXDK4jS55WLj8SOATwYWgFtoEN
	JiPw==
X-Gm-Message-State: AGRZ1gIdgfFoiQAgC4NwiNB4sg1gSw/UVQ/1LZyKGovRGoWbBCkIlAl4
	Jvs+b/llL+vo0IQvhi6zyVSqJthQ80zJWbu0b/TlSQ==
X-Received: by 2002:aca:c50b:: with SMTP id
	v11-v6mr3393485oif.48.1542132499393; 
	Tue, 13 Nov 2018 10:08:19 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP; Tue, 13 Nov 2018 10:07:58
	-0800 (PST)
In-Reply-To: <37b5f17e-50cd-6980-2d42-4e7f4ede2597@redhat.com>
References: <20181113165247.4806-1-sameo@linux.intel.com>
	<20181113165247.4806-3-sameo@linux.intel.com>
	<CAFEAcA-R51dyV7gtS+q-eLNn5LBJbSMKtQu4-N3p0c4mJrU8DA@mail.gmail.com>
	<37b5f17e-50cd-6980-2d42-4e7f4ede2597@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Nov 2018 18:07:58 +0000
Message-ID: <CAFEAcA_O5x3QuTnKkupur=iwQaEg-i1z2mWoNCiZt_zM5xi-XA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-arm] [PATCH 02/13] target: arm: Remove unused headers
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Samuel Ortiz <sameo@linux.intel.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WDylPPb2iFBx

On 13 November 2018 at 18:02, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
> On 13/11/18 18:01, Peter Maydell wrote:
>>
>> On 13 November 2018 at 16:52, Samuel Ortiz <sameo@linux.intel.com> wrote=
:

>>> --- a/target/arm/helper.c
>>> +++ b/target/arm/helper.c
>>> @@ -12,13 +12,10 @@
>>>   #include "internals.h"
>>>   #include "exec/gdbstub.h"
>>>   #include "exec/helper-proto.h"
>>> -#include "qemu/host-utils.h"
>>
>>
>> This is for muldiv64().
>
>
> But it is already included by "cpu.h" -> "exec/cpu-defs.h"

> So they are not "unused" but "unnecessary".
>
> I thought this would be better to clean this once, before Samuel split.

Generally I think that if a .c file directly uses function X declared in
header Y it should #include Y, even if it happens that it already includes
other header Z that includes Y. Otherwise if we refactor Z later such
that it no longer needs to include Y, it will break compilation of the .c
file. (That is, Z including Y is a detail of the implementation of Z,
not a guarantee made by Z to its users.)

The exception here is where the header guarantees that it's going
to include certain other things (which is the case for eg our osdep.h).

thanks
-- PMM
