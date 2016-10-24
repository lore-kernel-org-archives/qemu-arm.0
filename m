Received: by 10.80.166.35 with SMTP id d32csp2717036edc;
        Mon, 24 Oct 2016 08:57:59 -0700 (PDT)
X-Received: by 10.194.23.66 with SMTP id k2mr11882153wjf.108.1477324679220;
        Mon, 24 Oct 2016 08:57:59 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d10si16816267wji.82.2016.10.24.08.57.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Oct 2016 08:57:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47636 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1byhbs-0002NO-Lv
	for alex.bennee@linaro.org; Mon, 24 Oct 2016 11:56:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48349)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1byhPd-0002Zu-Uw
	for qemu-devel@nongnu.org; Mon, 24 Oct 2016 11:43:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1byhPa-0001Up-2i
	for qemu-devel@nongnu.org; Mon, 24 Oct 2016 11:43:46 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:34402)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1byhPZ-0001UD-ST; Mon, 24 Oct 2016 11:43:42 -0400
Received: by mail-qk0-x242.google.com with SMTP id n189so13443082qke.1;
	Mon, 24 Oct 2016 08:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=gKySe9DtufdxZWeXhDy2/Wk97ELtLeP9q6+bxKGbmJk=;
	b=YTTCubrGajR1FXdLnx9cm5eNijvc2w7k3wkVuUiencp7DDg1o/mw0S6bTAbRWA4J2A
	kAMEunisJcf9e6nR6TYyFWtvUtHSpmIDF6T0mullcBtjxcVpopYeugv7X5oxAGIREI4g
	SAtSUuA34SBcpgPhhm/beRot8tjS7OpWPCcQCenn5YXDHW7GlVIom8kGRTfsfuwd7kAS
	aeZxvbErMYpcDtTtZmuGysyixx4JHqVxj9N4QFiLsRNXVmboGgXzO5Yrcm+PmxOz1UIR
	qF8stnUMn+db74b6Xp5IVQ4dkY+hq3Qn5B9wmQzPJdnNBIApUIClCzPmIvCpAz9RFptD
	jTIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=gKySe9DtufdxZWeXhDy2/Wk97ELtLeP9q6+bxKGbmJk=;
	b=CnKlbIgmjs3GrFMmbcpehj8i11cn61/On7ZeVBsZ9BBJZiZp9phKElL8oFLzPMAJGP
	AejkKtJYP9ti17Orx3uHunRqdo2X6PPcoosSmlKoccUmAJM7yHTFhrA4BRuVIktzsXtg
	XDwZ57AJmGndoPRHcMRslmjC/ToTO6r4dOSC1z4QwhCj708xx5QfXUfJ9Tha8t+lWKA3
	nAfjT+I6rwzPw2mvg2o36YRWGtVD+4fyRS18AgacUlBT3XD+uMAOwSetNXl2X0owmfrC
	/Vtyaq2PRJXOB3AV2YZKCVpFjof5sZUTJMucDmxzHPvFNU091Q47p3hihmxPiqCR/eIN
	AkMA==
X-Gm-Message-State: ABUngveH8TcjVp/8ijIJDKfJVOdUyh9mFLS6uNHglgMOUb7IIKmkSXSfDamGH35d/PgjrA==
X-Received: by 10.55.161.196 with SMTP id k187mr15469903qke.149.1477323820280; 
	Mon, 24 Oct 2016 08:43:40 -0700 (PDT)
Received: from anchor.twiddle.net (174-24-157-40.tukw.qwest.net.
	[174.24.157.40]) by smtp.googlemail.com with ESMTPSA id
	58sm8681471qtz.33.2016.10.24.08.43.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Oct 2016 08:43:39 -0700 (PDT)
To: vijay.kilari@gmail.com, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	pbonzini@redhat.com
References: <1477288523-10819-1-git-send-email-vijay.kilari@gmail.com>
	<1477288523-10819-2-git-send-email-vijay.kilari@gmail.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <e40fea9d-7e1d-ea61-7a7f-f5bef8bac02e@twiddle.net>
Date: Mon, 24 Oct 2016 08:43:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1477288523-10819-2-git-send-email-vijay.kilari@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::242
Subject: Re: [Qemu-devel] [PATCH v3 1/3] cutils: Set __builtin_prefetch
 optional parameters
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
Cc: qemu-devel@nongnu.org, Vijaya Kumar K <Vijaya.Kumar@cavium.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wM7y/NjiX6Yo

On 10/23/2016 10:55 PM, vijay.kilari@gmail.com wrote:
> From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
> 
> Optional parameters of __builtin_prefetch() which specifies
> rw and locality to 0's. For checking buffer is zero, set rw as read
> and temporal locality to 0.
> 
> On arm64, __builtin_prefetch(addr) generates 'prfm    pldl1keep'
> where __builtin_prefetch(addr, 0, 0) generates 'prfm pldl1strm'
> instruction which is optimal for this use case
> 
> Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
> ---

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~
