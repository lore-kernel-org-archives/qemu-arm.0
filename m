Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3719DCA0EE4
	for <qemu-arm@archiver.kernel.org>; Sat, 23 Aug 2025 18:13:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1upskB-0006Oa-CJ; Sat, 23 Aug 2025 14:13:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1upsk9-0006OG-Ji
 for qemu-arm@nongnu.org; Sat, 23 Aug 2025 14:13:33 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1upsk7-000137-OO
 for qemu-arm@nongnu.org; Sat, 23 Aug 2025 14:13:33 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-71d60157747so25959817b3.0
 for <qemu-arm@nongnu.org>; Sat, 23 Aug 2025 11:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755972809; x=1756577609; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=j54QpuXTFqkjpnANd0IvJVoslxJkKZt+a9oamCFvCe0=;
 b=LpAhY8ghJ5SCZzH5tBmS5G4rW6LeEC7hRO27atPXlRkAH8vTb8Zu8fvjej7e//qAGQ
 TwXbXoIvkLyfZlZ6Go1G+tuqHgfOWoTIPajfpWDjMOyHIIMso66VPb6ty5Jbxme5GNp0
 jwNTo7W9oqawaDvOzSnPobqPlxUuPdNegRhz4MhzACORsUX90qApHb65Ou3bHRIKRGoW
 /M/49vACmhfCQlJ2hddTXhXdtLtoxjmgI+fPxcPEMQ/y2pBsYxxkTrMbyFi7jxgt82wu
 pZ/LiBVCvItZzHasbHoS7eafEq3IbTkHcO1pRNVbi3hzulbUXhxarB1/D/uZdt8NN/Nk
 awEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755972809; x=1756577609;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j54QpuXTFqkjpnANd0IvJVoslxJkKZt+a9oamCFvCe0=;
 b=qo7Hq1ksKMbHK0BW2JuBhn7WLtpCbEDX3XxRFSvq0FWlCLuz6GQUNjHX+YWgeH8Ae0
 dXC2PUuFlJt7WLuR/IuY2Z3XRxNg9gQYD1WTLQlV0x+ti/FGL1QE1UooGzjNMZluWcgX
 nLscP2hptIpzTq+v3hi8QOSo5KBrnUwZiKUlmC+k9E4KwSi0ZDwBk7m0Zj7xftPWiuaT
 rVtvDol9VAEwXNhk2nQWip4SP7x/Q/6fq27AGKrDESLIHkfYVnYyfmfb/xc1YRBPzbLZ
 LaAa9co0KE8JaXzJT6l1aGWdTVKnlQLSOzc1b72paFAIDcTtkWGa9TNW01c/C6RKC70N
 Zf5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQ8X5hgfnps9yu7e5kxe6woRnNwiypQ8qJJKgHgk1qmWj/F/j5bo5AT0LbP84BZadf3OCH+C85Eg==@nongnu.org
X-Gm-Message-State: AOJu0YyMqRld/WK7FrXn2ALhO1Z5Mcrz2Rgfm4u9iPD9pryFIhbJAj5f
 vIQYhvhHzct60m5wHoX1ewDVgnbNpfaFiyKWVC8NIDkeD9d5nSM/2e2TFpXznFyp9XddDx0bl7r
 lZzB9Gw4eSKhdYGZW/wfLmx43XXIRxg+SkxjU6EbI/g==
X-Gm-Gg: ASbGncsg9Ue6Wo5tHkf3hltJO9d5jiPZEUv+mvMznYPaFe4g3S/KVmzrOGIXDFcMdGU
 YyopcgArJVfziBahxBkCBMkh8/ptX+k9L1QrCIrdohZzdmSzBjCq3cOfLSrJHF9GIiNFbK7W5ur
 PWvjT9kKmkW+3vp8TnQS50li+SS70AeW3U++QYGB2XwZBoGzwdZqiVnbgK0Uxb4vfjb2MJ/y2Ao
 Upl8wuu
X-Google-Smtp-Source: AGHT+IF+9yiOtGZ4E12AEEF/XLg59GizlWvCcIigLCDcRRxXhOdC7DRPLImG1MHZvhu2EHcDG6LvdWrGeCk7PdjGT7I=
X-Received: by 2002:a05:690c:7487:b0:71f:f942:8474 with SMTP id
 00721157ae682-71ff9428641mr25497187b3.49.1755972808638; Sat, 23 Aug 2025
 11:13:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250811193654.4012878-1-vacha.bhavsar@oss.qualcomm.com>
 <20250811193654.4012878-5-vacha.bhavsar@oss.qualcomm.com>
 <CAFEAcA8FchF06dGdixBwY8GWSF3kREuL72ZmeyG_cYqzAmuEjA@mail.gmail.com>
 <CAEWVDmsqgrnXgte0Sb+uzHmu=jHkXWvfHhYme-9hwng3XvrwVA@mail.gmail.com>
In-Reply-To: <CAEWVDmsqgrnXgte0Sb+uzHmu=jHkXWvfHhYme-9hwng3XvrwVA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 23 Aug 2025 19:13:17 +0100
X-Gm-Features: Ac12FXzHFJOGQj6E60pls10-fh9mBBHF4NjkUm1RGw1mVrRyWsNlcFH2GyYYmsM
Message-ID: <CAFEAcA9Bf7kWL20hzCQP5GSAN1AkX0FnqZv_TdTOpQFLSTCdeA@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] target/arm: Added test case for SME register
 exposure
To: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, 22 Aug 2025 at 18:32, Vacha Bhavsar
<vacha.bhavsar@oss.qualcomm.com> wrote:
>
> Hi,
>
> We have tried to replicate this issue on our end and it
> seems to stem from the int casting of gdb.Value type of
> a 128bit integer. We have run the test with different
> host architectures, gdb versions and python versions
> both with and without the int casting. The results are
> as follows.
>
> gdb     gdb target           python   host          int cast status
> version support              version  architecture
> 16.3 --enable-targets=all 3.11.13   x86        yes        pass
> 16.3 --enable-targets=all 3.11.13   x86         no        pass
> 16.3 --enable-targets=all 3.10.18   x86        yes        pass
> 16.3 --enable-targets=all 3.10.18   x86         no        pass
> 16.3 --enable-targets=all 3.8.10    x86        yes        pass
> 16.3 --enable-targets=all 3.8.10    x86          no        pass
>
> 16.3 aarch64             3.11.0rc1 aarch64      yes        pass
> 16.3 aarch64             3.11.0rc1 aarch64       no        pass
> 16.3 aarch64             3.10.12   aarch64      yes        pass
> 16.3 aarch64             3.10.12   aarch64       no        pass
>
> 15.0 multiarch           3.10.12   aarch64      yes        fail
> 15.0 multiarch           3.10.12   aarch64      no        pass
> 15.0 multiarch          3.11.0rc1 aarch64      yes        fail
> 15.0 multiarch          3.11.0rc1 aarch64      no        pass
>
> 15.0 multiarch          3.8.10      x86            yes        fail
> 15.0 multiarch          3.8.10      x86             no        pass
> 15.0 multiarch        3.11.13      x86            yes        fail
> 15.0 multiarch        3.11.13      x86             no        pass
> 15.0 multiarch        3.10.18      x86            yes        fail
> 15.0 multiarch        3.10.18     x86             no        pass
>
> Could we get some more information about your testing environment?

It's just stock Ubuntu 24.04.3 LTS on x86-64; gdb is gdb-multiarch
GNU gdb (Ubuntu 15.0.50.20240403-0ubuntu1) 15.0.50.20240403-git

-- PMM

