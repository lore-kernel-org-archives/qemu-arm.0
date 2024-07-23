Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2309241njc;
        Mon, 22 Jul 2024 22:39:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWcIuUoaviMAbr/iE2ud8irXHnbnTjwQRhqKVCbKS+29EUz/94CCsQf5/Gbi24KNfsfqgnuYT53qwjApKTB9pC79MedAmRb
X-Google-Smtp-Source: AGHT+IFsoq1x/vlIeuV3w1xOFvDZaHT5ulKBU1TAdPWsyA9cBjJCS1rCJ690kkIfc4n7Vu/zMLTN
X-Received: by 2002:a05:622a:1a91:b0:447:f953:7b63 with SMTP id d75a77b69052e-44fc559c194mr22448711cf.53.1721713172098;
        Mon, 22 Jul 2024 22:39:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721713172; cv=none;
        d=google.com; s=arc-20160816;
        b=SZSNo6UFxbshU39PJWdmd8BmYSVv7VIK3gBd5z7ZxLBnx69VUFAHo9HZAgiSjT+Qny
         QY7TLJzvmgWdBd04j8sk6XokrXVnsG0KWb3tnETPYZdWjX7kJNDEI0wWwP3JHNHQsdiz
         ck/fQ5Otd8JC4viVBjqRqOh1oFl/QS4AWJm1UnnR9UnFFMoeFnc3mQ8uj1AozEgI/Fs5
         NKIImqyYF9yd8M9Wz9g3KiA0DN9fmddiA0EvPPYWTWB66EW8hJbEehGZBplTGieOKCLW
         Au3z47hqLg6rCWktA4YCRhQAiFC8h0MpshalBNj0ZprbxsDm0niC/XgSZysP1vJdZfiu
         mcpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ePXbvrz2owIZAgKwsC8DIPvxfFBnNSm7YOhYFFacvq8=;
        fh=9/3ubv36hKsHyA9QMzlBxE11ru9ikBLbp0BqAzxvznQ=;
        b=tfT7qknsNLFGIef3wSDRpbSfUQjIS5mOv9oq2RzRhRWy4kVY9n1pY0GpYLZSRncNyh
         Z7qYV64tu0o2Ds2eldisEvHhAqHrMwiyxW6UMKhW7qlkIHvSTFXIul3qpJoUGeEHJBoF
         b6U95A8gfy+nWeyvSipk/OJvnfpqnNyfuM4uXnmOX548VEb/7Cy9yKTk+BPxXkQJBuo7
         qb9b7z8qY3nc5ASfARlyqsANkp/PXlbNUWR5oFjN/md3JHrg1aLhX8l4Jlq7Z0Avc9oT
         tawX6L4npR5HwkJcH/9lHkcNwQDJennuVNV7QnX3OWvJHUPL34qgoank1h90HZzQbQhy
         0ulw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L8Oqn9g3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44f9ccfd51fsi96220971cf.14.2024.07.22.22.39.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2024 22:39:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L8Oqn9g3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sW8Ez-0001P8-AA; Tue, 23 Jul 2024 01:39:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sW8Ey-0001KT-1o
 for qemu-devel@nongnu.org; Tue, 23 Jul 2024 01:39:12 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sW8Ev-0004VO-Mk
 for qemu-devel@nongnu.org; Tue, 23 Jul 2024 01:39:11 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1fd6ed7688cso3214575ad.3
 for <qemu-devel@nongnu.org>; Mon, 22 Jul 2024 22:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721713148; x=1722317948; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ePXbvrz2owIZAgKwsC8DIPvxfFBnNSm7YOhYFFacvq8=;
 b=L8Oqn9g3R994iTa9eQtV+mH80tuz+tP0NQoJEgw6rszYPXknRHGM9MSZklf0JB6PD0
 Fyri2PuAxoQQz4Xc8tZm/4WsnOhrcaOGGqSn7gkijt6zuxrJa7TOPRtk+muCOrLzlQZr
 OfmTgDxwpTCW32p3zBIQ5mAGgqfFefC4h0MGR78cl0v7TCB0Bvumoc71OPdjTG8K2lhM
 bk3lE/IyRsKETmuY208RvgX1S/GpmxuVZyZp6+HMYsBZLA3iOdKNJkghR/oDoRJrodvJ
 fSi5UfWx/jNTeMfNh7ldjhcRsyj1Kr+WkRSCSXNHW8a7szG/dJiYEr7/AiPapa4XP0rc
 kFfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721713148; x=1722317948;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ePXbvrz2owIZAgKwsC8DIPvxfFBnNSm7YOhYFFacvq8=;
 b=lDY00ddoaKDifx20/XO+1fFJl5U0FFEAOr/IkZfCZLfrLjvgg1MjamGO181aFTTtLy
 t8TWbVPRYgRfwB/fDqxAEPQkZcC4JIwu7C6Y5ZPy9ijzQ+Eicm31dUmDT0NtIcYc+7o6
 MqLGhwfqdE9oiNgYUr3Ihzokv4VUHNF0z9MpS99/8v8KoXd7Qmv4NgE48HUylfsk0kcq
 w2AikrrmBXKQ/T89Mr4yNPJCEmqBzwfMcsSNkgfIdc0FJlL3HE99dSaiMJUcTVu1eUqE
 3BLqtuBqvaKKa1yZ7zMqTn4Kz6ECqqBYzhp4JeG0VTdjmj20b+wAOMoXcucdUNtXhHjg
 ylnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWl8wLj1Ao0Vt5Lt2nc07T60YDQvMLc1zITRWNnn6cUcRTFak2Oquma1Y46EY2JESTSNApoRvV+6o/5o1FyohgIKHAgZ8U=
X-Gm-Message-State: AOJu0YwDnYhLiV3hJcb/7PNwgB/S8SX568orvXcVUlmxSCCrZ6Jang6D
 rwntosuKBWR+aw74ELmvtdk6TD38FGnmTSYS+6vvqAaztjPLX+vcFGFrYsFiCk4=
X-Received: by 2002:a17:902:cec4:b0:1fb:247b:aa2a with SMTP id
 d9443c01a7336-1fdb5f971b6mr16114075ad.59.1721713147948; 
 Mon, 22 Jul 2024 22:39:07 -0700 (PDT)
Received: from [192.168.1.113] ([203.56.128.103])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fd6f28cf4bsm65098395ad.85.2024.07.22.22.39.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 22:39:07 -0700 (PDT)
Message-ID: <1509eff8-8969-47c4-ad02-c40b9fd0a3f2@linaro.org>
Date: Tue, 23 Jul 2024 15:39:02 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/14] bsd-user: Add aarch64 build to tree
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20240722214313.89503-1-imp@bsdimp.com>
 <20240722214313.89503-15-imp@bsdimp.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240722214313.89503-15-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: lgY6i1L10UpY

On 7/23/24 07:43, Warner Losh wrote:
> Add the aarch64 bsd-user fragments needed to build the new aarch64 code.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   configs/targets/aarch64-bsd-user.mak | 3 +++
>   1 file changed, 3 insertions(+)
>   create mode 100644 configs/targets/aarch64-bsd-user.mak

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
