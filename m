Received: by 10.25.159.19 with SMTP id i19csp513552lfe;
        Fri, 15 Jan 2016 06:56:40 -0800 (PST)
X-Received: by 10.140.42.13 with SMTP id b13mr13614167qga.67.1452869800493;
        Fri, 15 Jan 2016 06:56:40 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g48si13676902qgd.15.2016.01.15.06.56.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jan 2016 06:56:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:47349 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aK5ns-000142-4D
	for alex.bennee@linaro.org; Fri, 15 Jan 2016 09:56:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40645)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aK5np-00013i-VY
	for qemu-arm@nongnu.org; Fri, 15 Jan 2016 09:56:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aK5np-0000pT-0W
	for qemu-arm@nongnu.org; Fri, 15 Jan 2016 09:56:37 -0500
Received: from mail-vk0-x22f.google.com ([2607:f8b0:400c:c05::22f]:36398)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aK5no-0000or-Q1
	for qemu-arm@nongnu.org; Fri, 15 Jan 2016 09:56:36 -0500
Received: by mail-vk0-x22f.google.com with SMTP id n1so145099144vkb.3
	for <qemu-arm@nongnu.org>; Fri, 15 Jan 2016 06:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=2Cm+VhsEb4r0q065bkPKxZHXvOVCVUCMqfzDou2CLXo=;
	b=HZ2r+SKofAGwz4TmlGJjPqGTHeVh+Xf+LEBX6izwQ2CP5uukgR8Lvt83Ueo9bG1Nj7
	pfodJnMNMxmWuYqYbeR357uSnJtiGZXB158JAmZkzuI/rB8zT2KlNPZRhzzllswTffbY
	Hp5r4fQqpPsFrgfQYbWonaKYRqstnyMk7iOTQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=2Cm+VhsEb4r0q065bkPKxZHXvOVCVUCMqfzDou2CLXo=;
	b=UAfc6scSreS4cZutZoOXkbAJx9kzk93ht56jg9CMX5ms49vrUhscUpq/18BSXNCvLw
	p4rQ/N/w2fqyhUeryzRm4CNOlxymspkLm6QdXWW/ITRCmArqP2r/GpP0QDQJQBiKClg6
	jDIku2ThFgBm4rSMwnhiDYSneKubc3+uO0X3dYIZU+cedjisr6GAb4LxoDrrRD4n5E2E
	ek69mjCdErYVx6fORJhGLVDH22PI9+ZO0sGoh5XIx9UFoYDItvfg3EEU9YD8wYEAmbhk
	0o07psEi/T4OiQBlg0RTdq+WCAZKZDF/xZzlJOfHWAlqSJxwFHhWVdAdKYKJYL4Wa+ih
	HOxg==
X-Gm-Message-State: ALoCoQmRPFXHwEpenBvA4fGunm740NkYXb1i59eG7GU12IEl0ZB6zhUacupl+vHolpEAGKCJqG0wZhlkt4fDfeBMicLXIOHx49XyIvOuYFcQC5O0vkzHMjc=
X-Received: by 10.31.194.21 with SMTP id s21mr7610864vkf.92.1452869796331;
	Fri, 15 Jan 2016 06:56:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Fri, 15 Jan 2016 06:56:16 -0800 (PST)
In-Reply-To: <1452542185-10914-6-git-send-email-drjones@redhat.com>
References: <1452542185-10914-1-git-send-email-drjones@redhat.com>
	<1452542185-10914-6-git-send-email-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jan 2016 14:56:16 +0000
Message-ID: <CAFEAcA_t5Ba-XMq-H=SA1Ay7JtGCSijcJh7B-aA3ooxiu9j6yw@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22f
Cc: Markus Armbruster <armbru@redhat.com>, Alexander Graf <agraf@suse.de>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-arm] [PATCH v4 5/8] target-arm: support QMP
	dump-guest-memory
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
X-TUID: Meac9mINvc1/

On 11 January 2016 at 19:56, Andrew Jones <drjones@redhat.com> wrote:
> Add the support needed for creating prstatus elf notes. This
> allows us to use QMP dump-guest-memory.
>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  target-arm/Makefile.objs |   3 +-
>  target-arm/arch_dump.c   | 230 +++++++++++++++++++++++++++++++++++++++++++++++
>  target-arm/cpu-qom.h     |   5 ++
>  target-arm/cpu.c         |   3 +
>  4 files changed, 239 insertions(+), 2 deletions(-)
>  create mode 100644 target-arm/arch_dump.c

> --- a/target-arm/cpu.c
> +++ b/target-arm/cpu.c
> @@ -1429,6 +1429,9 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
>
>      cc->disas_set_info = arm_disas_set_info;
>
> +    cc->write_elf64_note = arm_cpu_write_elf64_note;
> +    cc->write_elf32_note = arm_cpu_write_elf32_note;
> +

This doesn't compile for the linux-user builds. I've moved the
assignments inside an #ifdef CONFIG_USER_ONLY guard in the
copy of this patch in target-arm.next.

thanks
-- PMM
