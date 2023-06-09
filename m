Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp564852ejb;
        Fri, 9 Jun 2023 11:19:25 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6+ig0j2nQmCQoKRlFrT0hyaQ51NLBUmb2Kge44ObEevSz1r68iupix9QRbvaK/MC/OKZME
X-Received: by 2002:a05:6808:d49:b0:39a:bb42:aa63 with SMTP id w9-20020a0568080d4900b0039abb42aa63mr2706722oik.17.1686334765253;
        Fri, 09 Jun 2023 11:19:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686334765; cv=none;
        d=google.com; s=arc-20160816;
        b=AI2BCzdDUJ5s0CoJIlLCQ6T1iN89CagsnrX1hF2FqIhTBlpPIw5PwA5xHs7YDjvLVV
         jRNW52bcEchuML5jTf8Hx8ZEbLW3yqXmJXJmyhRPk60RJG8fGgEXlHKUqJ/7nNRa1taN
         QUVQWp4gkizIm9OJkeuE9Kk9unXj51fkF+ocx+CXiDdK4vxbWi5qBcShZIFVuoKOrKw9
         4GrJw8mgrWutOcTHfZnMRoQ61hhmLS72MSbrRg0wBY/40RHJlNrGkHhERII4VpgEbTeS
         55jrxPhdH6eTDFFKJCrRBFgd+vBYHvikI0CnJhOv1Iwxr35gx3jlBvg+1T+HgbaPhJvE
         yCTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Vj9qLPTAFB5HpMrexujty68fWg2vGI4QLTTfk+cGxg8=;
        b=UkZ3aV7QRBSD9svAaKNLdgNNwrFyHDUeOzQLmNzZkrhTQhXqy2u34Uv7bDrhuBKP6n
         IoOqAUGzabFo377/cDjugxuoPr3CRW3eBQJvlzMd7tKhhyD9upH2H4LWqkMhBjDeQI/U
         JD1HD79NGhGI66RpvHfRRFU0lTV2BVvo3eLzHACarBYcDRf8eVfJsUzt6wISq1B7rwZi
         JO7fXszR8+njZcFm9fGLh/uxwucj+KcyDuGMSJEQKIjtnESyERRy5O5AqLBFav2qRU4a
         +QC55vOj+26UPwjJii0txpRnMXJ0CsNCDEwg+aEHcGqZtG5TUT2PPTFpkBgqcWrc3q1i
         5S3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iRziXdzW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kc25-20020a056214411900b005a4a698703csi2698340qvb.58.2023.06.09.11.19.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Jun 2023 11:19:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iRziXdzW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q7ghf-0002jF-58; Fri, 09 Jun 2023 14:19:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7ghd-0002im-8Z
 for qemu-devel@nongnu.org; Fri, 09 Jun 2023 14:19:13 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7ghb-0002AC-RA
 for qemu-devel@nongnu.org; Fri, 09 Jun 2023 14:19:13 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1b2439e9004so8655695ad.3
 for <qemu-devel@nongnu.org>; Fri, 09 Jun 2023 11:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686334750; x=1688926750;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Vj9qLPTAFB5HpMrexujty68fWg2vGI4QLTTfk+cGxg8=;
 b=iRziXdzW75n/iV0y/+4ZytZf8+oNfM5ZIcYGEjWJOs9iWoc/cEtwkdf3+ugw+lzNG+
 HipeH/vGIKEO66eyzrfsW84hnDdBKTHcvGjJ9+rXjiAu55PY2vVVG4TFAhucrXsmXRsZ
 /vbq9VXy+5UeECynIcRSsT5lqrMUzhRrqFCNE/Fm2XjRrorQn5IGJa7nN6v/OzTKqD90
 8qQVxvqhSGbmNC/90+mgj4CwQiPQKplveSCBbuAb99pZCIpktiWFAKqItB1tLsC1mALT
 CY/DfSKBJEKj4J9HT+zGWKzlTWmxoBaj4kfLri9y6RvHkCNR9qHHyQ4r72FIcqzaKoSQ
 CA9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686334750; x=1688926750;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vj9qLPTAFB5HpMrexujty68fWg2vGI4QLTTfk+cGxg8=;
 b=Dx3mFzE5Tk5nTFNJZ0ye26PIOeGmNxqldhsPxSnAkUEhno49NqJpKuTRFmMuGS5NUi
 HxNmwgZrjrLn2MLxEZu6afOR3gEThUtaQjh4cXZRg4kRdp8xPDH0GQskKjh7WRBO3xxx
 eZ5YACVvsLz0Mb61Mc+POrF14SEACPcIet3Ah+65E0T087w4QzFJoiEPU+pBjwSYFEXA
 ZyUaaX8G7xTre47HhCSRQ+n6nLd3XQNshqCT0QX+4cpJ/KCa48FUT1F2KbgBy/vla2fe
 cnKj6zYtrksxObUcUy72UCDONCvZojD+uMRbw6jpamVOzgpGWsKmHSo8C0IJ5EfEeiVi
 Gnnw==
X-Gm-Message-State: AC+VfDys1CuDYCx12ZmpvmeEXWiYnAHDnSGL5JjSqHox831XP76FgRXD
 xdbY9yWWEmro/WW+2HPCVF+T2Q==
X-Received: by 2002:a17:902:e5d0:b0:1a6:b23c:3bf2 with SMTP id
 u16-20020a170902e5d000b001a6b23c3bf2mr2357187plf.10.1686334749807; 
 Fri, 09 Jun 2023 11:19:09 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:20be:c4cb:f609:8cca?
 ([2602:ae:1598:4c01:20be:c4cb:f609:8cca])
 by smtp.gmail.com with ESMTPSA id
 jc22-20020a17090325d600b001a6f7744a27sm3586141plb.87.2023.06.09.11.19.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jun 2023 11:19:09 -0700 (PDT)
Message-ID: <a54137e1-d34f-32b0-78ed-c05b0d33e428@linaro.org>
Date: Fri, 9 Jun 2023 11:19:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 07/22] target/arm/tcg: Expose some iwmmxt methods in
 'translate.h'
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20230609104717.95555-1-philmd@linaro.org>
 <20230609104717.95555-8-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230609104717.95555-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: zCUHO7Z6C0Ew

On 6/9/23 03:47, Philippe Mathieu-Daudé wrote:
> Expose a few methods and variables before extracting iwmmxt
> code from translate.c.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/arm/tcg/translate.h | 6 ++++++
>   target/arm/tcg/translate.c | 8 ++++----
>   2 files changed, 10 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
