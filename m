Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1746169lfc;
        Fri, 28 Aug 2020 13:02:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpXuAicm3/PwgihHcqQfB0G/cn7kgnhWUY93MMO2H+GlC2UVEAHeIDyOAXNsDcMPSR1IUO
X-Received: by 2002:a25:3853:: with SMTP id f80mr4375388yba.47.1598644957149;
        Fri, 28 Aug 2020 13:02:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598644957; cv=none;
        d=google.com; s=arc-20160816;
        b=onT258wCaQ30/GKDfMFbE7ewmtdpcIkvsB126tnPtXDLTFpAoodgJGlCTH0SR5AmO+
         nfLJ4p7Ozto9w/QtZMBf88/Y0YQqHJJT+9WGBduY4tFl2DgiYuyOVrKgIqX+TwZ1aEWn
         FqJQSiWQPABAlUMbdp0P82as13NK0nUSSOranw/Xzhrk5wXBCQiVqrqjU67r7r5B9JoE
         w58PplnqICl08ueeGOWYzxJ5TVg+AdKmaXi/ij3Z/ecBabnr8voKfZrCyc3pru+YC1+A
         b1N/VDTSmrhdh6F10MXU5OISr03aitkLHEditdyj6+7JRRJbFt7Dq0Qf2Xb4O25ECvth
         Vd4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=hdsj7nza4NpVYYIqGQbcT5f4oV+qZDYCHoJXY4Ym8r4=;
        b=MgCtNfpjiSA4rWrSTaenVVoEsUoecXOf/Ut9oMkOyfT3xpUvY9tfKr0/l+eB0qPSUN
         CxJZO2YE2nONcpoR9qPiSBkBB3Jr3C5kaiosTA3PpbW1yJLUilPHRztraO0qbjOPQlqP
         EOxDvWuegdrv/WeiPhpDAGOXBnCnujeJ+kH3LaS6WUz+puExVaZOEfkVZKPNURx/ejE3
         rNPSPGN4/cfUVR7e4bt3CZwi+4ax9T66Xsx+spSLgtgEWW5kLFi7ymWDwmsBLwn7PWl6
         aBzvkzEmmtXk6Vp+PsezcbEdR6p0c6HIU6lmmwhAPQH3bk3+idha7voA3BYfJBKYuX8R
         yM0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="B9cmf/Ve";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m77si278024ybm.486.2020.08.28.13.02.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2020 13:02:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="B9cmf/Ve";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBka4-0004DG-He
	for alex.bennee@linaro.org; Fri, 28 Aug 2020 16:02:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBkZw-0004D0-9z
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 16:02:28 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:34838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBkZu-0000ba-K9
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 16:02:27 -0400
Received: by mail-pg1-x542.google.com with SMTP id g29so952291pgl.2
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2020 13:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=hdsj7nza4NpVYYIqGQbcT5f4oV+qZDYCHoJXY4Ym8r4=;
 b=B9cmf/VeSKMxqoHooDSP053erCqHmKTDSP/9veM7nQkYzN0LUeJGnacn4AfUjRIAdv
 gPQJ/fLXmHPkx5dmQC5n2DAHAQsIaAEB5tQ6gXKhPiyyi7XBcfDoglx41nThYWeNs43s
 StbSJTBFhRJlIDjJNcB4heQ4TtYQDcH6goxuIcvmGJIbE+YDMeFHfdbns0oX9hIci89S
 QfVm4/1RmF9UlopiXD2C9zEeDs4PHU/dQV611u4WlElHFHdP7pWGTgaWfUFjAHhtbWPj
 HSfGoWfe2ySR+IBvlJJxY3swOVlC7S4LGSnWfkXft5fGeUI5LBjIuXlLdEEHhZ+ePY6p
 x7MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hdsj7nza4NpVYYIqGQbcT5f4oV+qZDYCHoJXY4Ym8r4=;
 b=HtpXuODYlTfkgdS3+puIafuIadkBjP2dl5Z+BRstYYgllJUg6jLBO3DQansakQNWPp
 hVCptyrMjRfe0gbrx6OmgoP7Hv6yCHy5fwvXPAY65NvF58FcaEGcEMAwAF7jJkhe6MnI
 ODWNwAkbiyKERia7PNASsvhBLmi0pCqRcQlO1ebftqJV7iP5Meu77f6dJEZ7jSwfFo37
 mfpW3To/2hNDqv3X5I6z5hMQuTzI9GUyitxBT4m9xaYcc9ERVawyq2/hVU0fNXpW0B8K
 Gk9nVwHqiScWNeOkF17yc/n0f2308BwN+Zx+1vtJa5ayn09YPnJJBemkzYUX+0YNpw91
 LLLQ==
X-Gm-Message-State: AOAM533ylt6Ys6XFUGhSq7TGa9OQUy58v5gcgVfLlfVaieb248tX3RkL
 p9SwSiLJPVrld+QbDTxNgaEO4w==
X-Received: by 2002:a65:6a55:: with SMTP id o21mr358813pgu.64.1598644945082;
 Fri, 28 Aug 2020 13:02:25 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id t63sm288755pgt.50.2020.08.28.13.02.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2020 13:02:24 -0700 (PDT)
Subject: Re: [PATCH v2 22/45] fpu: Add float16 comparison functions
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200828183354.27913-1-peter.maydell@linaro.org>
 <20200828183354.27913-23-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <21836c8f-93ba-2bbc-d658-a595ace87b3e@linaro.org>
Date: Fri, 28 Aug 2020 13:02:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200828183354.27913-23-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kwKAo89SdrNI

On 8/28/20 11:33 AM, Peter Maydell wrote:
> Add comparison functions for float16 to match the existing float32
> and float64 ones:
> 
>  float16_eq()
>  float16_le()
>  float16_lt()
>  float16_unordered()
>  float16_eq_quiet()
>  float16_le_quiet()
>  float16_lt_quiet()
>  float16_unordered_quiet()
> 
> These are all just convenience wrappers around float16_compare() and
> float16_compare_quiet().  We will want these for AArch23 fp16
> support.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

I already have this queued on my softfloat-next branch.

https://github.com/rth7680/qemu/commit/dd205025a048ef6f53ff51eb86ddc58e7a82a771

I plan on issuing a pull request for it soon.


r~
