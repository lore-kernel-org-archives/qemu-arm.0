Received: by 10.223.188.70 with SMTP id a6csp6169003wrh;
        Tue, 29 Aug 2017 09:07:00 -0700 (PDT)
X-Received: by 10.237.62.92 with SMTP id m28mr6185134qtf.235.1504022820182;
        Tue, 29 Aug 2017 09:07:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504022820; cv=none;
        d=google.com; s=arc-20160816;
        b=arlbJ0rTRTaVTnqJACcx3mA71O3uDqjdK+f1pBmriMRin7uRlW27okx7lvq3dZfwpD
         JCUUNjnbyTz7LzQ9e0Va+//kq1RkzJ+4M8WW9wkmqcnYQkQAjnq5rpOiNMxpETrb77T5
         oxZTR34nOrZ6R1+bxgtPyB/W1PesjpphwKt6Mv4K28E/X3H8SnCn61l7Frfe/YrtJP4k
         ocwBo6zULSVEnC8hUkrGIC+zTLxFi710dORj3MJ4tiwxEZZ8jLOEYVjGIt6QwVZzQHuc
         EXhEvK32kGK4UGeT2CaEiYFYMRYNSdfP8t5LhBGhdHKK+1vj/+txX5iunKX6aE7eP6UY
         /3kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=2YSs96hyE/cSGrv8tdW7tSR0G1tV2O/iJpjE6YSPDqE=;
        b=Bll9uYtixPHnT1bKN+EQ8OmuKIrXzaJzVjlOzKRjp4MUt8dVbwdXVnfh0nZXH2S+ip
         sqbZGtKmsQFy/lGpV7+ZEJtooZvWqSZdqfUhgIMgO2oZe157tRIEElvSzFsQVXr7sF+0
         SxygLkVWYJ3xH7WsiI4Bdla3Yxnclwn3NfoglZlmmC50PPkRg0WtvGwvOpvKiWIOAymh
         74k6QB3ZRks6NZF4xBUi73GAI8aVwsHHn+u8tAvA2izAR0zNAaFK5x66OkAGUSK+0IAK
         LcJyeKHP3li6rTI8RqoBjNLOKhDqX+2X56bO9Tg/6PDLwFPZ/GMcC/nTNneV7tEdbLK1
         JyGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cGHSMXw/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f22si3221855qke.5.2017.08.29.09.06.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Aug 2017 09:07:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cGHSMXw/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45837 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dmj2X-0000wa-AS
	for alex.bennee@linaro.org; Tue, 29 Aug 2017 12:06:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58697)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dmiyh-00067x-5r
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 12:03:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dmiye-0001ER-2k
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 12:02:59 -0400
Received: from mail-pf0-x236.google.com ([2607:f8b0:400e:c00::236]:36266)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dmiyd-0001DX-Sg
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 12:02:55 -0400
Received: by mail-pf0-x236.google.com with SMTP id z87so11426224pfi.3
	for <qemu-arm@nongnu.org>; Tue, 29 Aug 2017 09:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=2YSs96hyE/cSGrv8tdW7tSR0G1tV2O/iJpjE6YSPDqE=;
	b=cGHSMXw/oqNc2J1FSF2CUrm+uPTPPBWeC8WQW2tjn64jj/mvtoTAWgE51J9uzXTSRt
	aEyG8n7mcRy0mhZoPNkmEKFNzVVDe6WAeD3IN0gLdc0THu1tEr+WMWQNolL2PTgAfr3O
	q8nLbZfU/xJBe0KUbPxNdiqBpH4P+m+8F+nSQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=2YSs96hyE/cSGrv8tdW7tSR0G1tV2O/iJpjE6YSPDqE=;
	b=cCoR5r77E5jq4ITzot7slrNqMRj4zqlL13BNZOd8Hu5WDOEhDLkEEC2JlLO1mfH1YU
	0ZLGlcHckUT92gXkckisSRfV1IxLtlAZN12YCMSoHOsh2dOonLFuQNrpxxNH7e3XTOBq
	RJK6mD7gVNrEzxJ6COwOQSWXnVaI5WZ+xS3xUG9gVTqjTW9LIOqsYW9ijOP+QLFis3mu
	TfXIhp4zdx1Yi1T9+FCx1AWbZNU12x245ekxCos/+nXFFbZqDWvB9t3dNHyYHxVEHgnN
	zuyviZo49TNC0xRbtdU2s1g/OW+IN9TmFzhDgL6CRJiyweDOYUwT7Upm2RpxU2uz7sI0
	AlUg==
X-Gm-Message-State: AHYfb5jmPrRLMaQkizHD48U+AIKoUBb7238/mxYLg4AAa1G2P+IdVCIe
	1abxPsBBAtFOvJz0
X-Received: by 10.84.216.92 with SMTP id f28mr996104plj.255.1504022574778;
	Tue, 29 Aug 2017 09:02:54 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net.
	[97.126.108.236])
	by smtp.gmail.com with ESMTPSA id p5sm3726339pgn.91.2017.08.29.09.02.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Aug 2017 09:02:53 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
	<1503414539-28762-13-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f7aa0654-40cb-bef7-3963-d84c5ced9d21@linaro.org>
Date: Tue, 29 Aug 2017 09:02:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1503414539-28762-13-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::236
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 12/20] target/arm: Make
 MPU_MAIR0, MPU_MAIR1 registers banked for v8M
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
X-TUID: LojUyICaXZRO

On 08/22/2017 08:08 AM, Peter Maydell wrote:
> Make the MPU registers MPU_MAIR0 and MPU_MAIR1 banked if v8M security
> extensions are enabled.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h      | 4 ++--
>  hw/intc/armv7m_nvic.c | 8 ++++----
>  target/arm/cpu.c      | 4 ++--
>  target/arm/machine.c  | 6 ++++--
>  4 files changed, 12 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

