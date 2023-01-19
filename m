Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp637333ejc;
        Thu, 19 Jan 2023 13:40:10 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtyfBgdY7gEvCrAkjXyAXfTlbtw4Q6HOmxlp9wIAy2g6LmjRXyk1u2uEX3mAQm9ER7LeTh8
X-Received: by 2002:adf:de81:0:b0:2bd:dc5c:7e4c with SMTP id w1-20020adfde81000000b002bddc5c7e4cmr10716748wrl.15.1674164410129;
        Thu, 19 Jan 2023 13:40:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674164410; cv=none;
        d=google.com; s=arc-20160816;
        b=xOsTuHm/VRKQfFGxWyPf6jlRAYLHIFnAAdUA7Ve/9mdvYFRRDSE1OpU0XdUYvFaii3
         LLfzhIOKVEv5XFhrZtyoLXI0kwyOAxYupcYux0Geoh69rXATfZ9ZKwQxLFO2W/r14U8C
         0Qorp2s7yj2A8lLhFIpD/gPQ0Yra0EXFlE7Boe6yMFDBex8kOjbY3H3WeSSvHIZx1am+
         s9wxDqEOhcpfZ/WF9a/+69pQgmHkeoNB7+DpJpC/QysWCq/5bNcbJ57DRJr3EwH6IS5I
         5n6ulCBg/6G7dQtUSyzCdZ4cqSvYciyE+MmhZp6QBe/1m0aTiJt0uKdYusrP1LZCbxwQ
         LFUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=RoEh7zPScss2YI3wPFjVqkzK4GVROPBcUOeXIx4Ip6Y=;
        b=akDY4wVacEid+duNm5LZY59TFKb05EmEIlcVJw7PfQCJJKhSVvHYcSdzCnKZqnRC34
         rciN7t2Cju7MlxAXc3jj/04NyyoHcYc/BASll7BsmUzMtgFGG3a/MshWzLjxxouvelJ9
         FkEhD7KTBYA3C5Lud831G01XjpqPrhRbQqOpgZkWWwgaLj+GbSl9sNz8naXYEAZ/GZSk
         uUcz9e1xf99yBnmhozlfQG3xT/IjO5OvhdHkwOLoHAlwn797WfYjPqIf3pDdrqw0fc5i
         G9Z/PDOtOV+yLB3oQclCap9z575uF5nPnhbnez2loug5yFlFogZNDv9EU/JzWZ2n+lo2
         7VOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=Qiu65j7W;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id b15-20020a05600003cf00b0028d35a4efebsi32381489wrg.573.2023.01.19.13.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 13:40:10 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=Qiu65j7W;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 92CE42199F;
	Thu, 19 Jan 2023 21:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674164409; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RoEh7zPScss2YI3wPFjVqkzK4GVROPBcUOeXIx4Ip6Y=;
	b=Qiu65j7WmiA7K0cDkfdRa7tML03klXjRKnIZorYP18nrTBoWU90rH4wZ5GCmfHXhuY9Pg3
	lM1RH0qspaLowM/G3Yi1b+oyzbwM/wjHi2pI9OnAnXqTlePnG+9NzmJTiE9jHkTkh0XoWd
	WlR6UU3xJeAmgmvmz1dNtcXmppNmd8M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674164409;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RoEh7zPScss2YI3wPFjVqkzK4GVROPBcUOeXIx4Ip6Y=;
	b=vqa/3VBW878i5N4gfaKxrY4L3yCwRBLCeU4G8ucUoTq33q6JzYMbOjosqoiBM4Uw4wozwo
	P9JM4Vf35yANUqDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1C1E2139ED;
	Thu, 19 Jan 2023 21:40:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id WhBzNbi4yWO9eAAAMHmgww
	(envelope-from <farosas@suse.de>); Thu, 19 Jan 2023 21:40:08 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Richard
 Henderson
 <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Alex
 =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: Re: [RFC PATCH v4 14/15] arm/Kconfig: Always select SEMIHOSTING
 when TCG is present
In-Reply-To: <440155ee-4782-c7fa-6860-c39a983aecae@linaro.org>
References: <20230119135424.5417-1-farosas@suse.de>
 <20230119135424.5417-15-farosas@suse.de>
 <216d61ba-d5a4-f701-0190-0656e7e2e40f@linaro.org>
 <440155ee-4782-c7fa-6860-c39a983aecae@linaro.org>
Date: Thu, 19 Jan 2023 18:40:06 -0300
Message-ID: <87y1py2og9.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: RTgmduBLu1XU

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 19/1/23 19:50, Richard Henderson wrote:
>> On 1/19/23 03:54, Fabiano Rosas wrote:
>>> We are about to enable the build without TCG, so CONFIG_SEMIHOSTING
>>> and CONFIG_ARM_COMPATIBLE_SEMIHOSTING cannot be unconditionally set in
>>> default.mak anymore. So reflect the change in a Kconfig.
>>>
>>> Instead of using semihosting/Kconfig, use a target-specific file, so
>>> that the change doesn't affect other architectures which might
>>> implement semihosting in a way compatible with KVM.
>>>
>>> The selection from ARM_v7M needs to be removed to avoid a cycle during
>>> parsing.
>>>
>>> Signed-off-by: Fabiano Rosas<farosas@suse.de>
>>=20
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>=20
>>> The linux-user build does not use Kconfig. Is it worth it to add
>>> support to it? There's just the semihosting config so far.
>>=20
>> Probably not.
>
> I hit this limitation last week trying to restrict libdecnumber to
> powerpc targets.
>
> Fabiano, do you see how this can be done easily?

If you grep for Kconfig in the top level meson.build, that code there
could be adapted to also include linux-user targets.

I did some experimenting and I could generate linux-user.mak files with
all the configs from the existing Kconfigs. It would be a matter of
adding the proper CONFIG_SOFTMMU, CONFIG_LINUX_USER options to separate
the two and then hooking up the .mak files with the rest of the
build. That last part I'm not sure how to do.
