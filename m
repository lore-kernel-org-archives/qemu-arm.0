Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp2678254wrq;
        Mon, 11 Feb 2019 08:55:03 -0800 (PST)
X-Google-Smtp-Source: AHgI3Iah03w0ogOx2XOJdnhVB0DFg0CBeijcESN3f/95aZ0zvYIzZW/OeI4C595A/yN0sv6SffOS
X-Received: by 2002:a0d:fbc2:: with SMTP id l185mr27803006ywf.43.1549904103475;
        Mon, 11 Feb 2019 08:55:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549904103; cv=none;
        d=google.com; s=arc-20160816;
        b=w7y3W77Fo15tTGXLl9Bt69RdoHXQ4z7B7HBdqhT7PlF7DHgmMN1rMv4DxjF6FBsOtj
         Fs0EkZKlPD8ujxR+VZV8+3pPhceIE9G348rIRF0SdsUhn8CQg3d9J3Nl4Mi4iOEH0jtl
         PbczL3FdkrS0PFuepGADa+FKgOAZxEl8Q4fyUrpzg87kMCdHaF3bcEsz+wnXREXKMOs0
         DxcuPHfws0Tf13gVxEPazVlYi5nIxKB4klbJkHm9LU+0t5TT1n0VVD1VVHtyGzOtlf5m
         tXzy0vkqup5+bTyky0hXc5OFgIhw9qa6c0ovkwwN27puQOi7ucugxgdGF+ZYiVNul/PT
         ax0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=10XWWcSfd7DR6KWrmcqb2cUJBIZwU59wVhx7kVXm7+8=;
        b=L7/sLMG1En8Dp5R7EUEEWkpWfuSiulXEO9UQyPjkM+LKc7Zd1IAcTZyg1z3V5jMdL/
         yl21oXcO9+MCkjzZ+xWD90HVtQSYdtoKFl+uXKesYNZx72A3BbOyM+RXfmNN2SfOxnRa
         T2P8tM1DM2AN+Cp3aaUDZZwF9yF/H3WOVp5Mp1yYL7sSsLpWZXLuiBKAQta+jfSJgB36
         f4FzjLU6oGLu5osMxT52Z92btT5oSjMzjlXc5rqjkeoAGaG73MEFyqJPnILDwJlr3vx5
         VcwT3BHBs1T/Kgwoq80mLNIetB6UjaFSomBmIiC74gjjSMtmoyvh9fZ91pzW6OCVNfV+
         VQ2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aQbBMhGr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d6si6527011ybm.63.2019.02.11.08.55.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Feb 2019 08:55:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aQbBMhGr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:52837 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtErH-0002p3-0W
	for alex.bennee@linaro.org; Mon, 11 Feb 2019 11:55:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51901)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtEmN-0007mJ-A4
	for qemu-devel@nongnu.org; Mon, 11 Feb 2019 11:49:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtEmM-0000Qg-6V
	for qemu-devel@nongnu.org; Mon, 11 Feb 2019 11:49:59 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:46362)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gtEmK-00007I-Rf
	for qemu-devel@nongnu.org; Mon, 11 Feb 2019 11:49:58 -0500
Received: by mail-pg1-x544.google.com with SMTP id w7so5180790pgp.13
	for <qemu-devel@nongnu.org>; Mon, 11 Feb 2019 08:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=10XWWcSfd7DR6KWrmcqb2cUJBIZwU59wVhx7kVXm7+8=;
	b=aQbBMhGrZuSdhWbVw5HosfNbq7URD3vSKf+ZkLGPLdaYnplscs91K8q+Hn0r2DqyvR
	F1HJFUuT2vJkS1xltcIfBo1AVMpJJW4mVVMsMdA57tsWlh0YUJOy6SAPupnBT0NIV2Po
	dkARWH7WvbrOvrm74HjKFbtw8Vu+xD0euLCvwJRIsE1Eqq8itrTJTpLU9Ygz8CYAb2r3
	3SfTVVCfq6BoYFp0pKo9WMCc3E5YaySMLaMsMAZTF13eBzkGdPuDAZ9mgOP3q7OCvHq1
	ID85p8cE7J39R3TGT4DKK7Ywtr/eZrtfJH/7V9Nw4BZHb16xOq70fC7yEZlMi+5GxILf
	5f6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=10XWWcSfd7DR6KWrmcqb2cUJBIZwU59wVhx7kVXm7+8=;
	b=eIRWYDDvFyIzuSXWlD6ij2u3mGIjV0ibGXxGMC2fBRdYGHvCPKTNAVJ4T8cnZNJQqV
	GS4wSBEgXIIDB3csHvAP/Uv4G3uNSmMZCslTi9/FHQ4Dr7fDenOcXQ8Jzi1g5EJ0aiEL
	Bno2LtSOoBBoaSCId3KC78bF1DQQKZEMuxU4DAnml1Zj7VUv9Be7vKQmptn1kAqZPNPq
	uZ8A4qh2WZ7plgTe1b/K+VLptYVBU7fTqUGuURfCpzVisO3WUNxN019rWE6nSYkiVNaA
	7IegQS2rrBVBgFFbIqE2lgzt0IYie5w24oCjJjHB6vcCcz5Y3I+mRIcwzwRUIDElml1A
	RCSg==
X-Gm-Message-State: AHQUAuZEbKLWjC7bs/YAXOCOIoCYGmzXfsPySuiSacHcywqZLnYqNlxf
	wMP1l+l2GMa6yvVHlIQQR/Lt8g==
X-Received: by 2002:a62:2044:: with SMTP id g65mr37305626pfg.127.1549903771083;
	Mon, 11 Feb 2019 08:49:31 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82])
	by smtp.gmail.com with ESMTPSA id e26sm840507pfi.70.2019.02.11.08.49.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Feb 2019 08:49:30 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1548985244-24523-1-git-send-email-catherine.hecx@gmail.com>
	<eeb0f275-b262-25db-337a-b6c78b29c124@linaro.org>
	<CAFEAcA9u_FYk40QyC=_R-VMVN74A5kTWYKCSgH-Kzya1_Pqzdw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <4a7de0ef-8c33-6a14-f937-ab657559daca@linaro.org>
Date: Mon, 11 Feb 2019 08:49:28 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9u_FYk40QyC=_R-VMVN74A5kTWYKCSgH-Kzya1_Pqzdw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: Re: [Qemu-devel] [RFC PATCH] target/arm: Fix int128_make128 lo,
 hi order in paired_cmpxchg64_be
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
Cc: "Emilio G. Cota" <cota@braap.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Catherine Ho <catherine.hecx@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BIdikJQiwgEE

On 2/11/19 8:19 AM, Peter Maydell wrote:
> Thanks. Richard: is this effectively a bugfix for big-endian guest code ?

Yes.


r~
