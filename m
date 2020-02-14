Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp2336985lfp;
        Fri, 14 Feb 2020 12:17:11 -0800 (PST)
X-Google-Smtp-Source: APXvYqwPvZfgZKQg4hY1zNMT9Yp6lOQvOhGUBwJH/NED7zpKQnH41f2d/r2+Tz0S7D1K4916eTdz
X-Received: by 2002:a37:e30d:: with SMTP id y13mr4157905qki.417.1581711431464;
        Fri, 14 Feb 2020 12:17:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581711431; cv=none;
        d=google.com; s=arc-20160816;
        b=XXW1wuayNTPU5XftNBM5oE8s0PGja1SiiM30vAzLgDw5q8v5jDlj66wErHS8FK4VsA
         J+EfH0d0PHtsK5lCO+0CJKzi9Lgi50hnCcYo8Qtqp/mTF9esPosExc2KPNBnVcfzGm+m
         SkLEWRoiQ/iQtg+85tnYA2iiDqCNYErN94RteKX9ePp0/cpZZZPCPr94A/FGmFtijaaJ
         xg1KYRbbKNo8UkCPuV0Jc1sHMkA9odAzQtQsie7cWBr+KkFWlXjpC//1jizbdE0cX+5/
         rkXPPNiQkH959H1dtEvFkCu66P4D5LZF3snuDy7nuHsVry+GRdutB9ZoLBjvfaMtjJxh
         JYaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=yLOIlj4grM8eviEKTqXRptVV66hvg/CY2BHHsnJ6OZY=;
        b=cKHb6zLPBjeUdEH0ruzDEx+hvubw9HWAhZdnNXMaq2piNX4pFhVm4dsW5nGDgP/Yxn
         PPGWJ9QLdKcsWBcBxtfsrzgTZeTbYQdDrYR3OrdEn0cwg7r3VTD4PBilz/Fg4U+YblCs
         6PY2KvpNv05g9Y1nfm01lhjF/L97rgYbJw2tNgDBEzhtMOp8uyZmjERJXnIS/0AY6SYx
         BuZHylEGAfXrBRaiLmz+7puJMqJhBmKvIFSIRN84C7GDHYw3mmEdauBvMdEouGCXKA9w
         ojVi15WpPEudNp04G49Nj6/wLPH8xa5V4CHvacXXFdueqgem4SXax3XHGsiHDHi0Ghif
         Lgww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ktT3k91Q;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x33si3194925qtc.75.2020.02.14.12.17.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Feb 2020 12:17:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ktT3k91Q;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2hOg-0003Xn-Ql
	for alex.bennee@linaro.org; Fri, 14 Feb 2020 15:17:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53284)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j2hNy-0003VQ-LN
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 15:16:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j2hNw-0008W9-Pp
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 15:16:26 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:42740)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j2hNv-0008SS-2x
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 15:16:23 -0500
Received: by mail-pl1-x641.google.com with SMTP id e8so4116801plt.9
 for <qemu-devel@nongnu.org>; Fri, 14 Feb 2020 12:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yLOIlj4grM8eviEKTqXRptVV66hvg/CY2BHHsnJ6OZY=;
 b=ktT3k91QI2LArI/nDEvOp5qp1+rc2G6SI1Fs68B20ern9mNOvsosFQfH052r9yxdA7
 Bm7MdmVtTbPg8dQr8o1vZqmPbBpvYj6hBxY/xEVKaYW+vx87YzYywu6GQ4HRJTTqkM4S
 KMLeqDMfwZJIGFntKl4ty7pK/MzXBNNvMTaf+Le4DBMBNIX71PlBEnBKAUjitJuyuuaQ
 bGXbbKG08S/+RVypC0v2R9nv/9w0SoccnBuqdD6PimqMQHI+yNyJmDrpmMgoGTOjwhJu
 mrGviXSugVKRgRnd81jT8lFhL31bJq8WxSosmTOSR+lyVMrlLjONpv5eLnmO01g6v682
 o3NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yLOIlj4grM8eviEKTqXRptVV66hvg/CY2BHHsnJ6OZY=;
 b=nk72ubtL7pRj1oDPPA+ER+HZxNC2Jhmc7LPsxLkj8BZ19zUyb+zkZ9g0gTddm6ks3/
 cyVsmuvcbMPsQGfchEXFYyXbjm/SP/tS2LGxNbbv1ZIG1jGymNk4UrMoasIYDriWo6Jr
 UzjdFgMggT1//Z7GeN37gc6UvXHG8mqhO6wUQ8NfSJN8h646NR89WUAgYOP4XV4AXOBR
 CpH26aUkJtunlpGkkJEQfULviXVdNpsLFIwjp5XlOEylB375eLLYdb20k2etUheXeJQQ
 6C55z5qingNhGw1HbblD+bH6OgjrDtfQufvbKn7bLeNoW+z3LM/W7NIhd2Lo6qQneD+d
 2fOQ==
X-Gm-Message-State: APjAAAU5zUX13s/i7FyWuBy4oMqP1JNeaJ8WbXEeGWr4mI2BkZ9/RqJ3
 C8rUPmcTrG5jHq0yo6htjSD/SQ==
X-Received: by 2002:a17:902:820b:: with SMTP id
 x11mr4984546pln.196.1581711381611; 
 Fri, 14 Feb 2020 12:16:21 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 z4sm7854380pfn.42.2020.02.14.12.16.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2020 12:16:20 -0800 (PST)
Subject: Re: [PATCH v2 11/21] target/arm: Move DBGDIDR into ARMISARegisters
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200214175116.9164-1-peter.maydell@linaro.org>
 <20200214175116.9164-12-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <728d0df5-3fa1-f9f4-1fd0-9671a494b3f0@linaro.org>
Date: Fri, 14 Feb 2020 12:16:18 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200214175116.9164-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eric Auger <eric.auger@redhat.com>,
 Aaron Lindsay <aaron@os.amperecomputing.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A9Lj5zGZAA2O

On 2/14/20 9:51 AM, Peter Maydell wrote:
> We're going to want to read the DBGDIDR register from KVM in
> a subsequent commit, which means it needs to be in the
> ARMISARegisters sub-struct. Move it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h       | 2 +-
>  target/arm/internals.h | 6 +++---
>  target/arm/cpu.c       | 8 ++++----
>  target/arm/cpu64.c     | 6 +++---
>  target/arm/helper.c    | 2 +-
>  5 files changed, 12 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

