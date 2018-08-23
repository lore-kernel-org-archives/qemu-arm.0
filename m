Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1422711wrd;
        Thu, 23 Aug 2018 10:31:25 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPwGoQrrXu19fDVQ3Fp2I3/HjglNNSoFSG8teClFcwDPH/ATomJHvIoYZrmSNKR4I0PWdSxU
X-Received: by 2002:a37:98c1:: with SMTP id a184-v6mr56204581qke.328.1535045485403;
        Thu, 23 Aug 2018 10:31:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535045485; cv=none;
        d=google.com; s=arc-20160816;
        b=TvTQldIUfL7JNT7qDmG/59X5pDZ0/Xo8FnxznsIUCiDhImASSo8aIWg8wlyf2ppptA
         D4nql5+f5QuJQ7KivKKN3KVCBxgY2g1jt2ClW9ulFt6BxWKveoP1w9ErRq3Hl6ZlDdh7
         mEfqqMEFMCdiBF/Z7QhPR8uBEty6xwTgZ0r7YM1751P+Gc4vnf5Pdg47WqW9n+lgXOrB
         ZZSQK7X8ZUoaU8vb97C9obpE64UjkYYRIokSk7lKqb0rmdYzbq05fgmJ80Xcl4CEKUHq
         ELXZ49PQaKj0qe93+YTY2zo0D7w2/esZeHNfy0j8RTRcGQnyXR0xkMvJP7VhtoWp4lQl
         SjDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=NdMY1GgAbsHLC+pkHDFk4BIhlw07WyjUAhX8ppZvxyE=;
        b=vDKDw3ABWMDdiAGf2GfRop6tokA9QYWroggUMQxJSJJQLhDn3N1nLXtkmIlP/dqqLV
         PzDfO0kgXiP8AcDfhzLUU+XNt22YuHm8VBSLxd/Fnt3V5SMEwgOVd796d4O1FUZ3waas
         3d3IIGptgftgEL3DdgTYh+RJL/kwSLesVaICqptVg9JJFuiXG/FJGVNSzgoMONzld7oT
         LBk/RdaxooWLEBq6f4tOvD9j+DEPzaAsK0fQRgMHVaRtxOYM76GRcLJQusyNGQJ/5r92
         KIK6sxg7jr3/8KYRs+h7gZHj5bzYMnfIA5bdh2hjCWkBAKIgQlTlUE3wzTH0blCV2kWI
         QEAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=a6b6weoZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x11-v6si2861160qtf.296.2018.08.23.10.31.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Aug 2018 10:31:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=a6b6weoZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37984 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fstS8-0004aO-TD
	for alex.bennee@linaro.org; Thu, 23 Aug 2018 13:31:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44866)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fstG0-0007rm-6n
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 13:18:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fstFw-0002WZ-Ph
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 13:18:51 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:41181)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fstFw-0002Vq-E6
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 13:18:48 -0400
Received: by mail-pf1-x442.google.com with SMTP id h79-v6so2232213pfk.8
	for <qemu-arm@nongnu.org>; Thu, 23 Aug 2018 10:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=NdMY1GgAbsHLC+pkHDFk4BIhlw07WyjUAhX8ppZvxyE=;
	b=a6b6weoZx7VUwwDKiiC7cXPavi+gYiIOrvBoF9jeH8FdwA3N8ucS9EMGqBRUvZkm5v
	uz+sTtmvj1OosyvR4dXyVicMP9m5qVV7u1jJg+ntcDAkjT5LhsQz6yWmwm512838Poo1
	zTl/1PdCdaWlei8Imn/64aFp9gZIigOPA5dfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=NdMY1GgAbsHLC+pkHDFk4BIhlw07WyjUAhX8ppZvxyE=;
	b=OZtx/ouPF4N50DIxE0rHsIuvs/zRpcO8MWjoNXFmsLApgFiLWknx+QoQlHIJFx+yS2
	nupgCmlSXsmgn41APbDNnZbxmKr0jmQ/Gt6B/ILA3ngCko+4H9hAfWRiUup5ZxIHEDom
	4exqNrG1RGofJMcoXCWOGJTGzIm99Lz0Aorgh6T252ZRF+uWcMnwB9i2SfiqvEU1AYtr
	b6MHgTSFrr90KnxOaur7HyQQb0UylC15iRKZn1SYHdAwIpu2U5cb6eTMYWfkk7ReGO5s
	WQqJLcfnMBwjfZSzGqAJFIHOBGqnj3F5Vn5eGaifyp4sCy2CtmsUEZxTKWEVDQbKjhcY
	VdfQ==
X-Gm-Message-State: APzg51CkZHHk0EQ78NIR+GuqBQ5oIVbyXT4NlAUROTRGsGSyLeAFa6ki
	G+ehwBk4F1DUt9BD0u3ALRce6A==
X-Received: by 2002:a62:ce48:: with SMTP id
	y69-v6mr3517475pfg.91.1535044727411; 
	Thu, 23 Aug 2018 10:18:47 -0700 (PDT)
Received: from cloudburst.twiddle.net ([50.225.49.40])
	by smtp.gmail.com with ESMTPSA id
	a15-v6sm10150006pfe.32.2018.08.23.10.18.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Aug 2018 10:18:46 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180820141116.9118-1-peter.maydell@linaro.org>
	<20180820141116.9118-12-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <9b704614-7648-4eac-4031-1d9369edcdf4@linaro.org>
Date: Thu, 23 Aug 2018 10:18:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180820141116.9118-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 11/22] hw/misc/tz-msc: Model
 TrustZone Master Security Controller
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C8t/TXR5Bqvo

On 08/20/2018 07:11 AM, Peter Maydell wrote:
> Implement a model of the TrustZone Master Securtiy Controller,
> as documented in the Arm CoreLink SIE-200 System IP for
> Embedded TRM  (DDI0571G):
>   https://developer.arm.com/products/architecture/m-profile/docs/ddi0571/g
> 
> The MSC is intended to sit in front of a device which can
> be a bus master (eg a DMA controller) and programmably gate
> its transactions. This allows a bus-mastering device to be
> controlled by non-secure code but still restricted from
> making accesses to addresses which are secure-only.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/misc/Makefile.objs           |   1 +
>  include/hw/misc/tz-msc.h        |  79 ++++++++
>  hw/misc/tz-msc.c                | 308 ++++++++++++++++++++++++++++++++
>  MAINTAINERS                     |   2 +
>  default-configs/arm-softmmu.mak |   1 +
>  hw/misc/trace-events            |   9 +
>  6 files changed, 400 insertions(+)
>  create mode 100644 include/hw/misc/tz-msc.h
>  create mode 100644 hw/misc/tz-msc.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
