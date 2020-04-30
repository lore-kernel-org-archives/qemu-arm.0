Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2286743lfm;
        Thu, 30 Apr 2020 12:39:20 -0700 (PDT)
X-Google-Smtp-Source: APiQypLFcOjBnXbphZF3MXSCw0l9l5uaMcgBJ7ggyAAEU8dGvzHigrA4diCDS65ujxgad/wvmTYO
X-Received: by 2002:a37:80c4:: with SMTP id b187mr97227qkd.302.1588275558397;
        Thu, 30 Apr 2020 12:39:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588275558; cv=none;
        d=google.com; s=arc-20160816;
        b=WhK+iY/xdScEhprivhUHCp3WsLEt73150b9goPmABphOHkMvlezaArTRSCWKr4ULyy
         zP8RTgxJz5PIsK1ZawMR3SdGd0ZMgkWf/IDbeH2/sE+y86kBkt8XLdyYDepdxrs9e05a
         GfBhJad1+rebpytmKG+yrnbbbGTZp5/3uSlLcfHCmT4OajVA/02+vtYClRE1I+SgKKn9
         AuSCxSPOPkFkDz2Y/iVs/8/9Er44eX6h3pjqUf63TufBJghZap6pG7ZhKMyGMBseq74J
         oBSEBhm25AZtU9ntM/hhLnDZweypQVi6mjEUHVUI1oQ/2xutGqA8ch9oqsqQgzwOTfLk
         80wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=9E3dQ6N/5EivT/j+fF8tuEmj3/H5q5PFI9OUH2nP9Js=;
        b=0PXT4tl2KyZcRgLdEWwqD7HPcyGWrL+yONycuGeVqEcaqnlEoKzDkl/jyLV8ImofYa
         MfwlwdlGrtWMBrK0PtWZK2dQQ8IkpBTXIlA+OlX4YvrL/7Ux98GhEDjNKlh7fq3qpkIh
         47kxwVkijhmgp+wHcV5gMRK7vAU9v0wNZQRWyk/MEiE2i55v9K5B4a5xGzvIN4NqvCoT
         IUXH/uaPuJcJllzoDibvDnyuMlS8deI2/JBcHU0IlhYz2m0UpI0OegM6DikAayIlj75n
         Tt0X1w3xM1iyZsMgNgh2LXSNBsVKY/CUAz4Zi+k50XWjRs3JS6VTEtgCpFEg1jGr43Rh
         +f6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="CmV9jJf/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id b70si302579qkc.338.2020.04.30.12.39.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 12:39:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="CmV9jJf/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUF1h-0002dq-IE
	for alex.bennee@linaro.org; Thu, 30 Apr 2020 15:39:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48156)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUF03-0001uH-Lt
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 15:39:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUEzD-0004m3-Hd
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 15:37:35 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:41652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jUEzD-0004dC-2O
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 15:36:43 -0400
Received: by mail-pl1-x641.google.com with SMTP id d24so2669255pll.8
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2020 12:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=9E3dQ6N/5EivT/j+fF8tuEmj3/H5q5PFI9OUH2nP9Js=;
 b=CmV9jJf/TmJvmfiaLU8EMBxpZbJAC3UFtEhV/KlBbmJFFqrMa1AmqLHTfG5h/iVBxC
 Kcqdq2me6jE9Utnq0+rSczTE+4IvXcW6wz9oWZxVIK3KMuxEXH+SLwBbXWz//xkKtFEz
 8rYIOV5SLct8XiBp7F8fycCBtikB4gTSwGiFwFx2LoooZJafW+5qgOLcXKJ1Qie7V+V9
 NQ+7He44goxE/cFTlXu2nSHXSAfXEM/aETNjDR+VbYSMd0xEuuyjr6ULW97MCin39COa
 Bna61InRLcYHQ5JlVblQ/tloLLgEIYCyxpWCq52vRGbLne8lGDBv6/Z3jI8qVO6K5ySa
 nh9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9E3dQ6N/5EivT/j+fF8tuEmj3/H5q5PFI9OUH2nP9Js=;
 b=i++EDeFIqz5xidYndVw1AkPG7fS7qCr36QbFlFyHBpnWudjq4Du2seDgJMPPJVadIG
 rhrv79Qlk70pWphXCHRei/EzNKwGb2vb83NaToruSl9C302kbJZQZ/JSDMEchiGiP9Gp
 IOFZgbQ2/pudmSCuoyH3BfviUcahhak+ZWoK3EAn6S19dTrQnCFozlDv/K9CuNEEIuDD
 kbfBB9O3P7VtQYmfFrBWSqSWnF0W5y+GXk5chOCajDBb9JCt3Ij3TOVLbS9bVXXL6IOl
 WkIOGmsYe1mTlaFPQNmtXkbWeZISoJJNJN4D6aGOKOD39CeLGD1jyQyvkWGxQnHSTK2P
 NJZQ==
X-Gm-Message-State: AGi0PuYXEK6iavZk52LWgRgbCNw0Xy/z0of4MgOMs+8nzaTs60iKQew4
 hFD67mDFWEjv3DgWTCjCwr7T/g==
X-Received: by 2002:a17:90a:2365:: with SMTP id
 f92mr406161pje.117.1588275401307; 
 Thu, 30 Apr 2020 12:36:41 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id gl12sm479696pjb.27.2020.04.30.12.36.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Apr 2020 12:36:40 -0700 (PDT)
Subject: Re: [PATCH 14/36] target/arm: Convert Neon 3-reg-same VADD/VSUB to
 decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200430181003.21682-1-peter.maydell@linaro.org>
 <20200430181003.21682-15-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f8c2ad33-d046-45c9-7200-2ab4409f90d9@linaro.org>
Date: Thu, 30 Apr 2020 12:36:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430181003.21682-15-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::641
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
X-TUID: yEQ6iBRQ4RLf

On 4/30/20 11:09 AM, Peter Maydell wrote:
> Convert the Neon 3-reg-same VADD and VSUB insns to decodetree.
> 
> Note that we don't need the neon_3r_sizes[op] check here because all
> size values are OK for VADD and VSUB; we'll add this when we convert
> the first insn that has size restrictions.
> 
> For this we need one of the GVecGen*Fn typedefs currently in
> translate-a64.h; move them all to translate.h as a block so they
> are visible to the 32-bit decoder.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-a64.h      |  9 --------
>  target/arm/translate.h          |  9 ++++++++
>  target/arm/translate-neon.inc.c | 38 +++++++++++++++++++++++++++++++++
>  target/arm/translate.c          | 14 ++++--------
>  target/arm/neon-dp.decode       | 17 +++++++++++++++
>  5 files changed, 68 insertions(+), 19 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
