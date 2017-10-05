Received: by 10.223.197.9 with SMTP id q9csp858758wrf;
        Thu, 5 Oct 2017 11:58:27 -0700 (PDT)
X-Received: by 10.200.51.163 with SMTP id c32mr13094284qtb.212.1507229907359;
        Thu, 05 Oct 2017 11:58:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507229907; cv=none;
        d=google.com; s=arc-20160816;
        b=waDvjvvruE06dpsqGgKi65DmAeYK4eDDetMkjCg8E8xYor4xGrHOoZwfLabjOtm2Mc
         khjG12W5/oVmvwxhVPJIVYQjrHsNx62pB0UIyIE6I3vVK2mOLRXs1TA9GRPTOBUIlqN2
         7JEd4v7NlCbhvhdowMHsARs6Fs+CiV3aTJeOjyeQuFxx9SisJhc2WkdiPb9znskXyjwT
         J1st4WE7p7zP/ICI9l6aeO9bfrMxICAW32QsLUIVtxwxFsWVfApnjuYze/UfFdIollgl
         wSXKTlloscCokW7V8rOsCqHzk4W8AwMPn+XObeO4kmMgDTZGJ1ncmkUao75dtkzSXrIq
         wpag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=VxQ5h7Z62FM3zcw7/x6JJMkZgaOypQSZj6tBXPlZH2E=;
        b=RMRrQGgYQbl6rr4aikaPpgBhhkZijkXrl2Byoo1UGVkBdhnbsJvDrEGgfXbnLUAJV9
         JEu89PsHcZN66A0QcpvHLAJRYaMDgysA4hRx43Jo4OxdBlgZ+hWTZ2eeLA0m5uRA7+eD
         8U6Ab4HofZR5T9PSeLmnPLdXsM6QYPxKdNKmTUWhL7SaRfUVoJKdsLbgPrC6RcMYm60g
         jNwiW9O57yfBOy/FvH6lnOBoNRDr9Uh8YRzp0VNRkSu9xU6jntyvjMu0uT7n3xa0qdoA
         WSj+9BvtsYimnlpC6fKtYGZDEnhOX1H4FykAsCRziM1DEiat+G8zOJjtuAgDZlVELZVf
         4CKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Em0ttd5T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i21si582969qti.429.2017.10.05.11.58.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Oct 2017 11:58:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Em0ttd5T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41627 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e0BLm-0005HC-RZ
	for alex.bennee@linaro.org; Thu, 05 Oct 2017 14:58:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50865)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e0BKa-0004RS-R9
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 14:57:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e0BKa-0005cl-3e
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 14:57:12 -0400
Received: from mail-qt0-x236.google.com ([2607:f8b0:400d:c0d::236]:49596)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1e0BKZ-0005cI-VB
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 14:57:12 -0400
Received: by mail-qt0-x236.google.com with SMTP id o3so27302180qte.6
	for <qemu-arm@nongnu.org>; Thu, 05 Oct 2017 11:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=VxQ5h7Z62FM3zcw7/x6JJMkZgaOypQSZj6tBXPlZH2E=;
	b=Em0ttd5TBgjRRoYSaE5YXGev8D2CmGqQRYJb6xHR2DR2qitufZsRTO5g2126+eWUu5
	q974cfXb/isrx0pTC7Zzj54PzbVqV6EJMwcLXz1ReKYGh8MEqs74f8Fknq83OwKRhZlz
	uXk+38ezvM7pn1gtS050iROsSYz0FaPkTsmRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=VxQ5h7Z62FM3zcw7/x6JJMkZgaOypQSZj6tBXPlZH2E=;
	b=aoC2wQIkcy/Y6e7JkqqoYPjFejLDBBrN6TrfSOTasqehHy3eBlT6VRhg4Anvt+Uq0T
	9Ts53xq/Unu8fau5M/uVqM3MLzoEtc6gKF6ntDJIIuZJnak8TTvplJ7Ugh4aG1Tdnxkw
	jEWZMLVPVfa9bx5upPz3gLKqRJirQ3hi1uDgrwtMqwqNc/uIIDqG6DawK5G03teK+m8p
	tu+h421ZsW2TRQSGhxiWe/JMCqiqeY2FZrNejFdn+c0u1yvK3cXBcuQMcyhgjDY03wbR
	zHlgRP8gL0B44opURS/VZ5bO7o6nPOjR6PA7ZgZtj/IIlfuc1S5ReTVnv2qXlSKMSjJg
	Da/A==
X-Gm-Message-State: AMCzsaXtLLDRj9Ne3Wn809HMs2eUY4ATzhHsL3LtrrB/o/K3QUZzBlLm
	2FxbsD5UAzSWXS9/hcJ9pLyB2w==
X-Google-Smtp-Source: AOwi7QDN+jQv3+E71ao2zoUdbIMbczenJc/3Nm3tPpLK4NKZcR5h+hwNOkw0wXz9EXJXbljJ1pntww==
X-Received: by 10.37.65.148 with SMTP id o142mr7475233yba.275.1507229831331;
	Thu, 05 Oct 2017 11:57:11 -0700 (PDT)
Received: from bigtime.twiddle.net ([2606:a000:7a4a:b100::1b])
	by smtp.gmail.com with ESMTPSA id
	s187sm9032034yws.55.2017.10.05.11.57.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Oct 2017 11:57:10 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
	<1506092407-26985-18-git-send-email-peter.maydell@linaro.org>
	<cd16f792-28a0-95b8-6a68-73f1427e6d38@linaro.org>
	<CAFEAcA8y8f27o=c_Cpox8KZWGZshER5PrztorPZUf+RFnAHrAg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f02972aa-e79c-e40c-c679-d1438f4b5308@linaro.org>
Date: Thu, 5 Oct 2017 14:57:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8y8f27o=c_Cpox8KZWGZshER5PrztorPZUf+RFnAHrAg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::236
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 17/20] target/arm: Implement SG
 instruction
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: L9uca/VAPHb9

On 10/05/2017 02:55 PM, Peter Maydell wrote:
> Oops. I missed this in my testing because it happens that the
> two halves of an SG instruction are the same value :-)

Hah.  I didn't notice that either.


r~
