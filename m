Received: by 10.182.158.201 with SMTP id ww9csp542742obb;
        Fri, 20 Nov 2015 07:21:29 -0800 (PST)
X-Received: by 10.13.194.66 with SMTP id e63mr13711305ywd.135.1448032889256;
        Fri, 20 Nov 2015 07:21:29 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id x128si35168ywa.89.2015.11.20.07.21.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 20 Nov 2015 07:21:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro-org.20150623.gappssmtp.com
Received: from localhost ([::1]:48043 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZznVA-00052x-SC
	for alex.bennee@linaro.org; Fri, 20 Nov 2015 10:21:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41850)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZznUS-00045d-MC
	for qemu-devel@nongnu.org; Fri, 20 Nov 2015 10:20:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZznUN-0007k4-0R
	for qemu-devel@nongnu.org; Fri, 20 Nov 2015 10:20:44 -0500
Received: from mail-yk0-x22e.google.com ([2607:f8b0:4002:c07::22e]:33626)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZznUM-0007jw-S1
	for qemu-devel@nongnu.org; Fri, 20 Nov 2015 10:20:38 -0500
Received: by ykdv3 with SMTP id v3so167021308ykd.0
	for <qemu-devel@nongnu.org>; Fri, 20 Nov 2015 07:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro-org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=I9jOxd9Of2KC62mKy6Oqe475tV4bSdgxrfUQYqOvLgg=;
	b=d8Th0e4weWnsGoBPUj/PDtO5Ud9UcP2VOM1/jKJapd5c36/kSxOUwVsWvSmm2fmZAF
	y4ozJ4sHSBiboS0+TW0bV5fnBwT0xT5HTiw6vd7YkjIVZuhq0py0qfpEZ88yR0H+qkjl
	k0z24zYISVIYQn5llyjMpENeD2qTNoZCJV1c0afd7n7a7xsi5GYk/tajltOo5Q/arbIA
	2js/hAzS6ya0n11EezhYnIHF0GRJVTMBoulmrJG1kvet/nv5YW9zjOPSX5fTn2pcap0S
	Li4Y9KYRRY1mkXzpYvVrmsq19ud0jvGUuANAPUgdD8XQ5fA18n8Fu/djEZKaZEoZkh0q
	i6dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=I9jOxd9Of2KC62mKy6Oqe475tV4bSdgxrfUQYqOvLgg=;
	b=XW4YT/fG1Y21oQynbqU8zHUppjI3/EO24tzGb/7qeNG1lFdZD8pTm0u7+Ju+4X2pIP
	GCe4fs0DD5QY4v8Pp9YxVylhRPe91hq8MDanVxbwVgav9qsVFw8JgYNnLHqwAizyUaUL
	FMDjGxNUlNJlTaOeHniCmNQnn/jCUJN6xD4MCg72PTZ5tEG0TInRsUKIf8Xv9afH9Pp/
	nOiQSrH4BLm1XB99RrL511kFpPfbbjBfyLaWYZs14OSprykIi66pZHz2ADcjPK2zHAeJ
	yEYMvRimthTuTvW4vqQvQY2pmfthKjqT2bSRyw6/qsA75Dwzs5pVGt1wura+x+EtKmfT
	3tIw==
X-Gm-Message-State: ALoCoQmiUGoxkv6OMNsIrEBJbjsfs1OczQXmMezvefNU1vMPD9svwLX9tjsPVamZxEPAsjEWymsK
X-Received: by 10.129.110.70 with SMTP id j67mr15089108ywc.180.1448032828437; 
	Fri, 20 Nov 2015 07:20:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Fri, 20 Nov 2015 07:20:09 -0800 (PST)
In-Reply-To: <CABoDooP4ya0uG_1C7Ux65CQP3JsQQO68fPJkdihXVbxGWHei5g@mail.gmail.com>
References: <1448029971-9875-1-git-send-email-peter.maydell@linaro.org>
	<CABoDooP4ya0uG_1C7Ux65CQP3JsQQO68fPJkdihXVbxGWHei5g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Nov 2015 15:20:09 +0000
Message-ID: <CAFEAcA_tbHjcOFGNSetXhRMdH9P_tSyrAji83wXyG7th_0HRaQ@mail.gmail.com>
To: Laurent Desnogues <laurent.desnogues@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4002:c07::22e
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-devel] [PATCH for-2.5] target-arm: Don't mask out bits
 [47:40] in LPAE descriptors for v8
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: YNIEuTGLpf3B

On 20 November 2015 at 15:18, Laurent Desnogues
<laurent.desnogues@gmail.com> wrote:
> Hello,
>
> On Fri, Nov 20, 2015 at 3:32 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> In an LPAE format descriptor in ARMv8 the address field extends
>> up to bit 47, not just bit 39. Correct the masking so we don't
>> give incorrect results if the output address size is greater
>> than 40 bits, as it can be for AArch64.
>>
>> (Note that we don't yet support the new-in-v8 Address Size fault which
>> should be generated if any translation table entry or TTBR contains
>> an address with non-zero bits above the most significant bit of the
>> maximum output address size.)
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

>> +    /* The address field in the descriptor goes up to bit 39 for ARMv7
>> +     * but up to bit 47 for ARMv8.
>> +     */
>> +    if (arm_feature(env, ARM_FEATURE_V8)) {
>> +        descaddrmask = 0xfffffffff000ULL;
>> +    } else {
>> +        descaddrmask = 0xfffffff000ULL;
>> +    }
>
> My understanding is that 48 bits are used if you are running AArch64
> code, and 40 bits are used for 32-bit code even on an ARMv8 CPU, so
> checking for ARM_FEATURE_V8 is perhaps not enough.

For v8 32-bit code the usable address width is only 40 bits, but
setting a bit in [47:40] causes an AddressSize fault on v8 (but not
v7). So the mask should be 48 bits for v8 regardless of 32-vs-64,
and when we support AddressSize faults we'll then check the upper
bits of the masked-out address and raise a fault if needed.

thanks
-- PMM
