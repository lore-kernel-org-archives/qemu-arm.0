Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp876463wrt;
        Fri, 25 Jan 2019 16:04:49 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4Ne4wgQOsL07duUXY+BKeiLC9ipbFVvWrbvFo0Y3j2tt2C0eVkDkAjYVTEFRmyFkJ23rZS
X-Received: by 2002:adf:fb0d:: with SMTP id c13mr14287638wrr.285.1548461088997;
        Fri, 25 Jan 2019 16:04:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548461088; cv=none;
        d=google.com; s=arc-20160816;
        b=tG5whzXkslMTVeMDgNM90cLZViAYfDrTDaSttSf5t6FnAaI7Q6F/vtnO6vwZdHBr1C
         NEsqKF7xfrkPyTtG2ERrs2sF+nCPizMjdNJemK84AtzERGO+7kWUFVW/qPezoPNtDe2V
         e7ebaZopDAxVpCe6XdkA1iCj+n8LTtLx+0lmtLUfBn0vgXV5i1vIMtXrgHi+L38OXNuK
         LP4e6Yr+/Oa4dOMqSUqJp1p41BGKPfDW2FKxo0yCqJuhugX49UrPTOOJBb1sU9Rw9ot/
         yGjAmGSIVFLvfmnKN2xevsR2yT3HphQPnnIb3liQOJc1hZQ3VKgr9RXaK5h+yqAJjrPC
         inLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=nyopEQ/3jrtEvFR5p7Xur8WZeoNN+ZZhmcy2A/WPf4A=;
        b=Sdrh68RiJ2a2T9tvXXjSxIKikYJJS+CCHwlLUzlU/CqWzgAqZvLBhxnSE6HMO3Mite
         GP5Tyn9u7K0Bz1vQu5kJsKDkhR0n1fPFC2o5ej/PLhrfyFuFjV5bX7AbApFu6JZHlA5D
         G4UpzKkdpyDiRp2StTP4NtMz5V8N3L0AvVaOXGCQLwfNJOf9nGXgpcJ0k8BWR6QwF2ft
         rRFMBcsTsVhAG7x9/imhZ5AfW7HMXEjC33Jj23HVfaEcgwcnd+awNw4YNrdFepGYymJ0
         3h0rqHjRvIxQtQeRg1TIJILOb0AegNlr81A8EzXSBbnYltCUZMVAdDNuQ1XWmyFi5xNH
         Fayw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Zo8Yd5zI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j204si41193737wma.169.2019.01.25.16.04.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 25 Jan 2019 16:04:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Zo8Yd5zI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:52722 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gnBSq-0005wt-4j
	for alex.bennee@linaro.org; Fri, 25 Jan 2019 19:04:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33435)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gnBSf-0005wo-OT
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 19:04:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gnBSU-0003SZ-3N
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 19:04:28 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:37885)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gnBST-0003QT-Go
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 19:04:25 -0500
Received: by mail-pg1-x535.google.com with SMTP id c25so4843633pgb.4
	for <qemu-arm@nongnu.org>; Fri, 25 Jan 2019 16:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=nyopEQ/3jrtEvFR5p7Xur8WZeoNN+ZZhmcy2A/WPf4A=;
	b=Zo8Yd5zICDefsxV2flHLCOD2OfUQPc2m4zsEsGuBdDyzioLygKlMsKXyNGKn6ra5zk
	7fO+pbuICLjejw7m/PvUorJkKddxfDtLlAyhJET03Oi111aHg/qpBSoYEgttSwbwfEWd
	1TtMjGmVPXV4zmrinYyMxUOe4jS+78DgKIz+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=nyopEQ/3jrtEvFR5p7Xur8WZeoNN+ZZhmcy2A/WPf4A=;
	b=QgORv2Ob8TKlZWXmu4+ctbgG/+n7La2bL5EAoDoTO3t50Un8LEXgVPRc4vzYqSzgpW
	KEqcs9GR4evrZkuABXpOMrCCj4WaU0LYK4OnJgbvATj/0K8t9FDGCQXbGs4rZ110aLB3
	pry/biGMaCPMHgGvdWrEMMd8GW/4ZPaulsJziG77oE6F8+YcVZOdz/2XjvLspuEwYTOU
	7zEMPecBhxQiKUEGTnrX+tYAdSx5UvcHbjUrPHket6Isl71ocMCuWgN8BZua6dCnHKzE
	6SSvuZCB6L5VOaMMYvs93XyNbvplQMidEi/yOZ559Yk6IgxHkCQPsBbzwQ2E9xP1OAjX
	He0Q==
X-Gm-Message-State: AJcUukfcHuejhz92JkUYcH7AfKLpMOZMgD9ChslXOnUYvLQqpUnEOyad
	d3atxw0IT0orVbsphgLW+0Sov9yOchw=
X-Received: by 2002:aa7:84d3:: with SMTP id x19mr12923815pfn.220.1548461063554;
	Fri, 25 Jan 2019 16:04:23 -0800 (PST)
Received: from cloudburst.twiddle.net (97-126-115-157.tukw.qwest.net.
	[97.126.115.157]) by smtp.gmail.com with ESMTPSA id
	24sm108203763pfl.32.2019.01.25.16.04.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jan 2019 16:04:22 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190121185118.18550-1-peter.maydell@linaro.org>
	<20190121185118.18550-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <4d332284-1598-8d8e-d95a-16eb14e3bd6f@linaro.org>
Date: Fri, 25 Jan 2019 16:04:21 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190121185118.18550-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::535
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 08/23] hw/misc/iotkit-secctl:
 Support 4 internal MPCs
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
X-TUID: s/L9kzWWScVq

On 1/21/19 10:51 AM, Peter Maydell wrote:
> The SSE-200 has 4 banks of SRAM, each with its own internal
> Memory Protection Controller. The interrupt status for these
> extra MPCs appears in the same security controller SECMPCINTSTATUS
> register as the MPC for the IoTKit's single SRAM bank. Enhance the
> iotkit-secctl device to allow 4 MPCs. (If the particular IoTKit/SSE
> variant in use does not have all 4 MPCs then the unused inputs will
> simply result in the SECMPCINTSTATUS bits being zero as required.)
> 
> The hardcoded constant "1"s in armsse.c indicate the actual number
> of SRAM MPCs the IoTKit has, and will be replaced in the following
> commit.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/misc/iotkit-secctl.h | 6 +++---
>  hw/arm/armsse.c                 | 6 +++---
>  hw/misc/iotkit-secctl.c         | 5 +++--
>  3 files changed, 9 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
