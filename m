Received: by 10.25.0.23 with SMTP id 23csp1080179lfa;
        Thu, 15 Jun 2017 19:55:02 -0700 (PDT)
X-Received: by 10.200.0.153 with SMTP id c25mr10147498qtg.28.1497581702000;
        Thu, 15 Jun 2017 19:55:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1497581701; cv=none;
        d=google.com; s=arc-20160816;
        b=OgcnBlQSwJKVcUpQsmSnFCX1+hbgabR3kBtOIswNLvdzRR/0PJTb6mLMB0YYuL6PzX
         lXJcsvuzFWACr2MKh4RNvs5Pu69OfOwTr36Lnhk4wil+2BFnlSHz+MD9Z/971KHIhUwi
         Wg3z0Nw7IUXdxvy0uwtWkgLZMAKL6wrMbX2ltgKa4M9ZMhvQXB9FSQspbSkFVvHQYEs5
         a8IkfNKdxbs+BwZxXuYKOuUAz8hwQMJxudqzHdT7vaJSRWy09RN30MSBA72MkUVe9P8e
         TBsnOS8oUcYy/HUrQTUpEsAn8qV/QkoicWVwqlMJIMd6hdadepeJlDBh3SCh54YWEMPC
         oNKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=0v84Bf+ckQF89h2CeP+45/1eq1jLHtKB4167a5xvx3U=;
        b=INsYDO/dLK6/wsD8HYfA7Xy2OG1gtMkX0GxLjdwwaSNeeZ/rDybGizYybaeN7OTtgK
         JPZx7M7YfjetJPXabGjRbdlUkm6U8x7HG8QVE3SLfWCjc6X6ZTUbylkGl2hiE0LBkn6L
         pESwoQspWGLBT5mCNt+tvQaooSrIq8wvvLlu5iIkyZ4HW1FF+zgddgb6v1G6PhOFwd9w
         irAYzgRw2KaXCrASvEbmtG65k+Ye2yvNpU5U5qAweOZRlIXe6/Ps/MgUQAJueTMu66M5
         op6qlPw6B6GBdyZrwVSM5K61AWVuu5cdIsWp1UL6lCZkXzNsi0OsZSdlvCGIWIQzoqOb
         bLvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=evYfU2R3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v2si926601qkd.253.2017.06.15.19.55.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Jun 2017 19:55:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=evYfU2R3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56895 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dLhPX-0000V3-BF
	for alex.bennee@linaro.org; Thu, 15 Jun 2017 22:54:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45275)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dLhPS-0000TT-FL
	for qemu-arm@nongnu.org; Thu, 15 Jun 2017 22:54:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dLhPR-0003Qj-Oy
	for qemu-arm@nongnu.org; Thu, 15 Jun 2017 22:54:54 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:34423)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1dLhPM-0003Ml-QM; Thu, 15 Jun 2017 22:54:48 -0400
Received: by mail-qt0-x241.google.com with SMTP id o21so7308005qtb.1;
	Thu, 15 Jun 2017 19:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=0v84Bf+ckQF89h2CeP+45/1eq1jLHtKB4167a5xvx3U=;
	b=evYfU2R3yJ6j2PhbzBOIVvaWjNccmwv8uK1gzXMj9YvvePSP+XU8yTdrUhAHbve7wK
	AQLDpSna5dAAO5Swr55nPwT1N4+ZVjmspYXOAp4bIc/ODLZSYlh2s9YLAaaOpHbV3KTj
	3yj8G2IHbKLd+2v+iIuiwHFcgegQPfgGStlKQx/8wLnK3dE1kCJBpUPGZblxOf47Jz13
	+SgqeBJVCFeafnMxJX1eyl+aLhQBa0vsqwacezy1aSJ/TcVK7WTxdDst4ztIngK01l0N
	tPzOYjZbK7dOgDa+KH9PdQZTXmIHGPMAXtqOtsj5qVT5BBbfkgsK5LZgLFAH5p102+YC
	hHsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=0v84Bf+ckQF89h2CeP+45/1eq1jLHtKB4167a5xvx3U=;
	b=fOi97m8e7v1zCdfVdxM9RqxDu0HyfdtogIkBigcF85ZKcha2rORLx+X2KTuX7a+Hkd
	B8BOPj4Wr6t5sgpDqWHrfZfGcBg2U90TQhq2LlYVixWXkwUHk1HeNHYPF17IBwxW88Ah
	sK9//m8wU0P7g3cK8xT7CXOWlEfhNormCYSlRgEpdaQQKqdAYzq/a44nbvyzUqJ+HLFu
	Ztuwjf/y6oizV+5MRKLGHcbFyK/17cjGCti9yY/qynJPYZExnxJYSkDQDRvYm6oQyBcf
	QM0fEIDXEzhWeu+HmDH2A4ETJ1VHebnHK3KB/82gojcwIW4nh+5hUQQpBHN6VxkeYwWl
	GPgw==
X-Gm-Message-State: AKS2vOx0W4dOZJ8vaiy+pF40gl5GzTTd9Ak4H1HtltG5KTnArNwJHAuO
	30SyrCWtD9eU3Q==
X-Received: by 10.55.145.133 with SMTP id t127mr10597341qkd.140.1497581688182; 
	Thu, 15 Jun 2017 19:54:48 -0700 (PDT)
Received: from bigtime.twiddle.net (97-113-165-157.tukw.qwest.net.
	[97.113.165.157]) by smtp.googlemail.com with ESMTPSA id
	27sm845940qty.2.2017.06.15.19.54.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Jun 2017 19:54:47 -0700 (PDT)
To: "Emilio G. Cota" <cota@braap.org>, qemu-devel@nongnu.org
References: <1497567879-13734-1-git-send-email-cota@braap.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <3f4574cd-c9ab-340a-0938-06f496899ac1@twiddle.net>
Date: Thu, 15 Jun 2017 19:54:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <1497567879-13734-1-git-send-email-cota@braap.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-arm] [PATCH 1/2] gen-icount: add missing inline to
 gen_tb_end
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Anthony Green <green@moxielogic.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Max Filippov <jcmvbkbc@gmail.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
	=?UTF-8?Q?Llu=c3=ads_Vilanova?= <vilanova@ac.upc.edu>,
	Marek Vasut <marex@denx.de>, Alexander Graf <agraf@suse.de>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-arm@nongnu.org,
	Yongbok Kim <yongbok.kim@imgtec.com>, Stafford Horne <shorne@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E9pb5S7dxGlT

On 06/15/2017 04:04 PM, Emilio G. Cota wrote:
> Signed-off-by: Emilio G. Cota<cota@braap.org>
> ---
>   include/exec/gen-icount.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>

r~
