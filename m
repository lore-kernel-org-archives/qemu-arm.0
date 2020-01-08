Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp544758lff;
        Wed, 8 Jan 2020 02:20:14 -0800 (PST)
X-Google-Smtp-Source: APXvYqwfB7oEwirFBcs0pys05ilSffn+5nG1OWtN5r72GeoelkKUPlnLwkOYclIi5v+LZX6jqa8H
X-Received: by 2002:a05:6402:1764:: with SMTP id da4mr4713424edb.24.1578478814571;
        Wed, 08 Jan 2020 02:20:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578478814; cv=none;
        d=google.com; s=arc-20160816;
        b=qzniAXPIKs2aXDYfWsEpqIn2mcptenmMF7yuP6iNLOkSZpoPsbtxmcPxwcOouRlmKU
         AZkDnq+MApByC5R3w8fetu6D7gD3a7wiVmdh37e2+WlMJCmju/3mD2j0dz/vUbCN9Xqk
         Ld563iglYtgRJPsEbapFJYGd79PzBYDjfktr+nJ7sts8KEsJy6ZW2MvJaH3z0yW93yRx
         yhGUAJ/WPfNQUW447sfQfPMRQCuUgVJ4WTQ7idvvqWoegNkr4iZ4OkjtpM5PddKAIFrB
         qN8PIaaviRH9PlanmWSg7P/gIvqVOVBH34Zpkpt76WmyFqyg1QGXqhDVIva47VjpkgSn
         AZAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=RyBoWiJBCGcCVZtfCvXOgqZ1bALhwvzfRBQWkDGDhZ0=;
        b=w0uEuEIDUS5NmolgLzr2ndz3Pv0JbD4/KOf06aJb/gvKv77C8Gddd6A2OcEHN6UyVu
         M+rlEdW+SHP40xHOp8xI1z0L5gQfeEdTXJKG76r32UZvCcojSslSkLXVB1RXf47DN9c0
         KqCED8GyjFOxSfVU1E/iFCiZw2dMYUVfS7FabYgg+/L6L1cRoAODe3ltNbD/ZLhF7j14
         8VKeA5m8wZzj+GpBuKjK4wOII0/VGJf0GwJChUkV9ZzBo+2iGgNIB1dGEPaaodEDvF59
         iifDd6DHF2Qgx9MgBPoB6KM28QeU/4sMla8K2tEPTMzi3zeyf40f+OhPGTAyaQ7YKgvl
         oHEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TsxeX40S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m10si1734650ejb.242.2020.01.08.02.20.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Jan 2020 02:20:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TsxeX40S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ip8Rh-0002Ri-DO
	for alex.bennee@linaro.org; Wed, 08 Jan 2020 05:20:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38750)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ip8RW-0002RM-8Z
 for qemu-arm@nongnu.org; Wed, 08 Jan 2020 05:20:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ip8RV-0006Hi-7E
 for qemu-arm@nongnu.org; Wed, 08 Jan 2020 05:20:02 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:34767
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ip8RV-0006HI-43
 for qemu-arm@nongnu.org; Wed, 08 Jan 2020 05:20:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578478800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RyBoWiJBCGcCVZtfCvXOgqZ1bALhwvzfRBQWkDGDhZ0=;
 b=TsxeX40S/FJOqXqmbQ1obOUBAXK637bydsrmRmtT667891kIzTpsaUtStdyH0aTenMwxnM
 fVnkbhj7T6UoJTPHt9y0Ic/1+9zwsgWWEGDFTejrEprYqf3h0BZ+fuRjxMfzNUFSBupAxV
 lZkmGsoR0/TR7KSbna1mAaPpf0ms8R8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-7tfe_vUFNpywUAtGmLPQIQ-1; Wed, 08 Jan 2020 05:19:58 -0500
Received: by mail-wr1-f70.google.com with SMTP id k18so1251873wrw.9
 for <qemu-arm@nongnu.org>; Wed, 08 Jan 2020 02:19:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MGh33mR6NswKUUpxwqC4QRAUC3uTpwR2Lqx2wgrWhLE=;
 b=pCFtH3jOWwJXLnTK8cejONCft+2IsEtUgOzsUaBzsdvnGOsBg8RwPi1NhL4SQIaPcw
 9vqX6otH0Vpz9JWXvKcId4BQHSmhrek6qKZxFXwsO+SJRRvcARBBfsQdd4J0SnJY56WK
 dV4V3NsbRlE07kAF9FnHEFwsheaU18ZMnlXJHS0MyNMTWA2arvIlchDiN5hyZ95VYYmf
 qAiB/LwAHh18ArWiBvGdMZt0hJgFXWTHPJgegVDAbWJLoNTY+zKsV2pDpMHGMAqvb7YL
 rJ0PvjAyVjkB5v9wDdqJkjIpnjgFkswbnhTvDkLjdVXqIh2v+5Ym+3/tAoaJJDY794D5
 fU+Q==
X-Gm-Message-State: APjAAAXsynnVfBxxVV5Ik68aTQGF7TOZPRLJ2mBdR5EUWHKNAIktYu8+
 ioE7y2v0dq0iabVGeeIEAH2Yw2RooyOOVN3I6bB+rmX6DDmXwaZXJ3mtQssJ4b9rXtCQQxKxhi/
 qVmiYiqHXVnsc
X-Received: by 2002:a05:600c:22d3:: with SMTP id
 19mr2850858wmg.92.1578478797603; 
 Wed, 08 Jan 2020 02:19:57 -0800 (PST)
X-Received: by 2002:a05:600c:22d3:: with SMTP id
 19mr2850840wmg.92.1578478797423; 
 Wed, 08 Jan 2020 02:19:57 -0800 (PST)
Received: from [192.168.1.35] (34.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.34])
 by smtp.gmail.com with ESMTPSA id k13sm3535273wrx.59.2020.01.08.02.19.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jan 2020 02:19:56 -0800 (PST)
Subject: Re: [PATCH v2] arm/translate-a64: fix uninitialized variable warning
To: pannengyuan@huawei.com, peter.maydell@linaro.org
References: <20200108023915.52288-1-pannengyuan@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d15cbc0a-d2c6-d845-0d8b-6846d66f4c1c@redhat.com>
Date: Wed, 8 Jan 2020 11:19:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200108023915.52288-1-pannengyuan@huawei.com>
Content-Language: en-US
X-MC-Unique: 7tfe_vUFNpywUAtGmLPQIQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: qemu-trivial@nongnu.org, Euler Robot <euler.robot@huawei.com>,
 qemu-arm@nongnu.org, zhang.zhanghailiang@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VlOQK+NgqQ/g

On 1/8/20 3:39 AM, pannengyuan@huawei.com wrote:
> From: Pan Nengyuan <pannengyuan@huawei.com>
>=20
> Fixes:
> target/arm/translate-a64.c: In function 'disas_crypto_three_reg_sha512':
> target/arm/translate-a64.c:13625:9: error: 'genfn' may be used uninitiali=
zed in this function [-Werror=3Dmaybe-uninitialized]
>      genfn(tcg_rd_ptr, tcg_rn_ptr, tcg_rm_ptr);
>      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> qemu/target/arm/translate-a64.c:13609:8: error: 'feature' may be used uni=
nitialized in this function [-Werror=3Dmaybe-uninitialized]
>      if (!feature) {
>=20
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
> ---
> Changes v2 to v1:
> - add a default label to fix uninitialized warnings(suggested by Richard =
Henderson)
> ---
>   target/arm/translate-a64.c | 2 ++
>   1 file changed, 2 insertions(+)
>=20
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index d4bebbe629..63a3d26687 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -13585,6 +13585,8 @@ static void disas_crypto_three_reg_sha512(DisasCo=
ntext *s, uint32_t insn)
>               feature =3D dc_isar_feature(aa64_sha3, s);
>               genfn =3D NULL;
>               break;
> +        default:
> +            g_assert_not_reached();
>           }
>       } else {
>           switch (opcode) {
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

