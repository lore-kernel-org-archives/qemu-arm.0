Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp41556wrt;
        Wed, 3 Oct 2018 13:20:05 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62oTCG7taVpkfIZMlw6MtWvWjB/Ky1l/+R9NNhfx6zGU6fhVFnVB4KhA8mXGMmFs26ONEEP
X-Received: by 2002:a0c:eb8d:: with SMTP id x13-v6mr2666168qvo.200.1538598005892;
        Wed, 03 Oct 2018 13:20:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538598005; cv=none;
        d=google.com; s=arc-20160816;
        b=XX/wUpbPdQr1pFax1X0+SRJfAbuvw9mT8vWmj+50g+Km3Psgd9kiKDhDaVw/AqD0MA
         gVDxva1mkF2Y/XREtgygyCP43v1WWBrXb3l1kMFRYS9vo8CHg3+dY4h32ipP3QJjE2BJ
         gLunGE+cm3YAm10PwFIwT4zZeMZ9C0RlRlsQxakgrkIQMsCG2ewFS+Yz/sFEsvVjVCeQ
         kBggptp+MTgeWr6ZAn2nvi9WbLbA2wLhTWuLIM6DE0cqgazvu7t44Y+cx/JiZ5YyNolx
         MFCmu2nlcu53VMSGgwCPutfFq1ACRB9wOLXzyFBOWUSugptEs9hijFIxrAmh7OqH+Bxe
         MXvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=RA0RCe4ubLm7esMeE5Z2CMSXkVGMBYqNEEkBzNl465I=;
        b=bBE/PloKoMEB7pJ+QyksY4s2GM74T9X/b+dlAMoctdyQyogKKHZRw5L3xu2P9Sc/32
         c8p6igRm7aRBBcc9OWy96qY634sRoZOqCYchY44gJpxVa0x5oDJJu5AJyRJpCf8Utq+m
         Jj7IdxLn8FMIty5XXX2RQ5g3gxx/b8UdU4K8O7KT31jpxXg5fUxNPrZTR2mSK3WWErP+
         NP4N3xa9cjdOknU+0RCrwXIt7gqSctGn0fibjrtI84FGXeFRzdJh1F4L5Jssm1ytUOG4
         oQb1p7PbYd3OER2Cr5bbF6ulvAxIgqc+0Wyh/uvOU8n+kU0FTf5gam988+Yjx74OzrD8
         22sw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=exrwuLnD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x15-v6si1626677qvd.4.2018.10.03.13.20.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Oct 2018 13:20:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=exrwuLnD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52977 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7ncr-0005fT-CC
	for alex.bennee@linaro.org; Wed, 03 Oct 2018 16:20:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48503)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1g7ncX-0005cn-Hr
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 16:19:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1g7ncV-0006Wl-QI
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 16:19:45 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:43109)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1g7ncV-0006Rc-Gl
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 16:19:43 -0400
Received: by mail-ot1-x341.google.com with SMTP id e21-v6so6889139otk.10
	for <qemu-arm@nongnu.org>; Wed, 03 Oct 2018 13:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=RA0RCe4ubLm7esMeE5Z2CMSXkVGMBYqNEEkBzNl465I=;
	b=exrwuLnDdNah6iT+KWApJrymswpxzvYkE+z82XGOisLSj+v5ouexKPIkj1XN3TfCNd
	QumlfV0BvE6KBMZtO2UvHA0NecU1KJMR78DzcBRWhuaIQyjcVI2PUoVMK+AHhZpKDcg9
	0t+boGz/md2bV1m4vzZl13hvB3OArj9ppET74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=RA0RCe4ubLm7esMeE5Z2CMSXkVGMBYqNEEkBzNl465I=;
	b=eqCsuB204Q5+R5R/dIo4GdCtymhc0pAlMcEghGyeMJqKktSdEkydnJKKjUaGdFfIPG
	dhTjw738HOeEavRMMEJLJaWRfgw+G774RCwEChh86GUiblFTIneyCeLEWP4BRYKyTU6a
	w+J19kg0502rESsLCSmR9JqHBlILxKpONz621KzcUFHOq/xPM2Z1AuZStE/De67YY+tS
	L/tYX+5GmE9psbB0/0u7Z8F3dG0cMcoL2IKnQtgZh/6nukRUrGo0s6LTxxgSmDfSoser
	GUe78ah82KoTJpjyJX5P4z/wvZb+hGwfLURMQt4JiDme4ikgXv2FW3e9wDOSPyrffyNc
	tUjA==
X-Gm-Message-State: ABuFfohoF7Yv232Wffi5WnUbU2Nr0SuADkxWvbMjDYvOW7+jbhgcW4wM
	ux1nRwA85Afg35xP/xC0q0N+XA==
X-Received: by 2002:a9d:5d06:: with SMTP id
	b6-v6mr1870580oti.237.1538597968897; 
	Wed, 03 Oct 2018 13:19:28 -0700 (PDT)
Received: from cloudburst.twiddle.net ([187.217.227.243])
	by smtp.gmail.com with ESMTPSA id
	p185-v6sm372794oic.36.2018.10.03.13.19.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Oct 2018 13:19:28 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181002163556.10279-1-peter.maydell@linaro.org>
	<20181002163556.10279-12-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <7b6879bf-ab53-4c50-75c5-5f4e2abbf47c@linaro.org>
Date: Wed, 3 Oct 2018 15:19:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181002163556.10279-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 11/13] target/arm: Add v8M stack
 checks for Thumb push/pop
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
X-TUID: 9TmGF3i4Xv6H

On 10/2/18 11:35 AM, Peter Maydell wrote:
> Add v8M stack checks for the 16-bit Thumb push/pop
> encodings: STMDB, STMFD, LDM, LDMIA, LDMFD.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


