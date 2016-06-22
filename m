Received: by 10.25.21.96 with SMTP id l93csp2225171lfi;
        Tue, 21 Jun 2016 18:44:54 -0700 (PDT)
X-Received: by 10.55.157.196 with SMTP id g187mr34625047qke.68.1466559894509;
        Tue, 21 Jun 2016 18:44:54 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l63si3339309qki.38.2016.06.21.18.44.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Jun 2016 18:44:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55144 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bFXDp-0006vh-Sz
	for alex.bennee@linaro.org; Tue, 21 Jun 2016 21:44:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46981)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bFXDl-0006t5-Bg
	for qemu-arm@nongnu.org; Tue, 21 Jun 2016 21:44:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bFXDj-0002U0-IW
	for qemu-arm@nongnu.org; Tue, 21 Jun 2016 21:44:48 -0400
Received: from mail-qk0-x236.google.com ([2607:f8b0:400d:c09::236]:33348)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1bFXDd-0002T6-6l; Tue, 21 Jun 2016 21:44:41 -0400
Received: by mail-qk0-x236.google.com with SMTP id a186so46539241qkf.0;
	Tue, 21 Jun 2016 18:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=hOuFUtvhKvsL7KlaIOV5K8FCiRksqVQfhGKmsG0bYkg=;
	b=XBnjAxOnXvY+FxG88KaJgskf98HW3uiyLQtxbE82dz97a+hj7agKOQScXOWIFMQ4o5
	92OHyamFpPlYdwd9EFSzmWSEpzyp6ei5CqC+M/XW6Wvydy7Y17Ln1cSzWmgoJ0Tj/GdK
	ifMpVgSnelIKY5MxRhTPEc93kX/npGKcKbTjlu84przI61W/KZAFzoUxaeP6Tr6JpGkx
	LHopoVKobY91Ij2JMl5BFo0S3210Gk4k5I8NIovLN8F0ASIwJL+q2c0ROU/duclVmZA3
	poExlmeXeAGbcHmoHj2GDM+cl6hOj1fvBuFwy6o8Z5x+wIb8Yvf0jZ7nu9ioWDIdhXMD
	k+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=hOuFUtvhKvsL7KlaIOV5K8FCiRksqVQfhGKmsG0bYkg=;
	b=N7T8MhTFfqkeAMm2bqR77rgdSCh6g7j9DU4jUqTOuNfFkwT29/rAiP1dZ+M/BkvWiU
	APDLWqKoUv/PZxruMS/DJMLvtl03BMjYVt8el40D4cTg+njbLFmmNfvHK7BchmQLyCr+
	0uDV4jFW+RL3x1qNQZ879gpZQ44lfcMIQcABMBqFS0Kkh+mpZKZlEKmIUAB0VG2Ynchz
	7cm5xKk/y1Wflm96cCO/+6tSlNHT5+9hTltLd/58fZK68mt74uKxaeFgGDr37CRT0w31
	vnyDooef/8ZMZ+JSFz+XuSax7NmsjHbCKYMDmD6KctJW6wrPl8I9IIiMbrN9CYgY9ZRm
	nUEQ==
X-Gm-Message-State: ALyK8tLIEBBIWraDiTRvvVh71fpn17+w5PelEPvhh82FUtkS0lOou+GJsvj0NE14Ma39Ag==
X-Received: by 10.55.200.9 with SMTP id c9mr34442158qkj.158.1466559880723;
	Tue, 21 Jun 2016 18:44:40 -0700 (PDT)
Received: from bigtime.twiddle.net (71-37-54-227.tukw.qwest.net.
	[71.37.54.227]) by smtp.googlemail.com with ESMTPSA id
	v12sm25089744qtc.3.2016.06.21.18.44.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Jun 2016 18:44:40 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1466528974-12183-1-git-send-email-peter.maydell@linaro.org>
	<1466528974-12183-2-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <57258216-bc5a-2e2b-33f4-3116c51fe7f6@twiddle.net>
Date: Tue, 21 Jun 2016 18:44:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <1466528974-12183-2-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::236
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 1/6] migration: Remove static
 allocation of xzblre cache buffer
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Kyjg6PqJuylW

On 06/21/2016 10:09 AM, Peter Maydell wrote:
> From: Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>
>
> Allocate xzblre zero page cache buffer dynamically.
> Remove dependency on TARGET_PAGE_SIZE to make run-time
> page size detection for arm platforms.
>
> Signed-off-by: Vijaya Kumar K <vijayak@cavium.com>
> Message-id: 1465808915-4887-2-git-send-email-vijayak@caviumnetworks.com
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  migration/ram.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~
