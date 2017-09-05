Received: by 10.223.172.38 with SMTP id v35csp1596000wrc;
        Tue, 5 Sep 2017 09:08:12 -0700 (PDT)
X-Received: by 10.55.141.66 with SMTP id p63mr5888154qkd.210.1504627692494;
        Tue, 05 Sep 2017 09:08:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504627692; cv=none;
        d=google.com; s=arc-20160816;
        b=xQh53TpizkC3GYqcSaUX0AEqz1czSJ3TiGPcuyNyovq0vrr72N8n8poQ6nmG3vdeT3
         b/qXUD3k6oU1I4fg3+CLGnCifCvlN4YZLE9YP1Eam6kkMQFMt4VfLz0I8G530zhRDgmo
         Uu/R5HlKl33NnVVF7nVO2Dw5aIL0R+DeRqoQs4+sJBuDE1k5ADb+WhJTZqGnan3WGvFG
         oqtRNw4+4ioLWUHUf5ncx00gWCO5ToB3roe39JjzKvqyz2FKg8wk1Kcs7Aq8UFJkKdMU
         XFJomljPy+C1cvAvfp2ZTImFGqdbKS3aBg8rba7XmERyPR0lWow8QJxYHWbnieEoB5ML
         6TkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=PKdD1jGIITuO7Gu00eCSxbwSkPLhu2+a+IB/zCPBLLc=;
        b=QJnm4MQgkTM7ObnPJi7gtEp6Dmxhi+1NprmbF/w6sTiPAAUdO6bVn55228OERa0jVl
         FCl1hgKAwilmbv1TjjoWXYsRRId1lYP/63gcd5L9Q+d3z2ewfm6t4hFpdm5onJvmBLEQ
         YG5istKYQQpJhxfc3PY19eG7mKpY3lefqJAUOmrV9SeqHfRcUpe549g51O23LHvlWwR9
         8DNY7SEQPyumfAWu0+j0qs1HOoxtykDXlUH/B+pZSin3flCbf1rz9WxxVBLwTpwJMUzz
         wAsAI0kPgKXerQwiqzX2FC2ido9j05aKUofIuvDx4hX2IK3aFc23YaG28ikYSD/jVpJc
         tAJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bhB3SzqC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o6si549715qtf.222.2017.09.05.09.08.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Sep 2017 09:08:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bhB3SzqC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59988 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpGOY-00037G-5t
	for alex.bennee@linaro.org; Tue, 05 Sep 2017 12:08:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36265)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dpGJr-0008N5-BO
	for qemu-devel@nongnu.org; Tue, 05 Sep 2017 12:03:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dpGJm-00026q-Im
	for qemu-devel@nongnu.org; Tue, 05 Sep 2017 12:03:19 -0400
Received: from mail-pg0-x232.google.com ([2607:f8b0:400e:c05::232]:37967)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dpGJm-00025v-C6
	for qemu-devel@nongnu.org; Tue, 05 Sep 2017 12:03:14 -0400
Received: by mail-pg0-x232.google.com with SMTP id v66so10118754pgb.5
	for <qemu-devel@nongnu.org>; Tue, 05 Sep 2017 09:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=PKdD1jGIITuO7Gu00eCSxbwSkPLhu2+a+IB/zCPBLLc=;
	b=bhB3SzqC6qhIgCbGZtEUhfIVxVJjQrY2Tk5qGCoHLGLafiaznKj3TnmY0VAuFos0Xh
	jUHr6VQSnmVHYZRo+OOMYtzTfL0JaQtVbnZr0ttz7qXsUXZl84M6lFmhYSOV00W/afzA
	Ymf8t+CdsUwsp1E0iX052uh3ZT+pX/gkvkn24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=PKdD1jGIITuO7Gu00eCSxbwSkPLhu2+a+IB/zCPBLLc=;
	b=a7x6cmy/bD+hLHwqf+wxSJfkf9pbvzDxtQ7uKof8GY8qaVjW1jWIRbKkNLk/JNeTn2
	1TYvUPFD2hiA8X2fIk1PPFqG2IlFHDiltCbEVigh4a14c3H3Z2R1mYBy+Z1xpZoIVqUh
	9GQdXXd1JfEM3w77GSXfDc9Ct1mXcEGwsO61M4TCVgVhN+7sARmXhXx6pZck74ZFfxTi
	WhPNX9XtxP3DUXF+Yq8VvNw+j9HzkdSSxTcJqqDXumXI/t4z0wWWw+B3aGSzzDudijUn
	4AMoySpRm/WcB4plbThAxljrlgm3V4t5ECBL+ZQ+F8P/pLptdMdg0iZFJMmBLg/uZ2Nz
	/AGQ==
X-Gm-Message-State: AHPjjUgeHt4qDFSW29a9q/zOQYSIK4RYV12HFhbeuTEATS5nZObeW9yG
	u15arBFfciRdZUK2
X-Google-Smtp-Source: ADKCNb7kxFZRzCwi+AnSW6/+yC38CRPygxBRHLNxCAzZhsFWmTro4nnDj81A52IgQzj8Gv/c1kofDA==
X-Received: by 10.84.134.131 with SMTP id 3mr4892748plh.330.1504627393338;
	Tue, 05 Sep 2017 09:03:13 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net.
	[97.126.108.236])
	by smtp.gmail.com with ESMTPSA id a6sm1707221pfa.76.2017.09.05.09.03.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Sep 2017 09:03:12 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1504626814-23124-1-git-send-email-peter.maydell@linaro.org>
	<1504626814-23124-2-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a0cce589-b6e1-d17e-34df-f8232c64e5fa@linaro.org>
Date: Tue, 5 Sep 2017 09:03:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1504626814-23124-2-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::232
Subject: Re: [Qemu-devel] [PATCH v2 1/3] boards.h: Define new flag
 ignore_memory_transaction_failures
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Znxq9guJ2RTS

On 09/05/2017 08:53 AM, Peter Maydell wrote:
> Define a new MachineClass field ignore_memory_transaction_failures.
> If this is flag is true then the CPU will ignore memory transaction
> failures which should cause the CPU to take an exception due to an
> access to an unassigned physical address; the transaction will
> instead return zero (for a read) or be ignored (for a write).  This
> should be set only by legacy board models which rely on the old
> RAZ/WI behaviour for handling devices that QEMU does not yet model.
> New board models should instead use "unimplemented-device" for all
> memory ranges where the guest will attempt to probe for a device that
> QEMU doesn't implement and a stub device is required.
> 
> We need this for ARM boards, where we're about to implement support for
> generating external aborts on memory transaction failures. Too many
> of our legacy board models rely on the RAZ/WI behaviour and we
> would break currently working guests when their "probe for device"
> code provoked an external abort rather than a RAZ.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/boards.h | 11 +++++++++++
>  include/qom/cpu.h   |  7 ++++++-
>  qom/cpu.c           | 16 ++++++++++++++++
>  3 files changed, 33 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
