Received: by 10.25.159.19 with SMTP id i19csp1320961lfe;
        Mon, 8 Feb 2016 05:11:43 -0800 (PST)
X-Received: by 10.141.23.207 with SMTP id z198mr7813706qhd.52.1454937103340;
        Mon, 08 Feb 2016 05:11:43 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d2si30408641qkb.17.2016.02.08.05.11.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Feb 2016 05:11:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:44582 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aSlbS-0004hI-Ox
	for alex.bennee@linaro.org; Mon, 08 Feb 2016 08:11:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34749)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aSlbQ-0004h5-Dr
	for qemu-arm@nongnu.org; Mon, 08 Feb 2016 08:11:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aSlbK-0004Rl-OY
	for qemu-arm@nongnu.org; Mon, 08 Feb 2016 08:11:40 -0500
Received: from mail-vk0-x232.google.com ([2607:f8b0:400c:c05::232]:33589)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aSlbK-0004Rg-Ir
	for qemu-arm@nongnu.org; Mon, 08 Feb 2016 08:11:34 -0500
Received: by mail-vk0-x232.google.com with SMTP id k196so27960012vka.0
	for <qemu-arm@nongnu.org>; Mon, 08 Feb 2016 05:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=wQ0/PgP7JcKHR082v14SdytUAQyYyhF8bdaqvGH8gsk=;
	b=cDA2Sxqpggkpc9eRxFkT/PfZ7XptCSbKT+uCdcilrLme1lRJJr1rwyvv8WqlazGXcl
	gx5wz39gCt3Q1EWYnQmN3PndN0y//z8Eam2zO5VTs9MM/YVzgQ741PjnUyioX/bKKH+K
	oGECwlGXv6K/E30h7iMVYTJSaIlq42pbAHtsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=wQ0/PgP7JcKHR082v14SdytUAQyYyhF8bdaqvGH8gsk=;
	b=he57jy5YOEL3EwHtYc6BQhbYgveM1TK00m6pcz9ad9IPCYvPDIqjpwpX5lKV/kC2m9
	hYi1sOyoZdI6D+YrgvrFM3yMCwictYHXLfkWBMX56989wc/DiUzZARCU22TBpHI+jBTq
	NUnraEhfgTBR7tjND4IAoDBilzJufIRM/ceflAZaeKNCMTAaof85XOQO432a8ddbGPFp
	JL2+WW/jJ3xFeEzCReYO/N2umUDmf4ka/m9oR/DGDxbLhL8DfVznw2QDp1bxyuegRcXY
	J/pvkwkiDLYwb2VnL0MEf6JBtU9twybA9s4slVtQAJW2JvGXnQBU9+UgHqH+L9ktZ1Qp
	LLLg==
X-Gm-Message-State: AG10YOQwF/ylN5oRBruXktTZFo5sjAI8BEjwUMTkZLdXuVYvHxW/nVird9/UQ5IijioWYhewqLOEjIiU+V8oqEho
X-Received: by 10.31.141.2 with SMTP id p2mr20332624vkd.37.1454937094073; Mon,
	08 Feb 2016 05:11:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Mon, 8 Feb 2016 05:11:14 -0800 (PST)
In-Reply-To: <56B63EB1.8080905@gmail.com>
References: <1454506721-11843-1-git-send-email-peter.maydell@linaro.org>
	<1454506721-11843-3-git-send-email-peter.maydell@linaro.org>
	<56B63EB1.8080905@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2016 13:11:14 +0000
Message-ID: <CAFEAcA8uVSku-8Y=bg+x+6LCzinVLAs_Fe=wq3A7LsnmqexOVQ@mail.gmail.com>
To: Sergey Fedorov <serge.fdrv@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::232
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/7] target-arm: Implement
	MDCR_EL3 and SDCR
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
X-TUID: rxC/2kfDEbAV

On 6 February 2016 at 18:42, Sergey Fedorov <serge.fdrv@gmail.com> wrote:
> On 03.02.2016 16:38, Peter Maydell wrote:
>> --- a/target-arm/helper.c
>> +++ b/target-arm/helper.c
>> @@ -364,6 +364,23 @@ static CPAccessResult access_el3_aa32ns_aa64any(CPUARMState *env,
>>      return CP_ACCESS_OK;
>>  }
>>
>> +/* Some secure-only AArch32 registers trap to EL3 if used from
>> + * Secure EL1 (but are just ordinary UNDEF in other non-EL3 contexts).
>> + * We assume that the .access field is set to PL1_RW.
>> + */
>
> Maybe we should also make a note that there is no secure EL1 if EL3 is
> using AArch32 as it is done for ats_access()?

I added a line to the comment:
 * Note that an access from Secure EL1 can only happen if EL3 is AArch64.

thanks
-- PMM
