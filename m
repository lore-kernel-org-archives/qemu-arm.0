Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp1238055wrp;
        Thu, 14 Feb 2019 09:25:37 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZfxBZ1i6xDPmLeBX1i9M7jn4Z3oSwLzLXwKSZ6O0GngiPHAS/8q0u610CKo8/I3ZdaK5Sy
X-Received: by 2002:a81:9a0e:: with SMTP id r14mr4069321ywg.423.1550165137671;
        Thu, 14 Feb 2019 09:25:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550165137; cv=none;
        d=google.com; s=arc-20160816;
        b=e2iXenswKWdEXbNm1HetMXLtorLLlEW+y1BEGZzjOn1ao6/Ody/jzPYIIRE+99YYP9
         zKq7E8cdhVWKi3MvcKmt4Az3Do9gZ/t6HkTb+JWNm1d3o0eyOd1bOxFkv4GUd8HtuNDw
         5lx6ejqPFbuVigBN31EfcONmT3jMI09wlMCp29Fj9bF59kt6VOKI1LBgDkVnq6EKrgK7
         3a77gQ1eZ96vXJhKi7cT1cESfdAEzS+mwoQ3Ho7q4bsSir3NHhWt+sG8RMTV5GraJv/4
         bwYGhwWHExYW40IjtNZ/CSvE/Wc/8Q2sEZDtNbNGtPZ/PWJHpuDZES66dPrJqPIKV55f
         MhnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WRQ8WW6f2tZvtkVoOOscPuGcXXD+T7Xzpz74YSoEOhM=;
        b=LwD0UBuzIIBxFwtt2Cs5mr1fKp8LXmdMziZYCtKguV9xPG45cuRiIvGFegk8pY9xDk
         SADmS7rIlmf13UIse8EuDWyNEw3G6rNGppd1U+Ry3okC8gmVxtPQPa7PFHqhzvGhnUW9
         gXYMsLh25iG1fCK6C167nZcl3f/sLWZQHScT5Jbf8AI2qkLIrnDTgK61ch8ov+rNFg88
         W4M2GUQDcAEpqqLg9CZbgeuD+nDuJMo11OLahkQOG8wwhn1FwT0eo8eo73ef6EBYBrLq
         touBF2OTCI2VkVM1HjJVbSGfNdy6+WC9MVRTXAhb0bYcRQVunL1U70UPlDlbYpWAt0tL
         UZ9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=joo+VQ7z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i15si1664999ybk.269.2019.02.14.09.25.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Feb 2019 09:25:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=joo+VQ7z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:52080 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1guKlV-0003vr-44
	for alex.bennee@linaro.org; Thu, 14 Feb 2019 12:25:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55788)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guKe6-0006tZ-8z
	for qemu-devel@nongnu.org; Thu, 14 Feb 2019 12:17:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guKZG-00066r-LH
	for qemu-devel@nongnu.org; Thu, 14 Feb 2019 12:12:59 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:46273)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1guKZG-0005um-1L
	for qemu-devel@nongnu.org; Thu, 14 Feb 2019 12:12:58 -0500
Received: by mail-ot1-x341.google.com with SMTP id w25so11666001otm.13
	for <qemu-devel@nongnu.org>; Thu, 14 Feb 2019 09:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WRQ8WW6f2tZvtkVoOOscPuGcXXD+T7Xzpz74YSoEOhM=;
	b=joo+VQ7z5c1FKZiGKkptfaDYr0jeiNm7S2mbOCD+RbR8RR5b0kFjMdCrAp1tHeBOV4
	cZ2OGLn+PwqhvG6tunFn0r4pJ13AJ88bmpJYUhIz2wYzend/ZN0jrvTlwVQGVnxU2LyR
	Ou0CVh20PujfYAktCxF2beu5c0uLHl1GuxfPjbrXviliXW8yEUdDt6MqQV9AlgK+W4KF
	UcBHMaSIub9SjqyT7IVJVAxTRP7RcDNhdkDPXZs8cR/hxGgKBLjaPldn9uKPQ2B6Vvfz
	gkat30jLfzf8/7OAl7859YT4N6TbwIQCFEcxKCKT9yR50D7glKJBrpKX5mjhlJEQanJI
	y+Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WRQ8WW6f2tZvtkVoOOscPuGcXXD+T7Xzpz74YSoEOhM=;
	b=aXh1qvPpcCLGubdm4eSPwwVXWzYry66QGrux1In9mZWRR/Y3vHsQyk6GBP8YRDW8Bg
	hqbjNnKgF2mErnsUuYmieYoYnAza8Pc7buA4nmUoRwbXQ5nchdSTzMY+G4oxy9ElW4R/
	vQVsAqw2QnPwTK15SOBOPWNqt+hOJdXq001A9j0ZBVlxPq0uGSoWUvaLcuaVWxIr+T0d
	LUwCR5xPjgFjIXz8uwmtRhJIcAWp48mv0kpzenyZWXzaHC/J6YUdeXQT/+F0uiVdm93V
	asA3Vp5H3wv25+CYaDYfJef2dKpCYZRD3ulNJWG6f/fXDLzyo6ccqNAsQiqdRq+GOCLD
	yVtg==
X-Gm-Message-State: AHQUAuaeiuc1Lp9zauC4crfjuFvyUiO945/21upcZSl/FHMB/1CllYnx
	KdnWuG2zMMntj5+5bP3Y9W3Zs8LQYnZKqB1ZN3vBNg==
X-Received: by 2002:a9d:61c7:: with SMTP id h7mr2751450otk.363.1550164360262; 
	Thu, 14 Feb 2019 09:12:40 -0800 (PST)
MIME-Version: 1.0
References: <20190205173306.20483-1-eric.auger@redhat.com>
	<20190205173306.20483-7-eric.auger@redhat.com>
In-Reply-To: <20190205173306.20483-7-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Feb 2019 17:12:29 +0000
Message-ID: <CAFEAcA_k7xNjcmUf0dYk1zviw8t6EyNGH2Qw7-zB=hH5e2SoWw@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-devel] [PATCH v6 06/18] hw/boards: Add a MachineState
 parameter to kvm_type callback
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
Cc: Andrew Jones <drjones@redhat.com>, David Hildenbrand <david@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 87hTNxrtu2pz

On Tue, 5 Feb 2019 at 17:33, Eric Auger <eric.auger@redhat.com> wrote:
>
> On ARM, the kvm_type will be resolved by querying the KVMState.
> Let's add the MachineState handle to the callback so that we
> can retrieve the  KVMState handle. in kvm_init, when the callback
> is called, the kvm_state variable is not yet set.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Acked-by: David Gibson <david@gibson.dropbear.id.au>
> [ppc parts]
> ---
>  accel/kvm/kvm-all.c   | 2 +-
>  hw/ppc/mac_newworld.c | 3 +--
>  hw/ppc/mac_oldworld.c | 2 +-
>  hw/ppc/spapr.c        | 2 +-
>  include/hw/boards.h   | 2 +-
>  5 files changed, 5 insertions(+), 6 deletions(-)
>


> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 02f114085f..425d2c86a6 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -171,7 +171,7 @@ struct MachineClass {
>      void (*init)(MachineState *state);
>      void (*reset)(void);
>      void (*hot_add_cpu)(const int64_t id, Error **errp);
> -    int (*kvm_type)(const char *arg);
> +    int (*kvm_type)(MachineState *ms, const char *arg);
>
>      BlockInterfaceType block_default_type;
>      int units_per_default_bus;
> --

Can you add a line to the struct's documentation comment for the
@kvm_type field, please ?

We're rather inconsistent about what we name the MachineState*
parameter in methods here:
 "state" x 1   (init)
 "machine" x 3 (get_hotplug_handler, cpu_index_to_instance_props,
                possible_cpu_arch_ids)
 "ms" x 1 (get_default_cpu_node_id)

It would probably be better to follow the most common option
rather than one of the rarer ones.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
