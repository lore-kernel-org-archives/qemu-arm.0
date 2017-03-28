Received: by 10.25.15.230 with SMTP id 99csp1801394lfp;
        Tue, 28 Mar 2017 14:08:30 -0700 (PDT)
X-Received: by 10.237.62.211 with SMTP id o19mr32163493qtf.135.1490735310068;
        Tue, 28 Mar 2017 14:08:30 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e42si4432850qte.255.2017.03.28.14.08.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 28 Mar 2017 14:08:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55311 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1csyLt-0001xi-E4
	for alex.bennee@linaro.org; Tue, 28 Mar 2017 17:08:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49237)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1csyLp-0001xR-EC
	for qemu-arm@nongnu.org; Tue, 28 Mar 2017 17:08:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1csyLo-00039Z-KY
	for qemu-arm@nongnu.org; Tue, 28 Mar 2017 17:08:25 -0400
Received: from mail-wr0-x22c.google.com ([2a00:1450:400c:c0c::22c]:32769)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1csyLo-00038y-Dm
	for qemu-arm@nongnu.org; Tue, 28 Mar 2017 17:08:24 -0400
Received: by mail-wr0-x22c.google.com with SMTP id w43so100422659wrb.0
	for <qemu-arm@nongnu.org>; Tue, 28 Mar 2017 14:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wGq+iBaU+Lxs8pO54k6IWVV2nUbV8vCSgAI9CdGYMZ8=;
	b=WakGMWx51gaZ65UxUJKntplDBM1lh5B7+GIpN97BZMk/Og4yvLyOwREQqw/Ogak+xd
	RMeHUvp8py44IG2wB0C7OJfmaOADo18lM/iUKL8e1rYVComl3lC0akK3xWTwEmzNjZZx
	/uRJl5zKiG3+Yo65SlrshUmvw4blsx653Ce48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wGq+iBaU+Lxs8pO54k6IWVV2nUbV8vCSgAI9CdGYMZ8=;
	b=sCI7ec0n3wDBy116Cmcel/NharEitSOxqElR0yMRZXPBmFkPeVXJl/QmjIjAi5vW6q
	0+FZUTs9677R9uxrwXIAQ42HsOWHwEUU4y83zOLxLh8qckHFCq8FdoGg6orbJVmsg+Tu
	UJftnNkfeYgGVOrqZE7QgkApKUdadyADGoV4LGI+B3F63XuYfM7FJliMpj41INN7iBEj
	cRq3e34cDqEMNqTIinaAqp8HwtMNe+cj/NtnIjk3OQOaTlKAk6QibhPY0tCbx2DQYZwE
	fyn6CaU7OlC6Q3K9dS0CjMSv5ZsDNevx8EmgQuoe0ltt37sqzbom2wp+YEFxvrrVqxM+
	RlgA==
X-Gm-Message-State: AFeK/H2OCypX6NYJamde8Txte1iwATKDGxL8wFiwTA+cNMGSHF6x41VzYnQQWzJ+/yaIrgNHQ3+QO62LBboSwMYA
X-Received: by 10.223.169.70 with SMTP id u64mr21528420wrc.187.1490735303067; 
	Tue, 28 Mar 2017 14:08:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.145.33 with HTTP; Tue, 28 Mar 2017 14:08:02 -0700 (PDT)
In-Reply-To: <877f39p4lv.fsf@secure.mitica>
References: <1490608126-22187-1-git-send-email-eric.auger@redhat.com>
	<1490608126-22187-3-git-send-email-eric.auger@redhat.com>
	<877f39p4lv.fsf@secure.mitica>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Mar 2017 22:08:02 +0100
Message-ID: <CAFEAcA9YFWu+ZsNZWEHVgFuMOmW2tx2Hm5ewsrZ537DbySJ_hg@mail.gmail.com>
To: Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22c
Subject: Re: [Qemu-arm] [RFC v3 2/3] hw/intc/arm_gicv3_its: Implement state
 save/restore
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
Cc: Andrew Jones <drjones@redhat.com>, Vijay Kilari <vijay.kilari@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, "Kumar, Vijaya" <Vijaya.Kumar@cavium.com>,
	Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1vevN/oM5VKY

On 28 March 2017 at 20:45, Juan Quintela <quintela@redhat.com> wrote:
> Let me see if I understood this correctly.
>
> We have an ARM_GICV3_ITS_COMMON.  And that has some fields.
> In particular:
>
> struct GICv3ITSState {
>     /* Registers */
>     uint32_t ctlr;
>     uint64_t cbaser;
>     uint64_t cwriter;
>     uint64_t creadr;
>     uint64_t baser[8];
>     /* lots of things removed */
> };
>
>
>
> We have this in arm_gicv3_its_common.c  (it is exactly the same for
> post_load, so we forgot about it by now).
>
>
> static void gicv3_its_pre_save(void *opaque)
> {
>     GICv3ITSState *s = (GICv3ITSState *)opaque; (*)
>                                                    /* nitpit: the cast
>                                                    is useless */
>     GICv3ITSCommonClass *c = ARM_GICV3_ITS_COMMON_GET_CLASS(s);
>
>     if (c->pre_save) {
>         c->pre_save(s);
>     }
> }
>
> And then we have in the patch:
>
>
>> @@ -109,6 +203,8 @@ static void kvm_arm_its_class_init(ObjectClass *klass, void *data)
>>
>>      dc->realize = kvm_arm_its_realize;
>>      icc->send_msi = kvm_its_send_msi;
>> +    icc->pre_save = kvm_arm_its_pre_save;
>> +    icc->post_load = kvm_arm_its_post_load;
>>  }
>
>
> struct GICv3ITSCommonClass {
> ....
>     void (*pre_save)(GICv3ITSState *s);
>     void (*post_load)(GICv3ITSState *s);
> };
>
>
> Notice that I have only found one user of this on the tree, so I don't
> know if there is a good reason for this.

This is just following the existing pattern we have for
the GICv3 itself (and the GICv2, for that matter).
At some point we'll implement the emulated ITS which
will share the base class (and the vmstate).

thanks
-- PMM
