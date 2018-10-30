Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp5270748wro;
        Tue, 30 Oct 2018 01:17:18 -0700 (PDT)
X-Google-Smtp-Source: AJdET5fQNbQtQvufNFaXPxzlvPpU/CAkaWktmnYV0X8npIgptB2OdK/d/zVK6sRChgUETc1ROkcI
X-Received: by 2002:a0c:cdd1:: with SMTP id a17mr9295416qvn.152.1540887438294;
        Tue, 30 Oct 2018 01:17:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540887438; cv=none;
        d=google.com; s=arc-20160816;
        b=iNhPr529Md/ZKKTZIBAISkfaieadGZy3L4VnDi+I3Up/Iytc315fVfS8Fgw/fRfwOi
         rb5k1ngQb3s2LP8WKAY3M+txgra7PZ7yaGLxqmZV464Z8WvDUkV/SCpmA7NgpbiM/dgM
         ARIW389qshdrfKS+qJp3IqOxyqzLIpxjwwVtZOryFTsBf9JwE7gUnG63XoGxdkG7WCDy
         pnJkKRMjXo+P2yFM2/4ROsc2zKZa3aGEYWPDRHSkYKbkz1+yE7lmRE05YR4h/kf/RqQQ
         c9WRbQ6ElyQzKFaCge3hLM0JqmiSvo6pPLyXxkfQvYtM+MENSLaR5sy8UlK/Z7J8ljSQ
         8yfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=C2CiPdL25fTIYbVSKq9hbF5nQoJhp5LwXQf6WS3SByU=;
        b=lUjzt63D0dDYDX/iIMNCerTI/KcAu/312rzBngCyLoGkj1sKllsaGeUAlJDvl5foqP
         pFDgWM6PqMTW7k/14pPj+9ciyKiBWIdCdcPsmHbXo70f16icSt8GVQoXRyn3bUDHbSMd
         9dCU66GiaCmnFeG8+C/q4ZUOk0tmo7A2FptqAjW2JAqJ9i2TngVmIK0FngMPpWgHD6+3
         c1EySZgxE0WJZT1b3SOSaidist6OloAP0spbCdwpgKsk46Y43rcz4jQs30nRpLmv9Wtu
         0TKHjfNfS41X+skHQfhzm0e7JJe/HBM6HWAy0myeB+d+sA1jAxGh2dJzzh9HlTrVbg+J
         or3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CON53n00;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s17si185660qkl.40.2018.10.30.01.17.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Oct 2018 01:17:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CON53n00;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51507 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gHPDB-0004vp-RI
	for alex.bennee@linaro.org; Tue, 30 Oct 2018 04:17:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59730)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gHPCg-0004ts-Bi
	for qemu-devel@nongnu.org; Tue, 30 Oct 2018 04:16:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gHPCd-0001be-0V
	for qemu-devel@nongnu.org; Tue, 30 Oct 2018 04:16:46 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:51990)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gHPCa-0001Xu-Im
	for qemu-devel@nongnu.org; Tue, 30 Oct 2018 04:16:41 -0400
Received: by mail-wm1-x343.google.com with SMTP id 143-v6so10687847wmf.1
	for <qemu-devel@nongnu.org>; Tue, 30 Oct 2018 01:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=C2CiPdL25fTIYbVSKq9hbF5nQoJhp5LwXQf6WS3SByU=;
	b=CON53n00dAdbUfRzdvtNdqvy0R+K4M1/yGhPg3GdhOFnD/o9TuKTRDw7bMllyZuGXU
	EPYjMN+UxZCy3F1a8CFr7NF5+NPV6jUcS7jq7ebqHvLGit8S0rb54MM3ASKM+s7b0tcv
	HFivUfixfDwWwXkd3tOoy80lP75gh7jKIZgPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=C2CiPdL25fTIYbVSKq9hbF5nQoJhp5LwXQf6WS3SByU=;
	b=g2HQzmqLxk0t4Zk/cZQdWF2GgdMIAiPDXCqhOOA3Txts3wJe1rSToye/PSNU6JgJNW
	JQ2eJ3gUTRhISsRu4ycOWAE3XRX+yMzUe4jN6SAJgDfw5NRDhH6xmuByszbs6vDxD/gK
	Don2rwVsyEN/BY7tqkKkeGSjPNpBTpDP59V5UT296v9KMUWJMLZIP7N0a0JhgD+E06KQ
	hwKso9uzIC8uW2/k14h34jsqQP6nL1+4zCniBNBJTpqT8LG2FMHJUDWDy7GfL2IrpwWl
	j8U9os63no2rIW7+z5c+bzHeOF4RiJ0LEuhMFJt04DzxM3LrhNsyY4GLVtXLmNKInFo/
	7uwQ==
X-Gm-Message-State: AGRZ1gII7YSq6MEe+NSWgq5BiGvXcz7iHz6YQDF2jFaOj3e3eikZwPOp
	X9pLPKGShKzbhxCyBqk5ARhaJAloXWo=
X-Received: by 2002:a1c:838a:: with SMTP id
	f132-v6mr906392wmd.51.1540887394105; 
	Tue, 30 Oct 2018 01:16:34 -0700 (PDT)
Received: from cloudburst.twiddle.net ([5.148.65.242])
	by smtp.gmail.com with ESMTPSA id
	z12-v6sm8793114wrn.43.2018.10.30.01.16.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Oct 2018 01:16:32 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Guenter Roeck
	<linux@roeck-us.net>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Alistair Francis <alistair@alistair23.me>
References: <20181029232100.8454-1-philmd@redhat.com>
	<20181029232100.8454-2-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <6adbca95-631e-685f-11ab-b9a464c0add3@linaro.org>
Date: Tue, 30 Oct 2018 08:16:31 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181029232100.8454-2-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: Re: [Qemu-devel] [PATCH 1/3] hw/arm/xilinx_zynq: Use the ARRAY_SIZE
 macro
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Pl9nLxhoDs6g

On 10/29/18 11:20 PM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/arm/xilinx_zynq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
