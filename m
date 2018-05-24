Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp2213076wre;
        Thu, 24 May 2018 12:08:18 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZo0QsfGhRET1594mDDyulB65HvgIKKIoQIXJoaVt1zHF6CSlXusUaaisJgFqtI3CHDxhnFF
X-Received: by 2002:aed:2984:: with SMTP id o4-v6mr8437535qtd.124.1527188898448;
        Thu, 24 May 2018 12:08:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527188898; cv=none;
        d=google.com; s=arc-20160816;
        b=H5/Li5veNYU/2rhtQEa2cQZvFj85Te4tNWLRkV0PdXI0hEKn+vB/unD7bOfdJJc4Zg
         s/mXOZQG5MXHQjxLPkuF4ZRo6DhmpkrU0AkWNzKhXZfPTdz5s4cjRCwat7mk5r5Iflsu
         NRpsx+rBs+012WJMIHCRjiSQRC6FC2wIkydWV5Ft3O/3e0q/nmBKAByHDobaP9wsd5Kj
         fjLt94KTqEnuwlcsf2d0jY7RsFAG+5VzDqthPhOa+VdkqPmifAT/jZ4LhXKoLupPBmXw
         7mN5eF+duAAv59OL/4Lqa8Uu1yIaRG7ZMIebnPxAU3+RbBprdleEFsRzFZdpoGakaS6z
         oIjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=05EMgghWkxKMW9/xzkgQcHic/YSus+EXEP1KumZ9QOY=;
        b=aYPhgvGoMP6x1RItesRkQz4JXRDYAUkF6qU7OoyWWX7cM1fDiORuj5+15YBWfRyIRY
         A1/yZgYkyncKCswu+HbNrrlGl5fuluFKg+o48EPg3oGXOixoaHuF8hlRhHTRk0vtVYIl
         EyZBDMiVMksKScwe7MRhEAMD9/yBPT4m1/HRcTl7mwsljoSrV0PbZCxR8+rh1jDwUXEw
         /E1nPKchdEvfkcvVopluKR6LHcZ6vynVwkO0vUbFiGmQ48fi6a8XlesiV98Vh7ohWXWA
         O47GYxTh7dTzrTKxijF/CmFW6CAAGnfMSs52JakJ35jh5qQlKaHzyARc25pQcN/VM+GF
         49vw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QG+SNrmc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 21-v6si451989qvr.123.2018.05.24.12.08.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 May 2018 12:08:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QG+SNrmc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40318 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fLvaz-0001GS-Mo
	for alex.bennee@linaro.org; Thu, 24 May 2018 15:08:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44874)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fLvak-0001GA-U2
	for qemu-arm@nongnu.org; Thu, 24 May 2018 15:08:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fLvag-0000YR-U9
	for qemu-arm@nongnu.org; Thu, 24 May 2018 15:08:02 -0400
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:34065)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fLvag-0000Y6-Oq
	for qemu-arm@nongnu.org; Thu, 24 May 2018 15:07:58 -0400
Received: by mail-pg0-x242.google.com with SMTP id k2-v6so1200586pgc.1
	for <qemu-arm@nongnu.org>; Thu, 24 May 2018 12:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=05EMgghWkxKMW9/xzkgQcHic/YSus+EXEP1KumZ9QOY=;
	b=QG+SNrmcHaeTBY4WRGskgB9B54HEUo5HUDxZIWloXMb2vu1O4x/2UETWkbbR8xXuTH
	I67sLoZxbsLTQDJvp1Y65/ehUfo9bk/+SRWq73VhiZc+BVqeM+Euo8WR5Z53SN5PdnJr
	ZGvmCYVhhQL0eQ06ep70tcnBc70gNAghNywcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=05EMgghWkxKMW9/xzkgQcHic/YSus+EXEP1KumZ9QOY=;
	b=qnaA8REVs2PDWBLxGcqOmqO/WoJzFsu4s5NPvyljrgYjCMjGrhCXHD3sr9pCxoObWg
	id8zOCzSeN/MMJmnenDW+Zk7Li2QMDzVtCGg18sGedwm9vFE8Gy0yhdW/ZhPLgR3Fk/c
	mrh1FOFqwbSOw3RvVfLyIai+vkVmFQb3qcyft92qskWVcKIUu8BZ8VmrdHIiFPbl2klo
	VJ5Wsw81UjKMQMxpBTsBYbIwBicxqpzBo7iDlFG4e8oscjS50lK5wsRWkMcSYba40Vxm
	FpS+GosGX7sHWvW6fb4Yci12XBNBoHwhqgm+jOFTNErVC+ck7QA/dOSHnC3yHo0voT/p
	/wMg==
X-Gm-Message-State: ALKqPwdDbJWGVY5RqaDq8U7XOInN2/eVRCvZruSSbRwizbppqG/NApaC
	GEwQdeK9cA1E/kfLN66cnwlEkONZ6wQ=
X-Received: by 2002:a62:6c87:: with SMTP id
	h129-v6mr8481629pfc.179.1527188877250; 
	Thu, 24 May 2018 12:07:57 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	v14-v6sm34944504pfn.105.2018.05.24.12.07.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 May 2018 12:07:56 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180522175629.24932-1-richard.henderson@linaro.org>
	<CAFEAcA_-tuEXm0gGNkzs0xb2Rm90Nm_t2i3pYJRULay08h_FLg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <5b2649f6-a26b-17e9-ed26-bb1e66f8a7b8@linaro.org>
Date: Thu, 24 May 2018 12:07:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_-tuEXm0gGNkzs0xb2Rm90Nm_t2i3pYJRULay08h_FLg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::242
Subject: Re: [Qemu-arm] [PATCH] tcg: Fix helper function vs host abi for
 float16
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uUrwaUxje5xU

On 05/24/2018 06:21 AM, Peter Maydell wrote:
> Applied to target-arm.next, thanks. Is it worth marking this as
> cc:stable?

Probably, since we've marked most of the other f16 patches for stable.


r~
