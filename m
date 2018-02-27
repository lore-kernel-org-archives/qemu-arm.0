Received: by 10.28.71.27 with SMTP id u27csp4954507wma;
        Tue, 27 Feb 2018 07:36:18 -0800 (PST)
X-Google-Smtp-Source: AG47ELsdm73wgh9nP1keSjyMCW+XLDEZIRbFOFjpqJnGXlo2D6M5EyN44w4L4PelhDfH55gTZalO
X-Received: by 10.13.226.67 with SMTP id l64mr9870191ywe.502.1519745778502;
        Tue, 27 Feb 2018 07:36:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519745778; cv=none;
        d=google.com; s=arc-20160816;
        b=Ndear34C82JzikSTjgUS455+Ij5vfkBA3bpel0Zoqip6QFbpWbEORyk2Xyi28cQl0Z
         Hzlv7RskaCIuj4Xlrk2YB9hj8OLgVBg+uTGuVFDJ2SmgD4FJgNMSdKqP+2lLQx9BpKnh
         J9PDhaJ+3eylRSOpmmqppIfSFTRHTeK5eBZoxVtZSMlg6/XSmPPZXxzwXr4B0IqrOHZH
         RHvgvZ+3C0XBrxGccxjN8PA736jxFy/HcpIZnfth0yAKLN4U3qiLr1UopV97is0UFOul
         fC7DRbeOrI/NAhraidPb/5J6cac9ZiRU7gThXA9+Ixv47wiDnd8EpbZKy4267U1OOV39
         wjJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Rt4RCjctJUqEENGHNEh/oXwE68WOydiRaWGmZOm3KdE=;
        b=MBDbZpJ4ZMQR9ZwHjiJABREY3qswYO9Zx79p1gOOzKGgGzVSTX/jYHz7Xa7QxU1CS9
         vg16tReVL3SOClg4ogPmFDDU0dzcjb9LFmvQ/oTz1KTARKAxEQ5iEBH1QQSeq87hAqEZ
         RNFiJ6H3sRT0u9eWy3YY85M38MqYx7a0/saSK02+9SeHajcazLPbCldYfzMXbHpR3adC
         7X9wCGUekBUlHw6FX+c/kKxlln2fVNjirIY3P6YwUCkls9ytqmst1WS5JRK1WjoZTSly
         IKZVqBBQGfX0pS/wivJYbGWkYxHwV7LPNllYj0xcU59f6bqZt8778BysIp9ZQmMR3/EY
         vNcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=h/mxrB97;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u141si465845ywu.323.2018.02.27.07.36.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 07:36:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=h/mxrB97;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38109 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqhIf-0004bL-SO
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 10:36:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44042)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqhID-0004Yt-Hh
	for qemu-devel@nongnu.org; Tue, 27 Feb 2018 10:35:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqhI9-0000Iq-PG
	for qemu-devel@nongnu.org; Tue, 27 Feb 2018 10:35:49 -0500
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:41679)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eqhI9-0000IW-KX
	for qemu-devel@nongnu.org; Tue, 27 Feb 2018 10:35:45 -0500
Received: by mail-oi0-x242.google.com with SMTP id g5so6999792oiy.8
	for <qemu-devel@nongnu.org>; Tue, 27 Feb 2018 07:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Rt4RCjctJUqEENGHNEh/oXwE68WOydiRaWGmZOm3KdE=;
	b=h/mxrB97Hg/LrcfV2rtG5j+FeYHUzfcKbbBOqTpthPU5qyTna8UKVce8LYMdMaek5c
	suHAeuNvUKb/lhp1epBYvtw68pbf9+ZLC+09P+r22oW/Vu3ayVfQMdinwb7ew25iqkQJ
	SeAOZa085/PXANlJviwl7pWriXJyJly8GpUQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Rt4RCjctJUqEENGHNEh/oXwE68WOydiRaWGmZOm3KdE=;
	b=ilzwGwvsTKppkmd2882EdhiAmgdQILBfYcxI2Ca34UwfExqc2xn76Urd8q819QAs73
	7YZ0fPDHB2NSgLABcRtK3eqDmUhRSyMGDokcmCyN4882zA69QZxl54EWw2tc/iF4776O
	N+3WsQmX0PTFuAWjXD2L6TXk132mJpMoj/qjL3gG2U2S00NjKag6KkTHubjfhK4t6iLk
	oIIggx2SJ7hrlzVx19G4hQ1w8xVNA45Fu8Wwvdhl8HEbE8SMjTfNAlG56ZJyDm4WN4TW
	1t3fpEvS1yV+3u9SWJbslMGYgzXhX76+w2yQz8FEmrznz87rkF3S55wy0qoim0G98qGq
	GIAQ==
X-Gm-Message-State: APf1xPCByM862FXilZWO48TQZpk0je3TQIQsYkmAypEOqng1ryuQknON
	0M/ANc54QdwQeqx1yD4DYXSS79CYn5hi72tgaK8x4Q==
X-Received: by 10.202.90.138 with SMTP id o132mr3434831oib.11.1519745745014;
	Tue, 27 Feb 2018 07:35:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Tue, 27 Feb 2018 07:35:24 -0800 (PST)
In-Reply-To: <20180217182323.25885-65-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-65-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Feb 2018 15:35:24 +0000
Message-ID: <CAFEAcA8GpZvRPpVr4cnMT=H9Bp3q_A+vZ8nM_DrmeAU+Y1jmXQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-devel] [PATCH v2 64/67] target/arm: Implement SVE
 floating-point convert precision
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
X-TUID: s3szmZkEoMj1

On 17 February 2018 at 18:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
