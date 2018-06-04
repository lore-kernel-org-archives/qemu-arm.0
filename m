Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp853962wrq;
        Mon, 4 Jun 2018 10:13:33 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKK0crOBAWir8vl9TNtA8fLT9exdZObBdTJVlYtJpQqfUGsVpGP4e8Qtp1wuV+6Y+Bq/zKw8
X-Received: by 2002:ac8:30b1:: with SMTP id v46-v6mr22175150qta.353.1528132413025;
        Mon, 04 Jun 2018 10:13:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528132413; cv=none;
        d=google.com; s=arc-20160816;
        b=de+rnnRyS34EuH0uSpYmZUX+HXGtz22s0sCfTaEj448LmPELITEx3PLAzVbvdnJXVu
         aHHH/Sn+QkPxNT2kRKat+FH7z0UoVSymbcypfhesKOr4HuhVilrdtG6fJANFuiQbvIBh
         JXi+5JAzRqxw7Gahh0O6LZk00IdqNyMhzFB4YXQ7YUlZ12sOBA2hSO8tQ8XAlm0tKas7
         41URnuJdz0NqHQdPTyWp0aJfImCAxme/9xL9W3F16xCrDX1k8SJdguFRSqViwa/yfq3y
         xIJABJjyYjp4T3hwLQVYhrk0ORqpLKxwU8d0vc/zBWGJ8KbLDKlvLRLOw+TjztTzpZeL
         qRZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Clyt5p2snaibgBIUwGcWY4EvFz2+oqF/+zisLxpjk9g=;
        b=cVYj7iNrxAD3M+wFuUoCJjH2Oeu8xAhfX5OmzmxOXooW8hb+aTqRtzmuJe0IGNJuLM
         oHFZD+vD3/fnpTDe9jh4kDQuPcB5vuKcKunWIAshRYFFPg+lTg+ymx+plHggO1t0/5z0
         YDIT3RNwws8Vh6pahNSiy51Jlx/duWQ/n0Cj6IEYPEHUA/Tpp+pKPsKYjKLufyeTa989
         eP2sMGOMJDHt8ERS951JwbbtYEisoKXHb1oRACfEh6E7+OMNZSiRwP/KiVej/LCYbq8w
         1/4dpu0ekAdKMVlLSZFBX7eBqkf3jces8Zksv7QJA6crLqP7GpUqP+QfGNDZpj4VYBJP
         0MAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Czhz/MXz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a9-v6si1044690qvh.29.2018.06.04.10.13.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jun 2018 10:13:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Czhz/MXz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41109 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fPt2y-00048p-GB
	for alex.bennee@linaro.org; Mon, 04 Jun 2018 13:13:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45324)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fPt2m-00048S-RI
	for qemu-arm@nongnu.org; Mon, 04 Jun 2018 13:13:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fPt2l-0004Ju-KW
	for qemu-arm@nongnu.org; Mon, 04 Jun 2018 13:13:20 -0400
Received: from mail-ot0-x235.google.com ([2607:f8b0:4003:c0f::235]:34702)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fPt2l-0004IE-Fo
	for qemu-arm@nongnu.org; Mon, 04 Jun 2018 13:13:19 -0400
Received: by mail-ot0-x235.google.com with SMTP id i5-v6so38618040otf.1
	for <qemu-arm@nongnu.org>; Mon, 04 Jun 2018 10:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Clyt5p2snaibgBIUwGcWY4EvFz2+oqF/+zisLxpjk9g=;
	b=Czhz/MXz8mtP4mWhs8TKxdOvjDnNjsp36hnPdT0oRWWthnF13+rh905ICiMBSEsoj0
	40Gb4wR1D+H7P0Y3G+vaPhZUPwXAr/2yNQqyxpzz7RnNGilhWYGa7wA8aW3hBXx5APuu
	mdiNZPrC9SEmnEYvYci+nobvFHGc7vY7nMFe4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Clyt5p2snaibgBIUwGcWY4EvFz2+oqF/+zisLxpjk9g=;
	b=N7+0EmAD0zQPjkPQrCYWMmkIUNhyKG7JSne+iBguxOI8BA5Kfz5jFjmML8MmimkI2B
	H4qE44Mp1ylrqQiu3CFAYmfabB46PCJU7qbWSZZPvjY1/GYSoRRa9vaafodbkMqDYyCz
	E2JA5Jq/0z96aeshHYZaocIAvIK0uXho2FSAKiyCCL9qR8vCMei73ESlxBqOGMakSJUa
	dDzlr3cMpPQGQiof1eG5jcepYMpCA3AMQMvE5c+QrDQgSmNSQPXCBzIYUf/EMceHQP73
	wN4Xe0livrAMqAErvDskYqazvzo5vNSuC3Sm5Bu2L3XKZ0PLszNrVh+C2oZmH5SjY/PM
	hJWw==
X-Gm-Message-State: ALKqPwfftyOXgaMDen5QGUZs4fC+Htr5GDfAEjoGfbTdYTCHv6VLr/oC
	YoCpqgJanNAS0+MvUOf42XSGg39PJXCq7DvGk1r/0w==
X-Received: by 2002:a9d:16d0:: with SMTP id
	s16-v6mr15942045ots.294.1528132398875; 
	Mon, 04 Jun 2018 10:13:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP;
	Mon, 4 Jun 2018 10:12:58 -0700 (PDT)
In-Reply-To: <20180530180120.13355-11-richard.henderson@linaro.org>
References: <20180530180120.13355-1-richard.henderson@linaro.org>
	<20180530180120.13355-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jun 2018 18:12:58 +0100
Message-ID: <CAFEAcA--ORAcmi1h74EeRpSY40tJ=wvAVTT9594A_oMFty5pZQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::235
Subject: Re: [Qemu-arm] [PATCH v3b 10/18] target/arm: Implement SVE Select
 Vectors Group
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xK8sbKA7svTM

On 30 May 2018 at 19:01, Richard Henderson <richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    |  9 +++++++
>  target/arm/sve_helper.c    | 55 ++++++++++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c |  2 ++
>  target/arm/sve.decode      |  6 +++++
>  4 files changed, 72 insertions(+)


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
