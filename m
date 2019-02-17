Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp1521583wrx;
        Sun, 17 Feb 2019 10:02:07 -0800 (PST)
X-Google-Smtp-Source: AHgI3Iaj9KAjP/MI+uG0g3WqSm7eLPc/JAPNVb2PxV1pYd6S6ochwuIgwfKy6XKZT4pUbPqVOM64
X-Received: by 2002:a25:c087:: with SMTP id c129mr16626190ybf.320.1550426527028;
        Sun, 17 Feb 2019 10:02:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550426527; cv=none;
        d=google.com; s=arc-20160816;
        b=a7XltkXgO0LiwqMdIlfJxVx0K2W+Fe6LmhpqEOQUwcjaEAWCR6mSdA2cnDQwdMXPNw
         R8TjfgN9CmyjMTmagfBl5XFbp3sE4bfnDqZyM4nz5NKjiJ+spUpkRN4cwdEpRRwuJm2n
         LNkVmUeGe0XrQOm87EYfJwOpQpJ9qe/MRAxkh6RmS8Rn5PyP7edmFS2nB5lMhvnW2FaL
         9MVAZJC4T036oMVqb2D0Y2f9fafe3V1dpvqj3Ii11AevFF69t4UIJUpaSyNut4eRg0iw
         azKyX8AiwyracviYCMGch0mLoeYrrxcQ2goNWRZqGSMtKEhZlv3aTM/KpIcHH9plJgwl
         kbvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=8iyXxWBw5cVnSqKV52Fs2sAfqePPrzRa5cDdlS1RQlo=;
        b=ixb6SZAC77Wx+NuZlBq/9zuQzfK4h1s9ZmNgTjXtvE7BLJkmA95CyVl+II9Ibmv419
         1k6jyBAJmcoMgtTUUoxqg38M+FxIeYbyO2Y6nCSQ6+n60bZ2sw3bxzJ6cdpj9L5sMuGL
         uVxDPUjMta+2YWTBnuV+2oLaVrp7EI86vS9s56gVQPbX0BogPE3yht1HrjOOZmg1+tyx
         G2/BPCO+hLZnQsKVl6p5KCL9/JMma+9D+7APU38njXRYIW/qPp4zwfsFC0zKjt0Pz/0A
         +MJeMkPJ6dWdmBJaw46PgDxqYpCPFaTVeoCqgj3mqZntqiqgKjaregIam11BCbp3L6gn
         yWjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IkJaNPbs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h7si6668830ybi.340.2019.02.17.10.02.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 17 Feb 2019 10:02:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IkJaNPbs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:44722 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gvQlS-0000PD-Gq
	for alex.bennee@linaro.org; Sun, 17 Feb 2019 13:02:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52284)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gvQlB-0000NW-8j
	for qemu-arm@nongnu.org; Sun, 17 Feb 2019 13:01:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gvQl5-0006Fz-Sl
	for qemu-arm@nongnu.org; Sun, 17 Feb 2019 13:01:46 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:42232)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gvQl1-000647-B1
	for qemu-arm@nongnu.org; Sun, 17 Feb 2019 13:01:39 -0500
Received: by mail-pf1-x444.google.com with SMTP id n74so7345459pfi.9
	for <qemu-arm@nongnu.org>; Sun, 17 Feb 2019 10:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=8iyXxWBw5cVnSqKV52Fs2sAfqePPrzRa5cDdlS1RQlo=;
	b=IkJaNPbsDIzyMpN/dmnu3DIHT4oh3MQlSh0Z6x7q3CCHUYRr5E5q2zlnR6mvtn1P2f
	da/P482hTJkOIpNy7U7JWXvER9wNOGRouprD8awYnSr6uPx+7UAeEImHDok0f3OE3o9T
	zNmZlo54JfVhi91QuTON1gTMWrqU14xEm5dN3/7PH6oR3Pc9nax0xq9NXIwJ5S/LLefJ
	/NQPGeC72/UkeBI3Fx6EpfaBJIrW1F8VnvclFpl/uydfDCqj4Ktp40uxz9J8OCgsLHTQ
	bmwheCbhmzUTmiOxTsQyU+wjedCtO8k0gki8hDjkNPDdX87wWNdmzrtRbrb7JpY80oiZ
	Wd8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=8iyXxWBw5cVnSqKV52Fs2sAfqePPrzRa5cDdlS1RQlo=;
	b=ipPzp7ba0+05AC9sRL96h+DxTppHhvHzogs1936UQsKNjnxufNLyOQbxdkpcil10vO
	jLfer+v4/XgSE+YLmB+D/PoebP0gOzuge5Nf3y5hFB1fG0KqsXa6gjCBzmgzxKjt1DYW
	cdYG6Ct7Idwked+Z7CSCuwhFKkxhUBnbYfEe6LiHXZRIF8p95PhxK/KKWv6FRIaq4AGd
	ZHlYHQ3dA7oLAnk7PYgCzzR+CwoGbU0oF8McgTwLlR+QHYacNiyrjTfYsAHpU/gXP850
	k6cdgpX4wQJei0bHVA0RqEtNkpH8//WssU3DzEnziEyx5Q8bFH3lVgixEcIa/r0QbCXQ
	m7BA==
X-Gm-Message-State: AHQUAuZSlvZqvuLgwS/k4iGGIJDxBIGpjipfsyKLPKwUSlHAcCiz+FHA
	4OVgsGoG7WIHlLA1hbT/0CAOL0EMUb8=
X-Received: by 2002:a63:d80b:: with SMTP id b11mr15048656pgh.168.1550426485851;
	Sun, 17 Feb 2019 10:01:25 -0800 (PST)
Received: from cloudburst.twiddle.net ([47.39.62.139])
	by smtp.gmail.com with ESMTPSA id
	z18sm12938712pfl.164.2019.02.17.10.01.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Feb 2019 10:01:24 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190214125107.22178-1-peter.maydell@linaro.org>
	<20190214125107.22178-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <2ef73e98-579f-061b-9d70-54a5b03c54a7@linaro.org>
Date: Sun, 17 Feb 2019 10:01:20 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190214125107.22178-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 08/14] hw/arm/armsse: Document
 SRAM_ADDR_WIDTH property in header comment
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
X-TUID: GqjJ/BwV1rOS

On 2/14/19 4:51 AM, Peter Maydell wrote:
> In commit 4b635cf7a95e501211 we added a QOM property to the ARMSSE
> object, but forgot to add it to the documentation comment in the
> header. Correct the omission.
> 
> Fixes: 4b635cf7a95e501211 ("hw/arm/armsse: Make SRAM bank size configurable")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/arm/armsse.h | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

