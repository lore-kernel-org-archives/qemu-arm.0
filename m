Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp617276ejc;
        Thu, 19 Jan 2023 13:00:17 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsClTW9KnXCc3bcENK4yR4R6TchuYQKS0sKlZw864lCTvyyE1vzPKfNZ1IXEq856GFTuH5O
X-Received: by 2002:ac8:7107:0:b0:3ab:d932:6c4e with SMTP id z7-20020ac87107000000b003abd9326c4emr13542462qto.18.1674162017737;
        Thu, 19 Jan 2023 13:00:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674162017; cv=none;
        d=google.com; s=arc-20160816;
        b=sjRBlPnrIDsReJDus85tA5+q65AImecqRvyNgmGvb9RTHZeSfGEqZyAwFAv3o/CSsd
         iqRCOduXWs6RKn/N3LwrDlwmZDlHJrZNxLtek7RcjGz1ORUlBplN7Ap8GvAGyRJGnmEy
         V17rA/LKwCAiuINaH3Eeu/AWsFn6aRPt54Q0IgZsMcycsZxjwydyQ+WgQRuNIzOqJ9Ai
         R6nn5jdZqnl4niq+ndXY+tX5tkiIRw5IWEXlnwc/NFdsYgYaHQfLmBF1b7VTjx/eaNeJ
         4OPqAkuMMzz3qiXR2VjNZO/sIv2buXx1XgR7TjCnIcQrC/1EqLIPxv4q2QVP12/F5P4W
         QrBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=69fDUbv8400cPV+DD4TZdQobLi/nCiTV7sgNP4F/wlg=;
        b=qsXNro/I80AnaYXp5Gy6w3CJvI/PEy1B4npYgq1wIOvaP5EIbJIowqFGqITb4P8BGC
         IcoXe/oQWdEDB9QwuYTI8izG4JYr7tT8ksOkvKDcQmZ7NvG/M5w6z4PjqyW28PGwMrKC
         QzoO3XqEYdDcDKNefWv2D8sYZ0YHXDDjcHh5NYc2jWeHWTyfyHt4QXDd7H9VtzQMlng5
         Err+wTJYsXliEsJ9tiB9TFyXI+YPd9EFM7rWTfcy1oN/OZLpU3vijwZXl0YCyfUB+PKa
         Iyz5CasNUf16DmUbXIAPoj7xqr40LAws93uOVL/wWr2Gln7q0PZFRUzx5CpeGpaBhc+O
         OrKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uKRj0wgx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ez7-20020a05622a4c8700b003b693ee1a1bsi1272183qtb.96.2023.01.19.13.00.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 13:00:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uKRj0wgx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIc10-00076m-Jj; Thu, 19 Jan 2023 16:00:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIc0y-00076M-IE
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 16:00:04 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIc0n-0003AL-Vy
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 16:00:04 -0500
Received: by mail-pl1-x62c.google.com with SMTP id p24so3443946plw.11
 for <qemu-arm@nongnu.org>; Thu, 19 Jan 2023 12:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=69fDUbv8400cPV+DD4TZdQobLi/nCiTV7sgNP4F/wlg=;
 b=uKRj0wgxDY8NoqCK8lz2KCP9K2AZxmGB58JXnh2SsX8UD0m+6nGkwWNqahLD5WPVOq
 gKQsIFv9bVRy7W6KrYBOEMTZmYoOsHnihlYipybw4nCdTFRwe0TjIkuhCI3sQA1f9yYu
 d44d2rBaUmojJ0MRgpUd87WZM7Ic9J+VME0r/ext6BspOtXNYWFBUO7Z6nfilRZz6MpC
 dGoBQrhIpNc9k+fa8Hr0w29g2/DJXJ8vd+VLfQj2i9K14YVVSRp8ZMLZNPZOwwwuW7Yd
 kcKOxJzk6PXCiIPmQPQJKCL97j1xD812HUaGostqxsISM9ZU49avQ4q3E1r7JMBLnlez
 1Xzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=69fDUbv8400cPV+DD4TZdQobLi/nCiTV7sgNP4F/wlg=;
 b=BUqawj/Xk4iGy9fynsBWE3Zf40XIZa3x3Z7wKwLiuDdfMNmVumBwnVL0lNS/tvg7KE
 ppmKmPeIJUqF4lhT5Ftk+YIycmordxebto01UqYsioGl5ht7noeyymaMER5lgmTyDaMH
 +nsERLlwIib95buYPREVeKvi8rjXkZ9WGWf27exJYAVox3+UxcMrkmEUEAe5UgDncGD6
 E3JiEebCmBbi2fFVIuF9L+CGq700059Xrknqz+dH2mvgViwkZ/Cl3LeF0iIGIa2Em+Jr
 yqio1foVLhXso2lyVn5CrfK8Yujywx8u3yZbl+GSIbRT0kNCU7cRirvio/G86tWTXJmO
 Vexg==
X-Gm-Message-State: AFqh2kotvZteipjJ4wrFOGHwzEyzW1wAckrGvHOiaMVQ2PtsH8vTJclq
 JkSjHWKo/Y8To2PCAuRnY4zfsw==
X-Received: by 2002:a17:903:328b:b0:194:cd07:a8bb with SMTP id
 jh11-20020a170903328b00b00194cd07a8bbmr3390890plb.30.1674161992136; 
 Thu, 19 Jan 2023 12:59:52 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 y7-20020a1709027c8700b00194afb5a3ebsm5144134pll.21.2023.01.19.12.59.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 12:59:51 -0800 (PST)
Message-ID: <66733227-0058-2150-6995-e34223883987@linaro.org>
Date: Thu, 19 Jan 2023 10:59:47 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 02/11] tests/qtest/boot-serial-test: Simplify
 test_machine() a bit
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Thomas Huth <thuth@redhat.com>
References: <20230119145838.41835-1-philmd@linaro.org>
 <20230119145838.41835-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230119145838.41835-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: QkMp3FelvxOf

On 1/19/23 04:58, Philippe Mathieu-Daudé wrote:
> Slighly modify test_machine() to simplify next commit review.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   tests/qtest/boot-serial-test.c | 21 +++++++--------------
>   1 file changed, 7 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
