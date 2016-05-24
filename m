Received: by 10.25.30.65 with SMTP id e62csp853560lfe;
        Tue, 24 May 2016 10:30:19 -0700 (PDT)
X-Received: by 10.55.75.12 with SMTP id y12mr4441287qka.73.1464111019470;
        Tue, 24 May 2016 10:30:19 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 14si3461818qtm.75.2016.05.24.10.30.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 May 2016 10:30:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54529 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b5G9q-0000kU-SH
	for alex.bennee@linaro.org; Tue, 24 May 2016 13:30:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47015)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b5G9l-0000gi-8O
	for qemu-arm@nongnu.org; Tue, 24 May 2016 13:30:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b5G9j-0002oZ-8z
	for qemu-arm@nongnu.org; Tue, 24 May 2016 13:30:12 -0400
Received: from mail-vk0-x230.google.com ([2607:f8b0:400c:c05::230]:35491)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b5G9h-0002nP-VS
	for qemu-arm@nongnu.org; Tue, 24 May 2016 13:30:11 -0400
Received: by mail-vk0-x230.google.com with SMTP id f66so31360541vkh.2
	for <qemu-arm@nongnu.org>; Tue, 24 May 2016 10:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XDQodayskxMlSOysf9gvSj2GpEa7Nas7WieenmLuAo4=;
	b=N8G/Xa6L2xWv/e20PgEn2u0P9mZVnmnnOYhaFt9OY765aYmvD2agmoZVE5sLwwBkLi
	qZxx18AidTJXZJ/6c627RI5BHXhv6RxzwgpCax5qXMiSjIZkWK3JJ+JikpZdG26g/GXQ
	0a7Kngar7POzXl+Afw0lAstqnHsYv9BADuVJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XDQodayskxMlSOysf9gvSj2GpEa7Nas7WieenmLuAo4=;
	b=MhWxlQlnExp8Kw1pks9IPDiJ4kGWM05oe+vI/F1nYkc9iMxpok00D2125H/QUy7Nqy
	2J0wQ5IuBzSLSuluzG2LNnsqd8/WAjhFGQkEoWMyR/+CFJXlEYSePNI0V+wWpDse60b4
	bp6bB09Q2tXWjpqkK5YXbetgb3KmSNyodgPHyqlD08whxcf5CcAcHQ0haPZlx20Jzwdt
	uWcHAqxSoCkPcHPsLvGhQe0ZHbh3N45meMLvjyrsaUtoWU743FJD4OO0Z+QnbKDDzKna
	cvOcUe80Z2yBj0Ony4QUpmbyrIeunHFpKb6oukkaEqi78BYpPOQiF3clwVHIc48cz5BG
	x9hA==
X-Gm-Message-State: ALyK8tLtxV7izQS6uXQGImEEMceBhJkBglcXUDIV+e1S/9pIJ8+2IEEMfecoakroDeNpXs0Aa4EjUaZLe+6sp3Pn
X-Received: by 10.176.0.182 with SMTP id 51mr3138704uaj.4.1464111008908; Tue,
	24 May 2016 10:30:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.69.66 with HTTP; Tue, 24 May 2016 10:29:49 -0700 (PDT)
In-Reply-To: <20160524165747.GR3731@toto>
References: <1463698459-31312-1-git-send-email-edgar.iglesias@gmail.com>
	<1463698459-31312-2-git-send-email-edgar.iglesias@gmail.com>
	<CAFEAcA-mBjS2tuQD1irUnaWD7qa1nrgMRL8LS66DdaTJmtEBHA@mail.gmail.com>
	<20160524165747.GR3731@toto>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 May 2016 18:29:49 +0100
Message-ID: <CAFEAcA_Lk=ha-1EbDSTR-zJi+J2orLVjjuT3_sJO_DBbb=Yy4Q@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::230
Subject: Re: [Qemu-arm] [PATCH v1 1/5] xlnx-zynqmp: Add a secure prop to
 en/disable ARM Security Extensions
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WiWpFiVORkhl

On 24 May 2016 at 17:57, Edgar E. Iglesias <edgar.iglesias@xilinx.com> wrote:
> On Tue, May 24, 2016 at 05:30:54PM +0100, Peter Maydell wrote:
>> On 19 May 2016 at 23:54, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
>> > From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>> >
>> > Add a secure prop to en/disable ARM Security Extensions.
>> > This is particulary useful for KVM runs.
>>
>> "particularly"
>>
>> > Default to disabled to match the behavior of KVM.
>>
>> This is a change in behaviour, though, right? Is that OK?
>
> IMO it's OK. But I don't have a very strong opinion. We
> didn't have EL3 in this machine to start with, it came in when
> we enabled it on the a53. We don't have a big user-base that
> really depends on either default I'd say.

I'll defer to your preference, but we should mention in the
commit message that we changed the behaviour (and perhaps
also that it was accidental that EL3 got enabled).

thanks
-- PMM
