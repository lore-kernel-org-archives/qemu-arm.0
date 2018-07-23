Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp5792145wru;
        Mon, 23 Jul 2018 08:40:02 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfqxnppnu0fx7C/Cu+NO4wWio+XGWKfXJYImL5Ox1ONImgzitmltMlT2c4qDAX3jQ1Sjoxp
X-Received: by 2002:a37:a18d:: with SMTP id k135-v6mr11367228qke.203.1532360402565;
        Mon, 23 Jul 2018 08:40:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532360402; cv=none;
        d=google.com; s=arc-20160816;
        b=i4K3CRJ0nd5Y+FQRTd15VvTc32wiZmCsjkl7lMpgy02xwq5K68Aip9xVW2XXXoO1IW
         LMSGQiaVzTALmhnirx4OYH39ZbYUyMbhKSb3MXvZmvlhez8Ip/ds9XEafs1+7SJ07wFM
         r+giivGYYV1qEPH82WzlH0AL01Gp4G9UtVqlvRyqiuANRTOuexj6dcRUK/UhzkV43qWP
         Z4mERC89Kn362MR3L9FkhJvQ1TygJutBKhyD8F2wnYPRK5WC4yJAqX1DolcAqkRHG5GX
         s3ObD3tRoQSYHGT6hGFe5qeP3RTpoMVHmrdlK/npW+jQ3lJaPJ1YFnMJFU0RMX5F36rK
         6p2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=7UPMdzK1gqqDkX4rzXuMaqRLz+DxxhoUFuHDdh5mUdA=;
        b=r+nvH5RknL2j3DwxfDqGDW45eCtirC43/K/TbreEZXuGMgE5hCTblx5Lh3rF05jPZL
         wRq5PuagpUhDrP9VVM7tc49nwlPhNhOX9DTcLr50uJnU4+uD7dEo/S4oBXa7qwGv06Oo
         7LYxq2bPdqNSt9a0zzFmX40OG5u/rWjRbndrfHH/XetonvYCxvVmCOX716pVDuoYABl8
         54KEU96FDKsbKLBsppLFdbNvTCnq28/8B74tTY6oRdx3CIrPmMqEtInu82/M5RCb41eL
         iVLepzGNxegUKQ3eoN3MXnhsj6QQVhIMUZBjUxAYRAgbBnwyRyDc2BsmyRnSWHm6E52w
         DApQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="ILEB/tYY";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z89-v6si734314qvz.121.2018.07.23.08.40.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Jul 2018 08:40:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="ILEB/tYY";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35196 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fhcwM-0007Ij-54
	for alex.bennee@linaro.org; Mon, 23 Jul 2018 11:40:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59484)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fhcwC-0007II-Ty
	for qemu-arm@nongnu.org; Mon, 23 Jul 2018 11:39:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fhcwB-00073z-LQ
	for qemu-arm@nongnu.org; Mon, 23 Jul 2018 11:39:52 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:45654)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fhcwB-000733-EU
	for qemu-arm@nongnu.org; Mon, 23 Jul 2018 11:39:51 -0400
Received: by mail-pg1-x542.google.com with SMTP id f1-v6so642709pgq.12
	for <qemu-arm@nongnu.org>; Mon, 23 Jul 2018 08:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=7UPMdzK1gqqDkX4rzXuMaqRLz+DxxhoUFuHDdh5mUdA=;
	b=ILEB/tYYsgWb+KKmy8wvrbunEEe4OWmo3H7QrcNu+9b5AmQ4hAKLVqBMg78pcgdgqb
	UVAy4AlsyHzeeAiZ3+mdlwmAtKRW7yd3aL3v4YDhRBGY6HQmPU+Xb3uiw+IJYWFzPRnS
	nro8RJ04ETwYthb77oozHLcIW0xq4RTRp3F+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=7UPMdzK1gqqDkX4rzXuMaqRLz+DxxhoUFuHDdh5mUdA=;
	b=R+/yE84hprhpB2QMONMXUnArjcOqeQ3pxJIcz1opBDMoR5LepQ5wr7HeORouZUTRKG
	7HE/UHSnvJoBEGMYWlCVMBQ024dg7HVMGE8BwUNGkdBRvjmobeyqYD8dKADUJqWzRBJj
	N/2Dhrpj/FXOLfwSWNrSFM9o3d/9tooT0ZxFTxtFvFCc7pD9sMLPVYXnnvoR2/hqhZWK
	mBpvjJ8GSXRcly4X8YCBuDr8plJflVmPLXD6zE9lUD3mBBouv4RNI3rMrtEynrdApgAb
	p1IZ1UD37yOhneGupu84ZCdmSWycFdSoBemK1kCPwh+R2TaooJsKuJu2smFRDiq4Vzbh
	YKfw==
X-Gm-Message-State: AOUpUlGixwwVpPz4z+/0ApHGFqtVlJhBtuT40fSgWxqh/Snv2cloTJsM
	Ra1XUb8Dm671zUjflZeeGbBGBFS53HA=
X-Received: by 2002:a62:4ece:: with SMTP id
	c197-v6mr2857683pfb.240.1532360390189; 
	Mon, 23 Jul 2018 08:39:50 -0700 (PDT)
Received: from cloudburst.twiddle.net ([2601:1c0:6100:a92d::e452])
	by smtp.gmail.com with ESMTPSA id
	r23-v6sm10110332pfj.5.2018.07.23.08.39.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Jul 2018 08:39:49 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180723123457.2038-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <d7a3bca9-381b-abfc-38a2-78a7fe564c90@linaro.org>
Date: Mon, 23 Jul 2018 08:39:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180723123457.2038-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] target/arm: Escalate to correct
 HardFault when AIRCR.BFHFNMINS is set
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
X-TUID: egtPtz+Lwarx

On 07/23/2018 05:34 AM, Peter Maydell wrote:
> When we escalate a v8M exception to HardFault, if AIRCR.BFHFNMINNS is
> set then we need to decide whether it should become a secure HardFault
> or a nonsecure HardFault. We should always escalate to the same
> target security state as the original exception. The current code
> tries to test this using the 'secure' bool, which is not right because
> that flag indicates whether the target security state only for
> banked exceptions; the effect was that we were incorrectly escalating
> always-secure exceptions like SecureFault to a nonsecure HardFault.
> 
> Fix this by defining, logging and using a new 'targets_secure' bool
> which tracks the condition we actually want.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/armv7m_nvic.c | 8 ++++++--
>  hw/intc/trace-events  | 2 +-
>  2 files changed, 7 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
