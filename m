Received: by 10.25.208.211 with SMTP id h202csp1250263lfg;
        Fri, 19 Feb 2016 08:38:59 -0800 (PST)
X-Received: by 10.55.76.73 with SMTP id z70mr16706190qka.105.1455899939050;
        Fri, 19 Feb 2016 08:38:59 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v90si15050686qkl.81.2016.02.19.08.38.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Feb 2016 08:38:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:53627 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aWo54-0001nS-95
	for alex.bennee@linaro.org; Fri, 19 Feb 2016 11:38:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53457)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aWo51-0001j3-T7
	for qemu-arm@nongnu.org; Fri, 19 Feb 2016 11:38:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aWo51-0004AB-1P
	for qemu-arm@nongnu.org; Fri, 19 Feb 2016 11:38:55 -0500
Received: from mail-vk0-x235.google.com ([2607:f8b0:400c:c05::235]:36508)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aWo50-0004A0-LT
	for qemu-arm@nongnu.org; Fri, 19 Feb 2016 11:38:54 -0500
Received: by mail-vk0-x235.google.com with SMTP id c3so79056282vkb.3
	for <qemu-arm@nongnu.org>; Fri, 19 Feb 2016 08:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ATkcCIpYt+UFYybLoeZlrXFxj3AXQFNh5V1f15SwL8s=;
	b=QRBQhZtsIqwJOQpVSwcVujvKVAGJ1VVROULN5D90KWExVbA3bt8l0o2vEhlGZnEYsk
	ObbR+5B//Ij7kZ66VhNAWJD89nWY89QJ5wwhbhdOkOPRpQw21T2TE6F4Givlp9x3M385
	WZQYj3G02i6YAVx532ECYPdmbgzyO7qYJxHog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ATkcCIpYt+UFYybLoeZlrXFxj3AXQFNh5V1f15SwL8s=;
	b=RJfckJoYtxT3vhZDRDaDli08iiWQ9R7TsIn7fjytQgE6Mj+0IxkaYgXCmtn4SBpy0y
	tfpQHvzVsv2ZuLQ7zHkgd+jb5JBzh+hWLsDLupTrnLfNXHro8wSYFVR9i4ehid9mZs91
	PQjlLff/xv0qMgwo9sQnjA6uVa7YKPsnkP4Ax8OysuJaGxj50dsd63JFOrYRNBTM4M5l
	xPFfzsSDe5+9qxup5WoEcFVWS2IYe7CpkvGHAtgL91hCp8bMcprQo3NfryK4zisBsl6y
	lEF401WDVCVs+Jjb5BZxEzFhKyBE4raaTtxemZ1/5Fpur7vyNsxpttlkWbC70aIiQoyO
	ES3Q==
X-Gm-Message-State: AG10YOSRva/gbu3mSTYJZ68QwaiuE7XS8UwXaSDsQBeqZdowDCIzSGaMeMPg+9SLI42p2mrHPVbwq1w1tOWeStZz
X-Received: by 10.31.47.207 with SMTP id v198mr11820333vkv.6.1455899933894;
	Fri, 19 Feb 2016 08:38:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Fri, 19 Feb 2016 08:38:34 -0800 (PST)
In-Reply-To: <56C74356.7040604@gmail.com>
References: <1455892784-11328-1-git-send-email-peter.maydell@linaro.org>
	<1455892784-11328-2-git-send-email-peter.maydell@linaro.org>
	<56C74356.7040604@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Feb 2016 16:38:34 +0000
Message-ID: <CAFEAcA9xH-+DS63CG5pmyVMUVETqofSFzfjzHyjMwR3hgPaEwQ@mail.gmail.com>
To: Sergey Fedorov <serge.fdrv@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::235
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-arm] [PATCH v2 1/2] target-arm: Fix handling of SDCR for
	32-bit code
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8bAv20WHgywl

On 19 February 2016 at 16:31, Sergey Fedorov <serge.fdrv@gmail.com> wrote:
> On 19.02.2016 17:39, Peter Maydell wrote:
>> +static void sdcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>> +                       uint64_t value)
>> +{
>> +    env->cp15.mdcr_el3 = value & SDCR_VALID_MASK;
>> +}
>> +
>
> Just one comment. As soon as we cannot have both of MDCR_EL3 in SDCR in
> a specific CPU configuration (EL3 is either AArch64 or AArch32), the
> RES0 bitfields of SDCR are "RES0 in all contexts". Thus we can choose
> "The bit is hardwired to 0" behaviour as we do here. We could also
> choose another behaviour "The bit can be written" and check for "EL3 is
> AArch64" case before trying to interpret those bits.

Yes, as you say we could do either (and we have examples of both in
QEMU currently, as well as examples of "we don't do either and if
the guest writes in a bit it should not it will get a feature it
shouldn't in theory have"). Masking on write seemed simpler here.

thanks
-- PMM
