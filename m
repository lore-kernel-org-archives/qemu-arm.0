Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp172869wme;
        Thu, 17 May 2018 09:16:12 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZp6o334QXZPyZcy17SRmLQCoB4au1weS2ZqmeCsnAcp4GcCRA3ZP2oDvoNBbxc/qFnFgdY7
X-Received: by 2002:ae9:ed16:: with SMTP id c22-v6mr57242qkg.114.1526573772114;
        Thu, 17 May 2018 09:16:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526573772; cv=none;
        d=google.com; s=arc-20160816;
        b=OQRLZ79c0ai+mzsOFZwkq+YlzJ3cqJMv/Umz/A2/Fd7vH6P4kjgUdtlT9yjrNfzwZx
         Y2TJJ3fcjnSOLfADphpL9kiihfs+pcfZ/kjZCXJX56cBIvYUupvAeuFwk3fFwo/EVue1
         I1QyxAnduPIgW6GNOGHaV1D451sWMf/DYEKGsAl13P4xV2cmVOwGXQOUsVbe01BhkWD7
         rf5CVs31i0LTl8ZNzPDeKiw8hFND0vQaQTnf3gxKxnMY3Gj/tehzgNdLJ8C1K5zXGD51
         6q+YYcH0zXcLTM6HooJy+THCszC/6Z4KDybTur46g06mBUlGR2QR/guJt2g6j9YvzrAp
         mZIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=ncsX4udp+b/ARb+SILKgoETdhtWWzEnawaCdph0W4uA=;
        b=FjBLVvgzTCduO/BcDYLzeboA3LtZ2pArAYUeyxRzhQLI9BFfNvxGhRZDRVPdQQoCmm
         6+dW4UZca2fAafjut2gKGSrvejSCuSHC9w+6+52zr3cZ5Z+MBrb+7yX73jxXwu1NZarL
         SANK0v4pIm2eOk+BZA26UTz3K9rQwvSM8BB/eVUYEn0SxSFffbmzvBd+m7nByQmC06O4
         GPRjizU9njVIgbNQHkYZRH/twFVFiS/tLMxREXgR9hdcHoiz2Ua+TDACjrIh2LUHo2r/
         nLMFbQV/HqnEdd0+BGqxr/FrjQ+flg89sKMdowxCbEuMUvexs0moFclu2Y5p+Gn1vHMc
         k5gw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GHeqDOkg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l17-v6si5232449qvd.35.2018.05.17.09.16.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 May 2018 09:16:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GHeqDOkg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34990 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fJLZb-0002Uv-Ld
	for alex.bennee@linaro.org; Thu, 17 May 2018 12:16:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60966)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fJLZV-0002UG-5a
	for qemu-arm@nongnu.org; Thu, 17 May 2018 12:16:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fJLZU-0002Qi-61
	for qemu-arm@nongnu.org; Thu, 17 May 2018 12:16:05 -0400
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:38596)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fJLZU-0002Po-0D
	for qemu-arm@nongnu.org; Thu, 17 May 2018 12:16:04 -0400
Received: by mail-ot0-x244.google.com with SMTP id n3-v6so5685874ota.5
	for <qemu-arm@nongnu.org>; Thu, 17 May 2018 09:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ncsX4udp+b/ARb+SILKgoETdhtWWzEnawaCdph0W4uA=;
	b=GHeqDOkgrtxi/QYdOciBwaM3vfHa0Jw4Z/91SwWuvv0stz2eEvqp/gemZnkPFrVgvr
	ysgcLBHsW0LOSfFXuuVr5QooKeTR9AJ1rZdVLBjPWIZOhXWD9nLtIaBo3s08TQVVrqg9
	wShvg6qZ3ORTAuPtLwOgosNcvAuT6I/jX9NLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ncsX4udp+b/ARb+SILKgoETdhtWWzEnawaCdph0W4uA=;
	b=h+O+g/n+gGlNFe6dgTrhD8MUN+dqAppCWZHI1a3ypJSvCGRuLXzZbUaJk9J8ptAzus
	VAhvackTC0IgmmOwCfbJUO42hIjoTieliBvsya8tXSi6q7YO4KCVgxmhK5CUqgrzKYV4
	0Vg3dANoqzXhSOAkzEoMnfesssU9YwyQipp/48MXZooRdG18rNmUfP3aeg3UBtXqvbu8
	d0lpzxQFSw7LHcvQNGDCdievCnQqvNnWhY7jU3Y5zcdMCZ7sAKRQR5UosBJCKGRAZUtQ
	PS4kqncYOg93JKzr1TH9+VO+XcjxcsU7P7sxyvFzmL2MV+j4HteGyq6oJTVGbxHSfVcS
	UdhQ==
X-Gm-Message-State: ALKqPwdoTpJ0g2tP8CQTlvNJ8Pg8qW6OYS+3T6vxBFqR964hhLRHw0mR
	ain813QwpGtt3TnaThQklgWVM0okKXv9AWffZA5fDw==
X-Received: by 2002:a9d:5014:: with SMTP id
	a20-v6mr3810905oth.205.1526573763406; 
	Thu, 17 May 2018 09:16:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Thu, 17 May 2018 09:15:43
	-0700 (PDT)
In-Reply-To: <99693ba4-c282-a10b-e811-697617f7ee06@weilnetz.de>
References: <20180513090613.27960-1-sw@weilnetz.de>
	<cc3f26a7-a8b7-35a8-9ffa-c5940c9c1927@weilnetz.de>
	<CAFEAcA9kcKb28uQJOnqCAC4Gf9b7Hnu0wJbG1nHQLF4U1T9sKA@mail.gmail.com>
	<99693ba4-c282-a10b-e811-697617f7ee06@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 May 2018 17:15:43 +0100
Message-ID: <CAFEAcA_jMUurJy1z_REhbmmsHcwcJqAiaTy0fWBKkxWHGpTRWg@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-arm] [PATCH] disas/libvixl: Fix VIXL_FALLTHROUGH macro
 for QEMU
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developer <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LwBIAxizIG0W

On 15 May 2018 at 14:13, Stefan Weil <sw@weilnetz.de> wrote:
> That fix will work for the moment, but is not sufficient for the future
> because it only supports gcc 7.x, but not gcc 8.x or later:
>
> +#elif __GNUC__ == 7

Fix to make that use >= is currently going through upstream vixl
code review: https://review.linaro.org/#/c/25282/

thanks
-- PMM
