Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6539525lfg;
        Thu, 4 Mar 2021 12:04:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxnN0zhHE0DyH6FKD16oT+zJ3ZicvVGfkYcHZ9zMT1qB4R9rqJsDq9JV42cH946CT/X4ZWc
X-Received: by 2002:a5d:9bc8:: with SMTP id d8mr4763177ion.115.1614888262347;
        Thu, 04 Mar 2021 12:04:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614888262; cv=none;
        d=google.com; s=arc-20160816;
        b=lEWX1/JsqslRc/xhKlizMSHYqi5T5QNYeqlD7U+52UBx7DiE98TPgyiIhFS2KRUHn0
         cZ3iHjP/rfeXHxJNGiwsxy1hX3RTd2URJsvOSQN5q1UIVPEaEuYQbPdjrdrM+a7a3EJS
         TIxK+G3VCsmOX6j9kuksIVEVlKVjC7AlJDh83TucossDCI8fe8GL+tTmTiA6QE5vFD8S
         ImFLxCwwjdpuwY/vuCAu+Fk+eBnmPZMFv59+yfpZryQ7EZC1xoE4H1rgWX6C7j8u7cq5
         yA8fAJ2evy6p3eb5ZLjAblrRYRXNSpN9/bf+fP88OMAEOh72wQck7ccI4kfIPVy1Wdkt
         nowg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=CFyjadUX52xsaKeCj2l7sa79PHzsXYymmx+G8QE78J8=;
        b=J8nSZ7tqdlFLrD9jJQ9SSObLymoZQcEGRLa+jQldWzLOO+7p5nIUD6rU/2f5kfV5js
         k/f7KryWtrnFSJ3mevuubULZiuXrzVsfeHDXXWCdiog1vCTBGjqqXyDfVMK+IgLjmgci
         /VpP+rmzzT+uYlTBKNkzPk0HLbGnCAIgFG/xg5JRXfXz9pHpJFDDofCPnrJNG8Co/C+c
         kXxnGaV5/Q6lIjlctYYfgIIunb1qkaldSqN4lXFS9fPDI8ipmR264DvThHeN+oWP7H6F
         8qpQEZsZgLFl9LLa6ZYoHVQhvC8bhA6/6Ts6QFUD3Byts2Io+/j/6Gc4v4Fs8x0wCWnA
         YY2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KR9eTL2i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r13si79910ill.105.2021.03.04.12.04.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 12:04:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KR9eTL2i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHuCr-0004uG-LS
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 15:04:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHuCd-0004rg-QZ
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 15:04:08 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:40399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHuCb-0008N7-2l
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 15:04:07 -0500
Received: by mail-pj1-x1031.google.com with SMTP id o6so7862482pjf.5
 for <qemu-arm@nongnu.org>; Thu, 04 Mar 2021 12:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=CFyjadUX52xsaKeCj2l7sa79PHzsXYymmx+G8QE78J8=;
 b=KR9eTL2iXER/tMIrh42oc10/WHtQgAUDoPgfEv6Y4CgQe3g74JjtRGKp97sEF0SgAe
 L36L8ohVc14WXn3L2jna5KJmnSqnkGCKs3QViK+LmAfavpqXKQ9vFQnllGdyRhub8CeF
 1XWhF78cUqgchLGXBwhMVzr69xw9/gVN0GQqKgbGd9la/stOnnPBLrAbGAIrvAirs7lF
 l78J7pC7alcq3yTAb3E1w9B9op9HibMGQm+AuXLRVor0InC2hAYsg9b71t387ZXvzQdN
 kKSbQMbi+p3LI/lsYO/2OnnT/pehFFKsEa8BfHDOjvhpXOn6Twh3Fb+K5A/nqYqXsppa
 Yr9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CFyjadUX52xsaKeCj2l7sa79PHzsXYymmx+G8QE78J8=;
 b=OHY+2cxYACOupSF5T0LNch+nFdSMLlXsYaEXX9Jp8G50UGG3WKVFtYydWvZjovhWWl
 AAcQILXOYB07Yl01Q3D8SuKD0k+fJKN0FcpxkYbOXVzXsZWC5cLQQvlpaZoiGj/+H67t
 0qG94zYUiucijKhAGTqah1fMbelgYlD9eA2kxtare+sexEXi1M2u4kFrgwE4xIoivtiK
 ocQfcxQEjXGnjAjxQc90qSaHr8nM+mjFBgMkeRbwuXh3EXimtNRfrSxFSeODjkXUZPDl
 Mu3xbocYfgqVXOTughYBw0n8FsYUbDqgACC1MYVOmNqp2iWvp4NxrtDRYGwRfAvSiwKQ
 /ZGg==
X-Gm-Message-State: AOAM533nQ8sncK2FZKypRZe8iSP3nJfPeHL3mV2vTMua99y5G/vhPBT2
 0FYK+8UsB+2lUSOnszIdzSTDOg==
X-Received: by 2002:a17:90a:e644:: with SMTP id
 ep4mr6134799pjb.218.1614888243660; 
 Thu, 04 Mar 2021 12:04:03 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id z8sm105575pjd.0.2021.03.04.12.04.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 12:04:03 -0800 (PST)
Subject: Re: [PATCH 21/44] hw/arm/armsse: Use an array for apb_ppc fields in
 the state structure
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-22-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <40d696b4-3c72-1db5-ba12-6be803fa8ffd@linaro.org>
Date: Thu, 4 Mar 2021 12:04:01 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-22-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: SRPGLr5xW8M4

On 2/19/21 6:45 AM, Peter Maydell wrote:
> Convert the apb_ppc0 and apb_ppc1 fields in the ARMSSE state struct
> to use an array instead of two separate fields.  We already had one
> place in the code that wanted to be able to refer to the PPC by
> index, and we're about to add more code like that.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
