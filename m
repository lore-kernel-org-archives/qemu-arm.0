Received: by 10.223.197.9 with SMTP id q9csp745435wrf;
        Thu, 5 Oct 2017 09:48:31 -0700 (PDT)
X-Received: by 10.200.34.28 with SMTP id o28mr35744297qto.184.1507222111684;
        Thu, 05 Oct 2017 09:48:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507222111; cv=none;
        d=google.com; s=arc-20160816;
        b=Mo0ckbslcrot/emN3SxNYEbGohMXVlO44sQvV4IZOmZ6JEG8obwws899rEBBSLlpE9
         87TNiXw1G92OlTwOdgAbOtugL5hpFmEpOvPP4u7OsOuyGWt+GOLUM9pceT2lcjlDM9Il
         6Aiq5i2asEHoUmtEwVFjT0/+FchngFcsOrzQLXmGsZRIORkUWhIPfofEEv7oHNBNhtyO
         yO3CtzKwe1ET63l7L6oPkmCgyp/g2ySBXwIVE9v5RF+kSDtVUdVUIW0e1rha2Ts1yBaH
         TFvpeT52zOaVSRTZ6RnAHfuVS/8ogvOdoMkD2wceO7QTSQEkcoQO264kYtVjyMV3FEnu
         enKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:dkim-signature
         :arc-authentication-results;
        bh=S4JPJsr/3Y0s2D9U0e1gsZZPNPmdppNkGXs9CmLE6I0=;
        b=KRx4Xx2AK1AngTHK92pZteJbWpDz4ZnLSG3HMBm8YU9d7K95/Aad3ymj/YQhw1L5F9
         bGHfmayPX+ar+o0NOSoNgtlInbvTnqY0PP0aLcfP2RxmVoYluSQ0WNSRuxrtW+Ew/QKg
         jUU8OkLktZZ1muKlYgMjPMulEjGdOYhfy9hGc4LAR3xfeaOa2nGK6Ma0a5o+97UTkX6L
         17KU/h+g9PB9gGWZcvtQL71yeoBy7887ZnoRhqdhh4Kr2jz7BxDuRiEoEC9yCqX6knBX
         YT18jTDAH7kEyoG/yBlBc7RQwrMZoTmSfOqDImkf/S92Ys8BbnT8oPauAiTkJT2E6jnh
         GbIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AmIUg2EM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j190si125435qkf.384.2017.10.05.09.48.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Oct 2017 09:48:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AmIUg2EM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40906 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e09K3-0006I9-5C
	for alex.bennee@linaro.org; Thu, 05 Oct 2017 12:48:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49309)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e096v-00031T-NX
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 12:34:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e096u-0004gc-Ug
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 12:34:57 -0400
Received: from mail-qt0-x234.google.com ([2607:f8b0:400d:c0d::234]:50541)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1e096u-0004gL-Q2
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 12:34:56 -0400
Received: by mail-qt0-x234.google.com with SMTP id f15so26487603qtf.7
	for <qemu-arm@nongnu.org>; Thu, 05 Oct 2017 09:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:from:to:cc:references:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=S4JPJsr/3Y0s2D9U0e1gsZZPNPmdppNkGXs9CmLE6I0=;
	b=AmIUg2EM1ZVgr2V3qWgBWhrQT27S1ilIqXfg5UI4DJI7IeARBrZmmeyl3pseKkJfaM
	BrA52yWFc/YeS65+Ki/K74BZtEWiyx+2CyITNC/nI/BOiZ88E0MZcRBMCGWxZa1Bquxr
	tUIgwfib2ss3EZhWkWK3OSA/yrd3Ys6w/ehcE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:cc:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=S4JPJsr/3Y0s2D9U0e1gsZZPNPmdppNkGXs9CmLE6I0=;
	b=JdHk3QV3PY6d8SkhJCAwYvdJymiQcQhPQ1+uRdlatztk7H27E4UC3YDRxQD2Tfh9Y8
	2NIA0Rp7fckthLdvZ69Uw4w5cw0l6qqIjCZWcMvW5/WCjeWP50MlYNzKLndpq7v/6z0v
	QTHeOmEym1rWIlaHb+m9IhxuTPELZ37waxOq0676Xgu/RG05XwtpzMyOMRr3ilUUPMEF
	O61bpOV0aU58XdXHT9pqxjOJ4ycEAaFrVc0xfYbxTYgyxUTAl3g0tXe7NZZ6LHTRFK64
	KIQnU2MAHqg8SSu0XstkdN5dpRb2bWkoerUjhrrL8zMB91S+lKx8hZ9OJkUzgm1SBjVE
	lWxg==
X-Gm-Message-State: AMCzsaV/MtibwJAHcsQvTJuiFjIBOIicQrA/8pAd3488xSJkSwIqAJ6g
	s3HTH1DXtCLtC35I2v9Hxsii8Q==
X-Google-Smtp-Source: AOwi7QD+rjIVwHTsY4PiZpcM4T+64PX6sGq+OiZaP6CM3AklZBVnxIR8fQChJl1fucY9+gDn+9HETw==
X-Received: by 10.129.60.4 with SMTP id j4mr1184758ywa.353.1507221296314;
	Thu, 05 Oct 2017 09:34:56 -0700 (PDT)
Received: from bigtime.twiddle.net ([2606:a000:7a4a:b100::1b])
	by smtp.gmail.com with ESMTPSA id
	s127sm6738034ywc.49.2017.10.05.09.34.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Oct 2017 09:34:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
	<1506092407-26985-9-git-send-email-peter.maydell@linaro.org>
	<0136d727-d125-7eed-ca13-02011cbdf921@linaro.org>
Message-ID: <4aa8a101-7de4-43d5-716a-b188a7190277@linaro.org>
Date: Thu, 5 Oct 2017 12:34:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <0136d727-d125-7eed-ca13-02011cbdf921@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::234
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 08/20] target/arm: Don't warn
 about exception return with PC low bit set for v8M
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
X-TUID: KCnqk6bET6TV

On 10/05/2017 12:32 PM, Richard Henderson wrote:
>     if (env->regs[15] & 1) {
>         if (!arm_feature(env, ARM_FEATURE_V8)) {
>             qemu_log_mask(...);
>         }
>         env->regs[15] &= ~1U;
>     }

Bah.  Even better to move the bit clear statement before the feature check.
The two loads from env->regs[15] will no longer be separated by a function call
and therefore CSEd by the compiler.


r~
