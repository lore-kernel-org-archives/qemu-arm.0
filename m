Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp5666461wrt;
        Tue, 16 Oct 2018 03:17:45 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63kTtgQxgqcDrU2sUxr7ybEIfuHIxSmCmhCeMoxGw8WRQvhOJjG1dxbmGzwHAvF1CU7Y0gE
X-Received: by 2002:a37:1b99:: with SMTP id m25-v6mr20350146qkh.7.1539685065195;
        Tue, 16 Oct 2018 03:17:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539685065; cv=none;
        d=google.com; s=arc-20160816;
        b=Z7b/E0Zy+aCPw6kA6sB6WAulsonMOgTyoX8QyHAZpBpZVx55Tdu/fpw9XtOX7v207y
         9HZKR3NUNRA4Io93mwxZUe2U93qDDTmhhuNIx2VANEtanKBoBx9VO+kw9ewEuCl3P+BO
         X3o6mkSjZswAGiDEqZ9t5+zp7zytf4Ujk8Id6ufFuEcQ35iv744cgvGA+KhondCi9vgu
         UCHkPGep0rX4w6lzq3NWMK4DRUrTA4eMbnJyBeZcON/PIzDMRsb20zIwu8W0pxoazExw
         hF6/t3ezSEfqh12SDw1npd5uMEeU+oYWFZplpDx+IJ59PtXdLyVASpbbMZgrGRDqYc8X
         hmuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=f3jEj/VskYgvZhonmJ/qBSClorDF5+DIh/dBy2LLvH0=;
        b=Ur2CAU0Crn+fuKR+PkcmngynJ9zqqv9OFAO0v4JK6szLIeqMd0ETRAJUfvC8p/1ETn
         nNHWEx8vOnKc3qJ9f6rdxBpzVR/hy/chQ34DNor815ZECO4bOp00MWNL9x5iiK92XaTN
         g2KH+zGuXXlodw/8B6frgIlwHWaatG2gBdvT8LwnDu7WB+kIKt/qiPkCH8bE086eiqxX
         HNOph4+q9OcojGnS2uMCCnkxhZ9B8Id4xR729GEdYPXGYnICcJHez31XBljAFz47tjjw
         bgfbP/yj0edwC7/YK+b2d+8Ypiy7Y0cnnHDSuSyWLRMPi5vQ5z6quMHRyFrzTNmSfcT/
         ibfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jS4tRHye;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m62-v6si223057qkd.89.2018.10.16.03.17.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Oct 2018 03:17:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jS4tRHye;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57014 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gCMQ4-0000oQ-Mm
	for alex.bennee@linaro.org; Tue, 16 Oct 2018 06:17:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46633)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gCMNF-0007RY-On
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 06:14:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gCMN6-0000b6-AV
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 06:14:49 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:45512)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gCMN5-0000WM-MM
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 06:14:40 -0400
Received: by mail-oi1-x242.google.com with SMTP id e17-v6so17545147oig.12
	for <qemu-arm@nongnu.org>; Tue, 16 Oct 2018 03:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=f3jEj/VskYgvZhonmJ/qBSClorDF5+DIh/dBy2LLvH0=;
	b=jS4tRHye+kWqUxztjvpn4O15YzXMI5KP1tTpTLmfy2E5qAOlHMXNdtfCHpUvX5G7j/
	sr6mIualu91uNmvStq41RAUdyN7VHPxtCZ54COUNqzii1S2h3obcUzZZh8kPRf1FhH0v
	71Nag5zQmXxohfikOA8VHl6E3O34rJUqMSDN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=f3jEj/VskYgvZhonmJ/qBSClorDF5+DIh/dBy2LLvH0=;
	b=dOpnRUSN6oHhqOZ/AD+FsJ6xyBgx9b1c8mz0j/JuAQkDY2HTsvaoTKRPTQaPH1yl6w
	FMUy1+guaNIDdQwRw+NQ9p1neb0xw8FY0U2JlwVPPCUj3kgI+0FXs/qgYmmj+47JHJUi
	YkIBREYkSm+YxZ5HeYuRXuTWnxL0+0uYwRbFxCyV6lawxR9LYEFhtEAfY6AhOL97gC0w
	w4xQ/0LsJDgRR9wppunAnYIw28al1eBRcqoYlLSGsoas8bpyif34TgqLIe9myZDQORY3
	k+ur13pcjD/pqfuUrF1MosrD8xt/A2WMqEllmkSmfQ9mSbGfhlIwGxLq/s87ziZ0/i8Y
	2Bpg==
X-Gm-Message-State: ABuFfoj7BTzhxRq9N6m4FetCPCv6GrPiUIv1Hfl/rz4eTIWntYWe70DB
	kB1QPze51Wpe4wKK1BYqnjF2i4OM0LkPX4Zpqz3RQg==
X-Received: by 2002:aca:f156:: with SMTP id
	p83-v6mr11565364oih.332.1539684878965; 
	Tue, 16 Oct 2018 03:14:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:7c90:0:0:0:0:0 with HTTP; Tue, 16 Oct 2018 03:14:18
	-0700 (PDT)
In-Reply-To: <70f911cb-7d49-e8cb-e3cd-081033e010c2@linaro.org>
References: <20181005080729.6480-1-jerome.forissier@linaro.org>
	<CAFEAcA9h7_vaKk7GuGVWv2_hFeR=xC4ZgJzLuD+iSqCdwa1PSw@mail.gmail.com>
	<d52c8388-5482-633b-bd9d-5eaf0eeb3eec@linaro.org>
	<70f911cb-7d49-e8cb-e3cd-081033e010c2@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Oct 2018 11:14:18 +0100
Message-ID: <CAFEAcA-+tmc5E7VksWTe_0UEs5xt9YBVGiE+8ev8ChDu0OLRYw@mail.gmail.com>
To: Jerome Forissier <jerome.forissier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-arm] [PATCH] hw/arm/virt: add DT property
 /secure-chosen/sdtout-path being secure UART
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
Cc: tee-dev@lists.linaro.org, Etienne Carriere <etienne.carriere@linaro.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Rob Herring <robh+dt@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 09I0zutsbFUS

On 15 October 2018 at 10:08, Jerome Forissier
<jerome.forissier@linaro.org> wrote:
> Hi Peter,
>
> On 10/05/2018 11:26 AM, Jerome Forissier wrote:
>> +CC: Rob Herring
>>
>> On 10/05/2018 11:16 AM, Peter Maydell wrote:
>>> On 5 October 2018 at 09:07, Jerome Forissier
>>> <jerome.forissier@linaro.org> wrote:
>>>> Bindings for /secure-chosen and /secure-chosen/stdout-path have been
>>>> proposed 1.5 years ago [1] and implemented in OP-TEE at the same time [2].
>>>>
>>>> This patch creates the property when the machine is secure.
>>>>
>>>> [1] https://patchwork.kernel.org/patch/9602401/
>>>> [2] https://github.com/OP-TEE/optee_os/commit/4dc31c52544a
>>>>
>>>> Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
>>>
>>> The patch seems OK, but it looks like the DT bindings are
>>> not upstream yet? [*]
>>
>> No, they're not.
>
> Update: Rob has now accepted the bindings [3] (thanks!).

OK; I've applied the QEMU patch to my target-arm.next branch.

thanks
-- PMM
