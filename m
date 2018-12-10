Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3455785wrt;
        Mon, 10 Dec 2018 03:00:55 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VbR4tpLpxkXiEx63bYvMPAAMTdOmdnVbcdA2hyIjyXZhJt54PPk3y2ttiF4Je/tToDHaB2
X-Received: by 2002:a0c:86c1:: with SMTP id 1mr10725826qvg.6.1544439654969;
        Mon, 10 Dec 2018 03:00:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544439654; cv=none;
        d=google.com; s=arc-20160816;
        b=O+zn5LGh5r4h/8XcrMUSMpIq3YIiCOcg0tt6S1hK5Xlk8IgN/Pf8iqqgd5ViykkU3/
         gTqAPbpAp6HtIWRui3KytVUxx5baaK+zbYuwpYD2aXQfYIv0FX0H0CmAtusut7J6GFQ0
         ZJ0/iTuOnZb7BR0xeU2KJ5NalK37oy+L1E0xGAFVnCz8wdOjFQThNIIvyaYtWhXWuuh2
         xbSSD+SGNYImevQsmbr/5wvIBWlRLpdSU+Qd2ukfrhCDLLsFxA6BeYMAEXG2QDh0ocYs
         eo4Tpz6yj5HMCAEFPBdoln8W8aznqz08ER0+PFK7fqw9I6nA7uscHBL9OvkuU3TH0AyP
         duVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=GYZVqKdhr9lgGrMiRlTxkuA5vFHhK3PIWaqW/77BabI=;
        b=FQhmkphRUPic3aP4doF+U4x2pr+kwSgUQJifRf+4xsdo0Bhn1j5CtQdogrh7jhlpuf
         1mrZEDuwVZ8jE1ZKYtPssmhEPeQltvv0z7gZ5uiVnDDfGbYr6NALPRzHOV8OKp5hY+ze
         x2bPmEru01gswP6We73B+P9jA20HzLbHGFjrYGCrNWcg7HmFVzwtvyAJ+Yp0ljteO2Di
         N1xk1UIAfNpu0+6N1qtqtXVwRQa5cAivqRib7MZPfoXfO5VCyJbvela8Jduj1VS9U+N9
         4Vx/NLpg316XrAaSt4ZHVqrSvvmOVvaVQIJzBwi85VkGKX26phpkywIv7FbE2PMH4++p
         Fv5w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c185si1780686qkb.52.2018.12.10.03.00.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Dec 2018 03:00:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60142 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gWJJ0-0004F8-E8
	for alex.bennee@linaro.org; Mon, 10 Dec 2018 06:00:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47123)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gWJIg-0004Et-2b
	for qemu-arm@nongnu.org; Mon, 10 Dec 2018 06:00:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gWJIa-0005dl-03
	for qemu-arm@nongnu.org; Mon, 10 Dec 2018 06:00:33 -0500
Received: from mail-wm1-f43.google.com ([209.85.128.43]:37303)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gWJIZ-0005bJ-NU
	for qemu-arm@nongnu.org; Mon, 10 Dec 2018 06:00:27 -0500
Received: by mail-wm1-f43.google.com with SMTP id g67so10684435wmd.2
	for <qemu-arm@nongnu.org>; Mon, 10 Dec 2018 03:00:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=GYZVqKdhr9lgGrMiRlTxkuA5vFHhK3PIWaqW/77BabI=;
	b=MxZIatrvSeIrtwsV2dqAgYBphsUC76dMZfbHFyIAqOxu2pmbivud8mJrY2Gm33ONod
	lV8cBhY7lDwBaE0LKMpuEdv4vm/nifMVSvnHvYzLbL86Rqu/REiHeo1J2K568xtCCnq+
	sBWZy6uhE6aHYFi1MfvdXNw5kNGz/Pq1brCM7/qtWNhFaHo9Wb+hvT2vsoGC4UlJGDRP
	n3jxhBI58tIi7tJl56vk9hE5p566A+fZLajHdKTLviTVNdvUGtq0QaULqQM6rDbHM+ox
	QNwv4OA3DxGcNxqy/U2CXA/Zj8Fy5sd6ZcanJUd7jl+XcYOlRO2M0vdHlhingWe28xvL
	hfog==
X-Gm-Message-State: AA+aEWbB4DH8wyx/qY7XQdPZzIfHscH07rooml1jKYuFcF1uNpj/VNni
	EFEIFrz6OcWGxj5558qH2vzjNw==
X-Received: by 2002:a1c:30b:: with SMTP id 11mr4349283wmd.110.1544439626047;
	Mon, 10 Dec 2018 03:00:26 -0800 (PST)
Received: from [192.168.1.34] (172.red-88-21-202.staticip.rima-tde.net.
	[88.21.202.172]) by smtp.gmail.com with ESMTPSA id
	r64sm12406137wmg.5.2018.12.10.03.00.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Dec 2018 03:00:25 -0800 (PST)
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <CAHmME9qhe0ZemTkc2jkEO=_hu6PhvKUKGHC9QYTj2j+QHhNf8g@mail.gmail.com>
	<CAFEAcA8fYaKTZkLR8Ja3P590bSWy1cu61-gSxyf6+wXCfCLoxA@mail.gmail.com>
	<CAHmME9qQo4XfRgZUZDt3xbx=5KmRoYbO3N0+3m9gdKi9hvnZQA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <96301756-f879-84d1-f5ef-d2615257d309@redhat.com>
Date: Mon, 10 Dec 2018 12:00:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <CAHmME9qQo4XfRgZUZDt3xbx=5KmRoYbO3N0+3m9gdKi9hvnZQA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.43
Subject: Re: [Qemu-arm] [Qemu-devel]  more serial ports on arm?
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Vg21q0k91LhJ

Hi Jason,

On 12/7/18 5:42 AM, Jason A. Donenfeld wrote:
> On Tue, Nov 20, 2018 at 11:08 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>> It's still stuck, because unconditionally adding a second serial
>> port to the virt board breaks some commonly used existing guest
>> code (UEFI + Linux), and it's not clear to me what the best
>> command line UI is for allowing the user to request the second
>> serial port.
> 
> Can the UI be the same more or less as for x86? Specify a second
> -serial, and then the machine gets one added? If it's in secure mode,
> then it's added as serial 3 instead of 2, to remain backwards
> compatible.

You can use various -serial arguments.

If a board supports 4 serials and you only want to see the 3rd (secure
mode as your example) you could use:

./qemu -serial null -serial null -serial stdio

serials #1 and #2 and #4 would be redirected to the null backend, thus
ignored, and you bind the secure serial to your stdio.
