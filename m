Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5618512ejc;
        Tue, 28 Feb 2023 02:51:50 -0800 (PST)
X-Google-Smtp-Source: AK7set+uK13UlYzXbCqbP6tbkFHyxgGQ9L5cu0wk15+WYpfhEBhUT9/SE27Qap1Hslzzb3DDC4Su
X-Received: by 2002:a05:622a:100f:b0:3bd:d2f:8de4 with SMTP id d15-20020a05622a100f00b003bd0d2f8de4mr4277759qte.15.1677581509810;
        Tue, 28 Feb 2023 02:51:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677581509; cv=none;
        d=google.com; s=arc-20160816;
        b=sYgcI6+4p7BOs+jbZ//X0vyqKLOh4RCKl3v23IY3ThVX+MnFl1VKX8k0pvpifU//zM
         ZEakrLkBkcxHis4vtXfKs4hL8EojH7rPFrjre7sozok09YbiTf+WKaruoyNALH3auz7t
         34vxaOgfFjaKTG5rFm0JswFcqsXQ/gGr5wRqSKv3wEa7VFCWafhnJIA5QQ6ly12BAnBi
         lVaAyjTirFDULw5wRyRho2W93FoK0R1Mi77IZArJuaEkfjYgS8d0/f6ATRbdCriCQAPM
         MoSROxq9cQfhJkdgwL4NINInJvM8IKf//FGvcSYfKO9Av8SdTbZWpI15UOJkVctetBKL
         Y+qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=TIARw/Eg/FHCbkTqHcE3f9NxhqHaLUkccjhqbNiCijE=;
        b=atNZcSUBHgvr3L5jhBlhFjeNBdp32k39HeXoExPLiUGPIZzwvXrylu7Il7ns2jDLp+
         sPf8xKR91WGQYb2OlZOFRbu4EZ6ZYIFvV1BBfV5Hp6CbdNo6CApPcvmbeoSF1ksHPuCr
         kFfpYuBSx80sPcAc1p3ZurI5gU6A2o5ltaY+cbVCsZXarz917J/+P57vhE3dAlD7h99s
         bHuwtY76y6wPa/i3z9ZMo54fAgCBeZyVk8k3lMNibhnDqobMYbCSol0UoT94qEsqxhx1
         pO8Bld3eNOWl7Z3tFIFkWZOcVeoLG/HaIYIHx0uhEd7R7YOJBG1eXDpEZe6gTqpCrWHm
         wNVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=c3F+tksk;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <mst@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id m15-20020a05622a054f00b003b9a5ba03c0si8741398qtx.65.2023.02.28.02.51.49
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 02:51:49 -0800 (PST)
Received-SPF: pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=c3F+tksk;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677581509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TIARw/Eg/FHCbkTqHcE3f9NxhqHaLUkccjhqbNiCijE=;
	b=c3F+tksk3HY/zISIbUWNOP3IvpOgZgua9PY8CkgAFTWCpqTNwb6pzWxdbs+eTWhk2Dp9J1
	LDd/4lqwBLM+keI4k5vhpAkousMXo8jsAZo2LcrYsmZjmU8M8nl1dcWwQ2xxoKrRAyRvgu
	AL8p0p4yl7Xdkd/MKcLO2pJN6zpQhm4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-515-Xaz1-HBENHaIBg-NNx-Hug-1; Tue, 28 Feb 2023 05:51:48 -0500
X-MC-Unique: Xaz1-HBENHaIBg-NNx-Hug-1
Received: by mail-wr1-f72.google.com with SMTP id q7-20020a05600000c700b002cd9188abe5so193001wrx.3
        for <alex.bennee@linaro.org>; Tue, 28 Feb 2023 02:51:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677581507;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TIARw/Eg/FHCbkTqHcE3f9NxhqHaLUkccjhqbNiCijE=;
        b=58p2CPnfirRUq2qtMOp/LpbWUSZ7OhEuSjT95rEUF6HjoJhXYYSu8Lr8EHP0HmrlJi
         sqLQu4bqPHCebTRonmVY7A3yggNu8IYT+mv2JdrzGdkweoTwu8dqM4A7QQpyaPqZxsIi
         PjuuBRv7BJuzUwigs51QN5gvzece+Pfg/eVAEe+YDzeE85UA15R4BM1qzfElaJmMiZnh
         pzCKOAtFujz+kDQHoFGnqmftdlctyMxxLg6caVD4gbPaUYnXt8QucWcXSXHju4Dmp6lQ
         dgUqTc6DR8d7v/bpZVuGtN1e38ejyrl6cUdqmKLI7ax9l9hpdUsHQ7mV4S8Y/zXwdFTK
         Bcpw==
X-Gm-Message-State: AO0yUKWHA1d4fTQxfbQe+7Nn3FHxw4ORTUDOJIrMx5mrnSAFusJ1plAf
	sUdOUOQLG7Sv/NbJJ8PrHu/UzTHnq7eGg9GUIE2cppTGLGi2LLA3nwJTgHkqUKQok71L3ZPyTR4
	haptweRbB4wrjQAZQ
X-Received: by 2002:a05:600c:331b:b0:3df:fbd5:690 with SMTP id q27-20020a05600c331b00b003dffbd50690mr1723650wmp.17.1677581507230;
        Tue, 28 Feb 2023 02:51:47 -0800 (PST)
X-Received: by 2002:a05:600c:331b:b0:3df:fbd5:690 with SMTP id q27-20020a05600c331b00b003dffbd50690mr1723636wmp.17.1677581506970;
        Tue, 28 Feb 2023 02:51:46 -0800 (PST)
Return-Path: <mst@redhat.com>
Received: from redhat.com ([2.52.141.194])
        by smtp.gmail.com with ESMTPSA id 13-20020a05600c020d00b003dc1d668866sm15589805wmi.10.2023.02.28.02.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 02:51:45 -0800 (PST)
Date: Tue, 28 Feb 2023 05:51:41 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, libvir-list@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
	Maxim Levitsky <mlevitsk@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
Message-ID: <20230228055016-mutt-send-email-mst@kernel.org>
References: <Y/yY72L9wyjuv3Yz@redhat.com>
 <20230227150858-mutt-send-email-mst@kernel.org>
 <84d7d3e5-0da2-7506-44a7-047ebfcfc4da@redhat.com>
 <20230228031026-mutt-send-email-mst@kernel.org>
 <Y/3CiEKKoG06t9rr@redhat.com>
 <20230228040115-mutt-send-email-mst@kernel.org>
 <fe4626c6-6103-d5e5-6920-9dfb4777b979@redhat.com>
 <Y/3MIUDRBUSNg6C5@redhat.com>
 <20230228050908-mutt-send-email-mst@kernel.org>
 <87cz5uhy50.fsf@pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87cz5uhy50.fsf@pond.sub.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-TUID: qpe1KRMG+huy

On Tue, Feb 28, 2023 at 11:39:39AM +0100, Markus Armbruster wrote:
> The question to answer: Is 32 bit x86 worth its upkeep?  Two
> sub-questions: 1. Is it worth the human attention?  2. Is it worth
> (scarce!) CI minutes?

3. Is it worth arguing about?

-- 
MST
