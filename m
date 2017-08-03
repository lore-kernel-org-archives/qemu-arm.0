Received: by 10.25.221.202 with SMTP id w71csp1190401lfi;
        Thu, 3 Aug 2017 14:37:24 -0700 (PDT)
X-Received: by 10.237.36.6 with SMTP id r6mr310123qtc.159.1501796244400;
        Thu, 03 Aug 2017 14:37:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501796244; cv=none;
        d=google.com; s=arc-20160816;
        b=bRxPt0kZdSaqco62VUDsa3hhgpsGDhvVaaaF34ss8E5pTX7J5WJi06X+Inw++PDwga
         pC/es7227PZMJ8oZl0Z1Ub2JDVbZwiZo6t/QsbVNHhHlfgmyrvWlP2p+ciDJwlkqmNU9
         +JWZKnN4WYjUWdDpKliENPdWUdz/JevzMwLxrcdSJz58M13tYT8FafwsvN767ioOwf5F
         9FXnegrSPoI6PeYknkPkpbYIOG6qq9v5RZ1raLd7TGfdj4ws01HWiVmr9CQqbSskLz/O
         FDpTZy+w4Yl2E8QRpCjb5dXjXbHGcH3sj/DNmnO2dc2zUOqyps9A1Y0LCV7aG9KaqpIg
         NRNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=tTh/X09uKNRwMRu/rocP1bXkgYvPuwHORsxwa5LoXhU=;
        b=ClS8WmySmxN3/+ylet/PxZ0RVZyY6LYTygOFEJkODBuQhSiz7ZdPsFnP+r4eMaiq94
         ijHtoER8S8bzFK6vO5WeWnJEc9+9szBrYjeZbDUMhXAgf8MRg+5wckQj8MhSmEHfqDox
         XtnQA61qDi6BAUB5wMw+LtqvVIVd3f4YnWgbDj6bnIOxskFRarkJKG9RxpqX4uXmmgBc
         NiOjU56pFYqbVVnksay+u0sqpL4YF+pWwfxI92fJns3/WAB2ZmRvOkLvVHejJZjdtINU
         QT5bu/i3kE38wcGuFakx9mPT45N38ydWLGvfd31gITwuxJrO28rfgoDiGx5s8HG4YqrY
         MKPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=ADhZWh9r;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d144si32339314qke.245.2017.08.03.14.37.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Aug 2017 14:37:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=ADhZWh9r;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54359 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddNo1-0007fW-Lw
	for alex.bennee@linaro.org; Thu, 03 Aug 2017 17:37:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41111)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1ddNmf-0006yc-4I
	for qemu-devel@nongnu.org; Thu, 03 Aug 2017 17:35:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1ddNmc-00089n-7I
	for qemu-devel@nongnu.org; Thu, 03 Aug 2017 17:35:57 -0400
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:34768)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1ddNmc-00088u-2a; Thu, 03 Aug 2017 17:35:54 -0400
Received: by mail-pf0-x241.google.com with SMTP id t86so2594144pfe.1;
	Thu, 03 Aug 2017 14:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=tTh/X09uKNRwMRu/rocP1bXkgYvPuwHORsxwa5LoXhU=;
	b=ADhZWh9rVLEKGBKXe0AAAMmtlndpOAwj+NnVq+CRZGYmbDa6+982FkS/7So8LEbp8U
	EvPfrTfk92PjPYlpvsd32fkvV4o0FWDn0wipDdxBCsqdWOEW3lrLreWHWpi1l6XJPUzT
	JBh3zcwXEiL/tb2zo7bg5yE5v1gx1quCowCKPKG5Zh0wmNwjLb/xyThT9kpznpOQkly9
	rfwp5XpmQe0b+esG+cAlJk4xc1e46Dl3IfjX2OyXXwfGetp5SDQOLcJ8UMX1ZFLwZHyx
	Rvlg3hf4zWQgpCm4iZc5l9NBwbFJlu4U7UdiCETvwR12sCLvSDbDdAEeFv5Y4LKTWy6p
	nQXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=tTh/X09uKNRwMRu/rocP1bXkgYvPuwHORsxwa5LoXhU=;
	b=fod4nd9cWztmu2Xjxjmr+3klV4EniH5XLaLLt4TfkOK9T0np0STEixi8HLSV/AN3lu
	YAVhqjNnEQ9RC99DdN6VaIGw9lG5mOvX4zqifKkgskEL4qF4jtiQDk4jABFvfjUen/8d
	ngrH4c1VXi8GN4QnwSqAzlFxMPxq0n+NLcUT4ZcFGSOfgpEWnaAlLcT2XgR7wVdvzzK9
	Kac8V+EDD9niUWEHwFCFdcbsgDnvpCyjCsTwa4fr7ga+e8ywZY43RBhpMHaIeTPkp7YO
	qZ/eiM/jdAYQC2S+MJ/b2l0n2jAEwsI/NCei20wVr+HlWQNh6S+VR84HiKBjnHI/+PUk
	38yQ==
X-Gm-Message-State: AIVw113lnM0Gv0bN1SIhvjiIBKR0SSr74PVBqe+wnlcVbtavUI5+KLxU
	MUGsWUPuALvgoA==
X-Received: by 10.98.11.65 with SMTP id t62mr184002pfi.119.1501796153211;
	Thu, 03 Aug 2017 14:35:53 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net.
	[97.126.108.236]) by smtp.googlemail.com with ESMTPSA id
	q5sm11323007pgn.21.2017.08.03.14.35.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Aug 2017 14:35:52 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
	<1501692241-23310-7-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <d5672231-9b37-1923-f0e2-2fe9ae10678f@twiddle.net>
Date: Thu, 3 Aug 2017 14:35:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1501692241-23310-7-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: Re: [Qemu-devel] [PATCH 06/15] target/arm: Remove incorrect comment
 about MPU_CTRL
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V4cSn9FwchSD

On 08/02/2017 09:43 AM, Peter Maydell wrote:
> Remove the comment that claims that some MPU_CTRL bits are stored
> in sctlr_el[1]. This has never been true since MPU_CTRL was added
> in commit 29c483a50607 -- the comment is a leftover from
> Michael Davidsaver's original implementation, which I modified
> not to use sctlr_el[1]; I forgot to delete the comment then.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

