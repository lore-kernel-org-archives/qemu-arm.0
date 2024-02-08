Received: by 2002:a17:906:c945:b0:a38:6d10:c5dd with SMTP id fw5csp245243ejb;
        Thu, 8 Feb 2024 09:07:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUpTyeO1GgepVlZnF1GNFGUQM0R6RHjpPK18jRnEojsNqqfGnnQuEb0lkZF+pG8+okm6Zxq12EHIqvah2zgYca+oc/Ji5fx
X-Google-Smtp-Source: AGHT+IFHef3U42zlofIUB250hg2axRm3Lk4Up+/i4ct7HadpHIvauFHW3s50sHNHesTtUten/5wh
X-Received: by 2002:a05:620a:4009:b0:783:48a3:c0c7 with SMTP id h9-20020a05620a400900b0078348a3c0c7mr105340qko.44.1707412056854;
        Thu, 08 Feb 2024 09:07:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707412056; cv=none;
        d=google.com; s=arc-20160816;
        b=n9okRRZphzKZsElVpU5EoPWCRZ6zJ7Ha+5t31PJ3V7g8mSAapkspSGWeQAIwM2UTm2
         PrwWtGXlab8ghnqxbwySI4T4isNZnvvn13xRxedr7yKsyMcgo5M9iSFugKvD1nbazJJw
         PGCm90R1Tj5hJNGQxSOW7TPOZY81IS6JUPAbm3opgdsjDPmn8kKpURvtYGH+PWI+zn+v
         LIh/lD3k06CU6O5VVM5rimR3LOk5BKQACtFb/vp8d6UTa894IuVDzzE7ND6GQC0Zf/cf
         v96zZHxREhy+vAUZrc4osfzLpja49g3EImn9GsO5wYu7nh9+N8XvebDvr/lnhcozOh9u
         EJcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=o5tT5qe3Yo7UxCE9qJiNbYIWTlmaFuQtNXGcvXjgkAw=;
        fh=vFbx+rvudLoeYi93tVSfFCDBT/BifQLkk2qvEfp+UBc=;
        b=yzGlyXND0Iz2mg+9T4BTs7+3B1IhYrGYeeCuJTzr3bzxmMMIPlJtafHU+xKFPe2qqw
         QSf5E3RqMHq2+GQAFCXOghoSnnGImkta/kJMR9kUhy3TCNO0I5ATUHVG4aoIS6hg5wts
         XN+xFn+p+4vyeRI1A6Na47BT8zDBwKGVdBbWCQy5AQxCNan/5QX5/JrD1xOLtbA1K5ty
         f8oPMiqCFlN3qB7WVxdlKQyePY2z9AXkSdMfaRZ1IpWcLFjzAM3iU90PndjUjpCQ23v8
         807/qxHzpa6Yi3fYub71o6Vcdb+rbgE1YrL0Qoj3/q0w5JEIg0V60IvFcOeD0tcK6g85
         0ZWA==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
X-Forwarded-Encrypted: i=1; AJvYcCVs6yAJOmC72YlcUi9CVatku6bHBEE+zcs4cKO2dvysC5U845voakrlMdPTUZ7bwwZdt8xOy6I5HjK27tze9HW0DkuUtAM9
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o8-20020a05620a2a0800b0078591a5bdd2si442857qkp.221.2024.02.08.09.07.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Feb 2024 09:07:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rY7rr-0001Tz-Uo; Thu, 08 Feb 2024 12:07:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=cJ39=JR=kaod.org=clg@ozlabs.org>)
 id 1rY7rp-0001Tg-VN; Thu, 08 Feb 2024 12:07:17 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=cJ39=JR=kaod.org=clg@ozlabs.org>)
 id 1rY7ro-0003Fl-B7; Thu, 08 Feb 2024 12:07:17 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4TW3Lh0ZQTz4wcq;
 Fri,  9 Feb 2024 04:07:08 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TW3Ld6KDBz4wcL;
 Fri,  9 Feb 2024 04:07:05 +1100 (AEDT)
Message-ID: <17a2931a-5b3e-4eed-ae63-63b14032db6f@kaod.org>
Date: Thu, 8 Feb 2024 18:07:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/13] hw/arm/mps3r: Initial skeleton for mps3-an536 board
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>, 
 Fabiano Rosas <farosas@suse.de>
References: <20240206132931.38376-1-peter.maydell@linaro.org>
 <20240206132931.38376-9-peter.maydell@linaro.org>
 <b8fbf313-1b24-4cf3-b5c1-f9289b413a75@linaro.org>
 <CAFEAcA8UqeGKf8pP90i6Jn=AYgqtzFw141ptir=5BEZtpwjD2Q@mail.gmail.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAFEAcA8UqeGKf8pP90i6Jn=AYgqtzFw141ptir=5BEZtpwjD2Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=cJ39=JR=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: RqtTBbcfrCOg


>>> +/*
>>> + * The MPS3 DDR is 3GiB, but on a 32-bit host QEMU doesn't permit
>>> + * emulation of that much guest RAM, so artificially make it smaller.
>>> + */
>>> +#if HOST_LONG_BITS == 32
>>> +#define MPS3_DDR_SIZE (1 * GiB)
>>> +#else
>>> +#define MPS3_DDR_SIZE (3 * GiB)
>>> +#endif
>>
>> Generically, can we migrate a VM started on a 32-bit host to a 64-bit
>> one?
> 
> I think it's one of those things that in theory is supposed
> to be possible and in practice nobody tests so it might well
> not work. At any rate, this is the same thing we do already
> in mps2-tz.c for the 2GB DRAM those boards have.

We could have a common helper may be. Aspeed does:

   /* On 32-bit hosts, lower RAM to 1G because of the 2047 MB limit */
   #if HOST_LONG_BITS == 32
   #define ASPEED_RAM_SIZE(sz) MIN((sz), 1 * GiB)
   #else
   #define ASPEED_RAM_SIZE(sz) (sz)
   #endif

Thanks,

C.

