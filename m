Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1534861wru;
        Mon, 16 Jul 2018 06:57:22 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeZ7KCNdwLvxirbYzCdCDzqXc2vhv8ZfgoQgnevSA6+5S7UZSXgizeO/+C7wOkgDVveuVLl
X-Received: by 2002:a0c:88c2:: with SMTP id 2-v6mr18253118qvo.51.1531749442220;
        Mon, 16 Jul 2018 06:57:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531749442; cv=none;
        d=google.com; s=arc-20160816;
        b=v6GZ+kDzWVXLnK9aLEWlv8tqgsYCvlVsxoFY7GHXWgUH436eglCOftNxD7yLRVXRTe
         lf8Jz9io4tuMoWuKoyeQjDTKGtmRjUukipmpJlR5JdMFfOJ7NAg2rvxJPPwIV4jzA1no
         EkkIpr+AF3DPrwkVwgv7c4A/R5GJdsQnKkNCGBzdpAY8hx0N3SHkXXHb/W2da762aJGC
         bprOU5AXb0wyJ+zs4UjHET7bZqXy9aKd/zqe+Gi42r/D2lZfhRerCj8OoAir5pM4voWV
         Qltz2M4hw4WKupQPpDE8PeXJQS+ZBDn8iBSBTQ6rObbaJs/PNB0tPAzqpkLMW0yS/sUM
         gEKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=p5WzIX2O2P4c1GO90bkVDOmMn5iqw2Ad0BR334kVlN8=;
        b=CKp+0u3iGjyAffuKvEZRaqS4womNgXCxzAoU8HuVWxWtIo2pwKIJUYKUybjxLZZNKz
         O3lonnJn3PXp2kqgnD4EuecVDWrN1JIdWJ//mcCK8mGgsZ7o+lD4eB33Mruj1xBCG39f
         +7fvh6tdzM+0VE2P8EzR/1o9uX83WMyJ623W881JWZQwhPjUhgJ0v6vlShSq9JoLDqYK
         RNqV4XmNWXVlChE/gE9F1VEdjsOSiYy8m7s8tUuuaG260dTaek5V/6ryJ1pr7YHIal28
         kYby1JLlw0fOZ1cPqiA3dPV8cbfHHRUKbPmf9CXiJB5gvsE+2kBtPikV8Oc3fyzrCTSc
         5yEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=klZ1Krrp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j97-v6si5257772qtb.126.2018.07.16.06.57.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Jul 2018 06:57:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=klZ1Krrp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51884 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ff409-0007MH-No
	for alex.bennee@linaro.org; Mon, 16 Jul 2018 09:57:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60323)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ff401-0007LT-4S
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 09:57:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ff400-0004kw-CC
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 09:57:13 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:40952)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ff400-0004kn-6N
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 09:57:12 -0400
Received: by mail-oi0-x244.google.com with SMTP id w126-v6so74912639oie.7
	for <qemu-arm@nongnu.org>; Mon, 16 Jul 2018 06:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=p5WzIX2O2P4c1GO90bkVDOmMn5iqw2Ad0BR334kVlN8=;
	b=klZ1Krrptg9HxnRl/T3Hg4s16ISZJVh0pJCle23gMRBVat3/Ct4HAXyut25R90m7Y9
	UoC1aE6zcqHdY6CoMTz6Z2F+FLRpQhbOzUjRj133QqALsSlIPJdVixiuoR8Rhk/c15q8
	jubHzNQb+H/xbpTCwbPao1CS6PSOay11VpyWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=p5WzIX2O2P4c1GO90bkVDOmMn5iqw2Ad0BR334kVlN8=;
	b=XPyNbtP7LSvxqsy9+7n63C20yFUloiT/FXzBnWy54tZmsqV/DeLHOqEmYCeGm+HZ/8
	9qbzz0eRHVGf+736Io9zFslpR9Tufjw4TA0CrKjjkYwLqtOjeTU65v8NN2KSCiu9LN3Q
	l/c0mdP2JnZssrdaqf5gxnIrcKgNt+Lkegzv7aGMTzTHMYubUDLzWk62Qt/JkpifF4vQ
	wFl/c28hmZF7zuPRZan8U1vkAaAKKU7qwLAQL1FStzLXyJ9/ktddbkXNBvEPGZI3+I13
	0/kmpKlLyNrbvTQnRQbka2mjK+8qfrc5c9TKtLLSjgY4qyTvLsq3EibymLxalE5jkkvs
	bjGg==
X-Gm-Message-State: AOUpUlHTdSq9pLI06hC71T67XooY4x4mlieYAQeYJ6Umju6bReW9u2x2
	uWx2CcqkqEoxJIqdWWiopDEGMFG3xtu0WqZTlxMxTg==
X-Received: by 2002:aca:ce0f:: with SMTP id
	e15-v6mr19307370oig.13.1531749431446; 
	Mon, 16 Jul 2018 06:57:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Mon, 16 Jul 2018 06:56:50
	-0700 (PDT)
In-Reply-To: <1531745974-17187-17-git-send-email-thuth@redhat.com>
References: <1531745974-17187-1-git-send-email-thuth@redhat.com>
	<1531745974-17187-17-git-send-email-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Jul 2018 14:56:50 +0100
Message-ID: <CAFEAcA9=7zpoXDoYY_4gBO=v-APXKunNv=_EhGp8Qu9MBtFphg@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH v3 16/17] hw/display/xlnx_dp: Move
 problematic code from instance_init to realize
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: y+GqOMgOrlj3

On 16 July 2018 at 13:59, Thomas Huth <thuth@redhat.com> wrote:
> From: Paolo Bonzini <pbonzini@redhat.com>
>
> aux_create_slave() calls qdev_init_nofail() which in turn "realizes"
> the corresponding object. This is unlike qdev_create(), and it is wrong
> because qdev_init_nofail() must not be called from an instance_init
> function.  Move qdev_init_nofail() and the subsequent aux_map_slave into
> the caller's realize function.
>
> There are two more bugs that needs to be fixed here, too, where the
> objects are created but not added as children.  Therefore when
> you call object_unparent on them, nothing happens.
>
> In particular dpcd and edid give you an infinite loop in bus_unparent,
> because device_unparent is not called and does not remove them from
> the list of devices on the bus.
>
> Reported-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> [thuth: Added Paolo's fixup for the dpcd and edid unparenting]
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
