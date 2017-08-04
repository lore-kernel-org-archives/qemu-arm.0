Received: by 10.25.221.202 with SMTP id w71csp2514829lfi;
        Fri, 4 Aug 2017 13:15:31 -0700 (PDT)
X-Received: by 10.200.48.232 with SMTP id w37mr4602782qta.186.1501877731179;
        Fri, 04 Aug 2017 13:15:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501877731; cv=none;
        d=google.com; s=arc-20160816;
        b=nKR3m1j+PwtZ1/E1KuxMsY15PehzZRhBBYDGsGjgKyrDMaj2XaC3D/78+x/SYP+kEc
         9HyGZA88zTISg5eqAZ6k3g0OkQxq5XNVxQB/yCgKr5eReIG5DH301Q/w0+CYlv3b2A07
         oG+4x46Y3NaNHY1ZzMlPIiD+CbVBefDDfIgrcQ/6MSo5Ang3pNFmss7YrLlFR74gmfqw
         yMquHIEBYBsY5UdwhnCjEzpUT+oeo8WcCeR9BTyrqo5Xj82Qcx5oRQlm8YB0AbdD8dw9
         GS7hHGYWBBsJNOnvWGCAnGNFDk71GrNvKHuaMKJ0xwEefltPcRVIy39QAr8eQ5Z+Pvra
         J0yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=F/3idsBQJfZmQ4e1TAVDYMy5mVy5XCzsWE4BmSRenvM=;
        b=o66TjDP/LWQI4jVk7HDaNvWlqabx0CLsQ+/nAzHhH35DpZ9rymtq0XXqJpOpcU3SD9
         eCow0chtHiSWiws6DkTnjN9bOTBNzTfTBxPeQSVdDM9c3sH4ikg7h8n/Gn69XhVkVcsR
         HYa2EMc37wM5C1ucMngmpiHKSpoCpHfKrNNwnBaXCVcnqqXhziCldnzHZluecyWajCxI
         YS7tPwZ54uHPjlqYacQRGnV9FaWwwzOXKiRMGDts2K1asqa7ZF57Hi/CC+ApE8Awxosd
         RONTlQ01EgVb5G6FcdG/jUh/gViCY24lDe4hINImyWmU8VcSX6YZMJiCj2lsveTXPXAT
         aZRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.b=L3wwd35v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v34si2203712qte.520.2017.08.04.13.15.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Aug 2017 13:15:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.b=L3wwd35v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53750 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddj0K-0005OI-H2
	for alex.bennee@linaro.org; Fri, 04 Aug 2017 16:15:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49167)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ddj0E-0005Nv-Ro
	for qemu-arm@nongnu.org; Fri, 04 Aug 2017 16:15:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ddj09-0000v9-Pm
	for qemu-arm@nongnu.org; Fri, 04 Aug 2017 16:15:22 -0400
Received: from mail-pg0-x236.google.com ([2607:f8b0:400e:c05::236]:37138)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ddj09-0000uW-KS
	for qemu-arm@nongnu.org; Fri, 04 Aug 2017 16:15:17 -0400
Received: by mail-pg0-x236.google.com with SMTP id y129so11842142pgy.4
	for <qemu-arm@nongnu.org>; Fri, 04 Aug 2017 13:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=F/3idsBQJfZmQ4e1TAVDYMy5mVy5XCzsWE4BmSRenvM=;
	b=L3wwd35vYYxIeCX3HNmcIlm1T52yGPEOBLnfyaL0b5MRS+mTwUUJ/1K7uhOi2AH4NF
	lTV7QVaWB9m3qOxES3p+LiPV/F/Ue6p8PupwTPQVWct3pNKS5RpsYcBXSHE5r3cYeCFi
	6vjSoV8UFXbVh8fRRUkp3TfvU2Ww3sdz8dPno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=F/3idsBQJfZmQ4e1TAVDYMy5mVy5XCzsWE4BmSRenvM=;
	b=Cb0GvwKhHvC5t+RnQnTO/hLPFrdTQBC5qfTDMS21JF/z7O8kRrd1VBECsN7HAbULXr
	q4JXI+x3DCsEs7M7gxdXDmALBkzSxFcFRmq9E174GiEK2LzdmE40n9xGgvMM/czllw6U
	/BlXO0arBq5M1685P0iG9Y739eBuyDlLtd6IK0k6uUQ4dA7dtzTF0b5OWwaNAW/B06o5
	TaMOebDRsD2bC4UKOduwcvzH7dNYtfWby7ik1owncW7HLLeFefcCUzvUk7ZsSpibLyjF
	hp8Ngk1Ftok0vltbVYv1rTBD8HoWfM6zY6dFGFRSfrROh4Jnq78zqekeSlkEiuKCNyGE
	xiUA==
X-Gm-Message-State: AIVw110iKTq8gSMWtdrDGLyEAvSj+hINayPVj+g7EPkE1PS30WQtLEfy
	WCCAWynBWHkaWLDg
X-Received: by 10.84.128.106 with SMTP id 97mr4168175pla.41.1501877714998;
	Fri, 04 Aug 2017 13:15:14 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net.
	[97.126.108.236])
	by smtp.gmail.com with ESMTPSA id g7sm4181110pfj.29.2017.08.04.13.15.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Aug 2017 13:15:14 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1501867249-1924-1-git-send-email-peter.maydell@linaro.org>
	<1501867249-1924-8-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d7b74b23-2979-e3d5-0d1d-98d795ec89ee@linaro.org>
Date: Fri, 4 Aug 2017 13:15:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1501867249-1924-8-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::236
Subject: Re: [Qemu-arm] [PATCH 7/8] target/arm: Allow deliver_fault() caller
 to specify EA bit
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
X-TUID: sU8yNwJHsm3v

On 08/04/2017 10:20 AM, Peter Maydell wrote:
> For external aborts, we will want to be able to specify the EA
> (external abort type) bit in the syndrome field.  Allow callers of
> deliver_fault() to do that by adding a field to ARMMMUFaultInfo which
> we use when constructing the syndrome values.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/internals.h |  2 ++
>  target/arm/op_helper.c | 10 +++++-----
>  2 files changed, 7 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
