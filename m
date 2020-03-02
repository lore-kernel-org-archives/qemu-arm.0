Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp3013045lfg;
        Mon, 2 Mar 2020 15:53:24 -0800 (PST)
X-Google-Smtp-Source: ADFU+vtBWIKU4Fi8IDt1BtkE+bYF9xDWj5Z4UB2G8MpUXUiUW16AQ0PQkZqg7aC9mz/GpuC6qvv+
X-Received: by 2002:ac8:6b11:: with SMTP id w17mr2087572qts.237.1583193204315;
        Mon, 02 Mar 2020 15:53:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583193204; cv=none;
        d=google.com; s=arc-20160816;
        b=Vioh4hmP/cxVC7F+mTVYlE4ZsB3mPhUNVQ1gQbu1GVsLOJvXnqKt/TD72r8xNeo4rw
         OmA43LTix5M0lLc6I9Mqm1QxjQ7efFB4QK+3F0M5TC0YMnQL9UA/3zV93tyZtcytRhr7
         2OyG4+x1BzXH+AyfKGn4rD5RU0dseuH29UkkuInWoq05047HPTsH9D9/rXFmNrnIrbA0
         832FyUUXTPhjO97ETPCJTK8seqzU8qQvwMsKxTbzkYq59KsmyRXWusni/Um5+uXAS10L
         s79XHTvc4b/BzRX65CHD/tiDZ9HWEEld+NxeO1rDgU9rF66NTlcRtpf3Iehf+d0fvo9w
         P5Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=V8dxAEEcWtFw37h+1gk7F3+3uCFbExHVPI+7q+m/Npk=;
        b=uKKTbkWUuNOq7SIkFrdkDN494ZhwQWEHTFLdwgEvHHocCYFGsqdEuluuTX0R+url27
         AFcDO4+HSJttCPFBDTpzsAubNpWzIdft8ftQezOAnV1UPDAhwmcze2JJVSh6iDUIXxxs
         g0JvRhP1+r+7IgSt/V86s+1rKheWnYvs0E9IBHB9mKBSv0CibdaO/Zo0bQas/n5A/zYw
         SRMuiaH1bgdStQhCL+rKPyw1hAW7b4c2HsejC0k12xBKvxzTesprrSu4TnHEPTjRzQsl
         eSNmr1UC4qZUOGFQU+7kmN1GB30OowNd2ODwrXIJcn0hBwkio5lAywtpzcOgVtIfAWqs
         6+bg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XU0YhUQF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w23si6540181qkj.283.2020.03.02.15.53.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Mar 2020 15:53:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XU0YhUQF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j8usF-0007re-O9
	for alex.bennee@linaro.org; Mon, 02 Mar 2020 18:53:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38097)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j8us6-0007oN-8m
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 18:53:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j8us5-0001qR-B4
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 18:53:14 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:49503
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j8us5-0001qI-7N
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 18:53:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583193192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V8dxAEEcWtFw37h+1gk7F3+3uCFbExHVPI+7q+m/Npk=;
 b=XU0YhUQFk263y8EF6IZamb9AE5tJVdhT9xjKSrXULIM+HMaCqIYGhQJ4o+33XyG5AC9vEm
 2Kl/FmQYzHDJeAFVdc981ScCt6BG1s6vfXs6ADm0cCTxgcpQ2VNUMrc000GBUjmOAKr+oM
 TRgeuKxGWBTE4YqoPMZDnLBOAhGd81k=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-0JM2bTG_PZC-jOGEHDSS3Q-1; Mon, 02 Mar 2020 18:53:11 -0500
X-MC-Unique: 0JM2bTG_PZC-jOGEHDSS3Q-1
Received: by mail-wr1-f71.google.com with SMTP id q18so416767wrw.5
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2020 15:53:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/L6kOvySyj80Ozkhxppgla5m/9jrFkOmRy98lPQpROQ=;
 b=B4klkMUO7xD+czimt0BlsfqzjZYP6/4V3DPUFD1va4SMWF/pSX+MYZWCZPmjc8TmND
 VqGYzIYjKDYjxZ7WzPAP5dw8o38qBs4vMWfQrkgzUDgnqYFSWFLHh1Wbn53XigED3/yQ
 VWkHCTrK9COCKZtWJXKVW4J1JbEaaXI+kxvDOGAveyXFQEEYfkiag/U8q5negL/9zljB
 nTomNsISvo2/5jiu0skHqUpLUJg6JXFy4WSqqB+RrK6ZFLz3HP7V3TotUzovjy76mHb+
 N14YQ5R11tvnperupFjbn7Pa7avFPzonQl1QCXHBg0f5sHThStPrW2S3i6VSCjNN04V7
 yo/g==
X-Gm-Message-State: ANhLgQ3pT1S/NsudsgiNWgicqmlCR5aGk4Z2qUa2/E27nK66wIym9+kS
 9uEA4oB125iRMW1edsPPg7IfyfH+bV73/sjRsCj4XEX+e2fjYMewbg6ArWobR4wJKDC+L0PVugM
 ozofGMF4thzC5
X-Received: by 2002:a1c:6884:: with SMTP id d126mr748364wmc.38.1583193189913; 
 Mon, 02 Mar 2020 15:53:09 -0800 (PST)
X-Received: by 2002:a1c:6884:: with SMTP id d126mr748348wmc.38.1583193189666; 
 Mon, 02 Mar 2020 15:53:09 -0800 (PST)
Received: from ?IPv6:2a01:e35:2fb0:49e0:3f7b:4b69:b9c:cdc0?
 ([2a01:e35:2fb0:49e0:3f7b:4b69:b9c:cdc0])
 by smtp.gmail.com with ESMTPSA id 90sm30004025wro.79.2020.03.02.15.53.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2020 15:53:09 -0800 (PST)
Subject: Re: [PATCH v2 6/9] target/arm: Use DEF_HELPER_FLAGS for helper_dc_zva
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20200302175829.2183-1-richard.henderson@linaro.org>
 <20200302175829.2183-7-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <fcb32d87-a012-060c-0e07-af54115ae502@redhat.com>
Date: Tue, 3 Mar 2020 00:53:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200302175829.2183-7-richard.henderson@linaro.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4fvtaOa05rnL

On 3/2/20 6:58 PM, Richard Henderson wrote:
> The function does not write registers, and only reads them by
> implication via the exception path.
>=20
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/helper-a64.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
> index b1a5935f61..3df7c185aa 100644
> --- a/target/arm/helper-a64.h
> +++ b/target/arm/helper-a64.h
> @@ -90,7 +90,7 @@ DEF_HELPER_2(advsimd_f16touinth, i32, f16, ptr)
>   DEF_HELPER_2(sqrt_f16, f16, f16, ptr)
>  =20
>   DEF_HELPER_2(exception_return, void, env, i64)
> -DEF_HELPER_2(dc_zva, void, env, i64)
> +DEF_HELPER_FLAGS_2(dc_zva, TCG_CALL_NO_WG, void, env, i64)
>  =20
>   DEF_HELPER_FLAGS_3(pacia, TCG_CALL_NO_WG, i64, env, i64, i64)
>   DEF_HELPER_FLAGS_3(pacib, TCG_CALL_NO_WG, i64, env, i64, i64)
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

