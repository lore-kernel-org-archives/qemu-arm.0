Received: by 10.223.172.38 with SMTP id v35csp822877wrc;
        Thu, 14 Sep 2017 05:48:15 -0700 (PDT)
X-Received: by 10.200.18.70 with SMTP id g6mr4237650qtj.87.1505393295439;
        Thu, 14 Sep 2017 05:48:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505393295; cv=none;
        d=google.com; s=arc-20160816;
        b=GxtORUkNqEA5PwT0lp6LPeidoG1L0TVrNMM9KYzPqdvW7lZfdqIHuCi9ucuRPfHgdK
         GmCtVHgpZK2DSvbVrLI4nl5FT1hibojb9j2OwYxMC125GYqpGlvlQaSosk4aSInh9jRd
         /WqSHy/2fcJ62f7nb+OPUUtGgitpWyt9S4dnH4miXbIs/ZtkOxMSXMI+LLlN1va7apMP
         dxe8HP0+hyzBCWBt8bhl6Bqg4xBnypdIZVe8ngEd/cZg4env5MDNXomZ3I9munn15F94
         +LOpS5qUEoSV8eO5W7f95RRNZ3Agn7T9nxKNUHLWEcs8q1Bq6TMEw7GHLd6ppPfT3EEJ
         NClA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=kmG4Wh0EWXwxiIVoTd1P0p05ZsjSQWBXCPHiMzATZeU=;
        b=UBNVX1Y39H7Loy2a98iXmiB88/5PDEyanxPlHMr+QdEl4bLnmhGJeEzL8nhK+UY5Yh
         tK64UN4prdX9M+nMNrqEkB3EIta8wC77xA7J4YJmTwVfMvc/xjYmj8cz/kf0iql1MYqs
         cTRRBNunzuKI8pr3dWSPJlDxpWvqHIPtgDUD++h7CRnh+nvBHDK2S1CUVNyCS2VeYT0R
         zjWow48p2VyioSRu073Ok9YLeIIPeYZ0LEZGA1MLMXtr+Si3iupXFhwm2m+t3g/WAMIt
         XrxeqBv7Cb6UOOGLOKOKrAWjzYJLmxcHLf4lWQ5gnN5oVuOuTuPKfiu0s8xFD0BN01sV
         2QmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dXGK8D2W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v62si17141006qka.267.2017.09.14.05.48.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Sep 2017 05:48:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dXGK8D2W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47653 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dsTYz-0004SG-CV
	for alex.bennee@linaro.org; Thu, 14 Sep 2017 08:48:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37446)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dsTYm-0004Ro-Ou
	for qemu-arm@nongnu.org; Thu, 14 Sep 2017 08:48:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dsTYl-0004Vf-V1
	for qemu-arm@nongnu.org; Thu, 14 Sep 2017 08:48:00 -0400
Received: from mail-wm0-x22e.google.com ([2a00:1450:400c:c09::22e]:46459)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dsTYl-0004Un-OZ
	for qemu-arm@nongnu.org; Thu, 14 Sep 2017 08:47:59 -0400
Received: by mail-wm0-x22e.google.com with SMTP id i189so104434wmf.1
	for <qemu-arm@nongnu.org>; Thu, 14 Sep 2017 05:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kmG4Wh0EWXwxiIVoTd1P0p05ZsjSQWBXCPHiMzATZeU=;
	b=dXGK8D2W2QN2Bh2BspAB8YwbFCvvpex8q86wxdaDyg8h0WBO8ZIs/2OKNX11IsBZwz
	aHi2izEvW/iaIaUt4vPJQI7tKj0QUVqR51JcC4Jf20ices2jiDdbS87c7Z38nVNUV6P8
	+H7JVqtI45Ap7kl42Pzzfp9WoxlEE7pSqB+us=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kmG4Wh0EWXwxiIVoTd1P0p05ZsjSQWBXCPHiMzATZeU=;
	b=WBSG8z/riDWii357iyG5jnvN2W916bGhAcGyBE7mOO+siGHsb2KTGmyPTjjHUmnFeX
	utN4F+KBHgWkzfqd+8oTXEM4S96L0ps3eqkVkJwfWumb9a7dooX9SbZ+UNjCLuy3wBNt
	t613dZ47d3wSVCgvsdNvPgERXsjkDUvTfyI8lePTMPf8YQyjCF7eQ+5IWOLCweLRlA9l
	LM1DIJXu+lZJPio19fTmQ1tE8oXAEohR44Fu0IUT4o9a/OxN3jnIWhTC/3dRtYdWUxyX
	UnwOzDqlH0vcyfeW60Eg6FIsyHdo3i4WPfbIZAoex5GbapHgstBwlUXh5P3UD69qvZp6
	3hWA==
X-Gm-Message-State: AHPjjUiOypHRgGJ4i/jvMO/RyNudjnvTBiiIehEMyy/W7YPVn9WpwLnH
	xMOE50ivwx4V84yWpwa2l27As+cM0JjnAm9snfFXWw==
X-Google-Smtp-Source: AOwi7QBlA4avhRHVZ2GBDug2uL/c+y6DMCKqY/T5R6tfrrO8OJByHoEptdioxrhv65sLj12nOm6DOeawNKYoDcIwD/4=
X-Received: by 10.28.52.81 with SMTP id b78mr1865297wma.11.1505393278695; Thu,
	14 Sep 2017 05:47:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.215 with HTTP; Thu, 14 Sep 2017 05:47:38 -0700 (PDT)
In-Reply-To: <CAKmqyKMdfNLtVTnDGVytJKaaoWMkxt+G3+U6Ph5Vm8U2ZGzRaA@mail.gmail.com>
References: <20170908163859.29820-1-richard.henderson@linaro.org>
	<CAKmqyKMdfNLtVTnDGVytJKaaoWMkxt+G3+U6Ph5Vm8U2ZGzRaA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Sep 2017 13:47:38 +0100
Message-ID: <CAFEAcA8mdXdnbFQ0auivBNr2StWqSZhO2W-ZAr477rDqtxif2Q@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22e
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] target/arm: Avoid an extra
 temporary for store_exclusive
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yCc6nKJykefD

On 8 September 2017 at 18:46, Alistair Francis <alistair23@gmail.com> wrote:
> On Fri, Sep 8, 2017 at 9:38 AM, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>> Instead of copying addr to a local temp, reuse the value (which we
>> have just compared as equal) already saved in cpu_exclusive_addr.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>
> Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
>



Applied to target-arm.next, thanks.

-- PMM
