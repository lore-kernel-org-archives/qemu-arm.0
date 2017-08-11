Received: by 10.25.221.202 with SMTP id w71csp913011lfi;
        Fri, 11 Aug 2017 06:52:56 -0700 (PDT)
X-Received: by 10.55.20.25 with SMTP id e25mr20185001qkh.75.1502459576643;
        Fri, 11 Aug 2017 06:52:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502459576; cv=none;
        d=google.com; s=arc-20160816;
        b=JIn8VkDg0zqHkz4s2wnTfDcsxBhlyqu1+Nc2RwaRTnnpgHdq7h++Zu5XbVL2Vbgn7o
         Ny0SjFO7hUY3/txe1krDXXvK0aiJ+Fzd/Sx7Ai308+atOhXnNAESLctEzfTC911z/EGe
         vpkvszBPnX4RMsKz3Rs8bJVcrbaCqRcNrhxkXE+ScGuuJauKXJQ9B/YAwfY2B09qmMaS
         EvlQAtVhgaChVQvsS1Qc2PvEc4fT+HnrjIQCk7nLCMFaqo3C1RQaWot54BA5jMa9ueZh
         1TT7Up5OebaHia1RRFPKxUxnjVvHoJ6iv9+uy5mixB2xsb/JSyki9HUqvqmsmJjgwKmo
         kcAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=MhFeo6BTJBKy2EFZXVLRDmfve0Fmj1DFDNoi9h75uY8=;
        b=VhFMNPBTzeQJml7YJCCmQgbAsBVUG/n7/mojRybhUeR00oeS0K60XfBxG/X7moGom3
         ppvQ1T5r5TLA0JW96TzZ0w919qA3CfzmEgtHQZSF/7zRlYsW7tPxeVNIRrB72Zfdrxty
         Cwm9PqZVxgVP7vU3YQxYI6yJT3MM55gan4/yC+byMIe4CI7s7dsSsEkGZZVA0gqWhwtN
         XPjUVxbJXbULkD7OfmmtTdfLn8FI+XXR+g4UR/RfzwEyk1HjJumwN34hCijEm8Lr3mh+
         KK//d/82tfO/W8PjMfpIWm/tmvW8kstFZ8hEbERsG1bf0ZHeXWr841eHxLDU8nSayumj
         Qw8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DR5W3Zmp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n13si803852qtn.540.2017.08.11.06.52.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Aug 2017 06:52:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DR5W3Zmp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42033 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dgAMw-0001ZL-5l
	for alex.bennee@linaro.org; Fri, 11 Aug 2017 09:52:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52793)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dgALX-0000rl-Id
	for qemu-devel@nongnu.org; Fri, 11 Aug 2017 09:51:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dgALW-0001CL-M1
	for qemu-devel@nongnu.org; Fri, 11 Aug 2017 09:51:27 -0400
Received: from mail-pg0-x22d.google.com ([2607:f8b0:400e:c05::22d]:38128)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dgALW-0001C1-G0
	for qemu-devel@nongnu.org; Fri, 11 Aug 2017 09:51:26 -0400
Received: by mail-pg0-x22d.google.com with SMTP id l64so15734944pge.5
	for <qemu-devel@nongnu.org>; Fri, 11 Aug 2017 06:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=MhFeo6BTJBKy2EFZXVLRDmfve0Fmj1DFDNoi9h75uY8=;
	b=DR5W3ZmpMC0CEHsnWoR0ej9rkP+w440YqomBxJ1l7y+dczX3kbClhWOhtDW4VM/Twd
	YDUEQsqJeSM9jPNaPiGj7ttssP0MgM1Iw5lzaZjaPoiXKMeBaRuM/2rryvNaFKUvlegf
	uKXQnArr1nJTsWq7HsWYbgo/jtG+K443/VE7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=MhFeo6BTJBKy2EFZXVLRDmfve0Fmj1DFDNoi9h75uY8=;
	b=lL3dCDpmyhdRNnl6q+JKJkmg5B9V0ztcxZ0vvBC8DU8BVGyrBoYeR5HFmjxyJ+KSoU
	o7/H/yeA9VrrG1PLeh+ZXBTozbVv858Ub9LQSdyEwxTV+AzSIvwTayVD1wVrk0ly0wzq
	E1seuQFF7r6kaEjmvajI0A/megyATjYp3iyVHyvSjVS2cy5Du/+wmpU+znOCZa8X94MI
	kx46RpVi0OWoLX8pe7v6P79TEjVZp5yWc1qNqLbKnCyJGQST4XoF941l1jcTF7zpdWrd
	tg7EkWuGoR1YQkB6C6txt+3DzsZY2Zunw71ZW2sTpMscWkbuxIQDtBWabZhNX17ZYoCE
	3KpA==
X-Gm-Message-State: AHYfb5jpM9b25+kyod9Rruk6p/tefHltZm8SMCPiC0+6qAY76R8Bt1th
	JURY3GvG77tteOgA
X-Received: by 10.98.64.196 with SMTP id f65mr16124240pfd.123.1502459485628;
	Fri, 11 Aug 2017 06:51:25 -0700 (PDT)
Received: from bigtime.twiddle.net
	(50-233-235-3-static.hfc.comcastbusiness.net. [50.233.235.3])
	by smtp.gmail.com with ESMTPSA id
	a86sm2167457pfe.181.2017.08.11.06.51.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Aug 2017 06:51:24 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1502116754-18867-1-git-send-email-peter.maydell@linaro.org>
	<1502116754-18867-3-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9c319371-41d7-d72a-bdfa-33f85e3bfa36@linaro.org>
Date: Fri, 11 Aug 2017 06:51:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1502116754-18867-3-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::22d
Subject: Re: [Qemu-devel] [PATCH 2/2] loader: Ignore zero-sized ELF segments
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
Cc: Hua Yanghao <huayanghao@gmail.com>, patches@linaro.org,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G07AvkVlHcuv

On 08/07/2017 07:39 AM, Peter Maydell wrote:
> Some ELF files have program headers that specify segments that
> are of zero size. Ignore them, rather than trying to create
> zero-length ROM blobs for them, because the zero-length blob
> can falsely trigger the overlapping-ROM-blobs check.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/elf_ops.h | 24 +++++++++++++++++-------
>  1 file changed, 17 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

