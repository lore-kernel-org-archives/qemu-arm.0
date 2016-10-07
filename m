Received: by 10.80.163.71 with SMTP id 65csp3677908edn;
        Fri, 7 Oct 2016 02:32:42 -0700 (PDT)
X-Received: by 10.55.159.4 with SMTP id i4mr18065483qke.317.1475832762793;
        Fri, 07 Oct 2016 02:32:42 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 136si9791703qkf.25.2016.10.07.02.32.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 07 Oct 2016 02:32:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33495 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bsRWD-00010R-No
	for alex.bennee@linaro.org; Fri, 07 Oct 2016 05:32:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55819)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bsRW8-0000zp-Oz
	for qemu-arm@nongnu.org; Fri, 07 Oct 2016 05:32:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bsRW6-00038W-F0
	for qemu-arm@nongnu.org; Fri, 07 Oct 2016 05:32:35 -0400
Received: from mail-vk0-x22e.google.com ([2607:f8b0:400c:c05::22e]:34857)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bsRW6-00037X-0L
	for qemu-arm@nongnu.org; Fri, 07 Oct 2016 05:32:34 -0400
Received: by mail-vk0-x22e.google.com with SMTP id 192so40967171vkl.2
	for <qemu-arm@nongnu.org>; Fri, 07 Oct 2016 02:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uJIDyikoBhp5swnEorV7Q9X06yLw3PwaZVlpv4zb+mI=;
	b=XnHE1itG0vFfJZC/qo63WCTOZDWR10GvvdwQMKHyqzaBzlpWPtxK1KVo8dF1vApSWT
	IZf86Bflt5BnU7JynS1PGXWOdBb+wwBUvDeWpIpFTd3EAZ077rx/uHvk+tTePmutlmMM
	sTgVVVefc0oraYE9iI5UXwmQ29KWemFEfuOEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uJIDyikoBhp5swnEorV7Q9X06yLw3PwaZVlpv4zb+mI=;
	b=Ola5dL7Yy/nzfeM4+zFa/AqGx8ib3h6rSLiZBIMumLiRTkTtERr+LAxJU5DUa3Ii0C
	1lsBN79Ez8A1G7AoZUNDXez/5YpHHLGF2Ue1X1qsrF2r8Irf9698ZzW5VXm+ww2DInHc
	9fKX2DN8ffG/aYLxRj1ofzxTDFhkZzU0OUvH17O7OvDP8NoNdhGhIOPQ6o4KXMtCdzM/
	438mE6Aj1TasoO/vBj3t1FXifIcsJLI8IvzlYc1743ftY/luxRA0H5IgmZzrgMRrU4dU
	rP0fx6/TposeBimBBiHIJssLvTmlmyLVJuOJbrLvfo3uY/3lw3D3Ijvl+lYZraeb5YpC
	RjIg==
X-Gm-Message-State: AA6/9RmsavhhfjsQ804UZnvxjYxtq9xssXF7BPwO9KjijDwNTkERaZpjqiTxmzm5vKc/s9s/yWmCixkM9A9t5KLI
X-Received: by 10.31.65.195 with SMTP id o186mr2173067vka.3.1475832752936;
	Fri, 07 Oct 2016 02:32:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Fri, 7 Oct 2016 02:32:12 -0700 (PDT)
In-Reply-To: <CAKmqyKNBuC3pZSOQ3q6wHBNjWThj8hO7A+Booy_GaVuG8fO_Lg@mail.gmail.com>
References: <1475777794-4376-1-git-send-email-rutu.shah.26@gmail.com>
	<CAKmqyKNBuC3pZSOQ3q6wHBNjWThj8hO7A+Booy_GaVuG8fO_Lg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Oct 2016 10:32:12 +0100
Message-ID: <CAFEAcA-YqCKGFFN0QuErBLK30jJJ4LF0DLEqw8gA+PhpsEDsJA@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22e
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCHv3] Reducing stack frame size in
 stream_process_mem2s()
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	Rutuja Shah <rutu.shah.26@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bl2ozDHvGBd9

On 7 October 2016 at 01:03, Alistair Francis
<alistair.francis@xilinx.com> wrote:
> On Thu, Oct 6, 2016 at 11:16 AM,  <rutu.shah.26@gmail.com> wrote:
>> From: Rutuja Shah <rutu.shah.26@gmail.com>
>>
>> This patch allocates memory for txbuf in struct Stream rather than the stack.
>> As a result, the stack frame size is reduced of stream_process_mem2s().
>>
>> Signed-off-by: Rutuja Shah <rutu.shah.26@gmail.com>
>> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>> Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
>
> Hey Peter,
>
> Can this go through target-arm?

Sure.

thanks
-- PMM
