Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp7382995wrq;
        Thu, 28 Jun 2018 05:47:56 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdRQkSYug4B/4OP3UZ3QAbKAG3eWaQGFj+7dcQO+XlSUT9Shqze/cmj3WwR2+ALfMwi5KKM
X-Received: by 2002:a37:258f:: with SMTP id l15-v6mr8824647qkl.88.1530190076294;
        Thu, 28 Jun 2018 05:47:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530190076; cv=none;
        d=google.com; s=arc-20160816;
        b=AoZrZkwPgS7M6SeZidkTgqN0267LSB06NqZqRbvkZ49tamPxj3ayGyxttduxFosF6e
         pck9SIrOt0inV8PZ28QjOsGJwwLJP8E5kZE7owhauAi+dKJMjXT4qfdOUUxGdyyZE9EI
         MG/OGN3VGYuFuelsnFx+JoPPqYptMU3ZkIZFUSU727csy3KS3c2SlVpG9rJPqal4fB4z
         7AvtAh204G+MU0X/86eDNWJwQk9oHb/lKmw6EnnjG+O7Qndi95qBDvLZ9BHEdrvx7r1g
         lKCVEXbVp3GgTaBrDkdSO4dqBuXuFOIQZ358xjpidiwUEIPgN0obWxTwmTenRJl+EBHI
         4Jew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=YWUqiEnBj7DMXnYbWOKt+BZHRRxay1n/VNaZ6qHcN2Q=;
        b=hHZyGWyYrAYhqMEZOfbPSNNtOuQTQLubUx+HSfFKW8NpzxPVYwF63mw9jc8jYibn1O
         wc8radw+lUfTePU15n5M8NQQVOvUlImzN3VdKLRCDQjPTAc+9RScEtMbcutMLKvOtIjm
         Dyr6gS2nathCLYFOGUzEXLqdl5lb/VyNnFbtoZ38ABprZPb2c8cDj+6XrsNXno8XcYWc
         peeR4asZA3c3mYBaT7CKSQW22RkK68zG+TzuzGR8G+YeGUqQk/EdFBgnBFH51SU6uSXz
         ttX5Zi7enpVl5VauwwK+sDyhQc8B/D16Rl4JvjvuAAadjbHDnU5u4zvHWVtFPW6cFA7Q
         or/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NtdYSPyB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 13-v6si4423430qts.384.2018.06.28.05.47.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jun 2018 05:47:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NtdYSPyB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36463 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fYWL5-0000fr-QW
	for alex.bennee@linaro.org; Thu, 28 Jun 2018 08:47:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44139)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fYWKx-0000fg-8X
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 08:47:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fYWKw-00029N-Kr
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 08:47:47 -0400
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:34367)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fYWKw-00028D-Fm
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 08:47:46 -0400
Received: by mail-ot0-x243.google.com with SMTP id i17-v6so5980883otl.1
	for <qemu-arm@nongnu.org>; Thu, 28 Jun 2018 05:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YWUqiEnBj7DMXnYbWOKt+BZHRRxay1n/VNaZ6qHcN2Q=;
	b=NtdYSPyBdd8MkFYojwpNdHB+FezuLg7duuJKLxfW3Z5qVPz1OyOoCp8k5C6ooruNkw
	BUVYAAcB5yaU2/8izn6TugmFqo4cK1r0LBrytFMJ/swQEPXubvJvgYTVfLDgC3YMFrcY
	eG+5WmCgZPESOkx/SmI/5dAtY09rCxxTtO0QY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YWUqiEnBj7DMXnYbWOKt+BZHRRxay1n/VNaZ6qHcN2Q=;
	b=dy2TTJp5AefEVL0kFUh37yqiuccHnQrhlg8RlmgW6jVsU/z0PP/ewIf92+d3wqa+JC
	HcZBcShsIcg+RI/HkNmeg0SBx81iu7TysQR1jdURhUYuQGbHK84jjC81ydmq6oCb3SFZ
	kklKggzuz5elvPpLZcnZAXZ9OjOcosg2NdfGBU2aw0ztSMkiYV9aroXgfK/DLO+jogmV
	3MhIo5BWmBqdgql4ngR1VsOXfmogB02vq5Rg9+OkhdtPxOQSF+aGsTub2urvhMfi30zH
	xbB1rsPZAszL9IN20D/SMz3u6eUsEFi7q80DU1lGOt+8MLJPDITOmgVp7A42gpoaePVm
	fHMw==
X-Gm-Message-State: APt69E28/484RIdvPNhPR4FLLX0mPxhfKLglU7ron0HRUjlGkgPLYuI1
	A31wd0rr8YpWhKxnkwHSVuV+AzRT5JSxj56FMEGKjA==
X-Received: by 2002:a9d:34db:: with SMTP id
	t27-v6mr6395873otd.316.1530190065578; 
	Thu, 28 Jun 2018 05:47:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:902:0:0:0:0:0 with HTTP;
	Thu, 28 Jun 2018 05:47:24 -0700 (PDT)
In-Reply-To: <20180627043328.11531-32-richard.henderson@linaro.org>
References: <20180627043328.11531-1-richard.henderson@linaro.org>
	<20180627043328.11531-32-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jun 2018 13:47:24 +0100
Message-ID: <CAFEAcA98L_XYJJt6LWa28=EKnNBbS56W7WLVZ+w+u=xVrcNm9Q@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::243
Subject: Re: [Qemu-arm] [PATCH v6 31/35] target/arm: Implement SVE fp
 complex multiply add (indexed)
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OsmrigMBJxr9

On 27 June 2018 at 05:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Enhance the existing helpers to support SVE, which takes the
> index from each 128-bit segment.  The change has no effect
> for AdvSIMD, since there is only one such segment.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
