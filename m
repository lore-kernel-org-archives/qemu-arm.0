Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FE660A2610
	for <qemu-arm@archiver.kernel.org>; Wed,  4 Nov 2026 18:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZPEnBVfI
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOfdM-0002tf-W3; Wed, 04 Nov 2026 13:22:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1xOfdJ-0002t1-Oa
 for qemu-arm@nongnu.org; Wed, 04 Nov 2026 13:22:49 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1xOfdH-0002iQ-Vr
 for qemu-arm@nongnu.org; Wed, 04 Nov 2026 13:22:49 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-48e4831c028so981092f8f.0
 for <qemu-arm@nongnu.org>; Wed, 04 Nov 2026 10:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793816566; x=1794421366; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=CZgI5QYnd/Z8VvG0eAcZlVQDWryrAu9LfYNefXVRia4=;
 b=ZPEnBVfIwYAHPzzllltu3dAdCggG3gDMwn/Rwxcuwz/PmsjIq0IXvwwK9MBq8fL6Gc
 UfWCa5EcxqjehzEZJU7O/YTr78ERCn8c6FpCfOzxjXZR8d5Fmae5CcI14ah3culnJVTl
 4xIvCmapRo6aU0+efMj5xyU1+8S4Mf4ed5AldyRTYVhIlWzOFw78fDOSi5OqVC2FN/Gb
 NeKnsS1kztjMQvsG9nUlmrU7gfinQ9wBdH6+pKuqpMT0IfdsJnW/b825TkoMKNTUGxNp
 0epAvN4Y4v3ZtaY2UsTda6DYVVjNjgsq3RZn/M9/ahFTpKWoN/CNAWoAhDrfrOtHVa1t
 7NUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793816566; x=1794421366;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=CZgI5QYnd/Z8VvG0eAcZlVQDWryrAu9LfYNefXVRia4=;
 b=SYrDnFvAcWyFaLfbAX3f7zfummgaGGQlD17v2TTjKwxQsjzJQaVuxum8fWtPWnBt4n
 6InUJ+6a0TLjPT8taG4f53r/JU0L7MosiVTad3WAS6Bgbe7czjZieatadj+kYR7F/EdN
 jzCH8e8rBXj0/UH4sGlqXQkNL7c8h0h9BIoORZsbRVcubZGRoPfqxD0Rgl1PWAK/Aar3
 tsMWmZ3ndIQLhHo6F2LWBJsYCGKpx8t9pRYwCTdQk64xcZTGhY8GGvao6UU9kAOIJSy7
 jBRMg/TCqlLAogwt5duH6SjC1tpvddGcVvnQxyOBInrvySdKgeVF8C8EE1X89VoltdNL
 64Qw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzVo+Fu+HIp0Mongx4E1lNmO6Tmw8UoqFitEZowBRANrsL1xd3plHgh66l3VexF1sXuhCQOSEwVaw==@nongnu.org
X-Gm-Message-State: APuU4Z/RFqI5qiy893J+blC9j5VTpfbCTW+O3cJjB4XghYmy9ZX7yNAY
 csdC+Uu0l8cxCg6VztkQpShDkGL8PQnlws3T5jKRUxFS+9sMIDD1F8ko
X-Gm-Gg: AYBFou3R4EtB3909UhhXb2iJ/MjsaO/mTI5OBq+eT5vCjGif9fKx27SGXndk45fvdxN
 bLhvsb9oPDe7kP8hwW8UKo491fmn+C3sCj26uyLGmsPVfl/FQqhWSyZPy0fw/i3Gsb4IQk+s3G7
 /B4ZWvLFlRsjzC0CAv0OXP4THfnl9z2P8myfo/aQzJLqfVCo3lOWoGGDqsiAwHm0Ho/VYKJuNn5
 tXtWrt/woH+5XFspKFbiuMaj5q96HAk51ZHlsT7si/os61jPXYSaKg+1b0aiqIJemmtFbXY96XX
 ix3zT67A3u4YPbViRs9XqEjRnnI3mI4Z/4zVgYfZnpTSa2pfl9olYPC39rIUCh+WrwSUHDaV1pM
 Gy8CdvFvjZEmFq/vnlmAAPoXfF0NuoSLLEFvz7Uxyb0RsdKAQBhMrkWu5qQS3mP9aEOb9Nx7QyM
 tVn/ZxsLii1vszUL6ai+pWW5ksbG0RHSr7K3A+uYxeP3veVqzN12LdBdqGqc4KqM/wc1yV8wkfF
 Q5v7gT+JP6LILm9T6KPwI1POy7mF0/sSfFIsTpFA3S6P16AgigIWINQ+mRDT6HpG3nHXy5lGsog
 iOxiOiWycYTDLNzDjO5qOEDD9WKmnUPiSjhi29YCGtajrnEyaXoQgGIJLnd32sbjccyt
X-Received: by 2002:a05:6000:186f:b0:48f:db47:6ebf with SMTP id
 ffacd0b85a97d-48fdb476f92mr5924270f8f.38.1793816565861; 
 Wed, 04 Nov 2026 10:22:45 -0800 (PST)
Received: from [192.168.1.130] (93-143-60-191.adsl.net.t-com.hr.
 [93.143.60.191]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48fece99a5dsm5093377f8f.21.2026.11.04.10.22.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Nov 2026 10:22:45 -0800 (PST)
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
X-Google-Original-From: Ruslan Ruslichenko <ruslichenkor@gmail.com>
Message-ID: <0b67848f-d69d-4402-b378-4012bcface17@gmail.com>
Date: Wed, 4 Nov 2026 19:22:43 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/20] hw/core: Implement Remote Port Memory Master bus
 transactions
To: Itai Handler <itai.handler@gmail.com>,
 Ruslan Ruslichenko <ruslichenko.r@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, artem_mygaiev@epam.com,
 volodymyr_babchuk@epam.com, peter.maydell@linaro.org,
 francisco.iglesias@amd.com, edgar.iglesias@gmail.com,
 "Edgar E. Iglesias" <edgar.iglesias@amd.com>, berrange@redhat.com,
 eugene@nuvacore.ai, Ruslan_Ruslichenko@epam.com,
 takahiro.nakata.wr@renesas.com, philmd@oss.qualcomm.com
References: <20260915160044.345788-1-ruslichenko.r@gmail.com>
 <20260915160044.345788-12-ruslichenko.r@gmail.com>
 <20261103135503.71748-1-itai.handler@gmail.com>
Content-Language: en-US
In-Reply-To: <20261103135503.71748-1-itai.handler@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Itai!

On 11/3/26 14:55, Itai Handler wrote:
> Hi Ruslan,
> 
> On 9/15/26 18:00, Ruslan Ruslichenko wrote:
> [...]
>> +    rp_write(rp, (void *) &pay, len);
>> +
>> +    if (!rp_timeout) {
>> +        rsp_slot = rp_dev_wait_resp(rp, in.dev, in.id);
> 
> Thank you for this series.  I have been testing v2 by booting a guest
> from flash behind a QSPI controller modelled as a Remote Port peer.
> Every guest access to the memory master waits here for a round trip to
> the peer, about 16 us, and U-Boot and Linux drain the controller's
> FIFO one 32-bit word at a time, so a 15 MiB kernel image takes 64 s to
> load.
> 
> In my tests, a small read FIFO in the memory master, which the peer
> fills, makes such reads 13x faster (the kernel image loads in 4.9 s).
> The peer may send a posted write before its response to a read, and
> the guest's next reads of that range are then served from the FIFO
> without a round trip.
> 
> Would you consider including something like this in v3?  I have a
> working patch on top of v2 (about 140 lines) that I would be glad to
> send you or post as an RFC, whichever you prefer, and I am happy to
> test v3.

Thank you for testing and the feedback!

Yes, I agree there are a number of performance improvements to be made
in this area and a 13x speed-up is certainly a significant gain.

To keep this patch series small and reviewable, I think it would be good
to focus on minimal core transport functionality first, before subsequent
optimizations.
In fact, there are a few things to simplify even with the current series.

So yes, it would be great if you could post your patch as an RFC, so it can
be reviewed and discussed on top of the base series.
I'll keep you on CC for any future revisions, further testing and feedback
would be very welcome!

--
BR,
Ruslan

> 
> Thanks,
> Itai


