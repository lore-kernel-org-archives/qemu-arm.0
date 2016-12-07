Received: by 10.25.159.131 with SMTP id i125csp247722lfe;
        Wed, 7 Dec 2016 01:26:48 -0800 (PST)
X-Received: by 10.55.123.129 with SMTP id w123mr64755300qkc.288.1481102808005;
        Wed, 07 Dec 2016 01:26:48 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id e12si13969311qkh.332.2016.12.07.01.26.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Dec 2016 01:26:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37374 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cEYUx-0005YC-DM
	for alex.bennee@linaro.org; Wed, 07 Dec 2016 04:26:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51933)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cEYUr-0005Xu-2D
	for qemu-arm@nongnu.org; Wed, 07 Dec 2016 04:26:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cEYUn-0007ii-IU
	for qemu-arm@nongnu.org; Wed, 07 Dec 2016 04:26:41 -0500
Received: from mail-vk0-f41.google.com ([209.85.213.41]:36281)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cEYUn-0007hv-3K
	for qemu-arm@nongnu.org; Wed, 07 Dec 2016 04:26:37 -0500
Received: by mail-vk0-f41.google.com with SMTP id p9so209110241vkd.3
	for <qemu-arm@nongnu.org>; Wed, 07 Dec 2016 01:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mphOisXetIFAFYl0gfvUIYISKgOswQisRHvabQ2Zsc8=;
	b=EMpKyZfHcSwokXkDZLf3QOJ1yQ3LSmGMGVa5v1JXSHX0tH6dOf5Le00f2FeSqJZmeT
	/1d7aeUq352bi6q5g2mLRMi0qd2ugRLi0MUbnC6Trkhz664VQI2qpQ1spKMYHomcAjWP
	Fjxa7gu3kUfQIqZR3/WvemGxGw/dz9ASMn52w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mphOisXetIFAFYl0gfvUIYISKgOswQisRHvabQ2Zsc8=;
	b=KwwsbHMgrvud7cqxYj/OrE4/oJiboCYqFIiKP/4Qq9Ru++UtReJVFI8Y8fUYGxierD
	Ft4mV2aWstT1hbp+GVA9TeXrhrClDA3AChjIc7VXIsIS/W7mST7+TCg450HBg/JaoI7R
	st+wf7806AmMulSPR4jozlmTcDX7B9RHpr2HSjBgpt7/e3rBvSn7Vh8D2l5t7PMuix7t
	9LvZkiXHP3QpvNr86dXu7uehAqvpUHeO0In4cv2hGhKx2HutIbKLqD2tLNGayaDPWGCT
	q6FghhuTw7XVZ6qIwN6JRNKrDR7nSmwhfumBPGdRactNo5dbtZE+S8FMoQcyWci0viHT
	9/dg==
X-Gm-Message-State: AKaTC00KFuLPOMstrmgT3A9MHck3VjFlUdY6e8Hq99AUhblQ53b/0pEW7bU6lLRAzCiB42AZhYpKQpLsQCynKYuw
X-Received: by 10.31.75.198 with SMTP id y189mr21300305vka.51.1481102736215;
	Wed, 07 Dec 2016 01:25:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Wed, 7 Dec 2016 01:25:15 -0800 (PST)
In-Reply-To: <CAF++6APMs+eshFxV=wxV9N9zmyyLtU8Gz0v0CAgCWkOnC88dpg@mail.gmail.com>
References: <CAF++6AOJ_kiPyeCO3WO84d4UTrV9v=iK8CJx72ERJ5N_AKj64g@mail.gmail.com>
	<1dda2994-dc9d-d8f6-fb42-856f2b992484@redhat.com>
	<CAF++6APMs+eshFxV=wxV9N9zmyyLtU8Gz0v0CAgCWkOnC88dpg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 7 Dec 2016 09:25:15 +0000
Message-ID: <CAFEAcA9guoF-ija--JO1E0pfUG2d4HNSB343GiY9ojO837TAXQ@mail.gmail.com>
To: James Hanley <jhanley@dgtlrift.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.213.41
Subject: Re: [Qemu-arm] [Qemu-discuss] Custom board with DTS/DTB
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
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PRO/lZykbjN9

On 5 December 2016 at 17:51, James Hanley <jhanley@dgtlrift.com> wrote:
> I'm moving my query to QEMU-Arm since it seems more applicable here.
>    1) It seems that the -dtb option is not what I thought it was, but would
> something like what I thought was the intent of the option be of value to
> QEMU, that is to define the board support package for the system using DTC
> to compile and pass into QEMU to define a generic board from the tree,
> rather then defining the hardware within the code base of QEMU?  I
> understand that there will always be some need for device support and
> deginition from within the codebase, but this was more to allow the user to
> define hardware board profiles without having to change source code.

The problem is that DTC is not designed for that job. It describes
those aspects of the hardware that the kernel cares about, which
overlaps with but isn't the same as the information that you would
need to build a complete model of the hardware. So the idea has been
suggested before but I think it would in practice be pretty unreliable
(and for 99% of dtb files it would just not work anyway, because QEMU doesn't
model the devices that the dtb describes).

>    2) Right now, I'm trying to run our embedded application (EmbOS RTOS with
> DLib with our application support all targeted for Cortex-M4 MPU) and it
> seems like QEMU (at least from variable names) wants to believe that under
> boot.c and loader.c that the passed in application (using --kernel option)
> is linux.

M-profile is different and doesn't generally use boot.c -- the board
model code ends up calling armv7m_init() which treats kernel_filename
as a random ELF file. (A profile --kernel will also treat an ELF
file as an ELF file, it just has special casing to handle Linux kernels and
assumes a raw binary is a kernel.)

If you're running one of the 2.8 rc candidates you can also use
-device loader to load an arbitrary file (see docs/generic-loader.txt).

thanks
-- PMM
