Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp7124581wru;
        Tue, 24 Jul 2018 11:33:56 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeSTYbARfloEFiomTRCxRMhVlxVk3ZUeUJrsrJUOHZrgS33uNtjxc7gVUEp0IkDWVMq+wzr
X-Received: by 2002:ac8:8af:: with SMTP id v44-v6mr18201302qth.33.1532457235970;
        Tue, 24 Jul 2018 11:33:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532457235; cv=none;
        d=google.com; s=arc-20160816;
        b=PFW3GWYq7LZEV4x3/PdHtCZvCGmfDQFOtNsmHePD//FUI9qp1t00mGRSGZTQ37pl2q
         rQCTrCxcP2X2NNDGuVWmuLDqnygsvTectvLyDsgPKk4XhvzSD70Uv5Lbr3GZF4nVcxaj
         RnG2/5vSCzg5dbyPiy+CgTZfws51BROdqSHVyysqyphivG3Hr418dm2YqQhLenxfqsnZ
         IMMoTXmFzqow5n/uYOYlLDZo0Sdt5lsloBRLjEHiNgmn0xe8LA0c1BTe3CY8VLYjU+86
         uW8r0Dr/VJvQdTt3H4HtSEooNTuLcr6tIpl5N8E/DpFg+3ogJVDZRNHmY7Nci1D17TP9
         H6dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=606Vdex6Bt9wiab12IgG19xdk7CBBZZwQv961duq/X4=;
        b=rwbrvrCsBok/3XiR9MA4qQT03HRCvGsJ6Ht7ww+IQGjqUro/edQlje16nER5AlMoUc
         Zk20IVcPERmeMOdqJNkDInWSQRijqb8KRWg7PMLeRrNaaARJSjLoEQsuwwEP3Hn6gnoz
         +/Bx0kwIFnJVDwmrqD8v2cgezF9UtIDYa4rmR8T4qj0+70oYRWDC0RuyWfAxundWZhQx
         GEu91IrpDm8v6lmMCQ4zc+duiWbg5xE0ytE2NYNDftHiXKWgptJdchh12zVY+MkGi5/d
         hy1zvwj49lprSmy4EQgiFAzDl9HV9ugUHYcdQDC3voim1wvgVRMT/QWdXe+x/uoADYpR
         ynfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="ILX/uFEf";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 22-v6si5104175qkm.51.2018.07.24.11.33.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Jul 2018 11:33:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="ILX/uFEf";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42049 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fi28B-00073d-HY
	for alex.bennee@linaro.org; Tue, 24 Jul 2018 14:33:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45138)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fi27z-00072B-Cb
	for qemu-arm@nongnu.org; Tue, 24 Jul 2018 14:33:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fi27y-0001Sw-Lp
	for qemu-arm@nongnu.org; Tue, 24 Jul 2018 14:33:43 -0400
Received: from mail-pl0-x241.google.com ([2607:f8b0:400e:c01::241]:36883)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fi27y-0001Ry-Dp
	for qemu-arm@nongnu.org; Tue, 24 Jul 2018 14:33:42 -0400
Received: by mail-pl0-x241.google.com with SMTP id 31-v6so2135869plc.4
	for <qemu-arm@nongnu.org>; Tue, 24 Jul 2018 11:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=606Vdex6Bt9wiab12IgG19xdk7CBBZZwQv961duq/X4=;
	b=ILX/uFEf7Z1iqAtveU2CO6yyM3PyFyVKP8oCeO3BfiEcsMMsINIU5FdvSy1UqAvNFc
	AY/h63HvwXa6Yb7CM04gw7UNok8AsgSCi1nhWRKBtS515ZZG3jgVq5IRN+HCHz8GR+n6
	dP0DEZW04Ez64tDwYkBPK2KQmK0LFb0h0xRTA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=606Vdex6Bt9wiab12IgG19xdk7CBBZZwQv961duq/X4=;
	b=jdxvEjDFfKYn3V5gdzRwtwWp7rQJUbrNmL/fgUl4nHFrPGAVbgoYrn1LnPR/RVSHDu
	l+6z6nT6to+XVr/wRQF/vQkMgX6xYXqD//h24uSJBPb2HKyPu/zSGVoH7O0bTw3vF/S+
	maB+reTbuNMv0T3cRwigN5Uq2tPpcebatJv6Vw+cqvvAfHBgULJj3tEBz2qhmopzq5Dc
	6cLzOuWEmz0It2Z456LzvSqo7meWOLTU4MF1x0grVMsZYThblJZ+N4lxjxalCKtnlDQu
	65BmiPlf6gpH9fsFBHVLTn0O2JGkvKwGvrpbXZz9VXvCv7ie2r3L/XJPfHanB+MjRLEI
	Vv8Q==
X-Gm-Message-State: AOUpUlGTFM4tI+MPLLaYMcVozzZdYo0Rw4/f83qYSv1QmGHQMzl5cuoB
	SpgzwehEFX507rO3lioF+UZQSQ==
X-Received: by 2002:a17:902:bd4b:: with SMTP id
	b11-v6mr17563362plx.243.1532457221467; 
	Tue, 24 Jul 2018 11:33:41 -0700 (PDT)
Received: from cloudburst.twiddle.net ([2601:1c0:6100:a92d::e452])
	by smtp.gmail.com with ESMTPSA id
	i6-v6sm17128287pfo.107.2018.07.24.11.33.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Jul 2018 11:33:40 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180724115950.17316-1-peter.maydell@linaro.org>
	<20180724115950.17316-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <45ea5494-fbc5-33da-0538-23c94c4125cf@linaro.org>
Date: Tue, 24 Jul 2018 11:33:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180724115950.17316-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/5] target/arm: Mask virtual
 interrupts if HCR_EL2.TGE is set
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ccVelQSEGtjl

On 07/24/2018 04:59 AM, Peter Maydell wrote:
> If the "trap general exceptions" bit HCR_EL2.TGE is set, we
> must mask all virtual interrupts (as per DDI0487C.a D1.14.3).
> Implement this in arm_excp_unmasked().
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
