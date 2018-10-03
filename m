Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp36632wrt;
        Wed, 3 Oct 2018 13:14:17 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61KzkrQocryblPnE+ibqFrxJPWWRylIFfBgME3ROwCk9SCIvp5TTuztywsSHW5pjtYAj5kr
X-Received: by 2002:a37:d9c1:: with SMTP id q62-v6mr2584688qkl.117.1538597657732;
        Wed, 03 Oct 2018 13:14:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538597657; cv=none;
        d=google.com; s=arc-20160816;
        b=EjuR8vPUkhJgE1p8EFaAOJxoDAYy+N7TCeaMBLzaO6uObC5XL5wmTFgpAiOYIf/n0Q
         4AdEkDDa5OasbYIH5Gr3mbOmaV90YzCz7bXVSFbfxOxPL9ykhOICwKVXFn6II1CwKrsl
         EnjvhkEgKQZtQRgHneKI4rriBUjulY42OQ9eKrlqv7bBpTtgg4D+LrTPiMGSxBG5C642
         T3o2igN3VeUWJBleoyBM0yMZGImK0VkCROPTK0/SSiu7KeM6hN9VOSfZnhTtNTas6tAw
         dMGPmgNxYNAHVNF+U67RrlsAPVWd2pMtotGZrF2ogX4tt+adEE/cTVVTz8KAGA7V3A7D
         afZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=lRAJRGUyHD3J1vd+ZFsLiwUlS/Nj5Iq0eBn7FsGzIGo=;
        b=kwdnRsnUJ84MENif6V3WEi9uK9AXD+qnvtgQ3MczvXJRhfLCOgkYsf9eoPa/j4P0qO
         jLLuGc4gYveyJp/dxFsv3hKVEqB/DV1O5Kt/gZ7au06/zUTb+dzY73/VV8fozgudx/h1
         qZP6k368PNGZive9vr5TNhlAjvmKd05JxKnkV7ulMH2JwMdmUZhN9KalaeU0lvbi3Sa/
         Qo7xVOhK/Ekwm/MxdfVh5tfRpqYpaqKgsAp9WJ9FgqM5RKzidc20dGfIYgVGMX6nK6ru
         kF+EG+zmYNqbmGcffJmAmGQZlF6WA8kgK6WXxxNvnicDb6LDeba8x54OmLXXp5EXqcQ4
         FMlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=a9fmGh7E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c74-v6si1518786qkg.374.2018.10.03.13.14.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Oct 2018 13:14:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=a9fmGh7E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52873 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7nXF-0002fc-8h
	for alex.bennee@linaro.org; Wed, 03 Oct 2018 16:14:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45411)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1g7nX4-0002dy-V3
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 16:14:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1g7nX3-0003BQ-Ne
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 16:14:06 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:43084)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1g7nX3-0003Ah-54
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 16:14:05 -0400
Received: by mail-ot1-x343.google.com with SMTP id e21-v6so6873164otk.10
	for <qemu-arm@nongnu.org>; Wed, 03 Oct 2018 13:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=lRAJRGUyHD3J1vd+ZFsLiwUlS/Nj5Iq0eBn7FsGzIGo=;
	b=a9fmGh7E2dnf6dlx3JEqBe6soWHUrz6ZLMsLInJziPLMI707q4hY35IHOC4/NVOSin
	zE3ylTYPJLntr755g57yi7zgzcaMBDmshWsixfmdHnXsM2dwaPHHOgAlOLLhDuPHWSml
	1CPxBF3lXUiuoW/mSFL3cPltHlJVDkqHDGlMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=lRAJRGUyHD3J1vd+ZFsLiwUlS/Nj5Iq0eBn7FsGzIGo=;
	b=dpP6raOZQ1qDpzp030odoXu0YErd/rxvq/1ug6/Ot4WQEcXLu7+P2iMbKOBPLyjeLF
	QMZFQwyAvy9RzhfryDPWgvTwZpqbjC4g8DFg8vrZm7AO7q2rYQTJiCXZmWKcwwLwVXH/
	e7V7ONfuN8bhTUvQGhTuz3KHKgh5/Hn3h+DoSIB1P6nJ5DvPIIiYHJwMYBjLua9nOTj8
	UzmUBDMg238L8SoLNQFoIu+9EG+iBzGV1zSE9BMk7KsA7gv5Hv0OCgUhsXYH5stqn4R6
	WCXzgtwBrrr0bDYPyUsccPnl1HOcyzFOnEF6VGvAbbg08zvMb0LZBZ3Jwj0SrBtGReYw
	OyYg==
X-Gm-Message-State: ABuFfoiY6Grmg/mkl1jWwWdU8rUu6T1Y9Og3s38AAceHu+CiSoWNBiMk
	YAkLbsyLwEBH0CjSW97LKS7DRQ==
X-Received: by 2002:a9d:3c47:: with SMTP id
	j7-v6mr1912049ote.317.1538597644382; 
	Wed, 03 Oct 2018 13:14:04 -0700 (PDT)
Received: from cloudburst.twiddle.net ([187.217.227.243])
	by smtp.gmail.com with ESMTPSA id x15sm898293oth.24.2018.10.03.13.14.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Oct 2018 13:14:03 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181002163556.10279-1-peter.maydell@linaro.org>
	<20181002163556.10279-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <211fa1a4-3886-a585-dcec-d06e9786cd15@linaro.org>
Date: Wed, 3 Oct 2018 15:14:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181002163556.10279-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 07/13] target/arm: Add v8M stack
 limit checks on NS function calls
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
X-TUID: r1J3IJOWXQVC

On 10/2/18 11:35 AM, Peter Maydell wrote:
> Check the v8M stack limits when pushing the frame for a
> non-secure function call via BLXNS.
> 
> In order to be able to generate the exception we need to
> promote raise_exception() from being local to op_helper.c
> so we can call it from helper.c.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/internals.h | 9 +++++++++
>  target/arm/helper.c    | 4 ++++
>  target/arm/op_helper.c | 4 ++--
>  3 files changed, 15 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


