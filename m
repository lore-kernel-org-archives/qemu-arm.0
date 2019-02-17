Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp1517382wrx;
        Sun, 17 Feb 2019 09:55:47 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYlr7+dThf+fc5lPvUmOkqvfurqwzpG78bqjKYDny96O8jWNesoFKMGvOWRwy4rQ7zXKDE3
X-Received: by 2002:a81:1b55:: with SMTP id b82mr16713631ywb.113.1550426147818;
        Sun, 17 Feb 2019 09:55:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550426147; cv=none;
        d=google.com; s=arc-20160816;
        b=MQhSB3PWdNZ1h065S6gn3vDjOalJh0ZmqxyJEoge/9z7+xBHvOcN7m3vYFZstD46gi
         JA5f33vzl0PZa+sw9j8UpbbCCJXiHxvLzM2osab04EtXkSG8VTPAbUtMkDvFxWvhD4gi
         WrENLAIOiZ6MKmkXXdX4S+LWMHNlhoYFpkKGNV0MN5Vi07N4LeqKn4RJ/iGxKlFZVZ8y
         x3Yg/G544gl9/aYPmaBKWo4lfHu4PwrYtg/G+fDJ8U8XdbOXCborIczyhEusyFmCy9UC
         1mBGw5q71VZs7aVRXQPI3aDVzrANabcntpaWGrtwnh82f0pWDL3I+uXv55iIbjkSiytR
         SQbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=NlYBtqZ80N2zIbRajemxQa1YEB7sq9ODjafcV8ppm+k=;
        b=cqeneBXWpD0MuFu/SUAVUWh0jVqHXc3lciK0gGVoWkQxu2y/tbeq36g+9pBoLLSN+1
         mrPgjyjhXtxTAVfYJAgpmUy//Bmio0S9LVTvEdOIX1z32VNoWV/yR/9+6Tor78un1NaC
         rWPnCYJbJlQv9GWdlcpx34bamOxrH8m32d9pmpqG/CCq7oy/TVAj5YZKXIFcz3SVm0yl
         5CtF8wTV/7s3RdRE0Lkt50h3wWG2XDEe2vYeG2nm2HLoLiNbv2yX09w4Vt2PH3yvE9/o
         YosvVbDDZSzE8l5QM8M/UDhi0Qgz73fR56rkooYc2+mi+mnZdGjv6Xu5Gp7T7Dq9ffQx
         2t7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AHlrprPq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i70si6522274ybg.376.2019.02.17.09.55.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 17 Feb 2019 09:55:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AHlrprPq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:44635 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gvQfL-0005oC-Cb
	for alex.bennee@linaro.org; Sun, 17 Feb 2019 12:55:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50952)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gvQeg-0005Zp-Do
	for qemu-devel@nongnu.org; Sun, 17 Feb 2019 12:55:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gvQef-0000I7-OE
	for qemu-devel@nongnu.org; Sun, 17 Feb 2019 12:55:06 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:38676)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gvQef-0000H8-Fu
	for qemu-devel@nongnu.org; Sun, 17 Feb 2019 12:55:05 -0500
Received: by mail-pl1-x643.google.com with SMTP id e5so7551730plb.5
	for <qemu-devel@nongnu.org>; Sun, 17 Feb 2019 09:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=NlYBtqZ80N2zIbRajemxQa1YEB7sq9ODjafcV8ppm+k=;
	b=AHlrprPqkJWMGIQYlUukoAc+JvxXUb2Kk33zY8YNBUCxiBpheoOGvbuEqCD+BWbsW1
	HdE+7i9+N/L7btx3DWtXLfwg9cnU8HrNLvSAgR8lzdXXfzF7IjyTd6sYvVW5rh0SBprC
	TsaYbBMClyWuzhku7ppDqyIQJxe7d5DEeCm0QFvKIL962Q2I+oQPPUQh1hFBBN3hZN8/
	9YOQ0DxvlMjLGUvD7ojG7N0Plu677xP7+H7SX2edxr4TJGLD/V8Qlg3efdEI4qlOeVi7
	OXOo8Jz9fmEJQc9ABwGJDap6cfe5T6Ly11NANR4mxyBCGGJEaQeUBRY5EDCttf34cCun
	HkKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=NlYBtqZ80N2zIbRajemxQa1YEB7sq9ODjafcV8ppm+k=;
	b=Otloqk36mTlzXALrJlo+slmkjvXUrBnHbXyCFNdwI98tjtveE+t+LbbKYD9UTBhLbz
	I50H3Z93eSJEh8V9dzJdr6MpuVQjEg+hOHfFIKziLhm59WeGWD9ZKd4xksbU1src9+j3
	RhCnwabX/WmtR0DrabgfjzdveeoTA/OAItp6DtjSCmGsssUTNWc5Lgs7+KlcD6M8i0I9
	9ffTdOPUDVX/4gkprS0FIllcTKR/bQWva6PU1hhzup+b7H2fJ8ksdgfIH4is0QC7tuo4
	4DsSBpHHUtrh1gD5mWngTR83fpH6gEoETHQfLWflGAMo4Z8XrE+ay6HDheYGuUVU/9J7
	kHcA==
X-Gm-Message-State: AHQUAuYSoJ/215EaoDxHRYX6JAp7g2nb4jbEtT2Czin+8WvX0V4ARW+1
	+UKGbx8cDv8rv7IjzZR8P2NY0A==
X-Received: by 2002:a17:902:7246:: with SMTP id
	c6mr20560763pll.68.1550426103954; 
	Sun, 17 Feb 2019 09:55:03 -0800 (PST)
Received: from cloudburst.twiddle.net ([47.39.62.139])
	by smtp.gmail.com with ESMTPSA id
	l81sm24495677pfg.100.2019.02.17.09.55.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Feb 2019 09:55:03 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190214125107.22178-1-peter.maydell@linaro.org>
	<20190214125107.22178-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <bce8fb4c-e3e2-8ee2-18e6-78b3c62d9110@linaro.org>
Date: Sun, 17 Feb 2019 09:55:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190214125107.22178-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: Re: [Qemu-devel] [PATCH 03/14] hw/timer/pl031: Allow use as an
 embedded-struct device
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
X-TUID: 5fKM4ARQb1gX

On 2/14/19 4:50 AM, Peter Maydell wrote:
> Create a new include file for the pl031's device struct,
> type macros, etc, so that it can be instantiated using
> the "embedded struct" coding style.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/timer/pl031.h | 44 ++++++++++++++++++++++++++++++++++++++++
>  hw/timer/pl031.c         | 25 +----------------------
>  MAINTAINERS              |  1 +
>  3 files changed, 46 insertions(+), 24 deletions(-)
>  create mode 100644 include/hw/timer/pl031.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

