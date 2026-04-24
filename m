Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3063FB44C3
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Apr 2026 07:09:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGAep-0007kl-RV; Fri, 24 Apr 2026 03:08:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wGAen-0007jo-Oh
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 03:08:57 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wGAeg-0004RS-Ik
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 03:08:57 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4838c15e3cbso69782975e9.3
 for <qemu-arm@nongnu.org>; Fri, 24 Apr 2026 00:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777014528; x=1777619328; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FqF+LZjzWBu9GOJemZquw+bvJb6uVyfeqWn420hEOWo=;
 b=oQiE+z/4GZyXi7ugiAn9ROKClnPXHUQWK59bwey+LwjtFn5gZ/4zQn+afaO9AQ9E0M
 9MzXx7QNG0TOP2UEpJgpvkPutBIIFjexIpVkRj80hINN7FNhfFfH6uTRaPuX0TAbZYl7
 3QDv9bCtqyNROv1zbYLBOPGUeGkv05wErR62PpzJujOmG3TaS/lozGHgKCql9rYiYE9N
 HFmoNLZvPZiCZIRQ+eYiQ9KL/qGwPxR/Wuz61jo5cT9e5YsNek9YuKmkAXGa+Iha9MiT
 ryy+mbP0BkvYkanu0TXcYP3NMjrtMxWsYbspM3rNNeCeiNUXdaXMxfyBam0AeHYbX1Nf
 qk7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777014528; x=1777619328;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FqF+LZjzWBu9GOJemZquw+bvJb6uVyfeqWn420hEOWo=;
 b=UlbvVAL42uWAv/bOPunSnHHI42C4lHE3DVHgVQ6fjuyzDBRs42qOWaiU9nGz0QU5G7
 BtJaXnvxgLFv56yjtXrDZES9dhXldged7sxjaaHKHiV8wuAvN08d+SLOKP8PZOGY6xdF
 rYrCtJCpSjXGYfq7z/htZIW/K4nAEMIaYHI70c/yb1y5CYxWBsDyT39k+tyMq8EaVDhK
 ezceHZfrKRy/fSzImcMX6l2HdN01OV+dwlvyRmj2n/GIlEGRDHkG/OxNYVhlk0ZLfXu3
 pwbNZ0ETQFi5of/Dx4G2DY/B3W/QIDj5Fu2yxNNPxNangGKRi4jKwLvvD8GNr8IGQeOU
 3Y6w==
X-Forwarded-Encrypted: i=1;
 AFNElJ+yqhmJNb/2IK56bkMg0PZHIKHiWrQJWeMZ7n8tAL5svNlT49A50BVWhTajf2tN940I6KIb9vl4Lw==@nongnu.org
X-Gm-Message-State: AOJu0Yxaxl4Dbgg2N/N0ID1tE0mJBEDcN1BPCHa5ntNTkK0A/DAR+dpc
 H8EkXHte5xaexEcJ9eDILr6LFDvLA2w828IbqZsdTmqQwqXazHB/DarrCXY7Cpy5k20=
X-Gm-Gg: AeBDievcqVuBvxJu3NlZ9f42kW0HDOWCqbupX0NqpUxaUmhEJ2D3SYpBfzbin0Wpqo4
 TVObPr2OI72Oj8cg8ISK5G/0HFr8i2gIbovMytgoHfvSA4AdavvNiBPIYrnOhVaTd+C6pvScszM
 abyMZEUzrZaem5WJXrjhZDhhxZMh8QNGuhSVtt0RtW8kfPNYqtFaPMTACbNuTruRUPfFOH5jGpN
 48Q9PvytO6stWr3FdCnCr57o3/ZFtiSOmztE7Z2DG9YhSJUyB1Djo4iOVTsw6nNpJoVAsjT/Nmv
 7H+CPs6s+VGJnLnqcIYYp2jY8COyr+eImG7lPcGl+uTJMXKkRlh57y0pcryZnnP9mNjI0zRfyy9
 SII5k/bV1i2OC7qPBk6BPALdax1IKJMbUs3YU6p0c6Z3aAYQB2mF0DC0rMOoW+17BjKTKCneCUa
 1G8EAUi1w5GDK7ggtYFiUPCc29oIZV1ixtwxQC2YJwXUz3JoqjAwi95DXIkbc08ho5n0saZm0qI
 V2HnDksFZt4nK0=
X-Received: by 2002:a05:600c:1e09:b0:48a:557e:6b4f with SMTP id
 5b1f17b1804b1-48a557e6c16mr201824435e9.23.1777014527787; 
 Fri, 24 Apr 2026 00:08:47 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb7ac6aasm180175415e9.25.2026.04.24.00.08.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Apr 2026 00:08:47 -0700 (PDT)
Message-ID: <8ef0c812-0dfe-4972-b68b-2afa570e838d@linaro.org>
Date: Fri, 24 Apr 2026 09:08:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] hvf: map granule abstraction, configurable IPA,
 and MAP_FIXED alignment fix
Content-Language: en-US
To: Lucas Amaral <lucaaamaral@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, agraf@csgraf.de,
 mohamed@unpredictable.fr, alex.bennee@linaro.org
References: <20260317175744.32469-1-lucaaamaral@gmail.com>
 <CAFEAcA9587cZ+oOv2t6No6eBJdR9gxow8RFqy-JN=7OH3xk7HA@mail.gmail.com>
 <20260423172210.51760-1-lucaaamaral@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260423172210.51760-1-lucaaamaral@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Lucas,

On 23/4/26 19:22, Lucas Amaral wrote:
> Hi Peter,
> 
> Thanks for the review and for asking Mohamed and Alex to take a look.
> 
>> The question that comes to my mind is whether the two places changed
>> in accel/hvf to look at hvf_get_map_granule() really are the only
>> two places in the whole of QEMU where we call
>> qemu_real_host_page_size() and expect it to be also the guest page
>> size. The general idea of 'guest page size might not be the same as
>> the host page size QEMU itself gets' isn't hvf specific -- maybe we
>> should have a qemu_guest_page_size() function?
> 
> Good point. I'll audit the qemu_real_host_page_size() call sites to
> see which ones actually mean "guest page size" and whether a broader
> qemu_guest_page_size() abstraction makes sense. I'd send that as a
> follow-up series once these patches land, so the immediate HVF fix
> isn't blocked on the broader refactor.

If using a generic approach, the property added in the previous patch
should go into AccelState, at a glance registering the QOM property in
accel_ops_class_init() in accel/accel-system.c.

Also HVFState::ipa_granule -> AccelState::guest_page_size?

