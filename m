Received: by 10.25.221.202 with SMTP id w71csp2372867lfi;
        Fri, 4 Aug 2017 10:47:56 -0700 (PDT)
X-Received: by 10.55.79.9 with SMTP id d9mr4379613qkb.335.1501868876518;
        Fri, 04 Aug 2017 10:47:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501868876; cv=none;
        d=google.com; s=arc-20160816;
        b=fVXVGVGZcsEDeiyHlWvXCI1szHfEYWRvP5+4um03wtlSIu8EQzuokbL7DiUPc8mt0/
         MVMfKjvocGhqf8TV8lHw6IDD2i45g7A+Oqtc9hWCGyKk1oPxj0RKv2NhYO89lhUoB9BH
         YF50n85wQesOhjxcGdSbfAEhunMJZv7sae9O7kCNWgmZ2xgKyCaGYm4kp1y9/Opn7ayr
         TnRsxsCYmjI0JE2w0KhcHE8HJSoYGpITwPVhinmTwjBUWECIdZQZfOE1nTpAjPfADx0t
         IMCfVoqBV0wi9ojlE6Cl+jbkVe4TTgP+uQZriLPPDUE0SpT6R2BUB+LJxBof0Dfu1R67
         4uJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=RaDgMPU6botgLpOPsttsQ3yk48u75V/uxNh7L+51/F4=;
        b=JwbN1uqUF2dK3bke6Hz2cLz1uVxhDH3Wn7/bKMdnSH6xLQXCBhZEJQDYuyBcOjOpsX
         LqG3N5eWW9o5UQBUEcinU43qSAnBpcOkr1ApL2kscIIVzQvoFB2QO4CRvmWeF+rqy2HW
         3Yr1HmOlkySiKHPwtXQRlXRYgMCe/89cBEpu7Bu2kXRJm0gtdtxQitd2IP+Kc/DQPlOK
         76tMkEsM3lLwHCwF5UXZ8WiwrASR5LPh2pZVu71WNM9ZBXgCOpfks/mOCQkX/fb3MlQb
         Wc4/zrpU8QpXFF3+/M6lyrFbbH0f83Tcr375rhk7qYiKOeVbUk3iGxDKfXtHdZNbuI35
         UqNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.b=hveuBG7u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u19si2007073qkl.321.2017.08.04.10.47.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Aug 2017 10:47:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.b=hveuBG7u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41710 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddghW-0007kW-1T
	for alex.bennee@linaro.org; Fri, 04 Aug 2017 13:47:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54902)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ddghM-0007jz-Vq
	for qemu-arm@nongnu.org; Fri, 04 Aug 2017 13:47:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ddghI-0005Tv-30
	for qemu-arm@nongnu.org; Fri, 04 Aug 2017 13:47:45 -0400
Received: from mail-pg0-x22f.google.com ([2607:f8b0:400e:c05::22f]:38192)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ddghH-0005Sz-Su
	for qemu-arm@nongnu.org; Fri, 04 Aug 2017 13:47:40 -0400
Received: by mail-pg0-x22f.google.com with SMTP id l64so10571827pge.5
	for <qemu-arm@nongnu.org>; Fri, 04 Aug 2017 10:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=RaDgMPU6botgLpOPsttsQ3yk48u75V/uxNh7L+51/F4=;
	b=hveuBG7u1GpzRmJKQ/jK/fmgBGHpvggfSTEgV86QE0b4ZB8ySUG3Ad+7olGov6nkjn
	fnHCeF9u55NtiWG3dcmA2eOoS5vG+qRSGqDZszgwvIKOv4Ev3akvlGaJfoQeQVDPIJSs
	LJJ6FfbrxFc/vr8cuSKT52lDS6x9KyJTWJu1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=RaDgMPU6botgLpOPsttsQ3yk48u75V/uxNh7L+51/F4=;
	b=RdNYVVTuehvDVE2Zsn8D5Se/EYKDEfDjjQxxwzyNn8Arqr58ZZ6I/oI9+ktdnFg4iy
	s8Nfb9hcY26cKNE4sdhhcoC6plkfUthsnvQoOjr/J+mDEXINwpj0iDuzNGUimuAC5x+i
	hubkku1nUR98fBlCmNiKw1QvdQJbSF/r8qUl2rfU1MTa86ld6v+XAsy7T+BLiKwp8uud
	pZ0akQ1Vwj5ewVt4x39hmFTDhzaKlHC3z9P3ehQVsFN29dTto8Fa4IPrVDry/G+O0OZg
	QKt1M+y4hJI9DkKCTI5IZotdzouXIU3WTGB5tHGygy4NPE5NWlPG45hczAlN8VptRPzQ
	P7qA==
X-Gm-Message-State: AIVw111iXyjvrleDjgF55DYsKLdVTl8pUvhbi29I+Tqfv9bcRIQkdETO
	BaP0XBqNww93gEct
X-Received: by 10.98.80.24 with SMTP id e24mr3258918pfb.195.1501868858844;
	Fri, 04 Aug 2017 10:47:38 -0700 (PDT)
Received: from anchor.twiddle.net (97-126-108-236.tukw.qwest.net.
	[97.126.108.236]) by smtp.gmail.com with ESMTPSA id
	f74sm3516224pfk.131.2017.08.04.10.47.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Aug 2017 10:47:37 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1501867249-1924-1-git-send-email-peter.maydell@linaro.org>
	<1501867249-1924-2-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7bec1b4f-1fd2-4104-814b-97476d619bf5@linaro.org>
Date: Fri, 4 Aug 2017 10:47:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1501867249-1924-2-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::22f
Subject: Re: [Qemu-arm] [PATCH 1/8] memory.h: Move MemTxResult type to
 memattrs.h
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
X-TUID: CY5+84kxDsYN

On 08/04/2017 10:20 AM, Peter Maydell wrote:
> Move the MemTxResult type to memattrs.h. We're going to want to
> use it in cpu/qom.h, which doesn't want to include all of
> memory.h. In practice MemTxResult and MemTxAttrs are pretty
> closely linked since both are used for the new-style
> read_with_attrs and write_with_attrs callbacks, so memattrs.h
> is a reasonable home for this rather than creating a whole
> new header file for it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/exec/memattrs.h | 10 ++++++++++
>  include/exec/memory.h   | 10 ----------
>  2 files changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
